Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1271450CD30
	for <lists+dri-devel@lfdr.de>; Sat, 23 Apr 2022 21:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BD310E0EA;
	Sat, 23 Apr 2022 19:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A81110E0EA
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Apr 2022 19:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=06AijZy9ZnJm9eX86gDl9WePp03jJpjSpvVu+huUznA=;
 b=lZ+S/qRXGzvH8Im49a7Kv97Sd4mbwx+rtb3w3ohPtYXUc+T+gYN5yhOeDPwB8ijxkeagp+GBdyC/c
 Ngj7TfIAvrfb9zkAtdRCEe1vFoIuUJT16DqP6iTNhsRCNwjIwAhv+Kh1yYdxQYVzCdb/PidgKgzl1L
 /tCXwat9CCAjsbsv6fsp9ziYmQelZq0HoXHv9wVcWR578TLh7yFiz/ADPl1zTJ7bIIYk+jOCuFLhyR
 IR2JWuEdEuKicG15hdzopkfiZjMGLV7DpbJvRztqXJCH9RMKEkayYmym1Dlak5FaA3Ot1ui3Gegaz4
 fP2tHaCO+xue762ylulrgd+q/G9/PsA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=06AijZy9ZnJm9eX86gDl9WePp03jJpjSpvVu+huUznA=;
 b=r+F/um8Bax0qhUk/jyx4Zx9JE/t3QJ47GjOCoEPMcSm1+nQgc2VUWa0yGs/QJUEU5HAEj9FiwvUCb
 4/EsrykBg==
X-HalOne-Cookie: 1f17596066726529196537e9324caf2c518afe3e
X-HalOne-ID: 84a68cc2-c33b-11ec-a907-d0431ea8a290
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 84a68cc2-c33b-11ec-a907-d0431ea8a290;
 Sat, 23 Apr 2022 19:28:14 +0000 (UTC)
Date: Sat, 23 Apr 2022 21:28:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm/panel: simple: Add missing bus flags for Innolux
 G070Y2-L01
Message-ID: <YmRTTEAMizzDuBqM@ravnborg.org>
References: <20220406093627.18011-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406093627.18011-1-marex@denx.de>
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
Cc: dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Christoph Fritz <chf.fritz@googlemail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 11:36:27AM +0200, Marek Vasut wrote:
> The DE signal is active high on this display, fill in the missing bus_flags.
> This aligns panel_desc with its display_timing .
> 
> Fixes: a5d2ade627dca ("drm/panel: simple: Add support for Innolux G070Y2-L01")
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Christoph Fritz <chf.fritz@googlemail.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 65c2a3000e471..18fccb0d47382 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2149,6 +2149,7 @@ static const struct panel_desc innolux_g070y2_l01 = {
>  		.unprepare = 800,
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
> +	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
>  	.connector_type = DRM_MODE_CONNECTOR_LVDS,
>  };
>  
> -- 
> 2.35.1
