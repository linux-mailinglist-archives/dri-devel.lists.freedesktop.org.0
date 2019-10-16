Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE9CD8DF7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 12:34:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65C46E92B;
	Wed, 16 Oct 2019 10:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20056.outbound.protection.outlook.com [40.107.2.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B026E932
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 10:34:27 +0000 (UTC)
Received: from VI1PR08CA0146.eurprd08.prod.outlook.com (2603:10a6:800:d5::24)
 by DB8PR08MB5066.eurprd08.prod.outlook.com (2603:10a6:10:e4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16; Wed, 16 Oct
 2019 10:34:23 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::206) by VI1PR08CA0146.outlook.office365.com
 (2603:10a6:800:d5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2347.16 via Frontend
 Transport; Wed, 16 Oct 2019 10:34:23 +0000
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Wed, 16 Oct 2019 10:34:21 +0000
Received: ("Tessian outbound 0939a6bab6b1:v33");
 Wed, 16 Oct 2019 10:34:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 99346b773049ac19
X-CR-MTA-TID: 64aa7808
Received: from 4cddd178ccbc.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.4.54]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 34A94619-5420-4B7C-A6B7-977AAED1B35D.1; 
 Wed, 16 Oct 2019 10:34:10 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2054.outbound.protection.outlook.com [104.47.4.54])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4cddd178ccbc.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Oct 2019 10:34:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXf/QUlr4G3hZYPvJDdPHGY9wideFWLUnAnXMFIBPiS87pRC7GPSCmeHOjOhVjHtMrP4X2WbV8UePddjOGeG8jfuxGpF0rcbpUf+l1VZ3WWHG/MwqfTYAyRpHrXkpHWw2kU6O9zBWQfQg5EwUq+4qZH6+ViNmvsq8KRkCxzA+H10G4wf+P+vjOcAjOhellxtbzK3qbINeLxzuXT9u14WlPOorXjIouNAXvPWB0oB+jyzz+mUMmeOvEIlmdTK6RwC/boXXQ5iO38vpAt2pyNaNxrq6loh5q4AdGtqZ3aC7nT8fh0ohDu8549KQYDCzpLXPe5P2Sg+sUoB+C9QtWQMOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwNLApKNkl72Wy0e6O+y5NOzqaHS2uIq08CitOENDfA=;
 b=gyvtHpIv4cauAZDYIDkhbMXffAIf1ncW4VLAcd9N2SSe3fiYGHfCf0v6AyOCmfqWUjH0PVcXLa5OP8aEDW4oqVXblctRmtws1B9MTX+wkT1wgjZSaGsLwcZaC7Qq/H8FGzUE0hq0iKlye8r5AooKdEo2L8wF8R46ofYtU+Y3loDOMxLYqfRQwEBpspl+vHWajM/nYCPzM3rmqmUZXnBtkJx7aIS7yny75mspJl2CuPvhmaXvnUwc9bfEW+BvFMaSJi2XghK5nPUeRO9nMgbN3DQQUNJahgmtK4m6/NLXX8UW9w9Ibas67v7yYWrX1B8K5iNPhPeT9PSDpOCBNa3lwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5182.eurprd08.prod.outlook.com (20.179.31.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Wed, 16 Oct 2019 10:34:08 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::40ed:7ed3:90cf:ece5%3]) with mapi id 15.20.2347.023; Wed, 16 Oct 2019
 10:34:08 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>, "airlied@linux.ie" <airlied@linux.ie>, 
 Brian Starkey <Brian.Starkey@arm.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "sean@poorly.run" <sean@poorly.run>, 
 "imirkin@alum.mit.edu" <imirkin@alum.mit.edu>
