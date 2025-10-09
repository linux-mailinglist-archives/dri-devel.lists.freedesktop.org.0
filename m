Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB761BCA3FC
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 18:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CFA10EAAF;
	Thu,  9 Oct 2025 16:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gQnfQBE8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7490A10EAA9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 16:51:46 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-27eec33b737so18784085ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 09:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760028706; x=1760633506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GqmHH018eIDbXC0urYrHMAd6/ShdhXMsPDErX//Tqp0=;
 b=gQnfQBE83BXX9WMxIVb4Yq7mqZn/Uk4KVuQNGV2xizw1llul+2OeaIDSleVLjQb8p9
 O7yhdpl2j/IbQfUzYPeXwY9h/RmHqbmxrUWgNFFtKYB1qFls8sRc1UWQrrk5pqiL54E2
 CFBDS8SWcjxeU5yWI8I253AMiq9iLh5RpVsEU8pJWMaOsbm/9c41lsWHgBCrqCqyII6W
 kDn8uoAxcZx2E4zjKC3LMo2MQwhgT0Oa+vkkoUDizOMnpFbCoEHCstkgrPPqUcdUKCND
 oSd6KuOT4oI0Dx7Bc164UXrg9SNVZoY03dZal3H66zzLp0JF1dSKvPJ7MosNdCZqkki1
 Q3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760028706; x=1760633506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GqmHH018eIDbXC0urYrHMAd6/ShdhXMsPDErX//Tqp0=;
 b=ppHpQp7W2LY5Tu1DWb4CSKLpmUmx5LiTzWj1KGLViVSYEne2Z0fvkBrThfyKIofwGv
 P7jsoa9yWM1+ybXualhrQb8N6TjmusBOHtniPVGlm0/UXXqCzLfisKf0GeZ1vYEgyk9L
 DqyUNYA+JQAlAqrRJGZ/bHDt9HNVUKX2zTQIfDeaPnRzP0AQzwrJeglknlg9WV9egpij
 b4wCmXTAP7pBOexSN5XS4Gk1LWxdEsW6+65A5+BbJy7lS4ecrJV0uzYNmcnI1P7RsP7K
 NHEKjIhp9zpnh/ycZXsz9WSKBlq+TjtzW8ibxy5SoTCxlxC5425duSsHtCwS9KYHZDM8
 Ri+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2j3Xq3NQliwlFcjakNhQfb+vqyUOsfxTBJVYqnMK3WOTa8/CHcXQGmYrKnnD1dqYTPmQ5nPD9sYA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8ICaX99Y5QxVXkXoMdln61oiB2J9IdvSIWHk08U3rmAGe+YPq
 6hVVdGpkRn4rl3m0bknm9iq48EgAhGITDomHFem90NXWG9Ux6mWGX7z8tpwlIY7d0uUisKft8HO
 t6CNezZW4zJbw/JgjsDlmL4Yf8ecbDg0wh4rC
X-Gm-Gg: ASbGnct4lgc3KauiB8JqysFntgVp474/00Dda93QtBaE/SSIjrO0JFuJeH4AE68GZJk
 Wqp9fjmZmptkjrLeRFYAOnMdPMmziYS2YKprsFAlg9PS0Onh23WPJZQlsG5rtdaP8iK6khpia/Q
 PhPGJ/xswWQtq7i57G4Zu88yik+BuyAFZFnhcsjoaAFZIerUf2glSLWj+ufNv9P4TIJxQOa3wGU
 Ax8SgXeX44bV+ltTYK9qx7lGGs5
X-Google-Smtp-Source: AGHT+IFdfU5A2EO1cnO6t/ZSoUtst+Oh7dzaEre8Qcs100m3PE5llEDiXV8JIJAzY40L1zNmGpBDg9bK7AGwDbGfB18=
X-Received: by 2002:a17:903:2c03:b0:269:87a3:43b8 with SMTP id
 d9443c01a7336-290272155c2mr82694885ad.4.1760028705844; Thu, 09 Oct 2025
 09:51:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
 <20251006191329.277485-3-mohamedahmedegypt2001@gmail.com>
 <DDBISJ2DUDF6.150HCB14ZRPH3@kernel.org>
In-Reply-To: <DDBISJ2DUDF6.150HCB14ZRPH3@kernel.org>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Thu, 9 Oct 2025 19:51:34 +0300
X-Gm-Features: AS18NWCagJaEVHXZ5bkGbAUYt9PlzwGuW-LLGeY8ShWGeK5ilLP3wva4ncCA0eo
Message-ID: <CAA+WOBvu2Gq=SM2TBdahsQ-RVi+vn_U-oDa7-DG6kj9Arq5tpA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/nouveau/uvmm: Allow larger pages
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Mary Guillemard <mary@mary.zone>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org
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

Hey,

Thank you so much for the review! I applied everything for v2, except this =
one:

> Let's move the call to select_page_shift() into op_map_prepare().

