Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D2F6E610F
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 14:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EAC10E78A;
	Tue, 18 Apr 2023 12:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6EB10E785
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 12:19:45 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4ec9c7c6986so2098709e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 05:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681820383; x=1684412383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K++As7i154zwy5IfL3jSAA+dS+SNhRonUKRKEBDZdQo=;
 b=GBNnT2+EtV8AGVfQXoStAHMhcq6vQHNGBuNRiGlipr+QXcMxV5CK6FbJlFQzvgPSkh
 i0b3FbYhA+oUa2fbANSUyMopARHbAQI70pQI52R8IM9YTs/1EGUd1PDy1L84vnTB952e
 ot0hGQQJpg88huZFyxCwK0ZfAZfu9QbhwWDkS1ckS4II20yWHtIcFI67zqrpTCdcIX1O
 OlRLTTTmv9QAiL1JnXmGiKDaryBgPrjtK6zLXunEohOYj/M25Xr2TVUVroGEj2aqRotW
 B51J3Rdx6htFe/QMo8Tl5K+DzLW7DCgq2oOw8+8kTWIBLfa8uTpKkekQEaRh1mRBKvoQ
 0wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681820383; x=1684412383;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K++As7i154zwy5IfL3jSAA+dS+SNhRonUKRKEBDZdQo=;
 b=UV+NBnwZMPFhC7xNxsDfPnWu3j45LaXZugPPTrXLJAZnUE12jPgDC51uqrB2pMH/j2
 NYyXm+jcXvdL66Xky5OfGfbn+CMcLN6YA0gwKbJQ7DVg+kKp6lUTgr6KuqG627UoFDBu
 l9Cja2SyOdIMjsgkeBv7l7YAW9nT9DMTIi9Nil3V7qAQLP3ybRjuIewqYyhpwV6vrpLe
 a7gXrvnmM++xKRMtfQQjNJPZfakWjzyfUkwe+H4Jv0FKXn+m4NfLk3ntT/gAQ+h169Mo
 4yIKqfCHG90QGR/4n+7JK74H4E+ExY7NcNFCrJ7dL8P5YIxvYiVB50MB1OE67/ZMPfF7
 +bBw==
X-Gm-Message-State: AAQBX9dXcn+yk4O1TLuTzvnzrY1lPlngtoyyvEg8VwZUbc4QvttZ0zmB
 g0TWe1tl77m73jYucECMVTuxbA==
X-Google-Smtp-Source: AKy350YFhqTX/v70GkNmfk43WzugSNGIvy7NEj5Czhf3tsNe3Jr27fQf5XWxWxVoVhNiYZMv41h2gw==
X-Received: by 2002:ac2:5e83:0:b0:4eb:2643:c6c6 with SMTP id
 b3-20020ac25e83000000b004eb2643c6c6mr2836780lfq.53.1681820383155; 
 Tue, 18 Apr 2023 05:19:43 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
 by smtp.gmail.com with ESMTPSA id
 s15-20020ac25fef000000b004ec8b638115sm2355741lfg.193.2023.04.18.05.19.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 05:19:42 -0700 (PDT)
Message-ID: <8fa0d582-8c1d-5436-ca53-c31badd2f459@linaro.org>
Date: Tue, 18 Apr 2023 14:19:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 08/17] drm/msm/dpu: Drop unused poll_timeout_wr_ptr
 PINGPONG callback
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-8-ef76c877eb97@somainline.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230411-dpu-intf-te-v2-8-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.04.2023 22:21, Marijn Suijten wrote:
> This callback was migrated from downstream when DPU1 was first
> introduced to mainline, but never used by any component.  Drop it to
> save some lines and unnecessary confusion.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 18 ------------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h |  6 ------
>  2 files changed, 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 0fcad9760b6f..b18efd640abd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -144,23 +144,6 @@ static bool dpu_hw_pp_get_autorefresh_config(struct dpu_hw_pingpong *pp,
>  	return !!((val & BIT(31)) >> 31);
>  }
>  
> -static int dpu_hw_pp_poll_timeout_wr_ptr(struct dpu_hw_pingpong *pp,
> -		u32 timeout_us)
> -{
> -	struct dpu_hw_blk_reg_map *c;
> -	u32 val;
> -	int rc;
> -
> -	if (!pp)
> -		return -EINVAL;
> -
> -	c = &pp->hw;
> -	rc = readl_poll_timeout(c->blk_addr + PP_LINE_COUNT,
> -			val, (val & 0xffff) >= 1, 10, timeout_us);
> -
> -	return rc;
> -}
> -
>  static int dpu_hw_pp_enable_te(struct dpu_hw_pingpong *pp, bool enable)
>  {
>  	struct dpu_hw_blk_reg_map *c;
> @@ -280,7 +263,6 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>  	c->ops.get_vsync_info = dpu_hw_pp_get_vsync_info;
>  	c->ops.setup_autorefresh = dpu_hw_pp_setup_autorefresh_config;
>  	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
> -	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
>  	c->ops.get_line_count = dpu_hw_pp_get_line_count;
>  	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>  	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> index c00223441d99..cf94b4ab603b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
> @@ -107,12 +107,6 @@ struct dpu_hw_pingpong_ops {
>  	bool (*get_autorefresh)(struct dpu_hw_pingpong *pp,
>  				u32 *frame_count);
>  
> -	/**
> -	 * poll until write pointer transmission starts
> -	 * @Return: 0 on success, -ETIMEDOUT on timeout
> -	 */
> -	int (*poll_timeout_wr_ptr)(struct dpu_hw_pingpong *pp, u32 timeout_us);
> -
>  	/**
>  	 * Obtain current vertical line counter
>  	 */
> 
