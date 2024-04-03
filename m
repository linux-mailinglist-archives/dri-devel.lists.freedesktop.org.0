Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6744A89648E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 08:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6EA010F4B3;
	Wed,  3 Apr 2024 06:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shruggie-ro.20230601.gappssmtp.com header.i=@shruggie-ro.20230601.gappssmtp.com header.b="ZSTyEtTP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFDF10F4B3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 06:32:54 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-516bfcc76efso188742e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 23:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shruggie-ro.20230601.gappssmtp.com; s=20230601; t=1712125972; x=1712730772;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MQu0eAAfwBJBisoFkbcN2EwG3dZ80aLb6SadbhowWsc=;
 b=ZSTyEtTPYyQrpDyExj1o832RzRIjZBK2+xtpRMLy5ONJAGtmvfFfa242wQBa/zqaih
 YUGjMRdvS3r04rbtbwZo/OiaQ7aYGpCqoEA8tVFeWIXnJw7ViKyr0S6s5sDgRUe8gYa+
 R5FpLoHLenIKhDupYZXsTuU1UxjCTThoDneNPCFxORik4z2S9AbmUvjxh6brugSpu4iQ
 kYTjL4JT7qFRrdxHCfx7mdmA2Q3C+kDMjNfCvc+1btB+dL+BCjNttPujkjCg2NgQllnI
 X/onKe5bcOsskLNx6zrEZAip1HIMWBw7HqCXP4+yMf+nzZ3QaP2y6OLiG/X9fTcQwyak
 LFdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712125972; x=1712730772;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MQu0eAAfwBJBisoFkbcN2EwG3dZ80aLb6SadbhowWsc=;
 b=Unc8BYLuWNHNNb3VHxQPtyF54sgVBocE2WBic2tTsK6oT/moIOFnGWKzsnKYAppyIM
 iz6Uq/9QcvILDtyeSONZOYU3lpYq9oEbVnAGDFZGFJcFsmm0VkOTd6LdEGb3jNx5id7w
 Skd9sHW69eLOi7beMePdSlftmIS7/0T1Df+dkowenh4j7F9FcPEIocBDoAX3TIC3OrP4
 xmPmETxGnJyyJYyqYhJqKpOaRzZFyvhwrfs4VMVD7wbNcj9gpBjDw7iRZsKQ/xo23vCq
 aIw48/F3W9FMQiSuIAEbb2FioOl4NIyX16o+QFJ5yQFrK2o2R1bteO31hMWlPq0KjHX1
 l6Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVADC1vsJIh89QgE8ZTSY5kfK5Na/dUo3RSzi6pfG763dZ2n82vK6MorJblDSiHa3Q3LwbjnFs5MnrVIeXd3P2gRhHVJNslTYshGx2a7thd
X-Gm-Message-State: AOJu0YxjjmTVCDxXod93kcWlD+vZAEUKiWWHvkD8WXabYtFJTsThaXqe
 OIOLA12gKMhYeOFjxKPVFmPIckngrathMpjSMhCCTvJLx5GBISgQO/1DidFg2YQ5zxbs9dQpeJI
 xF/bdahEdiEETBFIy3Kuz5sSv1GMVfZNq1tpekA==
X-Google-Smtp-Source: AGHT+IGZtMZxTp4P+ypCEELpSKJykyHdbborNz/DySvN9QSemx4mIJKZP+NE2BO0MfJ4vxJRk16FRP/P4NLfj2ygcsk=
X-Received: by 2002:ac2:5a4b:0:b0:513:d1c7:7d37 with SMTP id
 r11-20020ac25a4b000000b00513d1c77d37mr9499704lfn.51.1712125972550; Tue, 02
 Apr 2024 23:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240402105925.905144-1-alex@shruggie.ro>
 <20240402165307.GA31874@francesco-nb>
In-Reply-To: <20240402165307.GA31874@francesco-nb>
From: Alexandru Ardelean <alex@shruggie.ro>
Date: Wed, 3 Apr 2024 09:32:41 +0300
Message-ID: <CAH3L5Qr-sT+Q9ZvNSxHKwVMr8-3fU5WPvvaccEWWH49x7oWMyQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: lt8912b: add support for P/N pin swap
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, adrien.grassein@gmail.com, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com, 
 marius.muresan@mxt.ro, irina.muresan@mxt.ro
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

