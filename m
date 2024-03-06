Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCA9873FF3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FEF10E43E;
	Wed,  6 Mar 2024 18:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="hemVvDsI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DEE10E43E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 18:49:20 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-6e4e78f9272so29402a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 10:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709750959; x=1710355759;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cjUrG2lbRlJ8KCqAukVlSqLRmVsUn2Ri9jzi1i+w1xg=;
 b=hemVvDsIgfYJ119lFpTp5te6LL0AihPuQxgKzIAoUtYfOZdw/h5c4AQReb/w+emrVv
 sc9UqfFG8C4hQ4ff2XuoPqnPqvdD+Fnljcct8CS4Gr6SvAc8ylGVk+myYpJECZRvuNBx
 xjzmTYsvcg3rFIapan1+kco8H/0BWwXMaWFKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709750959; x=1710355759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cjUrG2lbRlJ8KCqAukVlSqLRmVsUn2Ri9jzi1i+w1xg=;
 b=VK91R3W+34igrfmduxcW1Xx/63XV9sFnx4UAJPbxJQl+HoU2Te5jWvNnQ60/PrZ6ER
 By1mA7UI35yf+VhkvBgrmO9U/sEZug29Pv2hpPo4W+hRwbdkZx8oPnKrclK8THZoau2F
 2mgjUrvR4fVU95PKUtNSIlG5iL/wV9FAHD7pb4TrjDeuRYbEJy/RGF1hGGJqU/f+gdXK
 k1tB3qfj/6ERNwbY001laiHMuDvSHX+Ojmx7m5uXFyyV/tVROW4wKK/Gl6AWZ447uhBC
 SRgAl2op3HuPTFdhFKkrmxR1b4l7u2RF4YW8NFQ1KrJTlA/wJmOMpyQnRpmj2OLf+Dfc
 Sxug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdvAuBkvRwYu4Y82RxWUlCTsjKRjfSjRH8VXyzIezlrd5z59mEZFB74MCDaiBL5b7gU5L3VhVE2Mo21YanxXzFyBXTLMOh8rucR7GE+HH1
X-Gm-Message-State: AOJu0Yw3n8PF6jKiyDZg4JYW0buz9fS5cCTzZ5AdHdl/R3oxk1705vpi
 kdcfIjsGhoCN1c+YG9j7RxX5NyC4nagpt5ZSoBfKYFzkHGvnz7hBsnue+bElRKkP6QtHGCHatJq
 n2y7ZUG32fPgSzO7Xt/bpQZphU7XV08D7TmG3
X-Google-Smtp-Source: AGHT+IH8ZO7kEQM/WJhdlmJw3N6phXcH22pWt3F99LyFnfAdBKtfzj/askpKhpFhZoDEo7JaVu8N4lHJ8cQednL/rIk=
X-Received: by 2002:a05:6830:22f0:b0:6e4:8a65:a222 with SMTP id
 t16-20020a05683022f000b006e48a65a222mr5642213otc.5.1709750959502; Wed, 06 Mar
 2024 10:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20240306004347.974304-1-hsinyi@chromium.org>
 <20240306004347.974304-5-hsinyi@chromium.org>
 <87msrbzpba.fsf@intel.com>
In-Reply-To: <87msrbzpba.fsf@intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 6 Mar 2024 10:48:53 -0800
Message-ID: <CAJMQK-jU6mROM8W00_Ps31Hk3S6+gj7dOSuEj7jHJfUSKx+MVA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] drm/panel-edp: Match edp_panels with panel identity
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 6, 2024 at 1:23=E2=80=AFAM Jani Nikula <jani.nikula@linux.intel=
.com> wrote:
>
> On Tue, 05 Mar 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > It's found that some panels have variants that they share the same pane=
l id
> > although their EDID and names are different. When matching generic edp
> > panels, we should first match with both panel identity, which contains =
both
> > panel id and panel name. If not found, match with panel id only.
>
> Do you want to start matching also with name, for all panels? That's
> totally up to you, but that's the big functional change here.
>

It might be difficult to find all the datasheets for all the panels to
verify the names. Also, some of the names in the panels are also
marked as "Unknown", so I think we still want to keep the matching
with id only.

Without really testing on the exact panel, I'm afraid that this might
break them.


