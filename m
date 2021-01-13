Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF142F4D96
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CEE6EA60;
	Wed, 13 Jan 2021 14:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4226EA5F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:41 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id i63so1846011wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fDDpX4Tq8YbOoBzLmaAPLoJ0FkV3kIft9xiJt5MwHsk=;
 b=P/TckwyC+Zpm96Xw3jhnQcTPN4yEDByRSGHhaDy4FTUtGMu06Iu1Lz1wyjqkxnYGD8
 Ka0UeFrgp+iGG7nEK9sOqDisiaFpLSK1hp1DISbHIQX8TDn4GphpHRUfABx50dTEboH0
 qeaFWlT7UN/Vu7aoSNXpYCaMFlK+DfSHuhMJjBshrb8gKl2yGkzp7JIUWGPZphFnEfly
 608DGRjP7K/CPR0c/OxOSedMrPcUuDd1OSXearvHBAU6PUJXtpFKR1uPWbedCfsb9D0l
 VZxN7mXIKLzNxEZYF8QgplqX7VbOWBfbEy/IEpStDEkkgxcfNRAH9CcHckNWX7BTHpf7
 EMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fDDpX4Tq8YbOoBzLmaAPLoJ0FkV3kIft9xiJt5MwHsk=;
 b=XiOzTXQxRXkT+TxEIqVzEX4DZZvy6PM1C3Up6OiDU1Sc7RGP+LqZyxmkEB4GyGvN00
 Y/blPYy2awy7dh9Y4xEc2/3zbSqoPtHste+7mqZbv/C/LoMrO+DCiUnpYfF8/YqdyGGZ
 11xCV/FIlSLcOQXzisGmQ/geGDh95ky0Z3rGqBAWV68CUflbYXjjVFcox/v2f5jC76pU
 te2mOGiomusO0Zr3nBpvhRj6MH86j0ctnDV9Pk7wuBieS3kmgnnoDCLWtgXuC9MCceSA
 u8s5VEm9ZdccQ4bF7Slm6r1hhSVmGlp+knakonpnqUROem9pC6tNdsDhSudlXTuZbY+x
 wqoQ==
X-Gm-Message-State: AOAM53288IZ03pW7nm5cp3mTaB/SF8Xcwg8po1XaQ/o9n5hO+Cm0QNwI
 BTNbTmeuTBkV935pjv/YSpusgw==
X-Google-Smtp-Source: ABdhPJzYqXQr0JAQFjeee0qoDpAYIIkOJfbnlgTUbeOjt6+QKL+q1AvPdGMRRUWutIMa4sTg1X4bsA==
X-Received: by 2002:a1c:a5d8:: with SMTP id o207mr2598878wme.30.1610549439832; 
 Wed, 13 Jan 2021 06:50:39 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:39 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/31] video: fbdev: aty: radeon_monitor: Remove unused
 variable 'mon_types'
Date: Wed, 13 Jan 2021 14:49:55 +0000
Message-Id: <20210113145009.1272040-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy92aWRlby9mYmRldi9hdHkvcmFkZW9uX21vbml0b3IuYzogSW4gZnVuY3Rpb24g4oCYcmFkZW9u
X3Byb2JlX3NjcmVlbnPigJk6CiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9yYWRlb25fbW9uaXRv
ci5jOjQ5MTo4OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhtb25fdHlwZXPigJkgc2V0IGJ1dCBub3Qg
dXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBCZW5qYW1pbiBIZXJyZW5zY2ht
aWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+CkNjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5l
bC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTog
TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L2F0eS9yYWRlb25fbW9uaXRvci5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9h
dHkvcmFkZW9uX21vbml0b3IuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L3JhZGVvbl9tb25p
dG9yLmMKaW5kZXggOTk2NmM1OGFhMjZjZC4uNWZmMDFhYTM4OTM4MSAxMDA2NDQKLS0tIGEvZHJp
dmVycy92aWRlby9mYmRldi9hdHkvcmFkZW9uX21vbml0b3IuYworKysgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2F0eS9yYWRlb25fbW9uaXRvci5jCkBAIC00ODgsMTIgKzQ4OCwxMCBAQCB2b2lkIHJh
ZGVvbl9wcm9iZV9zY3JlZW5zKHN0cnVjdCByYWRlb25mYl9pbmZvICpyaW5mbywKICNpZiBkZWZp
bmVkKERFQlVHKSAmJiBkZWZpbmVkKENPTkZJR19GQl9SQURFT05fSTJDKQogCQl7CiAJCQl1OCAq
RURJRHNbNF0gPSB7IE5VTEwsIE5VTEwsIE5VTEwsIE5VTEwgfTsKLQkJCWludCBtb25fdHlwZXNb
NF0gPSB7TVRfTk9ORSwgTVRfTk9ORSwgTVRfTk9ORSwgTVRfTk9ORX07CiAJCQlpbnQgaTsKIAog
CQkJZm9yIChpID0gMDsgaSA8IDQ7IGkrKykKLQkJCQltb25fdHlwZXNbaV0gPSByYWRlb25fcHJv
YmVfaTJjX2Nvbm5lY3RvcihyaW5mbywKLQkJCQkJCQkJCSAgaSsxLCAmRURJRHNbaV0pOworCQkJ
CXJhZGVvbl9wcm9iZV9pMmNfY29ubmVjdG9yKHJpbmZvLCBpKzEsICZFRElEc1tpXSk7CiAJCX0K
ICNlbmRpZiAvKiBERUJVRyAqLwogCQkvKgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
