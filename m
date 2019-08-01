Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B66067DA69
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 13:37:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB1106E4D6;
	Thu,  1 Aug 2019 11:37:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70044.outbound.protection.outlook.com [40.107.7.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19D76E4D6
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 11:37:34 +0000 (UTC)
Received: from DB6PR0801CA0043.eurprd08.prod.outlook.com (2603:10a6:4:2b::11)
 by VI1PR0802MB2607.eurprd08.prod.outlook.com (2603:10a6:800:b9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.14; Thu, 1 Aug
 2019 11:37:30 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::201) by DB6PR0801CA0043.outlook.office365.com
 (2603:10a6:4:2b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2136.12 via Frontend
 Transport; Thu, 1 Aug 2019 11:37:30 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2052.18 via Frontend Transport; Thu, 1 Aug 2019 11:37:28 +0000
Received: ("Tessian outbound 71602e13cd49:v26");
 Thu, 01 Aug 2019 11:37:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91774eda1974e065
X-CR-MTA-TID: 64aa7808
Received: from 6ae7899e46a2.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.5.52]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 90B8A925-0D84-40E3-B445-75FCBB61EF7B.1; 
 Thu, 01 Aug 2019 11:37:18 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2052.outbound.protection.outlook.com [104.47.5.52])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6ae7899e46a2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Thu, 01 Aug 2019 11:37:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICS8VHzsCL7roMXesHcMsxFYaDnnUCMrLYkXTlmAEMIA4TUDcKGf9ierVLfyoTxIkNG8x4NHRfGbsfhK9ew5iVA+opSg4w+iJEMvZJkDPkeliSdqLfkFBARdt2/NjTtIuRSixaoe6h2rHIup4sG3/5xVge+IFXaHd0B6ek+LqeKxSkgj3HHHDTrtTTme5BF8sDlkwFYI7cD6noDNAzvTMkyJVRXyiWVRqabYX7hZgrGp7EQsNMn8EtG1ryiQB+Isdzlr8lEHLSGoP5742Y4aPBZQqOmEKcE1TizJdm5bBnxJg/5n0SZ7DmkBEwvAOHISk7fPL4gMNucHzJRQ/qA1tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2B3kRhxDKN309WlgD0F4Z17E9I1IFbdDJKdWWR1UfrI=;
 b=XbkPgVW+xe5ebIRYv7WZh5YtzKLTjgi4bJmP9Oi69t6MjchlKPo+CkQayKvPUjlm0oolaCi981MSTnTgLtWgmK73pZ3+hZliyd32tFH0n56lZ9mTWPd1yRGNQtB7OuvXjAEpHgL179dGqVN8DYW2G+m0FCgln3OX//LcQBUIUYR1/rIb3+LKuxyYIOoEak2yWtHwBGn9HcWGpIHDFhLUVTyl7aM1Z/UTx2t864FDhmBGH5rHLIPQYz7+0BJy72scSOMKErulIe5PFjQT8kHmxP2r7QZlK4OgoSCtAz7mVrC+6W/TZCimv+1/42yTiT/EDEzPR5QNdLIpmBVScKvIMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=arm.com;dmarc=pass action=none header.from=arm.com;dkim=pass
 header.d=arm.com;arc=none
Received: from AM7PR08MB5477.eurprd08.prod.outlook.com (10.141.174.204) by
 AM7PR08MB5528.eurprd08.prod.outlook.com (10.141.175.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Thu, 1 Aug 2019 11:37:16 +0000
Received: from AM7PR08MB5477.eurprd08.prod.outlook.com
 ([fe80::a8b8:cc18:ded9:6fdb]) by AM7PR08MB5477.eurprd08.prod.outlook.com
 ([fe80::a8b8:cc18:ded9:6fdb%3]) with mapi id 15.20.2136.010; Thu, 1 Aug 2019
 11:37:16 +0000
From: "Lowry Li (Arm Technology China)" <Lowry.Li@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "james qian wang (Arm Technology
 China)" <james.qian.wang@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "seanpaul@chromium.org"
 <seanpaul@chromium.org>, "airlied@linux.ie" <airlied@linux.ie>, Brian Starkey
 <Brian.Starkey@arm.com>
