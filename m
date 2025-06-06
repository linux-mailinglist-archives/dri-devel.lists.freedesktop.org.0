Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747B1ACFD9D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 09:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A6010E355;
	Fri,  6 Jun 2025 07:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Qld3EnRt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6632B10E355
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 07:41:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B889C61139;
 Fri,  6 Jun 2025 07:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F617C4CEEB;
 Fri,  6 Jun 2025 07:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749195676;
 bh=RvnDJ3GVC3jwAGbOI51DA3WQ8EQ6fBKPh63l5EDMkXU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qld3EnRtD9ET6ecCi47rKlDlByb1uSluaPbusAnN2KdgHDvwNnVgYrgCPMAgyPr54
 Nb6jL/wf2Xo3PraasbDrC1oRsiFQgJzZ2DwvWCHHA/m+jCNtNf5ZfX89MWywbuGCst
 DMPd6H7SGmgCaxQ1Y0sXvru+I/jURhQugYJyI5Kp8p5mKaT6SnfP7AiErFHOMMXiS1
 rHC/kiCjTvrgSmuZKDqiOYldB0+31U+W/GTpEZamI8dacmMslwFpHVlS8Y5rxIwVlF
 HkKLalMAK5H5Jod1W+9FCTxQvvA8uPrydj0eAKrjmzMj4wmRJeznh7Jp0JwH4q+Ey2
 pKM/HUK68WjPw==
Date: Fri, 6 Jun 2025 09:41:13 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: arthurgrillo@riseup.net, jose.exposito89@gmail.com, javierm@redhat.com, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] drm/tests: Do not use drm_fb_blit() in format-helper
 tests
Message-ID: <20250606-red-platypus-of-serenity-cfe5b8@houat>
References: <20250604154844.28995-1-tzimmermann@suse.de>
 <20250604154844.28995-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fphd5tyhq3krfvco"
Content-Disposition: inline
In-Reply-To: <20250604154844.28995-2-tzimmermann@suse.de>
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


--fphd5tyhq3krfvco
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] drm/tests: Do not use drm_fb_blit() in format-helper
 tests
MIME-Version: 1.0

On Wed, Jun 04, 2025 at 05:45:42PM +0200, Thomas Zimmermann wrote:
> Export additional helpers from the format-helper library and open-code
> drm_fb_blit() in tests. Prepares for the removal of drm_fb_blit(). Only
> sysfb drivers use drm_fb_blit(). The function will soon be removed from
> format helpers and be refactored within sysfb helpers.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Alternatively, we have VISIBLE_IF_KUNIT and EXPORT_SYMBOL_IF_KUNIT, or
EXPORT_SYMBOL_FOR_TESTS_ONLY if you don't want to make it part of the
API.

Either way,

Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--fphd5tyhq3krfvco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEKbmQAKCRAnX84Zoj2+
dlCYAX9aEBUq47gO7E3iAbjCnJdZ0qMGmjjgKDXmyTX6QKh3+M+cPh6DK5NR0KR5
6nilDSQBfjF0QESzoAa3o0ZePYe9zx609j1sVYZi916b6XL0JT9NJVlzvQMZSRX+
fMQ18ApWcQ==
=SQEK
-----END PGP SIGNATURE-----

--fphd5tyhq3krfvco--
