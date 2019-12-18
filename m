Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF896124A0B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 15:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11A4E6E48D;
	Wed, 18 Dec 2019 14:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61806E48D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:46:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AFEE6B23;
 Wed, 18 Dec 2019 15:46:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576680396;
 bh=V+qTMJySrwajDqFoQ+Vdyujcf34C9Jp7+bLYfAvw8lg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DX1J7pKIc82dKdsDdHB/YoYVw/BbNqM+cNyoZeNiybDpHVwBIzL+ZRWBk3wLyhBGm
 BFKsmW+8CS3AEtoU/hIp+yaRavQJcpXG4CBtvRH0P9l65gdACjWkZyyt3Rmhbr5dQO
 kSVWcgN1OK2T2b1Iptz3b+7iHfF9PyhloUB6iy2M=
Date: Wed, 18 Dec 2019 16:46:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v3 00/50] drm/omap: Replace custom display drivers with
 drm_bridge and drm_panel
Message-ID: <20191218144626.GD4863@pendragon.ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191215122728.GA32124@ravnborg.org>
 <20191218020336.GN4874@pendragon.ideasonboard.com>
 <932bbb46-a3fb-67c6-6f12-85540fe7f234@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <932bbb46-a3fb-67c6-6f12-85540fe7f234@ti.com>
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
Cc: Sean Paul <sean@poorly.run>, Sam Ravnborg <sam@ravnborg.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Wed, Dec 18, 2019 at 09:07:52AM +0200, Tomi Valkeinen wrote:
> On 18/12/2019 04:03, Laurent Pinchart wrote:
> >> Hopefully we can soon have this series landed so we can start
> >> working on top of the new bridge/connector handling.
> >>
> >> I assume it will be applied direct to drm-misc-next, so we do not
> >> have to wait extra time to get it.
> > 
> > Tomi, how would you like to proceed ? The core patches are ready in my
> > opinion. I can post a v4 without the omapdrm patches, which could be
> > merged to drm-misc already while you finish reviewing patches 30/50
> > onwards.
> 
> This sounds good to me.
> 
> I have tested your branch on AM5 EMV, AM4 EVM and Panda, without any issues. But that's with the 
> omapdrm patches, and things will be slightly different without them.
> 
> You add TPD12S015 and OPA362 driver in the earlier part. Should those be moved to the omapdrm side? 
> In theory there won't be any issues, but having multiple drivers for the same device can create 
> conflicts.

Indeed, although if they're not selected it shouldn't be a problem. On
the other hand you've reviewed the omapdrm patches up to "drm/omap:
Switch the HDMI and VENC outputs to drm_bridge" which removes the old
drivers, the rest being just cleanups. We could thus merge up to that
patch in one go. What's your preference ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
