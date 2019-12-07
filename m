Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9577B115C9B
	for <lists+dri-devel@lfdr.de>; Sat,  7 Dec 2019 15:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4380B6E193;
	Sat,  7 Dec 2019 14:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD3A6E193
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Dec 2019 14:04:31 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id n25so7458602lfl.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2019 06:04:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uCcsUdwReshm9HwMNcrU5BxdMhIAKJ/ocTck1sZP+Fo=;
 b=rcZyI2htqnMh7U+0Wtv5Q9G5dXuU/Mzf/4Jq48kdZNFaP7N9E+Hq8EmyFVQuZfluCH
 0bsVb4lhToU4xG82dNJLRA7R+pGsJFye2SZzs4vkS7r86nnzn0bBBdM3BGYqMZV2Y3RY
 CRYaaw7Fpziu6V6Ri/j1YU4R6+qdg7H+wiCgfch2ttbo1x9Hb5CNlY6zJK1FH1sTgF6O
 GnvEw5jhvjLqb9wKYZx90HhSLF6QHfWUqUHVbUhpiNvQuRm8E3712vJ+Kb1hNqjk0Z4d
 csiKY/e830Y94zgbtzJDAzX49R+Zne8PNUFiQlY19zCUnprcit6H6sIjbPdDBOP322W8
 p+6g==
X-Gm-Message-State: APjAAAXxw2buU7uFBBBxJj5LHpdZAAI6eeKPt5iSKvm6VicPjyRhT6b2
 TF8Hmd3MhIWfZQuRKyubHhpiAQAGG+8bIw==
X-Google-Smtp-Source: APXvYqwODyhNxo//UXLNaOKxcezmY/8FXmz3+HXMvPwIlwOjWb5g2QkT3BMHdTPdMLzXRsxZlWwl5w==
X-Received: by 2002:ac2:5635:: with SMTP id b21mr814144lff.127.1575727469887; 
 Sat, 07 Dec 2019 06:04:29 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:29 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 11/25] drm/panel: kingdisplay-kd097d04: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:39 +0100
Message-Id: <20191207140353.23967-12-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uCcsUdwReshm9HwMNcrU5BxdMhIAKJ/ocTck1sZP+Fo=;
 b=s22pFD4YrEM3PFFzKv+ZLsVIXm+HdH/EaDdcclRIe89iftvcVnXlN37VAJLTLRpKCI
 Joj9aeFpY8riXENAwhHWUGERnh/I5RyC2zHkzJ4cvd/ly3H5g+HjF7GEvZPbNkirgs3P
 ZVynpmSQopiLvYNmQKwKGrQsFS4gud4WijDs1HgxL2uNpFOb7fIg/6ULqcKqAMszS3Rj
 3KtWDPxC+GD7oLwj9GPbI4DrWrOgAo6SdNIDXyYnDcF7eOmSvKVExMRWyVzwV/tSHyMC
 E76/PwPIZVH4HkQC9Me7Eg88eefxTIt8g9IHrCvjj+IcTjeu1oIAncoo/mzoGU9hxyPr
 B8Ow==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-mediatek@lists.infradead.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Purism Kernel Team <kernel@puri.sm>,
 linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBiYWNrbGlnaHQgc3VwcG9ydCBpbiBkcm1fcGFuZWwgdG8gc2ltcGxpZnkgdGhlIGRy
aXZlcgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNh
bSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KLS0tCiAuLi4vZHJtL3BhbmVsL3BhbmVsLWtp
bmdkaXNwbGF5LWtkMDk3ZDA0LmMgICAgfCAyOCArKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwta2luZ2Rpc3BsYXkta2QwOTdkMDQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1raW5nZGlzcGxheS1rZDA5N2QwNC5jCmluZGV4IDM1M2Vl
NmNhYTAxYy4uYmFjMWEyYTA2YzkyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwta2luZ2Rpc3BsYXkta2QwOTdkMDQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwta2luZ2Rpc3BsYXkta2QwOTdkMDQuYwpAQCAtMyw3ICszLDYgQEAKICAqIENvcHlyaWdo
dCAoYykgMjAxNywgRnV6aG91IFJvY2tjaGlwIEVsZWN0cm9uaWNzIENvLiwgTHRkCiAgKi8KIAot
I2luY2x1ZGUgPGxpbnV4L2JhY2tsaWdodC5oPgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAj
aW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
PgpAQCAtMjMsNyArMjIsNiBAQCBzdHJ1Y3Qga2luZ2Rpc3BsYXlfcGFuZWwgewogCXN0cnVjdCBk
cm1fcGFuZWwgYmFzZTsKIAlzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpsaW5rOwogCi0Jc3RydWN0
IGJhY2tsaWdodF9kZXZpY2UgKmJhY2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yICpzdXBwbHk7
CiAJc3RydWN0IGdwaW9fZGVzYyAqZW5hYmxlX2dwaW87CiAKQEAgLTE5MSw4ICsxODksNiBAQCBz
dGF0aWMgaW50IGtpbmdkaXNwbGF5X3BhbmVsX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAqcGFu
ZWwpCiAJaWYgKCFraW5nZGlzcGxheS0+ZW5hYmxlZCkKIAkJcmV0dXJuIDA7CiAKLQliYWNrbGln
aHRfZGlzYWJsZShraW5nZGlzcGxheS0+YmFja2xpZ2h0KTsKLQogCWVyciA9IG1pcGlfZHNpX2Rj
c19zZXRfZGlzcGxheV9vZmYoa2luZ2Rpc3BsYXktPmxpbmspOwogCWlmIChlcnIgPCAwKQogCQlE
Uk1fREVWX0VSUk9SKHBhbmVsLT5kZXYsICJmYWlsZWQgdG8gc2V0IGRpc3BsYXkgb2ZmOiAlZFxu
IiwKQEAgLTMwMywxOCArMjk5LDEwIEBAIHN0YXRpYyBpbnQga2luZ2Rpc3BsYXlfcGFuZWxfcHJl
cGFyZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIHN0YXRpYyBpbnQga2luZ2Rpc3BsYXlfcGFu
ZWxfZW5hYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQogewogCXN0cnVjdCBraW5nZGlzcGxh
eV9wYW5lbCAqa2luZ2Rpc3BsYXkgPSB0b19raW5nZGlzcGxheV9wYW5lbChwYW5lbCk7Ci0JaW50
IHJldDsKIAogCWlmIChraW5nZGlzcGxheS0+ZW5hYmxlZCkKIAkJcmV0dXJuIDA7CiAKLQlyZXQg
PSBiYWNrbGlnaHRfZW5hYmxlKGtpbmdkaXNwbGF5LT5iYWNrbGlnaHQpOwotCWlmIChyZXQpIHsK
LQkJRFJNX0RFVl9FUlJPUihwYW5lbC0+ZGV2LAotCQkJICAgICAgIkZhaWxlZCB0byBlbmFibGUg
YmFja2xpZ2h0ICVkXG4iLCByZXQpOwotCQlyZXR1cm4gcmV0OwotCX0KLQogCWtpbmdkaXNwbGF5
LT5lbmFibGVkID0gdHJ1ZTsKIAogCXJldHVybiAwOwpAQCAtMzg4LDEzICszNzYsMTMgQEAgc3Rh
dGljIGludCBraW5nZGlzcGxheV9wYW5lbF9hZGQoc3RydWN0IGtpbmdkaXNwbGF5X3BhbmVsICpr
aW5nZGlzcGxheSkKIAkJa2luZ2Rpc3BsYXktPmVuYWJsZV9ncGlvID0gTlVMTDsKIAl9CiAKLQlr
aW5nZGlzcGxheS0+YmFja2xpZ2h0ID0gZGV2bV9vZl9maW5kX2JhY2tsaWdodChkZXYpOwotCWlm
IChJU19FUlIoa2luZ2Rpc3BsYXktPmJhY2tsaWdodCkpCi0JCXJldHVybiBQVFJfRVJSKGtpbmdk
aXNwbGF5LT5iYWNrbGlnaHQpOwotCiAJZHJtX3BhbmVsX2luaXQoJmtpbmdkaXNwbGF5LT5iYXNl
LCAma2luZ2Rpc3BsYXktPmxpbmstPmRldiwKIAkJICAgICAgICZraW5nZGlzcGxheV9wYW5lbF9m
dW5jcywgRFJNX01PREVfQ09OTkVDVE9SX0RTSSk7CiAKKwllcnIgPSBkcm1fcGFuZWxfb2ZfYmFj
a2xpZ2h0KCZraW5nZGlzcGxheS0+YmFzZSk7CisJaWYgKGVycikKKwkJcmV0dXJuIGVycjsKKwog
CXJldHVybiBkcm1fcGFuZWxfYWRkKCZraW5nZGlzcGxheS0+YmFzZSk7CiB9CiAKQEAgLTQzMiwx
MiArNDIwLDEyIEBAIHN0YXRpYyBpbnQga2luZ2Rpc3BsYXlfcGFuZWxfcmVtb3ZlKHN0cnVjdCBt
aXBpX2RzaV9kZXZpY2UgKmRzaSkKIAlzdHJ1Y3Qga2luZ2Rpc3BsYXlfcGFuZWwgKmtpbmdkaXNw
bGF5ID0gbWlwaV9kc2lfZ2V0X2RydmRhdGEoZHNpKTsKIAlpbnQgZXJyOwogCi0JZXJyID0ga2lu
Z2Rpc3BsYXlfcGFuZWxfdW5wcmVwYXJlKCZraW5nZGlzcGxheS0+YmFzZSk7CisJZXJyID0gZHJt
X3BhbmVsX3VucHJlcGFyZSgma2luZ2Rpc3BsYXktPmJhc2UpOwogCWlmIChlcnIgPCAwKQogCQlE
Uk1fREVWX0VSUk9SKCZkc2ktPmRldiwgImZhaWxlZCB0byB1bnByZXBhcmUgcGFuZWw6ICVkXG4i
LAogCQkJICAgICAgZXJyKTsKIAotCWVyciA9IGtpbmdkaXNwbGF5X3BhbmVsX2Rpc2FibGUoJmtp
bmdkaXNwbGF5LT5iYXNlKTsKKwllcnIgPSBkcm1fcGFuZWxfZGlzYWJsZSgma2luZ2Rpc3BsYXkt
PmJhc2UpOwogCWlmIChlcnIgPCAwKQogCQlEUk1fREVWX0VSUk9SKCZkc2ktPmRldiwgImZhaWxl
ZCB0byBkaXNhYmxlIHBhbmVsOiAlZFxuIiwgZXJyKTsKIApAQCAtNDU1LDggKzQ0Myw4IEBAIHN0
YXRpYyB2b2lkIGtpbmdkaXNwbGF5X3BhbmVsX3NodXRkb3duKHN0cnVjdCBtaXBpX2RzaV9kZXZp
Y2UgKmRzaSkKIHsKIAlzdHJ1Y3Qga2luZ2Rpc3BsYXlfcGFuZWwgKmtpbmdkaXNwbGF5ID0gbWlw
aV9kc2lfZ2V0X2RydmRhdGEoZHNpKTsKIAotCWtpbmdkaXNwbGF5X3BhbmVsX3VucHJlcGFyZSgm
a2luZ2Rpc3BsYXktPmJhc2UpOwotCWtpbmdkaXNwbGF5X3BhbmVsX2Rpc2FibGUoJmtpbmdkaXNw
bGF5LT5iYXNlKTsKKwlkcm1fcGFuZWxfdW5wcmVwYXJlKCZraW5nZGlzcGxheS0+YmFzZSk7CisJ
ZHJtX3BhbmVsX2Rpc2FibGUoJmtpbmdkaXNwbGF5LT5iYXNlKTsKIH0KIAogc3RhdGljIHN0cnVj
dCBtaXBpX2RzaV9kcml2ZXIga2luZ2Rpc3BsYXlfcGFuZWxfZHJpdmVyID0gewotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
