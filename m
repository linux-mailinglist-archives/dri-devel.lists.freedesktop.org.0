Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C932A968
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2019 13:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DE689A67;
	Sun, 26 May 2019 11:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBFE89A67
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 11:37:16 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z1so6806474ljb.3
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2019 04:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ENe0KZSJgieNsuFnRJ0MAE/wEgNku6S8dXunWnDiTw0=;
 b=eBgx1KhEWb8RqxqZqfKLZZCDVL7H7gNN8Yulws0+jXy9+CuyKEjuLw/u56aLYZZi4I
 t+ZowLO97dia7Z0XeSNrX978n78Xvlg7tVZGahZhm9J8DdjBhhAz9BcrSFeNsAcCjS0M
 pgXmEFHgp9bKKSKKAQTYZBM54Lg7hUCqwqLQMgnye2Rm0ogIafRpLJ+CjG+dD66zKSAT
 xUB5e0z/1k6tqulWt3PVseE5z4MV8VCXUAm2j7/iEkC621GYaji1zTmNAyqe4F6IBZ8J
 mT1bNmbu8MGsivBtcjfRbe9LAdPZZLkDzl5y7z/HZBmo/4IMlg++vEq/UZKYl5LhnBHT
 DS9A==
X-Gm-Message-State: APjAAAVXfseX8BGDvxZMrxV1QCotcLKu1LwobYYfStRpz18+xIRmWgzB
 TJzY4BpX4D6b8NtNBZBJvLB+OdvHM0Y=
X-Google-Smtp-Source: APXvYqyLCBzrnfxox32B1WVTk7L4w4p624IEa/8tYm1iQKE9sydDYhmZPI2hrOuGoT+5mw38KPx8cA==
X-Received: by 2002:a2e:6817:: with SMTP id c23mr35594104lja.145.1558870634391; 
 Sun, 26 May 2019 04:37:14 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
 by smtp.gmail.com with ESMTPSA id x27sm1612630ljm.52.2019.05.26.04.37.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 May 2019 04:37:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mcde: Fix compile problems
Date: Sun, 26 May 2019 13:36:24 +0200
Message-Id: <20190526113624.6702-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ENe0KZSJgieNsuFnRJ0MAE/wEgNku6S8dXunWnDiTw0=;
 b=P1FveNHKs2XWkv9cbXT0oAKGv9AgWRCSRHkvi+sB0+M2laxTN6mla8+BfhUsUWpg9M
 lC9EenGMepirxq9cl+L0NcI3GOc8nkcC9slYnsg24w7pwacYBTBpfcussomVRcVbksaI
 K0JN5kdgMRJdPo3PbZ3aar70J5Xaq43tRB1+HuVgVHOwDriYv4mxV7f/JOIzpqGW4tYw
 rHDT27u2Xvk7xjqcJkjqr8qfyJvvO5QPEW3OxFUReryJHLN1JrpQY5X2tfMMh7u5wl7j
 biQXC/4conrfX/VMhOyw6vl3uWONgNEc3EPFdNJ7tWPTnUnCjpllGMb5KWlTDYiZsFPE
 GHlw==
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKU29tZSBmdXJ0aGVyIGNvbXBp
bGUgcHJvYmxlbXMgYXBwZWFyZWQgd2hpbGUgbWVyZ2luZyB0aGUKcGF0Y2gsIGZpeCB0aGVtIHVw
LgoKU2lnbmVkLW9mZi1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpTaWduZWQt
b2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL21jZGUvbWNkZV9kaXNwbGF5LmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0v
bWNkZS9tY2RlX2RzaS5jICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21j
ZGVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kaXNwbGF5LmMKaW5kZXgg
MTdkYzQ2ZDU1NGIwLi5mM2VmMTA4YTQxZDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
Y2RlL21jZGVfZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZGlzcGxh
eS5jCkBAIC04MjMsNyArODIzLDcgQEAgc3RhdGljIHZvaWQgbWNkZV9kaXNwbGF5X2VuYWJsZShz
dHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsCiAJdTMyIGZvcm1hdHRlcl9wcGwg
PSBtb2RlLT5oZGlzcGxheTsgLyogcGl4ZWxzIHBlciBsaW5lICovCiAJdTMyIGZvcm1hdHRlcl9s
cGYgPSBtb2RlLT52ZGlzcGxheTsgLyogbGluZXMgcGVyIGZyYW1lICovCiAJaW50IHBrdF9zaXpl
LCBmaWZvX3d0cm1yazsKLQlpbnQgY3BwID0gZHJtX2Zvcm1hdF9wbGFuZV9jcHAoZm9ybWF0LCAw
KTsKKwlpbnQgY3BwID0gZmItPmZvcm1hdC0+Y3BwWzBdOwogCWludCBmb3JtYXR0ZXJfY3BwOwog
CXN0cnVjdCBkcm1fZm9ybWF0X25hbWVfYnVmIHRtcDsKIAl1MzIgZm9ybWF0dGVyX2ZyYW1lOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tY2RlL21jZGVfZHNpLmMKaW5kZXggNDU2YjQzNDgyNDQ4Li4wN2Y3MDkwZDA4YjMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21jZGUvbWNkZV9kc2kuYwpAQCAtMTkxLDcgKzE5MSw3IEBAIHN0YXRpYyBzc2l6ZV90
IG1jZGVfZHNpX2hvc3RfdHJhbnNmZXIoc3RydWN0IG1pcGlfZHNpX2hvc3QgKmhvc3QsCiAJfQog
CiAJZGV2X2RiZyhkLT5kZXYsCi0JCSJtZXNzYWdlIHRvIGNoYW5uZWwgJWQsICV1IGJ5dGVzIiwK
KwkJIm1lc3NhZ2UgdG8gY2hhbm5lbCAlZCwgJXpkIGJ5dGVzIiwKIAkJbXNnLT5jaGFubmVsLAog
CQl0eGxlbik7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
