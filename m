Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CADA72A6BD
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 01:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA2D410E0EC;
	Fri,  9 Jun 2023 23:30:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01E310E0EC
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 23:30:07 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so345588066b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 16:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686353405; x=1688945405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sRJNZvhPfChugpU45dpKbNHROAGD/XkdSPesxkM64W4=;
 b=IRxj3bpySsOIcF59fi+Nm+OI/h4Tj5Ohn5xMWOmsKZNb6xyAtkunphLLlOrJZ8mV0x
 iBtUkCAVE1FT3vNkjGzLG44k2kLNSaASFLPjNe58vFPzEW9LfRdNumXw28VmCpdJ5TsP
 v0p4iU+XwwznP4A8f9SrGOvGttYPMyYMXEIFYXy+p7Z2bWQGqYZC/T7OqSATyNRDrseJ
 WbT69Rrgjd8VpchDe4U4/QB2GtfmnhFdQ3TKKNzA0aF+55SZ2JXWk3KABij6IMqOijF+
 yrAN1tcyn9Qm8Qg288rZCiNtUe29PpgUR3uIcGfKFS3auDHzR8/uYmm0/5dNaOgRS4dj
 ouaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686353405; x=1688945405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sRJNZvhPfChugpU45dpKbNHROAGD/XkdSPesxkM64W4=;
 b=BdmLJbZXb+vZY6dtscIATlHVXNo/9V4PZE0khiUnxq9rVY16Pb33rsiCC0OstIpiLc
 mMi6Dt4KmTW+nFIMtwvgTcV0mZEfM/LEkjLwqA64wfAmacQhY9RW1KBCF1oV/Ep1AqvQ
 TPV/hCUazrTWuop1UUe8t70Lyc8heLz8wpOZcg8ir4aVTUA+UKQyfQa7pOZYJHrsO1gC
 4Jb/Kv+05TfzkdD+IcsQlfYcK9amIUZxfDY4+qX5lS+HODQv9xCoU+0IY+jhMrfoCcdx
 gYh6VSBhRP1IZfwEPOzeMO8/ycifTsavWaUCcuSC1Sv7mbuJ71zG0B7rHDBF+cbzTD1z
 Y2LA==
X-Gm-Message-State: AC+VfDxBUVyKSKHbfGS0kDDreiA88tKfQQwmkizBvONfxV06wjetD4jW
 P8r7+128WfA/yj+1wRgNTN7HGA==
X-Google-Smtp-Source: ACHHUZ44eca7J/0+Y92PN9Lr2lBwob3EwuyN/85XFHhyDKMBwJtN3Ss2aXY1/jCZDO078fJIjAfhkg==
X-Received: by 2002:a17:906:dc8d:b0:96f:bc31:5e1c with SMTP id
 cs13-20020a170906dc8d00b0096fbc315e1cmr3079045ejc.47.1686353404945; 
 Fri, 09 Jun 2023 16:30:04 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a170906358700b00969cbd5718asm1825596ejb.48.2023.06.09.16.30.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 16:30:04 -0700 (PDT)
Message-ID: <5de320ad-4b95-38ee-7a71-ba76de1a7cf5@linaro.org>
Date: Sat, 10 Jun 2023 02:30:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 6/6] drm/msm/dsi: Document DSC related pclk_rate and
 hdisplay calculations
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
 <20230405-add-dsc-support-v6-6-95eab864d1b6@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230405-add-dsc-support-v6-6-95eab864d1b6@quicinc.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/06/2023 01:57, Jessica Zhang wrote:
> Add documentation comments explaining the pclk_rate and hdisplay math
> related to DSC.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index fb1d3a25765f..aeaadc18bc7b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -564,6 +564,13 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>   static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
>   		const struct drm_dsc_config *dsc)
>   {
> +	/*
> +	 * Adjust the pclk rate by calculating a new hdisplay proportional to
> +	 * the compression ratio such that:
> +	 *     new_hdisplay = old_hdisplay * target_bpp / source_bpp

I'd say `* compressed_bpp / uncompressed_bpp'. This is easier to follow 
than source and target.

> +	 *
> +	 * Porches need not be adjusted during compression.
> +	 */
>   	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
>   			dsc->bits_per_component * 3);
>   
> @@ -961,6 +968,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   		/* Divide the display by 3 but keep back/font porch and
>   		 * pulse width same
> +		 *
> +		 * hdisplay will be divided by 3 here to account for the fact
> +		 * that DPU sends 3 bytes per pclk cycle to DSI.
>   		 */
>   		h_total -= hdisplay;
>   		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);
> 

-- 
With best wishes
Dmitry

