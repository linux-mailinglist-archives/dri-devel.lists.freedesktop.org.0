Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0A387AE9C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 19:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65BC910E25B;
	Wed, 13 Mar 2024 18:03:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="tevnMCJk";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="TZO+r5m+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod3-cph3.one.com
 (mailrelay3-1.pub.mailoutpod3-cph3.one.com [46.30.211.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD52E10E7F4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=6PGWeMg8CNoy/+zkkS9L2OPt1xF6lAFCedewPNY1+gY=;
 b=tevnMCJk8m3Q3lHNsK/vsFd2oLyyaME32NEciLoUeFC62HGUXH4g1OqCUCC6bVzRwREk3f/d3M8Z4
 XIKt+Ehv2gkYhwPMDxdWedKZrHVdc2SirJJ+oJZqIocTcLDG/kYW8XaHwfXlRJBVTlC8ZxROp6Gee0
 HLXtwDdwjOw2v5PegqtMzvnrezq8tR3ThfQZHSGPcWKU5YvJeP5Zps70UcFVSJyDaj3lfNiCCJ0qaM
 dCrN0huZ2hN67MNXSb+Isi7ftollrRSn2NitD4/N0BP68deC6aW6Z6wpNdAbj6pReA8wETL6Azhem3
 W67wvtOViZ4hxwa+c22pdEeVup7YAlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=6PGWeMg8CNoy/+zkkS9L2OPt1xF6lAFCedewPNY1+gY=;
 b=TZO+r5m+DD97Bajo9cNaV45NQ+MWPh5byWOV27p3eZWWpbwJ2ah9m2/MBz7lI9UZ+pxMqwI15gqq5
 GbscVlPCg==
X-HalOne-ID: d2e14a62-e163-11ee-a17c-ff813d2dbafc
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id d2e14a62-e163-11ee-a17c-ff813d2dbafc;
 Wed, 13 Mar 2024 18:02:18 +0000 (UTC)
Date: Wed, 13 Mar 2024 19:02:16 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
 deller@gmx.de, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/6] backlight/omap1-bl: Remove unused struct
 omap_backlight_config.set_power
Message-ID: <20240313180216.GD96726@ravnborg.org>
References: <20240313154857.12949-1-tzimmermann@suse.de>
 <20240313154857.12949-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313154857.12949-3-tzimmermann@suse.de>
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

On Wed, Mar 13, 2024 at 04:45:01PM +0100, Thomas Zimmermann wrote:
> The callback set_power in struct omap_backlight_config is not
> implemented anywhere. Remove it from the structure and driver.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/backlight/omap1_bl.c     | 3 ---
>  include/linux/platform_data/omap1_bl.h | 1 -
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/video/backlight/omap1_bl.c b/drivers/video/backlight/omap1_bl.c
> index 69a49384b3de4..84d148f385951 100644
> --- a/drivers/video/backlight/omap1_bl.c
> +++ b/drivers/video/backlight/omap1_bl.c
> @@ -39,9 +39,6 @@ static inline void omapbl_send_enable(int enable)
>  
>  static void omapbl_blank(struct omap_backlight *bl, int mode)
>  {
> -	if (bl->pdata->set_power)
> -		bl->pdata->set_power(bl->dev, mode);
> -
>  	switch (mode) {
>  	case FB_BLANK_NORMAL:
>  	case FB_BLANK_VSYNC_SUSPEND:
> diff --git a/include/linux/platform_data/omap1_bl.h b/include/linux/platform_data/omap1_bl.h
> index 5e8b17d77a5fe..3d0bab31a0a94 100644
> --- a/include/linux/platform_data/omap1_bl.h
> +++ b/include/linux/platform_data/omap1_bl.h
> @@ -6,7 +6,6 @@
>  
>  struct omap_backlight_config {
>  	int default_intensity;
> -	int (*set_power)(struct device *dev, int state);
>  };
>  
>  #endif
> -- 
> 2.44.0
