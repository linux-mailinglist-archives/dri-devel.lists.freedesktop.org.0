Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0982A6D1242
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 00:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE85B10F08C;
	Thu, 30 Mar 2023 22:40:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D543910F08C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 22:40:10 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id h25so26521009lfv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 15:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680216009;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AMJs/U5UnLd5bFOKJPEHLahakMqQOuZt33+aoqfKk80=;
 b=xOmcjUBOYyImBSg5vKMA59tGHFPK4SA+o+kKqbW/FfXGSBu3NmH5xggpqPqzS8ioKK
 4U0XJDWj7FB+LAkCOUoB/1hhntrXQ0H1xMxUxNhU14cGNs2lxA/HjKQd8gmfo17PDixg
 scz27ljzFQfwEUK5UoMQWIIpd1rdMkZRjxTpyI3ictIlUk2N/2+SdvU+Ig0DKKrbeDLC
 Gb+VjwI6j2MyN7EtzKDdaVbZLobm4ReMBzUzTpRfwfQMXbH9OoUBZRPRsHihk8H8ykVC
 cXpawfR8WaWSrmWeXVKCLXDxJ3NvCjLZr1vZfeQ26F0exKat3cluKWwZMdYNeQH4+rCm
 kUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680216009;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AMJs/U5UnLd5bFOKJPEHLahakMqQOuZt33+aoqfKk80=;
 b=yAnedpt5OWWTzP08z3guxKKEaWiElobKIT6ysU55//z1ez8poQRCOS5TSkeIFxtJLA
 9M9A7Au7zDtYU2btiHtGP5qgqjYgqWQFi1WANqtyAfcElphidkvQRzf8hV1WNybrVGeI
 Y63aWA0KN6G165+UOt9RplbYYoArv3NNrH6Per4EaAkOJej8R3f3iT5jYeeof6Zpjtqd
 DKnw8rnqc/61HUPmU3kfmh4LJziJF3OR0v9WYC4SB/3PCO7lQMw7rhzkTGnbTz8tkVLH
 v+mOFPTBbcnU7WioK91trppb5+s4wAa/mNp/tX6dnETXrKxHHuivwBLgBrine1/8JRE8
 2dwQ==
X-Gm-Message-State: AAQBX9erXaihvlv0NWDcySrz4Q6rGACex/HppkcoKK73glDGlRBVbpYi
 jJLEqB9yixqlJy/4/XeKsgT3kA==
X-Google-Smtp-Source: AKy350b6RwWIx6C6yOTO1IoA5dTMxrnYjKOYDyWWfUj6x9XXLL+PnhmZIbdz8iII1zzPdVmZaJqCCA==
X-Received: by 2002:ac2:5337:0:b0:4db:d97:224d with SMTP id
 f23-20020ac25337000000b004db0d97224dmr8066707lfh.19.1680216009129; 
 Thu, 30 Mar 2023 15:40:09 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004e8497a5604sm116680lfh.108.2023.03.30.15.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 15:40:08 -0700 (PDT)
Message-ID: <842fdf1f-5cd9-44ad-ad7c-b28e26b40601@linaro.org>
Date: Fri, 31 Mar 2023 00:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v3, 25/38] drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230330215324.1853304-26-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230330215324.1853304-26-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30.03.2023 23:53, Dmitry Baryshkov wrote:
> Theoretically since sm8150 we should be using a single CTL for the
> source split case, but since we do not support it for now, fallback to
> DPU_CTL_SPLIT_DISPLAY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 01ef4115ee4d..33f2d53df13b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -42,17 +42,18 @@ static const struct dpu_mdp_cfg sc8280xp_mdp[] = {
>  	},
>  };
>  
> +/* FIXME: get rid of DPU_CTL_SPLIT_DISPLAY in favour of proper ACTIVE_CTL support */
>  static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>  	{
>  	.name = "ctl_0", .id = CTL_0,
>  	.base = 0x15000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>  	},
>  	{
>  	.name = "ctl_1", .id = CTL_1,
>  	.base = 0x16000, .len = 0x204,
> -	.features = CTL_SC7280_MASK,
> +	.features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>  	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>  	},
>  	{
