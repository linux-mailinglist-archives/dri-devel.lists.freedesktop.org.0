Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B512249B0BD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:51:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A4A10F0F6;
	Tue, 25 Jan 2022 09:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2F110F0F6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:50:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id e2so3343188wra.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 01:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=oYsfiqjQScCviePLcRNVFYFdF3j2ZKY/Y0NyhfRj0pE=;
 b=HPtLqpsc028KBi4Xa1K6r9DB19+aHTTL12ArHopmtehNbtsJ7xdCxc91Ymwc6zo2mV
 Ovk+FT3/TW2I4q4Kyq/atteRsIUcJWa7ttTg+9g2H7EcOQ/Il/EllODG+6fMdyHN2FFr
 6vCnpGoquGOuhOcRM+OW+/S15ex6AyViQziso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=oYsfiqjQScCviePLcRNVFYFdF3j2ZKY/Y0NyhfRj0pE=;
 b=LNahJgVLDFs4PGplJSxVykJYRlPKaj9O8Hlhg4TQXUFaOl4k87BN5IXJx/GOA9i1XD
 eM4C+yQpeiPt70hN/QZ/8J/XGFJ/74LtVk6aAebFTTTaAX5h3XIGoPRiMUmmpvg1MCi7
 45d/fYWnh7FVJSNAuL/BUO9Y3K19AO37PI4AEnxElLPjLUcpisVhXbhIvjqvPy1jotMc
 /Ggyc6H9xZTXOfZFqjcXpYrzasILDc4Ox9zwDR170ClSEy6lUk/5BsfsCWwhuP+eB90w
 Qr54EzjswbZkJ9ZnOnJzZEerwHnjdvmWZmX3+0MEjH9TjbMTAmE89t2/uRsBiw6y8tXD
 NSYA==
X-Gm-Message-State: AOAM532Nf+tectiZXWacXlfVshBlhrL+KrdyTSmYrZSyZhHmzDbj9df4
 qBJZljhdt0+PckrV4RyW9CPjTA==
X-Google-Smtp-Source: ABdhPJwuiBiTuCxfqmRXXsHksmD2SJb6jD1euzv7b27O2f4zGaUs0zOzewOr1dKihL/ZfhGgWKaxFg==
X-Received: by 2002:a05:6000:18a1:: with SMTP id
 b1mr9726833wri.608.1643104257165; 
 Tue, 25 Jan 2022 01:50:57 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m5sm65854wms.4.2022.01.25.01.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 01:50:56 -0800 (PST)
Date: Tue, 25 Jan 2022 10:50:54 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/docs: Document where the C8 color lut is stored
Message-ID: <Ye/H/vmP8aGhFTzs@phenom.ffwll.local>
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
 <20220124221633.952374-1-daniel.vetter@ffwll.ch>
 <CAMuHMdXPqpw53LTs0Z6sCdrdT_uk4JOwq7rw_gkxwXmAd=EG+Q@mail.gmail.com>
 <Ye+2apZRhnzPMp7q@phenom.ffwll.local>
 <Ye+3O4jqRzGMmSvX@phenom.ffwll.local> <Ye+6Qt89Jdncoa+/@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ye+6Qt89Jdncoa+/@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 10:52:18AM +0200, Ville Syrjälä wrote:
