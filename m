Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFF99FD0A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E6189CF7;
	Wed, 28 Aug 2019 08:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130125.outbound.protection.outlook.com [40.107.13.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9747989A8C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:09:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MNodGOzrxlgZMqXBjUXDPimj6297jpCDIAAGQ3pmnDqW+AMp//Ja/HHEDb1HMZoqI1GzyQY9711y3PuDwMF3fxJWn+VVFIYPXaFEb++ktheePDkaA0JUc3YYFPf7DsFLlNqkFJ1FmgbzJp3U24ws8MV+g1zfCR8FLS01sIA4nu+LdVrprGlqzlUnFSZ/fi4nfJ17WgeeOese9UJOeZHW1L877Zui5oqwahyi+HEc2tCMT9kuCl7Q56HBSv+AS+gwsC4Y3QOqTW03QGBpQCDd4KAPu44/Cpm0ku5aHm1U1T1xaYPMHVDzA3SlsMOEp5O8d2ZGmgwOIs19vRc6OHpoxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91VOH+vDNas5HY7lNAsbI7PTV7qG4iDbOpjyyXSQXfY=;
 b=H31bJCqLNvG4JJRSaJ+nYlvRD96bnFxW20DK68nfuJj4sEAJZQlR9DUgd2XciJE5crcJzX1w3E02ZKkL66ocC6/n40/uD2udBRmVWbk20djAwf3mGwWXwIG22IMs0K3uWfduaBtKT5oMvRE+PXpUah5vcnBFxrawF9jJMeeIj0R/GeUs3uMIB3EOKxW/i/nIjkxwAZx6PwsjXy0MyM5F7efxjD7Tuf6YQVbu5E9La42tWNCk8DRMltWceuZDWRBIqz83lgH1vp1OBZm+L4DEnc6ot7505L30z1iaRNHe/KyORhSUW4ZoC6wx2idxGCnn+/kkomErkr8LjpppmfEiew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3465.eurprd02.prod.outlook.com (52.134.65.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 27 Aug 2019 11:09:26 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.023; Tue, 27 Aug 2019
 11:09:26 +0000
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] fbdev: fbmem: avoid exporting fb_center_logo
Thread-Topic: [PATCH v3 3/3] fbdev: fbmem: avoid exporting fb_center_logo
Thread-Index: AQHVXMfjb9HuvMXdNUO0R8iyHBP+3g==
Date: Tue, 27 Aug 2019 11:09:26 +0000
Message-ID: <20190827110854.12574-4-peda@axentia.se>
References: <20190827110854.12574-1-peda@axentia.se>
In-Reply-To: <20190827110854.12574-1-peda@axentia.se>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.11.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0802CA0012.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::22) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7bd2115-667c-4dbe-1add-08d72adf05ce
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3465; 
x-ms-traffictypediagnostic: DB3PR0202MB3465:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB34654718A140BDCEE03C488ABCA00@DB3PR0202MB3465.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1775;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(366004)(376002)(346002)(396003)(136003)(189003)(199004)(508600001)(99286004)(186003)(25786009)(6436002)(53936002)(2351001)(5660300002)(26005)(7736002)(2501003)(256004)(6116002)(8936002)(305945005)(54906003)(4744005)(1076003)(81166006)(81156014)(6916009)(3846002)(14444005)(8676002)(50226002)(386003)(6506007)(66066001)(66946007)(6512007)(52116002)(76176011)(102836004)(36756003)(446003)(486006)(11346002)(2616005)(6486002)(316002)(4326008)(71190400001)(2906002)(86362001)(14454004)(5640700003)(476003)(71200400001)(66476007)(66446008)(66556008)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3465;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Jj8d+sWO9ZcXy2Ngr7R2Ejwz3pp0jADgPHJuhRcUoc1SLRyiAw7wWmwlZajtDF0NA2cbNHbUzk6UjCXHJXDVksojOqVJ7Mioxce+7TRYdQdd6+8Job/0kVTDO6fFPi/ovu06RMlCrpMypIxvNz0HgpZHzJ/HmhuNnNLl1H7LCZcPD8f4AX9dUBqOFLAgm7AwDW4jDPplfFPZS7tntMHm4z1VoOSbikNGJ82SKR+OhZNEoCG6gYTgygZxgUgZLTwoYxw8hx6qGq7dINFQt4GJD8riv8voBuSAJTQyuShPddXdCvZtbc3j8fjdXExOtuF3QomPcIO/HgtF2oYacOfKLaCVZ8t83gX6+KEnf6e4BYwFhF2JuhVL6IXZtQo7JIlpdvudDe/bkV9tWlcAdaT3T2fAXIyUTDyjSJeBSpoqbgk=
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: d7bd2115-667c-4dbe-1add-08d72adf05ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 11:09:26.1960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uy8s3wiwEGlN7NOvh8VgJgSsQUoDC+G2pmMplqYu6nAxjjd/83hQHLNP3Xvvvqgw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3465
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91VOH+vDNas5HY7lNAsbI7PTV7qG4iDbOpjyyXSQXfY=;
 b=bn4m/dWuYJP3NXd5ipuFtGM0ZooAFnGVSRD2GhOMFlqU60o6YQzeX7p8YOl62DETyayQVMgHDdM5dmRhwnR6OsyYcvc5kmzaMVECKzMeUj55Lk/8gVYO0Pb8siaLeywz/dkmrclf5ozLX/EX4ABit9Trg4uKc70ROdXK82f/vpI=
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
 Geert Uytterhoeven <geert@linux-m68k.org>,
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
YyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCmluZGV4IGM3ZGRjYjcyMDI1Yi4u
ZDQ1ZTU5YWMzNTFiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0u
YworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwpAQCAtNTQsNyArNTQsNiBA
QCBpbnQgbnVtX3JlZ2lzdGVyZWRfZmIgX19yZWFkX21vc3RseTsKIEVYUE9SVF9TWU1CT0wobnVt
X3JlZ2lzdGVyZWRfZmIpOwogCiBib29sIGZiX2NlbnRlcl9sb2dvIF9fcmVhZF9tb3N0bHk7Ci1F
WFBPUlRfU1lNQk9MKGZiX2NlbnRlcl9sb2dvKTsKIAogaW50IGZiX2xvZ29fY291bnQgX19yZWFk
X21vc3RseSA9IC0xOwogCi0tIAoyLjExLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
