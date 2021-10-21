Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92441435C8A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 10:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8256EC2D;
	Thu, 21 Oct 2021 08:00:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693CA6EC2D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 08:00:39 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 98EB05812C1;
 Thu, 21 Oct 2021 04:00:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 21 Oct 2021 04:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=KU/j59qysAuk4ObDPffFyO6u0yh
 +Bz/yiTCCxP32cQg=; b=WWtbjHs/uSynr6ohlccc1iMU5tLe3/2uBqPOl4Htjf6
 1XAqjjrN5fTtXWN8GfERErHY3V5ZcFeVqvCTPr4Yi5ONqtUH2/OCTeci1g1BPajP
 gqNO9253CMYNoJwWKw+TEoUJxPgG3uOtACu5Wz9mnQn8xPFUrK3Q3xmhKUCQiFeU
 PdHIHc8Hc+8TJZ4VTEw7z2dUyetleyXPadhjayO0BC1gPCqcaB90tnGWA17+1UKV
 sEpfeCdOjgnXYhjfp9AgTCCyan02qqMX1HFriwgCU7KzlXXk1ENAgZvAUAe8Y2b7
 QqGvieSLcEjHiuC9drgUGs4lzr3c3z/x7wQig9vU6sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=KU/j59
 qysAuk4ObDPffFyO6u0yh+Bz/yiTCCxP32cQg=; b=d7MxuUBYX9JBoSxpG8Xxdg
 4Vm6iUK3FQqrttxwAMsqlAyCdtp3LRzn+JGnSCllmf6NIG3ME8pwrrVrNqjj6afX
 Ek6jonOkveAR2nkeCDBnQJX8rReta+qWlcap3Fsiz8euGkIXzYhvE0eIJY5Cz+ne
 vUTu4JTaXPV+SBaSuTxwm4KGkd9bA/uT1JwTVKu8xI1RTyuWtS21laW8ga4c+V4c
 5CMPFJitYJnlvzuOTz//L8Ct64wuWZOT3i8V0yGNQYpNW+M5Bhhf6pvpzFwL0iDd
 9nOQQMr3u8GX19SkPaHgGfaRkIRZ0Ino2wVl9FL9yPQlJ1XUjw304qtWYp+WfIQQ
 ==
X-ME-Sender: <xms:JR5xYY19NOFkVk7aZt-Uv9gaOfKQDZtjnsYRWnHSRG_kMxILL7JukQ>
 <xme:JR5xYTE_GFjwKzX_045R9DplEat_WNNNkH3enU7J0KtUUndYLk3BhvFERMTjLrwCm
 eLqomIBWlBg95DnYqc>
X-ME-Received: <xmr:JR5xYQ5GpQFOTovU3eu0t_Lp-qX4pulrp-GVAFfpb7lsKP2fK70Sz1Yc0XoAXANjvoTmkEI07FwNkhac7CnTs2qutgOGpSgBQI1QbggB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeutdfgjeeuudehvefgvedvtedtudelfffgffekledtffekgedukeejueev
 ieegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:JR5xYR3UGi4xJN-w13qQehtleGIs-jddOm2YcA-FY2ET5VQLGcaRFg>
 <xmx:JR5xYbEi_qg6-1rHAL_wX1-j73vnSEro7zpRowresoMKzKKNAIdJjw>
 <xmx:JR5xYa9nckE1PYYlbR8vzXbNRHB4GfZZmsQvXzoGxMThiuTHWQXNDg>
 <xmx:Jh5xYS_EvVzppf30jDJCBp2SsZOsbxMUm9kW0DmqN6WqdJ2f6QoSTA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 04:00:37 -0400 (EDT)
Date: Thu, 21 Oct 2021 10:00:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, pony1.wu@gmail.com,
 Orson Zhai <orsonzhai@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
Message-ID: <20211021080036.w7xgrwggrm6lnnlz@gilmour>
References: <20210813145302.3933-1-kevin3.tang@gmail.com>
 <20210813145302.3933-7-kevin3.tang@gmail.com>
 <20210917154047.leojvqjqjj2sg34l@gilmour>
 <CAFPSGXZbqh0f6kEoQaq_Nt677ksVS6QPdAa5==KVVAszSAuasw@mail.gmail.com>
 <20210928092805.wbc4ev3ze7a7zgqr@gilmour>
 <CAFPSGXZta-oJ7Hp3AyiGjpXr5e42g3r24Su6-L6HOwMR4QU5Zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i6g4hmj32as2fgck"
Content-Disposition: inline
In-Reply-To: <CAFPSGXZta-oJ7Hp3AyiGjpXr5e42g3r24Su6-L6HOwMR4QU5Zw@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--i6g4hmj32as2fgck
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 20, 2021 at 06:09:32PM +0800, Kevin Tang wrote:
> Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B49=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=885:28=E5=86=99=E9=81=93=EF=BC=9A
> > > > > +static int sprd_dsi_find_panel(struct sprd_dsi *dsi)
> > > > > +{
> > > > > +     struct device *dev =3D dsi->host.dev;
> > > > > +     struct device_node *child, *lcds_node;
> > > > > +     struct drm_panel *panel;
> > > > > +
> > > > > +     /* search /lcds child node first */
> > > > > +     lcds_node =3D of_find_node_by_path("/lcds");
> > > > > +     for_each_child_of_node(lcds_node, child) {
> > > > > +             panel =3D of_drm_find_panel(child);
> > > > > +             if (!IS_ERR(panel)) {
> > > > > +                     dsi->panel =3D panel;
> > > > > +                     return 0;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     /*
> > > > > +      * If /lcds child node search failed, we search
> > > > > +      * the child of dsi host node.
> > > > > +      */
> > > > > +     for_each_child_of_node(dev->of_node, child) {
> > > > > +             panel =3D of_drm_find_panel(child);
> > > > > +             if (!IS_ERR(panel)) {
> > > > > +                     dsi->panel =3D panel;
> > > > > +                     return 0;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     drm_err(dsi->drm, "of_drm_find_panel() failed\n");
> > > > > +     return -ENODEV;
> > > > > +}
> > > >
> > > > Just use devm_drm_of_get_bridge there
> > >
> > > We use drm_panel_init and drm_panel_add API to add panel, so here is a
> > > panel device, not a bridge.
> >
> > Like Sam said, the panel API is on its way out and is being superseded
> > by bridge_panels.
>
> If get a panel by devm_drm_of_get_bridge, how to use bridge api to
> access panel?

You don't.

You'd get a panel-bridge driver (drivers/gpu/drm/bridge/panel.c), that
behaves like a bridge and will call the panel functions itself.

And since it's a bridge, everything (enable, pre_enable, etc.) is called
by the core framework (in drm_atomic_helper_commit_modeset_enables for
enable and pre_enable).

> it seems that pre_enable/enable still needs to be implemented, so we
> need to add drm_bridge_func, then move the panel-related operations in
> drm_encoder_helper_funcs to drm_bridge_funcs callback?

You're confusing two things. Our comment wasn't that this DSI needed to
be converted to a bridge itself (which is what you're talking about),
but that it needs to use the bridge API instead of the panel API to deal
with whatever is connected at the other end of the DSI link.

Maxime

--i6g4hmj32as2fgck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYXEeJAAKCRDj7w1vZxhR
xerMAQDbIo8QFD7KUkFklmhedJmVHyFchTfLdfiE1FF1+eH9kgD/ZjeaSdS2M5UF
gG3hG8RoV0DSuQhW0hjs7vqZVdfd9wc=
=cWgY
-----END PGP SIGNATURE-----

--i6g4hmj32as2fgck--
