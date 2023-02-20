Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3824669C6F3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 09:48:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C37310E60B;
	Mon, 20 Feb 2023 08:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA7F899B3;
 Mon, 20 Feb 2023 08:48:13 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z5so383432ljc.8;
 Mon, 20 Feb 2023 00:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=qV5Lw5KifcCJ34n5H2SgCrDAtoK4e/v6u9RV+7WDMKo=;
 b=qYM9dVM71VCa1yx3lx3afU8Si2ccyLfzO62pgum0L+9RUnaiB5gCdCtDaP4QE14xCj
 edjIXNfKeKXAM0IHnCr8ecEdUPP7cye9QWnIKWeWjelyUPBh/Lp47GfweU2lYfA75K7D
 wcW40yAPUzkVhVUFIJgEX+cx1TgGTQGOz+qYmzZpKFA+ytpo85tpqgCzn2LUo2ZHUtky
 UAZ8npHY2U+6GsNNmLlzSKlMHkqSYKJVEuNfA6aKoUP8XlqKDpSzlf1EgZWUty/soWHO
 PB/4LxNHN9cradyec6tcwiylOizcV3bYSws5YC4e6gqpeiWW+gUs9oDDdpZZcbf7RebQ
 V2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qV5Lw5KifcCJ34n5H2SgCrDAtoK4e/v6u9RV+7WDMKo=;
 b=wlRmLYvQH4+7f4TYX6meBrjvDP39e77AP+YjXEnU3Bo8plCFYqjNrmUP9asKYYfwLc
 +pxQOZT2EymX0GFnByjfQaTe1N1BEcaJGB6YkRXYjJfRU4YDv1RQDLP0iya1F3yiP53t
 eLKanNFUL4III6XWD8QrNOYE3jSpkus5paxMk3NL7Cezuyl/vEpKuv1vvNahHc6fpVMA
 FoS9jVi7TXu1hOv6zlpETghBuAvPnnq2226TuX1grg/knQ9zDuk80ubMk3VqKz7K5lHM
 PDpmfZekev0jTqzoyAxbkwHm66Bip03RpnendYtCj/HsrkWo/nnEJjnUpz44VMLYmWsE
 idxQ==
X-Gm-Message-State: AO0yUKUSBJRUR9IiZ+JnEtb7VALv1GeBl31F0S+Lj0L64Nog7fQwFcaC
 RKiLOl7VyNsOpnU9A8+mROw=
X-Google-Smtp-Source: AK7set/Rr6EoOBhFwq77IWkl4T4a8Bkeo4PUk+/Tu6+qvGuXDdiDFhO6mnbj9/rnYFGDM468AoUDZw==
X-Received: by 2002:a05:651c:220c:b0:290:8289:8cb8 with SMTP id
 y12-20020a05651c220c00b0029082898cb8mr580292ljq.6.1676882892028; 
 Mon, 20 Feb 2023 00:48:12 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05651c02c900b002934febffe4sm52988ljo.128.2023.02.20.00.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 00:48:11 -0800 (PST)
