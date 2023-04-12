Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C776DEBC0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 08:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB5A10E6E4;
	Wed, 12 Apr 2023 06:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A2C10E6E4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 06:22:41 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id v7so9137688ybi.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 23:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1681280560; x=1683872560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YzcrBClP4MIHnVurnvFYvhgN/8pmFCKNIuz7VTzapVA=;
 b=YzPK9hDu8+2ofDgjkX1XGFJlilqcAr+JEsJVbC7AD2+u0418tPscg/z0EjH6MviPHD
 c9ve8VKvfAJahccPZXf8pcZMifkffWndVrIbMxROzMF3uaIlBHEvs+FFkHNWMZck3WKE
 QFDtCUU52YrJ7Qq6+iPhmrGWNLSgbXV0bO/HE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681280560; x=1683872560;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YzcrBClP4MIHnVurnvFYvhgN/8pmFCKNIuz7VTzapVA=;
 b=rwib2b36xoPWZ0nVrMCHORPEuTUaEKHDpjgp5I4rAJkfEADUjbyhpoS1fDhUnLiy+1
 YOBvp0yZ8ic5DAoPuqYEsTBBZVDeTDhPD47STXPuA/7Sdf41MzgQJj92npMB/nIuGwzT
 ilXsOe1B1WzQG+bar6zbceqPxaEvY0tg+0YBsVGiNzE4fNazBi3RzTWD1ovjCtF4CbCH
 UC43s0jn+ohq1+B9JCnSzH3wgnrmRLcTmhCYAi+RqBiNah2mCt/6ajCRzZ5ehEi32Key
 n8W78XMt15w88f5WrzT8G+i7svV9zjKUCIsgmnNdVN2ZmkFcB5bV1/zfy3raInGDUM1L
 6P5g==
X-Gm-Message-State: AAQBX9el48whKtGj0epeIeJD4QFRe7t/m8C0TrTAyF2re0HMBTKYU19T
 +Lq5P1606Z+J7WvZ2kERfrEt+zyuxDWzr/OMSAIEVA==
X-Google-Smtp-Source: AKy350Zuqe9iTS9RPEw9I9hZwmrcQG/OjkegDB9AiIAhx0ame+wn+ingo80HND/tQHbiW3/CgVklaBcee09PS7L/X0s=
X-Received: by 2002:a25:d653:0:b0:b3b:fb47:8534 with SMTP id
 n80-20020a25d653000000b00b3bfb478534mr6978632ybg.5.1681280560568; Tue, 11 Apr
 2023 23:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <2991779.e9J7NaK4W3@steina-w>
 <CAKMK7uFXvGu7E9w3a+5DUCqUoXXJd2jcDhWP-i_uk4pBVr0vyA@mail.gmail.com>
 <CAMty3ZBV-oH0KZPYb_ibER9PXVoAsG_9TR3LxpeYRPRtxgXsow@mail.gmail.com>
 <9098102.CDJkKcVGEf@steina-w>
In-Reply-To: <9098102.CDJkKcVGEf@steina-w>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 12 Apr 2023 11:52:28 +0530
Message-ID: <CAMty3ZCXjwU2pJPfHzikKnj0nhujk_=kfRau2Bj9Lz1DRLHhMw@mail.gmail.com>
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

On Tue, Apr 11, 2023 at 1:17=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Donnerstag, 6. April 2023, 11:55:52 CEST schrieb Jagan Teki:
> > [Replying the Daniel thread since he included bridge maintainers]
> >
> > On Thu, Apr 6, 2023 at 2:07=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> =
wrote:
> > > Adding the usual bridge maintainer/review folks since this looks tric=
ky.
> > > -Daniel
> > >
> > > On Thu, 6 Apr 2023 at 10:33, Alexander Stein
> > >
> > > <alexander.stein@ew.tq-group.com> wrote:
> > > > Hi Jagan,
> > > >
> > > > thanks for your reply.
> > > >
> > > > Am Mittwoch, 5. April 2023, 16:39:07 CEST schrieb Jagan Teki:
> > > > > On Wed, Apr 5, 2023 at 7:39=E2=80=AFPM Alexander Stein
> > > > >
> > > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > > Hi,
> > > > > >
> > > > > > my platform has a DIP switch controlled multiplexer for MIPI DS=
I
> > > > > > output
> > > > > > signals. One output has a TI SN65DSI84 (LVDS) and the other out=
put
> > > > > > has a
> > > > > > TI
> > > > > > SN65DSI86 (eDP) attached to it. The Multiplexer status can be r=
ead
> > > > > > back
> > > > > > from a GPIO. The GPIO is also IRQ capable, so it would be possi=
ble
> > > > > > to
> > > > > > support hotplug additionally later on.
> > > > >
> > > > > I have this requirement a year back [1] but my design has i.mx8mq=
 DSI
> > > > > outputs to SN65DSI84(LVDS) and ADV7533 (HDMI) and GPIO has muxed =
as
> > > > > IRQ in order to find the bridge selection. (not confused with HDM=
I
> > > > > HPD).
> > > >
> > > > Looks quite similar. This platform can be used using imx8mq, imx8mm=
 or
> > > > im8xmn. That mentioned GPIO is also not the HDMI HPD, but connected=
 to
