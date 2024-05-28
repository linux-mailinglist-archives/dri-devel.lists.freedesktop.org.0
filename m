Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F026C8D19C3
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 13:38:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7B110E030;
	Tue, 28 May 2024 11:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pCG1IF1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEB610E030
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 11:38:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 94664CE12B0;
 Tue, 28 May 2024 11:38:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730BFC3277B;
 Tue, 28 May 2024 11:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716896279;
 bh=3/HNyXofnWACRHDUS8UJLPpn4WFjgNEci5tCEHXvnWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pCG1IF1OjyBDneYFRP3R/6tQBiRGpw5JUZUutRcgBl3ruyNEu9Pq8cgk5cCGzYc/B
 lttuTh8EAeRFpEIpygSNGH7mppPD1dMzFYja1U173t9gePHgjghutSJ4Vqmq8qHcGF
 DqhZ+2ZR+vpzQqJT3bO1lDxBg5X9BOYMKK2Mp1BRXV95wNq43RQ5Feo5QK3eBE9Czb
 k0G7KGKt7hBiBldPCobFzz+yDaT8x7ART6iYojBPcOybeJwbjNiN+n5V0CjPmU1JYs
 lExDR8NjAiw33n6p1maTubRImyUSFUuWFYpAMwm76x95ejEI4xSo9yh15Hgb0WLQIm
 y8KSpEB8g+rKg==
Date: Tue, 28 May 2024 13:37:57 +0200
From: "mripard@kernel.org" <mripard@kernel.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH 02/17] drm/panel replay: Add edp1.5 Panel Replay bits and
 register
Message-ID: <20240528-fluorescent-vegan-oryx-7b6eeb@houat>
References: <20240516085342.1559562-1-jouni.hogander@intel.com>
 <9a785a57e2d48024d9fa622e89c8c6d4fbf20050.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lsl67hmuslfunqhr"
Content-Disposition: inline
In-Reply-To: <9a785a57e2d48024d9fa622e89c8c6d4fbf20050.camel@intel.com>
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


--lsl67hmuslfunqhr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2024 at 11:25:41AM GMT, Hogander, Jouni wrote:
> On Thu, 2024-05-16 at 11:53 +0300, Jouni H=F6gander wrote:
> > Add PANEL_REPLAY_CONFIGURATION_2 register and some missing Panel
> > Replay
> > bits.
>=20
> Hello drm-core maintainers,
>=20
> Could you please consider providing your ack on this patch? I'm
> planning to merge it via drm-intel tree. I have already r-b tag.

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--lsl67hmuslfunqhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlXCFAAKCRAnX84Zoj2+
dgegAX91gW0ogFhaxVCApJWJmQzdeSe8twrvuLhNGrgTOAN8gYqh9RlmUcZVSLNX
S38TEakBgLomPJ47i/spA0Sx7gZN3IejL+r2SVbT4gUwjud4xq7bdLDsRAlAwbsu
yC5mcozq5A==
=hl/P
-----END PGP SIGNATURE-----

--lsl67hmuslfunqhr--
