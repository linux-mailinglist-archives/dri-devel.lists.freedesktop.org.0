Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CF859B575
	for <lists+dri-devel@lfdr.de>; Sun, 21 Aug 2022 18:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28EB14BD0A;
	Sun, 21 Aug 2022 16:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761358BF97
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Aug 2022 16:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cK2+O3VjoIP+dBHuVJLTFqcdAxz4KQX5VWju7aZI310=; b=Z1EozxXmo9Qb2u1ChE243s0BYB
 Pj0pgGlbPH6MlYUKB01Yz/YJIgGauKbAKX/1LEeEV638+i0xLqyt6UfvHNuNxfhHC4+zx2ML+K76n
 RmL7BP3U23eMyj290TFVdJbQpuBeDEaPKQrpqxxFNC22KfONX0XYH3psnbLxsmAT8GY6LibqIyQLW
 dLhOfhpooHFyjE2diYfifT/djb4VNH3IhtRWanrdEFszrDaN63SR3Q5tf9oD6pq342dtO/7NvDZvZ
 +2UuUBq7bgyVS6+pRfkHBpmQlPNgjETA/Tn3mJH4lBIuMQ3+pVWQ3R3j/BrlSX+d/XjpeO79vjRs2
 d2dJ4I3w==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=59050)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oPnsy-0005ky-4O; Sun, 21 Aug 2022 18:33:16 +0200
Message-ID: <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
Date: Sun, 21 Aug 2022 18:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
To: Maxime Ripard <maxime@cerno.tech>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Maxime Ripard <mripard@kernel.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 29.07.2022 18.34, skrev Maxime Ripard:
> Hi,
> 
> Here's a series aiming at improving the command line named modes support,
> and more importantly how we deal with all the analog TV variants.
> 
> The named modes support were initially introduced to allow to specify the
> analog TV mode to be used.
> 
> However, this was causing multiple issues:
> 
>   * The mode name parsed on the command line was passed directly to the
>     driver, which had to figure out which mode it was suppose to match;
> 
>   * Figuring that out wasn't really easy, since the video= argument or what
>     the userspace might not even have a name in the first place, but
>     instead could have passed a mode with the same timings;
> 
>   * The fallback to matching on the timings was mostly working as long as
>     we were supporting one 525 lines (most likely NSTC) and one 625 lines
>     (PAL), but couldn't differentiate between two modes with the same
>     timings (NTSC vs PAL-M vs NSTC-J for example); 
> 
>   * There was also some overlap with the tv mode property registered by 
>     drm_mode_create_tv_properties(), but named modes weren't interacting
>     with that property at all.
> 
>   * Even though that property was generic, its possible values were
>     specific to each drivers, which made some generic support difficult.
> 
> Thus, I chose to tackle in multiple steps:
> 
>   * A new TV norm property was introduced, with generic values, each driver
>     reporting through a bitmask what standard it supports to the userspace;
> 
>   * This option was added to the command line parsing code to be able to
>     specify it on the kernel command line, and new atomic_check and reset
>     helpers were created to integrate properly into atomic KMS;
> 
>   * The named mode parsing code is now creating a proper display mode for
>     the given named mode, and the TV standard will thus be part of the
>     connector state;
> 
>   * Two drivers were converted and tested for now (vc4 and sun4i), with
>     some backward compatibility code to translate the old TV mode to the
>     new TV mode;
> 
> Unit tests were created along the way. Nouveau, ch7006 and gud are
> currently broken for now since I expect that work to be reworked fairly
> significantly. I'm also not entirely sure about how to migrate GUD to the
> new property.
> 
> Let me know what you think,
> Maxime
> 

I don't know if it's related to this patchset or not, but I do get this:

pi@pi4t:~ $ sudo dmesg -C && sudo modprobe -r vc4 && sudo modprobe vc4
&& dmesg
[  430.066211] Console: switching to colour dummy device 80x30
[  431.294788] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
[  431.295115] vc4-drm gpu: bound fec13000.vec (ops vc4_vec_ops [vc4])
[  431.295467] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
[  431.295804] vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops
[vc4])
[  431.298895] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
[  441.444250] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] flip_done
timed out
[  441.446529] Console: switching to colour frame buffer device 90x30
[  451.684321] vc4-drm gpu: [drm] *ERROR* flip_done timed out
[  451.684347] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] commit wait
timed out
[  461.924255] vc4-drm gpu: [drm] *ERROR* flip_done timed out
[  461.924281] vc4-drm gpu: [drm] *ERROR* [CONNECTOR:45:Composite-1]
commit wait timed out
[  472.164006] vc4-drm gpu: [drm] *ERROR* flip_done timed out
[  472.164031] vc4-drm gpu: [drm] *ERROR* [PLANE:61:plane-1] commit wait
timed out
[  482.403877] vc4-drm gpu: [drm] *ERROR* flip_done timed out
[  482.403903] vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit
[  492.643799] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] flip_done
timed out
[  492.647073] vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device

Noralf.
