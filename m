Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 008C954B166
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 14:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D3010E8A4;
	Tue, 14 Jun 2022 12:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7220B10E8A4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:42:26 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 3-20020a17090a174300b001e426a02ac5so11669693pjm.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HPXZMugwF8U5cyGnogbloDKpb8RcG59LeLMTaG0UqXI=;
 b=D0wcJbRqX6bnRTGbwX2JxXRab0jTfZSmMGwI/vG2dDiRrOB1ByEILLIh1I6fRuq38Z
 iNOnBxdowNaxqax2/MmRKb9ZuF9EDMaL+QXWkZ49iAfz7yIfrFxD03cWZqpdXH9HtSaW
 tZLWZGKcwaVda1g6UvvEhoNZzEhP8Rfme1iAFUXsV3BC5IDyryWZo2AL2NecU5ZFOc6Q
 /zvOIbNSGXSICT/LI/RIJNnb7cInI4UBRn3pKnfj+TDAKVgcRyfyU+2GOScJjTnc6r0Y
 IPnGIdcR9yf5a4h54Sui4nxA2Kks9/DHIUWu9ssHei1/vSV7Gz3edD3hnjRLTEQDeBS8
 yuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HPXZMugwF8U5cyGnogbloDKpb8RcG59LeLMTaG0UqXI=;
 b=y1Tm8aAhifdolfJXrSUqf3Z79neaKmLODuYkRSeavbTYPsZ5uRWh5uPuISfZkmpaU2
 FmS0BEcOkAd2jKiXKPBKizYTdsn1We5Dgo0wMUkJkB01zU7hZzAzzM4nyJoawtHMdWyf
 tcIEhV+HiFXSKPV6bae1BOCUuUQ4Si/hGEeYaJQ/vjWIj8zngUktdQAlPHWyTLNIxgHY
 PcZOIhddnayj6mXS9hfHhanCroRb3xLMLLL0jwGqH4lVsDiCVnGBGyTGKWK1uLQDoD7f
 t+eJQJbi0WegB6dhqp6VzEC+WGgBt+bV2hAz2t7EdZCfaisK+wgqoJfY/D5xl1qxwBAu
 5d9g==
X-Gm-Message-State: AJIora+vfXgeHNs17gvU/1sr8w69x9VzsX74EFUOFLXChD+EvE04eY/P
 Zle9zcGOf+Tr++ZyUBVdwtSycX39SIyEA6C11Tc=
X-Google-Smtp-Source: AGRyM1s1LGgYiDFAfHFTwvssxk+twtU3LjHnPyIxHA3EBgy0r53+1MJvke8mrXgmR/DZQOb48C8vNrf6/QlbmXpi/VI=
X-Received: by 2002:a17:903:40c9:b0:167:5fce:a5e with SMTP id
 t9-20020a17090340c900b001675fce0a5emr4293248pld.6.1655210545847; Tue, 14 Jun
 2022 05:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220613123436.15185-1-patrik.r.jakobsson@gmail.com>
 <20220613123436.15185-10-patrik.r.jakobsson@gmail.com>
 <db8344eb-d806-a3e2-9613-3d95c348366f@suse.de>
