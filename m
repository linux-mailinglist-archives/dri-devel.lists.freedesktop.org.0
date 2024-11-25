Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87659D85CE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 14:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0245810E647;
	Mon, 25 Nov 2024 13:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X6nRHOTZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D8510E647
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 13:03:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3912D5C5AF1;
 Mon, 25 Nov 2024 13:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B9C6C4AF09;
 Mon, 25 Nov 2024 13:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732539818;
 bh=6Zaiawin6pfWkWRIrFvVpjQcdvy8Et+XVajlh07pY3g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X6nRHOTZtoTKTwlHbL0+UCz3mBGJ6zPxtQ+ih3rtAdBIf4sg++TaNU88PuKAthBjp
 Y0tx3rs6kODwoxJoTVImx36sTaAdPfIyfvkZ1afY1Z/CFZSXAdemIuVuM8IQiBLcDW
 ZWKoy6xp8OKBGhCEpIU+wtbwzcPlAYUdeJajro2pOAF6b6qHGFWBQ7uIBhdEOdv3ut
 xIuyl7l+mryQ8KBj2u64rTCgbYYhVdnKslQMlwb8mnjky4lxWNujEgW8XoiuRuUQdj
 D+oLo0ehkJk8Y/8R4iGf3ADR/me4YlvKzLJg2QQeBPEwD46yle5d4PFWSKAaGgVXnW
 mgmtgsRHn9W+w==
Date: Mon, 25 Nov 2024 14:03:35 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com
Subject: Re: [PATCH v5 4/5] drm: writeback: Introduce drm managed helpers
Message-ID: <20241125-able-spectacular-weasel-83e955@houat>
References: <20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com>
 <20241122-google-vkms-managed-v5-4-1ab60403e960@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="jfnmezvlk6xplaz3"
Content-Disposition: inline
In-Reply-To: <20241122-google-vkms-managed-v5-4-1ab60403e960@bootlin.com>
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


--jfnmezvlk6xplaz3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 4/5] drm: writeback: Introduce drm managed helpers
MIME-Version: 1.0

On Fri, Nov 22, 2024 at 05:27:59PM +0100, Louis Chauvet wrote:
> Currently drm_writeback_connector are created by
> drm_writeback_connector_init or drm_writeback_connector_init_with_encoder.
> Both of the function uses drm_connector_init and drm_encoder_init, but
> there is no way to properly clean those structure from outside. By using
> drm managed variants, we can ensure that the writeback connector is
> properly cleaned.
>=20
> This patch introduce drmm_writeback_connector_init, an helper to initiali=
ze
> a writeback connector using drm managed helpers. This function allows the
> caller to use its own encoder.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

See https://lore.kernel.org/all/20241024-slim-onyx-emu-3e4869@houat/

Maxime

--jfnmezvlk6xplaz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0R1ogAKCRAnX84Zoj2+
dm8NAX4sHCLHMseClxDmuFB0kJcMu/MTvHxXEF9heDnOR9V0dZ5LdSnOuzEakbus
NrjBMAsBgIifXCWrFDsSzyERc48SvRraqLp0BOrMD6HBq9BwFDfs+nweqEaFURJA
s561g218wA==
=h3UH
-----END PGP SIGNATURE-----

--jfnmezvlk6xplaz3--
