Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABC874FBC0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 01:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE48610E0C1;
	Tue, 11 Jul 2023 23:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0029A10E0C1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 23:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1689117158;
 bh=iktfRfulltKZV6uBdwfsXmUTIlG7AOOCY9pGGvEfaII=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WPe4EqYDdwrcqvHzILo6WImR49EMQP6bhs+of1EvaB2bMpokeIfQw8ij1EJLmjxvk
 2d1RX9R6WKXawohqVvL2afWqCFwhz3FYNP/KoNLUAxUPcamIop1qcmVInmBeyHx7AZ
 OxSJMteLLegNdpjb5wUKm9JWPdyCESEf4Geor03LmRUwNk8cLep6lx2tMWSWvLw/pm
 fDRyE84oZ8hw2vsE+HEIpTumo7+VfsdpfZYLVqE23KwnMpLGKq0JRpKgZDbLfLSvz2
 4oud7yquvIyERDB2699GwFkcBucp9M06JR2T2gmqvKzOOF2pBIn3QJ+zkb4wDser6i
 7C05yNUoV9QDw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4R0xVG1zVnz4wy7;
 Wed, 12 Jul 2023 09:12:38 +1000 (AEST)
Date: Wed, 12 Jul 2023 09:12:37 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: linux-next: build warning after merge of the amdgpu tree
Message-ID: <20230712091237.65a6ab94@canb.auug.org.au>
In-Reply-To: <20221026121428.5181969a@canb.auug.org.au>
References: <20221026121428.5181969a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GPM36BL2F9wwE+aLZqpDwI6";
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/GPM36BL2F9wwE+aLZqpDwI6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 26 Oct 2022 12:14:28 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the amdgpu tree, today's linux-next build (htmldocs)
> produced this warning:
>=20
> drivers/gpu/drm/amd/display/dc/dc.h:1289: warning: Function parameter or =
member 'plane_states' not described in 'dc_validation_set'
>=20
> Introduced by commit
>=20
>   f6ae69f49fcf ("drm/amd/display: Include surface of unaffected streams")

I am still getting this warning (presumably now from Linus' tree).

--=20
Cheers,
Stephen Rothwell

--Sig_/GPM36BL2F9wwE+aLZqpDwI6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSt4eUACgkQAVBC80lX
0GxCJAgAnTGLw1Z6otYM44lOkLPndufjLjXPCu5ZlSDXW3p9ypkmo1EvDB8fwICR
CoErkDfCfViwLxsFoJ6eniHqoGp5qEzjrD+utK1GvWO9itny3GjgxWYD2euuj15A
6h8uG7LtfWqvWAs1VEddd5AeWD8AejyF/k2g3G27rv06YcqbzdKVjY+zi5xnan7J
HzK3pmz0CWOhr5ZLeGln4HhoUuOBR5QAVn3GE2QPDSaqkoUaRJNhdB22C5lF37Yp
/4nit3B7AH9WCHTnVClfLQKUwTQnBbyp1wBk3j1b+sV3b8HjzNZWFDJgb4GMQYxj
88n8l1Tc4TWZkRxuWiAtfzIxRE8hUA==
=QvFg
-----END PGP SIGNATURE-----

--Sig_/GPM36BL2F9wwE+aLZqpDwI6--