Subject: [PATCH v5 1/4] drm: Add a new helper drm_color_ctm_s31_32_to_qm_n()
Thread-Topic: [PATCH v5 1/4] drm: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
Thread-Index: AQHVhA09wVtvHgqrOkmWUho1ovfOOQ==
Date: Wed, 16 Oct 2019 10:34:08 +0000
Message-ID: <20191016103339.25858-2-james.qian.wang@arm.com>
References: <20191016103339.25858-1-james.qian.wang@arm.com>
In-Reply-To: <20191016103339.25858-1-james.qian.wang@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK0PR04CA0006.apcprd04.prod.outlook.com
 (2603:1096:203:36::18) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 1b85811c-c757-490c-91c1-08d75224684a
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB5182:|VE1PR08MB5182:|DB8PR08MB5066:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <DB8PR08MB50666F71DCE0BB289C004C8BB3920@DB8PR08MB5066.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:4941;OLM:4941;
x-forefront-prvs: 0192E812EC
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(199004)(189003)(1076003)(64756008)(66446008)(66946007)(66556008)(66476007)(2171002)(6486002)(66066001)(71190400001)(8676002)(2201001)(14454004)(6436002)(71200400001)(5660300002)(76176011)(81166006)(81156014)(36756003)(2501003)(52116002)(386003)(6506007)(86362001)(25786009)(256004)(476003)(2616005)(305945005)(3846002)(8936002)(186003)(103116003)(11346002)(446003)(6512007)(478600001)(6116002)(55236004)(2906002)(486006)(54906003)(50226002)(4326008)(7736002)(110136005)(26005)(316002)(102836004)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5182;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: hBWEbJzky5IBufOc+HQF2LPlVDayfB7/yOzKhZfznZwRF6QawGbPfdj1f4MPREYCL4O8LG5uJMPN5rkxkSQ79Y4HlYq+JwpShnFKVYBYSCVJGVvKPsBqGikQtNuBtt0XpNBCIlKGV0byx1bX+JcLWaEDaDiOrxftbch5SdgtZKhTZBvRRmG0jiud4wTb8YoYP8qgngU7Bl8DS9w+j+7YDZJge1bAuD86+fKKRIdSUrT2umOf/YbNcGgYeLEcDD/CchpdVHjwd9vByK3bSDN+mkoyAoM1BvFxAk/WUVxnsJcTbFaRzAsBjEwJA7nWKksRgSLk3zkVPRwBCzB/8/96QWsTNfmNzkTzDiS1ap4d4ImtD+evZD6ZyxMugw1ZFP6VPLg5FcJvVVc+3sRpUpnACchwUQHnSmMnZ53J+Q8jXbA=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5182
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(376002)(189003)(199004)(305945005)(1076003)(3846002)(22756006)(6116002)(26826003)(478600001)(2501003)(25786009)(4326008)(103116003)(23756003)(5660300002)(26005)(2906002)(356004)(110136005)(316002)(54906003)(14454004)(102836004)(36906005)(76130400001)(7736002)(186003)(6512007)(66066001)(70206006)(76176011)(6506007)(70586007)(386003)(486006)(8936002)(50466002)(36756003)(50226002)(2171002)(6486002)(336012)(81166006)(11346002)(446003)(2616005)(476003)(126002)(86362001)(81156014)(8746002)(2201001)(63350400001)(107886003)(47776003)(8676002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR08MB5066;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: aeac93ca-8c58-47e9-a67d-08d752246034
NoDisclaimer: True
X-Forefront-PRVS: 0192E812EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJx0lPE0BZwsengIylt9z/80Tjp6TvH6G/aIh+IsBxFoHIYsztxA+TGWu0rarLNvaMzYAlegmwYZ4m69Adhu2f64t8r1J4c7XWjsh1sIjsubjPsoMGqMf7G5oyObA/xoofuFWTtb39PWVa3BYQ7cKVED8FXvXEHBeC1PlXD/h4URhGtGsCdmpGTUg9IpWmH4S+gsiva3YStoszYVOJ2y90+RtnYducENFzJfxm6kntiy9Z7Po4sPScRdUv2ZSriqj4wygOX8w9Sgx1QWWZePPxqQYewKv15x/YCgjgmkhe/gCAuId11aJ9sLKPXIcWJ0ETUl9pI2QfkasoDS2z+1KKr/nEms3l89G4/7X10eSEBQTBSF7vAgXj7/3sAuCK3SFXK6MYvegktU3u8kMeWhNbJTKY63HpPiGfxZcedQrSQ=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2019 10:34:21.7641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b85811c-c757-490c-91c1-08d75224684a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5066
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwNLApKNkl72Wy0e6O+y5NOzqaHS2uIq08CitOENDfA=;
 b=qyYw51jIRqHS3M75guWYLGoq3R0k0OelhTBsqbEbij1wgXcotnO2ia1p1uY7iH0PhYIHDmbaEpnChU1bZGfxgc1M33nQ4r45n82Vqse4N6zbME2xatHo2kZMp2ek4Rgqo9Lj6EJsAk61+ESk9FcNb/nwPdDiXSWrEOIcpPjGMIE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XwNLApKNkl72Wy0e6O+y5NOzqaHS2uIq08CitOENDfA=;
 b=qyYw51jIRqHS3M75guWYLGoq3R0k0OelhTBsqbEbij1wgXcotnO2ia1p1uY7iH0PhYIHDmbaEpnChU1bZGfxgc1M33nQ4r45n82Vqse4N6zbME2xatHo2kZMp2ek4Rgqo9Lj6EJsAk61+ESk9FcNb/nwPdDiXSWrEOIcpPjGMIE=
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>, "Oscar
 Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>, "Tiannan Zhu \(Arm
 Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
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

QWRkIGEgbmV3IGhlbHBlciBmdW5jdGlvbiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkg
Zm9yIGRyaXZlciB0bwpjb252ZXJ0IFMzMS4zMiBzaWduLW1hZ25pdHVkZSB0byBRbS5uIDIncyBj
b21wbGVtZW50IHRoYXQgc3VwcG9ydGVkIGJ5CmhhcmR3YXJlLgoKVjQ6IEFkZHJlc3MgTWloYWks
IERhbmllbCBhbmQgSWxpYSdzIHJldmlldyBjb21tZW50cy4KVjU6IEluY2x1ZGVzIHRoZSBzaWdu
IGJpdCBpbiB0aGUgdmFsdWUgb2YgbSAoUW0ubikuCgpTaWduZWQtb2ZmLWJ5OiBqYW1lcyBxaWFu
IHdhbmcgKEFybSBUZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+ClJl
dmlld2VkLWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+ClJl
dmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiBpbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oICAgICB8ICAyICsrCiAyIGZpbGVz
IGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2NvbG9yX21nbXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCmluZGV4
IDRjZTVjNmQ4ZGU5OS4uZDMxM2YxOTRmMWVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2NvbG9yX21nbXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwpA
QCAtMTMyLDYgKzEzMiwzMyBAQCB1aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4dHJhY3QodWludDMy
X3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbikKIH0KIEVYUE9SVF9TWU1CT0wo
ZHJtX2NvbG9yX2x1dF9leHRyYWN0KTsKIAorLyoqCisgKiBkcm1fY29sb3JfY3RtX3MzMV8zMl90
b19xbV9uCisgKgorICogQHVzZXJfaW5wdXQ6IGlucHV0IHZhbHVlCisgKiBAbTogbnVtYmVyIG9m
IGludGVnZXIgYml0cywgaW5jbHVkZSB0aGUgc2lnbi1iaXQsIHN1cHBvcnQgcmFuZ2UgaXMgWzEs
IDMyXQorICogQG46IG51bWJlciBvZiBmcmFjdGlvbmFsIGJpdHMsIG9ubHkgc3VwcG9ydCBuIDw9
IDMyCisgKgorICogQ29udmVydCBhbmQgY2xhbXAgUzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIFFt
Lm4gKHNpZ25lZCAyJ3MgY29tcGxlbWVudCkuIFRoZQorICogaGlnaGVyIGJpdHMgdGhhdCBhYm92
ZSBtICsgbiBhcmUgY2xlYXJlZCBvciBlcXVhbCB0byBzaWduLWJpdCBCSVQobStuKS4KKyAqLwor
dWludDY0X3QgZHJtX2NvbG9yX2N0bV9zMzFfMzJfdG9fcW1fbih1aW50NjRfdCB1c2VyX2lucHV0
LAorCQkJCSAgICAgIHVpbnQzMl90IG0sIHVpbnQzMl90IG4pCit7CisJdTY0IG1hZyA9ICh1c2Vy
X2lucHV0ICYgfkJJVF9VTEwoNjMpKSA+PiAoMzIgLSBuKTsKKwlib29sIG5lZ2F0aXZlID0gISEo
dXNlcl9pbnB1dCAmIEJJVF9VTEwoNjMpKTsKKwlzNjQgdmFsOworCisJV0FSTl9PTihtIDwgMSB8
fCBtID4gMzIgfHwgbiA+IDMyKTsKKworCS8qIHRoZSByYW5nZSBvZiBzaWduZWQgMidzIGNvbXBs
ZW1lbnQgaXMgWy0yXihtLTEpLCAyXihtLTEpIC0gMl4tbl0gKi8KKwl2YWwgPSBjbGFtcF92YWwo
bWFnLCAwLCBuZWdhdGl2ZSA/CisJCQkJQklUX1VMTChuICsgbSAtIDEpIDogQklUX1VMTChuICsg
bSAtIDEpIC0gMSk7CisKKwlyZXR1cm4gbmVnYXRpdmUgPyAtdmFsIDogdmFsOworfQorRVhQT1JU
X1NZTUJPTChkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKTsKKwogLyoqCiAgKiBkcm1fY3J0
Y19lbmFibGVfY29sb3JfbWdtdCAtIGVuYWJsZSBjb2xvciBtYW5hZ2VtZW50IHByb3BlcnRpZXMK
ICAqIEBjcnRjOiBEUk0gQ1JUQwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21n
bXQuaCBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKaW5kZXggZDFjNjYyZDkyYWI3Li42
MGZlYTU1MDE4ODYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKKysr
IGIvaW5jbHVkZS9kcm0vZHJtX2NvbG9yX21nbXQuaApAQCAtMzAsNiArMzAsOCBAQCBzdHJ1Y3Qg
ZHJtX2NydGM7CiBzdHJ1Y3QgZHJtX3BsYW5lOwogCiB1aW50MzJfdCBkcm1fY29sb3JfbHV0X2V4
dHJhY3QodWludDMyX3QgdXNlcl9pbnB1dCwgdWludDMyX3QgYml0X3ByZWNpc2lvbik7Cit1aW50
NjRfdCBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKHVpbnQ2NF90IHVzZXJfaW5wdXQsCisJ
CQkJICAgICAgdWludDMyX3QgbSwgdWludDMyX3Qgbik7CiAKIHZvaWQgZHJtX2NydGNfZW5hYmxl
X2NvbG9yX21nbXQoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQkJCXVpbnQgZGVnYW1tYV9sdXRf
c2l6ZSwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
