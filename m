Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E7FB0EB27
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jul 2025 09:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8332010E75C;
	Wed, 23 Jul 2025 07:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nRzH6EUa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED4E10E75C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jul 2025 07:02:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EEF24A548DA;
 Wed, 23 Jul 2025 07:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8CFC4CEE7;
 Wed, 23 Jul 2025 07:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753254124;
 bh=Fpw/c/5kjWltygJbu4uMApywQxizJHEZ9+QAerRo8G8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nRzH6EUamh0byFfsvuIMPVTeKD0ba7KG0PKDyFH5/elK0LmSMIxADrSkcVmNaSQ6W
 XmLAFX5AuwuF1adUhQSRoxBmZuvrl/MMmbRHhgEQinVWJugDcnRzOWJ4+gxuAUJ2pD
 sAoonuEf96mCvDfiQg8oOo/aDNzLBi62AcHXIP1OrFh59CWmDHb6f+sK9VBfNg9ULl
 mbh9R2hSV+4kEWUAERv0Yeuuw0rqJiar2zLA4iesvh9Y9BOR5W9o8N3fvlB3gL+5NZ
 1/f7iqlZRAwE7vr0stisUlcfFhFckyObHhN3c6iWzfnxWC0gD86Q72iSzVt6VcptYa
 dXzWmupArPaLA==
Date: Wed, 23 Jul 2025 09:02:02 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Kevin Tang <kevin.tang@unisoc.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/15] drm: of: try binding port parent node instead
 of the port itself
Message-ID: <20250723-bandicoot-of-simple-support-b42bcb@houat>
References: <20250722-ums9230-drm-v2-0-054276ec213d@abscue.de>
 <20250722-ums9230-drm-v2-4-054276ec213d@abscue.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fojbrzpoh2sk3fsf"
Content-Disposition: inline
In-Reply-To: <20250722-ums9230-drm-v2-4-054276ec213d@abscue.de>
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


--fojbrzpoh2sk3fsf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/15] drm: of: try binding port parent node instead
 of the port itself
MIME-Version: 1.0

On Tue, Jul 22, 2025 at 04:41:06PM +0200, Otto Pfl=FCger wrote:
> The drm_of_component_probe function is intended to bind all devices in
> an OF graph given a set of ports linked using the "ports" property on a
> main device node. This means that it should also bind the components
> providing these ports, not just the components of other ports connected
> to them. In order to do this, it calls drm_of_component_match_add with
> a pointer to each port node after checking that its parent node is a
> device.
>=20
> However, when given a pointer to the port node, the compare_of callback
> does not match it with a device node and thus fails to detect that the
> node belongs to a component. Fix this by passing a pointer to the parent
> node here too.
>=20
> Currently only the Unisoc platform driver relies on this feature, which
> was previously broken and is fixed by this change. On other platforms,
> the "ports" property points to ports that are not part of a component,
> i.e. the components only have indirect connections to the main node.
>=20
> Signed-off-by: Otto Pfl=FCger <otto.pflueger@abscue.de>

Should this get a Fixes tag?

Maxime

--fojbrzpoh2sk3fsf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaICI6QAKCRAnX84Zoj2+
dtvVAX9udslNDQ57hVZEjNb1iONfXuGwnS/BUlBV4LARSgg8P8O37+c2S9O1SiBG
/Bn03MEBgIsfznoSYFHNIZtYf91r3YxrZIm0wFxg6YtmePsN1AxF/tnoAIC93UHW
GD21BzVvbA==
=dERO
-----END PGP SIGNATURE-----

--fojbrzpoh2sk3fsf--
