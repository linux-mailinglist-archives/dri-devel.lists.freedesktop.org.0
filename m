Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED18D7E5C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 11:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0932C10E342;
	Mon,  3 Jun 2024 09:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NKWfADtT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3F610E342
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 09:19:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DB0160C96;
 Mon,  3 Jun 2024 09:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53725C2BD10;
 Mon,  3 Jun 2024 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717406352;
 bh=8xgDdE1s0Sy7MSL/lvwJ5vd91bhOXjXzA/bKRupcguk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NKWfADtTehZuSolnbCX4vpsNlZ7jbsxupSZd4OJekHLJoq5v46n8U4bLUwjSuVGhP
 yHhW+Fr3gs3RjmXj0ctGg/HqXwmXF8N8oQ8ic4hwW+q2XrTYwmoX1go5s7WJVULgbA
 K1xOIoq2LrQAwb/zVdnUSnmRMLhyUDmH3z0IhwPxIRXr7HyVU3E6iFQh5cUmE+ep3h
 nldVKWnC7OeSLj3E4quZram4nv3gkRqS+NDgRB+M6KvOvluAdoGIo7YrTc+yRbVzz4
 5R6LfuFWKVYuhynKmG/Y2a/z5bwzwa3eeVc+DVhL0NfxxlF6gVa6LOwtF+P0SzYYHP
 vPJKPDho5gMxA==
Date: Mon, 3 Jun 2024 11:19:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v15 00/29] drm/connector: Create HDMI Connector
 infrastructure
Message-ID: <20240603-nippy-ludicrous-caracara-e02e3c@houat>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <874jadesaj.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vh7l4xzntgu42oo4"
Content-Disposition: inline
In-Reply-To: <874jadesaj.fsf@intel.com>
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


--vh7l4xzntgu42oo4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Fri, May 31, 2024 at 09:43:16PM GMT, Jani Nikula wrote:
> On Mon, 27 May 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > Let me know what you think,
>=20
> Sorry to report that this series generates a bunch of kernel-doc
> warnings in include/drm/drm_connector.h. Documenting nested struct
> members doesn't work as smoothly as you'd expect:
>
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'broad=
cast_rgb' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'infof=
rames' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'avi' =
description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'hdr_d=
rm' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'spd' =
description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'vendo=
r' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'is_li=
mited_range' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'outpu=
t_bpc' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'outpu=
t_format' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'tmds_=
char_rate' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'vendo=
r' description in 'drm_connector'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'produ=
ct' description in 'drm_connector'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'suppo=
rted_formats' description in 'drm_connector'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'infof=
rames' description in 'drm_connector'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'lock'=
 description in 'drm_connector'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'audio=
' description in 'drm_connector'
>=20
> Noticed this when I was rebasing [1]. Having that merged would find
> issues in headers at build time instead of 'make htmldocs'.
>=20
> In the mean time, this is the quick reproducer:
>=20
> $ scripts/kernel-doc -none include/drm/drm_connector.h

Thanks for the report and the reproducer. I have to admit I have no idea
how to fix it, do you have a suggestion?

Maxime

--vh7l4xzntgu42oo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZl2KjgAKCRAnX84Zoj2+
dnjdAYCh58HSx5UyDwrdyTzw/8fwdR9giynUz0iYzk+dNWJEo48JrCLQ4Oc8ASYX
u5pApZIBf0v8uDQCp2JLsoeGPjt70PJzOz8ltjERxngYWkCqY3lGDMjCu5zl4oIm
efWmURI3ow==
=SmU7
-----END PGP SIGNATURE-----

--vh7l4xzntgu42oo4--
