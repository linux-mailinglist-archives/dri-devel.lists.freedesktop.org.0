Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A6DB7A82
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2019 15:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EA76F477;
	Thu, 19 Sep 2019 13:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30058.outbound.protection.outlook.com [40.107.3.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEE66F477
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Sep 2019 13:30:15 +0000 (UTC)
Received: from AM6PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:20b:c0::19)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2263.23; Thu, 19 Sep
 2019 13:30:12 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::200) by AM6PR08CA0031.outlook.office365.com
 (2603:10a6:20b:c0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19 via Frontend
 Transport; Thu, 19 Sep 2019 13:30:12 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20 via Frontend Transport; Thu, 19 Sep 2019 13:30:10 +0000
Received: ("Tessian outbound 968ab6b62146:v31");
 Thu, 19 Sep 2019 13:30:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e39eb3f5e2db9d4b
X-CR-MTA-TID: 64aa7808
Received: from 89a7ef77e105.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.9.59]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6C1D978-6BE4-4BC7-8366-47303AC00B9A.1; 
 Thu, 19 Sep 2019 13:30:04 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 89a7ef77e105.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384);
 Thu, 19 Sep 2019 13:30:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fbnfar14x+TN/yvAhpH/dTYMLqVHoeMB5jk7LlKghTwrnKIKo0GdcJgj46ymwQnpW0jwBz0+Q4EYWmyAkjKqUPNB1NOR9ss6NifRsXkVT7EjWJEz4hG6ogv+qn56WfcofOWt5UJnxiUfAPdn1e5XJpIgYvv1skFAfT49Gkv6+C/NmFtoG3ALhlJnZ7Wf5vuFCq81G5shFtTvm31RMdk4m7A5MlPBtNlQ+72m9HsIB68lonZh6B+3FyglhrK3qs6mtF7mk4kc3jpUJLdsxXObhg2Oe/8q5Q7ZKCtz2y/IpuNyheiMr9AevsLEQdGHN9t5AAoa1iSTvdQc/RtdwWmqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9I+5xCgF7GzoOP7Rozly63quyjihAUCy1HrvQlGWj8=;
 b=JXd+DJuyjPNnkDYDz65KkdVUIgQzxFRywBozbLF3ZEIvmZtse2ZqLX4g6+gPkoo+edemNPewsVQmhPQ1nrQZoSj1Ye+GIkbOmu9vmuAJ4OJYueFNU5aPxi6xalsLuHqdR92EkC1y3Ks5iIaw85o/jEOWFzJfKAAMr+ed6Adubm8gjCH0imYRATj7QBQKFoA7lZDoVp7KcQN1nSjLO3yDnNB1liJxnNeqmSrTrDSor0VvbJCcLmp5YVMk6tnrcSQ1+YROn8QUiNCWN7VUX617uoPV1in3qQkd24mw3r7aPivdCzORiGIXLSsjcFz1bb07/h0tYemLZuu6+LEwvTEZ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB5376.eurprd08.prod.outlook.com (52.133.244.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Thu, 19 Sep 2019 13:30:03 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::f164:4d79:79f:dc6f%7]) with mapi id 15.20.2263.023; Thu, 19 Sep 2019
 13:30:03 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/komeda: Fix FLIP_COMPLETE timestamp on CRTC enable
Thread-Topic: [PATCH] drm/komeda: Fix FLIP_COMPLETE timestamp on CRTC enable
Thread-Index: AQHVbu5XybbezBNH+kaEyHcWelehfw==
Date: Thu, 19 Sep 2019 13:30:02 +0000
Message-ID: <20190919132759.18358-1-mihail.atanassov@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [217.140.106.55]
x-clientproxiedby: LO2P265CA0215.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::35) To VI1PR08MB4078.eurprd08.prod.outlook.com
 (2603:10a6:803:e5::28)
