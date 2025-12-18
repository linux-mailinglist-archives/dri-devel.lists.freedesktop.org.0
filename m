Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BD8CCCBFE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:26:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A6D10EA5B;
	Thu, 18 Dec 2025 16:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kemnade.info header.i=@kemnade.info header.b="mboMVR0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2216 seconds by postgrey-1.36 at gabe;
 Thu, 18 Dec 2025 16:25:56 UTC
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E2810EA5B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 16:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=p6SJYnp842vCkHQu4i1e9JURGgkIZOc40Ucg7D58Umw=; b=mboMVR0clmVwmOkik7DJ/d1LVk
 GKJTXr137XbyxnXLQy/exMN+xbuxmyL0eErPsCBvcU1/yNaZm8yuJXMN2TnBUjXU692kIrag3X5HN
 dOoxnwA2JdeDW3ZYbUD7ln7d0b764ixHN+w11j8NrtY+sfOEZsVS8DOgcLuu6iyF81By+Nwk3oSMW
 jXOHvbHZHtu66FqVsDPCKCQbQ4g5dEI0K+1rASggpmwLd4u+qWD7BYWQrPsYiS52kUkv1TFv6FgAC
 QRhkKNcK1sUAAb7oO7PoXDCDU+KJiCVRGvIHO3foOFZmvUQZ/aIS2nTvPbmJ29hqkVyquVhreRqSI
 xlLsk5mw==;
Date: Thu, 18 Dec 2025 16:46:20 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Markus Schneider-Pargmann" <msp@baylibre.com>,
 "Bajjuri Praneeth" <praneeth@ti.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 03/20] drm/tilcdc: Remove simulate_vesa_sync flag
Message-ID: <20251218164620.40c0599d@kemnade.info>
In-Reply-To: <DF0K3BRQKOSI.10X5SMXI1YM60@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-3-f48bac3cd33e@bootlin.com>
 <DF0K3BRQKOSI.10X5SMXI1YM60@bootlin.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Dec 2025 15:20:09 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

[...]
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>  
> 
> Code looks good. Based on your testing, which covered both boards currently
> setting simulate_vesa_sync and boards not setting it:
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> Still it would be good to have this series, and especially this patch,
> tested by someone having access to other TI boards.
> 
Just that I do not mix up anything:

grep tilcdc only gives:

am335x-base0033.dts:		compatible = "ti,tilcdc,slave";
am335x-guardian.dts:		compatible = "ti,tilcdc,panel";
am335x-pdu001.dts:		compatible = "ti,tilcdc,panel";
am335x-pepper.dts:		compatible = "ti,tilcdc,panel";
am335x-sbc-t335.dts:		compatible = "ti,tilcdc,panel";
am335x-sl50.dts:		compatible = "ti,tilcdc,panel";
am33xx-l4.dtsi:				compatible = "ti,am33xx-tilcdc";

so only am33xx affected? And no omap3/4/5. So apparently nothing
I can test.
@Roger: I suspect you have more of these boards than me.

Regards,
Andreas
