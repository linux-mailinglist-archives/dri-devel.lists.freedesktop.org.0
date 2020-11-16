Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FEF2B4D33
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:37:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FED6E04B;
	Mon, 16 Nov 2020 17:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9A86E03B
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:25 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b6so19643313wrt.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2n5EAuxxaWf0Dm92MV4U7zHBQN4uYE06MkP3Ik/k8Q=;
 b=BnwVbJwRHIrWiSelgE8VUORGPDGET5j5wYZz3HQcFJYdlMvspKOuspFebmEah8Hjz6
 gr31bK0POXAE4z3LwjHafVrjp8+fYHxVWnm2p9z34efZ830IGvN9jlKtUbJcGYdha7En
 xZXaENA81gYhIFOEhMERcLgH3znBEyebE00yYVb1zJ6NnnNzRoWmik/7PBmcPfB1TaGn
 8j+nSptwK8yJ904NRY4L9MeSNKIm0mEVS8vfrkxgDP6BDDczdt9JbFF4myk3nh9Rh79S
 H+8NNQZYtlq81stY+zFgFh3rmhvPAnYDZ93qgC1jbZDxICbEWjNQbSlwg0FLj0ak9QwW
 iK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2n5EAuxxaWf0Dm92MV4U7zHBQN4uYE06MkP3Ik/k8Q=;
 b=YpQsz8QR89mbF1f5cD2Hpr80ru9mNWLqXVhGVBDqv5MePn01XRO3UlrWkYKVJte5iJ
 lWAgZWWGkiwAFSX5Tu99sfT1T6L4Vq2lTuInn/8i8ZR7qIx6S2t8HR9PXBdVsDdZHro5
 Pswxhu32p2XZdtAAETCcVCySTMFzrWOGq7PNWnkMUZJL2y+hMLxL/I4o0mAAxFFsTm8a
 O5m4UJIktaOQY/NXUoJzGg0Xq1ALbJDfPcwx9W2rB+844MHf19kbe8u0BAbnOJGINjqO
 kCMhWR9JsnwO2bMdjX0Bpbyf3l7QYThd1VJeXUrvSTicYqg+jZtgDRr08WkPJcO1VZis
 5LSg==
X-Gm-Message-State: AOAM533zvmdrSjfcUDnhD3HbJGaPTcKOd8B01YfNIP3Unb1KZZFjXyu0
 baCrnUK6z99w4S0fgnDYlI61zFyE3D5jFwYJ
X-Google-Smtp-Source: ABdhPJxvANXM3aKchSP4W3dRVCrfAA1T8q3gatRW71Sh24RLgAx9VaHVKFdu4fZkQBtH1WN6XZq8UA==
X-Received: by 2002:a5d:6892:: with SMTP id h18mr20526445wru.49.1605548244607; 
 Mon, 16 Nov 2020 09:37:24 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/43] drm/radeon/atom: Move 'radeon_atom_hw_i2c_*()'s
 prototypes into shared header
Date: Mon, 16 Nov 2020 17:36:32 +0000
Message-Id: <20201116173700.1830487-16-lee.jones@linaro.org>
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
cHUvZHJtL3JhZGVvbi9hdG9tLmggICAgICAgfCA3ICsrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX2kyYy5jIHwgNCAtLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L2F0b20uaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbS5oCmluZGV4IDFiZjA2YzkxY2Q5
NTkuLjVkZTA1NjNiNjNkMmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRv
bS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vYXRvbS5oCkBAIC0xNTQsNiArMTU0LDEz
IEBAIGJvb2wgYXRvbV9wYXJzZV9kYXRhX2hlYWRlcihzdHJ1Y3QgYXRvbV9jb250ZXh0ICpjdHgs
IGludCBpbmRleCwgdWludDE2X3QgKnNpemUsCiBib29sIGF0b21fcGFyc2VfY21kX2hlYWRlcihz
dHJ1Y3QgYXRvbV9jb250ZXh0ICpjdHgsIGludCBpbmRleCwKIAkJCSAgIHVpbnQ4X3QgKmZyZXYs
IHVpbnQ4X3QgKmNyZXYpOwogaW50IGF0b21fYWxsb2NhdGVfZmJfc2NyYXRjaChzdHJ1Y3QgYXRv
bV9jb250ZXh0ICpjdHgpOworCitzdHJ1Y3QgaTJjX21zZzsKK3N0cnVjdCBpMmNfYWRhcHRlcjsK
K2ludCByYWRlb25fYXRvbV9od19pMmNfeGZlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmkyY19hZGFw
LAorCQkJICAgIHN0cnVjdCBpMmNfbXNnICptc2dzLCBpbnQgbnVtKTsKK3UzMiByYWRlb25fYXRv
bV9od19pMmNfZnVuYyhzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXApOworCiAjaW5jbHVkZSAiYXRv
bS10eXBlcy5oIgogI2luY2x1ZGUgImF0b21iaW9zLmgiCiAjaW5jbHVkZSAiT2JqZWN0SUQuaCIK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2kyYy5jIGIvZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmMKaW5kZXggYWE2MWIzY2I0MDQ5Yy4uZTU0M2Q5
OTNmNzNlZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faTJjLmMKQEAgLTM0LDEwICszNCw2
IEBACiAjaW5jbHVkZSAicmFkZW9uLmgiCiAjaW5jbHVkZSAiYXRvbS5oIgogCi1leHRlcm4gaW50
IHJhZGVvbl9hdG9tX2h3X2kyY194ZmVyKHN0cnVjdCBpMmNfYWRhcHRlciAqaTJjX2FkYXAsCi0J
CQkJICAgc3RydWN0IGkyY19tc2cgKm1zZ3MsIGludCBudW0pOwotZXh0ZXJuIHUzMiByYWRlb25f
YXRvbV9od19pMmNfZnVuYyhzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXApOwotCiBib29sIHJhZGVv
bl9kZGNfcHJvYmUoc3RydWN0IHJhZGVvbl9jb25uZWN0b3IgKnJhZGVvbl9jb25uZWN0b3IsIGJv
b2wgdXNlX2F1eCkKIHsKIAl1OCBvdXQgPSAweDA7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
