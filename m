Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EF29EC6CD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2324210EA93;
	Wed, 11 Dec 2024 08:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 945AD10EA88
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:16:41 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-51889930cb1so622167e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733904997; x=1734509797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5FY0XX7TvU9anI/w2FWrAwi4RB2/V1Am38o5HNJIjvQ=;
 b=V4l6mgXpGSY/lAI2rUrBh4A7Km3D7YmZ0Yf/8tHjHktFNTsl5QQG7kioBKYveZXNO+
 Nwxx5NZVIdJC7SKSEwS3L+hWxrJAxCtiwG4oCyxUcPhxshgseoVGtY4FAy7JLd9N02Bf
 DfQC97fOAvBcdDsSjwHBeLxsDRv4H/+DBW9dot9LWcojVGMePFn0JGETKEfgAorKE8W3
 IhFo0AY9EIQvZhiMLC/PHGDThBqYskCjJRireNhRE+Hy/WUG4WeN0wbv8QnnscqP5L5j
 dSNu7SMBmVr9gxbcKjwBEg8VEU+PsNZrsCTLvJ37TCXhaE0bVHoHsR2fzlzgY/joF30y
 cc5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb83M1DpDLH3KKNcbaO2C9QqJkNyeYlhmjPiOo4UBB1DfcksiR2lgfgGv1Be+MrwTuopd45cNYJ7c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8AuLrGUjbooPkl9+XUhpIATbQDvrpTxtAnVyMBoBi5emZSUZ8
 CnlOmPgImHmP1ZmTQ+/OWr6k+HX8FdCJBZ0HNPr1HtccT0/DEmy1glEWO5Ck
X-Gm-Gg: ASbGnctRri6T+zUcbsJ7KYg5taCgPstMgup7097Vee7W6hfqdJIQ0UdYUDG928IrY34
 2HjhOgn/+Dd7D4HJX4IhZGouQv/gu5K+f+nv/hsizfpWyohJw+z+nX2tSHdxA2343l7cj+jrdG0
 VCC0YxgB1+BDt9J5Nz/nkr4mZBKxPUY1zGxzEbtjN2vlbQnViTFPk4vg7utiHSBHI+3UHdEzJxA
 V2n5L9vmymj6pQg3Df3a9i9OyW7CyiXIWuZ8GC7K2RJvq2yZP+3SBL+sUkQyA/n3HnTCZB6unlu
 WfVAklp4ZsSwD6aJ
X-Google-Smtp-Source: AGHT+IHEawZYVvTpKZJz5xARACA3gADd3V3SnBr7wqZP2tPgRWioy1ncEJcM02zcRQPhiEBTDLfCRg==
X-Received: by 2002:a05:6122:1782:b0:518:7777:a61e with SMTP id
 71dfb90a1353d-518a3a3541amr1797969e0c.5.1733904997400; 
 Wed, 11 Dec 2024 00:16:37 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com.
 [209.85.222.48]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5188c74aac0sm270157e0c.33.2024.12.11.00.16.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 00:16:36 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-85bc5d0509bso1321344241.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:16:36 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV/5EfLm0bwSWf/0vo8n9JA2FspClgiBGqNUDJSdbYrqCCyD4sUty3Z+Xysh594+BvqG+JkyJ+pdFE=@lists.freedesktop.org
X-Received: by 2002:a05:6102:5108:b0:4af:f275:e747 with SMTP id
 ada2fe7eead31-4b12912a99bmr1969256137.22.1733904995896; Wed, 11 Dec 2024
 00:16:35 -0800 (PST)
MIME-Version: 1.0
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
 <CAMuHMdXMt74okJjqinLwrVmf5hZFm7YQkE5s3u2F9AOTWk+zXQ@mail.gmail.com>
 <da31d29e-6a2b-45fc-bb16-3ee78be41d66@ideasonboard.com>
In-Reply-To: <da31d29e-6a2b-45fc-bb16-3ee78be41d66@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 09:16:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXsmnPrXSWqh_JN04d+Gh=X=4SWKEWZyfUE6Mim97d06Q@mail.gmail.com>
Message-ID: <CAMuHMdXsmnPrXSWqh_JN04d+Gh=X=4SWKEWZyfUE6Mim97d06Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: renesas: gray-hawk-single: Add
 DisplayPort support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 LUU HOAI <hoai.luu.ub@renesas.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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

Hi Tomi,

On Tue, Dec 10, 2024 at 7:10=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:

> On 10/12/2024 18:34, Geert Uytterhoeven wrote:
> > On Fri, Dec 6, 2024 at 10:33=E2=80=AFAM Tomi Valkeinen
> > <tomi.valkeinen@ideasonboard.com> wrote:
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Add support for the mini DP output on the Gray Hawk board.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com=
>
> >> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.c=
om>
> >> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts

> >> +               compatible =3D "ti,sn65dsi86";
> >> +               reg =3D <0x2c>;
> >> +
> >> +               clocks =3D <&sn65dsi86_refclk>;
> >> +               clock-names =3D "refclk";
> >> +
> >> +               interrupt-parent =3D <&intc_ex>;
> >> +               interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
> >
> > interrupts-extended =3D ...
>
> Is that just to use the same style in the whole dts, or is there some
> specific need for the extended one here?

There is no real technical need to use the extended one, but it is
more concise. That's why we just converted all such cases in Renesas
DTS files in v6.13-rc1.

And of course it reduces the difference between
arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi and
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts.

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
