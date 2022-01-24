Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E6D4994A7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 21:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE2C10E6B5;
	Mon, 24 Jan 2022 20:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5B410E6B5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 20:47:26 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id y23so9170491oia.13
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ym+w+PaKFUaOg0q/ATSe5qmIBTbdPQW6qYV1UuleQq4=;
 b=i2HFGMtvlwHWeM4H12A85Yeymau+9z1JytXJNssj27EN65saYd63V3W07z4hKdaevZ
 pT/qzZ2pswe3yrSZCuWt6QE/ibuV0bl28FA8p1e6cGtRB7Q7knii8D5NMtU2ov8I15MN
 k/zMwJout8hxw6Gz4lJ/4JjDymLRWPTySfRBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ym+w+PaKFUaOg0q/ATSe5qmIBTbdPQW6qYV1UuleQq4=;
 b=RhKgWSQVMIKzyAhXHsBD7R/eQO/K5iykqAy109NNiXcH9BYuD5sLCOiUvpIeX3eUZF
 /Se8ohgyH0zeSektCRP4rzgl8lrgw8FK8qrrXYb3L8k/XVraN4Jufz3xNYnkeZzh+/2i
 O13Z+CNatbdfLJ2s4wBQScLchUAKb6nh8vi7cem5ABXDJuUdSIXdITKqMQDg17TG7C4d
 gMiu2x73RApCPvTdFb7J3FUVS2rFc1qUUrOwadrWGTmYXvK5djPS5z7c4AJG/BOMbaK3
 lTvORMSzoA0CE+PHebdSvX+acYA/vPl/AiSmIekRf5KJgeBYlqsmO0TjdF1bHlMWNeXG
 0ssw==
X-Gm-Message-State: AOAM530w8NrXuj1THNVdg5B1oLqPMxZNPf72S5m1FHrne8WlBJ3E4i4a
 2qTtB16CMLjtiPD7dg/meYsBQbCNcMcskeoIrPsRqN3HyYU=
X-Google-Smtp-Source: ABdhPJwr757cyqhwypserL+OI0/zTgTD9iJqmF4ssjGx8gG2+THMYgCinltZWvHSaiBWWlu3MAD47iDx0cUf1VvnlHM=
X-Received: by 2002:a05:6808:1188:: with SMTP id
 j8mr2903855oil.101.1643057245615; 
 Mon, 24 Jan 2022 12:47:25 -0800 (PST)
MIME-Version: 1.0
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
 <Ye8LBfWBr5fPTgCN@pendragon.ideasonboard.com>
 <CAKMK7uGS5z3h-N7h5qxNfgJU0q2bhGUzCD4zd7JvED93swdtmQ@mail.gmail.com>
 <Ye8Oz4WFB7JE6tud@pendragon.ideasonboard.com>
