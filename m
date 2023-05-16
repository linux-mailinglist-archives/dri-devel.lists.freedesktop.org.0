Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 828A0705A89
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 00:22:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498C410E378;
	Tue, 16 May 2023 22:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488CD10E378
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 22:22:54 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-51f405ab061so1468088a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 15:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684275773; x=1686867773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dgndSkZWPUZJRd5SeDV+wesFmdRbBGGTSW23rdoFQhk=;
 b=bJ9hO2NlZEa91lmCBa3cYU8I14iS+hJWAybKXcc7FB03ddDm4YR8cS/rc6QvI0dFgC
 FqebizI4rr55xrt5xaDss3aSzeIIjKJmpoAwW/Pgf2iXF4H1oJ2aoNScfMLNlSi7nOox
 CxeB8TUHSPRIf/FPwiDScm7LvUnl/uVClFNLHLB8KkKKArRAMkwf9kKmXViSzmIzvT4F
 mDd2izzOK7GNQrMDHF8BahFMmsma/ebBFIssqypHaJQKO+Soy9zwv+/H31WTS+e9ugu8
 dT+5AGLq1hMmffSfvDXlEVZ49QADAte8VVqvXSPSi950I+r1hoh659pHQfjXyWVFzNWZ
 fNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684275773; x=1686867773;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dgndSkZWPUZJRd5SeDV+wesFmdRbBGGTSW23rdoFQhk=;
 b=QWmQvfVF1RaR1VyHlSA/iHKL0pdqE50w3JlJLrb2j1gl+Vf16B2WgjsttsLO/CR+0M
 uVzVyu7xUttz+BMj7/uuZTBkB5S3N1i2maLGZmOZx3H2baKmOSj82zgh4F/YUj+AEyR8
 CZgMwIy3MwXhydPBmJSmhARdTBh/Hsvk2Rap3tbe/M8wXB3yf6diVGYXrgRCfEwlWGb3
 QsdPhkGpF6cldif7SkKtxOhYTz4Vxf8Kke5RyvwrIHf8qLYkRQyBgbE9OUkCBreL5Uba
 L5vK+btkfbi/iZDO7NPpN6YdFPnr/GnnshyzVoBOW8SfiVawt86hxajXS8+iI+53L5TZ
 gHtg==
X-Gm-Message-State: AC+VfDx5Wk60753aLGJ3b1Z5P2hitYXMVJiXPW78uMUHEqa58Xw9Opl9
 pMTtd1T45gUbTFPR5ByzjGI59HLb8StDITssgXE=
X-Google-Smtp-Source: ACHHUZ5v3JODxPaa7E9Q8oh+wX3LOQN8E+VuPC6vcFXbf7bbRYgANWsaCx57oSVFDguecOp2V8QpEwUSjuwgaLWtlco=
X-Received: by 2002:a05:6a00:2489:b0:64a:ed6d:53ac with SMTP id
 c9-20020a056a00248900b0064aed6d53acmr683963pfv.2.1684275773179; Tue, 16 May
 2023 15:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230503163313.2640898-1-frieder@fris.de>
 <20230503163313.2640898-3-frieder@fris.de>
 <2225400.iZASKD2KPV@steina-w>
In-Reply-To: <2225400.iZASKD2KPV@steina-w>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 May 2023 19:22:41 -0300
Message-ID: <CAOMZO5AiWM64tZgArUL89q5spuLD91R-pnURbfqPU9O0w54sQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: ti-sn65dsi83: Fix enable/disable flow
 to meet spec
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
 Robert Foss <rfoss@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, Sam Ravnborg <sam@ravnborg.org>,
 Frieder Schrempf <frieder@fris.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 4, 2023 at 6:12=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Mittwoch, 3. Mai 2023, 18:33:07 CEST schrieb Frieder Schrempf:
> > From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >
> > The datasheet describes the following initialization flow including
> > minimum delay times between each step:
> >
> > 1. DSI data lanes need to be in LP-11 and the clock lane in HS mode
> > 2. toggle EN signal
> > 3. initialize registers
> > 4. enable PLL
> > 5. soft reset
> > 6. enable DSI stream
> > 7. check error status register
> >
> > To meet this requirement we need to make sure the host bridge's
> > pre_enable() is called first by using the pre_enable_prev_first
> > flag.
> >
> > Furthermore we need to split enable() into pre_enable() which covers
> > steps 2-5 from above and enable() which covers step 7 and is called
> > after the host bridge's enable().
> >
> > Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> #TQMa8MxML/M=
Ba8Mx

Should this have a Fixes tag so that it could be backported to stable kerne=
ls?
