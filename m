Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E770A93961
	for <lists+dri-devel@lfdr.de>; Fri, 18 Apr 2025 17:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE53B10EBAB;
	Fri, 18 Apr 2025 15:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fgvJsE5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E32E10EBAB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 15:16:07 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso14791895e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Apr 2025 08:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744989366; x=1745594166; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDQCZN7XtccKekE6ix7EFyl/aNyMmVJtvGUO/HQEWB4=;
 b=fgvJsE5nmkCdfZfaQYHiEnzTewgydR4z5Cv8orwyo0bwXRuX4ShwEyG8PgyZUmDkCn
 xPkDN0FohgjKNmDL/ckwklRfXaHq0tmXEgP5lQyWcyzMpfJa6ddk2/8QN6GGUUTecOjj
 jU+fjwU4GqbGb4NNYyLIDh5z7yqUTTD8R9/rtXjQ6oVpZBNkrAPRjDMmGaE1GaomDAbE
 /iFQEhzMUxuJ1/OdIN9NVsOwVRoLMo+yFqF18Eg5rOcydI/CjJARW9Pc8V4vxYLt/UHc
 1vnizbmFjhv25iQGlzujEq0xPlIVE5paoUFYJe2NFcoHJfUJX0Oz79V09l/jPIeEr10R
 C8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744989366; x=1745594166;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDQCZN7XtccKekE6ix7EFyl/aNyMmVJtvGUO/HQEWB4=;
 b=ZgsNI6+EWHIcnjV5mEfmYvvUI6lOxoYwzEbVkAiPX+uw5yOwijKbAmPuaJ4tWG9+gJ
 p3J+IprEtHaW9W1D5MmYmdeQ73JtBJHtDPINVb94ZLG2S7Y4djw88HgBRbtd5RbaHFfb
 k6YuX/R2edhmSdg9bZVT1nLZnWLvGeWJoGqzi8jH1OrTdT1ludOtwrFn9iDHzLwLEAVV
 eii+UzfJ389Ol2aGWilbtkwCriunJwuKZxELO8w5JsyWbXQWmwTZ3ONmthOuGbrncnaQ
 nRnPDRHPm/yaO53ikYUMvhyZS0b+ZJsLi9jyBUpwhLFN+GhfrSwScmIB8oskwVmIf/ST
 J/rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRWpJ8A71yC9Iza7iEZyQPUXnVaxRmure3oDIRC1a6pIqE2ZFU0pN6tRWDqSRjOUjNFoSd5q18Vr4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0nUhxsTlzG3GWToTAr+gcuhKN0xnI8dZq9UxfN4VVIcaoSfMQ
 pJNzzCR7fcYcEIqmMh1GkmAdpHFjQwBydj3qSuRj2Gm5/UIxREHNAYaZG2a4Suu1bo2JJyXAkSE
 a7mdJLwjWZihoUoof2JpbLe5OvMk=
X-Gm-Gg: ASbGncu4DbnTB3FwAuCuaTnm47laIUrWRDjpoFMHwC7H82YmmRBGcBcJy1kKzigbPPW
 ZEQMaA8CciQ5pvyX2V4ruVKh1ByfzOwpqCxGnHbhl6uUalw2pW2pD3yTbMjsKKMiwNbypMrf6BL
 mHfNF979VODrPKtbY8WURuZC+5yqH1eGUm7H6dwOPv45G6Zzg1ISybOkU=
X-Google-Smtp-Source: AGHT+IFmXeJc3YDRQKSCZof7kxPeLkVbKbIzjnIGX2JOiqECYlzFhqayvmJDanc/5uMaQBQmGnlreIjKMnRprAPvMCA=
X-Received: by 2002:a05:600c:54c2:b0:43d:77c5:9c1a with SMTP id
 5b1f17b1804b1-4406b928b57mr19545275e9.4.1744989365491; Fri, 18 Apr 2025
 08:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-16-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVbcOvfW6YqW6S77J7htaJqWkeoGEhjkAWXvG5Fo1FMhA@mail.gmail.com>
In-Reply-To: <CAMuHMdVbcOvfW6YqW6S77J7htaJqWkeoGEhjkAWXvG5Fo1FMhA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 16:15:39 +0100
X-Gm-Features: ATxdqUFKG7b-9fi5GPMwEzMprDzBzoNhSBw2axhPGgXuBYZm8tjPIyPxCGRg-3w
Message-ID: <CA+V-a8uyj0myd=At83X+=MnQqTdkpo3tyADgOPuTL_FjzPZD8g@mail.gmail.com>
Subject: Re: [PATCH v2 15/15] drm: renesas: rz-du: mipi_dsi: Add support for
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
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
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

On Wed, Apr 16, 2025 at 10:35=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar, Fabrizio,
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DSI support for Renesas RZ/V2H(P) SoC.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -70,6 +80,18 @@ struct rzg2l_mipi_dsi {
> >         unsigned int num_data_lanes;
> >         unsigned int lanes;
> >         unsigned long mode_flags;
> > +
> > +       struct rzv2h_dsi_mode_calc mode_calc;
> > +       struct rzv2h_plldsi_parameters dsi_parameters;
> > +};
> > +
> > +static const struct rzv2h_plldsi_div_limits rzv2h_plldsi_div_limits =
=3D {
> > +       .m =3D { .min =3D 64, .max =3D 1023 },
>
> .max =3D 533?
>
> > +       .p =3D { .min =3D 1, .max =3D 4 },
> > +       .s =3D { .min =3D 0, .max =3D 5 },
>
> .max =3D 6?
>
> > +       .k =3D { .min =3D -32768, .max =3D 32767 },
> > +       .csdiv =3D { .min =3D 1, .max =3D 1 },
> > +       .fvco =3D { .min =3D 1050 * MEGA, .max =3D 2100 * MEGA }
> >  };
>
> Summarized: why do these values differ from the ones in the declaration
> macro RZV2H_CPG_PLL_DSI_LIMITS(), i.e. why can't you use the latter?
>
There is a divider inside the DSI IP which is almost similar to PLL in
the CPG. The divider limits for the DSI IP vary as compared to one in
the CPG IP.

Cheers,
Prabhakar
