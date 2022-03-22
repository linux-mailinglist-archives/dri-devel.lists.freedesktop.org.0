Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34514E4654
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 19:56:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365DE10E0AD;
	Tue, 22 Mar 2022 18:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46BED10E0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 18:56:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE3496164D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 18:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2209AC340F6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 18:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647975383;
 bh=yQu7mD0MqF0QfaaMkkc7HqXQC6NDYfLgVYhsQIhAJMA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nWsVvBhKN1vu06I1hERIyCJi6q5s5h1MVGYgRQ92KgVTiiWnR7FHzQf9oiInwB1jt
 ZQC2pgpEFmW8l3ECECtmmBSKsJY0EcDxNvGyZyn6wBuBFkI2In2p/OwaLM2FCWTCzU
 8fADR0AH2wsVbguc0l+TtOqcpH5uIpOV8PiKCeabIZHxVPQMstvXGOgPK1lH04se0N
 T37ieQWgVPMz19tcv2c5cKlimaEOwQnMXFdgzrTNSjqQh/SA+Ws5SiJfFZ6N1Z+9g7
 YD+9TvPVuIX+CC8AO1wiJew6agC75P2ty+6zLMuuO2WNprYVyd02CSpqJKh2mzOY7P
 P/MSZD9DtZ6VQ==
Received: by mail-ed1-f53.google.com with SMTP id b15so22846448edn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 11:56:23 -0700 (PDT)
X-Gm-Message-State: AOAM530h8+7kCsoEy2fOlXKhH5uD7dcrul4/j0ckF+WFy6ig1eiPOWly
 XXwapfW0S2HSgJWwkjTTIRyqh4R1FE1uiSfD0g==
X-Google-Smtp-Source: ABdhPJzziky+h4S7y1Oapwg6GLoQ4MKwfHE2BgXDz13RMs42HSRszzwB9Fo9/VxTML7QkaiTJ1h9U+piBCwHFpmyypQ=
X-Received: by 2002:aa7:d309:0:b0:419:128f:7178 with SMTP id
 p9-20020aa7d309000000b00419128f7178mr22680706edq.109.1647975381192; Tue, 22
 Mar 2022 11:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220128105849.368438-1-u.kleine-koenig@pengutronix.de>
 <20220128105849.368438-2-u.kleine-koenig@pengutronix.de>
 <CAL_JsqJjTf2zY-n69Ozh+S1gSi5Eoa5T44Qnq9RPNgJWDLmzKQ@mail.gmail.com>
 <20220128175829.vjm66rs7eu7pk2my@pengutronix.de>
 <YflvS007gL5mLa9k@robh.at.kernel.org>
 <b91696142ff5e27afae9ad2125c39a4f937d072f.camel@pengutronix.de>
In-Reply-To: <b91696142ff5e27afae9ad2125c39a4f937d072f.camel@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Mar 2022 13:56:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJvfqC79unzmS0Y9yaQt3g7Y8SBVgOt9RjjyRAogvHO2w@mail.gmail.com>
Message-ID: <CAL_JsqJvfqC79unzmS0Y9yaQt3g7Y8SBVgOt9RjjyRAogvHO2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: imx: Add fsl,imx21-lcdc docs
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 11:54 AM Lucas Stach <l.stach@pengutronix.de> wrote=
:
>
> Hi Rob,
>
> Am Dienstag, dem 01.02.2022 um 11:35 -0600 schrieb Rob Herring:
> > On Fri, Jan 28, 2022 at 06:58:29PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > Hello Rob,
> > >
> > > On Fri, Jan 28, 2022 at 07:04:10AM -0600, Rob Herring wrote:
> > > > On Fri, Jan 28, 2022 at 4:59 AM Uwe Kleine-K=C3=B6nig
> > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > >
> > > > > From: Marian Cichy <m.cichy@pengutronix.de>
> > > > >
> > > > > This files documents the device tree for the new imx21-lcdc DRM d=
river.
> > > >
> > > > No, bindings document h/w and the h/w has not changed. We already h=
ave
> > > > a binding for the LCDC.
> > >
> > > Just to be sure we're talking about the same thing: You're refering t=
o
> > > Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt, right?
> >
> > Looks right...
> >
> > > I'm unsure what to do now. Should the two different bindings just be
> > > described in the same file? Should I stick to fsl,imx21-fb even for t=
he
> > > new binding? (The hardware unit is named LCDC, so the name chosen her=
e
> > > is the better one.) Please advise.
> >
> > Yes, the name is unfortunate, but it should be 1 binding, 1 file, and
> > unchanged (unless you want to add new optional properties).
> >
> The old FB driver binding is pretty insane. Except the reg and
> interrupt properties it is very confused about things. It exposes
> internal implementation details (like specifying verbatim register
> settings in the DT) and other properties are just misplaced, like the
> lcd-supply property that controls the panel power supply.

I agree on 'lcd-supply', but that can simply be marked as deprecated
as can anything else. From what I remember working on these chips, I'm
not sure you can really avoid some of these register properties. For
example, the Sharp config is pretty much a use some value with some
specific Sharp panel. I guess we can have 'if panel A, then register
value is X' type code in the driver. Maybe the DMA settings can be
heuristics based on the pixel data rate, but I recall avoiding
underruns was challenging on some parts.

> I really don't think that trying to stay backwards compatible here is a
> win for anyone. Anyone willing to switch their systems running on a 15
> year old SoC to the new DRM driver probably doesn't mind if they have
> to modify the DTS to make it work. Can we please let the FB driver die
> in peace and have a clean slate driver/binding for the DRM driver?

The existing binding will still need a schema if it appears in dts files.

There's nothing really conflicting between the 2 bindings. Your
choices are to merge it all into 1 node and it's up to kernel
configuration (or module load) to select which driver. Or you have 2
nodes in the DT with one enabled at a time (because 2 enabled nodes at
the same address is not allowed). Then you need a DT change to switch.
Either way is fine and the schema should match which one you pick, but
I would do 1 node.

If you do a new binding, then justify it for the reasons above, not
the old one is for the FB driver and the new one is for the DRM
driver.

Rob
