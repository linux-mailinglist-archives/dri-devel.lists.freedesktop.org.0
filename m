Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 782D032B831
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2906E8FA;
	Wed,  3 Mar 2021 13:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAFC6E8FA
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:58 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id m1so6399389wml.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=njsbuAXEhvSkC6YoNxprxAwF24DaUFg/QS4093pyPFU=;
 b=TgIkGyP9JIU32AbI5hfadU2xhCSdtLwfumK9mSGqfAJPwMDpJ6ZZqpcu4zeW8Td11Q
 lRM81CYzICCagh40F6VzmooVY7+P5gBzN26tOhDsZgvRp/hkh+GyB4AG4FYQnj65q2ji
 piYJQpj7qDS0dG5ivvzUopT+srl6Dh8w5NryTWR6YHsYwVSLrL1Vs3R5Ko/mkg7ezVPJ
 glNsEfOZLP7CZLkamEsNtZht3f8x66dFgrIzH8NvwaqkDyxMUl8AvkxgT/XYDi1Fop8D
 qynT7C6kiMsYtdGh2o7N2Hd9tL/S9YYSCTBL1nylThfIeAUktbqcBVs9FTkUXWMCxbgk
 hPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=njsbuAXEhvSkC6YoNxprxAwF24DaUFg/QS4093pyPFU=;
 b=RZy7nSI/2dVX2l5D4S0puLYgucWtWUUNA7pNluIPI93LSBIh2DAKPefZDttRigxjtv
 P3SOwuRnO9OT/zv8KdcXHrGI/xNp9T8Cd2zG1SYMY3vjGJ5a9qiq+5Et6MurO+jVe2d0
 YhQq0pxi8xWzXaipgoFlxHYaEd+bklUh6etSHn6GHwN9lVb0J80BUBl7SfkmzMLas9Mr
 r7MDdjyYKKjkRyboUyolkdpb7AHnvJsONA/u53684J321D/Ek5QFMN07G2yvv4J/OF6M
 +iIHudNwu02NSZymqtqCfuSfTy1xaokh8jcugQZNHyU0MFZ4sQ5nv9qUTdhwpKWvcKRQ
 QntQ==
X-Gm-Message-State: AOAM5305TlGcXmPvyHOzhMsH5+1EKqFr8WGN6/vxxhM3O+ACf+iz2ERA
 mY1a9/kGe+J7VE9tCGyusW5Rhw==
X-Google-Smtp-Source: ABdhPJyqk61brH7edJ1UguviebdmPTyHiDQEdrRQQC/ORyoJAItYmzYPp0UF+z+6JKEAd119zC5iug==
X-Received: by 2002:a1c:a98a:: with SMTP id s132mr9569035wme.12.1614779036972; 
 Wed, 03 Mar 2021 05:43:56 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:56 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 24/53] drm/vmwgfx/vmwgfx_kms: Remove unused variable 'ret'
 from 'vmw_du_primary_plane_atomic_check()'
Date: Wed,  3 Mar 2021 13:42:50 +0000
Message-Id: <20210303134319.3160762-25-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Lm9yZz4KU2lnbmVkLW9mZi1ieTogWmFjayBSdXNpbiA8emFja3JAdm13YXJlLmNvbT4KTGluazog
aHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMjEwMTE1MTgx
MzEzLjM0MzE0OTMtNS1sZWUuam9uZXNAbGluYXJvLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2ttcy5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5jCmluZGV4IDlh
ODlmNjU4ZTUwMWMuLjkyOTNkYzE5YTc2ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2tt
cy5jCkBAIC00NTMsMTAgKzQ1Myw5IEBAIGludCB2bXdfZHVfcHJpbWFyeV9wbGFuZV9hdG9taWNf
Y2hlY2soc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAKIAlpZiAoIXJldCAmJiBuZXdfZmIpIHsK
IAkJc3RydWN0IGRybV9jcnRjICpjcnRjID0gc3RhdGUtPmNydGM7Ci0JCXN0cnVjdCB2bXdfY29u
bmVjdG9yX3N0YXRlICp2Y3M7CiAJCXN0cnVjdCB2bXdfZGlzcGxheV91bml0ICpkdSA9IHZtd19j
cnRjX3RvX2R1KGNydGMpOwogCi0JCXZjcyA9IHZtd19jb25uZWN0b3Jfc3RhdGVfdG9fdmNzKGR1
LT5jb25uZWN0b3Iuc3RhdGUpOworCQl2bXdfY29ubmVjdG9yX3N0YXRlX3RvX3ZjcyhkdS0+Y29u
bmVjdG9yLnN0YXRlKTsKIAl9CiAKIAotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
