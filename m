Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D8118871A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5565D6E154;
	Tue, 17 Mar 2020 14:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D02589BFF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 19:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1584385882; bh=FW1eAGDaOwZotXT5BTvXsi+IhkF86WgYclyjbaMj8x0=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=tUMLz8BV7T0c827DnXQtea8vx0HkcPUk4ToUSZaHMUkDk+9csPNi+kqJ8KJVU2vjg
 5mxCNIApW9dNDx1t6jX13OOLMFgskXtNRfdIW7qMODyiG26wqc/yvtGDBkv7AlsSQA
 eUYRwhujgrnht7UefJkn1OgNsJQ8aJw8PnwwT1h0=
Date: Mon, 16 Mar 2020 20:11:22 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 3/5] drm: panel: add Xingbangda XBD599 panel
Message-ID: <20200316191122.yeb5l22ldtt73vx5@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Icenowy Zheng <icenowy@aosc.io>,
 Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@googlegroups.com
References: <20200316133503.144650-1-icenowy@aosc.io>
 <20200316133503.144650-4-icenowy@aosc.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316133503.144650-4-icenowy@aosc.io>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: devicetree@vger.kernel.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Icenowy,

On Mon, Mar 16, 2020 at 09:35:01PM +0800, Icenowy Zheng wrote:
> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI IPS LCD panel made by
> Xingbangda, which is used on PinePhone final assembled phones.
>
> [snip]
>
> +static const struct drm_display_mode xbd599_default_mode = {
> +	.hdisplay    = 720,
> +	.hsync_start = 720 + 40,
> +	.hsync_end   = 720 + 40 + 40,
> +	.htotal	     = 720 + 40 + 40 + 40,
> +	.vdisplay    = 1440,
> +	.vsync_start = 1440 + 18,
> +	.vsync_end   = 1440 + 18 + 10,
> +	.vtotal	     = 1440 + 18 + 10 + 17,
> +	.vrefresh    = 60,

Does the display actually run for you at 60fps? I measured 36.63 FPS with
a DRM app that just does DRM_IOCTL_MODE_ATOMIC update after each
DRM_EVENT_FLIP_COMPLETE event.

thank you and regards,
	o.

> +	.clock	     = 69000,
> +	.flags	     = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +
> +	.width_mm    = 68,
> +	.height_mm   = 136,
> +	.type        = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
