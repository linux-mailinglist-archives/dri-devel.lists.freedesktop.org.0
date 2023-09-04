Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 946EC790F8C
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 03:05:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528BA10E113;
	Mon,  4 Sep 2023 01:05:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D4110E113
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 01:05:34 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-529fb04a234so1115884a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 18:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693789533; x=1694394333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NbVUwcw2PJC4RfyAHaiAoxmA0J3kEw6h6OC2FpKWQRY=;
 b=Bqfz+bhXa4zg2ZWQ4TXiyJfnlnAyFvvJi7vXnApirh/S5yWZINZjSno31EC/J20qNe
 ZOUe1V7WcjtAHKS7bP+W+q6Enl/RE+3nzZn0aAJf2Ds3koeb9VIjNAHcnCl5tiYka8Of
 ruDfm/rzc7UutOogH0+Jw/cbfY5ZJWh12ClCIMySH8rr3r705b0N0qMhxqbuanXgRSKC
 sDNwdHHnjxgB8zMvVUfWsfNGlEM04z/LUrpCeFKpp6Rrqog+n71E1FGYkYg+i62XdUEl
 7i3ahYe7TQyqESJqXXecrZ4Yd28ELo8/1O20oA4GYn9k+P3NzhYL8Gq4onoQlj8zcKQB
 Jbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693789533; x=1694394333;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NbVUwcw2PJC4RfyAHaiAoxmA0J3kEw6h6OC2FpKWQRY=;
 b=ju5L1MxVr1PIWrX2/GFRwDz1ZPYJbNF1bfk6yVEvatBWnlpHAVR8nqV1DLHB49SGOS
 CNcVasxn9XwpTy6bfJNUBclpaQFifVjNrGdbZlhPTwBlbPm57kzEBX7i4sMkh9yFMeXb
 qNWm3wj95IwPEw/CF4Rdfx6/NAHhlQQxoykS+S/u4DWruhDLRnV5x3J2mNRmLYA7xDEw
 PhqIjfnPuIsemimhA03UHMZdF/4R26b6kNKzbKMKG4FlQBYZ7Oc8FHdHII937kZ8LpeU
 3JaXDT0OtdnaILt5Myc2RlAzPbtQb4KJlOnXZ0Va0rZqg+8Yfjy3zU3cBgzkFKiHEf8x
 Eg7g==
X-Gm-Message-State: AOJu0YyvYeixSBsaDAiOgIRYeu8JBDBFgbOmj/MIPU+3V9MFH9I7jnQw
 gRn61TkVmPqxWE4F/qz12y5Rpj9RYjEGdM6he0g=
X-Google-Smtp-Source: AGHT+IGoOCM67CfAPti9p9KNf+sBBUTpbJt4yh8hMpYKIFaqa7GfnKeqIe49SGBnSowjTgY1/YMIZJCkjd4ei3FUKP4=
X-Received: by 2002:aa7:ca51:0:b0:523:4996:a4f9 with SMTP id
 j17-20020aa7ca51000000b005234996a4f9mr7087154edt.34.1693789533077; Sun, 03
 Sep 2023 18:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <20230818-samsung-dsim-v1-1-b39716db6b7a@pengutronix.de>
 <CAHCN7x+J_umWCBvivuZsrHTvjw=4CvBqOSeO-j_+fTMm=DdAOg@mail.gmail.com>
In-Reply-To: <CAHCN7x+J_umWCBvivuZsrHTvjw=4CvBqOSeO-j_+fTMm=DdAOg@mail.gmail.com>
From: Inki Dae <daeinki@gmail.com>
Date: Mon, 4 Sep 2023 10:04:55 +0900
Message-ID: <CAAQKjZM9UGgzAgfg-Rt92BNdvLuUJ90=QRUrd=FnDFwGvoC-zA@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/bridge: samsung-dsim: add more mipi-dsi device
 debug information
To: Adam Ford <aford173@gmail.com>
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

2023=EB=85=84 8=EC=9B=94 29=EC=9D=BC (=ED=99=94) =EC=98=A4=EC=A0=84 7:38, A=
dam Ford <aford173@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Mon, Aug 28, 2023 at 10:59=E2=80=AFAM Michael Tretter
> <m.tretter@pengutronix.de> wrote:
> >
> > From: Marco Felsch <m.felsch@pengutronix.de>
> >
> > Since the MIPI configuration can be changed on demand it is very useful
> > to print more MIPI settings during the MIPI device attach step.
> >
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>
> Reviewed-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon
> Tested-by: Adam Ford <aford173@gmail.com>  #imx8mm-beacon

Reviewed-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>

>
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index 73ec60757dbc..6778f1751faa 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -1711,7 +1711,10 @@ static int samsung_dsim_host_attach(struct mipi_=
dsi_host *host,
> >                 return ret;
> >         }
> >
> > -       DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
> > +       DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-fla=
gs:0x%lx)\n",
> > +                    device->name, device->lanes,
> > +                    mipi_dsi_pixel_format_to_bpp(device->format),
> > +                    device->mode_flags);
> >
> >         drm_bridge_add(&dsi->bridge);
> >
> >
> > --
> > 2.39.2
> >
