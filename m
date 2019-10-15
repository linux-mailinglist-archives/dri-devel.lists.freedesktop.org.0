Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBDCD71DA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 11:10:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A7B6E62C;
	Tue, 15 Oct 2019 09:10:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2896E62C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 09:10:52 +0000 (UTC)
Received: from AM6PR08CA0008.eurprd08.prod.outlook.com (2603:10a6:20b:b2::20)
 by AM4PR0802MB2244.eurprd08.prod.outlook.com (2603:10a6:200:62::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Tue, 15 Oct
 2019 09:10:48 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by AM6PR08CA0008.outlook.office365.com
 (2603:10a6:20b:b2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Tue, 15 Oct 2019 09:10:48 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Tue, 15 Oct 2019 09:10:48 +0000
Received: ("Tessian outbound 0cf06bf5c60e:v33");
 Tue, 15 Oct 2019 09:10:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6bd4f8444a8ab4e0
X-CR-MTA-TID: 64aa7808
Received: from e2a2fc337256.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.57]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 726A4DD6-01E7-45F0-8118-76D35641BF6E.1; 
 Tue, 15 Oct 2019 09:10:39 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2057.outbound.protection.outlook.com [104.47.4.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2a2fc337256.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Oct 2019 09:10:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEOnjw/RxKzoV4XVyD30YCJPkNhigXNoX7bTROTPey4W6T5XlhQYsTE04IP5qP9Qk8M6SG5P0IY515hTkoksF0ujwQX0ysqgn0/2mS54wqDvCPTyTMKoRWPZehBPYW3XZsWugMVbp6HcJUlFJ45kOiQqfupVvQaVzBvkwF9Msne8hddcu8WwEFYDvPjivg448QC7fVF/4MNtmfyYlAF2JlM56EwgkDWZlicQfLfO270OsvKHq7yszWc0jP+ptve0aOD+TeMVwe5HAH7pcx9xbqcENslT3iqLn1uSt6VVPi16ijm3Sh/9fF8OVa64ivj/BqbuL6A7m6xIfIon5v9EWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73J9/6YbducaZHY0q3DvPdTyfsume7BIftT9rgYXkyI=;
 b=WrGHe/0MA8ehaPrJvOwqKJEfJFFys5aSOLdD1Tfz1rfMpFPzw/RTiYjl8EGbQ05rI40BJZF4anpzgHOmtAya4y+urwa/RcJVsIg2+Hc8/Y5sXmLEtCbxSfydXakXO84uC1FT7YpMBk7F787gA/wRW8sH7pjbiJMHsSJgYk8hz8cmQE8yi2pEuKCW/k2UO+kc7wStE/UuByXVD1Pn/AUhYqB99obqJi5PUrxTeY1lk9R/oAbMIwvfTdnpQyCTqYuaxTH5al/ygbVaJfs0NP5lHYI2wW1w7x0cCRkHMiZDrR/gw/AR6Umt2guGERhbf5x9YzsfLOESilF/2Yz5Ov9D1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5182.eurprd08.prod.outlook.com (20.179.31.89) by
 VE1PR08MB4734.eurprd08.prod.outlook.com (10.255.112.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Tue, 15 Oct 2019 09:10:36 +0000
Received: from VE1PR08MB5182.eurprd08.prod.outlook.com
 ([fe80::a54d:cc87:644c:e3ba]) by VE1PR08MB5182.eurprd08.prod.outlook.com
 ([fe80::a54d:cc87:644c:e3ba%6]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 09:10:36 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>, Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH] drm/komeda: Adds output-color format support
Thread-Topic: [PATCH] drm/komeda: Adds output-color format support
Thread-Index: AQHVgzho76HHJMWyq0e6Tzi6Iw+N9w==
Date: Tue, 15 Oct 2019 09:10:36 +0000
Message-ID: <20191015091019.26021-1-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0P153CA0039.APCP153.PROD.OUTLOOK.COM
 (2603:1096:203:17::27) To VE1PR08MB5182.eurprd08.prod.outlook.com
 (2603:10a6:803:10c::25)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3b23b4ce-1226-4480-86cd-08d7514f9183
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4734:|VE1PR08MB4734:|AM4PR0802MB2244:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2244F570267EE184F38C6C2F9F930@AM4PR0802MB2244.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:451;OLM:451;
x-forefront-prvs: 01917B1794
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(189003)(199004)(4326008)(14444005)(55236004)(71200400001)(14454004)(102836004)(36756003)(25786009)(478600001)(110136005)(66446008)(1076003)(64756008)(52116002)(50226002)(256004)(305945005)(66476007)(66946007)(66556008)(99286004)(54906003)(7736002)(386003)(6636002)(6506007)(86362001)(66066001)(2201001)(2906002)(26005)(6512007)(6116002)(2501003)(6436002)(186003)(476003)(2616005)(486006)(71190400001)(6486002)(5660300002)(8936002)(81166006)(81156014)(8676002)(316002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4734;
 H:VE1PR08MB5182.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rjKQyd8ErP++ptaWHSXmmdD6oKPy98YJZod9WbMiMlUegtknfS1bahnRu/43oQFqe2ScSfBtrrw2XP/BtB9PG9M2ZH3LuWBjI7m2c+VbW1NxWEVz8+PBhhNWBCySj/5txjr34FXMbMLoE+uVDxy8XNri8D5Q5UTuFUHOsjmOpxVS4PYMmN3bZh0ytji465DkZITe4xJ64Ll7R/CwH0pJPd3lDotItbZSoX70DUydpuBQJz2Sh8leaKJPEVcnaycMzT9YMkMYRJ9MtaJaXBaqDLv1pCumuxExfTbGz+yZRS9IKu60yTzqIRuBnurq5MaK+qbvcxNCWduUW7XgByKLxvljmimlSEr9U/ekfK/Hu3FiretAiO55GqkCkSN0fuFdEJO3KRWRUMsrRfQIbAaX6a9+hru7/Oz0+sA1yqulOpg=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4734
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(346002)(39860400002)(376002)(1110001)(339900001)(189003)(199004)(356004)(1076003)(5660300002)(6636002)(7736002)(76130400001)(4326008)(478600001)(26826003)(25786009)(36906005)(6506007)(81166006)(186003)(6116002)(26005)(3846002)(70206006)(2906002)(70586007)(102836004)(8676002)(81156014)(99286004)(8936002)(8746002)(50226002)(386003)(14454004)(2201001)(86362001)(50466002)(316002)(126002)(110136005)(476003)(305945005)(47776003)(6512007)(336012)(14444005)(66066001)(486006)(2616005)(22756006)(23756003)(6486002)(2501003)(54906003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR0802MB2244;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 85b9f9f3-bb41-4177-75f7-08d7514f8a6b
NoDisclaimer: True
X-Forefront-PRVS: 01917B1794
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RxP4Mg1iLFswpuPzZCBm5k9VT0BWFjBBUzPca3bGqscC6CBaa3NmrbVgIHEN0whCglCmm754KWxKiu6zHfUwNEhBCiUw1QqVA37eezZeO8HQBrl9iYsoM9eQWmqcaGnEnzUrfqwBRumERtRyoowyrbNOU97H1zIzvswgsGaLclvXjq5aLk5jajvzL1iZQPcVCDhFzHTymhHLUchtBEUWyU7iZ0yM3qP0ZoPYUhsznBL+nyyKmNCsXaEHCgYPKA3zL1ywGgyAYYDST5nLOyQF4n8alfLM3suRiBDT6iyWuCdv8VnjxIRQs0U5nFLiqMCIkOJ7XcWunI71/CsUqxcYZi4ZEFDX58niahpu6SimSu1t4Q3I9jsvTjpeVZJWpcBFIQ5QlEOttDRSZ0SMgfjidI7dlB9kQ/7s3Z1MGSjbvOQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2019 09:10:48.0725 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b23b4ce-1226-4480-86cd-08d7514f9183
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2244
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73J9/6YbducaZHY0q3DvPdTyfsume7BIftT9rgYXkyI=;
 b=RxgJx8wK2xjKBDLzT3BgqoUfFzWGlrbhqCj6k8IIBQvoyqUx6xqEfwQIAyAgDBg0Cdv+1wEQLaeik4fVKLMwr8X0EdY5+KdwTLGa9FfkvYJAIWp8OsiMqZdl1y3mHBWu42Gs5cen9CWxk9irl4SKjACmcbsCnqMnZTtx8KhItPs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=73J9/6YbducaZHY0q3DvPdTyfsume7BIftT9rgYXkyI=;
 b=RxgJx8wK2xjKBDLzT3BgqoUfFzWGlrbhqCj6k8IIBQvoyqUx6xqEfwQIAyAgDBg0Cdv+1wEQLaeik4fVKLMwr8X0EdY5+KdwTLGa9FfkvYJAIWp8OsiMqZdl1y3mHBWu42Gs5cen9CWxk9irl4SKjACmcbsCnqMnZTtx8KhItPs=
X-Mailman-Original-Authentication-Results: spf=fail (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org; dmarc=none
 action=none header.from=arm.com;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Ayan Halder <Ayan.Halder@arm.com>, "Jonathan Chai
 \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0cyBvdXRwdXQgY29sb3IgZm9ybWF0IGFjY29yZGluZyB0byB0aGUgY29ubmVjdG9yIGZvcm1h
dHMgYW5kCmRpc3BsYXkgc3VwcG9ydGVkIGZvcm1hdHMuIERlZmF1bHQgdmFsdWUgaXMgUkdCNDQ0
IGFuZCBvbmx5IGZvcmNlCllVViBmb3JtYXQgd2hpY2ggbXVzdCBiZSBZVVYuCgpTaWduZWQtb2Zm
LWJ5OiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPgot
LS0KIC4uLi9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgIHwgMTQg
KysrKysrKysrKysrKy0KIC4uLi9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0
Yy5jICAgIHwgIDkgKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9rbXMuaCB8ICAyICstCiAuLi4vZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFf
cGlwZWxpbmUuaCAgICB8ICAyICstCiAuLi4vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBl
bGluZV9zdGF0ZS5jICB8IDE3ICsrKysrKysrKysrKysrLS0tCiAuLi4vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYyAgICB8ICAxICsKIDYgZmlsZXMgY2hhbmdlZCwgMzgg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMgYi9kcml2ZXJzL2dwdS9k
cm0vYXJtL2Rpc3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKaW5kZXggMjdjZGIwMzU3
M2MxLi43YjM3NGEzYjkxMWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxh
eS9rb21lZGEvZDcxL2Q3MV9jb21wb25lbnQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2Q3MS9kNzFfY29tcG9uZW50LmMKQEAgLTk0NCw3ICs5NDQsNyBAQCBzdGF0
aWMgdm9pZCBkNzFfaW1wcm9jX3VwZGF0ZShzdHJ1Y3Qga29tZWRhX2NvbXBvbmVudCAqYywKIHsK
IAlzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSAqc3QgPSB0b19pbXByb2Nfc3Qoc3RhdGUpOwog
CXUzMiBfX2lvbWVtICpyZWcgPSBjLT5yZWc7Ci0JdTMyIGluZGV4OworCXUzMiBpbmRleCwgbWFz
ayA9IDAsIGN0cmwgPSAwOwogCiAJZm9yX2VhY2hfY2hhbmdlZF9pbnB1dChzdGF0ZSwgaW5kZXgp
CiAJCW1hbGlkcF93cml0ZTMyKHJlZywgQkxLX0lOUFVUX0lEMCArIGluZGV4ICogNCwKQEAgLTk1
Miw2ICs5NTIsMTggQEAgc3RhdGljIHZvaWQgZDcxX2ltcHJvY191cGRhdGUoc3RydWN0IGtvbWVk
YV9jb21wb25lbnQgKmMsCiAKIAltYWxpZHBfd3JpdGUzMihyZWcsIEJMS19TSVpFLCBIVl9TSVpF
KHN0LT5oc2l6ZSwgc3QtPnZzaXplKSk7CiAJbWFsaWRwX3dyaXRlMzIocmVnLCBJUFNfREVQVEgs
IHN0LT5jb2xvcl9kZXB0aCk7CisKKwltYXNrIHw9IElQU19DVFJMX1lVViB8IElQU19DVFJMX0NI
RDQyMiB8IElQU19DVFJMX0NIRDQyMDsKKworCS8qIGNvbmZpZyBjb2xvciBmb3JtYXQgKi8KKwlp
ZiAoc3QtPmNvbG9yX2Zvcm1hdCA9PSBEUk1fQ09MT1JfRk9STUFUX1lDUkNCNDIwKQorCQljdHJs
IHw9IElQU19DVFJMX1lVViB8IElQU19DVFJMX0NIRDQyMiB8IElQU19DVFJMX0NIRDQyMDsKKwll
bHNlIGlmIChzdC0+Y29sb3JfZm9ybWF0ID09IERSTV9DT0xPUl9GT1JNQVRfWUNSQ0I0MjIpCisJ
CWN0cmwgfD0gSVBTX0NUUkxfWVVWIHwgSVBTX0NUUkxfQ0hENDIyOworCWVsc2UgaWYgKHN0LT5j
b2xvcl9mb3JtYXQgPT0gRFJNX0NPTE9SX0ZPUk1BVF9ZQ1JDQjQ0NCkKKwkJY3RybCB8PSBJUFNf
Q1RSTF9ZVVY7CisKKwltYWxpZHBfd3JpdGUzMl9tYXNrKHJlZywgQkxLX0NPTlRST0wsIG1hc2ss
IGN0cmwpOwogfQogCiBzdGF0aWMgdm9pZCBkNzFfaW1wcm9jX2R1bXAoc3RydWN0IGtvbWVkYV9j
b21wb25lbnQgKmMsIHN0cnVjdCBzZXFfZmlsZSAqc2YpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMKaW5kZXggZmUyOTVjNGZjYTcxLi5jOWI4
ZDJkNWUxOTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEv
a29tZWRhX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9jcnRjLmMKQEAgLTE4LDEwICsxOCwxMSBAQAogI2luY2x1ZGUgImtvbWVkYV9rbXMuaCIK
IAogdm9pZCBrb21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKHN0cnVjdCBkcm1fY3J0Y19zdGF0
ZSAqY3J0Y19zdCwKLQkJCQkgIHUzMiAqY29sb3JfZGVwdGhzKQorCQkJCSAgdTMyICpjb2xvcl9k
ZXB0aHMsIHUzMiAqY29sb3JfZm9ybWF0cykKIHsKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bjsKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdDsKKwl1MzIgY29ubl9jb2xv
cl9mb3JtYXRzID0gfjB1OwogCWludCBpLCBtaW5fYnBjID0gMzEsIGNvbm5fYnBjID0gMDsKIAog
CWZvcl9lYWNoX25ld19jb25uZWN0b3JfaW5fc3RhdGUoY3J0Y19zdC0+c3RhdGUsIGNvbm4sIGNv
bm5fc3QsIGkpIHsKQEAgLTI5LDEyICszMCwxOCBAQCB2b2lkIGtvbWVkYV9jcnRjX2dldF9jb2xv
cl9jb25maWcoc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRjX3N0LAogCQkJY29udGludWU7CiAK
IAkJY29ubl9icGMgPSBjb25uLT5kaXNwbGF5X2luZm8uYnBjID8gY29ubi0+ZGlzcGxheV9pbmZv
LmJwYyA6IDg7CisJCWNvbm5fY29sb3JfZm9ybWF0cyAmPSBjb25uLT5kaXNwbGF5X2luZm8uY29s
b3JfZm9ybWF0czsKIAogCQlpZiAoY29ubl9icGMgPCBtaW5fYnBjKQogCQkJbWluX2JwYyA9IGNv
bm5fYnBjOwogCX0KIAorCS8qIGNvbm5lY3RvciBkb2Vzbid0IGNvbmZpZyBhbnkgY29sb3JfZm9y
bWF0LCB1c2UgUkdCNDQ0IGFzIGRlZmF1bHQgKi8KKwlpZiAoIWNvbm5fY29sb3JfZm9ybWF0cykK
KwkJY29ubl9jb2xvcl9mb3JtYXRzID0gRFJNX0NPTE9SX0ZPUk1BVF9SR0I0NDQ7CisKIAkqY29s
b3JfZGVwdGhzID0gR0VOTUFTSyhtaW5fYnBjLCAwKTsKKwkqY29sb3JfZm9ybWF0cyA9IGNvbm5f
Y29sb3JfZm9ybWF0czsKIH0KIAogc3RhdGljIHZvaWQga29tZWRhX2NydGNfdXBkYXRlX2Nsb2Nr
X3JhdGlvKHN0cnVjdCBrb21lZGFfY3J0Y19zdGF0ZSAqa2NydGNfc3QpCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5oCmluZGV4IGE0MjUwMzQ1MWI1
ZC4uNDU2ZjNjNDM1NzE5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV9rbXMuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29t
ZWRhL2tvbWVkYV9rbXMuaApAQCAtMTY3LDcgKzE2Nyw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBo
YXNfZmxpcF9oKHUzMiByb3QpCiB9CiAKIHZvaWQga29tZWRhX2NydGNfZ2V0X2NvbG9yX2NvbmZp
ZyhzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3QsCi0JCQkJICB1MzIgKmNvbG9yX2RlcHRo
cyk7CisJCQkJICB1MzIgKmNvbG9yX2RlcHRocywgdTMyICpjb2xvcl9mb3JtYXRzKTsKIHVuc2ln
bmVkIGxvbmcga29tZWRhX2NydGNfZ2V0X2FjbGsoc3RydWN0IGtvbWVkYV9jcnRjX3N0YXRlICpr
Y3J0Y19zdCk7CiAKIGludCBrb21lZGFfa21zX3NldHVwX2NydGNzKHN0cnVjdCBrb21lZGFfa21z
X2RldiAqa21zLCBzdHJ1Y3Qga29tZWRhX2RldiAqbWRldik7CmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAppbmRleCA3NjUzZjEz
NGE4ZWIuLmMwZjUzYjE5YjYyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNw
bGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oCkBAIC0zMjMsNyArMzIzLDcgQEAgc3RydWN0
IGtvbWVkYV9pbXByb2MgewogCiBzdHJ1Y3Qga29tZWRhX2ltcHJvY19zdGF0ZSB7CiAJc3RydWN0
IGtvbWVkYV9jb21wb25lbnRfc3RhdGUgYmFzZTsKLQl1OCBjb2xvcl9kZXB0aDsKKwl1OCBjb2xv
cl9mb3JtYXQsIGNvbG9yX2RlcHRoOwogCXUxNiBoc2l6ZSwgdnNpemU7CiB9OwogCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGluZV9z
dGF0ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxp
bmVfc3RhdGUuYwppbmRleCBlNjRiZmVhYTA2YzcuLjk0OGQxOTUxYzhlYiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmVfc3RhdGUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGlu
ZV9zdGF0ZS5jCkBAIC03NTgsMTAgKzc1OCwxMSBAQCBrb21lZGFfaW1wcm9jX3ZhbGlkYXRlKHN0
cnVjdCBrb21lZGFfaW1wcm9jICppbXByb2MsCiAJc3QtPnZzaXplID0gZGZsb3ctPmluX2g7CiAK
IAlpZiAoZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQoY3J0Y19zdCkpIHsKLQkJdTMyIG91
dHB1dF9kZXB0aHM7Ci0JCXUzMiBhdmFpbF9kZXB0aHM7CisJCXUzMiBvdXRwdXRfZGVwdGhzLCBv
dXRwdXRfZm9ybWF0czsKKwkJdTMyIGF2YWlsX2RlcHRocywgYXZhaWxfZm9ybWF0czsKIAotCQlr
b21lZGFfY3J0Y19nZXRfY29sb3JfY29uZmlnKGNydGNfc3QsICZvdXRwdXRfZGVwdGhzKTsKKwkJ
a29tZWRhX2NydGNfZ2V0X2NvbG9yX2NvbmZpZyhjcnRjX3N0LCAmb3V0cHV0X2RlcHRocywKKwkJ
CQkJICAgICAmb3V0cHV0X2Zvcm1hdHMpOwogCiAJCWF2YWlsX2RlcHRocyA9IG91dHB1dF9kZXB0
aHMgJiBpbXByb2MtPnN1cHBvcnRlZF9jb2xvcl9kZXB0aHM7CiAJCWlmIChhdmFpbF9kZXB0aHMg
PT0gMCkgewpAQCAtNzcxLDcgKzc3MiwxNyBAQCBrb21lZGFfaW1wcm9jX3ZhbGlkYXRlKHN0cnVj
dCBrb21lZGFfaW1wcm9jICppbXByb2MsCiAJCQlyZXR1cm4gLUVJTlZBTDsKIAkJfQogCisJCWF2
YWlsX2Zvcm1hdHMgPSBvdXRwdXRfZm9ybWF0cyAmCisJCQkJaW1wcm9jLT5zdXBwb3J0ZWRfY29s
b3JfZm9ybWF0czsKKwkJaWYgKCFhdmFpbF9mb3JtYXRzKSB7CisJCQlEUk1fREVCVUdfQVRPTUlD
KCJObyBhdmFpbGFibGUgY29sb3JfZm9ybWF0cywgY29ubiBmb3JtYXRzIDB4JXggJiBkaXNwbGF5
OiAweCV4XG4iLAorCQkJCQkgb3V0cHV0X2Zvcm1hdHMsCisJCQkJCSBpbXByb2MtPnN1cHBvcnRl
ZF9jb2xvcl9mb3JtYXRzKTsKKwkJCXJldHVybiAtRUlOVkFMOworCQl9CisKIAkJc3QtPmNvbG9y
X2RlcHRoID0gX19mbHMoYXZhaWxfZGVwdGhzKTsKKwkJc3QtPmNvbG9yX2Zvcm1hdCA9IEJJVChf
X2ZmcyhhdmFpbF9mb3JtYXRzKSk7CiAJfQogCiAJa29tZWRhX2NvbXBvbmVudF9hZGRfaW5wdXQo
JnN0LT5iYXNlLCAmZGZsb3ctPmlucHV0LCAwKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKaW5kZXggNzQwYTgx
MjUwNjMwLi5hYmZhNTg3ZGIxODkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX3diX2Nvbm5lY3Rvci5jCkBAIC0xNzQsNiArMTc0LDcg
QEAgc3RhdGljIGludCBrb21lZGFfd2JfY29ubmVjdG9yX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19k
ZXYgKmttcywKIAogCWluZm8gPSAma3diX2Nvbm4tPmJhc2UuYmFzZS5kaXNwbGF5X2luZm87CiAJ
aW5mby0+YnBjID0gX19mbHMoa2NydGMtPm1hc3Rlci0+aW1wcm9jLT5zdXBwb3J0ZWRfY29sb3Jf
ZGVwdGhzKTsKKwlpbmZvLT5jb2xvcl9mb3JtYXRzID0ga2NydGMtPm1hc3Rlci0+aW1wcm9jLT5z
dXBwb3J0ZWRfY29sb3JfZm9ybWF0czsKIAogCWtjcnRjLT53Yl9jb25uID0ga3diX2Nvbm47CiAK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
