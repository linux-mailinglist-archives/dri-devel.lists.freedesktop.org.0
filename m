Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F53624022
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 11:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A975910E6CB;
	Thu, 10 Nov 2022 10:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C97310E6C7;
 Thu, 10 Nov 2022 10:39:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id DA9A458056F;
 Thu, 10 Nov 2022 05:39:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 10 Nov 2022 05:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1668076756; x=1668083956; bh=PwYNjQU7tN
 1yo0q4sJyp8vj8McI2niUCJnvMpuBPHGk=; b=gMEwj1DG8zmPKzu0+yKVKH03Kx
 e61Uw+WzZJFD6Px2CZXRX4G8Zi1p345HVdtHMpL2qSi69lVddsisHKPl24rr+9bg
 lGvcm/6s4418rzGhOVzqyYFIRAfqd78jO6Nquvf7uftvHVkyzs/ZtUUHMAhZC+lY
 66vuWPK+QNeZS3cUQ+QsqHk1fz7JlL31pg0QxttYN1apTfI5afVpUdiyMT76DI26
 Jz+sxMXE0BWHJR/rncIveXM3JVcyfoRqdhrJh/PwseUOeQL9nj1B6dONJiZTxLho
 mUXnNvpd3chserPvH0/MJ+eV4zBNCHXdQV087G11xOMWGj0+VRhDikiOaMPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1668076756; x=1668083956; bh=PwYNjQU7tN1yo0q4sJyp8vj8McI2
 niUCJnvMpuBPHGk=; b=Xr8BzRZUhOldcOGwtNOHvI/a7uNK4UnnPClBS8k80w93
 xvmN0OyGFsgiH7IW0Tuj5UkmaBALc35OAZOOcZNJXjiuvH3xR60nmBg4PLwK9m0H
 hbF6oU9ObO0B70aOAlx5O/yR+ms5tfjoYBy9VmhFPZjgKXCloSMn2qnysTWCUd5A
 17gyfJJb4BD6sgVWQRF3ce+aQblKOswYUyCFH/tqMJLTGFiTldUr67P66ElddHbo
 vUy9W7UEQ9DuMz4b/BG3kjbrszywd1S5t1vghMPIug3cb8uEFCR8Uy3VuGxWzXOO
 /K2NCPzI5EtLZzEchkLyqu8gSeHN0k8GLSlmhpFVWQ==
X-ME-Sender: <xms:1NRsYwnt67HzpCUxoHKGa8GXVoYc0jqd9m1B9rObiYGWp6nFWOWUaQ>
 <xme:1NRsY_0erFK1brduwteUIU-Hp7-9iRiRnkQAIZcs6tjyrFUqzmUPO6_SwXPNWqDyM
 Sx0yIUgocFOwWfMkAg>
X-ME-Received: <xmr:1NRsY-rXvMVnrOmS6dMxDm_4zweyzwqx_V9Ql86FtDceeVgALEIxnaVTNEBp8-vDaCwvpCUm87TDgVbJcVCVbwsBv_4fq4C8s7leccFYHx4V7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:1NRsY8mW_xcrUMl01tyZqxps9tuooz_MljVOu7FQ0WdmWVhrvWN4Ig>
 <xmx:1NRsY-2N22RsUf6ge37Rj9ckd6OVr8ICkwnPyJy7goyIq8GIGFLJQw>
 <xmx:1NRsYzv4YBD0WjzP5ne_ugM6s3NalNJSVZ1o08jqUUR30dWn2lCMTA>
 <xmx:1NRsY-Xz9Dv9rc9zHRnMZ0u8zaBF9EgKO8EHviC-JajdS5vx-BSq0Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Nov 2022 05:39:15 -0500 (EST)
Date: Thu, 10 Nov 2022 11:39:14 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Lukas Satin <luke.satin@gmail.com>
Subject: Re: [Nouveau] [PATCH v7 22/23] drm/vc4: vec: Add support for more
 analog TV standards
Message-ID: <20221110103914.hsft4tacop6zerem@houat>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
 <20220728-rpi-analog-tv-properties-v7-22-7072a478c6b3@cerno.tech>
 <e0779ff5-3227-4a6f-1c0b-de2fbff99425@gmail.com>
 <CAEFVmOJ5A7+hUPwb3yUiVegJfUb_1-DGKu1YUCsF=hFTrjASzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tnzcub77xclkt633"
Content-Disposition: inline
In-Reply-To: <CAEFVmOJ5A7+hUPwb3yUiVegJfUb_1-DGKu1YUCsF=hFTrjASzA@mail.gmail.com>
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
 linux-sunxi@lists.linux.dev, intel-gfx@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org,
 kfyatek+publicgit@gmail.com,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--tnzcub77xclkt633
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2022 at 05:55:36PM +0100, Lukas Satin wrote:
> That's great, I will test it on Ubuntu + Nouveau x86_64 and Batocera-Linu=
x.
>=20
> I'm not interested in Raspberry Pi. I see you have some commit in
> RaspberryPi/Linux. Will this go to some Nouveau driver, so I can test it =
on
> x86_64 machine? I have some basic experience compiling Linux kernel (nvid=
ia
> driver) from 10 years ago.

Nouveau is only marginally affected by this patch series. It could
leverage the work done here, but it's not part of it and I won't plan to
work on it.

The RaspberryPi is mentioned because it's the platform that will benefit
the most from it, and the main target of that series.

> Scaling is not the way to go because I do this to not use scaling. I could
> use 640x480 and scale 320x240 to that mode, right? That is what old
> retrogaming laptop LCD screens do (you can even enable this in their BIOS=
).
>=20
> More appropriate is to preserve pixel ratio and have some border. So you
> mostly select the closest resolution and live with small border on the
> edge. Then you can crop it on analog TV using real world dials :-)
>=20
> I joined Nouveau developer list here. I don't know why we have like 40
> email recipients here and now we discuss Raspberry.

Nouveau is marginally affected by it, so its mailing list is in Cc.

Maxime

--tnzcub77xclkt633
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY2zU0gAKCRDj7w1vZxhR
xZhQAQD+sOJEZ9yfkJ4NAahLIHPffYnG8gECF9ErZ3fNxaAKmwEA6FT7zmjsIGCG
R+gFgqEc0dQ/i9Ysz13rPMufYrxEvww=
=62QM
-----END PGP SIGNATURE-----

--tnzcub77xclkt633--
