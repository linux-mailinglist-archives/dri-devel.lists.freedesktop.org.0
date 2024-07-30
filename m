Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9EB9408DB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 08:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 418F110E49F;
	Tue, 30 Jul 2024 06:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nB8GEkGX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E2E10E4AD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 06:47:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CC9F7CE0E9F;
 Tue, 30 Jul 2024 06:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968DFC32782;
 Tue, 30 Jul 2024 06:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722322058;
 bh=+NfQecz0SKCsPSuZEXvhRx0AI9TiQXhzPWEVevRaWWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nB8GEkGXOvqs9QvxBs9tqvUvgsQV6wNAmcoiZf/okaRcZ+tOfhiwiGWlYaqLS/rKn
 6XASAa1zWSsqZA1qB3M6GxvWGg0GpI61WgZ6GIkW5nbSw9HyAwDnEYHx9XiEAJ6X1i
 AX4yLlwx7Ro6XETzcKp7kD5Ku2a5ocgLdm5Hn6PoaMA3307xX1l6ZQ/dtLDqn6Sid1
 67etyhkDgwnDdGT1fZ73g6Pl+QQ7QhSPMx89xFXPavpRBrzTR3/DAg2MRIswgUGqWH
 wsskoMCEf6hRUcB0NHIj/ZMxHhd3kBM+PInQEt1qcvF3OJMdw/RquUduXpJxF4qCJ0
 WcCH9j5pWG9Jw==
Date: Tue, 30 Jul 2024 08:47:35 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, dianders@chromium.org, 
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add more multi functions for better
 error handling
Message-ID: <20240730-winged-terrestrial-sheep-a3ba24@houat>
References: <20240730060659.455953-1-tejasvipin76@gmail.com>
 <20240730060659.455953-2-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="oouif7llugnahlev"
Content-Disposition: inline
In-Reply-To: <20240730060659.455953-2-tejasvipin76@gmail.com>
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


--oouif7llugnahlev
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2024 at 11:36:58AM GMT, Tejas Vipin wrote:
> Add more functions that can benefit from being multi style and mark
> older variants as deprecated to eventually convert all mipi_dsi functions
> to multi style.
>=20
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

We should also add a TODO note to convert existing drivers to the _multi
variant and get rid of the !multi one when it's done.

Maxime

--oouif7llugnahlev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZqiMggAKCRAnX84Zoj2+
dsX3AX4sEJBP+AahNaviyuM2GXc+wzF/sWaiCLh6oHVkx83Vr9SEEvg0FGBXcvir
Ataw6AABfj5cZd6uHXG2GNXWt0MV3oQceIRff7o3ubI37qvClIbyHFtyZ5eLMoIN
SQNYlMlFuw==
=gWfl
-----END PGP SIGNATURE-----

--oouif7llugnahlev--
