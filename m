Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D908A10A31
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 16:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE00A10E094;
	Tue, 14 Jan 2025 15:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="URlfct9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2361E10E094
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 15:03:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2CEE7A416DA;
 Tue, 14 Jan 2025 15:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E232C4CEDD;
 Tue, 14 Jan 2025 15:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736866984;
 bh=Ys6TZki56tDCl2Iqz9+k9TDB2n8cXuHzRpex00I8ID4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=URlfct9YJqaCHMfnvi76VcNlxhY51joRzzHph9loq/d2Q/pKszxxgOLguc64tiCih
 cAGsOoms572Sb5BRTvk6Ib70hTLgeuXYefdsrAWTlcnOS2GTTQFFnvEfHCGzb9iU7U
 Xqy/5YByO9TdP5sAMXXKYf8hz+aBnZ+HFn+BOvbgEmCVjqhG+G4SAMkJqi3BQe2Zq1
 oLO7Om/wVRcbHZBwjESL0OidcEAwIQSMym5uNiwo6zhNrATc6w+Z01F2YwqaY9H7ZT
 er/czM1F9xnCnLDslXWFRDOq9mdy2dysINPv+y4PI/v0OWygxRbRZWl4hW1uBP4wcY
 QKSXar0uGKeMg==
Date: Tue, 14 Jan 2025 16:02:55 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>, 
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, 
 cgroups@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/4] cgroup/dmem: Select PAGE_COUNTER
Message-ID: <20250114-convivial-axolotl-of-performance-7c2f63@houat>
References: <20250113092608.1349287-1-mripard@kernel.org>
 <Z4Z6Y5Xy5m4wMu_l@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3l7n5s5omoiahcxy"
Content-Disposition: inline
In-Reply-To: <Z4Z6Y5Xy5m4wMu_l@phenom.ffwll.local>
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


--3l7n5s5omoiahcxy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/4] cgroup/dmem: Select PAGE_COUNTER
MIME-Version: 1.0

On Tue, Jan 14, 2025 at 03:53:23PM +0100, Simona Vetter wrote:
> On Mon, Jan 13, 2025 at 10:26:05AM +0100, Maxime Ripard wrote:
> > The dmem cgroup the page counting API implemented behing the
> > PAGE_COUNTER kconfig option. However, it doesn't select it, resulting in
> > potential build breakages. Select PAGE_COUNTER.
> >=20
> > Fixes: b168ed458dde ("kernel/cgroup: Add "dmem" memory accounting cgrou=
p")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202501111330.3VuUx8vf-lkp=
@intel.com/
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
>=20
> Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

These patches have been pulled as a separate PR into drm-next, and I'm
not sure how we should merge these patches.

Obviously, we'd need Tejun's, Johannes', or Michal's ack, but should we
backmerged drm-next into drm-misc-next-fixes and apply them there?

Maxime

--3l7n5s5omoiahcxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4Z8mgAKCRAnX84Zoj2+
dr5vAYDoVfvuLFW0YdrzngTEoDlH2y2HB/djdCXbgfupA6v4CGYlRFSIcBUR8B88
+QieR3UBf3Ooz7bg38Ff1tKLgHtCYEvii99CoYudDRMxdFpdt2sBYMS4NK4uXifH
vtE3uEWy8Q==
=OE5k
-----END PGP SIGNATURE-----

--3l7n5s5omoiahcxy--
