Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12166FC1AE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040706E44C;
	Thu, 14 Nov 2019 08:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10069.outbound.protection.outlook.com [40.107.1.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6D76E44C
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 08:38:04 +0000 (UTC)
Received: from VI1PR08CA0152.eurprd08.prod.outlook.com (2603:10a6:800:d5::30)
 by AM6PR08MB3526.eurprd08.prod.outlook.com (2603:10a6:20b:4e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2451.26; Thu, 14 Nov
 2019 08:38:01 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by VI1PR08CA0152.outlook.office365.com
 (2603:10a6:800:d5::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23 via Frontend
 Transport; Thu, 14 Nov 2019 08:38:01 +0000
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2451.23 via Frontend Transport; Thu, 14 Nov 2019 08:38:01 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Thu, 14 Nov 2019 08:37:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d850798c1982cdac
X-CR-MTA-TID: 64aa7808
Received: from 11f31d2f9a69.2 (cr-mta-lb-1.cr-mta-net [104.47.10.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D3868E3C-8638-4D8E-B6D8-8E5581D41AFC.1; 
 Thu, 14 Nov 2019 08:37:54 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2051.outbound.protection.outlook.com [104.47.10.51])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 11f31d2f9a69.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Nov 2019 08:37:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hv0Un6YLFSi5Ac2pk4Pct8vRCasS6ko/prnftcfbwu0nLXSUi6R2wMW/CXABgxbVfhyby29AL1S61gQKLfEt22LQYX/Tpg7aG+vRpmUWi9u2kvvM9xWqCcGgqEsT1XhKPDtbva+5HUYxaXhdQXwirsCaBh4uoAKDF3F4byUppJr4+RNBSt8YPdn7X8g++dPbKMBkCvBeQcTLhWFYmyxb/hC+uDMhfN86lNlXXCwYaWN7CkMsHgqqA0yr0ej2VvE8/86JMqij8kid/RzN69JS0qRVrYImjew7tYkuV+poKgcmtdYQ+7/nFa9qkKWiknyBorKOIf9G5thQuKfq6aNp1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIB/8z50vBuASSq6iSuVafx4DPXkwq7T4HlbSTTsATE=;
 b=SQqv3tv7QLnVa3mzd7J5/qwv25KquamnvE7QrY/zhfeg8w6T0ZFeUf0xj7zCjPCUm2qy3EOlIUMgcCNslP3dhudgEuxEg/izjfdlg68KioXXz2j6ZY7PjkNt5loBJrQ7ys01oI1S8WrIsRqMbMUKatXyO99UVFUOfCtqANT/Ooi0kGpP6EWjLGkx/dYMQ3aL8BSOwKz+DHHKqoKwOMhvfYLsXfGL4kDSAlKxvHmmy4qdc5f/6QFZzq7d7DVIZ19T9HyjttXYMueXqbBGSeBXdt3XGPzI3oGbXafZilpCOfQGkgwvo9yNs1R4Rx1ELu4K9lxWWgWusTLbZx/N2CnaCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4768.eurprd08.prod.outlook.com (10.255.114.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.27; Thu, 14 Nov 2019 08:37:52 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::a809:417a:faf3:61a7%6]) with mapi id 15.20.2451.023; Thu, 14 Nov 2019
 08:37:52 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: [PATCH v3 5/6] drm/komeda: Update writeback signal for side_by_side
Thread-Topic: [PATCH v3 5/6] drm/komeda: Update writeback signal for
 side_by_side
Thread-Index: AQHVmsbNlRubU2tfgE+DaVY2KN4Vzw==
Date: Thu, 14 Nov 2019 08:37:51 +0000
Message-ID: <20191114083658.27237-6-james.qian.wang@arm.com>
References: <20191114083658.27237-1-james.qian.wang@arm.com>
In-Reply-To: <20191114083658.27237-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:203:3e::26) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 19bd0a13-e4cb-48a3-100b-08d768ddf585
X-MS-TrafficTypeDiagnostic: VE1PR08MB4768:|VE1PR08MB4768:|AM6PR08MB3526:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3526E0A8156B802B559C966EB3710@AM6PR08MB3526.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 02213C82F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(346002)(396003)(136003)(39850400004)(189003)(199004)(71200400001)(71190400001)(36756003)(305945005)(2906002)(7736002)(110136005)(54906003)(6116002)(316002)(3846002)(99286004)(103116003)(446003)(11346002)(6486002)(8936002)(2616005)(476003)(6436002)(66476007)(66556008)(64756008)(66446008)(66946007)(478600001)(6512007)(50226002)(66066001)(486006)(14454004)(2501003)(5660300002)(76176011)(52116002)(256004)(386003)(55236004)(25786009)(6636002)(102836004)(6506007)(8676002)(4326008)(26005)(81156014)(81166006)(1076003)(186003)(2201001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4768;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: MEsGhWJrshKKYBlpp5akMZgcpvQ6hX2rSiV/hWIINbp4UJb9pCzBRp+FkOcrkBLAuHXJYV00zbjSwzATwCxDz3jB89WklghTyApHhwm4MHjAEQUpYneB0bGO3QsbNoQ4uG02/hlpzK9J4rQNA/KQAZi6nu3ZelmCZnogFEldVFP0vM2yAanM7Bz660BkieL8BAe1tgEUhCUFboiu1XoZroM1fG/A9qwz2SBo3OxE+TB7C0zuCbyC8MM8XCYAB3n4sVOW4BBP8gi5vVSjtAmb7qM6tcONnZF/JmxSxNdERpOkuiiAdKvLSTEvFhtJWLDkUuboZpNnu+tT62Axf1c69F4yDZfHjdGs2zuRdY40S/pUuXoaZ6kGS3uDnHpOnaiBleoWOFdK2M44EZ/MzPLj89ooEBOq9E7htqe67xj3JMqYHn7FYjld/rfCsRrOqQyR
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4768
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(39860400002)(396003)(1110001)(339900001)(199004)(189003)(66066001)(356004)(478600001)(105606002)(110136005)(54906003)(3846002)(22756006)(6116002)(47776003)(103116003)(14454004)(2501003)(36756003)(2201001)(2906002)(26826003)(36906005)(23756003)(50466002)(4326008)(99286004)(25786009)(316002)(70206006)(305945005)(7736002)(6636002)(70586007)(76130400001)(5660300002)(1076003)(6486002)(86362001)(386003)(6506007)(8676002)(76176011)(6512007)(81166006)(81156014)(8936002)(8746002)(486006)(126002)(476003)(50226002)(11346002)(446003)(26005)(102836004)(186003)(336012)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR08MB3526;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Fail; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 40cf5903-5bd3-467d-49a6-08d768ddefe9
NoDisclaimer: True
X-Forefront-PRVS: 02213C82F8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qH6v2a+a8K6/iYVW+qffwzqN4PP1s90EtU+HqC/ZZ8HusY4p1VEUIOnX4aEzz5SBKqveEqlGzN9tXOubvzU5CpW5dV9vJLWGDDRI9hCWPtLzRMafjUu29LXT0YzJEx/KYIJpl9gZiH8w1+rp1sJcTJvPSZFB39820vE/bIMBJo0OF+Uyo8K/bET7zAUqtqSHeGMJwHEKSSctpY6fHLpf4E3Bn5UsUrdQHVT68Kr77T0cCnfzyv5fOnXLusmLXRk955VY+nGSh8AWQRGqCOwtn82mnpKtkIyaNm0I9iZlx7UInAHMwe8AjvRJXNNIXUHEMyFwMm+anaycoZITu7Ao5ZpX87UDp4eCgxSNN5pMSrRgLZM86arosFOdH5yC3ztCeTfLg6Sl5VQrFADqPm2q7R2GKqvbtMIQzwTMj4DawKMpsdI4Te4C9zkEPVuHrPoN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2019 08:38:01.0952 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19bd0a13-e4cb-48a3-100b-08d768ddf585
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3526
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIB/8z50vBuASSq6iSuVafx4DPXkwq7T4HlbSTTsATE=;
 b=ksXJ9Hwk0sZefHfMGkFPiAIwugHad7dQGrzM0c5e77vKS4tcRKVxTz/N5qbrq06uL5EDVKek6gXyMTa7dC20KZvo8VWGh/y5OLOJUIlclKS3t+k8YHt8SVHB8w3lKM+xUjQWsGRTXldrbM10bVrVCEVMuyrDZwF6AR8OxklmenI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIB/8z50vBuASSq6iSuVafx4DPXkwq7T4HlbSTTsATE=;
 b=ksXJ9Hwk0sZefHfMGkFPiAIwugHad7dQGrzM0c5e77vKS4tcRKVxTz/N5qbrq06uL5EDVKek6gXyMTa7dC20KZvo8VWGh/y5OLOJUIlclKS3t+k8YHt8SVHB8w3lKM+xUjQWsGRTXldrbM10bVrVCEVMuyrDZwF6AR8OxklmenI=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>, "james qian wang \(Arm Technology
 China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gc2lkZSBieSBzaWRlIG1vZGUsIGEgd3JpdGViYWNrIGpvYiBpcyBjb21wbGV0ZWQgYnkgdHdv
IHBpcGVsaW5lczogbGVmdApieSBtYXN0ZXIgYW5kIHJpZ2h0IGJ5IHNsYXZlLCB3ZSBuZWVkIHRv
IHdhaXQgYm90aCBwaXBlbGluZSBmaW5pc2hlZCAoRU9XKSwKdGhlbiBjYW4gc2lnbmFsIHRoZSB3
cml0ZWJhY2sgam9iIGNvbXBsZXRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKYW1lcyBRaWFuIFdhbmcg
KEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+Ci0tLQogLi4u
L2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgIHwgMjMgKysrKysrKysr
Ky0tLS0tLS0tLQogLi4uL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaCAg
IHwgIDUgKysrKwogLi4uL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMg
IHwgIDMgKysrCiAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29t
ZWRhX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2Ny
dGMuYwppbmRleCAyNDkyOGI5MjJmYmQuLjc4MzUxYjcxMzVmOCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX2NydGMuYwpAQCAtMTkzLDI3ICsxOTMs
MjggQEAga29tZWRhX2NydGNfdW5wcmVwYXJlKHN0cnVjdCBrb21lZGFfY3J0YyAqa2NydGMpCiAJ
cmV0dXJuIGVycjsKIH0KIAotdm9pZCBrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoc3RydWN0IGtv
bWVkYV9jcnRjICAgKmtjcnRjLAordm9pZCBrb21lZGFfY3J0Y19oYW5kbGVfZXZlbnQoc3RydWN0
IGtvbWVkYV9jcnRjICprY3J0YywKIAkJCSAgICAgIHN0cnVjdCBrb21lZGFfZXZlbnRzICpldnRz
KQogewogCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9ICZrY3J0Yy0+YmFzZTsKKwlzdHJ1Y3Qga29t
ZWRhX3diX2Nvbm5lY3RvciAqd2JfY29ubiA9IGtjcnRjLT53Yl9jb25uOwogCXUzMiBldmVudHMg
PSBldnRzLT5waXBlc1trY3J0Yy0+bWFzdGVyLT5pZF07CiAKIAlpZiAoZXZlbnRzICYgS09NRURB
X0VWRU5UX1ZTWU5DKQogCQlkcm1fY3J0Y19oYW5kbGVfdmJsYW5rKGNydGMpOwogCi0JaWYgKGV2
ZW50cyAmIEtPTUVEQV9FVkVOVF9FT1cpIHsKLQkJc3RydWN0IGtvbWVkYV93Yl9jb25uZWN0b3Ig
KndiX2Nvbm4gPSBrY3J0Yy0+d2JfY29ubjsKKwkvKiBoYW5kbGVzIHdyaXRlYmFjayBldmVudCAq
LworCWlmIChldmVudHMgJiBLT01FREFfRVZFTlRfRU9XKQorCQl3Yl9jb25uLT5jb21wbGV0ZV9w
aXBlcyB8PSBCSVQoa2NydGMtPm1hc3Rlci0+aWQpOwogCi0JCWlmICh3Yl9jb25uKQotCQkJZHJt
X3dyaXRlYmFja19zaWduYWxfY29tcGxldGlvbigmd2JfY29ubi0+YmFzZSwgMCk7Ci0JCWVsc2UK
LQkJCURSTV9XQVJOKCJDUlRDWyVkXTogRU9XIGhhcHBlbiBidXQgbm8gd2JfY29ubmVjdG9yLlxu
IiwKLQkJCQkgZHJtX2NydGNfaW5kZXgoJmtjcnRjLT5iYXNlKSk7CisJaWYgKGtjcnRjLT5zaWRl
X2J5X3NpZGUgJiYKKwkgICAgKGV2dHMtPnBpcGVzW2tjcnRjLT5zbGF2ZS0+aWRdICYgS09NRURB
X0VWRU5UX0VPVykpCisJCXdiX2Nvbm4tPmNvbXBsZXRlX3BpcGVzIHw9IEJJVChrY3J0Yy0+c2xh
dmUtPmlkKTsKKworCWlmICh3Yl9jb25uLT5leHBlY3RlZF9waXBlcyA9PSB3Yl9jb25uLT5jb21w
bGV0ZV9waXBlcykgeworCQl3Yl9jb25uLT5jb21wbGV0ZV9waXBlcyA9IDA7CisJCWRybV93cml0
ZWJhY2tfc2lnbmFsX2NvbXBsZXRpb24oJndiX2Nvbm4tPmJhc2UsIDApOwogCX0KLQkvKiB3aWxs
IGhhbmRsZSBpdCB0b2dldGhlciB3aXRoIHRoZSB3cml0ZSBiYWNrIHN1cHBvcnQgKi8KLQlpZiAo
ZXZlbnRzICYgS09NRURBX0VWRU5UX0VPVykKLQkJRFJNX0RFQlVHKCJFT1cuXG4iKTsKIAogCWlm
IChldmVudHMgJiBLT01FREFfRVZFTlRfRkxJUCkgewogCQl1bnNpZ25lZCBsb25nIGZsYWdzOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21z
LmggYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9rbXMuaAppbmRl
eCBhZTY2NTRmZTk1ZTIuLjE3NGZiMGEwYjQ5YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fy
bS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfa21zLmgKQEAgLTU4LDYgKzU4LDExIEBAIHN0cnVjdCBr
b21lZGFfd2JfY29ubmVjdG9yIHsKIAogCS8qKiBAd2JfbGF5ZXI6IHJlcHJlc2VudHMgYXNzb2Np
YXRlZCB3cml0ZWJhY2sgcGlwZWxpbmUgb2Yga29tZWRhICovCiAJc3RydWN0IGtvbWVkYV9sYXll
ciAqd2JfbGF5ZXI7CisKKwkvKiogQGV4cGVjdGVkX3BpcGVzOiBwaXBlbGluZXMgYXJlIHVzZWQg
Zm9yIHRoZSB3cml0ZWJhY2sgam9iICovCisJdTMyIGV4cGVjdGVkX3BpcGVzOworCS8qKiBAY29t
cGxldGVfcGlwZXM6IHBpcGVsaW5lcyB3aGljaCBoYXZlIGZpbmlzaGVkIHdyaXRlYmFjayAqLwor
CXUzMiBjb21wbGV0ZV9waXBlczsKIH07CiAKIC8qKgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwppbmRleCA0NGU2
Mjg3NDc2NTQuLmQ2ODMzZWEzYjgyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9k
aXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMKQEAgLTE1Nyw2ICsxNTcs
OSBAQCBzdGF0aWMgaW50IGtvbWVkYV93Yl9jb25uZWN0b3JfYWRkKHN0cnVjdCBrb21lZGFfa21z
X2RldiAqa21zLAogCQlyZXR1cm4gLUVOT01FTTsKIAogCWt3Yl9jb25uLT53Yl9sYXllciA9IGtj
cnRjLT5tYXN0ZXItPndiX2xheWVyOworCWt3Yl9jb25uLT5leHBlY3RlZF9waXBlcyA9IEJJVChr
Y3J0Yy0+bWFzdGVyLT5pZCk7CisJaWYgKGtjcnRjLT5zaWRlX2J5X3NpZGUpCisJCWt3Yl9jb25u
LT5leHBlY3RlZF9waXBlcyB8PSBCSVQoa2NydGMtPnNsYXZlLT5pZCk7CiAKIAl3Yl9jb25uID0g
Jmt3Yl9jb25uLT5iYXNlOwogCXdiX2Nvbm4tPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSBCSVQo
ZHJtX2NydGNfaW5kZXgoJmtjcnRjLT5iYXNlKSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