> On Tue, Jan 25, 2022 at 09:39:23AM +0100, Daniel Vetter wrote:
> > On Tue, Jan 25, 2022 at 09:35:54AM +0100, Daniel Vetter wrote:
> > > On Tue, Jan 25, 2022 at 09:22:15AM +0100, Geert Uytterhoeven wrote:
> > > > Hi Daniel,
> > > > 
> > > > Thanks for your patch!
> > > > 
> > > > On Mon, Jan 24, 2022 at 11:16 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > > > Also add notes that for atomic drivers it's really somewhere else and
> > > > > no longer in struct drm_crtc.
> > > > >
> > > > > Maybe we should put a bigger warning here that this is confusing,
> > > > > since the pixel format is a plane property, but the GAMMA_LUT property
> > > > > is on the crtc. But I think we can fix this if/when someone finds a
> > > > > need for a per-plane CLUT, since I'm not sure such hw even exists. I'm
> > > > > also not sure whether even hardware with a CLUT and a full color
> > > > > correction pipeline with degamm/cgm/gamma exists.
> > > > 
> > > > IIRC (it's been a looong time) some set-top-box hardware did support
> > > > this.  It made sense, as the CLUT is per-plane, while the gamma value
> > > > is a property of the display output device.
> > > > At that time, desktop hardware supported only a single plane, so
> > > > hardware complexity could be reduced by letting software handle
> > > > that through a single clut (for "pseudocolor") or gamma table (for
> > > > "directcolor").
> > > > For hardware with multiple alpha-blended planes (some CLUT, some
> > > > ARGB, some (A)YCbCr), doing it in software is either very complicated
> > > > or impossible, especially if you have two heads needing different
> > > > gamma values.
> > > > Whether such hardware still exists, and needs to be supported,
> > > > I do not know...
> > > 
> > > Yeah I think extending this is a all-around compatible way isn't too
> > > tricky, just a bit of work:
> > > - add the clut to the plane state
> > > - add a helper which takes the plane state, and if you have an indexed
> > >   pixel format first grabs the plane state clut, and if that's not
> > >   present, the crtc gamma lut as fallback. Also gives you nothing if you
> > >   don't have a indexed pixel format
> > > - convert drivers over to that helper
> > > 
> > > This way legacy userspace which only uses a primary plane and the
> > > gamma-as-a-clut thing will keep working, while we can expose the full
> > > features. And drivers don't have to care about the compat either.
> 
> https://github.com/vsyrjala/linux/commits/fb_helper_c8_lut_4

Yeah resurrecting those might be a good idea.
-Daniel


> 
> > > 
> > > > > Motivated by comments from Geert that we have a gap here.
> > > > >
> > > > > v2: More names for color luts (Laurent).
> > > > 
> > > > +1, that would help for sure!
> > > > 
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > 
> > > > > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > > > > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > > > > @@ -82,6 +82,10 @@
> > > > >   *     driver boot-up state too. Drivers can access this blob through
> > > > >   *     &drm_crtc_state.gamma_lut.
> > > > >   *
> > > > > + *     Note that for mostly historical reasons stemming from Xorg heritage,
> > > > > + *     this is also used to store the color map (also sometimes color lut, CLUT
> > > > > + *     or color palette) for indexed formats like DRM_FORMAT_C8.
> > > > > + *
> > > > >   * “GAMMA_LUT_SIZE”:
> > > > >   *     Unsigned range property to give the size of the lookup table to be set
> > > > >   *     on the GAMMA_LUT property (the size depends on the underlying hardware).
> > > > > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > > > > index 4d01b4d89775..a70baea0636c 100644
> > > > > --- a/include/drm/drm_crtc.h
> > > > > +++ b/include/drm/drm_crtc.h
> > > > > @@ -285,6 +285,10 @@ struct drm_crtc_state {
> > > > >          * Lookup table for converting pixel data after the color conversion
> > > > >          * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if not
> > > > >          * NULL) is an array of &struct drm_color_lut.
> > > > > +        *
> > > > > +        * Note that for mostly historical reasons stemming from Xorg heritage,
> > > > > +        * this is also used to store the color map (also sometimes color lut,
> > > > > +        * CLUT or color palette) for indexed formats like DRM_FORMAT_C8.
> > > > >          */
> > > > >         struct drm_property_blob *gamma_lut;
> > > > >
> > > > > @@ -1075,12 +1079,18 @@ struct drm_crtc {
> > > > >         /**
> > > > >          * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
> > > > >          * by calling drm_mode_crtc_set_gamma_size().
> > > > > +        *
> > > > > +        * Note that atomic drivers need to instead use
> > > > > +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
> > > > >          */
> > > > >         uint32_t gamma_size;
> > > > >
> > > > >         /**
> > > > >          * @gamma_store: Gamma ramp values used by the legacy SETGAMMA and
> > > > >          * GETGAMMA IOCTls. Set up by calling drm_mode_crtc_set_gamma_size().
> > > > > +        *
> > > > > +        * Note that atomic drivers need to instead use
> > > > > +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
> > > > >          */
> > > > >         uint16_t *gamma_store;
> > > > 
> > > > This is indeed what I ended up using, as
> > > > drivers/gpu/drm/drm_fb_helper.c:setcmap_atomic() fills in
> > > > drm_crtc.gamma_store[].  But as I understand it, I should instead
> > > > use the gamma_lut above?
> > > 
> > > Yup.
> > 
> > I forgot to add why: The legacy store is only filled in for the legacy
> > interfaces, so if someone uses the atomic properties directly, then your
> > driver looking at the legacy gamma store will see nothing.
> > 
> > We could/should perhaps make the legacy store entirely defunct for atomic
> > drivers, but that means a bunch of typing and auditing. We have the same
> > problem in other areas too due to the gradual switch towards atomic in
> > many drivers, so definitely an area where you can sink a lot of time into.
> 
> I have some wip stuff here that tried to nuke the gamma_store stuff:
> https://github.com/vsyrjala/linux/commits/fb_helper_c8_lut_4
> 
> As for adding a LUT to the planes that needs careful thought as it
> interacts heavily with the whole plane color management work.
> 
> Also there's hardware (everything supported by i915 for example) where
> each plane might have a dedicated gamma ramp for !C8 while still relying
> on the pipe LUT for C8 scanout. Multiple planes can be scanning out
> C8 simultaneously and they all share the same LUT. And while that is
> going on the pipe LUT can then not be used for anything else.
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
