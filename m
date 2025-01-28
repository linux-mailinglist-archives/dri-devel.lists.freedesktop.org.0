Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74AEA214F2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2025 00:21:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C7610E24D;
	Tue, 28 Jan 2025 23:20:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a2bJvLVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6260D10E11F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 23:20:57 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5401b7f7141so5558454e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 15:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738106455; x=1738711255; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8nYDe6L0+19gf1NVMQt86eufjnNQxpIjp2WrtO88qBo=;
 b=a2bJvLVjSGlFDOIPG9iuIdmAG9CBq5M2Y2YuhPmItl7nLq2ZcAB6Q9hT70rmt60oA7
 0HsS1fqWg9SckoM9ub8pORH/HlcViTHAMgWGTfvcZMgFlw85SmyDCZLHAb125ZOrY0fc
 cEa+LiWUl2EEv/zKHHIeFhSGjN/XTV/eYxFpOCc4mebf2DUXltHRIZBvHP1xMiU3Nin4
 yFsZcc6qFK46fhhTWNEVw496VRTVaDm833EkFQ1qd6l39yPlHpTx5yW+vURpVAY6GGFM
 E1MyqLmSwe5pI1HB4JtjYq6fDiLJx6s/JeLto41aCPpUWm3sXR9iDbQE1Mnq0mSTWErO
 3ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738106455; x=1738711255;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8nYDe6L0+19gf1NVMQt86eufjnNQxpIjp2WrtO88qBo=;
 b=u1CSMZdldCRVraIVo5bDw9WbT52hok44hMg1r3HhCHBp8gS+cyfGQrunpJEaJFvSb8
 dkWzQa/hBRaIbC5n7iVQNPIE+35vt04oy8wI8SPTu2djMX0OfUWyrpjg29+TRpOdBQU9
 VJ3GCWjq56noUMRPWSxwARjsNeAV8GWOwggR/Zetooz+FFiioFBBWyBwuaP97KGLts2h
 FOUTyM/15i8Rq7ZMfu4KRmVQIYCL+HisCnoaTZxVDszky133ni3DWV4gnYkzzpAxouSC
 O6GNp6Yk3+nTsfyG5JtAzrM4iLutK5+mJ6r5js09WuOLP22GHGs97ZlcLx6HwPsJkPJe
 orVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWr01JlxGVxW7Kd97KOggLXAygOL7KFrdWbR0CrSTPxZEyifdhYVoUp7sXLm4aFC6CGPzgDA4C3DVI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCR6v8lizuKnPHtxB6jcDcajgtvu1eGhrZxPRrDNb6c4uaeJdQ
 j7z5RUrEB6s56Fxelxx581ZAFclf01LepUXgMo3ttUnZ4hj92YLi7cfb9pA+MRA=
X-Gm-Gg: ASbGncuOkpXDTX0cZpvhMlTsShy3cJSoKwSOkCd+fa6Giu1aIWJYdCKbLXcd5S3WASf
 qepEQohGTMDnscfm0NGfcOlw9wA2c+mr8SRQgsFeUinMyQ2mC28z+u4CnKhV0hU6iZGe3gzpoG/
 Gqe6BD5XEcRqzK+5yOQKz+jghLgw2CMDVy0CeOImK80MfY/o50mfUj2Z6n7fqnYDm7P2ZfEd3mU
 EmxjjlW0D3DL4d8nTvgR4yNQT88Ry0i5gDE3vAyb+zBGA7IkOcN1OsS+ayAqClSNJghQ2dj7Xup
 0a+6D7GZCEd+YqPKC8fl2/BD0MYgacoICgnOqt24+ZW04eUPWca+JQd6Xp3RvMxG1c65Zt0=
X-Google-Smtp-Source: AGHT+IH7ZMuRhx0kEJGVK8oPBDelzjeBZIDBRWzL0TWy2sbaG8ukqZNLJIeLzF9dCSPPjiUWD2Tu8w==
X-Received: by 2002:a05:6512:3405:b0:53e:314e:6119 with SMTP id
 2adb3069b0e04-543e4bf9da5mr225169e87.29.1738106455454; 
 Tue, 28 Jan 2025 15:20:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-543c838166esm1798379e87.235.2025.01.28.15.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 15:20:53 -0800 (PST)
Date: Wed, 29 Jan 2025 01:20:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Stephen Boyd <swboyd@chromium.org>, Paloma Arellano <quic_parellan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: account for widebus and yuv420 during mode
 validation
Message-ID: <eksyfuzjekxkcm5fjxyjjbyu6nkreqdlkuy2eiijrcbeu2fd2f@74viz5tylch5>
References: <20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-dp-widebus-fix-v1-1-b66d2265596b@quicinc.com>
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

On Tue, Jan 28, 2025 at 03:10:27PM -0800, Abhinav Kumar wrote:
> Widebus allows the DP controller to operate in 2 pixel per clock mode.
> The mode validation logic validates the mode->clock against the max
> DP pixel clock. However the max DP pixel clock limit assumes widebus
> is already enabled. Adjust the mode validation logic to only compare
> the adjusted pixel clock which accounts for widebus against the max DP
> pixel clock. Also fix the mode validation logic for YUV420 modes as in
> that case as well, only half the pixel clock is needed.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Fixes: 6db6e5606576 ("drm/msm/dp: change clock related programming for YUV420 over DP")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  5 ++++-
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 24dd37f1682bf5016bb0efbeb44489061deff060..a4b420a2d9eb7f084194f443e84a4013c9b4ef0f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -930,16 +930,16 @@ enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
> -		return MODE_CLOCK_HIGH;
> -
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  	link_info = &msm_dp_display->panel->link_info;
>  
> -	if (drm_mode_is_420_only(&dp->connector->display_info, mode) &&
> -	    msm_dp_display->panel->vsc_sdp_supported)
> +	if ((drm_mode_is_420_only(&dp->connector->display_info, mode) &&
> +	     msm_dp_display->panel->vsc_sdp_supported) || msm_dp_wide_bus_available(dp))

I'd ask to move msm_dp_wide_bus_available to the next line, it makes it
easier to read.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


>  		mode_pclk_khz /= 2;
>  
> +	if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
> +		return MODE_CLOCK_HIGH;
> +
>  	mode_bpp = dp->connector->display_info.bpc * num_components;
>  	if (!mode_bpp)
>  		mode_bpp = default_bpp;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index d3e241ea6941615b8e274dd17426c2f8557f09b5..16b7913d1eefa8c2deb44df201a1977db23f4531 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -257,7 +257,10 @@ static enum drm_mode_status msm_edp_bridge_mode_valid(struct drm_bridge *bridge,
>  		return -EINVAL;
>  	}
>  
> -	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
> +	if (msm_dp_wide_bus_available(dp))
> +		mode_pclk_khz /= 2;
> +
> +	if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
>  		return MODE_CLOCK_HIGH;
>  
>  	/*
> 
> ---
> base-commit: 2bd7708f11777d4fd436fcba62b57cff6a92e389
> change-id: 20250127-dp-widebus-fix-fba78bbe242d
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry
