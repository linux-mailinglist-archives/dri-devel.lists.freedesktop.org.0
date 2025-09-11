Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896E0B52B51
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 10:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D4DD8984C;
	Thu, 11 Sep 2025 08:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lVX4nsfS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D618984C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 08:15:24 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-b046f6fb230so81907766b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 01:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757578523; x=1758183323; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EtBJ7XRZRXHnb1oRAlJMLn1CzpEHjZeP/Tjuzyg5UAo=;
 b=lVX4nsfSphrB0IJfnsGYvZcDr2ZsBiwhpL7A6K7RdWnhcFqQo3cAg8SaT7NqpE33Yy
 ZBxUFFuSo3zr763DxnZbAzxrDjSfOWbK0+I+Cp75gCYIRdmewgw1s1bxmXcGfdIZ0jiW
 JkaQFVWGGWgzn913cJhy1iCZC1G4vV41XIv+n6CakefwMou0TILU7ehS3yk8O+BOO32G
 SZYzOncq/MqX8ZrPZVhgw3j0i0BVqECGhkq+QVkBna30cT1SWxMqeMgH8FgzyX1OCabh
 o3FyNRtb3pJq8AwW2mvMSlru5YswpWUk9NLkiAwSOrXCG/Yb/O+h7j0niK+740Fh7aY9
 ArCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757578523; x=1758183323;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EtBJ7XRZRXHnb1oRAlJMLn1CzpEHjZeP/Tjuzyg5UAo=;
 b=cO6R9w/sz1vM6au22QeBQhUJzn+Okx9HRV8P3FkQ/ekgitZTeXlEN+1Rcz2Y+HiAPB
 AseUF9f/cU4Mn52kAEsIaj8Za5sQi6yrn2ZZoPEEXq7PJKAdxMCBfvu4nrCpbw5XFPMA
 B+Zr6veMxtTc4E48Ss9c5OQ9viMOg4o9wyJY9obYYp7JF3vGekS95/SWbAakDj8046Xz
 8lIgeIAOkFrPuqdcqohT5/EQ7LY8g5Q5hSREsvU3bTmzud8+CkZpYSSc+vRbII+sM4Ak
 bmEdN4W9Q+gIVfrEyOyYD2rpyZBGqPjLF6IXZgftmANcEuiWB4glyVjKF2SC1nujNbC/
 MV1A==
X-Gm-Message-State: AOJu0Yz4b79CrFyNu+TcG0kOTR81/71uGWa/Q99TQ9Pb1mVxH8BDzfOD
 S/kLPM1f+HG6XYS8NVKoqVjh+Sc2ZooKdEDrAzw3JlvNm5hN+YqsdYwu9X5MpUQep4L9FmlBafF
 8kZnMgZMTlRqg210ehQ0VzBsQu8zw7vvpUOOCiJE=
X-Gm-Gg: ASbGncvRjvkYvfW/nb+iWcwtVxrChOsk3uXidvSXAZ2cL+W0k+e/rmE0g5F5MloLt2n
 t4e7Y8FT0G/OGOaHch/3tqOrs+GuFA1+lCParsN1oFTbw8NJMpIPSCRlrcjG9sWr1frz3dhPWE/
 m1xgfj3PvTrLdkcuLg7N+nenVu3D7hKrYXGf7qUM+9tCWH/QvTR7g2+g9nDQSEbsWQZcloH/Cj7
 rgxVLwsj1d/0lpwflVwUlux3YLHrD1P+9AnOO278DM+nNLW2V8=
X-Google-Smtp-Source: AGHT+IEnp+5Pp/hKtvuNcvkPD7ilbt2E7mIP6OMzOLx6fAXAtKZDlirtxajpgqUgKHbow62KqE/NON7LEPov9/q3UY0=
X-Received: by 2002:a17:907:2da5:b0:b04:4579:486e with SMTP id
 a640c23a62f3a-b07a6403229mr286982766b.28.1757578522708; Thu, 11 Sep 2025
 01:15:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com>
In-Reply-To: <db2fc907-218c-4688-aebf-4a929f21b074@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 11 Sep 2025 09:14:56 +0100
X-Gm-Features: Ac12FXwA2G13xPdRFdy3yeIIErYfrkajYLbpZADAiTZT6Kl8ibBEbrC_wV_N2u8
Message-ID: <CA+V-a8vghwkHKWoqU8NQ3O9ZdHxB+cEvMv7Z9LQOMsZcx9vjPA@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Magnus Damm <magnus.damm@gmail.com>
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

