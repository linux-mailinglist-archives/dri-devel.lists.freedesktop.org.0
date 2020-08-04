Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C269A23B548
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 08:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C643B89CE1;
	Tue,  4 Aug 2020 06:55:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B339D89CE1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 06:55:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A0ADABE2;
 Tue,  4 Aug 2020 06:56:00 +0000 (UTC)
Subject: Re: [PATCH 12/59] drm/vram-helper: call the ttm manager debug function
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-13-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <6f7cbde6-60fc-0daf-f06c-c8334c7f3207@suse.de>
Date: Tue, 4 Aug 2020 08:55:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200804025632.3868079-13-airlied@gmail.com>
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
Cc: linux-graphics-maintainer@vmware.com, kraxel@redhat.com, sroland@vmware.com,
 christian.koenig@amd.com, bskeggs@redhat.com
Content-Type: multipart/mixed; boundary="===============1934157905=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1934157905==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wo1VCUD03voeloZx9tfI7ac3L4UtPjNgv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wo1VCUD03voeloZx9tfI7ac3L4UtPjNgv
Content-Type: multipart/mixed; boundary="d0PL1kPDDlJidXwFXhjEUyW0t9lea3piX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Message-ID: <6f7cbde6-60fc-0daf-f06c-c8334c7f3207@suse.de>
Subject: Re: [PATCH 12/59] drm/vram-helper: call the ttm manager debug
 function
References: <20200804025632.3868079-1-airlied@gmail.com>
 <20200804025632.3868079-13-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-13-airlied@gmail.com>

--d0PL1kPDDlJidXwFXhjEUyW0t9lea3piX
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 04.08.20 um 04:55 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>=20
> This code was assuming there was a drm_mm here, don't do
> that call the correct API.
>=20
> v2: use the new exported interface.
>=20
> Signed-off-by: Dave Airlie <airlied@redhat.com>

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>  drivers/gpu/drm/drm_gem_vram_helper.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/dr=
m_gem_vram_helper.c
> index a93a00966f3a..c20aee2fddf3 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1075,12 +1075,10 @@ static int drm_vram_mm_debugfs(struct seq_file =
*m, void *data)
>  {
>  	struct drm_info_node *node =3D (struct drm_info_node *) m->private;
>  	struct drm_vram_mm *vmm =3D node->minor->dev->vram_mm;
> -	struct drm_mm *mm =3D vmm->bdev.man[TTM_PL_VRAM].priv;
> +	struct ttm_mem_type_manager *man =3D &vmm->bdev.man[TTM_PL_VRAM];
>  	struct drm_printer p =3D drm_seq_file_printer(m);
> =20
> -	spin_lock(&ttm_bo_glob.lru_lock);
> -	drm_mm_print(mm, &p);
> -	spin_unlock(&ttm_bo_glob.lru_lock);
> +	ttm_mem_type_manager_debug(man, &p);
>  	return 0;
>  }
> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--d0PL1kPDDlJidXwFXhjEUyW0t9lea3piX--

--wo1VCUD03voeloZx9tfI7ac3L4UtPjNgv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8pBm8UHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPAqwf/SlM5RhKBo9bi5VBN/k3KL32SRpM9
wh1xgMH5DE7XVES6n1fJeG7bMIRk+20M95a5fvTVfWaU+0XXepAHnNBgMh5+j10I
OHaaVi0glccRzHo6ljySjFO0PQ5JO2ZtDqq1/pDg2qAOP+nUHECrqbpOYIiM8iYO
ReQm/G70NIQylZoVnd6DaORKiq+iWR6mBWACQaDySvyAz24wYcUqnTm2zwQEfQXC
VbphMbaXFduYAhDsuBXQp4OVy8ATMZOznJ3kMy/7iFDnYjn5xg3ClXape8o77dcy
3LPyY5OvbSh7NcUvIjafQshfQttgvBLNXO6GJJp3Vnf7B0TYIQBSebZgMw==
=lfGc
-----END PGP SIGNATURE-----

--wo1VCUD03voeloZx9tfI7ac3L4UtPjNgv--

--===============1934157905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1934157905==--
