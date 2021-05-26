Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BA23920BE
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 21:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50CF6EDB5;
	Wed, 26 May 2021 19:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738A66EC52
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 19:18:41 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EFAD41FD2A;
 Wed, 26 May 2021 19:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622056719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CWw0uw5dxz++41Nh4YH2S61cpeLGPc3ptiaH8yiQ2N8=;
 b=v991+ZMLxNgdecYzmj+1mNdj6eNw05GNqxwfwCE2cxVS7HyU2b9CPBMO3LftdY1E0O2gbG
 ZOSYYMl6EscdDmvnkmjPYhCfASGyV6EEBJtsX6iPSLTXgvrF0vCESUvDW/Dp0TZeMiRnJ4
 LjqyA5S5cSPSMkneV5WeUAGA7e9Pmwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622056719;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CWw0uw5dxz++41Nh4YH2S61cpeLGPc3ptiaH8yiQ2N8=;
 b=eo65hFs+i3gRnJxfw3LkVaUOcJeUOGox8MKdCh9rfpCMO57P4krGrKm6ex8QrJp4RZkbII
 W60uAC583EUetiCg==
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id CEF5011A98;
 Wed, 26 May 2021 19:18:39 +0000 (UTC)
Subject: Re: [PATCH] drm: fix leaked dma handles after removing drm_pci_free
To: Joseph Kogut <joseph.kogut@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20210518212859.4148903-1-joseph.kogut@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <da6d359a-d6e7-9005-307f-999b3f16c119@suse.de>
Date: Wed, 26 May 2021 21:18:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210518212859.4148903-1-joseph.kogut@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IFIwdKN8cLcTSAy5BY7leieIDsLx8GorY"
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
Cc: christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IFIwdKN8cLcTSAy5BY7leieIDsLx8GorY
Content-Type: multipart/mixed; boundary="QAYDpJnGKv6dKMC7Jpr8YaMuPtkqgzxYO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Joseph Kogut <joseph.kogut@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org
Message-ID: <da6d359a-d6e7-9005-307f-999b3f16c119@suse.de>
Subject: Re: [PATCH] drm: fix leaked dma handles after removing drm_pci_free
References: <20210518212859.4148903-1-joseph.kogut@gmail.com>
In-Reply-To: <20210518212859.4148903-1-joseph.kogut@gmail.com>

--QAYDpJnGKv6dKMC7Jpr8YaMuPtkqgzxYO
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 18.05.21 um 23:28 schrieb Joseph Kogut:
> After removing drm_pci_alloc/free, some instances where drm_pci_free()
> would have kfreed the dma handle were skipped.
>=20
> Ensure these handles are freed properly.
>=20
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Applied to drm-misc-next. Thanks

Best regards
Thomas

> ---
>   drivers/gpu/drm/drm_bufs.c         | 1 +
>   drivers/gpu/drm/r128/ati_pcigart.c | 2 ++
>   2 files changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index ea3ca81be9dd..7eb3baed9a70 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -685,6 +685,7 @@ static void drm_cleanup_buf_error(struct drm_device=
 *dev,
>   						  dmah->size,
>   						  dmah->vaddr,
>   						  dmah->busaddr);
> +				kfree(dmah);
>   			}
>   		}
>   		kfree(entry->seglist);
> diff --git a/drivers/gpu/drm/r128/ati_pcigart.c b/drivers/gpu/drm/r128/=
ati_pcigart.c
> index fbb0cfd79758..04408f372f74 100644
> --- a/drivers/gpu/drm/r128/ati_pcigart.c
> +++ b/drivers/gpu/drm/r128/ati_pcigart.c
> @@ -71,6 +71,8 @@ static void drm_ati_free_pcigart_table(struct drm_dev=
ice *dev,
>   	drm_dma_handle_t *dmah =3D gart_info->table_handle;
>  =20
>   	dma_free_coherent(dev->dev, dmah->size, dmah->vaddr, dmah->busaddr);=

> +	kfree(dmah);
> +
>   	gart_info->table_handle =3D NULL;
>   }
>  =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--QAYDpJnGKv6dKMC7Jpr8YaMuPtkqgzxYO--

--IFIwdKN8cLcTSAy5BY7leieIDsLx8GorY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCunw8FAwAAAAAACgkQlh/E3EQov+AQ
HhAAyF/3HvtmrnnC35dDUWehUttTRLusEDg6nymcYtzoA1jyZI072+c7ZFc7kycxw3bnTfg9zFCx
4uHD8htk+vnCmERbI5+53wVdaAr1oJaZS+xn+ZvL/47j3NJeCV32uDyp+fMtjS8wuxQIMDQOjzPl
UOtrim/Ma23ce/hwriwLFAc+XwHNVyZBN1656VpIndnUDP0IbwIMlv4+YQ2Q63mPtcD6AfEiVyGt
iu9gTYnhRb9jsS3UI+ELyJzgUdMPwKfwC1Ro1O4ZvOdT8HljswsKwna8WwIt4J+FfzZaEnZybhW+
Qz1r0Zzm49vpC6+dj5uJkQdEKEejpggSLKG6wMhSCPRcDUfaDUM+iInjIYYtyRmh7dwuGQ0Nw7nb
9sqTBAsfT2iFEweIAiRJEiOQ+sZu5P91ZmE91mhGDTcGBxO8bJrZ0J5gzbxrzWohXLbpM5Qbln9O
GsCDVP0LLlgLoVvLhyd3HyCnVvJh+OBK9j6GuV8wehOBStka4aQNRokbZ92zoHaYZ1kTQDchE5Lx
M6ZWZbRHz5SvGklCQXryM+j/i95omcg5U67mYbp8Jw0Bn0+sBBmILg5Q2E5PzPFC7EMYYD0xmySE
1UOBTxBuq21LYNtv6HI96u13erRJLCxGjEGy3+R6HD7qN3IDDbIuBNKAWtFfk/KHfhsdXc/G+iKq
XE0=
=adzG
-----END PGP SIGNATURE-----

--IFIwdKN8cLcTSAy5BY7leieIDsLx8GorY--
