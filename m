Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D34AA5D7E
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 13:03:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFEA10E34C;
	Thu,  1 May 2025 11:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RMmrFwc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AA510E34C
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 11:03:00 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-39c13fa05ebso467163f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 04:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746097379; x=1746702179; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YP/T0CkwpXUb5RR9D9I+LqSzO3DWW8dnrD0XkmmOOUw=;
 b=RMmrFwc4zIRtsJQ8c0f9Nimhny2dUyXkGJ5c81SmQXPZVKMC4ZBwJrPYuTCWISnYMq
 0QcfUB5TcoeodixaS0o/E5ywLwn6YA5YIWRpGhfE4ajH1FDPg3gJRkzr2Ly8j8josqoY
 mnLQSZCRxEcXs0v8RYW5eSOFYLpU39r5fskD5QcWVaP8dZ31VOn/LNozvzWJtJdISSQP
 /h9YuL2jL6NgSw0NHk6MIko62ps3RcemHioBdnuxpAiSDEyyV5INoiAiiFsgGIKak/No
 4uO6LidKNJLIixkMqCCdYq5feHMlTlmgRe8HhDrm2kM3wkAJfMjm+lFnkAkzk1a5zdXf
 1/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746097379; x=1746702179;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YP/T0CkwpXUb5RR9D9I+LqSzO3DWW8dnrD0XkmmOOUw=;
 b=UczJ7fULapvb1Sy+rnKpu+0CAI5Lm7SsCXPjtRgOQzvvw8zGsZAXY+Rt0aESHokkwI
 HEguHut2wC/YUxkNJ5q9xLWHqitFqLhG4CFJWkmdREAukddVLhuFRKNfCUPK/T8PmV/r
 4fmT5RmXVt7DDfC2ZuorSeMD990T53gRlwlvtGAPuROBQQx6yQSVmln28PfVvwUNcIe1
 h+MCw/zKCyfH72EupYo6IkYdp0XPH9xErdZf5Kp2eWvnGU9p47RJ754zRsA3scMGi5fr
 0F9YpjonnjSCULSKcBq9Rq9Hd+XjUXfUksSShJG8rtU6cFY6dmQiUHEKzpeLOs+eI0HX
 5r7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbnvnzX+aDUfuZeimDoz2IMz1rstsGxkROwMO/X8l7VUvJeFoIlXuE0UTKxYuuftWD0E13WfEM9ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBDJFgVJsMm9lDsbI+O70BQYJanliKCIKG28ihtcaxLBIZfHp1
 5BcyE4WtAhfIUSO2Tc+Bnqx4BkXDsmV+F8XxnxggJkgM2hxojQcI6WMKdTeALN0O/BcGfjZ+U1/
 tzpwE02mlpzU1r9MbzqANFDLx2hU=
X-Gm-Gg: ASbGnctqp3JCjRKqfFHWesXcxX1/xGBU3N/2OY8JS2+hxZgwQgNe6/HIQJ1eXXzMEUx
 ND6HL8LtC+dkqOUGAEpF2BKUxbzu9ue0XJiYHea09RRFXAZDkl+zN3+FsKd9JW39vwVlc1f5gJV
 WLlsPCKjwdSWT6Aolv0zhwiUY=
X-Google-Smtp-Source: AGHT+IHnsasC5a6owegYHHHKpqCakBnDLStztj0M0y2Ms6YAEP6lxMvKXVUQRyad58NLJTnwpxgsVeGJi0Dx1JRW5Hc=
X-Received: by 2002:a05:6000:1aca:b0:391:40bd:6222 with SMTP id
 ffacd0b85a97d-3a08ff38a6amr4797433f8f.22.1746097379004; Thu, 01 May 2025
 04:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <f9a7c9fd-bd49-4cf0-9a86-a8e65b4fb6a5@oracle.com>
 <TYCPR01MB1209317F533E528616A4C2492C2822@TYCPR01MB12093.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB1209317F533E528616A4C2492C2822@TYCPR01MB12093.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 May 2025 12:02:33 +0100
X-Gm-Features: ATxdqUFLehOqNU3alydkWylhiFwZjkdBEHDlkzJ7NpWrnUfS-t8P_W39zRE4coM
Message-ID: <CA+V-a8vsKhi8Z7zi749CErCF4cR6s4r0WcUumwFY1ZPg3uAO4g@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] clk: renesas: rzv2h-cpg: Add support for DSI
 clocks
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 ALOK TIWARI <alok.a.tiwari@oracle.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Hi Fabrizio,

On Thu, May 1, 2025 at 11:38=E2=80=AFAM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> Hi Alok,
>
> Thanks for your email.
>
> > From: ALOK TIWARI <alok.a.tiwari@oracle.com>
> > Sent: 01 May 2025 10:51
> > Subject: Re: [PATCH v4 01/15] clk: renesas: rzv2h-cpg: Add support for =
DSI clocks
> >
> >
> > On 01-05-2025 02:10, Prabhakar wrote:
> > > From: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add support for PLLDSI and PLLDSI divider clocks.
> > >
> > > Introduce the `renesas-rzv2h-dsi.h` header to centralize and share
> > > PLLDSI-related data structures, limits, and algorithms between the RZ=
/V2H
> > > CPG and DSI drivers.
> > >
> > > The DSI PLL is functionally similar to the CPG's PLLDSI, but has slig=
htly
> > > different parameter limits and omits the programmable divider present=
 in
> > > CPG. To ensure precise frequency calculations-especially for milliHz-=
level
> > > accuracy needed by the DSI driver-the shared algorithm allows both dr=
ivers
> > > to compute PLL parameters consistently using the same logic and input
> > > clock.
> > >
> > > Co-developed-by: Fabrizio Castro<fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Fabrizio Castro<fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> >
> > Acked-by: Alok Tiwari <alok.a.tiwari@oracle.com>
>
> I am not sure it makes sense for you to Ack this patch?
> Please have a look at the process here:
> https://www.kernel.org/doc/Documentation/process/submitting-patches.rst
>
> Perhaps you meant to add your Reviewed-by tag instead?
>
I'm not sure a Reviewed-by tag would be appropriate either, as it
implies the reviewer has performed a thorough technical review of the
patch.

Cheers,
Prabhakar