In-Reply-To: <Ye8Oz4WFB7JE6tud@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 24 Jan 2022 21:47:14 +0100
Message-ID: <CAKMK7uGkjw1P1edtRQg6NY7LwK+n3pN0KE4Awi_7Qanrxs-6Bg@mail.gmail.com>
Subject: Re: [PATCH] drm/docs: Document where the C8 color lut is stored
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 9:41 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> On Mon, Jan 24, 2022 at 09:28:09PM +0100, Daniel Vetter wrote:
> > On Mon, Jan 24, 2022 at 9:24 PM Laurent Pinchart wrote:
> > > On Mon, Jan 24, 2022 at 08:47:06PM +0100, Daniel Vetter wrote:
> > > > Also add notes that for atomic drivers it's really somewhere else a=
nd
> > > > no longer in struct drm_crtc.
> > > >
> > > > Maybe we should put a bigger warning here that this is confusing,
> > > > since the pixel format is a plane property, but the GAMMA_LUT prope=
rty
> > > > is on the crtc. But I think we can fix this if/when someone finds a
> > > > need for a per-plane CLUT, since I'm not sure such hw even exists. =
I'm
> > > > also not sure whether even hardware with a CLUT and a full color
> > > > correction pipeline with degamm/cgm/gamma exists.
> > >
> > > Exists, maybe, exists and has a real use case, I'd be surprised.
> > >
> > > > Motivated by comments from Geert that we have a gap here.
> > > >
> > > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: David Airlie <airlied@linux.ie>
> > > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_color_mgmt.c |  4 ++++
> > > >  include/drm/drm_crtc.h           | 10 ++++++++++
> > > >  2 files changed, 14 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm=
_color_mgmt.c
> > > > index bb14f488c8f6..96ce57ad37e6 100644
> > > > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > > > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > > > @@ -82,6 +82,10 @@
> > > >   *   driver boot-up state too. Drivers can access this blob throug=
h
> > > >   *   &drm_crtc_state.gamma_lut.
> > > >   *
> > > > + *   Note that for mostly historical reasons stemming from Xorg he=
ritage,
> > > > + *   this is also used to store the color lookup table (CLUT) for =
indexed
> > > > + *   formats like DRM_FORMAT_C8.
> > >
> > > CLUT also stands for Cubic Look Up Table, a type of LUT commonly used
> > > for tone mapping that maps an RGB sample (in 3D space) to a colour.
> > > Compared to traditional LUTs such as gamma and degamma, it allows
> > > correlating colour components, while the gamma and degamma LUTs opera=
te
> > > on each colour component independently.
> > >
> > > Is there any commonly used acronym for the indexed colours lookup tab=
le
> > > that we could use here, to avoid future confusions ?
> >
> > Hm intel calls these 3DLUT, so for me there's not confusion here :-)
> > But also since random acronyms are bad I put both the acronym and the
> > full spelling into the text.
> >
> > The cubic lut for me sounds more like cubic filtering from texture
> > units (yet another thing). Do you want me to just drop the CLUT (I
> > figured some people might search for that in the docs, and there's
> > really no other way find this) or ok this way? I don't really have a
> > better idea.
>
> fbdev uses "color map", "color palette" seems to also be a common term.
> Maybe use one of those two ?

Sounds good, I'll just add them all in parathesis. The more the better
the chance people find this.
-Daniel

>
> > > Other than that,
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > > + *
> > > >   * =E2=80=9CGAMMA_LUT_SIZE=E2=80=9D:
> > > >   *   Unsigned range property to give the size of the lookup table =
to be set
> > > >   *   on the GAMMA_LUT property (the size depends on the underlying=
 hardware).
> > > > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > > > index 4d01b4d89775..03cc53220a2a 100644
> > > > --- a/include/drm/drm_crtc.h
> > > > +++ b/include/drm/drm_crtc.h
> > > > @@ -285,6 +285,10 @@ struct drm_crtc_state {
> > > >        * Lookup table for converting pixel data after the color con=
version
> > > >        * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (=
if not
> > > >        * NULL) is an array of &struct drm_color_lut.
> > > > +      *
> > > > +      * Note that for mostly historical reasons stemming from Xorg=
 heritage,
> > > > +      * this is also used to store the color lookup table (CLUT) f=
or indexed
> > > > +      * formats like DRM_FORMAT_C8.
> > > >        */
> > > >       struct drm_property_blob *gamma_lut;
> > > >
> > > > @@ -1075,12 +1079,18 @@ struct drm_crtc {
> > > >       /**
> > > >        * @gamma_size: Size of legacy gamma ramp reported to userspa=
ce. Set up
> > > >        * by calling drm_mode_crtc_set_gamma_size().
> > > > +      *
> > > > +      * Note that atomic drivers need to instead use
> > > > +      * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt(=
).
> > > >        */
> > > >       uint32_t gamma_size;
> > > >
> > > >       /**
> > > >        * @gamma_store: Gamma ramp values used by the legacy SETGAMM=
A and
> > > >        * GETGAMMA IOCTls. Set up by calling drm_mode_crtc_set_gamma=
_size().
> > > > +      *
> > > > +      * Note that atomic drivers need to instead use
> > > > +      * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt(=
).
> > > >        */
> > > >       uint16_t *gamma_store;
> > > >
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
