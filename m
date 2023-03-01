Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA2F6A6921
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 09:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917D510E20E;
	Wed,  1 Mar 2023 08:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2023910E0A9;
 Wed,  1 Mar 2023 08:52:34 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id i28so3919505lfv.0;
 Wed, 01 Mar 2023 00:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677660752;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=+Sc7R93Vye3mpIiqGm/sTZE1S1mMTzOqecl8VR/6i5w=;
 b=We/+XByQj51OwuMtzo1J8sU3vteGlaLW8DMv18hF0wnUTjhawv5IigTp13f64LUqvH
 +Jg9aAZHhXLu2RlGtRVTLm7ldApSVcJDgS2KcCUeoO1jEIygdgM0BxSLCD/Iuy/y1zmg
 p7hDuc5JeYlOolGffsZhL8ln07YoD79hx6xwKYhr+VYR3qkabLKWeyai66UNZIDRR4KQ
 1NgRz+kjLfoXlBryoEjPFBLD13bmR6W6mGsZFBsu0UsslwquU7R3K3IAE1xBXoJUzAlP
 E+F+Vm/jC7m5DvyEHneBOCO0WAe7R0poYdcbIMSm2qW2GaFjFLl7+zhmfSEE7VIgkwVd
 9WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677660752;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Sc7R93Vye3mpIiqGm/sTZE1S1mMTzOqecl8VR/6i5w=;
 b=5Aioy6StZwETvwI6PNYK7BzXZn8NJ1xO+60YP4dYPYMbmVdMiVeMnqDKt+cC6toa0v
 LKgBr8jO2JvnDIY36X/pI7GhAd+dAqWeuv4S0SvNfLKdra7YoQg/s9pBqTtg+ioX3p3F
 yQQwyWlHBeF3zQMX+z0LC3B67nVrytyn6/KHdhXU2L+XHp4n79T9qTGMil/KjH6GGMNt
 2VGcneD+f9jReQTns7e91LpwZ5mTWzHERnmfDQyM6Fxv8Daai1KFHSTq3etWimjnRfn5
 OWDka2evOqJDKI2N3iuXljIBzNv8OKyCdlnvyKE5pcUJpK3i/vxFEHc/ffoSurm99ft1
 47eQ==
X-Gm-Message-State: AO0yUKVhhT0AXWUvJ4r6fFxZDS+Pc74hb9Jt+yuQsvO6Qk1+CI7y+NcT
 k4r35538UMFywXK0BmGQj0w=
X-Google-Smtp-Source: AK7set+bK3jEXGfKvOjlWIdZkErjWWdTxTgfRBKMCHVlfMK/DQ5iVZ13MyF9tEJf5qVGe5BAKc82cA==
X-Received: by 2002:ac2:5119:0:b0:4d1:7923:3b92 with SMTP id
 q25-20020ac25119000000b004d179233b92mr1637229lfb.50.1677660751960; 
 Wed, 01 Mar 2023 00:52:31 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v21-20020a197415000000b004db250355a2sm1646963lfe.103.2023.03.01.00.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 00:52:31 -0800 (PST)
Date: Wed, 1 Mar 2023 10:52:27 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v8 05/16] dma-buf/sync_file: Surface sync-file uABI
Message-ID: <20230301105227.756021aa@eldfell>
In-Reply-To: <20230228225833.2920879-6-robdclark@gmail.com>
References: <20230228225833.2920879-1-robdclark@gmail.com>
 <20230228225833.2920879-6-robdclark@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pdLdVdi+WgC8j5E+G3oBH8=";
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
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/pdLdVdi+WgC8j5E+G3oBH8=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Feb 2023 14:58:09 -0800
Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>=20
> We had all of the internal driver APIs, but not the all important
> userspace uABI, in the dma-buf doc.  Fix that.  And re-arrange the
> comments slightly as otherwise the comments for the ioctl nr defines
> would not show up.
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  Documentation/driver-api/dma-buf.rst | 10 ++++++--
>  include/uapi/linux/sync_file.h       | 35 +++++++++++-----------------
>  2 files changed, 22 insertions(+), 23 deletions(-)
>=20

