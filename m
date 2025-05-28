Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8005CAC6F97
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 19:44:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3DB10E08A;
	Wed, 28 May 2025 17:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MSUKWobw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3985A10E08A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 17:44:27 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a4c9df6f92so97564f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 10:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748454266; x=1749059066; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iImHkaPCeMoo0L7Q9HhWe7/FK2OKN9y4GidsHlvGedI=;
 b=MSUKWobwgMcfoO6ojteY5/XjT/XOlRMnSb5GJApXNRJ8tAtMuLboo2J6v8E61QHKyc
 8K8BVq9xQaTyA8FLe9sGXn3r/1TfOSBc1ohdh1OnnNScWs4ywRzoIJ5oADcDODS+YIk/
 3/OXl4BSloceqty1LQb09IQm5kDzy95kvcoldQdMT2CGrz33TUL4ObwiWv6D4ObiwxLL
 DvKz9qs2FraWQDWw1CT7l0ndPEUIOriFRO/Jkkk+jrQxpu8LYcYjvRxcN25wzBTSGOAe
 OrJd9s57vZeeKjevbK6zmSvLmNuZ2wht5JVOAA0W0DRkUbMsikFDt3Kxz/WElllixMEQ
 AQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748454266; x=1749059066;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iImHkaPCeMoo0L7Q9HhWe7/FK2OKN9y4GidsHlvGedI=;
 b=jylMwE4nwUZf1Z/EIZmf8yQxqlddLnxN5DeSqQaXaUBABdLdsYaAZcxDVc1LM5H/eC
 icCdETTQ/YXC0Fm4hI6M41Deb1lZ6IwGxo133O79yYX53jOvGDw+lTHWJ99eAHNsx6ph
 DGRBFqqPU0QwOuY7YjGGd44BmBLrmolqRNvhvoxYTY6n9y1hnueE04GTAzPE94/aG/j7
 ajOt0xgBoJ4rh2L1BrlAuZ/s6tM2+JxGdubD0b4l/ECfMGbwBXS3sppmxA7obOFGFjF+
 DjowWYLlb2evWpdo7FFM3Gcw1VN2NVUFNjwoxhFg0OinW9hy8wGHaUW3lMuk/vYZonHv
 ogMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZUGP7E5j5Uc3LbUMV18iNyZCDLz7exWWO1WIAsfEGchokwYVtInDkRKPXcJ2/57Ckv61ziSV3gIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBtOvZ5X9fsuTh9vqQ3Ijj956HHuytWHxPcMm+uaelxLO2v1hd
 us3lHeqcBIlbulz60aoILJNvTZujTIFEReb3PmcnHNeP+2GG6QJDZH9h9vchdwBgBkmbVA3F/+y
 zfdvWeMeRATdIlnNjeUnZ/rwW818UeqM=
X-Gm-Gg: ASbGncvYj37JC69zGVCB0hGIA3UfACHHHEszkVPucaRFUtWVAZ9qg+KD9zmwLDn0DtK
 KxDjH8nw6YfgVyLvJ8xO7Ki7CDqQt01Znj+q5xKgGlTyJ/6G/NB/ickaNBT7Gcr4e7mighMWqY4
 By437NMcA8ikINI4WhX5d7TCNQh+QG5fXh5H2264QvIcJNkArLZP7zi0MnOXV1YrXaaCBNrLmZj
 gjl
X-Google-Smtp-Source: AGHT+IH9504RmRkVsDgrKrAvwoP8w5aV6xAcVxZzAGs088F0fEReN2tW49KZxtVHasfT6GuCbd0iN516mghNhtJnsVI=
X-Received: by 2002:a05:6000:1ac5:b0:3a3:7baf:f06a with SMTP id
 ffacd0b85a97d-3a4cb489b45mr13800385f8f.37.1748454265458; Wed, 28 May 2025
 10:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX5_P4R43HOPuZc3JSAOQ5O2xOBDVhVVg1SxU1ucPdbPA@mail.gmail.com>
 <CA+V-a8sde6Zaz3Z2uDt3OGZ52UBJfR3vQMs4-ZUusDu=oNwFhg@mail.gmail.com>
 <CAMuHMdXSbEWVpMbDx7UC3Zn3YteZLCdJ=kOOakE38k1TeTxKqA@mail.gmail.com>
In-Reply-To: <CAMuHMdXSbEWVpMbDx7UC3Zn3YteZLCdJ=kOOakE38k1TeTxKqA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 May 2025 18:43:59 +0100
X-Gm-Features: AX0GCFvdj3XLPfL3aRRQHdvvebvcoxJnXwBCdUg5vPACSx9PQuJJG2JLXtCzW8c
Message-ID: <CA+V-a8uKzGxbU5A9nRTRL2azykGdhMmawni2ME4T2jqJxBBtew@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Geert,

On Wed, May 28, 2025 at 1:32=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 28 May 2025 at 11:48, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Fri, May 23, 2025 at 4:19=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add DSI support for Renesas RZ/V2H(P) SoC.
> > > >
> > > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>
> > > > @@ -47,6 +52,11 @@ struct rzg2l_mipi_dsi_hw_info {
> > > >         u8 features;
> > > >  };
> > > >
> > > > +struct rzv2h_dsi_mode_calc {
> > > > +       unsigned long mode_freq;
> > > > +       u64 mode_freq_hz;
> > >
> > > Interesting... I guess mode_freq is not in Hz?
> > >
> > Actually it is int Hz, I will make it unsigned long.
>
> I really meant the first member.
> As rzv2h_dphy_mode_clk_check() does "mode_freq_hz =3D mode_freq * MILLI",
> mode_freq may be in kHz?
>
Sorry, I got confused. mode_freq is in kHz probably I'll rename this
to make it clear.

> > > > +};
>
> > > > @@ -308,6 +479,158 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_=
mipi_dsi *dsi, unsigned long mode_f
> > > >         return 0;
> > > >  }
> > > >
> > > > +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_ds=
i *dsi,
> > > > +                                             unsigned long mode_fr=
eq)
> > > > +{
> > > > +       struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->ds=
i_parameters;
> > > > +       u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
> > > > +       struct rzv2h_plldsi_parameters cpg_dsi_parameters;
> > > > +       unsigned int bpp, i;
> > > > +
> > > > +       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > > > +
> > > > +       for (i =3D 0; i < 10; i +=3D 1) {
> > > > +               unsigned long hsfreq;
> > > > +               bool parameters_found;
> > > > +
> > > > +               mode_freq_hz =3D mode_freq * MILLI + i;
> > >
> > > KILO?
> > >
> > OK, as mode_freq_hz is in Hz I'll make it unsigned long.
>
> I am not sure if "unsigned long" is OK. Is mode_freq in kHz?
> What is its largest value?
>
Sorry I got confused, I will reinstate mode_freq_hz to be u64. The
largest value can depend on the max resolution by the display.

Cheers,
Prabhakar
