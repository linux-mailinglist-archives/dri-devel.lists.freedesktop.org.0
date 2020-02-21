Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFA6168121
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 16:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABEB6F472;
	Fri, 21 Feb 2020 15:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCCB6F472
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 15:05:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5114E563;
 Fri, 21 Feb 2020 16:05:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582297538;
 bh=+PNfg4uEi08dmlNNvtGKnwrRV4kPZIDZ1TGvGbACPug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wg9/Uy3u8ceD8NzGdv6JVmxnbWJTbjKODlEKfeJd3QrKb/r6JGJvHijgSbNp4OIPa
 ruuf7fBXDd0sMFZ9JE+UPPnnpyJZM7WsT7fBin1/MsPR7EfwZesD++03YcbYI7Uq+M
 zApSmBZLNAAqJM+bEmGIfXH3DljXscmENRrapfDI=
Date: Fri, 21 Feb 2020 17:05:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [RESEND2][PATCH] drm/bridge: analogix-anx6345: Fix drm_dp_link
 helper removal
Message-ID: <20200221150518.GK4955@pendragon.ideasonboard.com>
References: <20200221140455.8713068BFE@verein.lst.de>
 <b30435c7-95c5-e21e-ea05-cd3ada20d150@suse.de>
 <20200221150117.GA6928@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221150117.GA6928@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime@cerno.tech>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Torsten,

On Fri, Feb 21, 2020 at 04:01:17PM +0100, Torsten Duwe wrote:
> On Fri, Feb 21, 2020 at 03:39:32PM +0100, Thomas Zimmermann wrote:
> > Am 21.02.20 um 15:04 schrieb Torsten Duwe:
> > > drm_dp_link_rate_to_bw_code and ...bw_code_to_link_rate simply divide by
> > > and multiply with 27000, respectively. Avoid an overflow in the u8 dpcd[0]
> > > and the multiply+divide alltogether.
> > > 
> > > fixes: e1cff82c1097bda2478 ("fix anx6345 compilation for v5.5")
> > 
> > You have to create the fixes tag and related cc tags with 'dim fixes',
> > available at [1]. For this patch, the output is
> > 
> > Fixes: e1cff82c1097 ("drm/bridge: fix anx6345 compilation for v5.5")
> > Cc: Torsten Duwe <duwe@suse.de>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Cc: Torsten Duwe <duwe@lst.de>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Icenowy Zheng <icenowy@aosc.io>
> > Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> Ah, neat.
> 
> > > Signed-off-by: Torsten Duwe <duwe@suse.de>
> > 
> > You signed off with your SUSE email address, but sent the mail from
> > lst.de. I don't know if it's strictly not allowed, but that's at least
> > confusing to the tools.
> 
> From my understanding, it is legally correct. The work is owned by Suse,
> so I have to sign off as an employee, but I'm subscribed with the LST
> address, and I'd also like to see all replies there.

That's fine, but then the mail body should start with a From: line that
matches the address used in Signed-off-by. git-send-email should
generate that automatically.

> > [1] https://gitlab.freedesktop.org/drm/maintainer-tools/
> 
> I'll send an appropriate v2 once I get a review for it.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
