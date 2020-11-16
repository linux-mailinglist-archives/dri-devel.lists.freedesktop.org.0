Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2402B4D4F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C406E9EC;
	Mon, 16 Nov 2020 17:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318236E061
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a65so32075wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6NqivdSoS8aJrg9SJeB6kGm72B7/tU0UIKTvRD3ut9A=;
 b=C1Q+CHNZ+SnTO8vHJOinWbhc3vH3s30mod5pEkymEsYScz0GtjCroxKRsb7NQwoWde
 KV66Y0C0gQr6Krra8A9aDTX9GBdHGPWgrxfye5m2RGA5tOY5LqLYrKaX7x0Rb/gvR7hV
 zW1d6+ZnhsrFZ7oo1nbFKaf0UMMviNLMMDvZse1OretnkhtHys6LnzODOQNxHPpIoQG9
 KBOzzhpsuSNKHFAT5JxEjV6Jwd5h4xxOa5XhZKacJ43uzU9jnNQ9BVIxwGC6oh2JnwKN
 GLMxyUrLpqisq/HpJFKXLMi6C9Dgt5GcOrNkfmuxtlX1EEGwqudN1Lm+qCs+1pukF8XV
 niXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6NqivdSoS8aJrg9SJeB6kGm72B7/tU0UIKTvRD3ut9A=;
 b=BY0ALcxfZyT7ly5qfFIPU+LyBHrtHvi+ebm0DaT5iAtxWtWDADrQDIKbmTUHyUEtkV
 2HVMJv9nlmo4iq+gdVK4FwKJHsZNHSFu3UwytrhTfBors/uBNb7SoQJJa7gO7h2ln+hw
 RwpvXjjSRiNsFa2YysKV9t3rM39IcjslDP+ktfvseumuqQSe3rgUkGnlwWdIDm0+frkx
 KtP5y3VAsVRJUEv/eQ+dLd7QujhYlld17zR6Zm0lkfm2Feep93ew201Cu8nbhU0e4Chs
 QlRf0ucGSJwcoR++XrNtx5IM2rrp9/tWS1iph3T+NGK4T4CmzDcf5QIcSsz3AxVwEYT6
 KT1A==
X-Gm-Message-State: AOAM5322amMUudUmltz1Il7TAMmUAzADc/jBQj/zlusRtxeFpIFAxctR
 0whpipzgK4TAzana5WvkZZsFag==
X-Google-Smtp-Source: ABdhPJwMJtLAFYyr97EyAPYpJ7qyi5IqvZswjgm4XdVLqLLHFtaXQNWZ3VEoGPX14yGcY/n1XEUokg==
X-Received: by 2002:a1c:e3c1:: with SMTP id a184mr16024wmh.88.1605548255825;
 Mon, 16 Nov 2020 09:37:35 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:35 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/43] drm/radeon/cik: Move 'r600_ih_ring_{alloc,
 fini}()'s prototypes to shared header
