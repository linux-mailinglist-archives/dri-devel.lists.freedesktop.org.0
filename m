Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE397E1E5C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 11:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 223AA10E009;
	Mon,  6 Nov 2023 10:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6310510E009
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 10:32:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4A96BCE0AE3;
 Mon,  6 Nov 2023 10:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37502C433C7;
 Mon,  6 Nov 2023 10:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699266762;
 bh=PTBD7C7fHaLaaDpSPhX3CMSbWdu69dXBxjUtIf+7cYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DYs2SZMLRNz5aiPEe1hfLDeOnsS/HgdLLvXAkdykmZHXTsuDktn5q85N16gJBcERZ
 JghTPUYUj/WiqwIKuy4rWBdgbBD308mJSQsBGPFGLUHXqAfNLl/rPaho6S7tx3JUUk
 hZnPPG5b3V7+9UV6e//ikWXvt+aFtD8FA769pbbR5xF3C6J4MI/gayR/v3d0Psc7+m
 xs4hn5iYLdL+uFzHzM+H9bmyMUl1d15HjhYZ7GRXsZ8atuPi4dEasln34vzdLGcugP
 IMLD30dYtURF0XfMyw50SwkjZSviObD4QYJtRnm7X8S7AMfD9p/3KBi+vQzqZDzbP2
 DKSQ4AWHpp1YA==
Date: Mon, 6 Nov 2023 11:32:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: oushixiong <oushixiong@kylinos.cn>
Subject: Re: [PATCH] drm/atomic-helper: Call stall_checks() before allocate
 drm_crtc_commit
Message-ID: <6yqalig6nvnlpt7loetugjdgp5z4w3qwhpqpzzsygffp5w32d6@guq6v3g2z7tq>
References: <20231106073742.158905-1-oushixiong@kylinos.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bagq6jfn47h4mlnv"
Content-Disposition: inline
In-Reply-To: <20231106073742.158905-1-oushixiong@kylinos.cn>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bagq6jfn47h4mlnv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 06, 2023 at 03:37:42PM +0800, oushixiong wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>=20
> Calling stall_checks() before allocating drm_crtc_commit not after that.
>=20
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

Generally speaking, we need much more context than that.

What bug did you encounter that makes you say that it should be moved?
How can we reproduce it? How long has that issue been in the code? What
makes you say that this is the right solution?

Maxime

--bagq6jfn47h4mlnv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZUjAyAAKCRDj7w1vZxhR
xQw6AQClvst8daaSOBV5ptS1/p9TCemvn6ZjiXg0Vqm+6z8yxwD/aAgROmtskcol
T+ZUxPYGekPgmrBGoCVcitgZ3Ztc8Ac=
=ghBa
-----END PGP SIGNATURE-----

--bagq6jfn47h4mlnv--
