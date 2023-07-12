Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD9751121
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 21:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C9810E5CD;
	Wed, 12 Jul 2023 19:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4765C10E5CD
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 19:24:22 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-cae693192d1so136186276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1689189861; x=1691781861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vzEAwC9syN8fFX9a1JfdVvYlRZJDamLyw5HuxJ6nTMU=;
 b=BPUe+U5zIYQ+u+mXdjEKspCFo0T0vbiL9X9zizwUslTXGiQe37RSjJl6hn7QI72sbt
 RT3p5Nemctsqp8OlMLTupzhD0LdthGzXL66eR79INOPre26f/iRHpaUOEb9FA0Fhxret
 TQtPNWYfzXbDITeza93S8TCTAhxSt82iEZYhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689189861; x=1691781861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vzEAwC9syN8fFX9a1JfdVvYlRZJDamLyw5HuxJ6nTMU=;
 b=SufOmvGcWPv31Xc6N4OqQjX6uZwy/jL9IeRo0sz1VBtKWDh4XTI+dyB0HG3zo82WZh
 uPL/CQGy1IJ+ub1kM0+8k/IPk2SPkL3o7zZ54aaNvW4TKwq78AxXcuNzJmRURFSXtX0q
 VZThsHr+0q+PzyBdU+u/Vr5O02ayQ3wR67Aa2IBch0hMWgRW/zGh/zlvmWSAdrTp0j0Z
 hS3fy+x1oDC5XWynRhKASZpENV49d/sA1P+KmD58DoIBtNJA4W9KHHM9sM6IzdBCFt8B
 /gqwd/edzpr58FeQ5yMVmyv1wpOJZvLxxF9JLtuLUuYXSwBfbZEkqQFYCe/QZqGg2YY/
 bXdw==
X-Gm-Message-State: ABy/qLZ/Q2Z6TQeWf2qoVfgUFrMiQsclm+5t6Mar9TEOLHgRi4hiQMg0
 /HbkFST07zuB3HjhdKLVPcikTq5ifyTNFTOd6IkXHw==
X-Google-Smtp-Source: APBJJlEb6pZ2wBXIvJM5JvufTwOVdM7M4Xo/PN3IlFufqBUYzc/SA2/QgAsfaNmRSOA7rXtrxb6nMfg5r6FC0EiCo0A=
X-Received: by 2002:a25:7a05:0:b0:bd0:8e5:d548 with SMTP id
 v5-20020a257a05000000b00bd008e5d548mr17084710ybc.39.1689189860943; Wed, 12
 Jul 2023 12:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ+vNU2Nb58wOdm9yROzSceSJgwR0pqfVFDiJWGUG6YN87ZdaQ@mail.gmail.com>
In-Reply-To: <CAJ+vNU2Nb58wOdm9yROzSceSJgwR0pqfVFDiJWGUG6YN87ZdaQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 13 Jul 2023 00:54:08 +0530
Message-ID: <CAMty3ZBxjs5o=j1ZonSwURbX+uBTOTpop__4XMAqNKmF+11AyA@mail.gmail.com>
Subject: Re: 6.5-rc1 breakage in samsung-dsim
To: Tim Harvey <tharvey@gateworks.com>
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

On Thu, Jul 13, 2023 at 12:22=E2=80=AFAM Tim Harvey <tharvey@gateworks.com>=
 wrote:
>
> Greetings,
>
> I've noticed a regression in 6.5-rc1 that I'm having trouble bisecting
> between 6.4 with regards to imx8mm MIPI DSI.
>
> I'm testing on an imx8mm-venice-gw72xx-0x with the following display:
>  - Powertip PH800480T013-IDF02 compatible panel
>  - Toshiba TC358762 compatible DSI to DBI bridge
>  - ATTINY based regulator used for backlight controller and panel enable
>
> I'm using a dt overlay to support this [1] which works on 6.4 but on
> 6.5-rc1 I get the following error:
> [    6.110585] samsung-dsim 32e60000.dsi: xfer timed out: 29 06 00 00
> 64 01 05 00 00 00
> [    6.326588] tc358762 32e60000.dsi.0: error initializing bridge (-110)
>
> I'm trying to bisect this for some reason. Does anyone have any idea
> what may be causing this or how I can debug it?

What if you can revert or drop the dynamic PHY configuration (HEAD ...
a617b33f7e51)? can you check it?

Thanks,
Jagan.
