Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D25B708D5F
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 03:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE9B10E597;
	Fri, 19 May 2023 01:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F9C10E597
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 01:34:41 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1ae6b4c5a53so9114175ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 18:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684460081; x=1687052081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xZyv/RHhPnwhEL5/tgJQl4m2REstOca6ErGOq+J0bjg=;
 b=S8yhgsGlLfZxL2GzdgyguvrUlpNV70jyzHbadQN/2yC/JWZRh+vKxjtBoRM314MCvQ
 R8NZV8ghce05Lh9AyVkq2moVPjmOEQjGr3/fvaUNxVZyHozR9EJIx9PcQG2XlcWWpPzx
 YNRNGEljXkKlY6evW4kwQ17MpUgZJMHozpbVwe0DzURzzX2oneOx5bMIwaVwhxcOqNWR
 4YvvcpoRVH3ZYrty82H5auFdrBGc50qTPUr7uGAbcKKzuTos19Ctrt87BPT7c8WZnEsq
 rnspd8ssi0dSVSlQdHEhbT+bUXxx2dDcVy4OeJwdFY7vrOJkJ5KwNA2Rsa3s8HQiQpg3
 8Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684460081; x=1687052081;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xZyv/RHhPnwhEL5/tgJQl4m2REstOca6ErGOq+J0bjg=;
 b=Td0yKs+rW2Sc8DanR4wwFkgJBwR2Q8Mp+0x3cUlgDJgqmZyQB5gjZg8LpzCvu2I0HH
 p3ibjfIFf+kAW4vV2NfNrz20ik305Obz4VTSR4IiEi2c1Gx5QFiOFGRdePvsoYpqauES
 GXTyDVtchmfn3fC0+Hx5X0xXmdX8Xt322wVla+jO7Ywe63AMmVjWFp1asi8fjZdUBJX8
 AyZilRJ4D48bLWOS8YQtvcVlMrXmdlUhKZs7NpIeNFer+UtBIVa80bcRdvs3Ejpw8oWQ
 mOh3C/iPYpcGUjoz9VvEUdlqGY16NI7ZdwnNoI7a14ftCBcJ8dpuirzsUFa08JRECs/a
 geTQ==
X-Gm-Message-State: AC+VfDzG1eFmQ3Maekw3MEWSgrmv5zcC4GcNmThb+GkzNaxzby7/T0xO
 xdq02hXWO9yk5rTxMB7CaAq0Ie3FWK2EaHPv5lI=
X-Google-Smtp-Source: ACHHUZ7Ovat76LORv3wtlN7xEUBrfFZHgLJHY1NOVClnDzGn8v0MxINbwkx3ylraLPAFdKdbQY8vgo7y0WHFhvOWEW4=
X-Received: by 2002:a17:902:7448:b0:1a6:dd9a:62c5 with SMTP id
 e8-20020a170902744800b001a6dd9a62c5mr1100511plt.10.1684460080477; Thu, 18 May
 2023 18:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230518230626.404068-1-aford173@gmail.com>
 <CAOMZO5DBefFuLWi39txu2RiU5vdHVx-0T48Fua6M5Y6Fr9PGNg@mail.gmail.com>
In-Reply-To: <CAOMZO5DBefFuLWi39txu2RiU5vdHVx-0T48Fua6M5Y6Fr9PGNg@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 18 May 2023 20:34:29 -0500
Message-ID: <CAHCN7xLqmMPtnHTVbApyYxY2tx97oRjsk_51abdDcZkOJmA=Tw@mail.gmail.com>
Subject: Re: [PATCH V7 0/6] drm: bridge: samsung-dsim: Support variable
 clocking
To: Fabio Estevam <festevam@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 18, 2023 at 7:29=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Adam,
>
> On Thu, May 18, 2023 at 8:06=E2=80=AFPM Adam Ford <aford173@gmail.com> wr=
ote:
> >
> > This series fixes the blanking pack size and the PMS calculation.  It t=
hen
> > adds support to allows the DSIM to dynamically DPHY clocks, and support
> > non-burst mode while allowing the removal of the hard-coded clock value=
s
> > for the PLL for imx8m mini/nano/plus, and it allows the removal of the
> > burst-clock device tree entry when burst-mode isn't supported by connec=
ted
> > devices like an HDMI brige.  In that event, the HS clock is set to the
> > value requested by the bridge chip.
> >
> > This has been tested on both an i.MX8M Nano and i.MX8M Plus, and should
> > work on i.MX8M Mini as well. Marek Szyprowski has tested it on various
> > Exynos boards.
> >
> > Adam Ford (5):
> >   drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
> >   drm: bridge: samsung-dsim: Fetch pll-clock-frequency automatically
> >   drm: bridge: samsung-dsim: Select GENERIC_PHY_MIPI_DPHY
> >   drm: bridge: samsung-dsim: Dynamically configure DPHY timing
> >   drm: bridge: samsung-dsim: Support non-burst mode
> >
> > Lucas Stach (1):
> >   drm: bridge: samsung-dsim: fix blanking packet size calculation
> >
> >  drivers/gpu/drm/bridge/Kconfig        |   1 +
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 142 +++++++++++++++++++++-----
> >  include/drm/bridge/samsung-dsim.h     |   4 +
> >  3 files changed, 124 insertions(+), 23 deletions(-)
> >
> > V7:  Move messages indicating the optional device tree items are going
> >      to be automatically read elsewhere was move to dev_dbg instead of
> >      dev_info.  Cleaned up some of the comments to be a bit more clear.
> >      Eliminated a double variable assignement accidentally introduced
> >      in V6 when some of the items were moved from patch 6 to patch 5.
>
> It seems you missed addressing one previous comment from Lucas:
>
> "Same as with the earlier patch, this needs to be documented in the DT
> binding by moving "samsung,burst-clock-frequency" to be a optional
> property."

Aargh!
I can't believe I did that.

Inki,

Can I do a single patch to which references this one and have you
apply them together when the time is right, or do you want me to
resend the whole series with an additional patch at the end making the
two device tree items optional?
I totally forgot, and I'm sorry.

adam

A
