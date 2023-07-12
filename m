Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D327F74FC3A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 02:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9369B10E46B;
	Wed, 12 Jul 2023 00:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E2410E46B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 00:36:42 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so10174777e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 17:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689122199; x=1691714199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tbfh/IRk7/i4tpOpLlqVDFpOVPp9UieEADp7rXpWtUo=;
 b=ThBzJ763hAsei4qXaYzKKWxcU8/gSdyxASmIlOm0aeaEiGSDNM9WGpgrQa9e8v7hbY
 9hleyL5eSFUpMBLnertAG8fwQOTpID4IPDfDE6UVbMnxb+lfJmYGDYLvOj0/SB01GzDB
 8LVQ7lKU+vKXPJwrb4oLPvEJ5MTnGDnxxElGhG8M84WP79PPBHAMD8fEFqlAOLHg76RD
 r1oZwD/p+PkYvQ/rk1twTgk6+Sld3P4j1huKBZ8g/beD4CCkfKrZvuiS7bmlTqn2m2Fk
 rtcgLCyuEV4g0GoSlphpEvh9/+hCuKs8iFwTIqM3l4RmO2D0+4g4mNI2SRK4S51BKHJ3
 ISBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689122199; x=1691714199;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tbfh/IRk7/i4tpOpLlqVDFpOVPp9UieEADp7rXpWtUo=;
 b=g4mhdNvtZfl7sAe4O00+ppTU0e5QtjpCBv7QjtjiyCxXubsJ9G9BD32x6d1vRZbHEU
 +nI6lOmEuOtLhIE7SyUlkMmpYumJxiULLspW4OkupcAGc3aVwwmXALXji0BJJw2NaNWY
 83WLof6EnVkBObp54Pw0YgenK9Ec+H3mhJtUZbsMDrRHuTfz5433s8n2mSbiEMhvdr5V
 fsxYm0Gy0/IoGSo9rSWt543jTWLXSdsycav0vVnc7sE0ZH2FjOXuqxHehhPX4ZnYIrh8
 5l0B1AA4LoLdvprQGHGkawWgExT9JvJG/DYx05I0vMtyUfR6qvNC1ssND6rkC0+VG52A
 EAhw==
X-Gm-Message-State: ABy/qLaSZiG/wElyFesgl1m6Y13Da+/QKSPgmw0XyzgWUO5F2fu/LXP6
 P7eKQwK9UPnSKnFLqKyE+1m86w==
X-Google-Smtp-Source: APBJJlFX0E9daLkrYYYzwGrWLxSWFytPa6IQQ5CM6dV/kc71WN1FZtVujceDdMgTOibC6R1CYH31vw==
X-Received: by 2002:a05:6512:3145:b0:4f6:29cf:c0dd with SMTP id
 s5-20020a056512314500b004f629cfc0ddmr13660607lfi.8.1689122199313; 
 Tue, 11 Jul 2023 17:36:39 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a19f70d000000b004fae1d35098sm494627lfe.81.2023.07.11.17.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jul 2023 17:36:38 -0700 (PDT)
Message-ID: <32df50ef-25ff-ca9d-4aa6-f7c85ea18c15@linaro.org>
Date: Wed, 12 Jul 2023 03:36:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/4] drm/msm/dpu: re-introduce dpu core revision to the
 catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230712003310.31961-1-quic_abhinavk@quicinc.com>
 <20230712003310.31961-2-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230712003310.31961-2-quic_abhinavk@quicinc.com>
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

On 12/07/2023 03:33, Abhinav Kumar wrote:
> Introduce the dpu core revision back as an entry to the catalog so that
> we can just use dpu revision checks and enable those bits which
> should be enabled unconditionally and not controlled by a catalog
> and also simplify the changes to do something like:
> 
> if (dpu_core_revision > xxxxx && dpu_core_revision < xxxxx)
>     enable the bit;
> 
> Since dpu's major and minor versions are now separate fields, lets
> drop all the DPU_HW_VER macros.

