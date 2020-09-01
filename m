Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17DF259920
	for <lists+dri-devel@lfdr.de>; Tue,  1 Sep 2020 18:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DFC26E86A;
	Tue,  1 Sep 2020 16:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2692089F69
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Sep 2020 10:19:27 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1952CEB1;
 Tue,  1 Sep 2020 06:19:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 01 Sep 2020 06:19:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=sUIriuDdEGEGb3qXjf0yLWBxBK6
 VbKbmpwiiPPnocWI=; b=j3o+sUFnvkQTt37CkFXstCodCLKl0o84yDR4q71zpEk
 GXvHq6HEjdGACV1BaMQmMLrub7y+cEsgbPxYooUeCDhIuU/pF5kefFvZ0Bi82W+9
 NFQOYfWg0C47cDsSQ2FyEPI0M9dI8qPT08UBY2brHey9eRJc8wAN5KGQD1L0+r5G
 3ZI7+LVYKUdOeeVADs+t0DNCgY76KF3Q14ASbOqIcVJECLHt3jJHWTOjBfctccjE
 JWDAQcHIc5E/Wux+AXA9jgAzz0xRm5/645i1wCWTmLHc5rfHntHfbWGVS6BSns0O
 6ToqZobbm5lDhn4bpLPZUN8I5YuNIiIyRi1Kd865B/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=sUIriu
 DdEGEGb3qXjf0yLWBxBK6VbKbmpwiiPPnocWI=; b=CN2MS3MEeKsFQO6hQP1aG+
 kva8V4WhTtX3OEXc4vmGjDW+hZFMH38jVlksnyhhRztB4FTsYI5d9Ol4vzIWETNE
 CEPcgBYtI0N9PMUYfkw8etJuaQdBFnQnFR5EZb1EaOpF53lDZS+VyBGylRYNh3gf
 ieopMJUjb6RG+nLvoDxgGobtf8jtB5QrMHtgnqjP92abqFXTeBw20rkR0ZDq9e3+
 82NZOw2XpdIGGUtPfFhHIhP0QPioUaCKuHCIIWI6GyepjSlgFlNR/HJNwkX68jSR
 QlrCcp2Qg+DCAepmEu6MDUEKQdQZcSAA5E1gHJtlEmqu0sHMJmPSW86DIYeD42GQ
 ==
X-ME-Sender: <xms:LCBOX8up6Q4ZPYhwrZjpwG148Pj_GLIIb2t-E_T-lGKhFkgSaMbRhg>
 <xme:LCBOX5fJIyEQfDCSp11uNtpHwflZjJeOt4kh0jmbOnol2Qd3DtJ5WFfa3kJg6LqvR
 zGpKlZVevZ9cla0YMk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefjedgvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:LCBOX3zX7gMwlyKAMJYADGkzJ9XHpSt7jLH31jTTlkoMBYB3tHMVOQ>
 <xmx:LCBOX_OTfrUOi8u2szg9lftfbTQ7j_H-fGrFRc1whT8gPwo-8cbdvg>
 <xmx:LCBOX88UGVoEJ5DbcYA3SMts_BPqQeSBGBrB5gimA3KYo-dP4aG3HA>
 <xmx:LSBOX5Pnfpw5CzRKG1MwpKYsNdO68IOK6eeZ1u16cZ_Ooxv4R1ns_A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id AC989328005E;
 Tue,  1 Sep 2020 06:19:24 -0400 (EDT)
Date: Tue, 1 Sep 2020 12:19:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v4 77/78] drm/vc4: drv: Support BCM2711
Message-ID: <20200901101923.7e744qwtuvmnbtmn@gilmour.lan>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
 <90c53367b289e9c0f9eeb97794a8d3b08d813884.1594230107.git-series.maxime@cerno.tech>
 <CAPY8ntB3eeqqz0hPSfHiJpKs9sJpU5uN5GzLsqmhtxrD0i6TJg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPY8ntB3eeqqz0hPSfHiJpKs9sJpU5uN5GzLsqmhtxrD0i6TJg@mail.gmail.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 16:37:23 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0023855417=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0023855417==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dozkezvx4o5iboho"
Content-Disposition: inline


--dozkezvx4o5iboho
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Tue, Jul 28, 2020 at 04:30:16PM +0100, Dave Stevenson wrote:
> > @@ -681,10 +684,14 @@ int vc4_kms_load(struct drm_device *dev)
> >         struct vc4_load_tracker_state *load_state;
> >         int ret;
> >
> > -       /* Start with the load tracker enabled. Can be disabled through=
 the
> > -        * debugfs load_tracker file.
> > -        */
> > -       vc4->load_tracker_enabled =3D true;
> > +       if (!of_device_is_compatible(dev->dev->of_node, "brcm,bcm2711-v=
c5")) {
>=20
> Is it better to look up the compatible string, or pass something via
> the .data element of the of_device_id table? Probably down to personal
> preference?

It's pretty much equivalent, so I'm not sure one is arguably better than
the other. However, checking for the compatible can be pretty cumbersome
when you have to do it repeatedly (like we do in the HDMI controller),
and when you don't it a lot, having a structure associated to the
compatible is also fairly cumbersome.

> > +               vc4->load_tracker_available =3D true;
> > +
> > +               /* Start with the load tracker enabled. Can be
> > +                * disabled through the debugfs load_tracker file.
> > +                */
> > +               vc4->load_tracker_enabled =3D true;
> > +       }
> >
> >         sema_init(&vc4->async_modeset, 1);
> >
> > @@ -698,8 +705,14 @@ int vc4_kms_load(struct drm_device *dev)
> >                 return ret;
> >         }
> >
> > -       dev->mode_config.max_width =3D 2048;
> > -       dev->mode_config.max_height =3D 2048;
> > +       if (of_device_is_compatible(dev->dev->of_node, "brcm,bcm2711-vc=
5")) {
>=20
> We're making the same of_device_is_compatible call twice within
> vc4_kms_load. Set a flag based on it and check that instead?

Good idea, thanks!
Maxime

--dozkezvx4o5iboho
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX04gKwAKCRDj7w1vZxhR
xdjRAP9NRCUkLEG71G/PlhSmiqu8PAfDEFoqOIOabvM3/kj1GAEAxUSCGhv9XmUs
ZhR7LLKC9pnKW5c295ozmuSloS08AQg=
=s4r0
-----END PGP SIGNATURE-----

--dozkezvx4o5iboho--

--===============0023855417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0023855417==--
