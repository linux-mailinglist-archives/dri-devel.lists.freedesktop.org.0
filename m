Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 976DDA4D3F6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 07:38:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524E510E004;
	Tue,  4 Mar 2025 06:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="IjibWNWP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1736010E004
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 06:37:59 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e60aef2711fso2841256276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 22:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1741070278; x=1741675078;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KuxVpVgOvROP7ryeHyNizy7FfEmC02LlZvOBIQIEbOI=;
 b=IjibWNWPo4rVannYfL1xxMEuGErQJfBF9dq9VMvzfURQhX7Xx7S/okPEVHTknoXeVL
 6eQdsLQw76c1n1zN7TuaWY16xkGsdH8u534VqZf8iH4Z1swZEORAx8LpZD9wZirSAmOS
 KSQzmd/FDPK15CxgE8V0UxQVqCbuVRYbJfSJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741070278; x=1741675078;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KuxVpVgOvROP7ryeHyNizy7FfEmC02LlZvOBIQIEbOI=;
 b=ko1+K1/dkrtJmKMBvD1Zlo3XMpiphm9GxJGXoIqSuy+ckotZzs1A4LVZ//GqwtH4JV
 3lxaO15s+ByPbVyRuOiZc3uareCz3ONSZ/S5rMBMpInQE0hn7tYHK3oopAPysmP5rg/q
 P+XTVszvC4P8/PsKThUOgXhRp+7GDEeCpm8kvveQ0B/fXwwN3HsWs1FVclezqxJEi6me
 TJvf1VM+OhToQ1oE/EqZI55iqLug2gtM9VqnaEXWTNviZy6EPOhy0swun3NIiWQvYHZM
 65I6hsMlaDESGzXsaH8VgWv8JVe3MIyGvBaGCNWC1HqZYyyHZjlIuwpd9dXqgFVwz03a
 Pumg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdIVzRpmrGTT/2ZKM2Hquz4urlMvhqW4vEtwBhsVeh5Svq/nTRaxaZEcl2jNhYyrgH8TyoUfK9xEM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO1s+/X5fYfemrK+y3ao3KuPSROiO9NbPRGxBpVUxX07pVINL2
 v0HtAHB2oj8RbAhgX3LM9GG3fK/FEYCFLv3k7q4mtMcLhdkVR+dsEF3F0Tho/xiLFFwWEeeogzR
 66AEJaokoJsWGOzxU9I5MOnayHEL+PmbmQIPa
X-Gm-Gg: ASbGncuzA7cMHAVGsnZqfuhj5SBVms+9oIIm8YUumTITnk0X8+vyzsZTWWFdoASJ+5T
 tuSD+zJ/2peic4+4ujc7xYLCdEFyKBnxeKSfbkzbFFjZ9cgY0/DgzV0J05QJB3y40FkcUJ47UhH
 g/RCDWpsSL5gNIifykyC/fk7DNDrw=
X-Google-Smtp-Source: AGHT+IGsRQNI4kwiPQYSYqqSeKr51UvtWnlDn90DOtRaktw2dYpzRxCi1B2/mia+EmnYCQPDQVuJlLv93JhSP1NIqvg=
X-Received: by 2002:a05:6902:114f:b0:e57:f8cd:f0a4 with SMTP id
 3f1490d57ef6-e60b2f3eab7mr18887146276.34.1741070278640; Mon, 03 Mar 2025
 22:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20250225145223.34773-1-keisuke.nishimura@inria.fr>
In-Reply-To: <20250225145223.34773-1-keisuke.nishimura@inria.fr>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 4 Mar 2025 01:37:45 -0500
X-Gm-Features: AQ5f1JqcYtagMh_d5BLKrzNzDsqN5i8pe1pq2f_Dq1yRnttdJ9NFUKntaAOsPlI
Message-ID: <CABQX2QMib0D95hC4ecF_JVtkqgtksU1n+_N3AY+QkoiinR5k9g@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Add error path for xa_store in
 vmw_bo_add_detached_resource
To: Keisuke Nishimura <keisuke.nishimura@inria.fr>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>, 
 Martin Krastev <martin.krastev@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000819119062f7e833d"
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

--000000000000819119062f7e833d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 9:54=E2=80=AFAM Keisuke Nishimura
<keisuke.nishimura@inria.fr> wrote:
>
> The xa_store() may fail due to memory allocation failure because there
> is no guarantee that the index is already used. This fix introduces new
> paths to handle the error.
>
> This patch also aligns the order of function calls by calling
> vmw_bo_add_detached_resource() before ttm_prime_object_init() in order
> to allow consistent error handling.
>
> Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
> Signed-off-by: Keisuke Nishimura <keisuke.nishimura@inria.fr>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      |  4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h      |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 16 ++++++++++++++--
>  3 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 9b5b8c1f063b..aa13e4061ff1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -848,9 +848,9 @@ void vmw_bo_placement_set_default_accelerated(struct =
vmw_bo *bo)
>         vmw_bo_placement_set(bo, domain, domain);
>  }
>
> -void vmw_bo_add_detached_resource(struct vmw_bo *vbo, struct vmw_resourc=
e *res)
> +int vmw_bo_add_detached_resource(struct vmw_bo *vbo, struct vmw_resource=
 *res)
