Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F427F2B00
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 11:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E7310E2C7;
	Tue, 21 Nov 2023 10:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D833410E2AD;
 Tue, 21 Nov 2023 10:51:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1516ECE172A;
 Tue, 21 Nov 2023 10:51:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA351C433C9;
 Tue, 21 Nov 2023 10:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700563873;
 bh=SOu/PdNHCfm0ohjBAxBILVZbyUJrqJ6F7DZ5uFnNVKs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iHN+RGhgLZh/nlw7O85u0/K3oNpC+VYILeAFhFEJ+x/O8ZXNX0cwAt7OFLoErfHhN
 aCLbIqe3i3jtl0+4q0VOn05Tdxc1rnopGyxzAsLnq45lnxaXhAMzkpZnV/uQEaw6f8
 lpVIwp3TlORlvZh+A3dksebM8+3Zz5awIszXIT97KUq6CBuuoop+FuowwRBr5lk9lT
 nCa319K/GsYVrj0vtlHhfVIad3v4sNJU5A4miQjz7cc50L4FfyePz/KFY9lusOTDgQ
 FXMRpMoLYCG1Imn/0Zxszk9FeFpsS9MfNp/w8ECdDzUAFexHpnPF9A6V8ixmNcUBri
 UMajYGAsql4Dg==
Date: Tue, 21 Nov 2023 11:51:10 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 0/4] drm/i915: Fix LUT rounding
Message-ID: <sdfpsfvpvllzzmgndrl7ln4x23mzv34ajy34g2spqhlo6i6dub@qvrdixxylmko>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
 <ZVttnXE_P9xzXlZT@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="725bssz6bmprlcfg"
Content-Disposition: inline
In-Reply-To: <ZVttnXE_P9xzXlZT@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--725bssz6bmprlcfg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 04:30:53PM +0200, Ville Syrj=E4l=E4 wrote:
> On Fri, Oct 13, 2023 at 04:13:58PM +0300, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >=20
> > The current LUT rounding is generating weird results. Adjust
> > it to follow the OpenGL int<->float conversion rules.
> >=20
> > Ville Syrj=E4l=E4 (4):
> >   drm: Fix color LUT rounding
>     ^
> I'd like to merge this via drm-intel-next as needs to match
> the rounding done in the readout path in i915.
>=20
> Maarten,Maxime,Thomas can I get an ack for that?

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--725bssz6bmprlcfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZVyLlgAKCRDj7w1vZxhR
xSnQAQC+S51nUStxAMB8ytUBntSXOSxXskW/XQsu+j8OkscaDwD/eTcs5dZR1FTG
qQxnWmBsy5uAJYij+lh66xPAqJO89ww=
=xyJp
-----END PGP SIGNATURE-----

--725bssz6bmprlcfg--
