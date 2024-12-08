Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB1B9E83A1
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 06:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474ED10E1E6;
	Sun,  8 Dec 2024 05:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ugv10qjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420E410E1E6
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 05:29:21 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53dd59a2bc1so3184817e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 21:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733635760; x=1734240560; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vNGx5T/kut2PnS1TJVU24AmFFsWO3iytxgtvJA9Xvfs=;
 b=ugv10qjS/mesx7HkqDGJx9AVh/h+x5YGqik1rkw23p9a5LLIhXGUFaUMA1xe37x2Mq
 CHmGsFpDqlF1UrrzuCg22RAWCeoRLTBHHdzAqUh700kks5d2VXg7b+G5VURgMVIcHpxp
 uqKwm4AxSW18GjTx0Knognt/QNfO3iE00XA/m38Vo4xe3mfe2q+hCMj5wUlbuNSffqUj
 KCvua+g+dwxebDeTkktQFFT7jTR4pkWYKo/OcKoCxsV+BLakyBCt2E+++6aZAN2ZF1Xm
 pfHjPu3YBDraqae/hORgB0ViGnnPgTMlC8eNYnG+jaejORqNWq9LQeBeV+URmSPFqquI
 a1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733635760; x=1734240560;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vNGx5T/kut2PnS1TJVU24AmFFsWO3iytxgtvJA9Xvfs=;
 b=nqr3yYdJPx8HyxEYrPRD8RictFL2xqFkCRBrsghn6eE1pzfZGQ+IP/YgBSARdYOy/w
 CjNZApW16X5npIGsYuPLrER/PmHnJbAasiRi+u6pZN+nQiBUk08pH+jYN4D7sUObLYKZ
 7VrEbgduvsg/2qZTmwz3yYNmxdXbMIgL+DCrRahjuEsOLFdPnzZkS+FmIcMpvQxgP1Mw
 cqfTWcqHiyakp6SdOfVeIxHQz2CY0zi8q85EV5oreUamqXPaTd7FTh1wQEMTyIif6HFE
 jTq+Zou5MYHyZhRS/kSiipl7euEHwKLIGX+p9XR7v4VsRVZ7wUVv+77/dHtcT1JCCeG/
 Uctg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMKuFgaHuwHcFi+dVJ2rjzxZDFE9fOB2OhCX2Lw9QBpYBKUcYWCOkC7rM3rXjMspg8Do84YDLNFNU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJpQxusc2eHH/uJm6Sy2g9d4pPymvV0lRpBV6qAL8YVeh+3gdI
 zCt5ES3a+ccLPskhOE1KmkZbfv7+/ouOgCnQDuo5aRKCUdfkQAtiXOdTmKHEFno=
X-Gm-Gg: ASbGncsfcbYa4BkhsZK6Vjm1UGdi+ZdjK5p1QUL7YfeZlAw6hBdrVp09dH6WFy7NBFw
 HZFW1YFrO9slDp6x8HTTLnUZ4HJMpEmFpEknLgrNYigo8t8cp776OEOuZBUeM1Bu+Mht45iwDGJ
 BOid9cexYGmwG0zGI9e7Q4wduRSkZJAKL86c9ADdMYCpx6UeCz1ucCkrDt2cdQzefbUJHXHmKlh
 ELx5LGxSmnDOw6R0icZEVOYCRcBGf8K5/nGW0XO7oM/XfegnyCEnFqZEAj6zcSu+jMqP4+Ycy2n
 x2GENrNPhpfokjqPylESfClowSPHAA==
X-Google-Smtp-Source: AGHT+IGOhQSpceSZ9KEm21ZiMJVHBV/c3kQtKDrxqIsT6LPxNRV9WJHBnedhtMHtbPhWJEJ/Z4HNTg==
X-Received: by 2002:ac2:4c4d:0:b0:53f:8c46:42b0 with SMTP id
 2adb3069b0e04-53f8c46432cmr719545e87.42.1733635758999; 
 Sat, 07 Dec 2024 21:29:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3a90336fsm420105e87.265.2024.12.07.21.29.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 21:29:17 -0800 (PST)
Date: Sun, 8 Dec 2024 07:29:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
Message-ID: <zae7rlojv5iiq2dx7bxhdsmmzj73o65cwk7kmryxsst36gy2of@k3vcm6omcias>
References: <20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com>
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

On Fri, Dec 06, 2024 at 12:00:53PM -0800, Abhinav Kumar wrote:
> On chipsets such as QCS615, there is no 3dmux present. In such
> a case, a layer exceeding the max_mixer_width cannot be split,
> hence cannot be supported.
> 
> Filter out the modes which exceed the max_mixer_width when there
> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
> to return failure for such modes.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Note: this was only compile tested, so its pending validation on QCS615
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9f6ffd344693ecfb633095772a31ada5613345dc..e6e5540aae83be7c20d8ae29115b8fdd42056e55 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>  	int i;
>  
> +	/* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
> +	 * before even checking the width after the split
> +	 */
> +	if (!dpu_kms->catalog->caps->has_3d_merge
> +	    && adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> +		return -E2BIG;

Is it the same as checking that there are LMs which support
DPU_MIXER_SOURCESPLIT ?

> +
>  	for (i = 0; i < cstate->num_mixers; i++) {
>  		struct drm_rect *r = &cstate->lm_bounds[i];
>  		r->x1 = crtc_split_width * i;
> @@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>  {
>  	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
>  
> +	/* if there is no 3d_mux block we cannot merge LMs so we cannot
> +	 * split the large layer into 2 LMs, filter out such modes
> +	 */
> +	if (!dpu_kms->catalog->caps->has_3d_merge
> +	    && mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> +		return MODE_BAD;

This can be more specific, like MODE_BAD_HVALUE.

>  	/*
>  	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
>  	 */
> 
> ---
> base-commit: af2ea8ab7a546b430726183458da0a173d331272
> change-id: 20241206-no_3dmux-521a55ea0669
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry
