Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDCE9779DA
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 09:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8F910EB1A;
	Fri, 13 Sep 2024 07:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qTlAyQlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5CE10EB1A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 07:41:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 355275C593F;
 Fri, 13 Sep 2024 07:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2002EC4CEC0;
 Fri, 13 Sep 2024 07:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726213270;
 bh=idzju25k6AAbg0CWdFlQaDNm/nx8kDbWsvmyijUpmKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qTlAyQlNos6cRY6EFMQGURSwuz1jKyUo1jzTSVV3AZvOevNGaHz1+SBsXMIpcDr0Q
 LEapd9kyGfTAJdDT+sBTKU0bLbpgAgxEqWPupIQaF2Rkzsq9jjJWvN5Ieh7uK1JTcZ
 OhfWmw4N58V+x3ybRO7ReQ5zsphKgHpRI4txCrPj83LnfsAEDyhn0Jc5Yc8HZxxdMR
 aqRnAroYIT0ihkVWlYpYNjq/WUECBvUQtIscnclcuY28tbTNvF1sqOqev7zLwFDLQt
 KHD+C6wTdz1KihjRAGRMEyCpbc/dCkNAWusMGa1zsNTwUReziPHR2GHga0dMiec7Qy
 WW8u88DlipC+g==
Date: Fri, 13 Sep 2024 09:41:07 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, 
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, 
 Arthur Grillo <arthurgrillo@riseup.net>,
 Tales Lelo da Aparecida <tales.aparecida@gmail.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v4 RESEND 0/9] Increase coverage on drm_framebuffer.c
Message-ID: <20240913-sly-chameleon-of-love-e6531f@houat>
References: <20240911001559.28284-1-gcarlos@disroot.org>
 <172605715531.956551.13163712003461695066.b4-ty@kernel.org>
 <87ttekdn7n.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="22pj7sitg6x72uqp"
Content-Disposition: inline
In-Reply-To: <87ttekdn7n.fsf@intel.com>
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


--22pj7sitg6x72uqp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2024 at 10:31:08AM GMT, Jani Nikula wrote:
> On Wed, 11 Sep 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, 10 Sep 2024 21:15:25 -0300, Carlos Eduardo Gallo Filho wrote:
> >> This patchset includes new KUnit tests for 5 untested functions from
> >> drm_framebuffer.c and improvements to the existent one.
> >>=20
> >> The first patch replace the use of dev_private member from drm_device
> >> mock on the existent test by embedding it into an outer struct contain=
ing
> >> a generic pointer.
> >>=20
> >> [...]
> >
> > Applied to misc/kernel.git (drm-misc-next).
>=20
> How was this series itself tested? It would be prudent to Cc: intel-gfx
> on stuff like this to run it through our CI. I don't think it ever
> passed [1].

I'm not sure what's going on, but:

=2E/tools/testing/kunit/kunit.py run --kunitconfig=3Ddrivers/gpu/drm//tests

Works like a charm with this series

Maxime

--22pj7sitg6x72uqp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZuPsigAKCRAnX84Zoj2+
dg6lAYC8YtGN6iCERvFLMDs2XfJ7Txe8/5TjuYW4srRbLBMFipCrT99WGw1iDLQr
1zBcRvsBfA6FXlKiT/n+kM93E6/a4yCJQoK3/fpKhzcr/Ri3IXVraIlSYldcnKUm
hBgQSUh04A==
=oDZe
-----END PGP SIGNATURE-----

--22pj7sitg6x72uqp--
