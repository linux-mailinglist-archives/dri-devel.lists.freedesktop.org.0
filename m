Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C40B7076ED
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 02:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0120610E4BC;
	Thu, 18 May 2023 00:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBD210E4BB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 00:29:19 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ac8cc8829fso15119761fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 17:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684369757; x=1686961757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pMLuQJkkWUIG735JKAhMLw4oEj/3anAW1mVncUC7mjw=;
 b=H7z5cBIXpN5FTsSanBfGOB4kpl2eaokFry+HmgUTCbqdbsMplob9BgYmIsblq6MO0e
 QycaO+g7ndT18ra6EiX+xig90XMcM8mIr5Rf1CpvcBDmXvSGhIz9byb9RS0H9xZnD+R0
 yMwe0pWpw3tJ+A+MH5V/lEIbxUoH8I9Mr5n8w43yk7mG6mUPvHQB/5NVCqhXaA6f0+UL
 H7UYywEJIb6qj56HnsJ2HGnZs39gLXk27KWQLxVKnVu0Fok1ifLmaHeprLcGTLlMqBlI
 f1gsmAlsC5ddBSKJgUXTrQHcwUaP2osfa3Q4kHKhwQMpm6BRpvEvWNy6cQQp67Dts5+B
 F+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684369757; x=1686961757;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pMLuQJkkWUIG735JKAhMLw4oEj/3anAW1mVncUC7mjw=;
 b=dJ/RQAZM3hjdRWczGE4ZnWlPEgZwaiUCBiLx5tMEKQtd5fu92Xz2O3d1LUUgXirh4K
 4FYQyFhBrI0geUWCUiRkGuEqFFJBPJkBnEuAqHgGwy6u15qJ/MVLR1M3EqxC5sJ/F3RB
 GX4UhiILQu4z0bQfm+xMIZDInzVrXxgVonySySX5mf8sQiyxuqci6EmjATQohejhXImb
 nx+ydQF4LJxVyAWSUqN9bGGvVvAt2MlJbY2Sw1fMFns4TwFTEAw2NYMfNGn9RgCWPHeA
 jN4V8wb2SGdxNtb5E4ycJOXOaxWj0Fd/dn+tsRVFEqB+GDakIJRJLNsyf5AI2DNsPpzX
 g/dA==
X-Gm-Message-State: AC+VfDxfBRWXkUZkz0x5GQ7JKvPa5ZE/d1WEcSZWeQUBnwLCpwCrxtdk
 SYqy478vuW1tQqyUpJPXnli24Q==
X-Google-Smtp-Source: ACHHUZ4egjksffobtvh370QPgDyVzW0IVj9dAA8nRwiQGzhHSKt2nIOlgjpfefT1edJmhhnt1zgM5w==
X-Received: by 2002:a19:7005:0:b0:4f2:6a9d:9a31 with SMTP id
 h5-20020a197005000000b004f26a9d9a31mr577428lfc.51.1684369757439; 
 Wed, 17 May 2023 17:29:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 h3-20020ac25963000000b004f2543be9dbsm64733lfp.5.2023.05.17.17.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 17:29:16 -0700 (PDT)
Message-ID: <4f8807d7-f16f-2a5c-c319-c7cdea56d737@linaro.org>
Date: Thu, 18 May 2023 03:29:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v10 3/8] drm/msm/dpu: Guard PINGPONG DSC ops behind
 DPU_PINGPONG_DSC bit
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1684360919-28458-1-git-send-email-quic_khsieh@quicinc.com>
 <1684360919-28458-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1684360919-28458-4-git-send-email-quic_khsieh@quicinc.com>
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
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/05/2023 01:01, Kuogee Hsieh wrote:
> DPU < 7.0.0 has DPU_PINGPONG_DSC feature bit set to indicate it requires
> both dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() to be
> executed to complete DSC configuration if DSC hardware block is present.
> Hence test DPU_PINGPONG_DSC feature bit and assign DSC related functions
> to the ops of PINGPONG block accordingly if DPU_PINGPONG_DSC bit is set.
> 
> Changes in v6:
> -- split patches, this patch has function handles DPU_PINGPONG_DSC bit
> 
> Changes in v9:
> -- the original code of assigning dsc related functions to the ops of pingpong

line too long

>     block without testing the DPU_PINGPONG_DSC feature bit was restored back
>     due to rebase error which defeat the purpose of this patch. Remove those
>     error code.
> 
> Changes in v10:
> -- change commit title
> -- correct texts at changes in v9
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 79e4576..437d9e6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -291,9 +291,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   		c->ops.get_line_count = dpu_hw_pp_get_line_count;
>   		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
>   	}
> -	c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> -	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> -	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +
> +	if (test_bit(DPU_PINGPONG_DSC, &features)) {
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

