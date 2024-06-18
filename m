Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EEC90DB07
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 19:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 079DA10E234;
	Tue, 18 Jun 2024 17:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="erNrd3aA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23A9010E234
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 17:51:02 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so56571621fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 10:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718733060; x=1719337860; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jdrPsOFRH9tibJcIwTVDIHrvX0et09f9Ar+HQWRvLZQ=;
 b=erNrd3aA/NKGA2VF4nLoHVC3dVuskYeuSH6syChafrLhgsRbMAC7u+1ytuDkuYK2PW
 IENrrozu+n36qicUe0ke8qALD6VtSfC4GB9CDkhYCbFtY4FL/2dgTDT5j/HTuQJgNQaL
 JIXOvOf9pO6U5xk6Q1ua9T4yQP4Fv/GNNrGqMqv+upVf1MBzy/XlmUzFWG35bwsqp3jX
 7ktyduYf1mnKz3zSns6/MNx3eLp4FduQS0E3etpCxTuSd3Kj+ucUe/0yhg1xGG5+wMRB
 3fPvAa0aLfgp7+d3FbGgj+/XlXDELwUy7Ux/8HeCUb5lzaAkT8TVCwMF+CFsMiI2WcP9
 sPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718733060; x=1719337860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jdrPsOFRH9tibJcIwTVDIHrvX0et09f9Ar+HQWRvLZQ=;
 b=Qfd2ACuPZcfu6qaIEpnG1r3jcqVVhAC937oBlFqDnkrs8lPlwaIdxgjS8ijnIE0W7i
 8xnmFM3zCL6gt11PKxNSM/EKdUs5bCqBDrUTgaIE6MN7/yf2ydOms9pMcQElT92TdB1j
 b45x6nKcL4eSgj9/i50VlXpwAd3bTStBN085obrSSWYgR4QgmkHwQ9H8jqxTm9j6VLO0
 3SRzA2W7aCTrGOznUMmSpIp8l0qhpt+sMcyFphPEbQ/zzmdkjV9nnH++dzYSHDhH/xTE
 a9IPc55XDAJLVsu6posSYbeXdi6sTJbFQ0YOe7pVdR6S9g7MasJqAa86kDZp8YBl+YYs
 tJnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQQVsaMgH7a1LhKHL60c1gzAdzOGA6HWWowKNDOlKaYOizoVtOHcX3VH5nbg+MWkNNAsYgHiIyddBmhs9XPoUp+O7RpWRX9rcZxXtHiXmp
X-Gm-Message-State: AOJu0YyToyjf1Lc4K6XnLpzZJsFZIuYmi+m3By2NjzQAbOGNmINLAW09
 RN4umUNrRaIBoEolcPAxe2Pg+qEDeLcUeTs0QyRAuaf4G4vENn6kD771dhCxRq0=
X-Google-Smtp-Source: AGHT+IGM/U45FeUpxxsmNAsTgVBSD3mO9NOKixFEiUXqhhF6IJuZRODRDq1PxwN+t2vV3hmMxogugA==
X-Received: by 2002:a2e:2416:0:b0:2ec:eee:f19e with SMTP id
 38308e7fff4ca-2ec3cfe5a12mr3314651fa.37.1718733059948; 
 Tue, 18 Jun 2024 10:50:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec3d00ae2bsm499111fa.51.2024.06.18.10.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 10:50:59 -0700 (PDT)
Date: Tue, 18 Jun 2024 20:50:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
Message-ID: <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
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

On Tue, Jun 18, 2024 at 04:59:36PM GMT, Dzmitry Sankouski wrote:
> sdm845 has "General Purpose" clocks that can be muxed to
> SoC pins.
> 
> Those clocks may be used as e.g. PWM sources for external peripherals.
> Add more frequencies to the table for those clocks so it's possible
> for arbitrary peripherals to make use of them.
> 
> See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP clocks)

Each time I look at the table attached to the GP CLK, I feel that it's
plain wrong. In the end the GPCLK can in theory have arbitrary value
depending on the usecase.

Bjorn, Konrad, maybe we should add special clk_ops for GP CLK which
allow more flexibility than a default clk_rcg2_ops?

> 
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>  drivers/clk/qcom/gcc-sdm845.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
> index ea4c3bf4fb9b..0efd3364e8f5 100644
> --- a/drivers/clk/qcom/gcc-sdm845.c
> +++ b/drivers/clk/qcom/gcc-sdm845.c
> @@ -283,7 +283,21 @@ static struct clk_rcg2 gcc_sdm670_cpuss_rbcpr_clk_src = {
>  	},
>  };
>  
> +/*
> + * This is a frequency table for "General Purpose" clocks.
> + * These clocks can be muxed to the SoC pins and may be used by
> + * external devices. They're often used as PWM source.
> + *
> + * See comment in gcc-mam8916.c at ftbl_gcc_gp1_3_clk.
> + */
>  static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
> +	F(10000,   P_BI_TCXO,    16,  1, 120),
> +	F(20000,   P_BI_TCXO,    16,  1, 60),
> +	F(100000,  P_BI_TCXO,    16,  1,  12),
> +	F(500000,  P_GPLL0_OUT_EVEN, 12, 1, 100),
> +	F(1000000, P_GPLL0_OUT_EVEN, 12, 1, 50),
> +	F(2500000, P_GPLL0_OUT_EVEN, 12, 1, 10),
> +	F(5000000, P_GPLL0_OUT_EVEN, 12, 1, 5),
>  	F(19200000, P_BI_TCXO, 1, 0, 0),
>  	F(25000000, P_GPLL0_OUT_EVEN, 12, 0, 0),
>  	F(50000000, P_GPLL0_OUT_EVEN, 6, 0, 0),
> 
> -- 
> 2.39.2
> 

-- 
With best wishes
Dmitry
