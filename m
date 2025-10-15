Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29405BDDB0E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 11:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05AE10E3CA;
	Wed, 15 Oct 2025 09:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F47010E3CA
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 09:16:05 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7c0dd405c38so3974924a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 02:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760519764; x=1761124564;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tJmRJlu9H8wURlz4KPU2uyoao6Y2zyTwzoAnkPT6lmM=;
 b=i4aZ6/LxLvmdm/5dqKa9Ifbufo2iup0Mw3jJti1AGx2ZlGSfhZkTQnH1uShxuZh/Ga
 S1n/6IUDv49nPOeWX2TT5Feofx5/iToomgOKGvlEhts50ZuTvMQ2ngMX28v0lPXk0oMH
 Gtzuj/mmcmGTYZ4rF1HFwjZlml6sODNfv0BlYYDBTbNaYXpn35+ea4vw2IbANbu5090s
 Mzqs8FMXMy9s/+fMtxvBQ1UrJS4lbMljOXf0mMPIH41qQ6MGy/wRk2CUpkZWHi/zXnOW
 ZxkKm9AbEoauixMitrTW7iRaXQwqyIhrPqLmFAFY3VswJWNNDVsWHbO/DnvfPgo1sthf
 3Vhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2XG/8QI5gvu5u0OD53KAsCvGgr8zFuN076axWhWD2Bm73pL1vmsg82buS3quTEji7NqqzmdXfU/A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6Ld8gsjjYRJJ+YwYt4UAnCqdP6CVV59ps/TWsyRnvFkiKPl0T
 TLAIV/6/V6szTdQpiZJu5Fy/etIJrErddFoz/6uyHoSedYxgeBMUkSJqe6f/oN16
X-Gm-Gg: ASbGncu8Izbnoen07La84fEp6gnvhD7hQUBSwhrTapm3L2s3bwbaE5FouL05qrwRaZ4
 1asPiOF1JSzLvcOX+DF5/FBch8rMLQyNRhTsI5maRPYv7CxiMIqODSua0YJEaV+7qxrK+UOcFpH
 7CD29/rt3zt4iYmpFAbPFr4+j3fE+8nbIeo7s9OqA0c8+LaoFNciZxJObhMrXpwQNkxMO9Amilf
 mjPztQARECT4Vvf2gxdxg6F/HCE8mayvKzZ63dcJybV1YzwlWX9Eqi9eQPMKvOEUi1QwJSv5maL
 HtyYMXwqVQeQOCozgIUfRoUT83vjgHMEJUTV0DdDflsqTxhPLWO2eaXcLKvsH4qjliETJFN0Q1c
 ilqeoW1tXavL0lKJ7IZAkZkHEooc3JTDw2IHcy5wLHHupUpM2LntK6NmzPKjMxmj/d/fXmMqWLC
 XDt6HuK8VtS434EJW54w==
X-Google-Smtp-Source: AGHT+IFOOIOJusgECI+ULOuO77qxRHgi5HRpVDIZAP/Tkyk6m7c+2BBkOzTcIGHIq6hIemo6elW9Bg==
X-Received: by 2002:a05:6830:83a9:b0:7bd:f7c:ee with SMTP id
 46e09a7af769-7c0df6eadf4mr16486717a34.25.1760519764349; 
 Wed, 15 Oct 2025 02:16:04 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com.
 [209.85.167.172]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7c0f90fb4a0sm5191515a34.17.2025.10.15.02.16.03
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 02:16:03 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-43f5ec025d3so3053887b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 02:16:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXkNcHWZzIxLGjzhKKJlSQZ658+IOKk/o+F+gzwvKzQShy7/Uq3PlkEmoteSfnOwAdxbgu4V2oaXXo=@lists.freedesktop.org
X-Received: by 2002:a05:6102:54a7:b0:5d6:df4:4a9c with SMTP id
 ada2fe7eead31-5d60df44b27mr3945077137.38.1760519422390; Wed, 15 Oct 2025
 02:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
 <c65950f5-010a-4d5d-88d9-60697eeddb46@imgtec.com>
 <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