> > > > a DIP switch on the mainboard to be changed manually.
> >
> > So, you need to manually adjust the switch and boot the required
> > output and the state of the output depends on the set switch gpios
> > isn't it? do you need to set any gpio so that the required output will
> > select?
>
> That's correct. There is no GPIO I need to set by software for the output=
s
> (despite the enable GPIO on the DSI-to-X bridges, but this is handled in =
their
> appropriate drivers).

If we don't do any gpio handling in mux-bridge then why do we need
mux-bridge? what exactly is the job of the mux-bridge driver?

>
> > > > > > My initial idea was to create a DRM multiplexer bridge driver w=
hich
> > > > > > (depending on the input GPIO) allows only one output to be enab=
led.
> > > > > > Unfortunately ti- sn65dsi86.c driver expects a DSI host on remo=
te
> > > > > > node 0
> > > > > > (see ti_sn_attach_host and ti_sn_bridge_parse_dsi_host), so it =
does
> > > > > > not
> > > > > > work. ti-sn65dsi83.c just requires a drm_bridge.
> > > > >
> > > > > Yes, we need to have a finite amount of pipeline changes. assumin=
g
> > > > > that your mux bridge sits between DSI to Output interfaces the
> > > > > proposed mux bridge selects which pipeline.
> > > >
> > > > My setup looks like this, but the switch is a different one than yo=
urs.
> > > >
> > > >                               | =3D> SN54DSI86 =3D> DP Connector
> > > >
> > > > DSI Host =3D> display-switch =3D> |
> > > >
> > > >                               | =3D> SN65DSI83 =3D> Panel-Simple
> >
> > This looks correct to me, as I designed the similar one.
> >
> > > > > > What is the best approach for this? I currently see two approac=
hes:
> > > > > > * Create an explicit DSI/DRM multiplexer bridge driver which
> > > > > > registers
> > > > > > itself as DSI host
> > > > > > * Create a DRM multiplexer bridge (only). But this needs to rem=
ove
> > > > > > the DSI
> > > > > > device registration from ti-sn65dsi86.c
> > > > >
> > > > > Based on my experience, having a muxed bridge between in and out =
would
> > > > > be proper in order to satisfy the pipeline as well as the design.=
 That
> > > > > mux bridge has to be a normal bridge doesn't aware of DSI or any =
other
> > > > > interface like one of the submissions has done in the recent mail=
ing
> > > > > list. [2] Things would be complicated when we switch the outputs =
but
> > > > > we still use normal static switching of outputs in a proper way.
> > > > >
> > > > > > I am aware that DSI support is suboptimal, so I'm not sure whic=
h
> > > > > > approach
> > > > > > on the TI bridge drivers is the correct one and needs to be
> > > > > > considered as
> > > > > > given. Any ideas?
> > > > >
> > > > > I did implement some complicated things of switching outputs at
> > > > > runtime but the idea of the switching pipelines would be similar =
if
> > > > > you want to implement it in a normal static way. Here are some de=
tails
> > > > > and a demo of how those been worked. [3] [4]
> > > >
> > > > Thanks for the links. From what I read in those discussions dynamic=
ally
> > > > (re)building the bridge chains it not correct/acceptable. Instead t=
wo
> > > > bridges shall be created, but only one connector at the end shall b=
e
> > > > enabled. This> >
> > > > would look like this:
> > > >    switched-bridge
> > > >
> > > >     +------------+                 +-------------+
> > > >
> > > >     | drm_bridge-|- next_bridge -- | LVDS bridge |- connector
> > > >     |
> > > >     |            |                 +-------------+
> > > >
> > > > in -|            |
> > > >
> > > >     |            |                 +-------------+
> > > >     |
> > > >     | drm_bridge-|- next_bridge -- | eDP bridge  |- connector
> > > >
> > > >     +------------+                 +-------------+
> > > >
> > > >           ^
> > > >
> > > >       DIP switch
> > > >
> > > > But here I'm not so sure how an (hotplug) event (e.g. IRQ) on the
> > > > switched-
> > > > bridge can be forwarded to the connectors. But this hotplug event s=
eems
> > > > to be essential so that DRM master can reconfigure it's output.
> >
> > In my opinion, the switched-bridge needs to focus on switching the
> > outputs based on DIP gpios, and hotplug events need to handle the
> > associated display bridges like DP, HDMI, etc. It is possible for the
> > switched-bridge to route the output displays without the hot plug.
>
> I agree, IMHO hotplug/HPD events is related to downstream connectors.
>
> > Assume the switched-bridge has port 1 and ep 0 connected to LVDS and
> > port 1 and ep 1 connected to DP. then find and attach them at the
> > bridge attach function. and do the necessary gpio enablements in
> > enable or pre_enables.
>
> Ah nice. My initial idea was:
> * port 0 ep 0: input
> * port 1 ep 0: LVDS
> * port 2 ep 0: DP
>
> But using two endpoints in one port looks neat. Although I'm not sure if =
there
> is an actual difference.

This is also possible but sometimes port 1 with ep 0, 1 means we
pipeline offers 2 outputs but one at a time.

> But if the GPIO check is only done in enable/pre_enable there is no way t=
o
> support changing the DIP switch aka switched-bridge at runtime. There is
> nothing the hotplug (non-HPD) event can be sent to, no?

The idea here is to change the bridge chain and this can be done in
static via dt or runtime. In your case the state of the DIP-switch
resembles desired output, correct? if so if we read that state at
run-time, find the output, and attach that particular bridge chain. Fo
dt case of showing output read the dt about the output state and
attach the bridge chain accordingly.

Thanks,
Jagan.
