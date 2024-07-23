Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D85939BDE
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 09:43:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F45A10E46D;
	Tue, 23 Jul 2024 07:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZmcLLhhA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253DC10E46D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 07:43:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5BC86CE0E26;
 Tue, 23 Jul 2024 07:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 430F4C4AF09;
 Tue, 23 Jul 2024 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1721720589;
 bh=n/1EPc5P/6SsOU83N7zuGjyu+bS3IB810tvVY59pjOM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZmcLLhhAn+tp87lAgWZQCK4KqTJ3mEc3T1b7wcbzT1hRuEtgilSrkh3eIBzuhkd72
 la09uQT1MyQ+WcNqDQD8qpyqGdPKJdirlBlsAGyuO7AU0zfDP/vJh7MeUl/eQnhrJs
 /BTKZdotERuvwdA+3bs3Grnylm2xyjjLbDZdh4hM=
Date: Tue, 23 Jul 2024 09:43:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: remove unnecessary braces in if
 statements and space before close parenthesis in function call
Message-ID: <2024072339-elderly-charbroil-5d5d@gregkh>
References: <20240723060311.32043-1-riyandhiman14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723060311.32043-1-riyandhiman14@gmail.com>
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

On Tue, Jul 23, 2024 at 11:33:11AM +0530, Riyan Dhiman wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Unnecessary parentheses around 'devcode != 0x0000'
> CHECK: Unnecessary parentheses around 'devcode != 0x9320'
> CHECK: Unnecessary parentheses around 'par->info->var.xres == 320'
> CHECK: Unnecessary parentheses around 'par->info->var.yres == 240'
> CHECK: Unnecessary parentheses around 'par->spi->bits_per_word == 8'
> CHECK: Unnecessary parentheses around '!txbuflen'
> CHECK: Unnecessary parentheses around 'bpp > 8'
> ERROR: space prohibited before that close parenthesis ')'
> 
> Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
> ---
>  drivers/staging/fbtft/fb_ili9320.c | 2 +-
>  drivers/staging/fbtft/fb_ra8875.c  | 2 +-
>  drivers/staging/fbtft/fbtft-bus.c  | 6 +++---
>  drivers/staging/fbtft/fbtft-core.c | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ili9320.c b/drivers/staging/fbtft/fb_ili9320.c
> index 0be7c2d51548..409b54cc562e 100644
> --- a/drivers/staging/fbtft/fb_ili9320.c
> +++ b/drivers/staging/fbtft/fb_ili9320.c
> @@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)
>  	devcode = read_devicecode(par);
>  	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code: 0x%04X\n",
>  		      devcode);
> -	if ((devcode != 0x0000) && (devcode != 0x9320))
> +	if (devcode != 0x0000 && devcode != 0x9320)
>  		dev_warn(par->info->device,
>  			 "Unrecognized Device code: 0x%04X (expected 0x9320)\n",
>  			devcode);
> diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
> index 398bdbf53c9a..ce305a0bea48 100644
> --- a/drivers/staging/fbtft/fb_ra8875.c
> +++ b/drivers/staging/fbtft/fb_ra8875.c
> @@ -50,7 +50,7 @@ static int init_display(struct fbtft_par *par)
>  
>  	par->fbtftops.reset(par);
>  
> -	if ((par->info->var.xres == 320) && (par->info->var.yres == 240)) {
> +	if (par->info->var.xres == 320 && par->info->var.yres == 240) {
>  		/* PLL clock frequency */
>  		write_reg(par, 0x88, 0x0A);
>  		write_reg(par, 0x89, 0x02);
> diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
> index 3d422bc11641..02d7dbd38678 100644
> --- a/drivers/staging/fbtft/fbtft-bus.c
> +++ b/drivers/staging/fbtft/fbtft-bus.c
> @@ -62,9 +62,9 @@ out:									      \
>  }                                                                             \
>  EXPORT_SYMBOL(func);
>  
> -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
>  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
> -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
> +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
>  
>  void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
>  {
> @@ -85,7 +85,7 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
>  	if (len <= 0)
>  		return;
>  
> -	if (par->spi && (par->spi->bits_per_word == 8)) {
> +	if (par->spi && par->spi->bits_per_word == 8) {
>  		/* we're emulating 9-bit, pad start of buffer with no-ops
>  		 * (assuming here that zero is a no-op)
>  		 */
> diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
> index 8e2fd0c0fee2..53b104559502 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -666,7 +666,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct fbtft_display *display,
>  		txbuflen = 0;
>  
>  #ifdef __LITTLE_ENDIAN
> -	if ((!txbuflen) && (bpp > 8))
> +	if (!txbuflen && bpp > 8)
>  		txbuflen = PAGE_SIZE; /* need buffer for byteswapping */
>  #endif
>  
> -- 
> 2.39.2
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You sent a patch that has been sent multiple times in the past, and is
  identical to ones that has been recently rejected.  Please always look
  at the mailing list traffic to determine if you are duplicating other
  people's work.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
