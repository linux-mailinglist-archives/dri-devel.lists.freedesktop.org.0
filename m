Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D52C143
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:29:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4E889C6E;
	Tue, 28 May 2019 08:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E76E89D02
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Sjqb032200;
 Tue, 28 May 2019 03:28:45 -0500
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8SjAl115148
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:45 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:45 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxul125039;
 Tue, 28 May 2019 03:28:42 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 17/24] drm/bridge: tc358767: remove check for video mode in
 link enable
Date: Tue, 28 May 2019 11:27:40 +0300
Message-ID: <20190528082747.3631-18-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032125;
 bh=37aqo7tEqJe/Zc3BOPvR4eqVx2flaYd7SUmzoNetNZ4=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZfW+Nry7PMfQEN5tKQU/xk1p7qGp4hfKsmEC+CQtZj+jB60Cf8row0GS5dvjLRVT6
 cXeDzBdDbjRN5iJUXqpaYBrc0sod+4ps7ekH1SzGG5yZ3RhpgT0E9rNwe01yJ/aN+d
 P9VgEKiZCjwC/12TlxWlWSOuPWTKixfh3VtjH3dw=
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

dGNfbWFpbl9saW5rX2VuYWJsZSgpIGNoZWNrcyBpZiB2aWRlb21vZGUgaGFzIGJlZW4gc2V0LCBh
bmQgZmFpbHMgaWYKdGhlcmUncyBubyB2aWRlb21vZGUuIEFzIHRjX21haW5fbGlua19lbmFibGUo
KSBubyBsb25nZXIgZGVwZW5kcyBvbiB0aGUKdmlkZW9tb2RlLCB3ZSBjYW4gZHJvcCB0aGUgY2hl
Y2suCgpBbHNvLCB3aGlsZSB0Y19zdHJlYW1fZW5hYmxlKCkgZG9lcyBkZXBlbmQgb24gdGhlIHZp
ZGVvbW9kZSwgd2UgY2FuCmV4cGVjdCB0aGF0IGEgbW9kZSBoYXMgYmVlbiBzZXQgYmVmb3JlIGRy
bV9icmlkZ2VfZnVuY3MuZW5hYmxlIGlzCmNhbGxlZCwgc28gd2UgZG9uJ3QgbmVlZCB0aGUgY2hl
Y2sgdGhlcmUgZWl0aGVyLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFs
a2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3Vu
Zy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwgNCAtLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMK
aW5kZXggMTBhOWI0NmRlNWYxLi42MDRlNTRiOTBiNzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMKQEAgLTc3MywxMCArNzczLDYgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtfZW5hYmxl
KHN0cnVjdCB0Y19kYXRhICp0YykKIAlpbnQgcmV0OwogCXU4IHRtcFs4XTsKIAotCS8qIGRpc3Bs
YXkgbW9kZSBzaG91bGQgYmUgc2V0IGF0IHRoaXMgcG9pbnQgKi8KLQlpZiAoIXRjLT5tb2RlKQot
CQlyZXR1cm4gLUVJTlZBTDsKLQogCWRldl9kYmcodGMtPmRldiwgImxpbmsgZW5hYmxlXG4iKTsK
IAogCXRjX3JlYWQoRFAwQ1RMLCAmdmFsdWUpOwotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFu
ZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNz
IElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
