Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C9F6DD49D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 09:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C774B10E064;
	Tue, 11 Apr 2023 07:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853D210E064
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 07:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1681199270; x=1712735270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6GiluLDo4IgBhrjA/A86T0fSkgetkCZfkgz4G9JQ0h4=;
 b=EhOAe+J7djl+TsWjQZZ6aLo8WY7NoTgTNSatjAJp3fIY4oo4u0b1Fk8s
 881XGqSyzQXZbwJwaITIa+55U4SxWU9/TvUiYCYai7eXO7egffKsSPChu
 2tMshI8/nBRdcpI+7vgfXXoec1D+czY09C2RCc31o2eU4aHUx/uH3ZsXN
 dkBif+fmloq5L1aQoxyOpH6DTlFv81ZhQj1I6SweGXXBD1sz+rL67eSE9
 xb0lkQULkaOFj1sHcx3/QUwIkqCwfWw35ATGvfq58GMQWU8DrDBCzsTwW
 EOGzb2G5Gm8WIhJc0JnM3NB8KE65g1FbXNAJoTjKnnaikH3G4xqhFlek/ w==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673910000"; d="scan'208";a="30239763"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 11 Apr 2023 09:47:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 11 Apr 2023 09:47:48 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 11 Apr 2023 09:47:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1681199267; x=1712735267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6GiluLDo4IgBhrjA/A86T0fSkgetkCZfkgz4G9JQ0h4=;
 b=e45OMgSd1Grx2d3gyfN1HVEh0Gfe6UXxOuM7mnnJAm1RBFtxL5FKEPYc
 Sl1ydu2a/ggC+TRTGBl8IaRcb3X5foAPT6Gaal0wJn52PeoCn8zWbFj6Y
 vHBsMb9e6x1JijZqNy+8HZiQ6u/F8O4smAJ6Gm+puWfUwbRj3c4o66zxk
 zUMP5cPm/vMdoFrbRQvNMQgkX0sINsJTm9U2Of4F0hf3fHj4hQdBqMLQk
 EWYsIxVN0f6D6EIru9FuJquzp4mZVZPPPMhYp/WPUT+P3zkb5nasAY+4n
 ZrVImOrd3H7PdJIYMz00LTjMe34S7pp4nR6mBkJJrhQmc3lvZk/OPr2JV Q==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673910000"; d="scan'208";a="30239762"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 11 Apr 2023 09:47:47 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5D7CC280056;
 Tue, 11 Apr 2023 09:47:48 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: RFC: DSI/DRM multiplexer bridge
Date: Tue, 11 Apr 2023 09:47:49 +0200
Message-ID: <9098102.CDJkKcVGEf@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAMty3ZBV-oH0KZPYb_ibER9PXVoAsG_9TR3LxpeYRPRtxgXsow@mail.gmail.com>
References: <2991779.e9J7NaK4W3@steina-w>
 <CAKMK7uFXvGu7E9w3a+5DUCqUoXXJd2jcDhWP-i_uk4pBVr0vyA@mail.gmail.com>
 <CAMty3ZBV-oH0KZPYb_ibER9PXVoAsG_9TR3LxpeYRPRtxgXsow@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

Am Donnerstag, 6. April 2023, 11:55:52 CEST schrieb Jagan Teki:
> [Replying the Daniel thread since he included bridge maintainers]
>=20
> On Thu, Apr 6, 2023 at 2:07=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wr=
ote:
> > Adding the usual bridge maintainer/review folks since this looks tricky.
> > -Daniel
> >=20
> > On Thu, 6 Apr 2023 at 10:33, Alexander Stein
> >=20
> > <alexander.stein@ew.tq-group.com> wrote:
> > > Hi Jagan,
> > >=20
> > > thanks for your reply.
> > >=20
> > > Am Mittwoch, 5. April 2023, 16:39:07 CEST schrieb Jagan Teki:
> > > > On Wed, Apr 5, 2023 at 7:39=E2=80=AFPM Alexander Stein
> > > >=20
> > > > <alexander.stein@ew.tq-group.com> wrote:
> > > > > Hi,
> > > > >=20
> > > > > my platform has a DIP switch controlled multiplexer for MIPI DSI
> > > > > output
> > > > > signals. One output has a TI SN65DSI84 (LVDS) and the other output
> > > > > has a
> > > > > TI
> > > > > SN65DSI86 (eDP) attached to it. The Multiplexer status can be read
> > > > > back
> > > > > from a GPIO. The GPIO is also IRQ capable, so it would be possible
> > > > > to
> > > > > support hotplug additionally later on.
> > > >=20
> > > > I have this requirement a year back [1] but my design has i.mx8mq D=
SI
> > > > outputs to SN65DSI84(LVDS) and ADV7533 (HDMI) and GPIO has muxed as
> > > > IRQ in order to find the bridge selection. (not confused with HDMI
> > > > HPD).
> > >=20
> > > Looks quite similar. This platform can be used using imx8mq, imx8mm or
> > > im8xmn. That mentioned GPIO is also not the HDMI HPD, but connected to
> > > a DIP switch on the mainboard to be changed manually.
>=20
> So, you need to manually adjust the switch and boot the required
> output and the state of the output depends on the set switch gpios
> isn't it? do you need to set any gpio so that the required output will
> select?

