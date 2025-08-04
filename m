Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A02CDB1AA61
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 23:34:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0671410E0B5;
	Mon,  4 Aug 2025 21:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tiUFuGKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B87810E0B5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 21:34:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 75EAB9CE;
 Mon,  4 Aug 2025 23:33:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1754343194;
 bh=fTo77DFAznBBbINTAIa2yC0WD6SLTQsGPZ0BSJTmp4Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tiUFuGKegE+juoRIdYAS6/lJNVkyK1LNXwV4ie0s1KNamBp0KWgM7X0eWerWwUUT/
 feqqUsuIQjciVUN5oXIkChm/cetFB9YC/SDYfyOK12g8wnYoO2LYsM66dseS1n06mE
 z3WTGMe5X0gAawZO75+Wt/+RuXcDhancPHI9P368=
Date: Tue, 5 Aug 2025 00:33:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: sukrut heroorkar <hsukrut3@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
Subject: Re: [PATCH] drm/drm_bridge: Document 'connector' parameter in
 drm_bridge_detect()
Message-ID: <20250804213347.GI30355@pendragon.ideasonboard.com>
References: <20250802161309.1198855-1-hsukrut3@gmail.com>
 <20250803165611.GG4906@pendragon.ideasonboard.com>
 <CAHCkknr+w3B0NWM065Rr_d9n9QEak7YmhehByQTdfwYr30RbSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCkknr+w3B0NWM065Rr_d9n9QEak7YmhehByQTdfwYr30RbSQ@mail.gmail.com>
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

On Mon, Aug 04, 2025 at 11:24:58PM +0200, sukrut heroorkar wrote:
> On Sun, Aug 3, 2025 at 6:56 PM Laurent Pinchart wrote:
> > On Sat, Aug 02, 2025 at 06:13:05PM +0200, Sukrut Heroorkar wrote:
> > > drm: drm_bridge: fix missing parameter documentation
> > >
> > > The function documentation was missing description for the
> > > parameter 'connector'.
> > >
> > > Add missing function parameter documentation for drm_bridge_detect()
> > > to fix kernel-doc warnings.
> > >
> > > Warning: drivers/gpu/drm/drm_bridge.c:1241 function parameter 'connector' not described in 'drm_bridge_detect'
> > >
> >
> > A Fixes: tag would be nice.
> >
> > > Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_bridge.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> > > index dd45d9b504d8..387a3b6cda54 100644
> > > --- a/drivers/gpu/drm/drm_bridge.c
> > > +++ b/drivers/gpu/drm/drm_bridge.c
> > > @@ -1227,6 +1227,7 @@ EXPORT_SYMBOL(drm_atomic_bridge_chain_check);
> > >  /**
> > >   * drm_bridge_detect - check if anything is attached to the bridge output
> > >   * @bridge: bridge control structure
> > > + * @connector: connector associated with the bridge
> >
> > "associated with the bridge" isn't very clear.
> >
> > >   *
> > >   * If the bridge supports output detection, as reported by the
> > >   * DRM_BRIDGE_OP_DETECT bridge ops flag, call &drm_bridge_funcs.detect for the
> 
> Thanks for the review.
> I will send a V2 shortly with updated connector description and Fixes
> tag, as suggested.

It appears that a competing patch got merged in the meantime:
https://lore.kernel.org/r/20250716125602.3166573-1-andyshrk@163.com

It was submitted earlier than yours, and the usual rule in the kernel is
that the first patch wins when there are multiple similar or identical
submissions.

-- 
Regards,

Laurent Pinchart
