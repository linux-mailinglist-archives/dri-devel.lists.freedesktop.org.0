Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F554D6356
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 15:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E3710E1E3;
	Fri, 11 Mar 2022 14:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A976610E1E3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 14:22:12 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DC1E05C0287;
 Fri, 11 Mar 2022 09:22:09 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 11 Mar 2022 09:22:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=KnXu0sFaFNChZ7GnTfgDWTVUPg22k0EHWVGTQp
 m57ss=; b=p/FOfvboHbnVhWmB6UKA3eVDme/6I39p1C5Qq+0ZBi1kqHsdOHmLoM
 a6lORpVJmfg+VNTRUKlbKxk/SFRyZkSaA4gCCnuyUEn57tjZhMmCyYRdest/ZS7r
 PmVM3y3IK4i6shhley1rjR6Bozp2JXEgAh28aV58iBpuElRw5D31rLuRbkHla3D1
 1Z+n/dbskVq/o0Fystp0AQ+MaCQPcgZZdETGPPk0PSpxSYnkQuUKXEXagKpmhy2i
 ZnXlFuKQBNiqJfh03qddxXG5AmPYTUyi1+f/UAxvA4zmfgzeK4ML4IOLFfc1P1M8
 qqYAp94iOB2acfE6ORSDwtfptDlFiR+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KnXu0sFaFNChZ7GnT
 fgDWTVUPg22k0EHWVGTQpm57ss=; b=SIMbtgS201VLqwC9ejoUK4VUmJZZJsXb+
 Min4Fxrdf9QW5ATl2g1np64cUrtd7XaouN9xty86H1ZzpeffteFiJGYbm9s5++1t
 f7a/IjIyEEbadco+vUVIbxnGt3Iia5Y82KegO+nlhKGIriAWLX8RnplX8vKoQRg0
 o+TVANwKE+UfEbgxToNbGD9PxQjv84EbKi5LlgQVCV1BEYUEZ4Cro1GHLGNc0AJd
 ZTBz/tTkZZgZrl0pjlCTNmHwEMElXIYOSsc7TvEHqKMKJ9eB0/9Odsvza0CmT/uC
 qR02oPho6JoIfIk+x2LX5LWALnaXO+v31yvcmlt/8jWDNg8pzkA+w==
X-ME-Sender: <xms:EFsrYjv3alfNY5e2f2APnMO3j--rDxMST6NSqNw2t67Iiy9OirbKkA>
 <xme:EFsrYkdiBK-OTMfVIZ6s-R1iah9lJ35UgOo70VofrB8rWarTlj7CIk0Vg_9lfmEib
 n0ht4EGXo9sCpDAgBI>
X-ME-Received: <xmr:EFsrYmz6_ZeayhDI1zbL1JwATHYQn-7k2Mk_Nh2ifOaIKHK4nFyXejvzi6Z7cLCaWbVY7vEzZZz2M1o_DxUcuEcjtkkIOE0rpWGQ1Fw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvvddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:EFsrYiMUlK7XdO4_kO54q86mq8jIb0LHR8f1HYrNQtQvOdlT_Hq-3g>
 <xmx:EFsrYj_Jq4WH6IpDs_6FEDcJ1stY1P5ExrRyU1-GDKIeqQv49g5dwA>
 <xmx:EFsrYiXm7emYonzFI5nhN89-Sdwf0TYti7CgbiA4nwaiPdR_WK8x7w>
 <xmx:EVsrYvYdt7KT-J6ylPdbfPcx5tsANv1dfGdruv_o7p3XXzEqkklhdg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Mar 2022 09:22:08 -0500 (EST)
Date: Fri, 11 Mar 2022 15:22:05 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: BUG: KASAN: use-after-free in drm_atomic_helper_wait_for_vblanks()
Message-ID: <20220311142205.ztg6njrubmnjud7c@houat>
References: <4438d667-1be2-24f1-c987-1a8e3fb85bcc@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aouhuqpej7vtvymi"
Content-Disposition: inline
In-Reply-To: <4438d667-1be2-24f1-c987-1a8e3fb85bcc@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--aouhuqpej7vtvymi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Thu, Mar 10, 2022 at 03:33:07AM +0300, Dmitry Osipenko wrote:
> I was playing/testing SuperTuxKart using VirtIO-GPU driver and spotted a
> UAF bug in drm_atomic_helper_wait_for_vblanks().
>=20
> SuperTuxKart can use DRM directly, i.e. you can run game in VT without
> Xorg or Wayland, this is where bugs happens. SuperTuxKart uses a
> non-blocking atomic page flips and UAF happens when a new atomic state
> is committed while there is a previous page flip still in-fly.
>=20
> What happens is that the new and old atomic states refer to the same
> CRTC state somehow. Once the older atomic state is destroyed, the CRTC
> state is freed and the newer atomic state continues to use the freed
> CRTC state.

I'm not sure what you mean by "the new and old atomic states refer to
the same CRTC state", are those the same pointers?

> The bug is easily reproducible (at least by me) by playing SuperTuxKart
> for a minute. It presents on latest -next and 5.17-rc7, I haven't
> checked older kernel versions.
>=20
> I'm not an expert of the non-blocking code paths in DRM, so asking for
> suggestions about where the root of the problem could be.

Does it occur with other platforms? Can you easily test on something else?

Thanks,
Maxime

--aouhuqpej7vtvymi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYitbDQAKCRDj7w1vZxhR
xX6WAQCqRxBEMdkx7TcRxQDKWFsigVtbUDJjVElXPRutVOrdugD/WCvym62uiYy5
lK2FegpJNXH3eTqn3L1yuVeC1dGkpAw=
=805p
-----END PGP SIGNATURE-----

--aouhuqpej7vtvymi--
