Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DFA9D7B12
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 06:19:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F32F10E076;
	Mon, 25 Nov 2024 05:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IgUxnbEP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58B410E076
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 05:18:56 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-724e1742d0dso2046799b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 21:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732511936; x=1733116736; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CaT7XHkUStAmSWQ7uMJ9CTvA+0ljM0SSdqJ8hkuHKAE=;
 b=IgUxnbEPlt7C7ECAVGi2uaSUl1piPz7QucwgrKuK7WiYvzlnqZn3Wnz1e9mLmy3hLF
 vR4pT0kUOls6093DvMjMAnsjD5xWugEUlhGekRPVGHT4fyXRrSEn2obJpWOIBpPMfth7
 n5UTXM2HHcwYFseS60dA1pcEes3Idrby+4pGvRMeJywrZZrC0gtXeF6Vqvq9UymVDjCp
 8wz2CsOSRMZs0abbJoom3aJwxj2b2SWbRQ/b9lJUS18XJB5MEDsg1uiBtDc12knEuMeU
 oOgJkFT7ycKAnlfhnCQACcjY9kjn0G1K+sJuNfjyBGa7GgUqgxXwSQjAUWbVIWCruX+h
 aDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732511936; x=1733116736;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CaT7XHkUStAmSWQ7uMJ9CTvA+0ljM0SSdqJ8hkuHKAE=;
 b=g1C+qRRWnPoM7MMaysqkr8OK2QzyrfngsjXzkzNUQEgfd0vRVSsLpn47vcdfgy3ks7
 1EZETRRI8JQ91IVTR8Z0EQnLDpxjtYbncdugV0YhcTC2OkYXzgLFm8pu/djHpPhs+G4K
 q1gWrO447O5GoVjRXFgHJAc3xe3irmew3ohApHF+fZOj6YLycEjxp2eupYTK/M541qaT
 9dqwRKFsLF70ZwFMEAI7GEaOfGZwutMcdRXmMSFXMSHYLRUTWUw9fKGZnGI8Big1bQTH
 b6cH12BIr0sBonp+zTpS+tgA00FPHshYhjgFRaszGPqKAZF9yAQbFWTdCTlx+Rb3Z2mg
 +1TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlOEs9tEV/bdBt3Pvv428HEUF7iIn4XvEeuV9/bhKAwXQ9xJ9l4qxRptOx/AUanRy009Vo263nDkA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycYrlt/G9aMtGgK7N3hbXBWgJU/Nyuq4+63brpmR37AT8an6eC
 tQCF5VkwLY61A6KyusynI0WkEMoyqPDdtqVDxWbyoBPoGAQfvi0w7a1MQ2aaFio=
X-Gm-Gg: ASbGncs8cQz2mSCCXmcNhyTp5KtNEfndvJlfctbBvYBb6w4Ze4XlNqGjtMtJSXMBWyP
 399BFHUTwJD93eZZ2XwJBgSMaQKNz6whtNsJGYnusDp9a93E88DKznqF7D5Cgyi07/I4pC53qD4
 brKc6PuISVqNPYY+UwlkubXsTuOztd9QJlvI56HMDjIBW1ynCCMZjizBtxo/B64dAGcELMLbkvH
 fETFVt62KHOwS8OlZIqswp/aQinQJRNlZ84uNPN4x9aGKLQE1kV
X-Google-Smtp-Source: AGHT+IGe6EIORCJn7aV9npBgDcZpDnf5jw/DaCFfKxvU0lKTbT+0M9zATqm1b+aolILMH8BpHhsBzw==
X-Received: by 2002:a05:6a00:2d10:b0:71e:4a51:2007 with SMTP id
 d2e1a72fcca58-724df3c77ffmr14298594b3a.4.1732511936149; 
 Sun, 24 Nov 2024 21:18:56 -0800 (PST)
Received: from localhost ([122.172.86.146]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724de474c9fsm5506878b3a.44.2024.11.24.21.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 21:18:55 -0800 (PST)
Date: Mon, 25 Nov 2024 10:48:53 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 01/11] opp: core: implement dev_pm_opp_get_bw
Message-ID: <20241125051853.taeysx2nhmrwoyde@vireshk-i7>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-1-4deb87be2498@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-1-4deb87be2498@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19-11-24, 18:56, Neil Armstrong wrote:
> Add and implement the dev_pm_opp_get_bw() to retrieve
> the OPP's bandwidth in the same way as the dev_pm_opp_get_voltage()
> helper.
> 
> Retrieving bandwidth is required in the case of the Adreno GPU
> where the GPU Management Unit can handle the Bandwidth scaling.
> 
> The helper can get the peak or average bandwidth for any of
> the interconnect path.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/opp/core.c     | 25 +++++++++++++++++++++++++
>  include/linux/pm_opp.h |  7 +++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 494f8860220d97fc690ebab5ed3b7f5f04f22d73..864b9b99b0129acaffaf45c584c5f34b8bababed 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -106,6 +106,31 @@ static bool assert_single_clk(struct opp_table *opp_table)
>  	return !WARN_ON(opp_table->clk_count > 1);
>  }
>  
> +/**
> + * dev_pm_opp_get_bw() - Gets the bandwidth corresponding to an opp
> + * @opp:	opp for which voltage has to be returned for

                              bandwidth

> + * @peak:	select peak or average bandwidth
> + * @index:	bandwidth index
> + *
> + * Return: bandwidth in kBps, else return 0
> + */
> +unsigned long dev_pm_opp_get_bw(struct dev_pm_opp *opp, bool peak, int index)
> +{
> +	if (IS_ERR_OR_NULL(opp)) {
> +		pr_err("%s: Invalid parameters\n", __func__);
> +		return 0;
> +	}
> +
> +	if (index > opp->opp_table->path_count)
> +		return 0;
> +
> +	if (!opp->bandwidth)
> +		return 0;
> +
> +	return peak ? opp->bandwidth[index].peak : opp->bandwidth[index].avg;
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_opp_get_bw);
> +
>  /**
>   * dev_pm_opp_get_voltage() - Gets the voltage corresponding to an opp
>   * @opp:	opp for which voltage has to be returned for
> diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
> index 6424692c30b71fca471a1b7d63e018605dd9324b..cd9a257b8e7766d6c8631351a10a845c88414a74 100644
> --- a/include/linux/pm_opp.h
> +++ b/include/linux/pm_opp.h
> @@ -106,6 +106,8 @@ struct dev_pm_opp_data {
>  struct opp_table *dev_pm_opp_get_opp_table(struct device *dev);
>  void dev_pm_opp_put_opp_table(struct opp_table *opp_table);
>  
> +unsigned long dev_pm_opp_get_bw(struct dev_pm_opp *opp, bool peak, int index);
> +
>  unsigned long dev_pm_opp_get_voltage(struct dev_pm_opp *opp);
>  
>  int dev_pm_opp_get_supplies(struct dev_pm_opp *opp, struct dev_pm_opp_supply *supplies);
> @@ -209,6 +211,11 @@ static inline struct opp_table *dev_pm_opp_get_opp_table_indexed(struct device *
>  
>  static inline void dev_pm_opp_put_opp_table(struct opp_table *opp_table) {}
>  
> +static inline unsigned long dev_pm_opp_get_bw(struct dev_pm_opp *opp, bool peak, int index)
> +{
> +	return 0;
> +}
> +
>  static inline unsigned long dev_pm_opp_get_voltage(struct dev_pm_opp *opp)
>  {
>  	return 0;

Applied. Thanks.

-- 
viresh
