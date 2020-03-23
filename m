Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C9C19006A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 22:34:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616BF89DF7;
	Mon, 23 Mar 2020 21:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B228789DF7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 21:34:14 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 569AF5C0BDA;
 Mon, 23 Mar 2020 22:34:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1584999253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xq2spUjk0IrtdoMyI/ZsGRBZMsu9l7W2eX8mCP5dJnA=;
 b=MXwZvGsx+o1+kKWXAIkoxbXhyza74xVf5CtXO6dh+ZD16x6M0jGPbTDTBCa8r3W4iMjxGN
 w20GYZcQpFN+WjsPB9LKLnIrHKXzP8hyXr7mX6qeXkQnjRQVAZ77AO1JGIx4r88C7VajQ5
 3Zx//S0A6euXHoe8dgZVyBN/27h2vMY=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 22:34:13 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 03/21] drm: mxsfb: Use BIT() macro to define register
 bitfields
In-Reply-To: <20200309195216.31042-4-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-4-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <1501d151a6aa10996d929bea9013bb85@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-09 20:51, Laurent Pinchart wrote:
> Using BIT() is preferred over manual shifts as it's more readable,
> handles the 1 << 31 case properly, and avoids other mistakes as shown by
> the DEBUG0_HSYNC and DEBUG0_VSYNC bits (that are currently unused). Use
> it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_regs.h | 56 +++++++++++++++---------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> index 932d7ea08fd5..713d8f830135 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> @@ -28,51 +28,51 @@
>  #define LCDC_V4_DEBUG0			0x1d0
>  #define LCDC_V3_DEBUG0			0x1f0
>  
> -#define CTRL_SFTRST			(1 << 31)
> -#define CTRL_CLKGATE			(1 << 30)
> -#define CTRL_BYPASS_COUNT		(1 << 19)
> -#define CTRL_VSYNC_MODE			(1 << 18)
> -#define CTRL_DOTCLK_MODE		(1 << 17)
> -#define CTRL_DATA_SELECT		(1 << 16)
> +#define CTRL_SFTRST			BIT(31)
> +#define CTRL_CLKGATE			BIT(30)
> +#define CTRL_BYPASS_COUNT		BIT(19)
> +#define CTRL_VSYNC_MODE			BIT(18)
> +#define CTRL_DOTCLK_MODE		BIT(17)
> +#define CTRL_DATA_SELECT		BIT(16)
>  #define CTRL_SET_BUS_WIDTH(x)		(((x) & 0x3) << 10)
>  #define CTRL_GET_BUS_WIDTH(x)		(((x) >> 10) & 0x3)
>  #define CTRL_BUS_WIDTH_MASK		(0x3 << 10)
>  #define CTRL_SET_WORD_LENGTH(x)		(((x) & 0x3) << 8)
>  #define CTRL_GET_WORD_LENGTH(x)		(((x) >> 8) & 0x3)
> -#define CTRL_MASTER			(1 << 5)
> -#define CTRL_DF16			(1 << 3)
> -#define CTRL_DF18			(1 << 2)
> -#define CTRL_DF24			(1 << 1)
> -#define CTRL_RUN			(1 << 0)
> +#define CTRL_MASTER			BIT(5)
> +#define CTRL_DF16			BIT(3)
> +#define CTRL_DF18			BIT(2)
> +#define CTRL_DF24			BIT(1)
> +#define CTRL_RUN			BIT(0)
>  
> -#define CTRL1_FIFO_CLEAR		(1 << 21)
> +#define CTRL1_FIFO_CLEAR		BIT(21)
>  #define CTRL1_SET_BYTE_PACKAGING(x)	(((x) & 0xf) << 16)
>  #define CTRL1_GET_BYTE_PACKAGING(x)	(((x) >> 16) & 0xf)
> -#define CTRL1_CUR_FRAME_DONE_IRQ_EN	(1 << 13)
> -#define CTRL1_CUR_FRAME_DONE_IRQ	(1 << 9)
> +#define CTRL1_CUR_FRAME_DONE_IRQ_EN	BIT(13)
> +#define CTRL1_CUR_FRAME_DONE_IRQ	BIT(9)
>  
>  #define TRANSFER_COUNT_SET_VCOUNT(x)	(((x) & 0xffff) << 16)
>  #define TRANSFER_COUNT_GET_VCOUNT(x)	(((x) >> 16) & 0xffff)
>  #define TRANSFER_COUNT_SET_HCOUNT(x)	((x) & 0xffff)
>  #define TRANSFER_COUNT_GET_HCOUNT(x)	((x) & 0xffff)
>  
> -#define VDCTRL0_ENABLE_PRESENT		(1 << 28)
> -#define VDCTRL0_VSYNC_ACT_HIGH		(1 << 27)
> -#define VDCTRL0_HSYNC_ACT_HIGH		(1 << 26)
> -#define VDCTRL0_DOTCLK_ACT_FALLING	(1 << 25)
> -#define VDCTRL0_ENABLE_ACT_HIGH		(1 << 24)
> -#define VDCTRL0_VSYNC_PERIOD_UNIT	(1 << 21)
> -#define VDCTRL0_VSYNC_PULSE_WIDTH_UNIT	(1 << 20)
> -#define VDCTRL0_HALF_LINE		(1 << 19)
> -#define VDCTRL0_HALF_LINE_MODE		(1 << 18)
> +#define VDCTRL0_ENABLE_PRESENT		BIT(28)
> +#define VDCTRL0_VSYNC_ACT_HIGH		BIT(27)
> +#define VDCTRL0_HSYNC_ACT_HIGH		BIT(26)
> +#define VDCTRL0_DOTCLK_ACT_FALLING	BIT(25)
> +#define VDCTRL0_ENABLE_ACT_HIGH		BIT(24)
> +#define VDCTRL0_VSYNC_PERIOD_UNIT	BIT(21)
> +#define VDCTRL0_VSYNC_PULSE_WIDTH_UNIT	BIT(20)
> +#define VDCTRL0_HALF_LINE		BIT(19)
> +#define VDCTRL0_HALF_LINE_MODE		BIT(18)
>  #define VDCTRL0_SET_VSYNC_PULSE_WIDTH(x) ((x) & 0x3ffff)
>  #define VDCTRL0_GET_VSYNC_PULSE_WIDTH(x) ((x) & 0x3ffff)
>  
>  #define VDCTRL2_SET_HSYNC_PERIOD(x)	((x) & 0x3ffff)
>  #define VDCTRL2_GET_HSYNC_PERIOD(x)	((x) & 0x3ffff)
>  
> -#define VDCTRL3_MUX_SYNC_SIGNALS	(1 << 29)
> -#define VDCTRL3_VSYNC_ONLY		(1 << 28)
> +#define VDCTRL3_MUX_SYNC_SIGNALS	BIT(29)
> +#define VDCTRL3_VSYNC_ONLY		BIT(28)
>  #define SET_HOR_WAIT_CNT(x)		(((x) & 0xfff) << 16)
>  #define GET_HOR_WAIT_CNT(x)		(((x) >> 16) & 0xfff)
>  #define SET_VERT_WAIT_CNT(x)		((x) & 0xffff)
> @@ -80,11 +80,11 @@
>  
>  #define VDCTRL4_SET_DOTCLK_DLY(x)	(((x) & 0x7) << 29) /* v4 only */
>  #define VDCTRL4_GET_DOTCLK_DLY(x)	(((x) >> 29) & 0x7) /* v4 only */
> -#define VDCTRL4_SYNC_SIGNALS_ON		(1 << 18)
> +#define VDCTRL4_SYNC_SIGNALS_ON		BIT(18)
>  #define SET_DOTCLK_H_VALID_DATA_CNT(x)	((x) & 0x3ffff)
>  
> -#define DEBUG0_HSYNC			(1 < 26)
> -#define DEBUG0_VSYNC			(1 < 25)
> +#define DEBUG0_HSYNC			BIT(26)
> +#define DEBUG0_VSYNC			BIT(25)
>  
>  #define MXSFB_MIN_XRES			120
>  #define MXSFB_MIN_YRES			120
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
