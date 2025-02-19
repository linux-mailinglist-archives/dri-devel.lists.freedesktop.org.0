Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC67CA3C490
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 17:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEE110E497;
	Wed, 19 Feb 2025 16:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="czoqeHeA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D056610E497
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 16:12:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AFA7D5C5ADA;
 Wed, 19 Feb 2025 16:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA83C4CED1;
 Wed, 19 Feb 2025 16:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739981547;
 bh=nh8cFNIeObOKXMAGYxjgXKUcHk+AS/4DcT+B0swB+os=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=czoqeHeAxnbycojOPrrWy3+oXBvIIi9Orz3CkAygwfY56mCSLoV+oHx8Cmv2+0Kl7
 684DoqQAjdXF2FVMnxqHmISs8xfcs+lk+tOw/ox42lNVlrlvC9eN/jc+eRQW1H8xrm
 Hw2WBlTH201JBSfMHq4XzrqioSVMbnej/cmYAR/iFRJI/TpUr8zwmMri8hQUWyOl6q
 qKoYmXU1hcxVteA2xp8bG1FsKZUYfcfVmYnf4jXCuqpFSbI9JCno9YjIYI/VjZF2a2
 vj3qb6et7U8xEMQ26cbxbkR7ApyGeaMHSoYFg3cLE1uLcEVfXo48Wn2pCba2MjKbXT
 tQJRInpdep96A==
Date: Wed, 19 Feb 2025 17:12:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 00/37] drm/bridge: Various quality of life improvements
Message-ID: <20250219-thick-clam-of-inspiration-bc38ab@houat>
References: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ql5avbhszhighkaj"
Content-Disposition: inline
In-Reply-To: <20250213-bridge-connector-v3-0-e71598f49c8f@kernel.org>
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


--ql5avbhszhighkaj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/37] drm/bridge: Various quality of life improvements
MIME-Version: 1.0

On Thu, Feb 13, 2025 at 03:43:19PM +0100, Maxime Ripard wrote:
> Hi,
>=20
> Here's a series of changes after to the KMS helpers and bridge API
> following a bunch of reviews I did.
>=20
> It's mostly centered across providing an easier time to deal with bridge
> states, and a somewhat consistent with the other entities API.
>=20
> It's build tested only, with arm64 allmodconfig.
>=20
> Maxime
>=20
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Merged patches 1-26 into drm-misc-next

Maxime

--ql5avbhszhighkaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7YC6AAKCRAnX84Zoj2+
dos5AYCBZky3Iv31zMJc4Zrs0DW4pcEa0gFpGEnZurclpyA90vWWKeiji3RsCbqh
CNM1TvgBgKIDyscugMLeMNN/XJFPjf/qBkxqAy5lFaekl+CstTbNxPQyKRSLgFop
WrPnv4dOPw==
=OyNX
-----END PGP SIGNATURE-----

--ql5avbhszhighkaj--
