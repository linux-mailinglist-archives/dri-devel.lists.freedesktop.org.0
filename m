Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D04528D3C33
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 18:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F9C10E0A8;
	Wed, 29 May 2024 16:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9AA10E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 16:24:50 +0000 (UTC)
Received: from i53875a0e.versanet.de ([83.135.90.14] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1sCM69-0005AH-Ga; Wed, 29 May 2024 18:24:21 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Andy Yan <andyshrk@163.com>, linux-rockchip@lists.infradead.org,
 Diederik de Haas <didi.debian@cknow.org>, tzimmermann@suse.de,
 maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, s.hauer@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH 0/1] Fix the port mux of VP2
Date: Wed, 29 May 2024 18:24:20 +0200
Message-ID: <2652218.tIAgqjz4sF@diego>
In-Reply-To: <2397969.FhQbyb98Gs@bagend>
References: <20240422101905.32703-1-andyshrk@163.com>
 <171405838036.2897712.4067984796758491640.b4-ty@sntech.de>
 <2397969.FhQbyb98Gs@bagend>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Am Mittwoch, 29. Mai 2024, 17:55:25 CEST schrieb Diederik de Haas:
> On Thursday, 25 April 2024 17:19:58 CEST Heiko Stuebner wrote:
> > On Mon, 22 Apr 2024 18:19:04 +0800, Andy Yan wrote:
> > > From: Andy Yan <andy.yan@rock-chips.com>
> > > 
> > > The port mux bits of VP2 should be defined by
> > > RK3568_OVL_PORT_SET__PORT2_MUX, this maybe a copy and paste error when
> > > this driver first introduced.> 
> > > Hi Heiko:
> > >    Maybe thi is the problem you met when you porting the dsi2 driver.
> > > 
> > 
> > Applied, thanks!
> > 
> > [1/1] drm/rockchip: vop2: Fix the port mux of VP2
> >       commit: 2bdb481bf7a93c22b9fea8daefa2834aab23a70f
> 
> Wasn't this patch supposed to be part of 6.10-rc1?

Looking at the drm-misc tree, the last tag for the drm-misc to drm-main
merge is labeled drm-misc-next-2024-04-25, same day as I applied the
patch.

In theory I think -rc6 is the cutoff for drm-misc changes for mainline,
which would've been the 28th of april, but there might've been simple
hickups preventing that last merge, resulting in the patch missing an
early cutoff.


On the other hand, somehow Torvald's tree actually has this commit [0],
just with a "Notice: this object is not reachable from any branch."
Possibly some drm-merge-mayhem?

All very confusing.

@Thomas, @Marten: do you possible have an idea what might've happened?


Heiko




[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2bdb481bf7a93c22b9fea8daefa2834aab23a70f


