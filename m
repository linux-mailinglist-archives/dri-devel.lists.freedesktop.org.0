Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE97C743188
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6273810E409;
	Fri, 30 Jun 2023 00:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF8910E409
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 00:20:28 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4fb96e2b573so2146787e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 17:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688084426; x=1690676426;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wzB898hHM+aZkD7AnMsERnbM9ENa0UWDPXWVzCorU+w=;
 b=xMSaNqNNJiUU3i2hlVAQ1yHI/9PDxiGYo78RDik+mNXkcHErS/JthFkXRwxLnx8MCG
 3+fgao7LDA/R3gRUSfIUd9g6R+vFQJFN97ypfZXMmvWtDJVsx80wmTC1DOv8+/X8A2n8
 9T2zsDsendliyW9v/YEQifwKPtQnGfN87t+fmx9U4VsCCK3FDFc7ihaZeRaNm/x+FTkX
 uFTSjjuY3zZJsEbk6Do35r2NjwOBc1VUWQGRfAqPL4fAHbLNQQQFQD6DR6OJqYBoA8BM
 MXcJCOq50xxPQPTGihZs1B8ozzGwIUVkcIsLHb+sbHg452SYTk+kCUFT9+fXOCc7JUHg
 K9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688084426; x=1690676426;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wzB898hHM+aZkD7AnMsERnbM9ENa0UWDPXWVzCorU+w=;
 b=S91a136QTQDUhc09j5/dkGyv0rtA4SCY9MryhR13bzMuYB7pbDMnGyqKefS38yQK84
 NV3weIFVCBfriDBBtJNSGG3rhlxuvueSyXCx6jHSzyLk5fUR9Ci/b+sW0C15V1tj0ny3
 oCJV0Wf7pRCxGXE8hd74p7OJM9fUli+EwUOMVsGU/cgl0/SJRmNm1QVnf8LgKGtUBDtX
 Eqq1GDhIIq5Kuy6+V3CU54nq9K9hMwA6Fwt2GqcQHIqqQ92GsEczbqEyh7SQ8m2DGkYL
 6di0VxoxHeQ3GcvbGhFuBtvp2SsHNmk63vOA+Twsiofh1FbL0PNgSkqEr6cANJonf1OI
 eoMg==
X-Gm-Message-State: ABy/qLZ23MBJtXVP6/y6zbPQitySLWkmC/ywkjwPTG/tHYu8UYsDSr/H
 KBrA6Y8vaxnAaFK8yq3IvxYTvg==
X-Google-Smtp-Source: APBJJlFfU+R5Jp9Jfrz0wvf4NLeeRzURxjVBtmx8kya8g1+ffAInTDI9dJvKpoBJt5SyeLs7dpRknw==
X-Received: by 2002:a05:6512:20c7:b0:4fb:978e:95b8 with SMTP id
 u7-20020a05651220c700b004fb978e95b8mr952484lfr.59.1688084426131; 
 Thu, 29 Jun 2023 17:20:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v15-20020ac2592f000000b004ec6252aa37sm2533353lfi.116.2023.06.29.17.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 17:20:25 -0700 (PDT)
Message-ID: <17b3b652-194c-99c2-e460-21663040c398@linaro.org>
Date: Fri, 30 Jun 2023 03:20:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: use dpu core's major version to
 enable data compress
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230629193001.22618-1-quic_abhinavk@quicinc.com>
 <20230629193001.22618-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230629193001.22618-2-quic_abhinavk@quicinc.com>
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/06/2023 22:29, Abhinav Kumar wrote:
> Instead of using a feature bit to decide whether to enable data
> compress or not for DSC use-cases, use dpu core's major version instead.
> This will avoid defining feature bits for every bit level details of
> registers.
> 
> Also, rename the intf's enable_compression() op to program_datapath()
> and allow it to accept a struct intf_dpu_datapath_cfg to program
> all the bits at once. This can be re-used by widebus later on as
> well as it touches the same register.

Two separate commits please, because...

> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  9 +++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c      |  9 +++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h      | 16 ++++++++++++++--
>   3 files changed, 26 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index b856c6286c85..f4e15b4c4cc9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -50,6 +50,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   			to_dpu_encoder_phys_cmd(phys_enc);
>   	struct dpu_hw_ctl *ctl;
>   	struct dpu_hw_intf_cfg intf_cfg = { 0 };
> +	struct dpu_kms *dpu_kms = phys_enc->dpu_kms;
>   
>   	ctl = phys_enc->hw_ctl;
>   	if (!ctl->ops.setup_intf_cfg)
> @@ -68,8 +69,12 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   				phys_enc->hw_intf,
>   				phys_enc->hw_pp->idx);
>   
> -	if (intf_cfg.dsc != 0 && phys_enc->hw_intf->ops.enable_compression)
> -		phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
> +	if (intf_cfg.dsc != 0 && dpu_kms->catalog->core_major_version >= 0x7) {

... because this becomes incorrect. The datapath should be programmed in 
all the cases, if there is a corresponding callback. intf_cfg.dsc should 
be used as a condition to set datapath_cfg.


> +		struct intf_dpu_datapath_cfg datapath_cfg = { 0 };

No need for `0' in the init, empty braces would be enough.

> +
> +		datapath_cfg.data_compress = true;
> +		phys_enc->hw_intf->ops.program_datapath(phys_enc->hw_intf, &datapath_cfg);
> +	}
>   }
>   
>   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 5b0f6627e29b..85333df08fbc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -513,11 +513,13 @@ static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
>   
>   }
>   
> -static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
> +static void dpu_hw_intf_program_datapath(struct dpu_hw_intf *ctx,
> +					 struct intf_dpu_datapath_cfg *datapath_cfg)
>   {
>   	u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
>   
> -	intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
> +	if (datapath_cfg->data_compress)
> +		intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>   
>   	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>   }
> @@ -543,8 +545,7 @@ static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
>   		ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
>   	}
>   
> -	if (cap & BIT(DPU_INTF_DATA_COMPRESS))
> -		ops->enable_compression = dpu_hw_intf_enable_compression;
> +	ops->program_datapath = dpu_hw_intf_program_datapath;

The `core_major_version >= 7' should either be here or in the callback 
itself.

>   }
>   
>   struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 99e21c4137f9..f736dca38463 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -48,6 +48,11 @@ struct intf_status {
>   	u32 line_count;		/* current line count including blanking */
>   };
>   
> +struct intf_dpu_datapath_cfg {
> +	u8 data_compress;	/* enable data compress between dpu and dsi */
> +	/* can be expanded for other programmable bits */
> +};

I'd say, dpu_datapath is too generic. What about  intf_cmd_mode_cfg?

> +
>   /**
>    * struct dpu_hw_intf_ops : Interface to the interface Hw driver functions
>    *  Assumption is these functions will be called after clocks are enabled
> @@ -70,7 +75,7 @@ struct intf_status {
>    * @get_autorefresh:            Retrieve autorefresh config from hardware
>    *                              Return: 0 on success, -ETIMEDOUT on timeout
>    * @vsync_sel:                  Select vsync signal for tear-effect configuration
> - * @enable_compression:         Enable data compression
> + * @program_datapath:           Program the DPU to interface datapath for relevant chipsets
>    */
>   struct dpu_hw_intf_ops {
>   	void (*setup_timing_gen)(struct dpu_hw_intf *intf,
> @@ -108,7 +113,14 @@ struct dpu_hw_intf_ops {
>   	 */
>   	void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t encoder_id, u16 vdisplay);
>   
> -	void (*enable_compression)(struct dpu_hw_intf *intf);
> +	/**
> +	 * Program the DPU to intf datapath by specifying
> +	 * which of the settings need to be programmed for
> +	 * use-cases which need DPU-intf handshake such as
> +	 * widebus, compression etc.

This is not a valid kerneldoc.

> +	 */
> +	void (*program_datapath)(struct dpu_hw_intf *intf,
> +				 struct intf_dpu_datapath_cfg *datapath_cfg);
>   };
>   
>   struct dpu_hw_intf {

-- 
With best wishes
Dmitry

