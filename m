Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FC36E40B4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F5C10E39E;
	Mon, 17 Apr 2023 07:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A2DD10E318;
 Sun, 16 Apr 2023 17:36:42 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 eo6-20020a05600c82c600b003ee5157346cso14287326wmb.1; 
 Sun, 16 Apr 2023 10:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681666600; x=1684258600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=gTGnyS6rs6rw2wtPawo1r6TLU0E5e/rA5/QnDoJLF2Y=;
 b=Q4BUG+RpZcDRqVnscQxOs9I+uzH3cibRGp/+bEy3a8BqKdkzJnv9jXb7obOgyqxQLs
 ht/JJEGTcJVK//Hscwe7FIqqpNwuwFxk9EXQAgu+I+AEhgMH7iGKS1naIQ8jddyYinYO
 Zerb46Yk9YPVAptE3aqvJWlZeJs33hnLeG95Ko7Q21EqhURIjO9DICiviuMeuD+KC/XH
 AGvEX/+aJPFimeDrAaBd9RzYH2Hnt5/d0qtdGhjk4f5FkCKUt1OBf/NLGNcwQ5CeX82w
 4tA+9HM5rlKbU6MzMZBFxp4XJEmxdWkiwIPt9//BHJF5NP5J3BMLxVncnhfTZV3N47Mn
 QUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681666600; x=1684258600;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gTGnyS6rs6rw2wtPawo1r6TLU0E5e/rA5/QnDoJLF2Y=;
 b=BWaUnzjE5h1fy6lxCftVlrp/yTPP1oP6R4ss2YFnSUYVhWqZ0IC+y6CxJcarLSvgkH
 nLjMBhMx8Ns5S9PGrfaSbTZP93S7VULlkcKKHdsF9xHzzRfSJSoxV4AB8wTGxOym4d5W
 qtE5HS+znrlKcJrnjMvuOlWUoPerEXdImKpc8HSSkGVuvYktGXQpKXPsOddDZCVv2uNt
 TSKeCV/oyzlXuvQxtu8SKOdlV8ovLkfAEImBHPeRPEyMW3A729Pxvr3HESSn1JEF4QSs
 qxp6bDWYuPs9s0bXxNG1QZw7K5nPB35hzlQ0ZldaqU8+dXCn9XS77B28V8lEqo3fLCA1
 M3jQ==
X-Gm-Message-State: AAQBX9c3zsqvqp0huqd+Xyu06poP5IT42f2Kgdc9TzxKOxw9VDYQOW8a
 g+wFrFljPPJPJCIxnH5Lpwc=
X-Google-Smtp-Source: AKy350ZFkTZ7FQPOVtEi6XoU/1kQV1X5v6B4GylLXqpNFqyFowQiYu86/DY7js3/XIc/9Hl4A2ym/Q==
X-Received: by 2002:a1c:4c18:0:b0:3f1:6e88:5785 with SMTP id
 z24-20020a1c4c18000000b003f16e885785mr3193019wmf.14.1681666599685; 
 Sun, 16 Apr 2023 10:36:39 -0700 (PDT)
