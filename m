Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3822F1ED7
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 20:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F8D89DDD;
	Mon, 11 Jan 2021 19:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32B289DD3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 19:19:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id g8so4019wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 11:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=deJgdJaEuReRAIxBvvkhhG4KqxPwTjkmLcBm6GGwPgM=;
 b=o1zswORDqJkgQ6gNl7NERNf4reA60BdU2ZMYXgFJFyEsZoX/97G3rNIhIAaBbqA7BW
 wAQihcz7N/lJ858SgzhqbfScg5rKcbAA/eIzLvb5dRZrI5oWl9oyx121Bo6pwxo3zEM8
 D365DRl87k9MBs3ir5b92oiNs+I7Aav0Zo5MWYC3Y/pQ9f3haEh5qjqvyF9PM/vQ5JJ2
 PwIP2HHcyxXUVnX/A9LIda9ej59Za2lBtPLW66k2Eoadbdw1cvSoM2LW3shjsvJup5Ah
 mNuMWNpCTVlLvSYtOynDvicygepHxRd32z39JWjhFv8Ra6ObdMdpgpcAhQNF5mN6Xv2D
 fN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=deJgdJaEuReRAIxBvvkhhG4KqxPwTjkmLcBm6GGwPgM=;
 b=GS3YKG7hwDlxYtZpfawfm3to/PLXjtRxUCQH2LxExUNq1cBouxl56jylCItYl2yvND
 mB0I6I42Amw2xDPKIBVHlwNP5bpbmC2yxRUzhRPLhS/hM8b+M61iuc8IqICetRDbZ0xe
 oknlR6eQ7yuG/dofinEW1g1+GtqSHgTvFvWlH3es8eCZRL/NFjCPURX/Xv2MXbbRJ1Sl
 Xos7ksoFotMOgPjSxTEItFuoqHYalVD73wkSAMSok48vWBqsjzE/Gbgf9s0fyKIclpto
 q8yS06kibk5EB9GQtB0Qo4pRITOnGGQEq0umUYTrjkxXJ/yb7uPPH+LcwsiqkBRG8vOd
 BdEg==
X-Gm-Message-State: AOAM53364tq2ugKdfOt7vPMukqu2lypyXssR8E+TQoSFYdPbnNThWcUZ
 OXV853eIHG8fXIN1FiBFGLudzQ==
X-Google-Smtp-Source: ABdhPJw6Hy4OeG8axIi3/IOG+PL8vkZ/xZ0G/0YFDEQt7hRGcTtISU1wy3hTTbdLWu/pHyITbgpzQQ==
X-Received: by 2002:a1c:b4c4:: with SMTP id d187mr295556wmf.38.1610392774477; 
 Mon, 11 Jan 2021 11:19:34 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id n3sm778090wrw.61.2021.01.11.11.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:19:33 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/40] drm/amd/display/dc/gpio/hw_ddc: Remove unused variable
 'reg2'
Date: Mon, 11 Jan 2021 19:18:49 +0000
Message-Id: <20210111191926.3688443-4-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9ncGlvL2h3X2RkYy5jOiBJbiBmdW5j
dGlvbiDigJhzZXRfY29uZmln4oCZOgogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlz
cGxheS9kYy9ncGlvL2h3X2RkYy5jOjExMDoxMzogd2FybmluZzogdmFyaWFibGUg4oCYcmVnMuKA
mSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKQ2M6IEhhcnJ5
IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpDYzogTGVvIExpIDxzdW5wZW5nLmxp
QGFtZC5jb20+CkNjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNj
OiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8vaHdfZGRj
LmMgfCA3ICsrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2dwaW8v
aHdfZGRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9od19kZGMuYwpp
bmRleCAxYWUxNTNlYWIzMWQ3Li43YThjZWMyZDdhOTAyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvZGMvZ3Bpby9od19kZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZ3Bpby9od19kZGMuYwpAQCAtMTA3LDEzICsxMDcsMTIgQEAgc3RhdGlj
IGVudW0gZ3Bpb19yZXN1bHQgc2V0X2NvbmZpZygKIAkJCQkJbXNsZWVwKDMpOwogCQkJfQogCQl9
IGVsc2UgewotCQkJdWludDMyX3QgcmVnMjsKIAkJCXVpbnQzMl90IHNkYV9wZF9kaXMgPSAwOwog
CQkJdWludDMyX3Qgc2NsX3BkX2RpcyA9IDA7CiAKLQkJCXJlZzIgPSBSRUdfR0VUXzIoZ3Bpby5N
QVNLX3JlZywKLQkJCQkJRENfR1BJT19TREFfUERfRElTLCAmc2RhX3BkX2RpcywKLQkJCQkJRENf
R1BJT19TQ0xfUERfRElTLCAmc2NsX3BkX2Rpcyk7CisJCQlSRUdfR0VUXzIoZ3Bpby5NQVNLX3Jl
ZywKKwkJCQkgIERDX0dQSU9fU0RBX1BEX0RJUywgJnNkYV9wZF9kaXMsCisJCQkJICBEQ19HUElP
X1NDTF9QRF9ESVMsICZzY2xfcGRfZGlzKTsKIAogCQkJaWYgKHNkYV9wZF9kaXMpIHsKIAkJCQlS
RUdfU0VUKGdwaW8uTUFTS19yZWcsIHJlZ3ZhbCwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
