Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EFCA09DAD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 23:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0528710E52F;
	Fri, 10 Jan 2025 22:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="hYJ/RL7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 201C310E52F
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 22:20:31 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e455bf1f4d3so3425718276.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 14:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1736547630; x=1737152430;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=T4nJLadNbXdLFA/o8YA4xOt7Wc5yUneRA3VytnF8SwA=;
 b=hYJ/RL7THxZibv3/S+pCBy7r6IaTdWEZzEpHpHwZAV2U/+alwwoqH4vJv8Yk3dYK+T
 86SPf1DYNiTRqmJuAhXItXHD1sNEZSg5EJGYhVRTLfkOzdLYfjevB0gYH8/Spd2+rto4
 1G+U3d59fp9Jwd1kmQr2PzUnrUZUOBZ8wPrMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736547630; x=1737152430;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T4nJLadNbXdLFA/o8YA4xOt7Wc5yUneRA3VytnF8SwA=;
 b=tDmTUzkN2uAfP0V/q0Du7EIx35WbIrDBunCyaXnFfcJY7XxxyMY90KZziFVqHhs5kk
 h6y1C/yxlm0E1r6IKDWhkG7XENl+ae4b5VC7/NyC2JlHxTRALx50F08ivzySWcdIfuy4
 7nzEgaHLq7b+3vlVeccaypRTh08vNm5yeMuTW4bIy+ApDqlC+ACymnRSAU19ioiq/J1D
 yYNRQa0chacz4G0+0idT5gX6CNiTi4t7MyVbsJRmu0d7FC5eT68YALVWwv2XijB9y8p2
 L9ZjpjjjA1h3XO8wr71dV2U9iYc1x6KwI35gDn47R0++nTUPGxMJxWqs9JgntYmocRj6
 3t4g==
X-Gm-Message-State: AOJu0Yxj4VAcFMjOpzidE3TTYhrysmrWTk6XBVVdULQ6cM/6viBCWQ/R
 Q2zCkHbPxdw1bSc/fLIqC/rNz6DUiN5KPHdEEWaClPDkw5pMxZFSV5LPR1+VR3NbvdF6Qm0HwXj
 LNR3Nn8Ibx7fXzw2pg67y+80GI0/CJbBkCb94
X-Gm-Gg: ASbGncvBb0lRlOE3USZG5LNs4o8CaPiV/cW/xB8m7I/1LUg+9gJpvEISmieKVmLmtz+
 mU6I2eyqTIi7H0bveTM7JMcGj+qE73hwL2kCdmms=
X-Google-Smtp-Source: AGHT+IHOQgU+J95X1F67UT/fBuxMnGwqZtyn6yJRsJwdcPeh1B6ResAei6VwPjpdZvxVheYPqnWXspkBQSEG3/tndTA=
X-Received: by 2002:a05:6902:1147:b0:e57:3704:6454 with SMTP id
 3f1490d57ef6-e573704654bmr1127754276.36.1736547629954; Fri, 10 Jan 2025
 14:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20250110185335.15301-1-ian.forbes@broadcom.com>
In-Reply-To: <20250110185335.15301-1-ian.forbes@broadcom.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Fri, 10 Jan 2025 17:20:17 -0500
X-Gm-Features: AbW1kvZFEhAF5khZV1uonR8EauOBWQbjSSX7QFQ73viVX522O59t7Vyf8qpqMaM
Message-ID: <CABQX2QNyNtqqm5LyHhgaEFY0spE7rizZ=Tz8hvPdfXj862Lh-Q@mail.gmail.com>
Subject: Re: [PATCH] drm/vmwgfx: Add new keep_resv BO param
To: Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000a442ab062b61801e"
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

