Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4234992C7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 21:28:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F82110E658;
	Mon, 24 Jan 2022 20:28:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DC510E658
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 20:28:21 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 m8-20020a9d4c88000000b00592bae7944bso23914926otf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 12:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QGgSeguq4R+5oC3AmkeH6yxkdnMfQ7GF1pyD6tt0ISU=;
 b=FnPYgNALAKdOD0sha/bi6cOQ8TvwykJLJ6qJgp7WihrOnmmCHvte5bBlyFJjaKiyOy
 ozwLjzAwN0YLKmfoJXM1thE17+Ss0MeCFoIZto3oqg0zxWC/rHDq0EdLg30phratpS5M
 ezngwWmaxWQh8sLfJU+L55g5cExeuPGHBXalE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QGgSeguq4R+5oC3AmkeH6yxkdnMfQ7GF1pyD6tt0ISU=;
 b=jCXBQ5ZJ2nowhHq4X1D77S2Jo6OnhwWOFQpLyehjfn8UilRGrNGKD1e1E6ykPDwjDh
 q5TZFpnw/GenJzXwXZcbyaFy+6DYe7L61c1zfgm+Q7i2+zTCnTbxzmAFexW+dQ98ggh0
 o81AakJUwqq83UaR4B/wunOWwiemvDmhfWhXIfZMMSAjOWpzOZHoib/2u6cREN+vBhnb
 ECa77jthJ8AY7hcyhoF9N82tgWaG6NqxWC7bn8v2tikRKxt5GfqTjk0cMp/ENVa+Yef7
 TrMdmGx8dgit4SkwQTplMRualLN6nnt26g69fJNaJvTBjiFgWnTXmoLw7MravAH0ZaAv
 TaYA==
X-Gm-Message-State: AOAM5338Hbq/Txgr3DtpycO1vA89IFqUptpPZaf0kKK+2BBbkDXOPtPe
 1DsewROFdk4of61ZpTc483z4FMBJcM1LB7lEkB7H0w==
X-Google-Smtp-Source: ABdhPJygPFWBStvmFj257ktHHWwuLEfMlbMBVIBcux9w5E112cUy9Y7UMq83T3c2ZKK0oJ91144wXwOepUeQn182YIo=
X-Received: by 2002:a05:6830:1e76:: with SMTP id
 m22mr7852015otr.75.1643056101104; 
 Mon, 24 Jan 2022 12:28:21 -0800 (PST)
MIME-Version: 1.0
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
 <Ye8LBfWBr5fPTgCN@pendragon.ideasonboard.com>
In-Reply-To: <Ye8LBfWBr5fPTgCN@pendragon.ideasonboard.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 24 Jan 2022 21:28:09 +0100
Message-ID: <CAKMK7uGS5z3h-N7h5qxNfgJU0q2bhGUzCD4zd7JvED93swdtmQ@mail.gmail.com>
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

On Mon, Jan 24, 2022 at 9:24 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> Thank you for the patch.
>
> On Mon, Jan 24, 2022 at 08:47:06PM +0100, Daniel Vetter wrote:
> > Also add notes that for atomic drivers it's really somewhere else and
> > no longer in struct drm_crtc.
> >
> > Maybe we should put a bigger warning here that this is confusing,
> > since the pixel format is a plane property, but the GAMMA_LUT property
> > is on the crtc. But I think we can fix this if/when someone finds a
> > need for a per-plane CLUT, since I'm not sure such hw even exists. I'm
> > also not sure whether even hardware with a CLUT and a full color
> > correction pipeline with degamm/cgm/gamma exists.
>
> Exists, maybe, exists and has a real use case, I'd be surprised.
>
> > Motivated by comments from Geert that we have a gap here.
> >
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >  drivers/gpu/drm/drm_color_mgmt.c |  4 ++++
> >  include/drm/drm_crtc.h           | 10 ++++++++++
> >  2 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_col=
or_mgmt.c
> > index bb14f488c8f6..96ce57ad37e6 100644
> > --- a/drivers/gpu/drm/drm_color_mgmt.c
> > +++ b/drivers/gpu/drm/drm_color_mgmt.c
> > @@ -82,6 +82,10 @@
> >   *   driver boot-up state too. Drivers can access this blob through
> >   *   &drm_crtc_state.gamma_lut.
> >   *
> > + *   Note that for mostly historical reasons stemming from Xorg herita=
ge,
> > + *   this is also used to store the color lookup table (CLUT) for inde=
xed
> > + *   formats like DRM_FORMAT_C8.
>
> CLUT also stands for Cubic Look Up Table, a type of LUT commonly used
> for tone mapping that maps an RGB sample (in 3D space) to a colour.
> Compared to traditional LUTs such as gamma and degamma, it allows
> correlating colour components, while the gamma and degamma LUTs operate
> on each colour component independently.
>
> Is there any commonly used acronym for the indexed colours lookup table
> that we could use here, to avoid future confusions ?

Hm intel calls these 3DLUT, so for me there's not confusion here :-)
But also since random acronyms are bad I put both the acronym and the
full spelling into the text.

The cubic lut for me sounds more like cubic filtering from texture
units (yet another thing). Do you want me to just drop the CLUT (I
figured some people might search for that in the docs, and there's
really no other way find this) or ok this way? I don't really have a
better idea.
-Daniel

>
> Other than that,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > + *
> >   * =E2=80=9CGAMMA_LUT_SIZE=E2=80=9D:
> >   *   Unsigned range property to give the size of the lookup table to b=
e set
> >   *   on the GAMMA_LUT property (the size depends on the underlying har=
dware).
> > diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> > index 4d01b4d89775..03cc53220a2a 100644
> > --- a/include/drm/drm_crtc.h
> > +++ b/include/drm/drm_crtc.h
> > @@ -285,6 +285,10 @@ struct drm_crtc_state {
> >        * Lookup table for converting pixel data after the color convers=
ion
> >        * matrix @ctm.  See drm_crtc_enable_color_mgmt(). The blob (if n=
ot
> >        * NULL) is an array of &struct drm_color_lut.
> > +      *
> > +      * Note that for mostly historical reasons stemming from Xorg her=
itage,
> > +      * this is also used to store the color lookup table (CLUT) for i=
ndexed
> > +      * formats like DRM_FORMAT_C8.
> >        */
> >       struct drm_property_blob *gamma_lut;
> >
> > @@ -1075,12 +1079,18 @@ struct drm_crtc {
> >       /**
> >        * @gamma_size: Size of legacy gamma ramp reported to userspace. =
Set up
> >        * by calling drm_mode_crtc_set_gamma_size().
> > +      *
> > +      * Note that atomic drivers need to instead use
> > +      * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
> >        */
> >       uint32_t gamma_size;
> >
> >       /**
> >        * @gamma_store: Gamma ramp values used by the legacy SETGAMMA an=
d
> >        * GETGAMMA IOCTls. Set up by calling drm_mode_crtc_set_gamma_siz=
e().
> > +      *
> > +      * Note that atomic drivers need to instead use
> > +      * &drm_crtc_state.gamma_lut. See drm_crtc_enable_color_mgmt().
> >        */
> >       uint16_t *gamma_store;
> >
>
> --
> Regards,
>
> Laurent Pinchart



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
