Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C373E5879
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 12:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D0F89FDE;
	Tue, 10 Aug 2021 10:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893E789FC5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 10:39:04 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkTvl6nRZz9sRR;
 Tue, 10 Aug 2021 20:38:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1628591941;
 bh=OKNXIzmcYrF54+bosmBPNPHgC8NwZvVHFBlRYj/dh38=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J+X0xroDxqKg3xDnsy38f5bl0Ve8+fHDpJfvh4TT//HO4xJnvT1hSlO/KFHlKOv9f
 keOEc+duSUqjVxEsut9mu1+/93P5KrS6d/R4RjrZUoMfHyXTClsv3HXt6naJLcml4D
 cW/YX0B8YUFyW/R07xRDSYFjaZmfxqilAbURXz+GejMjNEIPJwJR118+a0g2V6ZaGy
 3Mzb3azdF5+mpjnvmxtDXDs4V3iv749vvzIf1qxJTdxiXUYmA6mZpamP5wXgXp6PEH
 MQ7GCYcqMA572/YZrNtow4QoyyFDKklLy0LUffIr7stlOFC5KK7rw7T6TLHEVKhiY7
 eVW2Y0HwGXOWQ==
Date: Tue, 10 Aug 2021 20:38:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20210810203859.128649fc@canb.auug.org.au>
In-Reply-To: <YRJRju/zo5YiF1EB@phenom.ffwll.local>
References: <20210603193242.1ce99344@canb.auug.org.au>
 <20210708122048.534c1c4d@canb.auug.org.au>
 <20210810192636.625220ae@canb.auug.org.au>
 <YRJRju/zo5YiF1EB@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/usJBfb3Y017NmDTWcQ5uJhD";
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

--Sig_/usJBfb3Y017NmDTWcQ5uJhD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 10 Aug 2021 12:14:38 +0200 Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Matt Auld is on vacation, and the other issue is that the tree where this
> is from isn't in linux-next. So will take a bit to get sorted in
> linux-next.

Those warnings are now coming from Linus' tree (some time before
v5.14-rc1).  I first mentioned them on June 3.

--=20
Cheers,
Stephen Rothwell

--Sig_/usJBfb3Y017NmDTWcQ5uJhD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESV0MACgkQAVBC80lX
0GyfEAf/Q2pNtOXTIOduaAF7h395rNfz/1gJIcoQ1ybzGx3HTY/Saw4sf2TnncYM
RmbpdGyQL2clpgIAvCDwuhbXKUIDSIPfqNz29SRDgHjhKW5hoHa+aSTVzdaoAv9+
GQkn0ydHmMD5xR1aQZOm8M5YZPE87l8nPIodJElg0x7hxYcXAGFBY8B7F/e6NYL9
TRY2LCvwpcxQ2VGBOd4b3XnZUyhqvl28qLObMw+ROxHdy+jzTjromrpi27jjju7N
zExsHEeACJ/TwU3P03s/zKpbBcJAqfAJar06w4KkCeMD8OSm/2IndOb3INnEu3+J
e0zWbelIk+JfHlFy7Lb1VSUOqYZsfQ==
=4z7z
-----END PGP SIGNATURE-----

--Sig_/usJBfb3Y017NmDTWcQ5uJhD--
