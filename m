Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E60B959D7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF11F6E788;
	Tue, 20 Aug 2019 08:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A046E785
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:41:16 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id t16so11456856wra.6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4Y3CFbjNwiB1B+iBEVNDBDAoCejxlfh6zI1Bb1qZiE=;
 b=CS/Dp+zg5Tgq6QgSNPOZD5qykJqYkMnizKQC4vPTP+Gfczu2MooFSyIbH6MBvBz91A
 PIpu7HPlZRhgsZucvVb0ojOlDZJ+yhnjIz26uoruT5qO3RPUyG0mIT5g3nu1YQ1IZEN5
 d8YTNbyAOmXZkOnyaFBtjweO8Wq3+5z2NxeMNW7kRIJG/DiZlSaXfXR7I0lloBqNj50K
 IrSpxtpu6uHk7wBiUhaSBlNsIfogg2qtdAROI8yZf64qdJ7OYSwFoBqJ/wOqUrBqj1nR
 KYqCtG39wybZ4tjYGYzKcHJm1PUS/j5rzoO1jyJfArBtSkf87lZLrAQYHprUTncvCRCE
 6ebw==
X-Gm-Message-State: APjAAAW0Wz22aUdvb8TXQ7aiZV01WrO9/FjMz1z7vW0jTqb6uEjLsWSd
 zewWneVJM2N+zQWz9NTL3Oppig==
X-Google-Smtp-Source: APXvYqzVElNN6koqJa/MLyjtNn8tuQ5nmvel1gG2X/S1bupBdsBf82IjRZrX2thxmiDzXrm5ehO8tQ==
X-Received: by 2002:adf:ee4f:: with SMTP id w15mr32742170wro.337.1566290474464; 
 Tue, 20 Aug 2019 01:41:14 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 02/11] drm/meson: venc: make drm_display_mode const
Date: Tue, 20 Aug 2019 10:41:00 +0200
Message-Id: <20190820084109.24616-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4Y3CFbjNwiB1B+iBEVNDBDAoCejxlfh6zI1Bb1qZiE=;
 b=ASry5ZM5cg4Mj7+Gov+BV86kT6tt0zwKyCPGbFJdX0/Lu8alE9juf83M9UoeBkkeMB
 7MOHArPNau4G6zacpVCwL6YanyGVnykHAo6AKLPTc6nr6Do11bWbvxXmz7gk+b0rRy1A
 057DmSveWUXIDbN+clUhL+CxZGzO02unnS1XjPema2TJsi+MLlS6Rre6rr6N5uQ6unfX
 i4BzCDk2w6HSnBrYZbXbEeF1XvwHq/9JvV9B/7TXjHWseEVbgJC98KycMoegfyn96+Aj
 R2GkIg5HbW+iLN6G0lfxavZCaKoKJACnK0IPZ59zh776aY5aGWBVMrGYzdZPl+t8Vs1m
 yEcQ==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVmb3JlIHN3aXRjaGluZyB0byBicmlkZ2UgZnVuY3MsIG1ha2Ugc3VyZSBkcm1fZGlzcGxheV9t
b2RlIGlzIHBhc3NlZAphcyBjb25zdCB0byB0aGUgdmVuYyBmdW5jdGlvbnMuCgpTaWduZWQtb2Zm
LWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYyB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9tZXNv
bi9tZXNvbl92ZW5jLmggfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
dmVuYy5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYwppbmRleCAzZDQ3OTE3
OThhZTAuLmM4ZTk4NDBhZDQ1MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX3ZlbmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuYy5jCkBAIC05
NDYsNyArOTQ2LDcgQEAgYm9vbCBtZXNvbl92ZW5jX2hkbWlfdmVuY19yZXBlYXQoaW50IHZpYykK
IEVYUE9SVF9TWU1CT0xfR1BMKG1lc29uX3ZlbmNfaGRtaV92ZW5jX3JlcGVhdCk7CiAKIHZvaWQg
bWVzb25fdmVuY19oZG1pX21vZGVfc2V0KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYsIGludCB2aWMs
Ci0JCQkgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKKwkJCSAgICAgIGNvbnN0
IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKQogewogCXVuaW9uIG1lc29uX2hkbWlfdmVu
Y19tb2RlICp2bW9kZSA9IE5VTEw7CiAJdW5pb24gbWVzb25faGRtaV92ZW5jX21vZGUgdm1vZGVf
ZG10OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmgKaW5kZXggNTc2NzY4YmRkMDhkLi4xYWJk
Y2JkZjUxYzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jLmgK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuaApAQCAtNjAsNyArNjAsNyBA
QCBleHRlcm4gc3RydWN0IG1lc29uX2N2YnNfZW5jaV9tb2RlIG1lc29uX2N2YnNfZW5jaV9udHNj
Owogdm9pZCBtZXNvbl92ZW5jaV9jdmJzX21vZGVfc2V0KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYs
CiAJCQkgICAgICAgc3RydWN0IG1lc29uX2N2YnNfZW5jaV9tb2RlICptb2RlKTsKIHZvaWQgbWVz
b25fdmVuY19oZG1pX21vZGVfc2V0KHN0cnVjdCBtZXNvbl9kcm0gKnByaXYsIGludCB2aWMsCi0J
CQkgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7CisJCQkgICAgICBjb25zdCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7CiB1bnNpZ25lZCBpbnQgbWVzb25fdmVuY2lf
Z2V0X2ZpZWxkKHN0cnVjdCBtZXNvbl9kcm0gKnByaXYpOwogCiB2b2lkIG1lc29uX3ZlbmNfZW5h
YmxlX3ZzeW5jKHN0cnVjdCBtZXNvbl9kcm0gKnByaXYpOwotLSAKMi4yMi4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
