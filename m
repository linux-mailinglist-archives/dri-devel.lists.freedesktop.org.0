Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED476FEAA6
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 06:32:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D7210E0EF;
	Thu, 11 May 2023 04:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444DD10E593
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 04:32:00 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f24ceae142so5670982e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 21:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683779518; x=1686371518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yz+/Gk20g+rLGD9WBqQz3JvVt45c9RNumBRgkU0bdyw=;
 b=N8h9ee/xWvRf4UaTxhHbwQgJxKrv8cIPetiBZilEpEZwxJII3ZcffGh0nUKGo9FkmT
 eyonX/IijDXvHdXOW402QHUaxD8/bWy7L3A9fLDS2I9u3jdBr638sziE+LeG04kuIQ7p
 0r7NxXT2TapP2bcL2VAIK20sUQuSOq5pSVGa+U4BzGZk+4vj4FRyR4WPTo6k9mPgu2V2
 yjJyN0Jom5mlNoQIeHnnQbDUlg2/MzENetAgPAI4SEtX8lFVjrYD9K2rKwaijTwLvNKM
 c6noAvXg48hb0Tn8jQqU2bS1y0Aqk4pcimTKf0j1QokOY1IPwhIf9mRZzYNXNUZJQGvz
 OLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683779518; x=1686371518;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yz+/Gk20g+rLGD9WBqQz3JvVt45c9RNumBRgkU0bdyw=;
 b=Zy3B6WeFqU7s/hqixMTO1sB7PZPImlQH4+f/AJ3o2EdkE2AwZVqG7+6vY/hS8DmtsB
 pkUB1T7KFyg+uEvXnlUtupTnphU0r7QMDqstfMWxPrsUiMUgsrMhSEyoCSlxxsT787aY
 2KGw83dS14+XwC/SFw7K9tT+bvMIhkB0oMV0fA3RYn9T4TPbmQV3lNvaU1wkJydBREYB
 Ad0ONCpDraQWxxhQC/i9BctWMeTZJPUyVDM0OfpyNj6OSzHKhd278nHb11VO4jdDqsQg
 VNkB0yA9ouOwIEALS1B3cdU9oWU0swhHH1Ih4UakIiHmxeUGnhnhCI0nJ4QCS/dSQbCG
 Ha/Q==
X-Gm-Message-State: AC+VfDwPM/RdnQiA4Zj28wX7Jb5TFaUVACaYZWHbbWrdv/MiZVAthnDi
 Fk5wa9Nwmp76c6g88ktj0StvAw==
X-Google-Smtp-Source: ACHHUZ7gmShjR3g56HV3TeLijQNuVXEg1vd+aF/vlRc2UFIDY5gqky/Jpf/uNjU1oWK+JIQC0IB9Mg==
X-Received: by 2002:ac2:54a8:0:b0:4ed:b842:3a99 with SMTP id
 w8-20020ac254a8000000b004edb8423a99mr2683287lfk.59.1683779513330; 
 Wed, 10 May 2023 21:31:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m25-20020ac24259000000b004f13ca69dc8sm962020lfl.72.2023.05.10.21.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 21:31:52 -0700 (PDT)
Message-ID: <02797bdd-a292-5891-ce73-8a174d62ac7d@linaro.org>
Date: Thu, 11 May 2023 07:31:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v6 3/8] drm/msm/dpu: test DPU_PINGPONG_DSC bit before
 assign DSC ops to PINGPONG
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1683756453-22050-1-git-send-email-quic_khsieh@quicinc.com>
 <1683756453-22050-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1683756453-22050-4-git-send-email-quic_khsieh@quicinc.com>
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

On 11/05/2023 01:07, Kuogee Hsieh wrote:
> DPU < 7.0.0 has DPU_PINGPONG_DSC feature bit set to indicate it requires
> both dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() to be
> executed to complete DSC configuration if DSC hardware block is present.
> Hence test DPU_PINGPONG_DSC feature bit and assign DSC related functions
> to the ops of PINGPONG block accordingly if DPU_PINGPONG_DSC bit is set.
> 
> changes in v6:
> -- split patches and keep the function file handles DPU_PINGPONG_DSC bit at this patch

Please correct me if I'm wrong, the overall suggestion was to have 
actual catalog changes before this patch. However I do not see this 
feature bit being enabled at all!

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 79e4576..e7f47a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -295,6 +295,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>   	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>   	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
>   
> +	if (test_bit(DPU_PINGPONG_DSC, &features)) {
> +		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +	}
> +
>   	if (test_bit(DPU_PINGPONG_DITHER, &features))
>   		c->ops.setup_dither = dpu_hw_pp_setup_dither;
>   };

-- 
With best wishes
Dmitry

