Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD232B4CDC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AAD89FE6;
	Mon, 16 Nov 2020 17:30:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1EB89FA9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:30:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m6so2429971wrg.7
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oQB5rAR+1+kEveAEir1T88yOeq9CZP66J4NDJ9xsMf8=;
 b=qfvsLkNfBDVcez+mP8sjEQQ2PAy0RRLcrkAePUGE8FPOg5SROKwYV7r3WaEAHsSl8q
 82z1+lEhHRxnJWYkIyDvOV/SBBEbIZ5LXw4FQCkFeL6yTqDc0iJ7p3uHVcgvkWj/1K3p
 llSlffDSlSjk49XcQEMEPFfawSiO6P0lomMGwzZcl6YyrchqtiH15P9BE1jRABqhPS94
 2oJz4PH9Vn3t5KP+9FtHMqRMCa1vPMBe5ituVb9WjxKv4gixjTE4YNYnMDSgRXv5ryhX
 bInIpfnWVcgCL0dV3+zAS9swCq7gx/SrASVAc85BqnKz23zIrOuI4k5cV7JITZ5yyeTo
 +FTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oQB5rAR+1+kEveAEir1T88yOeq9CZP66J4NDJ9xsMf8=;
 b=E7Bj/W5i3vHhyG1t/btTu6l4vWkwigxNSjhnulGzVyRCYtoq20MtJic+EAtXee0hmB
 jE60cK3OZgDdmXXoeCIbdIZmq02W9jMpKs6qnVEXeywF4TV1wv0BvX1SnCM8a+HSxb/F
 JPptYOusz8eleQtgsxyMjmljyPOc/DHS0r9OUJb+Vxr46TKaFwM7rUeueWQbkqFCpw3m
 VXyngXlVKe2sAeHHx2XZ72HZTLvHP6z3yzfSb5ca28QWLYI0ALBHvyPklEvYupg4Mxgb
 aqbHJ3XQfS4VbJ2lCcDdw4dEC0VljmS4hbDJECMC1yJ5E2/0mo2XTxWJdtZlNBxzxNTJ
 khag==
X-Gm-Message-State: AOAM530mb9pX6NSCwqgqZf+3/ikOTEUvwumZEpgkEktl18dz37mJMl4J
 KaAenxPHMTJ1Vb83aILNe9Lf6A==
X-Google-Smtp-Source: ABdhPJx67FcvrUuJao/V/YluYnVebJQCRA/5ZbDROAXO4liKX3AvUnuGTXJX2Cwa9GTXjayZxyA4Sw==
X-Received: by 2002:a5d:4e4e:: with SMTP id r14mr3868933wrt.308.1605547818474; 
 Mon, 16 Nov 2020 09:30:18 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id f23sm20054854wmb.43.2020.11.16.09.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:30:17 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 07/43] drm/radeon/radeon_legacy_encoders: Move
 'radeon_add_legacy_encoder's prototype to shared location
