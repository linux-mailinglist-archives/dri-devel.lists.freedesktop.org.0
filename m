Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA25852C35
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 10:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E728A10E230;
	Tue, 13 Feb 2024 09:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dD/pGrKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E3210E230
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 09:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707816409; x=1739352409;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=SI18VwfWcL+j84L+m/ZeWVYwnn9vXB9VhNMVl7jFX08=;
 b=dD/pGrKViRsRTvJCcA+r2GNkkmJ8fa4yn237II4NY/X+kvVB1NalCFxh
 QOIIVjdH8yOMFKmMjsUJMTv1p6/yiJOfkIxuKX6kU+aISBR0KDPbh8sED
 z92rl5ZTvUwMRQ3rNnHx9fctiFelf98bJLJ4yrTud1XjkauNZWm/Mwft3
 kJ/clH3UkuEBm4oe4bDg6jnKBVqbM8mUTUlREr8uyR52RPuMbbXdJs29v
 Uy3FGpvSK+ylQLGtLz16YBEtvaH1RpksItHMU7ryWbZwP2RxNcO7jNqMT
 FfkkckQp2RXYKTZDZjXaxQCTsUZxHa1kjEnM5zTDpulBKbCOIfPCs78le A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1966410"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1966410"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 01:26:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="826060998"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="826060998"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 13 Feb 2024 01:26:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 13 Feb 2024 11:26:44 +0200
Date: Tue, 13 Feb 2024 11:26:44 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
 contact@emersion.fr
Subject: Re: [PATCH] drm: document userspace expectations around the
 Colorspace connector property
Message-ID: <Zcs11A545tl9rvaN@intel.com>
References: <20240209165307.29856-1-xaver.hugl@kde.org>
 <20240212111015.2d22f0fa@eldfell>
 <20240212165036.GA1370407@toolbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240212165036.GA1370407@toolbox>
X-Patchwork-Hint: comment
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

On Mon, Feb 12, 2024 at 05:50:36PM +0100, Sebastian Wick wrote:
> On Mon, Feb 12, 2024 at 11:10:15AM +0200, Pekka Paalanen wrote:
> > On Fri,  9 Feb 2024 17:53:07 +0100
> > Xaver Hugl <xaver.hugl@kde.org> wrote:
> > 
> > > Signed-off-by: Xaver Hugl <xaver.hugl@kde.org>
> > > ---
> > >  drivers/gpu/drm/drm_connector.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > index b0516505f7ae..01e13984629b 100644
> > > --- a/drivers/gpu/drm/drm_connector.c
> > > +++ b/drivers/gpu/drm/drm_connector.c
> > > @@ -2158,6 +2158,14 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
> > >   *     one supported. Sink supported colorspaces should be retrieved by
> > >   *     userspace from EDID and driver will not explicitly expose them.
> > >   *
> > > + *     As userspace can't currently know whether or not the output is using
> > > + *     RGB or YCC signalling, the driver must translate properties to their
> > > + *     relevant RGB or YCC counterparts, depending on the actually used
> > > + *     signalling. Property values that are only valid for either YCC or RGB
> > > + *     and have no equivalent for the other signalling type must not be
> > > + *     exposed as supported, unless the driver can guarantee it never uses
> > > + *     the signalling that doesn't match the property.
> > > + *
> > >   *     Basically the expectation from userspace is:
> > >   *      - Set up CRTC DEGAMMA/CTM/GAMMA to convert to some sink
> > >   *        colorspace
> > 
> > While this addition is good, I have another question:
> > 
> > Does "Colorspace" property choose also the RGB->YCbCr matrix that the
> > driver will use when it happens to use YCbCr signalling?
> > 
> > So far we have only been talking about the primaries and white point.
> 
> Uh, yeah, good point. The InfoFrames do affect both the YCbCr conversion
> and the transfer characteristics that the sink expects. Drivers should
> do the RGB to YCbCr conversion with the new matrix. I think (and very
> much hope) that drivers don't rely on the TF for any internal processing
> but if they did, they also should use the one the sink expects.

What we need is:
- list of the property values that are still allowd (the ones that still
  make sense with the changed semantics)
- mark all the other ones as deprecated
- filter/reject the deprecated values when creating the property
- document each valid enum value fully (for both RGB and YCbCr output):
  * what exacly is signalled to the sink via infoframe/msa/vsc sdp
  * what processing is the driver expected to perform on the actual data

-- 
Ville Syrjälä
Intel
