Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7D6168108
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 16:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711E06F473;
	Fri, 21 Feb 2020 15:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3F66E35F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 15:01:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2005)
 id 3258468BFE; Fri, 21 Feb 2020 16:01:18 +0100 (CET)
Date: Fri, 21 Feb 2020 16:01:17 +0100
From: Torsten Duwe <duwe@lst.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND2][PATCH] drm/bridge: analogix-anx6345: Fix drm_dp_link
 helper removal
Message-ID: <20200221150117.GA6928@lst.de>
References: <20200221140455.8713068BFE@verein.lst.de>
 <b30435c7-95c5-e21e-ea05-cd3ada20d150@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b30435c7-95c5-e21e-ea05-cd3ada20d150@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 03:39:32PM +0100, Thomas Zimmermann wrote:
> Hi Torsten
> 
> Am 21.02.20 um 15:04 schrieb Torsten Duwe:
> > drm_dp_link_rate_to_bw_code and ...bw_code_to_link_rate simply divide by
> > and multiply with 27000, respectively. Avoid an overflow in the u8 dpcd[0]
> > and the multiply+divide alltogether.
> > 
> > fixes: e1cff82c1097bda2478 ("fix anx6345 compilation for v5.5")
> 
> You have to create the fixes tag and related cc tags with 'dim fixes',
> available at [1]. For this patch, the output is
> 
> Fixes: e1cff82c1097 ("drm/bridge: fix anx6345 compilation for v5.5")
> Cc: Torsten Duwe <duwe@suse.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Torsten Duwe <duwe@lst.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Icenowy Zheng <icenowy@aosc.io>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>

Ah, neat.

> > Signed-off-by: Torsten Duwe <duwe@suse.de>
> 
> You signed off with your SUSE email address, but sent the mail from
> lst.de. I don't know if it's strictly not allowed, but that's at least
> confusing to the tools.

From my understanding, it is legally correct. The work is owned by Suse,
so I have to sign off as an employee, but I'm subscribed with the LST
address, and I'd also like to see all replies there.

> [1] https://gitlab.freedesktop.org/drm/maintainer-tools/

I'll send an appropriate v2 once I get a review for it.

Thanks!

	Torsten



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
