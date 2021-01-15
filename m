Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8E12F8371
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53336E48E;
	Fri, 15 Jan 2021 18:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26886E487
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:50 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id c124so8204192wma.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dP3O8GvG4KjVneRsCzuySK+Xofh1JQYhFAzp9Cmygd0=;
 b=NvYZ7daMri4pWwZQmsX5ru4VU0SpWalBIl53yLzN3/Cv4z4K9Il8axaTUtk/Mlvcau
 +1zefGgSce+JpOwuRVKR3bjhjjlic21dn6xpsJbCJKdmtIUTgynojMfsyD1RiRLzRcOS
 BUazqGqqSbbAxNfZw4rLZ1d+zkIPJuftk5Y/Van2ipPmeFYkmxf5jYJHtfiDr2togNJ5
 busT5EsVamr7PP37HD9pDJ//Ea6+P+0UPXBKsSTwXk304J/xX2a3ngh/9eaGz9wRpcMu
 MW83FaYOeNLaGah3GsQPDVsikgx72qqFoQ4+YNRiBI3lwcFC9yojl5gaQtTx6w54zp3P
 Vy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dP3O8GvG4KjVneRsCzuySK+Xofh1JQYhFAzp9Cmygd0=;
 b=gKdXKv81s8hSfOv9y2fB70q1nhpjCc9SrCyoRgAoPRb4/EgSqxGRq/9VUNWabIw7/3
 OXH+VmSBd4Dl83AE4pWUSCR8OOptAUO1nQkLzEX/Wpd5b0xkBuRoHgf76OhS+9nU3snN
 X+wwMNt9Ur0NZIiFZDUqwOMdtF8lUMTSOqvRyCaJ3J1Oz23RXj5SuwWmjQr+GTNtjS1V
 RxwtRqXUuKvrrStDKtN7BeoWRmK9hS62r7u51f9Xyr0T7H8v3qR6VlCaU5qn63TA1UL3
 s77Cf1kCfxcfGklg0D5EcT1tC0qx0gRv46GFkt58U7OLuoh/p+e07DemrG0Xi7vlSfkX
 utyg==
X-Gm-Message-State: AOAM533SaaCtgagwptaszk9tOLqX5FKxQI9T60V4omK5hnIiIdoPb6JH
 epw36xmgvSfGLPYkvkiiElSniTynm7Vb6KHK
X-Google-Smtp-Source: ABdhPJylLVYhZtPQf2lvdbnpBfE2TpTiOfADIk0wEfZBOn1gHRWMAPa8rKFyyYAyBG8ecnMgxD3D8g==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr9873876wmj.170.1610734429439; 
 Fri, 15 Jan 2021 10:13:49 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:48 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 21/40] drm/gma500/gma_display: Demote kernel-doc abuses to
 standard comment blocks
Date: Fri, 15 Jan 2021 18:12:54 +0000
Message-Id: <20210115181313.3431493-22-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/gma_display.c:27: warning: Function parameter or member 'crtc' not described in 'gma_pipe_has_type'
 drivers/gpu/drm/gma500/gma_display.c:27: warning: Function parameter or member 'type' not described in 'gma_pipe_has_type'
 drivers/gpu/drm/gma500/gma_display.c:190: warning: Function parameter or member 'crtc' not described in 'gma_crtc_dpms'
 drivers/gpu/drm/gma500/gma_display.c:190: warning: Function parameter or member 'mode' not described in 'gma_crtc_dpms'
 drivers/gpu/drm/gma500/gma_display.c:573: warning: Function parameter or member 'crtc' not described in 'gma_crtc_save'
 drivers/gpu/drm/gma500/gma_display.c:616: warning: Function parameter or member 'crtc' not described in 'gma_crtc_restore'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/gma_display.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gma_display.c b/drivers/gpu/drm/gma500/gma_display.c
index cadae842a0e9e..b03f7b8241f2b 100644
--- a/drivers/gpu/drm/gma500/gma_display.c
+++ b/drivers/gpu/drm/gma500/gma_display.c
@@ -20,7 +20,7 @@
 #include "psb_intel_drv.h"
 #include "psb_intel_reg.h"
 
-/**
+/*
  * Returns whether any output on the specified pipe is of the specified type
  */
 bool gma_pipe_has_type(struct drm_crtc *crtc, int type)
@@ -180,7 +180,7 @@ int gma_crtc_gamma_set(struct drm_crtc *crtc, u16 *red, u16 *green, u16 *blue,
 	return 0;
 }
 
-/**
+/*
  * Sets the power management mode of the pipe and plane.
  *
  * This code should probably grow support for turning the cursor off and back
@@ -566,7 +566,7 @@ int gma_crtc_set_config(struct drm_mode_set *set,
 	return ret;
 }
 
-/**
+/*
  * Save HW states of given crtc
  */
 void gma_crtc_save(struct drm_crtc *crtc)
@@ -609,7 +609,7 @@ void gma_crtc_save(struct drm_crtc *crtc)
 		crtc_state->savePalette[i] = REG_READ(palette_reg + (i << 2));
 }
 
-/**
+/*
  * Restore HW states of given crtc
  */
 void gma_crtc_restore(struct drm_crtc *crtc)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
