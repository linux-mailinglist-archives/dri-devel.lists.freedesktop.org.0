Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7538D3BE88E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 15:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6A86E135;
	Wed,  7 Jul 2021 13:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DFD6E135
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 13:12:05 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id DA7D65C0057;
 Wed,  7 Jul 2021 09:12:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 07 Jul 2021 09:12:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=2L7T7FcpOo+kWumNw1tSe4PMhwp
 xT/cZQE9Z7yVQPik=; b=KhAjocZs6Gsfsf+LauqbgSx0YT0bvJvttJGBE49r/ba
 VsOZf7HVbhl7VnXTXguDysJdx4zjNh8Vu4tEaiXqeVNpugGnr0PDqiMwf5x+PQ4b
 imPavXotoY4esYaJb5v8bwEk3q3qP+8zSAjryQ8XHxGZqj4YBrPahkQ5ORs/vLkd
 WFkkCqwaJ8AhBLzUnqRpBudvqpk9VG7NQWNufH7ECm+dDOCag30Q8hxff3u5HBxa
 Sn9pLkA0gJTbDtrZhyDHb4rX1n8CjsRGnwZylR7DXSH73Qec/RmfX0Jirfl3UBKN
 8hc6QH147lk3lXgyoWKgJuKEZOkrtxmC8HfA1n9FY1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2L7T7F
 cpOo+kWumNw1tSe4PMhwpxT/cZQE9Z7yVQPik=; b=KByVb89fDq23V5zyjuaZsB
 9lWjYOTi1GI2M1Ic9Uzi1IPDMVDSxiJ0B32LuKbSdtQjCQrej/MhlcpyNjp91Yay
 Zn9SW1oiXGn8vBddFvUNixCFniE5UynWH2JYp9dc6PHy5g6Cs3Gzr5RV5EYfDZ+g
 vwRdA1wFSt3s8SHrMPNNc51vazy2ohVJbg3tq6QvF2b6G4raKnvcxLSQzbZHaG5r
 W62inf6bQYdevgQ816tHSF94U3Li0uYzLA2eLOa2mV6ayHVeUrTILufCL53yv1sL
 RCvca0mwu+sWE90KDYU1GHCtPiukJqyuQVird+ZWuCnisdDj0OIEwBAxu3Nr39PA
 ==
X-ME-Sender: <xms:H6jlYDBYK7k9VBWi4_o9dCm12TMF04PCHwslsgiXaqp7qap7AreNCQ>
 <xme:H6jlYJjI5fyve9U3X_1jLcHZqf9t8hIfaJpdYcWM_gpgCFhLsTZHsip9h4-TWDBku
 z4m3QEtsyNu--gZnEU>
X-ME-Received: <xmr:H6jlYOlQj9MmYt6JqBXCAMDwhR2JOs3D-GzvYjuNRXmc0Zd58D3b8tgzOofzv1GryME6_-5-uFc8jY_-usb7N7YB30-D9oT1kNrC>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevveefffduveeitdegtefhhfetueffteefffdvheevvdehteethedvleffgfej
 vdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:IKjlYFw1ZsAFm8XNDzHjm6eujAKiQYqFeD-81O4_OCbRoTUVRjeNyg>
 <xmx:IKjlYIQkifRSnGXzo25ANlVYJ1x-KhDb-WM2wp7GRgw_IAmkOwpjTQ>
 <xmx:IKjlYIbAyfez5kiSp5vuJFtAw_hDvgeDu1_w_TbUxOXWG-TNdp1Pxg>
 <xmx:IKjlYHEp3_vZTFaNA4DGLLU2gu3VNXyVHD0U1Llj_ObrVCA1yPwDJg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 09:11:59 -0400 (EDT)
Date: Wed, 7 Jul 2021 15:11:56 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH RFC] drm/vc4: hdmi: Fix connector detect logic
Message-ID: <20210707131156.4wo52roj4h5bg2f6@gilmour>
References: <1625520994-11065-1-git-send-email-stefan.wahren@i2se.com>
 <20210706095807.abx3v4wkc7ymwhjx@gilmour>
 <1ecde64b-3c91-dac6-e8e2-64a45022a40e@i2se.com>
 <20210706132131.4bylrs5u2xmypjcy@gilmour>
 <0ca8564a-03b8-e13f-b4c2-468bac877e4f@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m7jz3gl3ufqgfh7q"
Content-Disposition: inline
In-Reply-To: <0ca8564a-03b8-e13f-b4c2-468bac877e4f@i2se.com>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--m7jz3gl3ufqgfh7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2021 at 05:45:27PM +0200, Stefan Wahren wrote:
> Hi Maxime,
>=20
> Am 06.07.21 um 15:21 schrieb Maxime Ripard:
> > Hi Stefan,
> >
> > On Tue, Jul 06, 2021 at 12:48:05PM +0200, Stefan Wahren wrote:
> >> Am 06.07.21 um 11:58 schrieb Maxime Ripard:
> >>> Hi,
> >>>
> >>> On Mon, Jul 05, 2021 at 11:36:34PM +0200, Stefan Wahren wrote:
> >>>> Commit "drm/vc4: hdmi: Convert to gpiod" changes the behavior of
> >>>> vc4_hdmi_connector_detect() which results into CPU hangs in case the=
re
> >>>> is no HDMI connected. Let's restore the old behavior.
> >>>>
> >>>> Reported-by: Nathan Chancellor <nathan@kernel.org>
> >>>> Reported-by: Ojaswin Mujoo <ojaswin98@gmail.com>
> >>>> Fixes: 6800234ceee0 ("drm/vc4: hdmi: Convert to gpiod")
> >>>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> >>> I already sent this patch last week:
> >>>
> >>> https://lore.kernel.org/dri-devel/20210628124257.140453-3-maxime@cern=
o.tech/
> >> oops, i only looked in the July archive.
> >>
> >>> I'm not entirely sure how this could create a CPU hang though. Withou=
th
> >>> this patch, if the HPD GPIO is low, we would first try to retrieve the
> >>> EDID, and then if it doesn't we would read the hotplug register.
> >> Yes, the real issue has been revealed by the original change and this
> >> patch only "hides" it again.
> >>> The first is using a separate i2c controller (and even if it was in t=
he
> >>> same power domain, we have the pm_runtime_resume call), and the regis=
ter
> >>> read should be fine too?
> >> Sorry, i don't have a clue and time for further investigations.
> >>
> >> Does it mean, you are not able to reproduce this issue?
> > On next-20210706 at least it works fine for me without an HDMI monitor
> > connected, yes:
>=20
> which configuration do you use? Did you tried arm/multi_v7_defconfig?
>=20
> I tried yesterday mainline ("a180bd1d7e16173d965b263c5a536aa40afa2a2a")
> with multi_v7_defconfig and the issue was there.

I can't boot multi_v7_defconfig on my setup, but I just tested multi_v7
+ a few options (UART, ethernet) built-in to be able to boot, and I
can't reproduce what you're seeing. It boots just fine without any
monitor attached.

Maxime

--m7jz3gl3ufqgfh7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYOWoHAAKCRDj7w1vZxhR
xR6lAQCc6CflH7uk62lELKg+M/QEdgs69SOsyGfLAQNRykE4zQD/eYtIOJlD+FCH
ve35t5+SgQ2eHLJqNxBSea6h3qahjAw=
=0yNh
-----END PGP SIGNATURE-----

--m7jz3gl3ufqgfh7q--
