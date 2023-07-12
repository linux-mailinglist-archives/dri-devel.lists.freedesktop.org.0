Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B648C75120F
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 22:59:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B084910E04E;
	Wed, 12 Jul 2023 20:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1736310E04E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 20:59:29 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b702319893so120699911fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 13:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1689195566; x=1691787566;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+AEsbGdfN3MuNx68WB4g17a5UEFOfCJDLcaCrckPk3A=;
 b=gptzumbq2Rm5Ne5irBMvPZl3sy8+xJR+isSXENmvTHETSp2X4eEsescMJxSNlKHpKo
 EX7vaS5I7Y7iYCZJiA9iXLYjqsstXDZknBLIfXhNpSLkVu1q094Nvq6GEZ+HFXw/elE5
 r8klIriIQ0YGyL3Aa9HahV7V7OJuK0Nj3eDElAhqqeHYMGtdeEbQc+SfL9g2KHQs15p4
 thBWDfkIkaPp9e9bxhlN30yjM7NirSC4opdSAMvMIRdWUIjUbgFKHIsryGKsTLznwEYr
 dK1UCFojACxT63QIwRVPwZpJb2iwxjidFtjlIV+mjkqBPFllTSut0Kbog/dU9ep2tqiD
 T7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689195566; x=1691787566;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+AEsbGdfN3MuNx68WB4g17a5UEFOfCJDLcaCrckPk3A=;
 b=AP2EtP8/3ocq0tVaTTbzjKTJw9H0zKOEO82JxR8Ha8UyCcMoXpx3eknmZiQ9AkknGD
 JbIOXZNr1AFlXRR/2veN9+1btYOrZRwsAgJ8xR1ZlaUAPl/YN57HLVKGhBWy0p5+WHfD
 BnE0r4Ny5wmiWW6/8dVAmoJ5BejtF/ok7+qYNNHTu8bl4A5ITisbNthJb02r0yYRQwgl
 6uFLUGCsSqW1YWMWG7BS4EFG6u4XThKisCBEMG9BoKE0H/lEiNfVMMvidiFuxaD7j10v
 uLNiElfmghF+lUfTtOXl3j8ecHWg0qquMB0vKWaFkIMwX2s07uKBzpnPWkZFtjMqc4Yt
 2Wcw==
X-Gm-Message-State: ABy/qLZahK6HaXDzj2rrqDCPc8DApwfvhs0kQpxp9Aav0l6uKnDh0bQw
 UM4O23Ql6j8kqZQscv/chGYMtgpcAjQib7eYFi9Dpw==
X-Google-Smtp-Source: APBJJlEgTGIDuCr9SbZSA5dmQsGKCCMezfj4mnTcMYDNlikLS+zUQwxYk/0qFQf/zmTqnSHxw6ZU3c0T5gSq+mqSEis=
X-Received: by 2002:a2e:8e8f:0:b0:2b6:cb55:72cb with SMTP id
 z15-20020a2e8e8f000000b002b6cb5572cbmr17494380ljk.39.1689195566624; Wed, 12
 Jul 2023 13:59:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU2Nb58wOdm9yROzSceSJgwR0pqfVFDiJWGUG6YN87ZdaQ@mail.gmail.com>
 <CAMty3ZBxjs5o=j1ZonSwURbX+uBTOTpop__4XMAqNKmF+11AyA@mail.gmail.com>
In-Reply-To: <CAMty3ZBxjs5o=j1ZonSwURbX+uBTOTpop__4XMAqNKmF+11AyA@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 12 Jul 2023 13:59:14 -0700
Message-ID: <CAJ+vNU1tQnKFYMiKJ=+RacFSjE2r_kR2G11CJSNdWKMFH7Hd3g@mail.gmail.com>
Subject: Re: 6.5-rc1 breakage in samsung-dsim
To: Jagan Teki <jagan@amarulasolutions.com>
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
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 12:24=E2=80=AFPM Jagan Teki <jagan@amarulasolutions=
.com> wrote:
>
> On Thu, Jul 13, 2023 at 12:22=E2=80=AFAM Tim Harvey <tharvey@gateworks.co=
m> wrote:
> >
> > Greetings,
> >
> > I've noticed a regression in 6.5-rc1 that I'm having trouble bisecting
> > between 6.4 with regards to imx8mm MIPI DSI.
> >
> > I'm testing on an imx8mm-venice-gw72xx-0x with the following display:
> >  - Powertip PH800480T013-IDF02 compatible panel
> >  - Toshiba TC358762 compatible DSI to DBI bridge
> >  - ATTINY based regulator used for backlight controller and panel enabl=
e
> >
> > I'm using a dt overlay to support this [1] which works on 6.4 but on
> > 6.5-rc1 I get the following error:
> > [    6.110585] samsung-dsim 32e60000.dsi: xfer timed out: 29 06 00 00
> > 64 01 05 00 00 00
> > [    6.326588] tc358762 32e60000.dsi.0: error initializing bridge (-110=
)
> >
> > I'm trying to bisect this for some reason. Does anyone have any idea
> > what may be causing this or how I can debug it?
>
> What if you can revert or drop the dynamic PHY configuration (HEAD ...
> a617b33f7e51)? can you check it?
>
> Thanks,
> Jagan.

Hi Jagan,

That's one of the first things I tried but it didn't revert cleanly so
I simply did a git checkout of 1a56fcf08ae4 (the patch before
a617b33f7e51) as that was the before the 6 samsung-dsim patches I
suspected. This version also failed but then I did a git log and
noticed only 90 patches before the Linux 6.4-rc1 tag. This of course
predates Linux 6.4 yet a617b33f7e51 was not in 6.4 which is why I got
confused when a git bisect between v6.4 and v6.5-rc1 started bisecting
to patches that pre-dated v6.4. I'm so confused at this point :)

best regards,

Tim
