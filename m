Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D795ABF6C2
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 15:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E40089BAC;
	Wed, 21 May 2025 13:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rc2QWFSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C04E10F5E3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 13:06:57 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a36e950e41so2267231f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 06:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747832815; x=1748437615; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ImUjq0fgDHWqAteIZbQKYhLq5pbNfhy8eeFHxGuhiY=;
 b=Rc2QWFSgrHyHpYKtKw81oL4C2pGqci2TjECjkDlA4qndcFfQTrJXY+jSm6yHGeH2Ap
 83Y7qcihwfP/zMmpHk88GC7J5uLc0nQro/EZlMjVC0yWaOyykBezyrTJNX3GDg3ypNwv
 1U6RadiKOm3yzQnJpiyLG4zBn0zaoyIEFrglGeszhgZv43ykDDupSog2p8xVQYwBHviw
 efM35kNEhfwzMgQr3JIjkxtzUx/iTaZyTPkvG31GMKA4yHyMiKAcKV40lhaKAbzQJPHo
 KLIYvhL3Ian/5rCqYM4aCRTEyfYcTy6fGX4EEUTaZWVUgu2O+Fmt+z1uZNo6tYzTwWcY
 /Tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747832815; x=1748437615;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ImUjq0fgDHWqAteIZbQKYhLq5pbNfhy8eeFHxGuhiY=;
 b=ajCvY0Q5piLYfDLMQDukdALoD89JkrlfAADsR7ExVGEQnjQLWSeZznGrAOUyDFJiEA
 RmrOhpcKXnzboX8NE+cm9lsVvtDsL2AcmKeSYJfGcEBrnlylOszcBhhHob2U2bRZbzDo
 cLhhauRtFKV6+O2CV5K3iifPPhn7I+3y6FaGZISYb7qo/fkwn6EUgBZr7RT4GlFAuejX
 TJG7mXzeJOLJbRbHwN6+LTSfmK8OEM1f4n1e2XxcfVwp9UCOpyFpwylPEUNnL9UuY8df
 90QmmWIZYRDxx7tcYswL/kUbBVIBQdmwSWruPlPrPmwmY3d0xEu2TZ2ZzdUCXlsbaNNr
 EjNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfPZVnixEchNC+JGZnEv/w+BB3u7JeXnl6MGdcBMMH00X/4VgekhG6yUzwv2XtuhFzTMFgBfy9MS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyhp2ijpjfc94kNtw0nBMq+dllL95CjC6HyGOZg5YZhkYPIwHrT
 umHzKaE9dIPXGqMqG6qnZObLz2zlgOrhsZxBuOaEJaajI6rcKWueQIip2LyYALDZDRwuNxoj3hE
 96KJVQTyHc6NKyaY9yU+TfsNCGS7uKfU=
X-Gm-Gg: ASbGncuG/8x3UHYCt1ONBYXxYh8Zjn0JlN32Bhr3TkNIRn7Lp8k8F50dRahDz1dp81y
 7VLqhyAxs2KdPEvuwjWu/MGbjYcrism9A5h/n/zBezWmXlvmw0Rih8VsWrGm+g72duyZxzXoRiX
 JbjxG37U69zv6KJEmf7Dch7GEtC5E=
X-Google-Smtp-Source: AGHT+IGw/flPUocN2KAZQ9vdKAbWbAcRjHYnIoWXNE7b6MhiAbmAH3CS1FTYcoZqP32a1zcOAnKla60J/JLjfbNq4SI=
X-Received: by 2002:a05:6000:1883:b0:3a3:5c05:d98b with SMTP id
 ffacd0b85a97d-3a35c8220bemr16554008f8f.5.1747832815212; Wed, 21 May 2025
 06:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVEgTo7V-gzzpVVNqxnDMSdTC1ew70gbJ=Sb5Qr4asryA@mail.gmail.com>
In-Reply-To: <CAMuHMdVEgTo7V-gzzpVVNqxnDMSdTC1ew70gbJ=Sb5Qr4asryA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 21 May 2025 14:06:28 +0100
X-Gm-Features: AX0GCFsiM19rEOpmPdSQtniDQCiDvqMUju95_u3EML6LED_KnTgo4KZJyu9-l4U
Message-ID: <CA+V-a8vjjY94KX-oWY5gKqNsWRvmxs2gzc1hDFjqCxbg+Y8c4g@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
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

Thank you for the review.

On Tue, May 20, 2025 at 3:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 12 May 2025 at 20:23, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
> > VCLK rate instead of the mode clock. The relationship between HSCLK and
> > VCLK is:
> >
> >     vclk * bpp <=3D hsclk * 8 * lanes
> >
> > Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
> > HSFREQ accurately reflects the clock rate set in hardware, leading to
> > better precision in data transmission.
> >
> > Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
> > when computing `hsfreq`. Also, update unit conversions to use correct
> > scaling factors for better clarity and correctness.
> >
> > Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
> > threshold comparisons to use Hz instead of kHz to ensure correct behavi=
or.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> > - Added dev_info() to print the VCLK rate if it doesn't match the
> >   requested rate.
> > - Added Reviewed-by tag from Biju
> >
> > v3->v4:
> > - Used MILLI instead of KILO
>
> Thanks for the update!
>
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>
> > @@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mip=
i_dsi *dsi,
> >         u32 golpbkt;
> >         int ret;
> >
> > +       ret =3D pm_runtime_resume_and_get(dsi->dev);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       clk_set_rate(dsi->vclk, mode->clock * MILLI);
>
> drm_display_mode.clock is in kHz, so s/MILLI/KILO/
>
Agreed, I will update it to use KILO (and below).

Cheers,
Prabhakar

> > +
> >         /*
> >          * Relationship between hsclk and vclk must follow
> >          * vclk * bpp =3D hsclk * 8 * lanes
> > @@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mi=
pi_dsi *dsi,
> >          * hsclk(bit) =3D hsclk(byte) * 8 =3D hsfreq
> >          */
> >         bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > -       hsfreq =3D (mode->clock * bpp) / dsi->lanes;
> > -
> > -       ret =3D pm_runtime_resume_and_get(dsi->dev);
> > -       if (ret < 0)
> > -               return ret;
> > -
> > -       clk_set_rate(dsi->vclk, mode->clock * 1000);
> > +       vclk_rate =3D clk_get_rate(dsi->vclk);
> > +       if (vclk_rate !=3D mode->clock * MILLI)
> > +               dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu=
 mismatch\n",
> > +                        mode->clock * MILLI, vclk_rate);
>
> Likewise.
>
> > +       hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> >
> >         ret =3D rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
> >         if (ret < 0)
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