That's correct. There is no GPIO I need to set by software for the outputs=
=20
(despite the enable GPIO on the DSI-to-X bridges, but this is handled in th=
eir=20
appropriate drivers).

> > > > > My initial idea was to create a DRM multiplexer bridge driver whi=
ch
> > > > > (depending on the input GPIO) allows only one output to be enable=
d.
> > > > > Unfortunately ti- sn65dsi86.c driver expects a DSI host on remote
> > > > > node 0
> > > > > (see ti_sn_attach_host and ti_sn_bridge_parse_dsi_host), so it do=
es
> > > > > not
> > > > > work. ti-sn65dsi83.c just requires a drm_bridge.
> > > >=20
> > > > Yes, we need to have a finite amount of pipeline changes. assuming
> > > > that your mux bridge sits between DSI to Output interfaces the
> > > > proposed mux bridge selects which pipeline.
> > >=20
> > > My setup looks like this, but the switch is a different one than your=
s.
> > >=20
> > >                               | =3D> SN54DSI86 =3D> DP Connector
> > >=20
> > > DSI Host =3D> display-switch =3D> |
> > >=20
> > >                               | =3D> SN65DSI83 =3D> Panel-Simple
>=20
> This looks correct to me, as I designed the similar one.
>=20
> > > > > What is the best approach for this? I currently see two approache=
s:
> > > > > * Create an explicit DSI/DRM multiplexer bridge driver which
> > > > > registers
> > > > > itself as DSI host
> > > > > * Create a DRM multiplexer bridge (only). But this needs to remove
> > > > > the DSI
> > > > > device registration from ti-sn65dsi86.c
> > > >=20
> > > > Based on my experience, having a muxed bridge between in and out wo=
uld
> > > > be proper in order to satisfy the pipeline as well as the design. T=
hat
> > > > mux bridge has to be a normal bridge doesn't aware of DSI or any ot=
her
> > > > interface like one of the submissions has done in the recent mailing
> > > > list. [2] Things would be complicated when we switch the outputs but
> > > > we still use normal static switching of outputs in a proper way.
> > > >=20
> > > > > I am aware that DSI support is suboptimal, so I'm not sure which
> > > > > approach
> > > > > on the TI bridge drivers is the correct one and needs to be
> > > > > considered as
> > > > > given. Any ideas?
> > > >=20
> > > > I did implement some complicated things of switching outputs at
> > > > runtime but the idea of the switching pipelines would be similar if
> > > > you want to implement it in a normal static way. Here are some deta=
ils
> > > > and a demo of how those been worked. [3] [4]
> > >=20
> > > Thanks for the links. From what I read in those discussions dynamical=
ly
> > > (re)building the bridge chains it not correct/acceptable. Instead two
> > > bridges shall be created, but only one connector at the end shall be
> > > enabled. This> >=20
> > > would look like this:
> > >    switched-bridge
> > >   =20
> > >     +------------+                 +-------------+
> > >    =20
> > >     | drm_bridge-|- next_bridge -- | LVDS bridge |- connector
> > >     |=20
> > >     |            |                 +-------------+
> > >=20
> > > in -|            |
> > >=20
> > >     |            |                 +-------------+
> > >     |=20
> > >     | drm_bridge-|- next_bridge -- | eDP bridge  |- connector
> > >    =20
> > >     +------------+                 +-------------+
> > >    =20
> > >           ^
> > >      =20
> > >       DIP switch
> > >=20
> > > But here I'm not so sure how an (hotplug) event (e.g. IRQ) on the
> > > switched-
> > > bridge can be forwarded to the connectors. But this hotplug event see=
ms
> > > to be essential so that DRM master can reconfigure it's output.
>=20
> In my opinion, the switched-bridge needs to focus on switching the
> outputs based on DIP gpios, and hotplug events need to handle the
> associated display bridges like DP, HDMI, etc. It is possible for the
> switched-bridge to route the output displays without the hot plug.

I agree, IMHO hotplug/HPD events is related to downstream connectors.

> Assume the switched-bridge has port 1 and ep 0 connected to LVDS and
> port 1 and ep 1 connected to DP. then find and attach them at the
> bridge attach function. and do the necessary gpio enablements in
> enable or pre_enables.

Ah nice. My initial idea was:
* port 0 ep 0: input
* port 1 ep 0: LVDS
* port 2 ep 0: DP

But using two endpoints in one port looks neat. Although I'm not sure if th=
ere=20
is an actual difference.
But if the GPIO check is only done in enable/pre_enable there is no way to=
=20
support changing the DIP switch aka switched-bridge at runtime. There is=20
nothing the hotplug (non-HPD) event can be sent to, no?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


