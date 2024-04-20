Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6438AB8D6
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 04:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0806C10F1B8;
	Sat, 20 Apr 2024 02:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sq+SYwML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E774710E59C
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 02:41:05 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-516d6c1e238so3307200e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 19:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713580864; x=1714185664; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=92e8LaIK4EBDXuZyzLXA86cqI9J/1l0M4wqFvKPdW00=;
 b=sq+SYwMLQvCO+18wdniJaaw1c7T/TxqURhFPngKDDi9C4Xru/iTNyxSfmpGcv912Sc
 NhJOsqZtLMGJWV6smWDeVNiHiTEJrTXpnAOJbu8i+xQuFn6Z6Frhshb91D2pjfygDmiu
 nED/eifNFdMO2zLEtvQe92bNirWlfnnU5Pkoko5Og7T2tjz2ft4G9kCKi9RZDTCc8lxb
 J4eLLy4RYal61QsTzBwIQ5DXjQIA48Z+TpYPG4D7f8ihZ6D3/gRDVnPwmkpcJVIaUF82
 5CuNkB01loj1T4L3Jz8qJhpolDdUcMbhcCU2IDmgaX7CuQKfjfNx0dGLKDRVXIz6wADB
 gWQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713580864; x=1714185664;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=92e8LaIK4EBDXuZyzLXA86cqI9J/1l0M4wqFvKPdW00=;
 b=Q00lPMDwWwmx8+hl4qbYw1aGq4mFXtsDaiHE8dR4pShw5v5Qkd2eIBbgieIVyAdfRa
 1upaposEu8d5GLbonB7sEvY85XWAvbXKYNyDu/HATGkSY1tOUTCTJk3TJ+uiApDR0Lw1
 WYQSMxWI6SsXzewU/T8nHroAUt5ntVK7XPTYIQNgqy24R4j/H/6vuMWw3MqtfthW15VQ
 3dKSsRxPXGzaeKn1+gs542kXh7PFQ14/Q+DnguxTBIrcUu8C5FwArTjyL4CJGHvjuhVW
 +FvJSKipq3NJHahHFi9FdN5wRgfN9zB5Wsb9dXHBYkwIQVz8YRM9OgXA5PC7ry/O6jg4
 QBDw==
X-Gm-Message-State: AOJu0Yz6yAJ3RFgV/engy7yp42RuO9nBKxWKwH/kSmD2n9SdQUnOzYjl
 5IdJrAh8eGA3O3a1zp7DGx99CYIz698Q6KNQyW14jEtJ0YDuBYB9dtBbZ5WGwTY=
X-Google-Smtp-Source: AGHT+IGjO5k/naoev5sxgX4ZvZAR6tfwVgRaSDtPTeY0+NyMuKHQm96+pk1UDNu0IsOFdlNhEd5k+A==
X-Received: by 2002:ac2:4a66:0:b0:518:ab73:5a85 with SMTP id
 q6-20020ac24a66000000b00518ab735a85mr2354237lfp.69.1713580863985; 
 Fri, 19 Apr 2024 19:41:03 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 p1-20020a19f001000000b00518c69b3903sm956951lfc.84.2024.04.19.19.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 19:41:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Apr 2024 05:41:01 +0300
Subject: [PATCH 1/2] drm/panel/lg-sw43408: depends on
 CONFIG_DRM_DISPLAY_DP_HELPER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240420-panel-sw43408-fix-v1-1-b282ff725242@linaro.org>
References: <20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org>
In-Reply-To: <20240420-panel-sw43408-fix-v1-0-b282ff725242@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=910;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Q4hm4/DHNLlud3PcM0T1AblUu0zyxNmUfpUpzJ8X6JU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ5qytp1q9qWy/M1NfwpPfmc1WdR/8Hbx05KWeetjlrm3l
 y9XkAjpZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBE8oM5GHpN0nee4/H5bMoZ
 ntDqPUVbm/u+TNPpfwrShdVz/ju7Rzi8yLk9S/nVzMZfvALTfx8IXPlX44K6+tdXfmkz71cE/VP
 bG9F754vq/fCOL3+9LFuPWe9nXZnRLy9qmKGreNjSzlxWc6/Ae9GTrt92F77z52NnCDLbP7VAQG
 8Ry6JlsltuallyGRqlTbrAL/vU+Oo1vYlvjLWNOo+Yzb23vTikZ+Kyuckm0Xc07kV/Y7aJKDI4o
 Rz2J7xhGuPqnqs2R6VePN5hXxUip9Lcc3Ne3vlHUbObV1wR0GhsfRDSdkKK3+PQfR7ltVLndp1N
 PPRrU3qk5zq5FQ0OxS9fBrz2DFbzOMQx62zH34aXDtm/AQ==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel driver uses DSC PPS functions and as such depends on the
DRM_DISPLAY_DP_HELPER. Add missing dependency

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404200800.kYsRYyli-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index ab67789e59a2..5e6692207beb 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -340,6 +340,7 @@ config DRM_PANEL_LG_SW43408
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on DRM_DISPLAY_DP_HELPER
 	help
 	  Say Y here if you want to enable support for LG sw43408 panel.
 	  The panel has a 1080x2160@60Hz resolution and uses 24 bit RGB per

-- 
2.39.2

