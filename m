Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B62A868DC4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 11:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A0210E8D0;
	Tue, 27 Feb 2024 10:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4619D10F2EA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 10:38:32 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-608959cfcbfso42498207b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 02:38:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709030310; x=1709635110;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cleTC/BMG3GM/DYSkVkxg9xk1wjwdvoTgmxdT3NQoWo=;
 b=uhA/yqzxRtqxYAquf5haHg70oInBZBeLuhOZoYWJhXt0MxeH0hJeDaeFIsrbx7eO2z
 qszse4mVpORaLzhUyzg9FIoEGftWcwFNSHx+8Tuyn1K/e89QNe9roKw06TuGfSdspwPv
 PIRksKtIDnv+n+GByvdSLiAV9hLyqhp5kC6gqh/zLEoKGpnhAFUElqgBt0LPKbEXBgG/
 49ySyTj7a/E4Tq6PuOb+eJuF5UmR5mOVuN0la9e4p7tBhyz9l8ur++QO1ncVKonxwwlj
 jrOMSLxWOJd2PoNTIhQ/Vl7/qpT8GXsL+HC+W/0xyV0QXi0EOrplur3+LEGdpqNnQdoi
 xGiA==
X-Gm-Message-State: AOJu0Yyc7vD/slRqZt1aucaHjijaZ9/TVOWyrMuw5Ci09KbZ0CnBaGX7
 1qn3DVHP1bNQ/GsN4eJYbMDte1Wvg8BfbhLJR5tupVjEjSRG7TdmuxgY5S9V6Ao=
X-Google-Smtp-Source: AGHT+IFreCQA4D2R3rOhZWgAO6P8OQRoW1/kS2Kb9UNi3aQA1NMo42F/gJ9ifKxnNQtUr3LONSh47A==
X-Received: by 2002:a81:af64:0:b0:608:e122:88 with SMTP id
 x36-20020a81af64000000b00608e1220088mr1748213ywj.9.1709030310392; 
 Tue, 27 Feb 2024 02:38:30 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 s6-20020a815e06000000b006079e8f3572sm1695140ywb.85.2024.02.27.02.38.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 02:38:30 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-608342633b8so37369907b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 02:38:30 -0800 (PST)
X-Received: by 2002:a25:bb41:0:b0:dcd:1b8f:e6d3 with SMTP id
 b1-20020a25bb41000000b00dcd1b8fe6d3mr1801332ybk.48.1709030310016; Tue, 27 Feb
 2024 02:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-2-aford173@gmail.com>
 <CAMuHMdWhtu7nuBpC=TSY6rMaReJNgYok535xXotDyKJDT1_Mzw@mail.gmail.com>
 <CAMuHMdViTAxWk8uvT-tgD4X2MJW5R3R1aqrv1K=FyQLdAciFcg@mail.gmail.com>
In-Reply-To: <CAMuHMdViTAxWk8uvT-tgD4X2MJW5R3R1aqrv1K=FyQLdAciFcg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 11:38:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLfyqJdvoquqqUBakA8Cm3NX2gSNCLSE=KwaiLQJDskQ@mail.gmail.com>
Message-ID: <CAMuHMdVLfyqJdvoquqqUBakA8Cm3NX2gSNCLSE=KwaiLQJDskQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: gpu: powervr-rogue: Add PowerVR support
 for some Renesas GPUs
To: Adam Ford <aford173@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 aford@beaconembedded.com, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
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

On Tue, Feb 27, 2024 at 9:09=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Tue, Feb 27, 2024 at 8:48=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, Feb 27, 2024 at 4:46=E2=80=AFAM Adam Ford <aford173@gmail.com> =
wrote:
> > > Update the binding to add support for various Renesas SoC's with Powe=
rVR
> > > Rogue GX6250 and GX6650 GPUs.  These devices only need one clock, so =
update
> > > the table to indicate such like what was done for the ti,am62-gpu.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> > > --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> > > +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
>
> > > +          - renesas,r8a77951-gpu
> >
> >     ... # PowerVR Series 6XT GX6650 on R-Car H3 ES2.0+
>
> All compatible values for R-Car H3 variants use the r8a7795 "base" value,
> so that should be:
>
>      - renesas,r8a7795-gpu # PowerVR Series 6XT GX6650 on R-Car H3

Same for R-Car M3-W, so

  - renesas,r8a77960-gpu # PowerVR Series 6XT GX6250 on R-Car M3-W

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
