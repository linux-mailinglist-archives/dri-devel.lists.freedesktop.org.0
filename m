Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8AF956E08
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 17:00:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805E710E2B5;
	Mon, 19 Aug 2024 15:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=basnieuwenhuizen.nl header.i=@basnieuwenhuizen.nl header.b="IIZD9ojI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF43A10E2B3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 15:00:12 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-6bf6bf3a536so2550406d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 08:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google; t=1724079612; x=1724684412;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FosrzyUzAYujq+ERKKQcXoIOJ2cH33trvma6oL7dvds=;
 b=IIZD9ojIV/6SRqCwdFDqSgqRJ42dR2NTaVGW7+3pgxxj9F3cfVevJQXStBhbLllOz5
 TGQAFE8yUkC9ssAN90tjSRD0U92eJ+yXM4+QIuiProZ0/rsjw000/pvzACjPWX+MCR7u
 SAfAVvf5wmtZxMmKTf28/O+lSv6yzh9enYmDp3nT5jbzVzL+D2wTzFqu0WaIytYt4qvP
 ebw7cHGkJz2oyIrVzaYxVKf1gmdJOnieWifh2u+2lHz4Sn1GaI3fbM1L2nG8v5svHM0G
 Lhsl4mSiTTNhSr4WPlCeUUA2d7mnDV3JXyvwWJ/QiCLGTV9Cb9/snqGFyRuqKEmH2q+G
 J3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724079612; x=1724684412;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FosrzyUzAYujq+ERKKQcXoIOJ2cH33trvma6oL7dvds=;
 b=gnFJnBOOcn2+ZeObmV2Z4tvRSBI/VzNhlMBozEalIl9dFiDPCAPjtJe3DMeHpTItaN
 uKpbIvm/Wcs4y76UwAT0jXA+GDf5Q6jZS6XiR2357AFTp3iy4aPsVudgdUxgFsxdzq6i
 55Q6KSqRAzhawoBGtaoq8I20q2eY075JR/KUImMy3pvrGSHPM59galOlbuWgT8JDTxmZ
 S+RQkpqc5+3w4WlcOaFhYcnNfElsFfcZ+0UULBuxKZh+9TepMq4/qYjhKA01ajHNspxC
 hK+K4v7Cy0NGnWib09ZfIK09pUYZE0484g7j+GS54NSEsOWyGssCAjX4yzQvbUMNBCmv
 uFVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWct3ZQjpZRq8lYNT3ilyElLGWDMFtD4jXwV0u+ssKoLPB4tpWfTTmJZbARkkuTLMzYjjEZPqu4UvWrXNCSvUbLdM/QLtEEmuOHbTDT45u3
X-Gm-Message-State: AOJu0Yz+4i4pCLGOTj4WDUlpuFRvHX0MwvCfZM1RaGbHteZs7pSl47Mf
 IGF0EZcPfKZJeaA6Abi6McAbPv/zGX2+vATmEo2UgZJLQ6h7qoJyNQkLJQpYuhBK1xRe+ed74/U
 +1QGBxNaveHtHwUjk3s4X/IVvWDNKTSHvrpoDgA==
X-Google-Smtp-Source: AGHT+IFnGLM+5pVmm7MmiOyC2R8ann6O0Hg0sJzjh62IWOvyD3o2fz2QppzkVKAjxW5h9iDlSOV435LcVmjL+YmNCBg=
X-Received: by 2002:a05:6214:5019:b0:6bf:6722:aab3 with SMTP id
 6a1803df08f44-6bf7cf0596emr78002816d6.5.1724079611284; Mon, 19 Aug 2024
 08:00:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240807153941.3668940-1-faith.ekstrand@collabora.com>
 <B37A903E-E670-4548-BDBB-4651D2DC7D15@froggi.es>
 <CAOFGe95KrOxjaDpvKHGuL8BUoApbpEY-wtH4B1Due4PHiVAv0g@mail.gmail.com>
 <CAP+8YyFMxBOSwBNLpcoUw8bsfNdYDiJoYT=8E3B=d3U-c3Am+A@mail.gmail.com>
 <030b487b-a8f9-4046-b546-a60a30ca4eb2@gmail.com>
In-Reply-To: <030b487b-a8f9-4046-b546-a60a30ca4eb2@gmail.com>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Mon, 19 Aug 2024 16:59:58 +0200
Message-ID: <CAP+8YyGJJUOJvL=YSYTS11L7sDgUnBRU63sCanyXnJLfR1NOTQ@mail.gmail.com>
Subject: Re: [RFC] amdgpu: Add a context flag to disable implicit sync
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Faith Ekstrand <faith@gfxstrand.net>, Joshua Ashton <joshua@froggi.es>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000cbbf9806200a90ef"
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

