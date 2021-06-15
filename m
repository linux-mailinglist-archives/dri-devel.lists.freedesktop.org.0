Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0443A7A79
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 11:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B83F6E226;
	Tue, 15 Jun 2021 09:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A516A6E226
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 09:25:29 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DA9E5219D9;
 Tue, 15 Jun 2021 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623749127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wkrt2I7n4dqe/apiwY6bErCGbPoxzB9wmIHRvqFeTUk=;
 b=KPw+PR0I7Ui6aI5VMEpGCUYtCc1YQUamG6vEkNWwcTx/HEJqoIvBhR7p6l2aFjr6XpcO92
 ltwhlIHRvrSjlukY7sxCiDzDZTEbdo2v3qH8d/IDIG76AH9LPhlqCH6AhbeftehFpVOqRY
 CrLl7nqo4bP2x2A6cEDRl4Kj3Xh4qoo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623749127;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wkrt2I7n4dqe/apiwY6bErCGbPoxzB9wmIHRvqFeTUk=;
 b=Cp/UPq4BCBgiwlrvmcPb0HPvrbfK9sLEEPW7dF8RycIh/l8c7iVSZWwaFMPX4uFnNt0Ewg
 2XZZSS+zDOrZpbAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B28A2118DD;
 Tue, 15 Jun 2021 09:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623749127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wkrt2I7n4dqe/apiwY6bErCGbPoxzB9wmIHRvqFeTUk=;
 b=KPw+PR0I7Ui6aI5VMEpGCUYtCc1YQUamG6vEkNWwcTx/HEJqoIvBhR7p6l2aFjr6XpcO92
 ltwhlIHRvrSjlukY7sxCiDzDZTEbdo2v3qH8d/IDIG76AH9LPhlqCH6AhbeftehFpVOqRY
 CrLl7nqo4bP2x2A6cEDRl4Kj3Xh4qoo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623749127;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wkrt2I7n4dqe/apiwY6bErCGbPoxzB9wmIHRvqFeTUk=;
 b=Cp/UPq4BCBgiwlrvmcPb0HPvrbfK9sLEEPW7dF8RycIh/l8c7iVSZWwaFMPX4uFnNt0Ewg
 2XZZSS+zDOrZpbAQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id sPysKgdyyGCzeQAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Jun 2021 09:25:27 +0000
Subject: Re: [PATCH v2 -next] drm/hyperv: Fix unused const variable
 'hyperv_modifiers'
To: Pu Lehui <pulehui@huawei.com>, drawat.floss@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20210609024940.34933-1-pulehui@huawei.com>
 <20210615031401.231751-1-pulehui@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <c1b10848-d2f1-ddd2-8a69-a356f70da089@suse.de>
Date: Tue, 15 Jun 2021 11:25:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210615031401.231751-1-pulehui@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ndFCefi0rNgLGvXQF3Uw0UuWJRtVF2RX4"
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
Cc: zhangjinhao2@huawei.com, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ndFCefi0rNgLGvXQF3Uw0UuWJRtVF2RX4
Content-Type: multipart/mixed; boundary="zEJlwBFnUtuFl5yIxH4kjjKDlu3GQO33D";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pu Lehui <pulehui@huawei.com>, drawat.floss@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: zhangjinhao2@huawei.com, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <c1b10848-d2f1-ddd2-8a69-a356f70da089@suse.de>
Subject: Re: [PATCH v2 -next] drm/hyperv: Fix unused const variable
 'hyperv_modifiers'
References: <20210609024940.34933-1-pulehui@huawei.com>
 <20210615031401.231751-1-pulehui@huawei.com>
In-Reply-To: <20210615031401.231751-1-pulehui@huawei.com>

--zEJlwBFnUtuFl5yIxH4kjjKDlu3GQO33D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.06.21 um 05:14 schrieb Pu Lehui:
> There is a gcc '-Wunused-const-variable' warning:
>    drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:152:23: warning:
>      'hyperv_modifiers' defined but not used [-Wunused-const-variable=3D=
]
>=20
> while the variable should be used in drm_simple_display_pipe_init()
> as suggested by Thomas, let's fix it.

Thanks a lot! I added your patch to drm-misc-next-fixes.

Best regards
Thomas

>=20
> Fixes: 76c56a5affeb ("drm/hyperv: Add DRM driver for hyperv synthetic v=
ideo device")
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/=
drm/hyperv/hyperv_drm_modeset.c
> index 02718e3e859e..3aaee4730ec6 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -163,7 +163,7 @@ static inline int hyperv_pipe_init(struct hyperv_dr=
m_device *hv)
>   					   &hyperv_pipe_funcs,
>   					   hyperv_formats,
>   					   ARRAY_SIZE(hyperv_formats),
> -					   NULL,
> +					   hyperv_modifiers,
>   					   &hv->connector);
>   	if (ret)
>   		return ret;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--zEJlwBFnUtuFl5yIxH4kjjKDlu3GQO33D--

--ndFCefi0rNgLGvXQF3Uw0UuWJRtVF2RX4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDIcgcFAwAAAAAACgkQlh/E3EQov+BD
Bw//Xqc6PQ7vXQPGpR0cdFSqVsZ/bQtd3M97nBU4bLbHf7pVoq8r6uTaxsO9L2oB8bEuoUdI0uct
MaccFeHxIKNuOQEKrztR3OhwjRA18HNyEa/BrKyCn3Vl4rySgBdpyxk3Wz4dYrQDGuirAlts3+Sy
zE/T0FS4OKCeUPZB3CEnmMTPazlUz4mPNTX7BNb0Lu4EN3mFMUlC0olHLzySwuvumNX7dJ1fssww
2bFQT+a1awY5actNRIJHkROEdt8Ahls41E3ArlZ8lEe74TbIEsYyOvB70IuuLeUQlTRmk/dnbb4G
N/xln9Jpb+UAOM6oc3D7MbPBqtYWcfSqrhmpL29bybjwumz70awDy1LknbxYrQP1TkMrmgajRrus
lOJoRri4+iDlPlVA4J4zxJ4Za/Y1n89uivOgHbnZVUJXPbG/Zega7i8nuIoVn76Ts1+y3mpqhhgg
yWYZ7AhpgNvD47GgAFmYrcPcqrArpo8en5sk6FngOth8DZ/ln1ugd9vIwHpYjs0HwlS8VQzG7SRo
cCeQxCdvES+5QAhzgNpCab3RbCGstW3BOkFgpeClD1Gjwki6zbfWrfFJEpXaPGnhVJX80APKGi9L
Hpt+x0cD8uRJnUFdlHT7IHm+YC2FxLWg2shKbQPBDqcl/RWfa+n6towlmJvIThcsg0jJVFzjK4P2
dfI=
=zEWF
-----END PGP SIGNATURE-----

--ndFCefi0rNgLGvXQF3Uw0UuWJRtVF2RX4--
