Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132D5751388
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 00:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F369310E592;
	Wed, 12 Jul 2023 22:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB01210E592
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 22:29:33 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-993a37b79e2so22544966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20221208.gappssmtp.com; s=20221208; t=1689200971; x=1691792971;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JpnP9i32BXeIsQmJ+YbZCcKNcJ0Q7amCcegwPc3R3ew=;
 b=XyOqwyPOkvn/Rp/GAHWuiG4NzuAebGULbXX1Jyf8wFZ6RSBDw7Y7FsLD28/jsi3YHs
 Os840Rk8JasOVsIp3RIILYZvFvv9qOA4HO1Ku+da76rUZVbw6IDUffSSVIswRgzEtCDA
 vBvJ4fn62iat6n8IIacOjKIJkgenSHz+2FulgEkCcaeD/SexLxemV7ugUUuMvB3dEsBK
 EVrNY1zOtbudXWHVsCCOT7G9o7EWu5DK3UuUKyLdhVPzem60FGHmMEOdI8equCjIbCvn
 Gqp4kDVLKT7Jf7T3zjiI3Yxw5tfid3+9P77WAFjyDWUguww2erD4gaPcB3spEMfFgyBD
 kZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689200971; x=1691792971;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JpnP9i32BXeIsQmJ+YbZCcKNcJ0Q7amCcegwPc3R3ew=;
 b=UcT+g+aNmO9iAvHwZg7J0RGjOuXYWr4P2uu0z/LljFmuz9lVXS/zus52/OwRLugf8X
 2yea40TozjOcD+Ck7zLOzHDmwgAApVjDdDwWge9A7GicUvIsXm5WvhcwP9cHMJf+aVSr
 PA7+7KXc2GJJxz+ZHJaa/a80j4zhxtcsU8sOZb8L1CSgB7tgCkX7/Kay2O8sCvz/RfAb
 FMA5yTttRcmd7WsDlfSTBTaXW/hD4nNhUNbzR2/fW/PvfdoRdyxG3aUg2dB0NwKl2sVz
 9RrC33TJc9N1Gqggb89tBZBjYzNSBYMCDstfMNEaTWsRR8/tX1wacPY48zUCIdKfQfy6
 xPOA==
X-Gm-Message-State: ABy/qLbhbfR90JWVxHfjMix3jz/e678acnkhJpAMD9Zs4y67Zm+gN1E2
 UzmT4lXCgGs4YPwXtEWXgTOpMqvitekJk4hVvM2pyw==
X-Google-Smtp-Source: APBJJlGn3IZ7nui6Gzyqafoji7m5G1289VZtbpkIj0JCx5P4lbC2/TkcLwb4Tjj+M18S1x2TgUQECVE0VM7X8dGEuUs=
X-Received: by 2002:a17:907:c9aa:b0:992:3ac7:a2da with SMTP id
 uj42-20020a170907c9aa00b009923ac7a2damr22158040ejc.30.1689200971364; Wed, 12
 Jul 2023 15:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU2Nb58wOdm9yROzSceSJgwR0pqfVFDiJWGUG6YN87ZdaQ@mail.gmail.com>
 <3fc5b418-8ec3-7899-9878-05e9cbf883e8@denx.de>
In-Reply-To: <3fc5b418-8ec3-7899-9878-05e9cbf883e8@denx.de>
From: Tim Harvey <tharvey@gateworks.com>
Date: Wed, 12 Jul 2023 15:29:19 -0700
Message-ID: <CAJ+vNU2emW0KJvrFckeSWpu54y=qdh6tBgBS1CUW4Tqb3jPRZA@mail.gmail.com>
Subject: Re: 6.5-rc1 breakage in samsung-dsim
To: Marek Vasut <marex@denx.de>, Schrempf Frieder <frieder.schrempf@kontron.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
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
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Adam Ford <aford173@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 2:43=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:
>
> On 7/12/23 20:52, Tim Harvey wrote:
> > Greetings,
>
> Tim,
>
> > I've noticed a regression in 6.5-rc1 that I'm having trouble bisecting
> > between 6.4 with regards to imx8mm MIPI DSI.
> >
> > I'm testing on an imx8mm-venice-gw72xx-0x with the following display:
> >   - Powertip PH800480T013-IDF02 compatible panel
> >   - Toshiba TC358762 compatible DSI to DBI bridge
> >   - ATTINY based regulator used for backlight controller and panel enab=
le
>
> You mean RPi 7" display wired to non-RPi hardware like many people do ? ;=
-)

yup.... good source of readily available cheap expansion hardware :)

>
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
> Try and do something like ...
>
> git revert --no-edit v6.4..v6.5-rc1 -- drivers/gpu/drm/bridge/tc358762.c
> drivers/gpu/drm/bridge/samsung-dsim.c drivers/regulator/*attiny*.c

$ git revert --no-edit v6.4...v6.5-rc1 --
drivers/gpu/drm/bridge/tc358762.c
drivers/gpu/drm/bridge/samsung-dsim.c drivers/regulator/*attiny*.c
fatal: bad revision 'drivers/gpu/drm/bridge/tc358762.c'

your filenames look correct to me however:
$ ls drivers/gpu/drm/bridge/tc358762.c
drivers/gpu/drm/bridge/samsung-dsim.c drivers/regulator/*attiny*.c
drivers/gpu/drm/bridge/samsung-dsim.c
drivers/gpu/drm/bridge/tc358762.c
drivers/regulator/rpi-panel-attiny-regulator.c

is that intended to revert all patches between v6.4 and v6.5-rc1 in
files matching that file pattern? That would be very useful indeed if
I can figure out the syntax!

I did by hand revert the patches to samsung-dsim by hand and found the
breakage to occur with commit 0c14d3130654 ("drm: bridge:
samsung-dsim: Fix i.MX8M enable flow to meet spec"). Reverting that
works for me.

I'll respond to that thread directly but I would love to know how to
revert a patches to a series of files like you suggested if you know
what's wrong with the syntax.

thanks,

Tim



>
> (I might have the filenames wrong)
>
> Does that start working afterward ?
>
> If so, you can reverse-bisect on the reverts.
>
> I wouldn't be surprised if this was somehow related to the non-burst
> mode delay calculation again, sigh.
>
> [...]
