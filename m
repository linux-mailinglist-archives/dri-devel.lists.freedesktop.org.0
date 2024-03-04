Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4FC87021E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 14:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F75311211F;
	Mon,  4 Mar 2024 13:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oOK5ET4O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C06811211F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 13:06:56 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dcbd1d4904dso5089102276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 05:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709557615; x=1710162415; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZF5EHPeguAlmw8pt+rnW85Aj9ppqfHEoGqFfoa9ov8U=;
 b=oOK5ET4OfD3fx8p1xfhzWKX1T8FNAMB/HTlSgIZ8D5LlTqi9CY+Nwxa3chvkhffLPB
 ykCMLt5t73xBZSK5zAO8XYzslKlaWx+53WRzr25/ydH9h2WWAuDXnRdNgfMGTzmmBz2Q
 VuVxeME1UwlLbeLSL8Qy6Inj+k5kFzhiywB1vDR2gruNK/AOcUJVHIso1HMeHuDonPAR
 SbMno218hc1s6S8KeqF+0ps/Rz4fXPE1vSqZYFncGe0/OUgT6+oAgok4wyiLlP87gbLA
 qDq5LCqZ/uPRu2n3vdjrXmES1ieGjYmTI6EemjjwD3LwbNy2vHigpK7f2Qj8em2OePMM
 QENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709557615; x=1710162415;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZF5EHPeguAlmw8pt+rnW85Aj9ppqfHEoGqFfoa9ov8U=;
 b=I3GiM9Eu96q3GlDrUFmLK8AhZIJ4dyRbsMD7D2w0UmAg51GtcXmIgUyeRzuWzt3UCn
 9sa4qb45pt3KA6u7C2JOWxk1Ma0YIC1IgT2+NOhPjrxbMVOTYQ5+uhCJFq99fu5JjxBx
 TtadeZt146861y4KypmHrwSUq0VkhlVe8TOw1pMq/KKdAdzgvoixzoI8+iPQV4+ulb5L
 Mjsj++2KBzuD++Xya7byvXSPGOrR1NxN/UkotoKJ01EbOwk95fzs87ckyAl/rjeH417Z
 OhcTFqwUonO25KjpUaHxVD2TghMMXdLOBysFKO7Ao/eS1LXMqXhj+eeQh6hhUSxCyXN5
 CmqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd11I/bRDX9EIQuU6qSXaZJSxcpyogc7gxnKbO6owl6mqVSTm9VzAnvlVHpPAk6dmN0ofYBzaW4JW1d1Cd5hE4JlqWdSRXisBVUeH+RH57
X-Gm-Message-State: AOJu0YybT6/mwEs1b6M9oy7g01EE195fOgRaeOjX+bDoABxjMh8nKnhc
 rCYpXWyQcKmCCr2Xv3VEOD0xpMlO3uyufRpSmmgZfISEwoeeueiF+TiYU1em+Be2puODvOVpadc
 DjAyCZCIcNemiZTYCh5JUKgJP4BdOBJPVgZcwpQ==
X-Google-Smtp-Source: AGHT+IHDoyrZSgo3d0pdsvjs58WMMhEuCQvAoO7S/07i8igiKmULNd3ZGDbVm0+XF7UvoNRUriBuP/dHX1xzq05mxT0=
X-Received: by 2002:a5b:b05:0:b0:dcd:13ba:cdd6 with SMTP id
 z5-20020a5b0b05000000b00dcd13bacdd6mr6132325ybp.47.1709557615168; Mon, 04 Mar
 2024 05:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 15:06:43 +0200
Message-ID: <CAA8EJppf0ebg+qnw7Z4P_6W4pgf0E4+KLGLEhU138f4k8+QxOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop unused dpu_kms from interface
 initialization
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 28 Feb 2024 at 21:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dpu_kms seems unused while initializing DSI, HDMI and DP through
> their respective _dpu_kms_initialize_* functions.
>
> Hence lets drop the parameter altogether.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2af62d8fa9a7..ab924ac78c9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -494,8 +494,7 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
>  }
>
>  static int _dpu_kms_initialize_dsi(struct drm_device *dev,
> -                                   struct msm_drm_private *priv,
> -                                   struct dpu_kms *dpu_kms)
> +                                  struct msm_drm_private *priv)
>  {
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
> @@ -558,8 +557,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  }
>
>  static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> -                                           struct msm_drm_private *priv,
> -                                           struct dpu_kms *dpu_kms)
> +                                          struct msm_drm_private *priv)

This breaks now on top of YUV patchset:

drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function
'_dpu_kms_initialize_displayport':
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:583:35: error: 'dpu_kms'
undeclared (first use in this function)
583 | yuv_supported = !!dpu_kms->catalog->cdm;

As this requires adding of the yuv_supported argument, let's consider
moving it backwards: for  _dpu_kms_initialize_writeback() we can get
format_list and n_formats from the dpu_kms.


>  {
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
> @@ -592,8 +590,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  }
>
>  static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
> -                                   struct msm_drm_private *priv,
> -                                   struct dpu_kms *dpu_kms)
> +                                   struct msm_drm_private *priv)
>  {
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
> @@ -671,19 +668,19 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
>         int rc = 0;
>         int i;
>
> -       rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
> +       rc = _dpu_kms_initialize_dsi(dev, priv);
>         if (rc) {
>                 DPU_ERROR("initialize_dsi failed, rc = %d\n", rc);
>                 return rc;
>         }
>
> -       rc = _dpu_kms_initialize_displayport(dev, priv, dpu_kms);
> +       rc = _dpu_kms_initialize_displayport(dev, priv);
>         if (rc) {
>                 DPU_ERROR("initialize_DP failed, rc = %d\n", rc);
>                 return rc;
>         }
>
> -       rc = _dpu_kms_initialize_hdmi(dev, priv, dpu_kms);
> +       rc = _dpu_kms_initialize_hdmi(dev, priv);
>         if (rc) {
>                 DPU_ERROR("initialize HDMI failed, rc = %d\n", rc);
>                 return rc;
> --
> 2.34.1
>


--
With best wishes
Dmitry
