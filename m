Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA05FC651
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 15:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D8510E50E;
	Wed, 12 Oct 2022 13:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9441410E4F7;
 Wed, 12 Oct 2022 13:22:52 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id j23so20491150lji.8;
 Wed, 12 Oct 2022 06:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=T2yWbwyp1iZhigiEFEwd1NXDskoJo/0O2OULkKQ0Smo=;
 b=KJ64tjOEAeQx7EXoQ5KvUhuTOrS41d+QB4da2ijbfi7bzGb815Ym14Z86PmuNvI1aF
 neS5vQne1jm3wcVmMtRihgEOFBAVZVMDVArrshRbpv+kvA/hJUpkiyBhyXeJcy2RmEzn
 6ay8Rnp8bxSapPBGCcn8W6+hpqg9AcG4PLoyEyrMDfFU1BP8/Fk6H0T2EDsTH/uQIEG+
 qJhcgbFer211h+lg7ZdZacEbnmqO2sgNDqghAPe8CvDiZzBfK/wZAWREEL01kIahudG0
 aaqHIvXVRYUIcdQc7MWcwIAVx5lj6uXrnIMecNnyGdfkePjh3v08gS97+34HbNRZKwbS
 HkDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T2yWbwyp1iZhigiEFEwd1NXDskoJo/0O2OULkKQ0Smo=;
 b=D7mOAdIgNdffotvNpTRaO/V+NAtNL7OesBi0YBeX29a2BQerlYJ6lb0dpOuiOlHBDX
 OJV5WqCSxQbzkpiH4Olc78Fvv+xlY6fPMrXp1o4wUvRcO3fnUOiMEJTvicbHd6jcifVW
 Z40kPv7fY/QBQjDfmiKKcelYU/UbcVcWk8yV2CakiTgl978V8LlHobo0xGms6lOdww+b
 poTip+/28uLXE94UEL6GwJAPg9yhRKrrgpE31RXm0p4uEaRXK5jWbRTp9iuFtNHt67iN
 89gX8UoiJPPJQiD7TjpGfhgb2jS31p5U84g5wpwOkvH9jDuVTwqH1UdzJwmNVegyNV38
 3GnA==
X-Gm-Message-State: ACrzQf34SyB/cdfSIqm1uW1EqdDMSGbjYErWWWPpNQ4xvuFMewy7LDfW
 kmfzbNhm5as/nyZGrzW/tAI=
X-Google-Smtp-Source: AMsMyM5w/a+XeTGm/D+jkbk5S10wU+q8PRvhYSsvZgzHhBEuK4XAiuhzjXaPKlt/VzzimGUGurvtJg==
X-Received: by 2002:a2e:86da:0:b0:26e:350a:f80f with SMTP id
 n26-20020a2e86da000000b0026e350af80fmr10856531ljj.299.1665580970665; 
 Wed, 12 Oct 2022 06:22:50 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 o14-20020a056512052e00b0049f9799d349sm2304302lfc.187.2022.10.12.06.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Oct 2022 06:22:49 -0700 (PDT)
Date: Wed, 12 Oct 2022 16:22:38 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/syncobj: add IOCTL to register an eventfd
Message-ID: <20221012162238.6061a754@eldfell>
In-Reply-To: <20221012123241.337774-1-contact@emersion.fr>
References: <20221012123241.337774-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tgiGptE5xFU0.g+i3E29Nud";
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

--Sig_/tgiGptE5xFU0.g+i3E29Nud
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 Oct 2022 12:32:53 +0000
Simon Ser <contact@emersion.fr> wrote:

> Introduce a new DRM_IOCTL_SYNCOBJ_EVENTFD IOCTL which signals an
> eventfd from a syncobj.
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
> v2:
> - Wait for fence when flags is zero
> - Improve documentation (Pekka)
> - Rename IOCTL (Christian)
> - Fix typo in drm_syncobj_add_eventfd() (Christian)
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
>=20
> Toy user-space available at:
> https://paste.sr.ht/~emersion/674bd4fc614570f262b5bb2213be5c77d68944ac
>=20
>  drivers/gpu/drm/drm_internal.h |   2 +
>  drivers/gpu/drm/drm_ioctl.c    |   2 +
>  drivers/gpu/drm/drm_syncobj.c  | 143 +++++++++++++++++++++++++++++++--
>  include/drm/drm_syncobj.h      |   6 +-
>  include/uapi/drm/drm.h         |  22 +++++
>  5 files changed, 168 insertions(+), 7 deletions(-)
>=20

