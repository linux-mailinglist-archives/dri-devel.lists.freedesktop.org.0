Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E56902EF8BC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 21:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06E16E8C2;
	Fri,  8 Jan 2021 20:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19CB6E8C2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 20:15:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id g25so7364631wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 12:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rwsQ4P/R4DdLdAB3mC1JWRMOEYxyTXQ+mvrg/Opzxxc=;
 b=mCIOoMf78yv6vZZRz9P4wRu711vAOmJTwcFZoHf9+OnpmMqUsDtTYQIRLbXprNM/2H
 4UfuwGilLCVSnL0T33A638w9j5Plzpi5879F8q0wGGeRbuXHv0g3Mc5tBd5TyblfbsHZ
 7a0sEXSkfnc2IwoIsWbQgXKSJWupcPEyeD8QaKNxMSonEX6o1yjMoRMbb9DHohKA/wiK
 Bk+bXH5mp0I9WKSr/u7LGmoYrJWvVuUDHMMrEFUPRI2MMhnnJVNzCl4eAAgVZW6f29fu
 M+DxM1w1qHWhwYyNjb7nHLliZ6TWEeRMvqCoMYvv86Z4/hpX2Vj23HE9Ii5cJ+rAcOoO
 9Vag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rwsQ4P/R4DdLdAB3mC1JWRMOEYxyTXQ+mvrg/Opzxxc=;
 b=WFXaZNltEcg412tdDQqzJz8x0D/Uo9rDor/NvnrxX/PNxdwBFKHDwUoG1AM6qmzwip
 K5s5moIhq2uE0NV4+2RIJwpOg/KOpbvee+fe7PN/0pTgRUrLCJDDNVhxgI9z6t+EfMGg
 hZI8A/5UkMdW94MEGdxC6DaqloJlUHYpl5lRaAPQhh3lz38qtXbfz7ddyVCVV40FMrBe
 rF+MEhI/7NYSkBFt8V9tOIJ/1h/A8hifDthzkuihwO8ndMtoWPB75yQLeY0mqqvHEzA7
 9UsdI/AOcBerwNGIkc3ASFT51Bt1iCmCacvKMS+ptr57p8Eht3scmm+Jc4FucLZEdxAH
 kPhg==
X-Gm-Message-State: AOAM533UaukHLraOYh2Gvk0tkl/PEbLdRkiDW0Ez0yGc/QgPVeHoxzea
 FPy3tpKSUfz2sBfdh/lYrP2Z0A==
X-Google-Smtp-Source: ABdhPJy+Lr8kUWX17Jvzqd3IxXYZTLMuFMjKsnONPcmtEtBYoEgAkGevIdlNvhYFsgo0i/Ef03nXvQ==
X-Received: by 2002:a1c:2b46:: with SMTP id r67mr4491346wmr.162.1610136950667; 
 Fri, 08 Jan 2021 12:15:50 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id l8sm15598671wrb.73.2021.01.08.12.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 12:15:50 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 32/40] drm/amd/display/dc/dce/dce_aux: Remove unused function
 'get_engine_type'
Date: Fri,  8 Jan 2021 20:14:49 +0000
Message-Id: <20210108201457.3078600-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108201457.3078600-1-lee.jones@linaro.org>
References: <20210108201457.3078600-1-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5jOjM5MToyNTog
d2FybmluZzogbm8gcHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhnZXRfZW5naW5lX3R5cGXigJkg
Wy1XbWlzc2luZy1wcm90b3R5cGVzXQoKQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CkNjOiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5p
ZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4LmMgfCA2IC0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjZS9kY2VfYXV4LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
ZGNlL2RjZV9hdXguYwppbmRleCBjZGE1ZmQwNDY0YmM1Li4zMjA0MjkyYTVhZWFlIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYwpAQCAtMzg4LDEyICsz
ODgsNiBAQCBzdGF0aWMgZW51bSBhdXhfY2hhbm5lbF9vcGVyYXRpb25fcmVzdWx0IGdldF9jaGFu
bmVsX3N0YXR1cygKIAl9CiB9CiAKLWVudW0gaTJjYXV4X2VuZ2luZV90eXBlIGdldF9lbmdpbmVf
dHlwZSgKLQkJY29uc3Qgc3RydWN0IGRjZV9hdXggKmVuZ2luZSkKLXsKLQlyZXR1cm4gSTJDQVVY
X0VOR0lORV9UWVBFX0FVWDsKLX0KLQogc3RhdGljIGJvb2wgYWNxdWlyZSgKIAlzdHJ1Y3QgZGNl
X2F1eCAqZW5naW5lLAogCXN0cnVjdCBkZGMgKmRkYykKLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
