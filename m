Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3879B37F02
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 11:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E807910E77F;
	Wed, 27 Aug 2025 09:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gd2/ZX2C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F2010E77F;
 Wed, 27 Aug 2025 09:41:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B3DB941B2C;
 Wed, 27 Aug 2025 09:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15627C4CEEB;
 Wed, 27 Aug 2025 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756287679;
 bh=yuR1aJSWhQS6UmvddUMXmIqnrXnogfXYY9F7Th1Zexk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gd2/ZX2CLj+17s7jHJzxtIGI5tO2a2x6eL++PgQvjIkM+Bj8HZNYVSdxpnHphDpk/
 q8hibjTs6IIabThSjiccLWjU8n+kS+j1IMh7qNbiSubJkKGuV1wOQhMkSnNrfRdD1h
 h96rfAs4RBojqhBOU/RzdW4OqwF/4Dn0LFcZOnqQmgxpxLfN/UNffNBLLDWy6/Izlh
 guHQA9VAf+1I7O4BwPtJsHpCy119IFfI5SwfYMeaTeKpHulZnzHtHQhDd5wtWzjUXd
 Te45yHMmWusBOToQ1vtKqrFEUQ+PU0eUWva0J0smM2sHumGZ5Ar3uAv1PBtT2ZBkfb
 glT0ElKlPvq3g==
Date: Wed, 27 Aug 2025 11:41:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Marius Vlad <marius.vlad@collabora.com>, alexander.deucher@amd.com, 
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 harry.wentland@amd.com, 
 sunpeng.li@amd.com, siqueira@igalia.com, maarten.lankhorst@linux.intel.com, 
 tzimmermann@suse.de, contact@rafaelrc.com, lijo.lazar@amd.com,
 jesse.zhang@amd.com, 
 tim.huang@amd.com, dark_sylinc@yahoo.com.ar, mario.limonciello@amd.com, 
 alex.hung@amd.com, aurabindo.pillai@amd.com, sunil.khatri@amd.com, 
 chiahsuan.chung@amd.com, mwen@igalia.com, Roman.Li@amd.com, Wayne.Lin@amd.com, 
 dominik.kaszewski@amd.com, alvin.lee2@amd.com, Aric.Cyr@amd.com,
 Austin.Zheng@amd.com, 
 Sung.Lee@amd.com, PeiChen.Huang@amd.com, dillon.varone@amd.com, 
 Richard.Chiang@amd.com, ryanseto@amd.com, linux@treblig.org,
 haoping.liu@amd.com, 
 Relja.Vojvodic@amd.com, Yihan.Zhu@amd.com, Samson.Tam@amd.com, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV
 color modes
Message-ID: <20250827-imperial-mongrel-of-dignity-712fab@houat>
References: <TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <aK1hPoCmLziaPPOd@xpredator>
 <TY4PR01MB1443219A9870877AF120FE63B9839A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="aiiszozkcroddann"
Content-Disposition: inline
In-Reply-To: <TY4PR01MB1443219A9870877AF120FE63B9839A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
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


--aiiszozkcroddann
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV
 color modes
MIME-Version: 1.0

Hi,

On Wed, Aug 27, 2025 at 12:26:56AM +0800, Shengyu Qu wrote:
> Thanks for reply.I have some questions:
>=20
> 1.Can you send patch with only i915/amdgpu first? It's a long-needed feat=
ure
> to deal with some monitors/TVs with broken EDID.

If it's to workaround broken monitors, then it's really not something we
should be doing using a property.

Most likely, those monitors don't support YUV* output and will just need
to be forced to RGB, so it's not something that the user (or the
compositor, really) has to care about.

And it would be broken with every driver, not just i915 and amdgpu.

We already have some quirks infrastructure in place, the only thing we
need to do is create an EDID_QUIRK_NO_$FORMAT, clear
drm_display_info->color_formats based on it, and you're done. No uapi to
agree upon, support, test, and it works with every driver.

Maxime

--aiiszozkcroddann
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaK7SvAAKCRAnX84Zoj2+
dpDoAXwOHTj6PMlsOZTg4eHmXw/kZcuNP/1Ixisifoy2XRmUQjs3rClHV68f9a17
R61xJRYBgPB8xi8teNCoS+ypqv1XJXhTvTDVyrGoZXbr4AOHUGGKoXRM0Zv+SUMl
4EpLGDZkJA==
=0l9g
-----END PGP SIGNATURE-----

--aiiszozkcroddann--