...

> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 642808520d92..5ac0a48b0169 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -909,6 +909,27 @@ struct drm_syncobj_timeline_wait {
>  	__u32 pad;
>  };
> =20
> +/**
> + * struct drm_syncobj_eventfd
> + * @handle: syncobj handle.
> + * @flags: Zero to wait for the point to be signalled, or
> + *         &DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE to wait for a fence to=
 be
> + *         available for the point.
> + * @point: syncobj timeline point (set to zero for binary syncobjs).
> + * @fd: Existing eventfd to sent events to.
> + * @pad: Must be zero.
> + *
> + * Register an eventfd to be signalled by a syncobj. The eventfd counter=
 will
> + * be incremented by one.
> + */
> +struct drm_syncobj_eventfd {
> +	__u32 handle;
> +	__u32 flags;
> +	__u64 point;
> +	__s32 fd;
> +	__u32 pad;
> +};
> +
> =20
>  struct drm_syncobj_array {
>  	__u64 handles;
> @@ -1095,6 +1116,7 @@ extern "C" {
>  #define DRM_IOCTL_SYNCOBJ_QUERY		DRM_IOWR(0xCB, struct drm_syncobj_timel=
ine_array)
>  #define DRM_IOCTL_SYNCOBJ_TRANSFER	DRM_IOWR(0xCC, struct drm_syncobj_tra=
nsfer)
>  #define DRM_IOCTL_SYNCOBJ_TIMELINE_SIGNAL	DRM_IOWR(0xCD, struct drm_sync=
obj_timeline_array)
> +#define DRM_IOCTL_SYNCOBJ_EVENTFD	DRM_IOWR(0xCE, struct drm_syncobj_even=
tfd)
> =20
>  /**
>   * DRM_IOCTL_MODE_GETFB2 - Get framebuffer metadata.

Hi,

UAPI

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

with the disclaimer that I know nothing about syncobjs. The doc sounds
good though, and I read through eventfd man page to see that the
increment makes sense.

I think there is also a way initialize eventfd with 0xffffffffffffffff - N
where N is the number of syncobjs you want to wait, and then poll for
readable. Once the Nth syncobj fires, the eventfd overflows and polls
readable (and produces POLLERR). Maybe that's abuse, and maybe you
usually have no need to poll for all of a set of syncobjs, so fine.

I suspect the Wayland compositor use case wants to know about each
syncobj individually, so either you have one eventfd per syncobj or
poll for "any" in an eventfd with multiple syncobjs and check them all
each time it polls readable.

Seems fine to me.


Thanks,
pq

--Sig_/tgiGptE5xFU0.g+i3E29Nud
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmNGv54ACgkQI1/ltBGq
qqf0RhAAijDbINL88gY3ZUh2fNbDtQ/7QNi333KIFakgw4213ZNUitSMeAHfslCo
SwngVIzXE/JGknsT1kA3rcaZUMenIulnAOcPG7Zigsiw3MyByh1dpkNZn+PN9MPy
2BjDu2Pl7Ml9oRK5oA5s2WbR557QbgZ4zYn3MXdfgE5kNaYUnlRzz+FyCu3gqjhU
5p53DvdiSpGP1w9u/gh2lr6Pgs8UW+RRWsTQM0hD0YhG01yw83LUPy6qgOslLjCG
sHvdfscu4DppQtbWeqsNmAqImRBI3VKubqYH3n7Cql0e6jB+QJ9w3gQ01URZ+DRb
v/E7PyFdr6gWI1xksK3yMSUAjJWpb9Va47pi/huYKrEvI5e5P5sGQYu4JQIiuYso
ULX/zVAc04zJF6NRLByNza0tJg+AbqCc8DJWV2bx3SkQ7zjyHM8QQYVlTrAeJEi8
IQVc/y+BYx8BVUI99zAhInh7gljC9yU5xcZ9Y7PIJN+VB0mbklZ8zyt09DAuDHRx
3HjSqCdZynnWtK7MKvvMGMjhMfO9oFttX57cHf1x6KH4ysXz0YoyRaIyLUsi7ykc
xuYCMGOhGihr9WuH9kQ48Dap9a/6G6/Sxa3IWk9oivUzbL7upZLpm+jfrmmjHzv+
tOlKPQL5iNBTaSTWvCXOMb+ii36NnIwNFNAPVZwWQyyGmCVVpQI=
=Igrc
-----END PGP SIGNATURE-----

--Sig_/tgiGptE5xFU0.g+i3E29Nud--
