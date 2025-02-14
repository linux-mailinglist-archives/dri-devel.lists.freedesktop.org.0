Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED06A35E58
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:07:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C7510EC6B;
	Fri, 14 Feb 2025 13:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QdESWBSP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BA910EC6B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:07:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B186CA42A57;
 Fri, 14 Feb 2025 13:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 485C4C4CED1;
 Fri, 14 Feb 2025 13:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739538441;
 bh=TXHmyU+YiztLHq/8UmX52BHv5MU6+K5hkYzdh9aX96Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QdESWBSPstbJuhyyQCO1DmrRG6BfMhDHxir0xTJHvo7y5pG249HWM4gjSpplHqbQt
 BHR450mFZMEPt0/U4e7pqt9jbCMF7ihug6vcmS1j+kqIyY/VGM+8zhlCZO7L6hVG5X
 IyXl+//XGDOZcpuvIofRvCTUh2qn0Vua+cdsNFzslUKK1h/YzHELV32vLlU6MC9CqN
 TC5lCsYIRV8hMqw8s0ufkA6zINzqypfF5aCKQHc+aHaDEu+EeLVPVr2xQmpQZX6VT/
 1CgHh7lZY57xc/hN1E/cLPfe/Aah2jYQ1saUCtPTCwVl7kiVQOb1agXdvcLw9KTrrF
 ZLLlR9F2FUMOg==
Date: Fri, 14 Feb 2025 14:07:18 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 32/37] drm/bridge: Make encoder pointer deprecated
Message-ID: <20250214-arrogant-strong-hoatzin-efdcd8@houat>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
 <20250213-bridge-connector-v3-32-e71598f49c8f@kernel.org>
 <nfb4fb6lzjw4j5brsh242htgw3au2moklqjalfa3zzxjsi2qn5@l3censelmgbz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="67w4z5zxekonxkfi"
Content-Disposition: inline
In-Reply-To: <nfb4fb6lzjw4j5brsh242htgw3au2moklqjalfa3zzxjsi2qn5@l3censelmgbz>
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


--67w4z5zxekonxkfi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 32/37] drm/bridge: Make encoder pointer deprecated
MIME-Version: 1.0

On Thu, Feb 13, 2025 at 06:35:15PM +0200, Dmitry Baryshkov wrote:
> On Thu, Feb 13, 2025 at 03:43:51PM +0100, Maxime Ripard wrote:
> > Other entities (drm_connector.crtc, drm_encoder.crtc, etc.) have
> > pointer to other currently bound entities. They are all considered
> > relevant only for non-atomic drivers, and generally perceived as
> > deprecated in favour of the equivalent pointers in the atomic states.
>=20
> I think there is a significant difference between mentioned fields and
> drm_bridge.encoder: the former fields are variable and can change. The
> latter one is static and set at the bridge attachment time. Nevertheless
> I think it is a good idea to deprecate it.

I'm sorry, it's not clear to me here what you want here either. Do you
want me to change anything to that patch?

Maxime

--67w4z5zxekonxkfi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ69ABgAKCRAnX84Zoj2+
dlZ0AX0cLuT/qIP1UBQJnklZS+uu558tYTP7KQIZqGycye1GbpxvW/bE2wTKxpAl
zeXdVG0BgJijM6dZimQzJ7XpWbsWE7jTwcctkLzxtX5YoNALYPdskCMRJ7vK1p8B
oAbO/Lg1xg==
=UVPr
-----END PGP SIGNATURE-----

--67w4z5zxekonxkfi--
