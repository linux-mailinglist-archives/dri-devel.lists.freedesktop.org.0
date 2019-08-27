Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B979FCF3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BCB89973;
	Wed, 28 Aug 2019 08:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130125.outbound.protection.outlook.com [40.107.13.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A387389A8C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:09:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfyamY94iHGd1cO+JMcEeK1F1gkRhpjaFzRioXavbMs7WEOFrJcJvS7RVr75yyvgSN9w8oaXmGMzEOjmoV3U97DzS/6TivRrC0QTUmsrjsGpNrWlv26bqUhtHOwr2wOzJhAEFE4t9amvfZDdoPyfLq3vMPpJU/ll/bEbSruDHnqkfgzUYrIXK8k4ZRhuZ7MbFESiLhYsAvDQQyoVHFuRTUCZLy2jyUf9X8nt2RHWyCzjohnZfXj3iwzuK5m1xnIMr5GFLwy733kucpsEICEu07+WHzfgVHbnDhtmm0+vU5ic7ATHXTpAL1Nj/f3D/Rln5Hl9P8HiM60FRFFu4eTp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRqjE0WZVuRCuSo2PfQxoEd4jTslFS6OgAsaH9Mtu1o=;
 b=Dx4n4RZKo44b8p/IfEMofBrpbGmhTNI9s0IvN8sNHeBW2+4Bt9YQbCWClN7m6y5Lo8Up9c2eV5rXS8h/pa4kOdRaUFBtfgQSC8jjN4Vn6P09zYGkPzOrttjzL1pPsw8EQcdRt13m0TVmnBkyxTOHhY7QUB0OnB/030mlYrcHcaQ8Gq0ZEKozlopeAy74Uwe1quAeXDuzP1OxpN7vHHxfVvgkCVQToVMguU8WQ3pxDPTTvek+rxMZW+174K/BFHY+Ya7yXlBUcFz4S3CMCuiXg8fjoA9TNyusDyLeZuHMLQSV7U6QrGWtLQlP3jAnEzVqKz/QrzldAnn9ChrPE0Nprw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3465.eurprd02.prod.outlook.com (52.134.65.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 27 Aug 2019 11:09:21 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::a0df:d7d9:f95e:f3ea%3]) with mapi id 15.20.2178.023; Tue, 27 Aug 2019
 11:09:21 +0000
From: Peter Rosin <peda@axentia.se>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 2/3] fbdev: fbmem: allow overriding the number of bootup
 logos
Thread-Topic: [PATCH v3 2/3] fbdev: fbmem: allow overriding the number of
 bootup logos
Thread-Index: AQHVXMfgYnRTlyUjn0+AfY7i/XbReA==
Date: Tue, 27 Aug 2019 11:09:21 +0000
Message-ID: <20190827110854.12574-3-peda@axentia.se>
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
x-ms-office365-filtering-correlation-id: 2e726720-34f3-4045-da00-08d72adf0328
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DB3PR0202MB3465; 
x-ms-traffictypediagnostic: DB3PR0202MB3465:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0202MB3465C49B304DAB2F30289C5BBCA00@DB3PR0202MB3465.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39830400003)(366004)(376002)(346002)(396003)(136003)(189003)(199004)(508600001)(99286004)(186003)(25786009)(6436002)(53936002)(2351001)(5660300002)(26005)(7736002)(2501003)(256004)(6116002)(8936002)(305945005)(54906003)(1076003)(81166006)(81156014)(6916009)(5024004)(3846002)(8676002)(50226002)(386003)(6506007)(66066001)(66946007)(6512007)(52116002)(76176011)(102836004)(36756003)(446003)(486006)(11346002)(2616005)(6486002)(316002)(4326008)(71190400001)(2906002)(86362001)(14454004)(5640700003)(476003)(71200400001)(66476007)(66446008)(66556008)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB3PR0202MB3465;
 H:DB3PR0202MB3434.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hf0xrqgkG/U54WB/5TT2us1wSpYiQi2RglkLY8S48bd7SvT3Vl/S47TR67VJQ+tXcVHbYqZBxDdxgMkuffCcPGcqHzPTqNYITxAVlp9m2rlnmUEFpltPH3aCqEVuSpfinIAEeNS2NjOmQThut0ySPUTfOjC84lpUI9io4KS+WFER3VrV2obWWURcU3N633QPErUJu5V4iPDAkyVJ7Qho6QKUR4bE00jS+YsTIJkdctLaM0U9ATzX1lIh4GehyRXq21iWU0HdmVEanQ9nGFTtJRLxHsJF7HPZ6WtfaHAz9x8Ef3jyt3zTY08iylYBhGty6wtBWenpVRfmND9dDaOQgYZfgJjPN7Jg4MLwuFfbZUTcMbuRUgh75nUJh+7odF0tJ7C6nD7+ubsIKdr3zA1gydjioCI54y+J6dcshy1t1Ic=
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e726720-34f3-4045-da00-08d72adf0328
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 11:09:21.7115 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y2xIZUjmmr3A9h7GrLQKyJ3wiWvW6S8oyqNIB6ChpGP1COPcxLUyQnG6mVQgw80W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3465
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axentia.se; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRqjE0WZVuRCuSo2PfQxoEd4jTslFS6OgAsaH9Mtu1o=;
 b=PFrPXl7Q/96EZP9vDnq84iRYJBC5H5Z7uCtx6yq0AQ8Shm+IW+ne2c4xSjJKn0R6aTskhZUsulZF9RD0kWnfr2Iw1kAowKs6bMSMEpEhI6EXzBkHgP+arzEm/mjYIqRsfCzhuAuRmGxwcF0pHPL8uZg6yWnfrK7mVRHAgA3/3Uc=
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

