Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2E041910A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 10:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4357989F6B;
	Mon, 27 Sep 2021 08:42:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06D7689F6B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 08:42:13 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t10so73941527lfd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 01:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=1BG0A7psUXeGAUQUvHgRgao8dcZIRyXeRNw4ym7V7hQ=;
 b=YUkw8+PzjqCIs3sdkd0kJKxzjL53C40Ukx8I5yuZZPCkVvKLn/Nq8tvO+VpJy4+noU
 Y7aNcUkEHDjA+8NCOHX5tS9F59FkKqaUmnO6M9c0V5LLVCDJ420UfA0kw9g8+x6ZBcvP
 O2DLhwYba4pe5bZLLuhzKcRu4rfojLvcGdHWSX0ybYwlLFJnjKG9qj0GBAwhPvWFBK8J
 HZcPHBJU5LnxF6Sp4dM47l0PxoTKzzHU0VIcj145UDhpKXBCGjRd2FyHsGhoDoRqQLAW
 F+Cb3oqtlf7Rxn0VjMiObE/sBZAOLzmnU/7ajAEuwLOCtuUpWvffiLF8lsml2VKY19Wj
 di1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=1BG0A7psUXeGAUQUvHgRgao8dcZIRyXeRNw4ym7V7hQ=;
 b=Yxr2ygCBJKp34XhS9V4fMUq51Lw63mwV+yoGP+7oiYAyWiJyc8/jkHinpaOIPCWpt9
 jiN/Ceh/WWQUqYRghcESImqxV4QgCCtpk66XYStw8RneCVDXLzgmYqnK6SA96LGlit0S
 1UyI0nutQ6QWLiVfDAB6ukcMJuQN4v1XSfwwSJ1g+KvVjC3F8xK4wg1BAv32fVkkGELd
 czdvAP5hFixj79qYp3jx1f47HBJFuJYuxtGdST3i9+2GwyK/MHG8loyWj25wb7U2EnLL
 OoS454L/OTS81MLnBcjwIn74x6FAz3hT6eryxwJzSg+nf8RVOAsNcClEIp5Ouf/EMK7y
 OK8g==
X-Gm-Message-State: AOAM533xPY6lakdLuG5TZFNfbxgk+evHpl8dcrMU6EP9319kWSo8o7bh
 upbpcUf3bJH5THxgorBbVRs=
X-Google-Smtp-Source: ABdhPJz9IEdgS3tt3ObWODiNcVsXRujmPf+tYf3g2mh+Z4t7iY4w5zOjn9nOjTj61PF93sYD/eTBmg==
X-Received: by 2002:ac2:4c52:: with SMTP id o18mr22119107lfk.108.1632732131214; 
 Mon, 27 Sep 2021 01:42:11 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v1sm1529371lfp.215.2021.09.27.01.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 01:42:10 -0700 (PDT)
Date: Mon, 27 Sep 2021 11:42:01 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Daniel
 Vetter <daniel@ffwll.ch>, Christian =?UTF-8?B?S8O2bmln?=
 <ckoenig.leichtzumerken@gmail.com>, Michel =?UTF-8?B?RMOkbnplcg==?=
 <michel@daenzer.net>, Rob Clark <robdclark@chromium.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Gustavo Padovan <gustavo@padovan.org>, Christian
 =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org (open list:SYNC FILE FRAMEWORK),
 linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v3 8/9] dma-buf/sync_file: Add SET_DEADLINE ioctl
Message-ID: <20210927114201.1f8fdc17@eldfell>
In-Reply-To: <20210903184806.1680887-9-robdclark@gmail.com>
References: <20210903184806.1680887-1-robdclark@gmail.com>
 <20210903184806.1680887-9-robdclark@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ae3zq/xxfd0mOmS+IV/YXES";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Ae3zq/xxfd0mOmS+IV/YXES
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri,  3 Sep 2021 11:47:59 -0700
Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>=20
> The initial purpose is for igt tests, but this would also be useful for
> compositors that wait until close to vblank deadline to make decisions
> about which frame to show.
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/dma-buf/sync_file.c    | 19 +++++++++++++++++++
>  include/uapi/linux/sync_file.h | 20 ++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>=20
> diff --git a/drivers/dma-buf/sync_file.c b/drivers/dma-buf/sync_file.c
> index 394e6e1e9686..f295772d5169 100644
> --- a/drivers/dma-buf/sync_file.c
> +++ b/drivers/dma-buf/sync_file.c
> @@ -459,6 +459,22 @@ static long sync_file_ioctl_fence_info(struct sync_f=
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
> @@ -471,6 +487,9 @@ static long sync_file_ioctl(struct file *file, unsign=
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
> index ee2dcfb3d660..f67d4ffe7566 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -67,6 +67,18 @@ struct sync_file_info {
>  	__u64	sync_fence_info;
>  };
> =20
> +/**
> + * struct sync_set_deadline - set a deadline on a fence
> + * @tv_sec:	seconds elapsed since epoch
> + * @tv_nsec:	nanoseconds elapsed since the time given by the tv_sec
> + * @pad:	must be zero

Hi Rob,

I think you need to specify which clock this timestamp must be in.

Which epoch? Sounds a bit like CLOCK_REALTIME to me which would not
make sense.

Also I cannot guess how a compositor should be using this, so
explaining the expected usage would be really good, with reasons for
why should userspace bother.


Thanks,
pq

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
> @@ -95,4 +107,12 @@ struct sync_file_info {
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


--Sig_/Ae3zq/xxfd0mOmS+IV/YXES
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFRg9kACgkQI1/ltBGq
qqerWg//URIwzyumTcB8NXNy0zbIi4YZDXfe6dn9jZvFT+6n4Gdze1shYvrcxMli
32IX5GxFXHhKZcjH4ugvlN3PJ+yn1IwuxJ7W2eCkj/IRPHWe8xvgvzzv/VWKhriW
g9tYOOkEtD4z31Gl2pBV9c3I9wSot2mpToMHQcx2Df0QZmyXqol5QbX6SkcZsIL8
tCsuYY9tpe2v91NpMEFZtJEmIuDezKh6JEy3djZ+Jd3LB0aFCRuH3ewKYaxpRH+9
f9qrpzIe/1r1bu2t/y/YQSg/HhaX38TKcNme7hyc60k2b31RJU/LkyCrjBYt7wua
qXCr/7ZYJF4kELTuDKAkhdeX4dtI8ijD9VVjlqsm22pPiNlzIulMtkrTXwGGHaA1
QqiunoZOzdXO3PDA6ogOkEnjjWQJPLIiQC7DJ1F9fffy0AnbHvyOAREt1ETlZ+lE
GDufS931n4Cwv4TXpoMNeDeKrVjd/VMfP+cvG/gyitBDqKH5L75boTdJKXGFUZmW
I2SrhTkQ36n4eoeujHr6ed5E2WAye3rhCZbwkMIE39RE2x8FIHm954DXI4Jj9if1
MHmbrWR5/btLEJt1yldy07+zfFSr3xQiCEAA8q1ZXULRPzbXwa2JuWrjsOHuUjQv
bDi20VmhLKrjDNUBtg8Su1s+u+fpv9iDhsIoCBLIEMAFbe2b+70=
=jyP1
-----END PGP SIGNATURE-----

--Sig_/Ae3zq/xxfd0mOmS+IV/YXES--
