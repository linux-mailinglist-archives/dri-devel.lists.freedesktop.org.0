Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCC49EA0CE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 22:05:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BCE210E7E5;
	Mon,  9 Dec 2024 21:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SGN/XvUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBED710E7E5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 21:05:35 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-3011c7b39c7so19254681fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 13:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733778334; x=1734383134; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hbwD0xdtFeO2X81Q2PXEiGy5cSfyM0/IvSDcuNaHUrA=;
 b=SGN/XvUniupNkXtKK8OAKWO8Vo30dxW387V1xKoOZWDd13eCRMe94/yofWN1Yllb5H
 AIuBJRub84y05PCfmqqZObCUs7Kyg6lDxV5iYIBwgOHsaV3wwI4dwvMt9mQLk8kcuvy4
 KqOwiXl/3VJqKfmAUIru0C1jzF8hun7CjvRtMT0QprW13663457Y1Vrx9pPftFgkTfLf
 RsEN2qCA9fYAicpjkSIx+G/IM079QorZRCCckslrvDyCVyd010GkECNtYT/EultRiJkZ
 sGgl/G2mXAHaHW7jhxddBcB9gkRgmzVp3fiK0SDD/freGb76vUTmSRbjC+WG/Ai2/wij
 ncAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733778334; x=1734383134;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hbwD0xdtFeO2X81Q2PXEiGy5cSfyM0/IvSDcuNaHUrA=;
 b=LThv8NUPOaGcpzZdZG3sVtLZWfZubg8eWE3+WzYoM9n+0KK5oUiJMWqP2c4z6kAksX
 43nWbURI5lfscnupyJcGZ9UNCx+70peZQH94vT/i8YDlPx+G6D4hNVFFvVo6DY+CP10Y
 zrvtiG9kDLiTxRyjW7b4Z2Ewjc2VU0zK6V6SCfztX47h0tRcdlP9d9DrytWrkM6QAurj
 WzaiIQrWpBDfKkyzZk4Bna1jS/PVFgsn1pyz9JS+KjsdO9w4suwwNh+PAXu9a606gIlp
 OxwQHygjNn2yCQhEUxxw/HGGnWJHisFlHDtiW92Oe5I9C4nZmol+G09Ct57ytM7empyn
 Lp4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2F74hc4SC5xJun0ivzfax+RI8XoPtIobMYniEjSTZgq76hd8FpcKwjes6heO5BCCEQgbOJ8QSM/s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsY/85b+WUQ5ZmW4HJ3eRDNwyR8KRj5Xq74HTRli2Dz0b//m9s
 +GJMTrnKeDozSke1L5eHByyMrmkEoyxpOvCCa/G+DqFbEHxYFpxCqS47wT+Cmug=
X-Gm-Gg: ASbGnctIRi5/aeFZvMaio9Oebswa7dQ1rA7Tbcf94tp5W8yiVOVAvPu6kjXJyA2nMki
 GtoxmUi2pYjcCyfeaVqRLHrz4aLdxPlQaV3iSf8sw2o0fD1inqt9NG2Cu6xV1mea01yFLKtuJ4R
 fwfOJZ2citXgvDSqNvgiXNIL3kNAPcdx3d0OTsr6bUeqcYRuoxporOpXnrAT4niusZJ7AfLy/Cm
 ZCpiP9IJFnXuCVd7MFtVSp4DiNISDWwfnYAKUV8LMA/75lJorYvqyKxfbqCS5okqCWX+236mbLA
 gar5fJZA3ujlMnvPP/jM5bFTuoTFHg==
X-Google-Smtp-Source: AGHT+IE63q6tbZgiYfnAuYiETrebmlUHAEwKw2EoVr6nHG3mwSFQhamy8uW4P5FHyhiMyHhSRBOR9g==
X-Received: by 2002:a05:6512:ad0:b0:53f:8c46:42c7 with SMTP id
 2adb3069b0e04-53f8c4643dbmr3412654e87.14.1733778334011; 
 Mon, 09 Dec 2024 13:05:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e34916befsm1095574e87.120.2024.12.09.13.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 13:05:32 -0800 (PST)
Date: Mon, 9 Dec 2024 23:05:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
Message-ID: <jzbqtrhiebtb6oveg35b4cdu57epqattu5lqhtfhbzctomzhrl@vnl3vklpnvd3>
References: <20241209-no_3dmux-v2-1-fcad057eb92e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209-no_3dmux-v2-1-fcad057eb92e@quicinc.com>
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

On Mon, Dec 09, 2024 at 12:15:57PM -0800, Abhinav Kumar wrote:
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
> Changes in v2:
> - replace MODE_BAD with MODE_BAD_HVALUE to indicate the failure better
> - Link to v1: https://lore.kernel.org/r/20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 9f6ffd344693ecfb633095772a31ada5613345dc..87d76f388bef48c880ae70ddcdb76ccb0336ad32 100644
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

Excuse me that I didn't notice that earlier. && should go to the
previous line, not to the next line.

> +		return -E2BIG;
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
> +		return MODE_BAD_HVALUE;
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
