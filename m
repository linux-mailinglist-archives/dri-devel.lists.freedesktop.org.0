Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8D2B4D48
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132746E063;
	Mon, 16 Nov 2020 17:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27F66E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s8so19610987wrw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/TaDkB9aPGP5jIvVTMt5uJ/KkWKg3o08L440ECaIrc=;
 b=H9fzVUYr61GkdepEkcKo4chSq6TsD6cuRJmXdrsP+VjRRNEvOQQX/IfJ52sG/AWhsh
 EFRdfq3Dlg+axrP3DhsmqLb4m57yB9TVKIKxsJ0uDgUZORWETCnUubh/cXsWl8zsxOQ1
 o/9J+jM+JTAJ1opy/ZR2C8WKVu8T394xmWN6haS6//h2fksNKepH0hCF4L0RS7i8WIS8
 ThriN6lQhbMpGbEIWYKuT4VANbahux5F81Q/wy69QsmKqF4kktqGd/gfP9OhrIEd5Iz/
 RzpxPw7HF4e7VfvvQLuSrr+A8vSFJPkA+FYLvcXnilM0rbX07wqAzzg43KI8MMoxUt1E
 BEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/TaDkB9aPGP5jIvVTMt5uJ/KkWKg3o08L440ECaIrc=;
 b=FbqKx+b5GJ7+NWK02ROSEZBvyn2DsO4KzaXLtRBREnN52dor4511MHhQ9fUch5yeK+
 7hPfKroUleSxvtwGbgnvF9Cv5VzPFhfIezcBwl2D8xDZs6OuXBSkSoQfLY+SiKKq46T2
 U7/D7lB+46IOGcF3XV1MbGzD9vDQ3Uy2MvgfLNGtuRJPjv7whEzBuuvE3bbhfS3DnGmE
 /SwgyD04VVgLkX91PCqRPC1pBs8KbLulLOQihQ2yoSMpMs0CLnBFvZstXPClaujsVnfn
 Kl/IkADOM6cZRepZUPwAc+YV4C7shE11psYxRLBa8Ls2FZo9m+ToXgRq8F+7qbmSkLfh
 Y2Pg==
X-Gm-Message-State: AOAM531AEHHVZo1MQ3now56iX5WdtKSgun02JuhbLnyu9gczyDYgHAs+
 k52gCoNJmYpS1qqG+lRjhtYBXg==
X-Google-Smtp-Source: ABdhPJz+sGVtIvHucgBcxMBTLe3HE9tgMEhDeD1NpTRCThOpVex2/FpBQ/EEQO9VAAJPzEWqq3i2CA==
X-Received: by 2002:a5d:4612:: with SMTP id t18mr20438262wrq.401.1605548265478; 
 Mon, 16 Nov 2020 09:37:45 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:44 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 30/43] drm/radeon/si_dma: Move 'si_gpu_check_soft_reset()'s
 prototype to shared header
Date: Mon, 16 Nov 2020 17:36:47 +0000
Message-Id: <20201116173700.1830487-31-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9zaS5jOjM3Njg6NTogd2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90
eXBlIGZvciDigJhzaV9ncHVfY2hlY2tfc29mdF9yZXNldOKAmSBbLVdtaXNzaW5nLXByb3RvdHlw
ZXNdCiAzNzY4IHwgdTMyIHNpX2dwdV9jaGVja19zb2Z0X3Jlc2V0KHN0cnVjdCByYWRlb25fZGV2
aWNlICpyZGV2KQogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpD
YzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3NpLmggICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RtYS5j
IHwgMyArLS0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2kuaCBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vc2kuaAppbmRleCAwYTUwMThlZjE2NmUyLi5hMTc1MWFlNTYwZjAyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpLmgKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9zaS5oCkBAIC0yNyw1ICsyNyw2IEBACiBzdHJ1Y3QgcmFkZW9uX2RldmljZTsKIAog
aW50IHNpX21jX2xvYWRfbWljcm9jb2RlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKK3Uz
MiBzaV9ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiAK
ICNlbmRpZiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBfX1NJX0hfXyAqLwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vc2lfZG1hLmMKaW5kZXggZDJmYTMwMmE1YmU5Zi4uNjQ1ODk3ZDFiZmMzMSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kbWEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3NpX2RtYS5jCkBAIC0yNSwxMCArMjUsOSBAQAogI2luY2x1ZGUgInJhZGVvbi5oIgog
I2luY2x1ZGUgInJhZGVvbl9hc2ljLmgiCiAjaW5jbHVkZSAicmFkZW9uX3RyYWNlLmgiCisjaW5j
bHVkZSAic2kuaCIKICNpbmNsdWRlICJzaWQuaCIKIAotdTMyIHNpX2dwdV9jaGVja19zb2Z0X3Jl
c2V0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKLQogLyoqCiAgKiBzaV9kbWFfaXNfbG9j
a3VwIC0gQ2hlY2sgaWYgdGhlIERNQSBlbmdpbmUgaXMgbG9ja2VkIHVwCiAgKgotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
