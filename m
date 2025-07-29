Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF4DB14FE9
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 17:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34AFD10E351;
	Tue, 29 Jul 2025 15:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jLnR205z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CE810E351
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 15:04:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6565845B7B;
 Tue, 29 Jul 2025 15:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70C0C4CEEF;
 Tue, 29 Jul 2025 15:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753801440;
 bh=jr3qpIt9SmNxBjq5DvZChHrTgJkjRKBQX//A5yFFwoo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jLnR205zbKhJuk+nkwdCYuJ/RcGLZbTDNWo7L5a0Wo8AVzp52YbH4dcFsRLo/FlJU
 f/xwIOcA6G0Yft6lr5hJm4o1ayb64hAUNfCDgtGRZKyQdjsGJ9TNyep+AgMC/fTO6j
 TlZBpPhiMJmGyIscBT/8GFdQ+pQHIroqpoRyFlxa56YZ8scSofo91/KcMtPXGntDc7
 1cBPY0ftHtmBU4VbQRRCAfTwIDZiUftfz+i02WUdSExzOhn6Z9hyurK8QM7FbDD/ma
 lBQzK6pW8diTAwLe6LYgarfFgZmY2ccymPcZVQ0T7TcHxyAPak3RRb4ONd+lgsbpC3
 Ph/D3c0GJFA5A==
Date: Tue, 29 Jul 2025 16:03:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Imre Deak <imre.deak@intel.com>
Cc: dri-devel@lists.freedesktop.org,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/3] drm/omap: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Message-ID: <27d80f33-a57d-437c-b26d-ec9dcb8f500c@sirena.org.uk>
References: <20250728101603.243788-1-imre.deak@intel.com>
 <20250728101603.243788-2-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="U1mreGXsFn6oRaJK"
Content-Disposition: inline
In-Reply-To: <20250728101603.243788-2-imre.deak@intel.com>
X-Cookie: Short people get rained on last.
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


--U1mreGXsFn6oRaJK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 28, 2025 at 01:16:01PM +0300, Imre Deak wrote:
> Plumb the format info from .fb_create() all the way to
> drm_helper_mode_fill_fb_struct() to avoid the redundant
> lookup.

Tested-by: Mark Brown <broonie@kernel.org>

--U1mreGXsFn6oRaJK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiI4tsACgkQJNaLcl1U
h9AUYgf/bOk/6lXB7HnWs06BDAbdJMarbB6HZ0xhaJBeqXFIaXM5QJlvO8AohSYc
3ZtsPQuQIfCyza/nNxjODmI8PQJFSQP0RdwFxdgtgAhcqczxdm+Ji5L/Ojpogavg
qJUcB4zhQrtI32/cBWeQrQaSXUWpfyLTvz5TT/HFMPIHKLDZC5WJU+76GGnN+EYX
CgElwptnNjB7xBj/Nb/mMaHJ+4VfvcZ1F/AHA85fbK84PVYh7LrbJlqMAp8TCoi5
oBHsjpp903gAX6RFmvTuO5frb84yP0EMtjlpAAxghqkAV/mznd8u+6Qugs43pM1d
rMUIUpYfs5QEQBUExCWg+5lfv9xMeg==
=AO4W
-----END PGP SIGNATURE-----

--U1mreGXsFn6oRaJK--
