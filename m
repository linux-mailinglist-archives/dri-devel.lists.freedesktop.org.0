Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FE4161DC6
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2020 00:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D68F6E10B;
	Mon, 17 Feb 2020 23:17:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9386E10B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 23:17:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 208A21220;
 Tue, 18 Feb 2020 00:17:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1581981432;
 bh=c/zDZJXqj9D9dpBbdJliOpyIVKF3pTMm/JyOXyrqFHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZpyI+I764RCZOjYb16l2mjG6SDkED5U7ORA/i61owe4kIgaJbmUbPbjc0A3tMxiEu
 cO5SrRotzN0hEGA6PsD3m0YtvlmucHcLVigJ2gTQa1fOauYPAmsw0PayuSDp4bbzUo
 /XwMXkKYID/+qkidjxkpOtASsmQvpwThv0EmFaM8=
Date: Tue, 18 Feb 2020 01:16:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v6 00/51] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
Message-ID: <20200217231652.GF4830@pendragon.ideasonboard.com>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
 <20200217230013.eqrt5jn3p5kvhljk@earth.universe>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200217230013.eqrt5jn3p5kvhljk@earth.universe>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian,

On Tue, Feb 18, 2020 at 12:00:13AM +0100, Sebastian Reichel wrote:
> Hi,
> 
> On Sun, Feb 16, 2020 at 11:02:17PM +0200, Laurent Pinchart wrote:
> > This patch series is the sixth attempt to (nearly, see [1])
> > complete the rework of the omapdrm driver to move to drm_bridge
> > and drm_panel.
> > 
> > Version 2, available at [2], explains in its long cover letter the
> > rationale for the changes. I won't duplicate it here as it is
> > still valid as-is.
> > 
> > Compared to v5, available at [3], this version has been rebased on
> > top of drm-misc-next, and minor bugs have been fixed, including
> > interlaced modes support with VENC.
> > 
> > The patches can be found at
> > 
> >         git://linuxtv.org/pinchartl/media.git omapdrm/bridge/devel
> > 
> > [1] The only notable exception is the omapdrm-specific DSI panel
> > driver that implements a large number of custom operations. This
> > is being addressed separately.
> > 
> > [2] https://patchwork.kernel.org/cover/11102445/
> > [3] https://patchwork.kernel.org/cover/11349617/
> 
> The series is
> 
> Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thank you.

> Testing was done on Droid 4, DSI command mode panel is still
> working. I had to add the following patch because of the base
> you chose for the branch. Might make sense to use 5.6-rc1 instead.
> 
> https://lore.kernel.org/lkml/CAHk-=wh8VLe3AEKhz=1bzSO=1fv4EM71EhufxuC=Gp=+bLhXoA@mail.gmail.com/

I had initially based it on drm-next, but there are changes in
drm-misc-next that were conflicting, hence the rebase.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
