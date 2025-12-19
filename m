Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E2BCCF231
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 10:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3F010EF00;
	Fri, 19 Dec 2025 09:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bs7k7JRP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8525710EF00
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 09:29:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 97B7B60008;
 Fri, 19 Dec 2025 09:29:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E8BC116B1;
 Fri, 19 Dec 2025 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766136591;
 bh=XFTotWdzOuWrRPNfhHtC0cieO5YkccNVaGFwvjF2I9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bs7k7JRPWVHO9zrjUky1WzcIJEHrYKZ//stDmj9NMIMTBzxIl22XhV0xOzzIrtO+7
 KhW4aRuhhd2wlk36lHLpe96chIEp+ZZviJP9AjIgiPVdEtDbv4W2dzFX5lHzpo/CoR
 Kse/QX2mu19nUwigsXUPnxbYnn+OCBy4mVAIQcIgKAGYYdOC+2QPBdLRPoSoPHdSgC
 /z11roq9Qdh1qIegliW9BI2JgSipclCMO7upMUQaANaR2jeZkWyne6wISwzKWt3Eu1
 PbnKdKgik+E6iuFK7KYXeGk8GKRxjWO9A0TTjTxgdlI9SQAoVozICwYrHiP1E3Iljy
 p42e9g6GTjYPw==
Date: Fri, 19 Dec 2025 10:29:48 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/2] drm/panic: Add kunit tests for drm_panic
Message-ID: <20251219-armored-fair-swine-43ff33@houat>
References: <20251216082524.115980-1-jfalempe@redhat.com>
 <20251216082524.115980-3-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3idxdj75rvghemqr"
Content-Disposition: inline
In-Reply-To: <20251216082524.115980-3-jfalempe@redhat.com>
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


--3idxdj75rvghemqr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/2] drm/panic: Add kunit tests for drm_panic
MIME-Version: 1.0

On Tue, Dec 16, 2025 at 09:20:39AM +0100, Jocelyn Falempe wrote:
> Add kunit tests for drm_panic.
> They check that drawing the panic screen doesn't crash, but they
> don't check the correctness of the resulting image.
>=20
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Maxime

--3idxdj75rvghemqr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUUbCAAKCRAnX84Zoj2+
dqIsAX94UyhdLRDJ4O+aMp584GfJTzPnW5E3S0C9LAZfXdqXA4m4g6WrOFl22EpV
HkIbuWYBgLjDRaBrOToQBNnHIKCSCHFqaZV8v6zyvZ8CuJBUSTc3g2zULX+S6zwV
/OCPFU7OzQ==
=PBJe
-----END PGP SIGNATURE-----

--3idxdj75rvghemqr--
