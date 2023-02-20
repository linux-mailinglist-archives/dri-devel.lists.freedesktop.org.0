Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7AD69C750
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 10:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E8210E624;
	Mon, 20 Feb 2023 09:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5D210E623;
 Mon, 20 Feb 2023 09:05:59 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x24so923524lfr.1;
 Mon, 20 Feb 2023 01:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=91aTdz1Aogqeher/EAKcddfL7wOgCqquWNNbDgH7YwY=;
 b=VVz0rN9nlQgr75YmcUQO3k+1zBiZEHXx2HuAGOJrfJ23ccZ3Y02UeGmf4Ni9jx2t4p
 tbtHhtMXX3G2+p5OvXr4cpuTbsMvwNdB3sOoQNwrUC4Z1s9MXZjLjutYNs/yMIr0SPLl
 fzBZfLfE0Wx+ZS+ghTQLaCWhuPUNCicRj4tBsSXfxFvCeyVypkFgZTA2Vehm6gRGu1d8
 9ZRX2Cn8KudhmbylakOG0N6fl0h/UGbrPSH57xTYUBjznY6GK3k8zSypSIDX7PfNKp/b
 vyfHV5SLoBRPUIqYEW2uddX8xUeYYuCqbfhaQa3cSNtgakofpSM7X3VcHs41N8+dF6Ce
 YiKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=91aTdz1Aogqeher/EAKcddfL7wOgCqquWNNbDgH7YwY=;
 b=xSfGTxDc4CrzzvmsaNYkm9ZSdGLlVOF5+R67NKqfax5F/LjBtIsakSNX3KU9nDM1fI
 fnycStZ7WYApwnbJdxM3FrXuMP7My6L3K7yN3UB3DOeWnVewLvxI+nZxURgomfg5sADp
 Uf4zRbGcXaoJoIUJXjoav4x7bzYdPgc1aWs4m5QLSlKJqTEVUVL25LJ7aM1gZ4eP/ShE
 UZqIChrbfqJw0KUy/RhMBftl6whaCxiownkptUxsSKRFMIsDRe/+WsDvQg+qWVyOFBUK
 FHmddBqF1xKu8lTTQ7jWDvFChU5tOvw72Cj/zME6em8oZJrWM80MjfLvtwmLh188sdLv
 28WA==
X-Gm-Message-State: AO0yUKV5PAwq1DOAsPotZP3kjCmGmN+3VdwIgqUmnwpA0wZ7jKdFrNBR
 ZwqTsW1/rPIy4iZVkDBoTfc=
X-Google-Smtp-Source: AK7set/mFnepBkg+YWiJJuw4i9/rn6t5jRDMo4peG+3SEN+gGWobrmLITRptS3fGDNzp8iFIYkXULw==
X-Received: by 2002:ac2:4465:0:b0:4aa:e120:b431 with SMTP id
 y5-20020ac24465000000b004aae120b431mr473824lfl.38.1676883957311; 
 Mon, 20 Feb 2023 01:05:57 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u6-20020ac243c6000000b004db3900da02sm271259lfl.73.2023.02.20.01.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 01:05:56 -0800 (PST)
Date: Mon, 20 Feb 2023 11:05:53 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 09/14] drm/syncobj: Add deadline support for syncobj
 waits
Message-ID: <20230220110553.47ecd504@eldfell>
In-Reply-To: <20230218211608.1630586-10-robdclark@gmail.com>
References: <20230218211608.1630586-1-robdclark@gmail.com>
 <20230218211608.1630586-10-robdclark@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wm570xKYRZuqxUZ+wire3zk";
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/wm570xKYRZuqxUZ+wire3zk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 18 Feb 2023 13:15:52 -0800
Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>=20
> Add a new flag to let userspace provide a deadline as a hint for syncobj
> and timeline waits.  This gives a hint to the driver signaling the
> backing fences about how soon userspace needs it to compete work, so it
> can addjust GPU frequency accordingly.  An immediate deadline can be
> given to provide something equivalent to i915 "wait boost".
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>=20
> I'm a bit on the fence about the addition of the DRM_CAP, but it seems
> useful to give userspace a way to probe whether the kernel and driver
> supports the new wait flag, especially since we have vk-common code
> dealing with syncobjs.  But open to suggestions.
>=20
>  drivers/gpu/drm/drm_ioctl.c   |  3 ++
>  drivers/gpu/drm/drm_syncobj.c | 59 ++++++++++++++++++++++++++++-------
>  include/drm/drm_drv.h         |  6 ++++
>  include/uapi/drm/drm.h        | 16 ++++++++--
>  4 files changed, 71 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 7c9d66ee917d..1c5c942cf0f9 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -254,6 +254,9 @@ static int drm_getcap(struct drm_device *dev, void *d=
ata, struct drm_file *file_
>  	case DRM_CAP_SYNCOBJ_TIMELINE:
>  		req->value =3D drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE);
>  		return 0;
> +	case DRM_CAP_SYNCOBJ_DEADLINE:
> +		req->value =3D drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE);

Hi,

