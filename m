Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA9173F7BF
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DEA410E2BA;
	Tue, 27 Jun 2023 08:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7083C10E1AC
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:49:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f8777caaa1so5845151e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 01:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687855748; x=1690447748;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TomAZ7O1EcBP8WsIDD1uG9Qcrmlg/XdNsRiguOyzx/0=;
 b=RN9aLjViLhcUH7KdpEXWJIAnR1KYFcbSesBCdFKTJhwVucsZLjDKnrhZjy/zoNoikP
 ZyjER8DVaECxXuqaOsf+/BAdzpowTouasRQCLrMrMn6jfQe4A0oeU1FGKN+oGbahWaQa
 Cki7OuUbEM4mJScX9zc/TCTrJqDpPaA0AU1u3yl/jmwzOLQfNQm+oKWIT4z5OF6PVs4M
 /ED2ykvHh4Z4alap67p2FI/AfvJvJeobLVb+XzBZTb+iz1/zW5qlJRm3huUcg+k8/Kyo
 JKORQVbwQmknHFwpef92HI2XluXPrcIKuBxe5/KO5z0x6cGyONu1pEUOz4I5onG0hHUP
 /lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687855748; x=1690447748;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TomAZ7O1EcBP8WsIDD1uG9Qcrmlg/XdNsRiguOyzx/0=;
 b=iqJ51BKIDWvibojqeJHgp/bGPWd5zu2QlH5ENiUsBkdoFHOr+95f/B10e53bGH2baf
 J4mbT/mH/yELSblAK/cNL/l6RpBFI2hxRTO+R4noMp+Xnp5ZQYi+3Zv8cgrflHO6zCzZ
 qk6lxAXQQKqCmfaB2ibM8NCZbqmwktXYNmlCi3E7c9YnCKCuFvB1QzoG0IjoYls8Zc3Z
 pbhLtHgIr8X1VcvsViY2ZwYFmZIdBfjftKbLU/+y6oREJoNFHr/udaWJi6MCeoLMkCWX
 JYuTU1C031czm1n+l2mNzMHvtmBgxGPKWADOcnJpcI9zw07KMGSNzfa57ETUk4ybyXMo
 bjTA==
X-Gm-Message-State: AC+VfDxLVQlzaJJ1HvW85io9e5Gdgu32+S328C1cWwxbLTpywOyLEKsY
 1ARXfxbeCHHGSowqhHTlvoZ1qQ==
X-Google-Smtp-Source: ACHHUZ7IDr8oibNYTHFk7o1dd1/ahrycgoOYSLclnkdUlcbGQzlTG4kCoZs3kPIK9DLExdcuVbuhJg==
X-Received: by 2002:a19:e044:0:b0:4f8:7754:62e1 with SMTP id
 g4-20020a19e044000000b004f8775462e1mr13177206lfj.40.1687855748412; 
 Tue, 27 Jun 2023 01:49:08 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a19ac41000000b004f82c820245sm1419563lfc.107.2023.06.27.01.49.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 01:49:07 -0700 (PDT)
Message-ID: <9ba8e5c9-642d-a09d-7e82-adba8e5497aa@linaro.org>
Date: Tue, 27 Jun 2023 11:49:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 09/15] drm/msm/mdss: Add SM6125 support
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-9-1d5a638cebf2@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-9-1d5a638cebf2@somainline.org>
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/06/2023 03:41, Marijn Suijten wrote:
> SM6125's UBWC hardware decoder is version 3.0, and supports decoding
> UBWC 1.0.

I think it's UBWC encoder version, see 
https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.15.1.r17-rel/msm/sde/sde_hw_top.c?ref_type=heads#L357

This is a part of 
https://patchwork.freedesktop.org/patch/538279/?series=118074&rev=1

(no, you don't have to rebase on that patchset, it is not reviewed yet).

> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 05648c910c68..bf68bae23264 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -559,6 +559,13 @@ static const struct msm_mdss_data sm6115_data = {
>   	.ubwc_static = 0x11f,
>   };
>   
> +static const struct msm_mdss_data sm6125_data = {
> +	.ubwc_version = UBWC_1_0,
> +	.ubwc_dec_version = UBWC_3_0,
> +	.ubwc_swizzle = 1,
> +	.highest_bank_bit = 1,
> +};
> +
>   static const struct msm_mdss_data sm8250_data = {
>   	.ubwc_version = UBWC_4_0,
>   	.ubwc_dec_version = UBWC_4_0,
> @@ -579,6 +586,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
>   	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
>   	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
> +	{ .compatible = "qcom,sm6125-mdss", .data = &sm6125_data },
>   	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
>   	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
>   	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
> 

-- 
With best wishes
Dmitry

