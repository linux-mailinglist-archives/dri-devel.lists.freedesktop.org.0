Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD7D2B4D4D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 18:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F5F6E09F;
	Mon, 16 Nov 2020 17:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496E66E075
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 17:37:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j7so19634676wrp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Nov 2020 09:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=noNY+SglbM8aEsCCdAF8dY+Y+lbfpcrhUN1CWHwGoPw=;
 b=DFTBbu+5/taBz5pfwjhg2wGKAOcz772ZE8KKWtmmMpONrvSSKnHUEF6FR+5UjXPlQK
 XmlgrM5ohKz9h/HLFZcXQxou2oIiaih5t2afZ7Otfj4eqUJz+ClVii6GJ31QOupottY2
 06K+IiP5G5Tql72mSEUj5Elt4Zonc+FW5cVsOEaMS375Pw0lb25NVw8jn19KABojYTnO
 sIvvQE5jz3fGbJosQodyjtGV4pDXBk4l7CjgB7lbA9PWHD/hGoTrLX7YaUy58OBTdG8n
 uyZSjbl/MOssb5we3fYsnndgw9ANHUUAgPawXlc59hSgBoC/XP5DMqLG24yHn7aduPpK
 h7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=noNY+SglbM8aEsCCdAF8dY+Y+lbfpcrhUN1CWHwGoPw=;
 b=qBoUKcYwl6djTPi6w9iG4jVYhjVoUPxNzls4Pa4Zf24igMnXkTXS07dtTH7k+sF+om
 clacY2RKVSaS5SK/gwFDNIrKC6RvIBzy6oMCVuZkAqr1bPsuCRA6B34oZi0aXWPqKM2W
 OLS7oippsTnnQu5IJ4sgUHNneh9CRnYMjGa3mz/bi03r6jMuF1g7bfIXBuLPorWGdlzl
 8wlSOb76Sk8d/XU6UI2GFhM/0/7BMvfYmk7MSW8oT+smHeOnQtjRHLYwT4nqes1LZK6P
 S7WeSnCRYdaB2XgcRLxfxGbPpoDR6AUPBK8cgoPxKDKAla4e/6TH8cJaeEfQzfUi5gtM
 cMAQ==
X-Gm-Message-State: AOAM530r/I/K2O7ij2WEhUz2X+frqy9seMhuGRTbEWvXw+UBJYXac8Lj
 fX21PNv3LR/S6vs3L9IZx4xLjA==
X-Google-Smtp-Source: ABdhPJyZfd0rNWrnYq7A3M2ndx2Eq6U97hpTle2EgGXwsNwTmEA6pUg4LVpVHh3yyTfW4Sn4/lXW8A==
X-Received: by 2002:adf:e48d:: with SMTP id i13mr19977610wrm.387.1605548271964; 
 Mon, 16 Nov 2020 09:37:51 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id 30sm16942828wrd.88.2020.11.16.09.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:37:51 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 35/43] drm/radeon/cik_sdma: Move
 'amdgpu_cik_gpu_check_soft_reset()'s prototype to shared header
Date: Mon, 16 Nov 2020 17:36:52 +0000
Message-Id: <20201116173700.1830487-36-lee.jones@linaro.org>
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
cy9ncHUvZHJtL3JhZGVvbi9jaWsuYzo0ODQ1OjU6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3Rv
dHlwZSBmb3Ig4oCYY2lrX2dwdV9jaGVja19zb2Z0X3Jlc2V04oCZIFstV21pc3NpbmctcHJvdG90
eXBlc10KIDQ4NDUgfCB1MzIgY2lrX2dwdV9jaGVja19zb2Z0X3Jlc2V0KHN0cnVjdCByYWRlb25f
ZGV2aWNlICpyZGV2KQogfCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCkNjOiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9jaWsuaCAgICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Np
a19zZG1hLmMgfCAzICstLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuaCBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrLmgKaW5kZXggMjk3YjNjMWZmODA0Zi4uNjYzMGI5ZGE5
ZTdhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9jaWsuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL2Npay5oCkBAIC0yOSw1ICsyOSw2IEBAIHZvaWQgY2lrX2VudGVy
X3JsY19zYWZlX21vZGUoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpOwogdm9pZCBjaWtfZXhp
dF9ybGNfc2FmZV9tb2RlKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKIGludCBjaV9tY19s
b2FkX21pY3JvY29kZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldik7CiB2b2lkIGNpa191cGRh
dGVfY2coc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYsIHUzMiBibG9jaywgYm9vbCBlbmFibGUp
OwordTMyIGNpa19ncHVfY2hlY2tfc29mdF9yZXNldChzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRl
dik7CiAKICNlbmRpZiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBfX0NJS19IX18gKi8KZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vY2lrX3NkbWEuYyBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vY2lrX3NkbWEuYwppbmRleCAzYzcwOWViZThkMWFiLi45MTliMTQ4NDVjM2M3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2Npa19zZG1hLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9jaWtfc2RtYS5jCkBAIC0yNywxNCArMjcsMTMgQEAKICNpbmNs
dWRlICJyYWRlb25fdWNvZGUuaCIKICNpbmNsdWRlICJyYWRlb25fYXNpYy5oIgogI2luY2x1ZGUg
InJhZGVvbl90cmFjZS5oIgorI2luY2x1ZGUgImNpay5oIgogI2luY2x1ZGUgImNpa2QuaCIKIAog
Lyogc2RtYSAqLwogI2RlZmluZSBDSUtfU0RNQV9VQ09ERV9TSVpFIDEwNTAKICNkZWZpbmUgQ0lL
X1NETUFfVUNPREVfVkVSU0lPTiA2NAogCi11MzIgY2lrX2dwdV9jaGVja19zb2Z0X3Jlc2V0KHN0
cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKLQogLyoKICAqIHNETUEgLSBTeXN0ZW0gRE1BCiAg
KiBTdGFydGluZyB3aXRoIENJSywgdGhlIEdQVSBoYXMgbmV3IGFzeW5jaHJvbm91cwotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
