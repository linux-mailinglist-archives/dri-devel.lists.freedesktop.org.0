Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9316524A2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A116E075;
	Tue, 25 Jun 2019 07:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C4C89C19
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:48:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s3so13093931wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 07:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:references:reply-to
 :message-id:mime-version;
 bh=t3gx4CW2mBs3JN+/WIyX7pTLkZS3fRc0wyPs3jrglog=;
 b=QLSul+j2ElSEKOcpFTI6QwSHpYj3Mm3oQxnvEufsMLzRlz4ZyuVAiAnz4QMXolIbtj
 5/yaHi3AkhGY/mF0LWiDXxQnaKDcB19l51wemcaOdT0LV2zmQ26QxlN30M0DGnn3GgaK
 3hn8E7wRlDI0uFmZtCZRaRcCrU5c2Nz0KQbzMeyyD2q8mQ+fI5T7mjmvlinpJc7QRNQh
 4x6Ndk4sL2viEMId3lmxmszjq17H0bLrHRnb6p5ZDAHc31BKPGRSXmDRRxJW6VclhmlG
 0+z2J/rqgCUmM9FG0lTdytLOI54/VAAceRpClrchTEy1+hfX6vl+TwRrm1mxogty9Vrd
 xrWQ==
X-Gm-Message-State: APjAAAVdxFSJzPI6ORdYIdRFt/RdlgZahQJ/mOw0ZAQBeu1spLA7itvp
 jVbO18uGutlElGhh54X45P+s5Q==
X-Google-Smtp-Source: APXvYqzrHd650JT9hi2tr1385IrvFj/niI09iC8N4X0o5wZ49+Tjdpy2oO9/0/usF55unwPrZZ44mA==
X-Received: by 2002:a7b:c310:: with SMTP id k16mr15453054wmj.133.1561387715052; 
 Mon, 24 Jun 2019 07:48:35 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y1sm8450447wma.32.2019.06.24.07.48.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 07:48:34 -0700 (PDT)
