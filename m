Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6F65F9ADC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 10:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D5D10E45E;
	Mon, 10 Oct 2022 08:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B60D10E45E;
 Mon, 10 Oct 2022 08:19:39 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id q7so9910833ljp.3;
 Mon, 10 Oct 2022 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=I7v62s0tHV0kqa2FitvPMR54Nq/Z11yQVA+Wcx+cd0E=;
 b=JUqavGJR51tPHny6+NaA1CBU0ntpqclouIJ6sEEmeJrmivsedgMh8GN8bTWaVhJj1A
 yDBP6hhQ+illg1bv1/6MI4WTRgmY5P7twh1rE9Olse2sf4XO9ESFDKBQ03VHy+iQ5AGO
 4rulxXW0sF6Nz7MQAUFrf9RL2VvE9jxF8vPdKUtqa8xx+Z6kbIRkzpWgxiA2QpIy6dE4
 xo9SWvZusi4tXpSz3STfVt72sS2YLZIOeZ6ByTL9dSOaslNeD2g13YJknSE1KgVcrLvy
 j6NR88VZjVUhBbbADFp3WUQEglfvWt4JJwkzCl4SAsfT7ZOYX1jq90HOWPUYmvdn1mSZ
 zV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I7v62s0tHV0kqa2FitvPMR54Nq/Z11yQVA+Wcx+cd0E=;
 b=jx1ANirh9dgX4v12/Ae7fb4o1/24RK3qVVEc5WeFJaf3JjBO/RbLz/7qBq+LWJwEb6
 RkPFsc/+BKH14fb2mvs+LMfOnh5HOVOU4Vzc8G6GWKZM9F/paMkBlJIuaNAR3Qfm11xe
 WjCr/QM08KtMLxIH9K2OwKhrzN7yQzYuSa3rSbLbAv2s5gklwkfQWw8ef4bEBABy2la6
 vi+EnCaWkVKllkGTGBzW/dAPhivg8GabbrPWFSlN4NWGbRlO317mzw25SQXpYXvhCvrT
 5aH1twsgWJvo2dWn5ztNHzEo6JhQ2Wnk4OwyPLxkdBNwrJoOtHpNKdzmLoubfVjFLtwH
 tnDg==
X-Gm-Message-State: ACrzQf1tXfuzdTiO7E5RiKY8WQqejD8TiR19rrI8kzAoi4MfxCq0n1b0
 RKsRQ7uu0ecSL8uEhPWmLQE=
X-Google-Smtp-Source: AMsMyM5SkyaQoAN0dhC+lUw/M4RUAUVBN5jpyX+JJIUTJjbKA9oArrexEuT3pso0e24BrpVW6s7gJw==
X-Received: by 2002:a05:651c:1504:b0:26c:6331:3463 with SMTP id
 e4-20020a05651c150400b0026c63313463mr6653833ljf.30.1665389977373; 
 Mon, 10 Oct 2022 01:19:37 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 x17-20020a056512047100b0049496608d58sm1318250lfd.155.2022.10.10.01.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 01:19:37 -0700 (PDT)
Date: Mon, 10 Oct 2022 11:19:34 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [RFC PATCH] drm/syncobj: add IOCTL to register an eventfd for a
 timeline
Message-ID: <20221010111934.1e1d84ac@eldfell>
In-Reply-To: <20221009144001.161124-1-contact@emersion.fr>
References: <20221009144001.161124-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KJJW/2Q6hKj/DYwK5ZfxP2Q";
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, James Jones <jajones@nvidia.com>,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/KJJW/2Q6hKj/DYwK5ZfxP2Q
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 09 Oct 2022 14:40:14 +0000
Simon Ser <contact@emersion.fr> wrote:

