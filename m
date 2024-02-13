Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1EB85330C
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 15:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6779E10E6C9;
	Tue, 13 Feb 2024 14:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lWoFWP3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F3910E27D;
 Tue, 13 Feb 2024 14:26:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0978B614A1;
 Tue, 13 Feb 2024 14:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A455C433C7;
 Tue, 13 Feb 2024 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707834374;
 bh=cEjkw6Mj4Oxq9tZ3SteuR6tWouAKP8sIt24HtqKBlJ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lWoFWP3dWfcIQCfbmVo4lHGHTwW39JAiNI93kjG07CFIhHhYKvIXBKwnuNfNZcr6o
 W1Fa7viRJsNrZEltQTHlaR47PrRUM45C2UcWzOQxlI3PTrkYOBRLKEg1TEV2yQdbux
 sN+7J1bxHfFUXr6W0C4ww1nnBkSRAXnkua9qXOwGt/kfvwpO5T9xIvlL4Q5kTlKzJG
 dinA0Pczv+JrLYTzmsxAIsIjlGZcDjJtjsuAZVXSqZpkJkWq0QVaRxA3yLYXydAnnO
 rt262tiPPDr3eO51OoC1cq5mpONv4LfksXRZY7TQEDPPA5k46Ohm/UQBi32nfjsIx3
 /dRs5JsKepOHw==
Date: Tue, 13 Feb 2024 15:26:12 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Luca Coelho <luciano.coelho@intel.com>
Subject: Re: Re: [PATCH drm-misc-next] drm/xe: Fix a missing argument to
 drm_err_printer
Message-ID: <yjeqfuxc3az2j5bbvt7g5wtjmulcuxhill2n2hspjsmiokxfnb@pdd27bmfvd2m>
References: <20240212103833.138263-1-thomas.hellstrom@linux.intel.com>
 <87bk8m9coe.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tlxgr35l4v3psiba"
Content-Disposition: inline
In-Reply-To: <87bk8m9coe.fsf@intel.com>
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


--tlxgr35l4v3psiba
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 12:53:05PM +0200, Jani Nikula wrote:
> On Mon, 12 Feb 2024, Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com=
> wrote:
> > The indicated commit below added a device argument to the
> > function, but there was a call in the xe driver that was
> > not properly changed.
>=20
> Aww, crap. Looks like my drm-misc-next configs don't have xe enabled.

FTR, there's defconfigs in the drm-rerere repo that are fairly well maintai=
ned.

Maxime

--tlxgr35l4v3psiba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZct8AwAKCRDj7w1vZxhR
xXtpAQDhD60EqmrEPVGoJUfFTLvAKi3bemq1GAprHFRgKucj7AD/btk/Kj6+5d33
8Oj3hp0JlhhgcRVfQY4KFE2FxWE5jAg=
=fdzc
-----END PGP SIGNATURE-----

--tlxgr35l4v3psiba--
