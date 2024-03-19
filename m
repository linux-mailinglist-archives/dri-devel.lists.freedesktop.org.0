Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E217B87FEA4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 14:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA67710FAAE;
	Tue, 19 Mar 2024 13:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TZVrcaOl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E9E10FAB3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 13:22:11 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2d476d7972aso81408141fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 06:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710854529; x=1711459329; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lfmAQzn+LLNOd1P1Ei+JN2z86jgOlHY8peuyPP1BcaI=;
 b=TZVrcaOlchBVeeU/6JwSMkrfDhPNMLb+5TUTzOdzVw1+gjs9y9pyg6vrWxGYkf0QZI
 5GXqpmJvC0330qSShD54JVsIUZQCyPpBUYvIbZxBWJsUNMa7Zn4xJpm4Cfb7m+k5+7VQ
 VYtLDTo36LeS/3GbAa3saqORdbfiMNpM9VTtIIKwXW4KN8ns61Li7JKWt4euL+HJcmpy
 4QNKJPVQlScLODYq4ZId2tuQkMOOP0ETYEq0tDf7vOhNsWOPk8qY6FoiqmnzVs57G3M6
 +yozeJj+UcTwbGh7qI8sciBYMMpN372abUoTRWa2wfStBgZ/AyCllOMgRN1xUykgVGUy
 7AMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710854529; x=1711459329;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lfmAQzn+LLNOd1P1Ei+JN2z86jgOlHY8peuyPP1BcaI=;
 b=rP+Mb2p3FfB6a01N56ZtqVB/RzEGWnyaeghFu81o5Xbreq451VCzpkx7CuGMti5Man
 XzAE2kQgooXuEGDy91lJ3jCHPrGFl5h3IhnPLw3PeaTsAP8GMVz7GrtcLap8i6ErlJ4s
 pE3/yc/QqSs7UOEaPaexJbBMJX+QvzNdcOIu6N2H6YzOjkL4wfLcUZgMlvvv4WXSPXOt
 BhW1KXZqI9BhImygiOQV/dWwNsP+t9j/a3ZSTSNol+2EIvDliT7LkwAlt4plgCvwoVIY
 aP+0G/OUgEYXt+4MOmyeL11QEEMbVKnZXd329Uz6dkWclTWuJbx09j25MGhgL9KvC39K
 69Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4TB2J7AQoRUen3Hb9aXu1afNG0nFwH/UyIHfJnmR7DBI0CeE0vKSb+6XBPTBnMEyFNyJp+ALZdpuJ3GXaUcHeMJysZTehRnl+R61/6dgc
X-Gm-Message-State: AOJu0Yw6pInLwg3tSd1Z930zgGACSYNb1aJNt2+weomEWo6W4X7hczvc
 2c6vdp961vyWMr4PsD3/4yYi4F5Cds/DoPB75etGytTQCn63qSoN4psopFZx7AOmrtDnhjo/CAb
 j
X-Google-Smtp-Source: AGHT+IFX1aAEpEwXPmaUZwe+U7THcR+jVQycmmL88o52TfP9WgSU/bZekNQH7YzEgPY3sCwDXKJzEA==
X-Received: by 2002:a05:651c:210d:b0:2d4:64fc:65bb with SMTP id
 a13-20020a05651c210d00b002d464fc65bbmr2650875ljq.48.1710854529349; 
 Tue, 19 Mar 2024 06:22:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 j7-20020a2e3c07000000b002d435cdf2adsm1826148lja.111.2024.03.19.06.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 06:22:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 15:22:06 +0200
Subject: [PATCH 8/9] drm/msm/dpu: merge MAX_IMG_WIDTH/HEIGHT with
 DPU_MAX_IMG_WIDTH/HEIGHT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240319-dpu-mode-config-width-v1-8-d0fe6bf81bf1@linaro.org>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
In-Reply-To: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2190;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oxONTvBo3a22TAARxRZKWb7mB82JhjnItvZbZYS2bz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl+ZF41mZIEwZobtj48H7DderSIIO41YVgYGsl3
 bR1W7sCgM+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZfmReAAKCRCLPIo+Aiko
 1YKBB/sGizXX5biEBU53PDUittIDTEl5a4CFAeO84c9uZOzfj0tWA7dgnHYFFKR/fTDEOfhaYkL
 lxK7IYixXSl2qucsnL8THVdMnnn9QdvPzxCn7wkxKPQgdI/6HCOTRq3oAvIzEwiE859kXC3aJ8V
 Ix3usb0d8ZNTxgWTyZgOqEZEVttfGMdesazgydy3N8HmEYVyZhiV29dSfCjA0qa7z8Ln9LpVJbn
 15eVr3hBAHRyU54IASZ8soCq+oAdpbmUbXs5UO720z803zL3mqAvHlKMS+++Y/Ma//W2D85VL1x
 rJ7V7fddxB5MdknGa/+x6+4zmxpS0mp5I21pyd4DR2Hg6MLO
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

dpu_formats.c defines DPU_MAX_IMG_WIDTH and _HEIGHT, while
dpu_hw_catalog.h defines just MAX_IMG_WIDTH and _HEIGHT. Merge these
constants to remove duplication.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 1fc9817278df..1ee78ba640b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -20,9 +20,6 @@
 #define DPU_TILE_HEIGHT_UBWC	4
 #define DPU_TILE_HEIGHT_NV12	8
 
-#define DPU_MAX_IMG_WIDTH		0x3FFF
-#define DPU_MAX_IMG_HEIGHT		0x3FFF
-
 /*
  * DPU supported format packing, bpp, and other format
  * information.
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d1aef778340b..af2ead1c4886 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -21,8 +21,8 @@
 
 #define DPU_HW_BLK_NAME_LEN	16
 
-#define MAX_IMG_WIDTH 0x3fff
-#define MAX_IMG_HEIGHT 0x3fff
+#define DPU_MAX_IMG_WIDTH 0x3fff
+#define DPU_MAX_IMG_HEIGHT 0x3fff
 
 #define CRTC_DUAL_MIXERS	2
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9e57c51f5343..47165d2bd4ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -851,8 +851,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	fb_rect.y2 = new_plane_state->fb->height;
 
 	/* Ensure fb size is supported */
-	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
-	    drm_rect_height(&fb_rect) > MAX_IMG_HEIGHT) {
+	if (drm_rect_width(&fb_rect) > DPU_MAX_IMG_WIDTH ||
+	    drm_rect_height(&fb_rect) > DPU_MAX_IMG_HEIGHT) {
 		DPU_DEBUG_PLANE(pdpu, "invalid framebuffer " DRM_RECT_FMT "\n",
 				DRM_RECT_ARG(&fb_rect));
 		return -E2BIG;

-- 
2.39.2