> Introduce a new DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD IOCTL
> which signals an eventfd when a timeline point completes.
>=20
> This is useful for Wayland compositors to handle wait-before-submit.
> Wayland clients can send a timeline point to the compositor
> before the point has materialized yet, then compositors can wait
> for the point to materialize via this new IOCTL.
>=20
> The existing DRM_IOCTL_SYNCOBJ_TIMELINE_WAIT IOCTL is not suitable
> because it blocks. Compositors want to integrate the wait with
> their poll(2)-based event loop.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: James Jones <jajones@nvidia.com>
> ---
>  drivers/gpu/drm/drm_internal.h |   3 +
>  drivers/gpu/drm/drm_ioctl.c    |   3 +
>  drivers/gpu/drm/drm_syncobj.c  | 113 +++++++++++++++++++++++++++++++--
>  include/drm/drm_syncobj.h      |   6 +-
>  include/uapi/drm/drm.h         |  15 +++++
>  5 files changed, 133 insertions(+), 7 deletions(-)

...

> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 642808520d92..359e21414196 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -909,6 +909,20 @@ struct drm_syncobj_timeline_wait {
>  	__u32 pad;
>  };
> =20

Hi,

I'm completely clueless about this API.

> +/**
> + * struct drm_syncobj_timeline_register_eventfd
> + *
> + * Register an eventfd to be signalled when a timeline point completes. =
The
> + * eventfd counter will be incremented by one.

Sounds nice.

Since the action is to increment the counter by one, does it mean it
will be possible to wait for a bunch of completions and have the
eventfd poll return only when they have all signaled?

> + */
> +struct drm_syncobj_timeline_register_eventfd {
> +	__u32 handle;

Handle of what?

> +	__u32 flags;

What flags are allowed? Must be zero for now?

> +	__u64 point;

Is this some Vulkan thingy?

> +	__s32 fd;

I guess the userspace needs to create an eventfd first, and pass it as
the argument here? This is not creating a new eventfd itself?

> +	__u32 pad;

Must be zero?


Thanks,
pq

> +};
> +
> =20
>  struct drm_syncobj_array {
>  	__u64 handles;
> @@ -1095,6 +1109,7 @@ extern "C" {
>  #define DRM_IOCTL_SYNCOBJ_QUERY		DRM_IOWR(0xCB, struct drm_syncobj_timel=
ine_array)
>  #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_tra=
nsfer)
>  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_sync=
obj_timeline_array)
> +#define DRM_IOCTL_SYNCOBJ_TIMELINE_REGISTER_EVENTFD	DRM_IOWR(0xCE, struc=
t drm_syncobj_timeline_register_eventfd)
> =20
>  /**
>   * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.


--Sig_/KJJW/2Q6hKj/DYwK5ZfxP2Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmND1ZYACgkQI1/ltBGq
qqc/Vw//dO05Xqq4ZYZG1BPfH1+1V7JZk/UzAHpK0CmTmDDZbRJJA19gE3jJhmeV
MgouxAN7KnDebR1pzCPOCvSJNY41/aZcPTjlUDnUfXMrd1O8Ii6LJrCaUoVPHjJ/
1bKA0cdv+B0I00jiUP2kj8HPPB4sduuXVrp0CS90BjJZ3oTD7YKuNh4a4/uVG3S9
H6FwasjzPiKjLHK7HwuQESo+HwYZ0Sl1TgaKT8HxcD9QekzTA5lUsqGQuZnnH1Aw
xuktp3Za23cj5pjqXkSLHoOO26BWsqBLLKiQPqBWeNfVizyykZ2VxgPj6DsbeVNv
NOu4ikPBA9PxjKiNfxh5ZB++K+uJrYsSa7+7se0n+JGFe7EXnm0Oh6RXl5BF8QVk
IwjSJQEUdtKmrgOjY+0TP7mUrDrmGEzKKUh+j3BDyKdTVi3YS8BkKu+KowBgbNnC
dOCBBALUP1kAG9DeSerdvn3j28YBBIT0ezGjxuaiOEXcmIT9dmpjyrITXwPQYxRt
m9FKh0jgGq/93sebaEWYSmAbH/QEHQDGrdKS/6s1pR5D+dwSMHabJg9hdYETLwxQ
wtNTtwOn/B6AiMf0wvqJ1o0zuChYk82+YUAbkJjcTLcBUd2SkqL/qLc1WiZ3GjrQ
KjwTGxDt2lhOs4hurQ8azLT4YAMZ6oBuZLxV6gA5ogl9TOR0cVY=
=IgOZ
-----END PGP SIGNATURE-----

--Sig_/KJJW/2Q6hKj/DYwK5ZfxP2Q--
