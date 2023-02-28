Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A36A5592
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 10:23:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9E610E65B;
	Tue, 28 Feb 2023 09:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A812210E659;
 Tue, 28 Feb 2023 09:23:15 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id k14so12235846lfj.7;
 Tue, 28 Feb 2023 01:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677576194;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=npzAjHtm5Aug8QOfbJ5dztAADOLzeyYlASny4nFL7nA=;
 b=WLPbn+kwyy5ORuAFd/3EiqfumHpfaM6rnMcaibOSwSZVt0+KqRUQZEThXo5XUlaXIj
 cZuIw6H/OqTktALRUwXmZ7/zwE4qXJFUO+I9XLvG+IQGgL7Mi3UTFhmrtCaXh6r9sPbJ
 XyPdBzkjscLuYBwX9ZwKh62WuRPYbYfpyz0yNLO5b1cpJCTTxMS4nNiSUfnwCzbyWi1E
 iHvSAWOEhoBlj+gRWPFzNM/LY6ojiBWUJ52ZJczHTKwX+J9YOm7luVtxksqaIe7qSXE1
 IFi0HwDDMPe3rN7oNsnOWMMPtfWEFbID1sGprpzkoHluJcFGj2l2LusSeV2oajAJETFx
 RjwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677576194;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=npzAjHtm5Aug8QOfbJ5dztAADOLzeyYlASny4nFL7nA=;
 b=qaTPJu1OOHHpfzwkCTUMoaKZuc+B0rwWAjsWcP0TuGu9wN5eYGhxv91wbA0uAoogHT
 ZjiDBcO0IUimyscYO1BN7/OccQ8frRGvaIH5dNI3Qnys6+17fPhRVFBKmq8PMz/2l4iV
 QBj8EluIlpCiB/OD2g0Obiz8Ej2AqOMJAn+I2btMIhv7DSSJMhRYmWg+VRq8FA4Lz87F
 FywCwggP5MBWaAEIrKXdyueWPNdoesSXyOvOzSoATsLdD3s+0etpeEBKXZXmHHTIvo64
 N9V+PdEA8F581a1voeWrldO2sQyizKjHjySC/TYg4/kapywc1JUTTS3IGtaoPs2WJlra
 ct+w==
X-Gm-Message-State: AO0yUKX8nAmev/au7qvDh1JUWTdRYqVu7Gd/ndMs4+dLzeDjQHf/PCOq
 X/3QF9Wt7+FumfDlAIfYPq0=
X-Google-Smtp-Source: AK7set9mdzfycnAPOkQV6+lzwV3/EwkFTPfCVDBUrije806Gw9JGtAIGIjLIbxRVPQP92RCNiQ3KAQ==
X-Received: by 2002:a05:6512:2203:b0:4d8:51e7:9f23 with SMTP id
 h3-20020a056512220300b004d851e79f23mr741318lfu.34.1677576193727; 
 Tue, 28 Feb 2023 01:23:13 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 g4-20020a19ac04000000b004cb3fbc7925sm1253133lfc.77.2023.02.28.01.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 01:23:13 -0800 (PST)
