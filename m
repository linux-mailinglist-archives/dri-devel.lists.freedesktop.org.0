Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 428BF677EA8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 16:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F98710E4AB;
	Mon, 23 Jan 2023 15:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFFB10E4AB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:05:01 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id d30so18598905lfv.8
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 07:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P3rqFJi0wYIMyx4eFEnrANXBYlUWFGjnlOrB4sJY0mc=;
 b=VSvjd1+J+2hfVE0rK2aWfDA0OVUPFITcaGU/EEk+ovd3PB+LZoSIbLXjg/6O4g0QkX
 wQSOdPQHW8ShVOvuv6K4ehak+/FUBZ6bBjlKapxHcHQImaA7q7t1gEwYZmwObqGrP/PP
 CuO1Q1/NA1X4wba91SbkMkbJ02vBgbwFgxkUGAZz0utThM5EFRk4Y/dHFQrqiTC3T8XY
 pxEaA9cykcbArWN/Q14sLzrf2oqArLVwTmvV0IHeWZXjaXfjdJS++GDWvaf9CtXKja5B
 /+o8WCQ6Z8OG5i90gfUfiXJhw6rQk2gldlIFYsb4njbrpXyfD3NMkTBxEGrhoTwav/UE
 HUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P3rqFJi0wYIMyx4eFEnrANXBYlUWFGjnlOrB4sJY0mc=;
 b=UpixsRarmfVc9IwMk0G92yL5XTFN5kdQII8DraSRcqkXSOdKyk50vWt2kQ/lvZhLqj
 aKKeOiP5SD8Otrwo41LPdoSLV9mKg7OimUpwCkaUqBhKq0WewyB35mQ532InHSyBMEDj
 uN1kLgvll8vjUw3lLN1WEGQ3DCyXKLtlbqvra2su9Yxs/JbaWBLoUOOPV6CSD4loLSvD
 PvDLToEFVZyo0IjbfUwMqq6pdgNtjF/mbuufx80X7R2txVwvVgjEXHrddqKtXMYlYH38
 7jgXe3Q4kIWj98yB0TcN2h7btd5mjFFIyEQEJIC9wJY2TVrpkohHwQ3SY+Dr/RkzNqnB
 vbEQ==
X-Gm-Message-State: AFqh2kofAGP9g68BUrb6baeAONqdhYkKDv3CdtwOGTSE0Z8K3srLqsYr
 BRfrr/2N3W3HockzV+dSVqw=
X-Google-Smtp-Source: AMrXdXuHnINfpXEMI/5P6IHfO27xMrOaiT1cQnmYVDzQ2npYaq/u8eUakJKoBBnDu0eFJD/hs2QaqA==
X-Received: by 2002:a05:6512:340a:b0:4d2:551e:3838 with SMTP id
 i10-20020a056512340a00b004d2551e3838mr7464162lfr.29.1674486299330; 
 Mon, 23 Jan 2023 07:04:59 -0800 (PST)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 b8-20020a0565120b8800b004d593f218absm1011508lfv.108.2023.01.23.07.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:04:58 -0800 (PST)
Date: Mon, 23 Jan 2023 18:04:56 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v2 02/13] spi: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <20230123145953.ytaaq3x4tetgepyf@mobilestation>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119185342.2093323-3-amit.kumar-mahapatra@amd.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 libertas-dev@lists.infradead.org, vireshk@kernel.org, openbmc@lists.ozlabs.org,
 linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 greybus-dev@lists.linaro.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 kernel@pengutronix.de, netdev@vger.kernel.org, linux-wpan@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 12:23:31AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---

[nip]

>  drivers/spi/spi-dw-core.c         |  2 +-
>  drivers/spi/spi-dw-mmio.c         |  4 ++--

[nip]

> diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
> index 99edddf9958b..4fd1aa800cc3 100644
> --- a/drivers/spi/spi-dw-core.c
> +++ b/drivers/spi/spi-dw-core.c
> @@ -103,7 +103,7 @@ void dw_spi_set_cs(struct spi_device *spi, bool enable)
>  	 * support active-high or active-low CS level.
>  	 */
>  	if (cs_high == enable)
> -		dw_writel(dws, DW_SPI_SER, BIT(spi->chip_select));
> +		dw_writel(dws, DW_SPI_SER, BIT(spi_get_chipselect(spi, 0)));
>  	else
>  		dw_writel(dws, DW_SPI_SER, 0);
>  }
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 26c40ea6dd12..d511da766ce8 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
> @@ -65,7 +65,7 @@ static void dw_spi_mscc_set_cs(struct spi_device *spi, bool enable)
>  	struct dw_spi *dws = spi_master_get_devdata(spi->master);
>  	struct dw_spi_mmio *dwsmmio = container_of(dws, struct dw_spi_mmio, dws);
>  	struct dw_spi_mscc *dwsmscc = dwsmmio->priv;
> -	u32 cs = spi->chip_select;
> +	u32 cs = spi_get_chipselect(spi, 0);
>  
>  	if (cs < 4) {
>  		u32 sw_mode = MSCC_SPI_MST_SW_MODE_SW_PIN_CTRL_MODE;
> @@ -138,7 +138,7 @@ static void dw_spi_sparx5_set_cs(struct spi_device *spi, bool enable)
>  	struct dw_spi *dws = spi_master_get_devdata(spi->master);
>  	struct dw_spi_mmio *dwsmmio = container_of(dws, struct dw_spi_mmio, dws);
>  	struct dw_spi_mscc *dwsmscc = dwsmmio->priv;
> -	u8 cs = spi->chip_select;
> +	u8 cs = spi_get_chipselect(spi, 0);
>  
>  	if (!enable) {
>  		/* CS override drive enable */

For the DW SSI part:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

[nip]
