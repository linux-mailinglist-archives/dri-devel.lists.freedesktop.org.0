Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C1A6D935D
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 11:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6605310E217;
	Thu,  6 Apr 2023 09:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876AB10E217
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 09:56:05 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id j7so45556923ybg.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1680774964; x=1683366964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XjCG3Q6AYxOryEA8ZgASmWpaFiAiJ5P0PIAmbv1Qha4=;
 b=HN2r0iJXGRybyNxGizfPSdV27HwaEomPeeQhT0RvKthr254s9pQ8CBZUd/qn9CzYd2
 TFL7mMKjwNJJoZ03RwZ1OK+uAHj79AmISmRVhMqiaSghP2DD7oo9I/ufNFE2uZt2eMPf
 qlvsiSyFvHr3SklTMe4uasOP1yr0IfXxIEuxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680774964; x=1683366964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XjCG3Q6AYxOryEA8ZgASmWpaFiAiJ5P0PIAmbv1Qha4=;
 b=1UjnzFxKeMHOxzOC4qtChfEg0k5yhm8gpqNttoaVnkW74LoiN5Gcg+M63wcHB5kDYF
 tCdaxtdRZP5U2kKlFdqzUfCvK+3lQ0csfN5Hy+qam15z4XBVg2eggH93jLcSEz5jjQUy
 0DVUCVMkZkGfgAc5XCi/LQqJMeqOOyoUqpQYjjmyF9ZLawJ4OfQbnQq/AqCAHDTafXXz
 nGc9UMBmK7TuMzBxiXpt7E4zZJsg7/Q2K6t2EyvjAxCUIwNYbP3wljSRUmOTwMF6bTIP
 94rNDrfTNbg5sWGf8xulTpHs1TFuRhitZK7vQm3mtFjobFLOwVRYyM/0k2Wzoq/NS2pp
 0a5w==
X-Gm-Message-State: AAQBX9eUs0xnOhI3Unn2immAmZmjQ0iOTLqxjOhv9Br11xplx97qoLts
 96TYfh7imREPNcUl21X5V2z47d5p6ed7JaY2x4oUzg==
X-Google-Smtp-Source: AKy350Y20Tvy9Pz8kQ3XjOx/qzZe6DNgCvEW9GFW6R7ZP5QUBuStlkvdNQDjl/6ZCg/LNj26+93FIe4gAt/JEHLpkDs=
X-Received: by 2002:a25:738f:0:b0:b78:4b00:7772 with SMTP id
 o137-20020a25738f000000b00b784b007772mr1690192ybc.5.1680774964319; Thu, 06
 Apr 2023 02:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <2991779.e9J7NaK4W3@steina-w>
 <CAMty3ZAQyADGLVcB13qJdEy_BiZEKpyDfCr9QrM-ucFLFPZLcw@mail.gmail.com>
 <3727424.e9J7NaK4W3@steina-w>
 <CAKMK7uFXvGu7E9w3a+5DUCqUoXXJd2jcDhWP-i_uk4pBVr0vyA@mail.gmail.com>
In-Reply-To: <CAKMK7uFXvGu7E9w3a+5DUCqUoXXJd2jcDhWP-i_uk4pBVr0vyA@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 6 Apr 2023 15:25:52 +0530
Message-ID: <CAMty3ZBV-oH0KZPYb_ibER9PXVoAsG_9TR3LxpeYRPRtxgXsow@mail.gmail.com>
Subject: Re: RFC: DSI/DRM multiplexer bridge
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Replying the Daniel thread since he included bridge maintainers]

On Thu, Apr 6, 2023 at 2:07=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>
> Adding the usual bridge maintainer/review folks since this looks tricky.
> -Daniel
>
> On Thu, 6 Apr 2023 at 10:33, Alexander Stein
> <alexander.stein@ew.tq-group.com> wrote:
> >
> > Hi Jagan,
> >
> > thanks for your reply.
> >
> > Am Mittwoch, 5. April 2023, 16:39:07 CEST schrieb Jagan Teki:
> > > On Wed, Apr 5, 2023 at 7:39=E2=80=AFPM Alexander Stein
> > >
> > > <alexander.stein@ew.tq-group.com> wrote:
> > > > Hi,
> > > >
> > > > my platform has a DIP switch controlled multiplexer for MIPI DSI ou=
tput
> > > > signals. One output has a TI SN65DSI84 (LVDS) and the other output =
has a
> > > > TI
> > > > SN65DSI86 (eDP) attached to it. The Multiplexer status can be read =
back
> > > > from a GPIO. The GPIO is also IRQ capable, so it would be possible =
to
> > > > support hotplug additionally later on.
> > >
> > > I have this requirement a year back [1] but my design has i.mx8mq DSI
> > > outputs to SN65DSI84(LVDS) and ADV7533 (HDMI) and GPIO has muxed as
> > > IRQ in order to find the bridge selection. (not confused with HDMI
> > > HPD).
> >
> > Looks quite similar. This platform can be used using imx8mq, imx8mm or =
im8xmn.
> > That mentioned GPIO is also not the HDMI HPD, but connected to a DIP sw=
itch on
> > the mainboard to be changed manually.

