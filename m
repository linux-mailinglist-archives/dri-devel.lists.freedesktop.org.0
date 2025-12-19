Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEBECD11B3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 18:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3A010F057;
	Fri, 19 Dec 2025 17:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EjckH3YQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DB210F071
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 17:20:31 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7f6282195a9so196838b3a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 09:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766164831; x=1766769631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+Seccvj2fQnjGzzpYpqTzeM67CKpF12bZwhKAugIrA=;
 b=EjckH3YQmlsL8+8NACDqWkVC36zHP2YQZIacpnVmZ0LEQvWScTGjuIvaXbIs2U5LG+
 xTcjZgNFL+5GBLqXKXq5qyTIyzXEXhoKXmSTjE/QEDhPccg2ac0i8yzsm/1B7RJmB8Td
 GxgHSX8GyxTmyfsSyHoBLKoJo7t3yZEyH+iRAoWwNfOsXVs4tEupqllZZhqVL1jYgJtf
 Ta6aQi9VwuQ0bMynlWu8/dbtjkaFVt0hOG7osRJ5cMpp9bJ4bBzTvY9B9n695e7Ijv6S
 ccVcFVVnT6u1N/Y8lJIV2OQNVMpKZydDdrArg0rm9C3u1fa1MjjySjGxbvC8sugMmCq4
 XusQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766164831; x=1766769631;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=W+Seccvj2fQnjGzzpYpqTzeM67CKpF12bZwhKAugIrA=;
 b=nvTvDYxFo1ZDn40PG/kNcItRKgu0ykG0YPJOExKu1/b5EkNlmQxHBwNa+lwHMjb+52
 gzlN6R/HiucVuUqFJkM993mofceoUrNF06TmoEGPzHdW8n2uRp4Aa3yn1JNUR9qkxspW
 Xydy6gN6XU647mzGlZyzD+LW+HzGSbAheygPZlVV6LM5ozHTvdF3QN5ttIJomBTEpRUs
 Ak4bG06K3DxoCXkjzCmG1XHcEItg/2yDDWz/6rk7VqIZ9o3NBJsW/8i6ZDHgRSdhC5gY
 b0l2C2Dn8git/DbnlQIW17z52Rg4h3+n6u4WbGpwBjNv1mzeuEj0GoEOqwIPEW3CQTGy
 12kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQJKe9rNrVNRPVNb1MjYvS4Wv8abExt4aXDUHScF3CM2OujGAjlrkA7OaELz20f5DebVFzmw3TZ2Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0INTLeYC8WYjQuW775XZpLLOGVjxaBGKs4enIWgg9DxFfKnpU
 fY7g2ZKLyyojqsN5JXks98EV2K0Z1Bq+xxswnhcE8IlBgfd5yY21XzZJ+DpF7toilp71mZQGL9i
 xsVFZ3Yxm5glAH6HN/Nt1HV+ma5EcyLI=
X-Gm-Gg: AY/fxX7Q7IW5G/ZcT0z0Rq3ydaSJ+c/pZUKka02aD1g46xY81SBibpWU029eDr4EyzJ
 V1R2AgiqK5/n4M+P1XNZovBJWBI+2i0FNksTd1oOUN6pegphjpSjoCyi72kaBjHCElktrt7typ0
 R1vmiZeiY5H6Plk1VIjGl+dseAZerH/fICOo2k7ghed3or1V2Aem494fVD9J/WDOB0Vpo1z9cD3
 mahRQAp3fBDY3eMAQt3LOOKbzBD4IZ6qNIo3g9n1Xmv0mZgoNKmxUZBXl8NJlGxa7LtGs2c
X-Google-Smtp-Source: AGHT+IHAN+KoZnJ2BucCzFJnW+jnU2YzopJl3xj2Jbz5q4H1mePCut548kvkthr1VKwTyJrmDj57/h9jYY04PSv0ek8=
X-Received: by 2002:a05:7022:20e:b0:119:e56b:46b6 with SMTP id
 a92af1059eb24-1217214544amr2084383c88.0.1766164830647; Fri, 19 Dec 2025
 09:20:30 -0800 (PST)
