Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007AC2F83AB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83806E4DE;
	Fri, 15 Jan 2021 18:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF5A6E4D4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c5so10208648wrp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KHlPUbSx+S7HaZ3WBED5ORmcl4UG0ks+269HCulT/zo=;
 b=bZYtpfaz0DYpixFzW6Nzd+4F9hPJRMtojlCsMlY2KnHYpvFtgakrDpSvM5GYx5XYZL
 asdSBMrkKKcnALNec1t0ZNf8pxjFeMP9dWq9N4KH0VSopwM8kPWS0muwwIdLg3Z+nju8
 9slBiFnMdBmq5jZuQDSC9HAa5lU9d3tnywip2BURw0o8huKwWcetZNKpDVe3S1YfrL7u
 BKWnyQpECfsuEeTK6L6KgDmpTsDk8ubHBXnnaPHpeEYGZ8m6FBZQxUowWVFCz6+Bcs8C
 chRz5cw3Lg1/XaDVsudrPmPiW1ZIo7n09RV7QDTU7fm+mgOcaCqSTlno8rErPuIICv7C
 hFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KHlPUbSx+S7HaZ3WBED5ORmcl4UG0ks+269HCulT/zo=;
 b=BxO865ld5zs3o3elZFhnOsZmMkJTW+23sYgA113PpkhEj6REShpJ+61LxnQ0A39Zol
 yvxZQsgVOInsJB+oiPuPmiurl5h06SkHaH4n1lZHryJbGZ80e5w3Arw35TH1zVvm6JiL
 i5Z2bVGGmw0icj8QGoxewgmJCt2EQM30FDaT6HeK676RW+bvP0++jZ3MSv8X6+44QrI7
 /FxjxBEd2cxgzeK2wicsez8DuWDEzlQ5N867RUqi2Wumyst0UfMUhPhWoC4qtEQGvVx8
 +jm2/En5ToLK9/y56A/f2LOl+aWwq7gRWK1hNrxJyIYyDEttPxjxBHLYTaIPGP2ewq+n
 uyvw==
X-Gm-Message-State: AOAM530wgAJ9Vs9PnBFz6+/6pVDhu6Bu+zYRUAQYjFDVpuGw4+IQ1ODN
 Mw7FIuJuv7e666dlRK/A9q4Ld10yIMjwPlmG
X-Google-Smtp-Source: ABdhPJyhWz+GaUNosLHdwGA3LiH/FmN+J7ZpAI3lFu2pFreiu9/b2FNhjvUQAAukANQoSXVXodQXew==
X-Received: by 2002:adf:8285:: with SMTP id 5mr14064349wrc.289.1610734593666; 
 Fri, 15 Jan 2021 10:16:33 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:32 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 20/29] drm/gma500/oaktrail_crtc: Demote unworthy kernel-doc
 headers
Date: Fri, 15 Jan 2021 18:15:52 +0000
Message-Id: <20210115181601.3432599-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/oaktrail_crtc.c:184: warning: Function parameter or member 'limit' not described in 'mrst_lvds_find_best_pll'
 drivers/gpu/drm/gma500/oaktrail_crtc.c:184: warning: Function parameter or member 'crtc' not described in 'mrst_lvds_find_best_pll'
 drivers/gpu/drm/gma500/oaktrail_crtc.c:184: warning: Function parameter or member 'target' not described in 'mrst_lvds_find_best_pll'
 drivers/gpu/drm/gma500/oaktrail_crtc.c:184: warning: Function parameter or member 'refclk' not described in 'mrst_lvds_find_best_pll'
 drivers/gpu/drm/gma500/oaktrail_crtc.c:184: warning: Function parameter or member 'best_clock' not described in 'mrst_lvds_find_best_pll'
 drivers/gpu/drm/gma500/oaktrail_crtc.c:215: warning: Function parameter or member 'crtc' not described in 'oaktrail_crtc_dpms'
 drivers/gpu/drm/gma500/oaktrail_crtc.c:215: warning: Function parameter or member 'mode' not described in 'oaktrail_crtc_dpms'
 drivers/gpu/drm/gma500/oaktrail_crtc.c:345: warning: Function parameter or member 'dev' not described in 'oaktrail_panel_fitter_pipe'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/oaktrail_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index 900e5499249d5..129f879710022 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -174,7 +174,7 @@ static bool mrst_sdvo_find_best_pll(const struct gma_limit_t *limit,
 	return min_error == 0;
 }
 
-/**
+/*
  * Returns a set of divisors for the desired target clock with the given refclk,
  * or FALSE.  Divisor values are the actual divisors for
  */
@@ -205,7 +205,7 @@ static bool mrst_lvds_find_best_pll(const struct gma_limit_t *limit,
 	return err != target;
 }
 
-/**
+/*
  * Sets the power management mode of the pipe and plane.
  *
  * This code should probably grow support for turning the cursor off and back
@@ -337,7 +337,7 @@ static void oaktrail_crtc_dpms(struct drm_crtc *crtc, int mode)
 	gma_power_end(dev);
 }
 
-/**
+/*
  * Return the pipe currently connected to the panel fitter,
  * or -1 if the panel fitter is not present or not in use
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
