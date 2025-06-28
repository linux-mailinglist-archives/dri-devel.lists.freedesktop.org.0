Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B99FAEC3CF
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 03:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B000910E08B;
	Sat, 28 Jun 2025 01:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e2rtf5JE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1751410E08B
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Jun 2025 01:30:26 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-236377f00a1so26216335ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 18:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751074226; x=1751679026; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y8AXPmpG2VMuBb/O9YnQP2cAp0A39EaY7EJfwm1hV+c=;
 b=e2rtf5JE7NuZEsQWo+7rnMCJF2hSlvJd5bbyP5i60hsJgTtvQlCBD4RtCpK3iqFe4W
 6pay4vhDlFTAR6D/eVgZ8eHEwFU+a7Ub+lDYDg/Fp1NBUYEpk0Qwmo39+18vxeAAnm0N
 Z5exr+EOceykVFxpi+Pv97QdUa5w6Cv1XorAkq4zQ0SRHRS4lnze/+Vatq1WbeMsxA/c
 MBRMic1icnVgUZGRFbGk450FELoh1MvPKm4RS38XQHcL3A2HadYgqJsGbHCFvEWcAU+T
 cCEdeAnlhh7xxOG0Q+4vrBVLvwQ6qQQiu31Ld/Aaoam38D50H+1CDf5w6mOsjkvmrs1O
 BnYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751074226; x=1751679026;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8AXPmpG2VMuBb/O9YnQP2cAp0A39EaY7EJfwm1hV+c=;
 b=I4whybkMsIzC+4IT9X4WIU4y49MC3wGkWfVsVEO7xB62BMpSzrKPZjlO6ktmrYhcYP
 fxoIbGesjc5gLpRSYl6Ho6I3dJ7vtuzmZZ3DeW8hyd+D9/tfJ6DehHg/ZbeJUR7apJrm
 oryK/At00F3KV38Ku7T8cnxILRNkKEfxyNGNArur0bvlDxVQTuiif4ay6cj8KHEUSdzL
 dWq6ac8S2KW9KhtbVMVUSqB8WYM035o1lXpYKo1r5/hAlqLccu3ie5aQYZ5vgsU4vwiW
 bSissR20B12OPu6+SFJcI2mprcPgzfD3rbYZUca/W6JyNZuS1fi/XoHlwBidgXnyV9gD
 NbfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/41WqOF6b1IM2yGFOva5Vj8MEX48w1l0CIqBwrRLIN/ch7ecnfmVX41tYfgYFLBi010uWmiEQxec=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1MxZL2N4xZFW9Xm/vwA+JZeRwOYmFdlhJDvYaxnJs4F9UkKuv
 W8mM4wb1+hbo6qjFc/4uWYm5zzHs7qmKXCdNlwIvJAQVeUE22RQfgGj1
X-Gm-Gg: ASbGncsx44WbmMTi8s1n7Y+unBRuoeqY4O+AJ2VSvDNa8cog2w6vwQmOTk69Y0bkPdX
 zAaD10mPaAvUORCg8GjFHULuHMFcy/BS8fAjXafBoqHKdG7+WY7/WAaMH0TM0J6Snm9zJ9iy0cg
 y75Z93cy7zON1qUS+lB9Gqu4yrL4MjyEmgSwIfS2l7Nv0fHKokkeP+9W6ri3066g7tjCBpMcdUU
 ochpe2DHGmlwr5+b+E174TuETgg5e1t9EnOgqICz22/PN7Oao8cFvlRkbrI5pxp2r0/XKnHMP7u
 zSMLFTYsXkUDrcMpYovhs1cv3PgnWp83qlnc7e3yfAKS83ZVrdVcaKgdJQxh0Q==
X-Google-Smtp-Source: AGHT+IEhpBuJ3GjJ2GV96K93NPQPaz+CSELR+iF2uzhaORXUXQQfB5dul2kwwnAmFKMrTiXr3jo19Q==
X-Received: by 2002:a17:902:c401:b0:235:f4f7:a62b with SMTP id
 d9443c01a7336-23ac4665179mr88553105ad.41.1751074225506; 
 Fri, 27 Jun 2025 18:30:25 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c90d5sm26854075ad.247.2025.06.27.18.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 18:30:24 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 7A3DF423BF27; Sat, 28 Jun 2025 08:30:21 +0700 (WIB)
Date: Sat, 28 Jun 2025 08:30:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>, airlied@gmail.com,
 simona@ffwll.ch
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2] workaround for Sphinx false positive preventing
 indexing
Message-ID: <aF9FrVzkZHrIRKEa@archie.me>
References: <20250627115718.17673-1-kevinpaul468@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jygN2+v8Ef8hw9M2"
Content-Disposition: inline
In-Reply-To: <20250627115718.17673-1-kevinpaul468@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--jygN2+v8Ef8hw9M2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[also Cc'ing Mauro]

On Fri, Jun 27, 2025 at 05:27:18PM +0530, Kevin Paul Reddy Janagari wrote:
> Functions drm_format_info, drm_modeset_lock, drm_ioctl_flags are not being
> indexed in the documentation because there are structs with the same name=
=20
> and sphinx is only indexing one of them, Added them to namespaces as a
> workaround for suppressing the warnings and indexing the functions
>=20
> This is a bug of Sphinx >=3D3.1, first reported by Mauro in September 2020
> Link: https://github.com/sphinx-doc/sphinx/issues/8241
>=20
> Signed-off-by: Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>
> ---
>  Documentation/gpu/drm-kms.rst  | 4 ++++
>  Documentation/gpu/drm-uapi.rst | 2 ++
>  2 files changed, 6 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index abfe220764e1..b18a99869b6d 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -357,8 +357,10 @@ Format Functions Reference
>  .. kernel-doc:: include/drm/drm_fourcc.h
>     :internal:
> =20
> +.. c:namespace-push:: gpu_drm
>  .. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
>     :export:
> +.. c:namespace-pop::
> =20
>  .. _kms_dumb_buffer_objects:
> =20
> @@ -473,8 +475,10 @@ KMS Locking
>  .. kernel-doc:: include/drm/drm_modeset_lock.h
>     :internal:
> =20
> +.. c:namespace:: gpu_drm
>  .. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
>     :export:
> +.. c:namespace-pop::
> =20
>  KMS Properties
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.=
rst
> index 69f72e71a96e..e9d7b7282a19 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -554,8 +554,10 @@ DRM specific patterns. Note that ENOTTY has the slig=
htly unintuitive meaning of
>  .. kernel-doc:: include/drm/drm_ioctl.h
>     :internal:
> =20
> +.. c:namespace-push:: gpu_drm
>  .. kernel-doc:: drivers/gpu/drm/drm_ioctl.c
>     :export:
> +.. c:namespace-pop::
> =20
>  .. kernel-doc:: drivers/gpu/drm/drm_ioc32.c
>     :export:

Works as expected, thanks!

Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--jygN2+v8Ef8hw9M2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaF9FpQAKCRD2uYlJVVFO
o30+AQD0JcVjSsCcFjAd4jMRB1T4R+PpgE/ka0f8n3tq9MD4NwEA+FwOlvSfVA/C
MuG6SuSMSTogXWQx14VDQqzEGzhx6wQ=
=PST+
-----END PGP SIGNATURE-----

--jygN2+v8Ef8hw9M2--
