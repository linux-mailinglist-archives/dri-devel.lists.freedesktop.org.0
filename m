Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 395898D8AEA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 22:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F73510E3D2;
	Mon,  3 Jun 2024 20:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iWxATbto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624BF10E3D2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 20:32:22 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-52b90038cf7so3208119e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 13:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717446740; x=1718051540; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j3xWHdXJHtkqPEG1gY7KE65O7IPK9mAb/+ZmZUO/aW4=;
 b=iWxATbtoQIidQmcuybCrbLrd/8zPnamSfKCbJarLNYv2BCxWpGCHDPTGyQBgHgAhzA
 QBLeND18MNpREcCH3hNWwDjHjCezwWBF6FhUcQ1bKthLuC1pGGHqhsErbMGtEuXDjgdH
 xD4J5QUO5fam3LjMtDgcd+GnE/xW0h0Fqq14naBIDrafTu9PQuWp1gVLiwEocFPa9frs
 v0L1YikJR6jrS4c7sdJs0NRx2ARGUUQmTgtyIbRBmlv6ExeLdXaRlH6kPw4FipCJtMJG
 VymQVx3crsxLwoOkr7bLZBL7gzUSBNdUSh3tANHepi6vxC/aJ00w+g4P+dqq7wU4ygao
 tSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717446740; x=1718051540;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j3xWHdXJHtkqPEG1gY7KE65O7IPK9mAb/+ZmZUO/aW4=;
 b=OtupPk7AO7zsi8h26EK/Vmf2nIOJpJVwGTxBDdwp1CYDGlRkoj8yNQbZBR16h5hpqT
 Cqp21yCnI9dhfdamus4uQa2jE9Zonp/enVUn3XAZeKXUMMw5A3GZH6Wac+oHyKCBMLkI
 gGUbJUMvCG7uWK04WE0IjRkDrF9O1yfJi1W+UJ+KLyYLBar9a0I3JVPF2eJuabNIcnBf
 ulwTDXMUr3rWfzH8UTB+BozW6UIVsOCDW+zA0qudRvXWhRL67pdiiyJ0lTnYubM5MHyV
 S8ZpOb2O0NCAKczjuO+aXFqlFVZJvIfGSIJ01fWG0pFcFKtZ663sGy47uZvHdf+futnM
 PXOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVja9WG63C0ty3xR1mWBvFL+wE38nkbXjTfFs7lw6kcvvrffSBmG1nm/b7uqAtsHTgE4nUdWVTE3GwUOxDM1+9dOb+02/bK6ySmT7VVu0Ls
X-Gm-Message-State: AOJu0Yz6xZz0tTQHslUuK/ApJohPZos+Cm6lCq0qK98dFVLaTIjpdshB
 w8eb73G4ICmGd1PevVFfC34jedmMcKyjpblAj1GHPyKf9KI04ZZ4ofgYD760dgo=
X-Google-Smtp-Source: AGHT+IEN0ZKSc9dLsSicKTPHKeh3bX+MpeLnoaQErTFdnlruhE40PAEAx9f4Y40Xgy6T7Y3uFsAJJA==
X-Received: by 2002:ac2:464d:0:b0:52b:7bac:476d with SMTP id
 2adb3069b0e04-52b896cd271mr6412478e87.56.1717446740419; 
 Mon, 03 Jun 2024 13:32:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b950c07f3sm702431e87.55.2024.06.03.13.32.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 13:32:20 -0700 (PDT)
Date: Mon, 3 Jun 2024 23:32:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: noralf@tronnes.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: [PATCH v3 3/5] drm/mipi-dbi: Make bits per word configurable for
 pixel transfers
Message-ID: <ymr4xlth524itfdpsj4mjgjbtc7ivqdskawj62zddxyzgne6et@xdz6twnwc2pm>
References: <20240603-panel-mipi-dbi-rgb666-v3-0-59ed53ca73da@tronnes.org>
 <20240603-panel-mipi-dbi-rgb666-v3-3-59ed53ca73da@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240603-panel-mipi-dbi-rgb666-v3-3-59ed53ca73da@tronnes.org>
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

On Mon, Jun 03, 2024 at 01:21:34PM +0200, Noralf Trønnes via B4 Relay wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> This prepares for supporting other pixel formats than RGB565.

Yes, the patch is pretty simple, however could you please expand the
commit message by describing write_memory_bpw introduction.

> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 14 ++++++++++----
>  include/drm/drm_mipi_dbi.h     |  5 +++++
>  2 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index fa8aba6dc81c..77f8a828d6e0 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -1079,7 +1079,7 @@ static int mipi_dbi_typec1_command_read(struct mipi_dbi *dbi, u8 *cmd,
>  static int mipi_dbi_typec1_command(struct mipi_dbi *dbi, u8 *cmd,
>  				   u8 *parameters, size_t num)
>  {
> -	unsigned int bpw = (*cmd == MIPI_DCS_WRITE_MEMORY_START) ? 16 : 8;
> +	unsigned int bpw = 8;
>  	int ret;
>  
>  	if (mipi_dbi_command_is_read(dbi, *cmd))
> @@ -1091,6 +1091,9 @@ static int mipi_dbi_typec1_command(struct mipi_dbi *dbi, u8 *cmd,
>  	if (ret || !num)
>  		return ret;
>  
> +	if (*cmd == MIPI_DCS_WRITE_MEMORY_START)
> +		bpw = dbi->write_memory_bpw;
> +
>  	return mipi_dbi_spi1_transfer(dbi, 1, parameters, num, bpw);
>  }
>  
> @@ -1184,8 +1187,8 @@ static int mipi_dbi_typec3_command(struct mipi_dbi *dbi, u8 *cmd,
>  	if (ret || !num)
>  		return ret;
>  
> -	if (*cmd == MIPI_DCS_WRITE_MEMORY_START && !dbi->swap_bytes)
> -		bpw = 16;
> +	if (*cmd == MIPI_DCS_WRITE_MEMORY_START)
> +		bpw = dbi->write_memory_bpw;
>  
>  	spi_bus_lock(spi->controller);
>  	gpiod_set_value_cansleep(dbi->dc, 1);
> @@ -1256,12 +1259,15 @@ int mipi_dbi_spi_init(struct spi_device *spi, struct mipi_dbi *dbi,
>  
>  	dbi->spi = spi;
>  	dbi->read_commands = mipi_dbi_dcs_read_commands;
> +	dbi->write_memory_bpw = 16;
>  
>  	if (dc) {
>  		dbi->command = mipi_dbi_typec3_command;
>  		dbi->dc = dc;
> -		if (!spi_is_bpw_supported(spi, 16))
> +		if (!spi_is_bpw_supported(spi, 16)) {
> +			dbi->write_memory_bpw = 8;
>  			dbi->swap_bytes = true;
> +		}
>  	} else {
>  		dbi->command = mipi_dbi_typec1_command;
>  		dbi->tx_buf9_len = SZ_16K;
> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index e8e0f8d39f3a..b36596efdcc3 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -56,6 +56,11 @@ struct mipi_dbi {
>  	 */
>  	struct spi_device *spi;
>  
> +	/**
> +	 * @write_memory_bpw: Bits per word used on a MIPI_DCS_WRITE_MEMORY_START transfer
> +	 */
> +	unsigned int write_memory_bpw;
> +
>  	/**
>  	 * @dc: Optional D/C gpio.
>  	 */
> 
> -- 
> 2.45.1
> 
> 

-- 
With best wishes
Dmitry
