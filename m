Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD577BA63
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340C26E69A;
	Wed, 31 Jul 2019 07:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 390BE6E598
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 15:25:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id h28so44986527lfj.5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 08:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a8k87dhuTxTzS+n3u2Ou7NXh77Uav3wOrh0j/WlwUGo=;
 b=V4DB2NMroFtnLaW/zZpXf7bLuyfjuCSLtqaZo0UBqVeygpLZUIrQDpMsUgApqbDeQV
 FxC/7ShN+Jwnh8Ol171/o72d6IR/eI9RdQwvI7HDcb5/amQzpzt7jMcBNO1MENSLbmh7
 XOLfU6wwcggqmM595FQ1k+e1VUsBVW1ajdAmL/405LhnT0ZwZqRvF6ScVhYput1wy7YU
 2+IGjR2Z68Lg/nXJceIk+oqycey/ivy4+d+Ee2lQlB9Rv1TVovcOhMlQib30X0gvrcmG
 bi968I8wc9dgcsAaWEsXt3dd63nGhG9o3HybGGUHM37FH8FOZ8/xY1dwPUJaW0sEv/ef
 cZlg==
X-Gm-Message-State: APjAAAXpInubjYf0dT3lsmpCOPxaZOt/QFgtooAwYg1jAtiQGdHuA/vb
 Simalr6HS5AzfrU9Hs6x5tx/4Q==
X-Google-Smtp-Source: APXvYqzrh7p3FQO75/hpL7dUe20p/p24BxIUA3XsEMf3aeLRuCyAOWaX12fBPsDhGMCzfbDEd2eHKQ==
X-Received: by 2002:a19:41cc:: with SMTP id
 o195mr10890679lfa.166.1564500336500; 
 Tue, 30 Jul 2019 08:25:36 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.60.36])
 by smtp.gmail.com with ESMTPSA id t5sm13280728ljj.10.2019.07.30.08.25.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 08:25:35 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: b.zolnierkie@samsung.com
