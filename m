Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7F52A8185
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 15:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978726EDA4;
	Thu,  5 Nov 2020 14:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5DD6EDA6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 14:52:38 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n15so2108273wrq.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 06:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFGC0ytSE2C9dt0H5Lm6tpZnXpH56uqHjPZdDctt26w=;
 b=wfiAsdlt6epXo2Z0lyQ2vFG5VIANzrYi7k+Kj7DSPrq0Wlu7lE/C7PyBaDtKnFt5W3
 ss6q9w+fsheDQAj9Qg22QH+HM8yU1kpflALNQwljtfRtDwIlCCGravQG8EHFfj/kpG1Y
 FEzypD0aYD9XfDVxFcUTqvOQu5NR5igeobiejNnTe3Idb/HE8ochjkpI+47Yygo0GaRN
 7aeAWTVLBX8UdQbRzfNLEcs84NSw+tI8FIqPamYKU2xJ2J2QG9/PsJHOthgrZI8DXhnq
 eYE1IUn/Dky5zKBZjcjsHDXk7MpSiXTc/WeaJzAxEQ2MrL3ItGYCnlcRVglXawLV2AxM
 0ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFGC0ytSE2C9dt0H5Lm6tpZnXpH56uqHjPZdDctt26w=;
 b=GigR/JaxBHBon24QF8DrhjL/Vd2wJG79YnTEm0USw4+g7Nkr9z89sID0adva1DZEVy
 z0+lS6B19jUKslROI2MMgZZlcZjcUtpRMeW+GCrwmsZuhaNpvL9HHmo2MO95ee9M8flv
 t9LY6wjYMZ49zocIWOp3oz+xgBfowz/ULsnHHJjPHh9AttG1INQuyZdqGOaHjpoejNOa
 yUod2/NHLFBCDURzxf4RGrkArrVXnWV74qONW4gU772HCVikyzFhfi0WjpRwY+x11n+D
 tF8YTtg3MTJnbhigPYZB7Ew14b7F0LAKluVmL4sYrm/sJ0et2Tco4fukRGXeii1aEDr1
 Weag==
X-Gm-Message-State: AOAM531m2yNF0veWKp9ZFYHcFH2dueYWb/7ZgmHyHh4mwHS2G6PWVva2
 7OFqEeB2BjbUQtcSLLDXhrOwmQ==
X-Google-Smtp-Source: ABdhPJzXmfpypPEGh1sjthrWtYAHtbC+T4FEWZkqUKOyrF6tmldqGj0XtFoQ6I7iSmVwj8o3PG+jxg==
X-Received: by 2002:adf:9150:: with SMTP id j74mr3668000wrj.57.1604587956920; 
 Thu, 05 Nov 2020 06:52:36 -0800 (PST)
Received: from dell.default ([91.110.221.242])
 by smtp.gmail.com with ESMTPSA id f5sm2631243wmh.16.2020.11.05.06.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:52:36 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 18/19] gpu: drm: amd: amdgpu: amdgpu: Mark global variables as
 __maybe_unused
Date: Thu,  5 Nov 2020 14:45:16 +0000
Message-Id: <20201105144517.1826692-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105144517.1826692-1-lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
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

VGhlc2UgMyB2YXJpYWJsZXMgYXJlIHVzZWQgaW4gKnNvbWUqIHNvdXJjZWZpbGVzIHdoaWNoIGlu
Y2x1ZGUKYW1kZ3B1LmgsIGJ1dCBub3QgKmFsbCouICBUaGlzIGxlYWRzIHRvIGEgZmx1cnJ5IG9m
IGJ1aWxkIHdhcm5pbmdzLgoKRml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdh
cm5pbmcocyk6CgogZnJvbSBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaDo2NywK
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oOjE5ODoxOTogd2FybmluZzog4oCY
bm9fc3lzdGVtX21lbV9saW1pdOKAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29u
c3QtdmFyaWFibGU9XQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1Lmg6MTk3OjE5
OiB3YXJuaW5nOiDigJhkZWJ1Z19ldmljdGlvbnPigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1X
dW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5oOjE5NjoxODogd2FybmluZzog4oCYc2NoZWRfcG9saWN54oCZIGRlZmluZWQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCgogTkI6IFJlcGVhdHMgfjY1MCB0aW1lcyAt
IHNuaXBwZWQgZm9yIGJyZXZpdHkuCgpDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8u
b3JnPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogbGlu
YXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVl
LmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
LmggfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCmluZGV4IDE4M2IwOWQ3MWI2NGEu
LjU5Mzk3NTMwODAwNTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCkBAIC0xOTMs
OSArMTkzLDkgQEAgZXh0ZXJuIGludCBzY2hlZF9wb2xpY3k7CiBleHRlcm4gYm9vbCBkZWJ1Z19l
dmljdGlvbnM7CiBleHRlcm4gYm9vbCBub19zeXN0ZW1fbWVtX2xpbWl0OwogI2Vsc2UKLXN0YXRp
YyBjb25zdCBpbnQgc2NoZWRfcG9saWN5ID0gS0ZEX1NDSEVEX1BPTElDWV9IV1M7Ci1zdGF0aWMg
Y29uc3QgYm9vbCBkZWJ1Z19ldmljdGlvbnM7IC8qID0gZmFsc2UgKi8KLXN0YXRpYyBjb25zdCBi
b29sIG5vX3N5c3RlbV9tZW1fbGltaXQ7CitzdGF0aWMgY29uc3QgaW50IF9fbWF5YmVfdW51c2Vk
IHNjaGVkX3BvbGljeSA9IEtGRF9TQ0hFRF9QT0xJQ1lfSFdTOworc3RhdGljIGNvbnN0IGJvb2wg
X19tYXliZV91bnVzZWQgZGVidWdfZXZpY3Rpb25zOyAvKiA9IGZhbHNlICovCitzdGF0aWMgY29u
c3QgYm9vbCBfX21heWJlX3VudXNlZCBub19zeXN0ZW1fbWVtX2xpbWl0OwogI2VuZGlmCiAKIGV4
dGVybiBpbnQgYW1kZ3B1X3RtejsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
