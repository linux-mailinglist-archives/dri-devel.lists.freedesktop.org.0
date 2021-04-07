Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C459356A37
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 12:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3036189AA6;
	Wed,  7 Apr 2021 10:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBFDB89AA6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 10:48:57 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 14CC7580985;
 Wed,  7 Apr 2021 06:48:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 07 Apr 2021 06:48:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=bryhBUK4gj1uG2j7gqn9cxD18k9
 Ai3R9q5ZzCV5V3d4=; b=M7Jm5mG+jkqykilbQjrGoKnBqe59FZ+AZ/vt3iiYI6L
 HzkV/0KSdaJKmhK9O0GGftGQA+cIyIt/zO/pWHtb9qAZyqk9iDgC0tLmbEhqFX0h
 C9WLclqcUaPg+fGc8k9soyiLDCfLcgw7g6bdEU6vMu8EZnfowiZPm3JXmzlvmng7
 DEN9ennpkMrJdNVMH2PGuELqFqwakYfTtJA+tR270pwxmp9dLFV8Z7zEl9zcb6Z/
 /tu3QFj1Zu5ixrS+257o9M4TDoU0kJi62X2KeyRLD6/duAlzdP5ECz/tSQYzsrQb
 30IwXXyy01GADkbXxcfUJftKhafypQx1D0I2ytBYRSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bryhBU
 K4gj1uG2j7gqn9cxD18k9Ai3R9q5ZzCV5V3d4=; b=I/XVohD3GiMmHpORrupzI8
 gy7eoqU6Dhi8A1O4K3BE5ED4oN+hG06ADg9a0GwvdvrqhhM/cI+6Rj7J0078IFTI
 irPfkwj+F6hbQTjfi0tQAoJwYQ1DzEAVeXtIAxirn59UTJANy0IV+XqspIV8/PnT
 LoYPbxK0GDw6gmzvcqMWIZZUhndj0oa5nyjDtQsihMyNUXjmTMvGv6MA/j9UZo9o
 PBpNxjtx2IKnS2mflIJmn1sBApCg+htks/Qy4K4/iXQ3hKUC0P6NCOUvt6UpKh5k
 0TNOAsypIiolBO0uPE+xpMjeK3RJUHxxic3lZmJ3NHPZTutVFLhkeHGk5BkzW3Sg
 ==
X-ME-Sender: <xms:F45tYMqJozDjFGYtVYj4rLYvX4ej4HnU7UX2y79EivJUmZifTRCfAw>
 <xme:F45tYCpDmx3m3Y7sNFdq3oGb1tIDWEW2e02_4n9LycJWd60niox3oBtLRhyXDZyF5
 Y_OO7qhUa3RIOwWkSU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejjedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:F45tYBOti2cDZl4AwkwXL5MSsXjyTjO2MF17qIzpUbz8-LlpzPSkPw>
 <xmx:F45tYD4vX-BwZGTHvTMot1zzEU2OL7zZ-xwSjaFz6tWzESCjnQoe0Q>
 <xmx:F45tYL6VZJpRlyEzZply8yw9KK2H5z0Zfmcb6M_xaoaz7Hk3LXIC3w>
 <xmx:GI5tYIGbtns08OZnHXbU6CuvEGb6MUwXiNxHY1k2rwSE2GElFow9eA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9D2051080063;
 Wed,  7 Apr 2021 06:48:55 -0400 (EDT)
Date: Wed, 7 Apr 2021 12:48:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v4 6/6] drm/sprd: add Unisoc's drm mipi dsi&dphy driver
Message-ID: <20210407104854.fgn67pvau7dchcm2@gilmour>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-7-kevin3.tang@gmail.com>
 <20210324112745.n76qhrbhzyfunmkd@gilmour>
 <CAFPSGXYK0Hi2-eYkukO2pNhHrJVZ=f79sj_hjXnGBZ_meVmkFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFPSGXYK0Hi2-eYkukO2pNhHrJVZ=f79sj_hjXnGBZ_meVmkFg@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============1562017364=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1562017364==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="znbdfkroerihtnuv"
Content-Disposition: inline


--znbdfkroerihtnuv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 31, 2021 at 09:47:12AM +0800, Kevin Tang wrote:
> > > diff --git a/drivers/gpu/drm/sprd/Makefile
> > b/drivers/gpu/drm/sprd/Makefile
> > > index 6c25bfa99..d49f4977b 100644
> > > --- a/drivers/gpu/drm/sprd/Makefile
> > > +++ b/drivers/gpu/drm/sprd/Makefile
> > > @@ -1,5 +1,8 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > >
> > >  obj-y := sprd_drm.o \
> > > -     sprd_dpu.o
> > > -
> > > +     sprd_dpu.o \
> > > +     sprd_dsi.o \
> > > +     dw_dsi_ctrl.o \
> > > +     dw_dsi_ctrl_ppi.o \
> >
> > So it's a designware IP? There's a driver for it already that seems
> > fairly similar:
> > drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> >
> Our dw dsi controller is not a standard synopsys ip, we have updated a lot
> on the basic ip version,
> the entire control register is different, i have cc to drm/bridge reviewers
> and maintainers.

You should make it more obvious then in a comment or in the name of the
driver. If it's fairly different from the original IP from Synopsys,
maybe you should just drop the reference to the name?

Maxime

--znbdfkroerihtnuv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYG2OFgAKCRDj7w1vZxhR
xTGeAP43GxaV8bVqijzlTRpxU9Akr4e/ozKykBfR4+jAeDva5gD+K8sElBZsuEnb
D1HmG0QxEpBwGPRikmgacH+4dSDIAA0=
=+gJE
-----END PGP SIGNATURE-----

--znbdfkroerihtnuv--

--===============1562017364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1562017364==--
