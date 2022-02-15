Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C04534B6FD8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 16:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D5410E632;
	Tue, 15 Feb 2022 15:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ADB10E62C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:37:40 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so1695958oos.9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 07:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/RGLD8nwzu2VhuFoIMV+jbsfE56tgO0QtQZcVsmbSeg=;
 b=l6fAXQm8Wcu/W89W5Bq27vFP7GjHxqydLmmOHkiwoIcJ5mOuVMXHyvROhRRg5u5a0c
 7BjNXoiLUfV1nrjmUKiPnbXoWXbOpl1wODxwPb7Y4zWa86tC3ZvMeakI+b+Zaim6YptS
 CMl6kvWf8GkgRqem5iMddRtOT4fuuRF9rNCnkkga9+nMemDSXeVOZQi5ThxDyehk+l13
 DXWiGZ1apMEofA/mqweXCHhuYRcjpMEn1yuQ/dZzPPhODZSoj5ucfAxb+y/M+s0xD6a9
 qIwrgQbPg6F0SBP2goXQuxJZ9NMMlnKDEjDOgoQTGypS6w8LVst+mE4/tthr00fdXrOq
 P5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/RGLD8nwzu2VhuFoIMV+jbsfE56tgO0QtQZcVsmbSeg=;
 b=IBxth6HuHxxb79LP5Yx+phHFMF89j+9qfUoR1bIYKVDJUscetElh1nD/RTDIbIHEs4
 iwW+pMTCLjHchv/nFAdZh1yV5ADKCQCLyU8vN8XFt0Zvyt+6aPwsD17kITHFdATcxawI
 etWjJ5D3jVBNY0ZZ9gkSKUSLv1qToVFzctPKGKdl00WdhZzO/MD0FUbRmW74zqFMMAH/
 SX2PNh1fd9G+cFUE0Pz7TThmDXVxnTnW33RO8FdpoA9iv1+nJ+J3757AlqhrKKv/8WXZ
 lz3Yx0bppC5ewwXg5QkpGa/NIE6j3FNVV2zHwXcnZS5+91+7RU5d7zttznpWifQbvvKc
 lyVQ==
X-Gm-Message-State: AOAM533SS7CY5CeeWBqXthMtYrXGxPKNilTqoR7byxU2131RG8SNTtns
 zo8MFi1S1s5RPyIa31cWHVV2Bw==
X-Google-Smtp-Source: ABdhPJyweGcF6YG2GJE+SrOC7EUNHhPllRZZN6Fn7aiHfQp4+viH4TuuPxXPv6Gg6s2fCnuNRok5QQ==
X-Received: by 2002:a05:6870:5ba5:b0:d1:9c2d:975f with SMTP id
 em37-20020a0568705ba500b000d19c2d975fmr1613502oab.325.1644939459658; 
 Tue, 15 Feb 2022 07:37:39 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
 by smtp.gmail.com with ESMTPSA id t22sm14343175oiw.2.2022.02.15.07.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:37:39 -0800 (PST)
Date: Tue, 15 Feb 2022 09:37:36 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/8] drm/msm/dpu: fix dp audio condition
Message-ID: <YgvIwLa8dGx/JqIR@yoga>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215141643.3444941-2-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 15 Feb 08:16 CST 2022, Dmitry Baryshkov wrote:

> DP audio enablement code which is comparing intf_type,
> DRM_MODE_ENCODER_TMDS (= 2) with DRM_MODE_CONNECTOR_DisplayPort (= 10).
> Which would never succeed. Fix it to check for DRM_MODE_ENCODER_TMDS.
> 
> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 132844801e92..c59976deb1cb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1099,7 +1099,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>  	}
>  
>  
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_CONNECTOR_DisplayPort &&
> +	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
>  		dpu_enc->cur_master->hw_mdptop &&
>  		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
>  		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
> -- 
> 2.34.1
> 
