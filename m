Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0925978EE85
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 15:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADCF10E033;
	Thu, 31 Aug 2023 13:26:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB6310E033
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 13:26:02 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id BD8DC66072A3;
 Thu, 31 Aug 2023 14:26:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1693488361;
 bh=MZDQK+ORa/6+xxshEXHb0a7zG3nacscDyvQ6eOQZgbw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dbsCXnWa+4HsXWQYrGRYsRzcdWGnlaXntaWWc3y3TrDOhxZj7s73Qf5dV+wSTkOVm
 vnec4z8krqLj5r5BZShTyH82E3ziHCRaqZT5CDZ7DJnqVR+SX/da8Hqvx5vEBPOhq5
 JR7uOKHVHdVEQvJsKJ+ay4mi4RmFlgBnLq8PRYJ4+aS/bQ7tw8/MFHK0l5y3drlULh
 jt9AMT1M6aP58e57YBWUUj6+xQjvrKJjslO7OQ4TU4Y8XVYJ+4PD/3slOuVLDhp6LI
 KXQubz5wspwZiqU9U4CFnM6naxCxS8mkYxTD57rWrdPWIt/coN+YOvRsem9wl0LG2F
 FDWGIxfeH26VA==
Date: Thu, 31 Aug 2023 15:25:57 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2 15/15] drm/panthor: Add an entry to MAINTAINERS
Message-ID: <20230831152557.1e311dea@collabora.com>
In-Reply-To: <ZPCTMnVb5FP0mRAe@e110455-lin.cambridge.arm.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-16-boris.brezillon@collabora.com>
 <ZPCTMnVb5FP0mRAe@e110455-lin.cambridge.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, "Marty
 E . Plummer" <hanetzer@startmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 14:18:42 +0100
Liviu Dudau <Liviu.Dudau@arm.com> wrote:

> Hi Boris,
> 
> On Wed, Aug 09, 2023 at 06:53:28PM +0200, Boris Brezillon wrote:
> > Add an entry for the Panthor driver to the MAINTAINERS file.
> > 
> > v2:
> > - New commit
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > 
> > If anyone from Arm wants to volunteer to become a co-maintainer, that
> > would be highly appreciated
> > ---
> >  MAINTAINERS | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cd882b87a3c6..6149ab68d461 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1624,6 +1624,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
> >  F:	drivers/gpu/drm/panfrost/
> >  F:	include/uapi/drm/panfrost_drm.h
> >  
> > +ARM MALI PANTHOR DRM DRIVER
> > +M:	Boris Brezillon <boris.brezillon@collabora.com>
> > +L:	dri-devel@lists.freedesktop.org
> > +S:	Supported
> > +T:	git git://anongit.freedesktop.org/drm/drm-misc
> > +F:	drivers/gpu/drm/panthor/
> > +F:	include/uapi/drm/panthor_drm.h  
> 
> Can we also add an entry for the bindings?
> 
> +F: Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml

Will do.

> 
> Also, I would like to volunteer as maintainer alongside Steven, so can I
> please get added too?

Sure, the more the merrier :-).
