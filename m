Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D7D5B0113
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 11:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5220C10E4F4;
	Wed,  7 Sep 2022 09:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC2C410E4D6;
 Wed,  7 Sep 2022 09:58:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5EA2F2B059D4;
 Wed,  7 Sep 2022 05:58:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 07 Sep 2022 05:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1662544732; x=1662551932; bh=LDbKEsPtEf
 o0fSrPBtti05cmeMd5jnUlKEOcotKaSo4=; b=EXe+ynfe6vqHN43swOtykOC2Ct
 uBkougsWyb9Gz9Yz4t6xtOXI72Iy/O5yYrXo+DBTDGNXxul0ebfkTVZMiYl+Kt/C
 RtpN5Lozu8dtEN4O8yx0EK4S4KNFAsjLumNAC2ObZ/IM6gHiaCKGMIb0sRaOh8de
 MnRVw8qAcAY2oGvUQSZ4IMLVehnSaNQNGItvETIULd/aEK7fWFBQPms2DsbU0XQp
 ErTC1E2CGjFAV0Fj4vwOnwwjw7Whw3zyd8lgoBcRK+x6tjCXEvMZ7Ng2+Oet3ALh
 qzKOWW02KFjsDosfRoB/u2/Ux7V+Ho/gemKefjzU75NX7Fk8asA5RNOcVEUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1662544732; x=1662551932; bh=LDbKEsPtEfo0fSrPBtti05cmeMd5
 jnUlKEOcotKaSo4=; b=W7FoYKQ4vh4JAjO+VVj2d/KTm16IiJZNZdq9LXTgqgtQ
 t9Rbizu4VEj/S4fOxiSbz6+Z2tpIQd8wC8qQq5TWtVj28LKmgl3ifAhYru/r6eci
 z1M7ATIVb3UlgdYN8Kwmxq6QbLuzIHQrXBf+5yxpv33Yg4JEldWISKcPYKbgrDUQ
 3WZuWBIT4XwBMJzeX0GnJd4QVcXPmJsMoxsr1NiQl2SyZORrtCJAIFAYjhomNmJ5
 JkP8dSJs/6WFRM0y/aBAgzyCSKm/0F0fJYNGaMB4ie6rQ1PjPSLe0aFuITGBmcyD
 1SCGLo3ZAqJ88e0nvhG0Sd2uczq8k08Dj/jrWCvoZg==
X-ME-Sender: <xms:XGsYY6S6Unf05Ux7EeXWosbmBCQrWexsEhLyFWerP7--z65MfWhekg>
 <xme:XGsYY_zrDrGlPY7_tG5XsdLoI5rl2Mph9Icxow7udrBgcSPA1LDHZNdApaoAW3e0r
 dNZCBel3OfArF_XCXM>
X-ME-Received: <xmr:XGsYY306D9dvzKGYL5VBDkFegfjmi41hvSTbO7IYVRbsRBLwk4ykAtH3xxg->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeevuddthffgfeeiffejgfeghfeludegkedtgefgffejtdegtddvleduvdfh
 teehveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:XGsYY2ChJ9bThNgL4kEeg1WjPtnTGDuEfX0G6vrd4LNllKgcAaW6Hg>
 <xmx:XGsYYzi6nwq4Mwx4T3SErnV9u--G-Z-E2nghFzehs8FPRRT4kkz1_Q>
 <xmx:XGsYYyo218MlI5Wiu1MgPmnxLYxtVwMOe6ydE6LUHZTCYG3D1fCnIw>
 <xmx:XGsYY_C_UZtCfR0nP5pwZsMq51PV4Gu8iNV88j3038cccoGHrGgJOdrQSJ0>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Sep 2022 05:58:51 -0400 (EDT)
