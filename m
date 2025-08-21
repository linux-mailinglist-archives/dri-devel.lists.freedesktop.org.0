Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEEDB2F9B4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 15:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A5810E997;
	Thu, 21 Aug 2025 13:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XUBgggiE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA39010E370;
 Thu, 21 Aug 2025 13:13:44 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-323266be64eso70240a91.0; 
 Thu, 21 Aug 2025 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755782024; x=1756386824; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z0ntcUfwQYZElkssDT+Zc1ph10VSWKrgVIAaGKrNC8c=;
 b=XUBgggiE2R/1uBK620yXk2uUUFD7w5magGKdfyRhCbp4n7jarTzOUsKO8y7yufNB9A
 Y+7TFf0t/QAWdglaywvLEhfjIw+ccIJzouZEs92dJ2uxUU1Zeq66G41q3DZpR0V/CVRV
 RCHjMxTFKKlo22zpzBCsbSDZKR3U+8HF06Xv42pM4OX73wt12qecWOcuDMh3GR0tsbEB
 kih0FSNAocQx1WHBCMJje8x3S9r0b2+GxItQfPRq7erlv2jyWe3V5utxbym+Ct91nBcn
 Jo6xn3oWSVr27m5Ny26acbgGGJmk+MI+vn7O2P4pQ6VnJWsyUwIWC9AEfUnfgWjpx5gF
 jupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755782024; x=1756386824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z0ntcUfwQYZElkssDT+Zc1ph10VSWKrgVIAaGKrNC8c=;
 b=af5Kfvr5hnV1rFQlpL+Fuh5Q4175YmqYjL/T6/ClCCsfxBUUl9Ag02/QGMwDFBkgfG
 UMSu5BwZXyaqESQYdKYBHCqpa0Kl86DiGtaHywCSwI+YKsvF6YCzhPZE6J0sfG9CpLjx
 5l8Cvea6LbyNXeV8VPBaH9SxiVdASnk4vShS3CMZz3I1+IbZGBM92lEw1KlNhVYAeRm+
 w+aublSlUrLOlFE5nB9gwmtZRLuNZ/wWlV2tNWS8ddmFPrx1MPVuDbCTPtRu7dfUEvkn
 AMGVS+j19lBjxoPELgjEz/dmQ7RGIBY+YPQ22VsV1IcCs2YCxBg1fpVtSDgTBJvqU7c8
 TllQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDtJaggb++Sg3MWhXk8Dy2iXuPW8dsncYmSSIbXjzreMtOyS+q58Slw4VGEyx3mrewzrcND2LP@lists.freedesktop.org,
 AJvYcCXy3d5zuEJ8AWSkmW97tQiapn+g7KynjybOzalO3EYv8q2SuGbVdOHIKUI6tk3sUMUPiFIUNkDqumq3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxT2842+H11XFa79JAK805xUIqs9osYg9qPc4abRJ5hfLTD/5XK
 SaosHLZ9uUQQDOhprTSc+ceLCfY1BCwqIijQhIk9kzqPMj6W85Vwmg3LZUgFbLsPs332qk2FC6n
 baHd8f+/uHRf01cb/pr7IiQSABHqNMxI=
X-Gm-Gg: ASbGnctsk+O/buV0T1wYYP61910oYmn132gL3sG8BNN1ClFWL9i/UPWfpS2O60bDlY8
 9rKFBRO+9Ij//yT0sukxYoqSbT2rfG7s8uvK5ftd1ArdVJSb4eo6zQr54/k/v20YURfISouONOL
 DNLukMmPMxEy/ahbUDmjmpMfPxBF5W7yzt+RY1W91IJkfwqQdTdKMPl0X34Yb0pVT0A5n2/m9Ra
 LJIILg=
X-Google-Smtp-Source: AGHT+IGoPLySy4CQlyi2yceJUhRDa389vWBpVwrjGS5LP44+dqCLoo64cKkkz+zBdVLQR8Keth1GycSBjmtAvY8xvC4=
X-Received: by 2002:a17:90b:4b87:b0:31e:7f76:c123 with SMTP id
 98e67ed59e1d1-324ed1c269cmr1753231a91.4.1755782024179; Thu, 21 Aug 2025
 06:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250821064031.39090-1-tzimmermann@suse.de>
 <b92c072b-a302-47c8-b2c2-f4b2e3954165@amd.com>
In-Reply-To: <b92c072b-a302-47c8-b2c2-f4b2e3954165@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Aug 2025 09:13:32 -0400
X-Gm-Features: Ac12FXx0qAFooaBAgLtQfQOhqXHxanKSBn5_Pvj3vkfwVoVyKwY0WZ6xYzS_0G4
Message-ID: <CADnq5_PxpsXkzzpa8KJoZL-pBaM2ViVBOaXuYkYyd_xHBNLt9A@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v3] drm/amdgpu: Pin buffers while
 vmap'ing exported dma-buf objects
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, sumit.semwal@linaro.org,
 oushixiong@kylinos.cn, 
 alexander.deucher@amd.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org
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

