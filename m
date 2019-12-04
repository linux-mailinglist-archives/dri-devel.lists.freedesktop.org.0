Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC36112A9B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 12:49:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949016F484;
	Wed,  4 Dec 2019 11:48:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40077.outbound.protection.outlook.com [40.107.4.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941226F508
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 11:48:37 +0000 (UTC)
Received: from VI1PR08CA0174.eurprd08.prod.outlook.com (2603:10a6:800:d1::28)
 by VI1PR0802MB2560.eurprd08.prod.outlook.com (2603:10a6:800:ad::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.22; Wed, 4 Dec
 2019 11:48:34 +0000
Received: from AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e08::201) by VI1PR08CA0174.outlook.office365.com
 (2603:10a6:800:d1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13 via Frontend
 Transport; Wed, 4 Dec 2019 11:48:34 +0000
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT061.mail.protection.outlook.com (10.152.16.247) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18 via Frontend Transport; Wed, 4 Dec 2019 11:48:33 +0000
Received: ("Tessian outbound a8ced1463995:v37");
 Wed, 04 Dec 2019 11:48:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0e36a23b3ed79946
X-CR-MTA-TID: 64aa7808
Received: from 27b0b5ea6d36.5
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8B1B234E-B987-442C-9429-D3644B9B857A.1; 
 Wed, 04 Dec 2019 11:48:27 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27b0b5ea6d36.5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 Dec 2019 11:48:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWIS3Prj/Wl+7ArLRvPs0nzaBXQ3fh9Lz+jV/WFsxjiCG6sRN0xlhru4rW74lNNydb6PzBlhULR3QToZD0vIgshrvxmKu0gXRgiRi8kWM+76Aaf6cLn35/g+ht5jwOb+fahj308ffucWwLZqNrrEALCEnQThF8Fkf++Xzvhr0PnaKTySTW90+wRaCNuXRkn/lKFuxfTO53V5N2hVVdAoycz1GDbRlLGFoLK3HY8RIuRbx261yyyQ1X5g54Up5MvynEl9IfMRY0GJCqp/PB1VcGmu02YUFdiYf3gOFytVM6adsnZc+9duVF2aR9fQqnNJoWBngMrRHwqeHdBU3CrKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=G/MYzy/kllgVvDPOe2HzhAl0KvBJYdbiafhlBz8KwBgis4hgATC6cssvz4Txg9R+RnnyVM69cVkdmRIiaQZ78hNKnOAzKajGRmPw1HL7Ple/89t5sLWiTqwtCG44tkm4s8JqG37UcK97BTnEtXLUYabIO/lZp4Sl3BqO8sNMVjp/AkPwq4cbWNK3kCpvWSWyeEdhPpLHMrirKDmPXy4cXu7t1dQQjzO3UjDxjcenV2VvaB1Ao9rGMDNqz7CD0HXgL8ptLo+1v30kn7zkDol9UGTwLYkWHlDlmHFH3IJyZRhOj7wSHdl8JiOwWeN8H+5Y4VCdGdn+ky7ZlPDysctMoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com (20.178.127.92) by
 VI1PR08MB4624.eurprd08.prod.outlook.com (20.178.13.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.17; Wed, 4 Dec 2019 11:48:24 +0000
Received: from VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d]) by VI1PR08MB4078.eurprd08.prod.outlook.com
 ([fe80::8191:f0ac:574a:d24d%3]) with mapi id 15.20.2495.014; Wed, 4 Dec 2019
 11:48:24 +0000
From: Mihail Atanassov <Mihail.Atanassov@arm.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 26/28] drm: rcar-du: lvds: Don't set drm_bridge private
 pointer
Thread-Topic: [PATCH v2 26/28] drm: rcar-du: lvds: Don't set drm_bridge
 private pointer
