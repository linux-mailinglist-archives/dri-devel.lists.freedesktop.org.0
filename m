Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DDE28DA2A
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B7D6EA00;
	Wed, 14 Oct 2020 07:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C4D6E8AD
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 07:43:16 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 01CC385F;
 Tue, 13 Oct 2020 03:43:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 13 Oct 2020 03:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=v6L9NrjZtCOGcXsBZUVciTcvCu9
 AbsbeHVhRAyxIl/0=; b=PgXDt78+93u0XFoCP7mFkqkwyc9PVCOTsClv57a5sLo
 EKnb5lAdVSgPj/8BkOM4D4ju5sNGbQ0BrPuELv8F0BDqsgLZ7armFH6oJzjlSGe0
 VzeyV2HfwsGGwYZS1nDSlt5TFIhpNxfotmnjEe+e+ZRXv3Z3aC3CBeyUyLkNG6Lx
 Tvceu111neEJnIMrPP5BRnKe+Ulq3GH8MpddLqBfP4AcP76NZonSPcwyAKjAHNP0
 I6QNV/7DiNtycqahNdvRvGZfp2XEJui8QgXti9JlSXbqfli2OXyyMw86Q7myFZVc
 nEZjDHdXAsj4hsGxYKt1hV3j8R5R05Tx4I2jdNw29VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=v6L9Nr
 jZtCOGcXsBZUVciTcvCu9AbsbeHVhRAyxIl/0=; b=IWeIggwb/T0MPImm4pCTpG
 sR88GMz5ls4PVI0pUuorojYTWg4IC2qn7TQF3ZYyW5PpHvMiSZE7TcUEWqAW+pHg
 UD9JgBmHPdN/gh+UTFpdM7i7/B4JOy+u4n6vtK1dyEb2UHDhdk+NTyhM+cn21wig
 3RQzr+D8UhjEcbOyQ2OftKgvfIDZK/gNX7tW7iGdbW56mjdLW2eV4P2ayoPuUMUX
 fWu+BSp9QBDrIBfeRbwrTMx/VlJO4++9/8DJU8gSB+mShK9NvRxlyL69RF4wBmxk
 FrCBGBgAJXudpJyd6ttlXbi8LYs2YNWl9iXm0fncVWGMwOY9Jm4EIWg0lR2uNyiA
 ==
X-ME-Sender: <xms:kFqFX79J06_yAxqFjSsmm3z9hWLsRF8Azz4CJ-mABW1OYYpGCXq5mQ>
 <xme:kFqFX3scQpfKelivGn8q-rVbm6EzYhXri35M7WtHAy2FD6IO7mX2o0coiD5Zpap77
 VfMGJEYy2C7t89b_Jo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrheekgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kFqFX5D6gK-E00aMu_62PctoMOycCC3ZkiXR7ofvIUXNCoAOV_6mtg>
 <xmx:kFqFX3d7q7y85B2C-BNVc10JlhHIZyaApmrRI_bSts_Fgv2ktVh-kQ>
 <xmx:kFqFXwNA6KVrUGicQP-GVgGEUIm-He0Zr-3p_mj8tZ46ww0JSvp9Xg>
 <xmx:kVqFX9pkx4ogQ_NuQrcE8D98kmw9wf4YQLglqalVzK10Y5cwBbswpQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5CB19328005A;
 Tue, 13 Oct 2020 03:43:12 -0400 (EDT)
Date: Tue, 13 Oct 2020 09:43:10 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH] MAINTAINERS: Add myself as a maintainer for vc4
Message-ID: <20201013074310.eqirnclzerdz7lxx@gilmour.lan>
References: <20201009074952.11345-1-maxime@cerno.tech>
 <CADaigPVccAupWYJtDKm=LikQbsdqDkkEg6HyoYkpi_8=gcc=zQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADaigPVccAupWYJtDKm=LikQbsdqDkkEg6HyoYkpi_8=gcc=zQ@mail.gmail.com>
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0131769978=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0131769978==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ohdz5fl2orbzposr"
Content-Disposition: inline


--ohdz5fl2orbzposr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 09, 2020 at 09:54:28AM -0700, Eric Anholt wrote:
> Reviewed-by: Eric Anholt <eric@anholt.net>

Thanks! I applied it to drm-misc-next

> I'd be fine with retiring from being maintainer, too.  I'm definitely
> not active.

Ultimately that's up to you, but I guess it would be nice to still stick
around since you obviously have much more experience with the hardware
and the driver :)

Maxime

--ohdz5fl2orbzposr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX4VajgAKCRDj7w1vZxhR
xVXAAP42Z8RwDBrVh1NkPb3DsAwnosvqQUsZ5SrqB15Y2xGMggEA2BtkaCYacnbP
bsSKkjQ1/Bv/H4pK4d+n/XkD80c6dAU=
=gspa
-----END PGP SIGNATURE-----

--ohdz5fl2orbzposr--

--===============0131769978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0131769978==--
