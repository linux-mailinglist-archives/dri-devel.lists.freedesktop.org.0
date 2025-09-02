Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05706B40B55
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 18:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AA010E7F7;
	Tue,  2 Sep 2025 16:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LOiBN9et";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDBB410E7F7
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 16:58:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 68A4140239;
 Tue,  2 Sep 2025 16:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC89AC4CEED;
 Tue,  2 Sep 2025 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756832284;
 bh=u6ZKvnTpSHylfQDfS2vpQDI6ppmXWwBxQPpXIYoWVwM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LOiBN9etvEA4DdmihjsqO3gmo4ezGZgfupAhZon8EusSaD/k/Kx4j1l5Q4bMOTpT6
 ByGxcyDAoZX5/3zzbg1ds12RsL6+Ttfxa1jxMxCPa+lmeGtaL7RPbHARVy45F997Li
 il+rmM4Z4T4I8jkDUqw8MSNmrPhKqr2zmOTq4WaQT+AJzABgkeu15hHazunC0O1j2j
 AZtVUFr7Ct7noMdNwapGbl8j08cxjngIdfr4O6y1fVCKP0sVT7YaEw0BunK+qZNMfR
 XJjp8YSbvjvPl9wu8kGIiixcspmdVRd/rtVSejQbPVLUgTiuTiEjJb6q7QaVTXhEXE
 AfZrz8fqy+aXg==
Date: Tue, 2 Sep 2025 18:58:00 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/panic: Add a kconfig option to dump kunits
 results to png
Message-ID: <pucvcimuuyz7f7ih7hx7l6bmutarlryvzwiqh7a26bk65ya5sf@uj7agoqm4lm3>
References: <20250821095228.648156-1-jfalempe@redhat.com>
 <20250821095228.648156-4-jfalempe@redhat.com>
 <923276d2-9240-48bd-95df-13b4e9e23dcd@suse.de>
 <7ff51c5b-939e-47d9-8c3b-3c596565d114@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="nokjlbbniz23oo3j"
Content-Disposition: inline
In-Reply-To: <7ff51c5b-939e-47d9-8c3b-3c596565d114@redhat.com>
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


--nokjlbbniz23oo3j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] drm/panic: Add a kconfig option to dump kunits
 results to png
MIME-Version: 1.0

On Mon, Sep 01, 2025 at 03:04:26PM +0200, Jocelyn Falempe wrote:
> On 27/08/2025 12:45, Thomas Zimmermann wrote:
> > Hi
> >=20
> > Am 21.08.25 um 11:49 schrieb Jocelyn Falempe:
> > > This is a bit hacky, but very handy if you want to customize the
> > > panic screen.
> > > It allows to dump the generated images to the logs, and then a python
> > > script can convert it to .png files. It makes it easy to check how
> > > the panic screen will look on different resolutions, without having
> > > to crash a VM.
> > > To not pollute the logs, it uses a monochrome framebuffer, compress
> > > it with zlib, and base64 encode it.
> >=20
> > May I suggest to export the raw image via debugfs? Debugfs can also
> > export additional information in additional files, such as width/height/
> > stride/format. This could provide the real/last image on the fly, simply
> > by reading the files. No workarounds or encodings needed.
>=20
> I'm looking into that. The difficulty is to get the debugfs content outsi=
de
> of the test kernel. As I'm using a uml kernel for testing, I will need a
> special initrd, and a way to share files with the host.

Yeah, I agree that it's not very practical. If only because the test
context doesn't stick around once it's been executed, so you would
effectively leak an arbritrarily long buffer with no hope of getting
back its memory.

Maxime

--nokjlbbniz23oo3j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaLciGAAKCRAnX84Zoj2+
dupTAYDNg7CBjylk3IGxMo0MkKbeQpRX7NVvgckRtK18vG9ptECBSzB63vgBjDzm
RX2heQABgPSartQTyBe6TowW2/BZHArlHJvPekoR4WjEN6olx3gd/wev8TfGtho7
NUpq0otu6Q==
=+3t0
-----END PGP SIGNATURE-----

--nokjlbbniz23oo3j--
