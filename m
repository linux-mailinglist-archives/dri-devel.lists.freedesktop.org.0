Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39ADA3622A6
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 318386EC27;
	Fri, 16 Apr 2021 14:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CD86EC21
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:08 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id x12so21714348ejc.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N0J5Bxl7vhdML2GM3ovQErwfTec12UCEbn+lGIO9lAc=;
 b=Y9TWecd7BKcNNCyqA8M5xkHBbkrb0RLig/181L5KKhITa6WQrpLWHcWzAOUIpBbztH
 mfRFZYAaWiwyACw5lHpXyoD70Ly9TRr4SOMk5VawhA49+MUL7RyTRAajxJcDKndra2eH
 V4RfFTTeH2LlPtlHCKTk2r9xYprOHtVxqcZAqTx3FazjAI/9jOiGACuJN1F1+rFv/U1u
 E8PDt+mxyQaPN12boKUE0/+Sz3/u7luoqbIKEhu5RM1PsrE3aj8Zc7W4n1wcjHpJ5+xZ
 2s7FZNTpszGtEwl1ty0W7VtlLhxWznOCaALkgQwHeA7SDpHoiMfZyMB0Cyhuer6c5ThR
 h2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N0J5Bxl7vhdML2GM3ovQErwfTec12UCEbn+lGIO9lAc=;
 b=jnNShb2VCxqkLLBzUTeeQYkzo7SgP6YhZK2iKsySXrljljZAFfxNvp2yCaybhWYZ4n
 Wu+h88my9mBoWPUFD+Ce5t4/KYHaOsVxt/lHcAc0Yu79UbPQjBzKUdXGwzkqXEAU5Q89
 8jjni4WhjRckzSjc1r16Ih2P2Ba6acL/fuwy2Rr4FlAPSAYCanyKpBIjzE/jqvtVPTtW
 n54j+s2N7KIWdUKJKAgImsvhYK8/qvR9m6UdIn9S0uaKowL2CEmUtT4nZMRMxQWp8ACb
 wqDjpsr6bModdmkRXX6+JCBVBKUb71ewwuszZ6Q8ReEvkH0fJBPmqEStoManW/4Wk7Hi
 675w==
X-Gm-Message-State: AOAM533N1382FIrpqZ3uMqyZoGvFgBjXctckV6c7hbNRTXBf+cfBV2TL
 kScVycSqzLC5jccOuuIRauA0sQ==
X-Google-Smtp-Source: ABdhPJwQfIUje2tlYBZv8vPpUeMPQ8VZakZYwR5uwBK9VUsCi0n8gtjtebQD5JAd2uGQhYmRaUFAPA==
X-Received: by 2002:a17:906:4119:: with SMTP id
 j25mr8642477ejk.459.1618583887046; 
 Fri, 16 Apr 2021 07:38:07 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:06 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 35/40] drm/amd/amdgpu/amdgpu_cs: Repair some function naming
 disparity
Date: Fri, 16 Apr 2021 15:37:20 +0100
Message-Id: <20210416143725.2769053-36-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
 linaro-mm-sig@lists.linaro.org, Jerome Glisse <glisse@freedesktop.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmM6Njg1OiB3YXJuaW5nOiBleHBlY3Rpbmcg
cHJvdG90eXBlIGZvciBjc19wYXJzZXJfZmluaSgpLiBQcm90b3R5cGUgd2FzIGZvciBhbWRncHVf
Y3NfcGFyc2VyX2ZpbmkoKSBpbnN0ZWFkCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYzoxNTAyOiB3YXJuaW5nOiBleHBlY3RpbmcgcHJvdG90eXBlIGZvciBhbWRncHVfY3Nf
d2FpdF9hbGxfZmVuY2UoKS4gUHJvdG90eXBlIHdhcyBmb3IgYW1kZ3B1X2NzX3dhaXRfYWxsX2Zl
bmNlcygpIGluc3RlYWQKIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jOjE2
NTY6IHdhcm5pbmc6IGV4cGVjdGluZyBwcm90b3R5cGUgZm9yIGFtZGdwdV9jc19maW5kX2JvX3Zh
KCkuIFByb3RvdHlwZSB3YXMgZm9yIGFtZGdwdV9jc19maW5kX21hcHBpbmcoKSBpbnN0ZWFkCgpD
YzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlh
biBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBT
dW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogSmVyb21lIEdsaXNzZSA8
Z2xpc3NlQGZyZWVkZXNrdG9wLm9yZz4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcKQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2Zm
LWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYwppbmRleCBiNWM3NjY5OTgwNDU4Li45MDEzNmY5ZGVkZDY1IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAtNjcyLDcgKzY3Miw3IEBAIHN0YXRpYyBpbnQg
YW1kZ3B1X2NzX3N5bmNfcmluZ3Moc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnApCiB9CiAKIC8q
KgotICogY3NfcGFyc2VyX2ZpbmkoKSAtIGNsZWFuIHBhcnNlciBzdGF0ZXMKKyAqIGFtZGdwdV9j
c19wYXJzZXJfZmluaSgpIC0gY2xlYW4gcGFyc2VyIHN0YXRlcwogICogQHBhcnNlcjoJcGFyc2Vy
IHN0cnVjdHVyZSBob2xkaW5nIHBhcnNpbmcgY29udGV4dC4KICAqIEBlcnJvcjoJZXJyb3IgbnVt
YmVyCiAgKiBAYmFja29mZjoJaW5kaWNhdG9yIHRvIGJhY2tvZmYgdGhlIHJlc2VydmF0aW9uCkBA
IC0xNDg4LDcgKzE0ODgsNyBAQCBpbnQgYW1kZ3B1X2NzX2ZlbmNlX3RvX2hhbmRsZV9pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogfQogCiAvKioKLSAqIGFtZGdwdV9j
c193YWl0X2FsbF9mZW5jZSAtIHdhaXQgb24gYWxsIGZlbmNlcyB0byBzaWduYWwKKyAqIGFtZGdw
dV9jc193YWl0X2FsbF9mZW5jZXMgLSB3YWl0IG9uIGFsbCBmZW5jZXMgdG8gc2lnbmFsCiAgKgog
ICogQGFkZXY6IGFtZGdwdSBkZXZpY2UKICAqIEBmaWxwOiBmaWxlIHByaXZhdGUKQEAgLTE2Mzks
NyArMTYzOSw3IEBAIGludCBhbWRncHVfY3Nfd2FpdF9mZW5jZXNfaW9jdGwoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIH0KIAogLyoqCi0gKiBhbWRncHVfY3NfZmluZF9ib192
YSAtIGZpbmQgYm9fdmEgZm9yIFZNIGFkZHJlc3MKKyAqIGFtZGdwdV9jc19maW5kX21hcHBpbmcg
LSBmaW5kIGJvX3ZhIGZvciBWTSBhZGRyZXNzCiAgKgogICogQHBhcnNlcjogY29tbWFuZCBzdWJt
aXNzaW9uIHBhcnNlciBjb250ZXh0CiAgKiBAYWRkcjogVk0gYWRkcmVzcwotLSAKMi4yNy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