Sounds good.
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-=
api/dma-buf.rst
> index 183e480d8cea..ff3f8da296af 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -203,8 +203,8 @@ DMA Fence unwrap
>  .. kernel-doc:: include/linux/dma-fence-unwrap.h
>     :internal:
> =20
> -DMA Fence uABI/Sync File
> -~~~~~~~~~~~~~~~~~~~~~~~~
> +DMA Fence Sync File
> +~~~~~~~~~~~~~~~~~~~
> =20
>  .. kernel-doc:: drivers/dma-buf/sync_file.c
>     :export:
> @@ -212,6 +212,12 @@ DMA Fence uABI/Sync File
>  .. kernel-doc:: include/linux/sync_file.h
>     :internal:
> =20
> +DMA Fence Sync File uABI
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: include/uapi/linux/sync_file.h
> +   :internal:
> +
>  Indefinite DMA Fences
>  ~~~~~~~~~~~~~~~~~~~~~
> =20
> diff --git a/include/uapi/linux/sync_file.h b/include/uapi/linux/sync_fil=
e.h
> index ee2dcfb3d660..eced40c204d7 100644
> --- a/include/uapi/linux/sync_file.h
> +++ b/include/uapi/linux/sync_file.h
> @@ -16,12 +16,16 @@
>  #include <linux/types.h>
> =20
>  /**
> - * struct sync_merge_data - data passed to merge ioctl
> + * struct sync_merge_data - SYNC_IOC_MERGE: merge two fences
>   * @name:	name of new fence
>   * @fd2:	file descriptor of second fence
>   * @fence:	returns the fd of the new fence to userspace
>   * @flags:	merge_data flags
>   * @pad:	padding for 64-bit alignment, should always be zero
> + *
> + * Creates a new fence containing copies of the sync_pts in both
> + * the calling fd and sync_merge_data.fd2.  Returns the new fence's
> + * fd in sync_merge_data.fence
>   */
>  struct sync_merge_data {
>  	char	name[32];
> @@ -34,8 +38,8 @@ struct sync_merge_data {
>  /**
>   * struct sync_fence_info - detailed fence information
>   * @obj_name:		name of parent sync_timeline
> -* @driver_name:	name of driver implementing the parent
> -* @status:		status of the fence 0:active 1:signaled <0:error
> + * @driver_name:	name of driver implementing the parent
> + * @status:		status of the fence 0:active 1:signaled <0:error
>   * @flags:		fence_info flags
>   * @timestamp_ns:	timestamp of status change in nanoseconds
>   */
> @@ -48,14 +52,19 @@ struct sync_fence_info {
>  };
> =20
>  /**
> - * struct sync_file_info - data returned from fence info ioctl
> + * struct sync_file_info - SYNC_IOC_FILE_INFO: get detailed information =
on a sync_file
>   * @name:	name of fence
>   * @status:	status of fence. 1: signaled 0:active <0:error
>   * @flags:	sync_file_info flags
>   * @num_fences	number of fences in the sync_file
>   * @pad:	padding for 64-bit alignment, should always be zero
> - * @sync_fence_info: pointer to array of structs sync_fence_info with all
> + * @sync_fence_info: pointer to array of struct &sync_fence_info with all
>   *		 fences in the sync_file
> + *
> + * Takes a struct sync_file_info. If num_fences is 0, the field is updat=
ed
> + * with the actual number of fences. If num_fences is > 0, the system wi=
ll
> + * use the pointer provided on sync_fence_info to return up to num_fence=
s of
> + * struct sync_fence_info, with detailed fence information.
>   */
>  struct sync_file_info {
>  	char	name[32];
> @@ -76,23 +85,7 @@ struct sync_file_info {
>   * no upstream users available.
>   */
> =20
> -/**
> - * DOC: SYNC_IOC_MERGE - merge two fences
> - *
> - * Takes a struct sync_merge_data.  Creates a new fence containing copie=
s of
> - * the sync_pts in both the calling fd and sync_merge_data.fd2.  Returns=
 the
> - * new fence's fd in sync_merge_data.fence
> - */
>  #define SYNC_IOC_MERGE		_IOWR(SYNC_IOC_MAGIC, 3, struct sync_merge_data)
> -
> -/**
> - * DOC: SYNC_IOC_FILE_INFO - get detailed information on a sync_file
> - *
> - * Takes a struct sync_file_info. If num_fences is 0, the field is updat=
ed
> - * with the actual number of fences. If num_fences is > 0, the system wi=
ll
> - * use the pointer provided on sync_fence_info to return up to num_fence=
s of
> - * struct sync_fence_info, with detailed fence information.
> - */
>  #define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_inf=
o)
> =20
>  #endif /* _UAPI_LINUX_SYNC_H */


--Sig_/pdLdVdi+WgC8j5E+G3oBH8=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP/EkwACgkQI1/ltBGq
qqdUKA/+I1j5vdvPjYXQZQ+DoS7zE1P9c4jnXG17sSyBGZkPwmZW+P7ULtei9h2q
nfjeWQgVfNHSB2e4rQps+6fXx5LvdwDIiEpDyP+2xPcLmbfLx2452cS+UtzeqZIi
cm6eTBFQK3YcG1+D0NFbjPiKbpk7i99FprWwO/XREi02BRKpcSSGzT4wZyysBMSu
Ok+GmJdeMnWAzLi7p9DepoG0TKjnzi8e45ovFdieHym0MSstzeLsHe1dokYHfOjv
kOkQCHEzwlWfeZKUnuNXd2VCU3VPmfpst0AAiTgdqz3QWui900Q0S0kdVI/xEqEW
6tekiPHlA+PYf5n6PCc7hpxqiLWB6pr7EadS5fwbjFJaF2gWByGz2q3slURt0Xnf
NAiH7fHsbxBzSkM4KSJrD2kng8iSX3DWYo/L0DesmjhX/RX/nXRpVX7c5uHgQSNY
1sl90g0JRM86o+DU6OUPGO07ZKBe1MlJmsKVcxNnVU+d5YqrDroGsw/ocJlT7zZO
c7QyqIh8qp/Oy8bWWuOgrG2CyEjwiFaB2t0wVnJhnG2BnOrWfF+rpBdU/+SB4AaH
bzy+bvdKaxIJvzUW4GYSu+rO0icdj+VnsGW8/8Ho0aFNYQRS9aq/EDGpBX4CKZ7t
rnzbVZFqzpkat+L+u8tLQkG8LGK9iE63ZS5mg4MfpAlugoDzb6I=
=yVJf
-----END PGP SIGNATURE-----

--Sig_/pdLdVdi+WgC8j5E+G3oBH8=--