MIME-Version: 1.0
References: <20251219113541.1264030-1-mukeshogare871@gmail.com>
In-Reply-To: <20251219113541.1264030-1-mukeshogare871@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 19 Dec 2025 12:20:18 -0500
X-Gm-Features: AQt7F2odx1bq7xi2_Tk82tscPwnKa-adUbznxMC1g9gt9XEJUGlGXzjzHjB4jq4
Message-ID: <CADnq5_PRh_CYjcBo7CctjinwKTk3JO7prcLOkvGNcnCmhrfC3A@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: convert VCE logging to drm_* helpers
To: Mukesh Ogare <mukeshogare871@gmail.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Dec 19, 2025 at 9:52=E2=80=AFAM Mukesh Ogare <mukeshogare871@gmail.=
com> wrote:
>
> Replace legacy DRM_ERROR() and DRM_INFO() logging in the VCE code
> with drm_err() and drm_info() helpers that take a struct drm_device.
>
> Using drm_* logging provides proper device context in dmesg, which is
> important for systems with multiple DRM devices, and aligns the radeon
> driver with current DRM logging practices.
>
> No functional change intended.
>
> Signed-off-by: Mukesh Ogare <mukeshogare871@gmail.com>
>
> diff --git a/Makefile b/Makefile
> index 2f545ec1690f..e404e4767944 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,8 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  VERSION =3D 6
> -PATCHLEVEL =3D 18
> +PATCHLEVEL =3D 19

unrelated change.  Please drop that.  Other than that, looks good to me.

Thanks,

Alex

