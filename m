Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECB6B9F591
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 14:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C069B10E901;
	Thu, 25 Sep 2025 12:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sRrV/7Va";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2824B10E901
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 12:50:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 085B5443EF;
 Thu, 25 Sep 2025 12:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 042C8C4CEF0;
 Thu, 25 Sep 2025 12:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758804635;
 bh=gjEIv7e/AaGQd6mX79bm9i7rKi9eMuJ9IwjfK+qUFwE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sRrV/7VajwfGNUgRhOTj6ja/EERbs8izvUvVhCIzRR71Wkchs8/vM8BiEhco2hxo7
 WMOnfgM/UU3io7Wvhu0WD+lK0+8s6pHyN4RuhBBOd6icfS6NtocxASBd2OMxWeQaQh
 JxAkcHkk9il9rRPiIp4tl915jK6Im+FXxq+PQ/nA6/rc/HrZi5vAcO2jfHDqv6lbCe
 OuBCDasPoaU4RHLy3nayjAB7glbhWCU9Yzs8aRCJSkh4w7KV62/dq7eeDZnEBwSSjU
 ZO2fM1Q61p9vJRFuDnfmChFAHyeT1abZB3XM82t6cjUTbBA/LOEZ5vuqz1wzwxsfpF
 cRQMGl6wIKB3w==
Date: Thu, 25 Sep 2025 14:50:31 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T.J. Mercier" <tjmercier@google.com>, Jonathan Corbet <corbet@lwn.net>,
 Andrew Davis <afd@ti.com>, Jared Kangas <jkangas@redhat.com>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v4] Documentation: dma-buf: heaps: Add naming guidelines
Message-ID: <20250925-lovely-azure-saluki-398ad9@penduick>
References: <20250728-dma-buf-heap-names-doc-v4-1-f73f71cf0dfd@kernel.org>
 <CAO_48GHsteXa9vu5n8FyuWYGOK7yMBhz3ppQeO=CtxTdcM+K8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dy2lfvdaa4m2m7ns"
Content-Disposition: inline
In-Reply-To: <CAO_48GHsteXa9vu5n8FyuWYGOK7yMBhz3ppQeO=CtxTdcM+K8g@mail.gmail.com>
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


--dy2lfvdaa4m2m7ns
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4] Documentation: dma-buf: heaps: Add naming guidelines
MIME-Version: 1.0

Hi Sumit,

On Wed, Sep 10, 2025 at 11:40:11AM +0530, Sumit Semwal wrote:
> Hello Maxime,
>=20
>=20
> On Mon, 28 Jul 2025 at 13:51, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > We've discussed a number of times of how some heap names are bad, but
> > not really what makes a good heap name.
> >
> > Let's document what we expect the heap names to look like.
> Thank you for the patch. In principle, I'm ok to take this patch, with
> the obvious understanding that if there are future heap name
> requirements that can't be satisfied with these rules, we will discuss
> and adapt the rules accordingly.
>=20
> I hope this sounds reasonable to all.
>=20
> If I don't hear any objections, I'll merge this by this weekend.

As far as I know, it's still not merged?

Maxime

--dy2lfvdaa4m2m7ns
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaNU6lwAKCRAnX84Zoj2+
dkYAAX436rdukGxB0wSKNFzTXO4psW2xeSY46AD1x6M4US1p41pN2cisN21lGiMD
3Aln2LwBf1FtzKUlaEBuoA4LWNcpCasIrOKcdDfrD4XgHZWnECNLcW/3IXJSeM9p
i2t9Akw6wg==
=auU1
-----END PGP SIGNATURE-----

--dy2lfvdaa4m2m7ns--
