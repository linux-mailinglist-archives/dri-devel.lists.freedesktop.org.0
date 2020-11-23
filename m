Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C440E2C1F9D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 09:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0609A6E20C;
	Tue, 24 Nov 2020 08:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E464D89C80
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 09:19:01 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0404D58051A;
 Mon, 23 Nov 2020 04:19:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 23 Nov 2020 04:19:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=La1QcmYJIzyipbU59TlvFXNU8WD
 M/SvyFtEiSWf0xxw=; b=J2oS4eKFo0ZzQcTTwkpE1jsN4gWG5Ue/zpSYw4PR5Qm
 Fpa8W4+etF+/71IHxaLBzn2I4eJsDVyNXBeEVHMTiRp4PgDw4jwA1V57XB3wPVWk
 t0+7ZMvvGWEVKHcOE18luZ78zu90SGni7nT4/+GUtjVk2vf4MgEZFAz5QQ239ezw
 CME89PnMw3ZJobqfJOVWKdDVRUyF5eBAjuDaMaG7Qh35YqG7Mfkd0i8fbBlWim1c
 5I9I08UAo3eNuEJd8l9fRV2S9u48BlpFFx+/kcWdhW3Xuqurq0eTTXgBhczBFy4W
 quZZhz1zdVHuxMmmhxdEWSWaX+XmQN9LqZFOJlAKqSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=La1Qcm
 YJIzyipbU59TlvFXNU8WDM/SvyFtEiSWf0xxw=; b=gxlBaFJWufkAESDX5iUrrb
 ViuxegmL3IN4HoTNy8zCvqoGMX+M3VwBwza23bx0h6CpN4K1/Q00kxosAWxJEFxm
 1kluI/hggdfxYkebSN4yYg0Ua6wnGNr3LHJ6VcAvg7VJ4EWHHAcsvBA3D7pR7n4u
 n4jkPduUxAweedi32rrUyBtGYDnFg8yiBFgwtW0uO73Sg6mQ0AC+GEI+F+lgSBES
 xqQTd/I/LvzjyJ3e6AfY4Fvj8gwMiakyvbaiN2nAkVL/uAZcEwezpPbLavcfNgnf
 VYSgAqSYeBJAiy4wrMQprpxmX2P+uM/iFEfZAZO1Y1XFBGMFzNAKfN7tB8/iYATQ
 ==
X-ME-Sender: <xms:hH67X2V7a-U3h3fMxDfGIxPBVJJ4N6RajWsM1c5t8ws7LlvT-_7bLA>
 <xme:hH67Xylkst5euRWBUMiGrJhlIn-5BKZl5cXYq2vvJA4PIWmMoJAd77McuKdpxCIrP
 oKYyr_xWWyD_JU3Mu8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hH67X6bTHfON5sC7dzUmbWWn7-x24oeZWvzV1XI1EkLrtSStXdGAHw>
 <xmx:hH67X9WtxaVHAhxrwdMABfQkBzS-02JTBVbnQG8C-FIFd2IxQRt5XQ>
 <xmx:hH67Xwkm-GHKnFeuLBLGGvOKKDsPYMDDcM7Ko-O1LyIX5QX-89Sjag>
 <xmx:hH67X62jJtFSOCDFAcURaPyW5eVtRXNdnCGNQJTbh5rZM5yRlwCmGA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 20D393280064;
 Mon, 23 Nov 2020 04:19:00 -0500 (EST)
Date: Mon, 23 Nov 2020 10:18:58 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 0/2] Default to cachable mappings for GEM SHMEM
Message-ID: <20201123091858.klw34k4u43gttyy7@gilmour>
References: <20201117133156.26822-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20201117133156.26822-1-tzimmermann@suse.de>
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
Cc: hdegoede@redhat.com, kraxel@redhat.com, rodrigosiqueiramelo@gmail.com,
 tomeu.vizoso@collabora.com, hamohammed.sa@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, melissa.srw@gmail.com,
 yuq825@gmail.com, lima@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run,
 alyssa.rosenzweig@collabora.com
Content-Type: multipart/mixed; boundary="===============1206894417=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1206894417==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tol5svy4f6ykjgjq"
Content-Disposition: inline


--tol5svy4f6ykjgjq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2020 at 02:31:54PM +0100, Thomas Zimmermann wrote:
> By default, SHMEM GEM helpers map pages using writecombine. Only a few
> drivers require this setting. Others revert it to default mappings
> flags. Some could benefit from caching, but don't care.
>=20
> Unify the behaviour by switching the SHMEM GEM code to use cached
> mappings (i.e., PAGE_KERNEL actually); just like regular shmem memory
> does. The 3 drivers that require write combining explicitly select it
> during GEM object creation.
>=20
> The exception is dma-buf imported pages, which are always mapped
> using writecombine mode.


For the whole series:
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--tol5svy4f6ykjgjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX7t+ggAKCRDj7w1vZxhR
xcamAQCJBuGJQGTsFTJOPYjvx9u8PqGp+BBgiJiazDYT9uvPowD+NECLqTkK+6q8
upa0L4XG7E3zWQkW/U2e4MprsitHYg8=
=4ptr
-----END PGP SIGNATURE-----

--tol5svy4f6ykjgjq--

--===============1206894417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1206894417==--
