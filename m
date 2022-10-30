Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CD5612CF0
	for <lists+dri-devel@lfdr.de>; Sun, 30 Oct 2022 22:05:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2DC10E060;
	Sun, 30 Oct 2022 21:05:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 964 seconds by postgrey-1.36 at gabe;
 Sun, 30 Oct 2022 21:05:01 UTC
Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com
 (mailrelay2-2.pub.mailoutpod1-cph3.one.com [46.30.212.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4123D10E03D
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Oct 2022 21:05:01 +0000 (UTC)
Received: from mailrelay1.pub.mailoutpod2-cph3.one.com
 (mailrelay1.pub.mailoutpod2-cph3.one.com [104.37.34.6])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPS
 id 44c0e54b-5894-11ed-a925-d0431ea8a290;
 Sun, 30 Oct 2022 20:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=57sc1zEaPoN7h4A46eYO7m7OBIbwdsJSNErw2oMh2i8=;
 b=ExNOMhkVFJztTvZcxnvH3h4fqJbsQkgg+bLEfOuaDMvE1gWzf+x03ZVf9gCp8uwhCeU2x+q6nekWi
 UMfVN39ir3tiH2OPaGvcsXRDQvpmQKHK3UuTp6v916Hd3c9eu8BAnGCKfFv5bGKDF/P9k9eqMzKaz3
 YyNUCgEBiiyaZe6hupo2tczx7/snZxgERFISe14rqGEF3MLSehcW6uFvCTvTCzATO0Oq2qKub0zu+2
 134gYtd6AYTmNhA/UKp4zhT678Ud601D0/AsB+uxyLjz/ajF3SKPi0XNAMhnCQdcLYMKT3t0b+QQDh
 m5xZYu4P+05A45nJ0qf/BSXWMKcZ1Sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=57sc1zEaPoN7h4A46eYO7m7OBIbwdsJSNErw2oMh2i8=;
 b=tZrknHN/AT+yPRxITfnWcQoHnGW6VCifdzIareCpE0Xor8DK2nixpgY3yVhJk7aPL6M6bl/Bkor4y
 vmrkmxMDQ==
X-HalOne-ID: 43a73db0-5894-11ed-bedf-1b2345786432
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 43a73db0-5894-11ed-bedf-1b2345786432;
 Sun, 30 Oct 2022 20:48:54 +0000 (UTC)
Date: Sun, 30 Oct 2022 21:48:53 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: antoniospg <antoniospg100@gmail.com>
Subject: Re: [PATCH] drm/nouveau: Adding support to control backlight using
 bl_power for nva3.
Message-ID: <Y17jNddKjZNk59EK@ravnborg.org>
References: <20221029184851.25340-1-antoniospg100@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221029184851.25340-1-antoniospg100@gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, linux-kernel@vger.kernel.org,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Oct 29, 2022 at 03:48:50PM -0300, antoniospg wrote:
> Test plan:
> 
> * Turn off:
> echo 1 > /sys/class/backlight/nv_backlight/bl_power
> 
> * Turn on:
> echo 0 > /sys/class/backlight/nv_backlight/bl_power
> 
> Signed-off-by: antoniospg <antoniospg100@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_backlight.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index a2141d3d9b1d..855d0ce9f7fa 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -263,7 +263,16 @@ nva3_set_intensity(struct backlight_device *bd)
>  	u32 div, val;
>  
>  	div = nvif_rd32(device, NV50_PDISP_SOR_PWM_DIV(or));
> -	val = (bd->props.brightness * div) / 100;
> +
> +	switch (bd->props.power) {
> +	case FB_BLANK_UNBLANK:
> +		val = (bd->props.brightness * div) / 100;
> +		break;
> +	default:
> +		val = 0;
> +		break;
> +	}
> +

Consider the following change:

	val = backlight_get_brightness(bd);
	if (val)
		val = (val * dev) / 100;

Then you avoid hard coding the use of FB_BLANK_UNBLANK.

	Sam
