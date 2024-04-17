Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421718A7CD0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 09:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80A8113211;
	Wed, 17 Apr 2024 07:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aN4QeJ/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B55113213
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 07:07:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F25146127C;
 Wed, 17 Apr 2024 07:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC31C072AA;
 Wed, 17 Apr 2024 07:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713337636;
 bh=mH1Op3mNuCa9nI4NldsC+UBBMwUWlrZl8DwT/K1vkac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aN4QeJ/V0+eD/+MifPfYMhJ+1zhx+Uowm9hvTUc/eXfW3SztydKBvFTRshnoFmQpl
 WAFNITwr9Vz68Onkkrz2QpYOI9FlcbgfwEtk9La1bghA7hghu+ZJp8CLMAn5LeiTOw
 rjeq3xK5qMwN4CtKNSAEhqorx2osAORynYLLY9Z8=
Date: Wed, 17 Apr 2024 09:07:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: A <ashokemailat@yahoo.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: fbtft Removed redundant parentheses
Message-ID: <2024041724-barricade-hardly-c554@gregkh>
References: <cc9b9357d30c4abac7301767ff01fe7947f811c4.camel.ref@yahoo.com>
 <cc9b9357d30c4abac7301767ff01fe7947f811c4.camel@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc9b9357d30c4abac7301767ff01fe7947f811c4.camel@yahoo.com>
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

