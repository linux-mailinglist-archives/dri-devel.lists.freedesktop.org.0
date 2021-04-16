Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFEC362287
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C82B6EC13;
	Fri, 16 Apr 2021 14:37:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8596EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:44 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id o20so6272573edc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9yFPCpC+KcvysSHE/TzUxgB6C7mqpr36eNkZECpHJ1c=;
 b=q24GGnGRAdzpbYYl+M7v9f6M5HcbMMdNCA8arW0qs7LIDVQVe0UheCz0W99E9kxnj8
 N9FH43w69SituNqVOudZiavc32EsX36KzfUsKqwa1nLTqpCTmE83YCzAJcJZblI57yeZ
 +2yJUhe+ShtafcRhG+RrBXeAsrhgdbxSN2AwmxE46GXV+mlylZpzRs65X5SFvZGldR3r
 WAe1mbQraJTDhXL8wK09ukr8acgzxwhxqfItaqvC5EVi9cCEun6BK7WXQp5C6SONaOV1
 Feqo9YoxTXppD1tCy/5zJNjgEbL4YKuHwL4rK3TSkhLjruiaMb3YL112oC3OWWYdQ9vZ
 F5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9yFPCpC+KcvysSHE/TzUxgB6C7mqpr36eNkZECpHJ1c=;
 b=qNcFQ50fkanLanSz1a3EQo4Zr7bFj3223ENyElshxyw21UQyLimjFeQ/q0vBVrarD7
 cznYd9ETqVFYg1sa53mrqjMFfhThIISqXtLMF3c23uXWNVCLfGdM7W/KDBEfnirAoYrw
 DAlfWgzZxIrsh9uoXpKW7/TuY4kLFD7jWkvRyhF7tlr3ljxZrikmZTkdw72hY/RKMLUD
 RuYGv8TTseapLY2tPnSJXrjIKZNPZhb5evK0wW9g4ZE5k5q8cvJlnbVQ4Ni7kwAGon5o
 AJIni83E/cx8J3nvviqFmqFnFx2XZzRCU09lofcYCQJhXzWiFC6XatQGsq26NPPSz1aB
 C85w==
X-Gm-Message-State: AOAM530xfzp7ZXd8FFLbAuwSPCg5VchhTNVSs/F8bs4t+245LruhEDWo
 C9hOzFIR10iecUMyPLNskxZ8hQ==
X-Google-Smtp-Source: ABdhPJypegeIw/OfmdjDiD5Yv8LbnLlddqWoHhsQUliKWi5Cl4dqXq69rC2fzWbChz449ozg46lBfA==
X-Received: by 2002:a05:6402:3550:: with SMTP id
 f16mr10260110edd.134.1618583862459; 
 Fri, 16 Apr 2021 07:37:42 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:41 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 11/40] drm/nouveau/dispnv50/headc57d: Make local function
 'headc57d_olut' static
Date: Fri, 16 Apr 2021 15:36:56 +0100
Message-Id: <20210416143725.2769053-12-lee.jones@linaro.org>
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
aWYgKHNpemUgIT0gMCAmJiBzaXplICE9IDI1NiAmJiBzaXplICE9IDEwMjQpCi0tIAoyLjI3LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
