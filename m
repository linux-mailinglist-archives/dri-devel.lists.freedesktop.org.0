Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEED335FCF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 17:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9921789C83;
	Wed,  5 Jun 2019 15:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC9689C83
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 15:02:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r18so10825716wrm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 08:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N6a/FkfxXhOreQfJRYjMNcTKcCaCdcUNkyh7nQmvAxo=;
 b=cnhZ05SF0Ax9/gs+oUma24NfxbMZF88Hhq8zyuHIbb3fVOkFvP5Wrppn2mDslGPryW
 meyD0QrIb9zrZ4007X6IwkL1vzVb+di2j26zRYAkEeKfhIVAknwSefrZS2Ew2UCs8Ylg
 RptRabEyK0u1VxeYPX/0UWTVtQhZwkaNQz1OoXK5rDEs2iMURtwbe/DPq/CBdSXYwDQB
 oqFyK3bdo0cT1g04HI0+U2f/Npk5MAphZA0DKrNy+Hj+xsKkZQp/+ZFw7+Lr3RIWFCex
 QY1S8DR3vdo1lh3RfG9Frd1qrkJjWv4XUN8iM+luOyxOo/8Imoj53AV8nuCoEVmBKJXa
 9org==
X-Gm-Message-State: APjAAAWyottoOIMNbC3EwSj6tnnqR+UBNhFoVt9VaIqbCdD+G/lFogh5
 xchiVX2JOpyVaFucA4kVHMXBfw==
X-Google-Smtp-Source: APXvYqzpivxtbUb0B7v6zlx/ySMgwFto9UtFrNAdrIenPrqyJui8YaGU9jpSJLvRjUkAWUdDjz8JUw==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr26074169wrm.98.1559746957134; 
 Wed, 05 Jun 2019 08:02:37 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e7sm3897403wmd.0.2019.06.05.08.02.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 08:02:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com
Subject: [PATCH v2] drm/panfrost: make devfreq optional again
Date: Wed,  5 Jun 2019 17:02:33 +0200
Message-Id: <20190605150233.32722-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N6a/FkfxXhOreQfJRYjMNcTKcCaCdcUNkyh7nQmvAxo=;
 b=nldZwfo8Gpf6s/aquD/M19FkkNSWDMyNJTAhOrXp9irA+hClfpHywxMuMMjSc8Xfq7
 ZG6EDFY1MD4zYQFaWn43mrsV4vG8B5QdmqFv+2UCn0iycC+1XwuofALnjxt+x1tm4YZp
 rgw1F0nw5lNYv3yp08nej0aC2c3Ic9ChT2teg/z/Ug/aG9zMYQ3luyO3Cm1Sib6RzyPb
 39UnADgXCBtDdb2wsfCINm8XA4rjkg5AC7XKyO2nsisfGHnPwD4rhG7GHULAJv4cSIB4
 ti5ltaKqL2vA84zmrPFvXvl796GeDdVzapF7jV/aUkJlOqEcxgUjXH45oKIBTe6Ytod/
 8TfA==
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
Cc: peron.clem@gmail.com, ezequiel@collabora.com,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGV2ZnJlcSBydW50aW1lIHVzYWdlIHdhcyBtYWRlIG1hbmRhdG9yeSwgdGh1cyBtYWtpbmcgcGFu
ZnJvc3QgZmFpbCB0byBwcm9iZQpvbiBBbWxvZ2ljIFM5MTIgU29DcyBtaXNzaW5nIHRoZSAib3Bl
cmF0aW5nLXBvaW50cy12MiIgcHJvcGVydHkuCk1ha2UgaXQgb3B0aW9uYWwgYWdhaW4sIGxlYXZp
bmcgUE1fREVWRlJFUSBzZWxlY3RlZCBieSBkZWZhdWx0LgoKRml4ZXM6IGYzNjE3YjQ0OWQgKCJk
cm0vcGFuZnJvc3Q6IFNlbGVjdCBkZXZmcmVxIikKU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJv
bmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKLSBmaXhl
ZCBlbHNlL2lmIGxvZ2ljIGluIHBhbmZyb3N0X2RldmZyZXFfaW5pdAoKIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAxMyArKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCmluZGV4IDI5ZmNmZmRmMmQ1Ny4uZGI3OTg1
MzJiMGI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
ZnJlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMK
QEAgLTE0MCw3ICsxNDAsOSBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVjdCBwYW5m
cm9zdF9kZXZpY2UgKnBmZGV2KQogCQlyZXR1cm4gMDsKIAogCXJldCA9IGRldl9wbV9vcHBfb2Zf
YWRkX3RhYmxlKCZwZmRldi0+cGRldi0+ZGV2KTsKLQlpZiAocmV0KQorCWlmIChyZXQgPT0gLUVO
T0RFVikgLyogT3B0aW9uYWwsIGNvbnRpbnVlIHdpdGhvdXQgZGV2ZnJlcSAqLworCQlyZXR1cm4g
MDsKKwllbHNlIGlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKIAlwYW5mcm9zdF9kZXZmcmVxX3Jl
c2V0KHBmZGV2KTsKQEAgLTE3MCw2ICsxNzIsOSBAQCB2b2lkIHBhbmZyb3N0X2RldmZyZXFfcmVz
dW1lKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogewogCWludCBpOwogCisJaWYgKCFw
ZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKQorCQlyZXR1cm47CisKIAlwYW5mcm9zdF9kZXZmcmVxX3Jl
c2V0KHBmZGV2KTsKIAlmb3IgKGkgPSAwOyBpIDwgTlVNX0pPQl9TTE9UUzsgaSsrKQogCQlwZmRl
di0+ZGV2ZnJlcS5zbG90W2ldLmJ1c3kgPSBmYWxzZTsKQEAgLTE3OSw2ICsxODQsOSBAQCB2b2lk
IHBhbmZyb3N0X2RldmZyZXFfcmVzdW1lKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQog
CiB2b2lkIHBhbmZyb3N0X2RldmZyZXFfc3VzcGVuZChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpw
ZmRldikKIHsKKwlpZiAoIXBmZGV2LT5kZXZmcmVxLmRldmZyZXEpCisJCXJldHVybjsKKwogCWRl
dmZyZXFfc3VzcGVuZF9kZXZpY2UocGZkZXYtPmRldmZyZXEuZGV2ZnJlcSk7CiB9CiAKQEAgLTE4
OCw2ICsxOTYsOSBAQCBzdGF0aWMgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3VwZGF0ZV91dGlsaXph
dGlvbihzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwgaQogCWt0aW1lX3Qgbm93OwogCWt0
aW1lX3QgbGFzdDsKIAorCWlmICghcGZkZXYtPmRldmZyZXEuZGV2ZnJlcSkKKwkJcmV0dXJuOwor
CiAJbm93ID0ga3RpbWVfZ2V0KCk7CiAJbGFzdCA9IHBmZGV2LT5kZXZmcmVxLnNsb3Rbc2xvdF0u
dGltZV9sYXN0X3VwZGF0ZTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
