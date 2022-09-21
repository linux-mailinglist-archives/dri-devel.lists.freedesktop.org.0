Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E91EE5BFF7E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 16:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED3210E96C;
	Wed, 21 Sep 2022 14:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6BB10E46A;
 Wed, 21 Sep 2022 14:03:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id B35C3581D3E;
 Wed, 21 Sep 2022 10:03:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 21 Sep 2022 10:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1663769010; x=1663776210; bh=SjCV1aL+n8
 mn4MalH4ZLXgXlFA2w5RWP6Yn0pmJfmvo=; b=f34NjqNDiMXQlvOtdR+IEK/N60
 M8qCLSQ1LNbCdB8Kg0iWuG8e6JMGZAws9tXdbB/hfBTKuJzqox3UQ3PKSWcng5im
 LyjQtwLbEyDfzqt8b8RPOm1EjECy98daoKd9HmvCFtaKlRGxZbNU2nlvxydTdXDm
 k/elnCmCxGYV5BcOjqP58PAHQIJ/vP/xX0GAb560tuw0hAE7gTJ0OHQP3PfwdBl5
 IGxGH5nyCYAY0+Nb8Zv+XfCzbGT+/zx8mlkfIXvG50ILvs0spro1yVtet1ETHxGc
 hS0vaRMPf+M+1KiVR6KWrqtE+jgrHJIvU/2B+paJ9AJqGCbSEaZMeSDCgRDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1663769010; x=1663776210; bh=SjCV1aL+n8mn4MalH4ZLXgXlFA2w
 5RWP6Yn0pmJfmvo=; b=0+pEkgbdgqPT7ximSdQZLog67+grue8Hi6koY6gk8/U8
 fCrktc1/JQNviSaxMUEdSAQnSf/HndJbgnH5QXZ0rOunwYbjeYB15JGbvxWmxvGg
 VjAxwEaJd7b5Qw1ijt1cJjKKnb9K/VJLdXnSdLrNV3O1Dbq5xoe5LqdliA/w6UiX
 pcHWQXjQTz6D1Wd1C10ma63C/DBdp6aZ1XW7Qi1q9sIoS6hKzxRXIZCC9EOtt+rY
 fe000jaaNNkQQMwdjb+ohHvKIJ1s4VFcJsPUYqSygaqncCDjAyaBlCMAGO/Rsdm/
 Tw72vi5wtdGIjONUed4cVTX0N5bCqGp5QsHJ/zQnuw==
X-ME-Sender: <xms:sBkrY3Zc2mmCQZ3F3STmdk-hWC79v--7_MlCdg57msasm3hrnKj6Gg>
 <xme:sBkrY2Z-yRmrAmBFpOOeX8m4FJjz3LzjVQ_jk7yv0esDt84iQVVPOHj19Sk_PDzQJ
 cMShLmFklZda1FEzKE>
X-ME-Received: <xmr:sBkrY5_NwvOKk7lJMPBMaCjJSkOMm3qbytB9pxoVtJWqUDrFlIV8W-saGe0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefuddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevuddthffgfeeiffejgfeghfeludegkedtgefgffejtdegtddvleduvdfh
 teehveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:sBkrY9rSJYSj8MuT99VnZo31roZHnay2y67VJzgcjetJ7tspID5EIQ>
 <xmx:sBkrYypnxugNjzejH0MRV8gb-0_g-eWne_PJrQcIIbnNd6CpSXEHhg>
 <xmx:sBkrYzRFyGQSlCHebOYmVx5k5a8GwAMUV6CAiictE0goKTb_gJD20g>
 <xmx:shkrY6GJGnVQrhQG_9cv0ekwJ1qgNXTe0U_zdr_SwRKKPt4rxbuA9w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Sep 2022 10:03:27 -0400 (EDT)
Date: Wed, 21 Sep 2022 16:03:24 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 00/41] drm: Analog TV Improvements
Message-ID: <20220921140324.sbeadfr7kz4avqcr@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <24e09a29-6d04-3b1e-63ce-cd3c31d350e2@tronnes.org>
 <020d44e6-884b-a817-8265-3461638cac71@tronnes.org>
 <20220905145729.ln675jko3aw6sgzs@houat>
 <965de5c0-bc6a-7210-c946-b916ae2219fc@i2se.com>
 <eb06337b-d501-3ca7-0e50-eda3aec75683@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6coko5gqdpzknuh6"
Content-Disposition: inline
In-Reply-To: <eb06337b-d501-3ca7-0e50-eda3aec75683@tronnes.org>
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
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <stefan.wahren@i2se.com>,
 Emma Anholt <emma@anholt.net>, Samuel Holland <samuel@sholland.org>,
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


