Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B88AE455B4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E292189487;
	Fri, 14 Jun 2019 07:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CA289994
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 12:12:12 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w9so6490533wmd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 05:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dxPAopxGigXChNe4VdO4Ubt5YTdhDcINUQzBTzEvzKk=;
 b=HuUEb7+cwo4PnZ3eKtP51XqfinoKyo/l7a0lS3tozMyE+OXdLe+z9X/YpWif/lxMAo
 ZfM8WW7aTQTgbaV1zpLpPYuFFZd6LyyKOtw6ghhZf6mxlng/qFSvmgUfNEAPMaoklORy
 TEHDL4DRkb82XyfKg5zs733HzRP9yVXnMcZyX5zugCVKEkvRSkIyWK2Wq+fGQ4kXSu0V
 vWtkksVCPUV75IrBK+BNhfVUwHCsblg7iDnLLwNjRvjDaLLFbM05/mafOiUPTIU2j6P1
 ivemXfgkJe8JCPb6xKYWIckQMktn3omiceTYpfTQXUp+TpUn0C7lSXMqsO1r1Lv9QONC
 eHuw==
X-Gm-Message-State: APjAAAXqZIBI3vox9YGEft4KSq+qOJnXCjo1LyxqsrnkWR9l4EMQiV7U
 jAZboZjEUdE/P25Fr0Bc1+Z1hw==