On Wed, Sep 10, 2025 at 1:30=E2=80=AFPM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> Hi,
>
> On 03/09/2025 19:17, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and share
> > PLLDSI related data structures, limits, and algorithms between the
> > RZ/V2H(P) CPG and DSI drivers.
> >
> > The DSI PLL is functionally similar to the CPG's PLLDSI, but has slight=
ly
> > different parameter limits and omits the programmable divider present i=
n
> > CPG. To ensure precise frequency calculations, especially for milliHz-l=
evel
> > accuracy needed by the DSI driver, the shared algorithm allows both dri=
vers
> > to compute PLL parameters consistently using the same logic and input
> > clock.
>
> Can you elaborate a bit more why a new clock APIs are needed for the DSI
> PLL? This is the first time I have heard a DSI TX (well, any IP) require
> more precision than Hz. Is that really the case? Are there other reasons?
>
Im pasting the same reply from Fab
(https://lore.kernel.org/all/TYCPR01MB12093A7D99392BC3D6B5E5864C2BC2@TYCPR0=
1MB12093.jpnprd01.prod.outlook.com/#t)
for the similar concern.

The PLL found inside the DSI IP is very similar to the PLLDSI found in
the CPG IP block, although the limits for some of the parameters are
different. Also, the PLLDSI is followed by a programmable divider,
whereas there is no such thing in the DSI PLL IP.

The limits for the PLL found within the DSI IP are:
1 <=3D PLL_P <=3D 4
64 <=3D PLL_M <=3D 1023
0 <=3D PLL_S <=3D 5
=E2=88=9232768 <=3D PLL_K <=3D 32767

The limits for PLLDSI (found in CPG) are:
1 <=3D PLL_P <=3D 4
64 <=3D PLL_M <=3D 533
0 <=3D PLL_S <=3D 6
=E2=88=9232768 <=3D PLL_K <=3D 32767
The limits for the PLLDSI related divider are:
CSDIV =3D 1/(2 + 2 * n), with n=3D0,...,15

Header file `renesas-rzv2h-cpg-pll.h` is added so that both the CPG
and DSI drivers can reuse exactly the same data structures and
algorithm, although they'll drive  rzv2h_get_pll*pars() with different
limits.

While the CPG driver only needs visibility of the limits for the
PLLDSI, the DSI driver is going to need visibility of the limits for
both PLLDSI and for the PLL inside the DSI IP.

The DSI driver requires a resolution higher than Hz (which is what the
clock subsystem currently does not support), namely: mHz. This is
vital to allow the DSI driver to keep the error between the calculated
value of HSFREQ and the generated value of HSFREQ below a certain
threshold. The difficulty in achieving a small error is down to the
accuracy of the VCLK representation.
Since the clock subsystem only allows for Hz, a 1/2 Hz error on the
representation of VCLK (down to the selection of frequencies that
cannot be precisely achieved and related rounding errors) may lead to
a very big error in the calculation of HSFREQ, which uses the below
formula:
HSFREQ =3D (VCLK * bpp) / num_lanes
In the worst case scenario (1 lane and 24 bpp), a 1/2 Hz error on the
representation of VCLK will lead to an error of 12Hz(!) on the
calculation of HSFREQ, leading to a non working video output.

By granting the DSI driver access to the PLL calculations and PLLDSI
(CPG) limits, the DSI driver can work out the best solution for VCLK
independently from the CPG driver, and it can set VCLK accordingly
(knowing that the CPG driver will use exactly the same parameters
determined by the DSI driver, as it will be using the same input
frequency and the same algorithm for the calculations).

For convenience, macro RZV2H_CPG_PLL_DSI_LIMITS() is added to avoid
replicating the declaration of the PLLDSI limits and therefore it can
be used in both the CPG driver and in the DSI driver.

Make use of the data structures and algorithm defined in header file
`renesas-rzv2h-cpg-pll.h` to add PLLDSI support, including its
divider.

Since we need to make sure that the DSI driver knows exactly which
frequency the PLLDSI + divider combo is going to generate, the CPG
driver is instructed to calculate the parameters for the PLLDSI +
divider combo (by calling into rzv2h_get_pll_dtable_pars()) only from
rzv2h_cpg_plldsi_div_determine_rate(). rzv2h_cpg_plldsi_div_set_rate()
will simply reuse the pre-calculated parameter values."


> If such precision is really needed, does it then indicate that it could
> be needed on other IPs too? Thus, we need improvements to the common clk
> API.
>
As of now, this requirement is specific to the DSI IP on the RZ/V2H(P)
SoC. For other IPs we haven=E2=80=99t seen a need yet. Once similar cases
arise in the future, we can certainly revisit the clock subsystem and
look into extending the common clk API to support this more generally.

Cheers,
Prabhakar
