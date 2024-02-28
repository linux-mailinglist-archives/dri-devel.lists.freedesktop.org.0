Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB9986A500
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 02:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E37C110E953;
	Wed, 28 Feb 2024 01:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="fTYRg9md";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F26210E953
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 01:27:57 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-21e8a740439so157504fac.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 17:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709083676; x=1709688476;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0dxfTrIeGuxrLyxuOISFvFT3KpY95fspH4sv4tIhPI0=;
 b=fTYRg9md0nm0Ix9qcWrDve1YBAbXJwemZkW4WSc2KOUcseRuj3HOf066C3xu+yxzdp
 5SsFFZFzkFk2Yut809Mtu+LtWWHtTtUIdqxjFYzonam8ngkyR769qwejIs+NAuocMjPL
 Etn+iAKL3PW1JZSioYM1sKO1EBlCMA+yFDego=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709083676; x=1709688476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0dxfTrIeGuxrLyxuOISFvFT3KpY95fspH4sv4tIhPI0=;
 b=ePjim6rd/waQTuLtuP7yPziZIIDUmutNFlcSGHO+9qX+VSfe4zYS4xvcVrrqSNqKjJ
 He/BSoRtWCSTgC/0e12ygpFH2+NXPizvqYyL9yKQACCD2lLi84mdFpZnYZuHz0N4eekP
 quVY2JjfD8Um5+rHJ1ZBx2HgL884fhsVSBF+BQ4UQLrvIpBtfzHRVojIlC0RSzDLSvVy
 K9a9OF6CskFKOlE5rVll3FT6xf1B4/XxGBLjYla0Nrjk0ULvupA+R1mh0iPKd5IZj3SA
 a0Syh8m5qww3vwSGW87gis2hJR/V8O4L5ZznqUFMubDNAYm1MNpNzT/Yz6VQN8/gH7Ly
 mmaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbYBIppbXQQLarOdYszRNPGtTLm/IyXjnqB0983g3Y6UAdhvFq0TBJxKeU1ogmRICnukzwNJiLmeWEjNQVu51Gkuffolj+O9GBW/sXeNNk
X-Gm-Message-State: AOJu0YwhfE0Hfm+wVQeq+WyTUTRUNAZLY8ENGNk7OvxQIR/UYlHwKC0E
 /IdkqbzzYvf0cBfYCpJLDnS4RNMnTtzGp/xk/BlO73kO4KWKD5bDQDoLLeWcwYu9vMISb9rJ7Tf
 dVo5qkDJyAVm1XUUAj8iGabaA9ayx4JmjK98p
X-Google-Smtp-Source: AGHT+IHqTW+E+2DQPHcqL4YIkPCYB/B/51xhy690aev+KstBxVrO/Upt/E3fmt5OcYTiHRheu2KC8KpuQFsk7tVF8Ro=
X-Received: by 2002:a05:6870:5b9a:b0:21f:8eec:f19f with SMTP id
 em26-20020a0568705b9a00b0021f8eecf19fmr450959oab.12.1709083676221; Tue, 27
 Feb 2024 17:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20240223223958.3887423-1-hsinyi@chromium.org>
 <20240223223958.3887423-2-hsinyi@chromium.org>
 <87wmqqjmt9.fsf@intel.com>
In-Reply-To: <87wmqqjmt9.fsf@intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 27 Feb 2024 17:27:30 -0800
Message-ID: <CAJMQK-jSPg6vU3SLmRy7zwNHJ4yqO2hT6RaiYxA4ifZ7CzwD9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm_edid: Add a function to get EDID base block
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
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

On Tue, Feb 27, 2024 at 1:09=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 23 Feb 2024, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> > It's found that some panels have variants that they share the same pane=
l id
> > although their EDID and names are different. Besides panel id, now we n=
eed
> > the hash of entire EDID base block to distinguish these panel variants.
> >
> > Add drm_edid_get_base_block to returns the EDID base block, so caller c=
an
> > further use it to get panel id and/or the hash.
>
> Please reconsider the whole approach here.
>
> Please let's not add single-use special case functions to read an EDID
> base block.
>
> Please consider reading the whole EDID, using the regular EDID reading
> functions, and use that instead.
>
> Most likely you'll only have 1-2 blocks anyway. And you might consider
> caching the EDID in struct panel_edp if reading the entire EDID is too
> slow. (And if it is, this is probably sensible even if the EDID only
> consists of one block.)
>
> Anyway, please do *not* merge this as-is.
>

hi Jani,

I sent a v2 here implementing this method:
https://lore.kernel.org/lkml/20240228011133.1238439-2-hsinyi@chromium.org/

We still have to read edid twice due to:
1. The first caller is in panel probe, at that time, connector is
still unknown, so we can't update connector status (eg. update
edid_corrupt).
2. It's possible that the connector can have some override
(drm_edid_override_get) to EDID, that is still unknown during the
first read.

