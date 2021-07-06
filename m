Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4783BDB88
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 18:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72D16E52D;
	Tue,  6 Jul 2021 16:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197936E52D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 16:42:52 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id ED38358067B;
 Tue,  6 Jul 2021 12:42:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 06 Jul 2021 12:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=W6MiHashvxzD/kAAuIZVKo84DZ9
 qBLQd+rtHQpbZp+k=; b=WSiVy/c9f09jEvWIJfqbqBgsWevGwvK9n2/rTMHB+vE
 JpHiqjtrBRvzPD1hT/djwShgO3S8n3ETfRxJMJnH4Ezn/vnuLLkZmixLZOiWOe50
 UsZfDmbDnjOiWV/JGEDOpj1idsuG9rp7XyzyawWnZCmv1Fes1wjCutLqze5IABej
 BGySBCMNVSFsEH2TzuhhHmUvk5abdWS7LjmWqdzAGkWPLuvTeI/Nams/ip9gGmQD
 1uNh7A+xok91QJKn10j+vyb9UwgyNPyR/1hS3AOM0KBV15aKTYeWopFcQbzAczGw
 MkDDSSKR4aOusL9d+yn4cb5qAfymx+ceaepIm5P8STg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=W6MiHa
 shvxzD/kAAuIZVKo84DZ9qBLQd+rtHQpbZp+k=; b=g/Flbq0X6XVSy4U3baetcW
 Az1gWDb13P3UX3yuHGec9m/IMVQTu041WErhz5XoApUwwvQPL3i1unCWoYQqgYKa
 HOnsSZ7e35fTbeXyK8/rs+ZKShIe38EpzawhU7xE2MtYsBIv+Aprt5arcuW8qnpa
 ++mEwRNM5fCuTWIWp6bNnR0MQ5objpoO7xOC+XRIWvaSALNYBPAkkPF1jXtgpoLL
 gRrQeypbi0dkWxxsITPg+SURmzFC4ekq7sRw9ngK7JeI1IMz20cV0unmwV+UAzVI
 esK8Qd+4ZVxJNR70OB0zfp4iJSHEcfD5IAAwnxUu/LUZu48y1vOLaI+3OAZ641Cg
 ==
X-ME-Sender: <xms:BYjkYF9C0T-kkJ55smEuYZ_DPYFcB7Ey6N6D-Vj77Os-tUY3B2IuUg>
 <xme:BYjkYJu4RAcNYSmNHW1Fh8a7X09S7i1kQx6MwPybfx1WWkZbYTrAanXilw5rPeZMb
 Idzs_6dPnuBk8HHguo>
X-ME-Received: <xmr:BYjkYDA0YmYtJAYOjPLSSmaxEmEKfXQWgU1R8Z4Czcz0na-e-UWrMxdjgBPQM1t6KK_oFVekvhu3qQGef9CrixjTZDiOBbOeZmLh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddtgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:BYjkYJfE1tM3iIjrOtVS5ulonqYccyRikn2OLMadvMOmaBl78bbfjA>
 <xmx:BYjkYKMiiZBvQptwCdQugJePmrPNv_CCGPPlzvNufGIbm4LCr-TdQg>
 <xmx:BYjkYLnNrIhbXpItOoJrL-l7AMf9yI4mCY1qoTCXCoO3EYw_Bgfh1w>
 <xmx:C4jkYHiemC-bj8ET9Yu7K5Qeza8pRcfANpAGmMoMGkZm0H1eMGSY6w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 12:42:44 -0400 (EDT)
Date: Tue, 6 Jul 2021 18:42:41 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v4] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210706164241.ghd56546murmwnit@gilmour>
References: <20210616143842.632829-1-maxime@cerno.tech>
 <20210617112036.7373fdab@eldfell>
 <20210706085202.6o4fapfmq7osj5wf@gilmour>
 <20210706123723.6194abc5@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6mnf4r7jxmdwlw7k"
Content-Disposition: inline
In-Reply-To: <20210706123723.6194abc5@eldfell>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Edmund Dea <edmund.j.dea@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Steven Price <steven.price@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jerome Brunet <jbrunet@baylibre.com>, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marex@denx.de>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Qiang Yu <yuq825@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kevin Hilman <khilman@baylibre.com>, Tomi Valkeinen <tomba@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chen Feng <puck.chen@hisilicon.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Ben Skeggs <bskeggs@redhat.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Roland Scheidegger <sroland@vmware.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Huang Rui <ray.huang@amd.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Robert Foss <robert.foss@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6mnf4r7jxmdwlw7k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 12:37:23PM +0300, Pekka Paalanen wrote:
> > > > +- It must provide a generic helper in the core code to register th=
at
> > > > +  property on the object it attaches to.
> > > > +
> > > > +- Its content must be decoded by the core and provided in the obje=
ct's
> > > > +  associated state structure. That includes anything drivers might=
 want to
