Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0017BB48542
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 09:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA4F10E473;
	Mon,  8 Sep 2025 07:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="JNHa6r+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0279810E473
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 07:31:31 +0000 (UTC)
Received: from francesco-nb
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
 by mail11.truemail.it (Postfix) with ESMTPA id ED16C22915;
 Mon,  8 Sep 2025 09:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1757316688;
 bh=U4EwWMsxDabkSM0GPrxSyxdtohsW4c5vwvEqfUMOq7U=; h=From:To:Subject;
 b=JNHa6r+QQjWSJlRdDj8i9Vk7C/b52jf+ZyKQiE7mHeT56BBT/jEMv6ekUpcwgl/4T
 AlRYqE4iiI4it37hn4VPWJBcAtkhq4VWhLLVLtNzlEhzpBY0JKecnUkDuQqWR2kcxh
 pi4jKvGwIdXwYthk2/UCZbuS0/N1eAAH5hI9OBvQBij6XlJvehNVr6n77Uo4uC+ZUY
 jOTll6BJY4bVuPIfduekld65nxjsX/pFS1t5fvnmbbQpYqWEOvyqJfFE30AsrTANpa
 0GW6/D02wcsxgNoHKCdOWhNrU9kx1h1TUGU2Uuz6kyrbPGV+U02hdJ1vfcCR8SmxKN
 AJLdIBkWGu2Ug==
Date: Mon, 8 Sep 2025 09:31:24 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Vitor Soares <ivitro@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vitor Soares <vitor.soares@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>,
 Jayesh Choudhary <j-choudhary@ti.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3] drm/bridge: cdns-dsi: Replace deprecated
 UNIVERSAL_DEV_PM_OPS()
Message-ID: <20250908073124.GA12200@francesco-nb>
References: <20250512083215.436149-1-ivitro@gmail.com>
 <546ef388-299b-4d97-8633-9508fab4475a@ideasonboard.com>
 <20250822070401.GA15925@francesco-nb>
 <09441f4b-bdd1-46c9-876e-2ff503dd1160@ideasonboard.com>
 <20250822090038.GA28190@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822090038.GA28190@francesco-nb>
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

Hello all,

On Fri, Aug 22, 2025 at 11:00:38AM +0200, Francesco Dolcini wrote:
> On Fri, Aug 22, 2025 at 11:46:40AM +0300, Tomi Valkeinen wrote:
> > On 22/08/2025 10:04, Francesco Dolcini wrote:
> > > On Thu, May 22, 2025 at 12:09:08PM +0300, Tomi Valkeinen wrote:
> > >> On 12/05/2025 11:32, Vitor Soares wrote:
> > >>> From: Vitor Soares <vitor.soares@toradex.com>
> > >>>
> > >>> The deprecated UNIVERSAL_DEV_PM_OPS() macro uses the provided callbacks
> > >>> for both runtime PM and system sleep. This causes the DSI clocks to be
> > >>> disabled twice: once during runtime suspend and again during system
> > >>> suspend, resulting in a WARN message from the clock framework when
> > >>> attempting to disable already-disabled clocks.
> > >>>
> > >>> [   84.384540] clk:231:5 already disabled
> > >>> [   84.388314] WARNING: CPU: 2 PID: 531 at /drivers/clk/clk.c:1181 clk_core_disable+0xa4/0xac
> > >>> ...
> > >>> [   84.579183] Call trace:
> > >>> [   84.581624]  clk_core_disable+0xa4/0xac
> > >>> [   84.585457]  clk_disable+0x30/0x4c
> > >>> [   84.588857]  cdns_dsi_suspend+0x20/0x58 [cdns_dsi]
> > >>> [   84.593651]  pm_generic_suspend+0x2c/0x44
> > >>> [   84.597661]  ti_sci_pd_suspend+0xbc/0x15c
> > >>> [   84.601670]  dpm_run_callback+0x8c/0x14c
> > >>> [   84.605588]  __device_suspend+0x1a0/0x56c
> > >>> [   84.609594]  dpm_suspend+0x17c/0x21c
> > >>> [   84.613165]  dpm_suspend_start+0xa0/0xa8
> > >>> [   84.617083]  suspend_devices_and_enter+0x12c/0x634
> > >>> [   84.621872]  pm_suspend+0x1fc/0x368
> > >>>
> > >>> To address this issue, replace UNIVERSAL_DEV_PM_OPS() with
> > >>> SET_RUNTIME_PM_OPS(), enabling suspend/resume handling through the
> > >>> _enable()/_disable() hooks managed by the DRM framework for both
> > >>> runtime and system-wide PM.
> > >>>
> > >>> Cc: <stable@vger.kernel.org> # 6.1.x
> > >>> Fixes: e19233955d9e ("drm/bridge: Add Cadence DSI driver")
> > >>> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> > > 
> > > ping on this, Tomi, maybe you can pick this one or is there any
> > > concern ?
> > 
> > No concern from my side, but I'm not a bridge or cdns-dsi maintainer, so
> > I don't pick any of these to drm-misc by default.
> > 
> > Aaand now as I wrote that, I realized I just some time ago pushed the
> > cdns-dsi series ("drm/bridge: cdns-dsi: Make it work a bit better") to
> 
> Yep, that's the reason I assumed you could also pick this one. Any
> DRM bridge maintainer can help here?

Another ping here ... I am not sure on how to move this forward.

Andrzej? Neil? Robert?

Considering that this is a bug fix, the patch is reviewed since long and
it was sent 4 months ago would be fine that you merge it Tomi?

Francesco