On Thu, Aug 21, 2025 at 4:52=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
>
>
> On 21.08.25 08:40, Thomas Zimmermann wrote:
> > Current dma-buf vmap semantics require that the mapped buffer remains
> > in place until the corresponding vunmap has completed.
> >
> > For GEM-SHMEM, this used to be guaranteed by a pin operation while crea=
ting
> > an S/G table in import. GEM-SHMEN can now import dma-buf objects withou=
t
> > creating the S/G table, so the pin is missing. Leads to page-fault erro=
rs,
> > such as the one shown below.
> >
> > [  102.101726] BUG: unable to handle page fault for address: ffffc90127=
000000
> > [...]
> > [  102.157102] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> > [...]
> > [  102.243250] Call Trace:
> > [  102.245695]  <TASK>
> > [  102.2477V95]  ? validate_chain+0x24e/0x5e0
> > [  102.251805]  ? __lock_acquire+0x568/0xae0
> > [  102.255807]  udl_render_hline+0x165/0x341 [udl]
> > [  102.260338]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
> > [  102.265379]  ? local_clock_noinstr+0xb/0x100
> > [  102.269642]  ? __lock_release.isra.0+0x16c/0x2e0
> > [  102.274246]  ? mark_held_locks+0x40/0x70
> > [  102.278177]  udl_primary_plane_helper_atomic_update+0x43e/0x680 [udl=
]
> > [  102.284606]  ? __pfx_udl_primary_plane_helper_atomic_update+0x10/0x1=
0 [udl]
> > [  102.291551]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
> > [  102.297208]  ? lockdep_hardirqs_on+0x88/0x130
> > [  102.301554]  ? _raw_spin_unlock_irq+0x24/0x50
> > [  102.305901]  ? wait_for_completion_timeout+0x2bb/0x3a0
> > [  102.311028]  ? drm_atomic_helper_calc_timestamping_constants+0x141/0=
x200
> > [  102.317714]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
> > [  102.323279]  drm_atomic_helper_commit_planes+0x3b6/0x1030
> > [  102.328664]  drm_atomic_helper_commit_tail+0x41/0xb0
> > [  102.333622]  commit_tail+0x204/0x330
> > [...]
> > [  102.529946] ---[ end trace 0000000000000000 ]---
> > [  102.651980] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> >
> > In this stack strace, udl (based on GEM-SHMEM) imported and vmap'ed a
> > dma-buf from amdgpu. Amdgpu relocated the buffer, thereby invalidating =
the
> > mapping.
> >
> > Provide a custom dma-buf vmap method in amdgpu that pins the object bef=
ore
> > mapping it's buffer's pages into kernel address space. Do the opposite =
in
> > vunmap.
> >
> > Note that dma-buf vmap differs from GEM vmap in how it handles relocati=
on.
> > While dma-buf vmap keeps the buffer in place, GEM vmap requires the cal=
ler
> > to keep the buffer in place. Hence, this fix is in amdgpu's dma-buf cod=
e
> > instead of its GEM code.
> >
> > A discussion of various approaches to solving the problem is available
> > at [1].
> >
> > v3:
> > - try (GTT | VRAM); drop CPU domain (Christian)
> > v2:
> > - only use mapable domains (Christian)
> > - try pinning to domains in preferred order
> >
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Fixes: 660cd44659a0 ("drm/shmem-helper: Import dmabuf without mapping i=
ts sg_table")
> > Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> > Closes: https://lore.kernel.org/dri-devel/ba1bdfb8-dbf7-4372-bdcb-df7e0=
511c702@suse.de/
> > Cc: Shixiong Ou <oushixiong@kylinos.cn>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Link: https://lore.kernel.org/dri-devel/9792c6c3-a2b8-4b2b-b5ba-fba19b1=
53e21@suse.de/ # [1]
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thomas did you want to take this through drm-misc or do you want me to
pick this up?

Thanks,

Alex

>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 34 +++++++++++++++++++--
> >  1 file changed, 32 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_dma_buf.c
> > index 5743ebb2f1b7..ce27cb5bb05e 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> > @@ -285,6 +285,36 @@ static int amdgpu_dma_buf_begin_cpu_access(struct =
dma_buf *dma_buf,
> >       return ret;
> >  }
> >
> > +static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys_m=
ap *map)
> > +{
> > +     struct drm_gem_object *obj =3D dma_buf->priv;
> > +     struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> > +     int ret;
> > +
> > +     /*
> > +      * Pin to keep buffer in place while it's vmap'ed. The actual
> > +      * domain is not that important as long as it's mapable. Using
> > +      * GTT and VRAM should be compatible with most use cases.
> > +      */
> > +     ret =3D amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT | AMDGPU_GEM_DOMA=
IN_VRAM);
> > +     if (ret)
> > +             return ret;
> > +     ret =3D drm_gem_dmabuf_vmap(dma_buf, map);
> > +     if (ret)
> > +             amdgpu_bo_unpin(bo);
> > +
> > +     return ret;
> > +}
> > +
> > +static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct iosy=
s_map *map)
> > +{
> > +     struct drm_gem_object *obj =3D dma_buf->priv;
> > +     struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> > +
> > +     drm_gem_dmabuf_vunmap(dma_buf, map);
> > +     amdgpu_bo_unpin(bo);
> > +}
> > +
> >  const struct dma_buf_ops amdgpu_dmabuf_ops =3D {
> >       .attach =3D amdgpu_dma_buf_attach,
> >       .pin =3D amdgpu_dma_buf_pin,
> > @@ -294,8 +324,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops =3D {
> >       .release =3D drm_gem_dmabuf_release,
> >       .begin_cpu_access =3D amdgpu_dma_buf_begin_cpu_access,
> >       .mmap =3D drm_gem_dmabuf_mmap,
> > -     .vmap =3D drm_gem_dmabuf_vmap,
> > -     .vunmap =3D drm_gem_dmabuf_vunmap,
> > +     .vmap =3D amdgpu_dma_buf_vmap,
> > +     .vunmap =3D amdgpu_dma_buf_vunmap,
> >  };
> >
> >  /**
>
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