--000000000000a442ab062b61801e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 1:53=E2=80=AFPM Ian Forbes <ian.forbes@broadcom.com=
> wrote:
>
> Adds a new BO param that keeps the reservation locked after creation.
> This removes the need to re-reserve the BO after creation which is a
> waste of cycles.
>
> This also fixes a bug in vmw_prime_import_sg_table where the imported
> reservation is unlocked twice.
>
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> Fixes: b32233acceff ("drm/vmwgfx: Fix prime import/export")
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 3 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h         | 3 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        | 7 ++-----
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c        | 1 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_shader.c     | 7 ++-----
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 5 ++---
>  6 files changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 5f13285f83e0b..9b5b8c1f063bb 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -442,7 +442,8 @@ static int vmw_bo_init(struct vmw_private *dev_priv,
>
>         if (params->pin)
>                 ttm_bo_pin(&vmw_bo->tbo);
> -       ttm_bo_unreserve(&vmw_bo->tbo);
> +       if (!params->keep_resv)
> +               ttm_bo_unreserve(&vmw_bo->tbo);
>
>         return 0;
>  }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.h
> index 07749f0a5f294..11e330c7c7f52 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -56,8 +56,9 @@ struct vmw_bo_params {
>         u32 domain;
>         u32 busy_domain;
>         enum ttm_bo_type bo_type;
> -       size_t size;
>         bool pin;
> +       bool keep_resv;
> +       size_t size;
>         struct dma_resv *resv;
>         struct sg_table *sg;
>  };
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index 2c46897876dde..b19a062592b08 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -403,7 +403,8 @@ static int vmw_dummy_query_bo_create(struct vmw_priva=
te *dev_priv)
>                 .busy_domain =3D VMW_BO_DOMAIN_SYS,
>                 .bo_type =3D ttm_bo_type_kernel,
>                 .size =3D PAGE_SIZE,
> -               .pin =3D true
> +               .pin =3D true,
> +               .keep_resv =3D true,
>         };
>
>         /*
> @@ -415,10 +416,6 @@ static int vmw_dummy_query_bo_create(struct vmw_priv=
ate *dev_priv)
>         if (unlikely(ret !=3D 0))
>                 return ret;
>
> -       ret =3D ttm_bo_reserve(&vbo->tbo, false, true, NULL);
> -       BUG_ON(ret !=3D 0);
> -       vmw_bo_pin_reserved(vbo, true);
> -
>         ret =3D ttm_bo_kmap(&vbo->tbo, 0, 1, &map);
>         if (likely(ret =3D=3D 0)) {
>                 result =3D ttm_kmap_obj_virtual(&map, &dummy);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_gem.c
> index b9857f37ca1ac..ed5015ced3920 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -206,6 +206,7 @@ struct drm_gem_object *vmw_prime_import_sg_table(stru=
ct drm_device *dev,
>                 .bo_type =3D ttm_bo_type_sg,
>                 .size =3D attach->dmabuf->size,
>                 .pin =3D false,
> +               .keep_resv =3D true,
>                 .resv =3D attach->dmabuf->resv,
>                 .sg =3D table,
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmw=
gfx/vmwgfx_shader.c
> index a01ca3226d0af..7fb1c88bcc475 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> @@ -896,7 +896,8 @@ int vmw_compat_shader_add(struct vmw_private *dev_pri=
v,
>                 .busy_domain =3D VMW_BO_DOMAIN_SYS,
>                 .bo_type =3D ttm_bo_type_device,
>                 .size =3D size,
> -               .pin =3D true
> +               .pin =3D true,
> +               .keep_resv =3D true,
>         };
>
>         if (!vmw_shader_id_ok(user_key, shader_type))
> @@ -906,10 +907,6 @@ int vmw_compat_shader_add(struct vmw_private *dev_pr=
iv,
>         if (unlikely(ret !=3D 0))
>                 goto out;
>
> -       ret =3D ttm_bo_reserve(&buf->tbo, false, true, NULL);
> -       if (unlikely(ret !=3D 0))
> -               goto no_reserve;
> -
>         /* Map and copy shader bytecode. */
>         ret =3D ttm_bo_kmap(&buf->tbo, 0, PFN_UP(size), &map);
>         if (unlikely(ret !=3D 0)) {
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_ttm_buffer.c
> index 621d98b376bbb..5553892d7c3e0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -572,15 +572,14 @@ int vmw_bo_create_and_populate(struct vmw_private *=
dev_priv,
>                 .busy_domain =3D domain,
>                 .bo_type =3D ttm_bo_type_kernel,
>                 .size =3D bo_size,
> -               .pin =3D true
> +               .pin =3D true,
> +               .keep_resv =3D true,
>         };
>
>         ret =3D vmw_bo_create(dev_priv, &bo_params, &vbo);
>         if (unlikely(ret !=3D 0))
>                 return ret;
>
> -       ret =3D ttm_bo_reserve(&vbo->tbo, false, true, NULL);
> -       BUG_ON(ret !=3D 0);
>         ret =3D vmw_ttm_populate(vbo->tbo.bdev, vbo->tbo.ttm, &ctx);
>         if (likely(ret =3D=3D 0)) {
>                 struct vmw_ttm_tt *vmw_tt =3D
> --
> 2.34.1
>

That's a pretty nice cleanup and a fix.

Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z

--000000000000a442ab062b61801e
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIFVi
W/F3yh2pCvY0GuCBCEywfy+5SffKQ6acR5rssiUCMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MDExMDIyMjAzMFowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJ
KoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAXM8WhrTvInth1U7E4jPUC
M1TzYngLi/6xT+S1DOhYs98NpOPD2lamoFiQJOmfpeNxFDnc8rWZutIq0uBzw04CsOzUhT+vrDdx
HbF+N2B7m8+mfdOM7f3kd/IfsnCqvA9erUrsFypUNe+R2tVFA0FSEc3lnTY+Ggd/KKJhoX4EWEse
vBCsivHoJ69TqH7fDHoHezeX6OuZcQSQ5Ster2MNcnrar4lr5/OElfFELDzS9vNXxP0UKMOqafx+
Jlzzytky4rmA8skpns0X5inj1vWrStlSjNt5tWI7INfPVvsiOzdB1yDa/9CjVep0ZKNd+DooYmTw
Wk1tkXW5j8T54XV/
--000000000000a442ab062b61801e--
