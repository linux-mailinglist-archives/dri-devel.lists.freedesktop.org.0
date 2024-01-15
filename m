Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2930882D510
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 09:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCBE10E210;
	Mon, 15 Jan 2024 08:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF93910E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 08:28:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3091F60B65;
 Mon, 15 Jan 2024 08:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D5F5C43390;
 Mon, 15 Jan 2024 08:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705307321;
 bh=az/WBOp1OQ6Xfs6EZJ1X+gav/7O1RjelZ2VnMq5MYzA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZFVPep7Q08EQy56KAxp7Ru7RaoaL9GcLcMVaxW78ag+YEyFKDsQy0QJt6m06NV6kQ
 IEL6nLkxGxETwd17LCose+Okrb3PE8C7Npt4c074HK2BDF/zI0Rzhdez2t3G4wpqnw
 gzaakgRrRHFm0+Cd5ye+DtJPuwYM+M0uzDKqLo3Mmjl+Qs7Yg96oVUnKuk5ODOf2Zg
 nfp+BTIuRThDNlFqniwBLFKqq07BjbMXl7L/cIsIm7cKyuRh2T3fqzkxYDClyjGUHR
 XuLOrNCKIhM0hNOuhMFAIPnts3AwbcW5GH2iCEI1kjlwGOL8x9wItfT/mmEO6jL6QM
 0UX6RwlaHPP6g==
Date: Mon, 15 Jan 2024 09:28:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: Re: [PATCH 0/4] Fixing live video input in ZynqMP DPSUB
Message-ID: <6jhwss2wego6yoo5mwmphwawhsj5bbj62gwrzcpapoixwkrkli@g4fbxdooopby>
References: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n7xcdzwnxhtjrqmv"
Content-Disposition: inline
In-Reply-To: <20240112234222.913138-1-anatoliy.klymenko@amd.com>
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
Cc: tzimmermann@suse.de, michal.simek@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--n7xcdzwnxhtjrqmv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 12, 2024 at 03:42:18PM -0800, Anatoliy Klymenko wrote:
> Patches 1/4,2/4,3/4 are minor fixes.
>=20
> DPSUB requires input live video format to be configured.
> Patch 4/4: The DP Subsystem requires the input live video format to be
> configured. In this patch we are assuming that the CRTC's bus format is f=
ixed
> and comes from the device tree. This is a proposed solution, as there are=
 no api
> to query CRTC output bus format.
>=20
> Is this a good approach to go with?

I guess you would need to expand a bit on what "live video input" is? Is
it some kind of mechanism to bypass memory and take your pixels straight
=66rom a FIFO from another device, or something else?

Maxime

--n7xcdzwnxhtjrqmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZaTstgAKCRDj7w1vZxhR
xcNuAP9cmMzOSIWhB35PZo2h6GJS6fPvLKG71AcNrtTsLUMFWQEArlTwzA14zz4g
iWpBNljoSviatW38I/qGUvmoR601Nw4=
=TKaZ
-----END PGP SIGNATURE-----

--n7xcdzwnxhtjrqmv--