is that a typo for DRIVER_SYNCOBJ_DEADLINE?

> +		return 0;
>  	}
> =20
>  	/* Other caps only work with KMS drivers */
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 0c2be8360525..61cf97972a60 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -973,7 +973,8 @@ static signed long drm_syncobj_array_wait_timeout(str=
uct drm_syncobj **syncobjs,
>  						  uint32_t count,
>  						  uint32_t flags,
>  						  signed long timeout,
> -						  uint32_t *idx)
> +						  uint32_t *idx,
> +						  ktime_t *deadline)
>  {
>  	struct syncobj_wait_entry *entries;
>  	struct dma_fence *fence;
> @@ -1053,6 +1054,15 @@ static signed long drm_syncobj_array_wait_timeout(=
struct drm_syncobj **syncobjs,
>  			drm_syncobj_fence_add_wait(syncobjs[i], &entries[i]);
>  	}
> =20
> +	if (deadline) {
> +		for (i =3D 0; i < count; ++i) {
> +			fence =3D entries[i].fence;
> +			if (!fence)
> +				continue;
> +			dma_fence_set_deadline(fence, *deadline);
> +		}
> +	}
> +
>  	do {
>  		set_current_state(TASK_INTERRUPTIBLE);
> =20
> @@ -1151,7 +1161,8 @@ static int drm_syncobj_array_wait(struct drm_device=
 *dev,
>  				  struct drm_file *file_private,
>  				  struct drm_syncobj_wait *wait,
>  				  struct drm_syncobj_timeline_wait *timeline_wait,
> -				  struct drm_syncobj **syncobjs, bool timeline)
> +				  struct drm_syncobj **syncobjs, bool timeline,
> +				  ktime_t *deadline)
>  {
>  	signed long timeout =3D 0;
>  	uint32_t first =3D ~0;
> @@ -1162,7 +1173,8 @@ static int drm_syncobj_array_wait(struct drm_device=
 *dev,
>  							 NULL,
>  							 wait->count_handles,
>  							 wait->flags,
> -							 timeout, &first);
> +							 timeout, &first,
> +							 deadline);
>  		if (timeout < 0)
>  			return timeout;
>  		wait->first_signaled =3D first;
> @@ -1172,7 +1184,8 @@ static int drm_syncobj_array_wait(struct drm_device=
 *dev,
>  							 u64_to_user_ptr(timeline_wait->points),
>  							 timeline_wait->count_handles,
>  							 timeline_wait->flags,
> -							 timeout, &first);
> +							 timeout, &first,
> +							 deadline);
>  		if (timeout < 0)
>  			return timeout;
>  		timeline_wait->first_signaled =3D first;
> @@ -1243,13 +1256,20 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, vo=
id *data,
>  {
>  	struct drm_syncobj_wait *args =3D data;
>  	struct drm_syncobj **syncobjs;
> +	unsigned possible_flags;
> +	ktime_t t, *tp =3D NULL;
>  	int ret =3D 0;
> =20
>  	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>  		return -EOPNOTSUPP;
> =20
> -	if (args->flags & ~(DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> -			    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT))
> +	possible_flags =3D DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT;
> +
> +	if (drm_core_check_feature(dev, DRIVER_SYNCOBJ_DEADLINE))
> +		possible_flags |=3D DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
> +
> +	if (args->flags & ~possible_flags)
>  		return -EINVAL;
> =20
>  	if (args->count_handles =3D=3D 0)
> @@ -1262,8 +1282,13 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, voi=
d *data,
>  	if (ret < 0)
>  		return ret;
> =20
> +	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
> +		t =3D ktime_set(args->deadline_sec, args->deadline_nsec);
> +		tp =3D &t;
> +	}
> +
>  	ret =3D drm_syncobj_array_wait(dev, file_private,
> -				     args, NULL, syncobjs, false);
> +				     args, NULL, syncobjs, false, tp);
> =20
>  	drm_syncobj_array_free(syncobjs, args->count_handles);
> =20
> @@ -1276,14 +1301,21 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device=
 *dev, void *data,
