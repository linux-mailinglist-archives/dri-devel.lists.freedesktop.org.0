Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996878D3340
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 11:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5252710E71C;
	Wed, 29 May 2024 09:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AdELsZ52";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B830510F4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 09:40:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 892C3CE16DE;
 Wed, 29 May 2024 09:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B1CC2BD10;
 Wed, 29 May 2024 09:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716975636;
 bh=XQvyqJhAHgErD9crZ5SlZy/WJwS7EVh2p8uzhd4+Juo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AdELsZ526eD3Fyt/1QGaTb8Zpr3iaYEsS4+ehziaGRFx69nmGvEdea+/DnjdFGIoP
 pEgP8HCPgiAwLLbi7rUWJpCTbtMckwg3eLrTaorc9OeF5F6CB5co19OaDdS4RNOJj0
 n8eCpplVZlqgc9CFiG2n9c0w4dC+GqHqpzIJ1U+fZr6joKafOj05HNXehlm2hj/62J
 c+uIbuvRirs81hj1ZVp6Vhrm9DhbBbfHXibZ+fJ9EedxqNprFMOaLnhnDPGeNIs9Ye
 +1TdrStqR5V4CvOFSCruWEUMa3he3fKwDpcLdw8uj7mAUIfxxSySpwccd4OUfdCNYu
 6JfPNdou4ZjXQ==
Date: Wed, 29 May 2024 11:40:34 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedsktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/tests: Add a missing Kconfig select
Message-ID: <20240529-lush-liberal-toucanet-e8ab72@houat>
References: <20240529091955.173658-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ydun77aiq4h7jy4f"
Content-Disposition: inline
In-Reply-To: <20240529091955.173658-1-thomas.hellstrom@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ydun77aiq4h7jy4f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for sending that patch

On Wed, May 29, 2024 at 11:19:55AM GMT, Thomas Hellstr=F6m wrote:
> Fix the following warning:
>=20
> WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HE=
LPER
>   Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && DRM_DISPLAY_HELPER [=
=3Dy] && DRM_DISPLAY_HDMI_HELPER [=3Dn]
>   Selected by [y]:
>   - DRM_KUNIT_TEST [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && KUNIT [=3D=
y] && MMU [=3Dy]
>=20
> Signed-off-by: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-state")
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org

I already sent a fix for that one, and just merged it:
https://lore.kernel.org/r/20240529080013.2325748-1-mripard@kernel.org

Let me know if it doesn't fix it for you

Maxime

--ydun77aiq4h7jy4f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlb4EQAKCRAnX84Zoj2+
dmQgAYDcg1BdcbhHvAn01RY1XEEBGULTMT1+zVR73wbKBznaFrJc1CvSwwI3oXMT
FhtwYSwBgP7sn56qHQfep8zDBbLVSI0h7j5g3JluSoT2Sj897IBPuZWN/DBAitU9
Zyz137BMmQ==
=SBt5
-----END PGP SIGNATURE-----

--ydun77aiq4h7jy4f--
