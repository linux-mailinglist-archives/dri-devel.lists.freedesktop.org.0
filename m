Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 879AD3DA979
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 18:53:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EE26EDEF;
	Thu, 29 Jul 2021 16:53:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCB36EDEF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 16:53:37 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 8e371877-f08d-11eb-8d1a-0050568cd888;
 Thu, 29 Jul 2021 16:53:53 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3FCF9194B1F;
 Thu, 29 Jul 2021 18:53:57 +0200 (CEST)
Date: Thu, 29 Jul 2021 18:53:33 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 0/7] drm: Extend COMPILE_TEST support to some ARM drivers
Message-ID: <YQLdDTu4duXXQXAs@ravnborg.org>
References: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728153736.15240-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomba@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-renesas-soc@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Jul 28, 2021 at 06:37:29PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series stems from subsystem-wide changes I wanted to
> compile-test with an ARM64 cross-compiler. My laziness to fire a 32-bit
> ARM build probably resulted in more time being spent writing these
> patches, but hopefully they'll turn out to be useful for more people :-)
> 
> Patches 1/7 and 2/7 are fixes for compilation warnings on 64-bit
> platforms in the omapdrm and sti-drm drivers. They are a dependency for
> the Kconfig changes that follow to avoid introducing build warnings, but
> could also be merged before.
> 
> Patches 3/7 to 7/7 enable compilation of the imx-dcss, omapdrm, sti-drm,
> tegra-drm and tilcdc drivers on ARM64 with COMPILE_TEST. The patches are
> independent from each other, so they can be picked by their respective
> maintainers.
> 
> We could also extend test compilation to more architecture, but I didn't
> want to remove all dependencies on ARM or ARM64 at this point for fear
> or triggering build warnings that I wouldn't be able to catch locally.
> If there's a consensus that fully relaxing the platform requirement is
> better, I can submit a new version that does so and rely on the 0day bot
> to catch issues.
I have alpha, sparc64, and a few more so we can get pretty good coverage
before it hits -next.
If we enable more build coverage then please address all W=1 warnings
first.

I for once always builds with W=1 these days, and I see more and more
warnings sneaking in again.
So lets try to keep the noise level down.

	Sam
