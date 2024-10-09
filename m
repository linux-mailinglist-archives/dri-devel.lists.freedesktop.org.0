Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C319968FF
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 13:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADCE10E163;
	Wed,  9 Oct 2024 11:40:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="T0P1zzGn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 238E710E163
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 11:40:42 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so1020549566b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728474040; x=1729078840; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=n3tPa6oC3GkVBQqXt9lYWOj5WcXfTZQll2lZKEeta0s=;
 b=T0P1zzGn9uPEefUhwNLG3JZc2jGYXuf5s3B1OTS+/ZvRKdeYHp+r0LSqg2RC/lgryo
 oGdi0w4X3DaxQhP/sIyoOYn/R1ekWA3GrpJBGX5WIdvjsxI2yt/eFsXSP6E01j+CrWou
 oM3WcnH5O1SougW0ppHH66OvvMRsWBVnVXV7DtCJ8SF6QwXbLpcQrteYrh6OZ9TLA5HF
 M0gP/ts8ghXmCuZ1Acw8qXRh4NM8cm22pimLhAIGgaLbz2z7ZOe7FRT7apLp3VSLS7fl
 q20WRAigZtFBLpjXtiprR5qvIh61I2BrAvRtaz4vNE4DJo7bG+tEdJkWTEv6f/kOqdd0
 5wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728474040; x=1729078840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3tPa6oC3GkVBQqXt9lYWOj5WcXfTZQll2lZKEeta0s=;
 b=mPB/SavVr2Jxqqpo6Dr/lxrAJFCw0oyuqWwWo/oxKa6Pmi34YvsuLdtpsc+Uvih3Jh
 o3Ok4mi3sRQdMzr3Fo7N0uCsdkupVOejwzLJhmZcPmYhD6dACC9cnMhM4Sgw4X1aXzLN
 4rIRhF/u8PtWhL2sQoSoxq/G74QaI5wMYJWwHnlAiX0sWtGrUA80LHC9gIoYJCKogxaQ
 w+juSa2ch2cSmcA6LtuEZh+cmiKosDWi7rc1CoH6gHwLBQix4Glua1acakynTID/oGOL
 q4gjP74Y/oFQlQBQDz4tST9EcSCz84OtEICOqmMpJ3SInaV8l9BpG78xc1tK5I5QRbJx
 N08g==
X-Gm-Message-State: AOJu0YzxNV7zS9gBFqYEAbYx11jSVcK5jU57Ljqj9BHnLO5jtau3Ik8J
 qR4YZ1h+a5Xq1r4swaMyAJSCmthT+xKqiTd+NEOzRuznRwp5xlQC8YHcRgz+58w=
X-Google-Smtp-Source: AGHT+IHzp7sGsoG0E3MlQedOjt1RQsHdAF3ZWTsO4nfIOk1uH4nyTFSaTS2XpHphmCpbogKsgsVUTg==
X-Received: by 2002:a17:907:e89:b0:a99:3f4e:6de8 with SMTP id
 a640c23a62f3a-a998d3832e7mr182256566b.64.1728474040413; 
 Wed, 09 Oct 2024 04:40:40 -0700 (PDT)
Received: from linaro.org ([82.77.84.93]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994a8da5d3sm495547966b.134.2024.10.09.04.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 04:40:40 -0700 (PDT)
Date: Wed, 9 Oct 2024 14:40:37 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
Message-ID: <ZwZrtajvhpq50QPH@linaro.org>
References: <20241008223846.337162-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008223846.337162-1-marex@denx.de>
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

On 24-10-09 00:38:19, Marek Vasut wrote:
> The media_ldb_root_clk supply LDB serializer. These clock are usually
> shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
> results in accurate serializer clock.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Any fixes tag needed ?

Otherwise, LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/clk/imx/clk-imx8mp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 516dbd170c8a3..2e61d340b8ab7 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
>  	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
>  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
> -	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
> +	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
>  	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
>  	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] = imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mipi_test_byte_sels, ccm_base + 0xc100);
>  	hws[IMX8MP_CLK_ECSPI3] = imx8m_clk_hw_composite("ecspi3", imx8mp_ecspi3_sels, ccm_base + 0xc180);
> -- 
> 2.45.2
> 
