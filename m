Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5607C8B65E
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 13:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED786E104;
	Tue, 13 Aug 2019 11:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00060.outbound.protection.outlook.com [40.107.0.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCBB6E104
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:08:40 +0000 (UTC)
Received: from VI1PR08CA0092.eurprd08.prod.outlook.com (2603:10a6:800:d3::18)
 by DB8PR08MB4953.eurprd08.prod.outlook.com (2603:10a6:10:ef::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.18; Tue, 13 Aug
 2019 11:08:36 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e09::207) by VI1PR08CA0092.outlook.office365.com
 (2603:10a6:800:d3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2157.15 via Frontend
 Transport; Tue, 13 Aug 2019 11:08:36 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18 via Frontend Transport; Tue, 13 Aug 2019 11:08:35 +0000
Received: ("Tessian outbound a1fd2c3cfdb0:v26");
 Tue, 13 Aug 2019 11:08:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 260a94ef076d9744
X-CR-MTA-TID: 64aa7808
Received: from 631ab1ffda15.1 (cr-mta-lb-1.cr-mta-net [104.47.6.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CF60CC6A-489F-44FC-AFF4-C8BAC4697BC4.1; 
 Tue, 13 Aug 2019 11:08:22 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 631ab1ffda15.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Aug 2019 11:08:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9iu9+2vJyJUJ1jMiSE7DhsnsbpnqzMWY97MPUs+nAJ83O0grSI+/P2vAuJ6neM43bk8Gixe5k4+QXXQznVCJ+Fa1/UzlObFnNHGutqnICa7653D0OM8HswA6kMwRWZJNVx64VQtyfBUmn9YRbF11S6tM39XK2CWSt7gUJIQoVQzHSAhaCSmVhWiEyFePUoOsO8kEDfn9McTEidPcp+ZUPbTHnMtoylbUWbrt6yK289KvI2sjKbXP/brC8CNcoATkUn/Wa+SFfrHlQVooJRjOHEN48uueh7o/AgHyA3sSw0C5JK7gxuLV6X9wQWbwsOYzt2ltJp6YiyWCgb9C3I4HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsDNXr0KNxCcnIZ9PF1U792HvsS/tGBmMN/oZ0GYiz4=;
 b=WKZZbrzGytf/PPnlpbKjH5gNa/IrfdFrgOWNPPW2OY/fma2LQQ0boKaCZkNGcVeTYtiD4C2AoR6cLmZN1NxFGz5RhmA7Wvpghj10ImsXrSfFnPNbQYT0pWQcYgggMM3db9wkX3SjUCSll8/cisNrxZK7qTdGc/yhgodTgvfNV810Y+W8sG6m5E9s/5CvROF6AKxVg8TLYuvp8O7zj8GEpKE9NbzQFVjVtWJjPd077jLx7DVQpyGzXfPvzb3qIgh4N5D76UZ5pT2sXnBsANAZrWyHo9+i0wQwc/LHvGCJlBDHPRhnNEtaNA7Xd/Yq4NlxPLQ/4+U1epeOntr8d0JL3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB4894.eurprd08.prod.outlook.com (10.255.113.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Tue, 13 Aug 2019 11:08:20 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::2151:f0b1:3ea7:c134%6]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 11:08:20 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>
Subject: [PATCH] drm/komeda: Clean warning 'komeda_component_add' might be a
 candidate for 'gnu_printf'
Thread-Topic: [PATCH] drm/komeda: Clean warning 'komeda_component_add' might
 be a candidate for 'gnu_printf'
Thread-Index: AQHVUcdq4wh1p5uTvkWo2JsLoFstlQ==
Date: Tue, 13 Aug 2019 11:08:20 +0000
Message-ID: <20190813110759.10425-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:202:2e::15) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: eda37c8f-0d6c-4aa8-5286-08d71fde95de
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB4894; 
X-MS-TrafficTypeDiagnostic: VE1PR08MB4894:|DB8PR08MB4953:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB4953AA9D9AEE16B5B43E9907B3D20@DB8PR08MB4953.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1303;OLM:1303;
x-forefront-prvs: 01283822F8
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(199004)(189003)(66476007)(66556008)(6436002)(3846002)(6116002)(53936002)(2201001)(66946007)(66446008)(64756008)(36756003)(478600001)(486006)(102836004)(55236004)(316002)(8936002)(66066001)(6512007)(386003)(6506007)(26005)(476003)(103116003)(186003)(81156014)(25786009)(81166006)(2616005)(99286004)(50226002)(8676002)(4744005)(52116002)(2501003)(6486002)(14454004)(256004)(1076003)(14444005)(71190400001)(71200400001)(110136005)(2906002)(54906003)(86362001)(5660300002)(305945005)(7736002)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4894;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: Wt35t6ZGCWITMQjsqOrCkOjM/B0/2LZl+kmH47OKq0mNwCBOyAENi+O7mzUHCu1AWmH35zxYcTuEiL069fMjmVDN/1XO75hiRxTycj6UUJVcIFYVogfpT9CH5nC96cwAcXBNlFAI/SB4Sxe9CSvhmGC21WiDFE1yn9kAUb47fbQbWYAQgrt+QOF+7gKRRIgTLd0/EWH/izH8mjDaqWwiXGKfmDhU03K+lrxSEcFPxFzEdHflceMlX5faa2Lr9mFXmNQYoNvcaTsF9E1b95M/tMbsRf6ffbzeKl7Pk+bUlELtbvWt5c499dObSoJwgu8dDp8h0ynVi6MQSMWRVAYQoZJbzpseeZNU8n2cc21IWO7kPA1hAMfKhz7TIhprVybDDKwPn7hxcSmacEmXMM8GkZfM1hEhnWCvjIsdvE30j8w=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4894
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(2980300002)(199004)(189003)(316002)(8936002)(476003)(86362001)(66066001)(2201001)(50466002)(47776003)(22756006)(478600001)(4326008)(386003)(6506007)(2616005)(6116002)(336012)(26005)(2906002)(8676002)(36756003)(26826003)(81156014)(50226002)(3846002)(63370400001)(63350400001)(8746002)(81166006)(102836004)(126002)(186003)(25786009)(486006)(110136005)(14444005)(103116003)(7736002)(99286004)(1076003)(23756003)(2501003)(70206006)(356004)(6512007)(70586007)(54906003)(6486002)(305945005)(36906005)(76130400001)(14454004)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB4953;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 633fa617-309c-4d26-9c24-08d71fde8c93
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(710020)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB8PR08MB4953; 
NoDisclaimer: True
X-Forefront-PRVS: 01283822F8
X-Microsoft-Antispam-Message-Info: bQOjfdq5df1cjJ65xe4BCL1re6m6XoKhDHj0ekyWz+Bvrxzhr5GKRG+UCrcw9RlgQ671MM+vgKAVz40rqbt/8PNyx3a/gpkhaAAwck4ye9C18ExIr0PvSiS25W25MpZAtJCWcnkIswtzRsPdIF3GmJ7epD2QnXH1OpEBNNKJH6QsODCCIwEBMq9fMtG1owUBvzmy23l/qFj/nm6aoofNiXCuVmF1+rmD6B2ygqttaFcaYNBCApi86ym2eE6XCGOr9TJM+xbasICC3YdOW4S1pIItssNOGAQ3ev4/XIA0Ex2BaHGKoLFKnPOe1jun6eJE7umGfRk6BpoYJnb5yPQWC2a94cG+dCG+Y5auPEVI5uM7GKRHQt5PZ2Q0NVd/n2TWq9Lv1ldTfjnvx2xzQlZ1xJ5z5HGquBVpaBWAUVyzy0Q=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2019 11:08:35.2479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eda37c8f-0d6c-4aa8-5286-08d71fde95de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4953
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsDNXr0KNxCcnIZ9PF1U792HvsS/tGBmMN/oZ0GYiz4=;
 b=yFbUh3ZBF8yOxD7dBYPYrfaIQ0uoMkYUuSAxsDj+5UypmfxMWvm6jvN/kGC/+oPxYxFo0+i/ikNIyNh5gsSOtHhSB9AdSb35bRchnfRSB1REDC7czIcvTiG2k9QZbfuHRLm0BnfjDQ7bfAGENVgNl8yvSj3x932e7hox8Jz0ssk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DsDNXr0KNxCcnIZ9PF1U792HvsS/tGBmMN/oZ0GYiz4=;
 b=yFbUh3ZBF8yOxD7dBYPYrfaIQ0uoMkYUuSAxsDj+5UypmfxMWvm6jvN/kGC/+oPxYxFo0+i/ikNIyNh5gsSOtHhSB9AdSb35bRchnfRSB1REDC7czIcvTiG2k9QZbfuHRLm0BnfjDQ7bfAGENVgNl8yvSj3x932e7hox8Jz0ssk=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Julien
 Yin \(Arm Technology China\)" <Julien.Yin@arm.com>, "Channing Chen \(Arm
 Technology China\)" <Channing.Chen@arm.com>,
 "james qian wang \(Arm Technology China\)" <james.qian.wang@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a29tZWRhL2tvbWVkYV9waXBlbGluZS5jOiBJbiBmdW5jdGlvbiAna29tZWRhX2NvbXBvbmVudF9h
ZGQnOgprb21lZGEva29tZWRhX3BpcGVsaW5lLmM6MjEyOjM6IHdhcm5pbmc6IGZ1bmN0aW9uICdr
b21lZGFfY29tcG9uZW50X2FkZCcgbWlnaHQgYmUgYSBjYW5kaWRhdGUgZm9yICdnbnVfcHJpbnRm
JyBmb3JtYXQgYXR0cmlidXRlIFstV3N1Z2dlc3QtYXR0cmlidXRlPWZvcm1hdF0KICAgdnNucHJp
bnRmKGMtPm5hbWUsIHNpemVvZihjLT5uYW1lKSwgbmFtZV9mbXQsIGFyZ3MpOwogICBefn5+fn5+
fn4KClNpZ25lZC1vZmYtYnk6IGphbWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEp
IDxqYW1lcy5xaWFuLndhbmdAYXJtLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3Bs
YXkva29tZWRhL2tvbWVkYV9waXBlbGluZS5oIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9waXBlbGluZS5oIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfcGlwZWxpbmUuaAppbmRleCBhOTBiY2JiM2NiMjMuLjE0YjY4MzE2NDU0NCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfcGlwZWxpbmUu
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9waXBlbGlu
ZS5oCkBAIC00ODAsNiArNDgwLDcgQEAgdm9pZCBrb21lZGFfcGlwZWxpbmVfZHVtcF9yZWdpc3Rl
cihzdHJ1Y3Qga29tZWRhX3BpcGVsaW5lICpwaXBlLAogCQkJCSAgIHN0cnVjdCBzZXFfZmlsZSAq
c2YpOwogCiAvKiBjb21wb25lbnQgQVBJcyAqLworZXh0ZXJuIF9fcHJpbnRmKDEwLCAxMSkKIHN0
cnVjdCBrb21lZGFfY29tcG9uZW50ICoKIGtvbWVkYV9jb21wb25lbnRfYWRkKHN0cnVjdCBrb21l
ZGFfcGlwZWxpbmUgKnBpcGUsCiAJCSAgICAgc2l6ZV90IGNvbXBfc3osIHUzMiBpZCwgdTMyIGh3
X2lkLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
