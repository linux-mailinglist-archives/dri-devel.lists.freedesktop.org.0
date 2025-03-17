Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B67A657A1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 17:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF5510E169;
	Mon, 17 Mar 2025 16:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="frZkwSRb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA2AC10E169
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 16:12:42 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-e589c258663so4089588276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 09:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1742227962; x=1742832762;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dGsF0FqvQ1e/uw3wjwLh4LCFRpb1w5a0Z3iey+LHmZY=;
 b=frZkwSRb40apZVgtgH6uXm4U9dk163t4quLdfdUiN8u1+z5/eI3RgWXOldqAucXg9R
 ZokrF+jfVQ88Jvmy76t3mz6ZblTncP2PGXN+tyZcitlxB0DGPhD0m95MqsMFDWeuwD0v
 bTNVL94OgmMnoTZVZjyT8UrhOn8aW/IJ4czV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742227962; x=1742832762;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dGsF0FqvQ1e/uw3wjwLh4LCFRpb1w5a0Z3iey+LHmZY=;
 b=QqOmTAK7zG0+zT+eNia6phWb+9ZC6A87/g0K8tkSZyZCk/zW6TDOS2UHQ5xgTQoMnK
 2hRooHsndQxOC+t1TSVRqvvwu2qghJPsAPIA1GMbSuM5cfesU34w8xtm6PCwGsGRhtMq
 XO3dTYlw70gEVxeMAj2mTtZjCMzlDOX69F1x/TkhFYdqtGLf05tOxaAMFD1hm8H0dmHR
 4NlJE0Mi4F/OlbC4uiUBdvWRdmjGeKv1wswuAHV28AukjoBRPra+7tJvNF3DgcRFQ+XR
 SAUzJTE8Kb1xhlnlZhETWLF2nHm6yN/1z+sPnZH5ZJnF3re7QrVH2Vz8tRI40xWNBScB
 hfjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWopPDh5ILVJEMj1+g/ivNXCrnzCJ5a+7Va4nn6nReGylpMZY1yAFc6kVzDu8BBEYqJyNrAUFqMFfM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWSFjLZ27DUw9ouX9Wc0o5q1zP26nqkYtWscOZoQpLIBOH+kEu
 kTJskCaawz3q5tuAalFgZPt8/iJfREJcu8dsP3UUhJyI35+y1DCc8hv2nqgKbl0goQlezmSwW4H
 7sD72yK4GqJKkhwx6CwF7gJDRb0jiPKVBJ8x+
X-Gm-Gg: ASbGnctveir4DzRpKIHFb5tilmqfgQaiAqWhCRuDuBgK4bB9K9OpwSdS+KN4rOXB0YJ
 hwG3A9mw+GDOMbCUplUgrRURE+Zl0dEsl89ffZFJwBA0s/RcDWFtHwK36NrXIL/ghlhhRkK1tiI
 qwkDWM/gDhqir1apn6xCgtCbk/kxk=
X-Google-Smtp-Source: AGHT+IEkX6jY66HzmBwSERbt8Vnd4t6g5Ks6r8xsaTMFIl29B8ZGNtQ2fw8OBiaS5zcqlKShJSKyi5/yOC3MgbvoWlk=
X-Received: by 2002:a05:690c:3388:b0:6f9:78c0:3a5f with SMTP id
 00721157ae682-6ff45ef4dfdmr187030587b3.19.1742227962038; Mon, 17 Mar 2025
 09:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250317131923.238374-1-tzimmermann@suse.de>
 <20250317131923.238374-14-tzimmermann@suse.de>
In-Reply-To: <20250317131923.238374-14-tzimmermann@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Mon, 17 Mar 2025 12:12:31 -0400
X-Gm-Features: AQ5f1Jr8fyDMqMx84kEXZ1NE8Zk3hTcZy2FG6vpHF395nYr43gsGprljyPBqn8k
Message-ID: <CABQX2QN5DCEWAUA+uCS4uZQP8G8doski0GxNAY8JvMsBD7u+wA@mail.gmail.com>
Subject: Re: [PATCH 13/15] drm/vmwgfx: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg=sha-256; boundary="000000000000cf74a206308c0e2e"
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

