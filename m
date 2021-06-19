Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B13ADBAB
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jun 2021 22:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10EC6E03B;
	Sat, 19 Jun 2021 20:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 722 seconds by postgrey-1.36 at gabe;
 Sat, 19 Jun 2021 20:28:20 UTC
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481966E03B
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jun 2021 20:28:20 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id eababd90-d13c-11eb-960d-0050568c148b;
 Sat, 19 Jun 2021 20:28:33 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 38F94194B13;
 Sat, 19 Jun 2021 22:28:21 +0200 (CEST)
Date: Sat, 19 Jun 2021 22:28:15 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] drm:atmel: Enable the crtc vblank prior to crtc usage.
Message-ID: <20210619202815.GB533354@ravnborg.org>
References: <20210602160846.5013-1-dan.sneddon@microchip.com>
 <72ac51ca-a7df-c6ce-ba10-5dd26369e137@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72ac51ca-a7df-c6ce-ba10-5dd26369e137@microchip.com>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dan Sneddon <dan.sneddon@microchip.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas/Dan,

On Fri, Jun 18, 2021 at 10:05:11AM +0200, Nicolas Ferre wrote:
> Hi Daniel, Sam,
> 
> On 02/06/2021 at 18:08, Dan Sneddon wrote:
> > 'commit eec44d44a3d2 ("drm/atmel: Use drm_atomic_helper_commit")'
> > removed the home-grown handling of atomic commits and exposed an issue
> > in the crtc atomic commit handling where vblank is expected to be
> > enabled but hasn't yet, causing kernel warnings during boot.  This patch
> > cleans up the crtc vblank handling thus removing the warning on boot.
> > 
> > Fixes: eec44d44a3d2 ("drm/atmel: Use drm_atomic_helper_commit")
> > 
> > Signed-off-by: Dan Sneddon <dan.sneddon@microchip.com>
> 
> Is this fix need more input from us, is there something missing (aka ping)?

Sorry for the loong response time.
I have been off-line for a while. Moved to a new house where some
renovation was needed so it got priority (and still does).

Thanks for the path - patch applied to drm-misc-fixes now.

	Sam
