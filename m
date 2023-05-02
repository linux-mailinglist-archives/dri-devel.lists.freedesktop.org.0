Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E1D6F4C08
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 23:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DC310E0CA;
	Tue,  2 May 2023 21:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B97310E0E1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 21:19:51 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f0108a7d20so5053925e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 14:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683062389; x=1685654389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YL0HTP2hogruEK5o6822RwsE/FsRfHqk/sZ5fYBkYpY=;
 b=qkxU8X69WCmYeF26b5A6eJHBpvj9iG5fHaRF07ui9uPjUJiuoCJeXA4Nmx5nnfbFS2
 OzMme+hOaQjL0WjgbUnLjvfFKC214yPVZ3J/k8meWEGph4ZFHHD6rW8WIFnbb3bBLwCg
 7xsWgZcCE9rDFVs6nJKvU5gUjGNbZhJtiQqY4B1tZqkNaRibRC3EN3dL39etfGKaimUL
 cwyPP/Y06buZzkR77qMWwRXyZCLqtjFcCbT/vah9b6ilQ/Y79rfZVMtuI7HbwlUhMWKY
 aWv1KOGd1/kHuSvkrcR9Uv0hQ/AJbmhTqT/Oww0djRU2p+E005cQaBuBj/74jaQtxD1+
 wlDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683062389; x=1685654389;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YL0HTP2hogruEK5o6822RwsE/FsRfHqk/sZ5fYBkYpY=;
 b=adVWMjgvYco9Fqr2cFsJrAAQlEFaHiJNyyoAumFNudHPQ6eZO84wZNiql+fxcXC5JZ
 +glkesOC1GI7mtB87Q1qQsQXVd1WPBxbv3PV18dBOdVA2SPrl8U+bFbNPCPbw71kmruB
 Mo816Gpzz9fpBeLBXWkLXzME1D0i+/Fvt0qH7u8dkyfosBGhTesbl94RiX+PN2lt7ANm
 wS83Edx4G/mG8ewQnw4IdANjqXqw6MM4q+7QuObDiOG+aMGCUFeUCYVsBvLyN1Xx/0ox
 hnex+JEun5apU9VtV6mOrTBREIkdncJ/1rhbpSQ+uMBY/mK5bN4YbH6S8RAkecB8qMHm
 wGAA==
X-Gm-Message-State: AC+VfDxxyNg6r1CbcOpkNMsQNGrJSOELGcNOSItWcHqBncxzSu+EHeUd
 auOKRPovJBR6VUg4XGo3iEvxG0juS829Y3cvUrU=
X-Google-Smtp-Source: ACHHUZ7K353thxP/m/nJc6hXiu7I5BesEV/LnUXH2Py/TJOLlivtli2tg/ZZSu2NGgk22wQz0FACJw==
X-Received: by 2002:a05:6512:3750:b0:4ed:bf01:3ff3 with SMTP id
 a16-20020a056512375000b004edbf013ff3mr284376lfs.43.1683062388893; 
 Tue, 02 May 2023 14:19:48 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 o8-20020ac24948000000b004f121c8beddsm1158666lfi.124.2023.05.02.14.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 14:19:48 -0700 (PDT)
Message-ID: <0aba48f3-b877-3d67-85a6-f71ba0a56495@linaro.org>
Date: Wed, 3 May 2023 00:19:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/7] drm/msm/dpu: add DPU_PINGPONG_DSC feature bit
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683061382-32651-1-git-send-email-quic_khsieh@quicinc.com>
 <1683061382-32651-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683061382-32651-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/05/2023 00:02, Kuogee Hsieh wrote:
> Legacy DPU requires PP block to be involved during DSC setting up.
> This patch adds DDPU_PINGPONG_DSC feature bit to indicate that both

DPU_PINGPONG_DSC

> dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_enable() pingpong ops
> functions are required to complete DSC data path set up and start
> DSC engine.

Nit: as these ops were already present, I'd say that the lack of the 
flag means that these operations are not supported and must not be 
called for DSC setup/teardown.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Reported-by : Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h  | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 9 ++++++---
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 71584cd..c07a6b6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -144,6 +144,7 @@ enum {
>    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
>    * @DPU_PINGPONG_DITHER,    Dither blocks
> + * @DPU_PINGPONG_DSC,	    PP ops functions required for DSC
>    * @DPU_PINGPONG_MAX
>    */
>   enum {
> @@ -152,6 +153,7 @@ enum {
>   	DPU_PINGPONG_SPLIT,
>   	DPU_PINGPONG_SLAVE,
>   	DPU_PINGPONG_DITHER,
> +	DPU_PINGPONG_DSC,
>   	DPU_PINGPONG_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 3822e06..f255a04 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -264,9 +264,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
>   	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>   	c->ops.get_line_count = dpu_hw_pp_get_line_count;
> -	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> -	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> -	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +
> +	if (features & BIT(DPU_PINGPONG_DSC)) {
> +		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +	}
>   
>   	if (test_bit(DPU_PINGPONG_DITHER, &features))
>   		c->ops.setup_dither = dpu_hw_pp_setup_dither;

-- 
With best wishes
Dmitry

