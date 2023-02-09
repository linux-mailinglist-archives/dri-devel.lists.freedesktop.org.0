Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A77A690D1C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 16:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AFE210E0FA;
	Thu,  9 Feb 2023 15:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D74610E0FA
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 15:36:06 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A1F6B5C00E7;
 Thu,  9 Feb 2023 10:36:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 09 Feb 2023 10:36:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1675956963; x=1676043363; bh=Yu0n+6Ru2P
 15abCrftT2Y1fVzc5CVENWKnJ5+W06L8c=; b=ZZ6EUNot6kq9ilrYWOB9t/onOH
 0L04NESkjcvx7Twcm1gZ7SKqopNW4Fo9J+jOSHD/cNmVfU9Wii6YVP9jVL5Z2HM0
 eA2fx38YyjRYMmLGhTpRaCSmhPRLVvcZ7B/8nytXGXD/ymvLhnIrHJhiZ1HV37aE
 oGaTvckTDWy+bJxGgZbaZxd2w4gdECmKcKszdh4hV1L4TSzWKTlwx51qF8ak3Ufe
 FaWsjB2coBVoUpliQLV2kWZlwWW1LdlosF84oT0whRXhOIo2Fm1J+EKk99xpuwRQ
 dTzVS2mGCVL0d/cbY5DYCWG4DCupZ75+OhxRg1wPZf4pxLfYI4DoAUk53VjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1675956963; x=1676043363; bh=Yu0n+6Ru2P15abCrftT2Y1fVzc5C
 VENWKnJ5+W06L8c=; b=R2Nu7RZcGDquVg535IQisk/ZZrz73ooNN4vzsImm/OJU
 ofy7T65YDgoWVtT4piFVN+L12xPHISjNzhLcWswhtr8jLplIC9zgmAg8O5wfK7h9
 Ez87X8GWlOG5j6GyEbCjWoolxX0T31FT1oDXS9SqDOmvNFfYZs1PqL8vvSBCczFv
 zs8RCzleXteDnEBr6Q5WhKPgvqwyfP6ONY2n3Zsw27rZz3XCAoheN7eSgo/iOHKP
 Dkc7HeKA0cHYB6xzaY+rfK9XMVQcSNDuDLMu888tlTbcpsR764rbTMzQFhgqA2F/
 ulJ/cGc1NuWJ58usJ+p2YSSd2JOJ4wrwhrn35YZY9w==
X-ME-Sender: <xms:4xLlY56ZxQF7Dp4Sg6TVTkBcxsL-93uDSnK89v_fOg-jq2HQy9qu4A>
 <xme:4xLlY254xDJQQ5TeJVA7mKquYEMPq8IL3oBCUt2DMGDTR73rpm4E3IT3vIOJv0Lb6
 TH1NwcUcFdb3dZLKro>
X-ME-Received: <xmr:4xLlYwdzooL51kKGDB4BC8VJ5wa7dbygb7IcdDRSIx4Vy9CcP0kUyfH4rO8QHevqVPTTOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehfedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedtleekjeeiudefvdfhieffteelhfeivdeliefgieeugffhvdelieffjeei
 geetjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:4xLlYyKw2vOyn-pfg4DktORrG7k9aD9Flf_JYst5HewfOdoojmhhQw>
 <xmx:4xLlY9JO92VMzfVKmOCMXDsssqqCq0InDg_PtAFwTbr8c5LSZlDcrQ>
 <xmx:4xLlY7zXm-Gk_i6RZwU_Roir9RqftsluF5mdnyYWmVpClezo8dRFrw>
 <xmx:4xLlY_jWf1nVq4HCD6aZWu1AspPIA0Hp3UJvYUy1uxboGhNXrBvm1Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 10:36:02 -0500 (EST)
Date: Thu, 9 Feb 2023 16:36:00 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Darrell Kavanagh <darrell.kavanagh@gmail.com>
Subject: Re: drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet
 3 10IGL5
Message-ID: <20230209153600.jtj6deqhgfocvwgc@houat>
References: <CAMxBKG1RwbRJMG0cKcnbyKgznXeZLL+Zp1zXeOnxpYU0NkOO8A@mail.gmail.com>
 <CAMxBKG3o_6R7M0gaUHXA5yGgSe6HBWYK25fwF=8mN+JTno9t7Q@mail.gmail.com>
 <CAMxBKG0wDi-XwMZwMHq_DbFXt3pgK-CV-G7iT9BNftiXBoUHzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mb2aakgz4b3qr3md"
Content-Disposition: inline
In-Reply-To: <CAMxBKG0wDi-XwMZwMHq_DbFXt3pgK-CV-G7iT9BNftiXBoUHzQ@mail.gmail.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--mb2aakgz4b3qr3md
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Feb 08, 2023 at 07:04:58PM +0000, Darrell Kavanagh wrote:
> I've resolved this by adding a matching quirk in
> drivers/firmware/efi/sysfb_efi.c - see below.
>=20
> Are you the right people to be notifying about this?

Yes, we are.

Howewer, please follow
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

In particular, a proper commit log and your Signed-off-By tag is missing.

Maxime

--mb2aakgz4b3qr3md
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY+US4AAKCRDj7w1vZxhR
xZYxAQDWx9+OsPXROJlK4kwZ7VvjR90RYD1U5wlnbqo3KClEjwEA6ZWt/AG/1Ikl
tU+/xEtvn23WhTgq/5BLVE2XqxykAwE=
=0o85
-----END PGP SIGNATURE-----

--mb2aakgz4b3qr3md--