>  {
>  	struct drm_syncobj_timeline_wait *args =3D data;
>  	struct drm_syncobj **syncobjs;
> +	unsigned possible_flags;
> +	ktime_t t, *tp =3D NULL;
>  	int ret =3D 0;
> =20
>  	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>  		return -EOPNOTSUPP;
> =20
> -	if (args->flags & ~(DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> -			    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> -			    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE))
> +	possible_flags =3D DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT |
> +			 DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE;
> +
> +	if (drm_core_check_feature(dev, DRIVER_SYNCOBJ_DEADLINE))
> +		possible_flags |=3D DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE;
> +
> +	if (args->flags & ~possible_flags)
>  		return -EINVAL;
> =20
>  	if (args->count_handles =3D=3D 0)
> @@ -1296,8 +1328,13 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device =
*dev, void *data,
>  	if (ret < 0)
>  		return ret;
> =20
> +	if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
> +		t =3D ktime_set(args->deadline_sec, args->deadline_nsec);
> +		tp =3D &t;
> +	}
> +
>  	ret =3D drm_syncobj_array_wait(dev, file_private,
> -				     NULL, args, syncobjs, true);
> +				     NULL, args, syncobjs, true, tp);
> =20
>  	drm_syncobj_array_free(syncobjs, args->count_handles);
> =20
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 1d76d0686b03..9aa24f097e22 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -104,6 +104,12 @@ enum drm_driver_feature {
>  	 * acceleration should be handled by two drivers that are connected usi=
ng auxiliary bus.
>  	 */
>  	DRIVER_COMPUTE_ACCEL            =3D BIT(7),
> +	/**
> +	 * @DRIVER_SYNCOBJ_DEADLINE:
> +	 *
> +	 * Driver supports &dma_fence_ops.set_deadline
> +	 */
> +	DRIVER_SYNCOBJ_DEADLINE         =3D BIT(8),
> =20
>  	/* IMPORTANT: Below are all the legacy flags, add new ones above. */
> =20
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 642808520d92..c6b85bb13810 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -767,6 +767,13 @@ struct drm_gem_open {
>   * Documentation/gpu/drm-mm.rst, section "DRM Sync Objects".
>   */
>  #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
> +/**
> + * DRM_CAP_SYNCOBJ_DEADLINE
> + *
> + * If set to 1, the driver supports DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE=
 flag
> + * on the SYNCOBJ_TIMELINE_WAIT/SYNCOBJ_WAIT ioctls.
> + */
> +#define DRM_CAP_SYNCOBJ_DEADLINE	0x15
> =20
>  /* DRM_IOCTL_GET_CAP ioctl argument type */
>  struct drm_get_cap {
> @@ -887,6 +894,7 @@ struct drm_syncobj_transfer {
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL (1 << 0)
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT (1 << 1)
>  #define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (1 << 2) /* wait for time =
point to become available */
> +#define DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE (1 << 3) /* set fence deadl=
ine based to deadline_nsec/sec */

Where was the UAPI documentation explaining what a fence deadline is
and what it does, again?

>  struct drm_syncobj_wait {
>  	__u64 handles;
>  	/* absolute timeout */
> @@ -894,7 +902,9 @@ struct drm_syncobj_wait {
>  	__u32 count_handles;
>  	__u32 flags;
>  	__u32 first_signaled; /* only valid when not waiting all */
> -	__u32 pad;
> +	/* Deadline to set on backing fence(s) in CLOCK_MONOTONIC: */
> +	__u32 deadline_nsec;
> +	__u64 deadline_sec;
>  };
> =20
>  struct drm_syncobj_timeline_wait {
> @@ -906,7 +916,9 @@ struct drm_syncobj_timeline_wait {
>  	__u32 count_handles;
>  	__u32 flags;
>  	__u32 first_signaled; /* only valid when not waiting all */
> -	__u32 pad;
> +	/* Deadline to set on backing fence(s) in CLOCK_MONOTONIC: */
> +	__u32 deadline_nsec;
> +	__u64 deadline_sec;
>  };

It seems inconsistent that these sec,nsec are here unsigned, when in
other places they are signed. There is also the question if these need
to meet clock_settime() requirements of valid values.


Thanks,
pq

--Sig_/wm570xKYRZuqxUZ+wire3zk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPzN/EACgkQI1/ltBGq
qqd2SBAAkSxyGD4KzyhJzz6AyxSF3XmPih/HhR60so/PxdDlsemRsqvSQpfHXVK8
jM2MTtcOTZdd7QHyPOlPaOkY53HJPo6zEgUiP+AIzioud1kSjVf31uyXtufyuLKi
pKBrUqVtwGnSCNegWuIYl3A8cjdpz2b+8/pbOFub+RkT/Sk947wth/gtIfaMldGR
TC7EsOAvcLsf0pMSiAa44ifymtOIQpCgxmqtfOVPGGsD33Z7rb4hNnGwcaKCeVrf
9ZtqU1Irgsg8xLKsg95WCzTh+gvxwyrPqRpZDnnDHX34mTnmMRQrMpQpUkOvLHxX
e5yu3DS2krWRl4EqehKD+jN1Y/E25kki1vOeTEvGYu0XzPlGqaI2Y7xLrEl1BTb3
4/jtglp7iGvCwjWJ+sIobyepl9I0R2dtJ3ILMlH8TnD4xVdRifxflvlA/B4/VhpX
85+aBfU1+ajlDgBKp0r0m08qE5Tax21aJrmJb+NvOdn43qg0TeNmlHkcjZSKWJUu
QkVwC16qiQlET7mVt5aPOuUQICDVPS/DPTfr43u2uAXYxB/EseQ9eESCoLXXvDnu
ykXEqKcBYR2UuttFZvAEAMPzixP1SeKuO/262iOeV8iXg++h0DV1LbIBkxVXOhCJ
LdU8LSJko6MgK6beZxaY6Jm7rtSUhG7o94KCENDVff4J86ZdIf8=
=yfSf
-----END PGP SIGNATURE-----

--Sig_/wm570xKYRZuqxUZ+wire3zk--
