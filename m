Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC57E357DD8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 10:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3566EA1F;
	Thu,  8 Apr 2021 08:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C536EA1F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 08:13:59 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6FC4F5808E6;
 Thu,  8 Apr 2021 04:13:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 08 Apr 2021 04:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=b5tqEuBPnKIHC4ZOjCxiVu2+gGB
 7jOK9/b/QhbhakyA=; b=ZxdMGSLgwJRdhcoCzOk2yU2XyQW8Rek/nZkYnlKNl3z
 x6Fgk4osGdHuSlXui+BVQ/jA3aK3pCkNF7VQ5BinaY3Wro3JbulsK8671aT/e5lw
 L0jndnhDBbQB+8I2j0XWtwV10vDj+vA4M2T4aTEJMtVQmKUZNKvcK+wXPoo178md
 4j6ZeyhVEVHD4dkzF+odyVQM+x5w8QAx/P9r2kK3CM6ve+V7QaiWEuV/Fyvyva3A
 Mg1CNtT22eYkizPaRyfycrcH85HKcQUXUGxzWopPMUbdOxkrMSWIpv4XMvsFtNPr
 5TBey+/KPALfK0vFPQnn3vFx1ybfwE9YVlwRQXeLwsA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=b5tqEu
 BPnKIHC4ZOjCxiVu2+gGB7jOK9/b/QhbhakyA=; b=NynEPbWaw4LK6CFVdUxvsk
 XnEy5fePwemwzm+YJhcwOwDqYGtqyWTWOVwgRHDDq56LwO2Ztui+zLcTYxsUHNa9
 WB3bKwyR63Ojl5060SFYIIJfhL4hiCefDiLqNoNJ/vCUdOtrK9a8pERBALfeg6Fr
 ODgQsSF0u60umNd05twbJt+WUBrh3gn6GItmiPe+d1oF8AzPBGqntBJyqjGITiO5
 3aS6d1WNufPyI3r9c4iZO6/zaUYa5vAHNXEQLLNfdc5dITzpIaXIbRnN73rJtVzb
 bHzVDrSF4Mv2L7VhZP8wUIybjvLeoBkJhQu486OnygKejM5OdzOGdK9wVLTojHCg
 ==
X-ME-Sender: <xms:Q7tuYFGJA_EFBHgG-VD79iemj4nArLHFpPqvdCME8mEo2gmA43ZjtA>
 <xme:Q7tuYKVZgug42gvkxpXK79sXHfG2o7M_ZeZ9ifKb0SO3zSwcx2KDZzPnf4l0aV6hE
 sTKKlBSXY12Ws9rHtI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejledgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Q7tuYHLBhs1rubvoKYlCXyEzFfemWecVqMhuFFu-gtUWkjHNSAvwfg>
 <xmx:Q7tuYLE1KArs3Lbb-k9DzOqXi9gxv02PfRCpE_BAydpRQ5grN7OI2Q>
 <xmx:Q7tuYLWmy6xDFwogKQacz1Mr_LI2STITSB7DjCARb0O0-inHunaV3Q>
 <xmx:RrtuYMvUweMQgoNRT-tm5oCXpiiA3Gu4GT3HPBdgmgCjHtN05EnKtQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 85FF524005C;
 Thu,  8 Apr 2021 04:13:55 -0400 (EDT)
Date: Thu, 8 Apr 2021 10:13:53 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device node
Message-ID: <20210408081353.ojt2kgnnbh6kp6gp@gilmour>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-9-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210318102921.21536-9-tzimmermann@suse.de>
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
Content-Type: multipart/mixed; boundary="===============0016121260=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0016121260==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kic7zoudgl7hee6e"
Content-Disposition: inline


--kic7zoudgl7hee6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Mar 18, 2021 at 11:29:19AM +0100, Thomas Zimmermann wrote:
> Make sure required hardware clocks are enabled while the firmware
> framebuffer is in use.
>=20
> The basic code has been taken from the simplefb driver and adapted
> to DRM. Clocks are released automatically via devres helpers.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: nerdopolis <bluescreen_avenger@verizon.net>

Even though it's definitely simpler to review, merging the driver first
and then the clocks and regulators will break bisection on the platforms
that rely on them

Another thing worth considering is also that both drivers will probe if
they are enabled (which is pretty likely), which is not great :)

I guess we should make them mutually exclusive through Kconfig

Maxime

--kic7zoudgl7hee6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYG67QQAKCRDj7w1vZxhR
xZ6VAQDtY09IxlLn3UJzycSlVWDilIefmaJ4MNMz0qDXaviB7wEAlVwtu8GYBmpN
wkIzSptIhbbsnq7fbNHk3LrvpN4N0g8=
=X3Xj
-----END PGP SIGNATURE-----

--kic7zoudgl7hee6e--

--===============0016121260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0016121260==--