So, you need to manually adjust the switch and boot the required
output and the state of the output depends on the set switch gpios
isn't it? do you need to set any gpio so that the required output will
select?

> >
> > > > My initial idea was to create a DRM multiplexer bridge driver which
> > > > (depending on the input GPIO) allows only one output to be enabled.
> > > > Unfortunately ti- sn65dsi86.c driver expects a DSI host on remote n=
ode 0
> > > > (see ti_sn_attach_host and ti_sn_bridge_parse_dsi_host), so it does=
 not
> > > > work. ti-sn65dsi83.c just requires a drm_bridge.
> > >
> > > Yes, we need to have a finite amount of pipeline changes. assuming
> > > that your mux bridge sits between DSI to Output interfaces the
> > > proposed mux bridge selects which pipeline.
> >
> > My setup looks like this, but the switch is a different one than yours.
> >
> >                               | =3D> SN54DSI86 =3D> DP Connector
> > DSI Host =3D> display-switch =3D> |
> >                               | =3D> SN65DSI83 =3D> Panel-Simple

This looks correct to me, as I designed the similar one.

> >
> > > > What is the best approach for this? I currently see two approaches:
> > > > * Create an explicit DSI/DRM multiplexer bridge driver which regist=
ers
> > > > itself as DSI host
> > > > * Create a DRM multiplexer bridge (only). But this needs to remove =
the DSI
> > > > device registration from ti-sn65dsi86.c
> > >
> > > Based on my experience, having a muxed bridge between in and out woul=
d
> > > be proper in order to satisfy the pipeline as well as the design. Tha=
t
> > > mux bridge has to be a normal bridge doesn't aware of DSI or any othe=
r
> > > interface like one of the submissions has done in the recent mailing
> > > list. [2] Things would be complicated when we switch the outputs but
> > > we still use normal static switching of outputs in a proper way.
> > >
> > > > I am aware that DSI support is suboptimal, so I'm not sure which ap=
proach
> > > > on the TI bridge drivers is the correct one and needs to be conside=
red as
> > > > given. Any ideas?
> > >
> > > I did implement some complicated things of switching outputs at
> > > runtime but the idea of the switching pipelines would be similar if
> > > you want to implement it in a normal static way. Here are some detail=
s
> > > and a demo of how those been worked. [3] [4]
> >
> > Thanks for the links. From what I read in those discussions dynamically
> > (re)building the bridge chains it not correct/acceptable. Instead two b=
ridges
> > shall be created, but only one connector at the end shall be enabled. T=
his
> > would look like this:
> >
> >    switched-bridge
> >     +------------+                 +-------------+
> >     | drm_bridge-|- next_bridge -- | LVDS bridge |- connector
> >     |            |                 +-------------+
> > in -|            |
> >     |            |                 +-------------+
> >     | drm_bridge-|- next_bridge -- | eDP bridge  |- connector
> >     +------------+                 +-------------+
> >           ^
> >           |
> >       DIP switch
> >
> > But here I'm not so sure how an (hotplug) event (e.g. IRQ) on the switc=
hed-
> > bridge can be forwarded to the connectors. But this hotplug event seems=
 to be
> > essential so that DRM master can reconfigure it's output.

In my opinion, the switched-bridge needs to focus on switching the
outputs based on DIP gpios, and hotplug events need to handle the
associated display bridges like DP, HDMI, etc. It is possible for the
switched-bridge to route the output displays without the hot plug.

Assume the switched-bridge has port 1 and ep 0 connected to LVDS and
port 1 and ep 1 connected to DP. then find and attach them at the
bridge attach function. and do the necessary gpio enablements in
enable or pre_enables.

Thanks,
Jagan.