Date: Tue, 28 Feb 2023 11:23:10 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v7 07/15] dma-buf/sw_sync: Add fence deadline support
Message-ID: <20230228112310.39274fcf@eldfell>
In-Reply-To: <20230227193535.2822389-8-robdclark@gmail.com>
References: <20230227193535.2822389-1-robdclark@gmail.com>
 <20230227193535.2822389-8-robdclark@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/8aE4tGFLiLpdo+6qg3s=3bO";
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
 Sumit Semwal <sumit.semwal@linaro.org>, "moderated list:DMA BUFFER
 SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, "open list:SYNC
 FILE FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/8aE4tGFLiLpdo+6qg3s=3bO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Feb 2023 11:35:13 -0800
Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>=20
> This consists of simply storing the most recent deadline, and adding an
> ioctl to retrieve the deadline.  This can be used in conjunction with
> the SET_DEADLINE ioctl on a fence fd for testing.  Ie. create various
> sw_sync fences, merge them into a fence-array, set deadline on the
> fence-array and confirm that it is propagated properly to each fence.
>=20
> v2: Switch UABI to express deadline as u64
> v3: More verbose UAPI docs, show how to convert from timespec
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/sw_sync.c      | 58 ++++++++++++++++++++++++++++++++++
>  drivers/dma-buf/sync_debug.h   |  2 ++
>  include/uapi/linux/sync_file.h |  6 +++-
>  3 files changed, 65 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> index 348b3a9170fa..3e2315ee955b 100644
> --- a/drivers/dma-buf/sw_sync.c
> +++ b/drivers/dma-buf/sw_sync.c
> @@ -52,12 +52,28 @@ struct sw_sync_create_fence_data {
>  	__s32	fence; /* fd of new fence */
>  };
> =20
> +/**
> + * struct sw_sync_get_deadline - get the deadline hint of a sw_sync fence
> + * @deadline_ns: absolute time of the deadline
> + * @pad:	must be zero
> + * @fence_fd:	the sw_sync fence fd (in)
> + *
> + * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)

Hi,

the commit message explains this returns the "most recent" deadline,
but the doc here forgets to mention that. I suppose that means the
most recently set deadline and not the deadline furthest forward in
time (largest value).

Is "most recent" the appropriate behaviour when multiple deadlines have
been set? Would you not want the earliest deadline set so far instead?

What if none has been set?

> + */
> +struct sw_sync_get_deadline {
> +	__u64	deadline_ns;
> +	__u32	pad;
> +	__s32	fence_fd;
> +};
> +
>  #define SW_SYNC_IOC_MAGIC	'W'
> =20
>  #define SW_SYNC_IOC_CREATE_FENCE	_IOWR(SW_SYNC_IOC_MAGIC, 0,\
>  		struct sw_sync_create_fence_data)
> =20
>  #define SW_SYNC_IOC_INC			_IOW(SW_SYNC_IOC_MAGIC, 1, __u32)
> +#define SW_SYNC_GET_DEADLINE		_IOWR(SW_SYNC_IOC_MAGIC, 2, \
> +		struct sw_sync_get_deadline)
> =20
>  static const struct dma_fence_ops timeline_fence_ops;
> =20
> @@ -171,6 +187,13 @@ static void timeline_fence_timeline_value_str(struct=
 dma_fence *fence,
>  	snprintf(str, size, "%d", parent->value);
>  }
> =20
> +static void timeline_fence_set_deadline(struct dma_fence *fence, ktime_t=
 deadline)
