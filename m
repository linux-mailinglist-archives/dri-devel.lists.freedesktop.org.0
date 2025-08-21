Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5767BB2FC08
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 16:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652FB10E9A4;
	Thu, 21 Aug 2025 14:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Lf1sohTK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D00F10E9A4;
 Thu, 21 Aug 2025 14:13:22 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-24602f6d8b6so1259225ad.1; 
 Thu, 21 Aug 2025 07:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755785601; x=1756390401; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ewQnvlqhN4ny32MfAw6z/qV7rnt0Pvo8EUPrCTIPPWU=;
 b=Lf1sohTKiTiWPrzNAR4945xvTonyKhzxJXeWICc1e7KqNWcY8X3UUBq+/eoRqzUTMr
 UIOJzfJu8DKbuIXx3AdNWFu6HN3Nje4UFaQsrZmfUAUyInfH++AsxGSD0riD/mK1lA9q
 uT6U2lSt6mVkDyjs2LbKNYPHaL52aQcgwY6p47RC6wGDsdK75fLYcyD8/aYjckhi2ojY
 pbu5GI7+Q7ZqjZRU8FyL3MYQycw6pRHIwq5wabW5SXxoTNCqtmBAcXnBZWDx3mxcnGUA
 0Qi+xQGVbdC7Gue9YS3aRMKJ+a2gzDZNcTkI5DaA4zH1tVIJGQnoJI1/VEDaxQbzl8Sr
 swkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755785601; x=1756390401;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ewQnvlqhN4ny32MfAw6z/qV7rnt0Pvo8EUPrCTIPPWU=;
 b=euzmWUEL84V4jclS4c59G32//awVIyizGHCWsrclx3grvxmkVawSzjzjNsIHFJvVYs
 0ZfyYku30N3788YAR8O3k1gCCEOFDxlM4YzqTR+VYtfNJdOSL5cStAzymdz4d63eQbe5
 cM2v46OTl1bqYO6vljcs/r8EpoSWWGVe0xMuGbHw2QrPPHts9xxos4NXVO61H50gIVZ0
 hudEINmQUBnMdR20pk7J5YaEoYra5gbrs1076DnAKJo/J3Pk87Oe+bopmsPvKPZ1LdEM
 f2uf0GJSvgV7kMRv7Vfo+/WO8+Fjw8ayEco1KgkH3N46lb4fs/z4tHlxvn4M05TOg7CB
 2Hpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKOLTK1tuLx/RUuevqYkZL8sfyVX2DsAQFbgfbQZlvFmy2NSfDQwIokO7ZZJAtF3PcXsAKusaL@lists.freedesktop.org,
 AJvYcCWYiGglNYPONgjuLDvqEjJhwraeFPn/OnyyziZdwuUMaRZNWGKmJWNKSL8MCW7mhYp76CuiAATjzvcg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLx+piwv7vkAOH/hmg6K7cyQ5yPaEt72xMFMi4yuvQhvg6mGfa
 cVJMH9P+HqehyMS6tVJYwJHQRvxVxpwSKlO3ul5Nzu2WHqwV+s1rFkSIZuoc8koTRi2pqBMpnAN
 soDcbBGC7ThSzKoV6ySB06FfFq4Esv9g=
X-Gm-Gg: ASbGncuFal4CSZn4c7GYLvQg099Z79JFUDxOYz8J0jf2voJ8VQu+v70HO92uavdOxEo
 E8aZMjUbYzhkViaq/CZKt0R+YX1ScBiAdkofV/Vr+i7knd4JLbFUsX02ygGXHz3Q5mVctTuok0k
 rj+R/u3ZLdx2Lj0KAKmYTuDHHuKmnrXZGdFthCMxXhohjN+2xnflo7KmYqHJdND4XVI9uv3kRTq
 5/j9oc=
X-Google-Smtp-Source: AGHT+IHRc2aUrbiGENoV07AwMCzaGJhLBFchXgZtLS6TVE0HemOCZi8CwvOia3zy48LcLGITV96Y1WlMOkrR+BKq3g4=
X-Received: by 2002:a17:902:f542:b0:240:4d65:508f with SMTP id
 d9443c01a7336-245fed79629mr24717095ad.6.1755785601462; Thu, 21 Aug 2025
 07:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250821064031.39090-1-tzimmermann@suse.de>
 <b92c072b-a302-47c8-b2c2-f4b2e3954165@amd.com>
 <CADnq5_PxpsXkzzpa8KJoZL-pBaM2ViVBOaXuYkYyd_xHBNLt9A@mail.gmail.com>
 <37cacb29-e382-400c-b4fb-bed733ce480b@suse.de>
