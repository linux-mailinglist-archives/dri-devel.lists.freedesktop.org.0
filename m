Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EADEBC8B1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 15:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B426EA31;
	Tue, 24 Sep 2019 13:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D199A6EA31
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 13:17:19 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ODHCJI037532;
 Tue, 24 Sep 2019 08:17:12 -0500
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8ODHCB4073703
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Sep 2019 08:17:12 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 24
 Sep 2019 08:17:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 24 Sep 2019 08:17:05 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ODH94R061580;
 Tue, 24 Sep 2019 08:17:09 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>, Jyri Sarha
 <jsarha@ti.com>
Subject: [PATCH] drm/bridge: tc358767: fix max_tu_symbol value
Date: Tue, 24 Sep 2019 16:17:02 +0300
Message-ID: <20190924131702.9988-1-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1569331032;
 bh=YC5eXFbAHe/ZMGhIbZ0uTd7mLlx0Uwr2lSGQdf63/pw=;
 h=From:To:CC:Subject:Date;
 b=KKkskdeauCnWMbdxj3RmhSE7R6CKyXBkk+5i1A7dSbUeDDo+Xx2YQIxzTf+ynveh6
 +CHrI06O9bfh3cVAmDJT2sInjwUj1aMPIJfqAAeT0zyKdmO4CpoxggKZFxCnbiYYf9
 R6Tqm6nVdTmogKlwleKSxHsTrr26JIWhEozOwmx0=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bWF4X3R1X3N5bWJvbCB3YXMgcHJvZ3JhbW1lZCB0byBUVV9TSVpFX1JFQ09NTUVOREVEIC0gMSwg
d2hpY2ggaXMgbm90CndoYXQgdGhlIHNwZWMgc2F5cy4gVGhlIHNwZWMgc2F5czoKCnJvdW5kdXAg
KChpbnB1dCBhY3RpdmUgdmlkZW8gYmFuZHdpZHRoIGluIGJ5dGVzL291dHB1dCBhY3RpdmUgdmlk
ZW8KYmFuZHdpZHRoIGluIGJ5dGVzKSAqIHR1X3NpemUpCgpJdCBpcyBub3QgcXVpdGUgY2xlYXIg
d2hhdCB0aGUgYWJvdmUgbWVhbnMsIGJ1dCBjYWxjdWxhdGluZwptYXhfdHVfc3ltYm9sID0gKGlu
cHV0IEJwcyAvIG91dHB1dCBCcHMpICogdHVfc2l6ZSBzZWVtcyB0byB3b3JrIGFuZApmaXhlcyB0
aGUgaXNzdWVzIHNlZW4uCgpUaGlzIGZpeGVzIGFydGlmYWN0cyBpbiBzb21lIHZpZGVvbW9kZXMg
KGUuZy4gMTAyNHg3NjhANjAgb24gMi1sYW5lcyAmCjEuNjJHYnBzIHdhcyBwcmV0dHkgYmFkIGZv
ciBtZSkuCgpTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGku
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDcgKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYwppbmRleCAxM2FkZTI4YTM2YTguLmI2YWExYmQ0N2UxZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYwpAQCAtNjc3LDYgKzY3Nyw4IEBAIHN0YXRpYyBpbnQgdGNf
c2V0X3ZpZGVvX21vZGUoc3RydWN0IHRjX2RhdGEgKnRjLAogCWludCB1cHBlcl9tYXJnaW4gPSBt
b2RlLT52dG90YWwgLSBtb2RlLT52c3luY19lbmQ7CiAJaW50IGxvd2VyX21hcmdpbiA9IG1vZGUt
PnZzeW5jX3N0YXJ0IC0gbW9kZS0+dmRpc3BsYXk7CiAJaW50IHZzeW5jX2xlbiA9IG1vZGUtPnZz
eW5jX2VuZCAtIG1vZGUtPnZzeW5jX3N0YXJ0OworCXUzMiBiaXRzX3Blcl9waXhlbCA9IDI0Owor
CXUzMiBpbl9idywgb3V0X2J3OwogCiAJLyoKIAkgKiBSZWNvbW1lbmRlZCBtYXhpbXVtIG51bWJl
ciBvZiBzeW1ib2xzIHRyYW5zZmVycmVkIGluIGEgdHJhbnNmZXIgdW5pdDoKQEAgLTY4NCw3ICs2
ODYsMTAgQEAgc3RhdGljIGludCB0Y19zZXRfdmlkZW9fbW9kZShzdHJ1Y3QgdGNfZGF0YSAqdGMs
CiAJICogICAgICAgICAgICAgIChvdXRwdXQgYWN0aXZlIHZpZGVvIGJhbmR3aWR0aCBpbiBieXRl
cykpCiAJICogTXVzdCBiZSBsZXNzIHRoYW4gdHVfc2l6ZS4KIAkgKi8KLQltYXhfdHVfc3ltYm9s
ID0gVFVfU0laRV9SRUNPTU1FTkRFRCAtIDE7CisKKwlpbl9idyA9IG1vZGUtPmNsb2NrICogYml0
c19wZXJfcGl4ZWwgLyA4OworCW91dF9idyA9IHRjLT5saW5rLmJhc2UubnVtX2xhbmVzICogdGMt
PmxpbmsuYmFzZS5yYXRlOworCW1heF90dV9zeW1ib2wgPSBESVZfUk9VTkRfVVAoaW5fYncgKiBU
VV9TSVpFX1JFQ09NTUVOREVELCBvdXRfYncpOwogCiAJZGV2X2RiZyh0Yy0+ZGV2LCAic2V0IG1v
ZGUgJWR4JWRcbiIsCiAJCW1vZGUtPmhkaXNwbGF5LCBtb2RlLT52ZGlzcGxheSk7Ci0tIApUZXhh
cyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5r
aS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTog
SGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
