Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8B3608F9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 14:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15B36EA4A;
	Thu, 15 Apr 2021 12:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741AB6EA4A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 12:11:35 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id D2331580469;
 Thu, 15 Apr 2021 08:11:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 15 Apr 2021 08:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:date:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=dX5QOHJeT8EEYEsli9LNovkUhHN
 4fOmsf3zMtqEQtec=; b=Ok4tJWKQ9nH8zLd4MJuIn8JoMxqkK78wmL3ovzH/zrT
 UC5RfGaTG3O/7jnBmnzZW1YRWZyfmY6JqvwgwJbZcdIZY7nnoF3AArxyze5uIOBU
 yisRUv9h3iwLYN9cdLG3hrAoXI9tEl74msQoXbXjoxWpnhFZuW76y8xAcGzbTnIA
 DpDIv5d7++OUezQ7qdh0HM6gJ6kxrQJNldI2zLF4gLdXSHz9hHKcv7Skc4mgq//5
 pPnBwFl5NM/+mcRmxDNuspIpkiZ00AAFYlJxHpTEbs2Kz/8uYX5C/sP6sojM413x
 jfJF9RzGjzBhD2Y6sM4vlAAmRvc2BKwfwWn6C8ixmUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dX5QOH
 JeT8EEYEsli9LNovkUhHN4fOmsf3zMtqEQtec=; b=bms9l/dFZgiKBOhOIiLn/2
 waI/WneVLkb/8OafKSeirjCnL95n9gUZfG6f7XO+ty507W2rHXt88WuH8JVqB51M
 fGT58YMPudQKpsbXfrztt8SoHiZlHy5rHSmCqXbfiVg9dYWsiQpT/GI2F8L4j0ae
 s8ad2IPWQKbJqn7f8tepsu7s9DlxS9aKkIFuFosn/yZTqdlj5W3H9BhryK8JKKVw
 YqbhrYfNw0+mudk+MDRBqU+tWt17Ew1fnjQ3Zb5U8DfdvSCvMb3b7eboPoMYy9Bf
 gJ9/AcfiQhQff0HyltA2qxIz0dVA+IU96vp8wzUNz2DLNMpsTwkRYN5LjyF4zWew
 ==
X-ME-Sender: <xms:cS14YEbz-L4T8fWGB7EbxOWdCoWnTP_B_Epp49f3tNtU1HymMCflVw>
 <xme:cS14YG1w6qSa1-1gu3jkNlZfgdTtmC35gwjKLwXIUd3K6N4G3I-VgU_t-XwmQTqRg
 AOJRkCUh5tlYrQh1-M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpehmrgigihhm
 vgestggvrhhnohdrthgvtghhnecuggftrfgrthhtvghrnhephffffffgteejgeeiteelue
 dvkeffudekjeejheevleekgffggfekkedvhfeigefgnecukfhppeeltddrkeelrdeikedr
 jeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:cS14YMXUzTdBowrYSfLEjei6PiFGtwI3O-VMOT6vo6hU4TFAqNSUFA>
 <xmx:cS14YIUZM5SBd44C35C5zLJpteBvA1cVP2Ijbn6JUGLNlZ7hNg6S8w>
 <xmx:cS14YDfXrEmYGraHqP1oTbetImjVCJgJUkIsD5s1EFx0mhyLt0jD8A>
 <xmx:cy14YAcohhOpYwVsnWLcl5dxlgI1WdY1nQspks92REn_ktaUPQ48dg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B95F3240057;
 Thu, 15 Apr 2021 08:11:29 -0400 (EDT)
From: maxime@cerno.tech
Date: Thu, 15 Apr 2021 14:11:27 +0200
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device node
Message-ID: <20210415121127.igpedvc6sep5jqq5@gilmour>
65;6203;1cFrom: Maxime Ripard <maxime@cerno.tech>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-9-tzimmermann@suse.de>
 <20210408081353.ojt2kgnnbh6kp6gp@gilmour>
 <3c7bacd1-e40e-0953-9ad9-9f79274106d5@suse.de>
 <20210415092123.7zn6fbnkuqlajord@gilmour>
 <9b21042c-9908-3847-702a-cb891d1769e0@suse.de>
MIME-Version: 1.0
In-Reply-To: <9b21042c-9908-3847-702a-cb891d1769e0@suse.de>
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
Cc: bluescreen_avenger@verizon.net, geert+renesas@glider.be, corbet@lwn.net,
 airlied@linux.ie, emil.l.velikov@gmail.com, linux-doc@vger.kernel.org,
 lgirdwood@gmail.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1672990296=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1672990296==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xpknipqqoxatjl7s"
Content-Disposition: inline


--xpknipqqoxatjl7s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 15, 2021 at 01:02:44PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 15.04.21 um 11:21 schrieb Maxime Ripard:
> > Hi,
> >=20
> > On Thu, Apr 15, 2021 at 09:31:01AM +0200, Thomas Zimmermann wrote:
> > > Am 08.04.21 um 10:13 schrieb Maxime Ripard:
> > > > Hi,
> > > >=20
> > > > On Thu, Mar 18, 2021 at 11:29:19AM +0100, Thomas Zimmermann wrote:
> > > > > Make sure required hardware clocks are enabled while the firmware
> > > > > framebuffer is in use.
> > > > >=20
> > > > > The basic code has been taken from the simplefb driver and adapted
> > > > > to DRM. Clocks are released automatically via devres helpers.
> > > > >=20
> > > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
> > > >=20
> > > > Even though it's definitely simpler to review, merging the driver f=
irst
> > > > and then the clocks and regulators will break bisection on the plat=
forms
> > > > that rely on them
> > >=20
> > > I'd like to keep the patches separate for now, but can squash patches=
 6 to 8
> > > them into one before pushing them. OK?
> >=20
> > Yep, that works for me :)
> >=20
> > > >=20
> > > > Another thing worth considering is also that both drivers will prob=
e if
> > > > they are enabled (which is pretty likely), which is not great :)
> > > >=20
> > > > I guess we should make them mutually exclusive through Kconfig
> > >=20
> > > We already have several drivers in fbdev and DRM that handle the same
> > > hardware. We don't do this for any other pair, why bother now?
> >=20
> > Yeah, but simplefb/simpledrm are going to be enabled pretty much
> > everywhere, as opposed to the other drivers that are more specialized.
>=20
> Well, OK. But I'd like to give simpledrm preference over simplefb. There
> should be an incentive to switch to DRM.

Yeah that makes total sense :)

Maxime

--xpknipqqoxatjl7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYHgtbwAKCRDj7w1vZxhR
xXyxAQD+qBPDs5S8cLtsrSgQ8fpCjtSaiJZxGR5K8NPf4htoKQD9HGpx3iW6o2Y9
kRc9WTYIck5gl3qzTWqLhoat+5tLbQg=
=H9L5
-----END PGP SIGNATURE-----

--xpknipqqoxatjl7s--

--===============1672990296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1672990296==--
