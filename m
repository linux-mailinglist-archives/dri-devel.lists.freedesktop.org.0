Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455FE9582C5
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 11:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8B510E604;
	Tue, 20 Aug 2024 09:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="iB8SKQno";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="F9ZYNlh2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB3810E604
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 09:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1724146678; bh=jPGG/a/zhAKpjsY8pe/7xA2GurPE0F1jHaVRYfIHzcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iB8SKQno1xOFtpP08RD4ydBwRm/5u2V2Y9ZPhGw9uEebBfyA2KWQcrarvwI5GQzTD
 la4XoXVj6mfAbwaLxUBucQdaMykbEnbfCse4u/pg+a4cp/zfDud7yR2VQaU3RiRLLQ
 UNRAdBLOtB50IhAHO9Lo5GxQH5uXmrWgo1kNyzjbf2XwV51R5MBCrisFluxc8nOaB7
 aospHpuBnpT205wgczOHeMIK+Jmb6i3Fwl31ZOB4lUhgdYriz6U44wE6/QkOyVSTwK
 ZcXKcsTd1GQf9RtbDfIidfRpxIQpcR70AvG2G3Ywoc+1kaLVUbWhszjRL1u0QVw+PF
 IjV7UJeJfCOjg==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 734D6FB03;
 Tue, 20 Aug 2024 11:37:58 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5k0b3mmUCL5j; Tue, 20 Aug 2024 11:37:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1724146677; bh=jPGG/a/zhAKpjsY8pe/7xA2GurPE0F1jHaVRYfIHzcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F9ZYNlh2veNbwouKioDxQtER7zoZzfhTS9EBCEwyKXe5TwdTsVhC1U2iZcsaCap1a
 f1oMBnuwq86FwCcdEyP/plxNWkypF0aP3RMFHUs0i0ZL8ah2n210zDY0aI8taBhdkd
 pTMKPRi9TOAy6cMYNnNvkYvhRcd6Xrn5t2zRY+TVeLnXPleLAaN3BviVOYSWqCagb8
 EIpj/3S+OoxKciRY1Co7EG7HThWlhi9Mr9NTIMSOjKdzc8nLxi4qyNLxAxFmc1zEVW
 S4OhGxkkCVbvPzKXwvlzQ/PZ1ZvFgDSIt5Bo9VL6G4ovQhFG8cs0QEngCua9CYkDER
 i+/PSm8duClRg==
Date: Tue, 20 Aug 2024 11:37:54 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: kernel@puri.sm, neil.armstrong@linaro.org, dianders@chromium.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/panel: mantix-mlaf057we51: write hex in
 lowercase
Message-ID: <ZsRj8i_tOw9BfxNB@qwark.sigxcpu.org>
References: <20240820091556.1032726-1-tejasvipin76@gmail.com>
 <20240820091556.1032726-3-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240820091556.1032726-3-tejasvipin76@gmail.com>
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
On Tue, Aug 20, 2024 at 02:45:54PM +0530, Tejas Vipin wrote:
> Converts uppercase hex to lowercase hex for cleanup.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> index 2a365eaa4ad4..4db852ffb0f6 100644
> --- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> +++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
> @@ -23,7 +23,7 @@
>  
>  /* Manufacturer specific Commands send via DSI */
>  #define MANTIX_CMD_OTP_STOP_RELOAD_MIPI 0x41
> -#define MANTIX_CMD_INT_CANCEL           0x4C
> +#define MANTIX_CMD_INT_CANCEL           0x4c
>  #define MANTIX_CMD_SPI_FINISH           0x90
>  
>  struct mantix {
> @@ -50,18 +50,18 @@ static void mantix_init_sequence(struct mipi_dsi_multi_context *dsi_ctx)
>  	/*
>  	 * Init sequence was supplied by the panel vendor.
>  	 */
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a);
>  
>  	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_INT_CANCEL, 0x03);
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x03);
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xA9, 0x00);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x03);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0xa9, 0x00);
>  
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5A, 0x09);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x5a, 0x09);
>  	mipi_dsi_generic_write_seq_multi(dsi_ctx, 0x80, 0x64, 0x00, 0x64, 0x00, 0x00);
>  	mipi_dsi_msleep(dsi_ctx, 20);
>  
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xA5);
> -	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2F);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_SPI_FINISH, 0xa5);
> +	mipi_dsi_generic_write_seq_multi(dsi_ctx, MANTIX_CMD_OTP_STOP_RELOAD_MIPI, 0x00, 0x2f);
>  	mipi_dsi_msleep(dsi_ctx, 20);
>  }

Reviewed-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido

>  
> -- 
> 2.46.0
> 
