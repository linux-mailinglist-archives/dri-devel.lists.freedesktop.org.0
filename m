Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4CE49AE1F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 09:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B5710EEB6;
	Tue, 25 Jan 2022 08:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F55310EEB6
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:39:27 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id l5so44197927edv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 00:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Cs7zpfPEW5dgI9c+ir0INNW9LINqVSiUPXqsGPKLoTI=;
 b=DG1LS1jdbOUhM+rFLZHjXW0gizv1VfcR1Iz5mpCHQL0Yiey/4tfv7K3c51NI2K1r0B
 qgpEHaoZ5CjovM2zqAu9xtyDkE+NfDpocdk+26cW71W1Bz2IZEHjJ2QnrQqLnaQc3eAF
 F0WUiCAl+2zj/AgvKU/SQPFSy7MxtY13lo3kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Cs7zpfPEW5dgI9c+ir0INNW9LINqVSiUPXqsGPKLoTI=;
 b=iAIcDIL0WO2K8MrbNkqvAzEbIb3GRJfGjegE1JGbuH/ejLY3Oh6V+UcNyKIPO+aqay
 UI9rD0NYqUX4b0ykwpYK03rnBYPu7mmasi+K+PUTrW4W8+UdPfNQTgKB7BG7yZ/MPC5P
 OmS26Y7h+rYnCQ70Vd3r5+o8qOGyn9r/FXE2PKEx5RqRSwOICK2jwYf1wf7q9/XLigTC
 irLlTdyOutY3dISUz1omwsqQ0mXdopJbEt0qvUw2427wDtow7rOrMIZamFgNdUbU23J7
 JqPz/Wr4b4CLK2llPhDjcFQlU/L9Nmm7AqbLU8W/r7e+MriaYna1l8k3s1IqpeVRXCwn
 hIoA==
X-Gm-Message-State: AOAM533SH2yanegld8slOhEpC4BjSlLqVIciyjWUdBXzAiK7Udy3ZgL4
 gjM6oGpdxBZSt82vmUq6gkvHog==
X-Google-Smtp-Source: ABdhPJwjE2Rksj08DVATWcl44cab/YVIudsjZCSL787BxjVmGsXQqz9e02qof/PeUms3gmc02NvUSQ==
X-Received: by 2002:a05:6402:3552:: with SMTP id
 f18mr5650794edd.145.1643099965785; 
 Tue, 25 Jan 2022 00:39:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id lm6sm5834622ejb.46.2022.01.25.00.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 00:39:25 -0800 (PST)
Date: Tue, 25 Jan 2022 09:39:23 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] drm/docs: Document where the C8 color lut is stored
Message-ID: <Ye+3O4jqRzGMmSvX@phenom.ffwll.local>
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
 <20220124221633.952374-1-daniel.vetter@ffwll.ch>
 <CAMuHMdXPqpw53LTs0Z6sCdrdT_uk4JOwq7rw_gkxwXmAd=EG+Q@mail.gmail.com>
 <Ye+2apZRhnzPMp7q@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ye+2apZRhnzPMp7q@phenom.ffwll.local>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 25, 2022 at 09:35:54AM +0100, Daniel Vetter wrote:
> On Tue, Jan 25, 2022 at 09:22:15AM +0100, Geert Uytterhoeven wrote:
> > Hi Daniel,
> > 
> > Thanks for your patch!
> > 
> > On Mon, Jan 24, 2022 at 11:16 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > Also add notes that for atomic drivers it's really somewhere else and
> > > no longer in struct drm_crtc.
> > >
> > > Maybe we should put a bigger warning here that this is confusing,
> > > since the pixel format is a plane property, but the GAMMA_LUT property
> > > is on the crtc. But I think we can fix this if/when someone finds a
> > > need for a per-plane CLUT, since I'm not sure such hw even exists. I'm
> > > also not sure whether even hardware with a CLUT and a full color
> > > correction pipeline with degamm/cgm/gamma exists.
> > 
> > IIRC (it's been a looong time) some set-top-box hardware did support
> > this.  It made sense, as the CLUT is per-plane, while the gamma value
> > is a property of the display output device.
> > At that time, desktop hardware supported only a single plane, so
> > hardware complexity could be reduced by letting software handle
> > that through a single clut (for "pseudocolor") or gamma table (for
> > "directcolor").
> > For hardware with multiple alpha-blended planes (some CLUT, some
> > ARGB, some (A)YCbCr), doing it in software is either very complicated
> > or impossible, especially if you have two heads needing different
> > gamma values.
> > Whether such hardware still exists, and needs to be supported,
> > I do not know...
> 
> Yeah I think extending this is a all-around compatible way isn't too
> tricky, just a bit of work:
> - add the clut to the plane state
> - add a helper which takes the plane state, and if you have an indexed
>   pixel format first grabs the plane state clut, and if that's not
>   present, the crtc gamma lut as fallback. Also gives you nothing if you
>   don't have a indexed pixel format
> - convert drivers over to that helper
> 
> This way legacy userspace which only uses a primary plane and the
> gamma-as-a-clut thing will keep working, while we can expose the full
> features. And drivers don't have to care about the compat either.
> 
> > > Motivated by comments from Geert that we have a gap here.
> > >
> > > v2: More names for color luts (Laurent).
> > 
> > +1, that would help for sure!
> > 
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > 
> > > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > > @@ -82,6 +82,10 @@
> > >   *     driver boot-up state too. Drivers can access this blob through
> > >   *     &drm_crtc_state.gamma_lut.
> > >   *
> > > + *     Note that for mostly historical reasons stemming from Xorg heritage,
> > > + *     this is also used to store the color map (also sometimes color lut, CLUT
> > > + *     or color palette) for indexed formats like DRM_FORMAT_C8.
> > > + *
> > >   * “GAMMA_LUT_SIZE”:
> > >   *     Unsigned range property to give the size of the lookup table to be set
> > >   *     on the GAMMA_LUT property (the size depends on the underlying hardware).
> > > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > > index 4d01b4d89775..a70baea0636c 100644
> > > --- a/include/drm/drm_crtc.h
> > > +++ b/include/drm/drm_crtc.h
> > > @@ -285,6 +285,10 @@ struct drm_crtc_state {
> > >          * Lookup table for converting pixel data after the color conversion
> > >          * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if not
> > >          * NULL) is an array of &struct drm_color_lut.
> > > +        *
> > > +        * Note that for mostly historical reasons stemming from Xorg heritage,
> > > +        * this is also used to store the color map (also sometimes color lut,
> > > +        * CLUT or color palette) for indexed formats like DRM_FORMAT_C8.
> > >          */
> > >         struct drm_property_blob *gamma_lut;
> > >
> > > @@ -1075,12 +1079,18 @@ struct drm_crtc {
> > >         /**
> > >          * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
> > >          * by calling drm_mode_crtc_set_gamma_size().
> > > +        *
> > > +        * Note that atomic drivers need to instead use
> > > +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
> > >          */
> > >         uint32_t gamma_size;
> > >
> > >         /**
> > >          * @gamma_store: Gamma ramp values used by the legacy SETGAMMA and
> > >          * GETGAMMA IOCTls. Set up by calling drm_mode_crtc_set_gamma_size().
> > > +        *
> > > +        * Note that atomic drivers need to instead use
> > > +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
> > >          */
> > >         uint16_t *gamma_store;
> > 
> > This is indeed what I ended up using, as
> > drivers/gpu/drm/drm_fb_helper.c:setcmap_atomic() fills in
> > drm_crtc.gamma_store[].  But as I understand it, I should instead
> > use the gamma_lut above?
> 
> Yup.

I forgot to add why: The legacy store is only filled in for the legacy
interfaces, so if someone uses the atomic properties directly, then your
driver looking at the legacy gamma store will see nothing.

We could/should perhaps make the legacy store entirely defunct for atomic
drivers, but that means a bunch of typing and auditing. We have the same
problem in other areas too due to the gradual switch towards atomic in
many drivers, so definitely an area where you can sink a lot of time into.
-Daniel


> > BTW, to check if the CLUT changed, I look at
> > drm_crtc_state.color_mgmt_changed.  This works reasonably well,
> > but I still see more CLUT reloads than expected.
> > Who clears drm_crtc_state.color_mgmt_changed again?
> > Is there a better check?
> 
> It only checks whether the blob property changed, but not the contents. So
> if you see this set when nothing changes then I guess some code somewhere
> is creating a new lut blob property for every screen update. If this goes
> through the legacy gamma_set ioctl/vfunc interface then I think we'll do
> that in there every time, and at least for fbdev emulation the fix would
> be to instead use the atomic interfaces and cache the blob prop. Or
> implement the lut blob prop caching in gamma_set, but that's kinda a hack
> (since userspace also shouldn't call that one just for lolz).
> -Daniel
> 
> > 
> > Thanks!
> > 
> > Gr{oetje,eeting}s,
> > 
> >                         Geert
> > 
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > 
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
