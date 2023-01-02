Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1665B6C4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 19:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB23F10E377;
	Mon,  2 Jan 2023 18:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 550 seconds by postgrey-1.36 at gabe;
 Mon, 02 Jan 2023 18:55:52 UTC
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65D810E377
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 18:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=eok7KdVmRroYLcj11WsR1BUweIYjrGfaYUVRrkhjEh0=;
 b=E24yelP6YAbfdNiY9s5kUu+HP1wnvioknVmEUehrINnAlkig+baXf+p+PVVxSb9lQOzJU27HJ3gGP
 CCAdFlg1uWRbxYgdAZADG/HBQXzrPBDRkfTbY7JogD8eJLJzhGToX5/fnOcJFxm8PK7lVLNsYvuJLX
 OmHETXsmHJkj3bhFC7UW3kbZeG95iAo770M6NPV3t1yi89AQLRz8Cw9DrCfl3MnEhRiGMm1nBowqqe
 Ztt4htoyPII9eiXecer9bs/M0lXlRLkNDhsaVQw7YICXu3RZtIWnUq02/9dDZjM4wUDw++c838rq/i
 BIeCkGR5MTfsnV7dnDsUXixmEa2agwg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=eok7KdVmRroYLcj11WsR1BUweIYjrGfaYUVRrkhjEh0=;
 b=FB0tdbVcETaDgu93IzVwW3j1EmxsDe0optb4Y9yxtgwAWwgY3usnS2BvW5m+Eu8q2ILnTr7lp6nod
 6oWZWTHAw==
X-HalOne-ID: 1268be43-8acf-11ed-820b-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 1268be43-8acf-11ed-820b-7703b0afff57;
 Mon, 02 Jan 2023 18:55:51 +0000 (UTC)
Date: Mon, 2 Jan 2023 19:55:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 07/14] drm/panel-novatek-nt35950: Drop custom DSI write
 macro
Message-ID: <Y7Motc++yaYLLned@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <20221228014757.3170486-8-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228014757.3170486-8-javierm@redhat.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 28, 2022 at 02:47:50AM +0100, Javier Martinez Canillas wrote:
> There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
> that instead and delete the custom DSI write macro defined in the driver.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
>  drivers/gpu/drm/panel/panel-novatek-nt35950.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> index 3a844917da07..abf752b36a52 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
> @@ -89,14 +89,6 @@ static inline struct nt35950 *to_nt35950(struct drm_panel *panel)
>  	return container_of(panel, struct nt35950, panel);
>  }
>  
> -#define dsi_dcs_write_seq(dsi, seq...) do {				\
> -		static const u8 d[] = { seq };				\
> -		int ret;						\
> -		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
> -		if (ret < 0)						\
> -			return ret;					\
> -	} while (0)
> -
>  static void nt35950_reset(struct nt35950 *nt)
>  {
>  	gpiod_set_value_cansleep(nt->reset_gpio, 1);
> @@ -338,7 +330,7 @@ static int nt35950_on(struct nt35950 *nt)
>  		return ret;
>  
>  	/* Unknown command */
> -	dsi_dcs_write_seq(dsi, 0xd4, 0x88, 0x88);
> +	mipi_dsi_dcs_write_seq(dsi, 0xd4, 0x88, 0x88);
>  
>  	/* CMD2 Page 7 */
>  	ret = nt35950_set_cmd2_page(nt, 7);
> @@ -346,10 +338,10 @@ static int nt35950_on(struct nt35950 *nt)
>  		return ret;
>  
>  	/* Enable SubPixel Rendering */
> -	dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_EN, 0x01);
> +	mipi_dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_EN, 0x01);
>  
>  	/* SPR Mode: YYG Rainbow-RGB */
> -	dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_MODE, MCS_SPR_MODE_YYG_RAINBOW_RGB);
> +	mipi_dsi_dcs_write_seq(dsi, MCS_PARAM_SPR_MODE, MCS_SPR_MODE_YYG_RAINBOW_RGB);
>  
>  	/* CMD3 */
>  	ret = nt35950_inject_black_image(nt);
> -- 
> 2.38.1
