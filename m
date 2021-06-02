Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2757D3995A2
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 23:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C38F6EE78;
	Wed,  2 Jun 2021 21:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572946EE5E
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 21:53:01 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id h12so443329pfe.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 14:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lq+j7EC+Gx3WCGnwMoYdurN9sibRpLzB0GmPg/1XgI4=;
 b=ZW8yTi6GD9LVnQGgbwo7rCdFxHYAbahm6RVRbWxUIawzLI1CZPjxowlt8Hh1exyuRy
 k19Q3/ejbH+Q6mmwftrSaksUZNmGAHo28+6bOBlc+RR5jrUI/MNmiWATRfTeZQy+50x7
 1HaZvk1hcHdu+y/2AQxBt8PoB7Wuh3DNjuPMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lq+j7EC+Gx3WCGnwMoYdurN9sibRpLzB0GmPg/1XgI4=;
 b=NBIgPTyVaQ0GrLpizByN9Kq/q/jvPGDqpruvMRxLlNE6zTexoQ4+74GJAcE0rmvYG9
 Pzzsvg22TURgngxMYu8ydG126yT0JdrAt6uRx26D55yt+gZW6hFsOwVDtTSAPK6BG2h4
 9L5q5UcXORBcT9lmBKLrOItxsO8uXPzIOlix4GYGk++QE36eGUtkAcGtlsWIR3mpKklk
 fg5oI321IvNt4QCdHMULnqbsU7lU4SaG3m0VvRNoR1RmQYwW+eAD+sJ6BwqOwPLkUjOm
 G1m8nFIzwptHEQA7sLngpuW9sPYYKH4jS4VH5KUeflqXAzwubrfzBD6/spTwdTwGkizm
 gyxw==
X-Gm-Message-State: AOAM533Sdw9AbrxbGN9p+l6m+wYAPQWuS5ztIskRMBolscEZsmhlT70e
 ZsUG/M4lK7n5HBod3+ToETUO2A==
X-Google-Smtp-Source: ABdhPJwmcFpZGL+MxakC+BMaC0MaiMcHHXa/0QiO/Q1wGXl+KYNDte2SuGLilUulhfJf70RgoiQNyg==
X-Received: by 2002:a63:5243:: with SMTP id s3mr36032666pgl.247.1622670781046; 
 Wed, 02 Jun 2021 14:53:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id u18sm479143pfl.9.2021.06.02.14.52.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 14:52:59 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Dave Airlie <airlied@redhat.com>
Subject: [PATCH 3/3] drm/pl111: depend on CONFIG_VEXPRESS_CONFIG
Date: Wed,  2 Jun 2021 14:52:52 -0700
Message-Id: <20210602215252.695994-4-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602215252.695994-1-keescook@chromium.org>
References: <20210602215252.695994-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=332597a6d55ed7eafea0e90e859a70f13cbb227c;
 i=8MxRaXNzqVxdNVEPomOFWVQoDm0jYqtSTv9XIpyrwpc=;
 m=udlaZ1oHXV60sxBE3Nj6kbx16O3UEb46qJEP0WlSHd8=;
 p=AjO2aPczGcbQWOJvkZf4iZvbUh/TdY0/fYtGPqGdXnA=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026;
 b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmC3/bMACgkQiXL039xtwCaH/w/9Foi
 8lhEBwfuFJ6LsrHV4FO6P7z7eFV1kN4o+2J1Zmw4efs/Rbr6c60xLBs0XZwZh13P/22y1XlpC1kxW
 nB/VM8cAQMCj5SOxBKkLCLdEyFXD7npP+jABSBaJk/tS4pb+jX+96YlL7Xk3aMREcp4d9/ZMps6sC
 bxHo2Ntevt1AYcCdv6SMb4EBWb2t9IEzpi+6ULPpHsPPDDjH/WGwAfPK7Zj//O6y/rNyORBjt+FX5
 Gun1bYScjTwT9PhgIcQogqC8rvWBfsfD09c+wV3tJmwOhBUpw9KnKwGuRCMMEZ0FjmgI75dlG32XY
 416CaNox8VLvwQVNdEQKaNwmvlKdaGBBNTQJb2xE3pK6AjiLVox7eGZvbp+deVGSdRy2YKsEUEEhs
 kZSZiDrkwsNHeurzSwohjPMzarPu0mbca5jr0+riWGNlDLAw90NjaDPML1l6oD5Puv0GN6yJ7h4Nx
 +Q1u83v/2xJrZmxmBPqE8yqefVrRA9f4+cHjYq/SL07Jy67UzzKmchNJZOkId93loyBeLFMMoSTKJ
 1gix2nwn5DV1kZWXpEHTjnsFR4QEmaocAc2CkBVOjmSMa5r+cjE4dPIOiOpffPRkgOxxETj04+WAF
 y6npaQq+RmPQ5235GZUtT+hHCoPNTyIhoC/QYFl8y0xfR0LpIwsPkEMMlLGeACwU=
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid randconfig build failures by requiring VEXPRESS_CONFIG:

aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'

Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/gpu/drm/pl111/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
index 80f6748055e3..c5210a5bef1b 100644
--- a/drivers/gpu/drm/pl111/Kconfig
+++ b/drivers/gpu/drm/pl111/Kconfig
@@ -2,7 +2,7 @@
 config DRM_PL111
 	tristate "DRM Support for PL111 CLCD Controller"
 	depends on DRM
-	depends on ARM || ARM64 || COMPILE_TEST
+	depends on VEXPRESS_CONFIG
 	depends on COMMON_CLK
 	select DRM_KMS_HELPER
 	select DRM_KMS_CMA_HELPER
-- 
2.25.1

