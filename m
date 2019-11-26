Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14909109EF2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 14:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE786E3A4;
	Tue, 26 Nov 2019 13:17:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70047.outbound.protection.outlook.com [40.107.7.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B576E353
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 13:16:30 +0000 (UTC)
Received: from AM4PR08CA0063.eurprd08.prod.outlook.com (2603:10a6:205:2::34)
 by AM0PR08MB3203.eurprd08.prod.outlook.com (2603:10a6:208:63::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.19; Tue, 26 Nov
 2019 13:16:27 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::202) by AM4PR08CA0063.outlook.office365.com
 (2603:10a6:205:2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2474.17 via Frontend
 Transport; Tue, 26 Nov 2019 13:16:27 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17 via Frontend Transport; Tue, 26 Nov 2019 13:16:27 +0000
Received: ("Tessian outbound 712c40e503a7:v33");
 Tue, 26 Nov 2019 13:16:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: afef6af7145bca95
X-CR-MTA-TID: 64aa7808
Received: from 7fdba39730e8.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.14.56]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D475C91D-1BFE-4EBD-97EB-D2EEE8015BD0.1; 
 Tue, 26 Nov 2019 13:16:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7fdba39730e8.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Nov 2019 13:16:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMjRqQsxnvFHyUIfYPvHCiMwBeOOPnCbsK7xuKP2dRmofwGIKG8Wc+mR1IHRuzvJcVGeDtBq/SwRqLMrF5shzJ+8YWOpiNyFnxndsZLGQGcvgkQrfI6f72eTrjLv+Ga08bQuO5pxzLD3lRVe5OiLgorgUnQxo+0rRa6nI2jQW8YcUV34SWL+rnplizTi183zA72dezLmah4Vm6HVwL3gMt9w0QZu/hFbPNxvQpUBrRTqKnohsNk+nZQ996Sz63a2gxAdOSGl/AHV9kI+CNihCLebx/BZHsO4T6pRG4gVA9jsEHGmxIlJ8W96dM4Qg2a3gha3UEE5N4pci49HLtu6qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FstHQUSWa3nWcMPJkk1fSwl0xp0aRPH3Sq6+Vw0/0xU=;
 b=CmYdyARFJG48Az7IPL3oEYk91giNNDkuB0+xbxQKlsilL4IKdD4YxoBGQ1SXxIpwfXvnPw91GmQnzWPOidHbaiDgJTIjhF4EXiVvCdKSQt9l0hH8/sfdU0qtAwyAbIVj3epZ7K3qZS21R536IWPZG+3YG2wfqvMgjw31dhuENbXS1FM16EcUZHq0OamZSSaFneakq4R4eLLdTZg3y5xrk5nOk2yOz+fjdXmbVSvo5InwN9HRiRYiRMnp/HoLqOq6GEK+labgjUKJvNyuR5kFYg9AD0dOpTet5ehFb39lyMOYp4qz5ZK5kz4DgBX7Zc2WtsH5oFk9wT21GnBDE+SZ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4317.eurprd08.prod.outlook.com (20.179.28.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.16; Tue, 26 Nov 2019 13:16:20 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 13:16:20 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH 22/30] drm/exynos: mic: Use drm_bridge_init()
Thread-Topic: [PATCH 22/30] drm/exynos: mic: Use drm_bridge_init()
Thread-Index: AQHVpFuxnqAfcuRdS0imEaOYObrpxQ==
Date: Tue, 26 Nov 2019 13:16:20 +0000
Message-ID: <20191126131541.47393-23-mihail.atanassov@arm.com>
References: <20191126131541.47393-1-mihail.atanassov@arm.com>
In-Reply-To: <20191126131541.47393-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0453.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::33) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1eba69f1-e5e2-49ed-554a-08d77272d85a
X-MS-TrafficTypeDiagnostic: VI1PR08MB4317:|VI1PR08MB4317:|AM0PR08MB3203:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB320310C8C909D20A585DE2DF8F450@AM0PR08MB3203.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:2582;OLM:2582;
x-forefront-prvs: 0233768B38
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(1496009)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(189003)(199004)(5640700003)(86362001)(6512007)(71200400001)(2616005)(6486002)(71190400001)(2906002)(4326008)(6916009)(44832011)(446003)(11346002)(54906003)(66946007)(316002)(66446008)(64756008)(66556008)(66476007)(6436002)(7416002)(8936002)(186003)(26005)(5660300002)(102836004)(305945005)(14454004)(25786009)(99286004)(81166006)(50226002)(478600001)(2501003)(7736002)(6116002)(2351001)(76176011)(1076003)(52116002)(66066001)(256004)(8676002)(81156014)(6506007)(3846002)(386003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4317;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: LV0v24o+/W+UV97i/RxVlDyHyajK8JD8GdVMJo3TTiVnPUvIb+RB6Gx1qUwsuowhry+RlBTnSmNBV9XH9yE2VcLP3QB573KWHd1XDPMHsc4irb/EvAjdnHIQ83CprVdLgG68pUC1duYm36d1abp48PnVnoz5KfmfvOYcVMWGIcczzNHP8p71h+9r2g+m4dP/oohYrlXU2d2L3qVRHwX4RBIdiKPLb9iyIuw+Pq7+DIxqjQxvrIJdvLD8aQpyiZkTGrveXu/eD9XuDu1WSOlpLlhRgcFb3VGLd+NS5Dpc8FkUW6hR2BWA7cZECpNHkDcP7ugX3FRxnU2dD+Xuoc/lW4o2BMriQ++GUyQYWExYeIPpJLCRkWittDul8pb/WTylTyFlZnTJ+mOPX3wL3opcIXZeBMYVGPvEuMsGxYVv8rHS1zJMcjrUOuj8sIr/vzuz
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4317
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(39860400002)(396003)(136003)(199004)(189003)(47776003)(50466002)(23756003)(3846002)(2906002)(6116002)(356004)(76176011)(81166006)(81156014)(26005)(8936002)(2616005)(11346002)(102836004)(446003)(22756006)(8746002)(6506007)(50226002)(86362001)(386003)(70206006)(2351001)(70586007)(336012)(5660300002)(14454004)(8676002)(316002)(36756003)(7736002)(305945005)(6916009)(26826003)(2501003)(186003)(5640700003)(478600001)(54906003)(66066001)(106002)(6486002)(6512007)(36906005)(25786009)(4326008)(99286004)(1076003)(107886003)(76130400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3203;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 63c1ecbc-9e8e-4606-70cd-08d77272d404
NoDisclaimer: True
X-Forefront-PRVS: 0233768B38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YWJcWJodFQjdtpZu4tARqnOpwscW25TkIrl4qspZCV/HVr8zbgf3xwOBroVez2I9ffmVhBZBPK3ZGKkU7jajCG+XBU1Ci+MY1wVdV3q+umI+MttX5uxc5Tf2M3V5CsURxJg0uLBPjyENHjV4V5nb3U0NMsiGDeXfmviwed+sJ3QjbNmOpLqVQUDi0pCxZIk4C2ioInzFSLSd939mnot0a9wJTq9MwYMX1LIVuLFtSKtKvarJOq8fNXN+d1OaA/WZYCQtXh+V4tmYMEcUlGbPkATxBHR3ZrSyHhyZRe5eboeUFmUrQez5KMp9q8we0sI6vhN0IG3SVEYh7XhIj1+4nCD3DQBK6qt1NKPkXILIRkDS60CDgIIrOozMNEH5Y/Y3dbnz2lRgNYgPM+m0N5pDmt23zVMztLyV7gVVS8ectWqkb540r4N751GoqegU1Wem
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 13:16:27.7250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eba69f1-e5e2-49ed-554a-08d77272d85a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3203
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FstHQUSWa3nWcMPJkk1fSwl0xp0aRPH3Sq6+Vw0/0xU=;
 b=Wj+E4DSfljJKCk7qirbLs7ur8hKal/LE7BR6I5ABSviiblU3wVqFetV2INg2hRza2Xbcjqiq8dmT5hOlbuc40G/83ATBBfHZfEo+ZO4Il0uzxYGrAxZVH8u8CN4cNF59qr3uBnb8XFG5vRCGSzbDwwye2QQdwSDhhLaR7r0ZHYs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FstHQUSWa3nWcMPJkk1fSwl0xp0aRPH3Sq6+Vw0/0xU=;
 b=Wj+E4DSfljJKCk7qirbLs7ur8hKal/LE7BR6I5ABSviiblU3wVqFetV2INg2hRza2Xbcjqiq8dmT5hOlbuc40G/83ATBBfHZfEo+ZO4Il0uzxYGrAxZVH8u8CN4cNF59qr3uBnb8XFG5vRCGSzbDwwye2QQdwSDhhLaR7r0ZHYs=
X-Mailman-Original-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.freedesktop.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.freedesktop.org;
 dmarc=bestguesspass action=none header.from=arm.com;
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2U6IG5vIGxvZ2ljIGRlcGVuZHMgb24gZHJpdmVyX3ByaXZhdGUg
YmVpbmcgTlVMTCwgc28KaXQncyBzYWZlIHRvIHNldCBpdCBlYXJsaWVyIGluIGV4eW5vc19taWNf
cHJvYmUuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292
QGFybS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX21pYy5jIHwg
OCArLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9taWMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9taWMuYwppbmRleCBmNDFkNzU5MjM1
NTcuLmNhYWQzNDhhNTY0NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX21pYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9taWMu
YwpAQCAtMzA5LDEwICszMDksNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVu
Y3MgbWljX2JyaWRnZV9mdW5jcyA9IHsKIHN0YXRpYyBpbnQgZXh5bm9zX21pY19iaW5kKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogCQkJICAgdm9pZCAqZGF0YSkK
IHsKLQlzdHJ1Y3QgZXh5bm9zX21pYyAqbWljID0gZGV2X2dldF9kcnZkYXRhKGRldik7Ci0KLQlt
aWMtPmJyaWRnZS5kcml2ZXJfcHJpdmF0ZSA9IG1pYzsKLQogCXJldHVybiAwOwogfQogCkBAIC00
MjIsOSArNDE4LDcgQEAgc3RhdGljIGludCBleHlub3NfbWljX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAKIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBtaWMpOwogCi0J
bWljLT5icmlkZ2UuZnVuY3MgPSAmbWljX2JyaWRnZV9mdW5jczsKLQltaWMtPmJyaWRnZS5vZl9u
b2RlID0gZGV2LT5vZl9ub2RlOwotCisJZHJtX2JyaWRnZV9pbml0KCZtaWMtPmJyaWRnZSwgZGV2
LCAmbWljX2JyaWRnZV9mdW5jcywgTlVMTCwgbWljKTsKIAlkcm1fYnJpZGdlX2FkZCgmbWljLT5i
cmlkZ2UpOwogCiAJcG1fcnVudGltZV9lbmFibGUoZGV2KTsKLS0gCjIuMjMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
