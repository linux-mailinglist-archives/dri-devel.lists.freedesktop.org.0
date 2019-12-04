Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE2D112A9F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCBE6F51D;
	Wed,  4 Dec 2019 11:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10065.outbound.protection.outlook.com [40.107.1.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790056F4F8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:37 +0000 (UTC)
Received: from AM6PR08CA0047.eurprd08.prod.outlook.com (2603:10a6:20b:c0::35)
 by AM0PR08MB3682.eurprd08.prod.outlook.com (2603:10a6:208:fb::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.18; Wed, 4 Dec
 2019 11:48:34 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::203) by AM6PR08CA0047.outlook.office365.com
 (2603:10a6:20b:c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:34 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:34 +0000
Received: ("Tessian outbound a8ced1463995:v37");
 Wed, 04 Dec 2019 11:48:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e4efc0fee19f085a
X-CR-MTA-TID: 64aa7808
Received: from de4fd4e6043b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F94B99F8-FAC5-4333-90A5-0E540A7D282A.1; 
 Wed, 04 Dec 2019 11:48:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id de4fd4e6043b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R82Py72BOK4PRkvD6Mq3AHPqBEgffFNbDSQK81+H5/a+xpNLdwIvZNaIiTnSmh22fvuydZPY0ntgf/Ou1vc1DPXDCYlZbzocVhNESPKrAYmhQJ2Udn7DBvKkqlbhyjW95gywCNcWkzyJeIHYGwCQXJ6y1HhVSOOKN5r2dheEuaPPg5Qri2t702VQ5R7vAe3t9LdTclZTDqLBsCz9BRUWvr3hYPhSoTDla909MdstGEYG/CU4TxgG61AQr4LoQxj4ogTg2/QVR9bIS21VQVH+bFiIdr+ENnAynhaLCHGyKNHFzqVlZgy6CSIeVX/FWevNecA6q7C7EXupoxQGdMimxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5WCE2P1/Ewa/uQFzzi0Jlc3+KKSsTwCAJn/FZJulyM=;
 b=XWIut7RxFlPrYIXj7pSm1zvl0fcNDiaDpXw0j6XgancvaHp7tapPdHHh+mSpr+u2i6Ujs6CsdxKG7joaxPvbQLlDPi00gZxjXXEYKhREzbwUt0F14H9idz20KVDSpHCzM76l479PLv6XOP30Csm5ZHfkS27dfkaeElm0Q4qRBMoRWPbLvTQ8i4FF9M0oL6e87qVLFP1EVup1HbrL1dKhPDTaCl4OTTDW2M+PPMTS1y2M8f1KJdY/6NTRH8c8MMD1bo8Pxh2+GiOzo9Rd/ifGWZfOmEf4ELLdhloA28yerR76fYDFHbWgJIIAIrkT45TDoK7W0jIVVUncAr+5pcn/Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4624.eurprd08.prod.outlook.com (20.178.13.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 4 Dec 2019 11:48:25 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:25 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 27/28] drm/sti: Use drm_bridge_init()
Thread-Topic: [PATCH v2 27/28] drm/sti: Use drm_bridge_init()
Thread-Index: AQHVqpi89ZSI0/jtHUG0V0fAqzMiWA==
Date: Wed, 4 Dec 2019 11:48:25 +0000
Message-ID: <20191204114732.28514-28-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
In-Reply-To: <20191204114732.28514-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LNXP265CA0055.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::19) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4e42bf03-49e7-45c4-e15b-08d778afe479
X-MS-TrafficTypeDiagnostic: VI1PR08MB4624:|VI1PR08MB4624:|AM0PR08MB3682:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB368254D146445035EF5482128F5D0@AM0PR08MB3682.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:1169;OLM:1169;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(199004)(189003)(2351001)(305945005)(316002)(6436002)(81166006)(7736002)(6916009)(4326008)(186003)(99286004)(6486002)(66446008)(5640700003)(66476007)(1076003)(66556008)(54906003)(2501003)(5660300002)(66946007)(64756008)(6512007)(86362001)(11346002)(2906002)(44832011)(2616005)(14454004)(50226002)(6506007)(36756003)(25786009)(5024004)(81156014)(8676002)(3846002)(71190400001)(52116002)(26005)(478600001)(71200400001)(8936002)(102836004)(6116002)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4624;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: v233dY/6lxNaaPA0Yk15MvBwRrVKY2JKpR3dvlr0WV+6wh9755I4tMiFwOTEg+pBmuzZOdSFo9C0G2/KGNz6aKd89iccKGDW29jnb9nBN7jFcX6IrWjwx3ITkJUjBhg3ViTSXew42KdL+wZrCic2lRVaVRWnU43JBIfTqyV7Qd7ej2LU3JDhILocFW3kDO5lvNZP6ke7BvQcT8rvYWhj9FB8Dz4H04VPuSTBxE2CSI+NjOJf8FWiMgRd253KMajm8CckEHaasOrKxtZqGiWo8LySHWZ56PzX4QXhez0TF8v8RByHcGJ7bEjtYsRfRfx4L7KVPdfEccZW2BpMs9mxlj9OzMPeroKwhiwU/1hVZnbizncSeN6asdDL5Y7qposhEigAGDF3+hsvGMpa3HCGqz92oZ3s2PgFlXySxHmnyJl/WV7rJnw3DgokbqDBkl/b
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4624
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(396003)(346002)(199004)(189003)(7736002)(6512007)(26826003)(50466002)(186003)(2351001)(6506007)(316002)(478600001)(102836004)(2906002)(305945005)(99286004)(23756003)(50226002)(14454004)(5024004)(356004)(76176011)(5660300002)(1076003)(36756003)(86362001)(4326008)(5640700003)(54906003)(8936002)(8746002)(2616005)(11346002)(81166006)(70586007)(70206006)(76130400001)(107886003)(6486002)(81156014)(25786009)(2501003)(6916009)(336012)(26005)(3846002)(6116002)(8676002)(22756006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3682;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: c52ba38a-ccd5-49d0-5f49-08d778afdef1
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5gI1hREyvTtcYg9JEZDBaZJtveZ4tkp8UmJGR9KDlg8ld1Djk4hjARDLp0OoiqSSzyDjlervZBwFuSS2COQZ78BpqVnIP79lMwE0sgdOXd2Yc6v7BFJFyjyQjKCw3cLgJBP5Cnv+eGrzE1JQpZ1Jim9BvU8maxBSdJqgSzGqWTLUToFQhfXQciTDFLDUNP1yb4rvp8fbZBdR9nf4XzwuEzx4hZkG1FLHlr9RZ9uaHBnADd8nDPvhnAEu87jGtppxIKH47StuhvwKwJhLxPTJPPnV3UK90Tt8aa8p/lhfcIvNheGJcIVfc7V8iQF99dcBiJFndOWYx2QoKBftn5iw4m6GcQhqrMQhs/mUzREM5hKXg6wzrfCYCytKsbsubT8vpZaMa3Ds9ShD1YxvBeUKM3pp8P3qXUsoTQbOmSLvEXlKn3kTyO/XX22B44OIgZoN
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:34.3466 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e42bf03-49e7-45c4-e15b-08d778afe479
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3682
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5WCE2P1/Ewa/uQFzzi0Jlc3+KKSsTwCAJn/FZJulyM=;
 b=gjkhBQklYpQsyBAjs90nPQ0PBQ7SL1KVIWblXPZI3eg+Uen+LQ8wqibrAYXklxVrwvEfVYX3XpLfQmgNNoUOJjCb9iT5ZsKwgEd3q9mW/BaQZhWvaD/pUImDfgMsWsIKGB0Zxkf2puFVwnXqzFapc81uA6nQgW0G1Irm9Ap6S3U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5WCE2P1/Ewa/uQFzzi0Jlc3+KKSsTwCAJn/FZJulyM=;
 b=gjkhBQklYpQsyBAjs90nPQ0PBQ7SL1KVIWblXPZI3eg+Uen+LQ8wqibrAYXklxVrwvEfVYX3XpLfQmgNNoUOJjCb9iT5ZsKwgEd3q9mW/BaQZhWvaD/pUImDfgMsWsIKGB0Zxkf2puFVwnXqzFapc81uA6nQgW0G1Irm9Ap6S3U=
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
 David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, nd <nd@arm.com>,
 Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgp2MjoKIC0gQWxzbyBhcHBseSBkcm1fYnJpZGdlX2luaXQo
KSBpbiBzdGlfaGRtaS5jIGFuZCBzdGlfaGRhLmMgKFNhbSwKICAgQmVuamFtaW4pCgpTaWduZWQt
b2ZmLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfZHZvLmMgIHwgNCArLS0tCiBkcml2ZXJzL2dwdS9kcm0v
c3RpL3N0aV9oZGEuYyAgfCAzICstLQogZHJpdmVycy9ncHUvZHJtL3N0aS9zdGlfaGRtaS5jIHwg
MyArLS0KIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2R2by5jIGIvZHJpdmVycy9ncHUv
ZHJtL3N0aS9zdGlfZHZvLmMKaW5kZXggNjgyODliMGIwNjNhLi4yMGEzOTU2YjMzYmMgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2R2by5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdGkvc3RpX2R2by5jCkBAIC00NjIsOSArNDYyLDcgQEAgc3RhdGljIGludCBzdGlfZHZvX2Jp
bmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEp
CiAJaWYgKCFicmlkZ2UpCiAJCXJldHVybiAtRU5PTUVNOwogCi0JYnJpZGdlLT5kcml2ZXJfcHJp
dmF0ZSA9IGR2bzsKLQlicmlkZ2UtPmZ1bmNzID0gJnN0aV9kdm9fYnJpZGdlX2Z1bmNzOwotCWJy
aWRnZS0+b2Zfbm9kZSA9IGR2by0+ZGV2Lm9mX25vZGU7CisJZHJtX2JyaWRnZV9pbml0KGJyaWRn
ZSwgJmR2by0+ZGV2LCAmc3RpX2R2b19icmlkZ2VfZnVuY3MsIE5VTEwsIGR2byk7CiAJZHJtX2Jy
aWRnZV9hZGQoYnJpZGdlKTsKIAogCWVyciA9IGRybV9icmlkZ2VfYXR0YWNoKGVuY29kZXIsIGJy
aWRnZSwgTlVMTCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZGEuYyBi
L2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkYS5jCmluZGV4IDhmN2JmMzM4MTVmZC4uYzcyOTZl
MzU0YTM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZGEuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZGEuYwpAQCAtNjk5LDggKzY5OSw3IEBAIHN0YXRpYyBp
bnQgc3RpX2hkYV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVy
LCB2b2lkICpkYXRhKQogCWlmICghYnJpZGdlKQogCQlyZXR1cm4gLUVOT01FTTsKIAotCWJyaWRn
ZS0+ZHJpdmVyX3ByaXZhdGUgPSBoZGE7Ci0JYnJpZGdlLT5mdW5jcyA9ICZzdGlfaGRhX2JyaWRn
ZV9mdW5jczsKKwlkcm1fYnJpZGdlX2luaXQoYnJpZGdlLCBkZXYsICZzdGlfaGRhX2JyaWRnZV9m
dW5jcywgTlVMTCwgaGRhKTsKIAlkcm1fYnJpZGdlX2F0dGFjaChlbmNvZGVyLCBicmlkZ2UsIE5V
TEwpOwogCiAJY29ubmVjdG9yLT5lbmNvZGVyID0gZW5jb2RlcjsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWku
YwppbmRleCA4MTQ1NjBlYWQ0ZTEuLmM5YWUzZTE4ZmE1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3N0aS9zdGlfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWku
YwpAQCAtMTI3OSw4ICsxMjc5LDcgQEAgc3RhdGljIGludCBzdGlfaGRtaV9iaW5kKHN0cnVjdCBk
ZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQogCWlmICghYnJp
ZGdlKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCWJyaWRnZS0+ZHJpdmVyX3ByaXZhdGUgPSBoZG1p
OwotCWJyaWRnZS0+ZnVuY3MgPSAmc3RpX2hkbWlfYnJpZGdlX2Z1bmNzOworCWRybV9icmlkZ2Vf
aW5pdChicmlkZ2UsIGRldiwgJnN0aV9oZG1pX2JyaWRnZV9mdW5jcywgTlVMTCwgaGRtaSk7CiAJ
ZHJtX2JyaWRnZV9hdHRhY2goZW5jb2RlciwgYnJpZGdlLCBOVUxMKTsKIAogCWNvbm5lY3Rvci0+
ZW5jb2RlciA9IGVuY29kZXI7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