>  SUBLEVEL =3D 0
> -EXTRAVERSION =3D
> +EXTRAVERSION =3D -rc1
>  NAME =3D Baby Opossum Posse
>
>  # *DOCUMENTATION*
> diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon=
/radeon_vce.c
> index bdbc1bbe8a9b..a203992cb932 100644
> --- a/drivers/gpu/drm/radeon/radeon_vce.c
> +++ b/drivers/gpu/drm/radeon/radeon_vce.c
> @@ -121,7 +121,7 @@ int radeon_vce_init(struct radeon_device *rdev)
>         if (sscanf(c, "%2u]", &rdev->vce.fb_version) !=3D 1)
>                 return -EINVAL;
>
> -       DRM_INFO("Found VCE firmware/feedback version %d.%d.%d / %d!\n",
> +       drm_err(&rdev->ddev, "Found VCE firmware/feedback version %d.%d.%=
d / %d!\n",
>                  start, mid, end, rdev->vce.fb_version);
>
>         rdev->vce.fw_version =3D (start << 24) | (mid << 16) | (end << 8)=
;
> @@ -325,7 +325,7 @@ void radeon_vce_free_handles(struct radeon_device *rd=
ev, struct drm_file *filp)
>                 r =3D radeon_vce_get_destroy_msg(rdev, TN_RING_TYPE_VCE1_=
INDEX,
>                                                handle, NULL);
>                 if (r)
> -                       DRM_ERROR("Error destroying VCE handle (%d)!\n", =
r);
> +                       drm_err(&rdev->ddev, "Error destroying VCE handle=
 (%d)!\n", r);
>
>                 rdev->vce.filp[i] =3D NULL;
>                 atomic_set(&rdev->vce.handles[i], 0);
> @@ -352,7 +352,7 @@ int radeon_vce_get_create_msg(struct radeon_device *r=
dev, int ring,
>
>         r =3D radeon_ib_get(rdev, ring, &ib, NULL, ib_size_dw * 4);
>         if (r) {
> -               DRM_ERROR("radeon: failed to get ib (%d).\n", r);
> +               drm_err(&rdev->ddev, "radeon: failed to get ib (%d).\n", =
r);
>                 return r;
>         }
>
> @@ -388,7 +388,7 @@ int radeon_vce_get_create_msg(struct radeon_device *r=
dev, int ring,
>
>         r =3D radeon_ib_schedule(rdev, &ib, NULL, false);
>         if (r)
> -               DRM_ERROR("radeon: failed to schedule ib (%d).\n", r);
> +               drm_err(&rdev->ddev, "radeon: failed to schedule ib (%d).=
\n", r);
>
>
>         if (fence)
> @@ -419,7 +419,7 @@ int radeon_vce_get_destroy_msg(struct radeon_device *=
rdev, int ring,
>
>         r =3D radeon_ib_get(rdev, ring, &ib, NULL, ib_size_dw * 4);
>         if (r) {
> -               DRM_ERROR("radeon: failed to get ib (%d).\n", r);
> +               drm_err(&rdev->ddev, "radeon: failed to get ib (%d).\n", =
r);
>                 return r;
>         }
>
> @@ -445,7 +445,7 @@ int radeon_vce_get_destroy_msg(struct radeon_device *=
rdev, int ring,
>
>         r =3D radeon_ib_schedule(rdev, &ib, NULL, false);
>         if (r) {
> -               DRM_ERROR("radeon: failed to schedule ib (%d).\n", r);
> +               drm_err(&rdev->ddev, "radeon: failed to schedule ib (%d).=
\n", r);
>         }
>
>         if (fence)
> @@ -479,7 +479,7 @@ int radeon_vce_cs_reloc(struct radeon_cs_parser *p, i=
nt lo, int hi,
>         idx =3D radeon_get_ib_value(p, hi);
>
>         if (idx >=3D relocs_chunk->length_dw) {
> -               DRM_ERROR("Relocs at %d after relocations chunk end %d !\=
n",
> +               drm_err(&p->rdev->ddev, "Relocs at %d after relocations c=
hunk end %d !\n",
>                           idx, relocs_chunk->length_dw);
>                 return -EINVAL;
>         }
> @@ -493,11 +493,11 @@ int radeon_vce_cs_reloc(struct radeon_cs_parser *p,=
 int lo, int hi,
>         p->ib.ptr[hi] =3D start >> 32;
>
>         if (end <=3D start) {
> -               DRM_ERROR("invalid reloc offset %llX!\n", offset);
> +               drm_err(&p->rdev->ddev, "invalid reloc offset %llX!\n", o=
ffset);
>                 return -EINVAL;
>         }
>         if ((end - start) < size) {
> -               DRM_ERROR("buffer to small (%d / %d)!\n",
> +               drm_err(&p->rdev->ddev, "buffer to small (%d / %d)!\n",
>                         (unsigned)(end - start), size);
>                 return -EINVAL;
>         }
> @@ -526,7 +526,7 @@ static int radeon_vce_validate_handle(struct radeon_c=
s_parser *p,
>         for (i =3D 0; i < RADEON_MAX_VCE_HANDLES; ++i) {
>                 if (atomic_read(&p->rdev->vce.handles[i]) =3D=3D handle) =
{
>                         if (p->rdev->vce.filp[i] !=3D p->filp) {
> -                               DRM_ERROR("VCE handle collision detected!=
\n");
> +                               drm_err(&p->rdev->ddev, "VCE handle colli=
sion detected!\n");
>                                 return -EINVAL;
>                         }
>                         return i;
> @@ -543,7 +543,7 @@ static int radeon_vce_validate_handle(struct radeon_c=
s_parser *p,
>                 }
>         }
>
> -       DRM_ERROR("No more free VCE handles!\n");
> +       drm_err(&p->rdev->ddev, "No more free VCE handles!\n");
>         return -EINVAL;
>  }
>
> @@ -566,13 +566,13 @@ int radeon_vce_cs_parse(struct radeon_cs_parser *p)
>                 uint32_t cmd =3D radeon_get_ib_value(p, p->idx + 1);
>
>                 if ((len < 8) || (len & 3)) {
> -                       DRM_ERROR("invalid VCE command length (%d)!\n", l=
en);
> +                       drm_err(&p->rdev->ddev, "invalid VCE command leng=
th (%d)!\n", len);
>                         r =3D -EINVAL;
>                         goto out;
>                 }
>
>                 if (destroyed) {
> -                       DRM_ERROR("No other command allowed after destroy=
!\n");
> +                       drm_err(&p->rdev->ddev, "No other command allowed=
 after destroy!\n");
>                         r =3D -EINVAL;
>                         goto out;
>                 }
> @@ -593,7 +593,7 @@ int radeon_vce_cs_parse(struct radeon_cs_parser *p)
>                 case 0x01000001: // create
>                         created =3D true;
>                         if (!allocated) {
> -                               DRM_ERROR("Handle already in use!\n");
> +                               drm_err(&p->rdev->ddev, "Handle already i=
n use!\n");
>                                 r =3D -EINVAL;
>                                 goto out;
>                         }
> @@ -650,13 +650,13 @@ int radeon_vce_cs_parse(struct radeon_cs_parser *p)
>                         break;
>
>                 default:
> -                       DRM_ERROR("invalid VCE command (0x%x)!\n", cmd);
> +                       drm_err(&p->rdev->ddev, "invalid VCE command (0x%=
x)!\n", cmd);
>                         r =3D -EINVAL;
>                         goto out;
>                 }
>
>                 if (session_idx =3D=3D -1) {
> -                       DRM_ERROR("no session command at start of IB\n");
> +                       drm_err(&p->rdev->ddev, "no session command at st=
art of IB\n");
>                         r =3D -EINVAL;
>                         goto out;
>                 }
> @@ -665,7 +665,7 @@ int radeon_vce_cs_parse(struct radeon_cs_parser *p)
>         }
>
>         if (allocated && !created) {
> -               DRM_ERROR("New session without create command!\n");
> +               drm_err(&p->rdev->ddev, "New session without create comma=
nd!\n");
>                 r =3D -ENOENT;
>         }
>
> @@ -760,7 +760,7 @@ int radeon_vce_ring_test(struct radeon_device *rdev, =
struct radeon_ring *ring)
>
>         r =3D radeon_ring_lock(rdev, ring, 16);
>         if (r) {
> -               DRM_ERROR("radeon: vce failed to lock ring %d (%d).\n",
> +               drm_err(&rdev->ddev, "radeon: vce failed to lock ring %d =
(%d).\n",
>                           ring->idx, r);
>                 return r;
>         }
> @@ -774,10 +774,10 @@ int radeon_vce_ring_test(struct radeon_device *rdev=
, struct radeon_ring *ring)
>         }
>
>         if (i < rdev->usec_timeout) {
> -               DRM_INFO("ring test on %d succeeded in %d usecs\n",
> +               drm_info(&rdev->ddev, "ring test on %d succeeded in %d us=
ecs\n",
>                          ring->idx, i);
>         } else {
> -               DRM_ERROR("radeon: ring %d test failed\n",
> +               drm_err(&rdev->ddev, "radeon: ring %d test failed\n",
>                          ring->idx);
>                 r =3D -ETIMEDOUT;
>         }
> @@ -799,25 +799,25 @@ int radeon_vce_ib_test(struct radeon_device *rdev, =
struct radeon_ring *ring)
>
>         r =3D radeon_vce_get_create_msg(rdev, ring->idx, 1, NULL);
>         if (r) {
> -               DRM_ERROR("radeon: failed to get create msg (%d).\n", r);
> +               drm_err(&rdev->ddev, "radeon: failed to get create msg (%=
d).\n", r);
>                 goto error;
>         }
>
>         r =3D radeon_vce_get_destroy_msg(rdev, ring->idx, 1, &fence);
>         if (r) {
> -               DRM_ERROR("radeon: failed to get destroy ib (%d).\n", r);
> +               drm_err(&rdev->ddev, "radeon: failed to get destroy ib (%=
d).\n", r);
>                 goto error;
>         }
>
>         r =3D radeon_fence_wait_timeout(fence, false, usecs_to_jiffies(
>                 RADEON_USEC_IB_TEST_TIMEOUT));
>         if (r < 0) {
> -               DRM_ERROR("radeon: fence wait failed (%d).\n", r);
> +               drm_err(&rdev->ddev, "radeon: fence wait failed (%d).\n",=
 r);
>         } else if (r =3D=3D 0) {
> -               DRM_ERROR("radeon: fence wait timed out.\n");
> +               drm_err(&rdev->ddev, "radeon: fence wait timed out.\n");
>                 r =3D -ETIMEDOUT;
>         } else {
> -               DRM_INFO("ib test on ring %d succeeded\n", ring->idx);
> +               drm_info(&rdev->ddev, "ib test on ring %d succeeded\n", r=
ing->idx);
>                 r =3D 0;
>         }
>  error:
> --
> 2.43.0
>
