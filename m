Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC1F867302
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 12:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEEC10F039;
	Mon, 26 Feb 2024 11:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jLgnqmOc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AEA10F039
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 11:27:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 96BA961128;
 Mon, 26 Feb 2024 11:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8059C433F1;
 Mon, 26 Feb 2024 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708946820;
 bh=U6jDkI4Rv2MdParcSGGGnlp89Kg52ruxo6sSR5sbRp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jLgnqmOcVf7MGoAdfaXJeujL87infBxRoDejA5lTJjNYqQJ4LNFxj1/c4qDun54jG
 JjgQwdRLSLpgZ8EmsemxLD0yf8ur3aVkxWrKoc0t31S04/PaT2NQ8WauhquzlS6aD5
 JFPAms4/8ovtFIZfNVVpf42mGrdtVQaKYTcAJPzazrInBoCs/ObS2WPlyqMhUoi3bE
 g0U1RAyn9cjrzwhze4JKfa1UUl5A37s+Tr4T5PvtkvU4e/zqSXx7P8TF3TMXyxHE7C
 QQjhzJXlcc3U8arzK6xVdtKuQttmU6F0CpyRjbHtpRWdnqZ5hwlwQ+WXXtdv2AZ88A
 z8YCq1FLDXhNQ==
Date: Mon, 26 Feb 2024 12:26:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Marco Pagani <marpagan@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/test/shmem: set a DMA mask for the mock device
Message-ID: <d65v7jy4natx22lacw6awmg6iecfr2hqk3puuz3qem5dfsvj2x@hh6vp265hm5p>
References: <20240226110028.28009-1-marpagan@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bdxjb7opyfuj56ed"
Content-Disposition: inline
In-Reply-To: <20240226110028.28009-1-marpagan@redhat.com>
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


--bdxjb7opyfuj56ed
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Feb 26, 2024 at 12:00:27PM +0100, Marco Pagani wrote:
> Set a DMA mask for the mock device to avoid warnings generated in
> dma_map_sgtable().
>=20
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Marco Pagani <marpagan@redhat.com>

I've submitted last week this patch:
https://lore.kernel.org/all/20240221125324.718192-1-mripard@kernel.org/

Which should be equivalent, but fixes the issue for all users in the
tree.

Maxime

--bdxjb7opyfuj56ed
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZdx1gAAKCRDj7w1vZxhR
xXCRAQCilaZ5vMmOtS84duICyUXtAmRIVKAL3+kaIPvI4SqHOwEAx0cddu2i5v4M
iGUoxIygBTAY4Y6Eo4+eNGQWiOe5fAc=
=DzdO
-----END PGP SIGNATURE-----

--bdxjb7opyfuj56ed--
