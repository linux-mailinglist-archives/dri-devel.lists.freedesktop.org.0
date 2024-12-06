Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D862C9E6A22
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:32:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBAC10F048;
	Fri,  6 Dec 2024 09:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cGAx6oGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B411110F048
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:32:49 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53de8ecb39bso2475738e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733477568; x=1734082368; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zadEHboo0cdlPFvzQWo8pskzaBuEAY7TqZ8rPSIgr8o=;
 b=cGAx6oGYOlp7gUdk1HOrP+RtUye7wbG+FWQwkSTsosJEFefjdDSV+h2xNMJfL5bCy3
 3Vfd+p33fieMLZBv14Gg3hkjaweRfWokPH+9wF/f2I4vSdSov++kcERbN95rkJ2T2XMN
 +labPKZpsvAP886SHIKHBEYwtNpfckAoAIFchXDp/S+qvQ0SV3v8sES9v1EV4EGZGfyJ
 J2gnoQs6jeCsgaae+Xt2hoFAHNHOWBh3fa1FBlVtnv3/YdYd7r8ln89EaOUV977XXUn8
 YMl+QZj90ys86l9woJNntkgmaMOWvoQFta5LUqmwkYe+l2CJ8Ijhgaln38MqSBys7hr8
 5yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733477568; x=1734082368;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zadEHboo0cdlPFvzQWo8pskzaBuEAY7TqZ8rPSIgr8o=;
 b=jxkaeryCbmZrpFtO6DK4IuT/ZcYqjBDAdB6u4AODEh/4Pr+ejz/rYhQHR+7fawIBLR
 s/urJ87iugin50JbreI4Y3W7Ju2Bb7ve8x9/1l2vNGrd5ztsAiRcdI4JweT036afODdQ
 8u25hrQqCTEkWParPp6+0lys4J6UuDFpEtoJoCGeSS30ki+sf/ELCdNpBxU8U++ZF1vq
 hjk2t7jWKY8oM8G/z3Xo0rfD4KVSYcXKGH82IxSRu6TD9NRVgG9kAUXSAE6aV5iRedwF
 kyDVeUdj8Pmhw+UoANqhLR9hbtotiFZH89BysQYaozywssaK7lRhebojqhvnid/4R7EX
 MAOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTzIJt0PuHJJwED1iFzpyoAeGwkYmCADGkJDNyV33tl1e50GBbRMFx6RHEvF/qEOOzafUqs7rm+hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFYo1jADtW/Ng0k98XUV8ETnP1ir2Xms+0qw4oSA0UPyVvrFvr
 FbDvX0bbzo/uttcnN0vE3aTIutAtKW2Kx659PTpO4I26yHFxgxboCJkMB2UhSmY=
X-Gm-Gg: ASbGnculP8KLx5GP/0cXjDqA0vgebVNJmF00pXuRq7HHk4idGYuf/C0IGroBzzDvD41
 b1RJJh5hPmAB7/hXg/f29tPpP7uVg60hdfu1NMwTPZZaQgkwRsYpmega9KLFcSaA2NTW9KHmuF2
 rJuAlvBTvMRFfLqiOjKwv6yzAowAtBMv6Qz5H868cVyBlVWbQXky558IuDB37Xkw96zt5wi4pMJ
 KdQxWXl4j/XTJAhV7Jo9uHpbNxXJahuwlYZ1/q+WXQdyap6lwb3Jui6asA4gbd+i/KEdDt/i87D
 kR+XoNOroEqTTwVwWIhU+//jRLeY/w==
X-Google-Smtp-Source: AGHT+IFt0oQZraChA0vm7bTmEKxi678+NtImtNYWtNbmFt/Emc59radqf3VL2rny8/rMaB+weccu/w==
X-Received: by 2002:a05:6512:31c9:b0:53d:eec4:2bfa with SMTP id
 2adb3069b0e04-53e2c4fed10mr1145884e87.37.1733477567848; 
 Fri, 06 Dec 2024 01:32:47 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ba6fdsm449887e87.151.2024.12.06.01.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:32:46 -0800 (PST)
Date: Fri, 6 Dec 2024 11:32:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 29/45] drm/msm/dp: skip reading the EDID for MST cases
Message-ID: <7khoxaafl2eclgqe2jfwgdmruvtoug5fpjdkvcrmpcynddnloa@toooyaio7rzm>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-29-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-29-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:00PM -0800, Abhinav Kumar wrote:
> For MST cases, EDID is handled through AUX sideband messaging.
> Skip the EDID read during hotplug handle for MST cases.

But why? Isn't EDID being read at the hotplug time to update
drm_connector's data?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 033d238e956263c1212fce45aab01316ef341edb..a67bc7c1b83a5a9996435804ff7337f72dae93a0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -420,9 +420,11 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (rc)
>  		goto end;
>  
> -	rc = msm_dp_panel_read_edid(dp->panel, connector);
> -	if (rc)
> -		goto end;
> +	if (dp->max_stream <= DEFAULT_STREAM_COUNT || !msm_dp_panel_read_mst_cap(dp->panel)) {
> +		rc = msm_dp_panel_read_edid(dp->panel, connector);
> +		if (rc)
> +			goto end;
> +	}
>  
>  	msm_dp_link_process_request(dp->link);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
