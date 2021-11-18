Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053AD455822
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 10:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBAE6E902;
	Thu, 18 Nov 2021 09:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB8C6E902;
 Thu, 18 Nov 2021 09:34:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id b1so22704322lfs.13;
 Thu, 18 Nov 2021 01:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ARbrIsDJl6nb+742cMjLJ/a1WUOPXIf5/BkR1Yc83M0=;
 b=bAlCZmB0QmTv0ymeYLu+jwmMmsh30C0LBda59s2o2/kYDZn36qNJvtjf6PjYq8hc0d
 1/lUYqF6fz0jTNEN0ntK8jCfQLta9Tfop3YV+RyXfHj+aE1zeeW0Zb6/3qLxnd1YOlnd
 u0z++G4iPwREDRvspQIG7a2HfM7ZgwxwYwd0K8frH6JYPyLZgQHZPCc/nqXvV6jmSq9L
 0qIG6JOLDxQ+1l0msLAqLSh6K22NjJlVUDzuqJ/drVSrdDO4/UOAhya3ZFFLmvKkqK7K
 fBHgVT3NmG0cM2xJR0lTC1a3YGa8d9VYaYNcKzwgm3r4VWYGyAG/HGLMZNhNnRyNSjv8
 vnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ARbrIsDJl6nb+742cMjLJ/a1WUOPXIf5/BkR1Yc83M0=;
 b=z8wi3GUyVBnBbijpd8CQg546+8y+o2bJsJaMgiNrscNP8ADeYOaghNg0aVPNYlHCWy
 4e8XNI+F+PB4IW2pQoPiFZLd2q3Il8Jx14vRxNMH/k/jLacOC8UpUroHgtTBN38/z7tv
 UPAXan3vQUaynA12K21y6Df+Z5XeMeNFor3pZsOEMrqmh78H1D3vSNFGIX0fuf8lRbMT
 1HDrhlrhnYuno/ZJWsub3gLpzmFSwi53mOPYR2/c/gH3/06qhprFI46saoj3CShltXTc
 bsDea7VCGiCdRNuFBcBZg0azhu4UcJQHUZ0Uqixm5Ee95Z6PLZjfGdpnB+882gauBpFK
 5lVg==
X-Gm-Message-State: AOAM5316WsJT5KEa6iRju/6E6p9GNkC1c+cGyrEvW7Y79EBNIh2pesjJ
 xQgyPGZ9jFUUapHN8dMXGKc=
X-Google-Smtp-Source: ABdhPJzi3c/JOIGKSS8quZzr75d+V1ABqS8pOa4WAR0TVIUDvhbdZBUehTSrOOCtqVkKiBLo9Iu+Eg==
X-Received: by 2002:a05:651c:503:: with SMTP id
 o3mr14990111ljp.249.1637228088970; 
 Thu, 18 Nov 2021 01:34:48 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x16sm247992lfu.112.2021.11.18.01.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 01:34:48 -0800 (PST)
Date: Thu, 18 Nov 2021 11:34:45 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: Re: [i-g-t 11/14] lib/igt_kms: Add pipe color mgmt properties
Message-ID: <20211118113445.01ef2b9e@eldfell>
In-Reply-To: <20211115094759.520955-12-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-12-bhanuprakash.modem@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1/RV9MD+CJj5=9Y4S6eTyuF";
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
Cc: igt-dev@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>,
 dri-devel@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/1/RV9MD+CJj5=9Y4S6eTyuF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Nov 2021 15:17:56 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> From: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
>=20
> Add support for Pipe color management properties.

The commit summary and message are misleading.

This patch makes igt recognise the CRTC GAMMA_MODE KMS property.


Thanks,
pq

>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 1 +
>  lib/igt_kms.h | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index fdb83e0f91..677d26fedb 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -592,6 +592,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_P=
ROPS] =3D {
>  	[IGT_CRTC_CTM] =3D "CTM",
>  	[IGT_CRTC_GAMMA_LUT] =3D "GAMMA_LUT",
>  	[IGT_CRTC_GAMMA_LUT_SIZE] =3D "GAMMA_LUT_SIZE",
> +	[IGT_CRTC_GAMMA_MODE] =3D "GAMMA_MODE",
>  	[IGT_CRTC_DEGAMMA_LUT] =3D "DEGAMMA_LUT",
>  	[IGT_CRTC_DEGAMMA_LUT_SIZE] =3D "DEGAMMA_LUT_SIZE",
>  	[IGT_CRTC_MODE_ID] =3D "MODE_ID",
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 3a1f7243ad..5fac651fa3 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -119,6 +119,7 @@ enum igt_atomic_crtc_properties {
>         IGT_CRTC_CTM =3D 0,
>         IGT_CRTC_GAMMA_LUT,
>         IGT_CRTC_GAMMA_LUT_SIZE,
> +       IGT_CRTC_GAMMA_MODE,
>         IGT_CRTC_DEGAMMA_LUT,
>         IGT_CRTC_DEGAMMA_LUT_SIZE,
>         IGT_CRTC_MODE_ID,


--Sig_/1/RV9MD+CJj5=9Y4S6eTyuF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGWHjUACgkQI1/ltBGq
qqeNDg//SBWGCv6eEhezNgg2Jnio8j7nnT0pZ/jdUq77I2ZRV4eWDxPeBof3u8jl
RsqU1RT5MTmnAyrOn0gw1kjNut3RVF79apEMKwTNGG673KN9ZcwuQ9E3aUsUEfaS
l6SnftZzPrFwzzmAgqf5KAvpwk8UuzhSIdCB+g3cclxQW7qIlwht9X7t2altrLat
99EOTSa2IWeiqvJTv+WZZ/yQ3hyUYnyzIg5cTqcLfSSnBrNpCLMLdY8behF7yqIj
ZpNO6lS89gBk/X8iCnMx78FzYzlZibWhxBv0ADINs/9+owjakf5JbHSbBGbjxwoA
CrpoKESXV8Axw7Wns/wwmDc505OKFafLWovuqxWe3alPF2zwM7J8IoSJ329v5IPf
o5fQyf34C7DGAJsmqLtyGJjCV9gGk6OI3LUdc1vAuUHKcF8d7BIeBs7/v29F4vJT
whuIjcqW2pIOvuJOholNK3LCJYYMjkh0vIwMAJkl+PmZdXQcfx0d3njUF/WLf/AI
q6GdO7o+tb0i0jygUhjKePmrTK6vYsTIcfzfLwi9j1YyCwoCDWiM6dTw6sWgcF6f
Jk002LWBXWnz/R1nyN1iUEuOWXphLeSzOM8ddnq6ODkDygx+ngcqWpv71K9VEGXQ
p85pEgA29IfvD30kJOCGQx/WVaPx0+lO3+2kI/cVNb6mDaSutEA=
=BZCY
-----END PGP SIGNATURE-----

--Sig_/1/RV9MD+CJj5=9Y4S6eTyuF--