Received: from speedcore (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a1cf703000000b003f04646838esm9798559wmh.39.2023.04.16.10.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 10:36:39 -0700 (PDT)
Date: Sun, 16 Apr 2023 19:36:37 +0200
From: Arnaud Vrac <rawoul@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: simplify intf allocation code
Message-ID: <ZDwyJfFJd6yAgfRr@speedcore>
References: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
 <20230415171926.85774-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20230415171926.85774-2-dmitry.baryshkov@linaro.org>
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Apr 15 20:19, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

>Rather than passing DRM_MODE_ENCODER_* and letting dpu_encoder to guess,
>which intf type we mean, pass INTF_DSI/INTF_DP directly. This is
>required to support HDMI output in DPU, as both DP and HDMI encoders are
>DRM_MODE_ENCODER_TMDS. Thus dpu_encoder code can not make a difference
>between HDMI and DP outputs.
>
>Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Arnaud Vrac <rawoul@gmail.com>
Tested-by: Arnaud Vrac <rawoul@gmail.com>

>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 39 +++++++--------------
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 +--
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  6 ++--
> 3 files changed, 18 insertions(+), 31 deletions(-)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>index 1dc5dbe58572..b34416cbd0f5 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>@@ -495,7 +495,7 @@ void dpu_encoder_helper_split_config(
> 	hw_mdptop = phys_enc->hw_mdptop;
> 	disp_info = &dpu_enc->disp_info;
>
>-	if (disp_info->intf_type != DRM_MODE_ENCODER_DSI)
>+	if (disp_info->intf_type != INTF_DSI)
> 		return;
>
> 	/**
>@@ -1127,7 +1127,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
> 	}
>
>
>-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
>+	if (dpu_enc->disp_info.intf_type == INTF_DP &&
> 		dpu_enc->cur_master->hw_mdptop &&
> 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
> 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
>@@ -1135,7 +1135,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>
> 	_dpu_encoder_update_vsync_source(dpu_enc, &dpu_enc->disp_info);
>
>-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
>+	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
> 			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
> 		unsigned bpc = dpu_enc->connector->display_info.bpc;
> 		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
>@@ -1977,7 +1977,7 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
> 			phys->ops.handle_post_kickoff(phys);
> 	}
>
>-	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
>+	if (dpu_enc->disp_info.intf_type == INTF_DSI &&
> 			!dpu_encoder_vsync_time(drm_enc, &wakeup_time)) {
> 		trace_dpu_enc_early_kickoff(DRMID(drm_enc),
> 					    ktime_to_ms(wakeup_time));
>@@ -2182,7 +2182,7 @@ static int dpu_encoder_virt_add_phys_encs(
> 	}
>
>
>-	if (disp_info->intf_type == DRM_MODE_ENCODER_VIRTUAL) {
>+	if (disp_info->intf_type == INTF_WB) {
> 		enc = dpu_encoder_phys_wb_init(params);
>
> 		if (IS_ERR(enc)) {
>@@ -2231,7 +2231,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
> {
> 	int ret = 0;
> 	int i = 0;
>-	enum dpu_intf_type intf_type = INTF_NONE;
> 	struct dpu_enc_phys_init_params phys_params;
>
> 	if (!dpu_enc) {
>@@ -2246,23 +2245,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
> 	phys_params.parent = &dpu_enc->base;
> 	phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
>
>-	switch (disp_info->intf_type) {
>-	case DRM_MODE_ENCODER_DSI:
>-		intf_type = INTF_DSI;
>-		break;
>-	case DRM_MODE_ENCODER_TMDS:
>-		intf_type = INTF_DP;
>-		break;
>-	case DRM_MODE_ENCODER_VIRTUAL:
>-		intf_type = INTF_WB;
>-		break;
>-	}
>-
> 	WARN_ON(disp_info->num_of_h_tiles < 1);
>
> 	DPU_DEBUG("dsi_info->num_of_h_tiles %d\n", disp_info->num_of_h_tiles);
>
>-	if (disp_info->intf_type != DRM_MODE_ENCODER_VIRTUAL)
>+	if (disp_info->intf_type != INTF_WB)
> 		dpu_enc->idle_pc_supported =
> 				dpu_kms->catalog->caps->has_idle_pc;
>
>@@ -2290,11 +2277,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
> 				i, controller_id, phys_params.split_role);
>
> 		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
>-													intf_type,
>-													controller_id);
>+							    disp_info->intf_type,
>+							    controller_id);
>
> 		phys_params.wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
>-				intf_type, controller_id);
>+				disp_info->intf_type, controller_id);
> 		/*
> 		 * The phys_params might represent either an INTF or a WB unit, but not
> 		 * both of them at the same time.
>@@ -2302,14 +2289,14 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
> 		if ((phys_params.intf_idx == INTF_MAX) &&
> 				(phys_params.wb_idx == WB_MAX)) {
> 			DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d, id %d\n",
>-						  intf_type, controller_id);
>+						  disp_info->intf_type, controller_id);
> 			ret = -EINVAL;
> 		}
>
> 		if ((phys_params.intf_idx != INTF_MAX) &&
> 				(phys_params.wb_idx != WB_MAX)) {
> 			DPU_ERROR_ENC(dpu_enc, "both intf and wb present: type %d, id %d\n",
>-						  intf_type, controller_id);
>+						  disp_info->intf_type, controller_id);
> 			ret = -EINVAL;
> 		}
>
>@@ -2409,11 +2396,11 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
> 	timer_setup(&dpu_enc->frame_done_timer,
> 			dpu_encoder_frame_done_timeout, 0);
>
>-	if (disp_info->intf_type == DRM_MODE_ENCODER_DSI)
>+	if (disp_info->intf_type == INTF_DSI)
> 		timer_setup(&dpu_enc->vsync_event_timer,
> 				dpu_encoder_vsync_event_handler,
> 				0);
>-	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
>+	else if (disp_info->intf_type == INTF_DP)
> 		dpu_enc->wide_bus_en = msm_dp_wide_bus_available(
> 				priv->dp[disp_info->h_tile_instance[0]]);
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>index 2c9ef8d1b877..6d14f84dd43f 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>@@ -21,7 +21,7 @@
>
> /**
>  * struct msm_display_info - defines display properties
>- * @intf_type:          DRM_MODE_ENCODER_ type
>+ * @intf_type:          INTF_ type
>  * @num_of_h_tiles:     Number of horizontal tiles in case of split interface
>  * @h_tile_instance:    Controller instance used per tile. Number of elements is
>  *                      based on num_of_h_tiles
>@@ -31,7 +31,7 @@
>  * @dsc:		DSC configuration data for DSC-enabled displays
>  */
> struct msm_display_info {
>-	int intf_type;
>+	enum dpu_intf_type intf_type;
> 	uint32_t num_of_h_tiles;
> 	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
> 	bool is_cmd_mode;
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>index 0e7a68714e9e..e85e3721d2c7 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>@@ -542,7 +542,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
> 		}
>
> 		memset(&info, 0, sizeof(info));
>-		info.intf_type = encoder->encoder_type;
>+		info.intf_type = INTF_DSI;
>
> 		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
> 		if (rc) {
>@@ -605,7 +605,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>
> 		info.num_of_h_tiles = 1;
> 		info.h_tile_instance[0] = i;
>-		info.intf_type = encoder->encoder_type;
>+		info.intf_type = INTF_DP;
> 		rc = dpu_encoder_setup(dev, encoder, &info);
> 		if (rc) {
> 			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>@@ -644,7 +644,7 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
> 	info.num_of_h_tiles = 1;
> 	/* use only WB idx 2 instance for DPU */
> 	info.h_tile_instance[0] = WB_2;
>-	info.intf_type = encoder->encoder_type;
>+	info.intf_type = INTF_WB;
>
> 	rc = dpu_encoder_setup(dev, encoder, &info);
> 	if (rc) {
>-- 
>2.30.2
>
