Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4062F868A1F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 08:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A830F10E261;
	Tue, 27 Feb 2024 07:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EA610E261
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 07:48:42 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-60822b444c9so25689477b3.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 23:48:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709020120; x=1709624920;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u7zeR6KIY0a3dHEE7lZQueJuol6VZXvoVJ6gHmowZD8=;
 b=Xvvy8UdiOplbL/3n0qP58BGr6lt8pDJJI6+PkS5xFluE7stVq6lHpIVIkCIHkLgiKe
 C1RU9mVEqBtqv0GkJDpT8vpnDStleKFuL6wvXORcV0h1leh6GToFqh1byxdCkHPJycGd
 1TqTFgOwaF8jxCjTIrANSqZa4FOdJXKQ186HnTC3utSu0EADbfnnUzJ6ncn7Hct0demR
 oBjcmgzxqidYHBj+CFoy3gR4JPf2ScK5x2kC2fbLkfgGoA+qpt9wUcx5FY2GxEK6aVlR
 rSx+SChfQocQ/oHozSpxCe28gcjpuYvYSd8Oxu7cgd9TSTw3T15LuavW4GcFR0AILXFT
 pGeQ==
X-Gm-Message-State: AOJu0YwjmPsxoWL1LemLJcw1h88hUNoK/LqyPcB/uVZAhlDHSm5tw7oy
 Lx1//JKFO0h8CtSoXZ7P5OilZqBAICsvlgPKDUIvOtCMBrdXlTWk+cPxGgOvtp8=
X-Google-Smtp-Source: AGHT+IFcTGardX9wlmmjxHpDIlhuryyr3Y3yw09KXO3U7J5vN10AFktvmSPT/7D+I/uRVOWlbWfJSw==
X-Received: by 2002:a81:ad45:0:b0:608:b439:4779 with SMTP id
 l5-20020a81ad45000000b00608b4394779mr1430971ywk.0.1709020120518; 
 Mon, 26 Feb 2024 23:48:40 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 t18-20020a818312000000b00607bfa1913csm1650721ywf.114.2024.02.26.23.48.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 23:48:40 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-608cf2e08f9so33686617b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 23:48:40 -0800 (PST)
X-Received: by 2002:a25:8706:0:b0:dcd:a9ad:7d64 with SMTP id
 a6-20020a258706000000b00dcda9ad7d64mr1462178ybl.48.1709020120180; Mon, 26 Feb
 2024 23:48:40 -0800 (PST)
MIME-Version: 1.0
References: <20240227034539.193573-1-aford173@gmail.com>
 <20240227034539.193573-2-aford173@gmail.com>
In-Reply-To: <20240227034539.193573-2-aford173@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 08:48:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhtu7nuBpC=TSY6rMaReJNgYok535xXotDyKJDT1_Mzw@mail.gmail.com>
Message-ID: <CAMuHMdWhtu7nuBpC=TSY6rMaReJNgYok535xXotDyKJDT1_Mzw@mail.gmail.com>
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

Hi Adam,

On Tue, Feb 27, 2024 at 4:46=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
> Update the binding to add support for various Renesas SoC's with PowerVR
> Rogue GX6250 and GX6650 GPUs.  These devices only need one clock, so upda=
te
> the table to indicate such like what was done for the ti,am62-gpu.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -14,6 +14,11 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,r8a774a1-gpu

I would add a comment like this:

    - renesas,r8a774a1-gpu # PowerVR Series 6XT GX6650 on RZ/G2M

> +          - renesas,r8a774e1-gpu

    .. # PowerVR Series 6XT GX6650 on RZ/G2H

> +          - renesas,r8a77951-gpu

    ... # PowerVR Series 6XT GX6650 on R-Car H3 ES2.0+

> +          - renesas,r8a77960-gpu

    ... # PowerVR Series 6XT GX6250 on R-Car M3-W

> +          - renesas,r8a77961-gpu

    ... # PowerVR Series 6XT GX6250 on R-Car M3-W+

>            - ti,am62-gpu
>        - const: img,img-axe # IMG AXE GPU model/revision is fully discove=
rable
>
> @@ -51,7 +56,13 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: ti,am62-gpu
> +            enum:
> +              - ti,am62-gpu
> +              - renesas,r8a774a1-gpu
> +              - renesas,r8a774e1-gpu
> +              - renesas,r8a77951-gpu
> +              - renesas,r8a77960-gpu
> +              - renesas,r8a77961-gpu

Please preserve alphabetical sort order.

>      then:
>        properties:
>          clocks:
> --
> 2.43.0

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
