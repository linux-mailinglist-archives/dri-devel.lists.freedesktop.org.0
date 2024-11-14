Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F09C81BC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 05:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A39710E791;
	Thu, 14 Nov 2024 04:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KvxQhZnm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015FA10E33A
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 04:10:48 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 46e09a7af769-718186b5c4eso63870a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 20:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731557448; x=1732162248; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=714o0ZvV3ReDS0/ENHf9k2aMav2Bj5ZxwGFca11krmI=;
 b=KvxQhZnmtu7Byv0pT8DhAhiE8nrrARvb8bEIAKrelSBYMQifi7QQupFWt8iHboZmCH
 rtrCqJ2i+MxLp4R5Nc2RHDm09st2W6ATGdRrrpdeBVhulT1zsbUOuvLjPlV+v9OeZWG2
 zXv/7kd1Gn0epXxzhGKya5wwYDrqqGtQ2SEhJwxstUdKNUBOGC/bCHv2bQgPSAgBMS0+
 PK/w9srDXRBMey8f7EI6VMwnJrfE2twBv5M+nHKJQGAQRTsW5ITZLINKncVbGg1b6SYy
 /U47Wou9WE2oMRP2nHIbxIrXAwuUbH5OD9gVgpDWVDh5SDWAnZczktdZwc09ry3COjVz
 NmGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731557448; x=1732162248;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=714o0ZvV3ReDS0/ENHf9k2aMav2Bj5ZxwGFca11krmI=;
 b=c2rXW2VUjPRG3Tg5iWM0G/AOqWpyh9YpWdPOAITb8HyYY63ujQ7vpi7U5gXLLNudKE
 QiKyzkU9HOYDp31MYcHLyIoMqkE5vT5uaLModc2wP4x0QcAUzFt3ZO1JoIhhD+Cf9dpw
 Lj2PArRFqcpFaQDintnviWdtAKeaoDj6GlXFdFwUrKdE5S3d4MNon1gcuDP0YOGHpWWx
 zsa4wO99Zy2pCdkwzOc/LzYs+qx/YLps+kqtSIiDxHVwyydRsD9u48PsBrW6ZiaAy9DF
 jh7ldxZx/+Dni2H0NK+iM/a0YdQy0E9m/ICHZ0Imw1CGxeXLzO5zTLAON6OHbM+hpBhm
 WvcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCxDuhuOuipvVaMumY32IINvkfTRnUu/4NKR/AVcLfNl2c4x0Q0Yej4MOJ5JfjIK6XBRz7br76pMI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy9R8NqetKwVHJZwyGqsa7JjJWIvBtjoaBnLez4tPpBwm76s3b
 KkBkwP6PVZ47Sue2NEYCGeLXNCXwJLBORiHP1O2UB9Q71Gdtfc5NKDlaKmW297Q=
X-Google-Smtp-Source: AGHT+IHhmzaCqJTL1FZBlYi3QTXBwW4hYnnT5adF5L4Dt+rljYzEGjLvaeQoWgOAVbjH16kKWY3SWA==
X-Received: by 2002:a05:6830:628d:b0:716:a62d:a8ac with SMTP id
 46e09a7af769-71a601079a4mr6592178a34.9.1731557447938; 
 Wed, 13 Nov 2024 20:10:47 -0800 (PST)
Received: from localhost ([122.172.86.146]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7f8b39b3ad9sm129628a12.81.2024.11.13.20.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 20:10:47 -0800 (PST)
Date: Thu, 14 Nov 2024 09:40:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/8] opp: core: implement dev_pm_opp_get_bandwidth
Message-ID: <20241114041044.esfazw5mv6zfyrix@vireshk-i7>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-1-3b8d39737a9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-1-3b8d39737a9b@linaro.org>
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

On 13-11-24, 16:48, Neil Armstrong wrote:
> Add and implement the dev_pm_opp_get_bandwidth() to retrieve
> the OPP's bandwidth in the same was as the dev_pm_opp_get_voltage()

                                  way

> helper.
> 
> Retrieving bandwidth is required in the case of the Adreno GPU
> where the GPU Management Unit can handle the Bandwidth scaling.
> 
> The helper can get the peak or everage bandwidth for any of

                                 average

> the interconnect path.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/opp/core.c     | 25 +++++++++++++++++++++++++
>  include/linux/pm_opp.h |  7 +++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 494f8860220d97fc690ebab5ed3b7f5f04f22d73..19fb82033de26b74e9604c33b9781689df2fe80a 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -106,6 +106,31 @@ static bool assert_single_clk(struct opp_table *opp_table)
>  	return !WARN_ON(opp_table->clk_count > 1);
>  }
>  
> +/**
> + * dev_pm_opp_get_bandwidth() - Gets the peak bandwidth corresponding to an opp

s/peak bandwidth/bandwidth/

> + * @opp:	opp for which voltage has to be returned for
> + * @peak:	select peak or average bandwidth
> + * @index:	bandwidth index
> + *
> + * Return: peak bandwidth in kBps, else return 0

s/peak bandwidth/bandwidth/

> + */
> +unsigned long dev_pm_opp_get_bandwidth(struct dev_pm_opp *opp, bool peak, int index)
> +{
> +	if (IS_ERR_OR_NULL(opp)) {
> +		pr_err("%s: Invalid parameters\n", __func__);
> +		return 0;
> +	}
> +
> +	if (index > opp->opp_table->path_count)
> +		return 0;
> +
> +	if (!opp->bandwidth)
> +		return 0;
> +
> +	return peak ? opp->bandwidth[index].peak : opp->bandwidth[index].avg;
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_opp_get_bandwidth);

All other bandwidth APIs are named as _bw, maybe do same here too ?

-- 
viresh
