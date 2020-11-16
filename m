Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC262B4D47
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B54B6E042;
	Mon, 16 Nov 2020 17:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355926E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:38:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r17so19666558wrw.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RO6gVjdG8KAsdeDZko1zQc/smdj+DRpN8GOLXtDNvO8=;
 b=WirrMl8fUxp4CO5aIQmGr0dbC4i6LjQ5TaIvP1F18yQ9bcjLr9Ahv5ncmc+D+rDiB6
 jnXwyVZOgt697WzPOCzN35MCspjL1F3oMNO4pyQlFbKV/AqhvkypMuRxRQYT7fGT5qm7
 qoIltC6EqdtoQgVkm/2T9Ne73ONBGIgLLk6eKipqsjzPYB6rLceNhPW8BkX68K8qJ+0u
 gOl5LCqRWDmgdQzuSIwQXhlqFz6Wwc565XdPtH5Eap/jQVVI88UzJJ2k1AWvaVfFKnLP
 xQRuYkkDCZemobG+VP2trTK/7X/r5owlR/Xg6sjuoQ6grn7zRLl0HAvyrc3Z2BHBeROE
 M6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RO6gVjdG8KAsdeDZko1zQc/smdj+DRpN8GOLXtDNvO8=;
 b=MfHyT99snw89J+uL85KoAcrrcmUh1TpkRwokFxXVSCMZ8pp3Kh0XtwgVtcMQUrbhFe
 l/moIBLvLd9m23bFK2qrYPJYKEYI2A9rHIP1S4ArNiS7753DnzJVMQu/31+uyWvDXl8E
 wKXBkPZ1RqQyr8pbccewOdevsztgpxGwUoAIaDX1vBUsnQx47KvcW0HiUlLeb42wtSx8
 qSGenhaiOw/pRzYQEg5EOQC8MeCHLdwPi3NaHGikZWkidNDjujGgswiZ1nRJwIF/VnVD
 v+YPlGHKn7IQGtri3MhXLXRQM7LabPybGcNpqYt1r+2FTSg5LMK2IpEyQURaVkT2dzsF
 Qy4A==
X-Gm-Message-State: AOAM5314lxjsQ9+6xPKGxLzDS9oP8T9ATOtcsigNa64m360/BgE8pUGC
 dB+n3moC3qG5xE/12dH1Z3A3Ug==
X-Google-Smtp-Source: ABdhPJyDb6MSSsrxeaZ0Ak/n2fUOzh8hKJoprG7a4vmxqPmZhO/GHAqyfWZv5CNERO41midRYzTR3g==
X-Received: by 2002:a5d:634b:: with SMTP id b11mr19958992wrw.97.1605548279761; 
 Mon, 16 Nov 2020 09:37:59 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:59 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 41/43] drm/radeon/evergreen_cs: Move
 'r600_dma_cs_next_reloc()'s prototype to shared header
Date: Mon, 16 Nov 2020 17:36:58 +0000
Message-Id: <20201116173700.1830487-42-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173700.1830487-1-lee.jones@linaro.org>
References: <20201116173700.1830487-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yNjAwX2NzLmM6MjM0Mzo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBw
cm90b3R5cGUgZm9yIOKAmHI2MDBfZG1hX2NzX25leHRfcmVsb2PigJkgWy1XbWlzc2luZy1wcm90
b3R5cGVzXQogMjM0MyB8IGludCByNjAwX2RtYV9jc19uZXh0X3JlbG9jKHN0cnVjdCByYWRlb25f
Y3NfcGFyc2VyICpwLAogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+
CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQt
b2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmMgfCAzICstLQogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yNjAwLmggICAgICAgICB8IDQgKysrKwogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2Nz
LmMgICAgICB8IDEgKwogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9ldmVyZ3JlZW5fY3Mu
YyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmMKaW5kZXggNTNiNzVjZjIw
MTk1OC4uMGRlNzlmM2E3ZTNmZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9l
dmVyZ3JlZW5fY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5j
CkBAIC0yOCw2ICsyOCw3IEBACiAKICNpbmNsdWRlICJyYWRlb24uaCIKICNpbmNsdWRlICJyYWRl
b25fYXNpYy5oIgorI2luY2x1ZGUgInI2MDAuaCIKICNpbmNsdWRlICJldmVyZ3JlZW5kLmgiCiAj
aW5jbHVkZSAiZXZlcmdyZWVuX3JlZ19zYWZlLmgiCiAjaW5jbHVkZSAiY2F5bWFuX3JlZ19zYWZl
LmgiCkBAIC0zNyw4ICszOCw2IEBACiAKICNkZWZpbmUgUkVHX1NBRkVfQk1fU0laRSBBUlJBWV9T
SVpFKGV2ZXJncmVlbl9yZWdfc2FmZV9ibSkKIAotaW50IHI2MDBfZG1hX2NzX25leHRfcmVsb2Mo
c3RydWN0IHJhZGVvbl9jc19wYXJzZXIgKnAsCi0JCQkgICBzdHJ1Y3QgcmFkZW9uX2JvX2xpc3Qg
Kipjc19yZWxvYyk7CiBzdHJ1Y3QgZXZlcmdyZWVuX2NzX3RyYWNrIHsKIAl1MzIJCQlncm91cF9z
aXplOwogCXUzMgkJCW5iYW5rczsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cjYwMC5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmgKaW5kZXggZTY2ZWY1ODcwNmNk
OC4uZGJkZmY0NTY4NTE2YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAw
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmgKQEAgLTI4LDEwICsyOCwxNCBA
QAogI2lmbmRlZiBfX1I2MDBfSF9fCiAjZGVmaW5lIF9fUjYwMF9IX18KIAorc3RydWN0IHJhZGVv
bl9ib19saXN0Oworc3RydWN0IHJhZGVvbl9jc19wYXJzZXI7CiBzdHJ1Y3QgcmFkZW9uX2Rldmlj
ZTsKIAogdTMyIHI2MDBfZ3B1X2NoZWNrX3NvZnRfcmVzZXQoc3RydWN0IHJhZGVvbl9kZXZpY2Ug
KnJkZXYpOwogaW50IHI2MDBfaWhfcmluZ19hbGxvYyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dik7CiB2b2lkIHI2MDBfaWhfcmluZ19maW5pKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsK
IAoraW50IHI2MDBfZG1hX2NzX25leHRfcmVsb2Moc3RydWN0IHJhZGVvbl9jc19wYXJzZXIgKnAs
CisJCQkgICBzdHJ1Y3QgcmFkZW9uX2JvX2xpc3QgKipjc19yZWxvYyk7CiAjZW5kaWYJCQkJLyog
X19SNjAwX0hfXyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwX2Nz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfY3MuYwppbmRleCBmMjBiNjE5NDY2ODE2
Li5kYzY4ZTUzOGQ1YTk3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBf
Y3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDBfY3MuYwpAQCAtMjksNiArMjks
NyBAQAogCiAjaW5jbHVkZSAicmFkZW9uLmgiCiAjaW5jbHVkZSAicmFkZW9uX2FzaWMuaCIKKyNp
bmNsdWRlICJyNjAwLmgiCiAjaW5jbHVkZSAicjYwMGQuaCIKICNpbmNsdWRlICJyNjAwX3JlZ19z
YWZlLmgiCiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
