Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C32F2F45D3
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD32E6E072;
	Wed, 13 Jan 2021 08:08:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36046E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 190so697650wmz.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jIOPy71PcWZjJKz2Zi3owNXyP9wS0eEBz4BZZ+xLt88=;
 b=DOQNpJmTzQJ07PlrsA9wD5Pn2X09SQxxyN3kHtxeodcgzi8Ykmla2cqkI/wVS1JpPJ
 3eE1eaH5MSBZsa461g25igPNwnGc6VazrF5jXh1q8WXRpRGRqVApAqCDCEReWQCZNnOW
 /BMD6FKe6mGOBpYtq0hz71X98yOqwlLCxHtovNy23y2O9VBEPBe1SY8/XF42dW9CGLS3
 AaJdGdy5ZL0DvMRo+5C3zru9wtJ4dp5galDImBX/UuzBfBM8E/CECaPgPE6gEgSfAGkt
 zSrIKYGw90wZYpZhSGt37u/SP/k9g7q4xIcS+0CnDUN/TJZ+RWdVJSBQSQ7qcNV5+N8f
 fdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jIOPy71PcWZjJKz2Zi3owNXyP9wS0eEBz4BZZ+xLt88=;
 b=rXEQlC7IDlQtvFW0+0kj1xl+jaAzgao8sMlayxOhgdxulASveHeFxb9roQoLqa8f2H
 neriBkzy1+0FgpSmCGjogzAKT6hyZLbFuVRaPaFw78xRgoPnX8d6ojVSFsF2Niik1Syb
 3RbKTw5EvlHVnCGW4ddk8M7crP81klNHGCSW3Cl/94KVqt0eJZhLZorcfzdoUNSq/6eS
 cu8a+LfG2ULjH98JKfaMtXq32N2IP30d5nnWEuv3DWGzuX7v8WSmFGDKX58kx7XcZSmo
 WyjwN/VzH2RFZjlh2neUHwsUX34XcDGA4JFnroSiDFQg9rpstvTgG73ljtpkoeIEO3R4
 ixMQ==
X-Gm-Message-State: AOAM53389+/QnYfqog6AMr9Z94NLyMfTh82ybzI+kfGY4WyfEeq6dKzR
 JKemmzCa2qYCSFXl5D0Heylx+A==
X-Google-Smtp-Source: ABdhPJzvH6UUhulrt7P8a6PD9WIjQIKrsaQV3Ag8pMRM0XsjnSLnZHyD20dmavzpdbEWgdMYGBIkcg==
X-Received: by 2002:a05:600c:4101:: with SMTP id
 j1mr936107wmi.55.1610525310368; 
 Wed, 13 Jan 2021 00:08:30 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:29 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/30] drm/nouveau/dispnv50/headc57d: Make local function
 'headc57d_olut' static
Date: Wed, 13 Jan 2021 08:07:50 +0000
Message-Id: <20210113080752.1003793-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113080752.1003793-1-lee.jones@linaro.org>
References: <20210113080752.1003793-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYzoxNzM6MTogd2FybmluZzogbm8g
cHJldmlvdXMgcHJvdG90eXBlIGZvciDigJhoZWFkYzU3ZF9vbHV04oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KCkNjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJlZGhhdC5jb20+CkNjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+CkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVk
LW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2hlYWRjNTdkLmMKaW5kZXggZmQ1MTUyN2I1NmI4My4uYmRjZmQyNDBkNjFjOCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZGM1N2QuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkYzU3ZC5jCkBAIC0xNjks
NyArMTY5LDcgQEAgaGVhZGM1N2Rfb2x1dF9sb2FkKHN0cnVjdCBkcm1fY29sb3JfbHV0ICppbiwg
aW50IHNpemUsIHZvaWQgX19pb21lbSAqbWVtKQogCXdyaXRldyhyZWFkdyhtZW0gLSA0KSwgbWVt
ICsgNCk7CiB9CiAKLWJvb2wKK3N0YXRpYyBib29sCiBoZWFkYzU3ZF9vbHV0KHN0cnVjdCBudjUw
X2hlYWQgKmhlYWQsIHN0cnVjdCBudjUwX2hlYWRfYXRvbSAqYXN5aCwgaW50IHNpemUpCiB7CiAJ
aWYgKHNpemUgIT0gMCAmJiBzaXplICE9IDI1NiAmJiBzaXplICE9IDEwMjQpCi0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
