Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB264999C58
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 07:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07ABB10EA35;
	Fri, 11 Oct 2024 05:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Tp0HmZJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1EE10EA35;
 Fri, 11 Oct 2024 05:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1728626267;
 bh=ebMRVSKdlSNzb2lYSQYtSXhlEhms4xHDtbLgrCBEC1w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tp0HmZJibGu27WTzEQP63b/ugb/oz0d6bE+ApFbp7vRVpKFNX/2AnpgPLWXLxhMc5
 H8XqXstEt68wrR2ise/rDf7/TufRjGznJoGsMgw3M0JkBe3mJUm/d63MAaq7I8ASiJ
 rwdp0cCIQ7r8poTw21WGAPPPcIorB9ccGD+Bn3+0oJ82wRsV+UqpdfwnIgDgibG1mb
 KOn5PBs+zlRbXCaTFU2c2vE8ozPFrZv9WxfddHC/K2pk4kdg2qhrhvm1wPIxR5/aAx
 GRFHkyqmlnb2U7KSiO3Iul7SWHOAq759G5/Ve19IfMWZNXO/+Fw0PTG1xGeX8FLnU8
 k10MQVk79fkyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XPwrn2Fqkz4xKl;
 Fri, 11 Oct 2024 16:57:45 +1100 (AEDT)
Date: Fri, 11 Oct 2024 16:57:45 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20241011165745.64781cf0@canb.auug.org.au>
In-Reply-To: <20241001134331.7b4d4ca5@canb.auug.org.au>
References: <20241001134331.7b4d4ca5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pom3nNLcN5g6uw8R=nY2fOI";
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

--Sig_/pom3nNLcN5g6uw8R=nY2fOI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 1 Oct 2024 13:43:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> After merging the drm-intel tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_disable_int=
errupts' not found
> drivers/gpu/drm/i915/i915_irq.c:1: warning: 'intel_runtime_pm_enable_inte=
rrupts' not found
>=20
> Introduced by commit
>=20
>   3de5774cb8c0 ("drm/i915/irq: Rename suspend/resume functions")

I am still seeing these warnings.

--=20
Cheers,
Stephen Rothwell

--Sig_/pom3nNLcN5g6uw8R=nY2fOI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcIvlkACgkQAVBC80lX
0Gx0Gwf/TzMYLAvCwD+l3JQGo0WsVY4xXIQRCb0ynZJcxdRuX8aV3Tw0f+3m+KS8
PSjinOF8W7dm/WhszXmxHEE9xpWSUWI5jCpNizWrYk6vcsXiFlh65rUFM5Pg4Rbq
9Wo3hcGFoOAEFSQZ1v3iy+IZF9vMDCID+98F2qgyxDfRTA+9wGC9SyS81FVrA2KQ
13d/QDa+alAzcv/JAzBytjoFh9ihFl4M3RHL5rWWfsp5qoz3EiWJSRyN0vpk60By
ttG/YK/sJccQDYQT4hNsxG1qBbJ745XlASj4Ii39rc8fqFfrRvG1Usps4lmOthPu
kK14KfOxYtBsGYTIfHPj92CEH0bTUg==
=C6pa
-----END PGP SIGNATURE-----

--Sig_/pom3nNLcN5g6uw8R=nY2fOI--