UHJvYmFibHkgbW9zdCB1c2VmdWwgaWYgeW91IHdhbnQgbm8gbG9nbyBhdCBhbGwsIG9yIGlmIHlv
dSBvbmx5IHdhbnQgb25lCmxvZ28gcmVnYXJkbGVzcyBvZiBob3cgbWFueSBDUFUgY29yZXMgeW91
IGhhdmUuCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPgotLS0K
IERvY3VtZW50YXRpb24vZmIvZmJjb24ucnN0ICAgICAgIHwgIDUgKysrKysKIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvY29yZS9mYmNvbi5jIHwgIDcgKysrKysrKwogZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZibWVtLmMgfCAxMiArKysrKysrKystLS0KIGluY2x1ZGUvbGludXgvZmIuaCAgICAgICAg
ICAgICAgIHwgIDEgKwogNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZmIvZmJjb24ucnN0IGIvRG9jdW1l
bnRhdGlvbi9mYi9mYmNvbi5yc3QKaW5kZXggNjViYTQwMjU1MTM3Li5lNTdhM2QxZDA4NWEgMTAw
NjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZmIvZmJjb24ucnN0CisrKyBiL0RvY3VtZW50YXRpb24v
ZmIvZmJjb24ucnN0CkBAIC0xNzQsNiArMTc0LDExIEBAIEMuIEJvb3Qgb3B0aW9ucwogCWRpc3Bs
YXllZCBkdWUgdG8gbXVsdGlwbGUgQ1BVcywgdGhlIGNvbGxlY3RlZCBsaW5lIG9mIGxvZ29zIGlz
IG1vdmVkCiAJYXMgYSB3aG9sZS4KIAorOS4gZmJjb249bG9nby1jb3VudDo8bj4KKworCVRoZSB2
YWx1ZSAnbicgb3ZlcnJpZGVzIHRoZSBudW1iZXIgb2YgYm9vdHVwIGxvZ29zLiAwIGRpc2FibGVz
IHRoZQorCWxvZ28sIGFuZCAtMSBnaXZlcyB0aGUgZGVmYXVsdCB3aGljaCBpcyB0aGUgbnVtYmVy
IG9mIG9ubGluZSBDUFVzLgorCiBDLiBBdHRhY2hpbmcsIERldGFjaGluZyBhbmQgVW5sb2FkaW5n
CiAKIEJlZm9yZSBnb2luZyBvbiB0byBob3cgdG8gYXR0YWNoLCBkZXRhY2ggYW5kIHVubG9hZCB0
aGUgZnJhbWVidWZmZXIgY29uc29sZSwgYW4KZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYmNvbi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiY29uLmMKaW5kZXgg
YzkyMzVhMmY0MmY4Li5iYjZhZTk5NWMyZTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYmNvbi5jCisrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jCkBA
IC01MzYsNiArNTM2LDEzIEBAIHN0YXRpYyBpbnQgX19pbml0IGZiX2NvbnNvbGVfc2V0dXAoY2hh
ciAqdGhpc19vcHQpCiAJCQkJZmJfY2VudGVyX2xvZ28gPSB0cnVlOwogCQkJY29udGludWU7CiAJ
CX0KKworCQlpZiAoIXN0cm5jbXAob3B0aW9ucywgImxvZ28tY291bnQ6IiwgMTEpKSB7CisJCQlv
cHRpb25zICs9IDExOworCQkJaWYgKCpvcHRpb25zKQorCQkJCWZiX2xvZ29fY291bnQgPSBzaW1w
bGVfc3RydG9sKG9wdGlvbnMsICZvcHRpb25zLCAwKTsKKwkJCWNvbnRpbnVlOworCQl9CiAJfQog
CXJldHVybiAxOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVt
LmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwppbmRleCA2NGRkNzMyMDIxZDgu
LmM3ZGRjYjcyMDI1YiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVt
LmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMKQEAgLTU2LDYgKzU2LDgg
QEAgRVhQT1JUX1NZTUJPTChudW1fcmVnaXN0ZXJlZF9mYik7CiBib29sIGZiX2NlbnRlcl9sb2dv
IF9fcmVhZF9tb3N0bHk7CiBFWFBPUlRfU1lNQk9MKGZiX2NlbnRlcl9sb2dvKTsKIAoraW50IGZi
X2xvZ29fY291bnQgX19yZWFkX21vc3RseSA9IC0xOworCiBzdGF0aWMgc3RydWN0IGZiX2luZm8g
KmdldF9mYl9pbmZvKHVuc2lnbmVkIGludCBpZHgpCiB7CiAJc3RydWN0IGZiX2luZm8gKmZiX2lu
Zm87CkBAIC02MjAsNyArNjIyLDcgQEAgaW50IGZiX3ByZXBhcmVfbG9nbyhzdHJ1Y3QgZmJfaW5m
byAqaW5mbywgaW50IHJvdGF0ZSkKIAltZW1zZXQoJmZiX2xvZ28sIDAsIHNpemVvZihzdHJ1Y3Qg
bG9nb19kYXRhKSk7CiAKIAlpZiAoaW5mby0+ZmxhZ3MgJiBGQklORk9fTUlTQ19USUxFQkxJVFRJ
TkcgfHwKLQkgICAgaW5mby0+ZmJvcHMtPm93bmVyKQorCSAgICBpbmZvLT5mYm9wcy0+b3duZXIg
fHwgIWZiX2xvZ29fY291bnQpCiAJCXJldHVybiAwOwogCiAJaWYgKGluZm8tPmZpeC52aXN1YWwg
PT0gRkJfVklTVUFMX0RJUkVDVENPTE9SKSB7CkBAIC02ODYsMTAgKzY4OCwxNCBAQCBpbnQgZmJf
cHJlcGFyZV9sb2dvKHN0cnVjdCBmYl9pbmZvICppbmZvLCBpbnQgcm90YXRlKQogCiBpbnQgZmJf
c2hvd19sb2dvKHN0cnVjdCBmYl9pbmZvICppbmZvLCBpbnQgcm90YXRlKQogeworCXVuc2lnbmVk
IGludCBjb3VudDsKIAlpbnQgeTsKIAotCXkgPSBmYl9zaG93X2xvZ29fbGluZShpbmZvLCByb3Rh
dGUsIGZiX2xvZ28ubG9nbywgMCwKLQkJCSAgICAgIG51bV9vbmxpbmVfY3B1cygpKTsKKwlpZiAo
IWZiX2xvZ29fY291bnQpCisJCXJldHVybiAwOworCisJY291bnQgPSBmYl9sb2dvX2NvdW50IDwg
MCA/IG51bV9vbmxpbmVfY3B1cygpIDogZmJfbG9nb19jb3VudDsKKwl5ID0gZmJfc2hvd19sb2dv
X2xpbmUoaW5mbywgcm90YXRlLCBmYl9sb2dvLmxvZ28sIDAsIGNvdW50KTsKIAl5ID0gZmJfc2hv
d19leHRyYV9sb2dvcyhpbmZvLCB5LCByb3RhdGUpOwogCiAJcmV0dXJuIHk7CmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2ZiLmggYi9pbmNsdWRlL2xpbnV4L2ZiLmgKaW5kZXggMzAzNzcxMjY0
NjQ0Li5lMzdmNzJiMmVmY2EgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZmIuaAorKysgYi9p
bmNsdWRlL2xpbnV4L2ZiLmgKQEAgLTYzMCw2ICs2MzAsNyBAQCBleHRlcm4gaW50IGZiX25ld19t
b2RlbGlzdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7CiBleHRlcm4gc3RydWN0IGZiX2luZm8gKnJl
Z2lzdGVyZWRfZmJbRkJfTUFYXTsKIGV4dGVybiBpbnQgbnVtX3JlZ2lzdGVyZWRfZmI7CiBleHRl
cm4gYm9vbCBmYl9jZW50ZXJfbG9nbzsKK2V4dGVybiBpbnQgZmJfbG9nb19jb3VudDsKIGV4dGVy
biBzdHJ1Y3QgY2xhc3MgKmZiX2NsYXNzOwogCiAjZGVmaW5lIGZvcl9lYWNoX3JlZ2lzdGVyZWRf
ZmIoaSkJCVwKLS0gCjIuMTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