Subject: [PATCH v2] video: fbdev: Mark expected switch fall-through
Date: Tue, 30 Jul 2019 17:25:30 +0200
Message-Id: <20190730152530.3055-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a8k87dhuTxTzS+n3u2Ou7NXh77Uav3wOrh0j/WlwUGo=;
 b=p5bsKDg7tMBnd5qo4asPd25ewkYLyTBvTiDchpZUVrlXTDmyMEYZ5sLLXxeZE+FEJu
 fFFNjoTLkv5d2pa5xGLx9vkfp2kN2vnddjucaeZvUkFXRynv1VNzJ1pUcqmxb2Txe3do
 JzVko3L/nJk6RDWynthGjwo+jRTerO6ZGya1/kDLuC6bMX9B/IbVW/JZHrLMlgpcKLym
 sItTVYZ8Z+4m2Qww3kRTK+O9+PXHRF8M/C9S5nnxW1x3N3BsbW8oNQ7YaNaUDMO60oA1
 XF9/tnA4qlzGsdu85SFUrd6yfss+zvC3BltZJqm8Q5sMSfDSix3SZ+AP1EjUxazCFJ4I
 wdPQ==
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
Cc: linux-fbdev@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 gustavo@embeddedor.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm93IHRoYXQgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCBpcyBwYXNzZWQgdG8gR0NDIGJ5IGRlZmF1
bHQsIHRoZQpmb2xsb3dpbmcgd2FybmluZ3Mgc2hvd3MgdXA6CgouLi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3NoX21vYmlsZV9sY2RjZmIuYzogSW4gZnVuY3Rpb24g4oCYc2hfbW9iaWxlX2xjZGNfY2hh
bm5lbF9mYl9pbml04oCZOgouLi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoX21vYmlsZV9sY2RjZmIu
YzoyMDg2OjIyOiB3YXJuaW5nOiB0aGlzIHN0YXRlbWVudCBtYXkgZmFsbAogdGhyb3VnaCBbLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaD1dCiAgIGluZm8tPmZpeC55cGFuc3RlcCA9IDI7CiAgIH5+fn5+
fn5+fn5+fn5+fn5+fn5efn4KLi4vZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNkY2Zi
LmM6MjA4NzoyOiBub3RlOiBoZXJlCiAgY2FzZSBWNEwyX1BJWF9GTVRfTlYxNjoKICBefn5+Ci4u
L2RyaXZlcnMvdmlkZW8vZmJkZXYvc2hfbW9iaWxlX2xjZGNmYi5jOiBJbiBmdW5jdGlvbiDigJhz
aF9tb2JpbGVfbGNkY19vdmVybGF5X2ZiX2luaXTigJk6Ci4uL2RyaXZlcnMvdmlkZW8vZmJkZXYv
c2hfbW9iaWxlX2xjZGNmYi5jOjE1OTY6MjI6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBm
YWxsCiB0aHJvdWdoIFstV2ltcGxpY2l0LWZhbGx0aHJvdWdoPV0KICAgaW5mby0+Zml4LnlwYW5z
dGVwID0gMjsKICAgfn5+fn5+fn5+fn5+fn5+fn5+fl5+fgouLi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L3NoX21vYmlsZV9sY2RjZmIuYzoxNTk3OjI6IG5vdGU6IGhlcmUKICBjYXNlIFY0TDJfUElYX0ZN
VF9OVjE2OgogIF5+fn4KClJld29yayB0byBhZGRyZXNzIGEgd2FybmluZ3MgZHVlIHRvIHRoZSBl
bmFibGVtZW50IG9mCi1XaW1wbGljaXQtZmFsbHRocm91Z2guCgpTaWduZWQtb2ZmLWJ5OiBBbmRl
cnMgUm94ZWxsIDxhbmRlcnMucm94ZWxsQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy92aWRlby9m
YmRldi9zaF9tb2JpbGVfbGNkY2ZiLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNkY2Zi
LmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NoX21vYmlsZV9sY2RjZmIuYwppbmRleCBhYzBiY2Fj
OWE4NjUuLmMyNDk3NjNkYmYwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9zaF9t
b2JpbGVfbGNkY2ZiLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9zaF9tb2JpbGVfbGNkY2Zi
LmMKQEAgLTE1OTQsNiArMTU5NCw3IEBAIHNoX21vYmlsZV9sY2RjX292ZXJsYXlfZmJfaW5pdChz
dHJ1Y3Qgc2hfbW9iaWxlX2xjZGNfb3ZlcmxheSAqb3ZsKQogCWNhc2UgVjRMMl9QSVhfRk1UX05W
MTI6CiAJY2FzZSBWNEwyX1BJWF9GTVRfTlYyMToKIAkJaW5mby0+Zml4LnlwYW5zdGVwID0gMjsK
KwkJLyogRmFsbCB0aHJvdWdoICovCiAJY2FzZSBWNEwyX1BJWF9GTVRfTlYxNjoKIAljYXNlIFY0
TDJfUElYX0ZNVF9OVjYxOgogCQlpbmZvLT5maXgueHBhbnN0ZXAgPSAyOwpAQCAtMjA4NCw2ICsy
MDg1LDcgQEAgc2hfbW9iaWxlX2xjZGNfY2hhbm5lbF9mYl9pbml0KHN0cnVjdCBzaF9tb2JpbGVf
bGNkY19jaGFuICpjaCwKIAljYXNlIFY0TDJfUElYX0ZNVF9OVjEyOgogCWNhc2UgVjRMMl9QSVhf
Rk1UX05WMjE6CiAJCWluZm8tPmZpeC55cGFuc3RlcCA9IDI7CisJCS8qIEZhbGwgdGhyb3VnaCAq
LwogCWNhc2UgVjRMMl9QSVhfRk1UX05WMTY6CiAJY2FzZSBWNEwyX1BJWF9GTVRfTlY2MToKIAkJ
aW5mby0+Zml4LnhwYW5zdGVwID0gMjsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
