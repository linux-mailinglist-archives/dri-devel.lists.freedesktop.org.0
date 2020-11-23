Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762462C1F88
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0A56E24E;
	Tue, 24 Nov 2020 08:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A704C897B4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 16:59:52 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id C342A1B18;
 Mon, 23 Nov 2020 11:59:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 23 Nov 2020 11:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=wgFC61OjVWSeDUPQwJ2H5QF9kkH
 3TAPaV4Y3u3AaIYg=; b=uk9OY4nHe2ExPoPigh2ddXjV69rW60dkum2bzVcDef2
 Dm/JMZ5/tgeJ39N7W1YCrL3QvfJt5kZ6GLmX8wBfT/ZG58vjmj3GsVy6PAm6ANaV
 VKLX0QlQ4ZJMbhWK6A6hULHdphoP5mX26MPCI6wyNl+zYcmhYZMSBwL9Uj6/9W33
 JD2WXoL7fZRCXPO0dqZWjBN1Zk+dWaalzU3eXVJxPH194gNvG1yZw5yoQFiVqOFI
 IrmkpvQEmqn9wfsGtrLyk+iMV6JyU4vzOoqclRC6fgcqhLJ5sijHYUT83voW2nqC
 MvIcVQ/j/MAARaUEDM4F578n3etNBIIn/3QsGBbFaEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wgFC61
 OjVWSeDUPQwJ2H5QF9kkH3TAPaV4Y3u3AaIYg=; b=aoDKlIpjcMWlJtqpoPxaVl
 0F8HJSpzV5GMDJoehG1jPfOO/UKuQXIAQ/eTjPayrB7l3q2YfCg5PuhnVro7ArA2
 B3GFTAYAERioaujunp3503c1zPGaXXdwN7tW6LXyG1G03SqLpXNlfV7jORp1DlPA
 fOUXBPjQ+ye7srByG795GaoUS5KKYZCSrvmjL+qYblIgUYOYJv3w6LCp8C6ubqCc
 i5zDZznJC52Ql9gB5A3wT8/K4vnEyalgq4zGtUnSnBqEl0pVZicFntXO5asryLBT
 3ODHifhR0dYjDy66dZJkqfnfLag+UFbTPMBQOc4/csCAgBf31ka2ZJ+JWlrenA8w
 ==
X-ME-Sender: <xms:geq7X6gX9vVLa8LpMzN8JUn4ukUxPdYmCMB9w4YrFnCCZqc1pvIaQQ>
 <xme:geq7X7Ae35nT90FLLkwSGmQ4Xd9s0klIJdKoD1cVMD8e1Evc2AWJP8-qLAunhm0BG
 pSVHgFGH_PBqSxVMgE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:geq7XyGJMtvwsR6R5MZhx5KAqaYc83VVaG5pY2mdHg2bjoJpgY-mhw>
 <xmx:geq7XzR1BwnpDxAkJe0sIc3oKCE7puA58Ec6jRlskg2-V9BDf6cjLw>
 <xmx:geq7X3xjret7awlxqzCrW1XwUjOF28GxxwuRiuUt6oCLfaHAmMLMQQ>
 <xmx:hOq7X8rMY1bD_Gr6IPh0x4TMUji160WQcBGYTjwDpbLMKlDZFnzbGmCvVvM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 261B23064AB0;
 Mon, 23 Nov 2020 11:59:45 -0500 (EST)
Date: Mon, 23 Nov 2020 17:59:44 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 2/2] drm/vc4: kms: Don't disable the muxing of an
 active CRTC
Message-ID: <20201123165944.bl3544yiehlg65ma@gilmour>
References: <20201120144245.398711-1-maxime@cerno.tech>
 <20201120144245.398711-3-maxime@cerno.tech>
 <c744c1b4-98d0-0ed8-347a-3e3539206596@suse.de>
MIME-Version: 1.0
In-Reply-To: <c744c1b4-98d0-0ed8-347a-3e3539206596@suse.de>
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:40 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1362245532=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1362245532==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u3w37pnpjw7z6bqw"
Content-Disposition: inline


--u3w37pnpjw7z6bqw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2020 at 08:50:49AM +0100, Thomas Zimmermann wrote:
>=20
>=20
> Am 20.11.20 um 15:42 schrieb Maxime Ripard:
> > The current HVS muxing code will consider the CRTCs in a given state to
> > setup their muxing in the HVS, and disable the other CRTCs muxes.
> >=20
> > However, it's valid to only update a single CRTC with a state, and in t=
his
> > situation we would mux out a CRTC that was enabled but left untouched by
> > the new state.
> >=20
> > Fix this by setting a flag on the CRTC state when the muxing has been
> > changed, and only change the muxing configuration when that flag is the=
re.
> >=20
> > Fixes: 87ebcd42fb7b ("drm/vc4: crtc: Assign output to channel automatic=
ally")
> > Reviewed-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > Tested-by: Hoegeun Kwon <hoegeun.kwon@samsung.com>
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Applied both, thanks!
Maxime

--u3w37pnpjw7z6bqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7vqgAAKCRDj7w1vZxhR
xROsAP0aZVtxJjmk1by+aRI2aZyJtkL2fvYypDyiv6PRTsJRhAD/Rzd7SP6uc72O
LrpebYd2FmmHTG+tN75O1WB2c7Db8wg=
=a2y6
-----END PGP SIGNATURE-----

--u3w37pnpjw7z6bqw--

--===============1362245532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1362245532==--