--000000000000cbbf9806200a90ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 4:51=E2=80=AFPM Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> Am 07.08.24 um 22:33 schrieb Bas Nieuwenhuizen:
>
> On Wed, Aug 7, 2024 at 10:25=E2=80=AFPM Faith Ekstrand <faith@gfxstrand.n=
et>
> wrote:
>
>> On Wed, Aug 7, 2024 at 2:23=E2=80=AFPM Joshua Ashton <joshua@froggi.es> =
wrote:
>>
>>> I was thinking about this more recently. I was initially considering
>>> "maybe this should be a per-BO import," but I couldn't think of anythin=
g in
>>> the GL model that would actually benefit given its not "true" bindless =
and
>>> there's no update-after-bind there.
>>>
>>
>> That's also an option and it's the way it works on i915. However, then
>> you have to pass lists of things to the kernel and that's kinda gross. I=
f
>> we need it, we can do that. Otherwise, I think a more global thing is
>> fine.  I think Bas is currently investigating a per-submit approach whic=
h
>> is a tad different from either but should also work okay.
>>
>>
>
> Yeah, I'm working on a per-submit thing (also using BOOKKEEP fences
> instead of using the EXPLICIT wait mode to ensure we also don't add
> implicit fences).
>
>
> Yeah agree. Your implementation with the per submission flag and using
> BOOKKEEP actually sounds like the right thing to do to me as well.
>
> We need to keep in mind that synchronization goes in both ways, e.g.
> explicit->implicit as well as implicit->explicit.
>
> I would rather like to keep the implicit->explicit handling (which this
> patch here completely disables) and only allow the explicit->implicit
> handling (which by using BOOKKEEP fences).
>
> This way it is possible that we still over synchronize for example for a
> double buffered BO is re-used by an explicit client and implicit display
> server, but that's probably not something we should optimize in the first
> place.
>

This oversynchronization actually happens easily as in bindless Vulkan we
have to mark all buffers as "used". We have some hacks to avoid the worst
of it but it can be pretty meh.

In my series on the ML[1] I think I actually got both sides by waiting on
KERNEL fences only and setting BOOKKEEP fences. (Yeah it actually ends up
kinda orthogonal on the sync mode but it is what it is ...).

- Bas

[1]https://patchwork.freedesktop.org/series/137014/


