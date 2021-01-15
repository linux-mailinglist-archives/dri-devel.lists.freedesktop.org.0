Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7342F8361
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBB66E42C;
	Fri, 15 Jan 2021 18:13:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8316E42C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:22 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id y17so10189194wrr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6joXVovshGu0VUNPPEN8i/itJp2RBRid6Z1nZigsRg=;
 b=EXlvQ1xkuYaB0Z7MdEmm5WdvyxotwscXh8F9NHedDJhTWXPeZU2gdBVPYu2OMHO23K
 dJ1ancfIwxMzShrNifaoMD53u0iTsFUFLLs6DAH9RK+2Q52Dm1lQUbrkxG0psDGfvKZQ
 1q23GTqrN2ZlUI1/IGj7veXKtmNjfJrkK8xDHtZ4QHbvzK4yxaf0me/Bu1PmlP/rH1D5
 HjTLgfrnW1un6iLvAUuHfNUXBa5aGyYYh68Akri/+EqvSmQqc3TTb0ka82S/NodzUXbi
 50Fpepn8Iu6zfCgWWi5e2tJ4pPnKvyPkYTsgOxqzq3X5UIpDk/eC4DdZt0G0SexixD7z
 o0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6joXVovshGu0VUNPPEN8i/itJp2RBRid6Z1nZigsRg=;
 b=F5A6gRcQGwq1GdtzvjHFxCclAnQSYmSfwkhYnv8uj8j03Vm6Fyx1SwNhWjpR0xr5m1
 ayci6iNgpgaXuLP6iua9hC8zriIPFFZTf59SLsor1eadBoUTaM5T6e+Y0NVm8y4CzU2g
 oqK2dqmSt5cBdwM+raR9++g1M3HXkNJhENdznxwkt54O3ljgzpWC+gl6C7VPdhvHdks1
 LT1nuEJIrNPjVB8ceCk6Y/kNMku5uhbiA4rXX3FvOQ5A2+3IHbz1gUVBgGmNLlxA5+sP
 2MBDB/8mJK5FgmkGC15jSx5dznG6rRqFe2hk2ORazJTWGjUjfBWdnzOUo+qBEfPBq5Td
 lkig==
X-Gm-Message-State: AOAM5303M8ruScbJKctZGFbQa1fiD50xaRbBEQQJZP7YhRUuwWC7ohcK
 mEPNk8VPp/LoEZhKYhmnWHma9A==
X-Google-Smtp-Source: ABdhPJzBkaanuNrwj5IIxpOf2GYlr9KoLi6NwQlWpRiq8dPyjtOk8hCZpIdDhOd8/ew2D5/WlxQr4A==
X-Received: by 2002:adf:eac7:: with SMTP id o7mr14550950wrn.23.1610734401637; 
 Fri, 15 Jan 2021 10:13:21 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 04/40] drm/vmwgfx/vmwgfx_kms: Remove unused variable 'ret'
 from 'vmw_du_primary_plane_atomic_check()'
Date: Fri, 15 Jan 2021 18:12:37 +0000
Message-Id: <20210115181313.3431493-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmM6IEluIGZ1bmN0aW9uIOKAmHZtd19kdV9wcmlt
YXJ5X3BsYW5lX2F0b21pY19jaGVja+KAmToKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2ttcy5jOjQ2MDozMTogd2FybmluZzogdmFyaWFibGUg4oCYdmNz4oCZIHNldCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpDYzogVk13YXJlIEdyYXBoaWNzIDxsaW51
eC1ncmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+CkNjOiBSb2xhbmQgU2NoZWlkZWdnZXIg
PHNyb2xhbmRAdm13YXJlLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJv
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYyB8IDMgKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9rbXMuYwppbmRleCA5YTg5ZjY1OGU1MDFjLi45MjkzZGMxOWE3NjgzIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYwpAQCAtNDUzLDEwICs0NTMsOSBAQCBpbnQg
dm13X2R1X3ByaW1hcnlfcGxhbmVfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
LAogCiAJaWYgKCFyZXQgJiYgbmV3X2ZiKSB7CiAJCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9IHN0
YXRlLT5jcnRjOwotCQlzdHJ1Y3Qgdm13X2Nvbm5lY3Rvcl9zdGF0ZSAqdmNzOwogCQlzdHJ1Y3Qg
dm13X2Rpc3BsYXlfdW5pdCAqZHUgPSB2bXdfY3J0Y190b19kdShjcnRjKTsKIAotCQl2Y3MgPSB2
bXdfY29ubmVjdG9yX3N0YXRlX3RvX3ZjcyhkdS0+Y29ubmVjdG9yLnN0YXRlKTsKKwkJdm13X2Nv
bm5lY3Rvcl9zdGF0ZV90b192Y3MoZHUtPmNvbm5lY3Rvci5zdGF0ZSk7CiAJfQogCiAKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