Thread-Index: AQHVqpi8ZpAv1tSEIUSOt4HDPKXKpw==
Date: Wed, 4 Dec 2019 11:48:24 +0000
Message-ID: <20191204114732.28514-27-mihail.atanassov@arm.com>
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
X-MS-Office365-Filtering-Correlation-Id: 057e4e95-a06f-4c92-0ca4-08d778afe43e
X-MS-TrafficTypeDiagnostic: VI1PR08MB4624:|VI1PR08MB4624:|VI1PR0802MB2560:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2560ACE0F8667A9E9D1BDD018F5D0@VI1PR0802MB2560.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:546;OLM:546;
x-forefront-prvs: 0241D5F98C
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(199004)(189003)(2351001)(305945005)(316002)(6436002)(81166006)(7736002)(6916009)(4326008)(186003)(99286004)(6486002)(66446008)(5640700003)(4744005)(66476007)(1076003)(66556008)(54906003)(2501003)(5660300002)(66946007)(64756008)(6512007)(86362001)(11346002)(2906002)(44832011)(2616005)(14454004)(50226002)(6506007)(36756003)(25786009)(81156014)(8676002)(3846002)(71190400001)(52116002)(26005)(478600001)(71200400001)(8936002)(102836004)(6116002)(14444005)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB4624;
 H:VI1PR08MB4078.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: rXWJ51sHT7p7ufAIjU70oDvsNmNKPCuXNN9HZ4iRfgLp8oUpIa38H+3tS7x83X3BwzSvsRPCd2CigFhgDd6Kin86OfEhrb51NliO5I9W0Pv+mMx1ewq5mWadCdAFibikW2z1/o2qAMuSXg/fI+ObsHYX1ICXE+tdhT1l3cCV6JxHaTYza5t11eVUXe09lKp6MIyio3befiKWhhzjtaTVsUzFYbqdgSd6R3F+j+V4MJllKmS/XFJgjDMGanKxaAYlxzukPEXwqaXZApDJJMCbmi9BdrqVIEdm7L34ZOmkF4p3caXmp7O5mpADSTy6QQOWTrWbwZ7FJqfhAXNK3UXGm4p+VWFaLHHnYbKk0CSrfebn/r0D6thEQzQyZ0IkFudNjMX/7rjpCodz61vvy/RLapOsm9Uvfr3S4gg+XPZwDdbMUcUGWYyToywDipgRzyBc
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4624
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Mihail.Atanassov@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(199004)(189003)(23756003)(3846002)(70586007)(36756003)(4744005)(99286004)(2501003)(498600001)(2351001)(2906002)(2616005)(6116002)(86362001)(5660300002)(1076003)(50466002)(11346002)(102836004)(26005)(186003)(76176011)(336012)(356004)(6506007)(14444005)(81156014)(81166006)(25786009)(6512007)(36906005)(305945005)(107886003)(6486002)(8746002)(8936002)(50226002)(8676002)(76130400001)(26826003)(54906003)(7736002)(22756006)(70206006)(5640700003)(4326008)(14454004)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR0802MB2560;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:Pass; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 49d71ba9-6f4f-436d-e11f-08d778afde7a
NoDisclaimer: True
X-Forefront-PRVS: 0241D5F98C
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eLeMAt/TfrbKy/uf0IIE97O/14Oq2saWDi9xKG8pGkvZqhWJ+PyAthnZCrctBNlacr2Fg/0WkJXgobmoZ251LeizQjcDxm3jrlYLy4Oshbnc/58dmxtM8J9vQApRRn/zjrAXIegiYvuNUkp5F00EMSOS3z0jXqnCoi/MrIddS151gxMdNLQVdv5sRcmw83MoRr2f6zuoIYbceJPnfq8XUPevAGhGaXpr1dscq0hcjmwLFRkjL4HfM/jCBSVrPhQeeQ4Ah8GR59L8o2fmX006vgENfJZr06mMpn4hfcjRoa9k2UNQwKJhoV2T90wm7ww5n1iLLaxesVk4UFVA4z3OopFBT2bTfCik97DgKW3cPKueQ+6jtYlzdIG8NAMZSwAW0vYjFaMqDhXJH+eb8L9rIC358o+sZ4Hqx2/RP9jJmOYj0HRYo30C3xqgcun8Ds6a
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2019 11:48:33.9455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 057e4e95-a06f-4c92-0ca4-08d778afe43e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2560
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=3aHsOV1DMk5dYZFhEbVHin+dXuT+2boCnq7JIDurPU75G6OQeWBqpeOqITEG9qMJnYUJFtXhOyvR9fRi4mMRBBMqmtCNe46jsf2HaIW/OX5MJyI0syfBzskm57Hwqs+ukhZk+nhucoRvWxLjBDarqZT7gpNGdiLvl1A64alYaIs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXiSa2cDPynqi1pZWZTQXR63peA1QHF+7CCWR6/itq8=;
 b=3aHsOV1DMk5dYZFhEbVHin+dXuT+2boCnq7JIDurPU75G6OQeWBqpeOqITEG9qMJnYUJFtXhOyvR9fRi4mMRBBMqmtCNe46jsf2HaIW/OX5MJyI0syfBzskm57Hwqs+ukhZk+nhucoRvWxLjBDarqZT7gpNGdiLvl1A64alYaIs=
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2U6IGl0J3Mgbm90IHVzZWQgYW55d2hlcmUuCgpTaWduZWQtb2Zm
LWJ5OiBNaWhhaWwgQXRhbmFzc292IDxtaWhhaWwuYXRhbmFzc292QGFybS5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9sdmRzLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZk
cy5jCmluZGV4IGFjMWYyOWJhY2ZjYi4uMTY4YTcxOGNiY2JkIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2x2ZHMuYwpAQCAtODgyLDcgKzg4Miw3IEBAIHN0YXRpYyBpbnQgcmNhcl9sdmRzX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCXJldHVybiByZXQ7CiAKIAlkcm1f
YnJpZGdlX2luaXQoJmx2ZHMtPmJyaWRnZSwgJnBkZXYtPmRldiwgJnJjYXJfbHZkc19icmlkZ2Vf
b3BzLAotCQkJTlVMTCwgbHZkcyk7CisJCQlOVUxMLCBOVUxMKTsKIAogCW1lbSA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7CiAJbHZkcy0+bW1pbyA9IGRl
dm1faW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCBtZW0pOwotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
