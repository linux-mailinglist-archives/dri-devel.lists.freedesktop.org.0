Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AB0845A77
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 15:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49C710E6EB;
	Thu,  1 Feb 2024 14:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tQjCBHN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB30610E6EB;
 Thu,  1 Feb 2024 14:43:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4BDAFCE1E5B;
 Thu,  1 Feb 2024 14:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36ED8C433C7;
 Thu,  1 Feb 2024 14:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706798629;
 bh=qJLupk3NVOLjD6RhoiB7KcctkmUfIGiwOyaf9Rwmoas=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tQjCBHN1JKj5NKPOrgK4xsHRIPaHfbKopMGnO55sLSzIwGhIoxqgsXpXFgQ+qvj9j
 RJeWzm4AJuUrOdwv8gKG/cCucngHSQFMc9J9lkfpR1wy+LkOw1VzPGkEWuvw9BTcAx
 X1JHZVEyuObC1ScbefEncX4yWDcIQRhQ4WwbrgdFv7ZkUJjD97CG8KE8f0UC1UMUG4
 Qztc0ABj3LRg1x5BgNcJy+lA05Yq5/9ibI/C2A2aSPF9RT/iZ5eDRZW070p1MD21rv
 UA6Vfb7rSROlUL9eB2ML9ylC9nxR+a6nAwSrko/RehMtSsPhq2rg+eSJUtWM2nj0G1
 v5VLVae/4aq8A==
Date: Thu, 1 Feb 2024 15:43:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: Re: [PATCH 00/10] drm: drm debug and error logging improvements
Message-ID: <henxwxlna777w6fzrhqrjp7wczlgbhpf5sxqnxsb6jguynwen7@5bhi7lrce5ve>
References: <cover.1705410327.git.jani.nikula@intel.com>
 <871q9wgxfi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nnsabhwerybioihq"
Content-Disposition: inline
In-Reply-To: <871q9wgxfi.fsf@intel.com>
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


--nnsabhwerybioihq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 02:51:13PM +0200, Jani Nikula wrote:
> On Tue, 16 Jan 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> > This is resend and more patches on top of [1]. I don't think I've
> > changed anything since then.
>=20
> Hi drm-misc maintainers -
>=20
> I've got R-b from Luca, but given there's no comments outside of Intel,
> are you okay with me merging this to drm-misc?

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--nnsabhwerybioihq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZbuuFwAKCRDj7w1vZxhR
xRaRAQDeGjyxWf9IpxcJEw7uz6GoAe2PN3VUabs9ON46SS69rQEA0Ea7I7uKzNWs
Bn4sR0wINRKwqa7OSQ30SQaztnyXNAE=
=XKJs
-----END PGP SIGNATURE-----

--nnsabhwerybioihq--