Nit: there are no DPU_HW_VER macros. This should probably be a part of 
changelog.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> changes in v4:
> 	- removed hex prefix from the revisions
> 	- updated the commit text to move some parts to cover letter
> 	- rebased and added support for sm6125 into this
> 	- introduce struct dpu_mdss_version to hold the core revision
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  |  6 ++++++
>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  |  6 ++++++
>   .../drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  |  6 ++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h  | 17 +++++++++++++++--
>   17 files changed, 111 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 7d87dc2d7b1b..b5fbac55f127 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -315,7 +315,13 @@ static const struct dpu_perf_cfg msm8998_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version msm8998_mdss_ver = {
> +	.core_major_ver = 3,
> +	.core_minor_ver = 0,
> +};
> +
>   const struct dpu_mdss_cfg dpu_msm8998_cfg = {
> +	.mdss_ver = &msm8998_mdss_ver,
>   	.caps = &msm8998_dpu_caps,
>   	.ubwc = &msm8998_ubwc_cfg,
>   	.mdp = &msm8998_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 87459cf40895..8000b870d3a7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -332,7 +332,13 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sdm845_mdss_ver = {
> +	.core_major_ver = 4,
> +	.core_minor_ver = 0,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sdm845_cfg = {
> +	.mdss_ver = &sdm845_mdss_ver,
>   	.caps = &sdm845_dpu_caps,
>   	.ubwc = &sdm845_ubwc_cfg,
>   	.mdp = &sdm845_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 96c542d620f1..7ce2d69d28f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -375,7 +375,13 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sm8150_mdss_ver = {
> +	.core_major_ver = 5,
> +	.core_minor_ver = 0,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sm8150_cfg = {
> +	.mdss_ver = &sm8150_mdss_ver,
>   	.caps = &sm8150_dpu_caps,
>   	.ubwc = &sm8150_ubwc_cfg,
>   	.mdp = &sm8150_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 4edc1060f05c..cea005382456 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -402,7 +402,13 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sc8180x_mdss_ver = {
> +	.core_major_ver = 5,
> +	.core_minor_ver = 1,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
> +	.mdss_ver = &sc8180x_mdss_ver,
>   	.caps = &sc8180x_dpu_caps,
>   	.ubwc = &sc8180x_ubwc_cfg,
>   	.mdp = &sc8180x_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> index b3bfb897327b..5fddfcce6288 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> @@ -200,7 +200,13 @@ static const struct dpu_perf_cfg sm6125_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sm6125_mdss_ver = {
> +	.core_major_ver = 5,
> +	.core_minor_ver = 4,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sm6125_cfg = {
> +	.mdss_ver = &sm6125_mdss_ver,
>   	.caps = &sm6125_dpu_caps,
>   	.ubwc = &sm6125_ubwc_cfg,
>   	.mdp = &sm6125_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index f8910dbc1952..893d1271fb71 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -390,7 +390,13 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sm8250_mdss_ver = {
> +	.core_major_ver = 6,
> +	.core_minor_ver = 0,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sm8250_cfg = {
> +	.mdss_ver = &sm8250_mdss_ver,
>   	.caps = &sm8250_dpu_caps,
>   	.ubwc = &sm8250_ubwc_cfg,
>   	.mdp = &sm8250_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 8c046eacec7c..61118f648cbc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -204,7 +204,13 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sc7180_mdss_ver = {
> +	.core_major_ver = 6,
> +	.core_minor_ver = 2,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sc7180_cfg = {
> +	.mdss_ver = &sc7180_mdss_ver,
>   	.caps = &sc7180_dpu_caps,
>   	.ubwc = &sc7180_ubwc_cfg,
>   	.mdp = &sc7180_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 473cdbace322..c0d7bb930e8a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -136,7 +136,13 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sm6115_mdss_ver = {
> +	.core_major_ver = 6,
> +	.core_minor_ver = 3,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sm6115_cfg = {
> +	.mdss_ver = &sm6115_mdss_ver,
>   	.caps = &sm6115_dpu_caps,
>   	.ubwc = &sm6115_ubwc_cfg,
>   	.mdp = &sm6115_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index ac716c8dbd7f..11c50aa5034b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -207,7 +207,13 @@ static const struct dpu_perf_cfg sm6350_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sm6350_mdss_ver = {
> +	.core_major_ver = 6,
> +	.core_minor_ver = 4,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sm6350_cfg = {
> +	.mdss_ver = &sm6350_mdss_ver,
>   	.caps = &sm6350_dpu_caps,
>   	.ubwc = &sm6350_ubwc_cfg,
>   	.mdp = &sm6350_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 7d9fdd807695..2182939bc026 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -126,7 +126,13 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version qcm2290_mdss_ver = {
> +	.core_major_ver = 6,
> +	.core_minor_ver = 5,
> +};
> +
>   const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
> +	.mdss_ver = &qcm2290_mdss_ver,
>   	.caps = &qcm2290_dpu_caps,
>   	.ubwc = &qcm2290_ubwc_cfg,
>   	.mdp = &qcm2290_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 5f36f9468853..f0c0aa90f82e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -146,7 +146,13 @@ static const struct dpu_perf_cfg sm6375_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sm6375_mdss_ver = {
> +	.core_major_ver = 6,
> +	.core_minor_ver = 9,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sm6375_cfg = {
> +	.mdss_ver = &sm6375_mdss_ver,
>   	.caps = &sm6375_dpu_caps,
>   	.ubwc = &sm6375_ubwc_cfg,
>   	.mdp = &sm6375_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index b22e6b97c993..2460ced03610 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -383,7 +383,13 @@ static const struct dpu_perf_cfg sm8350_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sm8350_mdss_ver = {
> +	.core_major_ver = 7,
> +	.core_minor_ver = 0,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sm8350_cfg = {
> +	.mdss_ver = &sm8350_mdss_ver,
>   	.caps = &sm8350_dpu_caps,
>   	.ubwc = &sm8350_ubwc_cfg,
>   	.mdp = &sm8350_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 4b2cc62b07ea..a8dea8f27c41 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -252,7 +252,13 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sc7280_mdss_ver = {
> +	.core_major_ver = 7,
> +	.core_minor_ver = 2,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sc7280_cfg = {
> +	.mdss_ver = &sc7280_mdss_ver,
>   	.caps = &sc7280_dpu_caps,
>   	.ubwc = &sc7280_ubwc_cfg,
>   	.mdp = &sc7280_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index ec959f85ae2a..397fe01125dd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -445,7 +445,13 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sc8280xp_mdss_ver = {
> +	.core_major_ver = 8,
> +	.core_minor_ver = 0,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
> +	.mdss_ver = &sc8280xp_mdss_ver,
>   	.caps = &sc8280xp_dpu_caps,
>   	.ubwc = &sc8280xp_ubwc_cfg,
>   	.mdp = &sc8280xp_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 98a4aaef94d2..90a8461911c8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -406,7 +406,13 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sm8450_mdss_ver = {
> +	.core_major_ver = 8,
> +	.core_minor_ver = 1,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sm8450_cfg = {
> +	.mdss_ver = &sm8450_mdss_ver,
>   	.caps = &sm8450_dpu_caps,
>   	.ubwc = &sm8450_ubwc_cfg,
>   	.mdp = &sm8450_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 7de9eccf9181..c9252528136d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -420,7 +420,13 @@ static const struct dpu_perf_cfg sm8550_perf_data = {
>   	.bw_inefficiency_factor = 120,
>   };
>   
> +static const struct dpu_mdss_version sm8550_mdss_ver = {
> +	.core_major_ver = 9,
> +	.core_minor_ver = 0,
> +};
> +
>   const struct dpu_mdss_cfg dpu_sm8550_cfg = {
> +	.mdss_ver = &sm8550_mdss_ver,
>   	.caps = &sm8550_dpu_caps,
>   	.ubwc = &sm8550_ubwc_cfg,
>   	.mdp = &sm8550_mdp,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 1d150091da9c..98a04a39d333 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -746,6 +746,16 @@ struct dpu_perf_cdp_cfg {
>   	bool wr_enable;
>   };
>   
> +/**
> + * struct dpu_mdss_version - DPU's major and minor versions
> + * @core_major_ver: DPU core's major version
> + * @core_minor_ver: DPU core's minor version
> + */
> +struct dpu_mdss_version {
> +	u8 core_major_ver;
> +	u8 core_minor_ver;
> +};
> +
>   /**
>    * struct dpu_perf_cfg - performance control settings
>    * @max_bw_low         low threshold of maximum bandwidth (kbps)
> @@ -796,8 +806,9 @@ struct dpu_perf_cfg {
>   /**
>    * struct dpu_mdss_cfg - information of MDSS HW
>    * This is the main catalog data structure representing
> - * this HW version. Contains number of instances,
> - * register offsets, capabilities of the all MDSS HW sub-blocks.
> + * this HW version. Contains dpu's major and minor versions,
> + * number of instances, register offsets, capabilities of the
> + * all MDSS HW sub-blocks.
>    *
>    * @dma_formats        Supported formats for dma pipe
>    * @cursor_formats     Supported formats for cursor pipe
> @@ -805,6 +816,8 @@ struct dpu_perf_cfg {
>    * @mdss_irqs:         Bitmap with the irqs supported by the target
>    */
>   struct dpu_mdss_cfg {
> +	const struct dpu_mdss_version *mdss_ver;
> +
>   	const struct dpu_caps *caps;
>   
>   	const struct dpu_ubwc_cfg *ubwc;

-- 
With best wishes
Dmitry

