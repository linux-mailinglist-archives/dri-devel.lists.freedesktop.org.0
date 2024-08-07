Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A246D94B13A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 22:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1055E10E5C7;
	Wed,  7 Aug 2024 20:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="yvZMZD5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E865410E5C7
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 20:25:17 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a7abe5aa9d5so31656766b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2024 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1723062316; x=1723667116;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AV2R9YJoRPEQwzSJSMjh0XM9eJ4mcbF5R8BcTb65wqo=;
 b=yvZMZD5nYUSt+DbBO2EnLQtD/bc/YGDbxQ71eJmUMNRxgM985qzCmMfo8kmZwBP2hV
 bvwawcDBQ+YhLLyhvXIDUsZGOmfTZEt/l8umIxlSCoZ3wZY05PDZ7ujL5+gnEC9FIYdP
 Jo0UBtyX7PJShXXMtRZ3il3Dsyub+ff6sGXa/ci9sekP3cziGqwpRsmlhYlIWc3G4sXr
 BAo5Q9utMwG8dWDVwKT6XLV1h2fqEamxPVoF0Y1xMyvXd6d4GHTeYAB4otpLH3ouMImf
 92AL1wZRQ0k9DATMBu9lEUqThD5mzpbg7givoqHG6gsbxouPGBpqDImZrQgnxE9uM2cn
 /ogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723062316; x=1723667116;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AV2R9YJoRPEQwzSJSMjh0XM9eJ4mcbF5R8BcTb65wqo=;
 b=aXNzCbgcOp9Pg9C+XwW3z5b2Nzt7rVGIT+Tajz/tMz4NHbnlevsTpMSsz4IeINY1vp
 SZjYR3HXC3+oOCSO48zDC7+ra7EwZwWsQCmpu/irSpLMx/kzjTzal6OFNJv8+ZbhTXnq
 xzXbXpYU3zOHP69jTUgNxJywHPYLHV+WFOkItbUC0bycalLtQjI4c1DGHkMJ62Lf7VUb
 xort52eqrn7F1a0N2Y1LH+D/Si9ZAfNz2Xz0sSL3pmHNg5FHPiw+6E/AhKKxipkFDOYR
 DOXV35Uzkh/A+rYqRmwS4eESQoN2qOgOi4BtBgI4rQMijWxlvLWj4mE3MNrnWK2H2V/l
 IDYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVgaMgZU65DbLLNib3Ep7bra4QD6v5sFdStDQZo/yw7HTo/SzeyDsHwkWGhJfAl3RrI0dIxUWHYTZUzsugVsKGROTKOVABEjBu2LqKBCm0
X-Gm-Message-State: AOJu0YwUPGnCWlNUNN7CdM24Jxio8jwpf3p6bQvvZBM792h+BsneV50U
 C7NSEcyXezG/edoZYOnHZEEhb3nDI7BI9NY3eRNtKZICP1A7pb89SEu+fQVXFHQnIfTeG6/CTYK
 q7Em/n6hqX7+7AOUWNV9ycZmuNg1/C0mgWh7zBw==
X-Google-Smtp-Source: AGHT+IH5LfXSB0sKchrEYUmsdElTi4EBrVulae9k8K7z5CqZ3doTqRWeC//mkEstHX6pJwcvfJ6Q4TitNYXg36IGa9I=
X-Received: by 2002:a17:907:1c14:b0:a7a:a06b:eeca with SMTP id
 a640c23a62f3a-a7dc4dbf217mr1218072866b.12.1723062315711; Wed, 07 Aug 2024
 13:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240807153941.3668940-1-faith.ekstrand@collabora.com>
 <B37A903E-E670-4548-BDBB-4651D2DC7D15@froggi.es>
In-Reply-To: <B37A903E-E670-4548-BDBB-4651D2DC7D15@froggi.es>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Wed, 7 Aug 2024 15:25:04 -0500
Message-ID: <CAOFGe95KrOxjaDpvKHGuL8BUoApbpEY-wtH4B1Due4PHiVAv0g@mail.gmail.com>
Subject: Re: [RFC] amdgpu: Add a context flag to disable implicit sync
To: Joshua Ashton <joshua@froggi.es>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: multipart/alternative; boundary="00000000000041167c061f1db54f"
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

--00000000000041167c061f1db54f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 7, 2024 at 2:23=E2=80=AFPM Joshua Ashton <joshua@froggi.es> wro=
te:

> I was thinking about this more recently. I was initially considering
> "maybe this should be a per-BO import," but I couldn't think of anything =
in
> the GL model that would actually benefit given its not "true" bindless an=
d
> there's no update-after-bind there.
>

That's also an option and it's the way it works on i915. However, then you
have to pass lists of things to the kernel and that's kinda gross. If we
need it, we can do that. Otherwise, I think a more global thing is fine.  I
think Bas is currently investigating a per-submit approach which is a tad
different from either but should also work okay.


> Worth others more familiar with GL asking that question to themselves
> also. I am definitely not totally up on what's possible there.
>
> Overall, I think I am OK with this approach, even though I think mixing
> implicit and explicit sync is gross, and I want the pain that is implicit
> sync to just go away forever. :-)
>

So say we all...

~Faith



> - Joshie =F0=9F=90=B8=E2=9C=A8
>
>
> On August 7, 2024 4:39:32 PM GMT+01:00, Faith Ekstrand <
> faith@gfxstrand.net> wrote:
> >Previously, AMDGPU_GEM_CREATE_EXPLICIT_SYNC was used to disable implicit
> >synchronization on BOs when explicit synchronization can be used.  The
> >problem is that this flag is per-BO and affects all amdgpu users in the
> >system, not just the usermode drver which sets it.  This can lead to
> >some unintended consequences for userspace if not used carefully.
> >
> >Since the introduction of DMA_BUF_IOCTL_EXPORT_SYNC_FILE and
> >DMA_BUF_IOCTL_IMPORT_SYNC_FILE, many userspace window system components
> >have grown the ability to convert between the Vulkan explicit sync model
> >and the legacy implicit sync model used by X11 and Wayland in the past.
> >This allows both old and new components to exist simultaneously and talk
> >to each other.  In particular, XWayland is able to convert between the
> >two to let Vulkan apps work seamlessly with older X11 compositors that
> >aren't aware of explicit synchronizaiton.  This is rapidly becoming the
> >backbone of synchronization in the Linux window system space.
> >
> >Unfortunately, AMDGPU_GEM_CREATE_EXPLICIT_SYNC breaks this because it
> >disables all implicit synchronization on the given BO, regardless of
> >which userspace driver is rendering with it and regardless of the
> >assumptions made by the client application.  In particular, this is
> >causing issues with RADV and radeonsi.  RADV sets the flag to disable
> >implicit sync on window system buffers so that it can safely have them
> >resident at all times without causing internal over-synchronization.
> >The BO is then handed off to a compositor which composites using
> >radeonsi.  If the compositor uses the EGL_ANDROID_native_fence_sync
> >extension to pass explicit sync files through to radeonsi, then
> >everything is fine.  However, if that buffer ever gets handed to an
> >instance of radeonsi with any assumption of implicit synchronization,
> >radeonsi won't be able sync on the BO because RADV disabled implict sync
> >on that BO system-wide.  It doesn't matter whether some window system
> >component used DMA_BUF_IOCTL_IMPORT_SYNC_FILE to set the appropriate
> >fence on the BO, amdgpu will ignore it.
> >
> >This new flag disables implicit sync on the context rather than the BO.
> >This way RADV can disable implicit sync (which is what RADV has always
> >wanted) without affecting other components in the system.  If RADV (or
> >some other driver) wants implicit sync on some BO, it can use
> >DMA_BUF_IOCTL_EXPORT_SYNC_FILE and DMA_BUF_IOCTL_IMPORT_SYNC_FILE to
> >manually synchronize with other implicit-sync components.  This is the
> >approach we've taken with NVK/nouveau, ANV/xe, and similar to the
> >approach taken by ANV/i915 and it works well for those drivers.
> >
> >Ideally, I would like to see something like this back-ported to at least
> >the kernel where DMA_BUF_IOCTL_IMPORT/EXPORT_SYNC_FILE were introduced
> >so that we don't have to wait another year for the fix to reach users.
> >However, I understand that back-porting UAPI is problematic and I'll
> >leave that decision up to the amdgpu maintainers.  Michel suggested that
> >a new CTX_OP would make more sense if we want to back-port it but the
> >create flag made more sense to me from an API design PoV.
> >
> >Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
> >Cc: Alex Deucher <alexander.deucher@amd.com>
> >Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >Cc: David Airlie <airlied@gmail.com>
> >Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> >---
> > drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  3 ++-
> > drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 12 ++++++++----
> > drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  7 +++++++
> > include/uapi/drm/amdgpu_drm.h           | 12 +++++++++++-
> > 4 files changed, 28 insertions(+), 6 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >index ec888fc6ead8..8410b4426541 100644
> >--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> >@@ -1196,7 +1196,8 @@ static int amdgpu_cs_sync_rings(struct
> amdgpu_cs_parser *p)
> >               struct dma_resv *resv =3D bo->tbo.base.resv;
> >               enum amdgpu_sync_mode sync_mode;
> >
> >-              sync_mode =3D amdgpu_bo_explicit_sync(bo) ?
> >+              sync_mode =3D (amdgpu_ctx_explicit_sync(p->ctx) ||
> >+                           amdgpu_bo_explicit_sync(bo)) ?
> >                       AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
> >               r =3D amdgpu_sync_resv(p->adev, &p->sync, resv, sync_mode=
,
> >                                    &fpriv->vm);
> >diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> >index 5cb33ac99f70..a304740ccedf 100644
> >--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> >+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> >@@ -318,7 +318,8 @@ static int amdgpu_ctx_get_stable_pstate(struct
> amdgpu_ctx *ctx,
> > }
> >
> > static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t priority=
,
> >-                         struct drm_file *filp, struct amdgpu_ctx *ctx)
> >+                         uint32_t flags, struct drm_file *filp,
> >+                         struct amdgpu_ctx *ctx)
> > {
> >       struct amdgpu_fpriv *fpriv =3D filp->driver_priv;
> >       u32 current_stable_pstate;
> >@@ -334,6 +335,7 @@ static int amdgpu_ctx_init(struct amdgpu_ctx_mgr
> *mgr, int32_t priority,
> >       ctx->mgr =3D mgr;
> >       spin_lock_init(&ctx->ring_lock);
> >
> >+      ctx->flags =3D flags;
> >       ctx->reset_counter =3D atomic_read(&mgr->adev->gpu_reset_counter)=
;
> >       ctx->reset_counter_query =3D ctx->reset_counter;
> >       ctx->generation =3D amdgpu_vm_generation(mgr->adev, &fpriv->vm);
> >@@ -474,6 +476,7 @@ static int amdgpu_ctx_alloc(struct amdgpu_device
> *adev,
> >                           struct amdgpu_fpriv *fpriv,
> >                           struct drm_file *filp,
> >                           int32_t priority,
> >+                          uint32_t flags,
> >                           uint32_t *id)
> > {
> >       struct amdgpu_ctx_mgr *mgr =3D &fpriv->ctx_mgr;
> >@@ -493,7 +496,7 @@ static int amdgpu_ctx_alloc(struct amdgpu_device
> *adev,
> >       }
> >
> >       *id =3D (uint32_t)r;
> >-      r =3D amdgpu_ctx_init(mgr, priority, filp, ctx);
> >+      r =3D amdgpu_ctx_init(mgr, priority, flags, filp, ctx);
> >       if (r) {
> >               idr_remove(&mgr->ctx_handles, *id);
> >               *id =3D 0;
> >@@ -666,7 +669,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void
> *data,
> >                    struct drm_file *filp)
> > {
> >       int r;
> >-      uint32_t id, stable_pstate;
> >+      uint32_t id, stable_pstate, flags;
> >       int32_t priority;
> >
> >       union drm_amdgpu_ctx *args =3D data;
> >@@ -675,6 +678,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void
> *data,
> >
> >       id =3D args->in.ctx_id;
> >       priority =3D args->in.priority;
> >+      flags =3D args->in.flags;
> >
> >       /* For backwards compatibility, we need to accept ioctls with
> garbage
> >        * in the priority field. Garbage values in the priority field,
> result
> >@@ -685,7 +689,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void
> *data,
> >
> >       switch (args->in.op) {
> >       case AMDGPU_CTX_OP_ALLOC_CTX:
> >-              r =3D amdgpu_ctx_alloc(adev, fpriv, filp, priority, &id);
> >+              r =3D amdgpu_ctx_alloc(adev, fpriv, filp, priority, flags=
,
> &id);
> >               args->out.alloc.ctx_id =3D id;
> >               break;
> >       case AMDGPU_CTX_OP_FREE_CTX:
> >diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> >index 85376baaa92f..9431c8d2ea59 100644
> >--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> >+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
> >@@ -45,6 +45,7 @@ struct amdgpu_ctx_entity {
> > struct amdgpu_ctx {
> >       struct kref                     refcount;
> >       struct amdgpu_ctx_mgr           *mgr;
> >+      uint32_t                        flags;
> >       unsigned                        reset_counter;
> >       unsigned                        reset_counter_query;
> >       uint64_t                        generation;
> >@@ -84,6 +85,12 @@ struct dma_fence *amdgpu_ctx_get_fence(struct
> amdgpu_ctx *ctx,
> > bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio);
> > void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t
> ctx_prio);
> >
> >+static inline bool
> >+amdgpu_ctx_explicit_sync(struct amdgpu_ctx *ctx)
> >+{
> >+      return ctx->flags & AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC;
> >+}
> >+
> > int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
> >                    struct drm_file *filp);
> >
> >diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm=
.h
> >index 96e32dafd4f0..e9d87a6e3d86 100644
> >--- a/include/uapi/drm/amdgpu_drm.h
> >+++ b/include/uapi/drm/amdgpu_drm.h
> >@@ -125,7 +125,14 @@ extern "C" {
> > #define AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS     (1 << 5)
> > /* Flag that BO is always valid in this VM */
> > #define AMDGPU_GEM_CREATE_VM_ALWAYS_VALID     (1 << 6)
> >-/* Flag that BO sharing will be explicitly synchronized */
> >+/* Flag that BO sharing will be explicitly synchronized
> >+ *
> >+ * This flag should not be used unless the client can guarantee that no
> >+ * other driver which ever touches this BO will ever want to use implic=
it
> >+ * synchronization as it disables implicit sync on this BO system-wide.
> >+ * Instead, drivers which use an explicit synchronization model should
> >+ * prefer AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC.
> >+ */
> > #define AMDGPU_GEM_CREATE_EXPLICIT_SYNC               (1 << 7)
> > /* Flag that indicates allocating MQD gart on GFX9, where the mtype
> >  * for the second page onward should be set to NC. It should never
> >@@ -240,6 +247,9 @@ union drm_amdgpu_bo_list {
> > #define AMDGPU_CTX_OP_GET_STABLE_PSTATE       5
> > #define AMDGPU_CTX_OP_SET_STABLE_PSTATE       6
> >
> >+/* indicate that all synchronization will be explicit */
> >+#define AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC (1<<0)
> >+
> > /* GPU reset status */
> > #define AMDGPU_CTX_NO_RESET           0
> > /* this the context caused it */
>

--00000000000041167c061f1db54f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, Aug 7, 2024 at 2:23=E2=80=AFPM Joshua Ashton &lt;<a href=3D"=
mailto:joshua@froggi.es">joshua@froggi.es</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">I was thinking about this more rec=
ently. I was initially considering &quot;maybe this should be a per-BO impo=
rt,&quot; but I couldn&#39;t think of anything in the GL model that would a=
ctually benefit given its not &quot;true&quot; bindless and there&#39;s no =
update-after-bind there.<br></blockquote><div><br></div><div>That&#39;s als=
o an option and it&#39;s the way it works on i915. However, then you have t=
o pass lists of things to the kernel and that&#39;s kinda gross. If we need=
 it, we can do that. Otherwise, I think a more global thing is fine.=C2=A0 =
I think Bas is currently investigating a per-submit approach which is a tad=
 different from either but should also work okay.<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Worth others more familiar with GL asking that question to themselves also.=
 I am definitely not totally up on what&#39;s possible there.<br>
<br>
Overall, I think I am OK with this approach, even though I think mixing imp=
licit and explicit sync is gross, and I want the pain that is implicit sync=
 to just go away forever. :-)<br></blockquote><div><br></div><div>So say we=
 all...</div><div><br></div><div>~Faith</div><div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
- Joshie =F0=9F=90=B8=E2=9C=A8<br>
<br>
<br>
On August 7, 2024 4:39:32 PM GMT+01:00, Faith Ekstrand &lt;<a href=3D"mailt=
o:faith@gfxstrand.net" target=3D"_blank">faith@gfxstrand.net</a>&gt; wrote:=
<br>
&gt;Previously, AMDGPU_GEM_CREATE_EXPLICIT_SYNC was used to disable implici=
t<br>
&gt;synchronization on BOs when explicit synchronization can be used.=C2=A0=
 The<br>
&gt;problem is that this flag is per-BO and affects all amdgpu users in the=
<br>
&gt;system, not just the usermode drver which sets it.=C2=A0 This can lead =
to<br>
&gt;some unintended consequences for userspace if not used carefully.<br>
&gt;<br>
&gt;Since the introduction of DMA_BUF_IOCTL_EXPORT_SYNC_FILE and<br>
&gt;DMA_BUF_IOCTL_IMPORT_SYNC_FILE, many userspace window system components=
<br>
&gt;have grown the ability to convert between the Vulkan explicit sync mode=
l<br>
&gt;and the legacy implicit sync model used by X11 and Wayland in the past.=
<br>
&gt;This allows both old and new components to exist simultaneously and tal=
k<br>
&gt;to each other.=C2=A0 In particular, XWayland is able to convert between=
 the<br>
&gt;two to let Vulkan apps work seamlessly with older X11 compositors that<=
br>
&gt;aren&#39;t aware of explicit synchronizaiton.=C2=A0 This is rapidly bec=
oming the<br>
&gt;backbone of synchronization in the Linux window system space.<br>
&gt;<br>
&gt;Unfortunately, AMDGPU_GEM_CREATE_EXPLICIT_SYNC breaks this because it<b=
r>
&gt;disables all implicit synchronization on the given BO, regardless of<br=
>
&gt;which userspace driver is rendering with it and regardless of the<br>
&gt;assumptions made by the client application.=C2=A0 In particular, this i=
s<br>
&gt;causing issues with RADV and radeonsi.=C2=A0 RADV sets the flag to disa=
ble<br>
&gt;implicit sync on window system buffers so that it can safely have them<=
br>
&gt;resident at all times without causing internal over-synchronization.<br=
>
&gt;The BO is then handed off to a compositor which composites using<br>
&gt;radeonsi.=C2=A0 If the compositor uses the EGL_ANDROID_native_fence_syn=
c<br>
&gt;extension to pass explicit sync files through to radeonsi, then<br>
&gt;everything is fine.=C2=A0 However, if that buffer ever gets handed to a=
n<br>
&gt;instance of radeonsi with any assumption of implicit synchronization,<b=
r>
&gt;radeonsi won&#39;t be able sync on the BO because RADV disabled implict=
 sync<br>
&gt;on that BO system-wide.=C2=A0 It doesn&#39;t matter whether some window=
 system<br>
&gt;component used DMA_BUF_IOCTL_IMPORT_SYNC_FILE to set the appropriate<br=
>
&gt;fence on the BO, amdgpu will ignore it.<br>
&gt;<br>
&gt;This new flag disables implicit sync on the context rather than the BO.=
<br>
&gt;This way RADV can disable implicit sync (which is what RADV has always<=
br>
&gt;wanted) without affecting other components in the system.=C2=A0 If RADV=
 (or<br>
&gt;some other driver) wants implicit sync on some BO, it can use<br>
&gt;DMA_BUF_IOCTL_EXPORT_SYNC_FILE and DMA_BUF_IOCTL_IMPORT_SYNC_FILE to<br=
>
&gt;manually synchronize with other implicit-sync components.=C2=A0 This is=
 the<br>
&gt;approach we&#39;ve taken with NVK/nouveau, ANV/xe, and similar to the<b=
r>
&gt;approach taken by ANV/i915 and it works well for those drivers.<br>
&gt;<br>
&gt;Ideally, I would like to see something like this back-ported to at leas=
t<br>
&gt;the kernel where DMA_BUF_IOCTL_IMPORT/EXPORT_SYNC_FILE were introduced<=
br>
&gt;so that we don&#39;t have to wait another year for the fix to reach use=
rs.<br>
&gt;However, I understand that back-porting UAPI is problematic and I&#39;l=
l<br>
&gt;leave that decision up to the amdgpu maintainers.=C2=A0 Michel suggeste=
d that<br>
&gt;a new CTX_OP would make more sense if we want to back-port it but the<b=
r>
&gt;create flag made more sense to me from an API design PoV.<br>
&gt;<br>
&gt;Signed-off-by: Faith Ekstrand &lt;<a href=3D"mailto:faith.ekstrand@coll=
abora.com" target=3D"_blank">faith.ekstrand@collabora.com</a>&gt;<br>
&gt;Cc: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com" targe=
t=3D"_blank">alexander.deucher@amd.com</a>&gt;<br>
&gt;Cc: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@amd.com=
" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
&gt;Cc: David Airlie &lt;<a href=3D"mailto:airlied@gmail.com" target=3D"_bl=
ank">airlied@gmail.com</a>&gt;<br>
&gt;Cc: Michel D=C3=A4nzer &lt;<a href=3D"mailto:mdaenzer@redhat.com" targe=
t=3D"_blank">mdaenzer@redhat.com</a>&gt;<br>
&gt;Cc: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl" ta=
rget=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;<br>
&gt;---<br>
&gt; drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0 |=C2=A0 3 ++-<br>
&gt; drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 12 ++++++++----<br>
&gt; drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |=C2=A0 7 +++++++<br>
&gt; include/uapi/drm/amdgpu_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 12 +++++++++++-<br>
&gt; 4 files changed, 28 insertions(+), 6 deletions(-)<br>
&gt;<br>
&gt;diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_cs.c<br>
&gt;index ec888fc6ead8..8410b4426541 100644<br>
&gt;--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
&gt;+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
&gt;@@ -1196,7 +1196,8 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_=
parser *p)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_resv =
*resv =3D bo-&gt;tbo.base.resv;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enum amdgpu_sync=
_mode sync_mode;<br>
&gt; <br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sync_mode =3D amdgpu_=
bo_explicit_sync(bo) ?<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sync_mode =3D (amdgpu=
_ctx_explicit_sync(p-&gt;ctx) ||<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0amdgpu_bo_explicit_sync(bo)) ?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D amdgpu_syn=
c_resv(p-&gt;adev, &amp;p-&gt;sync, resv, sync_mode,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;fpriv-&gt;vm);=
<br>
&gt;diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ctx.c<br>
&gt;index 5cb33ac99f70..a304740ccedf 100644<br>
&gt;--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c<br>
&gt;+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c<br>
&gt;@@ -318,7 +318,8 @@ static int amdgpu_ctx_get_stable_pstate(struct amdg=
pu_ctx *ctx,<br>
&gt; }<br>
&gt; <br>
&gt; static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t priorit=
y,<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0struct drm_file *filp, struct amdgpu_ctx *ctx)<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uint32_t flags, struct drm_file *filp,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0struct amdgpu_ctx *ctx)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_fpriv *fpriv =3D filp-&gt;driv=
er_priv;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 current_stable_pstate;<br>
&gt;@@ -334,6 +335,7 @@ static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *m=
gr, int32_t priority,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;mgr =3D mgr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;ctx-&gt;ring_lock);<br>
&gt; <br>
&gt;+=C2=A0 =C2=A0 =C2=A0 ctx-&gt;flags =3D flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;reset_counter =3D atomic_read(&amp;m=
gr-&gt;adev-&gt;gpu_reset_counter);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;reset_counter_query =3D ctx-&gt;rese=
t_counter;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;generation =3D amdgpu_vm_generation(=
mgr-&gt;adev, &amp;fpriv-&gt;vm);<br>
&gt;@@ -474,6 +476,7 @@ static int amdgpu_ctx_alloc(struct amdgpu_device *a=
dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_fpriv *fpriv,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *filp,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t priority,<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 uint32_t flags,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *id)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_ctx_mgr *mgr =3D &amp;fpriv-&g=
t;ctx_mgr;<br>
&gt;@@ -493,7 +496,7 @@ static int amdgpu_ctx_alloc(struct amdgpu_device *a=
dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*id =3D (uint32_t)r;<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 r =3D amdgpu_ctx_init(mgr, priority, filp, ctx);<=
br>
&gt;+=C2=A0 =C2=A0 =C2=A0 r =3D amdgpu_ctx_init(mgr, priority, flags, filp,=
 ctx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idr_remove(&amp;=
mgr-&gt;ctx_handles, *id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*id =3D 0;<br>
&gt;@@ -666,7 +669,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *=
data,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct drm_file *filp)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 uint32_t id, stable_pstate;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 uint32_t id, stable_pstate, flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t priority;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0union drm_amdgpu_ctx *args =3D data;<br>
&gt;@@ -675,6 +678,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *=
data,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D args-&gt;in.ctx_id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0priority =3D args-&gt;in.priority;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 flags =3D args-&gt;in.flags;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* For backwards compatibility, we need to a=
ccept ioctls with garbage<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * in the priority field. Garbage values in =
the priority field, result<br>
&gt;@@ -685,7 +689,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void *=
data,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (args-&gt;in.op) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case AMDGPU_CTX_OP_ALLOC_CTX:<br>
&gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D amdgpu_ctx_allo=
c(adev, fpriv, filp, priority, &amp;id);<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D amdgpu_ctx_allo=
c(adev, fpriv, filp, priority, flags, &amp;id);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args-&gt;out.all=
oc.ctx_id =3D id;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case AMDGPU_CTX_OP_FREE_CTX:<br>
&gt;diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ctx.h<br>
&gt;index 85376baaa92f..9431c8d2ea59 100644<br>
&gt;--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h<br>
&gt;+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h<br>
&gt;@@ -45,6 +45,7 @@ struct amdgpu_ctx_entity {<br>
&gt; struct amdgpu_ctx {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct kref=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0refcount;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_ctx_mgr=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0*mgr;<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset_counter;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reset_counter_query;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 generation;<br>
&gt;@@ -84,6 +85,12 @@ struct dma_fence *amdgpu_ctx_get_fence(struct amdgpu=
_ctx *ctx,<br>
&gt; bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio);<br>
&gt; void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t ctx_=
prio);<br>
&gt; <br>
&gt;+static inline bool<br>
&gt;+amdgpu_ctx_explicit_sync(struct amdgpu_ctx *ctx)<br>
&gt;+{<br>
&gt;+=C2=A0 =C2=A0 =C2=A0 return ctx-&gt;flags &amp; AMDGPU_CTX_ALLOC_FLAGS=
_EXPLICIT_SYNC;<br>
&gt;+}<br>
&gt;+<br>
&gt; int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
truct drm_file *filp);<br>
&gt; <br>
&gt;diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_dr=
m.h<br>
&gt;index 96e32dafd4f0..e9d87a6e3d86 100644<br>
&gt;--- a/include/uapi/drm/amdgpu_drm.h<br>
&gt;+++ b/include/uapi/drm/amdgpu_drm.h<br>
&gt;@@ -125,7 +125,14 @@ extern &quot;C&quot; {<br>
&gt; #define AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS=C2=A0 =C2=A0 =C2=A0(1 &lt;&l=
t; 5)<br>
&gt; /* Flag that BO is always valid in this VM */<br>
&gt; #define AMDGPU_GEM_CREATE_VM_ALWAYS_VALID=C2=A0 =C2=A0 =C2=A0(1 &lt;&l=
t; 6)<br>
&gt;-/* Flag that BO sharing will be explicitly synchronized */<br>
&gt;+/* Flag that BO sharing will be explicitly synchronized<br>
&gt;+ *<br>
&gt;+ * This flag should not be used unless the client can guarantee that n=
o<br>
&gt;+ * other driver which ever touches this BO will ever want to use impli=
cit<br>
&gt;+ * synchronization as it disables implicit sync on this BO system-wide=
.<br>
&gt;+ * Instead, drivers which use an explicit synchronization model should=
<br>
&gt;+ * prefer AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC.<br>
&gt;+ */<br>
&gt; #define AMDGPU_GEM_CREATE_EXPLICIT_SYNC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 7)<br>
&gt; /* Flag that indicates allocating MQD gart on GFX9, where the mtype<br=
>
&gt;=C2=A0 * for the second page onward should be set to NC. It should neve=
r<br>
&gt;@@ -240,6 +247,9 @@ union drm_amdgpu_bo_list {<br>
&gt; #define AMDGPU_CTX_OP_GET_STABLE_PSTATE=C2=A0 =C2=A0 =C2=A0 =C2=A05<br=
>
&gt; #define AMDGPU_CTX_OP_SET_STABLE_PSTATE=C2=A0 =C2=A0 =C2=A0 =C2=A06<br=
>
&gt; <br>
&gt;+/* indicate that all synchronization will be explicit */<br>
&gt;+#define AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC (1&lt;&lt;0)<br>
&gt;+<br>
&gt; /* GPU reset status */<br>
&gt; #define AMDGPU_CTX_NO_RESET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00<=
br>
&gt; /* this the context caused it */<br>
</blockquote></div></div>

--00000000000041167c061f1db54f--
