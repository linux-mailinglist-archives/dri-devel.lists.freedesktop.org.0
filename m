Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA357FC42A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 20:20:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428D510E03B;
	Tue, 28 Nov 2023 19:19:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F6C10E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 19:19:55 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-7b3854d7270so145874539f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 11:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701199194; x=1701803994; darn=lists.freedesktop.org;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cWop46qPfuPcipg0JQs3m1E0Iclo9eohDXiveS+FjfM=;
 b=fuy2sBdLzbWT9/UJQJZhid2rQcwO6sXlfZOjt6lYA+fekVwPM70c85SFUfYIgEDcoO
 lC4gh42G51vH2MMTpMN3O7/F9TW9enPkrwOliuD8z8UTyZ/r0ZsHSXo04whPh28AoiMp
 ofNLGYdgW+H1DZGuUVvk2XiO+HOSK6vhVv2Pr2Mi9NFKWoerO1ZcPmy6muw5in3AlOzQ
 nGtSLvVuV2GHQD33ySsc5gtzJIcxieWnO8lhs5Ys9BkYmrsbJfz5wzChaY3x3xiR823x
 P81PTj0KLs1++x/Uaqqtes76rc9NXxUuL74tpH1at0fSFnsGzi+fWSaKgKVZirskSwiL
 63mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701199194; x=1701803994;
 h=in-reply-to:autocrypt:from:content-language:references:cc:to
 :subject:user-agent:mime-version:date:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cWop46qPfuPcipg0JQs3m1E0Iclo9eohDXiveS+FjfM=;
 b=XPSHvkVQSSLHMFh8AUA+b2x91RN8rWL3T3GNAymTYmdcON++5RqHe/D/7zGiDscax7
 rIfQYgQQcXTVI73K3tHS1GNbjwQdya87Qg9Ah4n6l9Cvx23GZ2bF/H3IockWMqLn/LKl
 9oJ0zExZhgkKGNHmF71V6DRbZpaKJacdNuQeuflA8HnPCLIseFSPTIjepvTiJpPEorkj
 8OOejudvYHlyVbN6c2W3di55SUBeBu8j1X2XaaAkO7Mwhe4g8PZn2cbLDylcB1EMpdPO
 tVpeBdBw1ICCWUe0RUai2GK1Jzr4GFdXbJJugyN2RNq2qB8kcNe97kBbCLcetkh7YIQV
 h3Qw==
X-Gm-Message-State: AOJu0YwukuxwrG+EbotW96qanaYIU9Y0btq/fe1VAFRhxN9c+8OlV0cr
 eur0OOqGkWlEpnGCxsMLpBQ=
X-Google-Smtp-Source: AGHT+IGue2WkGjsngPwzOvSm70G5owIGrhVv0kiboGAcSltJf2gEQS5ecjKxDe0mIrr5GJ5GIZYm0g==
X-Received: by 2002:a5d:9ed3:0:b0:7b3:d91a:4936 with SMTP id
 a19-20020a5d9ed3000000b007b3d91a4936mr2509445ioe.9.1701199194609; 
 Tue, 28 Nov 2023 11:19:54 -0800 (PST)
Received: from [192.168.2.14] ([76.65.20.140])
 by smtp.gmail.com with ESMTPSA id
 r26-20020a6bd91a000000b0079f7734a77esm549424ioc.35.2023.11.28.11.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 11:19:50 -0800 (PST)
Message-ID: <6d6e6f41-5356-40dd-b4d5-b4fbcb4b801e@gmail.com>
Date: Tue, 28 Nov 2023 14:19:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.5.0
Subject: Re: [PATCH] drm/sched: Partial revert of "Qualify drm_sched_wakeup()
 by drm_sched_entity_is_ready()"
To: Bert Karwatzki <spasswolf@web.de>
References: <c5292d06-2e37-4715-96dc-699f369111fa@gmail.com>
 <20231127160955.87879-1-spasswolf@web.de>
Content-Language: en-CA, en-US
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <20231127160955.87879-1-spasswolf@web.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VxxYcpNLyvi1gieQjfMQTZy9"
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
Cc: matthew.brost@intel.com, dakr@redhat.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------VxxYcpNLyvi1gieQjfMQTZy9
Content-Type: multipart/mixed; boundary="------------Q2jkOyXIj0m0PsCgIn0z3M1c";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Bert Karwatzki <spasswolf@web.de>
Cc: christian.koenig@amd.com, dakr@redhat.com,
 dri-devel@lists.freedesktop.org, matthew.brost@intel.com,
 tvrtko.ursulin@intel.com
Message-ID: <6d6e6f41-5356-40dd-b4d5-b4fbcb4b801e@gmail.com>
Subject: Re: [PATCH] drm/sched: Partial revert of "Qualify drm_sched_wakeup()
 by drm_sched_entity_is_ready()"
References: <c5292d06-2e37-4715-96dc-699f369111fa@gmail.com>
 <20231127160955.87879-1-spasswolf@web.de>
In-Reply-To: <20231127160955.87879-1-spasswolf@web.de>

--------------Q2jkOyXIj0m0PsCgIn0z3M1c
Content-Type: multipart/mixed; boundary="------------bX0K14hJdYken20IkDYIT2Va"

--------------bX0K14hJdYken20IkDYIT2Va
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2023-11-27 11:09, Bert Karwatzki wrote:
> Commit f3123c2590005c, in combination with the use of work queues by th=
e GPU
> scheduler, leads to random lock-ups of the GUI.
>=20
> This is a partial revert of of commit f3123c2590005c since drm_sched_wa=
keup() still
> needs its entity argument to pass it to drm_sched_can_queue().
>=20
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2994
> Link: https://lists.freedesktop.org/archives/dri-devel/2023-November/43=
1606.html
> Fixes: f3123c2590005c ("drm/sched: Qualify drm_sched_wakeup() by drm_sc=
hed_entity_is_ready()")
>=20
> Signed-off-by: Bert Karwatzki <spasswolf@web.de>
> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/s=
cheduler/sched_main.c
> index 682aebe96db7..550492a7a031 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1029,9 +1029,8 @@ EXPORT_SYMBOL(drm_sched_job_cleanup);
>  void drm_sched_wakeup(struct drm_gpu_scheduler *sched,
>  		      struct drm_sched_entity *entity)
>  {
> -	if (drm_sched_entity_is_ready(entity))
> -		if (drm_sched_can_queue(sched, entity))
> -			drm_sched_run_job_queue(sched);
> +	if (drm_sched_can_queue(sched, entity))
> +		drm_sched_run_job_queue(sched);
>  }
>=20
>  /**
> --
> 2.43.0
>=20

Reviewed-by: Luben Tuikov <ltuikov89@gmail.com>

Pushed to drm-misc-next.

Thanks!
--=20
Regards,
Luben

--------------bX0K14hJdYken20IkDYIT2Va
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------bX0K14hJdYken20IkDYIT2Va--

--------------Q2jkOyXIj0m0PsCgIn0z3M1c--

--------------VxxYcpNLyvi1gieQjfMQTZy9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCZWY9TAUDAAAAAAAKCRBMFUeUMaM0r+JT
AQCjeYfC2W07Z0goocCQhTQcto4+ggMYLSF0tJej/S4GogD/QLZz5RZu6GOgs/M0IBhl7ajb3BH7
YwKREyEzo0w4JQY=
=XYc3
-----END PGP SIGNATURE-----

--------------VxxYcpNLyvi1gieQjfMQTZy9--
