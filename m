Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF6A207E3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 10:58:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF4E10E05E;
	Tue, 28 Jan 2025 09:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lXZgOCy+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7DE10E05E
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 09:58:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 04C51A40A7F;
 Tue, 28 Jan 2025 09:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE30C4CED3;
 Tue, 28 Jan 2025 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738058330;
 bh=YEGXnLuqhsVGM0dzz56Xs4m9Ydi13POSocT8Y8d2A1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lXZgOCy+w6+ewIVpl9SM9XbTe5mPsR/nTUygb724O2YvpfymvM0aCbFkiXtisKpJ5
 VVyl+GmpoxbVetBweSUdyknNlmU8A/5LEyg0F5XIJkKHRB9jrxvZUJovE0Fo6meJIq
 sL49BRKzr2r8lGrDoCIz0f4e17VN/k/Rpxo0N7o9dYA3zEXVSAprOzIV+fzC02ztjb
 M/YL5hoP6DAPERDMR5z8ATz4FdTpNTmOVTDPYDrGLM58z1yIUEWzUmOIYkyloRchLY
 p87HcsfGWI2PLsJ73UkoftNCSlj2YBZG9rLLfFY1RDz93Tb3FbfhFO0D7D0ckVLQE5
 RGDuw/gpIlXWg==
Date: Tue, 28 Jan 2025 10:58:47 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 0/2] Fixup drm_atomic_helper_connector_hdmi_check()
Message-ID: <xbo2usn3yo4gvdng76nr2mdvvotsiqmler65kn2irwpywy4fin@wrxhoakcbmef>
References: <20250114-hdmi-conn-null-mode-v3-0-16bca91e11b0@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="yui5ac66tqfy2w63"
Content-Disposition: inline
In-Reply-To: <20250114-hdmi-conn-null-mode-v3-0-16bca91e11b0@collabora.com>
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


--yui5ac66tqfy2w63
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] Fixup drm_atomic_helper_connector_hdmi_check()
MIME-Version: 1.0

Hi,

On Tue, Jan 14, 2025 at 08:16:55PM +0200, Cristian Ciocaltea wrote:
> Fix a NULL pointer dereference discovered while unloading a DRM module
> and provide a test to make sure the helper works as expected in case the
> connector's CRTC is shut down.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

I'm sorry, I didn't realize it at the time but it looks like it was made
redundant by another series that got merged about the same time you were
sending this one:

https://patchwork.freedesktop.org/series/143378/

Sorry again,

Maxime

--yui5ac66tqfy2w63
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5iqUgAKCRAnX84Zoj2+
dvw1AXwJythcgAXOuXtuzuGuuHvmXnpJv8Eg++eqUONBPjUeTVoXVfOgteiJpFFX
uGa7UpMBgLhCZiKNkgPkUawR2y2wp4oxhQwC/qdsfTWz2B1lMbi/F8ij3NlSif5S
AfzUQiWb7g==
=2AuM
-----END PGP SIGNATURE-----

--yui5ac66tqfy2w63--
