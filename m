Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 825352F1EE9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:20:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509EE89E86;
	Mon, 11 Jan 2021 19:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A9A89E9E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:20:03 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c5so930012wrp.6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JOyt7JjenC3JxqplAWuaS0Peh67vONfoPebrIaqCVaU=;
 b=Ury54x86y0TSuDIGEgMyFRNXMi6mvZtZR8AiUGxf02KEg/Qk4G3safKG2e0UTeBkIf
 tXip/SBGN84y+PtcTOPecltGCNZgttFwjF/gJbhObDFirf9Rqw5bR2AZz2ksZyf7kKSV
 LOuPcaEwhtYXNt4q2+3WDkeqpt+utoKpIqA4jdW/+BWP8EB2d8igUF5Z2/7UrsUNR5hh
 /tcnM7v8bdlDCDCDVJrfqd2kAe+tUzeDZD6FNYloXHdK4JKthUYZmTKZMdDF8UYC7/4j
 hY7uoKS6mYPQAXl5PsZs99OkmqMqhPfDsh3LFCkrpi2U+fz6ruKWyc1c0iZgHthVYQAB
 O34g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JOyt7JjenC3JxqplAWuaS0Peh67vONfoPebrIaqCVaU=;
 b=BB+3FHqh/XCt8QF+voXwAjW6jc5Tl1Hlahun33l1vKF2jOUoAw8/DLlx3QFe2oXKdq
 oc5bsFgtEMxDZDDHpYbKI8fgTV26GE0rH2ffdraEOLGjV8fs34odQJDIkyOWJIIg22hz
 5MowkP6r7Vm2Ud/5PZWwgDidgc4XmM8vNbo+7XwUQZ4azqGj7lSikWgtsxjrEjC7NiCT
 jBKgvJ7LjRkTdPYHUF7s9QA2Kj7dLDnUAYHy+T0Qb/i1nktWAUfOmAFGbSGuRcI5T64k
 P5ApELcBBSChNExr2NuJM/CalB4Y6tIrkHeU92ElEj0fsZHx/3lGG00sZJ2mhwGyrezj
 j/mg==
X-Gm-Message-State: AOAM531gVYEgP1FO5OUAyBZOGSd4XTf1F7jM5UGFmKIsCmCs9vhuW30p
 2FCx5ayuDojp6d5Fd3zlzWMSKg==
X-Google-Smtp-Source: ABdhPJxLFoQgYmFl5UgzBe/khAM2fQsCzRuicD+oGb/jb0HKJXsiQGNceE76zUWTuG4yFLctHbnX9g==
X-Received: by 2002:adf:82c8:: with SMTP id 66mr592128wrc.420.1610392801743;
 Mon, 11 Jan 2021 11:20:01 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:20:01 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/40] drm/amd/pm/swsmu/smu11/vangogh_ppt: Make local function
 'vangogh_clk_dpm_is_enabled' static
Date: Mon, 11 Jan 2021 19:19:10 +0000
Message-Id: <20210111191926.3688443-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111191926.3688443-1-lee.jones@linaro.org>
References: <20210111191926.3688443-1-lee.jones@linaro.org>
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
Cc: Xiaojian Du <Xiaojian.Du@amd.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYzo2MTM6
Njogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJh2YW5nb2doX2Nsa19kcG1f
aXNfZW5hYmxlZOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBYaWFvamlhbiBEdSA8WGlhb2pp
YW4uRHVAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUx
MS92YW5nb2doX3BwdC5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dz
bXUvc211MTEvdmFuZ29naF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG0vc3dzbXUvc211
MTEvdmFuZ29naF9wcHQuYwppbmRleCA3NWRkY2FkZjM4MDJhLi4zN2JkNGM2NDc0MThkIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jCkBA
IC02MTAsOCArNjEwLDggQEAgc3RhdGljIGludCB2YW5nb2doX2dldF9wcm9maWxpbmdfY2xrX21h
c2soc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCiAJcmV0dXJuIDA7CiB9CiAKLWJvb2wgdmFuZ29n
aF9jbGtfZHBtX2lzX2VuYWJsZWQoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCi0JCQkJZW51bSBz
bXVfY2xrX3R5cGUgY2xrX3R5cGUpCitzdGF0aWMgYm9vbCB2YW5nb2doX2Nsa19kcG1faXNfZW5h
YmxlZChzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKKwkJCQkgICAgICAgZW51bSBzbXVfY2xrX3R5
cGUgY2xrX3R5cGUpCiB7CiAJZW51bSBzbXVfZmVhdHVyZV9tYXNrIGZlYXR1cmVfaWQgPSAwOwog
Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
