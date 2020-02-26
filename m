Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6388E16F55A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 02:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9766E0BA;
	Wed, 26 Feb 2020 01:54:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C43BA6E0BA
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 01:54:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3917243F;
 Wed, 26 Feb 2020 02:54:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582682074;
 bh=f7tloZiJR6tgga9PxM8dWaayVymUFKN1u8VJcbficnI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nBfCOZzDFaMx692JuXu04edZDa3mfOQ3gvzoZKaL88fbWYVMyyCQ+I+7hVSqEcdhp
 ejX+g5vx0/Qowt24UPzPQUCOSKzZpDCB5SXxVCQV1GIEGCQJx9myugpivCA+5duEx/
 x1rTi1y+CEkZQ/LqTQcIjjThb/7w0puiqt3ZCuMk=
Date: Wed, 26 Feb 2020 03:54:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH/RFC 3/3] drm: rcar_du: Constify drm_driver
Message-ID: <20200226015413.GZ4764@pendragon.ideasonboard.com>
References: <20200222152430.2984-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200222152430.2984-4-laurent.pinchart+renesas@ideasonboard.com>
 <20200222175945.GL2363188@phenom.ffwll.local>
 <CACvgo53G9-WJyqdBVFFDCwVGkgZmx-WJU1kOuKvLiihWpgFVbg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo53G9-WJyqdBVFFDCwVGkgZmx-WJU1kOuKvLiihWpgFVbg@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil,

On Mon, Feb 24, 2020 at 03:26:05PM +0000, Emil Velikov wrote:
> Thanks Laurent for sorting this out.

You're welcome. It's been bothering me for some time :-)

> On Sat, 22 Feb 2020 at 17:59, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Sat, Feb 22, 2020 at 05:24:30PM +0200, Laurent Pinchart wrote:
> > > The drm_driver structure is never modified, make it const. The improves
> > > security by avoiding writable function pointers.
> > >
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > I wonder whether there's some magic somewhere we could do to enlist the
> > cocci army to create the constify patches for us ...
> >
> IIRC some drivers still manually thinker with their struct drm_driver ;-)
> 
> That said, the series looks good:
> Reviewed-by: Emil Velikov <emil.velikov@collabora.com>

Does this apply to the whole series, or to this patch only ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
