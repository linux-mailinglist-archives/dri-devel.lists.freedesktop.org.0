Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7B08CB60E
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 00:39:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4D810E7CC;
	Tue, 21 May 2024 22:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Y21L3u/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C06010E308;
 Tue, 21 May 2024 22:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1716331142;
 bh=p8KNo+cfG2R+IzfJIWpYnsdYSibDV/vD9YF0M7P6XEk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y21L3u/KloKPi7GEMb9w5jzvYwbk3NcJgLc74pNoS+p+jZXFuQHxE0jqIGtzPbOuQ
 OwEmR82HuOrQZhPsovT+MjRy5lIrHLvgVhKbb86ItCU+kzu/Y7d0ZaczPLC5djLi1t
 CydgJsTTZvHxG0Kc87LuWyvvX/uyXi4FEPj9qWXkBiTxVXhyJb4H7JNNKuN5AWoRXy
 ZrxhfyhgFVD4JtfTZP3w0ZxerAiwGvM2EIZgrGVDD4ousjYVGvAljwZcmME9hkHsYz
 BLH2SsKWDnz2pdKV7gJTgHv/MBYqAycKZwpxqS6LfkhZ5CUeS+ZJDCeljpyG2swzOD
 YyTP8vR96dBDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4VkTr55f2Bz4wcC;
 Wed, 22 May 2024 08:39:01 +1000 (AEST)
Date: Wed, 22 May 2024 08:39:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Knop, Ryszard" <ryszard.knop@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: FYI: drm-intel repo moved to fd.o GitLab
Message-ID: <20240522083900.16040a14@canb.auug.org.au>
In-Reply-To: <adff92fd559f6798690e3050b4474b099a3dde75.camel@intel.com>
References: <adff92fd559f6798690e3050b4474b099a3dde75.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YTcK.kgb7TPTW7wJgNgc4FM";
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

--Sig_/YTcK.kgb7TPTW7wJgNgc4FM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Ryszard,

On Tue, 21 May 2024 14:56:22 +0000 "Knop, Ryszard" <ryszard.knop@intel.com>=
 wrote:
>
> As of today, we've moved the drm-intel repository (upstream for
> drivers/gpu/drm/i915) to a new location:
>=20
> Previously: https://cgit.freedesktop.org/drm-intel
> Moved to: https://gitlab.freedesktop.org/drm/i915/kernel

I have updated where linux-next fetched from.  I used the URL but added
".git" to the end to save an extra round trip delay when the above
redirects.

--=20
Cheers,
Stephen Rothwell

--Sig_/YTcK.kgb7TPTW7wJgNgc4FM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZNIoQACgkQAVBC80lX
0GwIgQf/f/34jIyZDXAwnTErf3irYYWtX7y0Ch2OFWoq9l6Age2TJOtN/Jc3ebII
55PYWd4ENGDGC4zmMtqFQjTh+EMG28NKZJ6d75vrotfZ+Bgm0a+EB8ZuGMFN0+3y
f/Rb5NeK49ojPPX/3x7axsPtTupSInoSixh1Pg0EFhu7JKzS34VnHJBELPzmRxWy
f6lcbC/IBE/5kOuK/O9UoDDqQm7DA9MQtb0eppYoOmRPK2Rfds1KGVDeXcr+ktwx
tHXYjiI0ZIBcp6nPr0ir2i6G2Bc12gn2yf9FCsEcEGlFEtKCeLxRnUIWUzjeWil3
5AAj2SccwDQITK4Tsnv/rHIYfUveUw==
=Mz54
-----END PGP SIGNATURE-----

--Sig_/YTcK.kgb7TPTW7wJgNgc4FM--