> > > > +  precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` =
for planes.
> > > > +
> > > > +- An IGT test must be submitted where reasonable. =20
> > >=20
> > > Would it be too much to replace "where reasonable" with "if it is at
> > > all possible to write a test."?
> > >  =20
> > > > + =20
> > >=20
> > > How about adding the following somewhere?
> > >=20
> > > - The initial state of the property (set during driver initialization)
> > >   must match how the driver+hardware behaved before introducing this
> > >   property. It may be some fixed value or it may be inherited from e.=
g.
> > >   the firmware that booted the system. How the initial state is
> > >   determined must also be documented, that is, where does it come fro=
m.
> > >=20
> > > The initial state must not be called "default", because I want to
> > > reserve the term default for something else if possible: the phrase
> > > "reset everything to defaults", which is a whole another discussion. =
=20
> >=20
> > I've taken into account your previous comments, thanks
> >=20
> > > How about also saying that fbcon/fbdev must set this property when
> > > taking over? That sounds to be like a common omission leading to funky
> > > KMS state in fbcon. The value fbdev sets it to only needs to make
> > > sense to fbdev, and it does not need to be ~~the initial value~~ nor =
the
> > > default value. Or are we hoping to kill fbcon in favor of a userspace
> > > kmscon soon? ;-)
> > >=20
> > > Ooh, maybe the KMS property documentation should also say what value
> > > fbdev will set the property to. That's kind of UABI, because userspace
> > > probably implicitly relies on it in many cases. ...which means fbdev
> > > should set the property to its initial value, otherwise userspace will
> > > break. =20
> >=20
> > I'm not sure about this one: fbdev and fbcon are still optional features
> > of the kernel and can be disabled at the user discretion. Having any
> > part of the user-space rely on the fbdev behavior seems a bit broken,
> > especially when we have a mechanism to retrieve the state when the
> > application starts.
>=20
> yes, exactly that is why fbdev/fbcon should reset the properties to
> their initial values. You would not want userspace inheriting a
> different KMS state with vs. without fbcon when it starts.

I'm not sure I'm following you when fbdev/fbcon should reset these
properties. When a master takes over?

If we consider fbdev as any KMS client, isn't it a fundamental change
with how it's currently done? I haven't seen anywhere that a compositor
(or any client for that matter) should put the KMS device in the same
state that it started it with. In case of a crash it would be fairly
difficult to achieve.

> Retrieving the current KMS state is useless if the current KMS state is
> somehow wonky and the application does not understand that specific KMS
> property that is wonky. It cannot set the property to any value other
> than it already had without user intervention.

Yeah, that's true. But the same could be said if you switch from one
client to the other for example, at the moment there's no guarantee that
the first one didn't change a property to a value you don't expect in
the second. Unless we manage to tie that somehow to a first open of the
device?

> I'd say fbcon causing all KMS state to be reset is a quality of life
> thing. It's possible to live without by rebooting, but it would
> certainly make at least developers' and testers' life easier until we
> get the real "reset KMS" knob (which fbcon could then use too).
>=20
> Besides, even if it is broken for userspace to rely on the KMS state
> set by fbcon/fbdev, userspace is already doing that and not on purpose
> because new KMS properties get added in the kernel. I would bet that
> there is not a single userspace program that would actually set all KMS
> properties that drivers might expose. So they are depending on
> inherited KMS state, which could be left by driver initialization, by
> fbdev/fbcon, or by any other userspace.
>=20
> But yeah, this idea is something new, so don't let this discussion
> delay landing the docs.

Ack, I've sent a new version

Thanks!
Maxime

--6mnf4r7jxmdwlw7k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYOSIAQAKCRDj7w1vZxhR
xeGIAQDQjE0uYmon9Dox/R5r6J52+sVxI4/gu/mKcrS9FvJK+AEA4LtY+76pkQ6H
mgjpDIZUwacg76LQhv7Lzl+/nCA0/ww=
=XDM3
-----END PGP SIGNATURE-----

--6mnf4r7jxmdwlw7k--
