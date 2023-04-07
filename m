Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC66DB2BF
	for <lists+dri-devel@lfdr.de>; Fri,  7 Apr 2023 20:25:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A7C010EE42;
	Fri,  7 Apr 2023 18:25:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188FE10EE37
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Apr 2023 18:25:03 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id ji2so1037264plb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Apr 2023 11:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680891902; x=1683483902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YqDA4WRbqZ8pZx3U3y6YYJyg8kkdxxYYCziSSoMs6f4=;
 b=IxJT4QMtg5r1G4F+GoM/q1tJVSZvAIzcvgcNYRgfVw3xxAXMfzR1j8kFIJQ5+3LOP1
 3YHWb+PmbJpffDwUvHHaOXgcH2jW/vRq4CF9OWiUG3Yw3QmAQYL8j8U1clL3OB9jmSOy
 OyqeP0yvsylVpyedaCAmYyRhVhsHlrqYdOQkm6zEPNpcuTzw6LZR0eNjDkzB3H5FNkR2
 wu7pPND7ZoQbJtAPGlxSLa4vkDjlLenKV/r5RHZaltDRU/HzSi58qR/dbY+sR1VRcn3Y
 RBguN4BK97kV/rDwV1gdLloP/3QNpzjoWbdXoWTvO7wu3ee35i1j5aMXZ8rUuik0aKWR
 rCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680891902; x=1683483902;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YqDA4WRbqZ8pZx3U3y6YYJyg8kkdxxYYCziSSoMs6f4=;
 b=Q9snJzpQ1qjrM4DHyv7q+bBRFCeCr80zlAQn5khvsxCziQd1KMZiOSPp7TCEyAFNg9
 gEHCZ+bL5hIJ6vzwQzancjWkfhjlzh+Gv1C5T8EECY5ssyU/EUl5K+FooA0Me56GbRpp
 ngEb/+vOt8G9/uEvxmglqCP2mF47DhVaPORQHY6uZCk68rLHE6V+3LtGSTYQIxEogd1D
 E3Gv7OE7/22bfoVlOYKi8hxPtRV6qVk/QPfA21mKjo6hBNng5Cvazos9jHmFNrl/AGdo
 usO9X9pyX52pJBqaxlpKpf9MITXwZ5TnuEBaPQ/vdDIPZS3hbM80m4Xf8fdy6jmxInvP
 t4BQ==
X-Gm-Message-State: AAQBX9cEvlRjhnnrub740lXLhsb8g9k5TOM24S45SV5MM1v68rAoJXiR
 k+wlUcqeRMTUwUbi/166VtMy158s0XVIAykJaiWJOw==
X-Google-Smtp-Source: AKy350bXQUYcPYmDw9ucdCsVzHEhLhSxuODvj2EavnS9lslRG5I8VtiLzyQAXkkbbqqxnfc/IY218hVz5XmMfH2ovNY=
X-Received: by 2002:a17:902:e54d:b0:19e:f660:81ee with SMTP id
 n13-20020a170902e54d00b0019ef66081eemr1104963plf.2.1680891902021; Fri, 07 Apr
 2023 11:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230331204209.1863060-1-trix@redhat.com>
In-Reply-To: <20230331204209.1863060-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 11:24:50 -0700
Message-ID: <CAKwvOdmkyXgii52gyD5uO7=BwYu0iJ9QZtbOcusE2PeH24f6uw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/acr: remove unused loc variable
To: Tom Rix <trix@redhat.com>
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nathan@kernel.org, bskeggs@redhat.com, gsamaiya@nvidia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 1:42=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c:221:7: error: variable
>   'loc' set but not used [-Werror,-Wunused-but-set-variable]
>                 u32 loc, sig, cnt, *meta;
>                     ^
> This variable is not used so remove it.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

Ben, any idea if this was supposed to be used somewhere? If not:

Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/acr/lsfw.c
> index f36a359d4531..bd104a030243 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/lsfw.c
> @@ -218,7 +218,7 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subd=
ev *subdev,
>                 const struct firmware *hsbl;
>                 const struct nvfw_ls_hsbl_bin_hdr *hdr;
>                 const struct nvfw_ls_hsbl_hdr *hshdr;
> -               u32 loc, sig, cnt, *meta;
> +               u32 sig, cnt, *meta;
>
>                 ret =3D nvkm_firmware_load_name(subdev, path, "hs_bl_sig"=
, ver, &hsbl);
>                 if (ret)
> @@ -227,7 +227,6 @@ nvkm_acr_lsfw_load_sig_image_desc_v2(struct nvkm_subd=
ev *subdev,
>                 hdr =3D nvfw_ls_hsbl_bin_hdr(subdev, hsbl->data);
>                 hshdr =3D nvfw_ls_hsbl_hdr(subdev, hsbl->data + hdr->head=
er_offset);
>                 meta =3D (u32 *)(hsbl->data + hshdr->meta_data_offset);
> -               loc =3D *(u32 *)(hsbl->data + hshdr->patch_loc);
>                 sig =3D *(u32 *)(hsbl->data + hshdr->patch_sig);
>                 cnt =3D *(u32 *)(hsbl->data + hshdr->num_sig);
>
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
