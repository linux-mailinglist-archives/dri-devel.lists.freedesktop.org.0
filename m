Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 062342F83A8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D46D6E4D7;
	Fri, 15 Jan 2021 18:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7E96E4D4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:26 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q18so10227285wrn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xr/TlOQIPbbJBH63luKhm4AYMPttpvHdoQcinOdIcB8=;
 b=r665qRD55DKCi1zOw3JQLyj/yuHDdy5XWz6+iov23eG6Qdd3Ou2RgZPr/83oBEf2o+
 4rzUXjDIJxFS91pJSuuKjbW3s8HaVx7Rm7QAL36NI6gpE57a3p+CzU3uy/VluPW+jNae
 7sdZBLdjkddIouTVDXdfOwsZNF0OMBP6hBc8LsBvQWXEs7N1fAIm4v+7PIh7mxJA0dlC
 bIvK8IuLS4SP4v22vCIP6O9Tcd20ZKsll1HRj2WQ/hLaTd1Dg1lLMdhChmBX3WDb0fet
 gks7rRepkkmjmWL7+nb9agT5oHUc1rmfUwwwHuI7qpJp+WGbv5Yvdd7o7gOoFeIMoiQg
 1d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xr/TlOQIPbbJBH63luKhm4AYMPttpvHdoQcinOdIcB8=;
 b=pQ2JA0sE8oClhXmMF7LkWmStmPArtJ5QeLLB/TBBSFMi7LK1oo1wGM0lqvsaK8hINb
 PVaRBQ3fVVSGsCvhge5FOwcjogUS0q6q2o7VG9UY2oqOyxGUnK5YLgqd3G0msPp0xhQH
 zODGEmGTQv76v1vyGUzQku/abqj7ePz4vVVcwPnO21bqgmFfN8djUKDLZrjR6PMXGPeA
 3yEOCCqSZ02onvt6flR2/Jtv4l/QGb2kaZAVJb2chayqWqkRnFCLZDjCTpKPRcC4l3H+
 2TP9/qld0agRIYortk9aQe3n8Tq6Ed7/sfoSLMhx49wuuiW48mqWy+sWx/ymCwQmanhx
 COGg==
X-Gm-Message-State: AOAM533+VTBLGbPALgyjHnOW7Q2xEAmN5hGE6kkKtYKJRpgKbp5bLOyH
 u1g2/XqCIR/GxFxhENmLrDFDNg==
X-Google-Smtp-Source: ABdhPJyIqUDGRo287c/CoRsZQdx8gY8wQTE3x1mFLo+LVmJ8x8IULoKSWDYTOu8x3lcS8yBMhkv1Wg==
X-Received: by 2002:adf:b359:: with SMTP id k25mr14766514wrd.98.1610734584764; 
 Fri, 15 Jan 2021 10:16:24 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:24 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/29] drm/drm_dp_helper: Fix spelling issue and add missing
 description for 'enable_frl_ready_hpd'
Date: Fri, 15 Jan 2021 18:15:45 +0000
Message-Id: <20210115181601.3432599-14-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/drm_dp_helper.c:965: warning: Function parameter or member 'color_spc' not described in 'drm_dp_downstream_rgb_to_ycbcr_conversion'
 drivers/gpu/drm/drm_dp_helper.c:965: warning: Excess function parameter 'colorspc' description in 'drm_dp_downstream_rgb_to_ycbcr_conversion'
 drivers/gpu/drm/drm_dp_helper.c:2678: warning: Function parameter or member 'enable_frl_ready_hpd' not described in 'drm_dp_pcon_frl_prepare'

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/drm_dp_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 3ecde451f5231..3c5b04abb66f1 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -954,7 +954,7 @@ EXPORT_SYMBOL(drm_dp_downstream_444_to_420_conversion);
  *                                               RGB->YCbCr conversion capability
  * @dpcd: DisplayPort configuration data
  * @port_cap: downstream facing port capabilities
- * @colorspc: Colorspace for which conversion cap is sought
+ * @color_spc: Colorspace for which conversion cap is sought
  *
  * Returns: whether the downstream facing port can convert RGB->YCbCr for a given
  * colorspace.
@@ -2671,6 +2671,7 @@ EXPORT_SYMBOL(drm_dp_get_pcon_max_frl_bw);
 /**
  * drm_dp_pcon_frl_prepare() - Prepare PCON for FRL.
  * @aux: DisplayPort AUX channel
+ * @enable_frl_ready_hpd: Configure DP_PCON_ENABLE_HPD_READY.
  *
  * Returns 0 if success, else returns negative error code.
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
