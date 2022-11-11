Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC7E625AA4
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 13:46:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784BB10E12D;
	Fri, 11 Nov 2022 12:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C57D10E12D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 12:45:57 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id p141so3467073iod.6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 04:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1xS4s0avgD255rcYtA4Gae74h0+wxtz39GOAv7A9upU=;
 b=ObGg9stT9HoCf/3hi1Z8le25KXMunJrziAtRLVbUrZC4OS5ZtiDcTMHcaGRON8E8GL
 f70DgnO7ZlPPXUeY1riLAsY4ZhsJ37ghiVyGrL3GrcSv6n+V+1vU8ZIskBXu6uGBlifV
 uuHw2MHM12kOhnHVUcPa9b4kVnHlJ3/egwDuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1xS4s0avgD255rcYtA4Gae74h0+wxtz39GOAv7A9upU=;
 b=C+cNGpvVPBKZ6DVnTuJjAqONRG0ZYJr5rfWiK6cvgMJym2nrJ4Wx7O2usK14QuOQSk
 NDxRlmYkogSmmXDTyybPDWZDAFZ4+B7Y52SoxTsIrKz15G+8smSqyEMcBTRUtb2rCcB1
 5u+lmLyvoKCAruV0EbEdaMUE3bemYrEt3zdz5WEhpBkBaEpHU6Jj6mPYHHEIR4EhpOxr
 JpDOV8v9qzbuqCb60OMOY6Wsw2o5T0ckM5D4WBk8QhbHgOJoC7UmVe/r/OZGRdNvG+Dd
 IrKN79NOv3dGFsdZgQWhd005bjUmYb3BYs5Tl9TIeRsVApDXh4aTHx+WR5TjGP7v+1RG
 djcA==
X-Gm-Message-State: ANoB5plfNQDwbNuADfNkMX/Q1Cw7vnnJWj8v8KMgzHpPMkhulcwxLwUE
 pZK8q7CkcJNYmM93pXa4FGJAEecU86xQnH1w2Y6BSg==
X-Google-Smtp-Source: AA0mqf7rYEZg0X5ct8WvgQlQepH0xO2ddeWLJ/U9eXDDUpUybtT+Gidz8gRXMfRuJhf1bDsJCgY4OkIFIvHR1swiyNI=
X-Received: by 2002:a02:860e:0:b0:375:2c83:3f2f with SMTP id
 e14-20020a02860e000000b003752c833f2fmr636049jai.104.1668170756860; Fri, 11
 Nov 2022 04:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-2-jagan@amarulasolutions.com>
 <CANMq1KCHQExVVp1jHjhRB2pMqeFFE1Cg1GVmnN83v=z1KzJt0Q@mail.gmail.com>
 <CAMty3ZBC3pbWf4yixjv4DZWFR+fYkPctiL3hzubgY8RF4ZGHmA@mail.gmail.com>
 <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com>
In-Reply-To: <CANMq1KDmF+cMo8qZh7UyM1vyZ6BD_cFPc6j2MNMNPFiutqxL3w@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 11 Nov 2022 18:15:45 +0530
Message-ID: <CAMty3ZBzNZgJkKDXTSG4onqtFK9SJ2qN9Cxv2XTg40JyX4TjaA@mail.gmail.com>
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

On Fri, Nov 11, 2022 at 5:42 PM Nicolas Boichat <drinkcat@chromium.org> wro=
te:
>
> On Fri, Nov 11, 2022 at 4:49 PM Jagan Teki <jagan@amarulasolutions.com> w=
rote:
> >
> > On Fri, Nov 11, 2022 at 6:19 AM Nicolas Boichat <drinkcat@chromium.org>=
 wrote:
> > >
> > > On Fri, Nov 11, 2022 at 2:40 AM Jagan Teki <jagan@amarulasolutions.co=
m> wrote:
> > > >
> > > > HFP/HBP/HSA/EOT_PACKET modes in Exynos DSI host specifies
> > > > 0 =3D Enable and 1 =3D Disable.
> > >
> > > Oh I see, that's confusing... IMHO you might want to change the
> > > register macro name... (but if that's what the datasheet uses, it
> > > might not be ideal either). At the _very_ least, I'd add a comment in
> > > the code so the next person doesn't attempt to "fix" it again...
> >
> > 02/14 on the same series doing the name change.
> > https://lore.kernel.org/all/20221110183853.3678209-3-jagan@amarulasolut=
ions.com/
>
> Oh thanks I wasn't cc'ed on that one, makes sense.
>
> You can add my reviewed tag to this one, as my HSE comment doesn't change=
 this.
>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
>
> But please double check HSE.
>
> >
> > >
> > > BTW, are you sure DSIM_HSE_MODE is correct now?
> >
> > Yes, we have tested in imx8m platforms as well. S=C3=A9bastien Szymansk=
i
> > initially observed this issue on the imx8m platform.
>
> I'll repeat, are you sure about HSE specifically? You invert the
> polarity for HBP, HFP, and HSA, which makes sense given your patch
> 02/14.
>
> I'm concerned about HSE. Is the bit really a disable bit?
> MIPI_DSI_MODE_VIDEO_HSE is supposed to be an enable flag, so you
> should not do `reg |=3D DSIM_HSE_DISABLE;`, probably.

HSE typically enables bit logic, unlike other bits which are disabled bits.

HseDisableMod:
In Vsync pulse and Vporch area, MIPI DSI master transfers only Hsync
start packet to MIPI DSI slave at
MIPI DSI spec 1.1r02. This bit transfers Hsync end packet in Vsync
pulse and Vporch area (optional).
0 =3D Disables transfer
1 =3D Enables transfer

HfpDisableMode:
Specifies HFP disable mode. If this bit set, DSI master ignores HFP
area in Video mode.
0 =3D Enables
1 =3D Disables

I think the naming of 'HseDisableMod' is misleading in the datasheet,
but I have used it as per the spec.

Jagan.
