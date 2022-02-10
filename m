Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2700C4B0B3B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:47:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DCA10E7EF;
	Thu, 10 Feb 2022 10:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB30910E7EF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 10:47:10 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id h18so3438186lja.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 02:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Si66No5CKFrFvpoMi2VcVwPmZfUU/I2cyHdKw5dbztA=;
 b=grxqdAc1f1QFBwusZUmsIV/Bf34oCwmv76M5RXlBdAU6lzaEUyBdlgOoYGjz1fipc8
 kVoV7BDY6hk62RueMygbHddt+2QP2D93WgS61WXRge/a8d6/o8Rxyz1riTqJIDTrWI9n
 PhnzbByYtTFxkkEEai2VYJzKxYH872gu/wqI2OHKCtcih2eyn4BEyUfgUZfTlqw4eYvT
 tsVNKMGKQcKvSyIQWlZi6gHz2jsRab71z66ipFAAod3MdaYvFwaV3AIHEW2U9jZEe8mu
 Ri64sros0J4oSd5QZqDw/ABCqmHuYpbuce+QPF3E2OPk/sTlb+z4s4kmkB2NPs2kz7Ya
 W+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Si66No5CKFrFvpoMi2VcVwPmZfUU/I2cyHdKw5dbztA=;
 b=K+LvdxuWcSahT4ZBclKFTX1bcfAxpEpkWMhsXazQx4cRNvb/HwbANV1AYM5DSJawVe
 WidAM0XglljWqivBgMZu0FD7YMNPh8Yx7UEAu3gPszPzCutK/HIp2BmdxCcV5KBhLL56
 9LASstItJIAcK2HkPvD4Z461o38qg+iXPlAqq96i4YMipRdTToHe1z2hjX8LlGIjybV5
 UGH5zdr1KGPImNBzF9e9ave8x+rMeSeOr4bSdSV1yGM0hvM/ihO70msuUY3qOqBxYg0O
 8ou5ThSBOg4L54V3oiNa9fMQUsiktMIq5vjQiCXMSLhdmKAQ4273i6nCWLgGikTUQVBC
 e8Dg==
X-Gm-Message-State: AOAM531CAp5MJ0XW3CHkVTZelWHdRMIYjZcf4TnDaunCiYj4oI4VfnZy
 HhfhtTI2kh8XG3IY0BG+CRvvcA==
X-Google-Smtp-Source: ABdhPJxCjXGEHzBkaWIxlHF+2lJcctYy+Oasm0VbIfBw9xAhVkv0yGk+w6PTwRAzG4NWOan8BDUi1w==
X-Received: by 2002:a2e:8746:: with SMTP id q6mr4647726ljj.308.1644490029030; 
 Thu, 10 Feb 2022 02:47:09 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id k1sm2734192lfu.136.2022.02.10.02.47.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 02:47:08 -0800 (PST)
Message-ID: <41aa2693-dc2f-27c3-cf64-43522c1503e3@linaro.org>
Date: Thu, 10 Feb 2022 13:47:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [REPOST PATCH v4 10/13] drm/msm/disp/dpu1: Add support for DSC in
 topology
Content-Language: en-GB
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-11-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220210103423.271016-11-vkoul@kernel.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/02/2022 13:34, Vinod Koul wrote:
> For DSC to work we typically need a 2,2,1 configuration. This should
> suffice for resolutions up to 4k. For more resolutions like 8k this won't
> work.
> 
> Also, it is better to use 2 LMs and DSC instances as half width results
> in lesser power consumption as compared to single LM, DSC at full width.
> 
> The panel has been tested only with 2,2,1 configuration, so for
> now we blindly create 2,2,1 topology when DSC is enabled
> 
> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 +++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h               |  2 ++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 95a7bf362e81..13ccb7b3cce5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -574,8 +574,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
>   
> +	if (dpu_enc->dsc) {
> +		/* In case of Display Stream Compression DSC, we would use
> +		 * 2 encoders, 2 line mixers and 1 interface
> +		 * this is power optimal and can drive up to (including) 4k
> +		 * screens
> +		 */
> +		topology.num_enc = 2;
> +		topology.num_dsc = 2;
> +		topology.num_intf = 1;
> +		topology.num_lm = 2;
> +	}
> +
>   	return topology;
>   }
> +
>   static int dpu_encoder_virt_atomic_check(
>   		struct drm_encoder *drm_enc,
>   		struct drm_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 6425a42e997c..994d895d1a47 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -103,12 +103,14 @@ enum msm_event_wait {
>    * @num_enc:      number of compression encoder blocks used
>    * @num_intf:     number of interfaces the panel is mounted on
>    * @num_dspp:     number of dspp blocks used
> + * @num_dsc:      number of Display Stream Compression (DSC) blocks used
>    */
>   struct msm_display_topology {
>   	u32 num_lm;
>   	u32 num_enc;
>   	u32 num_intf;
>   	u32 num_dspp;
> +	u32 num_dsc;
>   };
>   
>   /**


-- 
With best wishes
Dmitry