Date: Mon, 16 Nov 2020 17:36:39 +0000
Message-Id: <20201116173700.1830487-23-lee.jones@linaro.org>
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
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yNjAwLmM6MzQ4MDo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmHI2MDBfaWhfcmluZ19hbGxvY+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNd
CiAzNDgwIHwgaW50IHI2MDBfaWhfcmluZ19hbGxvYyhzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dikKIHwgXn5+fn5+fn5+fn5+fn5+fn5+CiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3I2MDAuYzoz
NTE2OjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcjYwMF9paF9yaW5n
X2ZpbmnigJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogMzUxNiB8IHZvaWQgcjYwMF9paF9yaW5n
X2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiB8IF5+fn5+fn5+fn5+fn5+fn5+CgpD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBT
dW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxp
bnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8u
b3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuYyAgfCAzICstLQogZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yNjAwLmggfCAyICsrCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMgICB8IDMgKy0t
CiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9jaWsuYwppbmRleCAzMTVjNGYzZGYzNjU2Li45ODBiNTBkMDQ2Y2JjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vY2lrLmMKQEAgLTM0LDYgKzM0LDcgQEAKICNpbmNsdWRlICJjaWtfYmxpdF9zaGFkZXJzLmgi
CiAjaW5jbHVkZSAiY2lrZC5oIgogI2luY2x1ZGUgImNsZWFyc3RhdGVfY2kuaCIKKyNpbmNsdWRl
ICJyNjAwLmgiCiAjaW5jbHVkZSAicmFkZW9uLmgiCiAjaW5jbHVkZSAicmFkZW9uX2FzaWMuaCIK
ICNpbmNsdWRlICJyYWRlb25fYXVkaW8uaCIKQEAgLTEyNSw4ICsxMjYsNiBAQCBNT0RVTEVfRklS
TVdBUkUoInJhZGVvbi9tdWxsaW5zX21lYy5iaW4iKTsKIE1PRFVMRV9GSVJNV0FSRSgicmFkZW9u
L211bGxpbnNfcmxjLmJpbiIpOwogTU9EVUxFX0ZJUk1XQVJFKCJyYWRlb24vbXVsbGluc19zZG1h
LmJpbiIpOwogCi1leHRlcm4gaW50IHI2MDBfaWhfcmluZ19hbGxvYyhzdHJ1Y3QgcmFkZW9uX2Rl
dmljZSAqcmRldik7Ci1leHRlcm4gdm9pZCByNjAwX2loX3JpbmdfZmluaShzdHJ1Y3QgcmFkZW9u
X2RldmljZSAqcmRldik7CiBleHRlcm4gdm9pZCBzaV92cmFtX2d0dF9sb2NhdGlvbihzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldiwgc3RydWN0IHJhZGVvbl9tYyAqbWMpOwogZXh0ZXJuIHZvaWQg
c2lfcmxjX3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIGV4dGVybiB2b2lkIHNp
X2luaXRfdXZkX2ludGVybmFsX2NnKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcjYwMC5oIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yNjAwLmgKaW5kZXggMmEzOTE1ZjAwMzllNC4uZTY2ZWY1ODcwNmNkOCAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yNjAwLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yNjAwLmgKQEAgLTMxLDUgKzMxLDcgQEAKIHN0cnVjdCByYWRlb25fZGV2aWNlOwogCiB1
MzIgcjYwMF9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7
CitpbnQgcjYwMF9paF9yaW5nX2FsbG9jKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKK3Zv
aWQgcjYwMF9paF9yaW5nX2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogCiAjZW5k
aWYJCQkJLyogX19SNjAwX0hfXyAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9zaS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaS5jCmluZGV4IDQ1MDc2YzI3ZDdkZWQu
LmQwNDA3MTQ1YzA3YjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmMKQEAgLTMzLDYgKzMzLDcgQEAKICNpbmNs
dWRlICJhdG9tLmgiCiAjaW5jbHVkZSAiY2xlYXJzdGF0ZV9zaS5oIgogI2luY2x1ZGUgImV2ZXJn
cmVlbi5oIgorI2luY2x1ZGUgInI2MDAuaCIKICNpbmNsdWRlICJyYWRlb24uaCIKICNpbmNsdWRl
ICJyYWRlb25fYXNpYy5oIgogI2luY2x1ZGUgInJhZGVvbl9hdWRpby5oIgpAQCAtMTI4LDggKzEy
OSw2IEBAIHN0YXRpYyB2b2lkIHNpX3BjaWVfZ2VuM19lbmFibGUoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpOwogc3RhdGljIHZvaWQgc2lfcHJvZ3JhbV9hc3BtKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKIGV4dGVybiB2b2lkIHN1bW9fcmxjX2Zpbmkoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpOwogZXh0ZXJuIGludCBzdW1vX3JsY19pbml0KHN0cnVjdCByYWRlb25fZGV2aWNl
ICpyZGV2KTsKLWV4dGVybiBpbnQgcjYwMF9paF9yaW5nX2FsbG9jKHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KTsKLWV4dGVybiB2b2lkIHI2MDBfaWhfcmluZ19maW5pKHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2KTsKIHN0YXRpYyB2b2lkIHNpX2VuYWJsZV9ndWlfaWRsZV9pbnRlcnJ1cHQo
c3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsCiAJCQkJCSBib29sIGVuYWJsZSk7CiBzdGF0aWMg
dm9pZCBzaV9pbml0X3BnKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKLS0gCjIuMjUuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
