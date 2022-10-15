Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 864E45FF948
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 10:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F081610E038;
	Sat, 15 Oct 2022 08:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ED310E038;
 Sat, 15 Oct 2022 08:59:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j16so10899313wrh.5;
 Sat, 15 Oct 2022 01:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VjSRqmWkaFZ0BLuD6MivrAvypkKqaIT8x6LKQIsQKn8=;
 b=gdcg6hXz5wuVSv/KtfFI848qYS7t9NYjUI618ptxzzIpxaqmveySS5BR9QIVwZQznb
 xBp1LMARjJsFgTsfoQXSKdlgOksIgUDgK5K2AKQXk0cNXfVB1iXroI7ut/cD9tGOsURQ
 jm8KdDG1cgj3F2tXB8fsFhaB4Dgqa4STOi2smUvQX0W6V5JuU1fb2T0Jx1olayaXMioH
 qUVlRlUtYIZYW47agdnyqxBUbpxtv8QqHmVCx5PtIwbbxpRu//fPm+9YkMHbweUr6hyr
 GIo4cI3kV/QaK6qCRbfx4UQzBvTvJNtzUUilSXr8/BKEVqoYVnzl8JMOwJPISK3D8rO8
 AGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VjSRqmWkaFZ0BLuD6MivrAvypkKqaIT8x6LKQIsQKn8=;
 b=uHVDQFEoB8hXmudDp7vw44LWVDJu5EC5YLvrU1KmTuzhkLl8/7yYtGiJrOzaMECDb9
 KfwqVI47+idwao0FOjDSTSLNdki8MHc6LcAYlGISeBa6HT10GuQETgqzY9V6tniytudD
 vref3b7L9rYu6xFhDEMpugCMpTUQwgO/G12TgYZgAOQPeR8mPnm0ZEAQj+D4TRiire8W
 CYiDxYuwbq6UjOhMvNc9ELNLe/yYo91MkqxKzidvxd/tF0jq4wJs/MfMv+HsFOcYrECh
 ANVoYpxVNE7sn8u9OqWDubksWGaXuewiqV8UQody2WXSGGuriE1ycILem5yYxB6+p0bP
 H1+w==
X-Gm-Message-State: ACrzQf3E9BMGvZPctRr9LAjWGxJXFcAf5DFgmhpAjBgn2ygi56PlX72P
 IFodmWAofbJwxYBkjXjBCLo=
X-Google-Smtp-Source: AMsMyM6RC+ab/6o3qXAuzwTkjLJWhUo2MRVgXF2cNlp5Etq5q5a0yKzX7Not8qtetRts0yGJHJyAJg==
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id
 c14-20020adffb0e000000b0021a34a25ca9mr985742wrr.472.1665824356510; 
 Sat, 15 Oct 2022 01:59:16 -0700 (PDT)
Received: from kista.localnet (82-149-19-102.dynamic.telemach.net.
 [82.149.19.102]) by smtp.gmail.com with ESMTPSA id
 k13-20020adff5cd000000b0022e36c1113fsm3693723wrp.13.2022.10.15.01.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 01:59:15 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: Re: [PATCH v5 22/22] drm/sun4i: tv: Convert to the new TV mode
 property
Date: Sat, 15 Oct 2022 10:59:14 +0200
Message-ID: <2649653.mvXUDI8C0e@kista>
In-Reply-To: <20221014073810.akfoyfzxerywnt65@houat>
References: <20220728-rpi-analog-tv-properties-v5-0-d841cc64fe4b@cerno.tech>
 <6482539.4vTCxPXJkl@kista> <20221014073810.akfoyfzxerywnt65@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Karol Herbst <kherbst@redhat.com>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?B?Tm9yYWxmIFRyw4PCuG5uZXM=?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 14. oktober 2022 ob 09:38:10 CEST je Maxime Ripard napisal(a):
> Hi Jernej,
>=20
> On Thu, Oct 13, 2022 at 08:23:51PM +0200, Jernej =C5=A0krabec wrote:
> > Dne =C4=8Detrtek, 13. oktober 2022 ob 15:19:06 CEST je Maxime Ripard=20
napisal(a):
> > > Now that the core can deal fine with analog TV modes, let's convert t=
he
> > > sun4i TV driver to leverage those new features.
> > >=20
> > > Acked-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > >=20
> > > ---
> > > Changes in v5:
> > > - Removed the count variable in get_modes
> > > - Removed spurious vc4 change
> > > ---
> > >=20
> > >  drivers/gpu/drm/sun4i/sun4i_tv.c | 145
> > >=20
> > > +++++++++++++-------------------------- 1 file changed, 48
> > > insertions(+),
> > > 97 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> > > b/drivers/gpu/drm/sun4i/sun4i_tv.c index c65f0a89b6b0..4f07aff11551
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> > > +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> > > @@ -141,23 +141,14 @@ struct resync_parameters {
> > >=20
> > >  struct tv_mode {
> > > =20
> > >  	char		*name;
> > >=20
> > > +	unsigned int	tv_mode;
> > > +
> > >=20
> > >  	u32		mode;
> > >  	u32		chroma_freq;
> > >  	u16		back_porch;
> > >  	u16		front_porch;
> > >=20
> > > -	u16		line_number;
> > >=20
> > >  	u16		vblank_level;
> >=20
> > isn't there a way to get or calculate back_porch, front_porch and
> > vblank_level from mode? From quick glance over removed values below, I
> > would say that at least back_porch can be removed too?
>=20
> I tried actually, but I'm not sure what the front porch and back porch
> parameters actually are. They are called that way by Allwinner, but it
> doesn't match the PAL or NTSC timings at all.
>=20
> For example, back_porch is 118 for NTSC and 138 for PAL. Actual back
> porches would be around 12 and 16, respectively. Actually, the entire
> blanking area are 138 and 144. This is close enough for PAL, but pretty
> far off for NTSC.
>=20
> Allwinner has the habit of integrating the sync period into one of the
> porches, but still there's no obvious match.
>=20
> front_porch is pretty much in the same case.

Ok then.

>=20
> Since it affected the display output quite a lot, I chose to keep it for
> now unfortunately.
>=20
> > Otherwise this patch looks ok.
>=20
> Can I add your Acked-by/Reviewed-by then?

Sure.
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


