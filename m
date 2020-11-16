Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7392B4DB5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:41:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD816E9FE;
	Mon, 16 Nov 2020 17:41:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08C96E9F5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:41:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o15so19658373wru.6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i5j9nO6ToQvZzh6GJLxxL5NsV6KcH6bI4EH07Iu89H8=;
 b=YVgEUmjSraSC4YQk46p6uPgedVESFPJ3UsJO7Tu4f7fuWARoplJS6YC3o97e91JkZv
 cBJvp40l0dgXRQaLlTpEuC2Q0uQjxFAwNIn+7nMhNDcFl9mgKct6xkqQsfkHOtazXz+2
 0vtjIjV1rLHuQlghb40vINrSHBkLUdnkRlbaH3ZaQRgQRO3OPNBtpNrxK6JPR7CTnpxq
 tdZwoh0efmPizM+AxDTig/MH+rwvLAxSZ445H6Y9Te1xq5aiCAH4ok1RxdGRQKkSivx2
 HbtPLYE+ge6oxVRG/WTMb8LBqTG8kvBwxC8wW8p0HVl4kN8Y7Tn8G1Id1wAgUtBe/mLD
 s0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i5j9nO6ToQvZzh6GJLxxL5NsV6KcH6bI4EH07Iu89H8=;
 b=TxeRwMobO9QMzbw7t6N3kFMbWqEP7VQ5Fw+susqvTlkzKDGAA77EnCgBuGcOL8lV9Y
 iOLYBqz/ROXLm80pcjRRoXqKS8IeG8X1del20eEVkv6h8/aLKv6w+P5Lum2aBkkU+ivO
 bVRLauJoe56+AAOb6oAD1I8s1OjbuHUIYOzDIfkupenMab38423nVgK2uKR93G04u3eP
 MfaBwhO8hI0x6gMzv8V9oQPK0UOb/v3g7K7By05sdZilk6pqe8J/JQJv4yktdEUxLPFl
 v+Y27JKr2b6VG6Xub9Sx6xi2cj89BH8+iqw0+nnmTg/cxcdVbHu9H8L66mn7vTY6I4al
 46eA==
X-Gm-Message-State: AOAM530Mq0ivM5wck1D65YQGQ+8xW1x91gMWrw4Kf1db4yjmGM/9h0kg
 6QaewUZY6zkAjFQv9oAEjDbzsg==
X-Google-Smtp-Source: ABdhPJzrDkYQrEjZLrNb+YUFl0cr5yDvtdbI8mt3oNtaaL8k2XZ9HKXWkCH/mgSrQlJyfuBrthO8LA==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr20417522wru.362.1605548497365; 
 Mon, 16 Nov 2020 09:41:37 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/42] drm/meson/meson_venc: Make local function
 'meson_venc_hdmi_get_dmt_vmode' static
Date: Mon, 16 Nov 2020 17:40:43 +0000
Message-Id: <20201116174112.1833368-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYzo4OTM6Njogd2FybmluZzogbm8gcHJldmlvdXMg
cHJvdG90eXBlIGZvciDigJhtZXNvbl92ZW5jX2hkbWlfZ2V0X2RtdF92bW9kZeKAmSBbLVdtaXNz
aW5nLXByb3RvdHlwZXNdCgpDYzogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUu
Y29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNv
bT4KQ2M6IEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPgpDYzogTWFydGluIEJs
dW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KQ2M6IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnClNpZ25lZC1v
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+ClJldmlld2VkLWJ5OiBOZWls
IEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX3ZlbmMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24v
bWVzb25fdmVuYy5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYwppbmRleCBm
OTNjNzI1YjZmMDJkLi41ZTIyMzZlYzE4OWZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fdmVuYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5j
LmMKQEAgLTg5MCw4ICs4OTAsOCBAQCBib29sIG1lc29uX3ZlbmNfaGRtaV9zdXBwb3J0ZWRfdmlj
KGludCB2aWMpCiB9CiBFWFBPUlRfU1lNQk9MX0dQTChtZXNvbl92ZW5jX2hkbWlfc3VwcG9ydGVk
X3ZpYyk7CiAKLXZvaWQgbWVzb25fdmVuY19oZG1pX2dldF9kbXRfdm1vZGUoY29uc3Qgc3RydWN0
IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCi0JCQkJICAgdW5pb24gbWVzb25faGRtaV92ZW5jX21v
ZGUgKmRtdF9tb2RlKQorc3RhdGljIHZvaWQgbWVzb25fdmVuY19oZG1pX2dldF9kbXRfdm1vZGUo
Y29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCisJCQkJCSAgdW5pb24gbWVzb25f
aGRtaV92ZW5jX21vZGUgKmRtdF9tb2RlKQogewogCW1lbXNldChkbXRfbW9kZSwgMCwgc2l6ZW9m
KCpkbXRfbW9kZSkpOwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