How would this work? Originally when we were working on this, we did
place it in op_map_prepare() but we ran into the issue where
nouveau_uvmm_vmm_put() needed the page_shift retrieved (see
nouveau_uvmm_sm_prepare_unwind()).

Thanks.

On Mon, Oct 6, 2025 at 11:26=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Mon Oct 6, 2025 at 9:13 PM CEST, Mohamed Ahmed wrote:
> > From: Mary Guillemard <mary@mary.zone>
> >
> > Now that everything in UVMM knows about the variable page shift, we can
> > select larger values.
> >
> > The proposed approach rely on nouveau_bo::page unless it would cause
> > alignment issues (in which case we fall back to searching an appropriat=
e
> > shift)
> >
> > Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> > Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> > Signed-off-by: Mary Guillemard <mary@mary.zone>
>
> NIT: Both of your tags should come after Mary's tag. The same applied to =
some of
> the other patches.
>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_uvmm.c | 55 +++++++++++++++++++++++++-
> >  1 file changed, 53 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/n=
ouveau/nouveau_uvmm.c
> > index a92c729600d6..c336a121e320 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > @@ -454,6 +454,56 @@ op_unmap_prepare_unwind(struct drm_gpuva *va)
> >       drm_gpuva_insert(va->vm, va);
> >  }
> >
> > +static bool
> > +op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 pag=
e_shift)
> > +{
> > +     u64 page_size =3D 1ULL << page_shift;
> > +
> > +     return op->va.addr % page_size =3D=3D 0 && op->va.range % page_si=
ze =3D=3D 0 &&
> > +                op->gem.offset % page_size =3D=3D 0;
> > +}
> > +
> > +static u8
> > +select_page_shift(struct nouveau_uvmm *uvmm, struct drm_gpuva_op_map *=
op)
> > +{
> > +     struct nouveau_bo *nvbo =3D nouveau_gem_object(op->gem.obj);
> > +
> > +     if (nvbo) {
>
> In nouveau a struct drm_gpuva_op_map always has a valid GEM object set; w=
e bail
> out if userspace gives us an invalid GEM handle.
>
> > +             /* If the BO preferred page shift already fits, use it. *=
/
> > +             if (op_map_aligned_to_page_shift(op, nvbo->page))
> > +                     return nvbo->page;
> > +
> > +             struct nouveau_mem *mem =3D nouveau_mem(nvbo->bo.resource=
);
> > +             struct nvif_vmm *vmm =3D &uvmm->vmm.vmm;
> > +             int i;
> > +
> > +             /* Otherwise let's find a granuality that will fit. */
>
> Do we ever run into the "otherwise" case? nouveau_bo_fixup_align() seems =
to
> already ensure that your previous call will never fail?
>
> > +             for (i =3D 0; i < vmm->page_nr; i++) {
> > +                     /* Ignore anything that is bigger or identical to=
 the BO preference. */
> > +                     if (vmm->page[i].shift >=3D nvbo->page)
> > +                             continue;
> > +
> > +                     /* Skip incompatible domains. */
> > +                     if ((mem->mem.type & NVIF_MEM_VRAM) && !vmm->page=
[i].vram)
> > +                             continue;
> > +                     if ((mem->mem.type & NVIF_MEM_HOST) &&
> > +                         (!vmm->page[i].host || vmm->page[i].shift > P=
AGE_SHIFT))
> > +                             continue;
> > +
> > +                     /* If it fits, return the proposed shift. */
> > +                     if (op_map_aligned_to_page_shift(op, vmm->page[i]=
.shift))
> > +                             return vmm->page[i].shift;
> > +             }
> > +
> > +             /* If we get here then nothing can reconcile the requirem=
ents. This should never
> > +              * happen.
> > +              */
> > +             WARN_ON(1);
> > +     }
> > +
> > +     return PAGE_SHIFT;
> > +}
> > +
> >  static void
> >  nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
> >                              struct nouveau_uvma_prealloc *new,
> > @@ -506,7 +556,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm =
*uvmm,
> >                       if (vmm_get_range)
> >                               nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
> >                                                    vmm_get_range,
> > -                                                  PAGE_SHIFT);
> > +                                                  select_page_shift(uv=
mm, &op->map));
> >                       break;
> >               }
> >               case DRM_GPUVA_OP_REMAP: {
> > @@ -636,7 +686,8 @@ nouveau_uvmm_sm_prepare(struct nouveau_uvmm *uvmm,
> >               case DRM_GPUVA_OP_MAP: {
> >                       u64 vmm_get_range =3D vmm_get_end - vmm_get_start=
;
> >
> > -                     ret =3D op_map_prepare(uvmm, &new->map, &op->map,=
 args, PAGE_SHIFT);
> > +                     ret =3D op_map_prepare(uvmm, &new->map, &op->map,=
 args,
> > +                                          select_page_shift(uvmm, &op-=
>map));
>
> Let's move the call to select_page_shift() into op_map_prepare().
>
> >                       if (ret)
> >                               goto unwind;
> >
> > --
> > 2.51.0
>
