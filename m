Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A60CF2ADF73
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 20:32:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA10F89C1C;
	Tue, 10 Nov 2020 19:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B254F89C0A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 19:31:43 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so2666703wrt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 11:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1oV/yz5N1u2UPD8o5d2gv6s+B1t/DAHhi2RWlvWz744=;
 b=T2jBka9sse1tlWAYyyPE0QhmK8In9KttLjXZkzSHP9HTQh59UL/40LMvsaOD8atmkQ
 /TWk7zYAzAYQbisCj8BpF5ksv9i3B3BAXUWERHj21dPwub2Q7tGUgwLrjp+JfQo19C/D
 Bp1jE0K8gdn1LOpxjSXJQEyXczZv6Ec/nY+xktwe7ZVo8GlXpVLJQo6CTT9sNNG5q3Ou
 ia0p140uu4rC10i6nWaETjRb05b5JpONzJmbjMRlEA2UuhS7HzIxDW3SnL9hsE3z9dHC
 bh7MHMAS6I7Mj6xULAFQpElPU6/t3cB12HJ4Xt018r6BzPBjeIIigiRopDEGBzir8ssq
 Twzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1oV/yz5N1u2UPD8o5d2gv6s+B1t/DAHhi2RWlvWz744=;
 b=j485NnsGf2uJNR9kTmO7wFdII+mQ93M6Zx4DcOciU6I6WoArE9bsDGB6O2c+56U7Jr
 LTVMrMgWbfuC9VUqti8OiHGea6C01uQIMqbwH7aYTt6qkGZ7mtf3f1v1qyJkTyYUOqhB
 QoI+Z+cLQ14WbnPzPyxlGm49tZrm8FB0S02hcMLn7+G3Sa+X/+XHP9p/aNIDaNy++p3Z
 jPPd3Fl2Slgqhgax3/EREC6Fv509mprQ0RToLUvhv5LRLdU5EgWCW7kDgRhn10OSoYeQ
 8vKmDCHnWbGC+cYHhw6ayLW9WRd/oqO+Uvxlr++LvMlxKbRZpM6j7rw3Pw18kjHqjhA7
 mqRQ==
X-Gm-Message-State: AOAM530p8TkOMGeh8jxb2S5aC/EL3n4AWuwTUld273c1JtHPzfo7/MkP
 CcLR4TDY21sThJ3ZngZqDyatLA==
X-Google-Smtp-Source: ABdhPJza9cNXQDZ5z1aM5oaSqmTMzXWomRhvZd26Y5a0XS2bh4Rl+GpTXDTVDzeWHgzF+ygUTPg1Rw==
X-Received: by 2002:adf:f4c1:: with SMTP id h1mr11340915wrp.290.1605036702401; 
 Tue, 10 Nov 2020 11:31:42 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 30sm17635335wrs.84.2020.11.10.11.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:31:41 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/30] drm/radeon/atom: Move 'radeon_atom_hw_i2c_*()'s
 prototypes into shared header
Date: Tue, 10 Nov 2020 19:31:03 +0000
Message-Id: <20201110193112.988999-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110193112.988999-1-lee.jones@linaro.org>
References: <20201110193112.988999-1-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9hdG9tYmlvc19pMmMuYzoxMDA6NTogd2FybmluZzogbm8gcHJldmlv
dXMgcHJvdG90eXBlIGZvciDigJhyYWRlb25fYXRvbV9od19pMmNfeGZlcuKAmSBbLVdtaXNzaW5n
LXByb3RvdHlwZXNdCiAxMDAgfCBpbnQgcmFkZW9uX2F0b21faHdfaTJjX3hmZXIoc3RydWN0IGky
Y19hZGFwdGVyICppMmNfYWRhcCwKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KIGRyaXZlcnMv
Z3B1L2RybS9yYWRlb24vYXRvbWJpb3NfaTJjLmM6MTUwOjU6IHdhcm5pbmc6IG5vIHByZXZpb3Vz
IHByb3RvdHlwZSBmb3Ig4oCYcmFkZW9uX2F0b21faHdfaTJjX2Z1bmPigJkgWy1XbWlzc2luZy1w
cm90b3R5cGVzXQogMTUwIHwgdTMyIHJhZGVvbl9hdG9tX2h3X2kyY19mdW5jKHN0cnVjdCBpMmNf
YWRhcHRlciAqYWRhcCkKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCkNjOiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9hdG9tLmggICAgICAgfCA2ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25faTJjLmMgfCA0IC0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
YXRvbS5oIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tLmgKaW5kZXggY2I5M2I4MzExNGRi
ZS4uZWZjMDVlMzNiMjIwYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9t
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9hdG9tLmgKQEAgLTE2MCw2ICsxNjAsMTIg
QEAgc3RydWN0IHJhZGVvbl9kZXZpY2U7CiBib29sIHJhZGVvbl9hdG9tX2dldF90dl90aW1pbmdz
KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LCBpbnQgaW5kZXgsCiAJCQkJc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUpOwogCitzdHJ1Y3QgaTJjX21zZzsKK3N0cnVjdCBpMmNfYWRhcHRl
cjsKK2ludCByYWRlb25fYXRvbV9od19pMmNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmkyY19h
ZGFwLAorCQkJICAgIHN0cnVjdCBpMmNfbXNnICptc2dzLCBpbnQgbnVtKTsKK3UzMiByYWRlb25f
YXRvbV9od19pMmNfZnVuYyhzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXApOworCiAjaW5jbHVkZSAi
YXRvbS10eXBlcy5oIgogI2luY2x1ZGUgImF0b21iaW9zLmgiCiAjaW5jbHVkZSAiT2JqZWN0SUQu
aCIKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2kyYy5jIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmMKaW5kZXggYWE2MWIzY2I0MDQ5Yy4uZTU0
M2Q5OTNmNzNlZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJj
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmMKQEAgLTM0LDEwICsz
NCw2IEBACiAjaW5jbHVkZSAicmFkZW9uLmgiCiAjaW5jbHVkZSAiYXRvbS5oIgogCi1leHRlcm4g
aW50IHJhZGVvbl9hdG9tX2h3X2kyY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqaTJjX2FkYXAs
Ci0JCQkJICAgc3RydWN0IGkyY19tc2cgKm1zZ3MsIGludCBudW0pOwotZXh0ZXJuIHUzMiByYWRl
b25fYXRvbV9od19pMmNfZnVuYyhzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXApOwotCiBib29sIHJh
ZGVvbl9kZGNfcHJvYmUoc3RydWN0IHJhZGVvbl9jb25uZWN0b3IgKnJhZGVvbl9jb25uZWN0b3Is
IGJvb2wgdXNlX2F1eCkKIHsKIAl1OCBvdXQgPSAweDA7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