From: Julien Masson <jmasson@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 3/9] drm: meson: drv: use macro when initializing vpu
Date: Mon, 24 Jun 2019 16:48:27 +0200
References: <86zhm782g5.fsf@baylibre.com>
Message-ID: <86v9wv82f1.fsf@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:references:reply-to:message-id:mime-version;
 bh=t3gx4CW2mBs3JN+/WIyX7pTLkZS3fRc0wyPs3jrglog=;
 b=OgoQ6QB8KfytnEKNbqfHjNm8UJkRclyxG8kKItYXWzuLf2+ItMLuqzZYvR87PvjPT8
 I1Nr4mRS2NWL+Wcl/BEGIH88enr3Z8oWN3Xrg+rLK4Ts+QBpE0n5oVxZT0L/vbwTEqgh
 VXRGYMOjF+mvNyvaZNbNINR6W28R0EUIDfHbQMvuVw5c4El9SNhb6dq4lNY+roQEtBSB
 1kTeXMaJqzyLiVfsD8gUn+wGwbPLKTE/8M7pJ2PBHUpW2gZmMjA+3LXcNg1GGH+7vsYK
 amzV/RxgVLqs1ml/G1HH7trn59/KUOv6UAmdmCLG30ShA93zBPEcpPNPmj8Zle9KhNp2
 S3fA==
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
Reply-To: 86zhm782g5.fsf@baylibre.com
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGQgbmV3IG1hY3JvIHdoaWNoIGlzIHVzZWQgdG8gc2V0IFdSQVJCL1JEQVJC
IG1vZGUgb2YKdGhlIFZQVS4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBNYXNzb24gPGptYXNzb25A
YmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYyAgICAg
ICB8IDI2ICsrKysrKysrKysrKysrKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl9yZWdpc3RlcnMuaCB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKaW5kZXggMjMxMGM5
NmZmZjQ2Li41MDA5NjY5N2FkYzMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKQEAgLTE0
OSwxMCArMTQ5LDI4IEBAIHN0YXRpYyBzdHJ1Y3QgcmVnbWFwX2NvbmZpZyBtZXNvbl9yZWdtYXBf
Y29uZmlnID0gewogCiBzdGF0aWMgdm9pZCBtZXNvbl92cHVfaW5pdChzdHJ1Y3QgbWVzb25fZHJt
ICpwcml2KQogewotCXdyaXRlbF9yZWxheGVkKDB4MjEwMDAwLCBwcml2LT5pb19iYXNlICsgX1JF
RyhWUFVfUkRBUkJfTU9ERV9MMUMxKSk7Ci0Jd3JpdGVsX3JlbGF4ZWQoMHgxMDAwMCwgcHJpdi0+
aW9fYmFzZSArIF9SRUcoVlBVX1JEQVJCX01PREVfTDFDMikpOwotCXdyaXRlbF9yZWxheGVkKDB4
OTAwMDAwLCBwcml2LT5pb19iYXNlICsgX1JFRyhWUFVfUkRBUkJfTU9ERV9MMkMxKSk7Ci0Jd3Jp
dGVsX3JlbGF4ZWQoMHgyMDAwMCwgcHJpdi0+aW9fYmFzZSArIF9SRUcoVlBVX1dSQVJCX01PREVf
TDJDMSkpOworCXUzMiB2YWx1ZTsKKworCS8qCisJICogU2xhdmUgZGMwIGFuZCBkYzUgY29ubmVj
dGVkIHRvIG1hc3RlciBwb3J0IDEuCisJICogQnkgZGVmYXVsdCBvdGhlciBzbGF2ZXMgYXJlIGNv
bm5lY3RlZCB0byBtYXN0ZXIgcG9ydCAwLgorCSAqLworCXZhbHVlID0gVlBVX1JEQVJCX1NMQVZF
X1RPX01BU1RFUl9QT1JUKDAsIDEpIHwKKwkJVlBVX1JEQVJCX1NMQVZFX1RPX01BU1RFUl9QT1JU
KDUsIDEpOworCXdyaXRlbF9yZWxheGVkKHZhbHVlLCBwcml2LT5pb19iYXNlICsgX1JFRyhWUFVf
UkRBUkJfTU9ERV9MMUMxKSk7CisKKwkvKiBTbGF2ZSBkYzAgY29ubmVjdGVkIHRvIG1hc3RlciBw
b3J0IDEgKi8KKwl2YWx1ZSA9IFZQVV9SREFSQl9TTEFWRV9UT19NQVNURVJfUE9SVCgwLCAxKTsK
Kwl3cml0ZWxfcmVsYXhlZCh2YWx1ZSwgcHJpdi0+aW9fYmFzZSArIF9SRUcoVlBVX1JEQVJCX01P
REVfTDFDMikpOworCisJLyogU2xhdmUgZGM0IGFuZCBkYzcgY29ubmVjdGVkIHRvIG1hc3RlciBw
b3J0IDEgKi8KKwl2YWx1ZSA9IFZQVV9SREFSQl9TTEFWRV9UT19NQVNURVJfUE9SVCg0LCAxKSB8
CisJCVZQVV9SREFSQl9TTEFWRV9UT19NQVNURVJfUE9SVCg3LCAxKTsKKwl3cml0ZWxfcmVsYXhl
ZCh2YWx1ZSwgcHJpdi0+aW9fYmFzZSArIF9SRUcoVlBVX1JEQVJCX01PREVfTDJDMSkpOworCisJ
LyogU2xhdmUgZGMxIGNvbm5lY3RlZCB0byBtYXN0ZXIgcG9ydCAxICovCisJdmFsdWUgPSBWUFVf
UkRBUkJfU0xBVkVfVE9fTUFTVEVSX1BPUlQoMSwgMSk7CisJd3JpdGVsX3JlbGF4ZWQodmFsdWUs
IHByaXYtPmlvX2Jhc2UgKyBfUkVHKFZQVV9XUkFSQl9NT0RFX0wyQzEpKTsKIH0KIAogc3RhdGlj
IHZvaWQgbWVzb25fcmVtb3ZlX2ZyYW1lYnVmZmVycyh2b2lkKQpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5oIGIvZHJpdmVycy9ncHUvZHJtL21lc29u
L21lc29uX3JlZ2lzdGVycy5oCmluZGV4IDU1ZjVmZTIxZmY1ZS4uYTlkYjQ5ZTViZGQ2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcmVnaXN0ZXJzLmgKKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX3JlZ2lzdGVycy5oCkBAIC0xNDk2LDYgKzE0OTYsNyBA
QAogI2RlZmluZSBWUFVfUkRBUkJfTU9ERV9MMUMyIDB4Mjc5OQogI2RlZmluZSBWUFVfUkRBUkJf
TU9ERV9MMkMxIDB4Mjc5ZAogI2RlZmluZSBWUFVfV1JBUkJfTU9ERV9MMkMxIDB4MjdhMgorI2Rl
ZmluZQkJVlBVX1JEQVJCX1NMQVZFX1RPX01BU1RFUl9QT1JUKGRjLCBwb3J0KSAocG9ydCA8PCAo
MTYgKyBkYykpCiAKIC8qIG9zZCBzdXBlciBzY2FsZSAqLwogI2RlZmluZSBPU0RTUl9IVl9TSVpF
SU4gMHgzMTMwCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
