Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68770B35586
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 09:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E1210E5D2;
	Tue, 26 Aug 2025 07:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="aYnLgFZO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F71810E272;
 Tue, 26 Aug 2025 07:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1756193088;
 bh=fWEaE7rby5BwiPQYp9tM0XRd30FJRyFX8vJJQY21Y+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aYnLgFZORbFNNctI8Q3e3ZZhulvu+PmnLPh9O8U+0EGX1wwK/x8OCqEJAc4krcxb0
 nDVVUSnd+wk+EbUo/MqPkVfykHX+FqydXhz3afU+kWwAyrZxmGG92JAWhLuYtm4w3k
 5jsZp15YOK++txRDk6K45WBgKC3rCR4D56f9UsE606MQXziJS6eoijzYkYkmhmZqDE
 maotq807ZkxWK3LJpyeYCie3lWxMwvJSo6LLLspfe+jf85T4AYSoOHZVY+OvcW3tC6
 iHQdkI1TuHBGxS8MaO3wz3QfrlBrIVmnCYxFZxAczpoRG+xKHiyT7ZdTC7Ht3F3tNC
 vms79OQfK2mHA==
Received: from xpredator (unknown
 [IPv6:2a02:2f08:eb0b:c00:e88e:21ff:fe65:be18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A5DBC17E011A;
 Tue, 26 Aug 2025 09:24:47 +0200 (CEST)
Date: Tue, 26 Aug 2025 10:24:46 +0300
From: Marius Vlad <marius.vlad@collabora.com>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, harry.wentland@amd.com, sunpeng.li@amd.com,
 siqueira@igalia.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, contact@rafaelrc.com,
 lijo.lazar@amd.com, jesse.zhang@amd.com, tim.huang@amd.com,
 dark_sylinc@yahoo.com.ar, mario.limonciello@amd.com,
 alex.hung@amd.com, aurabindo.pillai@amd.com, sunil.khatri@amd.com,
 chiahsuan.chung@amd.com, mwen@igalia.com, Roman.Li@amd.com,
 Wayne.Lin@amd.com, dominik.kaszewski@amd.com, alvin.lee2@amd.com,
 Aric.Cyr@amd.com, Austin.Zheng@amd.com, Sung.Lee@amd.com,
 PeiChen.Huang@amd.com, dillon.varone@amd.com,
 Richard.Chiang@amd.com, ryanseto@amd.com, linux@treblig.org,
 haoping.liu@amd.com, Relja.Vojvodic@amd.com, Yihan.Zhu@amd.com,
 Samson.Tam@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 0/2] Add "pixel_encoding" to switch between RGB & YUV
 color modes
Message-ID: <aK1hPoCmLziaPPOd@xpredator>
References: <TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="P4ii5dE9RQd4AYRH"
Content-Disposition: inline
In-Reply-To: <TY4PR01MB14432B688209B2AA416A95228983EA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
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


--P4ii5dE9RQd4AYRH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Prior work towards this is/was: https://lore.kernel.org/dri-devel/202401151=
60554.720247-1-andri@yngvason.is/

I have slightly modified version of that, but still working on
getting another driver (besides amd/i915) working with it.

On Tue, Aug 26, 2025 at 02:39:59AM +0800, Shengyu Qu wrote:
> Usage:
>  - X11: xrandr --output <output name> --set "pixel encoding" <encoding>
>  - Wayland: proptest -M amdgpu -D <card path> <connector ID> connector
>    <pixel encoding ID> <encoding (ID)>
>  - Kernel Param: amdgpu.pixel_encoding=3D<encoding>
>    or amdgpu.pixel_encoding=3D<monitor>:<encoding>,<monitor>:<encoding>
>=20
> Supported encodings are: "auto" (0) (Default and original behavior), "rgb"
> (1), "ycbcr444" (2), "ycbcr422" (4), and "ycbcr420" (8).
>=20
> This patch series allow users to switch between pixel encodings, which is
> specially important when auto gets it wrong (probably because of monitor's
> manufacturer mistake) and needs user intervention.
>=20
> Changes since v1:
>  - Some cleanup and rebase
>  - Added YUV422 support
>=20
> Full discussion:
> https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_2628536
>=20
> Original patch by Yassine Imounachen, current version is modified based on
> this patch(was rebased by Rafael Carvalho):
> https://lists.freedesktop.org/archives/amd-gfx/2024-October/116195.html
>=20
> Shengyu Qu (2):
>   drm/connector: Add "pixel_encoding" to switch between RGB & YUV color
>     output modes
>   drm/amdgpu: Add "pixel_encoding" DRM connector property support for
>     amdgpu
>=20
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  36 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.h   |   3 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |   2 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 273 +++++++++++++++++-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   1 +
>  drivers/gpu/drm/amd/display/dc/core/dc.c      |   8 +
>  drivers/gpu/drm/amd/display/dc/dc_stream.h    |   2 +
>  drivers/gpu/drm/drm_modes.c                   |  32 ++
>  include/drm/drm_connector.h                   |   7 +
>  9 files changed, 353 insertions(+), 11 deletions(-)
>=20
> --=20
> 2.43.0
>=20

--P4ii5dE9RQd4AYRH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEcDKHej6x6uPk3J379jQS5glH1u8FAmitYTsACgkQ9jQS5glH
1u9CLQ//bBIdGbBmI2faqdm8hqyzUUpMMJwHK4kAuv0XE4QId5db+cbUocPYM9nY
gJPntOSb6/tPD7MyNV/xsR2ezD5tISQBjgwTYKXhf34Y+E+pAqKyyUfjwJ8Z26X1
qt1ewRDjBtT9DPWFwEr0OHCqxreGWXGU5bMelO2GMyXR+IPT51cIkFOvHXDI91YK
oj3qi4dJEutYeCRCPT0SAcqwD3WUIXexV0FZzp0bqcAxxDQXcu5J1hx0f0HVAU8T
NIJ1dDM/f4kqbRZSciU7IRc58EHCyBT1Xd+UquW6hSOPjncK2BDk3Guj3u5ElTUR
obWFF1j+ieG89bUXI7wa3/BIYrxdw7vqWj7zp0FnYDn6zIFeOTNEVR/igGx/MMde
PSDhe/52Hwpf00MG0vjE1rja6EHOBW7aUgDhfi4gyAAbiWYW4kJ7b8xKonPv32HP
RHy1AUq+3mlPX3vjeP4uUftlGUMKJ9lGqIjAunh5SYJ76DLbr5ugGUJnkSOiZHl7
PAXwEFG/MRjdIIJwdfbn9C1xZSGfwfg0tW/UxGjtUfrrGVPYFNu4WKslQ1ZeusYy
vYlfiYDMqE63Cs0V2RwyaqsF+xGcywDNafSVp5OtAhiUpxzmFEBhk4QcVlEENgUb
Du+5qNXmt638fYp80wgdw4mhl4FRe2EArB1QHGij2YkUVTyHtT4=
=zfJn
-----END PGP SIGNATURE-----

--P4ii5dE9RQd4AYRH--
