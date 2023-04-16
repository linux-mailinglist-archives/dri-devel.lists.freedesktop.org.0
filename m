Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378456E40B3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44FB10E39C;
	Mon, 17 Apr 2023 07:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B5B10E105;
 Sun, 16 Apr 2023 17:39:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 o9-20020a05600c510900b003f17012276fso1045407wms.4; 
 Sun, 16 Apr 2023 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681666788; x=1684258788;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vj/vqJ5bGXyvz254ZvxSYqoDaKPY0yBJ/BPaiX+7f40=;
 b=GbZ9qiyBQiC3ZZsAZwmZuMooMXC98jAjM1w5wB0VdPvf4Av6DHWd74zf4tSA1A10Us
 47dMt74Xi0tWrq0wZOBcoOyTGktzKBUzP/Nw38f2QTbY3fL22uqTDCkuE7yLtp/mEWpK
 M2+xB0M77byJB40/68yhEdIK/+OlSWyNof2HGBhKlvj5OsUlnd066BJwIfNr2tVMNBgG
 ilNt18gjeWShGrj/nW9QjYOSCy79DIVKXZfqRsTDbC6FFV1Nq89WYLO1S7d1ks9YhRHV
 pIYWWEkCEXCv60Hl25tTsvZjyDiZvfGV5GEoIIdzPpvP8vbTEI/7NIn0rSluk8erIJ2+
 As8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681666788; x=1684258788;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vj/vqJ5bGXyvz254ZvxSYqoDaKPY0yBJ/BPaiX+7f40=;
 b=TDt4TinowsLY98yrIYUWPR8IO8ASXooicnPl6kOgiRegLDLnGR48L2rYtuICbw+OGy
 KfVTsHn8+6AWMwPxvujyYt9QmgJbprZ2NYwfVxWFOrKe8+7hqQiebD1eVCo2uiREOkx7
 8C9wrVc8N1itlt5e2sJ+ykEPS734MTbUeGlCmXyE0sUOvVsHFkKcgUPN5bipe+FDRdEJ
 BWLn1w7SG2eh4jGEIsCYd1KTIPPXy+NWgh5GGiFdRS8FH6cMCI33zJTeHbHBJc989EDe
 fLvzb5/X35vnkZUcMaS2fgwc5PnVUETc/iwhFocl5k4/CR64+JkCmecXGzCz7AR437OY
 5Tsg==
X-Gm-Message-State: AAQBX9deWL6XS7jqHjxMkpnNhKU8rV0GzbnnZg4yG6vURMf8giyB/yAy
 W+GgpQc80Wbq/RN1IoKqpSAVDzBUjLEKdw==
X-Google-Smtp-Source: AKy350Y3fPwLrncRZ6gFnnV7HPqMl22uXBtXMCQlzgWmqs+WZ7y/f+Rn5c6rFTgk3saJv+pVdBlMbg==
X-Received: by 2002:a05:600c:348e:b0:3ee:93d2:c915 with SMTP id
 a14-20020a05600c348e00b003ee93d2c915mr8408694wmq.6.1681666788361; 
 Sun, 16 Apr 2023 10:39:48 -0700 (PDT)
Received: from speedcore (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a5d6b09000000b002d97529b3bbsm8486767wrw.96.2023.04.16.10.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 10:39:47 -0700 (PDT)
Date: Sun, 16 Apr 2023 19:39:46 +0200
From: Arnaud Vrac <rawoul@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 2/2] drm/msm/dpu: add HDMI output support
Message-ID: <ZDwy4n12G8unCgM0@speedcore>
References: <20230415171926.85774-1-dmitry.baryshkov@linaro.org>
 <20230415171926.85774-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20230415171926.85774-3-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Apr 15 20:19, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

>MSM8998 and the older Qualcomm platforms support HDMI outputs. Now as
>DPU encoder is ready, add support for using INTF_HDMI.
>
>Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>---
> drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 45 +++++++++++++++++++++++++
> 1 file changed, 45 insertions(+)
>
>diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>index e85e3721d2c7..65cce59163a4 100644
>--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>@@ -617,6 +617,45 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> 	return 0;
> }
>
>+static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
>+				    struct msm_drm_private *priv,
>+				    struct dpu_kms *dpu_kms)
>+{
>+	struct drm_encoder *encoder = NULL;
>+	struct msm_display_info info;
>+	int rc;
>+	int i;
>+
>+	if (!priv->hdmi)
>+		return 0;
>+
>+	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
>+	if (IS_ERR(encoder)) {
>+		DPU_ERROR("encoder init failed for HDMI display\n");
>+		return PTR_ERR(encoder);
>+	}
>+
>+	memset(&info, 0, sizeof(info));

Move this where fields are initialized ?

>+	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
>+	if (rc) {
>+		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
>+		drm_encoder_cleanup(encoder);
>+		return rc;
>+	}
>+
>+	info.num_of_h_tiles = 1;
>+	info.h_tile_instance[0] = i;

i is uninitialized here, the line can be removed.

With the above changes:

Reviewed-by: Arnaud Vrac <rawoul@gmail.com>
Tested-by: Arnaud Vrac <rawoul@gmail.com> # on msm8998

-Arnaud

>+	info.intf_type = INTF_HDMI;
>+	rc = dpu_encoder_setup(dev, encoder, &info);
>+	if (rc) {
>+		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
>+			  encoder->base.id, rc);
>+		return rc;
>+	}
>+
>+	return 0;
>+}
>+
> static int _dpu_kms_initialize_writeback(struct drm_device *dev,
> 		struct msm_drm_private *priv, struct dpu_kms *dpu_kms,
> 		const u32 *wb_formats, int n_formats)
>@@ -683,6 +722,12 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
> 		return rc;
> 	}
>
>+	rc = _dpu_kms_initialize_hdmi(dev, priv, dpu_kms);
>+	if (rc) {
>+		DPU_ERROR("initialize HDMI failed, rc = %d\n", rc);
>+		return rc;
>+	}
>+
> 	/* Since WB isn't a driver check the catalog before initializing */
> 	if (dpu_kms->catalog->wb_count) {
> 		for (i = 0; i < dpu_kms->catalog->wb_count; i++) {
>-- 
>2.30.2
>
