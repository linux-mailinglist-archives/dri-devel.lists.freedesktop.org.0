Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA3B7E31A4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 00:49:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B3910E45E;
	Mon,  6 Nov 2023 23:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE9510E45E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Nov 2023 23:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1699314560;
 bh=rYAdo0ov1Zq7KX7kvEwHz2ttY2nsC4oA64OM1EgReU8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=s5jOrjvOo1vP4H6oyg42GsVc6AONirHLyH75ciKjXBucdXNRW3RBDCGOO9Xs8sELf
 r7JriuGIvZ4InCMLuIOUburkChvf/376fi+wSct7FcxCo3YQgybmZcfO8rZj56R65i
 GAxHrF8j3pTwG5ant87hgU+ZcML/lIpJ5CFUE4yEHd58N7fE574E3XkrNI5RREzWNc
 lkH54fzO+6QSte6/QHrYojGTvDZCm6pgEpEM363UTRvgWEi8t2jAavSCjU/NIcfvFY
 xHE39MBp4i63tQSVI9QSmk+/3RNmI+m37m7K5fmBIK9IrSs4Fclnw/sUaIzkknqpCO
 XjskS8JGSBdzA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4SPSk71G2cz4wnv;
 Tue,  7 Nov 2023 10:49:19 +1100 (AEDT)
Date: Tue, 7 Nov 2023 10:49:17 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with Linus' tree
Message-ID: <20231107104917.09180c14@canb.auug.org.au>
In-Reply-To: <20231106094855.38376d52@canb.auug.org.au>
References: <20231106094855.38376d52@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1G+SLmpH=k.wj.RskGDCp/c";
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/1G+SLmpH=k.wj.RskGDCp/c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 6 Nov 2023 09:48:55 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> Today's linux-next merge of the amdgpu tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
>=20
> between commit:
>=20
>   18bf400530ca ("drm/amdgpu: Use pci_get_base_class() to reduce duplicate=
d code")
>=20
> from Linus' tree and commit:
>=20
>   432e664e7c98 ("drm/amdgpu: don't use ATRM for external devices")
>=20
> from the amdgpu tree.
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
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> index 5bbb23e102ba,f3a09ecb7699..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c
> @@@ -286,12 -287,12 +287,16 @@@ static bool amdgpu_atrm_get_bios(struc
>   	/* ATRM is for the discrete card only */
>   	if (adev->flags & AMD_IS_APU)
>   		return false;
> +=20
> + 	/* ATRM is for on-platform devices only */
> + 	if (dev_is_removable(&adev->pdev->dev))
> + 		return false;
>  =20
>  -	while ((pdev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev)) !=3D=
 NULL) {
>  +	while ((pdev =3D pci_get_base_class(PCI_BASE_CLASS_DISPLAY, pdev))) {
>  +		if ((pdev->class !=3D PCI_CLASS_DISPLAY_VGA << 8) &&
>  +		    (pdev->class !=3D PCI_CLASS_DISPLAY_OTHER << 8))
>  +			continue;
>  +
>   		dhandle =3D ACPI_HANDLE(&pdev->dev);
>   		if (!dhandle)
>   			continue;

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/1G+SLmpH=k.wj.RskGDCp/c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmVJe30ACgkQAVBC80lX
0Gz0/Qf9HdnhwPZJVImw9UpPkqdiuBu7It6p1hHeGHWR/SLvSiDQAr4Rm4+JrzJ9
kjqHdpR2UTjfpr79YSbXYNbllHswM5p+tJObOgTHN9+N4hJfP+EQJj16F3fV5kAN
F7hC7E+FWKkFb6FOJjwvH3RAY/uJkNOV1gKDFSeF+EiJsvdJZfk8GonlzzADrguS
bOdK791c4y4fKNp7BGmmtuicru8+xkPPCOHc0EW0STIfGEfUvLYyhGZy0i2KQ57g
u9nsHOd/1tBuPghQTRjkvM9Fh0hxCwQOJt/vAEGK6zhPam1ZrynfNg/Kx/ebC8ep
js6X/j44GcnHrdC7Yxvvw1zGv+wlAQ==
=ixwX
-----END PGP SIGNATURE-----

--Sig_/1G+SLmpH=k.wj.RskGDCp/c--
