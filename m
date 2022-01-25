Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A633C49AE83
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 09:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473D910EDF3;
	Tue, 25 Jan 2022 08:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F6110EDFA
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643100767; x=1674636767;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7Brng8yjKwqq30/hqVinmh3+wcdVx8lBz87wVYqYmkE=;
 b=iINOLX0vg7yggPPbSNHXcfFPZBDoP9r+mQ4flABtxvBp2avQOi+5rBSE
 yY5lcS+Wv63uSl9nm8NloKf9O/4kCFXXVetDnOE+sPQFoe0vHBZ+tyEtH
 shaHwcCLUa5b/9r6/D07mzCN/EIa9mX4UpgIYzP2buhQ7QZUHyr0byyzU
 dtJ8ucKeHWEhjUfKA0CXC5N3UiiO8QQgTb/Fe3oVUA/d55gCADI62u3Ok
 rR6GnoY8KQMpIQ+c2CTpKQ2v6SsVSaahEArKl8qGGyJMLS+Lzplv/9i+n
 GskTPMqMFI+pTOl90C44yoo8CP7KZUnS2j03FIU9TZ6+LsUvHUi60wLBR w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="246038058"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="246038058"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 00:52:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="580685415"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by fmsmga008.fm.intel.com with SMTP; 25 Jan 2022 00:52:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Jan 2022 10:52:18 +0200
Date: Tue, 25 Jan 2022 10:52:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/docs: Document where the C8 color lut is stored
Message-ID: <Ye+6Qt89Jdncoa+/@intel.com>
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
 <20220124221633.952374-1-daniel.vetter@ffwll.ch>
 <CAMuHMdXPqpw53LTs0Z6sCdrdT_uk4JOwq7rw_gkxwXmAd=EG+Q@mail.gmail.com>
 <Ye+2apZRhnzPMp7q@phenom.ffwll.local>
 <Ye+3O4jqRzGMmSvX@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ye+3O4jqRzGMmSvX@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 09:39:23AM +0100, Daniel Vetter wrote:
