Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A1B2B1C3A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 14:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D236E4FF;
	Fri, 13 Nov 2020 13:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C79F6E526
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 13:50:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o15so9987226wru.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Nov 2020 05:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yt85C2+NzGAlI5emEV4T+vNOl5giBIbnEfifffD7CnE=;
 b=Cy0FIFBOqKt9Owiq+Dqg7+C23huzVDETryFyww7hngaX44EDG2i3SfAegg/ufoaL2u
 uzX5zuxtv9ViDaCFPsw8oXmaaEtTFHVWqtn6aZ7Bvype0KXwKlw2IXtMoy4hRUdSmi0C
 XlbjQlhdV0BLzWGUf1FDhesPOdHZTy0bXVpBs8gWwToqFsTfXI1NibEEdysQ8CdwzdaH
 Rb+7WADVUWE0eDtwkGg3n46j/NSuLXVSqWKAMRLw/kmi/Q/MDBAg5abRJbcVE+XvI1TD
 uoRTVC/CIqtQpSsEKCrHaagzSqer6TxrW5YMW2V4zVC1UhYE2rLoBCyGTamzEAqx53j6
 Y7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yt85C2+NzGAlI5emEV4T+vNOl5giBIbnEfifffD7CnE=;
 b=TStqZQi3M//fasriDuBkrCvfLnwQKy7VQAGW6laLewfwxw5E6q1KpZAbLEWpR9QfzK
 jmVtxhEHCizQCAe4BX3iaVT+mZ+U0M8KAy0BRP4Ivkh2EY5LkpoiN5AbcRZ/Gx/HL5na
 sPJIj6B9Y7eUpEZBmRqo12DJr+HmxPfQaWWc1IA3IkD40q2Q70kxIW+gMoZ4tDbzYnzs
 IvkoQc4xMzq7J+2CFFe/K1yAyLDc8rQkCvkvphXql1XQcKgJa03UngK+32LALlY8j5NQ
 7A6p8R1nh+833sddkuQza6UPhVPQHUel6l8FQM/m5+8T26ADaFqYVua2TF7eLzemep8z
 +U7w==
X-Gm-Message-State: AOAM532DbEmgWxmoY2oAqJzpmkzHLoQx4kirm68SZiB4lsOjrH9a3vMb
 xaPEhmRdwfTD4OuLReLP823nZQ==
X-Google-Smtp-Source: ABdhPJyB1aM/U0SYQBQS2sQ434uZIWEyyXQHKmq7NJg+pZgX9+e1LYtp8/RyoqCFrQV32ZTz5voxrw==
X-Received: by 2002:adf:ebcb:: with SMTP id v11mr3575994wrn.408.1605275399152; 
 Fri, 13 Nov 2020 05:49:59 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:49:58 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 14/40] drm/meson/meson_venc: Make local function
 'meson_venc_hdmi_get_dmt_vmode' static
Date: Fri, 13 Nov 2020 13:49:12 +0000
Message-Id: <20201113134938.4004947-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
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
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX3ZlbmMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fdmVuYy5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZlbmMuYwppbmRl
eCBmOTNjNzI1YjZmMDJkLi41ZTIyMzZlYzE4OWZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVzb24vbWVzb25fdmVuYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92
ZW5jLmMKQEAgLTg5MCw4ICs4OTAsOCBAQCBib29sIG1lc29uX3ZlbmNfaGRtaV9zdXBwb3J0ZWRf
dmljKGludCB2aWMpCiB9CiBFWFBPUlRfU1lNQk9MX0dQTChtZXNvbl92ZW5jX2hkbWlfc3VwcG9y
dGVkX3ZpYyk7CiAKLXZvaWQgbWVzb25fdmVuY19oZG1pX2dldF9kbXRfdm1vZGUoY29uc3Qgc3Ry
dWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCi0JCQkJICAgdW5pb24gbWVzb25faGRtaV92ZW5j
X21vZGUgKmRtdF9tb2RlKQorc3RhdGljIHZvaWQgbWVzb25fdmVuY19oZG1pX2dldF9kbXRfdm1v
ZGUoY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUsCisJCQkJCSAgdW5pb24gbWVz
b25faGRtaV92ZW5jX21vZGUgKmRtdF9tb2RlKQogewogCW1lbXNldChkbXRfbW9kZSwgMCwgc2l6
ZW9mKCpkbXRfbW9kZSkpOwogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
