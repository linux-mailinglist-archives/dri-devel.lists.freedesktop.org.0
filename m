Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC7A13BD33
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 11:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3423E89149;
	Wed, 15 Jan 2020 10:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B47D89149
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 10:15:02 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id m26so17850917ljc.13
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 02:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=lu8ikKqDFhTUxobYUjEy6zfqs+rr9Gf2LGXBU2rU4T4=;
 b=SDfwVtHX4+aNlv0ZlbBjf3Q5JTRGLGdgs/0s2qWW4aoIyZEEw9m/ZdnUZKEKn8JMRN
 GMT25o81FhcrN0TCv9ZV49O4oLuMXa8+8+eVUQncZ0DJRDEtJmpB4a29Jdn2t0sMpHF6
 mnZrDVLrapGo2RuY9bv2WKd6R1j68C4fwrP+vDRFWMu74THva8oeLGdg9qb1epaoZ64q
 q9GikAnggrXNs//T4pcwSpKsHoys+aKw7mQ8Ac3AfYMHZ6sp6GeFlYgiJyLzNmhr2jDb
 EQk2pIKMM3wzo9YISUiastmNzVxl5ydK/Vy/4pnWJM4zF66/KnAEdhtsv4Y03EJf6Rzx
 kvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=lu8ikKqDFhTUxobYUjEy6zfqs+rr9Gf2LGXBU2rU4T4=;
 b=JIvpaNx3y+byffevY+pLt6sPfWYw6ulvGE0OdXSZtrQSubvNCDynDppiq1nog0/56Q
 rjK8rryqrqkHEVvzlMN4H9HqcvPAWVHOrDFqLddCxOrgWlgPK9iv71pHZt+KfyTRLvEO
 ZIxSp1csjs4CjrAKO8lMdip1MiLeiZaZT+pIuJeNfkpvVGCAdwotuPukAefawRifLJTq
 gp/JoFK+/0k7JtpN3oi6veKySNJZ910lOQxvUKEXsJ+u2mH/OSNS/0G6KITmwvscQ1e5
 J3VbHdDFW/yIFycesPeJ0tBGGSfnz0RnJkuSh/F+YeBRi5tgWUfmDUFxOPoe2kzT0FJN
 sBlA==
X-Gm-Message-State: APjAAAWGatxqOc8GqpgVjMfhQNwWWXJo7SQ9kNfJyQ2k0nFuJwPz0uw+
 EhSZWWLXj7C31sUNTm1aHmw=
X-Google-Smtp-Source: APXvYqyk1Q3dKm9fx+02iZX4hy6f8F/HyU7C5JZCCkSTlHbYRk9ogpALJT2XR0yL+Kqa1POigmDYKg==
X-Received: by 2002:a2e:88c4:: with SMTP id a4mr1282273ljk.174.1579083300727; 
 Wed, 15 Jan 2020 02:15:00 -0800 (PST)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id p15sm8528207lfo.88.2020.01.15.02.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 02:15:00 -0800 (PST)
Date: Wed, 15 Jan 2020 12:14:50 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer
 accessible via debugfs
Message-ID: <20200115121450.16672c16@eldfell.localdomain>
In-Reply-To: <20200114172155.215463-1-sean@poorly.run>
References: <20200114172155.215463-1-sean@poorly.run>
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-doc@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Steven Rostedt <rostedt@goodmis.org>
Content-Type: multipart/mixed; boundary="===============1494103750=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1494103750==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sBfDXojOQ6+W+E3762AHb7H"; protocol="application/pgp-signature"

--Sig_/sBfDXojOQ6+W+E3762AHb7H
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Jan 2020 12:21:43 -0500
Sean Paul <sean@poorly.run> wrote:

> From: Sean Paul <seanpaul@chromium.org>
>=20
> This patch uses a ring_buffer to keep a "flight recorder" (name credit We=
ston)
> of DRM logs for a specified set of debug categories. The user writes a
> bitmask of debug categories to the "trace_mask" node and can read log
> messages from the "trace" node.
>=20
> These nodes currently exist in debugfs under the dri directory. I
> intended on exposing all of this through tracefs originally, but the
> tracefs entry points are not exposed, so there's no way to create
> tracefs files from drivers at the moment. I think it would be a
> worthwhile endeavour, but one requiring more time and conversation to
> ensure the drm traces fit somewhere sensible.
>=20
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.195540=
-1-sean@poorly.run #v1
> Link: https://lists.freedesktop.org/archives/dri-devel/2019-November/2432=
30.html #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20191212203301.142437=
-1-sean@poorly.run #v3
>=20
> Changes in v2:
> - Went with a completely different approach:
> https://lists.freedesktop.org/archives/dri-devel/2019-November/243230.html
>=20
> Changes in v3:
> - Changed commit message to be a bit less RFC-y
> - Make class_drm_category_log an actual trace class
>=20
> Changes in v4:
> - Instead of [ab]using trace events and the system trace buffer, use our
>   own ringbuffer
> ---
> ---
>  Documentation/gpu/drm-uapi.rst |   9 +
>  drivers/gpu/drm/Kconfig        |   1 +
>  drivers/gpu/drm/Makefile       |   2 +-
>  drivers/gpu/drm/drm_drv.c      |   3 +
>  drivers/gpu/drm/drm_print.c    |  80 +++++--
>  drivers/gpu/drm/drm_trace.c    | 376 +++++++++++++++++++++++++++++++++
>  include/drm/drm_print.h        |  39 ++++
>  7 files changed, 487 insertions(+), 23 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_trace.c

...

