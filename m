Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED45683582D
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jan 2024 23:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB6210E2DD;
	Sun, 21 Jan 2024 22:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3750510E2DD;
 Sun, 21 Jan 2024 22:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1705875934;
 bh=r1mbkvsH1Tw6GErB5aGRuFX4QTAhmff/iRgdLLRbQds=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jyv+MI1wWW+BA4ZFuA/cwmMAocUqbSHOT9RvEvqB2APqOyV3SPeLgANM9wjz8traO
 4W4YslnVZei6GI+Xh6m605VjU7+ggypB8+laAoLXhf40ssme2G0IBHSBhxoyP99ULa
 sovznKvecigIzs5kiSIFfGKpnXtFvePlz5hkpZ98dlT1jVHzgQe7DMHj3QxC9spv8I
 rzl/7x0xKItkrdzuqGtxwS5X5eepG4U4JDnuy+Bl5SmzRmO7Hpq2q5JetXh2yHKNGy
 0nIAupwnIu3DujY1ut0yIcN1K1f0IJDWDhnJHsB6SgWJTC5K4coX8v8UWVSv5ivust
 DEmxH+54I8ZDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TJ7GN5N6Zz4wyl;
 Mon, 22 Jan 2024 09:25:32 +1100 (AEDT)
Date: Mon, 22 Jan 2024 09:25:20 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: linux-next: build warning after merge of the drm-intel tree
Message-ID: <20240122092520.68a86f48@canb.auug.org.au>
In-Reply-To: <87y1f0sol1.fsf@intel.com>
References: <20231114141715.6f435118@canb.auug.org.au>
 <8734x8u4la.fsf@intel.com> <87y1f0sol1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wRTTQqaNc4XzgCWXZZqmNJE";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/wRTTQqaNc4XzgCWXZZqmNJE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 14 Nov 2023 10:53:30 +0200 Jani Nikula <jani.nikula@linux.intel.com=
> wrote:
>
> On Tue, 14 Nov 2023, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> > On Tue, 14 Nov 2023, Stephen Rothwell <sfr@canb.auug.org.au> wrote: =20
> >>
> >> After merging the drm-intel tree, today's linux-next build (htmldocs)
> >> produced this warning:
> >>
> >> Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_=
mst_topology.c:5484: ERROR: Unexpected indentation.
> >> Documentation/gpu/drm-kms-helpers:296: drivers/gpu/drm/display/drm_dp_=
mst_topology.c:5488: WARNING: Block quote ends without a blank line; unexpe=
cted unindent.
> >>
> >> Introduced by commit
> >>
> >>   1cd0a5ea4279 ("drm/dp_mst: Factor out a helper to check the atomic s=
tate of a topology manager") =20
> >
> > Imre, please fix this. =20
>=20
> Just noticed there's a fix [1]. Need to merge that via drm-intel.
>=20
> BR,
> Jani.
>=20
> [1] https://patchwork.freedesktop.org/patch/msgid/20231114081033.27343-1-=
bagasdotme@gmail.com

This is still not fixed.

--=20
Cheers,
Stephen Rothwell

--Sig_/wRTTQqaNc4XzgCWXZZqmNJE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmWtmdAACgkQAVBC80lX
0Gx3RAf/YnenmQC4D8I1Oh5yglRdacM2m/Scpo+6Cw2VWloUSrj2PAKrU6+CjvI/
MJuf/g1YBhFLJeBvOhweBu2kTO0h+8+GbaD9SgEwixf+9jIdAZTx4Y3YYarXJ3u5
shAYBQwKwvo0ff0wqeC9LTth/Vg8RHKv8PV5L9XXA8K4qYWsxQc3cTQVJB3J1e8O
ktRUQyhv995RViXnyLMaIiM2hzjDF3Q5UcaPEGUpUrkUE8v6z0sElnrQNw2mkeTt
KfnPDpmcD/MtFXQA9Q5vCPzHTsSd96ea+C+pNPoYihMKvMPjzvqZJvz2I+3cAi02
t6UBTgpftELqtsgP/2t1nqaVE6vrEg==
=wuPD
-----END PGP SIGNATURE-----

--Sig_/wRTTQqaNc4XzgCWXZZqmNJE--
