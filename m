Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FF7A82099
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 10:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1604210E07F;
	Wed,  9 Apr 2025 08:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ru+Ii6yu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
 [209.85.221.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389EB10E07F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 08:55:47 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id
 71dfb90a1353d-523fa0df55dso536293e0c.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Apr 2025 01:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744188946; x=1744793746; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xKkhSratOE8FhNwto8msCYe3EaTscTslbqKejN9e03g=;
 b=Ru+Ii6yu4AtZMbUlkUeoaNGZGgNXjMOmpw4OZb67xB2olfXr4umiyCpyMVGrCJdoYs
 nawdY8lcxKRMiKZu5e3IFdBmVmyHERYLfZ0mdFiZG3FvplTukxqLy7w+FvhXl+R4EVi6
 Ck+GM3aI/t9xOUeaZ/WO8EIdn2FSDdNzeyJgo16JWTEx1tm3Hadf8UUgkK8Vg2hglpvq
 2f9W+fFx6ZqKbe7NuyrckkLrA5GgqrDZ1wounxpVqOhblPkAXSk0//7bquORqcjbftm1
 nRZZneLs5NJP5K0aZyJHQfz7YKZCOGqYMiC/55173r2xDGN4QAm4DYGQVlBuhdEyT15Z
 04vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744188946; x=1744793746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xKkhSratOE8FhNwto8msCYe3EaTscTslbqKejN9e03g=;
 b=TRTS5SnH1d+lfZlS/mldVzuf4UNZsImQgKl641zVBfuwQlApcAsNcNrtZbEF5q3oEu
 87+xJ9FFcbfyh45G1ZBY4abhwFi6dMWCW5KKQ3zOouWUC2r/Rj86pAfeV/WwKx2v3DGf
 ndmL7M44oULKYIP8GzB2cZG1qgmcBaYlp2OGUHQrWXC5Z+35x1utVw9vK0DnMPeKI82j
 x2LdXmpBYkMjtvibLNhC6NQp0l1TQqB10u88AcuPpq2HwF7dtJT55qIUdiw0IGGRih+n
 y4luveyFbctZTjSr/L3dyhLahPHMhIUMPpfWOahKnfNIxN59XK7qNEyLmGYt4hSbj+Yo
 zBJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZR7f8U34b6VQY68D36anMv6uRvidJEWGa0S4K7Mj/0WPUoD9cuEuUCIgFhKL/jXKdcepyeTsx58c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzuf5IGNQY3DAV+uAgEMZFgQL7UOmFLoo02/8DkmRy0WIFBU+Qa
 yQr7xsBsFMfbykX7X5MJNHNNWFrJB5VLBmGRWtDTxOPIrupbSTts2yEIVlxP6q2wDZGyZcb1cHn
 4wVPFtS150rw5fWNj9HYltVIZx5k=
X-Gm-Gg: ASbGncv6Nhps73BRwXW3AUcC9nWa4Q9Zhtqf0Xad7SjIGjLihBuAZ4X7ojM+v9txp7t
 fT/FbpxM+GTBYoC42gbFq+sEP16pOHM906aNWkypFIjOquYUxfKOe6Ker1XsE6WAzug55Jt7ysF
 B9s2BnYdqSO6JE4OeG78gA/QYZSKbS09rgWwrlLDgYGh/tFUenWx/m+eY=
X-Google-Smtp-Source: AGHT+IFkvSJE5U/9fmVpXSs+iaoY5nuY5+IWwlLNMnF2gNZkr5kIoflvPEnL4H4NBK6FHRKQDcdNNrDvBUNiQdI3bio=
X-Received: by 2002:a05:6122:d89:b0:50d:39aa:7881 with SMTP id
 71dfb90a1353d-527a8beff21mr1371744e0c.0.1744188946056; Wed, 09 Apr 2025
 01:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVAxaLZJ4y0AWKrLobp55n5NPqQgEtHK_d1DDUM1LAkDw@mail.gmail.com>
In-Reply-To: <CAMuHMdVAxaLZJ4y0AWKrLobp55n5NPqQgEtHK_d1DDUM1LAkDw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 9 Apr 2025 09:55:20 +0100
X-Gm-Features: ATxdqUF6pkX8g8cSssT4x6HUE0uVbLtqiF0Qca_2kkdcVwxXzZnsXvGx2QnlRqk
Message-ID: <CA+V-a8uc22sYFwfB7CJK9gSmT7ibv5MxTPyTBJtJMijKcgbW5g@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
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

On Wed, Apr 9, 2025 at 9:16=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
> > precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
> > high accuracy.
> >
> > These changes prepare the driver for upcoming RZ/V2H(P) SoC support.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -33,7 +33,7 @@
> >  struct rzg2l_mipi_dsi;
> >
> >  struct rzg2l_mipi_dsi_hw_info {
> > -       int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfr=
eq);
> > +       int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long long=
 hsfreq_mhz);
>
> Due to the lack of capitalization of the "hz" part, it is not clear
> that the "m" stands for "milli" instead of "mega".
> Perhaps hsfreq_mHz or hsfreq_millihz?
>
Agreed, I will use `hsfreq_millihz`. Shall I respin a new version as
the initial patches do the same (i.e. use mhz).

Cheers,
Prabhakar
