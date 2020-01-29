Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D46314D7B2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 09:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94AFB6F8F6;
	Thu, 30 Jan 2020 08:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C430B6F5DC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 16:43:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E8A8073A;
 Wed, 29 Jan 2020 11:43:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 29 Jan 2020 11:43:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=wVzq7A1mRlnA44nVMIvtmOwiqIc
 +jpFRZC1MsfkyksU=; b=VthOtP0DvyThBwtvX6HaFcbEMTcSArV4Azqiv8KpPlD
 50QKi/8mlb2CCFnvsKBl1sLQYzejzFwOzg53M+fo3tndBhFTG58xStEyKTu5FCQH
 mrP+vFew0q+304HhwRf0hZaS9IXsnKVsMnEkg+eslmhGPeaVvL7wqq97VYtBHXmI
 KIfDEuglk2ZvNRcNnwynNy/NqfNgnheN5TnuZpOM87ZUvQqZo1irT+suVx/d+t0i
 N+FxgG7oOmHW4cwAFub2wg+GNxf/2gzKrOGPvcaLzT1X7Iq41LimQJeYz8m6ab2S
 iQBARgG9hJUbfIgdstm7Z06X+CxVGUbSafW4dHCgVdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wVzq7A
 1mRlnA44nVMIvtmOwiqIc+jpFRZC1MsfkyksU=; b=qqytq1Yf31pUWzGdkKoti4
 Ov3jOUxIbpFlDCoJapv/9+GsHth0RMKmc34TB1zE7RjKgDm/7LU4puM630p0rC+R
 fZqoXn+0hZvktfbhzDeYJUx3Pm4NdiBkXzQjI7UVQZEgzbytALwfyseOxZ4+zRkz
 5PwdhI56hqtwD/qh9kXtSCjJTc8vr9L1a3BEgKltoKa6THTNijP2kPDV9uMIe5NQ
 rJUt6RwxGeamRrJZaKDfPZDY8pwZ2S34YUoeGhLJgqddlcuAfhDUglC2CjMtymRZ
 WmQXUOjbUiSBtSBwcv+HqxyQ0KW9AYf/32c+fcCe4gv+286by/b9XkcmLzn6KXoQ
 ==
X-ME-Sender: <xms:K7YxXpQ7Fze2-w6LiBtLU5-rg0hFUh_yVGdqBeHSCuUHfvTHxe5ItQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:K7YxXu0G2pW7Q-Z_7L5EJQ3Q_0-F2HSRt6rp7LaCQhz4QDAXlnBWzw>
 <xmx:K7YxXqLW-PGmXsZzP9x85jXy1zifo0OFbY9yelJS6McPDnZfkm_B9g>
 <xmx:K7YxXv9LjfUa8O82HPWK5BxXQzDbVlBIdpO3RSUDz2xJ1mv6XzZyrQ>
 <xmx:LLYxXtRhIUP1D-BmKu7jflKrRsEL2xZ8SJ-oVgX_bjJt6KBChsgFJg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C10B3060B27;
 Wed, 29 Jan 2020 11:43:23 -0500 (EST)
Date: Wed, 29 Jan 2020 17:43:21 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Mavrodiev <stefan@olimex.com>
Subject: Re: [PATCH v3 1/1] drm: sun4i: hdmi: Add support for sun4i HDMI
 encoder audio
Message-ID: <20200129164321.34mornbi3xvx5dys@gilmour.lan>
References: <20200128140642.8404-1-stefan@olimex.com>
 <20200128140642.8404-2-stefan@olimex.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128140642.8404-2-stefan@olimex.com>
X-Mailman-Approved-At: Thu, 30 Jan 2020 08:32:45 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-sunxi@googlegroups.com,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Chen-Yu Tsai <wens@csie.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jan 28, 2020 at 04:06:42PM +0200, Stefan Mavrodiev wrote:
> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> index 68d4644ac2dc..4cd35c97c503 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
> @@ -23,6 +23,8 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>
> +#include <sound/soc.h>
> +
>  #include "sun4i_backend.h"
>  #include "sun4i_crtc.h"
>  #include "sun4i_drv.h"
> @@ -87,6 +89,10 @@ static void sun4i_hdmi_disable(struct drm_encoder *encoder)
>
>  	DRM_DEBUG_DRIVER("Disabling the HDMI Output\n");
>
> +#ifdef CONFIG_DRM_SUN4I_HDMI_AUDIO
> +	sun4i_hdmi_audio_destroy(hdmi);
> +#endif
> +
>  	val = readl(hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
>  	val &= ~SUN4I_HDMI_VID_CTRL_ENABLE;
>  	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
> @@ -114,6 +120,11 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder)
>  		val |= SUN4I_HDMI_VID_CTRL_HDMI_MODE;
>
>  	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
> +
> +#ifdef CONFIG_DRM_SUN4I_HDMI_AUDIO
> +	if (hdmi->hdmi_audio && sun4i_hdmi_audio_create(hdmi))
> +		DRM_ERROR("Couldn't create the HDMI audio adapter\n");
> +#endif

I really don't think we should be creating / removing the audio card
at enable / disable time.

To fix the drvdata pointer, you just need to use the card pointer in
the unbind, and that's it.

Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
