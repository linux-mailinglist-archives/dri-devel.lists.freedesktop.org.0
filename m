Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F18894467C
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 10:23:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CAC10E666;
	Thu,  1 Aug 2024 08:23:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pLPPm9tY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F70E10E666
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 08:23:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3FFFACE18A8;
 Thu,  1 Aug 2024 08:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EE0C4AF09;
 Thu,  1 Aug 2024 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722500604;
 bh=Z51j2yPPzqzqUbfDzj+Co7O6I0fAkjzKGVvNCuTWfG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pLPPm9tY25L0+aND/5OqSFFujF5t/EgH5zvh599BAyny/hYainjuQBiogHSNCgAGO
 Y7kzwEXsRDNBjv54Y/EEqw4BYKXaEFCn7v8OjHApMbOQHaqfcokUckHAbLhZHpKJe5
 hd3tMOKqmpZDVv1s9l/YmjAwOMeZjPTUNRJQ8L7MZhaA5CUl2Xi2pKuygsj4hNtTxg
 4pvoVD8Y9Q30b4LU+wzujooBFZ1aBPO2sHxy2t1ySYeoom2lG7hyga67Rpkh3+fR+A
 rNWCSOBwmn/R7rA9x0qk8d9C7fR34HD8VujJRj+ZEbiHZzhonhHNAlXzDLw+9fMPxZ
 5tbr1xSKq7UDw==
Date: Thu, 1 Aug 2024 10:23:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
 Sebastian Wick <sebastian.wick@redhat.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v15 00/29] drm/connector: Create HDMI Connector
 infrastructure
Message-ID: <20240801-fluffy-cuttlefish-of-abracadabra-389feb@houat>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <e33dc3c4-9d7d-4c85-97db-b6fd94142131@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="2k5tde7ytku6vb3x"
Content-Disposition: inline
In-Reply-To: <e33dc3c4-9d7d-4c85-97db-b6fd94142131@xs4all.nl>
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


--2k5tde7ytku6vb3x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, Jul 31, 2024 at 04:56:16PM GMT, Hans Verkuil wrote:
> Hi Maxime,
>=20
> On 27/05/2024 15:57, Maxime Ripard wrote:
> <snip>
>=20
> > Hans Verkuil also expressed interest in implementing a mechanism in v4l2
> > to retrieve infoframes from HDMI receiver and implementing a tool to
> > decode (and eventually check) infoframes. His current work on
> > edid-decode to enable that based on that series can be found here:
> > https://git.linuxtv.org/hverkuil/edid-decode.git/log/?h=3Dhverkuil
>=20
> Since this patch series is now merged in mainline I also pushed support
> for parsing InfoFrames to the edid-decode git repo.
>=20
> I believe the parsing part of the InfoFrames is complete, but the conform=
ity
> checks for the AVI and HDMI InfoFrames are still work-in-progress. But it
> should be easier to develop this now that is merged.
>=20
> The git repo for edid-decode is here: https://git.linuxtv.org/edid-decode=
=2Egit/
>=20
> I added test files to the test/if directory, and if you run:
>=20
> edid-decode -I audio.test -I avi.test -I vendor.test -I spd.test edid.tes=
t -c
>=20
> you'll get the output below.

That's awesome to hear, I'll send a patch for the KMS documentation to
mention it=20

Thanks!
Maxime

--2k5tde7ytku6vb3x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZqtF9QAKCRAnX84Zoj2+
dgiBAX4lptP5eciLgerJmky6HFfb4t9iXMA0gMwf454GyprB/6H1qL24e8eHqpXe
LgfVUI8BfRJ6NBLAdSH0nE87Xf5l/pBV5IacFmB10VRbZ+YSt/9xWQ37E0U2KJAl
R21moyCKpQ==
=3fHv
-----END PGP SIGNATURE-----

--2k5tde7ytku6vb3x--
