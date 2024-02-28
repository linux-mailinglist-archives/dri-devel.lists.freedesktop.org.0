Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BF986B47F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 17:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18EB10E793;
	Wed, 28 Feb 2024 16:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sZmZYn/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226EA10E793
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 16:16:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 776F4618D8;
 Wed, 28 Feb 2024 16:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB65FC433C7;
 Wed, 28 Feb 2024 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709137011;
 bh=fErWKInGULVeVxqgQI2zMH4IGVMKKtYkJXd20L7xtH0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sZmZYn/wQtnIX3Ao7DScrIzuZTZ3OmuPwAm6201EzNpKwrM7pobEvjOs+wRU2Rk/f
 NYhJ69FIupcA1l5fjn3ecGzgrtRyNeFj2bPjLMHFsrXnNUlO+ifepw73K5DWTBVwiS
 /8ltKWfS6D7ubOtpSSG06ul0hV/Jekp8/X2T0UTM8hCgiOLmRRLKIQII2ZbMPQkHwq
 WVD7NzgaXHzXS4SfcgoP8RiknLVnNzZ+B+/ZqRBuHgbNNtwtYj775EGgo7PkmEN5pw
 ykI0fXySHnqeNMg+b7D/GX3TQYIXLmf3yjvgnZOtfpEepUFYWLCkU0s64SjBCmPPRq
 0/Rl4/cJstcDQ==
Date: Wed, 28 Feb 2024 17:16:48 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 29/36] drm/vc4: tests: Remove vc4_dummy_plane structure
Message-ID: <20240228-nifty-flashy-shrew-905edc@houat>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-29-8f4af575fce2@kernel.org>
 <244fe6b9-f295-4c85-908a-014ada0033fa@igalia.com>
 <y7mxj2i56h7bcnonywjdf2eirdqil66k32drw3wb3z7juqr3ph@4u24mlrvxslc>
 <2693770c-0d27-4186-87e1-e55a0a5f17a5@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bzsukvurqrxvmgmq"
Content-Disposition: inline
In-Reply-To: <2693770c-0d27-4186-87e1-e55a0a5f17a5@igalia.com>
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


--bzsukvurqrxvmgmq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 07:45:01PM -0300, Ma=EDra Canal wrote:
> Hi Maxime,
>=20
> On 2/27/24 10:02, Maxime Ripard wrote:
> > Hi Ma=EDra,
> >=20
> > Thanks for you reviews!
> >=20
> > On Mon, Feb 26, 2024 at 09:29:32AM -0300, Ma=EDra Canal wrote:
> > > On 2/22/24 15:14, Maxime Ripard wrote:
> > > > The vc4_dummy_plane structure is an exact equivalent to vc4_plane, =
so we
> > >=20
> > > Maybe I understood incorrectly, but isn't the vc4_dummy_plane structu=
re
> > > equivalent to drm_plane?
> >=20
> > Both statements are true :)
> >=20
> > vc4 itself uses vc4_plane to holds its plane-related content, but it
> > turns out that there's nothing in that structure anymore and vc4_plane
> > =3D=3D drm_plane.
> >=20
> > In our mock driver, we have another structure meant to store the
> > mock-plane-related content which doesn't have anything in it anymore,
> > and is thus equivalent to vc4_plane.
> >=20
> > So, basically, vc4_dummy_plane =3D=3D vc4_plane =3D=3D drm_plane.
> >=20
> > This patch is only about getting rid of vc4_dummy_plane though.
> >=20
> > Is it clearer?
> >=20
>=20
> Yeah, with that pointed out, you can add my:

I'll rephrase for the next version then

> Reviewed-by: Ma=EDra Canal <mcanal@igalia.com>

Thanks!
Maxime

--bzsukvurqrxvmgmq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZd9ccAAKCRDj7w1vZxhR
xQ/aAQDzU4vVfau883o71TzEeE+lysJ38XPUbtp9Q818fxbvSAD/TfNo9QsQjVLO
TjOhPuL8arGdUmexXtTS6jTunClBzAA=
=6H0O
-----END PGP SIGNATURE-----

--bzsukvurqrxvmgmq--
