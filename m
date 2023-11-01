Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA667DE324
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 16:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5803810E723;
	Wed,  1 Nov 2023 15:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA69910E723
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 15:36:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 02879CE1084;
 Wed,  1 Nov 2023 15:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1A9C433C8;
 Wed,  1 Nov 2023 15:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698852989;
 bh=ErDN5TGrf82/1e3WSBuxJ8Uwcx5pZO0mfLHGxApPH9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qoJpP3g3Xc50XgkT727p3w1Uw0bduzyGMMVFAwCS01GSz8AnKJL4TohyJNhngDdNm
 QG1fvGTDDtYj7x7XbY9kjPdSUQuBQFgnaAvUT1mFG9bREb38EbjUoh6S1opeaPJo6c
 b8saLZ95nsEKj5XUPUO9kBUwVcvMe9bUFYWCPvjdfQdorF0/xOGrjvlZpyd+bKDA9Z
 zBaXX3nccA8kwN/Hzzfjegl+zrOHpk7mmzoodODxWHeCSdgNqXXww+cAlk36UZ/5ou
 G67BUMFZjbHwIZ6RugYeZaSjWHZgX5FpKX77bsL3cu6wC61u4OwpyslNi6eMJ/pVAd
 It5TcDOx1Fptg==
Date: Wed, 1 Nov 2023 15:36:23 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: gpu: v3d: Add BCM2712's compatible
Message-ID: <20231101-whinny-observer-d0cae8d8d7c0@spud>
References: <20231031073859.25298-1-itoral@igalia.com>
 <20231031073859.25298-4-itoral@igalia.com>
 <d3ed80e5-b3a1-e9ba-48eb-7c6fc58ef3f9@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sKuyd3vh441A/Ew6"
Content-Disposition: inline
In-Reply-To: <d3ed80e5-b3a1-e9ba-48eb-7c6fc58ef3f9@igalia.com>
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
Cc: Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, kernel-dev@igalia.com,
 Rob Herring <robh+dt@kernel.org>, Iago Toral Quiroga <itoral@igalia.com>,
 Stefan Wahren <wahrenst@gmx.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--sKuyd3vh441A/Ew6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 31, 2023 at 02:53:35PM -0300, Ma=EDra Canal wrote:

> I would like to ask the device tree maintainers if you are willing
> to take this through your tree or should I push the entire series
> through drm-misc/drm-misc-next.

dt-binding patches almost never go through Rob's tree, usually that only
happens as a last resort if subsystem maintainers let them fall through
the cracks.

Cheers,
Conor.

--sKuyd3vh441A/Ew6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUJwdwAKCRB4tDGHoIJi
0jPJAP9aRVPsF33zF9+FSJjfCZPt69Z4e+uhPfQRnzhHZt0MJgD9GKPs7nkQVYGh
aY8i+yXw3l4Q8S1CVlbXYIOHIQXqFgY=
=A4c3
-----END PGP SIGNATURE-----

--sKuyd3vh441A/Ew6--