Date: Mon, 20 Feb 2023 10:48:08 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 05/14] dma-buf/sync_file: Add SET_DEADLINE ioctl
Message-ID: <20230220104808.261acfab@eldfell>
In-Reply-To: <20230218211608.1630586-6-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-6-robdclark@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Zs=8tBQ+ROU3tBZ1hRIUE2K";
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Zs=8tBQ+ROU3tBZ1hRIUE2K
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 18 Feb 2023 13:15:48 -0800
Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>=20
> The initial purpose is for igt tests, but this would also be useful for
> compositors that wait until close to vblank deadline to make decisions
> about which frame to show.
>=20
> The igt tests can be found at:
>=20
> https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/fence-dea=
dline
>=20
> v2: Clarify the timebase, add link to igt tests
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
>  include/uapi/linux/sync_file.h | 22 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>=20
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index af57799c86ce..fb6ca1032885 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -350,6 +350,22 @@ static long sync_file_ioctl_fence_info(struct sync_f=
ile *sync_file,
>  	return ret;
>  }
> =20
> +static int sync_file_ioctl_set_deadline(struct sync_file *sync_file,
> +					unsigned long arg)
> +{
> +	struct sync_set_deadline ts;
> +
> +	if (copy_from_user(&ts, (void __user *)arg, sizeof(ts)))
> +		return -EFAULT;
> +
> +	if (ts.pad)
> +		return -EINVAL;
> +
> +	dma_fence_set_deadline(sync_file->fence, ktime_set(ts.tv_sec, ts.tv_nse=
c));
> +
> +	return 0;
> +}
> +
>  static long sync_file_ioctl(struct file *file, unsigned int cmd,
>  			    unsigned long arg)
>  {
> @@ -362,6 +378,9 @@ static long sync_file_ioctl(struct file *file, unsign=
ed int cmd,
>  	case SYNC_IOC_FILE_INFO:
>  		return sync_file_ioctl_fence_info(sync_file, arg);
> =20
> +	case SYNC_IOC_SET_DEADLINE:
> +		return sync_file_ioctl_set_deadline(sync_file, arg);
> +
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_fil=
e.h
> index ee2dcfb3d660..c8666580816f 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -67,6 +67,20 @@ struct sync_file_info {
>  	__u64	sync_fence_info;
>  };
> =20
> +/**
> + * struct sync_set_deadline - set a deadline on a fence
> + * @tv_sec:	seconds elapsed since epoch
> + * @tv_nsec:	nanoseconds elapsed since the time given by the tv_sec

Hi,

should tv_sec,tv_nsec be validated like clock_settime() does?

It requires:
- tv_sec >=3D 0
- tv_nsec >=3D 0
- tv_nsec < 1e9


Thanks,
pq


> + * @pad:	must be zero
> + *
> + * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
> + */
> +struct sync_set_deadline {
> +	__s64	tv_sec;
> +	__s32	tv_nsec;
> +	__u32	pad;
> +};
> +
>  #define SYNC_IOC_MAGIC		'>'
> =20
>  /**
> @@ -95,4 +109,12 @@ struct sync_file_info {
>   */
>  #define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_inf=
o)
> =20
> +
> +/**
> + * DOC: SYNC_IOC_SET_DEADLINE - set a deadline on a fence
> + *
> + * Allows userspace to set a deadline on a fence, see dma_fence_set_dead=
line()
> + */
> +#define SYNC_IOC_SET_DEADLINE	_IOW(SYNC_IOC_MAGIC, 5, struct sync_set_de=
adline)
> +
>  #endif /* _UAPI_LINUX_SYNC_H */


--Sig_/Zs=8tBQ+ROU3tBZ1hRIUE2K
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPzM8gACgkQI1/ltBGq
qqcGThAArTvNmspP+NBuhmIe367Uz7E068vGrflxRgHISKGzeiiy8eKI5kxMx/Hq
kN6DmwMs3DzmAKDHMATNegJ05rhS+casRjndjFHKGk7Qb7rb4AllCjStZPDJznjo
yWpGpdIl/TIDX17yM5xNM4a6ynbi0S4WDZPbBUfDQdThx9O4j1nNdKjmNBvIwOvn
V8BrYmQfRtZ80h5+3GDSK87md36T/XzEiLUnu28NG1nPF8wGOV2Oyxjc3gGJC2Tv
kdHuPNyW20umjKYQr00R0J6gzHJe87dF9B7LkKz/gBm4ibvWgENlfVQLkuqWVr0p
lGOVgdJDBd1JnoHxf+hpTavWS15dUQvzyaqrfZR8K8HGC9884NJu/dUB266iVICp
vODamw0fad8APnrRxMZbsWi/orU7PvdS0vGuCmvZAS1cefFDdEIvtYrC9W8szfUb
1Lt5k3W+3znKnMS9cGoyLkyKfY8JXNOMCZPEpthQZxLlhlQRyDxIXhvrjgu6vcQy
8UZaQnL5s7BCgpyldB8hdAP1B9FYeMyjKUeD50nys678mkQbrxGb1wjVlozv2mIm
VnKAV+2ggahmoT5S1XUf1029gda56XmBgyD/v1MTCH5wjd/YQkNiV50kqoHwrLKl
8AKyVmMK0CHBFsYh0Ld46y+tw1lM45+QxOL2OlXHF6jSZS7iTSs=
=oowF
-----END PGP SIGNATURE-----

--Sig_/Zs=8tBQ+ROU3tBZ1hRIUE2K--
