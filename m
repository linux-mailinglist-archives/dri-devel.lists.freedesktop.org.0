Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219982B7E1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 00:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836AD10E6D7;
	Thu, 11 Jan 2024 23:14:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89C310E336;
 Thu, 11 Jan 2024 23:14:38 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3bbbd4d2b4aso4987213b6e.0; 
 Thu, 11 Jan 2024 15:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705014878; x=1705619678; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wrVoNjP495STQIQ3FVMsai806YpFMUIXx4z0Rg6visI=;
 b=MHsDjb6bGHbp+/GgRRDpSvhGMFjgT3nAmDJ/Qultie1dTS3Ioe3EjOS0ICOIF61swB
 azNGeROlU4HnHwN9jeKuPVJxp+lFHezJT4Hyf42wNoNsG6f8X5R1iJ/n3rw/OpmYedK5
 pMWcqj5R1pLGO3ML1E5TZOBKp/dEzi974JWEaKnUjnwBxYeTlwvoeq5JyfLWT74tQUXx
 h/z/NQnSXeZIVebGZbR+n7HzaxTdGh3bDD0iEVPIshYajPF77zZ14KeC3rblDtQdPTUS
 xtCLSL3YG7RzhX8XMq/USABhsQdaMz96auLlypqOHuiwHXZWbrTRLq7ZvOnafftV0HMi
 bx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705014878; x=1705619678;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wrVoNjP495STQIQ3FVMsai806YpFMUIXx4z0Rg6visI=;
 b=o34mAEKmruedgAMFU8Ern0A1ZRAvrcGyZEmWJDI4Oh68/8Sg8cQp+GjK+YhScn2rQk
 K0VHYCWG6M/UecEK6htBJJa12cDwsL/r44rgj32x/xxIfl1Y8RcPukOxFGFI5Df7I4R+
 JDn+6yvw/v2FELwX4tqjUO33wVb05QOnFZP11adEAKnxuSz01ynoJGvm/l3AFF+jCAFs
 8kefPwsYN6O5l0pdJvSky4e+BswWuh5Y7nxbPpNoAmI0shCETM6Hj4CTCJKbvDotC1zv
 /msjLh1uyIUhb1pvXky5r572LLJLpnhSPRLN/OB2kLncSKOjSuRCroTeFOqQuDgNJGee
 RiFA==
X-Gm-Message-State: AOJu0YzUmTK1BZxL9uKAf8Dbt3rYtIGT4S4ETuIVUQYM/e7lDxPuydZE
 Si9nFnyaTLhLSuTrVlr+UmlTTkvzH70xYQ==
X-Google-Smtp-Source: AGHT+IGDpKcp2NUQHYqgIYov31tIUZuCdOiqNmsa1HKjxrxNTrNHs1Lbzf8wtArROVtJKBgCf+AvNA==
X-Received: by 2002:a05:6808:1308:b0:3bd:5791:67f3 with SMTP id
 y8-20020a056808130800b003bd579167f3mr101557oiv.30.1705014877887; 
 Thu, 11 Jan 2024 15:14:37 -0800 (PST)
Received: from localhost ([2607:fea8:52a3:d200::a40a])
 by smtp.gmail.com with ESMTPSA id
 s4-20020ad45004000000b0067f07683decsm627592qvo.99.2024.01.11.15.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 15:14:37 -0800 (PST)
Date: Thu, 11 Jan 2024 18:14:34 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/msm/mdss: specify cfg bandwidth for SDM670
Message-ID: <ZaB2WjoHBNPnv0CN@radian>
References: <20231215013222.827975-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215013222.827975-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 15, 2023 at 03:32:22AM +0200, Dmitry Baryshkov wrote:
> Lower the requested CFG bus bandwidth for the SDM670 platform. The
> default value is 153600 kBps, which is twice as big as required by the
> platform according to the vendor kernel.
>
> Fixes: a55c8ff252d3 ("drm/msm/mdss: Handle the reg bus ICC path")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 455b2e3a0cdd..35423d10aafa 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -562,6 +562,7 @@ static const struct msm_mdss_data sdm670_data = {
>  	.ubwc_enc_version = UBWC_2_0,
>  	.ubwc_dec_version = UBWC_2_0,
>  	.highest_bank_bit = 1,
> +	.reg_bus_bw = 76800,

This seems to be the bandwidth applied to the "cpu-cfg" path, but it is
not in the device tree yet and is not allowed by schema (for no
particular reason). In sdm670.dtsi, it would be defined as:

	<&gladiator_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>

Furthermore, I have not yet emailed the patches that I use to test the
display on SDM670, namely, the panel driver and device tree changes for
the Pixel 3a. Nevertheless, this does not break anything, even with the
interconnect path and everything needed to test.

Tested-by: Richard Acayan <mailingradian@gmail.com>

>  };
>  
>  static const struct msm_mdss_data sdm845_data = {
> -- 
> 2.39.2
>
