Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266E312DA3
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2004089F35;
	Fri,  3 May 2019 12:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C915D89F31
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CVPs9017408;
 Fri, 3 May 2019 07:31:25 -0500
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CVOLq122183
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:31:24 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:31:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:31:23 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYu2002029;
 Fri, 3 May 2019 07:31:21 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 18/23] drm/bridge: tc358767: use bridge mode_valid
Date: Fri, 3 May 2019 15:29:44 +0300
Message-ID: <20190503122949.12266-19-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886685;
 bh=zj8Fi4Y2vpeyzsQ3IvOFyXwcjt2ofoSu2anFZdJE7cg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=rZSRUJoGn4aI3VClkM55fUrga6+TfRZCKnmWLI71VoSzrK64L8xkH03lwwYLmy5AR
 bACM0ZFVGg569kbWEQ9I2Qhtjuplqodaxrm/EDH7G4J8LDrUG57C6Oo4QZ6u34zB6S
 2hd8UAMXt7jw/Cl4mGzklM/6cAE8tYTjYseEUaZs=
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
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggODFlMTJmMTdiMTYyLi5mMzk1MjhkYmRl
MjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9k
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
