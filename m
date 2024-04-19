Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DA78AADC9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 13:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40F410EFD6;
	Fri, 19 Apr 2024 11:36:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SpnoKl85";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7D210EFD6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 11:36:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 39103CE1A28;
 Fri, 19 Apr 2024 11:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67CAC072AA;
 Fri, 19 Apr 2024 11:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713526597;
 bh=RGBSiE3AtLVUYHvusd2OokOMgXmKs1k7wH7HEVhiQfg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SpnoKl85z8PRUnvUV94bspdas7JkiksyoW1AUSsd8W5fmoKjOprRdlJzjtY6JkGDo
 F0P+F3/zUJxWmjy8oa50ws3MIqDHtYzGjVrG1jzikp5TGwnUoJn1cHGzczVzY7/vLn
 a/6Bo33zheUhgEgSIl9SJk7FV/aPdJQByPCu0l97+mJU3etiiUh2gM4qLtPLgq+Hwx
 /NVNq7ikFh7ooDTrQjG6s6bh766F3Lxjm8nHQEGC3zZR5LHt+dGGkyO3T7J68mVyU4
 hlmj5QeaA/+KjRDCsa3scXjCF6fBijP+eJ79KqrxYBIPcMjklOk3F+BeHm/FiCn7jA
 71LTAmbS+VjBQ==
Date: Fri, 19 Apr 2024 13:36:34 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v11 17/28] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240419-intrepid-enthusiastic-spoonbill-3fb9f2@houat>
References: <20240326-kms-hdmi-connector-state-v11-0-c5680ffcf261@kernel.org>
 <20240326-kms-hdmi-connector-state-v11-17-c5680ffcf261@kernel.org>
 <Zh6EevKDKt60E8e9@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="twt2bamgclgwo5q2"
Content-Disposition: inline
In-Reply-To: <Zh6EevKDKt60E8e9@intel.com>
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


--twt2bamgclgwo5q2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 16, 2024 at 05:00:26PM +0300, Ville Syrj=E4l=E4 wrote:
> On Tue, Mar 26, 2024 at 04:40:21PM +0100, Maxime Ripard wrote:
> > The i915 driver has a property to force the RGB range of an HDMI output.
> > The vc4 driver then implemented the same property with the same
> > semantics. KWin has support for it, and a PR for mutter is also there to
> > support it.
>=20
> Is there a i915 patch to switch over to hdmi.broadcast_rgb? Though
> the "hdmi" name is perhaps not the best idea given this is also a
> thing for DP.

No, there's none yet. I can try to cook one as a follow-up, but I have
no way to test it

Maxime

--twt2bamgclgwo5q2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZiJXPQAKCRAnX84Zoj2+
dqW3AX4z9SPfNEYqLIrzCMiper2UznzSiItRQraVPOKwQb/7kJbeWynLWAgun2KI
ipBCYTIBgNmPOT2WW4J8MjsQTegdqZL5wVAo0erF9fB7LiOU6HNZ9VZCiYz2cjwl
d06WM355Fw==
=BZv7
-----END PGP SIGNATURE-----

--twt2bamgclgwo5q2--
