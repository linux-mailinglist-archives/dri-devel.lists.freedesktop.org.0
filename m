Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4520669B84
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B2110EA16;
	Fri, 13 Jan 2023 15:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755A310EA18
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 15:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=e8hzZHTdOaUXHevlKXZ3IT0ts6bvp7PdrlX7lQ0YIh4=;
 b=rsdQX1vUTt7C5uZ1dnwUQCIR497urrZ1wGmOJOBcQ+1isLc3puCFhp/AdvUHwASFBHMwY0nCYi8wq
 LngHlFI0dSdGYKrp1JpRCDMjc3GkI5GCWtmxfwqoWdpJRIFakt18ROrn4taVEzsWAekqjT43HPOPqi
 MixtxBZNy8BvU/n3uNa+u4OSTclF5i/rQ36p6M1WeUIPcgI+0JDclU/jDDG8FkOFEakQ30sMlgpTZB
 VluQKswjxJBv9K1O59jFch3MJxpW3DAXYAwyn6/ubZ6UZm7zGq4Y4iE6DC84n/ROfH5/rtlOUcx11R
 VsGGQRCPL1+iMstUbIV/Jg6e4Oo9XPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=e8hzZHTdOaUXHevlKXZ3IT0ts6bvp7PdrlX7lQ0YIh4=;
 b=0OcP8BL1SYnQM6RmYxWEKWocIbKRz39fejWquqZmXYzsbjUrdXzNSgJ0oCkMepODXsv7DKpOKFxuS
 EN1BqJhCw==
X-HalOne-ID: b02dc733-9354-11ed-b0c0-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id b02dc733-9354-11ed-b0c0-cde5ad41a1dd;
 Fri, 13 Jan 2023 15:12:28 +0000 (UTC)
Date: Fri, 13 Jan 2023 16:12:27 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 05/10] drm/panel: Do not include <linux/fb.h>
Message-ID: <Y8F021QdBYD9IEvD@ravnborg.org>
References: <20230111130206.29974-1-tzimmermann@suse.de>
 <20230111130206.29974-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111130206.29974-6-tzimmermann@suse.de>
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
Cc: f.fainelli@gmail.com, amd-gfx@lists.freedesktop.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 james.qian.wang@arm.com, alexander.deucher@amd.com,
 bcm-kernel-feedback-list@broadcom.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 02:02:01PM +0100, Thomas Zimmermann wrote:
> Remove unnecessary include statements for <linux/fb.h>. No functional
> changes. Include <linux/of.h> where the driver got the header file via
> <linux/fb.h>.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c         | 1 -
>  drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 1 -
>  drivers/gpu/drm/panel/panel-ronbo-rb070d30.c          | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index cbb68caa36f2..1ec696adf9de 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -7,7 +7,6 @@
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
> -#include <linux/fb.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> index 79f852465a84..35d568da342f 100644
> --- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> +++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
> @@ -43,7 +43,6 @@
>  
>  #include <linux/delay.h>
>  #include <linux/err.h>
> -#include <linux/fb.h>
>  #include <linux/i2c.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> index 866d1bf5530e..2ef5ea5eaeeb 100644
> --- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> +++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
> @@ -11,7 +11,6 @@
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
> -#include <linux/fb.h>
>  #include <linux/kernel.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> -- 
> 2.39.0
