Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6317930C0A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 00:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C859D10E00F;
	Sun, 14 Jul 2024 22:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SfTD7laq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E87910E00F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 22:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1720997878;
 bh=vg+yh7zenOrIMErIhxXf0TDONahMBLz/80pIccqu3RU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SfTD7laqIkRsJIeeMJHDTWfMtsDDi6Mz1dim/zDaG9WjhIaqVqz9mfb2T7Ym19yoj
 4D+xHc2XuH2dDh2m6+twGZssIugYXqZ32jAHUFpyrSm7FDWKBUccQ9n5yH4uWLJnJe
 4b2XVhMRo+nrXqG4E2H4gTHAzCbthnjGBUKetIOjqGFcTLXNju8MIW9nMhGkWoFjvw
 Pziq+2BJjtg2iZ+r8lbZByUKd40xobWni2D5XVT3HAbWQ59fnfhc3h8eUxSOdA4vhb
 8GNHQx9OMFOwueVl9nJw92DpwgifTQ53M9LkUdRso61nJBQa5KjnQ9EMj+uK5sgGx+
 oQ+G3Kebit7jQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4WMgj15LFhz4wbh;
 Mon, 15 Jul 2024 08:57:57 +1000 (AEST)
Date: Mon, 15 Jul 2024 08:57:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Dave Airlie <airlied@redhat.com>, DRI
 <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20240715085757.4e03f6eb@canb.auug.org.au>
In-Reply-To: <20240422095448.18c9a566@canb.auug.org.au>
References: <20240130135421.19907631@canb.auug.org.au>
 <20240422095448.18c9a566@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GPeK1aJe.wYf9J5eCrLGgya";
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

--Sig_/GPeK1aJe.wYf9J5eCrLGgya
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 22 Apr 2024 09:54:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 30 Jan 2024 13:54:21 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the amdgpu tree, today's linux-next build (htmldocs)
> > produced this warning:
> >=20
> > drivers/gpu/drm/amd/display/dc/inc/hw/opp.h:1: warning: no structured c=
omments found
> > drivers/gpu/drm/amd/display/dc/inc/hw/opp.h:1: warning: no structured c=
omments found
> >=20
> > Introduced by commit
> >=20
> >   0fba33311e63 ("Documentation/gpu: Add entry for OPP in the kernel doc=
") =20
>=20
> I am still seeing these warnings (as of last Friday) but the above
> commit is now in Linus' tree.

I am still seeing these warnings (as of last Friday).
--=20
Cheers,
Stephen Rothwell

--Sig_/GPeK1aJe.wYf9J5eCrLGgya
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaUV/UACgkQAVBC80lX
0Gyzhwf/ZrKatqIfRvuEzJzR2Q699+Cnj8uE9ZzDS/TUMm8V1jzhILgG1Fa2829S
gQcjp8RoWwfgsFFC11BUYrxsey+gRfTntIGHS87qQze4Klj6HwMeBvespyHXA1IY
UXqr3n/RJmImwkTf4Vro4NRnf1Y6SjPzRDICqP0MVVaNX0jX4Xxvqkc1OTbOTe4K
fsGxf4gDiTrEaxjQoFiBAqIBKLtR5W5pZcHhTPSHXTG8lylWZtZEkaMzPiWx1/Gi
mp16SRzqg05ijg/VlmiWCv8FPzgnL6UlFn90vVBknQAY7VvytCpxGsqIkzIa3NoT
XHGgkQ1+AWHElIamLJ8EbkTk7sI/5A==
=aMGQ
-----END PGP SIGNATURE-----

--Sig_/GPeK1aJe.wYf9J5eCrLGgya--
