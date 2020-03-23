Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE51E1901BD
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 462F86E419;
	Mon, 23 Mar 2020 23:15:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381C36E419
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:15:32 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id E60515C061C;
 Tue, 24 Mar 2020 00:15:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585005326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+ynsCAKGXkl0x977O7/WYW8NIVrPjWYEsN1pukzECRk=;
 b=p2lxh+iQkhC3r6irBJ6ZGInGvDdKpoR+vDEZ43nL0hyNyxXX6NYckxngFKuwO48IBTYy2D
 SARDFtkiOk/nspH3ZnEoqDJaFyOuZeo5CARNkSWJGbh2SzNf8AHSZJvEgcWf7Atu0Y9EGl
 5ueoC2WYIDv2ehDUwWgBTp+vFcu0Emo=
MIME-Version: 1.0
Date: Tue, 24 Mar 2020 00:15:26 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 15/21] drm: mxsfb: Remove mxsfb_devdata unused fields
In-Reply-To: <20200309195216.31042-16-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-16-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <3b6d149a2d10c7518a97c789983a5cca@agner.ch>
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

On 2020-03-09 20:52, Laurent Pinchart wrote:
> The debug0 and ipversion fields of the mxsfb_devdata structure are
> unused. Remove them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c | 4 ----
>  drivers/gpu/drm/mxsfb/mxsfb_drv.h | 2 --
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> index 72b4f6a947a4..7c9a041f5f6d 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
> @@ -42,19 +42,15 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
>  		.transfer_count	= LCDC_V3_TRANSFER_COUNT,
>  		.cur_buf	= LCDC_V3_CUR_BUF,
>  		.next_buf	= LCDC_V3_NEXT_BUF,
> -		.debug0		= LCDC_V3_DEBUG0,
>  		.hs_wdth_mask	= 0xff,
>  		.hs_wdth_shift	= 24,
> -		.ipversion	= 3,
>  	},
>  	[MXSFB_V4] = {
>  		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
>  		.cur_buf	= LCDC_V4_CUR_BUF,
>  		.next_buf	= LCDC_V4_NEXT_BUF,
> -		.debug0		= LCDC_V4_DEBUG0,
>  		.hs_wdth_mask	= 0x3fff,
>  		.hs_wdth_shift	= 18,
> -		.ipversion	= 4,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> index edd766ad254f..607a6a5e6be3 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
> @@ -19,10 +19,8 @@ struct mxsfb_devdata {
>  	unsigned int	 transfer_count;
>  	unsigned int	 cur_buf;
>  	unsigned int	 next_buf;
> -	unsigned int	 debug0;
>  	unsigned int	 hs_wdth_mask;
>  	unsigned int	 hs_wdth_shift;
> -	unsigned int	 ipversion;
>  };
>  
>  struct mxsfb_drm_private {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