> +/**
> + * DOC: DRM Tracing
> + *
> + * *tl;dr* DRM tracing is a lightweight alternative to traditional DRM d=
ebug
> + * logging.
> + *
> + * While DRM logging is quite convenient when reproducing a specific iss=
ue, it
> + * doesn't help when something goes wrong unexpectedly. There are a coup=
le
> + * reasons why one does not want to enable DRM logging at all times:
> + *
> + * 1. We don't want to overwhelm syslog with drm spam, others have to us=
e it too
> + * 2. Console logging is slow
> + *
> + * DRM tracing aims to solve both these problems.
> + *
> + * To use DRM tracing, write a DRM debug category mask (this is a bitmas=
k of
> + * &drm_debug_category values) to the trace_mask file:
> + * ::
> + *
> + *    eg: echo 0x106 > /sys/kernel/debug/dri/trace_mask
> + *
> + * Once active, all log messages in the specified categories will be wri=
tten to
> + * the DRM trace. Once at capacity, the trace will overwrite old message=
s with
> + * new ones. At any point, one can read the trace file to extract the pr=
evious N
> + * DRM messages:
> + * ::
> + *
> + *    eg: cat /sys/kernel/debug/dri/trace
> + *
> + * Considerations
> + * **************
> + * The contents of the DRM Trace are **not** considered UABI. **DO NOT d=
epend on
> + * the values of these traces in your userspace.** These traces are inte=
nded for
> + * entertainment purposes only. The contents of these logs carry no warr=
anty,
> + * expressed or implied.
> + *
> + * New traces can not be added to the trace buffer while it is being rea=
d. If
> + * this proves to be a problem, it can be mitigated by making a copy of =
the
> + * buffer on start of read. Since DRM trace is not meant to be continuou=
sly
> + * read, this loss is acceptable.
> + *
> + * The timestamps on logs are CPU-local. As such, log messages from diff=
erent
> + * CPUs may have slightly different ideas about time.
> + *
> + * Since each CPU has its own buffer, they won't all overflow at the sam=
e rate.
> + * This means that messages from a particularly active CPU could be drop=
ped
> + * while an inactive CPU might have much older log messages. So don't be=
 fooled
> + * if you seem to be missing log messages when you see a switch between =
CPUs in
> + * the logs.
> + *
> + * Internals
> + * *********
> + * The DRM Tracing functions are intentionally unexported, they are not =
meant to
> + * be used by drivers directly. The reasons are twofold:
> + *
> + * 1. All messages going to traces should also go to the console logs. T=
his
> + *    ensures users can choose their logging medium without fear they're=
 losing
> + *    messages.
> + * 2. Writing directly to the trace skips category filtering, resulting =
in trace
> + *    spam.
> + */

Hi,

sounds like a good first step to me!

I still have concerns about depending on debugfs in production and in
desktop distributions when this feature is wanted to be on by default,
but I suppose that cannot be solved right now.

...

> +/**
> + * drm_trace_init - initializes tracing for drm core
> + * @debugfs_root: the dentry for drm core's debugfs root
> + *
> + * This function is called on drm core init. It is responsible for initi=
alizing
> + * drm tracing. This function must be matched by a call to drm_trace_cle=
anup().
> + *
> + * Returns: 0 on success, -errno on failure
> + */
> +int drm_trace_init(struct dentry *debugfs_root)
> +{
> +	struct drm_trace_info *info =3D &drm_trace;
> +	int ret;
> +
> +	info->buffer =3D ring_buffer_alloc(PAGE_SIZE * 2, RB_FL_OVERWRITE);

Does this mean the ring buffer size is hardcoded to two pages of log
data (not event pointers)?

That is tiny! Does that even fit one frame's worth? And given that it
may take userspace a bit to react and open the log, other DRM
actions may have flushed everything interesting out already. I'm afraid
there won't be a single number to fit all use cases, either, I guess.


Thanks,
pq

--Sig_/sBfDXojOQ6+W+E3762AHb7H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl4e5hoACgkQI1/ltBGq
qqchgA//d0Qkzfqs9A3u1Wsdn0t4AVNWjNYPzR9lNdx4Du8tMaThEPx2zPzU6qWG
4/oVwy6Xb1eGc3PQApWXWnb7dmrINd0XJ+SQeA120HrK1CM1oFM8e7BiF8UaWodY
OFM5Ck4ia7sUWChk22coV/mLOi6RaW0kH3Lo3MHxeEC88BByCSb2W6yIWB3ZPph2
9TEr64x8XBQxMGl4N1kNWW2hfKAHW1fnHtM0Ez3Nb8g7Dy3/v0bCTbliCdwBAYxu
RR9M6+caKDRjNBwUGQLFXXxeWu6NwiIMs8xkvotOPb1W97whI66I2B5seeJZwdxU
HDpRzW0zyXlAGZP0QmAwzv9/3w/iDe4QM25RbwiwcjLFzgqaQ6YvDcsDW/6hrKaP
co16KU9TRfsJowr/zopONULsTdLm6MP2n5QsxQ3+WCT1abEhBBUumBsEGiJOVymt
tHzWDdmy9/OX59G75V85wEkX5/zS9ZCuo1+jKvXLPAoL9FkqNm7SsP0cKSKXqn9N
2lQ0NTvpNhxesvoT+NsftnY6GJewVva3+r7cYQjoQDgjQDrNvRFc+Us1Q22m5t6i
5f3xAt/gl3OS3yhEFPoSN5J4Gp6xl+sDpsO5vv0f+9bZ6l4G12EirXKz1YqN6SYj
/DZzo9Lx+tF4VEibqjD7LoWzAPXveQe0QC+JBOPks5ABaSlWOhg=
=YKGH
-----END PGP SIGNATURE-----

--Sig_/sBfDXojOQ6+W+E3762AHb7H--

--===============1494103750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1494103750==--