In-Reply-To: <37cacb29-e382-400c-b4fb-bed733ce480b@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 21 Aug 2025 10:13:09 -0400
X-Gm-Features: Ac12FXxO3lpLz4bRGPBuj6tXGU7_OsrxRgedUV-m31__xMMSMjZ2TdDfFe7M8D8
Message-ID: <CADnq5_PEXW9J=yVaXEA0VoKPZW48SQj7inLM=wq-nQX+xLP_og@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v3] drm/amdgpu: Pin buffers while
 vmap'ing exported dma-buf objects
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 sumit.semwal@linaro.org, oushixiong@kylinos.cn, alexander.deucher@amd.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
 simona@ffwll.ch, dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
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

On Thu, Aug 21, 2025 at 10:10=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
>
> Hi
>
> Am 21.08.25 um 15:13 schrieb Alex Deucher:
> > On Thu, Aug 21, 2025 at 4:52=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >>
> >> On 21.08.25 08:40, Thomas Zimmermann wrote:
> >>> Current dma-buf vmap semantics require that the mapped buffer remains
> >>> in place until the corresponding vunmap has completed.
> >>>
> >>> For GEM-SHMEM, this used to be guaranteed by a pin operation while cr=
eating
> >>> an S/G table in import. GEM-SHMEN can now import dma-buf objects with=
out
> >>> creating the S/G table, so the pin is missing. Leads to page-fault er=
rors,
> >>> such as the one shown below.
> >>>
> >>> [  102.101726] BUG: unable to handle page fault for address: ffffc901=
27000000
> >>> [...]
> >>> [  102.157102] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> >>> [...]
> >>> [  102.243250] Call Trace:
> >>> [  102.245695]  <TASK>
> >>> [  102.2477V95]  ? validate_chain+0x24e/0x5e0
> >>> [  102.251805]  ? __lock_acquire+0x568/0xae0
> >>> [  102.255807]  udl_render_hline+0x165/0x341 [udl]
> >>> [  102.260338]  ? __pfx_udl_render_hline+0x10/0x10 [udl]
> >>> [  102.265379]  ? local_clock_noinstr+0xb/0x100
> >>> [  102.269642]  ? __lock_release.isra.0+0x16c/0x2e0
> >>> [  102.274246]  ? mark_held_locks+0x40/0x70
> >>> [  102.278177]  udl_primary_plane_helper_atomic_update+0x43e/0x680 [u=
dl]
> >>> [  102.284606]  ? __pfx_udl_primary_plane_helper_atomic_update+0x10/0=
x10 [udl]
> >>> [  102.291551]  ? lockdep_hardirqs_on_prepare.part.0+0x92/0x170
> >>> [  102.297208]  ? lockdep_hardirqs_on+0x88/0x130
> >>> [  102.301554]  ? _raw_spin_unlock_irq+0x24/0x50
> >>> [  102.305901]  ? wait_for_completion_timeout+0x2bb/0x3a0
> >>> [  102.311028]  ? drm_atomic_helper_calc_timestamping_constants+0x141=
/0x200
> >>> [  102.317714]  ? drm_atomic_helper_commit_planes+0x3b6/0x1030
> >>> [  102.323279]  drm_atomic_helper_commit_planes+0x3b6/0x1030
> >>> [  102.328664]  drm_atomic_helper_commit_tail+0x41/0xb0
> >>> [  102.333622]  commit_tail+0x204/0x330
> >>> [...]
> >>> [  102.529946] ---[ end trace 0000000000000000 ]---
> >>> [  102.651980] RIP: 0010:udl_compress_hline16+0x219/0x940 [udl]
> >>>
> >>> In this stack strace, udl (based on GEM-SHMEM) imported and vmap'ed a
> >>> dma-buf from amdgpu. Amdgpu relocated the buffer, thereby invalidatin=
g the
> >>> mapping.
> >>>
> >>> Provide a custom dma-buf vmap method in amdgpu that pins the object b=
efore
> >>> mapping it's buffer's pages into kernel address space. Do the opposit=
e in
> >>> vunmap.
> >>>
> >>> Note that dma-buf vmap differs from GEM vmap in how it handles reloca=
tion.
> >>> While dma-buf vmap keeps the buffer in place, GEM vmap requires the c=
aller
> >>> to keep the buffer in place. Hence, this fix is in amdgpu's dma-buf c=
ode
> >>> instead of its GEM code.
> >>>
> >>> A discussion of various approaches to solving the problem is availabl=
e
> >>> at [1].
> >>>
> >>> v3:
> >>> - try (GTT | VRAM); drop CPU domain (Christian)
> >>> v2:
> >>> - only use mapable domains (Christian)
> >>> - try pinning to domains in preferred order
> >>>
> >>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Fixes: 660cd44659a0 ("drm/shmem-helper: Import dmabuf without mapping=
 its sg_table")
> >>> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Closes: https://lore.kernel.org/dri-devel/ba1bdfb8-dbf7-4372-bdcb-df7=
e0511c702@suse.de/
> >>> Cc: Shixiong Ou <oushixiong@kylinos.cn>
> >>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>> Cc: Maxime Ripard <mripard@kernel.org>
> >>> Cc: David Airlie <airlied@gmail.com>
> >>> Cc: Simona Vetter <simona@ffwll.ch>
> >>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>> Cc: dri-devel@lists.freedesktop.org
> >>> Cc: linux-media@vger.kernel.org
> >>> Cc: linaro-mm-sig@lists.linaro.org
> >>> Link: https://lore.kernel.org/dri-devel/9792c6c3-a2b8-4b2b-b5ba-fba19=
b153e21@suse.de/ # [1]
> >> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Thomas did you want to take this through drm-misc or do you want me to
> > pick this up?
>
> If you haven't send out this week's fixes for amdgpu, you're welcome to
> pick it up. Otherwise I can merge it via drm-misc-fixes next week.

Please go ahead.  I've already sent out my -fixes PR this week.

Alex

>
> Best regards
> Thomas
>
> >
> > Thanks,
> >
> > Alex
> >
> >>> ---
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 34 ++++++++++++++++++=
+--
> >>>   1 file changed, 32 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_dma_buf.c
> >>> index 5743ebb2f1b7..ce27cb5bb05e 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> >>> @@ -285,6 +285,36 @@ static int amdgpu_dma_buf_begin_cpu_access(struc=
t dma_buf *dma_buf,
> >>>        return ret;
> >>>   }
> >>>
> >>> +static int amdgpu_dma_buf_vmap(struct dma_buf *dma_buf, struct iosys=
_map *map)
> >>> +{
> >>> +     struct drm_gem_object *obj =3D dma_buf->priv;
> >>> +     struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> >>> +     int ret;
> >>> +
> >>> +     /*
> >>> +      * Pin to keep buffer in place while it's vmap'ed. The actual
> >>> +      * domain is not that important as long as it's mapable. Using
> >>> +      * GTT and VRAM should be compatible with most use cases.
> >>> +      */
> >>> +     ret =3D amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT | AMDGPU_GEM_DO=
MAIN_VRAM);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +     ret =3D drm_gem_dmabuf_vmap(dma_buf, map);
> >>> +     if (ret)
> >>> +             amdgpu_bo_unpin(bo);
> >>> +
> >>> +     return ret;
> >>> +}
> >>> +
> >>> +static void amdgpu_dma_buf_vunmap(struct dma_buf *dma_buf, struct io=
sys_map *map)
> >>> +{
> >>> +     struct drm_gem_object *obj =3D dma_buf->priv;
> >>> +     struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> >>> +
> >>> +     drm_gem_dmabuf_vunmap(dma_buf, map);
> >>> +     amdgpu_bo_unpin(bo);
> >>> +}
> >>> +
> >>>   const struct dma_buf_ops amdgpu_dmabuf_ops =3D {
> >>>        .attach =3D amdgpu_dma_buf_attach,
> >>>        .pin =3D amdgpu_dma_buf_pin,
> >>> @@ -294,8 +324,8 @@ const struct dma_buf_ops amdgpu_dmabuf_ops =3D {
> >>>        .release =3D drm_gem_dmabuf_release,
> >>>        .begin_cpu_access =3D amdgpu_dma_buf_begin_cpu_access,
> >>>        .mmap =3D drm_gem_dmabuf_mmap,
> >>> -     .vmap =3D drm_gem_dmabuf_vmap,
> >>> -     .vunmap =3D drm_gem_dmabuf_vunmap,
> >>> +     .vmap =3D amdgpu_dma_buf_vmap,
> >>> +     .vunmap =3D amdgpu_dma_buf_vunmap,
> >>>   };
> >>>
> >>>   /**
> >> _______________________________________________
> >> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> >> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
>
