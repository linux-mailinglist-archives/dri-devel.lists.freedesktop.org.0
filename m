Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD92DC2E7CA
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 00:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D5810E4F4;
	Mon,  3 Nov 2025 23:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ibznu8Tz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9EAB10E4F2
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 23:53:45 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-b95cdcacd95so1825024a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 15:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762214025; x=1762818825; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLjxRtSfyBJOMagychkpTepNRla4EVPcURJSVrcQeQY=;
 b=ibznu8TzyvPFnud5KgUBXC9FDCagqi4WEPHPIPDm0l0WK0NxVTudzytMw2jCr0gKDE
 gDRRsn1SqfrllRyzWHYeppMZWzZB42HC1bTSsbTbRKsvO768YZTqzzanXuc4h8hKDjaT
 HRzeEYK1Z5ickU/p38OwKB093EYpBuokU4ZajIJko1AJ8Rw9ANRWSuj9/xszLV1zrpwA
 2a2Cppcu8PlCOrzrZWvwJQjtUm9qftm3BbNMLto21s5VYAnEefFJKJzU4vInOnhIULOw
 1JkjeOY8ZR076jW4wSDhtTvXG4hCDuqDsDB6VLaaeUDhxHEYQfs6X0fbXVG6W+dJ5yfW
 426A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762214025; x=1762818825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yLjxRtSfyBJOMagychkpTepNRla4EVPcURJSVrcQeQY=;
 b=vW023kQYdFvHGvfUW/vuvxj47Sl1LiAUMYw0w0fsF90Gq5FNsSvZJwfRZPoK5kQAze
 bROvzMZ8vBk0Ay/ihS8UKCKtC3YgnqMyI4iwQQyOEPWfZFS88VYD1zEnoIcWjKdThmUq
 VqUfZo+taT1axOtCaCV502cUSJPFKeaNAtm2/0pI5e7Av5Vhp3Rps231+RvEJSZ5jzFv
 tYYdMN7TlpZJTFgUAK6qMcj61eIgStDMYDn2tlXqArqm1DZ0/27djfG1c1VQb1N9OhCo
 ddj5z9CBaerasWCno2uRFo6PxpXb8kAumawlh4fbL9Ix3y5SnCTM/iHNz1wf/VlA62c9
 uHrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbkWD6bRsm7AsKSQZAVRcXMHPH+Irs9/vbHzIrXLJqgQTtioPRMd5vul2SGA7BfSZ4/K9xI7wyz10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5DaOZO013dPfjlphunxSLYWkthgnpl5V3w0ulWbaZLEETdzSR
 kpZfmEzxiZz1TEc20AC8VtWb5OBDeVmoIvWBmaIjB4QzEcFLxnyHhpDxawubMFfDcacMZ2xuy4a
 Gl7JHSeKpEU55RfRdw7Q05o3qPwOzmu0=
X-Gm-Gg: ASbGnctP5jnlieV0OkutjuOetZLCGaqj+kxKVIJr6ep18VR1YQaoTYTjf0snxx8+X8J
 9Z8B8Qkg68pNCMHm2pX/K3kmh6C0B3fvvxQHX2R8v2Chbae/EMoUJYOO8XGt1iEofUgRkkf9NQn
 +NxWkRER4YCqtpkISQ21l3b6dvAls+dNNA1pPQvo7jIuLL6A3Vmf3u7rnmM1RKOb4g4WQqYzKFo
 EILTaQla1qbrSrIIo3YReFJJfmyjHfn4JCeyWKIRol4AJn403naOISd1qfEnGzmwNugF7e0ig==
X-Google-Smtp-Source: AGHT+IFjJMuWOmDjj0eb6+pcmZCA68pLvX3OxhDBYHicRd6uUs/i7l+bHxwzshvHtyXhYzBsiR+VQipKQQKkZ83KoZQ=
X-Received: by 2002:a17:902:e842:b0:295:5a06:308d with SMTP id
 d9443c01a7336-2955a063493mr111188005ad.14.1762214024930; Mon, 03 Nov 2025
 15:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
 <20251031104924.10631-3-mohamedahmedegypt2001@gmail.com>
 <0bffd718-3659-4add-90fc-fb0e098f2897@nvidia.com>
In-Reply-To: <0bffd718-3659-4add-90fc-fb0e098f2897@nvidia.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Tue, 4 Nov 2025 01:53:33 +0200
X-Gm-Features: AWmQ_blaOgJXhX7FTUGULCEM7fLqKNjCy5MDT2wZ0GCoGUGz9IYwhuxzFGdEeJk
Message-ID: <CAA+WOBtmbPHigscFQCFgDo=9WSM6V-JMXGCO7orP=01XOqTPHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm/nouveau/uvmm: Allow larger pages
To: James Jones <jajones@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Mary Guillemard <mary@mary.zone>, Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
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

Thanks a lot for the shout out! Looking more at things, the logic here
is actually redundant. It was originally copied over directly from the
bo allocation code to stay on the safer side (basically the idea back
then was to make both the bo and vmm sides match exactly). We aren't
at risk of having an aligned address that is in the wrong memory type
because the bo allocation code (nouveau_bo.c:321) forces anything that
has the GART flag to have a page size of 4K. Anything getting a page
size higher than that is exclusively VRAM only. Additionally,
currently things marked VRAM only don't get evicted to host memory
except under high memory pressure and in that case, the context is
paused until the objects in question are paged back in, so we also
don't have to worry about memory placement there.