>  {
> -       xa_store(&vbo->detached_resources, (unsigned long)res, res, GFP_K=
ERNEL);
> +       return xa_err(xa_store(&vbo->detached_resources, (unsigned long)r=
es, res, GFP_KERNEL));
>  }
>
>  void vmw_bo_del_detached_resource(struct vmw_bo *vbo, struct vmw_resourc=
e *res)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.h
> index 11e330c7c7f5..51790a11fe64 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -141,7 +141,7 @@ void vmw_bo_move_notify(struct ttm_buffer_object *bo,
>                         struct ttm_resource *mem);
>  void vmw_bo_swap_notify(struct ttm_buffer_object *bo);
>
> -void vmw_bo_add_detached_resource(struct vmw_bo *vbo, struct vmw_resourc=
e *res);
> +int vmw_bo_add_detached_resource(struct vmw_bo *vbo, struct vmw_resource=
 *res);
>  void vmw_bo_del_detached_resource(struct vmw_bo *vbo, struct vmw_resourc=
e *res);
>  struct vmw_surface *vmw_bo_surface(struct vmw_bo *vbo);
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_surface.c
> index 5721c74da3e0..1f7626f6ac0b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -871,7 +871,12 @@ int vmw_surface_define_ioctl(struct drm_device *dev,=
 void *data,
>                         vmw_resource_unreference(&res);
>                         goto out_unlock;
>                 }
> -               vmw_bo_add_detached_resource(res->guest_memory_bo, res);
> +
> +               ret =3D vmw_bo_add_detached_resource(res->guest_memory_bo=
, res);
> +               if (unlikely(ret !=3D 0)) {
> +                       vmw_resource_unreference(&res);
> +                       goto out_unlock;
> +               }
>         }
>
>         tmp =3D vmw_resource_reference(&srf->res);
> @@ -1670,6 +1675,14 @@ vmw_gb_surface_define_internal(struct drm_device *=
dev,
>
>         }
>
> +       if (res->guest_memory_bo) {
> +               ret =3D vmw_bo_add_detached_resource(res->guest_memory_bo=
, res);
> +               if (unlikely(ret !=3D 0)) {
> +                       vmw_resource_unreference(&res);
> +                       goto out_unlock;
> +               }
> +       }
> +
>         tmp =3D vmw_resource_reference(res);
>         ret =3D ttm_prime_object_init(tfile, res->guest_memory_size, &use=
r_srf->prime,
>                                     VMW_RES_SURFACE,
> @@ -1684,7 +1697,6 @@ vmw_gb_surface_define_internal(struct drm_device *d=
ev,
>         rep->handle      =3D user_srf->prime.base.handle;
>         rep->backup_size =3D res->guest_memory_size;
>         if (res->guest_memory_bo) {
> -               vmw_bo_add_detached_resource(res->guest_memory_bo, res);
>                 rep->buffer_map_handle =3D
>                         drm_vma_node_offset_addr(&res->guest_memory_bo->t=
bo.base.vma_node);
>                 rep->buffer_size =3D res->guest_memory_bo->tbo.base.size;
> --
> 2.34.1
>

Looks good. Thank you for the patch! I'll push it to drm-misc-next for
now because I'd like it alongside the cursor rework.

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z

--000000000000819119062f7e833d
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJkMIICYAIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIGmt
sYdgMv/RRXkQeHPMSHMKnKlkLKlwHDI1YlgFsFtaMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MDMwNDA2Mzc1OFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJ
KoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBTALTT7qdTLAuytO6gK3zL
B/yoLI/pononN08fuPZrpjvRisX35lN7TMJp3r1KcvLmuaDJKIRgYq+v6IG1D4zonir3EuRzY4It
l7sR+y9VwYRMnqguG9uO72pIKGSKwCJO9n3m4THNrLFNE8lJZ4oeY2dp7hp85hoa5TGVR7Rv4BGS
doAbwMOewuIHKeQWO3F1iEJA50eWfFgKewhsdpO+4T2vF2GNhqao4A3JRwjKTGch/eaA9ltghtoo
VL/7AuAYeWN1nT/p1PP2V3c/SVY6ywvEQsjLSGMWHjG3RzCyfKqKe5F4gX7c9n3tPn2gLoy0RAIw
T3o1+m3MbbR79gyO
--000000000000819119062f7e833d--