x-mailer: git-send-email 2.23.0
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: af15bb49-6d31-4118-2d18-08d73d057eca
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR08MB5376; 
X-MS-TrafficTypeDiagnostic: VI1PR08MB5376:|VI1PR08MB5376:|AM5PR0801MB1972:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB19722E545B89F7CCAC826E398F890@AM5PR0801MB1972.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
x-forefront-prvs: 016572D96D
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(376002)(136003)(39860400002)(346002)(199004)(189003)(6916009)(6486002)(25786009)(476003)(6116002)(66066001)(99286004)(71200400001)(71190400001)(6436002)(6512007)(7736002)(2501003)(50226002)(186003)(86362001)(2616005)(26005)(4326008)(8676002)(81156014)(66556008)(66446008)(305945005)(486006)(386003)(5640700003)(316002)(44832011)(478600001)(8936002)(102836004)(1076003)(6506007)(2351001)(54906003)(66476007)(3846002)(2906002)(5660300002)(256004)(14454004)(66946007)(36756003)(81166006)(64756008)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB5376;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: 821jgBgaCEODxjT3BMGCDKb9ct2ZvvtxDysN711bzYSBrc9M4c87jNsaax68BnCnFHoijHXT2h/VaAYeLW9UM5YYWBZNBv01u8Wora4r87P6qpQmaZHuK1ASCXo3s1tNRaKICrdE+98V/ys4iqVJQpsBrIABWVR/19AISKQ89NPVb7gQp6wf2rFQQHJRpBRC2EtYGtqIhT/mcLPF/s67+TeVBBe9HhCeIBSjXcqLCjr210DtnNGwBCvx676mtphtvdxufWQ2yQuMSzOk5xta1ZAdg2v3GIzT67VcQq66erWmg4uGTyn0k9C4Y9RpotEkUgeeG/GbBPAGAWBaJlNGvCBEIHSXWaZkctIWaNVqES4R1V6LidvfFls4a5mkBEKUYep6eLf7OkKHQySAUJ3fBAlLZbhbEqdXJlAUOWfjotE=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5376
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(136003)(396003)(199004)(189003)(316002)(36906005)(5660300002)(5640700003)(478600001)(2351001)(25786009)(23756003)(336012)(76130400001)(1076003)(4326008)(54906003)(2501003)(107886003)(356004)(186003)(66066001)(6512007)(47776003)(486006)(26005)(6506007)(386003)(102836004)(7736002)(26826003)(50466002)(81166006)(22756006)(8746002)(8936002)(50226002)(81156014)(70206006)(305945005)(99286004)(70586007)(63350400001)(86362001)(6916009)(126002)(36756003)(476003)(2906002)(14454004)(8676002)(6486002)(2616005)(3846002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0801MB1972;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8cf62777-ffce-496a-7fa8-08d73d057a00
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(710020)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR0801MB1972; 
NoDisclaimer: True
X-Forefront-PRVS: 016572D96D
X-Microsoft-Antispam-Message-Info: 993aeL+5Yw3d66YvvDApN15MHVv/vNaPR6MpLZ0iqEaYKqt/Pbm9ZpuThA9XdNo09xgwKHgm4VZNNn3oeeXloFRrK580hl+RrIYfI9Qmy4kR0ReMDwV0MMzB87N10kPOqa0tNyYPatSTJi55ekYi/7AOWhOGL1mYbCPdqcmvMQuHGwZwsTz94o5iTCRqdqbT4VUcCFQjadksW9ljYoJZehmIn/YKqIkmWEHoklWX2/R6sqPC+asVgGXQlCUcpCWjcyRva4y76N2yefvpNqc9d2PwZaE48dwnl/nrEkRFPmP0KMEreIMDdeiEPXJwt2p8yyn/ekB5qEm9WGlPN6lN3LAxX3j+x5pwgIztbm7ISDA95/rPyUlpq3jrTp2Qvr8gkGSm1LniHzID56Gkt0MyhZ/JU4zAktCR9JiW4zC9P/U=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2019 13:30:10.6727 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af15bb49-6d31-4118-2d18-08d73d057eca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9I+5xCgF7GzoOP7Rozly63quyjihAUCy1HrvQlGWj8=;
 b=Oof3RtY5t0OsqzEugsK9f9kXXpXPmjmGiZUyBRr9HeIcwy+GgOEOOX3DnSIlfQPe+eRXrM1DXtZzzccAt+10EhiTYPniW1o4bWq1MZob/Iy6x6kU6seiVhhWEm185HHbX8RZ2ZT1ZrET6q1Ng5mlvD1u5/IJ3J2Z84saKkR6ZNk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y9I+5xCgF7GzoOP7Rozly63quyjihAUCy1HrvQlGWj8=;
 b=Oof3RtY5t0OsqzEugsK9f9kXXpXPmjmGiZUyBRr9HeIcwy+GgOEOOX3DnSIlfQPe+eRXrM1DXtZzzccAt+10EhiTYPniW1o4bWq1MZob/Iy6x6kU6seiVhhWEm185HHbX8RZ2ZT1ZrET6q1Ng5mlvD1u5/IJ3J2Z84saKkR6ZNk=
X-Mailman-Original-Authentication-Results: spf=temperror (sender IP is
 63.35.35.123)
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
Cc: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 David Airlie <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "james qian wang
 \(Arm Technology China\)" <james.qian.wang@arm.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBpbml0aWFsbHkgdHVybmluZyBhIGNydGMgb24sIGRybV9yZXNldF92YmxhbmtfdGltZXN0
YW1wIHdpbGwKc2V0IHRoZSB2YmxhbmsgdGltZXN0YW1wIHRvIDAgZm9yIGFueSBkcml2ZXIgdGhh
dCBkb2Vzbid0IHByb3ZpZGUKYSAtPmdldF92YmxhbmtfdGltZXN0YW1wKCkgaG9vay4KClVuZm9y
dHVuYXRlbHksIHRoZSBGTElQX0NPTVBMRVRFIGV2ZW50IGRlcGVuZHMgb24gdGhhdCB0aW1lc3Rh
bXAsCmFuZCB0aGUgb25seSB3YXkgdG8gcmVnZW5lcmF0ZSBhIHZhbGlkIG9uZSBpcyB0byBoYXZl
IHZibGFuawppbnRlcnJ1cHRzIGVuYWJsZWQgYW5kIGhhdmUgYSB2YWxpZCBpbi1JU1IgY2FsbCB0
bwpkcm1fY3J0Y19oYW5kbGVfdmJsYW5rLgoKV3JhcCB0aGUgY2FsbCB0byBrb21lZGFfY3J0Y19k
b19mbHVzaCBpbiAtPmF0b21pY19lbmFibGUoKSB3aXRoIGEKZHJtX2NydGNfdmJsYW5rX3tnZXQs
cHV0fSBwYWlyIHNvIHdlIGNhbiBoYXZlIGEgdmJsYW5rIElTUiBwcmlvciB0bwp0aGUgRkxJUF9D
T01QTEVURSBJU1IgKG9yIG1vcmUgbGlrZWx5LCB0aGV5J2xsIGdldCBoYW5kbGVkIGluIHRoZSBz
YW1lCklTUiwgd2hpY2ggaXMgZXF1YWxseSB2YWxpZCkuCgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgpDYzogTGl2aXUgRHVkYXUgPExpdml1LkR1ZGF1QGFybS5jb20+ClNpZ25l
ZC1vZmYtYnk6IE1paGFpbCBBdGFuYXNzb3YgPG1paGFpbC5hdGFuYXNzb3ZAYXJtLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRhL2tvbWVkYV9jcnRjLmMgfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJt
L2FybS9kaXNwbGF5L2tvbWVkYS9rb21lZGFfY3J0Yy5jCmluZGV4IGY0NDAwNzg4YWI5NC4uODc0
MjBhNzY3YmM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkva29tZWRh
L2tvbWVkYV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9r
b21lZGFfY3J0Yy5jCkBAIC0yNTgsNyArMjU4LDkgQEAga29tZWRhX2NydGNfYXRvbWljX2VuYWJs
ZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiB7CiAJa29tZWRhX2NydGNfcHJlcGFyZSh0b19rY3J0
YyhjcnRjKSk7CiAJZHJtX2NydGNfdmJsYW5rX29uKGNydGMpOworCVdBUk5fT04oZHJtX2NydGNf
dmJsYW5rX2dldChjcnRjKSk7CiAJa29tZWRhX2NydGNfZG9fZmx1c2goY3J0Yywgb2xkKTsKKwlk
cm1fY3J0Y192YmxhbmtfcHV0KGNydGMpOwogfQogCiBzdGF0aWMgdm9pZAotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
