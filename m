Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB46DCFB187
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 22:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585A210E16F;
	Tue,  6 Jan 2026 21:36:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kpLJyuXS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FFB810E16F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 21:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1767735378;
 bh=0XXibsRiOk8iQKmDU/G+fW9fpVmFaSdx53asyjplc3k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kpLJyuXSAXItBfE17pLwWkPMKyqRpdHRtmzXwuZxECZh4YTMDetkCF5y9XBEIy0Ne
 ZPjE728D6us5x20T36A7k0WvlptaZIRLITl3W0ZVozuHQgog83VxncfomC0ix1bvqV
 l6rKuaqzYMpxJWgPWpnUsknIfiZcC/8ORIp0Msr/wEUKWFkIfez+lJqhE+/6ir5TwG
 S+DVIsphJamQh1uXTKkJW5Db6cR3l1okgKuFkluyPnKG0SU/qybWWcMxkYb4FUpZ+s
 x16i2iRVffvBWoW2AHIs5OXY0c5Emfm2VvjFQSeg/ESxQEfpAAero13z4OYZToBk1i
 wWjqbMPjHL9Qw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4dm4H62MfSz4wQG;
 Wed, 07 Jan 2026 08:36:18 +1100 (AEDT)
Date: Wed, 7 Jan 2026 08:35:49 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, =?UTF-8?B?TG/Dr2M=?= Molinari
 <loic.molinari@collabora.com>
Subject: Re: linux-next: manual merge of the drm tree with Linus' tree
Message-ID: <20260107083549.2dbe6d95@canb.auug.org.au>
In-Reply-To: <58b06cfa-1710-4438-83ba-25b6d17075b9@suse.de>
References: <20260105131607.718d22cb@canb.auug.org.au>
 <58b06cfa-1710-4438-83ba-25b6d17075b9@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Pq0LLEi+qzC_B0jQvk5Qdfv";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/Pq0LLEi+qzC_B0jQvk5Qdfv
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, 5 Jan 2026 08:07:41 +0100 Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>
> The latter fix is incorrect. You rather want the headline and
> size-parameter description from the first commit and other docs from
> the second commit. Like this:
>=20
>  =C2=A0/**
>  =C2=A0 * drm_gem_shmem_init - Initialize an allocated object.
>  =C2=A0 * @dev: DRM device
>  =C2=A0 * @shmem: shmem GEM object to initialize
>  =C2=A0 * @size: Buffer size in bytes
>  =C2=A0 *
>  =C2=A0 * This function initializes an allocated shmem GEM object.
>  =C2=A0 *
>  =C2=A0 * Returns:
>  =C2=A0 * 0 on success, or a negative error code on failure.
>  =C2=A0 */

Thanks, I have used that from today.
--=20
Cheers,
Stephen Rothwell

--Sig_/Pq0LLEi+qzC_B0jQvk5Qdfv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmldgDUACgkQAVBC80lX
0GwqiQf9EOP6vN6G9ItsWryS9K/NGOpoJMtIybA+7bHqUWsH+ZY2aywc+X5tOB2W
eLqSzc501Quxx53TQAStBubu0+IEvZmMNXOxzorgVm7GwMTUebsCS4urPLcPMzxB
GmecORwWUKyUQ2eAy3yhT5KrOETc4vPPUILa4j0RfwyHHnkbJTXTyqodPxmHDi1L
BRCkrD7gRBtYWXmFYPM8bn7iLU3cggrd8tIWDJ1imVPakgAwpo9TFsuftilA5xxs
6WFMICT3FKo4/sIbnc4FhZ47kFdOsN7zJuP42NQSNb5SJiGSKrVplh/+WpNy6P+o
FbEi8LQjBqgmcGmiNaZ8mbjGt6yGfg==
=bI+a
-----END PGP SIGNATURE-----

--Sig_/Pq0LLEi+qzC_B0jQvk5Qdfv--
