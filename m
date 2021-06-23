Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 514793B17EA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 12:12:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AB6890F7;
	Wed, 23 Jun 2021 10:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6D5589067;
 Wed, 23 Jun 2021 10:12:28 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 91A8C1FD36;
 Wed, 23 Jun 2021 10:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624443147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AeSHs/7he0F+E84CKwa27yLvW2Gd2++S8i4tP5dy3lg=;
 b=xpOJZsgVI171Pk8nwzSO2ahuF/mkjd6uQo2hFPI0pnm0dGpq5okFb1egaIKTxT5RIRFocO
 mR8zJbfzEm/L27q2b4LKr8xd7MUafkPxMIJSxgcplafz7ayp9G2O7ktC/7gvDAf87oD4cn
 ggEk5/nU2bWikG9as1mLGSO91lFEJKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624443147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AeSHs/7he0F+E84CKwa27yLvW2Gd2++S8i4tP5dy3lg=;
 b=hFSTKM8eN004b9/pauFj6nLqmmPxWb9nUGbZR7WAPuJsDdSscwqBjYrfbMgO3Hyb17fftE
 ftxYLcvsCZtJAtCw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 5F0AF11A97;
 Wed, 23 Jun 2021 10:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624443147; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AeSHs/7he0F+E84CKwa27yLvW2Gd2++S8i4tP5dy3lg=;
 b=xpOJZsgVI171Pk8nwzSO2ahuF/mkjd6uQo2hFPI0pnm0dGpq5okFb1egaIKTxT5RIRFocO
 mR8zJbfzEm/L27q2b4LKr8xd7MUafkPxMIJSxgcplafz7ayp9G2O7ktC/7gvDAf87oD4cn
 ggEk5/nU2bWikG9as1mLGSO91lFEJKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624443147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AeSHs/7he0F+E84CKwa27yLvW2Gd2++S8i4tP5dy3lg=;
 b=hFSTKM8eN004b9/pauFj6nLqmmPxWb9nUGbZR7WAPuJsDdSscwqBjYrfbMgO3Hyb17fftE
 ftxYLcvsCZtJAtCw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id bqGFFAsJ02DcVAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Jun 2021 10:12:27 +0000
Subject: Re: [PATCH] drm/i915: return DRIVER_NAME for the fence driver name
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210616122833.332954-1-matthew.auld@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e8e98f7f-0654-90b0-f56c-25827dd998a0@suse.de>
Date: Wed, 23 Jun 2021 12:12:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616122833.332954-1-matthew.auld@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OASjlglkXHHPE57aKB18n1AIN4sE4UDae"
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
Cc: Michael Mason <michael.w.mason@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OASjlglkXHHPE57aKB18n1AIN4sE4UDae
Content-Type: multipart/mixed; boundary="mCnZXzAW1dzoUGhz73txrexeTVdZ7BQUe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: Michael Mason <michael.w.mason@intel.com>, dri-devel@lists.freedesktop.org
Message-ID: <e8e98f7f-0654-90b0-f56c-25827dd998a0@suse.de>
Subject: Re: [PATCH] drm/i915: return DRIVER_NAME for the fence driver name
References: <20210616122833.332954-1-matthew.auld@intel.com>
In-Reply-To: <20210616122833.332954-1-matthew.auld@intel.com>

--mCnZXzAW1dzoUGhz73txrexeTVdZ7BQUe
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.06.21 um 14:28 schrieb Matthew Auld:
> The first tracepoint for a request is trace_dma_fence_init which is
> called in the ctor before we have properly setup the request->engine. S=
o
> if it's a non-recycled request the rq->engine might be NULL, or some
> garbage value, which leads to a crash.
>=20
> Since we are not permitted to use kmem_cache_zalloc() here with
> SLAB_TYPESAFE_BY_RCU, one approach is simply to return DRIVER_NAME. We
> can then revisit this later if we decide to get rid of
> SLAB_TYPESAFE_BY_RCU.
>=20
> Fixes: 855e39e65cfc ("drm/i915: Initialise basic fence before acquiring=
 seqno")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Michael Mason <michael.w.mason@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>   drivers/gpu/drm/i915/i915_request.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915=
/i915_request.c
> index 1014c71cf7f5..55fa94bde22e 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -61,7 +61,7 @@ static struct i915_global_request {
>  =20
>   static const char *i915_fence_get_driver_name(struct dma_fence *fence=
)
>   {
> -	return dev_name(to_request(fence)->engine->i915->drm.dev);
> +	return DRIVER_NAME;

There was recently a discussion about using struct drm_driver.name=20
consistently throughout the source code. I'd like to suggest to do this=20
here.

Best regards
Thomas

>   }
>  =20
>   static const char *i915_fence_get_timeline_name(struct dma_fence *fen=
ce)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mCnZXzAW1dzoUGhz73txrexeTVdZ7BQUe--

--OASjlglkXHHPE57aKB18n1AIN4sE4UDae
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDTCQoFAwAAAAAACgkQlh/E3EQov+B2
yxAAn2jA+p/KqPHqyBqUPIqN//ynn1yyajAz3bUEAThragTagiyr1XZZ/L4Ec2tmvW6fqVovZJes
KR9J3nVus4vWrxp7xL8B3nYZvSOyDOXzSxF708gmrEjNQplioCirE4tAFxbUpMVxZ1deIFoq2dUw
IpxIwZToanof9tGAYZ01jenSd5dnp07Mx2iLjnHTr1fJuKG7F7DPsVZQ33repBY4RvsaheVw9k4l
+Sq5ZnpxJguTeFhugXq545EELK/hBYrVKWhXkYnz4aVBoq04DfO73KMDCTskADjHe0e6OH5K22j9
aGDN/fSsa41htYZCzh/GsXX3q6iHCJYmuMW0wVsXIZ9vhQp3kFfDP541M7zRKSdQ7aEmmTwqd1N5
I4adglz4tAkOVcDnZmoupXs+AqiaFIE5UrO+vh3LRYbUDfxQeniRztsXR3spa3xky2c65tW139+8
pklZcMDusSCCEW6AZjbR4e1l/0byg/z0m8+UWHdP8VAikgpCSWnY9LpDsDLpgnvm988G0yqAcWpD
tXHssgIPQL6VZqFPq90wtdeFLHO7xuGkIojxqrSbZJ5T6t6arLTRXxzHHpAYycs4eQeKGVntWIvM
hiHhRm18ceUx2lrqekg9UDx1SsiuOogurDwwPOmFhaweW394kxSYgGxFAqw9LYyHpJfUc+F+ujC+
oEk=
=fvdw
-----END PGP SIGNATURE-----

--OASjlglkXHHPE57aKB18n1AIN4sE4UDae--
