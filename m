Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CCFABEAF9
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5436610E054;
	Wed, 21 May 2025 04:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YHTUaS33";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54D810E054
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 04:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=202503; t=1747801947;
 bh=lN2NliBTQk+h/u/lnDT5WgIFccUSgWwx0AmEgc2U9qc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YHTUaS33pS2rIR64MiVX6Qg34mo9V/voqEbx0d/dC99kBqNvU7xQhO1XUwPzWvVn9
 sgBdsZVplFZiKOTjxz3AbKptWCFiMwtUf9fGdOZ61yExCtUEs3ze7uw7hekR/VheUE
 R1RFUzkkvjhYsFd8m5RaHKnyHYcoWLc9VPD271Vu1lw45isg/TD3Cd9fowjcIItBzd
 Gc0rjLoaMEoE8oG3z6yJQkxalQkawMXyi8t0efPDG7ULIE5Q1P5Pbd5LX2pkdOD6tH
 6pZcAtUVhj8vEWY1DxK9PIQP+Qr3CGOfnErLwHQG7fUERmX3gAMsVrRZGMZEgzooVq
 Eql9yeteLUReA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4b2JRv31K4z4xTx;
 Wed, 21 May 2025 14:32:26 +1000 (AEST)
Date: Wed, 21 May 2025 14:32:25 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andreas Hindborg <a.hindborg@kernel.org>, Dave Airlie <airlied@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the drm-nova tree with the configfs
 tree
Message-ID: <20250521143225.7ec5064b@canb.auug.org.au>
In-Reply-To: <20250513135521.44a26953@canb.auug.org.au>
References: <20250513135521.44a26953@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gRP3VBcGjRA9YtZHIxWn=Qw";
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

--Sig_/gRP3VBcGjRA9YtZHIxWn=Qw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 13 May 2025 13:55:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-nova tree got a conflict in:
>=20
>   samples/rust/Makefile
>=20
> between commit:
>=20
>   1bfb10505156 ("rust: configfs: add a sample demonstrating configfs usag=
e")
>=20
> from the configfs tree and commit:
>=20
>   96609a1969f4 ("samples: rust: add Rust auxiliary driver sample")
>=20
> from the drm-nova tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc samples/rust/Makefile
> index b3c9178d654a,6a466afd2a21..000000000000
> --- a/samples/rust/Makefile
> +++ b/samples/rust/Makefile
> @@@ -8,7 -8,7 +8,8 @@@ obj-$(CONFIG_SAMPLE_RUST_DMA)			+=3D rust
>   obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+=3D rust_driver_pci.o
>   obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+=3D rust_driver_platform.o
>   obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+=3D rust_driver_faux.o
>  +obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+=3D rust_configfs.o
> + obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+=3D rust_driver_auxiliary.o
>  =20
>   rust_print-y :=3D rust_print_main.o rust_print_events.o
>  =20

This is now a conflict between the drm tree and the configfs tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/gRP3VBcGjRA9YtZHIxWn=Qw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgtV1kACgkQAVBC80lX
0GzcHwf/TjsazM2/iS8QbPIxGerkOGDJTcfy4yLsbEnZ4scZ9JZpfhUH6/NAAcVp
NmZBLKsQ6v/X6OGMJTAW0I8J76NOaeF29f91AYuysCRzAhc8547HGSxYgEOy/Iz7
HSFNGuLe3clRH3QeY8vwst88g7gU84kbBTrE1zZKjrDzrb6BVw+R00w6OQkp4RH9
secUS/9BcxbcxjATgyWDrefhxh4WdNnA/ysHFvt7fejCMsntb2/z2Rp564PXZvnF
vhf3N8pHXKcqV3FzIbf/QvwfhCQWnMu10Njj/xwjKQvQlOroJ474ZWlGXjKayZtV
kBQwokl/pc/EEWBm4tMexW/F18vKOw==
=Ak5K
-----END PGP SIGNATURE-----

--Sig_/gRP3VBcGjRA9YtZHIxWn=Qw--
