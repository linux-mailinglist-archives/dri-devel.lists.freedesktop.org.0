Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E2E2C149
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5659589D5F;
	Tue, 28 May 2019 08:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DDB89D40
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Sm8I036820;
 Tue, 28 May 2019 03:28:48 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8SmSP009103
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:48 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:47 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxum125039;
 Tue, 28 May 2019 03:28:45 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 18/24] drm/bridge: tc358767: use bridge mode_valid
Date: Tue, 28 May 2019 11:27:41 +0300
Message-ID: <20190528082747.3631-19-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032128;
 bh=/T1LzXxtauTCa9x+NGjZvKSElcvoWs5REXjGyhKYZg4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=LwPFCaQXQbaOiMVav9CI0OFdgj7forYtSdCQZMkj/zkSYdQCKTuIgr9us1i/seUlK
 eF6YLK77BoAXkXPEyaeacWN996ju7CeXrA4qbB08AUJKqy+CVCtyJtZkwOV22H1lVZ
 TgBoB4Lth4tVlhyareFtyDvkwPTSWzoP0XzpR9D8=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgaGF2ZSB0Y19jb25uZWN0b3JfbW9kZV92YWxpZCgpIHRvIGZpbHRlciBvdXQgdmlkZW9tZG9l
cyB0aGF0IHRoZQp0YzM1ODc2NyBjYW5ub3Qgc3VwcG9ydC4gQXMgaXQgaXMgYSBicmlkZ2UgbGlt
aXRhdGlvbiwgY2hhbmdlIHRoZSBjb2RlCnRvIHVzZSBkcm1fYnJpZGdlX2Z1bmNzJ3MgbW9kZV92
YWxpZCBpbnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2Vp
bmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5j
b20+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgOCAr
KysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggNjA0ZTU0YjkwYjc5Li45ZWJlNzhlOTU2
MmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTExNTQsMTAgKzExNTQsMTAgQEAg
c3RhdGljIGJvb2wgdGNfYnJpZGdlX21vZGVfZml4dXAoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRn
ZSwKIAlyZXR1cm4gdHJ1ZTsKIH0KIAotc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzIHRjX2Nv
bm5lY3Rvcl9tb2RlX3ZhbGlkKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsCi0JCQkJ
ICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCitzdGF0aWMgZW51bSBkcm1fbW9kZV9z
dGF0dXMgdGNfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAorCQkJCQkgIGNv
bnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQogewotCXN0cnVjdCB0Y19kYXRhICp0
YyA9IGNvbm5lY3Rvcl90b190Yyhjb25uZWN0b3IpOworCXN0cnVjdCB0Y19kYXRhICp0YyA9IGJy
aWRnZV90b190YyhicmlkZ2UpOwogCXUzMiByZXEsIGF2YWlsOwogCXUzMiBiaXRzX3Blcl9waXhl
bCA9IDI0OwogCkBAIC0xMjI2LDcgKzEyMjYsNiBAQCB0Y19jb25uZWN0b3JfYmVzdF9lbmNvZGVy
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgdGNfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyA9IHsK
IAkuZ2V0X21vZGVzID0gdGNfY29ubmVjdG9yX2dldF9tb2RlcywKLQkubW9kZV92YWxpZCA9IHRj
X2Nvbm5lY3Rvcl9tb2RlX3ZhbGlkLAogCS5iZXN0X2VuY29kZXIgPSB0Y19jb25uZWN0b3JfYmVz
dF9lbmNvZGVyLAogfTsKIApAQCAtMTI2OSw2ICsxMjY4LDcgQEAgc3RhdGljIGludCB0Y19icmlk
Z2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgZHJtX2JyaWRnZV9mdW5jcyB0Y19icmlkZ2VfZnVuY3MgPSB7CiAJLmF0dGFjaCA9IHRjX2Jy
aWRnZV9hdHRhY2gsCisJLm1vZGVfdmFsaWQgPSB0Y19tb2RlX3ZhbGlkLAogCS5tb2RlX3NldCA9
IHRjX2JyaWRnZV9tb2RlX3NldCwKIAkucHJlX2VuYWJsZSA9IHRjX2JyaWRnZV9wcmVfZW5hYmxl
LAogCS5lbmFibGUgPSB0Y19icmlkZ2VfZW5hYmxlLAotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlu
bGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
