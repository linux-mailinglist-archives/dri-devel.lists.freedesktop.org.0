Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A69BFBF80B8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 20:27:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EEB10E329;
	Tue, 21 Oct 2025 18:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ed0X9JH/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588EC10E63C
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 18:27:18 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3ee64bc6b90so3798125f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761071237; x=1761676037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cE8uSQwXWgST8uXT/C8GC45uDsa31ftgODHC5Ezx8BU=;
 b=ed0X9JH/hMOq6NrWfJ3v3pZLZqtWOAsyDwz4h9VYmf/qTxS+S0e+8LvXnrM9KLdJPG
 36UhzSEoUtEPRF8PeHPsHfOl2nRYrAvXj3SX4H7jiGdECyEni9F/yGqNnZK1KvSmvyGk
 jwS32wP3ZpvPwUKfnzZz7tGUM9GO4WPoPUXFw39Od1Fwm4XKsT0n6JFDvH8MB1kJF6g9
 LIugMElYFEthTqq2TUQISgKOBqd2v+OrIrKdbYtNqLr1XPf4/rLIB6vK6TE8CZ7HvF3+
 batlHxmmfqYS+wbFf5jnj/bK1WBIPnF49U4S5bOy76EpaWsy86W7Wsbyo5wWptcnARht
 qd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761071237; x=1761676037;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cE8uSQwXWgST8uXT/C8GC45uDsa31ftgODHC5Ezx8BU=;
 b=Tl/9NY/Ba72EaJd0EA3BuRight8nbFK4zQgf79tFTU0o5qxfi+hShcci3ROOhABN/6
 ndHMwDp7aM3YtdmLvmtdpWKLi6+eRRhGwHwQI4mz1nLlMAtZfWg/BLYBplI7GGH2/35p
 QGFITUwBYEsalQ10KCGHaCM2m/uL2YArFVNMgoEn8VllLbLA48P4PT1DMQbPMJIfN+GY
 nw50v5PTCktfJlqYjbzC2ZnI1+9kbDRbCd2+/BdcSj2zmmfuKQIvl1sB6veDzEg5IRhT
 ho28FTwHzzOvsMQ5r/V66B15DTsqmILQdRrf4aSKwtZQ/buY/Fi7IWoUFXQHkX9+zzTz
 TxUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqwF8x5x3kHW76WlUw/M3/IBjfTXE0EuWQX5KjG+mG5QchNWtdhPXNVUTNKHEAYlncchcYT22+Qzg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxh/ogH85wZLNaLJLW9vPcWkmT5dfNx/PT72hpirnJvad4tXceC
 JJSq0SlPb3yjeEgVf/i7UUsvgT5XCCRTxOJmTWaCeWszlaOPMtfw40gsjdHAa7VahMyRjV7Om3t
 MIgUxy6hEZoOrGNptrvMCjx8LDvX82Mw=
X-Gm-Gg: ASbGncuBrsfzDtWVXI4ugspRsPYP8gNKfscz/VD5+LiwoAjb1LIFqyxheqGtlfgZq2a
 yioo3cFQvwoyCrxZBNON/SzaYO6mnLStsWg7LBoXl9Blq7xrBYTZmOLMbEdswiLe8u98RVorv0i
 ShTvVDVamuXX7770idHUIffATX25VH0u925pLJQeNSX8dpKNKMIaD57tmWL9vuMLAUYWp4yn9g2
 aRzNMnWjiTtPOwK+kyuYawbZriohoweyikwFF8yW/0D65tAVtu+wfelroTersDWTvhyrf6J
X-Google-Smtp-Source: AGHT+IFk6i+z+s45x3Y/ZNnj0WEKOgAukvQOG+Cb2z0ro+7s902CDutfSXGh6tJcQ/iD0+vijYGT9n6qo6qo7pst6HM=
X-Received: by 2002:a5d:64e4:0:b0:427:45f:ee21 with SMTP id
 ffacd0b85a97d-42704d90029mr13980937f8f.27.1761071236448; Tue, 21 Oct 2025
 11:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 21 Oct 2025 19:26:49 +0100
X-Gm-Features: AS18NWC2o60rc9cSL9khBvVcjIsmZkA_NFsLdA-38mFv9XLbwQriIqJBrdcPrNg
Message-ID: <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
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


On Tue, Oct 21, 2025 at 11:26=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar et al,
>
> On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > This patch series adds DU/DSI clocks and provides support for the
> > MIPI DSI interface on the RZ/V2H(P) SoC.
> >
> > v10->v11:
> > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> >   while iterating over the divider table
> > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
>
> I think this series is ready for merging.
>
\o/

> > Lad Prabhakar (7):
> >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> >   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
> >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
> >     RZ/V2N
> >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
>
> As this touches both clk and drm, let's discuss the merge strategy.
> My proposal:
>   1. I queue patches 1-3 in an immutable branch with a signed tag,
>      to be used as a base for the remaining patches,
>   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
>   3. The DRM people queue patches 5-7 on top of 1.
>
> Does that sound fine for you?
Sounds good to me.

Biju/Tomi, are you OK with the above?

Cheers,
Prabhakar