The memory placement check in the vmm code could be removed but I am
leaning more towards leaving it as is just to stay on the safer side.
At the same time, it would be more useful to keep it for the future as
one of the future investigation targets that we want to look into is
all the memory placement rules because the "only 4K is allowed for
host memory" limit that nouveau imposes is a source of many pains in
userspace (originally thought to be a HW thing but seems it's actually
not), and having the checks on both bo and vmm paths would help
starting out with that.

Thanks a lot again,
Mohamed

On Fri, Oct 31, 2025 at 7:01=E2=80=AFPM James Jones <jajones@nvidia.com> wr=
ote:
>
> On 10/31/25 03:49, Mohamed Ahmed wrote:
> > From: Mary Guillemard <mary@mary.zone>
> >
> > Now that everything in UVMM knows about the variable page shift, we can
> > select larger values.
> >
> > The proposed approach relies on nouveau_bo::page unless if it would cau=
se
> > alignment issues (in which case we fall back to searching for an
> > appropriate shift)
> >
> > Signed-off-by: Mary Guillemard <mary@mary.zone>
> > Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> > Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> > ---
> >   drivers/gpu/drm/nouveau/nouveau_uvmm.c | 60 +++++++++++++++++++++++++=
-
> >   1 file changed, 58 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/n=
ouveau/nouveau_uvmm.c
> > index 2cd0835b05e8..ab8933b88337 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> > @@ -454,6 +454,62 @@ op_unmap_prepare_unwind(struct drm_gpuva *va)
> >       drm_gpuva_insert(va->vm, va);
> >   }
> >
> > +static bool
> > +op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 pag=
e_shift)
> > +{
> > +     u64 non_page_bits =3D (1ULL << page_shift) - 1;
> > +
> > +     return (op->va.addr & non_page_bits) =3D=3D 0 &&
> > +            (op->va.range & non_page_bits) =3D=3D 0 &&
> > +            (op->gem.offset & non_page_bits) =3D=3D 0;
> > +}
> > +
> > +static u8
> > +select_page_shift(struct nouveau_uvmm *uvmm, struct drm_gpuva_op_map *=
op)
> > +{
> > +     struct nouveau_bo *nvbo =3D nouveau_gem_object(op->gem.obj);
> > +
> > +     /* nouveau_bo_fixup_align() guarantees that the page size will be=
 aligned
> > +      * for most cases, but it can't handle cases where userspace allo=
cates with
> > +      * a size and then binds with a smaller granularity. So in order =
to avoid
> > +      * breaking old userspace, we need to ensure that the VA is actua=
lly
> > +      * aligned before using it, and if it isn't, then we downgrade to=
 the first
> > +      * granularity that will fit, which is optimal from a correctness=
 and
> > +      * performance perspective.
> > +      */
> > +     if (op_map_aligned_to_page_shift(op, nvbo->page))
> > +             return nvbo->page;
> > +
> > +     struct nouveau_mem *mem =3D nouveau_mem(nvbo->bo.resource);
> > +     struct nvif_vmm *vmm =3D &uvmm->vmm.vmm;
> > +     int i;
> > +
> > +     /* If the given granularity doesn't fit, let's find one that will=
 fit. */
> > +     for (i =3D 0; i < vmm->page_nr; i++) {
> > +             /* Ignore anything that is bigger or identical to the BO =
preference. */
> > +             if (vmm->page[i].shift >=3D nvbo->page)
> > +                     continue;
> > +
> > +             /* Skip incompatible domains. */
> > +             if ((mem->mem.type & NVIF_MEM_VRAM) && !vmm->page[i].vram=
)
> > +                     continue;
> > +             if ((mem->mem.type & NVIF_MEM_HOST) &&
> > +                 (!vmm->page[i].host || vmm->page[i].shift > PAGE_SHIF=
T))
> > +                     continue;
>
> This logic doesn't seem correct. I'm not sure why there's a need to
> limit the page size on the host memory type, but assuming there is due
> to nouveau architecture or HW limitations I'm not aware of, it should be
> applied universally, not just when falling back due to misaligned
> addresses. You can get lucky and have aligned addresses regardless of
> the target page size. Hence, this check would need to precede the above
> early-out for the case where op_map_aligned_to_page_shift() succeeds.
>
> Thanks,
> -James
>
> > +             /* If it fits, return the proposed shift. */
> > +             if (op_map_aligned_to_page_shift(op, vmm->page[i].shift))
> > +                     return vmm->page[i].shift;
> > +     }
> > +
> > +     /* If we get here then nothing can reconcile the requirements. Th=
is should never
> > +      * happen.
> > +      */
> > +     WARN_ON(1);
> > +
> > +     return PAGE_SHIFT;
> > +}
> > +
> >   static void
> >   nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
> >                              struct nouveau_uvma_prealloc *new,
> > @@ -506,7 +562,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm =
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
> > @@ -599,7 +655,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
> >
> >       uvma->region =3D args->region;
> >       uvma->kind =3D args->kind;
> > -     uvma->page_shift =3D PAGE_SHIFT;
> > +     uvma->page_shift =3D select_page_shift(uvmm, op);
> >
> >       drm_gpuva_map(&uvmm->base, &uvma->va, op);
> >
>