> BR,
> Jani.
>
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > v3->v4: combine name and id to identity.
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 45 ++++++++++++++++---------------
> >  1 file changed, 24 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index d094cfc43da8..fb70e97a2e71 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -210,15 +210,12 @@ struct panel_desc {
> >   * struct edp_panel_entry - Maps panel ID to delay / panel name.
> >   */
> >  struct edp_panel_entry {
> > -     /** @panel_id: 32-bit ID for panel, encoded with drm_edid_encode_=
panel_id(). */
> > -     u32 panel_id;
> > +     /** @ident: edid identity used for panel matching. */
> > +     const struct drm_edid_ident ident;
> >
> >       /** @delay: The power sequencing delays needed for this panel. */
> >       const struct panel_delay *delay;
> >
> > -     /** @name: Name of this panel (for printing to logs). */
> > -     const char *name;
> > -
> >       /** @override_edid_mode: Override the mode obtained by edid. */
> >       const struct drm_display_mode *override_edid_mode;
> >  };
> > @@ -691,7 +688,7 @@ static int detected_panel_show(struct seq_file *s, =
void *data)
> >       else if (!p->detected_panel)
> >               seq_puts(s, "HARDCODED\n");
> >       else
> > -             seq_printf(s, "%s\n", p->detected_panel->name);
> > +             seq_printf(s, "%s\n", p->detected_panel->ident.name);
> >
> >       return 0;
> >  }
> > @@ -761,7 +758,7 @@ static void panel_edp_parse_panel_timing_node(struc=
t device *dev,
> >               dev_err(dev, "Reject override mode: No display_timing fou=
nd\n");
> >  }
> >
> > -static const struct edp_panel_entry *find_edp_panel(u32 panel_id);
> > +static const struct edp_panel_entry *find_edp_panel(u32 panel_id, cons=
t struct drm_edid *edid);
> >
> >  static int generic_edp_panel_probe(struct device *dev, struct panel_ed=
p *panel)
> >  {
> > @@ -799,7 +796,6 @@ static int generic_edp_panel_probe(struct device *d=
ev, struct panel_edp *panel)
> >       base_block =3D drm_edid_read_base_block(panel->ddc);
> >       if (base_block) {
> >               panel_id =3D drm_edid_get_panel_id(base_block);
> > -             drm_edid_free(base_block);
> >       } else {
> >               dev_err(dev, "Couldn't identify panel via EDID\n");
> >               ret =3D -EIO;
> > @@ -807,7 +803,9 @@ static int generic_edp_panel_probe(struct device *d=
ev, struct panel_edp *panel)
> >       }
> >       drm_edid_decode_panel_id(panel_id, vend, &product_id);
> >
> > -     panel->detected_panel =3D find_edp_panel(panel_id);
> > +     panel->detected_panel =3D find_edp_panel(panel_id, base_block);
> > +
> > +     drm_edid_free(base_block);
> >
> >       /*
> >        * We're using non-optimized timings and want it really obvious t=
hat
> > @@ -840,7 +838,7 @@ static int generic_edp_panel_probe(struct device *d=
ev, struct panel_edp *panel)
> >               panel->detected_panel =3D ERR_PTR(-EINVAL);
> >       } else {
> >               dev_info(dev, "Detected %s %s (%#06x)\n",
> > -                      vend, panel->detected_panel->name, product_id);
> > +                      vend, panel->detected_panel->ident.name, product=
_id);
> >
> >               /* Update the delay; everything else comes from EDID */
> >               desc->delay =3D *panel->detected_panel->delay;
> > @@ -1930,17 +1928,21 @@ static const struct panel_delay delay_200_500_e=
50_po2e200 =3D {
> >
> >  #define EDP_PANEL_ENTRY(vend_chr_0, vend_chr_1, vend_chr_2, product_id=
, _delay, _name) \
> >  { \
> > -     .name =3D _name, \
> > -     .panel_id =3D drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, ve=
nd_chr_2, \
> > -                                          product_id), \
> > +     .ident =3D { \
> > +             .name =3D _name, \
> > +             .panel_id =3D drm_edid_encode_panel_id(vend_chr_0, vend_c=
hr_1, vend_chr_2, \
> > +                                                  product_id), \
> > +     }, \
> >       .delay =3D _delay \
> >  }
> >
> >  #define EDP_PANEL_ENTRY2(vend_chr_0, vend_chr_1, vend_chr_2, product_i=
d, _delay, _name, _mode) \
> >  { \
> > -     .name =3D _name, \
> > -     .panel_id =3D drm_edid_encode_panel_id(vend_chr_0, vend_chr_1, ve=
nd_chr_2, \
> > -                                          product_id), \
> > +     .ident =3D { \
> > +             .name =3D _name, \
> > +             .panel_id =3D drm_edid_encode_panel_id(vend_chr_0, vend_c=
hr_1, vend_chr_2, \
> > +                                                  product_id), \
> > +     }, \
> >       .delay =3D _delay, \
> >       .override_edid_mode =3D _mode \
> >  }
> > @@ -2087,15 +2089,16 @@ static const struct edp_panel_entry edp_panels[=
] =3D {
> >       { /* sentinal */ }
> >  };
> >
> > -static const struct edp_panel_entry *find_edp_panel(u32 panel_id)
> > +static const struct edp_panel_entry *find_edp_panel(u32 panel_id, cons=
t struct drm_edid *edid)
> >  {
> >       const struct edp_panel_entry *panel;
> >
> > -     if (!panel_id)
> > -             return NULL;
> > +     for (panel =3D edp_panels; panel->ident.panel_id; panel++)
> > +             if (drm_edid_match_identity(edid, &panel->ident))
> > +                     return panel;
> >
> > -     for (panel =3D edp_panels; panel->panel_id; panel++)
> > -             if (panel->panel_id =3D=3D panel_id)
> > +     for (panel =3D edp_panels; panel->ident.panel_id; panel++)
> > +             if (panel->ident.panel_id =3D=3D panel_id)
> >                       return panel;
> >
> >       return NULL;
>
> --
> Jani Nikula, Intel
