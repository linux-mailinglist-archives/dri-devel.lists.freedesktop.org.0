Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230973F3CD1
	for <lists+dri-devel@lfdr.de>; Sun, 22 Aug 2021 02:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0701E89D42;
	Sun, 22 Aug 2021 00:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C13489D42
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 00:01:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8400A8F;
 Sun, 22 Aug 2021 02:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1629590496;
 bh=prBVbLvTR9FFd7PKJjWNml62nJaJOiTBu5r2+3c7/ZA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sxxdMuMp65CVwW5gbnQE+fFviTitztJJqwK7ELD4u5vaSVC38+wqdfeSF+hPPYY1L
 d689wdTNy1QiLQ/3GTgU2dyditoOuw/MaTjb3NaNKL9LAvMDqy9choQwHBDoBIzbfL
 zvBMr4K62rlgxnLlhXwZc+1ca0+fCvtHGlgOOpyo=
Date: Sun, 22 Aug 2021 03:01:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 2/4] drm: rcar-du: lvds: Convert to DRM panel bridge
 helper
Message-ID: <YSGT19Be+KtOnVoZ@pendragon.ideasonboard.com>
References: <20210520065046.28978-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210520065046.28978-3-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWdbS2tFh9LP8hqUT-3nRqKf_k_8N3ZeiUSiBEgYhjDxQ@mail.gmail.com>
 <CAMuHMdVd75h7qCxqfQ4MCoUwEiTJktTYykZgnWy7zFgxuHXmAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVd75h7qCxqfQ4MCoUwEiTJktTYykZgnWy7zFgxuHXmAg@mail.gmail.com>
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

Hi Geert,

On Tue, Aug 10, 2021 at 05:51:57PM +0200, Geert Uytterhoeven wrote:
> On Tue, Aug 10, 2021 at 5:47 PM Geert Uytterhoeven wrote:
> > On Thu, May 20, 2021 at 8:51 AM Laurent Pinchart wrote:
> > > Replace the manual panel handling with usage of the DRM panel bridge
> > > helper. This simplifies the driver, and brings support for
> > > DRM_BRIDGE_ATTACH_NO_CONNECTOR as an added bonus.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks for your patch, which is now commit e9e056949c927e5b ("drm:
> > rcar-du: lvds: Convert to DRM panel bridge helper") in drm-next.
> >
> > This causes the following scary messages in the kernel log on Ebisu-4D:
> >
> > [drm:drm_bridge_attach] *ERROR* failed to attach bridge
> 
> > Reverting this commit fixes the issue.
> 
> Oops, that's not true (should not write tentative messages while booting
> a test kernel, and press send without checking first ;-)
> 
> Reverting the commit doesn't seem to make a difference.
> But the parent 5bcc48395b9f35da ("drm: bridge: dw-hdmi: Attach to
> next bridge if available") of the bad commit is fine.

Thanks for the report. I've reproduced this and will send a fix shortly.

-- 
Regards,

Laurent Pinchart