> Regards,
> Christian.
>
>
> We do have a per-BO list on submission already, so we could add things
> there, it is just very annoying to implement as currently at the point we
> do fence wait/signal we lost the association with the BO list. Given that
> I  don't see an use case anytime soon (there are some theoreticals like
> radeonsi might start doing READ usage instead of RW usage with extra
> tracking) I feel it isn't worth that added implementation complexity
>
>
> Worth others more familiar with GL asking that question to themselves
>>> also. I am definitely not totally up on what's possible there.
>>>
>>> Overall, I think I am OK with this approach, even though I think mixing
>>> implicit and explicit sync is gross, and I want the pain that is implic=
it
>>> sync to just go away forever. :-)
>>>
>>
>> So say we all...
>>
>> ~Faith
>>
>>
>>
>>> - Joshie =F0=9F=90=B8=E2=9C=A8
>>>
>>>
>>> On August 7, 2024 4:39:32 PM GMT+01:00, Faith Ekstrand <
>>> faith@gfxstrand.net> wrote:
>>> >Previously, AMDGPU_GEM_CREATE_EXPLICIT_SYNC was used to disable implic=
it
>>> >synchronization on BOs when explicit synchronization can be used.  The
>>> >problem is that this flag is per-BO and affects all amdgpu users in th=
e
>>> >system, not just the usermode drver which sets it.  This can lead to
>>> >some unintended consequences for userspace if not used carefully.
>>> >
>>> >Since the introduction of DMA_BUF_IOCTL_EXPORT_SYNC_FILE and
>>> >DMA_BUF_IOCTL_IMPORT_SYNC_FILE, many userspace window system component=
s
>>> >have grown the ability to convert between the Vulkan explicit sync mod=
el
>>> >and the legacy implicit sync model used by X11 and Wayland in the past=
.
>>> >This allows both old and new components to exist simultaneously and ta=
lk
>>> >to each other.  In particular, XWayland is able to convert between the
>>> >two to let Vulkan apps work seamlessly with older X11 compositors that
>>> >aren't aware of explicit synchronizaiton.  This is rapidly becoming th=
e
>>> >backbone of synchronization in the Linux window system space.
>>> >
>>> >Unfortunately, AMDGPU_GEM_CREATE_EXPLICIT_SYNC breaks this because it
>>> >disables all implicit synchronization on the given BO, regardless of
>>> >which userspace driver is rendering with it and regardless of the
>>> >assumptions made by the client application.  In particular, this is
>>> >causing issues with RADV and radeonsi.  RADV sets the flag to disable
>>> >implicit sync on window system buffers so that it can safely have them
>>> >resident at all times without causing internal over-synchronization.
>>> >The BO is then handed off to a compositor which composites using
>>> >radeonsi.  If the compositor uses the EGL_ANDROID_native_fence_sync
>>> >extension to pass explicit sync files through to radeonsi, then
>>> >everything is fine.  However, if that buffer ever gets handed to an
>>> >instance of radeonsi with any assumption of implicit synchronization,
>>> >radeonsi won't be able sync on the BO because RADV disabled implict sy=
nc
>>> >on that BO system-wide.  It doesn't matter whether some window system
>>> >component used DMA_BUF_IOCTL_IMPORT_SYNC_FILE to set the appropriate
>>> >fence on the BO, amdgpu will ignore it.
>>> >
>>> >This new flag disables implicit sync on the context rather than the BO=
.
>>> >This way RADV can disable implicit sync (which is what RADV has always
>>> >wanted) without affecting other components in the system.  If RADV (or
>>> >some other driver) wants implicit sync on some BO, it can use
>>> >DMA_BUF_IOCTL_EXPORT_SYNC_FILE and DMA_BUF_IOCTL_IMPORT_SYNC_FILE to
>>> >manually synchronize with other implicit-sync components.  This is the
>>> >approach we've taken with NVK/nouveau, ANV/xe, and similar to the
>>> >approach taken by ANV/i915 and it works well for those drivers.
>>> >
>>> >Ideally, I would like to see something like this back-ported to at lea=
st
>>> >the kernel where DMA_BUF_IOCTL_IMPORT/EXPORT_SYNC_FILE were introduced
>>> >so that we don't have to wait another year for the fix to reach users.
>>> >However, I understand that back-porting UAPI is problematic and I'll
>>> >leave that decision up to the amdgpu maintainers.  Michel suggested th=
at
>>> >a new CTX_OP would make more sense if we want to back-port it but the
>>> >create flag made more sense to me from an API design PoV.
>>> >
>>> >Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
>>> >Cc: Alex Deucher <alexander.deucher@amd.com>
>>> >Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>>> >Cc: David Airlie <airlied@gmail.com>
>>> >Cc: Michel D=C3=A4nzer <mdaenzer@redhat.com>
>>> >Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>> >---
>>> > drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  3 ++-
>>> > drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 12 ++++++++----
>>> > drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  7 +++++++
>>> > include/uapi/drm/amdgpu_drm.h           | 12 +++++++++++-
>>> > 4 files changed, 28 insertions(+), 6 deletions(-)
>>> >
>>> >diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> >index ec888fc6ead8..8410b4426541 100644
>>> >--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> >+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> >@@ -1196,7 +1196,8 @@ static int amdgpu_cs_sync_rings(struct
>>> amdgpu_cs_parser *p)
>>> >               struct dma_resv *resv =3D bo->tbo.base.resv;
>>> >               enum amdgpu_sync_mode sync_mode;
>>> >
>>> >-              sync_mode =3D amdgpu_bo_explicit_sync(bo) ?
>>> >+              sync_mode =3D (amdgpu_ctx_explicit_sync(p->ctx) ||
>>> >+                           amdgpu_bo_explicit_sync(bo)) ?
>>> >                       AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
>>> >               r =3D amdgpu_sync_resv(p->adev, &p->sync, resv, sync_mo=
de,
>>> >                                    &fpriv->vm);
>>> >diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> >index 5cb33ac99f70..a304740ccedf 100644
>>> >--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> >+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>>> >@@ -318,7 +318,8 @@ static int amdgpu_ctx_get_stable_pstate(struct
>>> amdgpu_ctx *ctx,
>>> > }
>>> >
>>> > static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t
>>> priority,
>>> >-                         struct drm_file *filp, struct amdgpu_ctx *ct=
x)
>>> >+                         uint32_t flags, struct drm_file *filp,
>>> >+                         struct amdgpu_ctx *ctx)
>>> > {
>>> >       struct amdgpu_fpriv *fpriv =3D filp->driver_priv;
>>> >       u32 current_stable_pstate;
>>> >@@ -334,6 +335,7 @@ static int amdgpu_ctx_init(struct amdgpu_ctx_mgr
>>> *mgr, int32_t priority,
>>> >       ctx->mgr =3D mgr;
>>> >       spin_lock_init(&ctx->ring_lock);
>>> >
>>> >+      ctx->flags =3D flags;
>>> >       ctx->reset_counter =3D atomic_read(&mgr->adev->gpu_reset_counte=
r);
>>> >       ctx->reset_counter_query =3D ctx->reset_counter;
>>> >       ctx->generation =3D amdgpu_vm_generation(mgr->adev, &fpriv->vm)=
;
>>> >@@ -474,6 +476,7 @@ static int amdgpu_ctx_alloc(struct amdgpu_device
>>> *adev,
>>> >                           struct amdgpu_fpriv *fpriv,
>>> >                           struct drm_file *filp,
>>> >                           int32_t priority,
>>> >+                          uint32_t flags,
>>> >                           uint32_t *id)
>>> > {
>>> >       struct amdgpu_ctx_mgr *mgr =3D &fpriv->ctx_mgr;
>>> >@@ -493,7 +496,7 @@ static int amdgpu_ctx_alloc(struct amdgpu_device
>>> *adev,
>>> >       }
>>> >
>>> >       *id =3D (uint32_t)r;
>>> >-      r =3D amdgpu_ctx_init(mgr, priority, filp, ctx);
>>> >+      r =3D amdgpu_ctx_init(mgr, priority, flags, filp, ctx);
>>> >       if (r) {
>>> >               idr_remove(&mgr->ctx_handles, *id);
>>> >               *id =3D 0;
>>> >@@ -666,7 +669,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void
>>> *data,
>>> >                    struct drm_file *filp)
>>> > {
>>> >       int r;
>>> >-      uint32_t id, stable_pstate;
>>> >+      uint32_t id, stable_pstate, flags;
>>> >       int32_t priority;
>>> >
>>> >       union drm_amdgpu_ctx *args =3D data;
>>> >@@ -675,6 +678,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void
>>> *data,
>>> >
>>> >       id =3D args->in.ctx_id;
>>> >       priority =3D args->in.priority;
>>> >+      flags =3D args->in.flags;
>>> >
>>> >       /* For backwards compatibility, we need to accept ioctls with
>>> garbage
>>> >        * in the priority field. Garbage values in the priority field,
>>> result
>>> >@@ -685,7 +689,7 @@ int amdgpu_ctx_ioctl(struct drm_device *dev, void
>>> *data,
>>> >
>>> >       switch (args->in.op) {
>>> >       case AMDGPU_CTX_OP_ALLOC_CTX:
>>> >-              r =3D amdgpu_ctx_alloc(adev, fpriv, filp, priority, &id=
);
>>> >+              r =3D amdgpu_ctx_alloc(adev, fpriv, filp, priority, fla=
gs,
>>> &id);
>>> >               args->out.alloc.ctx_id =3D id;
>>> >               break;
>>> >       case AMDGPU_CTX_OP_FREE_CTX:
>>> >diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>> >index 85376baaa92f..9431c8d2ea59 100644
>>> >--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>> >+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>>> >@@ -45,6 +45,7 @@ struct amdgpu_ctx_entity {
>>> > struct amdgpu_ctx {
>>> >       struct kref                     refcount;
>>> >       struct amdgpu_ctx_mgr           *mgr;
>>> >+      uint32_t                        flags;
>>> >       unsigned                        reset_counter;
>>> >       unsigned                        reset_counter_query;
>>> >       uint64_t                        generation;
>>> >@@ -84,6 +85,12 @@ struct dma_fence *amdgpu_ctx_get_fence(struct
>>> amdgpu_ctx *ctx,
>>> > bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio);
>>> > void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx, int32_t
>>> ctx_prio);
>>> >
>>> >+static inline bool
>>> >+amdgpu_ctx_explicit_sync(struct amdgpu_ctx *ctx)
>>> >+{
>>> >+      return ctx->flags & AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC;
>>> >+}
>>> >+
>>> > int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
>>> >                    struct drm_file *filp);
>>> >
>>> >diff --git a/include/uapi/drm/amdgpu_drm.h
>>> b/include/uapi/drm/amdgpu_drm.h
>>> >index 96e32dafd4f0..e9d87a6e3d86 100644
>>> >--- a/include/uapi/drm/amdgpu_drm.h
>>> >+++ b/include/uapi/drm/amdgpu_drm.h
>>> >@@ -125,7 +125,14 @@ extern "C" {
>>> > #define AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS     (1 << 5)
>>> > /* Flag that BO is always valid in this VM */
>>> > #define AMDGPU_GEM_CREATE_VM_ALWAYS_VALID     (1 << 6)
>>> >-/* Flag that BO sharing will be explicitly synchronized */
>>> >+/* Flag that BO sharing will be explicitly synchronized
>>> >+ *
>>> >+ * This flag should not be used unless the client can guarantee that =
no
>>> >+ * other driver which ever touches this BO will ever want to use
>>> implicit
>>> >+ * synchronization as it disables implicit sync on this BO system-wid=
e.
>>> >+ * Instead, drivers which use an explicit synchronization model shoul=
d
>>> >+ * prefer AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC.
>>> >+ */
>>> > #define AMDGPU_GEM_CREATE_EXPLICIT_SYNC               (1 << 7)
>>> > /* Flag that indicates allocating MQD gart on GFX9, where the mtype
>>> >  * for the second page onward should be set to NC. It should never
>>> >@@ -240,6 +247,9 @@ union drm_amdgpu_bo_list {
>>> > #define AMDGPU_CTX_OP_GET_STABLE_PSTATE       5
>>> > #define AMDGPU_CTX_OP_SET_STABLE_PSTATE       6
>>> >
>>> >+/* indicate that all synchronization will be explicit */
>>> >+#define AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC (1<<0)
>>> >+
>>> > /* GPU reset status */
>>> > #define AMDGPU_CTX_NO_RESET           0
>>> > /* this the context caused it */
>>>
>>
>

--000000000000cbbf9806200a90ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 19, 2024 at 4:51=E2=80=AF=
PM Christian K=C3=B6nig &lt;<a href=3D"mailto:ckoenig.leichtzumerken@gmail.=
com">ckoenig.leichtzumerken@gmail.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div>
    Am 07.08.24 um 22:33 schrieb Bas Nieuwenhuizen:<br>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">On Wed, Aug 7, 2024 at 10:25=E2=80=AFPM Faith Ekst=
rand
          &lt;<a href=3D"mailto:faith@gfxstrand.net" target=3D"_blank">fait=
h@gfxstrand.net</a>&gt;
          wrote:</div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div class=3D"gmail_quote">
                <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 7, 2024 a=
t
                  2:23=E2=80=AFPM Joshua Ashton &lt;<a href=3D"mailto:joshu=
a@froggi.es" target=3D"_blank">joshua@froggi.es</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I
                  was thinking about this more recently. I was initially
                  considering &quot;maybe this should be a per-BO import,&q=
uot;
                  but I couldn&#39;t think of anything in the GL model that
                  would actually benefit given its not &quot;true&quot; bin=
dless
                  and there&#39;s no update-after-bind there.<br>
                </blockquote>
                <div><br>
                </div>
                <div>That&#39;s also an option and it&#39;s the way it work=
s on
                  i915. However, then you have to pass lists of things
                  to the kernel and that&#39;s kinda gross. If we need it,
                  we can do that. Otherwise, I think a more global thing
                  is fine.=C2=A0 I think Bas is currently investigating a
                  per-submit approach which is a tad different from
                  either but should also work okay.<br>
                </div>
                <div>=C2=A0</div>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Yeah, I&#39;m working on a per-submit thing (also using
            BOOKKEEP fences instead of using the EXPLICIT wait mode to
            ensure we also don&#39;t add implicit fences). <br>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Yeah agree. Your implementation with the per submission flag and
    using BOOKKEEP actually sounds like the right thing to do to me as
    well.<br>
    <br>
    We need to keep in mind that synchronization goes in both ways, e.g.
    explicit-&gt;implicit as well as implicit-&gt;explicit.<br>
    <br>
    I would rather like to keep the implicit-&gt;explicit handling
    (which this patch here completely disables) and only allow the
    explicit-&gt;implicit handling (which by using BOOKKEEP fences).<br>
    <br>
    This way it is possible that we still over synchronize for example
    for a double buffered BO is re-used by an explicit client and
    implicit display server, but that&#39;s probably not something we shoul=
d
    optimize in the first place.<br></div></blockquote><div><br></div><div>=
This oversynchronization actually happens easily as in bindless Vulkan we h=
ave to mark all buffers as &quot;used&quot;. We have some hacks to avoid th=
e worst of it but it can be pretty meh.</div><div><br></div><div>In my seri=
es on the ML[1] I think I actually got both sides by waiting on KERNEL fenc=
es only and setting BOOKKEEP fences. (Yeah it actually ends up kinda orthog=
onal on the sync mode but it is what it is ...). <br></div><div><br></div><=
div>- Bas<br></div><div><br></div><div></div><div>[1]<a href=3D"https://pat=
chwork.freedesktop.org/series/137014/">https://patchwork.freedesktop.org/se=
ries/137014/</a></div><div><br> </div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <div>We do have a per-BO list on submission already, so we
            could add things there, it is just very annoying to
            implement as currently at the point we do fence wait/signal
            we lost the association with the BO list. Given that I=C2=A0
            don&#39;t see an use case anytime soon (there are some
            theoreticals like radeonsi might start doing READ usage
            instead of RW usage with extra tracking) I feel it isn&#39;t
            worth that added implementation complexity<br>
          </div>
          <div><br>
          </div>
          <div><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div class=3D"gmail_quote">
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  Worth others more familiar with GL asking that
                  question to themselves also. I am definitely not
                  totally up on what&#39;s possible there.<br>
                  <br>
                  Overall, I think I am OK with this approach, even
                  though I think mixing implicit and explicit sync is
                  gross, and I want the pain that is implicit sync to
                  just go away forever. :-)<br>
                </blockquote>
                <div><br>
                </div>
                <div>So say we all...</div>
                <div><br>
                </div>
                <div>~Faith</div>
                <div><br>
                </div>
                <div>=C2=A0</div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  - Joshie =F0=9F=90=B8=E2=9C=A8<br>
                  <br>
                  <br>
                  On August 7, 2024 4:39:32 PM GMT+01:00, Faith Ekstrand
                  &lt;<a href=3D"mailto:faith@gfxstrand.net" target=3D"_bla=
nk">faith@gfxstrand.net</a>&gt;
                  wrote:<br>
                  &gt;Previously, AMDGPU_GEM_CREATE_EXPLICIT_SYNC was
                  used to disable implicit<br>
                  &gt;synchronization on BOs when explicit
                  synchronization can be used.=C2=A0 The<br>
                  &gt;problem is that this flag is per-BO and affects
                  all amdgpu users in the<br>
                  &gt;system, not just the usermode drver which sets
                  it.=C2=A0 This can lead to<br>
                  &gt;some unintended consequences for userspace if not
                  used carefully.<br>
                  &gt;<br>
                  &gt;Since the introduction of
                  DMA_BUF_IOCTL_EXPORT_SYNC_FILE and<br>
                  &gt;DMA_BUF_IOCTL_IMPORT_SYNC_FILE, many userspace
                  window system components<br>
                  &gt;have grown the ability to convert between the
                  Vulkan explicit sync model<br>
                  &gt;and the legacy implicit sync model used by X11 and
                  Wayland in the past.<br>
                  &gt;This allows both old and new components to exist
                  simultaneously and talk<br>
                  &gt;to each other.=C2=A0 In particular, XWayland is able =
to
                  convert between the<br>
                  &gt;two to let Vulkan apps work seamlessly with older
                  X11 compositors that<br>
                  &gt;aren&#39;t aware of explicit synchronizaiton.=C2=A0 T=
his is
                  rapidly becoming the<br>
                  &gt;backbone of synchronization in the Linux window
                  system space.<br>
                  &gt;<br>
                  &gt;Unfortunately, AMDGPU_GEM_CREATE_EXPLICIT_SYNC
                  breaks this because it<br>
                  &gt;disables all implicit synchronization on the given
                  BO, regardless of<br>
                  &gt;which userspace driver is rendering with it and
                  regardless of the<br>
                  &gt;assumptions made by the client application.=C2=A0 In
                  particular, this is<br>
                  &gt;causing issues with RADV and radeonsi.=C2=A0 RADV set=
s
                  the flag to disable<br>
                  &gt;implicit sync on window system buffers so that it
                  can safely have them<br>
                  &gt;resident at all times without causing internal
                  over-synchronization.<br>
                  &gt;The BO is then handed off to a compositor which
                  composites using<br>
                  &gt;radeonsi.=C2=A0 If the compositor uses the
                  EGL_ANDROID_native_fence_sync<br>
                  &gt;extension to pass explicit sync files through to
                  radeonsi, then<br>
                  &gt;everything is fine.=C2=A0 However, if that buffer eve=
r
                  gets handed to an<br>
                  &gt;instance of radeonsi with any assumption of
                  implicit synchronization,<br>
                  &gt;radeonsi won&#39;t be able sync on the BO because RAD=
V
                  disabled implict sync<br>
                  &gt;on that BO system-wide.=C2=A0 It doesn&#39;t matter w=
hether
                  some window system<br>
                  &gt;component used DMA_BUF_IOCTL_IMPORT_SYNC_FILE to
                  set the appropriate<br>
                  &gt;fence on the BO, amdgpu will ignore it.<br>
                  &gt;<br>
                  &gt;This new flag disables implicit sync on the
                  context rather than the BO.<br>
                  &gt;This way RADV can disable implicit sync (which is
                  what RADV has always<br>
                  &gt;wanted) without affecting other components in the
                  system.=C2=A0 If RADV (or<br>
                  &gt;some other driver) wants implicit sync on some BO,
                  it can use<br>
                  &gt;DMA_BUF_IOCTL_EXPORT_SYNC_FILE and
                  DMA_BUF_IOCTL_IMPORT_SYNC_FILE to<br>
                  &gt;manually synchronize with other implicit-sync
                  components.=C2=A0 This is the<br>
                  &gt;approach we&#39;ve taken with NVK/nouveau, ANV/xe, an=
d
                  similar to the<br>
                  &gt;approach taken by ANV/i915 and it works well for
                  those drivers.<br>
                  &gt;<br>
                  &gt;Ideally, I would like to see something like this
                  back-ported to at least<br>
                  &gt;the kernel where
                  DMA_BUF_IOCTL_IMPORT/EXPORT_SYNC_FILE were introduced<br>
                  &gt;so that we don&#39;t have to wait another year for th=
e
                  fix to reach users.<br>
                  &gt;However, I understand that back-porting UAPI is
                  problematic and I&#39;ll<br>
                  &gt;leave that decision up to the amdgpu maintainers.=C2=
=A0
                  Michel suggested that<br>
                  &gt;a new CTX_OP would make more sense if we want to
                  back-port it but the<br>
                  &gt;create flag made more sense to me from an API
                  design PoV.<br>
                  &gt;<br>
                  &gt;Signed-off-by: Faith Ekstrand &lt;<a href=3D"mailto:f=
aith.ekstrand@collabora.com" target=3D"_blank">faith.ekstrand@collabora.com=
</a>&gt;<br>
                  &gt;Cc: Alex Deucher &lt;<a href=3D"mailto:alexander.deuc=
her@amd.com" target=3D"_blank">alexander.deucher@amd.com</a>&gt;<br>
                  &gt;Cc: Christian K=C3=B6nig &lt;<a href=3D"mailto:christ=
ian.koenig@amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
                  &gt;Cc: David Airlie &lt;<a href=3D"mailto:airlied@gmail.=
com" target=3D"_blank">airlied@gmail.com</a>&gt;<br>
                  &gt;Cc: Michel D=C3=A4nzer &lt;<a href=3D"mailto:mdaenzer=
@redhat.com" target=3D"_blank">mdaenzer@redhat.com</a>&gt;<br>
                  &gt;Cc: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basni=
euwenhuizen.nl" target=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;<br>
                  &gt;---<br>
                  &gt; drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0 |=C2=A0=
 3 ++-<br>
                  &gt; drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 12
                  ++++++++----<br>
                  &gt; drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |=C2=A0 7
                  +++++++<br>
                  &gt; include/uapi/drm/amdgpu_drm.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 12
                  +++++++++++-<br>
                  &gt; 4 files changed, 28 insertions(+), 6 deletions(-)<br=
>
                  &gt;<br>
                  &gt;diff --git
                  a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
                  b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
                  &gt;index ec888fc6ead8..8410b4426541 100644<br>
                  &gt;--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
                  &gt;+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
                  &gt;@@ -1196,7 +1196,8 @@ static int
                  amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0struct dma_resv *resv =3D
                  bo-&gt;tbo.base.resv;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0enum amdgpu_sync_mode sync_mode;<br>
                  &gt; <br>
                  &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syn=
c_mode =3D
                  amdgpu_bo_explicit_sync(bo) ?<br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 syn=
c_mode =3D
                  (amdgpu_ctx_explicit_sync(p-&gt;ctx) ||<br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                  =C2=A0amdgpu_bo_explicit_sync(bo)) ?<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AMDGPU_SYNC_EXPLICIT :
                  AMDGPU_SYNC_NE_OWNER;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0r =3D amdgpu_sync_resv(p-&gt;adev,
                  &amp;p-&gt;sync, resv, sync_mode,<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                  &amp;fpriv-&gt;vm);<br>
                  &gt;diff --git
                  a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
                  b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c<br>
                  &gt;index 5cb33ac99f70..a304740ccedf 100644<br>
                  &gt;--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c<br>
                  &gt;+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c<br>
                  &gt;@@ -318,7 +318,8 @@ static int
                  amdgpu_ctx_get_stable_pstate(struct amdgpu_ctx *ctx,<br>
                  &gt; }<br>
                  &gt; <br>
                  &gt; static int amdgpu_ctx_init(struct amdgpu_ctx_mgr
                  *mgr, int32_t priority,<br>
                  &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *filp,
                  struct amdgpu_ctx *ctx)<br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t flags, struct
                  drm_file *filp,<br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_ctx *ctx)<br>
                  &gt; {<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_fpriv *fpriv=
 =3D
                  filp-&gt;driver_priv;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 current_stable_pstate;=
<br>
                  &gt;@@ -334,6 +335,7 @@ static int
                  amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t
                  priority,<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;mgr =3D mgr;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_lock_init(&amp;ctx-&g=
t;ring_lock);<br>
                  &gt; <br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 ctx-&gt;flags =3D flags;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;reset_counter =3D
                  atomic_read(&amp;mgr-&gt;adev-&gt;gpu_reset_counter);<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;reset_counter_quer=
y =3D
                  ctx-&gt;reset_counter;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ctx-&gt;generation =3D
                  amdgpu_vm_generation(mgr-&gt;adev, &amp;fpriv-&gt;vm);<br=
>
                  &gt;@@ -474,6 +476,7 @@ static int
                  amdgpu_ctx_alloc(struct amdgpu_device *adev,<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_fpriv
                  *fpriv,<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_file *filp,<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t priority,<br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t flags,<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *id)<br>
                  &gt; {<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_ctx_mgr *mgr=
 =3D
                  &amp;fpriv-&gt;ctx_mgr;<br>
                  &gt;@@ -493,7 +496,7 @@ static int
                  amdgpu_ctx_alloc(struct amdgpu_device *adev,<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
                  &gt; <br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*id =3D (uint32_t)r;<br>
                  &gt;-=C2=A0 =C2=A0 =C2=A0 r =3D amdgpu_ctx_init(mgr, prio=
rity, filp,
                  ctx);<br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 r =3D amdgpu_ctx_init(mgr, prio=
rity, flags,
                  filp, ctx);<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (r) {<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                  =C2=A0idr_remove(&amp;mgr-&gt;ctx_handles, *id);<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0*id =3D 0;<br>
                  &gt;@@ -666,7 +669,7 @@ int amdgpu_ctx_ioctl(struct
                  drm_device *dev, void *data,<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct drm_file *filp)<br>
                  &gt; {<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
                  &gt;-=C2=A0 =C2=A0 =C2=A0 uint32_t id, stable_pstate;<br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 uint32_t id, stable_pstate, fla=
gs;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int32_t priority;<br>
                  &gt; <br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0union drm_amdgpu_ctx *args=
 =3D data;<br>
                  &gt;@@ -675,6 +678,7 @@ int amdgpu_ctx_ioctl(struct
                  drm_device *dev, void *data,<br>
                  &gt; <br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0id =3D args-&gt;in.ctx_id;=
<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0priority =3D args-&gt;in.p=
riority;<br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 flags =3D args-&gt;in.flags;<br=
>
                  &gt; <br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* For backwards compatibi=
lity, we need to
                  accept ioctls with garbage<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * in the priority field. =
Garbage values in
                  the priority field, result<br>
                  &gt;@@ -685,7 +689,7 @@ int amdgpu_ctx_ioctl(struct
                  drm_device *dev, void *data,<br>
                  &gt; <br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (args-&gt;in.op) {<=
br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case AMDGPU_CTX_OP_ALLOC_C=
TX:<br>
                  &gt;-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =
=3D amdgpu_ctx_alloc(adev, fpriv,
                  filp, priority, &amp;id);<br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =
=3D amdgpu_ctx_alloc(adev, fpriv,
                  filp, priority, flags, &amp;id);<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0args-&gt;out.alloc.ctx_id =3D id;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0case AMDGPU_CTX_OP_FREE_CT=
X:<br>
                  &gt;diff --git
                  a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
                  b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h<br>
                  &gt;index 85376baaa92f..9431c8d2ea59 100644<br>
                  &gt;--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h<br>
                  &gt;+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h<br>
                  &gt;@@ -45,6 +45,7 @@ struct amdgpu_ctx_entity {<br>
                  &gt; struct amdgpu_ctx {<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct kref=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0refcount;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct amdgpu_ctx_mgr=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*mgr;<br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flags;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                  reset_counter;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                  reset_counter_query;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 generati=
on;<br>
                  &gt;@@ -84,6 +85,12 @@ struct dma_fence
                  *amdgpu_ctx_get_fence(struct amdgpu_ctx *ctx,<br>
                  &gt; bool amdgpu_ctx_priority_is_valid(int32_t
                  ctx_prio);<br>
                  &gt; void amdgpu_ctx_priority_override(struct
                  amdgpu_ctx *ctx, int32_t ctx_prio);<br>
                  &gt; <br>
                  &gt;+static inline bool<br>
                  &gt;+amdgpu_ctx_explicit_sync(struct amdgpu_ctx *ctx)<br>
                  &gt;+{<br>
                  &gt;+=C2=A0 =C2=A0 =C2=A0 return ctx-&gt;flags &amp;
                  AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC;<br>
                  &gt;+}<br>
                  &gt;+<br>
                  &gt; int amdgpu_ctx_ioctl(struct drm_device *dev, void
                  *data,<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 struct drm_file *filp);<br>
                  &gt; <br>
                  &gt;diff --git a/include/uapi/drm/amdgpu_drm.h
                  b/include/uapi/drm/amdgpu_drm.h<br>
                  &gt;index 96e32dafd4f0..e9d87a6e3d86 100644<br>
                  &gt;--- a/include/uapi/drm/amdgpu_drm.h<br>
                  &gt;+++ b/include/uapi/drm/amdgpu_drm.h<br>
                  &gt;@@ -125,7 +125,14 @@ extern &quot;C&quot; {<br>
                  &gt; #define AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS=C2=A0 =C2=
=A0 =C2=A0(1
                  &lt;&lt; 5)<br>
                  &gt; /* Flag that BO is always valid in this VM */<br>
                  &gt; #define AMDGPU_GEM_CREATE_VM_ALWAYS_VALID=C2=A0 =C2=
=A0 =C2=A0(1
                  &lt;&lt; 6)<br>
                  &gt;-/* Flag that BO sharing will be explicitly
                  synchronized */<br>
                  &gt;+/* Flag that BO sharing will be explicitly
                  synchronized<br>
                  &gt;+ *<br>
                  &gt;+ * This flag should not be used unless the client
                  can guarantee that no<br>
                  &gt;+ * other driver which ever touches this BO will
                  ever want to use implicit<br>
                  &gt;+ * synchronization as it disables implicit sync
                  on this BO system-wide.<br>
                  &gt;+ * Instead, drivers which use an explicit
                  synchronization model should<br>
                  &gt;+ * prefer AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC.<br>
                  &gt;+ */<br>
                  &gt; #define AMDGPU_GEM_CREATE_EXPLICIT_SYNC=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0
                  =C2=A0 =C2=A0 =C2=A0(1 &lt;&lt; 7)<br>
                  &gt; /* Flag that indicates allocating MQD gart on
                  GFX9, where the mtype<br>
                  &gt;=C2=A0 * for the second page onward should be set to
                  NC. It should never<br>
                  &gt;@@ -240,6 +247,9 @@ union drm_amdgpu_bo_list {<br>
                  &gt; #define AMDGPU_CTX_OP_GET_STABLE_PSTATE=C2=A0 =C2=A0=
 =C2=A0 =C2=A05<br>
                  &gt; #define AMDGPU_CTX_OP_SET_STABLE_PSTATE=C2=A0 =C2=A0=
 =C2=A0 =C2=A06<br>
                  &gt; <br>
                  &gt;+/* indicate that all synchronization will be
                  explicit */<br>
                  &gt;+#define AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC
                  (1&lt;&lt;0)<br>
                  &gt;+<br>
                  &gt; /* GPU reset status */<br>
                  &gt; #define AMDGPU_CTX_NO_RESET=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00<br>
                  &gt; /* this the context caused it */<br>
                </blockquote>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </div>

</blockquote></div></div>

--000000000000cbbf9806200a90ef--
