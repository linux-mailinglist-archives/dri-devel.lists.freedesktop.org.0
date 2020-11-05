Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A6D2A73EA
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 01:39:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1A188130;
	Thu,  5 Nov 2020 00:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87BD06E864;
 Thu,  5 Nov 2020 00:39:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CRPly6Ktpz9sTv;
 Thu,  5 Nov 2020 11:39:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1604536754;
 bh=y+kVjqzWIE9w6gAhF1CmZCkqQUFx1mNjcu8zB4cc7aE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZYB8h90GxdHZbVK+DxSPUXmozMA0dTiQkNpayIdgq29nzz4HtatfuWi+NChlkAyND
 Cwc346Ms1mp9WL7e3oS/+bWREuKbQdz/mYmdoeY2p8vnquCAR88YtgMR2NNXnJX2RC
 loAysirj+x3tW1mMr+0BBC3jCZ+wqWoj7KV6yMeGcsa7/As3CZ3s8LVQtbhkJTlPgI
 OjeoTr/iphtdz+sSrsy8m2sRiIozBX792cIptf8pix9zf1/GRqaspTBuXyG/jDu2ku
 uzLlSbZeBjrh3HKnMMAEIqrd/5Kr+1AT05pLQYe1JOXovDq3w1/TqcNPZahmOFkaFF
 rkUsMsiNAcMGQ==
Date: Thu, 5 Nov 2020 11:39:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: Re: linux-next: manual merge of the drm-misc tree with the amdgpu tree
Message-ID: <20201105113905.55a7d59f@canb.auug.org.au>
In-Reply-To: <20201028120631.1a1e239c@canb.auug.org.au>
References: <20201028120631.1a1e239c@canb.auug.org.au>
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
Cc: Mihir Bhogilal Patel <Mihir.Patel@amd.com>,
 Dave Airlie <airlied@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1735301265=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1735301265==
Content-Type: multipart/signed; boundary="Sig_/UaQZW44KOmMlAG5YLP8483G";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UaQZW44KOmMlAG5YLP8483G
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 28 Oct 2020 12:06:31 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the drm-misc tree got a conflict in:
>=20
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>=20
> between commit:
>=20
>   ff72bc403170 ("drm/amdgpu: Add debugfs entry for printing VM info")
>=20
> from the amdgpu tree and commit:
>=20
>   4671078eb8e3 ("drm/amdgpu: switch over to the new pin interface")
>=20
> from the drm-misc tree.
>=20
> I fixed it up (I used the former version of this file and added the
> following patch) and can carry the fix as necessary. This is now fixed
> as far as linux-next is concerned, but any non trivial conflicts should
> be mentioned to your upstream maintainer when your tree is submitted
> for merging.  You may also want to consider cooperating with the
> maintainer of the conflicting tree to minimise any particularly complex
> conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 28 Oct 2020 11:52:31 +1100
> Subject: [PATCH] merge fix up for "drm/amdgpu: Add debugfs entry for prin=
ting
>  VM info"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_object.c
> index baca32263ec4..06dfe9b1c7e6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1555,7 +1555,7 @@ u64 amdgpu_bo_print_info(int id, struct amdgpu_bo *=
bo, struct seq_file *m)
>  	seq_printf(m, "\t\t0x%08x: %12lld byte %s",
>  			id, size, placement);
> =20
> -	pin_count =3D READ_ONCE(bo->pin_count);
> +	pin_count =3D READ_ONCE(bo->tbo.pin_count);
>  	if (pin_count)
>  		seq_printf(m, " pin count %d", pin_count);
> =20

This fix up is now needed in the merge between the drm tree and the
amdgpu tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/UaQZW44KOmMlAG5YLP8483G
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl+jSakACgkQAVBC80lX
0GyDAAf/XU3M5gSGKWNWV1hB78GI3bM3JtfQiyozdL5AaxKMJAZTlTs2f2gqiVA6
MfVj63aN5eWdodcba957C4wezYkLs4hbSEJv3MS8J1UtAOcxezn33UgOVivNE2X/
baReqXQfwRzBNZdlwg8PwK/OtZBFzkKkR9AHZ1L9Q5KiJxGraHhcHOlo2vbBcoMb
sZ0Q2IwOHzDInaDkRbMmRj09Imk+fdp8iil0/3wJvp/tr1PLtzwedTLPiT8yxD/y
hwXh6rZQzp6XKBlTjOP9bHRNipsBSwFnq/JLU8OwVuNYjjyLQMJ5mtMixGX5HILX
65fpnvPK+n4RWmomKY5Opaz9FSoQ3w==
=1o3K
-----END PGP SIGNATURE-----

--Sig_/UaQZW44KOmMlAG5YLP8483G--

--===============1735301265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1735301265==--
