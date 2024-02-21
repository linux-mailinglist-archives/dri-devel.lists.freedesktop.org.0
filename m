Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9B485D05D
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 07:21:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7626910E629;
	Wed, 21 Feb 2024 06:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="tjD4s9aj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF2F10E091;
 Wed, 21 Feb 2024 06:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1708496480;
 bh=nKyibOl+ZTy1QoSmUoL2WccZoRzifYwx7mjfckl50Ic=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tjD4s9ajy9eOvP4VzHG1NvjHeEv01xDnOauj9fCN81zKBfAxAxanPFi0UifA+WID4
 CX6X8p6me6Wt6y5pkOjiTK0DidBcyEnsYvJaK+Qe+zjZxyUmmcUtcxwBogsHtdNG/p
 Eg8KfD0L7IrGJlgPERDzkocm8Cmyl3+o/PwHro9inAlnwtUFPTK69zoeq5X20JgNBS
 vBYoQlxLJ0jF/E99W1s19/pjR0kEbOEEvSuj3You4lFF46/37017TNdl2ZQUUJkJP2
 dRaFwqb3QLB4F5tnCULCKAqoakNOo9mRulcUII7UIqd6tcHb1j16HYiKpiaQ7kaBEu
 Ko+CecGFPbvEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TfmPV0zt5z4wby;
 Wed, 21 Feb 2024 17:21:17 +1100 (AEDT)
Date: Wed, 21 Feb 2024 17:21:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jani Nikula
 <jani.nikula@linux.intel.com>, Arnd Bergmann <arnd@kernel.org>, Oded Gabbay
 <ogabbay@kernel.org>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: skip building debugfs code for CONFIG_DEBUG_FS=n
Message-ID: <20240221172117.243799cf@canb.auug.org.au>
In-Reply-To: <ngu6vq5izal6suyr57p4vlxnrn4kxyii4ewdktxvw7k3uezlcz@6oevav3wpcjh>
References: <20240213134817.3347574-1-arnd@kernel.org>
 <877cj88lck.fsf@intel.com>
 <17209419-093b-4674-8b43-06c92312ef61@app.fastmail.com>
 <ngu6vq5izal6suyr57p4vlxnrn4kxyii4ewdktxvw7k3uezlcz@6oevav3wpcjh>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F5A94gSepNQOsNsZBCFEmzQ";
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

--Sig_/F5A94gSepNQOsNsZBCFEmzQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Tue, 20 Feb 2024 23:29:54 -0600 Lucas De Marchi <lucas.demarchi@intel.co=
m> wrote:
>=20
> Looking at https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-nex=
t.git/commit/?id=3D2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
> it seems we still don't have drm-xe-next branch in linux-next.
>=20
> Stephen, could you please add it? Or do I have to do something on my end
> before that?  This is the branch:
>=20
> https://gitlab.freedesktop.org/drm/xe/kernel drm-xe-next

Added from tomorrow.  Currently the only contact is yourself.  Do you
want anyone else (or a mailing list) as well?

Do you want the drm-xe-fixes branch included as well?

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/F5A94gSepNQOsNsZBCFEmzQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXVll0ACgkQAVBC80lX
0GwELQf/Q/n3K4HqKLq39MDQhZAAJUBm1YxvwNnirZMlCmqiK66yOw8Mt0c3ThO4
c61KtjDLov3dlY8sJ5Ho+E4j2z4Q62GPf+dIwwFaSTrNDg57qhBfo9J00ioJur2n
jzIF+kR38PSXCvIsblWTjV7GpGgp6fTLhULvVXnxs9Dc20NomGmaEtiyiN5M4kt0
tMYge3qsrS4d2CPy3wkDlSCWjrc4paWLwmTmZ2Uf+PlyAdgPtIzlvAz2uAGr6hFQ
oIN+q++HxtJExWkQuFhZU2QwjAVRHJXYblDtQdu5ePuj2wckNnRTWHX8ldHkNdSF
/BsXRvfeQCBnd1jkkTz0zyprAVdF0Q==
=K4kr
-----END PGP SIGNATURE-----

--Sig_/F5A94gSepNQOsNsZBCFEmzQ--