Subject: [PATCH] drm/komeda: Adds error event print functionality
Thread-Topic: [PATCH] drm/komeda: Adds error event print functionality
Thread-Index: AQHVSF13B+//d/diR06VTAGnMwmj+A==
Date: Thu, 1 Aug 2019 11:37:15 +0000
Message-ID: <1564659415-14548-1-git-send-email-lowry.li@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR02CA0158.apcprd02.prod.outlook.com
 (2603:1096:201:1f::18) To AM7PR08MB5477.eurprd08.prod.outlook.com
 (2603:10a6:20b:10f::12)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 1.9.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f893acb2-25d0-4563-0485-08d71674a221
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM7PR08MB5528; 
X-MS-TrafficTypeDiagnostic: AM7PR08MB5528:|VI1PR0802MB2607:
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2607CE33173D12DB0296A7E59FDE0@VI1PR0802MB2607.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:6430;OLM:6430;
x-forefront-prvs: 01165471DB
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(366004)(39860400002)(396003)(199004)(189003)(6506007)(386003)(66066001)(52116002)(102836004)(14454004)(26005)(186003)(50226002)(81156014)(55236004)(2501003)(99286004)(6436002)(54906003)(316002)(81166006)(8936002)(8676002)(53936002)(6486002)(3846002)(6116002)(6636002)(110136005)(6512007)(478600001)(66476007)(66946007)(66556008)(64756008)(66446008)(86362001)(25786009)(4326008)(2906002)(2201001)(305945005)(7736002)(71190400001)(71200400001)(5660300002)(68736007)(14444005)(36756003)(2616005)(476003)(486006)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM7PR08MB5528;
 H:AM7PR08MB5477.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: D7Nkfxd+7gYRkfR0toDWqukx6MQirT1+MnZ2dlheVYnNAiFqTWqAGKuCnnP7cMkIv0hgEHNLKJ5uk2gZunPs4lcXpPlta3bUOqpLhlwFN73CUNiKgSKUTRwDHGRcyolsIS9NtiYkUlmGB//4Ty04UvGVP0h01ufDbBdWiopRLngmuDC4nawVYV3J2eUq8ACL5TiLOM7uc1oMt00ws8K6KCbYd+ygCfh5WN6thxKDTKF4HDuv8MISuF31KxCmxloAn4q+YkVc4IZUbWdl/19p7Bzm56z0DAHRnoVrEM332hbvVF0h5D65vsMRqAmhDB93jh0yLahLyLoRspaG2yTF7i9t5nm9mozbHtDgQFACftoVwewvfatSJKgc/JQ+W6yF8PI2kk3apkF7MyIuKsVXTH34ksvowKcju/3QxNj60FQ=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5528
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Lowry.Li@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(2980300002)(189003)(199004)(26826003)(99286004)(3846002)(6116002)(2201001)(6486002)(22756006)(478600001)(356004)(14454004)(50466002)(25786009)(54906003)(50226002)(4326008)(63350400001)(63370400001)(6636002)(336012)(486006)(6512007)(110136005)(316002)(6506007)(386003)(102836004)(2616005)(2906002)(47776003)(476003)(186003)(14444005)(2501003)(5660300002)(305945005)(81156014)(66066001)(26005)(7736002)(23756003)(70206006)(8936002)(8746002)(8676002)(126002)(81166006)(76130400001)(36756003)(70586007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2607;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: bd442fc2-e183-49d7-18f4-08d716749a54
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0802MB2607; 
NoDisclaimer: True
X-Forefront-PRVS: 01165471DB
X-Microsoft-Antispam-Message-Info: tRlnFDYZQA/IIiV8lFHcw9LYv8mO9AeP+yxHcx99bHrZBpwC3kM2JJQDB2BMXVFzqjK6mE8z2rH0onaUszXFEp/FpQl0EjVTWwyFClYgcYc5JWjWFrg5KxVUlTePO9KHnUU4+iBa30kwOc2t/QG+FNd7JHQqKnXlPRJUbiUTHnt28wT1bOuxxb8OF8EuEUEYhBpUE8ISeJspl7U2HhX2BFneL6tefGkkVSdwwajMO8wkgsO1VFElwN3zKxly/01OIQ/8eyEckPscrF518g1YefLfMthbNYHktOlTePpP/CpjbKIPbOUZLeK52G18PsJscRZ/FvMWY//YyWhMLW4oL8hnMYp2md7i9zeml722qsC52jPhB2MqpNT+gB/zNAdFrScKDEUG+eb0uO7QkIE0Bxm+B0yxleUlb2nf27+Emvo=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2019 11:37:28.7584 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f893acb2-25d0-4563-0485-08d71674a221
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2607
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2B3kRhxDKN309WlgD0F4Z17E9I1IFbdDJKdWWR1UfrI=;
 b=Jeyt/5sYkSf0oPa0TD/SHq8fC1B4tx/XSern2gwgdmvU9G1XmWQ8QE5KiqU22P0jpbPMTFA1yCiA+t5l6bWj7qrR+CmMLeML4zZ78FKLz/DfkZuV2NejGUkQpI82W8NV+1WC13jXunJ3tM/OOTHEBDphZc4nX9up1t0NyVf9zJk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2B3kRhxDKN309WlgD0F4Z17E9I1IFbdDJKdWWR1UfrI=;
 b=Jeyt/5sYkSf0oPa0TD/SHq8fC1B4tx/XSern2gwgdmvU9G1XmWQ8QE5KiqU22P0jpbPMTFA1yCiA+t5l6bWj7qrR+CmMLeML4zZ78FKLz/DfkZuV2NejGUkQpI82W8NV+1WC13jXunJ3tM/OOTHEBDphZc4nX9up1t0NyVf9zJk=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=temperror action=none header.from=arm.com;
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

RnJvbTogIkxvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkiIDxMb3dyeS5MaUBhcm0uY29t
PgoKQWRkcyB0byBwcmludCB0aGUgZXZlbnQgbWVzc2FnZSB3aGVuIGVycm9yIGhhcHBlbnMgYW5k
IHRoZSBzYW1lIGV2ZW50CndpbGwgbm90IGJlIHByaW50ZWQgdW50aWwgbmV4dCB2c3luYy4KCkNo
YW5nZXMgc2luY2UgdjE6CjEuIEhhbmRsaW5nIHRoZSBldmVudCBwcmludCBieSBDT05GSUdfS09N
RURBX0VSUk9SX1BSSU5UOwoyLiBDaGFuZ2luZyB0aGUgbWF4IHN0cmluZyBzaXplIHRvIDI1Ni4K
ClNpZ25lZC1vZmYtYnk6IExvd3J5IExpIChBcm0gVGVjaG5vbG9neSBDaGluYSkgPGxvd3J5Lmxp
QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L0tjb25maWcgICAgICAg
ICAgICAgICB8ICAgNiArCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL01ha2Vm
aWxlICAgICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5oICAgfCAgMTUgKysrCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9ldmVudC5jIHwgMTQxICsrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jICAgfCAgIDQgKwogNSBmaWxlcyBj
aGFuZ2VkLCAxNjggaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2V2ZW50LmMKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9LY29uZmlnCmluZGV4IGNlYzA2MzkuLmU4N2ZmODYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlz
cGxheS9LY29uZmlnCkBAIC0xMiwzICsxMiw5IEBAIGNvbmZpZyBEUk1fS09NRURBCiAJICBQcm9j
ZXNzb3IgZHJpdmVyLiBJdCBzdXBwb3J0cyB0aGUgRDcxIHZhcmlhbnRzIG9mIHRoZSBoYXJkd2Fy
ZS4KIAogCSAgSWYgY29tcGlsZWQgYXMgYSBtb2R1bGUgaXQgd2lsbCBiZSBjYWxsZWQga29tZWRh
LgorCitjb25maWcgRFJNX0tPTUVEQV9FUlJPUl9QUklOVAorCWJvb2wgIkVuYWJsZSBrb21lZGEg
ZXJyb3IgcHJpbnQiCisJZGVwZW5kcyBvbiBEUk1fS09NRURBCisJaGVscAorCSAgQ2hvb3NlIHRo
aXMgb3B0aW9uIHRvIGVuYWJsZSBlcnJvciBwcmludGluZy4KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUgYi9kcml2ZXJzL2dwdS9kcm0vYXJt
L2Rpc3BsYXkva29tZWRhL01ha2VmaWxlCmluZGV4IDVjMzkwMGMuLmYwOTVhMWMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvTWFrZWZpbGUKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9NYWtlZmlsZQpAQCAtMjIsNCArMjIsNiBA
QCBrb21lZGEteSArPSBcCiAJZDcxL2Q3MV9kZXYubyBcCiAJZDcxL2Q3MV9jb21wb25lbnQubwog
Citrb21lZGEtJChDT05GSUdfRFJNX0tPTUVEQV9FUlJPUl9QUklOVCkgKz0ga29tZWRhX2V2ZW50
Lm8KKwogb2JqLSQoQ09ORklHX0RSTV9LT01FREEpICs9IGtvbWVkYS5vCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9kZXYuaCBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Rldi5oCmluZGV4IGQxYzg2YjYuLmUy
OGU3ZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2Rldi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRh
X2Rldi5oCkBAIC00MCw2ICs0MCwxNyBAQAogI2RlZmluZSBLT01FREFfRVJSX1RUTkcJCQlCSVRf
VUxMKDMwKQogI2RlZmluZSBLT01FREFfRVJSX1RURgkJCUJJVF9VTEwoMzEpCiAKKyNkZWZpbmUg
S09NRURBX0VSUl9FVkVOVFMJXAorCShLT01FREFfRVZFTlRfVVJVTgl8IEtPTUVEQV9FVkVOVF9J
QlNZCXwgS09NRURBX0VWRU5UX09WUiB8XAorCUtPTUVEQV9FUlJfVEVUTwkJfCBLT01FREFfRVJS
X1RFTVIJfCBLT01FREFfRVJSX1RJVFIgfFwKKwlLT01FREFfRVJSX0NQRQkJfCBLT01FREFfRVJS
X0NGR0UJfCBLT01FREFfRVJSX0FYSUUgfFwKKwlLT01FREFfRVJSX0FDRTAJCXwgS09NRURBX0VS
Ul9BQ0UxCXwgS09NRURBX0VSUl9BQ0UyIHxcCisJS09NRURBX0VSUl9BQ0UzCQl8IEtPTUVEQV9F
UlJfRFJJRlRUTwl8IEtPTUVEQV9FUlJfRlJBTUVUTyB8XAorCUtPTUVEQV9FUlJfWk1FCQl8IEtP
TUVEQV9FUlJfTUVSUgl8IEtPTUVEQV9FUlJfVENGIHxcCisJS09NRURBX0VSUl9UVE5HCQl8IEtP
TUVEQV9FUlJfVFRGKQorCisjZGVmaW5lIEtPTUVEQV9XQVJOX0VWRU5UUwlLT01FREFfRVJSX0NT
Q0UKKwogLyogbWFsaWRwIGRldmljZSBpZCAqLwogZW51bSB7CiAJTUFMSV9ENzEgPSAwLApAQCAt
MjA3LDQgKzIxOCw4IEBAIHN0cnVjdCBrb21lZGFfZGV2IHsKIAogc3RydWN0IGtvbWVkYV9kZXYg
KmRldl90b19tZGV2KHN0cnVjdCBkZXZpY2UgKmRldik7CiAKKyNpZmRlZiBDT05GSUdfRFJNX0tP
TUVEQV9FUlJPUl9QUklOVAordm9pZCBrb21lZGFfcHJpbnRfZXZlbnRzKHN0cnVjdCBrb21lZGFf
ZXZlbnRzICpldnRzKTsKKyNlbmRpZgorCiAjZW5kaWYgLypfS09NRURBX0RFVl9IXyovCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9ldmVudC5j
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYwpuZXcg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi41N2I2MGNkCi0tLSAvZGV2L251bGwKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfZXZlbnQuYwpAQCAt
MCwwICsxLDE0MSBAQAorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKy8qCisg
KiAoQykgQ09QWVJJR0hUIDIwMTkgQVJNIExpbWl0ZWQuIEFsbCByaWdodHMgcmVzZXJ2ZWQuCisg
KiBBdXRob3I6IEphbWVzLlFpYW4uV2FuZyA8amFtZXMucWlhbi53YW5nQGFybS5jb20+CisgKgor
ICovCisjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPgorCisjaW5jbHVkZSAia29tZWRhX2Rldi5o
IgorCitzdHJ1Y3Qga29tZWRhX3N0ciB7CisJY2hhciAqc3RyOworCXUzMiBzejsKKwl1MzIgbGVu
OworfTsKKworLyogcmV0dXJuIDAgb24gc3VjY2VzcywgIDwgMCBvbiBubyBzcGFjZS4KKyAqLwor
c3RhdGljIGludCBrb21lZGFfc3ByaW50ZihzdHJ1Y3Qga29tZWRhX3N0ciAqc3RyLCBjb25zdCBj
aGFyICpmbXQsIC4uLikKK3sKKwl2YV9saXN0IGFyZ3M7CisJaW50IG51bSwgZnJlZV9zejsKKwlp
bnQgZXJyOworCisJZnJlZV9zeiA9IHN0ci0+c3ogLSBzdHItPmxlbjsKKwlpZiAoZnJlZV9zeiA8
PSAwKQorCQlyZXR1cm4gLUVOT1NQQzsKKworCXZhX3N0YXJ0KGFyZ3MsIGZtdCk7CisKKwludW0g
PSB2c25wcmludGYoc3RyLT5zdHIgKyBzdHItPmxlbiwgZnJlZV9zeiwgZm10LCBhcmdzKTsKKwor
CXZhX2VuZChhcmdzKTsKKworCWlmIChudW0gPD0gZnJlZV9zeikgeworCQlzdHItPmxlbiArPSBu
dW07CisJCWVyciA9IDA7CisJfSBlbHNlIHsKKwkJc3RyLT5sZW4gPSBzdHItPnN6OworCQllcnIg
PSAtRU5PU1BDOworCX0KKworCXJldHVybiBlcnI7Cit9CisKK3N0YXRpYyB2b2lkIGV2dF9zcHJp
bnRmKHN0cnVjdCBrb21lZGFfc3RyICpzdHIsIHU2NCBldnQsIGNvbnN0IGNoYXIgKm1zZykKK3sK
KwlpZiAoZXZ0KQorCQlrb21lZGFfc3ByaW50ZihzdHIsIG1zZyk7Cit9CisKK3N0YXRpYyB2b2lk
IGV2dF9zdHIoc3RydWN0IGtvbWVkYV9zdHIgKnN0ciwgdTY0IGV2ZW50cykKK3sKKwlpZiAoZXZl
bnRzID09IDBVTEwpIHsKKwkJZXZ0X3NwcmludGYoc3RyLCAxLCAiTm9uZSIpOworCQlyZXR1cm47
CisJfQorCisJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVZFTlRfVlNZTkMsICJW
U1lOQ3wiKTsKKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9GTElQLCAi
RkxJUHwiKTsKKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9FT1csICJF
T1d8Iik7CisJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVZFTlRfTU9ERSwgIk9Q
LU1PREV8Iik7CisKKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FVkVOVF9VUlVO
LCAiVU5ERVJSVU58Iik7CisJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVZFTlRf
T1ZSLCAiT1ZFUlJVTnwiKTsKKworCS8qIEdMQiBlcnJvciAqLworCWV2dF9zcHJpbnRmKHN0ciwg
ZXZlbnRzICYgS09NRURBX0VSUl9NRVJSLCAiTUVSUnwiKTsKKwlldnRfc3ByaW50ZihzdHIsIGV2
ZW50cyAmIEtPTUVEQV9FUlJfRlJBTUVUTywgIkZSQU1FVE98Iik7CisKKwkvKiBET1UgZXJyb3Ig
Ki8KKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfRFJJRlRUTywgIkRSSUZU
VE98Iik7CisJZXZ0X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX0ZSQU1FVE8sICJG
UkFNRVRPfCIpOworCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9URVRPLCAi
VEVUT3wiKTsKKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQ1NDRSwgIkNT
Q0V8Iik7CisKKwkvKiBMUFUgZXJyb3JzIG9yIGV2ZW50cyAqLworCWV2dF9zcHJpbnRmKHN0ciwg
ZXZlbnRzICYgS09NRURBX0VWRU5UX0lCU1ksICJJQlNZfCIpOworCWV2dF9zcHJpbnRmKHN0ciwg
ZXZlbnRzICYgS09NRURBX0VSUl9BWElFLCAiQVhJRXwiKTsKKwlldnRfc3ByaW50ZihzdHIsIGV2
ZW50cyAmIEtPTUVEQV9FUlJfQUNFMCwgIkFDRTB8Iik7CisJZXZ0X3NwcmludGYoc3RyLCBldmVu
dHMgJiBLT01FREFfRVJSX0FDRTEsICJBQ0UxfCIpOworCWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRz
ICYgS09NRURBX0VSUl9BQ0UyLCAiQUNFMnwiKTsKKwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAm
IEtPTUVEQV9FUlJfQUNFMywgIkFDRTN8Iik7CisKKwkvKiBMUFUgVEJVIGVycm9ycyovCisJZXZ0
X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX1RDRiwgIlRDRnwiKTsKKwlldnRfc3By
aW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfVFRORywgIlRUTkd8Iik7CisJZXZ0X3Nwcmlu
dGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX1RJVFIsICJUSVRSfCIpOworCWV2dF9zcHJpbnRm
KHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9URU1SLCAiVEVNUnwiKTsKKwlldnRfc3ByaW50Zihz
dHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfVFRGLCAiVFRGfCIpOworCisJLyogQ1UgZXJyb3JzKi8K
KwlldnRfc3ByaW50ZihzdHIsIGV2ZW50cyAmIEtPTUVEQV9FUlJfQ1BFLCAiQ09QUk9DfCIpOwor
CWV2dF9zcHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9aTUUsICJaTUV8Iik7CisJZXZ0
X3NwcmludGYoc3RyLCBldmVudHMgJiBLT01FREFfRVJSX0NGR0UsICJDRkdFfCIpOworCWV2dF9z
cHJpbnRmKHN0ciwgZXZlbnRzICYgS09NRURBX0VSUl9URU1SLCAiVEVNUnwiKTsKKworCWlmIChz
dHItPmxlbiA+IDAgJiYgKHN0ci0+c3RyW3N0ci0+bGVuIC0gMV0gPT0gJ3wnKSkgeworCQlzdHIt
PnN0cltzdHItPmxlbiAtIDFdID0gMDsKKwkJc3RyLT5sZW4tLTsKKwl9Cit9CisKK3N0YXRpYyBi
b29sIGlzX25ld19mcmFtZShzdHJ1Y3Qga29tZWRhX2V2ZW50cyAqYSkKK3sKKwlyZXR1cm4gKGEt
PnBpcGVzWzBdIHwgYS0+cGlwZXNbMV0pICYKKwkgICAgICAgKEtPTUVEQV9FVkVOVF9GTElQIHwg
S09NRURBX0VWRU5UX0VPVyk7Cit9CisKK3ZvaWQga29tZWRhX3ByaW50X2V2ZW50cyhzdHJ1Y3Qg
a29tZWRhX2V2ZW50cyAqZXZ0cykKK3sKKwl1NjQgcHJpbnRfZXZ0cyA9IEtPTUVEQV9FUlJfRVZF
TlRTOworCXN0YXRpYyBib29sIGVuX3ByaW50ID0gdHJ1ZTsKKworCS8qIHJlZHVjZSB0aGUgc2Ft
ZSBtc2cgcHJpbnQsIG9ubHkgcHJpbnQgdGhlIGZpcnN0IGV2dCBmb3Igb25lIGZyYW1lICovCisJ
aWYgKGV2dHMtPmdsb2JhbCB8fCBpc19uZXdfZnJhbWUoZXZ0cykpCisJCWVuX3ByaW50ID0gdHJ1
ZTsKKwlpZiAoIWVuX3ByaW50KQorCQlyZXR1cm47CisKKwlpZiAoKGV2dHMtPmdsb2JhbCB8IGV2
dHMtPnBpcGVzWzBdIHwgZXZ0cy0+cGlwZXNbMV0pICYgcHJpbnRfZXZ0cykgeworCQkjZGVmaW5l
IFNUUl9TWgkJMjU2CisJCWNoYXIgbXNnW1NUUl9TWl07CisJCXN0cnVjdCBrb21lZGFfc3RyIHN0
cjsKKworCQlzdHIuc3RyID0gbXNnOworCQlzdHIuc3ogID0gU1RSX1NaOworCQlzdHIubGVuID0g
MDsKKworCQlrb21lZGFfc3ByaW50Zigmc3RyLCAiZ2N1OiAiKTsKKwkJZXZ0X3N0cigmc3RyLCBl
dnRzLT5nbG9iYWwpOworCQlrb21lZGFfc3ByaW50Zigmc3RyLCAiLCBwaXBlc1swXTogIik7CisJ
CWV2dF9zdHIoJnN0ciwgZXZ0cy0+cGlwZXNbMF0pOworCQlrb21lZGFfc3ByaW50Zigmc3RyLCAi
LCBwaXBlc1sxXTogIik7CisJCWV2dF9zdHIoJnN0ciwgZXZ0cy0+cGlwZXNbMV0pOworCisJCURS
TV9FUlJPUigiZXJyIGRldGVjdDogJXNcbiIsIG1zZyk7CisKKwkJZW5fcHJpbnQgPSBmYWxzZTsK
Kwl9Cit9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tv
bWVkYV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2tt
cy5jCmluZGV4IDQxOWE4YjAuLjBmYWZjMzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
cm0vZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0v
ZGlzcGxheS9rb21lZGEva29tZWRhX2ttcy5jCkBAIC00Nyw2ICs0NywxMCBAQCBzdGF0aWMgaXJx
cmV0dXJuX3Qga29tZWRhX2ttc19pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQogCW1l
bXNldCgmZXZ0cywgMCwgc2l6ZW9mKGV2dHMpKTsKIAlzdGF0dXMgPSBtZGV2LT5mdW5jcy0+aXJx
X2hhbmRsZXIobWRldiwgJmV2dHMpOwogCisjaWZkZWYgQ09ORklHX0RSTV9LT01FREFfRVJST1Jf
UFJJTlQKKwlrb21lZGFfcHJpbnRfZXZlbnRzKCZldnRzKTsKKyNlbmRpZgorCiAJLyogTm90aWZ5
IHRoZSBjcnRjIHRvIGhhbmRsZSB0aGUgZXZlbnRzICovCiAJZm9yIChpID0gMDsgaSA8IGttcy0+
bl9jcnRjczsgaSsrKQogCQlrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoJmttcy0+Y3J0Y3NbaV0s
ICZldnRzKTsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
