Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86ECA2DA1B5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Dec 2020 21:39:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA2F88427;
	Mon, 14 Dec 2020 20:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72C388427
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Dec 2020 20:39:15 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CvtXc4XVgz9sTL;
 Tue, 15 Dec 2020 07:39:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1607978354;
 bh=xNRk9vCzobU5ytFmyBeryGq2ILq88SjE2MR9A3laYkI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=am8teifgBHQhs5j70Hw4GxEi7eCNHuncg6gp5exK2VLxCftMcf6xVd0B0ENYBJhRq
 vGcTRWskD5tRWQjVbc3DGOqoAI/tcOM3FKJW4dI1FtWG2g6zzRyjYUx9I2pXNqcZgi
 mge07LzuWjseD55BEzXB5Hhr+OqxynEoIupW/bejaWpgKvgfriv4nNMM9CCOHfXm+W
 2ZxAvFKH01sxB9StfxOt3xaqroXfCyf8KceQz0N8BAGirQdvGenAtxSEhV17xEKdUp
 sAQTBqcLlRLpxorWp08zq1Buie563UGt74FnSqFV6qYqrYNR949DTm0cU65IIC7gNG
 AUI9ygZtiLBWA==
Date: Tue, 15 Dec 2020 07:39:11 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: linux-next: manual merge of the drm tree with the pci tree
Message-ID: <20201215073911.78ff2d2c@canb.auug.org.au>
In-Reply-To: <20201208132632.7c3a6a41@canb.auug.org.au>
References: <20201208132632.7c3a6a41@canb.auug.org.au>
MIME-Version: 1.0
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
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Qinglang Miao <miaoqinglang@huawei.com>
Content-Type: multipart/mixed; boundary="===============0596812857=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0596812857==
Content-Type: multipart/signed; boundary="Sig_/PAmygmgGvxp39l6tC.N8h3S";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/PAmygmgGvxp39l6tC.N8h3S
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 8 Dec 2020 13:27:54 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/vga/vga_switcheroo.c
>=20
> between commit:
>=20
>   99efde6c9bb7 ("PCI/PM: Rename pci_wakeup_bus() to pci_resume_bus()")
>=20
> from the pci tree and commit:
>=20
>   9572e6693cd7 ("vga_switcheroo: simplify the return expression of vga_sw=
itcheroo_runtime_resume")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/vga/vga_switcheroo.c
> index 8843b078ad4e,1401fd52f37a..000000000000
> --- a/drivers/gpu/vga/vga_switcheroo.c
> +++ b/drivers/gpu/vga/vga_switcheroo.c
> @@@ -1039,12 -1038,8 +1038,8 @@@ static int vga_switcheroo_runtime_resum
>   	mutex_lock(&vgasr_mutex);
>   	vga_switcheroo_power_switch(pdev, VGA_SWITCHEROO_ON);
>   	mutex_unlock(&vgasr_mutex);
>  -	pci_wakeup_bus(pdev->bus);
>  +	pci_resume_bus(pdev->bus);
> - 	ret =3D dev->bus->pm->runtime_resume(dev);
> - 	if (ret)
> - 		return ret;
> -=20
> - 	return 0;
> + 	return dev->bus->pm->runtime_resume(dev);
>   }
>  =20
>   /**

This is now a conflict between the pci tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/PAmygmgGvxp39l6tC.N8h3S
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl/XzW8ACgkQAVBC80lX
0Gy+LAf/Ui4yUuk+gLiSJLeGmLyFcjAXb9AL/Beuzyss9Wzd7sxc5J2xkwlCeI1m
wewPVrhBXOTN0m9ihjgPTYbQDEflueYUXE2Lgvye0D4TnMOOwZF7q9R7EBhDpDas
YK6hyq/paNbJ2KfkT89nVOqma44c4/zH1LO+aMZxNplJEOoVcTtTWDMwa+J4SyF3
XoNTj3r2SHxIdu4R42UGF58ZjG7W/URvFyAfJDmCG+saurE49Z6BISI0kKqIuupV
VHiSArKjwZ1IMltX85Pdp0i8QFSKy6uFS8vZflKIoKW0qmqi8cNa9eesHOe24tv2
65BfWTjTkXVLlg52ezqSsphDvwe2Lg==
=8k7E
-----END PGP SIGNATURE-----

--Sig_/PAmygmgGvxp39l6tC.N8h3S--

--===============0596812857==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0596812857==--