X-Google-Smtp-Source: APXvYqxnPKLSaS0xc8+5oGeF/I6OTATx59AZvwhfSt3I2nQvb+XqlMcdxs+3C8O2o5Llg/zX03VARw==
X-Received: by 2002:a7b:c344:: with SMTP id l4mr3450592wmj.25.1560427931387;
 Thu, 13 Jun 2019 05:12:11 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f6sm2974532wrw.68.2019.06.13.05.12.10
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 05:12:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: dw-hdmi-i2s: support more i2s format
Date: Thu, 13 Jun 2019 14:12:07 +0200
Message-Id: <20190613121207.12185-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:21:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dxPAopxGigXChNe4VdO4Ubt5YTdhDcINUQzBTzEvzKk=;
 b=1g9KtaZe/+oTpytYwjZO6yBksvr6Iq1cGRxviJuU4NBlxHLTidBtC8fZ57YYsFdFl+
 xtC/aJBuwSN8BisYBx12l/oSJCZy7DIfRqBrq+rpXCGdLCHTxhXFvTmCBtsk8MkI0aAH
 6cChkYFKuHDiK7vinsQXX8B77oajTNHf6lWZJtc6spSEy9LQwmt38ohVGTwWglgjLY4J
 TI3fiUKEsldOjiU9UYzkJmmmskIlq62uhE+mgxWk7wo5ewSljqAyBDENmsZDwvEarMf1
 Mm0rEg0jEZtrwu7KfJ3heI5gmwlBnVyzf4HJO+Q7c9n41FDukqeJvEKo0oefEd/bXC1n
 Yvgg==
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGR3LWhkbWktaTJzIHN1cHBvcnRzIG1vcmUgZm9ybWF0cyB0aGFuIGp1c3QgcmVndWxhciBp
MnMuCkFkZCBzdXBwb3J0IGZvciBsZWZ0IGp1c3RpZmllZCwgcmlnaHQganVzdGlmaWVkIGFuZCBk
c3AgbW9kZXMKQSBhbmQgQi4KClNpZ25lZC1vZmYtYnk6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRA
YmF5bGlicmUuY29tPgotLS0KCiBUZXN0ZWQgb24gdGhlIEFtbG9naWMgYXJtNjQgbWVzb24tZzEy
YS1zZWk1MTAgd2l0aCBpMnMsIGxlZnRfaiwgZHNwX2EKIGFuZCBkc3BfYi4gcmlnaHRfaiBpcyBu
b3Qgc3VwcG9ydGVkIGJ5IHRoaXMgcGxhdGZvcm0uCgogLi4uL2RybS9icmlkZ2Uvc3lub3BzeXMv
ZHctaGRtaS1pMnMtYXVkaW8uYyAgIHwgMjYgKysrKysrKysrKysrKysrKy0tLQogZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmggICAgIHwgIDYgKysrLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKaW5kZXggNWNi
YjcxYTg2NmQ1Li4yYjYyNGNmZjU0MWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc3lub3BzeXMvZHctaGRtaS1pMnMtYXVkaW8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL3N5bm9wc3lzL2R3LWhkbWktaTJzLWF1ZGlvLmMKQEAgLTQ0LDkgKzQ0LDggQEAgc3RhdGlj
IGludCBkd19oZG1pX2kyc19od19wYXJhbXMoc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICpkYXRh
LAogCXU4IGlucHV0Y2xrZnMgPSAwOwogCiAJLyogaXQgY2FyZXMgSTJTIG9ubHkgKi8KLQlpZiAo
KGZtdC0+Zm10ICE9IEhETUlfSTJTKSB8fAotCSAgICAoZm10LT5iaXRfY2xrX21hc3RlciB8IGZt
dC0+ZnJhbWVfY2xrX21hc3RlcikpIHsKLQkJZGV2X2VycihkZXYsICJ1bnN1cHBvcnRlZCBmb3Jt
YXQvc2V0dGluZ3NcbiIpOworCWlmIChmbXQtPmJpdF9jbGtfbWFzdGVyIHwgZm10LT5mcmFtZV9j
bGtfbWFzdGVyKSB7CisJCWRldl9lcnIoZGV2LCAidW5zdXBwb3J0ZWQgY2xvY2sgc2V0dGluZ3Nc
biIpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAKQEAgLTYzLDYgKzYyLDI3IEBAIHN0YXRpYyBp
bnQgZHdfaGRtaV9pMnNfaHdfcGFyYW1zKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwK
IAkJYnJlYWs7CiAJfQogCisJc3dpdGNoIChmbXQtPmZtdCkgeworCWNhc2UgSERNSV9JMlM6CisJ
CWNvbmYxIHw9IEhETUlfQVVEX0NPTkYxX01PREVfSTJTOworCQlicmVhazsKKwljYXNlIEhETUlf
UklHSFRfSjoKKwkJY29uZjEgfD0gSERNSV9BVURfQ09ORjFfTU9ERV9SSUdIVF9KOworCQlicmVh
azsKKwljYXNlIEhETUlfTEVGVF9KOgorCQljb25mMSB8PSBIRE1JX0FVRF9DT05GMV9NT0RFX0xF
RlRfSjsKKwkJYnJlYWs7CisJY2FzZSBIRE1JX0RTUF9BOgorCQljb25mMSB8PSBIRE1JX0FVRF9D
T05GMV9NT0RFX0JVUlNUXzE7CisJCWJyZWFrOworCWNhc2UgSERNSV9EU1BfQjoKKwkJY29uZjEg
fD0gSERNSV9BVURfQ09ORjFfTU9ERV9CVVJTVF8yOworCQlicmVhazsKKwlkZWZhdWx0OgorCQlk
ZXZfZXJyKGRldiwgInVuc3VwcG9ydGVkIGZvcm1hdFxuIik7CisJCXJldHVybiAtRUlOVkFMOwor
CX0KKwogCWR3X2hkbWlfc2V0X3NhbXBsZV9yYXRlKGhkbWksIGhwYXJtcy0+c2FtcGxlX3JhdGUp
OwogCiAJaGRtaV93cml0ZShhdWRpbywgaW5wdXRjbGtmcywgSERNSV9BVURfSU5QVVRDTEtGUyk7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuaCBi
L2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5oCmluZGV4IDRlM2VjMDlk
M2NhNC4uMDkxZDdjMjhhYTE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3
LWhkbWkuaApAQCAtODY5LDggKzg2OSwxMCBAQCBlbnVtIHsKIAogLyogQVVEX0NPTkYxIGZpZWxk
IHZhbHVlcyAqLwogCUhETUlfQVVEX0NPTkYxX01PREVfSTJTID0gMHgwMCwKLQlIRE1JX0FVRF9D
T05GMV9NT0RFX1JJR0hUX0ogPSAweDAyLAotCUhETUlfQVVEX0NPTkYxX01PREVfTEVGVF9KID0g
MHgwNCwKKwlIRE1JX0FVRF9DT05GMV9NT0RFX1JJR0hUX0ogPSAweDIwLAorCUhETUlfQVVEX0NP
TkYxX01PREVfTEVGVF9KID0gMHg0MCwKKwlIRE1JX0FVRF9DT05GMV9NT0RFX0JVUlNUXzEgPSAw
eDYwLAorCUhETUlfQVVEX0NPTkYxX01PREVfQlVSU1RfMiA9IDB4ODAsCiAJSERNSV9BVURfQ09O
RjFfV0lEVEhfMTYgPSAweDEwLAogCUhETUlfQVVEX0NPTkYxX1dJRFRIXzI0ID0gMHgxOCwKIAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
