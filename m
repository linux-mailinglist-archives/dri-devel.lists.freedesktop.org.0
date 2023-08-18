Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057B9780C9C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E577E10E516;
	Fri, 18 Aug 2023 13:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8672A10E516
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:37:34 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-26934bc3059so1470136a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692365854; x=1692970654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HJWL7g3WawHT9Eqplual+QY+Lbi23cpsPvbekYPjBnM=;
 b=OiRHoyQuAeILH8L1p9NOtXuqIhGsmUYCGmRLd3ZCTixSpbsR4SC9Vv/0LO2HlNqCaO
 f0jgV5dNXs8gzIDX9EzziuJ6hjs4HcZgfn3cFjYMhdQPbLxxu8q2DyRxeTOnqMkPTTBc
 ViKx4NpwnOOIcBZ3nisYkJtghFyJWfhUXMOOEloisHYWVP0+02dTGfdqR8BR2hXPWk4Z
 4Jx6Nb3n6fVdwjk1qJtT0RSC8go86kSPZsgu36RwIEn/6esLdxd0HCN+evw1j7FVIkYv
 HhaPhG8fjUUwoyEyJdWr+0SiFybMvmNhuLFwK5C6LyUo2Xh3naoiBnHjKMVj48zXgfKV
 H2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692365854; x=1692970654;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HJWL7g3WawHT9Eqplual+QY+Lbi23cpsPvbekYPjBnM=;
 b=Wq6QDYNWy0el29acMqcBT+h6wFFNosX/TZZ1bLkHHm8wkjzy+ig0CqjSJ3ovGz0hyy
 LNRAeBrH7P7f7Abv7n6aDsfkH9LFUfG7IwVy9W2YNZwf4ADCFdLX2UEHhFlh7k6o7PgS
 X2zygL+xQrykVHZF91UJngfU61iSLZVnNqLc0kTe8zLIke898RaHU7WyJkW3qmskqBpL
 4ZO6KUPQgygTQQ0ZIGZMIs5rALJcdds32zykstiJV8blVHMtdFq+ZPgcZKHGyLuilL40
 c8B2CXY61OyiHHpnoDw+VZN9W5AfL+q8nMBmL7PTSeprtvFBRc1ljZ+qkVvC8j1jlAhy
 OF2Q==
X-Gm-Message-State: AOJu0YzU5T+p88KUFM8gPY809t2qnLETvNsBFDWqZGnj71fkREd7LZvl
 VvMjgqMLEFJdfLptr/TWjzfGM/dvIhOVwmW1Ws8=
X-Google-Smtp-Source: AGHT+IGJucO45ZtG3erRbHMLsXdJR2CIx86aPA1L0ETefZyEQMEBv0FAMBmP7zAH+6nstox13VMTuKHX5d6z6nwSR2M=
X-Received: by 2002:a17:90a:b015:b0:26d:5094:13ea with SMTP id
 x21-20020a17090ab01500b0026d509413eamr1756836pjq.0.1692365853797; Fri, 18 Aug
 2023 06:37:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-8-biju.das.jz@bp.renesas.com>
 <CAHCN7xKo4Gnt+3rBgNyHq5tAAWU+nUpfJjzgb4RSPrgOgRsuyw@mail.gmail.com>
 <OS0PR01MB59226206B73CB28275EB9C3A861BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59226206B73CB28275EB9C3A861BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 18 Aug 2023 08:37:22 -0500
Message-ID: <CAHCN7xJZOSaGGQG56qmivYFAEzJayaOVF8qkhsZt5Jt_APN_nA@mail.gmail.com>
Subject: Re: [PATCH 7/7] drm: adv7511: Add hpd_override_enable feature bit to
 struct adv7511_chip_info
To: Biju Das <biju.das.jz@bp.renesas.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Bogdan Togorean <bogdan.togorean@analog.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 8:35=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Adam Ford,
>
> Thanks for the feedback.
>
> > Subject: Re: [PATCH 7/7] drm: adv7511: Add hpd_override_enable feature =
bit
> > to struct adv7511_chip_info
> >
> > On Sun, Aug 13, 2023 at 1:06=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com>
> > wrote:
> > >
> > > As per spec, it is allowed to pulse the HPD signal to indicate that
> > > the EDID information has changed. Some monitors do this when they wak=
e
> > > up from standby or are enabled. When the HPD goes low the adv7511 is
> > > reset and the outputs are disabled which might cause the monitor to g=
o
> > > to standby again. To avoid this we ignore the HPD pin for the first
> > > few seconds after enabling the output. On the other hand,
> > > adv7535 require to enable HPD Override bit for proper HPD.
> > >
> > > Add hpd_override_enable feature bit to struct adv7511_chip_info to
> > > handle this scenario.
> > >
> > > While at it, drop the enum adv7511_type as it is unused.
> >
> > It seems like dropping adv7511_type is unrelated to the rest of the pat=
ch,
> > and I think it should be split from this into its own patch
>
> With this patch, there is no user for adv7511_type that is the
> reason it is added here. I thought that is the common practice.
>
I wasn't sure.