Date: Wed, 7 Sep 2022 11:58:49 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Subject: Re: [PATCH v2 00/41] drm: Analog TV Improvements
Message-ID: <20220907095849.5v72atwuedl5iiva@houat>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <24e09a29-6d04-3b1e-63ce-cd3c31d350e2@tronnes.org>
 <020d44e6-884b-a817-8265-3461638cac71@tronnes.org>
 <20220905145729.ln675jko3aw6sgzs@houat>
 <74c10e51-4034-a284-1a26-b7ba7fe45fbe@tronnes.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g7pwsshhuvzfcxhg"
Content-Disposition: inline
In-Reply-To: <74c10e51-4034-a284-1a26-b7ba7fe45fbe@tronnes.org>
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


--g7pwsshhuvzfcxhg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 05, 2022 at 05:17:18PM +0200, Noralf Tr=F8nnes wrote:
> Den 05.09.2022 16.57, skrev Maxime Ripard:
> > On Fri, Sep 02, 2022 at 01:28:16PM +0200, Noralf Tr=F8nnes wrote:
> >>
> >>
> >> Den 01.09.2022 21.35, skrev Noralf Tr=F8nnes:
> >>>
> >>>
> >>> I have finally found a workaround for my kernel hangs.
> >>>
> >>> Dom had a look at my kernel and found that the VideoCore was fine, and
> >>> he said this:
> >>>
> >>>> That suggests cause of lockup was on arm side rather than VC side.
> >>>>
> >>>> But it's hard to diagnose further. Once you've had a peripheral not
> >>>> respond, the AXI bus locks up and no further operations are possible.
> >>>> Usual causes of this are required clocks being stopped or domains
> >>>> disabled and then trying to access the hardware.
> >>>>
> >>>
> >>> So when I got this on my 64-bit build:
> >>>
> >>> [  166.702171] SError Interrupt on CPU1, code 0x00000000bf000002 -- S=
Error
> >>> [  166.702187] CPU: 1 PID: 8 Comm: kworker/u8:0 Tainted: G        W
> >>>     5.19.0-rc6-00096-gba7973977976-dirty #1
> >>> [  166.702200] Hardware name: Raspberry Pi 4 Model B Rev 1.1 (DT)
> >>> [  166.702206] Workqueue: events_freezable_power_ thermal_zone_device=
_check
> >>> [  166.702231] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS
> >>> BTYPE=3D--)
> >>> [  166.702242] pc : regmap_mmio_read32le+0x10/0x28
> >>> [  166.702261] lr : regmap_mmio_read+0x44/0x70
> >>> ...
> >>> [  166.702606]  bcm2711_get_temp+0x58/0xb0 [bcm2711_thermal]
> >>>
> >>> I wondered if that reg read was stalled due to a clock being stopped.
> >>>
> >>> Lo and behold, disabling runtime pm and keeping the vec clock running
> >>> all the time fixed it[1].
> >>>
> >>> I don't know what the problem is, but at least I can now test this pa=
tchset.
> >>>
> >>> [1] https://gist.github.com/notro/23b984e7fa05cfbda2db50a421cac065
> >>>
> >>
> >> It turns out I didn't have to disable runtime pm:
> >> https://gist.github.com/notro/0adcfcb12460b54e54458afe11dc8ea2
> >=20
> > If the bcm2711_thermal IP needs that clock to be enabled, it should grab
> > a reference itself, but it looks like even the device tree binding
> > doesn't ask for one.
> >=20
>=20
> The first thing I tried was to unload the bcm2711_thermal module before
> running modeset and it still hung, so I don't think that's the problem.

Ack. Just to confirm, is this happening on mainline or on the downstream tr=
ee?

Maxime

--g7pwsshhuvzfcxhg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYxhrWQAKCRDj7w1vZxhR
xWOGAQDamcTrLkeNib2/AJ9OVJ5kvT4+VK4EmtvGcxdtuZTUhQD/SHMi1WIJ+4PA
xhpQO1fhUdfbEHo8tJ554frAHeuSGgA=
=e7c7
-----END PGP SIGNATURE-----

--g7pwsshhuvzfcxhg--
