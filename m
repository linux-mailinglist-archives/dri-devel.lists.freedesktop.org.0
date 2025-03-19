Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8C5A68373
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 04:10:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB6A10E1AE;
	Wed, 19 Mar 2025 03:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="dWBgwgfC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7466C10E1AE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 03:10:50 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-6f47ed1f40dso49882237b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 20:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1742353849; x=1742958649;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dd7pb9LEaICFADJfoD29GFwfUNNI8rjX6p8vtA3gVso=;
 b=dWBgwgfCSiuQPjTiSlkDg+APdHhx0ZDM6AFRdjX0AlzthyhwMd9lnvJoM20CAJO9iB
 ByZ6G7G6qE6L7cvYQlNeq4yIZdaWi6Te6jpe0FE5TDcEdU2bzg5+hTPYFR6rEP5uE3XX
 /ge/DiParFpcZEiiX34p6MorLmoDp95RUj/Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742353849; x=1742958649;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dd7pb9LEaICFADJfoD29GFwfUNNI8rjX6p8vtA3gVso=;
 b=aiMwzrzrhoKp0rqRMoLP3lA5oYaPTGFcFXIhANzWR+qpTtX1/21WYaKzmznU5bbfXp
 WhJpTFGNzhkoiYCFGijUUEPszBx1KTbI1qRpk7quVy61B4NgJi3aQTAjXYw0L7XhXxHF
 B46js8I4O268UzhaOHR8dBa+PKmcJ/k/UPltHOUFRELev2ol21UJXEHh7yy1NMGuUIMe
 oEKf/MC9YViyr7j6FNBwHCuPf4Y3zh20NkxvEhsA+u+KXhwVsbQKFotQpQtvq633H4yC
 Tqvc66W8X8iqLIIYXaNp3oJ9vBHKUfat+fhoehuRtUndhqq6faANq78NYbI+KaxqK3U1
 ckUA==
X-Gm-Message-State: AOJu0Yxi7DpFf5BbQa12ZjsGyFQO393Qa8eq5fEv5sj7JuM1a+jTKLL9
 adnoujoXgKnBOMp3VF/+7a/4vzDf5umAMheMDg2B1V5UQmmjbMIx9FiGh6l/Op8AY9xeHWXcyI1
 VqPA8ajz3iaRr6sIkLWdLkrFxqVnanMy0Qvae
X-Gm-Gg: ASbGnctW7WMfZSxcX2ag4tSTosI2MLZyLvbMmDZh8MnPvlAD5auWsXIQ9W++zDNAHCK
 ii/5vTP1zMBXo3FJ/CWqbVnlSgFejWz2iD3MqjZIjrQwK0zr095od+N/iHdqCeTL23LkLqEyNAk
 i/+0d1J91fZoQKhN6XGDhSPaO8QrA=
X-Google-Smtp-Source: AGHT+IH7MnDJMn3e9dyjqd+QcQNMHeYcozEwCVHx0I6rdGuLQU5j4m2GAblZsfI40gJnxSGqcwa9KgPciQEe//cmAwU=
X-Received: by 2002:a05:690c:46c8:b0:6f4:2b4b:358e with SMTP id
 00721157ae682-7009bf4dce7mr17788377b3.7.1742353848682; Tue, 18 Mar 2025
 20:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250123204424.836896-1-ian.forbes@broadcom.com>
In-Reply-To: <20250123204424.836896-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 18 Mar 2025 23:10:37 -0400
X-Gm-Features: AQ5f1JoEfXRudqIsoiu4e2LKTrYXKHYvK02wdmVjIJTgHlDLiMr98LA7yfKikBg
Message-ID: <CABQX2QM_KTWZfm-pdTYHWPRQJeKgnOUJAnTxtO0K5ZTS1c6tFA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/vmwgfx: Fix dumb buffer leak
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="0000000000003e28d80630a95eff"
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

