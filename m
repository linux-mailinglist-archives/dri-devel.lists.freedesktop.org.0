Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCC69DEB7
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 09:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87287897DC;
	Tue, 27 Aug 2019 07:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70108.outbound.protection.outlook.com [40.107.7.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12A36E2F5
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 19:59:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lIn7ndJNEyECxfxfEPcAnWmXHC47wB2l08anrxiEkkzXdtZBwn6bn62BOVA5HOBGy/jZ+sU9GVBPVcCEyhDh1RCqArRALPBJfaxyumOUQ6vIYwlrzd6CJM1r0A4l1+i0ZnowCrx6fIOImwSdexqDXUgvnK7NRoX5svBuUBf1j33zu5m6qmqZoA1tgmwfv+YDh4hqpGAXwrzht0Sb5zbGoN/1PtCaxsp8NPjbcF26llq+KW001Mnm1t/If6VKdr2D02aSDDrjZzMOuxArG0k2czNEoNVpKx0lKCvvPtbEDzvbat1JOODlaegStPDNsRWQkYt9qXqoQD7TDhcd73OBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MbhNTXPO54Q94aVZE1Dy3M9rRyzC1l5DJov7oEsDgs=;
 b=EY0xTIaWJY3nWYx0eqXqmUVOf7nYFYZYFCxUnGj9LBpUtATnXLgZM3qx3KDCd33X+i+9ERI3X2bWDzzdLiHDH6rTc4dZuyKxrm7e8eLpI2FIIP8phuCBJaoNjGa/nMegn9ZaFu8kv+TLIPrexUkojXhO4VTSIfaRUkpynT1yVtfxCG+s5SPVffatEa7bbta2OSOt01rniRYgO3v5Iy510wT3yXsc6fNJrlGCiXuRSvioeVLFXjo7MjLE96UBZ1c3rpqvrfD0+T2UoXEj7CLsyLT/5zNHjM6PSnCLV+n85v/USY6TF9h6kf9p9ugrwXhpFEVk7TXb7S5F7m9bgVnIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3340.eurprd02.prod.outlook.com (52.134.67.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 26 Aug 2019 19:59:02 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 19:59:02 +0000
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 3/3] fbdev: fbmem: avoid exporting fb_center_logo
Thread-Topic: [PATCH v2 3/3] fbdev: fbmem: avoid exporting fb_center_logo
Thread-Index: AQHVXEi1s/RzebcL0EaG+mipfctuhg==
Date: Mon, 26 Aug 2019 19:59:02 +0000
Message-ID: <20190826195740.29415-4-peda@axentia.se>
References: <20190826195740.29415-1-peda@axentia.se>
In-Reply-To: <20190826195740.29415-1-peda@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.11.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0901CA0054.eurprd09.prod.outlook.com
 (2603:10a6:3:45::22) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8dd4ea91-4e4a-483b-546f-08d72a5fd789
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3340; 
x-ms-traffictypediagnostic: DB3PR0202MB3340:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB3340961782A9046222A5BFDFBCA10@DB3PR0202MB3340.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(366004)(396003)(39830400003)(136003)(189003)(199004)(8936002)(256004)(316002)(54906003)(26005)(476003)(2616005)(99286004)(102836004)(76176011)(386003)(6506007)(4744005)(66066001)(52116002)(5640700003)(508600001)(186003)(6436002)(486006)(66946007)(66476007)(66446008)(36756003)(64756008)(66556008)(2351001)(1076003)(6486002)(6916009)(2906002)(50226002)(86362001)(71200400001)(71190400001)(2501003)(53936002)(6512007)(4326008)(25786009)(11346002)(446003)(3846002)(6116002)(305945005)(14454004)(81156014)(81166006)(14444005)(5660300002)(7736002)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3340;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vNp2caZncq4smv0/uWsmT+TZHCmJebTsosLmLCEs0zS7ME7nqAs3ldx52jjWPdFwIH5RPu0x1LfEpEgzrL0LKjXX+BF5Lk8mtxaYg6VI+gXS8vK374uV4N34SY0+cUCOfruKHs99+DiuYUG0oiXMmjAnoM4E8lbGEg0EqDen6K77/1GdtSg+io0x/EsyJ1u2zACiaFyNGUAkbcWTxfLCYDx5RIoiT2qblTnVgz8DjNm2kIgEJ8oZyXpPWG5Ka87sfQwtfOXea+8qkWyzbFduVHVR9C/aj4vJwa8udcqrs1gs0keHdLGXAYlFtcAMhk573DQZsFsqWxlsgGB9H8jn4+QaX28JoLdfGiCawHhFm/Zw9hAMAIw5tEfYJbjcjqs+eOXUBjm+bSc6lZ2AeCLazvip2VANuh0WPVexx9gVeHI=
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd4ea91-4e4a-483b-546f-08d72a5fd789
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 19:59:02.5094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zCnlJx5ClcUIro4NIuPpWNtCl4f1jcwfY1daPzEgRUq03i5DwMr9Q1Tc7KIkCcAX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3340
X-Mailman-Approved-At: Tue, 27 Aug 2019 07:29:19 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1MbhNTXPO54Q94aVZE1Dy3M9rRyzC1l5DJov7oEsDgs=;
 b=ojnB0ZJIxq5VoegcD6W9xPD5mNoluM8SvdzH/ppJzOuc5kQ4hkI8MZmMVZX+ntz/vod0aUQvXPOCdmcEygMZyD72di0PxZ3YtKMmUJ2PF8CffaQkFWJDjuchcPhz9VDJrrZb6jZLMnK9HCmBwQEi1jOhu/HM5TR5POvijssmH9g=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Matthew Wilcox <willy@infradead.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHZhcmlhYmxlIGlzIG9ubHkgZXZlciB1c2VkIGZyb20gZmJjb24uYyB3aGljaCBpcyBsaW5r
ZWQgaW50byB0aGUKc2FtZSBtb2R1bGUuIFRoZXJlZm9yZSwgdGhlIGV4cG9ydCBpcyBub3QgbmVl
ZGVkLgoKU2lnbmVkLW9mZi1ieTogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4KLS0tCiBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0u
YyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCmluZGV4IGE3ZDgwMjJkYjUxNi4u
MTdlMjUwYTUxNWIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0u
YworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwpAQCAtNTQsNyArNTQsNiBA
QCBpbnQgbnVtX3JlZ2lzdGVyZWRfZmIgX19yZWFkX21vc3RseTsKIEVYUE9SVF9TWU1CT0wobnVt
X3JlZ2lzdGVyZWRfZmIpOwogCiBib29sIGZiX2NlbnRlcl9sb2dvIF9fcmVhZF9tb3N0bHk7Ci1F
WFBPUlRfU1lNQk9MKGZiX2NlbnRlcl9sb2dvKTsKIAogdW5zaWduZWQgaW50IGZiX2xvZ29fY291
bnQgX19yZWFkX21vc3RseTsKIAotLSAKMi4xMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