On Tue, Apr 16, 2024 at 01:14:52PM -0700, A wrote:
> >From 6dbcb120581fc7cb45812193227b0a197abd8ba4 Mon Sep 17 00:00:00 2001
> From: Ashok Kumar <ashokemailat@yahoo.com>
> Date: Tue, 16 Apr 2024 09:19:32 -0700
> Subject: [PATCH] [PATCH] staging: fbtft Removed redundant parentheses on
>  logical expr
> 
> Adhere to Linux Kernel coding style removed redundant parentheses,
> multiple blank lines and indentation alignment.
> 
> Reported by checkpatch.pl
> 
> ------
> fb_ili9320.c
> 
> +       if ((devcode != 0x0000) && (devcode != 0x9320))
> 
> ------
> fb_ra8875.c
> 
> CHECK: Unnecessary parentheses around 'par->info->var.xres == 320'
> +      if ((par->info->var.xres == 320) && (par->info->var.yres ==
> 240)) {
> 
> ------
> fb_ssd1325.c
> 
> CHECK: Please don't use multiple blank lines
> ------
> 
> fb_tinylcd.c    - indentation adjustment
> 
> -----
> fbtft-bus.c
> 
> CHECK: Unnecessary parentheses around 'par->spi->bits_per_word == 8'
> 
> ------
> fbtft-core.c
> 
> CHECK: Please don't use multiple blank lines
> 
> CHECK: Unnecessary parentheses around '!txbuflen'
> 
> CHECK: Please don't use multiple blank lines
> ------
> 
> Signed-off-by: Ashok Kumar <ashokemailat@yahoo.com>
> ---
>  drivers/staging/fbtft/fb_ili9320.c | 2 +-
>  drivers/staging/fbtft/fb_ra8875.c  | 8 ++++----
>  drivers/staging/fbtft/fb_ssd1325.c | 2 --
>  drivers/staging/fbtft/fb_tinylcd.c | 2 +-
>  drivers/staging/fbtft/fbtft-bus.c  | 6 +++---
>  drivers/staging/fbtft/fbtft-core.c | 7 +------
>  6 files changed, 10 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_ili9320.c
> b/drivers/staging/fbtft/fb_ili9320.c
> index 0be7c2d51548..409b54cc562e 100644
> --- a/drivers/staging/fbtft/fb_ili9320.c
> +++ b/drivers/staging/fbtft/fb_ili9320.c
> @@ -37,7 +37,7 @@ static int init_display(struct fbtft_par *par)
>  	devcode = read_devicecode(par);
>  	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "Device code:
> 0x%04X\n",
>  		      devcode);
> -	if ((devcode != 0x0000) && (devcode != 0x9320))
> +	if (devcode != 0x0000 && devcode != 0x9320)
>  		dev_warn(par->info->device,
>  			 "Unrecognized Device code: 0x%04X (expected
> 0x9320)\n",
>  			devcode);
> diff --git a/drivers/staging/fbtft/fb_ra8875.c
> b/drivers/staging/fbtft/fb_ra8875.c
> index 398bdbf53c9a..4b79fb48c5f0 100644
> --- a/drivers/staging/fbtft/fb_ra8875.c
> +++ b/drivers/staging/fbtft/fb_ra8875.c
> @@ -50,7 +50,7 @@ static int init_display(struct fbtft_par *par)
>  
>  	par->fbtftops.reset(par);
>  
> -	if ((par->info->var.xres == 320) && (par->info->var.yres ==
> 240)) {
> +	if (par->info->var.xres == 320 && par->info->var.yres == 240)
> {
>  		/* PLL clock frequency */
>  		write_reg(par, 0x88, 0x0A);
>  		write_reg(par, 0x89, 0x02);
> @@ -74,8 +74,8 @@ static int init_display(struct fbtft_par *par)
>  		write_reg(par, 0x1D, 0x0E);
>  		write_reg(par, 0x1E, 0x00);
>  		write_reg(par, 0x1F, 0x02);
> -	} else if ((par->info->var.xres == 480) &&
> -		   (par->info->var.yres == 272)) {
> +	} else if (par->info->var.xres == 480 &&
> +		   par->info->var.yres == 272) {
>  		/* PLL clock frequency  */
>  		write_reg(par, 0x88, 0x0A);
>  		write_reg(par, 0x89, 0x02);
> @@ -111,7 +111,7 @@ static int init_display(struct fbtft_par *par)
>  		write_reg(par, 0x04, 0x01);
>  		mdelay(1);
>  		/* horizontal settings */
> -		write_reg(par, 0x14, 0x4F);
> +write_reg(par, 0x14, 0x4F);
>  		write_reg(par, 0x15, 0x05);
>  		write_reg(par, 0x16, 0x0F);
>  		write_reg(par, 0x17, 0x01);
> diff --git a/drivers/staging/fbtft/fb_ssd1325.c
> b/drivers/staging/fbtft/fb_ssd1325.c
> index 796a2ac3e194..69aa808c7e23 100644
> --- a/drivers/staging/fbtft/fb_ssd1325.c
> +++ b/drivers/staging/fbtft/fb_ssd1325.c
> @@ -109,8 +109,6 @@ static int set_gamma(struct fbtft_par *par, u32
> *curves)
>  {
>  	int i;
>  
> -	fbtft_par_dbg(DEBUG_INIT_DISPLAY, par, "%s()\n", __func__);
> -
>  	for (i = 0; i < GAMMA_LEN; i++) {
>  		if (i > 0 && curves[i] < 1) {
>  			dev_err(par->info->device,
> diff --git a/drivers/staging/fbtft/fb_tinylcd.c
> b/drivers/staging/fbtft/fb_tinylcd.c
> index 9469248f2c50..60cda57bcb33 100644
> --- a/drivers/staging/fbtft/fb_tinylcd.c
> +++ b/drivers/staging/fbtft/fb_tinylcd.c
> @@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
>  	write_reg(par, 0xE5, 0x00);
>  	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
>  	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
> -		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
> +		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
>  	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
>  	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
>  	udelay(250);
> diff --git a/drivers/staging/fbtft/fbtft-bus.c
> b/drivers/staging/fbtft/fbtft-bus.c
> index 3d422bc11641..02d7dbd38678 100644
> --- a/drivers/staging/fbtft/fbtft-bus.c
> +++ b/drivers/staging/fbtft/fbtft-bus.c
> @@ -62,9 +62,9 @@
> out:									      \
>  }                                                                    
> \
>  EXPORT_SYMBOL(func);
>  
> -define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
> +define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
>  define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16,
> cpu_to_be16)
> -define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
> +define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
>  
>  void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
>  {
> @@ -85,7 +85,7 @@ void fbtft_write_reg8_bus9(struct fbtft_par *par, int
> len, ...)
>  	if (len <= 0)
>  		return;
>  
> -	if (par->spi && (par->spi->bits_per_word == 8)) {
> +	if (par->spi && par->spi->bits_per_word == 8) {
>  		/* we're emulating 9-bit, pad start of buffer with no-
> ops
>  		 * (assuming here that zero is a no-op)
>  		 */
> diff --git a/drivers/staging/fbtft/fbtft-core.c
> b/drivers/staging/fbtft/fbtft-core.c
> index 38845f23023f..98ffca49df81 100644
> --- a/drivers/staging/fbtft/fbtft-core.c
> +++ b/drivers/staging/fbtft/fbtft-core.c
> @@ -216,8 +216,6 @@ static void fbtft_reset(struct fbtft_par *par)
>  	if (!par->gpio.reset)
>  		return;
>  
> -	fbtft_par_dbg(DEBUG_RESET, par, "%s()\n", __func__);
> -
>  	gpiod_set_value_cansleep(par->gpio.reset, 1);
>  	usleep_range(20, 40);
>  	gpiod_set_value_cansleep(par->gpio.reset, 0);
> @@ -667,7 +665,7 @@ struct fb_info *fbtft_framebuffer_alloc(struct
> fbtft_display *display,
>  		txbuflen = 0;
>  
>  #ifdef __LITTLE_ENDIAN
> -	if ((!txbuflen) && (bpp > 8))
> +	if (!txbuflen && bpp > 8)
>  		txbuflen = PAGE_SIZE; /* need buffer for byteswapping
> */
>  #endif
>  
> @@ -1053,8 +1051,6 @@ static int fbtft_verify_gpios(struct fbtft_par
> *par)
>  	struct fbtft_platform_data *pdata = par->pdata;
>  	int i;
>  
> -	fbtft_par_dbg(DEBUG_VERIFY_GPIOS, par, "%s()\n", __func__);
> -
>  	if (pdata->display.buswidth != 9 &&  par->startbyte == 0 &&
>  	    !par->gpio.dc) {
>  		dev_err(par->info->device,
> @@ -1159,7 +1155,6 @@ int fbtft_probe_common(struct fbtft_display
> *display,
>  		dev = &pdev->dev;
>  
>  	if (unlikely(display->debug & DEBUG_DRIVER_INIT_FUNCTIONS))
> -		dev_info(dev, "%s()\n", __func__);
>  
>  	pdata = dev->platform_data;
>  	if (!pdata) {
> -- 
> 2.34.1
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

- Your patch contains warnings and/or errors noticed by the
  scripts/checkpatch.pl tool.

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.

- Your patch was attached, please place it inline so that it can be
  applied directly from the email message itself.

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what is needed in
  order to properly describe the change.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/process/submitting-patches.rst for what a proper
  Subject: line should look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
