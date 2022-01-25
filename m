Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B5C49AE1E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 09:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6690110EEB4;
	Tue, 25 Jan 2022 08:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30AC10EEB9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:37:11 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id s13so28820501ejy.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 00:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0Jx8kml87aYG5GrNMze91epFkxBiACIGOacQ4kdCNWg=;
 b=b/oUnb4S4mP2mVlEoInv6suRuZ94CHv04lcdk/osPrOn4xQh/EeN1NJ/SXyqNgO4YP
 B4d9njYo/t6oO6aCAX5UUckMDdK2UPVQZzLul+l4esn8Z5f++iqm5P5WNqk1c+fqENd2
 fUPaT3ZQkqVljWoEGekSB+6LIDXX3OLxWeNW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0Jx8kml87aYG5GrNMze91epFkxBiACIGOacQ4kdCNWg=;
 b=7Hy+ielL1po22DnNq2wy6oELGn/IB2DVzrvCxbmst+Fc1K2rpuYARTlsI5MQ4Zper/
 EFRN4wurn6z00MjAId8Yvwm16jGfQTsevbxpOtgu/azLRowqMQid4qJp0e4IBBjW33lk
 taj5wtN5ejnD5Glayln/tTxgbWhN85P5oxON/5kgFlRoGS7uPrafezqgSCbRnWwPgCJr
 6dtJkXgkJ0Ultsww4Jl/PeQFdP9xNqv/lnV3Q1mrWFUHylTA9U0EXdAEtDTjymliuDnH
 VH8sP+ZeEIXxhgWTSVnbv7vrzf2iF5YsfGpF5Z3KIAIgeUb0Orxav8l/AMLKxULMCAAd
 hDZA==
X-Gm-Message-State: AOAM533ZRCxWTZYRt50iNGkftWaTmmDxStnoT2snh5QBPBx0TgR/8jZJ
 SON9j7/IzaIiFxvN48DA+hVy/g==
X-Google-Smtp-Source: ABdhPJz1iR7MgHogsSNCUP+CQjQbg8ddtdObYPhu7eu+rkNZtWk/zEH9TGSHVx4LUS/AkEz6We1cJw==
X-Received: by 2002:a17:907:c18:: with SMTP id
 ga24mr9069704ejc.712.1643099830250; 
 Tue, 25 Jan 2022 00:37:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j15sm5919363ejb.9.2022.01.25.00.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 00:37:09 -0800 (PST)
Date: Tue, 25 Jan 2022 09:37:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCH] drm/docs: Document where the C8 color lut is stored
Message-ID: <Ye+2s7ucGmobnudT@phenom.ffwll.local>
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
 <20220124221633.952374-1-daniel.vetter@ffwll.ch>
 <CADnq5_MqousgCfGsctBF-ek2hJj4m6sL83JSja6gLTXb9ETuKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_MqousgCfGsctBF-ek2hJj4m6sL83JSja6gLTXb9ETuKA@mail.gmail.com>
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
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 05:18:07PM -0500, Alex Deucher wrote:
> On Mon, Jan 24, 2022 at 5:16 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> >
> > Also add notes that for atomic drivers it's really somewhere else and
> > no longer in struct drm_crtc.
> >
> > Maybe we should put a bigger warning here that this is confusing,
> > since the pixel format is a plane property, but the GAMMA_LUT property
> > is on the crtc. But I think we can fix this if/when someone finds a
> > need for a per-plane CLUT, since I'm not sure such hw even exists. I'm
> > also not sure whether even hardware with a CLUT and a full color
> > correction pipeline with degamm/cgm/gamma exists.
> >
> > Motivated by comments from Geert that we have a gap here.
> >
> > v2: More names for color luts (Laurent).
> >
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

Thanks for taking a look, pushed to drm-misc-next.
-Daniel

> 
> > ---
> >  drivers/gpu/drm/drm_color_mgmt.c |  4 ++++
> >  include/drm/drm_crtc.h           | 10 ++++++++++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> > index bb14f488c8f6..9079fbe21d2f 100644
> > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > @@ -82,6 +82,10 @@
> >   *     driver boot-up state too. Drivers can access this blob through
> >   *     &drm_crtc_state.gamma_lut.
> >   *
> > + *     Note that for mostly historical reasons stemming from Xorg heritage,
> > + *     this is also used to store the color map (also sometimes color lut, CLUT
> > + *     or color palette) for indexed formats like DRM_FORMAT_C8.
> > + *
> >   * “GAMMA_LUT_SIZE”:
> >   *     Unsigned range property to give the size of the lookup table to be set
> >   *     on the GAMMA_LUT property (the size depends on the underlying hardware).
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index 4d01b4d89775..a70baea0636c 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -285,6 +285,10 @@ struct drm_crtc_state {
> >          * Lookup table for converting pixel data after the color conversion
> >          * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if not
> >          * NULL) is an array of &struct drm_color_lut.
> > +        *
> > +        * Note that for mostly historical reasons stemming from Xorg heritage,
> > +        * this is also used to store the color map (also sometimes color lut,
> > +        * CLUT or color palette) for indexed formats like DRM_FORMAT_C8.
> >          */
> >         struct drm_property_blob *gamma_lut;
> >
> > @@ -1075,12 +1079,18 @@ struct drm_crtc {
> >         /**
> >          * @gamma_size: Size of legacy gamma ramp reported to userspace. Set up
> >          * by calling drm_mode_crtc_set_gamma_size().
> > +        *
> > +        * Note that atomic drivers need to instead use
> > +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
> >          */
> >         uint32_t gamma_size;
> >
> >         /**
> >          * @gamma_store: Gamma ramp values used by the legacy SETGAMMA and
> >          * GETGAMMA IOCTls. Set up by calling drm_mode_crtc_set_gamma_size().
> > +        *
> > +        * Note that atomic drivers need to instead use
> > +        * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
> >          */
> >         uint16_t *gamma_store;
> >
> > --
> > 2.33.0
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
