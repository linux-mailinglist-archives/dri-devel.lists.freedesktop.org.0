Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9A19007A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 22:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F96489AEB;
	Mon, 23 Mar 2020 21:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA06289AEB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 21:36:23 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 5C12C5C1500;
 Mon, 23 Mar 2020 22:36:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1584999382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ExCGyaKhB/i+YK41+3nzH9UKwilONmLSBnevEy+t8z4=;
 b=XB7QsdLvi93iH/18499HGygQNSMitR1HF7qKcyiLE99iNRgc/FhQ7sQyGDI7Ycg64gU/AH
 P4HAhevkrbcpjVQM+4jNKZIeUtNqM9CJsjpsuG9lDo0Ccl2ZSIHREOlKydAPXJHZyPqzR5
 pKYVq5GPkSUlskCk3Y6mQzE56xR1tek=
MIME-Version: 1.0
Date: Mon, 23 Mar 2020 22:36:22 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 04/21] drm: mxsfb: Remove unused macros from mxsfb_regs.h
In-Reply-To: <20200309195216.31042-5-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-5-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <b1d503e726c583038d54b6f4ba987dd9@agner.ch>
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
> mxsfb_regs.h defines macros related to register bits. Some of them are
> not used and don't clearly map to any particular register, so their
> purpose isn't known. Remove them.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_regs.h | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> index 713d8f830135..78e6cb754712 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
> @@ -91,17 +91,9 @@
>  #define MXSFB_MAX_XRES			0xffff
>  #define MXSFB_MAX_YRES			0xffff
>  
> -#define RED 0
> -#define GREEN 1
> -#define BLUE 2
> -#define TRANSP 3
> -
>  #define STMLCDIF_8BIT  1 /* pixel data bus to the display is of 8 bit width */
>  #define STMLCDIF_16BIT 0 /* pixel data bus to the display is of 16 bit width */
>  #define STMLCDIF_18BIT 2 /* pixel data bus to the display is of 18 bit width */
>  #define STMLCDIF_24BIT 3 /* pixel data bus to the display is of 24 bit width */
>  
> -#define MXSFB_SYNC_DATA_ENABLE_HIGH_ACT	(1 << 6)
> -#define MXSFB_SYNC_DOTCLK_FALLING_ACT	(1 << 7) /* negative edge sampling */
> -
>  #endif /* __MXSFB_REGS_H__ */
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
