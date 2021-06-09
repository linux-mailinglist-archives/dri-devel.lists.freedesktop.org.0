Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E534E3A0E01
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 09:46:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30316E3A0;
	Wed,  9 Jun 2021 07:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09C16E3A0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 07:46:05 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 600DF219D8;
 Wed,  9 Jun 2021 07:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623224764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LP9vhqNf02W1ie3L22qLXNLlv5cV5d6bR4sp9ooajx4=;
 b=jcxJdd84jeE8eXctAjwHEhwSQfcaEwVDtDvysrLKD59q2HnBzxoOfTGjgjbAzErST3Ww4l
 jj8Uqh1X636VluSJi9w5htnKmYVB5vZgxSKYvrPb1HJXQ9+KuNdAiy0cSVKW+eyE0VyHEs
 GP32LuYOZ9S2YhPq7wKOIXSIpZnTwsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623224764;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LP9vhqNf02W1ie3L22qLXNLlv5cV5d6bR4sp9ooajx4=;
 b=O4893Cdruknp9FMbn84AqIUrM0Iba5YJTDK+9nSfJkdPQZRWvAJpuixuHTNE2T2CikFGhf
 0XeNfrcjtcMiiRDA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 363EF118DD;
 Wed,  9 Jun 2021 07:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623224764; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LP9vhqNf02W1ie3L22qLXNLlv5cV5d6bR4sp9ooajx4=;
 b=jcxJdd84jeE8eXctAjwHEhwSQfcaEwVDtDvysrLKD59q2HnBzxoOfTGjgjbAzErST3Ww4l
 jj8Uqh1X636VluSJi9w5htnKmYVB5vZgxSKYvrPb1HJXQ9+KuNdAiy0cSVKW+eyE0VyHEs
 GP32LuYOZ9S2YhPq7wKOIXSIpZnTwsA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623224764;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LP9vhqNf02W1ie3L22qLXNLlv5cV5d6bR4sp9ooajx4=;
 b=O4893Cdruknp9FMbn84AqIUrM0Iba5YJTDK+9nSfJkdPQZRWvAJpuixuHTNE2T2CikFGhf
 0XeNfrcjtcMiiRDA==
Received: from director1.suse.de ([192.168.254.71]) by imap3-int with ESMTPSA
 id 4KA2DLxxwGAwQAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Jun 2021 07:46:04 +0000
Subject: Re: [PATCH -next] drm/hyperv: Remove unused variable
To: Pu Lehui <pulehui@huawei.com>, drawat.floss@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20210609024940.34933-1-pulehui@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <078d9bb5-e7af-4961-f4c1-cd3ab415cff4@suse.de>
Date: Wed, 9 Jun 2021 09:46:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210609024940.34933-1-pulehui@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LXACDYnvELLwW2XTlk9lTZeL1bpAzQg1G"
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
--LXACDYnvELLwW2XTlk9lTZeL1bpAzQg1G
Content-Type: multipart/mixed; boundary="i7sjZ91sCO92Q9XiZIpu2oS9noraKeheY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pu Lehui <pulehui@huawei.com>, drawat.floss@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch
Cc: zhangjinhao2@huawei.com, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <078d9bb5-e7af-4961-f4c1-cd3ab415cff4@suse.de>
Subject: Re: [PATCH -next] drm/hyperv: Remove unused variable
References: <20210609024940.34933-1-pulehui@huawei.com>
In-Reply-To: <20210609024940.34933-1-pulehui@huawei.com>

--i7sjZ91sCO92Q9XiZIpu2oS9noraKeheY
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 09.06.21 um 04:49 schrieb Pu Lehui:
> Fixes gcc '-Wunused-const-variable' warning:
>    drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:152:23: warning:
>      'hyperv_modifiers' defined but not used [-Wunused-const-variable=3D=
]
>=20
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 5 -----
>   1 file changed, 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/=
drm/hyperv/hyperv_drm_modeset.c
> index 02718e3e859e..3f83493909e6 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -149,11 +149,6 @@ static const uint32_t hyperv_formats[] =3D {
>   	DRM_FORMAT_XRGB8888,
>   };
>  =20
> -static const uint64_t hyperv_modifiers[] =3D {
> -	DRM_FORMAT_MOD_LINEAR,
> -	DRM_FORMAT_MOD_INVALID
> -};

This constant should rather be used in the call to=20
drm_simple_display_pipe_init(). [1]

Best regards
Thomas

[1]=20
https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/hyperv/hyp=
erv_drm_modeset.c#n161


> -
>   static inline int hyperv_pipe_init(struct hyperv_drm_device *hv)
>   {
>   	int ret;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--i7sjZ91sCO92Q9XiZIpu2oS9noraKeheY--

--LXACDYnvELLwW2XTlk9lTZeL1bpAzQg1G
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDAcbsFAwAAAAAACgkQlh/E3EQov+Bd
YQ//UpyXSQ4P1ggoY9BgZg0gDIuH2KfVdJ2uvYiB5J6zp8uLPkKUFePjO8HrlLM8zPQLHvBvpDA2
qA6ubmTTYKFPvSQxLzUWHCzRJPmZIm4NoxPeKXGDjSEBfQUn8pHvgG84OXfvJpgseL5AzhJCn80c
LyFd9YPnYiAYvJ+aQGlgN9TTAJuofP0Cb4UGGNGiG/L9TgrjzCg/g1fIUBuia4lZ5Ng7eQvLp3fw
bPUn367AIjvVQDgZufTh01Eqe4Os9FuIK6zIIl66x5Lor6voWkn5svVi/Zgej+9BF6F3AvBphe8b
Vka8ck0UY5iddGXzBlIWA1d6Kj7YlkEOtvmn5mJN0zS5G0VBb/eblgBZ9wpRUkI1FgHi12TpPOvN
gcUZU/aVzyxxaJeCyEAX9c0cetHuof7NQj79/RVutGjmcK7ygYrqN2RUZgeKp1AR3E9Sbsb37EOQ
Zplg9Z7UBEkkOsZRHDvz2elx1LwBkgleeApbhp7AWdYojkS0hGZmPGM1Z4enO/LkLKRpA/XetCp6
rwaIuNBpz5ENR3urZZDofr0T2uvTp3XG3BGLM9vfZ7vBtZ7L7lnB3jTzPQKACdakU3+3gQ964Wpc
3MMLhEhiRtE7A0nU1D5zD3WRCeYVtiwy8uURtDgouW3RiNTLC3JUAdA6x+T70A3aVzYNdDkMaWpk
xng=
=sxkL
-----END PGP SIGNATURE-----

--LXACDYnvELLwW2XTlk9lTZeL1bpAzQg1G--
