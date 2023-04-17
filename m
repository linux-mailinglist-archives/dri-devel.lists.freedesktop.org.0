Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537B6E468C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 13:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9BA410E378;
	Mon, 17 Apr 2023 11:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E2B10E378;
 Mon, 17 Apr 2023 11:34:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FA6761007;
 Mon, 17 Apr 2023 11:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1774C433D2;
 Mon, 17 Apr 2023 11:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681731271;
 bh=y2/atbVteeg0LDohlIiMva71uhiV24MpeNSZbEAo7YM=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=t1r5ap2QbauIXSYpgSM5GpJiWufEsQ9twdKoELtqiYt2uGD/7zEzVHLj5KMzmF5gt
 GqOk32CZUPkfFUcVjgJVPUAU9ehD+h61wGYNkW9J3DVyOB+pIV6exN8ICZdBjqNBgo
 hSIMAzRE6VwPjdEJ5zF3IZYs1/7Qvb3/tTUri+Jah4tx6zApFlYQ1WH6CgNr5J1BlS
 IO6bzp2OSkfBGd9NVd4Mg1SsXh6819KWpT7mFv8hb6Q8pRVObQJFxm6uYPG8kanzCQ
 OMywhdAlEB+GwbVEogpScrvul/rPtgIumUvb7gZcSr6dw2xiEggIP9xE/li9CjuAB6
 oFVUktxElkJ/w==
Date: Mon, 17 Apr 2023 12:34:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the drm-misc tree with the mm-stable
 tree
Message-ID: <ec0ed678-ade5-4549-b859-e1c451bf2bf4@sirena.org.uk>
References: <20230414125913.851920-1-broonie@kernel.org>
 <ZDuqut+8BKjMXblJ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="uuEsM8kBwgma7Hr3"
Content-Disposition: inline
In-Reply-To: <ZDuqut+8BKjMXblJ@phenom.ffwll.local>
X-Cookie: Two heads are more numerous than one.
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


--uuEsM8kBwgma7Hr3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 16, 2023 at 09:58:50AM +0200, Daniel Vetter wrote:

> Note there was a ppc compile fail, which is why we pushed the ttm revert.
> That /should/ be fixed now, but would be good if you can confirm?

I don't have any PowerPC toolchains set up - I guess one of the
community builders might have checked?

--uuEsM8kBwgma7Hr3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQ9LsEACgkQJNaLcl1U
h9BjAwf/cuSS/9ylDsEF54rC5Sdp/CYr0ozDoobN9zNlOKQ0RZ1xD1KGWyfs2pbk
dgkvLcx9YLxtdOGvTKwBmjX3Lv1mRkCXB9Z8z7BtpkH0avwabqTQX/w0DL/nX1ky
Tb7muuWDtKYEJ2Y++3tzP4gnOxPY+IMYzJJQNHz85nTfWUdZiWGdqAuGYc0u8B8F
gfPYhDvTSIbW7/VzkuEaChWIqrybXgTHbyFfZkZJGRCHFJ6Bt99v+ra8MPsCcDtZ
t4L9Ynce/nqXdqEsDQEGt2HVkNtnUs/ctiM9WWbeSsH/VsBxIbJYlbQ6BqnVQiLf
OoSYL58q1IHD6xl8OSuPcn4Gn2UvFQ==
=O/dY
-----END PGP SIGNATURE-----

--uuEsM8kBwgma7Hr3--
