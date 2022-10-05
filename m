Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA5A5F5CAD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 00:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C79610E7AE;
	Wed,  5 Oct 2022 22:28:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606AF10E7AE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 22:28:17 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MjTjl6hVpz4x1V;
 Thu,  6 Oct 2022 09:28:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1665008892;
 bh=uYgrBDP1/U3UKipeqxPz+tb63PIZzevrui+UKaiiKrk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RSQJ6n7QTM0+gF3dxwTLNlYRsyU/f43Z5Xfdt37/Eqh+H3NDBuxEs08FkXJSioeKY
 T6ZpERE7FSFQU+c3maPe1fV1ijxVfxaQiOTSuroWL+b1TSJc04Zprsy71tS9QuFO4+
 eZcNx7KQ2rDOUY+U3rWpyq0WhPhmdqoiD2kvw/SmTHR9ax27jhFTC6orqd7pXIe1Kx
 VypACoRAojW1kdWGevDjQAbcdU9R8Xg3kWHCNl45g6ncBfA7RvYtsMElxzQnozn4mK
 7O0RHzOq5EFxwsQkScfEz9fz7v5VsgLvoqPEkagBhiKFJs/xkT6BppOy+PlLbB6r91
 YN1ArE/r65nCA==
Date: Thu, 6 Oct 2022 09:28:10 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Airlie <airlied@redhat.com>
Subject: Re: linux-next: build failure after merge of the drm tree
Message-ID: <20221006092810.0c3a2238@canb.auug.org.au>
In-Reply-To: <09cd11c5-2a15-3653-957c-88c751fa9029@amd.com>
References: <20220930105434.111407-1-broonie@kernel.org>
 <20221004132047.435d42db@canb.auug.org.au>
 <CAMwc25oshRcJBoCT70B+b42bh5sPqgyoHuBx6K6ZLrwBMHnJzw@mail.gmail.com>
 <20221004140558.64f59f2c@canb.auug.org.au>
 <YzwbW4YQwQPsRPYw@sirena.org.uk>
 <CADnq5_PbPQPui1tOdUMB+OYbz6UBMKCgtwvE95oA+SfcN0RzNg@mail.gmail.com>
 <09cd11c5-2a15-3653-957c-88c751fa9029@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BBFuZQG7/.XqDoN9oEY_DQ7";
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
Cc: Mark Brown <broonie@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/BBFuZQG7/.XqDoN9oEY_DQ7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 5 Oct 2022 12:45:31 -0400 Hamza Mahfooz <hamza.mahfooz@amd.com> wro=
te:
>
> On 2022-10-05 11:30, Alex Deucher wrote:
> > @Mahfooz, Hamza
> > @Aurabindo Pillai can you get this fixed up?
> >  =20
>=20
> Seems like this is a false positive for GCC versions pre-12, because I'm =
not seeing this warning on GCC 12.2.
> However, we can fix this for older GCC versions with the following:
>=20
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm=
/amd/display/dc/dc_stream.h
> index 9e6025c98db9..67fede4bf248 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
> @@ -238,7 +238,7 @@ struct dc_stream_state {
>=20
>   	/* writeback */
>   	unsigned int num_wb_info;
> -	struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
> +	struct dc_writeback_info writeback_info[MAX_DWB_PIPES + 1];
>   	const struct dc_transfer_func *func_shaper;
>   	const struct dc_3dlut *lut3d_func;
>   	/* Computed state bits */

This is now in Linus' tree :-(

I have applied the following hack for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 6 Oct 2022 09:14:26 +1100
Subject: [PATCH] fix up for drivers/gpu/drm/amd/display/dc/core/dc_stream.c

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_stream.c
index ae13887756bf..a5da787b7876 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -520,9 +520,9 @@ bool dc_stream_remove_writeback(struct dc *dc,
 	}
=20
 	/* remove writeback info for disabled writeback pipes from stream */
-	for (i =3D 0, j =3D 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++)=
 {
+	for (i =3D 0, j =3D 0; i < stream->num_wb_info && i < MAX_DWB_PIPES; i++)=
 {
 		if (stream->writeback_info[i].wb_enabled) {
-			if (i !=3D j)
+			if ((j >=3D 0) && (j < i))
 				/* trim the array */
 				stream->writeback_info[j] =3D stream->writeback_info[i];
 			j++;
--=20
2.35.1

--=20
Cheers,
Stephen Rothwell

--Sig_/BBFuZQG7/.XqDoN9oEY_DQ7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmM+BPoACgkQAVBC80lX
0GyZVwgAgzWC3UyW11gvhenBa0JmMdUwcodPtmQ9KgVQ0qAAJdbouBh8sYX9q0RM
i8xNwFXmPJnh4hymww08vmNtiJZYvQWwJn0xu1PnlnQnuobDV4GS2pivKdn2cizn
tB7qA1J9dbl8sMt32zOmSOqzeMRFy4o9zliz2FfNguygM/iBJ2D9pvMFAPXlWHv8
OjdWP1+H73DClpGsijEXM+CEnbV0WqZs144EuAZ5Aeyd2Hb1a9hTHF3Rp82m+G59
oG9YnOWbLU5QLdoQaHa59gOojsKIp+85vnfG+AlQbOcAgNXT4w4YIbqRD7q5yH+N
/JisNQE6+9Z2wf7/hQhq2k8wCoK8cw==
=HigX
-----END PGP SIGNATURE-----

--Sig_/BBFuZQG7/.XqDoN9oEY_DQ7--