Date: Mon, 16 Nov 2020 17:29:29 +0000
Message-Id: <20201116173005.1825880-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116173005.1825880-1-lee.jones@linaro.org>
References: <20201116173005.1825880-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5X2VuY29kZXJzLmM6MTc0NjoxOiB3YXJuaW5n
OiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl9hZGRfbGVnYWN5X2VuY29kZXLi
gJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQogMTc0NiB8IHJhZGVvbl9hZGRfbGVnYWN5X2VuY29k
ZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdWludDMyX3QgZW5jb2Rlcl9lbnVtLCB1aW50MzJf
dCBzdXBwb3J0ZWRfZGV2aWNlKQogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpDYzogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7Zu
aWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRA
bGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBT
ZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1l
ZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNp
Z25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYyAgICAgICAgfCA2ICstLS0tLQogZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29tYmlvcy5jICAgICAgICAgfCA2ICstLS0tLQog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5X2VuY29kZXJzLmggfCAyICsrCiAz
IGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmMKaW5kZXggNzFiZjJlZDE3MjY5Ny4uY2M4
MDY1MWIyNTc3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRv
bWJpb3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5jCkBA
IC0zNSwxNiArMzUsMTIgQEAKICNpbmNsdWRlICJhdG9tLWJpdHMuaCIKICNpbmNsdWRlICJyYWRl
b25fYXNpYy5oIgogI2luY2x1ZGUgInJhZGVvbl9hdG9tYmlvcy5oIgorI2luY2x1ZGUgInJhZGVv
bl9sZWdhY3lfZW5jb2RlcnMuaCIKIAogZXh0ZXJuIHZvaWQKIHJhZGVvbl9hZGRfYXRvbV9lbmNv
ZGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVpbnQzMl90IGVuY29kZXJfZW51bSwKIAkJCXVp
bnQzMl90IHN1cHBvcnRlZF9kZXZpY2UsIHUxNiBjYXBzKTsKIAotLyogZnJvbSByYWRlb25fbGVn
YWN5X2VuY29kZXIuYyAqLwotZXh0ZXJuIHZvaWQKLXJhZGVvbl9hZGRfbGVnYWN5X2VuY29kZXIo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdWludDMyX3QgZW5jb2Rlcl9lbnVtLAotCQkJICB1aW50
MzJfdCBzdXBwb3J0ZWRfZGV2aWNlKTsKLQogdW5pb24gYXRvbV9zdXBwb3J0ZWRfZGV2aWNlcyB7
CiAJc3RydWN0IF9BVE9NX1NVUFBPUlRFRF9ERVZJQ0VTX0lORk8gaW5mbzsKIAlzdHJ1Y3QgX0FU
T01fU1VQUE9SVEVEX0RFVklDRVNfSU5GT18yIGluZm9fMjsKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX2NvbWJpb3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2NvbWJpb3MuYwppbmRleCBkM2MwNGRmN2U3NWQ3Li5mZjIxMzUwNTljMDcxIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb21iaW9zLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY29tYmlvcy5jCkBAIC0zMSw2ICszMSw3IEBACiAj
aW5jbHVkZSA8ZHJtL3JhZGVvbl9kcm0uaD4KIAogI2luY2x1ZGUgInJhZGVvbi5oIgorI2luY2x1
ZGUgInJhZGVvbl9sZWdhY3lfZW5jb2RlcnMuaCIKICNpbmNsdWRlICJhdG9tLmgiCiAKICNpZmRl
ZiBDT05GSUdfUFBDX1BNQUMKQEAgLTQwLDExICs0MSw2IEBACiAjaW5jbHVkZSA8YXNtL3Byb20u
aD4KICNlbmRpZiAvKiBDT05GSUdfUFBDX1BNQUMgKi8KIAotLyogZnJvbSByYWRlb25fbGVnYWN5
X2VuY29kZXIuYyAqLwotZXh0ZXJuIHZvaWQKLXJhZGVvbl9hZGRfbGVnYWN5X2VuY29kZXIoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgdWludDMyX3QgZW5jb2Rlcl9lbnVtLAotCQkJICB1aW50MzJf
dCBzdXBwb3J0ZWRfZGV2aWNlKTsKLQogLyogb2xkIGxlZ2FjeSBBVEkgQklPUyByb3V0aW5lcyAq
LwogCiAvKiBDT01CSU9TIHRhYmxlIG9mZnNldHMgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2xlZ2FjeV9lbmNvZGVycy5oIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fbGVnYWN5X2VuY29kZXJzLmgKaW5kZXggYTgwYjM4NzU1OWQ0ZC4uZjRjNzQz
MjI2N2U2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5
X2VuY29kZXJzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5X2Vu
Y29kZXJzLmgKQEAgLTMwLDUgKzMwLDcgQEAKIAogdm9pZCByYWRlb25fbGVnYWN5X2JhY2tsaWdo
dF9pbml0KHN0cnVjdCByYWRlb25fZW5jb2RlciAqcmFkZW9uX2VuY29kZXIsCiAJCQkJICBzdHJ1
Y3QgZHJtX2Nvbm5lY3RvciAqZHJtX2Nvbm5lY3Rvcik7Cit2b2lkIHJhZGVvbl9hZGRfbGVnYWN5
X2VuY29kZXIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdWludDMyX3QgZW5jb2Rlcl9lbnVtLAor
CQkJICAgICAgIHVpbnQzMl90IHN1cHBvcnRlZF9kZXZpY2UpOwogCiAjZW5kaWYJCQkJLyogX19S
QURFT05fTEVHQUNZX0VOQ09ERVJTX0hfXyAqLwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