> BR,
> Jani.
>
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_edid.c        | 55 +++++++++++++++++--------------
> >  drivers/gpu/drm/panel/panel-edp.c |  8 +++--
> >  include/drm/drm_edid.h            |  3 +-
> >  3 files changed, 38 insertions(+), 28 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> > index 923c4423151c..55598ca4a5d1 100644
> > --- a/drivers/gpu/drm/drm_edid.c
> > +++ b/drivers/gpu/drm/drm_edid.c
> > @@ -2770,58 +2770,63 @@ static u32 edid_extract_panel_id(const struct e=
did *edid)
> >  }
> >
> >  /**
> > - * drm_edid_get_panel_id - Get a panel's ID through DDC
> > - * @adapter: I2C adapter to use for DDC
> > + * drm_edid_get_panel_id - Get a panel's ID from EDID base block
> > + * @base_bock: EDID base block that contains panel ID.
> >   *
> > - * This function reads the first block of the EDID of a panel and (ass=
uming
> > + * This function uses the first block of the EDID of a panel and (assu=
ming
> >   * that the EDID is valid) extracts the ID out of it. The ID is a 32-b=
it value
> >   * (16 bits of manufacturer ID and 16 bits of per-manufacturer ID) tha=
t's
> >   * supposed to be different for each different modem of panel.
> >   *
> > + * Return: A 32-bit ID that should be different for each make/model of=
 panel.
> > + *         See the functions drm_edid_encode_panel_id() and
> > + *         drm_edid_decode_panel_id() for some details on the structur=
e of this
> > + *         ID.
> > + */
> > +u32 drm_edid_get_panel_id(void *base_block)
> > +{
> > +     return edid_extract_panel_id(base_block);
> > +}
> > +EXPORT_SYMBOL(drm_edid_get_panel_id);
> > +
> > +/**
> > + * drm_edid_get_base_block - Get a panel's EDID base block
> > + * @adapter: I2C adapter to use for DDC
> > + *
> > + * This function returns the first block of the EDID of a panel.
> > + *
> >   * This function is intended to be used during early probing on device=
s where
> >   * more than one panel might be present. Because of its intended use i=
t must
> > - * assume that the EDID of the panel is correct, at least as far as th=
e ID
> > - * is concerned (in other words, we don't process any overrides here).
> > + * assume that the EDID of the panel is correct, at least as far as th=
e base
> > + * block is concerned (in other words, we don't process any overrides =
here).
> >   *
> >   * NOTE: it's expected that this function and drm_do_get_edid() will b=
oth
> >   * be read the EDID, but there is no caching between them. Since we're=
 only
> >   * reading the first block, hopefully this extra overhead won't be too=
 big.
> >   *
> > - * Return: A 32-bit ID that should be different for each make/model of=
 panel.
> > - *         See the functions drm_edid_encode_panel_id() and
> > - *         drm_edid_decode_panel_id() for some details on the structur=
e of this
> > - *         ID.
> > + * Caller should free the base block after use.
> >   */
> > -
> > -u32 drm_edid_get_panel_id(struct i2c_adapter *adapter)
> > +void *drm_edid_get_base_block(struct i2c_adapter *adapter)
> >  {
> >       enum edid_block_status status;
> >       void *base_block;
> > -     u32 panel_id =3D 0;
> > -
> > -     /*
> > -      * There are no manufacturer IDs of 0, so if there is a problem r=
eading
> > -      * the EDID then we'll just return 0.
> > -      */
> >
> >       base_block =3D kzalloc(EDID_LENGTH, GFP_KERNEL);
> >       if (!base_block)
> > -             return 0;
> > +             return NULL;
> >
> >       status =3D edid_block_read(base_block, 0, drm_do_probe_ddc_edid, =
adapter);
> >
> >       edid_block_status_print(status, base_block, 0);
> >
> > -     if (edid_block_status_valid(status, edid_block_tag(base_block)))
> > -             panel_id =3D edid_extract_panel_id(base_block);
> > -     else
> > +     if (!edid_block_status_valid(status, edid_block_tag(base_block)))=
 {
> >               edid_block_dump(KERN_NOTICE, base_block, 0);
> > +             return NULL;
> > +     }
> >
> > -     kfree(base_block);
> > -
> > -     return panel_id;
> > +     return base_block;
> >  }
> > -EXPORT_SYMBOL(drm_edid_get_panel_id);
> > +EXPORT_SYMBOL(drm_edid_get_base_block);
> >
> >  /**
> >   * drm_get_edid_switcheroo - get EDID data for a vga_switcheroo output
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/=
panel-edp.c
> > index bd71d239272a..f6ddbaa103b5 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -763,6 +763,7 @@ static const struct edp_panel_entry *find_edp_panel=
(u32 panel_id);
> >  static int generic_edp_panel_probe(struct device *dev, struct panel_ed=
p *panel)
> >  {
> >       struct panel_desc *desc;
> > +     void *base_block;
> >       u32 panel_id;
> >       char vend[4];
> >       u16 product_id;
> > @@ -792,8 +793,11 @@ static int generic_edp_panel_probe(struct device *=
dev, struct panel_edp *panel)
> >               goto exit;
> >       }
> >
> > -     panel_id =3D drm_edid_get_panel_id(panel->ddc);
> > -     if (!panel_id) {
> > +     base_block =3D drm_edid_get_base_block(panel->ddc);
> > +     if (base_block) {
> > +             panel_id =3D drm_edid_get_panel_id(base_block);
> > +             kfree(base_block);
> > +     } else {
> >               dev_err(dev, "Couldn't identify panel via EDID\n");
> >               ret =3D -EIO;
> >               goto exit;
> > diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> > index 7923bc00dc7a..56b60f9204d3 100644
> > --- a/include/drm/drm_edid.h
> > +++ b/include/drm/drm_edid.h
> > @@ -410,7 +410,8 @@ struct edid *drm_do_get_edid(struct drm_connector *=
connector,
> >       void *data);
> >  struct edid *drm_get_edid(struct drm_connector *connector,
> >                         struct i2c_adapter *adapter);
> > -u32 drm_edid_get_panel_id(struct i2c_adapter *adapter);
> > +void *drm_edid_get_base_block(struct i2c_adapter *adapter);
> > +u32 drm_edid_get_panel_id(void *base_block);
> >  struct edid *drm_get_edid_switcheroo(struct drm_connector *connector,
> >                                    struct i2c_adapter *adapter);
> >  struct edid *drm_edid_duplicate(const struct edid *edid);
>
> --
> Jani Nikula, Intel
