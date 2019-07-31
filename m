Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375377C79D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 17:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928A989F53;
	Wed, 31 Jul 2019 15:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4562189F35;
 Wed, 31 Jul 2019 15:52:57 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id r21so49666142qke.2;
 Wed, 31 Jul 2019 08:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pZTtPetgDRQ8hFiKWSTItZlk0M/Ni/u6pmU+1bz/XO0=;
 b=qaCJXtzb3iaPxsLm7AfKFy3dYuSYxLswmjQwNbeuDaorfiLqw4b6shTWsk+yyQH0U8
 CNiOnNUTjRX46RaK0PCquApWo/9XsOaqHZGq4ofITqk7pBIUFNW/UyEbgaqivb2ZT6cR
 KQQT7TRP6kvqepoY8tDtlToCYZXxQqcRideh1Yq+Sig/Bg9X0bZuSURTvjysfquEIVCy
 8hoDTQf3Yu1JdZeNjC5TBiJg1+Up/uIh+7a+AC0KJcW0tWMxj4Mw7QtJPt+Wk+4PON82
 2LZo5NjcvFjOJwAcZIoUHCCCedSc5D5CV9BopzOh4ivrXrzRARcA1DK8ajFMjlvUlgVi
 vfgA==
X-Gm-Message-State: APjAAAXBSN/z3f+8+P+F3gHVJ7bVz/Dnj+/TL2GgbEUdzU9zvSPpcC0P
 9yw5UeFZnBV/ptVkacan8EukDt7c
X-Google-Smtp-Source: APXvYqyFN3rx+fyxXIi+XAPZc6ipa/ACTNgZeOsDRRYAKQWtn3bRFfg5l6aBw0O6zmLpqWI9vzjo0w==
X-Received: by 2002:ae9:ea0b:: with SMTP id f11mr80083502qkg.142.1564588376128; 
 Wed, 31 Jul 2019 08:52:56 -0700 (PDT)
Received: from localhost.localdomain ([71.219.6.100])
 by smtp.gmail.com with ESMTPSA id v17sm38020296qtc.23.2019.07.31.08.52.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 08:52:55 -0700 (PDT)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/amdgpu: drop drmP.h from navi10_ih.c
Date: Wed, 31 Jul 2019 10:52:42 -0500
Message-Id: <20190731155246.20603-4-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731155246.20603-1-alexander.deucher@amd.com>
References: <20190731155246.20603-1-alexander.deucher@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pZTtPetgDRQ8hFiKWSTItZlk0M/Ni/u6pmU+1bz/XO0=;
 b=DFsDrF6d+OBBNGJ0umf0Pdm7iN+k1iVqXLl7zYPesnviQhE9BS8srUP0sRlf1QDPiK
 DG9up02aLgux/jD5l0c1R9bxu/GrJ8u+XWZ7JC3YAsFMLSy5f91rnepcVN7qBDOkFh+1
 BVJ4LzvgGsShKz/Qmob+VzscaApoQNjaEjGxy9FK+Bv+bsumrG2CoDs1DlYG7E4Amkkp
 bwbUNjRQNliKcWCGEv7orfCg13swENEB2k60AORUXnlEeWIMwCm6Wca10kV0aLdTC85Y
 3BgE1aWF3jsMWWhzNjM2VxTCS+iuhQszX7KhTaHEUKSBob8djYlrQ/Xw2cBRzPNtF8YA
 XIaw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kIGZpeCB0aGUgZmFsbG91dC4KClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZp
MTBfaWguYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX2lo
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9uYXZpMTBfaWguYwppbmRleCBlOTYzNzQ2
YmUxMWMuLjlmZTA4NDA4ZGI1OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvbmF2aTEwX2loLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbmF2aTEwX2lo
LmMKQEAgLTIxLDcgKzIxLDggQEAKICAqCiAgKi8KIAotI2luY2x1ZGUgPGRybS9kcm1QLmg+Cisj
aW5jbHVkZSA8bGludXgvcGNpLmg+CisKICNpbmNsdWRlICJhbWRncHUuaCIKICNpbmNsdWRlICJh
bWRncHVfaWguaCIKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
