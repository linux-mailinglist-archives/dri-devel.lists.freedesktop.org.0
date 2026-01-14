Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E73EBD1E4A8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 12:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE1710E5B5;
	Wed, 14 Jan 2026 11:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F150E10E5B5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 11:03:06 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-50146fcf927so6577691cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 03:03:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768388586; x=1768993386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jUj0QZHjKgRIKXHXvtdXuKCfmZJrYVq/PNABBtIJEcs=;
 b=JoOd1KPtmDTZHUnwUGl/aqMetJnnfNuumlQORQPZ8sdrQ262uw+KnnLm3KIRQ5CUCq
 1rc6MLmTCTfzC6Nz4rFUV4h137xOs8db2o3T6YXiqkgLYBuMVbTX1kGuJeX5BUSvbCQF
 yVZdsy+MDKYkfRAK5p7FFiZESDZV5gwlFk86iA+75AkWxrP33eWGafQ13TGmHtNvdJ+6
 bUvpMNyc5qe7JuRNcUKimE97woysIV/Le5IDRZHCeuJ1y/uEgXqU+oB8CBGY4IRU5jXN
 geBhNE9+ltUmZ3lQ29OQ54Y+52KQ7plPa9K+30qGCVAsR6z/lRbvlZpxTwAGTU1JV0CV
 f6fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0y0wdGAxHuMONQI/8YUw/oU77Mu8w3mo1YYMliJfweQzSW8yMaCs1Yz8s8/rBikPAGXODfy+pZcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyxm44pTMMo2r/b4DuBpMx26LjtU+0Rh6hWE2WIkuRL1QdHddRs
 Oj933CgSJpqut7oAtLQN5FpHuFfFFT45lFPZnfbOIcgHNPi9QKkvi92tLRkQ43+4
X-Gm-Gg: AY/fxX4MRrbd8is5par5pjyPcEIMUE8wAqMtv67+iq7/WHsbg2qGka4p+LWXPyEi24S
 O77eYV5IcyPpGeaXtocRUz3kKB6vAWxsN+dqTKF3yQ3Z2I8bowsHT9h1P1nSSlhz905NwIbtwLY
 aApYI1avA0IHWjc7OwTbHcAg0ytptIcieaLMGOyZ+BfCmxvcRdI9jOzqu9SQa+wQEv0+BMQCwPf
 VeIySxujj0a9roWyzCqOUXsn07Z2XhHP4Zf0Sle78aIoyd0Hh3ftwEK1FkacYPuShBnqwr01kpq
 Xiwd8aG1oDcW1Yuxk4xoF7rWc9WPMTJ2AkqUePh9OB9fVOC19DNfb70hZ2HNX9jyE25//GZr+/k
 15HSC+hYqJ0zWf8Ud9+lRuwHhXhFuSRt475psibIvXUCXwt5l8dFRyGuyPjr3fSHG02RUy/Qp9N
 iXliEaRjF065QCqWmqdv1fgThhqoowNdTUHV9BYOyIqoUZdqkF4qCd
X-Received: by 2002:a05:622a:1f9a:b0:4ee:13dc:1040 with SMTP id
 d75a77b69052e-5014873b1c3mr25839311cf.3.1768388585900; 
 Wed, 14 Jan 2026 03:03:05 -0800 (PST)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com.
 [209.85.222.180]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50148ee394esm12367321cf.33.2026.01.14.03.03.05
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 03:03:05 -0800 (PST)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8c52c1d2a7bso86339685a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 03:03:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVZVQoWVLz49TmcsdfwNJrGWFSmIsbM4Ho5l8ai+MJgrs/KgE/5XXVGo/IQyVpvc6Saibs/8yRbhM4=@lists.freedesktop.org
X-Received: by 2002:a67:e7ca:0:b0:5ef:a3c1:86e1 with SMTP id
 ada2fe7eead31-5f16caf02dcmr2636191137.11.1768388217149; Wed, 14 Jan 2026
 02:56:57 -0800 (PST)
MIME-Version: 1.0
References: <20260104222653.1659382-1-niklas.soderlund+renesas@ragnatech.se>
 <20260104222653.1659382-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20260104222653.1659382-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 11:56:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW-yM0=1nVqWvCMD0a-5izxFE1LLsuNuFCtfz=Od=QB1Q@mail.gmail.com>
X-Gm-Features: AZwV_QghUYTO_u0eAcOvYe5E9g88VVEx4bvinDAi6XyZ4obaigG9hTvrBIdoK34
Message-ID: <CAMuHMdW-yM0=1nVqWvCMD0a-5izxFE1LLsuNuFCtfz=Od=QB1Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a77995: Add GE8300 GPU node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
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

Hi Niklas,

On Sun, 4 Jan 2026 at 23:28, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
> present in Renesas R-Car R8A77995 D3 SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -1295,6 +1295,21 @@ gic: interrupt-controller@f1010000 {
>                         resets =3D <&cpg 408>;
>                 };
>
> +               gpu: gpu@fd000000 {
> +                       compatible =3D "renesas,r8a77995-gpu",
> +                                    "img,img-ge8300",
> +                                    "img,img-rogue";
> +                       reg =3D <0 0xfd000000 0 0x40000>;
> +                       interrupts =3D <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;

119

> +                       clocks =3D <&cpg CPG_CORE R8A77995_CLK_ZG>,
> +                                <&cpg CPG_CORE R8A77995_CLK_S3D1>,
> +                                <&cpg CPG_MOD 112>;
> +                       clock-names =3D "core", "mem", "sys";
> +                       power-domains =3D <&sysc R8A77995_PD_ALWAYS_ON>;
> +                       resets =3D <&cpg 112>;
> +                       status =3D "disabled";
> +               };
> +
>                 vspbs: vsp@fe960000 {
>                         compatible =3D "renesas,vsp2";
>                         reg =3D <0 0xfe960000 0 0x8000>;

The rest LGTM.

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