--000000000000cf74a206308c0e2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2025 at 9:22=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test. The helper tests the dma_buf
> itself while import_attach is just an artifact of the import. Prepares
> to make import_attach optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadc=
om.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c | 4 ++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c  | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_blit.c
> index 64bd7d74854e..fa5841fda659 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -429,7 +429,7 @@ static void *map_external(struct vmw_bo *bo, struct i=
osys_map *map)
>         void *ptr =3D NULL;
>         int ret;
>
> -       if (bo->tbo.base.import_attach) {
> +       if (drm_gem_is_imported(&bo->tbo.base)) {
>                 ret =3D dma_buf_vmap(bo->tbo.base.dma_buf, map);
>                 if (ret) {
>                         drm_dbg_driver(&vmw->drm,
> @@ -447,7 +447,7 @@ static void *map_external(struct vmw_bo *bo, struct i=
osys_map *map)
>
>  static void unmap_external(struct vmw_bo *bo, struct iosys_map *map)
>  {
> -       if (bo->tbo.base.import_attach)
> +       if (drm_gem_is_imported(&bo->tbo.base))
>                 dma_buf_vunmap(bo->tbo.base.dma_buf, map);
>         else
>                 vmw_bo_unmap(bo);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_gem.c
> index ed5015ced392..200240fecf7d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -84,7 +84,7 @@ static int vmw_gem_vmap(struct drm_gem_object *obj, str=
uct iosys_map *map)
>         struct ttm_buffer_object *bo =3D drm_gem_ttm_of_gem(obj);
>         int ret;
>
> -       if (obj->import_attach) {
> +       if (drm_gem_is_imported(obj)) {
>                 ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
>                 if (!ret) {
>                         if (drm_WARN_ON(obj->dev, map->is_iomem)) {
> @@ -101,7 +101,7 @@ static int vmw_gem_vmap(struct drm_gem_object *obj, s=
truct iosys_map *map)
>
>  static void vmw_gem_vunmap(struct drm_gem_object *obj, struct iosys_map =
*map)
>  {
> -       if (obj->import_attach)
> +       if (drm_gem_is_imported(obj))
>                 dma_buf_vunmap(obj->import_attach->dmabuf, map);
>         else
>                 drm_gem_ttm_vunmap(obj, map);
> @@ -111,7 +111,7 @@ static int vmw_gem_mmap(struct drm_gem_object *obj, s=
truct vm_area_struct *vma)
>  {
>         int ret;
>
> -       if (obj->import_attach) {
> +       if (drm_gem_is_imported(obj)) {
>                 /*
>                  * Reset both vm_ops and vm_private_data, so we don't end=
 up with
>                  * vm_ops pointing to our implementation if the dma-buf b=
ackend
> --
> 2.48.1
>

Another great cleanup! Thanks.
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z

--000000000000cf74a206308c0e2e
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
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIEjT
Ya4zN/mhhYrQtDiqxYETSr7F+lPfxsljjRp46BqjMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI1MDMxNzE2MTI0MlowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAE1AlJPmPSMFBnIr6z9U4MN8H4Xeesg+DKAB+81P
3sx4TWRvOqwIzlnmIq8plz89+CNfk3FzzGkrBh3qE7sHdXkJg5Omn2h5cjZCSqLiCrM3dRBaSXGm
kRa7+VtBPOSTVgvp3si2lyKZKBKaob7z+BmtbICGBfIS7RUu1UhvkbPBqo2BYKjfRrwcQqYdAS6k
ZInuDbNJLt5zljm4ZfxORHqHWBYcrerOjOI+Bwc/GM0wot74oLoMw5rakjvBOw7YvwR0AYpuAC21
t/bLuBdE/Av/eK+HTtSlaYqWUITvObDTn7oteG7+2lOraRfHmj6L2T4a+CU6x3SUR94CZ08px4g=
--000000000000cf74a206308c0e2e--