--0000000000003e28d80630a95eff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 3:44=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> Dumb buffers were not being freed because the GEM reference that was
> acquired in gb_surface_define was not dropped like it is in the 2D case.
> Dropping this ref uncovered a few additional issues with freeing the
> resources associated with dirty tracking in vmw_bo_free/release.
>
> Additionally the TTM object associated with the surface were also leaking
> which meant that when the ttm_object_file was closed at process exit the
> destructor unreferenced an already destroyed surface.
>
> The solution is to remove the destructor from the vmw_user_surface
> associated with the dumb_buffer and immediately unreferencing the TTM
> object which his removes it from the ttm_object_file.
>
> This also allows the early return in vmw_user_surface_base_release for th=
e
> dumb buffer case to be removed as it should no longer occur.
>
> The chain of references now has the GEM handle(s) owning the dumb buffer.
> The GEM handles have a singular GEM reference to the vmw_bo which is
> dropped when all handles are closed. When the GEM reference count hits
> zero the vmw_bo is freed which then unreferences the surface via
> vmw_resource_release in vmw_bo_release.
>
> Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>
> v2:
>  - Update commit description
>  - Clean up leaked dirty tracking resources
>  - Fix handling of leaked TTM objects
>
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c       |  6 ++++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c  | 18 ++++++++++++------
>  3 files changed, 17 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 9b5b8c1f063b..87d8b2ba0e8c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -51,11 +51,13 @@ static void vmw_bo_release(struct vmw_bo *vbo)
>                         mutex_lock(&res->dev_priv->cmdbuf_mutex);
>                         (void)vmw_resource_reserve(res, false, true);
>                         vmw_resource_mob_detach(res);
> +                       if (res->dirty)
> +                               res->func->dirty_free(res);
>                         if (res->coherent)
>                                 vmw_bo_dirty_release(res->guest_memory_bo=
);
>                         res->guest_memory_bo =3D NULL;
>                         res->guest_memory_offset =3D 0;
> -                       vmw_resource_unreserve(res, false, false, false, =
NULL,
> +                       vmw_resource_unreserve(res, true, false, false, N=
ULL,
>                                                0);
>                         mutex_unlock(&res->dev_priv->cmdbuf_mutex);
>                 }
> @@ -73,9 +75,9 @@ static void vmw_bo_free(struct ttm_buffer_object *bo)
>  {
>         struct vmw_bo *vbo =3D to_vmw_bo(&bo->base);
>
> -       WARN_ON(vbo->dirty);
>         WARN_ON(!RB_EMPTY_ROOT(&vbo->res_tree));
>         vmw_bo_release(vbo);
> +       WARN_ON(vbo->dirty);
>         kfree(vbo);
>  }
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/v=
mwgfx/vmwgfx_resource.c
> index a73af8a355fb..c4d5fe5f330f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -273,7 +273,7 @@ int vmw_user_resource_lookup_handle(struct vmw_privat=
e *dev_priv,
>                 goto out_bad_resource;
>
>         res =3D converter->base_obj_to_res(base);
> -       kref_get(&res->kref);
> +       vmw_resource_reference(res);
>
>         *p_res =3D res;
>         ret =3D 0;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vm=
wgfx/vmwgfx_surface.c
> index 5721c74da3e0..5e022ed466ae 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -658,7 +658,7 @@ static void vmw_user_surface_free(struct vmw_resource=
 *res)
>         struct vmw_user_surface *user_srf =3D
>             container_of(srf, struct vmw_user_surface, srf);
>
> -       WARN_ON_ONCE(res->dirty);
> +       WARN_ON(res->dirty);
>         if (user_srf->master)
>                 drm_master_put(&user_srf->master);
>         kfree(srf->offsets);
> @@ -689,8 +689,7 @@ static void vmw_user_surface_base_release(struct ttm_=
base_object **p_base)
>          * Dumb buffers own the resource and they'll unref the
>          * resource themselves
>          */
> -       if (res && res->guest_memory_bo && res->guest_memory_bo->is_dumb)
> -               return;
> +       WARN_ON(res && res->guest_memory_bo && res->guest_memory_bo->is_d=
umb);
>
>         vmw_resource_unreference(&res);
>  }
> @@ -2358,12 +2357,19 @@ int vmw_dumb_create(struct drm_file *file_priv,
>         vbo =3D res->guest_memory_bo;
>         vbo->is_dumb =3D true;
>         vbo->dumb_surface =3D vmw_res_to_srf(res);
> -
> +       drm_gem_object_put(&vbo->tbo.base);
> +       /*
> +        * Unset the user surface dtor since this in not actually exposed
> +        * to userspace. The suface is owned via the dumb_buffer's GEM ha=
ndle
> +        */
> +       struct vmw_user_surface *usurf =3D container_of(vbo->dumb_surface=
,
> +                                               struct vmw_user_surface, =
srf);
> +       usurf->prime.base.refcount_release =3D NULL;
>  err:
>         if (res)
>                 vmw_resource_unreference(&res);
> -       if (ret)
> -               ttm_ref_object_base_unref(tfile, arg.rep.handle);
> +
> +       ttm_ref_object_base_unref(tfile, arg.rep.handle);
>
>         return ret;
>  }
> --
> 2.43.0
>

This version looks good. Thanks for tackling this!

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z

--0000000000003e28d80630a95eff
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
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIHfP
GvAWd4P7Jc0s72dY1kfeR2d/vD2AgQMTvdJNh/QvMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MDMxOTAzMTA0OVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAJy5iI8LhJwm11PSMPn61jA4BZm8yOjlUPRy5jmT
ytG3E1jVyxNAF2rIewSdypMhJKb3mHmg8u5GbzOvUAxm7rWfyPDQ4ChMdSLaWZidPDAQEouvTsmZ
+hV9BE+bCvmXC02UCKAZFtI6FIdhB25zuO3w+Fan+YamBApcKQewz5kwiHncqH6Fp4UCbPIZqY8H
BP5Z/N750kSWQ6U6T2T/t0jKuhJOP0sjIcXb4MBoPgZmGdyfrQ7U/C1zrMz8SiTEGq4QqGSmSn8N
YmQAaFdTryKqAIyeb+Il7QnrLbAGW0xxbxrmT7Rhf8nqYGCsIsh/hqKnM7lOU2aDjwt5FwNtG8c=
--0000000000003e28d80630a95eff--
