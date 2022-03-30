Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8B64EBCFB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 10:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0D4510F79C;
	Wed, 30 Mar 2022 08:52:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EE110F79C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 08:52:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 1CC673200B8B;
 Wed, 30 Mar 2022 04:52:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 30 Mar 2022 04:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=F8KSgEQNL+X50ByDDnGxgTrZ3Mz9Aoki5wmYSW
 h4Xqk=; b=P2WkXJp+djj8QUq0QslAAESzhg2UdpL4wwlTeneTfkYdtxkSIRQzHB
 ZaboqWgbFsv/17SafgrMLKUyrbHz1vGBTOJeqQ9ZvBhMAP49hTBWIfB7tA9OwteN
 nLZ4ofxL9Q86yaS+OchdjQnz5OWuQ2bT6sylOC/S1BOi1TbSMzd068B2G5qLTU69
 gCrzkO8lmUDLCIdSpRRUmXD8PEjec7c7Xh0ccKypXcpt6kSwKG0dLybT5XdaKWcT
 I+mgFdgAqUgks1YJB8q2EPL9gM5wHfC+yIaoA2izM7gku4Kx8t06TVtVZz/eIVmN
 9KVD18TotUNGp39rktKMI8MZ+tIEuImw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=F8KSgEQNL+X50ByDD
 nGxgTrZ3Mz9Aoki5wmYSWh4Xqk=; b=XCMiS5K4p847brFr95QcWQ4nj1ewPvOL1
 RD4vHsUegn+GAoX3WQ20tSqa0TO1QAolnN7uMSYCwMZ5enPy7G/YXPlcZynAlVkI
 KCp6rxkkGIYaBdivfUPUwC4pAW2Euu3o3ThTKmYp7xUV3OWoEvpBl1T3L9yfvv13
 oPwDr4pW9Tfxd+Jo2tLM0KUOQQab8qwnCcOPtUk+I+HoxhWIz3WgTBLFL44BKqSH
 EkrwtskjpLM7l/dfnVBS4RHQ0WBBNcc6zJApcAIfrOsKN4UO1+cLX3QATthx6bB5
 QKmYlyeUo8wSUhFpao2pYpcvaOlZwd21JPSxezG0wvXKfFWO1eu+A==
X-ME-Sender: <xms:ZxpEYlveE360BwNDjnRGHn1zhaoApt0WeSmhoVeVV2ax-EBlABeVgQ>
 <xme:ZxpEYueKFbbDOnuCiop6xqdCCp8gdg1rEhEUhfHPKLpxUhySvWeNZ0LXVOBYQzZGv
 TBbeK_OhtL2NUxhYDE>
X-ME-Received: <xmr:ZxpEYowGTDjs_gfXzXH-x_nRt3v-09B27P1mJK5islSXBaGiB37Z8mSovv250ddpPsNWjzbZh2OKcypcpBZOJJmh26pSEGl5bQSUPAo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeivddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuedutdeuteefleekvdeileduteeuhfekueffveelieetgfdvhffhffelueeh
 teffnecuffhomhgrihhnpehsphhinhhitghsrdhnvghtnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:aBpEYsP9M_xZAobaH_8ZhskQl45Z8Rt0xZTEOn7UmjxednnDvoO8mw>
 <xmx:aBpEYl8CKF75PNBBoAQuN1lJucpKvxTz_C3To5nP-I1BNRY0zNabfw>
 <xmx:aBpEYsX4pBu3VoEMsW0RG7i9L7qCcXII_xqquKNPkOoPL_MO_lW6Aw>
 <xmx:aBpEYhSqeZL31UxExwOgnUOZXnqw7DFcaaFVnojTUEo-3dCasxp8ZA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Mar 2022 04:52:55 -0400 (EDT)
Date: Wed, 30 Mar 2022 10:52:54 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: DRM Master ignoring hotplug event during display switching (QT)
Message-ID: <20220330085254.yow3w4frr56wllou@houat>
References: <CAMty3ZBT9WEPbkaoS_8t1O153tckBk0pxiP2cF75ASZb54SPUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="o3ciwnmwduqh3zah"
Content-Disposition: inline
In-Reply-To: <CAMty3ZBT9WEPbkaoS_8t1O153tckBk0pxiP2cF75ASZb54SPUQ@mail.gmail.com>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--o3ciwnmwduqh3zah
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 11:38:32PM +0530, Jagan Teki wrote:
> Hi all,
>=20
> I have implemented runtime display switching in the MIPI switch design
> where LVDS and HDMI bridges are selected with the help of runtime
> GPIO.
>=20
> Initial discussion on the same can be found here,
> https://www.spinics.net/lists/dri-devel/msg318524.html
>=20
> The implementation has been done by creating each connector at
> runtime. The default boot will create the LVDS connector and based on
> the HDMI plug-in the ISR.
>=20
> 1. forcing the LVDS to disconnect
> 2. call drm_kms_helper_hotplug_event
> 3. detach the bridge chain
> 4. attach the new bridge chain (HDMI)
> 5. call drm_kms_helper_hotplug_event
>=20
> do the reverse when we unplug the HDMI cable.
>=20
> So, the bridge chains are attached and detached based on GPIO
> Interrupt which is indeed identified based on the physical HDMIA
> connector.
>=20
> Pipeline for LVDS,
> mxfsb =3D> nwl-dsi =3D> display-switch =3D> sn65dsi83=3D> panel-bridge
>=20
> Pipeline for HDMI,
> mxfsb =3D> nwl-dsi =3D> display-switch =3D> adv7511 =3D> display-connector
>=20
> With this, implementation and I can able switch the displays with
> default DRM (without specific DRM applications) where the LVDS is ON
> by default and when HDMI plug-in the LVDS OFF/HDMI ON, and when HDMI
> unplug the HDMI OFF/LVDS ON.
>=20
> However, with QT5 I can see the DRM Master ignoring hotplug event by
> returning 0 on drm_master_internal_acquire in
> drm_fb_helper_hotplug_event. With this the hotplug returned early so
> it cannot able to disconnect and connect the new switching connector.
>=20
> Any help?

I'm not sure why you started another discussion with pretty much the
same content, but you can't rely on userspace handling the hotplug
event. You'll have to deal with the case where it just doesn't.

Maxime

--o3ciwnmwduqh3zah
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYkQaZgAKCRDj7w1vZxhR
xQUkAP0e+D5ajXkkGGFzaSJdzEt6V5GAZV7aVR2vkj4yyJEAiwD+I0dLBrl2jXOp
Muad9g78Dm8MHyytpC+VmkjCw3Nakg0=
=dLpa
-----END PGP SIGNATURE-----

--o3ciwnmwduqh3zah--
