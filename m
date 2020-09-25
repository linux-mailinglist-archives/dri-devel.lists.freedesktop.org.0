Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F32782BE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 10:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DD76EC52;
	Fri, 25 Sep 2020 08:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828066EC4F;
 Fri, 25 Sep 2020 08:27:56 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y11so1869007lfl.5;
 Fri, 25 Sep 2020 01:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=z+zAXX/avZwGf8U2LJb+JjlSIUZT4FcxQjuWAkVJlC0=;
 b=DOYr8ogRiTvzUkZ0PRUjmpfRucK8YLfhdQf2/vZXw94t6MFY0SsctO5defPSf0dqIc
 +7CEwf8vjDWCr0gRaCHZ7qVHUGSNvlbc41vBH8BNMO5XtlA6ThoaOJrEG0Zbcpr++3Iz
 r1wGOT5tLoMwyu5rserhuGNh7oqHPJQF0Rc8KXBoE8UV1s3UppI69zJYjFtXekaPA0Qm
 MMWmivvlDlMCkBq+bbMmKZmLIKjg3WglLCZ18BIj6xsfda4iQM2hS9UXTLN3YYVGpLcS
 GLIu6diOJuE5M4fWYmJSYUYKB7rY5ZucQYgg7EvKK5O7q51gbLeg0f9++gwzEtUpc7Ku
 FO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=z+zAXX/avZwGf8U2LJb+JjlSIUZT4FcxQjuWAkVJlC0=;
 b=Qvn/6wPuWrnEX7Hxw39+PUgIzGbE9uDwiGx7zHMQS25kc6S8YIpjjcRBQsVXqCUfHC
 gRTcPEXX57L8D5x4z9uwurqnABw7DjOOtmTw82RUN8W9PrcTjK2wcXweYwXRgCwjALCg
 RoCUqBz80YH68Lvflcoon2MTdRHHz+EEgqracjXUldZuVzspGl4NhhCyjpzjg0H80/1f
 iIkcH28j0g0NftXBMg44ej5lcQmXbZDyk1R/nTUfSoeqipD6tyw+3dgWrvO5ONiG6Ix8
 HEq5qgK2dSGtVEGadGnYrxGJHlnubM0tVBQ4k1oe/DARgLvbAjczjmarVpMXnd/ckXx4
 YjsQ==
X-Gm-Message-State: AOAM531v+L51zqqXhMhv6zlRL0bax9mXqWp2+BHHZpKF5kbRuCOdeLBv
 3vu0sIX9OAppaoY1SaK8IXM=
X-Google-Smtp-Source: ABdhPJxJ016NxEJhFqn97YUKqLmOwGEuGzBOELxPI7yMM03IKIXb1h2QS8u6g2vS24ZIe8g1FB+MrA==
X-Received: by 2002:a19:3847:: with SMTP id d7mr907067lfj.507.1601022474883;
 Fri, 25 Sep 2020 01:27:54 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id 195sm1702941lfh.250.2020.09.25.01.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 01:27:54 -0700 (PDT)
Date: Fri, 25 Sep 2020 11:27:50 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/atomic: debug output for EBUSY
Message-ID: <20200925112750.130f25a6@eldfell>
In-Reply-To: <20200923105737.2943649-2-daniel.vetter@ffwll.ch>
References: <20200923105737.2943649-1-daniel.vetter@ffwll.ch>
 <20200923105737.2943649-2-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0197919482=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0197919482==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/r_8Ij2soxv+jfO+J_P2.Z6a"; protocol="application/pgp-signature"

--Sig_/r_8Ij2soxv+jfO+J_P2.Z6a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Sep 2020 12:57:37 +0200
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Hopefully we'll have the drm crash recorder RSN, but meanwhile
> compositors would like to know a bit better why they get an EBUSY.
>=20

These debug messages will be especially useful with the flight
recorder, but also without. :-)

...

> ---
>  drivers/gpu/drm/drm_atomic.c        |  4 ++--
>  drivers/gpu/drm/drm_atomic_helper.c | 20 +++++++++++++++++---
>  2 files changed, 19 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index e22669b64521..6864e520269d 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1272,7 +1272,7 @@ int drm_atomic_check_only(struct drm_atomic_state *=
state)
> =20
>  	DRM_DEBUG_ATOMIC("checking %p\n", state);
> =20
> -	for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
>  		requested_crtc |=3D drm_crtc_mask(crtc);
> =20
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane=
_state, i) {
> @@ -1322,7 +1322,7 @@ int drm_atomic_check_only(struct drm_atomic_state *=
state)
>  		}
>  	}
> =20
> -	for_each_new_crtc_in_state(state, crtc, old_crtc_state, i)
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
>  		affected_crtc |=3D drm_crtc_mask(crtc);

Oops, these belong in the previous patch?