On Tue, Apr 2, 2024 at 7:53=E2=80=AFPM Francesco Dolcini <francesco@dolcini=
.it> wrote:
>
> Hello Alexandru, thanks for your patch.
>
> On Tue, Apr 02, 2024 at 01:59:24PM +0300, Alexandru Ardelean wrote:
> > On some HW designs, it's easier for the layout if the P/N pins are swap=
ped.
> > In those cases, we need to adjust (for this) by configuring the MIPI an=
alog
> > registers differently. Specifically, register 0x3e needs to be 0xf6
> > (instead of 0xd6).
> >
> > This change adds a 'lontium,pn-swap' device-tree property to configure =
the
> > MIPI analog registers for P/N swap.
> >
> > Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> > ---
> >  drivers/gpu/drm/bridge/lontium-lt8912b.c | 25 +++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm=
/bridge/lontium-lt8912b.c
> > index 4b2ae27f0a57f..154126bb922b4 100644
> > --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> > +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> > @@ -47,6 +47,7 @@ struct lt8912 {
> >
> >       u8 data_lanes;
> >       bool is_power_on;
> > +     bool do_pn_swap;
> >  };
> >
> >  static int lt8912_write_init_config(struct lt8912 *lt)
> > @@ -78,15 +79,31 @@ static int lt8912_write_init_config(struct lt8912 *=
lt)
> >               {0x55, 0x44},
> >               {0x57, 0x01},
> >               {0x5a, 0x02},
> > -
> > -             /*MIPI Analog*/
> > +     };
> > +     const struct reg_sequence mipi_analog_seq[] =3D {
> >               {0x3e, 0xd6},
> >               {0x3f, 0xd4},
> >               {0x41, 0x3c},
> >               {0xB2, 0x00},
> >       };
> > +     const struct reg_sequence mipi_analog_pn_swap_seq[] =3D {
> > +             {0x3e, 0xf6},
> > +             {0x3f, 0xd4},
> > +             {0x41, 0x3c},
> > +             {0xB2, 0x00},
> > +     };
> > +     int ret;
> >
> > -     return regmap_multi_reg_write(lt->regmap[I2C_MAIN], seq, ARRAY_SI=
ZE(seq));
> > +     ret =3D regmap_multi_reg_write(lt->regmap[I2C_MAIN], seq, ARRAY_S=
IZE(seq));
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (!lt->do_pn_swap)
> > +             return regmap_multi_reg_write(lt->regmap[I2C_MAIN], mipi_=
analog_seq,
> > +                                           ARRAY_SIZE(mipi_analog_seq)=
);
> > +
> > +     return regmap_multi_reg_write(lt->regmap[I2C_MAIN], mipi_analog_p=
n_swap_seq,
> > +                                   ARRAY_SIZE(mipi_analog_pn_swap_seq)=
);
>
> Can you just remove {0x3e, 0xd6} from the register/value array and write
> it afterward depending on `do_pn_swap` value? Or keep it with the
> current value and only overwrite it when do_pn_swap is true?
>
> If you do it this way is a 4 line change.

Hmm, good point.
I did it like this, because I don't have a board with the P/N in the
0xd6 configuration, to test.
But, if I leave it like this, and just overwrite 0x3e when
`do_pn_swap` is true, I can test that; and I don't need to test the
original case.

I'm actually not 100% sure here if the order of registers (being
written) matters for the initialization.


>
>
> >  static int lt8912_write_mipi_basic_config(struct lt8912 *lt)
> > @@ -702,6 +719,8 @@ static int lt8912_parse_dt(struct lt8912 *lt)
> >       }
> >       lt->gp_reset =3D gp_reset;
> >
> > +     lt->do_pn_swap =3D device_property_read_bool(dev, "lontium,pn-swa=
p");
>
> I would call this variable the same that is called in the lontium
> documentation, mipirx_diff_swap

Oh.
I actually based this change on a reference software for the LT8912B.
I didn't get a chance to see/find a documentation for the registers.
I compared with the Linux driver, to see what was missing to get
output on the HDMI display (for our setup).

>
> Francesco
>
