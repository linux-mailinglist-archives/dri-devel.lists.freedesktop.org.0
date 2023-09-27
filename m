Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C2D7B0D91
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 22:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B03D110E5AA;
	Wed, 27 Sep 2023 20:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A275610E50D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 12:48:05 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso8276420a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695818885; x=1696423685; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F+q11IEuEpxpbMHfQrNpP6uY5LoxWEiXG+rgWu0fXno=;
 b=dW/TF2YPehiMczZ9etCkFQ5K4HOzVoqjecN4zMlMnvNpuZG9I8bfOKSk1HftYkJzRc
 GjSeM/kGuUwqicuH3hnj0ptxLqSEZsusF52XyVgvpIFnTc8+BK0u1EuT4GtMHv95mEGu
 wJhIIwIn5AkSURER8tApaibz8C0YtNP2UwgUb5RWs8ZvPkuyN3QTQO1FcW4Duly30ndF
 5CKr3sBpIhpGf9jr9tTFVEU2h5Wm8W38Y0yYuRi8hYnDk/RDK/A0exsaeRgGVoHo3Oj8
 mb1vCN1vTcWMHdg8dw3UMvQR7MJA9sIBxCuvPorpEBmazgiHqDZC4+K2DuH2tLIdbbNU
 OoQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695818885; x=1696423685;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F+q11IEuEpxpbMHfQrNpP6uY5LoxWEiXG+rgWu0fXno=;
 b=rrpLl/nfmkky8qsgk32oxz4JcfAu2XP/0cstaIzjtUoRKFwX0l7egMGOGyUAzCHten
 MAeOuxjw4Z8mqWgg32rzp6qoBT/rC1bl7EmS4CI11zeTAnwp18E9t3v05gsgi5K9+HyF
 jCTQjhDRmrKMEz6IUsYSBrArsRDyAh1RcdtNnWPnZxUQfgZ6PcLOAX7f6V+l7YoPCRG3
 8ompbaaK0IrkZtXkEne0opeZFrLdtfCYH089mA6EiyYFECFO60M+HvdypX+e/IdmeSe6
 K7GYHP6zDI5x2fRjQy1e/h0wE2xzub/UxC3z89BuF2XBXXluKhJwmV1a14luuaAfC/vK
 oYfw==
X-Gm-Message-State: AOJu0YzD7C2+ZqYx09ObwbEKN/fq4VUzrYxJkMfOPYoWO2Iqh/MptOGq
 /MK3lgFkUE+rLzSdvETbipFlyvRhHtNBykABcMw=
X-Google-Smtp-Source: AGHT+IGQdPYHMqTr4zNlzxJt6CA/xWfpM/ppZnKjYbKGmAsCanhjAOi4K+CnfdCrirywt9q82CL1CgNeAe1zxdaPCgE=
X-Received: by 2002:a05:6a20:1607:b0:15a:3eaa:b7f8 with SMTP id
 l7-20020a056a20160700b0015a3eaab7f8mr2188328pzj.50.1695818884995; Wed, 27 Sep
 2023 05:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-1-b39716db6b7a@pengutronix.de>
 <CAHCN7x+J_umWCBvivuZsrHTvjw=4CvBqOSeO-j_+fTMm=DdAOg@mail.gmail.com>
 <CAAQKjZM9UGgzAgfg-Rt92BNdvLuUJ90=QRUrd=FnDFwGvoC-zA@mail.gmail.com>
In-Reply-To: <CAAQKjZM9UGgzAgfg-Rt92BNdvLuUJ90=QRUrd=FnDFwGvoC-zA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 27 Sep 2023 07:47:53 -0500
Message-ID: <CAHCN7xJLH2oBzvn6V0VRpisr1Pmh3knx0t0Vesck5q_-RGnN6A@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/bridge: samsung-dsim: add more mipi-dsi device
 debug information
To: Inki Dae <daeinki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 27 Sep 2023 20:45:53 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 kernel@pengutronix.de, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Michael Tretter <m.tretter@pengutronix.de>,
 dri-devel@lists.freedesktop.org, Marco Felsch <m.felsch@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 3, 2023 at 8:05=E2=80=AFPM Inki Dae <daeinki@gmail.com> wrote:
>
> 2023=EB=85=84 8=EC=9B=94 29=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 7:38,=
 Adam Ford <aford173@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
> >
> > On Mon, Aug 28, 2023 at 10:59=E2=80=AFAM Michael Tretter
> > <m.tretter@pengutronix.de> wrote:
> > >
> > > From: Marco Felsch <m.felsch@pengutronix.de>
> > >
> > > Since the MIPI configuration can be changed on demand it is very usef=
ul
> > > to print more MIPI settings during the MIPI device attach step.
> > >
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> >
> > Reviewed-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
> > Tested-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
>
> Reviewed-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>

What needs to be done in order to get this accepted?  This series is a
very nice improvement in i.MX8M Mini / Nano.

adam
>
> >
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/=
bridge/samsung-dsim.c
> > > index 73ec60757dbc..6778f1751faa 100644
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -1711,7 +1711,10 @@ static int samsung_dsim_host_attach(struct mip=
i_dsi_host *host,
> > >                 return ret;
> > >         }
> > >
> > > -       DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
> > > +       DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-f=
lags:0x%lx)\n",
> > > +                    device->name, device->lanes,
> > > +                    mipi_dsi_pixel_format_to_bpp(device->format),
> > > +                    device->mode_flags);
> > >
> > >         drm_bridge_add(&dsi->bridge);
> > >
> > >
> > > --
> > > 2.39.2
> > >