In-Reply-To: <f4e1897c-7073-4ab0-92b3-6f7d69382825@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Oct 2025 11:10:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
X-Gm-Features: AS18NWC0NtvnYK5U9YXJyT8uG9UQFbJEFgUG9T-bnGHWW0_GW4mwUzABObId4Tc
Message-ID: <CAMuHMdVpb-0TJ4AoqjAGbdErw65193+j1-HbXCyvvwf8MT6yLQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: img, powervr-rogue: Document GX6250
 GPU in Renesas R-Car M3-W/M3-W+
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Matt Coster <Matt.Coster@imgtec.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>, 
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
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

Hi Marek,

On Wed, 15 Oct 2025 at 00:48, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 10/14/25 1:52 PM, Matt Coster wrote:
> >> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.y=
aml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> index c87d7bece0ecd..c9680a2560114 100644
> >> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> >> @@ -13,6 +13,12 @@ maintainers:
> >>   properties:
> >>     compatible:
> >>       oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - renesas,r8a77960-gpu
> >> +              - renesas,r8a77961-gpu
> >
> > I think this can just be renesas,r8a7796-gpu; most of the devices in th=
e
> > dts for these SoCs appear to use the same pattern and the GPU is the
> > same in both.
>
> Not really, the 77960 and 77961 are different SoCs, that is why they
> each have different specific compatible. Of course, most drivers match
> on fallback compatible, since the IPs are mostly identical, see this:
>
> $ git grep compatible.*7796 arch/arm64/boot/dts/renesas/r8a77961.dtsi
> arch/arm64/boot/dts/renesas/r8a77961.dtsi:      compatible =3D
> "renesas,r8a77961";
> arch/arm64/boot/dts/renesas/r8a77961.dtsi:
> compatible =3D "renesas,r8a77961-wdt",
> arch/arm64/boot/dts/renesas/r8a77961.dtsi:
> compatible =3D "renesas,gpio-r8a77961",
> ...
>
> $  git grep compatible.*7796 arch/arm64/boot/dts/renesas/r8a77960.dtsi
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:      compatible =3D
> "renesas,r8a7796";
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
> compatible =3D "renesas,r8a7796-wdt",
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
> compatible =3D "renesas,gpio-r8a7796",
> arch/arm64/boot/dts/renesas/r8a77960.dtsi:
> compatible =3D "renesas,gpio-r8a7796",
>
> I can turn the first entry into renesas,r8a7796-gpu to be consistent
> with the legacy 7796 name for 77960.
>
> Geert ?

Please use "renesas,r8a7796-gpu" for R-Car M3-W, and
"renesas,r8a77961-gpu" for R-Car M3-W+.

> >> +          - const: img,img-gx6250
> >> +          - const: img,img-rogue
> >>         - items:
> >>             - enum:
> >>                 - ti,am62-gpu
> >
> > You also need to add img,img-gx6250 to the appropriate conditional
> > blocks below here for the number of power domains (in this case, 2) and
> > clocks (that's more complicated).
> >
> > These older GPUs always require three clocks (core, mem and sys), but
> > it's not immediately clear from the Renesas TRM how these are hooked up=
.
> > I can see three "clocks" connected (fig 23.2 in my copy, clock details
> > from fig 8.1b):
>
> Which revision of the RM is that ? There should be some Rev.M.NP at the
> bottom of each page.

Rev.2.40.

> >   - Clock ZG=CF=86: Appears to be a core clock for the GPU (3DGE). That=
 would
> >     make it our "core" clock.
>
> This should be 600-700 MHz clock on M3-W , so that sounds like a GPU
> core clock.

Agreed.

>
> >   - Clock S2D1=CF=86: Appears to be a core clock used on the AXI bus, m=
aking
> >     it our "sys" clock.
>
> This should be 400 MHz AXI clock, but wouldn't that make it "mem" clock
> ? I think this might be the clock which drives the AXI bus, used by the
> GPU to access data in DRAM ?

Agreed.

> >   - MSTP ST112: Appears to be a whole module on/off control of some
> >     description, and definitely doesn't align with the missing "mem"
> >     clock.
>
> Maybe this is the "sys" clock, since it toggles the register interface
> clock on/off ?

Probably.

Note that both ZG=CF=86 and S2D1=CF=86 are always-on.
MSTP ST112 is the only gateable clock, and it is controlled through
the PM Domain and Runtime PM.

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
