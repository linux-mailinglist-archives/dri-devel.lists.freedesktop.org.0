Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C87A36D91B7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF7710E1D9;
	Thu,  6 Apr 2023 08:33:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B85610E1D9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1680770027; x=1712306027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y+EiDbt6+9flm5vZwsDuGRO1Myee4WNbpa10ykr3LLY=;
 b=FjafkKdSPVcoe48nHgOkiK6lEYSIwRD1r9tyMjFNKTyOZxN5uCjv77qH
 A0a4kFChqaQcY94kpPEtp3aQFVjN7adB9cHr4p/rZ0sVlBELzo+53e19/
 1PoT9z1GLrqGLxMqyAa9B3uTGrZve8bM8m0aS8ymh6tXjrzLKkxec+zWU
 8tWQ4D6TupqtMaVqjGPIt2SdgQzeHXb0nyuHdMydC33616Yf3lFzMzUqR
 dU/g6lFlakwgMqIa7L0xGMw8qRfVAUgVDliIDC1dLIJOCt36mYiAMkSwH
 6IZ3DCEVqBwSVvGhghb8N/yZha4QyQcVCcLsdETZYEdGARpD82Hr0X9fs w==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; d="scan'208";a="30186126"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 06 Apr 2023 10:33:44 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 06 Apr 2023 10:33:44 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 06 Apr 2023 10:33:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1680770024; x=1712306024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=y+EiDbt6+9flm5vZwsDuGRO1Myee4WNbpa10ykr3LLY=;
 b=NJSYGUAbtcM2B55v9CYdvlug82vEmbIH4DXlZUQl7m07ZN32irKEE04L
 xBkvuzvZui+6xN3Gdlz1AFCN5Grsm9qb/6T4QhwMK/KOfdQnO4Gc+mupg
 1eLNI7QkGj/hc1k9bOfnV1NHM1pAf2bX3mcMZwsXzO852Nbv9yh6N05D2
 HrNuHXtWyTzapmjk+QkfgnhF6i1Pb92mkIFyq5Z7Dc2wwkD0/H3kVvq80
 76zasi4NKwdMUgQ6xcCk9cpK9zmtPNyg8eA+YQCfOqJJzzCQ9B7CFZTOx
 UwB5G6YYtptJi6bh3A3pz30AuieBbKsbXdp14BwwKHCjfGZdz/JacLbhj g==;
X-IronPort-AV: E=Sophos;i="5.98,323,1673910000"; d="scan'208";a="30186125"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 06 Apr 2023 10:33:44 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4D28D280056;
 Thu,  6 Apr 2023 10:33:44 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: RFC: DSI/DRM multiplexer bridge
Date: Thu, 06 Apr 2023 10:33:41 +0200
Message-ID: <3727424.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAMty3ZAQyADGLVcB13qJdEy_BiZEKpyDfCr9QrM-ucFLFPZLcw@mail.gmail.com>
References: <2991779.e9J7NaK4W3@steina-w>
 <CAMty3ZAQyADGLVcB13qJdEy_BiZEKpyDfCr9QrM-ucFLFPZLcw@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

thanks for your reply.

Am Mittwoch, 5. April 2023, 16:39:07 CEST schrieb Jagan Teki:
> On Wed, Apr 5, 2023 at 7:39=E2=80=AFPM Alexander Stein
>=20
> <alexander.stein@ew.tq-group.com> wrote:
> > Hi,
> >=20
> > my platform has a DIP switch controlled multiplexer for MIPI DSI output
> > signals. One output has a TI SN65DSI84 (LVDS) and the other output has a
> > TI
> > SN65DSI86 (eDP) attached to it. The Multiplexer status can be read back
> > from a GPIO. The GPIO is also IRQ capable, so it would be possible to
> > support hotplug additionally later on.
>=20
> I have this requirement a year back [1] but my design has i.mx8mq DSI
> outputs to SN65DSI84(LVDS) and ADV7533 (HDMI) and GPIO has muxed as
> IRQ in order to find the bridge selection. (not confused with HDMI
> HPD).

Looks quite similar. This platform can be used using imx8mq, imx8mm or im8x=
mn.=20
That mentioned GPIO is also not the HDMI HPD, but connected to a DIP switch=
 on=20
the mainboard to be changed manually.

> > My initial idea was to create a DRM multiplexer bridge driver which
> > (depending on the input GPIO) allows only one output to be enabled.
> > Unfortunately ti- sn65dsi86.c driver expects a DSI host on remote node 0
> > (see ti_sn_attach_host and ti_sn_bridge_parse_dsi_host), so it does not
> > work. ti-sn65dsi83.c just requires a drm_bridge.
>=20
> Yes, we need to have a finite amount of pipeline changes. assuming
> that your mux bridge sits between DSI to Output interfaces the
> proposed mux bridge selects which pipeline.

My setup looks like this, but the switch is a different one than yours.

                              | =3D> SN54DSI86 =3D> DP Connector
DSI Host =3D> display-switch =3D> |
                              | =3D> SN65DSI83 =3D> Panel-Simple

> > What is the best approach for this? I currently see two approaches:
> > * Create an explicit DSI/DRM multiplexer bridge driver which registers
> > itself as DSI host
> > * Create a DRM multiplexer bridge (only). But this needs to remove the =
DSI
> > device registration from ti-sn65dsi86.c
>=20
> Based on my experience, having a muxed bridge between in and out would
> be proper in order to satisfy the pipeline as well as the design. That
> mux bridge has to be a normal bridge doesn't aware of DSI or any other
> interface like one of the submissions has done in the recent mailing
> list. [2] Things would be complicated when we switch the outputs but
> we still use normal static switching of outputs in a proper way.
>=20
> > I am aware that DSI support is suboptimal, so I'm not sure which approa=
ch
> > on the TI bridge drivers is the correct one and needs to be considered =
as
> > given. Any ideas?
>=20
> I did implement some complicated things of switching outputs at
> runtime but the idea of the switching pipelines would be similar if
> you want to implement it in a normal static way. Here are some details
> and a demo of how those been worked. [3] [4]

Thanks for the links. From what I read in those discussions dynamically=20
(re)building the bridge chains it not correct/acceptable. Instead two bridg=
es=20
shall be created, but only one connector at the end shall be enabled. This=
=20
would look like this:

   switched-bridge
    +------------+                 +-------------+
    | drm_bridge-|- next_bridge -- | LVDS bridge |- connector
    |            |                 +-------------+
in -|            |
    |            |                 +-------------+
    | drm_bridge-|- next_bridge -- | eDP bridge  |- connector
    +------------+                 +-------------+
          ^
          |
      DIP switch

But here I'm not so sure how an (hotplug) event (e.g. IRQ) on the switched-
bridge can be forwarded to the connectors. But this hotplug event seems to =
be=20
essential so that DRM master can reconfigure it's output.

Best regards,
Alexander

> [1]
> https://lore.kernel.org/all/CAMty3ZD7eFi4o7ZXNtjShoLd5yj3wn85Fm6ZNL89=3DQ=
pWj4
> 4KPw@mail.gmail.com/T/ [2]
> https://patchwork.kernel.org/project/dri-devel/patch/20230218111712.23802=
25
> -6-treapking@chromium.org/ [3]
> https://indico.freedesktop.org/event/2/contributions/76/
> [4] https://www.youtube.com/watch?v=3DPoYdP9fPn-4&t=3D624s
>=20
> Thanks,
> Jagan.


=2D-=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
http://www.tq-group.com/