> On Tue, Jan 25, 2022 at 09:35:54AM +0100, Daniel Vetter wrote:
> > On Tue, Jan 25, 2022 at 09:22:15AM +0100, Geert Uytterhoeven wrote:
> > > Hi Daniel,
> > > 
> > > Thanks for your patch!
> > > 
> > > On Mon, Jan 24, 2022 at 11:16 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > Also add notes that for atomic drivers it's really somewhere else and
> > > > no longer in struct drm_crtc.
> > > >
> > > > Maybe we should put a bigger warning here that this is confusing,
> > > > since the pixel format is a plane property, but the GAMMA_LUT property
> > > > is on the crtc. But I think we can fix this if/when someone finds a
> > > > need for a per-plane CLUT, since I'm not sure such hw even exists. I'm
> > > > also not sure whether even hardware with a CLUT and a full color
> > > > correction pipeline with degamm/cgm/gamma exists.
> > > 
> > > IIRC (it's been a looong time) some set-top-box hardware did support
> > > this.  It made sense, as the CLUT is per-plane, while the gamma value
> > > is a property of the display output device.
> > > At that time, desktop hardware supported only a single plane, so
> > > hardware complexity could be reduced by letting software handle
> > > that through a single clut (for "pseudocolor") or gamma table (for
> > > "directcolor").
> > > For hardware with multiple alpha-blended planes (some CLUT, some
> > > ARGB, some (A)YCbCr), doing it in software is either very complicated
> > > or impossible, especially if you have two heads needing different
> > > gamma values.
> > > Whether such hardware still exists, and needs to be supported,
> > > I do not know...
> > 
> > Yeah I think extending this is a all-around compatible way isn't too
> > tricky, just a bit of work:
> > - add the clut to the plane state
> > - add a helper which takes the plane state, and if you have an indexed
> >   pixel format first grabs the plane state clut, and if that's not
> >   present, the crtc gamma lut as fallback. Also gives you nothing if you
> >   don't have a indexed pixel format
> > - convert drivers over to that helper
> > 
> > This way legacy userspace which only uses a primary plane and the
> > gamma-as-a-clut thing will keep working, while we can expose the full
> > features. And drivers don't have to care about the compat either.

https://github.com/vsyrjala/linux/commits/fb_helper_c8_lut_4

> > 
> > > > Motivated by comments from Geert that we have a gap here.
> > > >
> > > > v2: More names for color luts (Laurent).
> > > 
> > > +1, that would help for sure!
> > > 
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > 
> > > > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > > > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > > > @@ -82,6 +82,10 @@
> > > >   *     driver boot-up state too. Drivers can access this blob through
> > > >   *     &drm_crtc_state.gamma_lut.
> > > >   *
> > > > + *     Note that for mostly historical reasons stemming from Xorg heritage,
> > > > + *     this is also used to store the color map (also sometimes color lut, CLUT
> > > > + *     or color palette) for indexed formats like DRM_FORMAT_C8.
> > > > + *
> > > >   * “GAMMA_LUT_SIZE”:
> > > >   *     Unsigned range property to give the size of the lookup table to be set
> > > >   *     on the GAMMA_LUT property (the size depends on the underlying hardware).
> > > > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > > > index 4d01b4d89775..a70baea0636c 100644
> > > > --- a/include/drm/drm_crtc.h
> > > > +++ b/include/drm/drm_crtc.h
> > > > @@ -285,6 +285,10 @@ struct drm_crtc_state {
> > > >          * Lookup table for converting pixel data after the color conversion
> > > >          * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if not
> > > >          * NULL) is an array of &struct drm_color_lut.
> > > > +        *
> > > > +        * Note that for mostly historical reasons stemming from Xorg heritage,
> > > > +        * this is also used to store the color map (also sometimes color lut,
> > > > +        * CLUT or color palette) for indexed formats like DRM_FORMAT_C8.
> > > >          */
> > > >         struct drm_property_blob *gamma_lut;
> > > >
> > > > @@ -1075,12 +1079,18 @@ struct drm_crtc {
> > > >         /**
> > > >          * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
> > > >          * by calling drm_mode_crtc_set_gamma_size().
> > > > +        *
> > > > +        * Note that atomic drivers need to instead use
> > > > +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
> > > >          */
> > > >         uint32_t gamma_size;
> > > >
> > > >         /**
> > > >          * @gamma_store: Gamma ramp values used by the legacy SETGAMMA and
> > > >          * GETGAMMA IOCTls. Set up by calling drm_mode_crtc_set_gamma_size().
> > > > +        *
> > > > +        * Note that atomic drivers need to instead use
> > > > +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
> > > >          */
> > > >         uint16_t *gamma_store;
> > > 
> > > This is indeed what I ended up using, as
> > > drivers/gpu/drm/drm_fb_helper.c:setcmap_atomic() fills in
> > > drm_crtc.gamma_store[].  But as I understand it, I should instead
> > > use the gamma_lut above?
> > 
> > Yup.
> 
> I forgot to add why: The legacy store is only filled in for the legacy
> interfaces, so if someone uses the atomic properties directly, then your
> driver looking at the legacy gamma store will see nothing.
> 
> We could/should perhaps make the legacy store entirely defunct for atomic
> drivers, but that means a bunch of typing and auditing. We have the same
> problem in other areas too due to the gradual switch towards atomic in
> many drivers, so definitely an area where you can sink a lot of time into.

I have some wip stuff here that tried to nuke the gamma_store stuff:
https://github.com/vsyrjala/linux/commits/fb_helper_c8_lut_4

As for adding a LUT to the planes that needs careful thought as it
interacts heavily with the whole plane color management work.

Also there's hardware (everything supported by i915 for example) where
each plane might have a dedicated gamma ramp for !C8 while still relying
on the pipe LUT for C8 scanout. Multiple planes can be scanning out
C8 simultaneously and they all share the same LUT. And while that is
going on the pipe LUT can then not be used for anything else.

-- 
Ville Syrjälä
Intel
