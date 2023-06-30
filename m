Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1554674317D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4298E10E40F;
	Fri, 30 Jun 2023 00:13:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714A010E41A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 00:13:50 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso2088070e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 17:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688084028; x=1690676028;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6uCGtL9BeI9053Yz2/lxVypvGTw3ya9EgxV0WOl8PB0=;
 b=Cjutq4l/KcK5a3H7qIvfV+w+v8+y3UDosrO53FUbvmuyk+nrRDmPtQw6vse3nriw5k
 lU5KsmqhVqJts+52EZLgTvtlmtFPBU1Dd0hAfDbAfHbvLbTmCT3QGAXDCGlkKkKoCifO
 PwGhaJV/pOyK5k7EK65tYQvU9k75D8+P4ELo7lIGqtHdar7Wr36mDc+QGtCcM7CtZlV6
 3lVYRJJ7u+5o7l8XFGmBdYczsiUzUfD1Y3e8wlHg0uBzQISaM60qHx/bRBE0c18+7ywN
 YIVg8Sh5LStoxIwWRRe0syNBPInbYyABPKGlQzzS1aBj65nRpMyMIUE5JZs/ZwHmgn66
 Psig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688084028; x=1690676028;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6uCGtL9BeI9053Yz2/lxVypvGTw3ya9EgxV0WOl8PB0=;
 b=EvSVH53Llxi7rqanEBbI9srVx9T5SJS0RZlW8GraTL+XJUI4GhYdIFOwhJGH6OC7EE
 YAHAjHsQcBW0rMg39cIfN1U2dNV0lz7HhDoh8dqwjk2jshh9uZhcK0Lu0zemUTmA2+7Q
 NzQbl2WLDOD5sbi7Op39HZAYNU2Or++4U3/MFVTyY2WYL7liNzhZKiELq2x3BAaM7U0w
 XpiPJq1eqw4bu+CSgKoEvedSMsF3TqnPsxtBsZ/6U3bb2g0jVtSOEdopWPOU4sOhk83P
 nftj+vd/el0oOPLgcmZp4d68eUYKMFCAkU4IyYNbnivsfK52ZpnYINl+/eovwsOP1pBH
 x3Rg==
X-Gm-Message-State: ABy/qLaiHHWSt/G5XbTCl104Bqw1oYaWX6hgS6DCh2hTXwCI6PDzCcWc
 k55UBHRLpW2+JnLvd5aEz6w5PA==
X-Google-Smtp-Source: APBJJlFtKTmbCpTVnPbmDojOOOuLwAtdPtMnHSMcGAKmrGBzIdosd0apghsJK3TrTYS1MZvxUw0Zfg==
X-Received: by 2002:a2e:9687:0:b0:2b4:5a0b:9290 with SMTP id
 q7-20020a2e9687000000b002b45a0b9290mr899618lji.21.1688084027907; 
 Thu, 29 Jun 2023 17:13:47 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a2e908d000000b002b6cef7e55csm160276ljg.134.2023.06.29.17.13.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 17:13:47 -0700 (PDT)
Message-ID: <3f8b8abf-9c99-cc9d-5985-ebadbecfe4f6@linaro.org>
Date: Fri, 30 Jun 2023 03:13:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: re-introduce dpu core revision to the
 catalog
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230629193001.22618-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230629193001.22618-1-quic_abhinavk@quicinc.com>
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
> With [1] dpu core revision was dropped in favor of using the
> compatible string from the device tree to select the dpu catalog
> being used in the device.
> 
> This approach works well however also necessitates adding catalog
> entries for small register level details as dpu capabilities and/or
> features bloating the catalog unnecessarily. Examples include but
> are not limited to data_compress, interrupt register set, widebus etc.
> 
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
> 
> [1]: https://patchwork.freedesktop.org/patch/530891/?series=113910&rev=4
> 
> changes in v3:
> 	- drop DPU step version as features are not changing across steps
> 	- add core_major_version / core_minor_version to avoid conflicts
> 	- update the commit text to drop references to the dpu macros
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 8 ++++++--
>   16 files changed, 36 insertions(+), 2 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: if there is a need for v-next, I'd probably suggest dropping th hex 
prefix from these values.

> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index 7d0d0e74c3b0..a5d486783c3f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -190,6 +190,8 @@ static const struct dpu_perf_cfg msm8998_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_msm8998_cfg = {
> +	.core_major_version = 0x3,
> +	.core_minor_version = 0x0,
>   	.caps = &msm8998_dpu_caps,
>   	.ubwc = &msm8998_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(msm8998_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index b6098141bb9b..1fdb89a4b7a6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -194,6 +194,8 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sdm845_cfg = {
> +	.core_major_version = 0x4,
> +	.core_minor_version = 0x0,
>   	.caps = &sdm845_dpu_caps,
>   	.ubwc = &sdm845_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index b5f751354267..129c62cf450d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -208,6 +208,8 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sm8150_cfg = {
> +	.core_major_version = 0x5,
> +	.core_minor_version = 0x0,
>   	.caps = &sm8150_dpu_caps,
>   	.ubwc = &sm8150_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sm8150_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 8ed2b263c5ea..ca037b070f44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -214,6 +214,8 @@ static const struct dpu_perf_cfg sc8180x_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
> +	.core_major_version = 0x5,
> +	.core_minor_version = 0x1,
>   	.caps = &sc8180x_dpu_caps,
>   	.ubwc = &sc8180x_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sc8180x_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index daebd2170041..e446af90767e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -214,6 +214,8 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sm8250_cfg = {
> +	.core_major_version = 0x6,
> +	.core_minor_version = 0x0,
>   	.caps = &sm8250_dpu_caps,
>   	.ubwc = &sm8250_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sm8250_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 67566b07195a..88288c80b652 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -132,6 +132,8 @@ static const struct dpu_perf_cfg sc7180_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sc7180_cfg = {
> +	.core_major_version = 0x6,
> +	.core_minor_version = 0x2,
>   	.caps = &sc7180_dpu_caps,
>   	.ubwc = &sc7180_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sc7180_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 031fc8dae3c6..93c901502b5a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -102,6 +102,8 @@ static const struct dpu_perf_cfg sm6115_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sm6115_cfg = {
> +	.core_major_version = 0x6,
> +	.core_minor_version = 0x3,
>   	.caps = &sm6115_dpu_caps,
>   	.ubwc = &sm6115_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sm6115_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index 06eba23b0236..ff7e4b775fd5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -141,6 +141,8 @@ static const struct dpu_perf_cfg sm6350_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sm6350_cfg = {
> +	.core_major_version = 0x6,
> +	.core_minor_version = 0x4,
>   	.caps = &sm6350_dpu_caps,
>   	.ubwc = &sm6350_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sm6350_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index f2808098af39..7bc86aa50e6f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -92,6 +92,8 @@ static const struct dpu_perf_cfg qcm2290_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_qcm2290_cfg = {
> +	.core_major_version = 0x6,
> +	.core_minor_version = 0x5,
>   	.caps = &qcm2290_dpu_caps,
>   	.ubwc = &qcm2290_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(qcm2290_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 241fa6746674..d92890f090d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -107,6 +107,8 @@ static const struct dpu_perf_cfg sm6375_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sm6375_cfg = {
> +	.core_major_version = 0x6,
> +	.core_minor_version = 0x9,
>   	.caps = &sm6375_dpu_caps,
>   	.ubwc = &sm6375_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sm6375_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 8da424eaee6a..8a2dc56c79f8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -213,6 +213,8 @@ static const struct dpu_perf_cfg sm8350_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sm8350_cfg = {
> +	.core_major_version = 0x7,
> +	.core_minor_version = 0x0,
>   	.caps = &sm8350_dpu_caps,
>   	.ubwc = &sm8350_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sm8350_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 900fee410e11..bba7bdb9bd42 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -154,6 +154,8 @@ static const struct dpu_perf_cfg sc7280_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sc7280_cfg = {
> +	.core_major_version = 0x7,
> +	.core_minor_version = 0x2,
>   	.caps = &sc7280_dpu_caps,
>   	.ubwc = &sc7280_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sc7280_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index f6ce6b090f71..3f51b802b6b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -217,6 +217,8 @@ static const struct dpu_perf_cfg sc8280xp_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sc8280xp_cfg = {
> +	.core_major_version = 0x8,
> +	.core_minor_version = 0x0,
>   	.caps = &sc8280xp_dpu_caps,
>   	.ubwc = &sc8280xp_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sc8280xp_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 8d13c369213c..20acff9db979 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -221,6 +221,8 @@ static const struct dpu_perf_cfg sm8450_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sm8450_cfg = {
> +	.core_major_version = 0x8,
> +	.core_minor_version = 0x1,
>   	.caps = &sm8450_dpu_caps,
>   	.ubwc = &sm8450_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sm8450_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index f17b9a7fee85..89fdf334a0aa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -225,6 +225,8 @@ static const struct dpu_perf_cfg sm8550_perf_data = {
>   };
>   
>   const struct dpu_mdss_cfg dpu_sm8550_cfg = {
> +	.core_major_version = 0x9,
> +	.core_minor_version = 0x0,
>   	.caps = &sm8550_dpu_caps,
>   	.ubwc = &sm8550_ubwc_cfg,
>   	.mdp_count = ARRAY_SIZE(sm8550_mdp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index b860784ade72..8b900be3ea90 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -796,8 +796,9 @@ struct dpu_perf_cfg {
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
> @@ -805,6 +806,9 @@ struct dpu_perf_cfg {
>    * @mdss_irqs:         Bitmap with the irqs supported by the target
>    */
>   struct dpu_mdss_cfg {
> +	u8 core_major_version;
> +	u8 core_minor_version;
> +
>   	const struct dpu_caps *caps;
>   
>   	const struct dpu_ubwc_cfg *ubwc;

-- 
With best wishes
Dmitry

