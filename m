Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8651C78601
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3246389A7A;
	Mon, 29 Jul 2019 07:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D836ED24
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 11:28:08 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u10so36831239lfm.12
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jul 2019 04:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RBXqC7DkQwKqkOuJceKqqWGtbn5TCwbm7RbUyvhZTFE=;
 b=Rnw9J/BXfd2Q80yVaB/sLHzM+KwN+ns1UJ/m4Evr3LODg35mo0GbActxIDXM7FO4z4
 nMuEgF38B/Xjf87BS+NDd3mnO+tuANqA8EJkHqO+o5wBBPjF10FzxN4bVI/iv7tZ1Mil
 K8KovssIX6/CaTLsZG6bMTC0AFVuuJC3xv8uNXlN8/JI3FMqlRorDzPFR+tpbKD/rtxw
 y0KFFaFFRP3j4YGzm575hgnRNZ+c6//EKJFCqgpvRtVP0fvAByEiJrThqsRMnVTTR25w
 JKDlpxsuCA/PZ249U5jyHwPY0EmE10CvChGKalag/B5P49VzRScuIi2y3fxk5/ojIMbK
 BWYQ==
X-Gm-Message-State: APjAAAW78+/bO1buAj+c/F7jJj2UZtJ8yrZwXlQxlBDXm6jmz8kXcIf0
 X5htVaPqE0Y8bN4+cTg3itW8MA==
X-Google-Smtp-Source: APXvYqylnBrvToUHEFBagkx2prc/Tv4T9RQ3PARODD6GUeEx7QMqJ1gF8b+lZNvDISocpsu3GK6MPA==
X-Received: by 2002:ac2:48a5:: with SMTP id u5mr45521185lfg.62.1564140487096; 
 Fri, 26 Jul 2019 04:28:07 -0700 (PDT)
Received: from localhost (c-243c70d5.07-21-73746f28.bbcust.telenor.se.
 [213.112.60.36])
 by smtp.gmail.com with ESMTPSA id z25sm8306560lfi.51.2019.07.26.04.28.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 04:28:06 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	wens@csie.org
Subject: [PATCH 1/2] drm: sun4i: sun6i_mipi_dsi: Mark expected switch
 fall-through
Date: Fri, 26 Jul 2019 13:28:02 +0200
Message-Id: <20190726112802.19563-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RBXqC7DkQwKqkOuJceKqqWGtbn5TCwbm7RbUyvhZTFE=;
 b=S+2C7W+37ohe6bGgtuXYTdXJGM8T5ohSQlHPAzmsrvk398LEdPoWhPV/m/nzghQI5v
 W/ynOWka+ROdXjq3wZx0SU5bXSkI8xsvR7m9JeSogoFZ9okwuGEnqPEjlGjROjHjGIva
 mB1VipwLDzpthrV0Oe/nYMqcKcnKgfaK0ocaFXs9wuRQrGEiGE8p5MAwmLKboL370EQ/
 7HsqDSPXh0uLWTzNzKXAhZdPAy50RxUyeN8iSN7WJUVHNXAAbGEFRYbwtye13r4H0RN6
 d1O6oWzPXvPJVyEhSHBHvBtoWervTtRey3wpMXYA9PJrRYUAwaiQ/LmzqdeBN4YwXTPw
 dL3w==
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBmYWxsLXRocm91Z2ggd2FybmluZ3Mgd2FzIGVuYWJsZWQgYnkgZGVmYXVsdCB0aGUgZm9s
bG93aW5nIHdhcm5pbmcKd2FzIHN0YXJ0aW5nIHRvIHNob3cgdXA6CgouLi9kcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYzogSW4gZnVuY3Rpb24K4oCYc3VuNmlfZHNpX3RyYW5z
ZmVy4oCZOi4uL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jOjk5Mjo2OiB3
YXJuaW5nOgogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdpbXBsaWNpdC1mYWxs
dGhyb3VnaD1dCiAgIGlmIChtc2ctPnJ4X2xlbiA9PSAxKSB7CiAgICAgIF4KLi4vZHJpdmVycy9n
cHUvZHJtL3N1bjRpL3N1bjZpX21pcGlfZHNpLmM6OTk3OjI6IG5vdGU6IGhlcmUKICBkZWZhdWx0
OgogIF5+fn5+fn4KClJld29yayBzbyB0aGF0IHRoZSBjb21waWxlciBkb2Vzbid0IHdhcm4gYWJv
dXQgZmFsbC10aHJvdWdoLiBDaGFuZ2UKdGhlIGlmLXN0YXRlbWVudCBzbyB0aGF0IHdlIGNhbiBt
b3ZlIG91dCAnYnJlYWs7JyBvbmUgbGV2ZWwuCgpGaXhlczogZDkzNTEyZWYwZjBlICgiTWFrZWZp
bGU6IEdsb2JhbGx5IGVuYWJsZSBmYWxsLXRocm91Z2ggd2FybmluZyIpClNpZ25lZC1vZmYtYnk6
IEFuZGVycyBSb3hlbGwgPGFuZGVycy5yb3hlbGxAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vc3VuNGkvc3VuNmlfbWlwaV9kc2kuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW42aV9taXBpX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjZpX21p
cGlfZHNpLmMKaW5kZXggNDcyZjczOTg1ZGViLi40MGVkMjFlNTI3ZjkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW42aV9taXBpX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW42aV9taXBpX2RzaS5jCkBAIC05OTIsOCArOTkyLDEwIEBAIHN0YXRpYyBzc2l6
ZV90IHN1bjZpX2RzaV90cmFuc2ZlcihzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdCwKIAljYXNl
IE1JUElfRFNJX0RDU19SRUFEOgogCQlpZiAobXNnLT5yeF9sZW4gPT0gMSkgewogCQkJcmV0ID0g
c3VuNmlfZHNpX2Rjc19yZWFkKGRzaSwgbXNnKTsKLQkJCWJyZWFrOworCQl9IGVsc2UgeworCQkJ
cmV0ID0gLUVJTlZBTDsKIAkJfQorCQlicmVhazsKIAogCWRlZmF1bHQ6CiAJCXJldCA9IC1FSU5W
QUw7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
