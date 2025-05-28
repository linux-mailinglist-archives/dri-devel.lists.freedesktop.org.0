Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A80AC6950
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 14:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E79310E5F2;
	Wed, 28 May 2025 12:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F1B10E5E5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 12:31:58 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id
 5614622812f47-401e77e5443so2323833b6e.3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 05:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748435517; x=1749040317;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KUHS2p4Yrhb6D+Ze5aQXRwHv8Hsjiq07gFX0i1Aa/2E=;
 b=JwJc5mCYglXFqJOGFVjuDr5vfg1vcYJ374s4YA55JcdjdgbSr7PqK9oaoVSGE34Jax
 El0Xq2i7vn3TIJfEn+A1GJ/7e3+KI+6r9nF3aI5S6andzwrtAJ6XHJ5tBSgmPzfDVuVI
 ccvmVzGuzop5ImBbu9vyQ+hu/ily6caxhShB6d8Tl2ZpVcS7jE7qGW7RS7R/5BJXuASz
 LxRF71evCPsAxD4UVv9Bc13Dgxr4n0M+qPBl7XNOEcs9y6lD39tDUUeZXCE/7KFqP4dL
 e8sK1Swaw8BbxEFeyVxmbx9JUgHZOtWpVyK6kRm1XKDuO9J6UKbRGMO9tx/pD0N72isZ
 SULQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVqqBbrqtaXTEAcOOCFiOyJy0ZYT2pjbmEJxkvgP/rFSR/9jw45L2kuuO9kRIAg8mbpS1gVrNMV+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeS109tOfW55PZ0yiJTKn+4SbddkD48sMM7srlft4jryoSsNwQ
 Uvup+UksxRmiZy7tAy6qWPxr9zAUuToJG0RW92BK7fWk0K0y3+/0gYX+DBC3srdy
X-Gm-Gg: ASbGnctz6zhAmiHz+jVQSlOK5f3Q19jRKnGDxzdaIy+8oXJGv4XRR4Hshf+khRm02GL
 tTGOPQF8zlqPZ3Chz6BzvFEnD0IihHoR8bl/KJxKa3k14YICA8mCDcOdHkG/YmaDk7L2xLpp8xs
 srqCsKTXiUP92mt+m5cIp0+wk/SXpj+Io5HqcGN23jTIxBOQYJlfXa8u8ngX39LfZzdIunLI4eb
 Kv+EXHG8KNiGp4Jp0etwbhpeAtYdkMMxb9uFrhksIKq1XLusE1WdpAgNcMBiNREncfHkKRwo6Px
 pjYGF55MRJ5UdyhWFwWrKAOID1CcmLUEZt4s1j6uAg/rvKSlPWvJMdQI17+ul4MlmU+u1IBo6Qs
 0e5tultIV4S+0iW5PpQ==
X-Google-Smtp-Source: AGHT+IFLk5GVbmGgweOU4Lg3Htc0PULl/9qWsq5eFOn5+FsNccBuJ4MbIMQ4Zu5KlERRZpoojOui7g==
X-Received: by 2002:a05:6808:2287:b0:406:6671:6d10 with SMTP id
 5614622812f47-40666716e18mr657218b6e.29.1748435517134; 
 Wed, 28 May 2025 05:31:57 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com.
 [209.85.167.176]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-406653c809csm161832b6e.27.2025.05.28.05.31.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 05:31:56 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-4033c70577fso2296506b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 05:31:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWElI+jDwrA/N/eoZc0PaalGHomWsPcAJQ00C0MXRTLAXysD/HIG6XNbMjlxWYrneXZ1wCxjjLYSpA=@lists.freedesktop.org
X-Received: by 2002:a05:6808:680a:b0:406:692e:d678 with SMTP id
 5614622812f47-406692ed990mr412088b6e.22.1748435516651; Wed, 28 May 2025
 05:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX5_P4R43HOPuZc3JSAOQ5O2xOBDVhVVg1SxU1ucPdbPA@mail.gmail.com>
 <CA+V-a8sde6Zaz3Z2uDt3OGZ52UBJfR3vQMs4-ZUusDu=oNwFhg@mail.gmail.com>
In-Reply-To: <CA+V-a8sde6Zaz3Z2uDt3OGZ52UBJfR3vQMs4-ZUusDu=oNwFhg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:31:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSbEWVpMbDx7UC3Zn3YteZLCdJ=kOOakE38k1TeTxKqA@mail.gmail.com>
X-Gm-Features: AX0GCFvVYyRF-qqhinpZ-10VhZ1hJFI-N7-tDZlIlkbT7TO9C3UrFM6heC0l3I0
Message-ID: <CAMuHMdXSbEWVpMbDx7UC3Zn3YteZLCdJ=kOOakE38k1TeTxKqA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Wed, 28 May 2025 at 11:48, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Fri, May 23, 2025 at 4:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add DSI support for Renesas RZ/V2H(P) SoC.
> > >
> > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c

> > > @@ -47,6 +52,11 @@ struct rzg2l_mipi_dsi_hw_info {
> > >         u8 features;
> > >  };
> > >
> > > +struct rzv2h_dsi_mode_calc {
> > > +       unsigned long mode_freq;
> > > +       u64 mode_freq_hz;
> >
> > Interesting... I guess mode_freq is not in Hz?
> >
> Actually it is int Hz, I will make it unsigned long.

I really meant the first member.
As rzv2h_dphy_mode_clk_check() does "mode_freq_hz =3D mode_freq * MILLI",
mode_freq may be in kHz?

> > > +};

> > > @@ -308,6 +479,158 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mi=
pi_dsi *dsi, unsigned long mode_f
> > >         return 0;
> > >  }
> > >
> > > +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi =
*dsi,
> > > +                                             unsigned long mode_freq=
)
> > > +{
> > > +       struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_=
parameters;
> > > +       u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
> > > +       struct rzv2h_plldsi_parameters cpg_dsi_parameters;
> > > +       unsigned int bpp, i;
> > > +
> > > +       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > > +
> > > +       for (i =3D 0; i < 10; i +=3D 1) {
> > > +               unsigned long hsfreq;
> > > +               bool parameters_found;
> > > +
> > > +               mode_freq_hz =3D mode_freq * MILLI + i;
> >
> > KILO?
> >
> OK, as mode_freq_hz is in Hz I'll make it unsigned long.

I am not sure if "unsigned long" is OK. Is mode_freq in kHz?
What is its largest value?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
