Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A38CA2F5D00
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 10:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B664A89C3F;
	Thu, 14 Jan 2021 09:14:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD8789C3F;
 Thu, 14 Jan 2021 09:14:58 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id f17so5586777ljg.12;
 Thu, 14 Jan 2021 01:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=KCeCmqIaDw/l0l8xHT11HKvNFZExa//eoeJGWW6J9Qg=;
 b=u4nowdlCti9v3FjR8gcvVbYq1IGIvFwX+RKs9nm+SJ1Yn3MymFwQ4jXD5+Ci1ma9MQ
 ijeZTVqG71vmuGofK/A4kG5BjWfYWerXOayfGGKJVNVfPmHIw1zHdt8f1CfaiNR6XO/E
 msmNs0lyA9OGApyN7B1XLXN0mnoSTn9xSVDqukYJv9RCS9XQ9Z8FFKYZupuTM6lA8Ecg
 RZXgfka34+wQBE7jGyW19mNc20FRtLfXYRqSSioCZEhmztWMldE/LDiPircFjYqx6uRg
 gctJwnB9dHHZg6deW1JF+6Cl8lexywWaoAwYTTfeNEpRisxsbmJPar3AOQzxEYHpvq5H
 +boQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=KCeCmqIaDw/l0l8xHT11HKvNFZExa//eoeJGWW6J9Qg=;
 b=er9QNXtlHjJ7h6ChStQqhPdbfj97GinEG6BYKrH6XsEG6imATVaTIw6YN+vy1urPf6
 4GY25o6Idduou5AALH4eF08kPVzW6sgH/YhTN19XtSlcsb60bEJq3SEsrQJ3XcTTZ28y
 Hv43xdm37bta0rzO+Qfqky/3AKMHUuyUtZS5udW61C4h4NGSLFsQj84F7nDg/by5cKYc
 TYyaEzTm9PNAzwEvZdJZG3yBS5Lbu/gSakIxXLO3yqD7KysZdQBSzQmaOvxuHzuUhQjj
 a5PeZhnpzEmTVSlCsxCfhGzT3PE8c06i48Ef4bUK5PvQk9RVePQZd4nvA2/DuSk4PqqJ
 Yd2w==
X-Gm-Message-State: AOAM533iPMv4p5+z5guqMnu0pmN4mmdRmM2yDuPbG7sw9OBgN+6AXd5l
 L6TKKie7S4e0PHOMWZH1iIA=
X-Google-Smtp-Source: ABdhPJxvcKc494ozbQmRKuKK8PYDyK19VIxWM1aDjG6om9cKAS4LDCbszKYKmdtPn6j5XzsXBGPqow==
X-Received: by 2002:a2e:8714:: with SMTP id m20mr2584132lji.320.1610615697007; 
 Thu, 14 Jan 2021 01:14:57 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id i194sm487387lfi.66.2021.01.14.01.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 01:14:56 -0800 (PST)
Date: Thu, 14 Jan 2021 11:14:45 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: Re: [PATCH v3 1/3] drm/amd/display: Add module parameter for
 freesync video mode
Message-ID: <20210114111445.1d2bbf62@eldfell>
In-Reply-To: <20210104210800.789944-2-aurabindo.pillai@amd.com>
References: <20210104210800.789944-1-aurabindo.pillai@amd.com>
 <20210104210800.789944-2-aurabindo.pillai@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: stylon.wang@amd.com, shashank.sharma@amd.com, thong.thai@amd.com,
 dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, wayne.lin@amd.com, alexander.deucher@amd.com,
 nicholas.kazlauskas@amd.com
Content-Type: multipart/mixed; boundary="===============1017383284=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1017383284==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tjMruPjQgUEaJF_K_u0ohVO"; protocol="application/pgp-signature"

--Sig_/tjMruPjQgUEaJF_K_u0ohVO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Jan 2021 16:07:58 -0500
Aurabindo Pillai <aurabindo.pillai@amd.com> wrote:

> [Why&How]
> Adds a module parameter to enable experimental freesync video mode modeset
> optimization. Enabling this mode allows the driver to skip a full modeset=
 when
