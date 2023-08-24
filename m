Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A55786AC3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 10:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5058B10E4FA;
	Thu, 24 Aug 2023 08:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D3910E4FA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 08:53:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8C6865F33;
 Thu, 24 Aug 2023 08:53:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12631C433C7;
 Thu, 24 Aug 2023 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692867233;
 bh=qWBfAY/syTaBh0XOs7U/kFl7+ZFgl//it3TsuYVk3Js=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a3HtM/Myu/NikqDjIvsJhKNZhK8eMdJPnf3zEnGOVX8l44HmR0MT0K20ousjFOr/P
 xAw/MQqXWBgZ2mJ1+51R8Yds05yXPGUDOJjnPEA34oSTBSPSB8RK9AR6hq741bEisf
 PqRo/bVaOGLCJiE/FWvALh0m+iwGwC4w4Y/mEXE/dDaJNea61V/TD396RH3DYz+pqZ
 u6Gb4Ym8ofa7voDr9Sfb8JjFnfg8EECLcP5n2hpBwD163HJUbXL4rQ8N6Pm0c1tHe8
 036vsL6OvKv6UY7rMT4/tUrs9K2nEbKFDx6gNnJ7uQuqyvEv/FzUiYiUGS4S+TgUot
 tagDftE9FADOA==
Date: Thu, 24 Aug 2023 10:53:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 13/20] drm/tests/drm_kunit_helpers: Correct possible
 double-entry typo in 'ddrm_kunit_helper_acquire_ctx_alloc'
Message-ID: <b67sjdnlltxlg5qjeebbocgmpdsxv6qvyzpjwjqy5pkyeovaiv@76snvdcewxmo>
References: <20230824073710.2677348-1-lee@kernel.org>
 <20230824073710.2677348-14-lee@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vir4vd3mpfmkkxjr"
Content-Disposition: inline
In-Reply-To: <20230824073710.2677348-14-lee@kernel.org>
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
Cc: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vir4vd3mpfmkkxjr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 24, 2023 at 08:36:58AM +0100, Lee Jones wrote:
> Fixes the following W=3D1 kernel build warning(s):
>=20
>  drivers/gpu/drm/tests/drm_kunit_helpers.c:172: warning: expecting protot=
ype for ddrm_kunit_helper_acquire_ctx_alloc(). Prototype was for drm_kunit_=
helper_acquire_ctx_alloc() instead
>=20
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: "Ma=EDra Canal" <mairacanal@riseup.net>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/=
tests/drm_kunit_helpers.c
> index f102c23eee1dd..c1dfbfcaa0001 100644
> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
> @@ -156,7 +156,7 @@ static void action_drm_release_context(void *ptr)
>  }
> =20
>  /**
> - * ddrm_kunit_helper_acquire_ctx_alloc - Allocates an acquire context
> + * drm_kunit_helper_acquire_ctx_alloc - Allocates an acquire context
>   * @test: The test context object
>   *
>   * Allocates and initializes a modeset acquire context.

The typo was added by your patch 9.

I've applied and squashed them both

Maxime

--vir4vd3mpfmkkxjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOcangAKCRDj7w1vZxhR
xapKAQDJgAtGJxi7Oa75js6tCobx04IEkX4GiDBAlghE/1LpTwD+N9eWXmGWC8Oq
hncke8txx2Wdo0/ownwXK744E0ArxwM=
=g15R
-----END PGP SIGNATURE-----

--vir4vd3mpfmkkxjr--
