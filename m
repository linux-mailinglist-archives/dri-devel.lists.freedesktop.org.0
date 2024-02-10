Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E12B8503D0
	for <lists+dri-devel@lfdr.de>; Sat, 10 Feb 2024 11:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8791410F045;
	Sat, 10 Feb 2024 10:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="eHAbpYDC";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="PNDeQMo9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08BD210F045
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Feb 2024 10:09:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 3911FFB04;
 Sat, 10 Feb 2024 11:09:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1707559764; bh=aNPiNKu6n8Eg6JYAtibuxYdgiGZ8n2Cub95HcMJmDVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eHAbpYDCh7yOizl69U1cqSZP05AO7ldtMPiNBKisTIDL+leI+zdoYa5I1eA/PBjQJ
 FktpGkNbyfYq/rN5HBFls935v2T3OPX6C7WP33e834W0lYiLn6MYrEkRU7Oik0ZAx5
 9LPh26wBNa8ebESpbWUdUAcvXPNqm68R77TWdDFOGEFWbzzVuCiFCvW2DoF+ppFvER
 jqcke1WeM/zGkwSD8AtEvPg1gt8e3Iq24IZhWU7aU8rmKZ5a1D0uso+GBr2qw7vBUa
 Jb2W1jMOnP2+Z1If4JT9H0vvZ5k4u+VVbo4OqxqgD8B6i1h+pCegrYefquQwJkk9bC
 In9Q6ZLTa279w==
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rJuQlZzD-xG9; Sat, 10 Feb 2024 11:09:22 +0100 (CET)
Date: Sat, 10 Feb 2024 11:09:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1707559762; bh=aNPiNKu6n8Eg6JYAtibuxYdgiGZ8n2Cub95HcMJmDVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PNDeQMo9aQu/L2FauSIBvEo3loPVcaaJRYhj7Te0SG/T0TL4MYlLOsIa3/574Yu13
 VbtF3ITM/fT/cj8wE3LLWmgJS9nM8zXmDdmrG62Z6DFuqWDZRJxhX6J8Iw4k8dkuaL
 zeQWU22er07KfTQ0AhDhVpejoUUCHN0AZOOUFJissluAhixcA8CDThj0Qyf/FzUz0V
 5loCyVPY7IjY7qRSkuRDG0abu1fBOlYvX+vc+blFTjju+SPr2/dMPv5TqntafOuOOd
 PsejJGv2jtWuzKp1uWo/upEC5rGPNqY8Jx7k3MfjyBZDQalKvlf+J1EcIAGdrqS/gj
 fR9dhp7A4u39Q==
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Ao Zhong <hacc1225@gmail.com>
Cc: Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Chris Morgan <macromorgan@hotmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/panel: st7703: Fix Panel Initialization for
 Anbernic RG353V-V2
Message-ID: <ZcdLUU7nfu6P6U2h@qwark.sigxcpu.org>
References: <ZcX5ljSCc7nyr_NE@qwark.sigxcpu.org>
 <20240210002443.5590-1-hacc1225@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240210002443.5590-1-hacc1225@gmail.com>
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

Hi,
On Sat, Feb 10, 2024 at 01:24:43AM +0100, Ao Zhong wrote:
> This patch addresses an issue with the Anbernic RG353V-V2 panel
> initialization that was caused by incorrect parameter. The correct
> initialization sequence was derived by referencing the JELOS (Just
> Enough Linux OS) BSP kernel's device tree for the V2 panel, which is
> identified by the ID "38 21". The relevant device tree can be found at:
> 
> https://github.com/JustEnoughLinuxOS/rk356x-kernel/blob/d4d7335a5ca18fc216a29712d5c6cecfb86147d2/arch/arm64/boot/dts/rockchip/rk3568-evb-rg353v.dtsi#L582
> 
> The proper initialization sequence was further informed by dissecting
> instructions as outlined in the "Rockchip_DRM_Panel_Porting_Guide",
> specifically in Chapter 3.3 of the document.
> 
> https://web.archive.org/web/20240209211932if_/http://download.t-firefly.com/product/Board/Common/Document/Developer/Rockchip_Developer_Guide_DRM_Panel_Porting_CN.pdf
> 
> Upon comparing the initialization sequence within the
> rg353v2_init_sequence function against the device tree in the BSP
> kernel, discrepancies were identified in two instructions. The relevant
> instructions in the device tree are:
> 
> 1. 15 00 03 b6 7f 7f corresponding to the ST7703_CMD_SETVCOM command
>    with parameters 7f 7f
> 2. 39 00 05 b8 26 62 f0 63 corresponding to the ST7703_CMD_SETPOWER_EXT
>    command with parameters 26 62 f0 63
> 
> Adjusting the parameters to match those specified in the BSP kernel's
> device tree allow the panel to initialize correctly.
> 
> Signed-off-by: Ao Zhong <hacc1225@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> index b55bafd1a8be..a346d6c3d283 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -357,8 +357,8 @@ static int rg353v2_init_sequence(struct st7703 *ctx)
>  			       0x28, 0x03, 0xff, 0x00, 0x00, 0x00, 0x00);
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP, 0x0a, 0x0a);
> -	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x92, 0x92);
> -	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x25, 0x22,
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM, 0x7f, 0x7f);
> +	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT, 0x26, 0x62,
>  			       0xf0, 0x63);
>  	mipi_dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI, 0x33, 0x81, 0x05,
>  			       0xf9, 0x0e, 0x0e, 0x20, 0x00, 0x00, 0x00,
> 0x00,

Reviewed-by: Guido Günther <agx@sigxcpu.org>
 -- Guido

> -- 
> 2.43.0
> 
