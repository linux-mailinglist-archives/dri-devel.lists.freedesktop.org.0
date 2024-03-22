Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C5F886C1C
	for <lists+dri-devel@lfdr.de>; Fri, 22 Mar 2024 13:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BCF10E6A6;
	Fri, 22 Mar 2024 12:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GQncd7zO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B152510E6A6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Mar 2024 12:31:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B09FF6134B;
 Fri, 22 Mar 2024 12:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A77C433C7;
 Fri, 22 Mar 2024 12:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711110710;
 bh=QlyE6XyvtK5YH4auzoYHbK4QQ96PMKT1SN7P95GQyFY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GQncd7zOWU2lzxFreJmwqfG9yf1KhjFzLXGssQ1hhk5T0UKSaYEGZ6ary5hJPu1HU
 olKpkrPJ0gCBlwJ2yKEoHXBrlEbhWKNXF0R/oKjV5ZKtkd9l0hiiSuc2CVWPYyDmuv
 ITIfayGHMp/DzLD4GvK/BDJ9HR+FL+2mlPJPZpcAJAOcrzIXapdM82MMCdlRm/B4cm
 UYLTu308/ix2n/Xw6ZoJhp3FGCxTmqqraSjn9JyzqfG7c00V9Xz0iD7aztkwK5zE0J
 Nsby0PX8HX3EvkNXf4u+5v++RAgAThY13/Otrjznwg3v+tEVrU+qORoLhtthyf7QZV
 hn2yy43ReMKTA==
Date: Fri, 22 Mar 2024 13:31:48 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
Subject: Re: [v10,20/27] drm/connector: hdmi: Add Infoframes generation
Message-ID: <20240322-steadfast-tanuki-from-mars-b5ea5f@houat>
References: <20240321-kms-hdmi-connector-state-v10-20-e6c178361898@kernel.org>
 <07125064-2a78-4515-bb48-655f2aec140f@linux.dev>
 <20240322-loose-resourceful-bullmastiff-92cfaf@houat>
 <7835e928-7d09-446e-91dd-13a0fa549bc2@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ygdzto2cjdjjo7zs"
Content-Disposition: inline
In-Reply-To: <7835e928-7d09-446e-91dd-13a0fa549bc2@linux.dev>
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


--ygdzto2cjdjjo7zs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 07:13:54PM +0800, Sui Jingfeng wrote:
> Hi,
>=20
>=20
> On 2024/3/22 18:31, Maxime Ripard wrote:
> > Which default config are you talking about? This compiles fine with all
> > drm-misc defconfig, x86 defconfig and allmodconfig.
>=20
> The drm_hdmi_avi_infoframe_colorimetry() function is belong to the drm_di=
splay_helper.ko
> kernel module, it get called from hdmi_generate_avi_infoframe() in drm_at=
omic_state_helper.c.
> While drm_atomic_state_helper.c belongs to drm_kms_helper.ko. Therefore d=
rm_kms_helper.ko
> is dependent on drm_display_helper.ko implicitly. So we probably should s=
elect it.

Right. I was asking which config are you using to generate that build error

Maxime

--ygdzto2cjdjjo7zs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZf16MwAKCRDj7w1vZxhR
xVPkAP9G35ser3LI9Mkz4UPsJ7hdxEY40m/H7avmJllz/P8YowD+LcjpoKgFLzQ2
L2LkEn9vRNdhZy+7qFgJZ6RKstIwPAM=
=B6jC
-----END PGP SIGNATURE-----

--ygdzto2cjdjjo7zs--
