Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 373C5B05F28
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 16:01:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC97F10E5E0;
	Tue, 15 Jul 2025 14:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KA1Tgfut";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75D110E5DF;
 Tue, 15 Jul 2025 14:01:40 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-313290ea247so1158520a91.3; 
 Tue, 15 Jul 2025 07:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752588100; x=1753192900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wL+luo39LUWWjoPt17St0/QWMOqanFu7D9BY7M5H/A=;
 b=KA1TgfutJmN/T9012KhL3S43Lz28gzjdXXBq+h2yF0xQgX5A6aH9aqUB4GqiBL6NTJ
 qwLFyyHPzkTf0Gx8b3YnppuzcGC0018UKnOSKsRyEjQ1MirJdxMxPCMDDiIbuuoMCdmw
 FAveFvftfwzJD3Mb9GVYgy7oet8j8rycB7qRWZ5qCXnIOdl1uZVhVkzrVM2iEMQ/3+0t
 196zMHxrJGJZQvhkRhZJ2HVkrK+bZDv/T5/uT6WbrAFrLonm9/au0DyW354EpjIXWz8C
 zb6H4RWJphhBcs95exhcitF+KtBeEQLuM08HFALnVx8T3z+kZDTKleI97x/sjujt20wH
 mF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752588100; x=1753192900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4wL+luo39LUWWjoPt17St0/QWMOqanFu7D9BY7M5H/A=;
 b=xVgyE4ptRE2Izj42O3nt5rWp70qk4pTEe8+Ka8wgRr+DSTY635uBvMV278acdhc2K7
 VOc1bJ6X7oe8YXiiDIi5UIjoZUsa/eeDkrfjHN6qXg2+NVVonFV4RvFWO2HjCpL6rDXa
 cgN1+y++ov7c/ryRJi1g/Orr6/CGrk1Rm0kiMrrdkggWjNu8VRUD3hkgj8mBmtevV2wz
 yKPCmiw2h7AvHkYdwKFogPwtKpPI116FQOub2xBPzrhsUO9AzMKGi0uz4bav9jA12S09
 P+suS8rlOdq7OCgYPn5Xd0s+qFUbmPWbl3hdHjHZQplSPVMeSsd0hFAiAdap4Vxyvvhd
 ptYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi3BD/ep0YioOUxqlZZB04h9/Cvbh3xzGG2AqEj+el7QY3tVRBzHSn2BfPP8rIMK19zRoN9cQfbYwi@lists.freedesktop.org,
 AJvYcCXfn9Sc42KUFcNUVMCopHXZ6fWFjKqelFNfPUNRHa4RLL/5a7OlWRIi6n7UZoZg7Nn3DYJZY7J7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdqLw9R5aGy7tdY/Q2cOR7IG/cP9t242igzm8KgBBfWwePb+h/
 Fd7Fn0Pwe8C+qtEutWOG6rEdS4deypEbN+sPAiVnVP6ndXLtTx5XOhLWwZlOfaTxbkJ+hl2j09h
 hlxFiOkOAhp9xHZH7zbDyueeQzRE9z0vxfw==
X-Gm-Gg: ASbGncssZonFdzsyWaKqI8m7zcR4QrLoHLUXJhj1XOrM/1kkkcO9mDbZTO4yGBG7woS
 ryOIMYQKFlPLFaPUoqQH6fDv9nBDhSAXyRykr6s0zd/3ys+NPr3xYTNGIaFgUAy74aXLzxgRH5f
 JHxBJ/shiWKe8m54gmKoIIK/0fSf/oE6eHM6IwcwG/F7EVJVAsbJfWTSrKKAvSVTFRh51xD6GM9
 Od/zoZ3
X-Google-Smtp-Source: AGHT+IH2HzNvQ+44hM6hi6XBIA7uilKLROxh9U7n8aP7UpcVyOih+wkcXC2U2VqwCSke8jLtDtMZk65EFQDBwbaT9rQ=
X-Received: by 2002:a17:90b:58c4:b0:311:a314:c2dd with SMTP id
 98e67ed59e1d1-31c94d900b2mr1137595a91.4.1752588099689; Tue, 15 Jul 2025
 07:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250715082635.34974-1-tzimmermann@suse.de>
In-Reply-To: <20250715082635.34974-1-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Jul 2025 10:01:27 -0400
X-Gm-Features: Ac12FXy6x89dETzCJbFSenK3xD-0AsekcvWBIVLD9JHEO6eepaVGLvpcyzpYi9Q
Message-ID: <CADnq5_NRP8tokX7M9yKA=+sLrY0Owrg5gWyg-NH3qC1sNyZ8ww@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/amdgpu: Use dma_buf from GEM object instance"
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
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

On Tue, Jul 15, 2025 at 4:38=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> This reverts commit 515986100d176663d0a03219a3056e4252f729e6.
>
> The dma_buf field in struct drm_gem_object is not stable over the
> object instance's lifetime. The field becomes NULL when user space
> releases the final GEM handle on the buffer object. This resulted
> in a NULL-pointer deref.
>
> Workarounds in commit 5307dce878d4 ("drm/gem: Acquire references on
> GEM handles for framebuffers") and commit f6bfc9afc751 ("drm/framebuffer:
> Acquire internal references on GEM handles") only solved the problem
> partially. They especially don't work for buffer objects without a DRM
> framebuffer associated.
>
> Hence, this revert to going back to using .import_attach->dmabuf.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c     | 3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 2 +-
>  3 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_dma_buf.c
> index ff98c87b2e0b..5743ebb2f1b7 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -514,7 +514,7 @@ bool amdgpu_dmabuf_is_xgmi_accessible(struct amdgpu_d=
evice *adev,
>                 return false;
>
>         if (drm_gem_is_imported(obj)) {
> -               struct dma_buf *dma_buf =3D obj->dma_buf;
> +               struct dma_buf *dma_buf =3D obj->import_attach->dmabuf;
>
>                 if (dma_buf->ops !=3D &amdgpu_dmabuf_ops)
>                         /* No XGMI with non AMD GPUs */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_gem.c
> index 6626a6e64ff5..d1ccbfcf21fa 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -317,7 +317,8 @@ static int amdgpu_gem_object_open(struct drm_gem_obje=
ct *obj,
>          */
>         if (!vm->is_compute_context || !vm->process_info)
>                 return 0;
> -       if (!drm_gem_is_imported(obj) || !dma_buf_is_dynamic(obj->dma_buf=
))
> +       if (!drm_gem_is_imported(obj) ||
> +           !dma_buf_is_dynamic(obj->import_attach->dmabuf))
>                 return 0;
>         mutex_lock_nested(&vm->process_info->lock, 1);
>         if (!WARN_ON(!vm->process_info->eviction_fence)) {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index af0f655dfd5b..b9b4f7d9186e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1272,7 +1272,7 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev,=
 struct amdgpu_bo_va *bo_va,
>                 struct drm_gem_object *obj =3D &bo->tbo.base;
>
>                 if (drm_gem_is_imported(obj) && bo_va->is_xgmi) {
> -                       struct dma_buf *dma_buf =3D obj->dma_buf;
> +                       struct dma_buf *dma_buf =3D obj->import_attach->d=
mabuf;
>                         struct drm_gem_object *gobj =3D dma_buf->priv;
>                         struct amdgpu_bo *abo =3D gem_to_amdgpu_bo(gobj);
>
> --
> 2.50.0
>