> +{
> +	struct sync_pt *pt =3D dma_fence_to_sync_pt(fence);
> +
> +	pt->deadline =3D deadline;
> +}
> +
>  static const struct dma_fence_ops timeline_fence_ops =3D {
>  	.get_driver_name =3D timeline_fence_get_driver_name,
>  	.get_timeline_name =3D timeline_fence_get_timeline_name,
> @@ -179,6 +202,7 @@ static const struct dma_fence_ops timeline_fence_ops =
=3D {
>  	.release =3D timeline_fence_release,
>  	.fence_value_str =3D timeline_fence_value_str,
>  	.timeline_value_str =3D timeline_fence_timeline_value_str,
> +	.set_deadline =3D timeline_fence_set_deadline,
>  };
> =20
>  /**
> @@ -387,6 +411,37 @@ static long sw_sync_ioctl_inc(struct sync_timeline *=
obj, unsigned long arg)
>  	return 0;
>  }
> =20
> +static int sw_sync_ioctl_get_deadline(struct sync_timeline *obj, unsigne=
d long arg)
> +{
> +	struct sw_sync_get_deadline data;
> +	struct dma_fence *fence;
> +	struct sync_pt *pt;
> +
> +	if (copy_from_user(&data, (void __user *)arg, sizeof(data)))
> +		return -EFAULT;
> +
> +	if (data.deadline_ns || data.pad)
> +		return -EINVAL;
> +
> +	fence =3D sync_file_get_fence(data.fence_fd);
> +	if (!fence)
> +		return -EINVAL;
> +
> +	pt =3D dma_fence_to_sync_pt(fence);
> +	if (!pt)
> +		return -EINVAL;
> +
> +
> +	data.deadline_ns =3D ktime_to_ns(pt->deadline);
> +
> +	dma_fence_put(fence);
> +
> +	if (copy_to_user((void __user *)arg, &data, sizeof(data)))
> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
>  static long sw_sync_ioctl(struct file *file, unsigned int cmd,
>  			  unsigned long arg)
>  {
> @@ -399,6 +454,9 @@ static long sw_sync_ioctl(struct file *file, unsigned=
 int cmd,
>  	case SW_SYNC_IOC_INC:
>  		return sw_sync_ioctl_inc(obj, arg);
> =20
> +	case SW_SYNC_GET_DEADLINE:
> +		return sw_sync_ioctl_get_deadline(obj, arg);
> +
>  	default:
>  		return -ENOTTY;
>  	}
> diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
> index 6176e52ba2d7..2e0146d0bdbb 100644
> --- a/drivers/dma-buf/sync_debug.h
> +++ b/drivers/dma-buf/sync_debug.h
> @@ -55,11 +55,13 @@ static inline struct sync_timeline *dma_fence_parent(=
struct dma_fence *fence)
>   * @base: base fence object
>   * @link: link on the sync timeline's list
>   * @node: node in the sync timeline's tree
> + * @deadline: the most recently set fence deadline
>   */
>  struct sync_pt {
>  	struct dma_fence base;
>  	struct list_head link;
>  	struct rb_node node;
> +	ktime_t deadline;
>  };
> =20
>  extern const struct file_operations sw_sync_debugfs_fops;
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_fil=
e.h
> index 49325cf6749b..dc6645b2598b 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -72,7 +72,11 @@ struct sync_file_info {
>   * @deadline_ns: absolute time of the deadline
>   * @pad:	must be zero
>   *
> - * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank)
> + * The timebase for the deadline is CLOCK_MONOTONIC (same as vblank).  F=
or
> + * example:
> + *
> + *     clock_gettime(CLOCK_MONOTONIC, &t);
> + *     deadline_ns =3D (t.tv_sec * 1000000000L) + t.tv_nsec + duration_ns

Shouldn't this hunk be in patch 5 instead?

What's duration_ns? Maybe ns_until_my_deadline would be more clear that
it is something userspace freely chooses?

>   */
>  struct sync_set_deadline {
>  	__u64	deadline_ns;


Thanks,
pq

--Sig_/8aE4tGFLiLpdo+6qg3s=3bO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP9x/4ACgkQI1/ltBGq
qqcv6hAAkgjLuM8MZAr36UgGjARjMLvWOcq9adsey/FJJhu4S2+Ly3b/hDU9ZAMZ
Ri5QlZusfpYcpMdBK5xKUceapgPL9hmtbLkp2nQ8I70Bs9GL8qxnRDfXZNBSD+dD
8u5bHRVZy0TtmAfx7mTz/9EgQURTaHTmiQIHIwyMquQXFUep7H9EpA3YqlJFvPte
xPMVgQTJ+s/VT0aIkRwf4yGmPoBGTiRYrhJgMfZedP2huV1E3NXuPRRHDDxhIcbH
ODKSi7HOzuF3nmbsENPKL8TEpi7jblkUj3hVnrXdbzKpSfGlcK1PQ36n3X1SwKEJ
zQb5s6Qm3vWjkTYNljTfNDGv/w2DkJDQBYq6VkvkNoYB0IxJAEXVMYj1G1pTLPZy
bwVD3GC+gLdOrs9kAkbodzzRVAjEfer7RqrIQIfiB59MkWAl22zWWue65zU6jBIl
yIHahMl6JiCXSEdgBGeyLqDkba/WBD+hBic4ooI3JODFRH6xmcs2/zeLr2voY28T
lnAiQMh5JkPuuWdtd0w5HpeqzfMEPdWeEBWeScPXE3jX7utXf/aoHqDXvauH9PFl
xgH6JBqt1RX2e3QQ9IDZvZY6SyA7DeCutZJV0uJ24EoKhdFXjZO7pC0HUmblWo8J
vjgIIfjisKX3+B2tVlOMNYHvTzdkdmbWFV9Q8xf2nhwUpvMtakg=
=5sgc
-----END PGP SIGNATURE-----

--Sig_/8aE4tGFLiLpdo+6qg3s=3bO--