> Please correct me if that is not the case.

I'll defer to the maintainers.  In general I like the series because
it reduces the number of compare evaluations.  I'll try to run some
tests on a board that I have with a adv7535 this weekend.

adam
>
> Cheers,
> Biju
>
> >
> > adam
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  drivers/gpu/drm/bridge/adv7511/adv7511.h     |  8 +-------
> > >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 12 +++++-------
> > >  2 files changed, 6 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > index 627531f48f84..c523ac4c9bc8 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> > > @@ -325,22 +325,16 @@ struct adv7511_video_config {
> > >         struct hdmi_avi_infoframe avi_infoframe;  };
> > >
> > > -enum adv7511_type {
> > > -       ADV7511,
> > > -       ADV7533,
> > > -       ADV7535,
> > > -};
> > > -
> > >  #define ADV7511_MAX_ADDRS 3
> > >
> > >  struct adv7511_chip_info {
> > > -       enum adv7511_type type;
> > >         unsigned long max_mode_clock;
> > >         unsigned long max_lane_freq;
> > >         const char * const *supply_names;
> > >         unsigned int num_supplies;
> > >         unsigned has_dsi:1;
> > >         unsigned link_config:1;
> > > +       unsigned hpd_override_enable:1;
> > >  };
> > >
> > >  struct adv7511 {
> > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > index 6974c267b1d5..7b06a0a21685 100644
> > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > @@ -354,7 +354,7 @@ static void __adv7511_power_on(struct adv7511
> > *adv7511)
> > >          * first few seconds after enabling the output. On the other =
hand
> > >          * adv7535 require to enable HPD Override bit for proper HPD.
> > >          */
> > > -       if (adv7511->info->type =3D=3D ADV7535)
> > > +       if (adv7511->info->hpd_override_enable)
> > >                 regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER=
2,
> > >                                    ADV7535_REG_POWER2_HPD_OVERRIDE,
> > >                                    ADV7535_REG_POWER2_HPD_OVERRIDE);
> > > @@ -381,7 +381,7 @@ static void adv7511_power_on(struct adv7511
> > > *adv7511)  static void __adv7511_power_off(struct adv7511 *adv7511)  =
{
> > >         /* TODO: setup additional power down modes */
> > > -       if (adv7511->info->type =3D=3D ADV7535)
> > > +       if (adv7511->info->hpd_override_enable)
> > >                 regmap_update_bits(adv7511->regmap, ADV7511_REG_POWER=
2,
> > >                                    ADV7535_REG_POWER2_HPD_OVERRIDE,
> > > 0);
> > >
> > > @@ -682,7 +682,7 @@ adv7511_detect(struct adv7511 *adv7511, struct
> > drm_connector *connector)
> > >                         status =3D connector_status_disconnected;
> > >         } else {
> > >                 /* Renable HPD sensing */
> > > -               if (adv7511->info->type =3D=3D ADV7535)
> > > +               if (adv7511->info->hpd_override_enable)
> > >                         regmap_update_bits(adv7511->regmap,
> > ADV7511_REG_POWER2,
> > >
> > ADV7535_REG_POWER2_HPD_OVERRIDE,
> > >
> > > ADV7535_REG_POWER2_HPD_OVERRIDE); @@ -1360,14 +1360,12 @@ static void
> > > adv7511_remove(struct i2c_client *i2c)  }
> > >
> > >  static const struct adv7511_chip_info adv7511_chip_info =3D {
> > > -       .type =3D ADV7511,
> > >         .supply_names =3D adv7511_supply_names,
> > >         .num_supplies =3D ARRAY_SIZE(adv7511_supply_names),
> > >         .link_config =3D 1
> > >  };
> > >
> > >  static const struct adv7511_chip_info adv7533_chip_info =3D {
> > > -       .type =3D ADV7533,
> > >         .max_mode_clock =3D 80000,
> > >         .max_lane_freq =3D 800000,
> > >         .supply_names =3D adv7533_supply_names, @@ -1376,12 +1374,12 =
@@
> > > static const struct adv7511_chip_info adv7533_chip_info =3D {  };
> > >
> > >  static const struct adv7511_chip_info adv7535_chip_info =3D {
> > > -       .type =3D ADV7535,
> > >         .max_mode_clock =3D 148500,
> > >         .max_lane_freq =3D 891000,
> > >         .supply_names =3D adv7533_supply_names,
> > >         .num_supplies =3D ARRAY_SIZE(adv7533_supply_names),
> > > -       .has_dsi =3D 1
> > > +       .has_dsi =3D 1,
> > > +       .hpd_override_enable =3D 1
> > >  };
> > >
> > >  static const struct i2c_device_id adv7511_i2c_ids[] =3D {
> > > --
> > > 2.25.1
> > >
