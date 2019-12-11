Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9962111C0B1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 00:42:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EE86E102;
	Wed, 11 Dec 2019 23:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BE46E102
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 23:42:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F99152B;
 Thu, 12 Dec 2019 00:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576107741;
 bh=coL/+8qPgqI/eIeufjM09sOeDrjiuwgvgYC2pmywpkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kK/1IODysYKsK500erss0joksT3Figd+qWsPg8tBLY+HCLxadX0dNGqB9bvOcD/W9
 ttGO+hzs8nBL5LUIwbsUcL7qPMMuuckDZ9SlJPLxq0waQWhpCRpwi86FDXnmOkGwkw
 drTwSTCXNcRupan8IYsqJgSa2KW/pK6n4jZk9SKE=
Date: Thu, 12 Dec 2019 01:42:12 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 06/50] drm/bridge: dumb-vga-dac: Rename internal
 symbols to simple-bridge
Message-ID: <20191211234212.GB26146@pendragon.ideasonboard.com>
References: <20191210225750.15709-1-laurent.pinchart@ideasonboard.com>
 <20191210225750.15709-7-laurent.pinchart@ideasonboard.com>
 <20191211211318.GA27390@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191211211318.GA27390@ravnborg.org>
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

(CC'ing Maxime)

On Wed, Dec 11, 2019 at 10:13:18PM +0100, Sam Ravnborg wrote:
> On Wed, Dec 11, 2019 at 12:57:06AM +0200, Laurent Pinchart wrote:
> > The dumb-vga-dac driver is a simple DRM bridge driver for simple VGA
> > DACs that don't require configuration. Other non-VGA bridges fall in a
> > similar category, and would benefit from a common driver. Prepare for
> > this by renaming the internal symbols from dumb-vga-dac to
> > simple-bridge.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Reviewed-by: Maxime Ripard <maxime.ripard@bootlin.com>
>
> Maxime has a new email address today.
> The one used here bounces.

I know, but his Reviewed-by tag was given with the bootlin.com e-mail
address, so I haven't changed it. Maxime, should I update your tags in
this series ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
