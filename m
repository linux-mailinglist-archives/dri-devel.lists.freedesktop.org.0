Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ABC30E31
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 14:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8FA893C0;
	Fri, 31 May 2019 12:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0E2893C0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 12:37:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v22so5857053wml.1
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2019 05:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=otWpRWovyibIzWGQxZ2ewz/DXnaNYBAyEBAMJ0/uJvw=;
 b=pKJwyxZMmciSjILJPV6uE3EAgkkrpQ8Z75zpAeHxYPStiTkMxvNcPQ8vWX0V6lF+CM
 2LU9ob4G5cNoDIghdX6TKMv8sn8qnsfRbnR9uBiv+VhQRruZSdnVKzXzPIwhrOTfmS83
 jTd7FZ7wHERAuV5eElXkMuaKuScJUkiZHjgKsCGkgAtKJmV0Zxx7xVCaUNMQ38NInBoa
 v5NEqIAerA1UdBTjAEzpTRToQ+iDMOUSRmZ8eR6sOKxVyZCpXnp/M/zKgKkcdftom/oq
 7w48POM4pCbLDHCgFyQTH+4rR/SgYwYuX8t/OFvWxN4Fqjx/imFBxb5ZKdTVxrXfyeep
 xDIw==
X-Gm-Message-State: APjAAAXV/v6eiLXu70qKf6ddElFaaOH/OTeKrGKhmirl0Qr5W0+LW6+7
 bmOyzOhwTciEiWaF4oPwkcCyGjXGAQflVg==
X-Google-Smtp-Source: APXvYqyCOnEuD+thLqcpVTlVWcw6xrAjx2J/V/UobpeZC9UJPBCq0hq3lAals4bKr1jiyJf9HMd9Nw==
X-Received: by 2002:a1c:b706:: with SMTP id h6mr5513165wmf.119.1559306274198; 
 Fri, 31 May 2019 05:37:54 -0700 (PDT)
Received: from bender.home (amarseille-652-1-291-131.w109-208.abo.wanadoo.fr.
 [109.208.94.131])
 by smtp.gmail.com with ESMTPSA id j66sm7472655wmb.24.2019.05.31.05.37.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 31 May 2019 05:37:53 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robh@kernel.org,
	tomeu.vizoso@collabora.com
Subject: [PATCH] drm/panfrost: make devfreq optional again
Date: Fri, 31 May 2019 14:37:46 +0200
Message-Id: <20190531123746.613-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=otWpRWovyibIzWGQxZ2ewz/DXnaNYBAyEBAMJ0/uJvw=;
 b=m0PGEsMz8Pj70WC0msEi9fyIBsp9/eIroZUQ5V1YsFDolYpIxsLrGp4sOZG+V9tX2Y
 uRSukOMtHB9bLzn7nqEczIf+XClAJApcbQz2Qko1/VtHmA9tak8X/0klUKH/0fszo+jO
 uwih3RVj/RU93atZPSl6MLSrdMVuOXot39DwmmfxaPeJp0EOmL8z9mjlpqJFFvc7JMjq
 W6VghRYgolQGoaF9WOjhHgYDFCTVxLr246QQrBAqk1maHBY/TZRu9i39K4+JxB/WVFuw
 aQZ4jSFRnnyaT6+akG7mOnjnbahT/uaRpVNoA4PqBq3DDBeR34+xWexYig7tXDWXpyfj
 2FUQ==
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
Cc: ezequiel@collabora.com, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGV2ZnJlcSBydW50aW1lIHVzYWdlIHdhcyBtYWRlIG1hbmRhdG9yeSwgdGh1cyBtYWtpbmcgcGFu
ZnJvc3QgZmFpbCB0byBwcm9iZQpvbiBBbWxvZ2ljIFM5MTIgU29DcyBtaXNzaW4gdGhlICJvcGVy
YXRpbmctcG9pbnRzLXYyIiBwcm9wZXJ0eS4KTWFrZSBpdCBvcHRpb25hbCBhZ2FpbiwgbGVhdmlu
ZyBQTV9ERVZGUkVRIGlzIHNlbGVjdGVkIGJ5IGRlZmF1bHQuCgpGaXhlczogZjM2MTdiNDQ5ZCAo
ImRybS9wYW5mcm9zdDogU2VsZWN0IGRldmZyZXEiKQpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0
cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDEzICsrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKaW5kZXggMjlmY2ZmZGYyZDU3Li5kYzc1Zjk5YWQ1M2Ig
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwpAQCAtMTQw
LDcgKzE0MCw5IEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0IHBhbmZyb3N0X2Rl
dmljZSAqcGZkZXYpCiAJCXJldHVybiAwOwogCiAJcmV0ID0gZGV2X3BtX29wcF9vZl9hZGRfdGFi
bGUoJnBmZGV2LT5wZGV2LT5kZXYpOwotCWlmIChyZXQpCisJaWYgKHJldCA9PSAtRU5PREVWKSAv
KiBPcHRpb25hbCwgY29udGludWUgd2l0aG91dCBkZXZmcmVxICovCisJCXJldHVybiAwOworCWVs
c2UKIAkJcmV0dXJuIHJldDsKIAogCXBhbmZyb3N0X2RldmZyZXFfcmVzZXQocGZkZXYpOwpAQCAt
MTcwLDYgKzE3Miw5IEBAIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV9yZXN1bWUoc3RydWN0IHBhbmZy
b3N0X2RldmljZSAqcGZkZXYpCiB7CiAJaW50IGk7CiAKKwlpZiAoIXBmZGV2LT5kZXZmcmVxLmRl
dmZyZXEpCisJCXJldHVybjsKKwogCXBhbmZyb3N0X2RldmZyZXFfcmVzZXQocGZkZXYpOwogCWZv
ciAoaSA9IDA7IGkgPCBOVU1fSk9CX1NMT1RTOyBpKyspCiAJCXBmZGV2LT5kZXZmcmVxLnNsb3Rb
aV0uYnVzeSA9IGZhbHNlOwpAQCAtMTc5LDYgKzE4NCw5IEBAIHZvaWQgcGFuZnJvc3RfZGV2ZnJl
cV9yZXN1bWUoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAKIHZvaWQgcGFuZnJvc3Rf
ZGV2ZnJlcV9zdXNwZW5kKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogeworCWlmICgh
cGZkZXYtPmRldmZyZXEuZGV2ZnJlcSkKKwkJcmV0dXJuOworCiAJZGV2ZnJlcV9zdXNwZW5kX2Rl
dmljZShwZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKTsKIH0KIApAQCAtMTg4LDYgKzE5Niw5IEBAIHN0
YXRpYyB2b2lkIHBhbmZyb3N0X2RldmZyZXFfdXBkYXRlX3V0aWxpemF0aW9uKHN0cnVjdCBwYW5m
cm9zdF9kZXZpY2UgKnBmZGV2LCBpCiAJa3RpbWVfdCBub3c7CiAJa3RpbWVfdCBsYXN0OwogCisJ
aWYgKCFwZmRldi0+ZGV2ZnJlcS5kZXZmcmVxKQorCQlyZXR1cm47CisKIAlub3cgPSBrdGltZV9n
ZXQoKTsKIAlsYXN0ID0gcGZkZXYtPmRldmZyZXEuc2xvdFtzbG90XS50aW1lX2xhc3RfdXBkYXRl
OwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
