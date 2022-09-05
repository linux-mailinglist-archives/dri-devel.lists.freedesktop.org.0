Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCBC5AD594
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 16:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312AB10E3EF;
	Mon,  5 Sep 2022 14:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B032D10E3EF;
 Mon,  5 Sep 2022 14:57:35 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5A39E580222;
 Mon,  5 Sep 2022 10:57:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 05 Sep 2022 10:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1662389853; x=1662397053; bh=8QpD9QHWJ3
 ZAcUP/Du443zVv5hbNZSb8ty9lWaa/wGU=; b=lXM2P4WcRuf2ASsUJZF7RCJkH6
 Ylyv1uOXjUelst3OGCJ40g1RO9cicrzW0DqHtFx67qOZQepycOt7YODaS+Z3UCYU
 xiUPjSX+t7Za0NcWq3NcKWcgr7XHoRHPOkVrpkAaK9xqXD5Zgxq1foaua3jyn6b7
 0eyaPuCXIONCQMeka19bc7gavaKm7QF1uedVc/PdcQ6jwHF+aLi3pHsE253hFhqy
 EyD7BJb5w0faD7aDun6hDK9IKeDBA+AvggdMB52XffsrDNVrH8RSVaZVjphTLlM5
 i1Whk8kNZP7VMTZwHCjzwFUJ7wEm+xrlPVTUNsBErjzBZ9t3Wa0f+D3iSX7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1662389853; x=1662397053; bh=8QpD9QHWJ3ZAcUP/Du443zVv5hbN
 ZSb8ty9lWaa/wGU=; b=eJLuR+KUme8o4FRaICwZbGRxSjB3xBftb4Gb7nWDUB7U
 pv0r3P3krh6wz+XI/1n1JeQhUha+e0DnnieItY6gT2/1hAfhqeEAb5xQzjw7tOhm
 p20Evv6rotQicrPL8uugGearEiwZRoZv9qWmM8cgP2sQeK/Ik2l2DFFtBvXMXFTi
 8C9putitPMtDKOfGpGhtY9FkL7TYMVXdIkMkk3vyoypSETZDe9I5Z/tRVd+GzrGs
 fHEvHNzFhOu3/x+JSU/blWXyLOlVWvOMeSeDxsTt1yBbjlJQK7DhPbHIZ3k9weXd
 KarSty3ixWH8DcV4u6stghnOewWvxAQ1JwGFbyWWsg==
X-ME-Sender: <xms:XA4WY1fiBU1ECfDf7wmaBkisGTWTvm7s8Ies8w1PtVwZ1L5mbrQ8Fg>
 <xme:XA4WYzOlBXenNXjKDVayk8WfQRF-pGVRHZjdD5yUuhOozYNWUMIzSPZJ9cbsqMn64
 uuJQMDWlS14Mcixgjw>
X-ME-Received: <xmr:XA4WY-iANzxwUTMWFgq-LsGvxR8KKEHoPP9JzTnmgX7lfJfZ6fDaSPaiyxY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeliedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevuddthffgfeeiffejgfeghfeludegkedtgefgffejtdegtddvleduvdfh
 teehveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:XA4WY---Ncx0ZtdxgQEbadw4u4oWLWaa-7P65288auVolghcPBvPqg>
 <xmx:XA4WYxvKBL8vyFG3nWU1jEibhAPGnTExbgYL-TwX_LWRS97WjEKaHQ>
 <xmx:XA4WY9HraN7M_qm-dwOKPjrqnwiQ1TNB6MxGXaTCeKryw8hkBIhprw>
 <xmx:XQ4WYxdVilKmghQfD17Zzl66x1m1EWhGFxB48Aw90XtbjJoW3D6Qfw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Sep 2022 10:57:32 -0400 (EDT)
Date: Mon, 5 Sep 2022 16:57:29 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 00/41] drm: Analog TV Improvements
Message-ID: <20220905145729.ln675jko3aw6sgzs@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <24e09a29-6d04-3b1e-63ce-cd3c31d350e2@tronnes.org>
 <020d44e6-884b-a817-8265-3461638cac71@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fq3utlr2k6iltjfz"
Content-Disposition: inline
In-Reply-To: <020d44e6-884b-a817-8265-3461638cac71@tronnes.org>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fq3utlr2k6iltjfz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 02, 2022 at 01:28:16PM +0200, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 01.09.2022 21.35, skrev Noralf Tr=F8nnes:
> >=20
> >=20
> > I have finally found a workaround for my kernel hangs.
> >=20
> > Dom had a look at my kernel and found that the VideoCore was fine, and
> > he said this:
> >=20
> >> That suggests cause of lockup was on arm side rather than VC side.
> >>
> >> But it's hard to diagnose further. Once you've had a peripheral not
> >> respond, the AXI bus locks up and no further operations are possible.
> >> Usual causes of this are required clocks being stopped or domains
> >> disabled and then trying to access the hardware.
> >>
> >=20
> > So when I got this on my 64-bit build:
> >=20
> > [  166.702171] SError Interrupt on CPU1, code 0x00000000bf000002 -- SEr=
ror
> > [  166.702187] CPU: 1 PID: 8 Comm: kworker/u8:0 Tainted: G        W
> >     5.19.0-rc6-00096-gba7973977976-dirty #1
> > [  166.702200] Hardware name: Raspberry Pi 4 Model B Rev 1.1 (DT)
> > [  166.702206] Workqueue: events_freezable_power_ thermal_zone_device_c=
heck
> > [  166.702231] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS
> > BTYPE=3D--)
> > [  166.702242] pc : regmap_mmio_read32le+0x10/0x28
> > [  166.702261] lr : regmap_mmio_read+0x44/0x70
> > ...
> > [  166.702606]  bcm2711_get_temp+0x58/0xb0 [bcm2711_thermal]
> >=20
> > I wondered if that reg read was stalled due to a clock being stopped.
> >=20
> > Lo and behold, disabling runtime pm and keeping the vec clock running
> > all the time fixed it[1].
> >=20
> > I don't know what the problem is, but at least I can now test this patc=
hset.
> >=20
> > [1] https://gist.github.com/notro/23b984e7fa05cfbda2db50a421cac065
> >=20
>=20
> It turns out I didn't have to disable runtime pm:
> https://gist.github.com/notro/0adcfcb12460b54e54458afe11dc8ea2

If the bcm2711_thermal IP needs that clock to be enabled, it should grab
a reference itself, but it looks like even the device tree binding
doesn't ask for one.

Maxime

--fq3utlr2k6iltjfz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxYOWQAKCRDj7w1vZxhR
xZXhAP94pqs+pj7lGSsjwlmP/UEuFHEg9U2CXHj8wPM/2qMMIgEAnt6LqzGRnWKu
1s/dJJP8pFIF3pOYAXRfYltS8OWIzAs=
=ha9g
-----END PGP SIGNATURE-----

--fq3utlr2k6iltjfz--