--6coko5gqdpzknuh6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 06:44:53PM +0200, Noralf Tr=F8nnes wrote:
>=20
>=20
> Den 07.09.2022 12.36, skrev Stefan Wahren:
> > Hi Maxime,
> >=20
> > Am 05.09.22 um 16:57 schrieb Maxime Ripard:
> >> On Fri, Sep 02, 2022 at 01:28:16PM +0200, Noralf Tr=F8nnes wrote:
> >>>
> >>> Den 01.09.2022 21.35, skrev Noralf Tr=F8nnes:
> >>>>
> >>>> I have finally found a workaround for my kernel hangs.
> >>>>
> >>>> Dom had a look at my kernel and found that the VideoCore was fine, a=
nd
> >>>> he said this:
> >>>>
> >>>>> That suggests cause of lockup was on arm side rather than VC side.
> >>>>>
> >>>>> But it's hard to diagnose further. Once you've had a peripheral not
> >>>>> respond, the AXI bus locks up and no further operations are possibl=
e.
> >>>>> Usual causes of this are required clocks being stopped or domains
> >>>>> disabled and then trying to access the hardware.
> >>>>>
> >>>> So when I got this on my 64-bit build:
> >>>>
> >>>> [=A0 166.702171] SError Interrupt on CPU1, code 0x00000000bf000002 --
> >>>> SError
> >>>> [=A0 166.702187] CPU: 1 PID: 8 Comm: kworker/u8:0 Tainted: G=A0=A0=
=A0=A0=A0=A0=A0 W
> >>>> =A0=A0=A0=A0 5.19.0-rc6-00096-gba7973977976-dirty #1
> >>>> [=A0 166.702200] Hardware name: Raspberry Pi 4 Model B Rev 1.1 (DT)
> >>>> [=A0 166.702206] Workqueue: events_freezable_power_
> >>>> thermal_zone_device_check
> >>>> [=A0 166.702231] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SS=
BS
> >>>> BTYPE=3D--)
> >>>> [=A0 166.702242] pc : regmap_mmio_read32le+0x10/0x28
> >>>> [=A0 166.702261] lr : regmap_mmio_read+0x44/0x70
> >>>> ...
> >>>> [=A0 166.702606]=A0 bcm2711_get_temp+0x58/0xb0 [bcm2711_thermal]
> >>>>
> >>>> I wondered if that reg read was stalled due to a clock being stopped.
> >>>>
> >>>> Lo and behold, disabling runtime pm and keeping the vec clock running
> >>>> all the time fixed it[1].
> >>>>
> >>>> I don't know what the problem is, but at least I can now test this
> >>>> patchset.
> >>>>
> >>>> [1] https://gist.github.com/notro/23b984e7fa05cfbda2db50a421cac065
> >>>>
> >>> It turns out I didn't have to disable runtime pm:
> >>> https://gist.github.com/notro/0adcfcb12460b54e54458afe11dc8ea2
> >> If the bcm2711_thermal IP needs that clock to be enabled, it should gr=
ab
> >> a reference itself, but it looks like even the device tree binding
> >> doesn't ask for one.
> > The missing clock in the device tree binding is expected, because
> > despite of the code there is not much information about the BCM2711
> > clock tree. But i'm skeptical that the AVS IP actually needs the VEC
> > clock, i think it's more likely that the VEC clock parent is changed and
> > that cause this issue. I could take care of the bcm2711 binding & driver
> > if i know which clock is really necessary.
>=20
> Seems you're right, keeping the parent always enabled is enough:
>=20
> 	clk_prepare_enable(clk_get_parent(vec->clock)); // pllc_per
>=20
> I tried enabling just the grandparent clock as well, but that didn't help.

Yeah, adding tracing to the clock framework shows that it indeed
disables PLLC_PER. So there's probably some other device that depends on
it but doesn't take a reference to it.

I had a look, but it's not really obvious what that might be.

This patch makes sure that the PLL*_PER are never disabled, could you
test it? It seems to work for me.


diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 48a1eb9f2d55..3839261ee419 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1675,7 +1675,7 @@ static const struct bcm2835_clk_desc clk_desc_array[]=
 =3D {
 		.load_mask =3D CM_PLLA_LOADPER,
 		.hold_mask =3D CM_PLLA_HOLDPER,
 		.fixed_divider =3D 1,
-		.flags =3D CLK_SET_RATE_PARENT),
+		.flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
 	[BCM2835_PLLA_DSI0]	=3D REGISTER_PLL_DIV(
 		SOC_ALL,
 		.name =3D "plla_dsi0",
@@ -1784,7 +1784,7 @@ static const struct bcm2835_clk_desc clk_desc_array[]=
 =3D {
 		.load_mask =3D CM_PLLC_LOADPER,
 		.hold_mask =3D CM_PLLC_HOLDPER,
 		.fixed_divider =3D 1,
-		.flags =3D CLK_SET_RATE_PARENT),
+		.flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),

 	/*
 	 * PLLD is the display PLL, used to drive DSI display panels.
@@ -1891,7 +1891,7 @@ static const struct bcm2835_clk_desc clk_desc_array[]=
 =3D {
 		.load_mask =3D CM_PLLH_LOADAUX,
 		.hold_mask =3D 0,
 		.fixed_divider =3D 1,
-		.flags =3D CLK_SET_RATE_PARENT),
+		.flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
 	[BCM2835_PLLH_PIX]	=3D REGISTER_PLL_DIV(
 		SOC_BCM2835,
 		.name =3D "pllh_pix",


Maxime

--6coko5gqdpzknuh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYysZrAAKCRDj7w1vZxhR
xYouAQCzedVE8SevoxP631JtGSdk1hKiDSM7W5u5fI6bk8XEbwEAiGbnl7UDk3zF
vgobikzXCdP494qgxQLaLW/GmvhxFAQ=
=/MQ7
-----END PGP SIGNATURE-----

--6coko5gqdpzknuh6--
