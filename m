Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B5A2F45C1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DC489F45;
	Wed, 13 Jan 2021 08:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E4889F8E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 08:08:08 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id d13so1039252wrc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 00:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2j2xvlvTKeMvAjdQ03/GzFSNxUFT495xm2EMvSlOnPM=;
 b=fQ5NcLvVmka8WVFVF8DEXHGDlkPDS55e/BwTL1KBk+7FfqF86JcS8D68hU+6tmFN1n
 Gsg9PcDpf7B3zPVrHJ7PVzXs6hq3ruq7R4is9h7lIyQSKqWfBHWm1sVX6EGp3842webt
 ZYyEKUVsd/NOnCsePUQOE6aD5Z9dW2fgHnDK5Nt0q+navMgiIvEF3UWIFnYrFo0jPINu
 qbxP5oOJiTc620W0S2DxUiF7zeCfYNC2M8+8b6qlpWz+Cxtqr1O9N4jrV6Z9p96uF5u0
 YJEWADvfeJ81IfirIzAKTthEivnS04jr68iT2p1Mw5TpoTV2uMiE6b/xPghq/BdJGWQ8
 u1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2j2xvlvTKeMvAjdQ03/GzFSNxUFT495xm2EMvSlOnPM=;
 b=qaYkK7XRsuFHQxJzxtH3VpeOtq6tbna1PfGqf7+AwK72mLLdQFwE9VJ9hCWbvc1XXg
 n79wPTuPyemu9bci796JcWzWTtBSbEKQMyo33w6W2p9+bACIwNoQJTEY5Mp0XExepR+f
 kILAaBpb6SZuCiqFJAEX9Hxyr2UesExswnOpiQTHOMVj0cd1A2SU4R5NyEq1Hyenp2bm
 mGT7L39JXtGzK3VTNg02ff2ZyJTQ9TCBACKGITOKEG1g3u97fifUO4dOXpLyDDU3PT4y
 s73RBrv4SiRsuQ0cr43HgH9nhrJwagjNG1EqrU7s3Sa1isT7xH70RNPiivslrQG8v4Xk
 YiaA==
X-Gm-Message-State: AOAM5312BpEHCJIO5gmFfq+mpItRF9ZasJQFKizQoWtTii3uImw5Kpk9
 7roiWBO3RuT/nfy5sTK4D3ay5A==
X-Google-Smtp-Source: ABdhPJxnX4w3sgt74f0E69wB49NZREq27p9CdFTOlVg+5VdGuDs9Cn7/6qCnQb9gbEPh2ZGzoJJauA==
X-Received: by 2002:adf:a441:: with SMTP id e1mr1151919wra.385.1610525287440; 
 Wed, 13 Jan 2021 00:08:07 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id r20sm1642486wmh.15.2021.01.13.00.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 00:08:06 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/30] drm/amd/display/dc/dce112/dce112_resource: Include our
 own header file containing prototypes
Date: Wed, 13 Jan 2021 08:07:31 +0000
Message-Id: <20210113080752.1003793-10-lee.jones@linaro.org>
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
Cc: Leo Li <sunpeng.li@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNl
LmM6ODgzOjY6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYZGNlMTEyX3Zh
bGlkYXRlX2JhbmR3aWR0aOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMi9kY2UxMTJfcmVzb3VyY2UuYzoxMDA4
OjE2OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTExMl9hZGRfc3Ry
ZWFtX3RvX2N0eOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiBkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjZTExMi9kY2UxMTJfcmVzb3VyY2UuYzoxNDA3OjIzOiB3
YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmGRjZTExMl9jcmVhdGVfcmVzb3Vy
Y2VfcG9vbOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCgpDYzogSGFycnkgV2VudGxhbmQgPGhh
cnJ5LndlbnRsYW5kQGFtZC5jb20+CkNjOiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KQ2M6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6ICJDaHJpc3RpYW4g
S8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJs
aWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogQW50
aG9ueSBLb28gPEFudGhvbnkuS29vQGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5
OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmMgfCA0ICsrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9yZXNvdXJjZS5jIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZTExMi9kY2UxMTJfcmVzb3VyY2UuYwppbmRl
eCBjNjhlNTc2YTIxOTkwLi5lZTU1Y2RhODU0YmY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvZGNlMTEyL2RjZTExMl9yZXNvdXJjZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UxMTIvZGNlMTEyX3Jlc291cmNlLmMKQEAgLTU5LDcg
KzU5LDkgQEAKICNpbmNsdWRlICJkY2UvZGNlXzExXzJfc2hfbWFzay5oIgogCiAjaW5jbHVkZSAi
ZGNlMTAwL2RjZTEwMF9yZXNvdXJjZS5oIgotI2RlZmluZSBEQ19MT0dHRVIgXAorI2luY2x1ZGUg
ImRjZTExMl9yZXNvdXJjZS5oIgorCisjZGVmaW5lIERDX0xPR0dFUgkJCQlcCiAJCWRjLT5jdHgt
PmxvZ2dlcgogCiAjaWZuZGVmIG1tRFBfRFBIWV9JTlRFUk5BTF9DVFJMCi0tIAoyLjI1LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
