Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CCD7262B7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 16:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A6C10E1FF;
	Wed,  7 Jun 2023 14:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1EE10E057
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 14:23:35 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-259b2afc6f1so568233a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686147814; x=1688739814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y+BeJtXlFkE5viMltERILFoZ9Megcec+/xxDBDj3GRM=;
 b=W6z8pzg7LSGWEXwzWSqRpb4CxOsYMn4m8Q6Nqb8zdMLZF7NKrNulpOePLfiDN06e78
 PEyXdfRzlGYSxqlnkCu3G5BY05NDwo6fPjMxRgCGzl+kEOG79oURFQ53OzH+qInRT83Q
 X9o0sCJlXS/xeSZQgS7GQ99XfOmDuyudppnUQcERA8N12FR0IpTDpnrGfmxESeMDrqk/
 DVH4ml7WcaHTCsho3qBaOlQkWdbtkkn39yPK0AjUVJs9yhNkXFhJii+JmsbBxx66A7aH
 DulGUsJTO7203Q6z8VT/4QKQBZTPvZVy6oPijdUWdvaS4kgj1ivU7RbN/aCjDazVnkYT
 LHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686147814; x=1688739814;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y+BeJtXlFkE5viMltERILFoZ9Megcec+/xxDBDj3GRM=;
 b=H9pjS8xRTsfo6xZ121vOqI/8Vm/Obi1PgYQTOq86jJnKUeimQiFumAC0golw1zb3ir
 SO1ceHLkr1i5z6vFF4DnJg9sQTe5jBmjscCPu7LqwfcKdLll/iH49haLNhRMhMCYU11W
 YdtqQ6xFvgS0us4HyVsf5qLusr3dxqhqigIToK5fuF5bpScRc+92yWn+KuIiz2ZWm58s
 c3qYYY1vnZmHpaYgaO8O37ri1jElL9nr7/2ayq2auUNeT0ftc+L5GU7wzNxfiwXtDXIz
 lDtXSaT9L4nSje1kvyO/DV0R8CHATw2sEPknx0qLh9U+5w0uOBpU50nq4bz+j+ru2FxK
 hZDg==
X-Gm-Message-State: AC+VfDwqTTv7y3NkPF7LlQf8zDepAFpGczCyuANK61Y4M+8+FSafwdjo
 AHnu8h1Bi0hP7ws/CpVtNTQy8KaSILtoLefGEz0=
X-Google-Smtp-Source: ACHHUZ6+skY3wkNyiJ013XOEI50o3sMjpeIah6hLKtT6JZM3nsMfRM1HaOTj9dKeJGivUR68JYHuRgZ0dktuw9EcRfE=
X-Received: by 2002:a17:90b:1d0e:b0:256:807e:6bd with SMTP id
 on14-20020a17090b1d0e00b00256807e06bdmr2173657pjb.28.1686147814053; Wed, 07
 Jun 2023 07:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230526030559.326566-1-aford173@gmail.com>
 <e1379d94-66a5-8538-abdf-de7770befb7d@prevas.dk>
 <CAHCN7xK9RaLRSK_jSbbuGBUf14-FOHsrawi2J8G29iHSOj2Nyw@mail.gmail.com>
In-Reply-To: <CAHCN7xK9RaLRSK_jSbbuGBUf14-FOHsrawi2J8G29iHSOj2Nyw@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 7 Jun 2023 09:23:22 -0500
Message-ID: <CAHCN7xJ65gv-n5VHYf3MeEBYDBHy07HMDL3LmYAwfYLPySrFnw@mail.gmail.com>
Subject: Re: [PATCH V8 0/7] drm: bridge: samsung-dsim: Support variable
 clocking
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 7, 2023 at 8:27=E2=80=AFAM Adam Ford <aford173@gmail.com> wrote=
:
>
> On Wed, Jun 7, 2023 at 8:15=E2=80=AFAM Rasmus Villemoes
> <rasmus.villemoes@prevas.dk> wrote:
> >
> > On 26/05/2023 05.05, Adam Ford wrote:
> > > This series fixes the blanking pack size and the PMS calculation.  It=
 then
> > > adds support to allows the DSIM to dynamically DPHY clocks, and suppo=
rt
> > > non-burst mode while allowing the removal of the hard-coded clock val=
ues
> > > for the PLL for imx8m mini/nano/plus, and it allows the removal of th=
e
> > > burst-clock device tree entry when burst-mode isn't supported by conn=
ected
> > > devices like an HDMI brige.  In that event, the HS clock is set to th=
e
> > > value requested by the bridge chip.
> > >
> > > This has been tested on both an i.MX8M Nano and i.MX8M Plus, and shou=
ld
> > > work on i.MX8M Mini as well. Marek Szyprowski has tested it on variou=
s
> > > Exynos boards.
> >
> > Hi all
> >
> > We're testing this on top of v6.4-rc4 on our imx8mp board, which has a
> > ti-sn65dsi86 DSI -> DisplayPort bridge. We do get an image at
> > 1920x1200, but the monitor says it's only at 58Hz, and measuring on the
> > DSI signals does seem to confirm that the update frequency is about 57.=
7
> > or 57.8Hz (it's pretty hard to get a good measurement). It looks like
> > it's the lines that are too long, by a time that corresponds to about 8=
0
> > pixels. But all the frontporch/backporch/hsync values look sane and
> > completely standard for that resolution.
> >
> > Setting samsung,burst-clock-frequency explicitly to something large
> > enough or letting it be derived from the 154MHz pixel clock makes no
> > difference.
> >
> > Any ideas?
>
> What refresh rate are you trying to achieve?  It seems like 57.7 or
> 57.8 is really close to the 58 the Monitor states.  I would expect the
> refresh to be driven by whatever the monitor states it can handle.
>
> Have you tried using modetest to see what refresh rates are available?
>  When I was doing this driver work, I would use modetest to determine
> the connector ID, then use modetest -s
> <connector-id>:<resolution>-<refresh> to display various resolutions
> and refresh rates.
>
> The 8MP shares the video-pll clock with both disp1 and disp2 clocks,
> and the imx-lcdif driver, which sends the display signals to the DSI,
> uses the disp clock, so the video-pll needs to be an exact multiple of
> the pixel clock or the output won't sink.  Modetest should also show
> you the desired pixel clock for a given resolution and refresh.
> My displays didn't show 19200x1200 as an option, so I wasn't able to
> test that configuration.

Another thing you could try would be this rounding patch that I'm
experimenting with [1].

From what I can see, some resolutions end up with math that end up
rounding down, and this patch corrects the timings a bit to attempt to
compensate.  I haven't tested this extensively yet, but you can try it
to see if it helps.

adam
[1] - https://github.com/aford173/linux/commit/183cf6d154afeb9b0300500b09d7=
b8ec53047a12


>
> adam
> >
> > Thanks,
> > Rasmus
> >