> =20
>  	/*
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index e8abaaaa7fd1..6b3bfabac26c 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1740,8 +1740,11 @@ int drm_atomic_helper_async_check(struct drm_devic=
e *dev,
>  	 * overridden by a previous synchronous update's state.
>  	 */
>  	if (old_plane_state->commit &&
> -	    !try_wait_for_completion(&old_plane_state->commit->hw_done))
> +	    !try_wait_for_completion(&old_plane_state->commit->hw_done)) {
> +		DRM_DEBUG_ATOMIC("[PLANE:%d:%s] inflight previous commit preventing as=
ync commit\n",
> +			plane->base.id, plane->name);
>  		return -EBUSY;
> +	}
> =20
>  	return funcs->atomic_async_check(plane, new_plane_state);
>  }
> @@ -1964,6 +1967,9 @@ static int stall_checks(struct drm_crtc *crtc, bool=
 nonblock)
>  			 * commit with nonblocking ones. */
>  			if (!completed && nonblock) {
>  				spin_unlock(&crtc->commit_lock);
> +				DRM_DEBUG_ATOMIC("[CRTC:%d:%s] busy with a previous commit\n",
> +					crtc->base.id, crtc->name);
> +
>  				return -EBUSY;
>  			}
>  		} else if (i =3D=3D 1) {
> @@ -2132,8 +2138,12 @@ int drm_atomic_helper_setup_commit(struct drm_atom=
ic_state *state,
>  		/* Userspace is not allowed to get ahead of the previous
>  		 * commit with nonblocking ones. */
>  		if (nonblock && old_conn_state->commit &&
> -		    !try_wait_for_completion(&old_conn_state->commit->flip_done))
> +		    !try_wait_for_completion(&old_conn_state->commit->flip_done)) {
> +			DRM_DEBUG_ATOMIC("[CONNECTOR:%d:%s] busy with a previous commit\n",
> +				conn->base.id, conn->name);
> +
>  			return -EBUSY;
> +		}
> =20
>  		/* Always track connectors explicitly for e.g. link retraining. */
>  		commit =3D crtc_or_fake_commit(state, new_conn_state->crtc ?: old_conn=
_state->crtc);
> @@ -2147,8 +2157,12 @@ int drm_atomic_helper_setup_commit(struct drm_atom=
ic_state *state,
>  		/* Userspace is not allowed to get ahead of the previous
>  		 * commit with nonblocking ones. */
>  		if (nonblock && old_plane_state->commit &&
> -		    !try_wait_for_completion(&old_plane_state->commit->flip_done))
> +		    !try_wait_for_completion(&old_plane_state->commit->flip_done)) {
> +			DRM_DEBUG_ATOMIC("[PLANE:%d:%s] busy with a previous commit\n",
> +				plane->base.id, plane->name);
> +
>  			return -EBUSY;
> +		}
> =20
>  		/* Always track planes explicitly for async pageflip support. */
>  		commit =3D crtc_or_fake_commit(state, new_plane_state->crtc ?: old_pla=
ne_state->crtc);

The new debug messages sound good to me.


Thanks,
pq

--Sig_/r_8Ij2soxv+jfO+J_P2.Z6a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl9tqgYACgkQI1/ltBGq
qqeTfQ//Z40KaNK9Xw6jnqenDYKQ1VRjR0S282/gKnOshFfqnQz+m/13DBO6zz7l
/UcZfPmbBD5WwlIbBnH0mRxWjYxAoh97nVrV9jRaFtHxAHUgGDdXrYL7NLMDx/fw
aJegJcM89y1bjPsDtJNGslqSHu+0AnyWek6r3RkXQnBeM19HTqBjYnk/h53/ODq1
fRnNKXW3JG4al4tXk0hoz4rsXrgYZZwXubnbkGiMloz4qr1YznE38g++KyfxodBz
YdlpOkcLoVOzwohJnSjVEhf2UfJeeTlaqe8tMPaSdSlX5Tn3iqNCJci8zM6Yd3rw
fdE+vwt4wa/IijsJutzt4X3dFyqzCtkjsrVhxEyeZ79D5T6Uw8Acj9xwP+T18Y4B
Xy4MGpVptcv+VKHaN7AGn4BD3Nv9L56esglJRiKynTB3OJ5nlOVN3OWja/BlzPno
I3/5Ue/3T7cjuHTt6BlU7W5LMPVwhGUYfGvI+OYHzuM/nhbucwxUq+747DPPZFyr
sEC5oWxp7uZE+iDFUz8dM+69YtY+OtPdckfpfbdS+3b2nvYyxYAkktZOk456br7D
Rps37j3JmURadVYPa6jz+etyPv9/n++KHfjlKXWjiTowJ5pGFh0xfTA+OZ0vIg89
aX8DDe9ynz5Dh2KmbAanppuRh5kfqlwodtHOKQZ/ReLH9hIv+ag=
=wC4t
-----END PGP SIGNATURE-----

--Sig_/r_8Ij2soxv+jfO+J_P2.Z6a--

--===============0197919482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0197919482==--
