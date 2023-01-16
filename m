Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DE466D035
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 21:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC7F10E4BA;
	Mon, 16 Jan 2023 20:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F21F310E4BA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 20:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=dxZrgiFiSWE0neC/Zn81efMq20upjy192H3IxuR5/u8=;
 b=acpUj4knulQkBKBaY+52P5qMowzl3CqetGOVLg/297AeK+8Ryp/AKK2Xhs78wcpqAWKMYggzJWDzB
 biPi7fjApEW+sEGRVKj43UtyH27cyE30zC5xeKBIWLeDxMvBMaWIQ9C2KNsct8BVV/z5Xi2Z9xmXdN
 iB2Tp6//DgFIal9nwQvjsa5mljq2hOLf4Zl++xLkESSZCEU8Wx7V/M8Yabz6d5rgsJjERIdkci8tJF
 BzJIC9Ass7ItSJBCwTMvAx3dwBffjSnlLBYYHAB6/KYGwz02LqImL0TBBlVYOqzuWH81uTr8k+kGQw
 oF52hXCmjcfEX0rspiuM5UBSj5DoeAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=dxZrgiFiSWE0neC/Zn81efMq20upjy192H3IxuR5/u8=;
 b=R3QeKkvU5DTf1usW/irfIsJev9hjfAQvABn1WhWFZnkOGF2yihtMhXjFJCHCSPYm0dh3TEmBVSzY6
 8ufGRagDA==
X-HalOne-ID: c3e8962f-95dc-11ed-8539-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id c3e8962f-95dc-11ed-8539-7703b0afff57;
 Mon, 16 Jan 2023 20:31:35 +0000 (UTC)
Date: Mon, 16 Jan 2023 21:31:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 18/22] drm/sun4i: Remove unnecessary include statements
 for drm_crtc_helper.h
Message-ID: <Y8W0JnmbyQnObFa+@ravnborg.org>
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <20230116131235.18917-19-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116131235.18917-19-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 02:12:31PM +0100, Thomas Zimmermann wrote:
> Several source files include drm_crtc_helper.h without needing it or
> only to get its transitive include statements; leading to unnecessary
> compile-time dependencies.
> 
> Directly include required headers and drop drm_crtc_helper.h where
> possible.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> index 477cb6985b4d..37dc66332bbd 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
> @@ -8,8 +8,8 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_modeset_helper_vtables.h>

Move one up to maintain sorting.
With that fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>  #include <drm/drm_simple_kms_helper.h>
>  
>  #include "sun8i_dw_hdmi.h"
> -- 
> 2.39.0