> freesync compatible modes are requested by the userspace. This paramters =
also
> adds some standard modes based on the connected monitor's VRR range.
>=20
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Acked-by: Christian K=C3=B6nig <christian.koenig at amd.com>
> Reviewed-by: Shashank Sharma <shashank.sharma@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |  1 +
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index 100a431f0792..12b13a90eddf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -177,6 +177,7 @@ extern int amdgpu_gpu_recovery;
>  extern int amdgpu_emu_mode;
>  extern uint amdgpu_smu_memory_pool_size;
>  extern uint amdgpu_dc_feature_mask;
> +extern uint amdgpu_exp_freesync_vid_mode;
>  extern uint amdgpu_dc_debug_mask;
>  extern uint amdgpu_dm_abm_level;
>  extern struct amdgpu_mgpu_info mgpu_info;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index b48d7a3c2a11..2badbc8b2294 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -158,6 +158,7 @@ int amdgpu_mes;
>  int amdgpu_noretry =3D -1;
>  int amdgpu_force_asic_type =3D -1;
>  int amdgpu_tmz;
> +uint amdgpu_exp_freesync_vid_mode;
>  int amdgpu_reset_method =3D -1; /* auto */
>  int amdgpu_num_kcq =3D -1;
> =20
> @@ -786,6 +787,17 @@ module_param_named(abmlevel, amdgpu_dm_abm_level, ui=
nt, 0444);
>  MODULE_PARM_DESC(tmz, "Enable TMZ feature (-1 =3D auto, 0 =3D off (defau=
lt), 1 =3D on)");
>  module_param_named(tmz, amdgpu_tmz, int, 0444);
> =20
> +/**
> + * DOC: experimental_freesync_video (uint)
> + * Enabled the optimization to adjust front porch timing to achieve seam=
less mode change experience
> + * when setting a freesync supported mode for which full modeset is not =
needed.
> + * The default value: 0 (off).
> + */
> +MODULE_PARM_DESC(
> +	freesync_video,
> +	"Enable freesync modesetting optimization feature (0 =3D off (default),=
 1 =3D on)");
> +module_param_named(freesync_video, amdgpu_exp_freesync_vid_mode, uint, 0=
444);
> +
>  /**
>   * DOC: reset_method (int)
>   * GPU reset method (-1 =3D auto (default), 0 =3D legacy, 1 =3D mode0, 2=
 =3D mode1, 3 =3D mode2, 4 =3D baco)

Hi,

please document somewhere that ends up in git history (commit message,
code comments, description of the parameter would be the best but maybe
there isn't enough space?) what Christian K=C3=B6nig explained in

https://lists.freedesktop.org/archives/dri-devel/2020-December/291254.html

that this is a stop-gap feature intended to be removed as soon as
possible (when a better solution comes up, which could be years).

So far I have not seen a single mention of this intention in your patch
submissions, and I think it is very important to make known.

I also did not see an explanation of why this instead of manufacturing
these video modes in userspace (an idea mentioned by Christian in the
referenced email). I think that too should be part of a commit message.


Thanks,
pq

--Sig_/tjMruPjQgUEaJF_K_u0ohVO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmAAC4YACgkQI1/ltBGq
qqd8ZhAAqfBHH7XyswAFQ0sDlKhaI8SmdU8SqSs5oUlzcijxwQbfrOVvejccy7/H
NvlxKhCL40T+tGxCmQzCRQrLpMQ0/luFpMsFve3ZNYp28HFbJqxPsBdmtV9aifs3
EaVap+YnH/SPiEqyGoa51RTnRH+FIlqbGUvXIrFHm4n3xtb+O38vwEGi6OpxA7YK
wZFgEYxjsNyEce4SSfjKt8x0F50FchT4QJJEjnoZimcr+NjAVy+e3U2ONHPNKoBd
9nLByGLKjl+zt3k/XGURkkiHXMpAl4vd1c31WuQ1wZJP8juuNnBHSUkNb85vjdOg
BTyMRLIIQZA8gWnceLyCwUWP8OSaBDoCSHNNvU8LtceSZgu3+npf6wWeCs8No/Xf
ZEicS/NoxqsxABecZZQL8Sm4QKH8S48F9SzYgxR6ktlXszChJehExWWQZnCbjgWy
lYSWmiX0F2Kf1yqzkEUJjqS1iZoEGG+4EN3hhA7bMXbf7A9FGVJAOcMirU7kxi+M
VP6GjUpTpePqhBPuPg/1MjbZQBktzXILuuy2u1FqhtJD7/3NajEJkEeoudiQlBa6
AkOuKkIECvPtJaLct9cg/5Xwum5wk+uqMnCF384aEfKto7P3BdS1t0JGk3SDVqp/
7ROEpJEmKP4PcS5esb2G+ZiWzkfFtDbmMsRe+Ynu3xmVgiYAbg0=
=KqKy
-----END PGP SIGNATURE-----

--Sig_/tjMruPjQgUEaJF_K_u0ohVO--

--===============1017383284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1017383284==--
