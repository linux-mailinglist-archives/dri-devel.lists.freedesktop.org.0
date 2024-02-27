Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320B2869A0E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:15:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8900A10E166;
	Tue, 27 Feb 2024 15:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IUWslH+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF9410E166
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:15:20 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso4066244a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 07:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709046920; x=1709651720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9KotY222o/b+zG4JFnMehrQPIDESD06t7QB65RoOyrY=;
 b=IUWslH+U1cXmko9wYqDmbvc1JL6omUM/rAHhkKlQaP1RHD+vwW8QfICBM8zKm2mbHI
 pDho8eR1VRcMcG95u1hSq67zCRfAjaNuOTTPimcMX4cILj64PngEca8O/5LZtNVlLdBg
 NyNs1x7HoFRH3HV/b1xXAhrkAGr7kpCOTIaQXJjA+WjzcgMNj6gV/AdwDWnvXoHdJ3qs
 1kF0K+R0ZK88FptuIT1RaZ3sImctTfta2PV545qjETEwsgalMiqH+m1KNscAL0Bk4jIn
 5z8keGut7Lqi2+t2mUVk+wnBpXzTgFs1vp8KikAyof783p87stst5cJaJaRfF0SRiinx
 t+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709046920; x=1709651720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9KotY222o/b+zG4JFnMehrQPIDESD06t7QB65RoOyrY=;
 b=FVxCEZTjF5ZJtqZW73b8CX7BXUMW7Rs+1UC+95mBLMtiQF52p7QBEPGjWGbJhT0PD1
 aLwPewx/sbGo6+1CAiIBYwrx087VUnQkjPNHsfU9OfTGqPY4mJpvSmVD611emMCUSIxX
 Z5TrMHV2QEGtAJeBwteCx4c0ydBkOPUA8imF6xrO/UuemznXEapdvjEuhcEmHi24nRYb
 Fwex/TvOaP4asGvVTw49Aa00/th8cq+hJi4FQOeN1u2TVVxzJtoxANEj7r/+eJ5GxVtY
 5An3hRN7/0gH71wly09N/gNrTpbCT0nHckholxvWpjJAMdSyvktDpfIasbshiBGqFTT5
 u5Yw==
X-Gm-Message-State: AOJu0Yzwc4HYndGsB+F++reYm4BYhqLhOrDVih8Y0dqKJx/s4Xp9CShe
 jPCQLDTm1PJfOUZX0F1if30oUOBnDhNb0eZbQlUnPaxcCXvRiEPfho/mj+tfiJhALrxWimMnjaV
 lQaXpaMMII/aR9T319IULzBT1gZ65x8qZRAw=
X-Google-Smtp-Source: AGHT+IFg140Xg2hJz4kVw5bMZewe8s6YfvknB2EKDdvjRIwTASEpsh/NjQy08I9J/xD8cQEN3HS8ShDPQkI9AnWiGGA=
X-Received: by 2002:a17:90a:9317:b0:299:3c25:4248 with SMTP id
 p23-20020a17090a931700b002993c254248mr8646073pjo.38.1709046919772; Tue, 27
 Feb 2024 07:15:19 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-5-aford173@gmail.com>
 <CAMuHMdWNQ=_NHPybAhhLJJCytT4y583ROY-meuLyKPN8_Qa1HA@mail.gmail.com>
In-Reply-To: <CAMuHMdWNQ=_NHPybAhhLJJCytT4y583ROY-meuLyKPN8_Qa1HA@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 27 Feb 2024 09:15:08 -0600
Message-ID: <CAHCN7xJUBT8hMNEtFhne-wr8mOYe9JZcc=LS9Utt9TyOQQF5=A@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: renesas: r8a77951: Enable GPU
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 aford@beaconembedded.com, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Tue, Feb 27, 2024 at 2:11=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Adam,
>
> Thanks for your patch!
>
> On Tue, Feb 27, 2024 at 4:46=E2=80=AFAM Adam Ford <aford173@gmail.com> wr=
ote:
> > The GPU on the R-Car H3 is a Rogue GX6650 which uses firmware
> > rogue_4.46.6.61_v1.fw available from Imagination.
>
> s/61/62/
>
> >
> > When enumerated, it appears as:
> > powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.46.6.62_v1.=
fw
> > powervr fd000000.gpu: [drm] FW version v1.0 (build 6513336 OS)
>
> Do you have a different build number?

I don't actually have this board.  I just copy-pasted what I thought
it was.  If you have  build number that's more appropriate, I can use
that in the future.

adam
>
> On Salvator-XS with R-Car H3 ES2.0:
>
>     powervr fd000000.gpu: [drm] loaded firmware powervr/rogue_4.46.6.62_v=
1.fw
>     powervr fd000000.gpu: [drm] FW version v1.0 (build 6538781 OS)
>     [drm] Initialized powervr 1.0.0 20230904 for fd000000.gpu on minor 1
>
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> > @@ -2771,6 +2771,16 @@ gic: interrupt-controller@f1010000 {
> >                         resets =3D <&cpg 408>;
> >                 };
> >
> > +               gpu: gpu@fd000000 {
> > +                       compatible =3D "renesas,r8a77951-gpu", "img,img=
-axe";
>
> renesas,r8a7795-gpu
>
> > +                       reg =3D <0 0xfd000000 0 0x20000>;
> > +                       clocks =3D <&cpg CPG_MOD 112>;
> > +                       clock-names =3D "core";
> > +                       interrupts =3D <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH=
>;
> > +                       power-domains =3D <&sysc R8A7795_PD_3DG_E>;
> > +                       resets =3D <&cpg 112>;
> > +               };
> > +
> >                 pciec0: pcie@fe000000 {
> >                         compatible =3D "renesas,pcie-r8a7795",
> >                                      "renesas,pcie-rcar-gen3";
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
