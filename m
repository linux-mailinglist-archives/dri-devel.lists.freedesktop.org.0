Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1443A6255BB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 09:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE22810E796;
	Fri, 11 Nov 2022 08:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BAE10E796
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 08:49:29 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id e189so3170837iof.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 00:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OAOfqtD4t6Iov+GKWdcNGYt7OOruw1aiI2cat97jgC0=;
 b=eHChzSN+uZraxaSKRS3P3eFNuY3EI5c62iZlJDfxGvRDWddsYiHHSECeludFjDBy2G
 oFXIUrVPqybBj9FMmi2GBA3IMf/yUlhm+dqsaD35+jVF9qcSINApUSUaMzyQ/OVI5VGl
 7gL4niZpcCljSQauFKduPWefdL11fw1MxLh+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OAOfqtD4t6Iov+GKWdcNGYt7OOruw1aiI2cat97jgC0=;
 b=FUmBTr9odIs7MgqT5EZmA4hgMrthbCJDNHQq/n7V6EmZ8HTjXEqSWBVIYsz5jvyyNL
 dwbKBee2R1HvR5XeaFPUZ13EQPmHCg2lwL7axqGsrLHt3DOJn/c+r7FsWw8QumJW7TRP
 xvzcSttGbt7lT+BreMjyIQkjTXhtSInqIHrC37UjuDcdrq0oS+DnsI/ei7naWGP/6A2a
 UVjGycv8sLLhPG1qLeGSyFvWuxiH5Yq/heaoy+w5P5xBVGBtE/BUCjoxmiKkSUomyjKc
 +i0Ue3Km/FCSQc7QcTZegY1RyWjnLJcHwjYdyGXfG9K+iIB56Kxovg2x4ug7XSE3UYjH
 4ovw==
X-Gm-Message-State: ANoB5pn8YZrbmBb29IuxKMmGWqAMOD1bkm3jksLIJQ5oF2TJGwx4evF0
 K+rTpRe6Z2bbVEKdk5Sxgqxp2lU3+JE87BRLAU/Jog==
X-Google-Smtp-Source: AA0mqf4YB8JnnedwQjoNfM0ypDQE3AoLbvHaHweu7xqhUzKKDY+IJOVxG62wn1eGloitvYrgpRBWLsuvrz6wf6I87+c=
X-Received: by 2002:a05:6602:418d:b0:6a3:8925:be51 with SMTP id
 bx13-20020a056602418d00b006a38925be51mr604390iob.51.1668156568750; Fri, 11
 Nov 2022 00:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com>
 <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
In-Reply-To: <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 11 Nov 2022 14:19:17 +0530
Message-ID: <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
Subject: Re: [PATCH v8 01/14] drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
To: Nicolas Boichat <drinkcat@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fancy Fang <chen.fang@nxp.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Marek Vasut <marex@denx.de>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 6:19 AM Nicolas Boichat <drinkcat@chromium.org> wro=
te:
>
> On Fri, Nov 11, 2022 at 2:40 AM Jagan Teki <jagan@amarulasolutions.com> w=
rote:
> >
> > HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> > 0 =3D Enable and 1 =3D Disable.
>
> Oh I see, that's confusing... IMHO you might want to change the
> register macro name... (but if that's what the datasheet uses, it
> might not be ideal either). At the _very_ least, I'd add a comment in
> the code so the next person doesn't attempt to "fix" it again...

02/14 on the same series doing the name change.
https://lore.kernel.org/all/20221110183853.3678209-3-jagan@amarulasolutions=
.com/

>
> BTW, are you sure DSIM_HSE_MODE is correct now?

Yes, we have tested in imx8m platforms as well. S=C3=A9bastien Szymanski
initially observed this issue on the imx8m platform.

Jagan.
