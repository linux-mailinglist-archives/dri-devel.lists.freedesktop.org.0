Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774658CBB29
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 08:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE92410ED71;
	Wed, 22 May 2024 06:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xepnFh4h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E1FD10F03D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 06:25:59 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so5935336e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 23:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716359157; x=1716963957; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LQ30IMIqS4FxBzVdWL5H8+rA/52Tn4UUr+hikbOiM00=;
 b=xepnFh4hzKrl+UBLxPhp6oj7bVr9VwejCWjP+VvccYbXwE+g/w4NrRMzbm1EMcebvX
 bHISoqspTmbdIrfw1379ETcmhpTYdJpoz6RojT1Pv4zJNeyVny7fJtVcfKBp/K0HZXZE
 eGgwiu1dv7Xs89tNnGmQDjs692uFmtYdd5MTO4/9bWZkgCEUsc5DoHEI4ClIbzFos0SE
 OpWx0Zz8bPRQ7ZhiqETaUasJcWnFS14mNilC7vbjazL2tB2Ajv5SKVM2x9X1RHGawAbm
 BLXe6VQtwkn2ieiZiB+P3uRncZ/wPt5xvHyFfDiqABWKSPypb9gOCKLZkodVdMhJGpdM
 0Mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716359157; x=1716963957;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LQ30IMIqS4FxBzVdWL5H8+rA/52Tn4UUr+hikbOiM00=;
 b=iqeBlJgjkIb5JwhZC3D9KXiCqQ5S61FeQ1CeTk9yt731Y8HStKMPIXDOB0Gd0l9sIc
 ggLWbQW5i/tEyYpEpj46RsrHlijL4o+FRd9RZ7ve2ZMtBKRfYI8/A/zXLp4QgLFw+EYW
 jC1JE9jlqPCVRVXSnBLIZTPVMWkYET5FHjBbOPS2VBo3lq4j4xtCx9W+9zuMK3ys3j/Y
 p5wBkxozatKKpgPP3cVDZUm2xii15IcLvfCiUVa9iBC3EYFz/jOd8dnoMREOR1KQQOzT
 oGDgih1aX2OSROXLRFtZUwSfGHbrLlN/AZ7mV+apfKw1+bPXct3Ibv0ySqm3nEUpqKST
 MNcA==
X-Gm-Message-State: AOJu0YyVLpyzqJEIo1L+l+mrFddXw/ZxVbTWUKIQnjZvO6Ao8nUReTpv
 bLAAhmc9tFbkjMXSfWQuEjvMEliUEFJZEwSQIZDn0yOGR3xElk+JiE5B5ZcIZxg=
X-Google-Smtp-Source: AGHT+IF/7QZ0tGCXiFYJB/x+q86OQI6ANWr9joQ1GchVETZy/vH8FMHjzEY05fxM+S1qk+o81MyouA==
X-Received: by 2002:a19:384e:0:b0:520:98ff:5554 with SMTP id
 2adb3069b0e04-526bf35c8c2mr521592e87.30.1716359157191; 
 Tue, 21 May 2024 23:25:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f35ad4d0sm4910023e87.49.2024.05.21.23.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 May 2024 23:25:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 09:25:54 +0300
Subject: [PATCH v3 2/3] drm/panel/lg-sw43408: select
 CONFIG_DRM_DISPLAY_DP_HELPER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-panel-sw43408-fix-v3-2-6902285adcc0@linaro.org>
References: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
In-Reply-To: <20240522-panel-sw43408-fix-v3-0-6902285adcc0@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, Caleb Connolly <caleb@connolly.tech>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OzVLboiQq6/i7927qpGZm3VA/GBlmQcFYUqcIc2Gbpg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTY/y3fKq7yHxjaGudmp6EIq0hsmBQi2qIcxkt
 wwyQWrXMseJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk2P8gAKCRCLPIo+Aiko
 1ZOwB/9XTi/5fMAIsZRH09go2mO1GT8qtjrK4eDP42uTvxIB9XnQKdrUOLABIzsGrwK1kZMfn0q
 wfp4/kKHBuQgQthNE7p7+8smtARdS0TIcPNAWbc2QD0dLFgMyIUqYt9AYgrRtcQd95UMy/DdWKC
 nRvvBcugj/sYeyCgRMBXRl4nMWUmpbf55b6fWCygEWmfd/FO5SsrnY0sws9XiRHDiQchsCPDR5l
 Q9/0ALMepT5iKL3nIEmo7t+oyAFyGRg9K6RG9biicPfITKy98PVCGtYTQ5emoDN/zz4RmsyFdlx
 Yv00RFSQrYhIJ9jvkr2r2fT7Fshh/pvnqcW40+ltqqaFwfuF
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
DRM_DISPLAY_DP_HELPER. Select this symbol to make required functions
available to the driver.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404200800.kYsRYyli-lkp@intel.com/
Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 4a2f621433ef..3e3f63479544 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -340,6 +340,8 @@ config DRM_PANEL_LG_SW43408
 	depends on OF
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
+	select DRM_DISPLAY_DSC_HELPER
+	select DRM_DISPLAY_HELPER
 	help
 	  Say Y here if you want to enable support for LG sw43408 panel.
 	  The panel has a 1080x2160@60Hz resolution and uses 24 bit RGB per

-- 
2.39.2