In-Reply-To: <db8344eb-d806-a3e2-9613-3d95c348366f@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 14 Jun 2022 14:42:14 +0200
Message-ID: <CAMeQTsZKgEPdqXZCFNY9ik7HuWaPHjEVfhNBknH1ahV3ozJOQg@mail.gmail.com>
Subject: Re: [PATCH 09/19] drm/gma500: Unify *_intel_lvds_mode_fixup()
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 14, 2022 at 9:23 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi
>
> Am 13.06.22 um 14:34 schrieb Patrik Jakobsson:
> > These functions mostly do the same thing so unify them. Change a check
> > of !IS_MRST() to IS_PSB() to not change the behaviour for CDV.
> >
> > Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> > ---
> >   drivers/gpu/drm/gma500/cdv_intel_lvds.c | 51 +------------------
> >   drivers/gpu/drm/gma500/gma_lvds.c       | 59 ++++++++++++++++++++++
> >   drivers/gpu/drm/gma500/gma_lvds.h       |  3 ++
> >   drivers/gpu/drm/gma500/oaktrail_lvds.c  |  2 +-
> >   drivers/gpu/drm/gma500/psb_intel_lvds.c | 65 +-----------------------=
-
> >   5 files changed, 65 insertions(+), 115 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/=
gma500/cdv_intel_lvds.c
> > index 61dc65964e21..65532308f1e7 100644
> > --- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> > +++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
> > @@ -39,55 +39,6 @@
> >   #define PSB_BACKLIGHT_PWM_CTL_SHIFT (16)
> >   #define PSB_BACKLIGHT_PWM_POLARITY_BIT_CLEAR (0xFFFE)
> >
> > -static bool cdv_intel_lvds_mode_fixup(struct drm_encoder *encoder,
> > -                               const struct drm_display_mode *mode,
> > -                               struct drm_display_mode *adjusted_mode)
> > -{
> > -     struct drm_device *dev =3D encoder->dev;
> > -     struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> > -     struct psb_intel_mode_device *mode_dev =3D &dev_priv->mode_dev;
> > -     struct drm_encoder *tmp_encoder;
> > -     struct drm_display_mode *panel_fixed_mode =3D mode_dev->panel_fix=
ed_mode;
> > -
> > -     /* Should never happen!! */
> > -     list_for_each_entry(tmp_encoder, &dev->mode_config.encoder_list,
> > -                         head) {
> > -             if (tmp_encoder !=3D encoder
> > -                 && tmp_encoder->crtc =3D=3D encoder->crtc) {
> > -                     pr_err("Can't enable LVDS and another encoder on =
the same pipe\n");
> > -                     return false;
> > -             }
> > -     }
> > -
> > -     /*
> > -      * If we have timings from the BIOS for the panel, put them in
> > -      * to the adjusted mode.  The CRTC will be set up for this mode,
> > -      * with the panel scaling set up to source from the H/VDisplay
> > -      * of the original mode.
> > -      */
> > -     if (panel_fixed_mode !=3D NULL) {
> > -             adjusted_mode->hdisplay =3D panel_fixed_mode->hdisplay;
> > -             adjusted_mode->hsync_start =3D panel_fixed_mode->hsync_st=
art;
> > -             adjusted_mode->hsync_end =3D panel_fixed_mode->hsync_end;
> > -             adjusted_mode->htotal =3D panel_fixed_mode->htotal;
> > -             adjusted_mode->vdisplay =3D panel_fixed_mode->vdisplay;
> > -             adjusted_mode->vsync_start =3D panel_fixed_mode->vsync_st=
art;
> > -             adjusted_mode->vsync_end =3D panel_fixed_mode->vsync_end;
> > -             adjusted_mode->vtotal =3D panel_fixed_mode->vtotal;
> > -             adjusted_mode->clock =3D panel_fixed_mode->clock;
> > -             drm_mode_set_crtcinfo(adjusted_mode,
> > -                                   CRTC_INTERLACE_HALVE_V);
> > -     }
> > -
> > -     /*
> > -      * XXX: It would be nice to support lower refresh rates on the
> > -      * panels to reduce power consumption, and perhaps match the
> > -      * user's requested refresh rate.
> > -      */
> > -
> > -     return true;
> > -}
> > -
> >   static void cdv_intel_lvds_prepare(struct drm_encoder *encoder)
> >   {
> >       struct drm_device *dev =3D encoder->dev;
> > @@ -255,7 +206,7 @@ static int cdv_intel_lvds_set_property(struct drm_c=
onnector *connector,
> >   static const struct drm_encoder_helper_funcs
> >                                       cdv_intel_lvds_helper_funcs =3D {
> >       .dpms =3D gma_lvds_encoder_dpms,
> > -     .mode_fixup =3D cdv_intel_lvds_mode_fixup,
> > +     .mode_fixup =3D gma_lvds_mode_fixup,
> >       .prepare =3D cdv_intel_lvds_prepare,
> >       .mode_set =3D cdv_intel_lvds_mode_set,
> >       .commit =3D cdv_intel_lvds_commit,
> > diff --git a/drivers/gpu/drm/gma500/gma_lvds.c b/drivers/gpu/drm/gma500=
/gma_lvds.c
> > index 19679ee36062..32ecf5835828 100644
> > --- a/drivers/gpu/drm/gma500/gma_lvds.c
> > +++ b/drivers/gpu/drm/gma500/gma_lvds.c
> > @@ -209,3 +209,62 @@ void gma_lvds_restore(struct drm_connector *connec=
tor)
> >       }
> >   }
> >
> > +bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
> > +                      const struct drm_display_mode *mode,
> > +                      struct drm_display_mode *adjusted_mode)
> > +{
> > +     struct drm_device *dev =3D encoder->dev;
> > +     struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> > +     struct psb_intel_mode_device *mode_dev =3D &dev_priv->mode_dev;
> > +     struct gma_crtc *gma_crtc =3D to_gma_crtc(encoder->crtc);
> > +     struct drm_encoder *tmp_encoder;
> > +     struct drm_display_mode *panel_fixed_mode =3D mode_dev->panel_fix=
ed_mode;
> > +
> > +     /* PSB requires the LVDS is on pipe B, MRST has only one pipe any=
way */
> > +     if (IS_PSB(dev) && gma_crtc->pipe =3D=3D 0) {
> > +             pr_err("Can't support LVDS on pipe A\n");
> > +             return false;
> > +     }
> > +     if (IS_MRST(dev) && gma_crtc->pipe !=3D 0) {
> > +             pr_err("Must use PIPE A\n");
> > +             return false;
> > +     }
>
> In my experience, per-model branching is horrible for maintenance.
>
> I suggest to keep a _lvds_mode_fixup function for each model, each wit
> the rsp model. The rest of gma_lvds_mode_fixup() can than be a shared
> helper for all those model-specific functions.

Hi Thomas, thanks for having a look.

I wasn't sure if I wanted to refactor the code in this series or not
so I ended up just doing the unification. I fully agree that the
IS_*() checks are horrible and need fixing in most cases. And as Sam
mentioned in 1/19 there are ways to clean up the code as well.

For the above code the even better way to do it is to use the device's
lvds_mask. That way the code can be device-independent and all chips
can use it.

I can respin this series with refactoring/cleanup included or I can
send out a v2 with the initialized macro and send the
refactoring/cleanup as a separate series.

Which do you prefer?

-Patrik

>
> > +     /* Should never happen!! */
> > +     list_for_each_entry(tmp_encoder, &dev->mode_config.encoder_list,
> > +                         head) {
> > +             if (tmp_encoder !=3D encoder
> > +                 && tmp_encoder->crtc =3D=3D encoder->crtc) {
> > +                     pr_err("Can't enable LVDS and another encoder on =
the same pipe\n");
> > +                     return false;
> > +             }
> > +     }
> > +
> > +     /*
> > +      * If we have timings from the BIOS for the panel, put them in
> > +      * to the adjusted mode.  The CRTC will be set up for this mode,
> > +      * with the panel scaling set up to source from the H/VDisplay
> > +      * of the original mode.
> > +      */
> > +     if (panel_fixed_mode !=3D NULL) {
> > +             adjusted_mode->hdisplay =3D panel_fixed_mode->hdisplay;
> > +             adjusted_mode->hsync_start =3D panel_fixed_mode->hsync_st=
art;
> > +             adjusted_mode->hsync_end =3D panel_fixed_mode->hsync_end;
> > +             adjusted_mode->htotal =3D panel_fixed_mode->htotal;
> > +             adjusted_mode->vdisplay =3D panel_fixed_mode->vdisplay;
> > +             adjusted_mode->vsync_start =3D panel_fixed_mode->vsync_st=
art;
> > +             adjusted_mode->vsync_end =3D panel_fixed_mode->vsync_end;
> > +             adjusted_mode->vtotal =3D panel_fixed_mode->vtotal;
> > +             adjusted_mode->clock =3D panel_fixed_mode->clock;
> > +             drm_mode_set_crtcinfo(adjusted_mode,
> > +                                   CRTC_INTERLACE_HALVE_V);
> > +     }
> > +
> > +     /*
> > +      * XXX: It would be nice to support lower refresh rates on the
> > +      * panels to reduce power consumption, and perhaps match the
> > +      * user's requested refresh rate.
> > +      */
> > +
> > +     return true;
> > +}
> > +
> > diff --git a/drivers/gpu/drm/gma500/gma_lvds.h b/drivers/gpu/drm/gma500=
/gma_lvds.h
> > index eee0da00a0cf..950ab7b88ad6 100644
> > --- a/drivers/gpu/drm/gma500/gma_lvds.h
> > +++ b/drivers/gpu/drm/gma500/gma_lvds.h
> > @@ -30,5 +30,8 @@ enum drm_mode_status gma_lvds_mode_valid(struct drm_c=
onnector *connector,
> >   void gma_lvds_encoder_dpms(struct drm_encoder *encoder, int mode);
> >   void gma_lvds_save(struct drm_connector *connector);
> >   void gma_lvds_restore(struct drm_connector *connector);
> > +bool gma_lvds_mode_fixup(struct drm_encoder *encoder,
> > +                      const struct drm_display_mode *mode,
> > +                      struct drm_display_mode *adjusted_mode);
> >
> >   #endif
> > diff --git a/drivers/gpu/drm/gma500/oaktrail_lvds.c b/drivers/gpu/drm/g=
ma500/oaktrail_lvds.c
> > index 00ec4fea4c12..16699b0fbbc9 100644
> > --- a/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > +++ b/drivers/gpu/drm/gma500/oaktrail_lvds.c
> > @@ -134,7 +134,7 @@ static void oaktrail_lvds_commit(struct drm_encoder=
 *encoder)
> >
> >   static const struct drm_encoder_helper_funcs oaktrail_lvds_helper_fun=
cs =3D {
> >       .dpms =3D gma_lvds_encoder_dpms,
> > -     .mode_fixup =3D psb_intel_lvds_mode_fixup,
> > +     .mode_fixup =3D gma_lvds_mode_fixup,
> >       .prepare =3D oaktrail_lvds_prepare,
> >       .mode_set =3D oaktrail_lvds_mode_set,
> >       .commit =3D oaktrail_lvds_commit,
> > diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/=
gma500/psb_intel_lvds.c
> > index 6e5abb670bff..317bd1fcfa2a 100644
> > --- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
> > +++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
> > @@ -132,69 +132,6 @@ void psb_intel_lvds_set_brightness(struct drm_devi=
ce *dev, int level)
> >               psb_lvds_pwm_set_brightness(dev, level);
> >   }
> >
> > -bool psb_intel_lvds_mode_fixup(struct drm_encoder *encoder,
> > -                               const struct drm_display_mode *mode,
> > -                               struct drm_display_mode *adjusted_mode)
> > -{
> > -     struct drm_device *dev =3D encoder->dev;
> > -     struct drm_psb_private *dev_priv =3D to_drm_psb_private(dev);
> > -     struct psb_intel_mode_device *mode_dev =3D &dev_priv->mode_dev;
> > -     struct gma_crtc *gma_crtc =3D to_gma_crtc(encoder->crtc);
> > -     struct drm_encoder *tmp_encoder;
> > -     struct drm_display_mode *panel_fixed_mode =3D mode_dev->panel_fix=
ed_mode;
> > -     struct gma_encoder *gma_encoder =3D to_gma_encoder(encoder);
> > -
> > -     if (gma_encoder->type =3D=3D INTEL_OUTPUT_MIPI2)
> > -             panel_fixed_mode =3D mode_dev->panel_fixed_mode2;
>
> What happened to this test? I cannot see it in the new helper.

We don't have MIPI support so I removed the test. I forgot to mention
it in this patch. Other patches should have a note about it when I
remove MIPI code.





>
> Best regards
> Thomas
>
> > -
> > -     /* PSB requires the LVDS is on pipe B, MRST has only one pipe any=
way */
> > -     if (!IS_MRST(dev) && gma_crtc->pipe =3D=3D 0) {
> > -             pr_err("Can't support LVDS on pipe A\n");
> > -             return false;
> > -     }
> > -     if (IS_MRST(dev) && gma_crtc->pipe !=3D 0) {
> > -             pr_err("Must use PIPE A\n");
> > -             return false;
> > -     }
> > -     /* Should never happen!! */
> > -     list_for_each_entry(tmp_encoder, &dev->mode_config.encoder_list,
> > -                         head) {
> > -             if (tmp_encoder !=3D encoder
> > -                 && tmp_encoder->crtc =3D=3D encoder->crtc) {
> > -                     pr_err("Can't enable LVDS and another encoder on =
the same pipe\n");
> > -                     return false;
> > -             }
> > -     }
> > -
> > -     /*
> > -      * If we have timings from the BIOS for the panel, put them in
> > -      * to the adjusted mode.  The CRTC will be set up for this mode,
> > -      * with the panel scaling set up to source from the H/VDisplay
> > -      * of the original mode.
> > -      */
> > -     if (panel_fixed_mode !=3D NULL) {
> > -             adjusted_mode->hdisplay =3D panel_fixed_mode->hdisplay;
> > -             adjusted_mode->hsync_start =3D panel_fixed_mode->hsync_st=
art;
> > -             adjusted_mode->hsync_end =3D panel_fixed_mode->hsync_end;
> > -             adjusted_mode->htotal =3D panel_fixed_mode->htotal;
> > -             adjusted_mode->vdisplay =3D panel_fixed_mode->vdisplay;
> > -             adjusted_mode->vsync_start =3D panel_fixed_mode->vsync_st=
art;
> > -             adjusted_mode->vsync_end =3D panel_fixed_mode->vsync_end;
> > -             adjusted_mode->vtotal =3D panel_fixed_mode->vtotal;
> > -             adjusted_mode->clock =3D panel_fixed_mode->clock;
> > -             drm_mode_set_crtcinfo(adjusted_mode,
> > -                                   CRTC_INTERLACE_HALVE_V);
> > -     }
> > -
> > -     /*
> > -      * XXX: It would be nice to support lower refresh rates on the
> > -      * panels to reduce power consumption, and perhaps match the
> > -      * user's requested refresh rate.
> > -      */
> > -
> > -     return true;
> > -}
> > -
> >   static void psb_intel_lvds_prepare(struct drm_encoder *encoder)
> >   {
> >       struct drm_device *dev =3D encoder->dev;
> > @@ -365,7 +302,7 @@ int psb_intel_lvds_set_property(struct drm_connecto=
r *connector,
> >
> >   static const struct drm_encoder_helper_funcs psb_intel_lvds_helper_fu=
ncs =3D {
> >       .dpms =3D gma_lvds_encoder_dpms,
> > -     .mode_fixup =3D psb_intel_lvds_mode_fixup,
> > +     .mode_fixup =3D gma_lvds_mode_fixup,
> >       .prepare =3D psb_intel_lvds_prepare,
> >       .mode_set =3D psb_intel_lvds_mode_set,
> >       .commit =3D psb_intel_lvds_commit,
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
