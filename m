Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 318D2956DD8
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 16:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2008A10E2BE;
	Mon, 19 Aug 2024 14:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aVXZGVOy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149C610E2B3;
 Mon, 19 Aug 2024 14:51:17 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42812945633so38836495e9.0; 
 Mon, 19 Aug 2024 07:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724079075; x=1724683875; darn=lists.freedesktop.org;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=raC5WHWAwT9k0Sdb/vIzS2TItV7NL4AOvxDNjo+QybU=;
 b=aVXZGVOyhUIZeW9c4Y5oPsY5twLpa38qdo+rZBiWNyzNNrcVPMTU3N5UCRn18c7DXj
 KrsfFAOAzSXFWL93spWNXezeWW4fbQYBW8gfZclySRqPBzI34BHJTMxHwB92O4eBq43i
 rIbZ852A7Rw526GKUvbGIkhWgsWiYkJsVEB9OO4QSLnyUo0pPbxIAjazVGI/JWiyU5AU
 FJ4qt34p/CG4N18oVZzviptiVH5GyH1f0OpATudkx+amErC93IFDSuJQ1rKN57VuigI3
 Rfxj5A+Ikwx/pZC0aNtpEDUyGjCdmlDXqi1LvqMsQiRk4VxPUqRHQoQ/ynh3ZcrbkZrg
 QD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724079075; x=1724683875;
 h=in-reply-to:from:content-language:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=raC5WHWAwT9k0Sdb/vIzS2TItV7NL4AOvxDNjo+QybU=;
 b=Mcc8WGEoRLK6LCDzAInxPuzzYLmIs25Si7El8jmQP4WeQf+s0gdXblSkDea/x3QpAK
 zgVTyhkKY4BAFhKJ+/6k2eCp0j2zmceSv1d7A650VOQnqdbrrm9QrASmc0JKgSMc/zLO
 5DFn3wzY7ldFiWukl1iHzUABocJ+UZF+a6zcyic9HVSzVKAoxTpruosNtoFZp9qXmHNQ
 MZAm/yXVt9ezi7trOJPDrOlw5ejF8Oj1o7a89XGDnJ7pVpMd80mm3VDRD/GOG40jde4Q
 scZSQQ6b/xKXpvj3OxupUcjW87Gog89cO0df3XPIw314wi0AsVFibWevIOPPFmt2QKd/
 C4pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhOyTQdplKJ8dsOpIAQ0ByxugfqNlZlN4eXErDJpMsEubtnzqMTkm08tm+jm8gfexxSVirAGVB@lists.freedesktop.org,
 AJvYcCX+WgoQUeX2K7NtYmEnBUNPMMDER2fQYkFoBYPA8tsmtcqzzCn0pRjhG/1bSzsjgJhZFX9PInmvlcbX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqDhVdpFs8tmClDAjYsGiLvOZoA5JV7SsOhwanADZsp3vlPpeN
 y7A3KnwEkNV836GwbtVRU33wqUQloyY79wgLD6BLnsCOQDBH2krhCXj21Bxq
X-Google-Smtp-Source: AGHT+IGO5pBapEF+TjfJ5KFoC0zqqk6XtjuG9JEBmkvkdZPa9cCkDY2VO6WnpazlbBi4ln3LT3bakg==
X-Received: by 2002:a05:6000:1b01:b0:371:8f19:bff0 with SMTP id
 ffacd0b85a97d-3719445235amr5874013f8f.20.1724079074433; 
 Mon, 19 Aug 2024 07:51:14 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37189897066sm10794806f8f.76.2024.08.19.07.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Aug 2024 07:51:13 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------NwIRAj3pHzE1dVaM4UkpK80m"
Message-ID: <030b487b-a8f9-4046-b546-a60a30ca4eb2@gmail.com>
Date: Mon, 19 Aug 2024 16:51:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] amdgpu: Add a context flag to disable implicit sync
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Faith Ekstrand <faith@gfxstrand.net>
Cc: Joshua Ashton <joshua@froggi.es>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <mdaenzer@redhat.com>
References: <20240807153941.3668940-1-faith.ekstrand@collabora.com>
 <B37A903E-E670-4548-BDBB-4651D2DC7D15@froggi.es>
 <CAOFGe95KrOxjaDpvKHGuL8BUoApbpEY-wtH4B1Due4PHiVAv0g@mail.gmail.com>
 <CAP+8YyFMxBOSwBNLpcoUw8bsfNdYDiJoYT=8E3B=d3U-c3Am+A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <CAP+8YyFMxBOSwBNLpcoUw8bsfNdYDiJoYT=8E3B=d3U-c3Am+A@mail.gmail.com>
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

This is a multi-part message in MIME format.
--------------NwIRAj3pHzE1dVaM4UkpK80m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 07.08.24 um 22:33 schrieb Bas Nieuwenhuizen:
> On Wed, Aug 7, 2024 at 10:25 PM Faith Ekstrand <faith@gfxstrand.net> 
> wrote:
>
>     On Wed, Aug 7, 2024 at 2:23 PM Joshua Ashton <joshua@froggi.es> wrote:
>
>         I was thinking about this more recently. I was initially
>         considering "maybe this should be a per-BO import," but I
>         couldn't think of anything in the GL model that would actually
>         benefit given its not "true" bindless and there's no
>         update-after-bind there.
>
>
>     That's also an option and it's the way it works on i915. However,
>     then you have to pass lists of things to the kernel and that's
>     kinda gross. If we need it, we can do that. Otherwise, I think a
>     more global thing is fine.  I think Bas is currently investigating
>     a per-submit approach which is a tad different from either but
>     should also work okay.
>
>
> Yeah, I'm working on a per-submit thing (also using BOOKKEEP fences 
> instead of using the EXPLICIT wait mode to ensure we also don't add 
> implicit fences).

Yeah agree. Your implementation with the per submission flag and using 
BOOKKEEP actually sounds like the right thing to do to me as well.

We need to keep in mind that synchronization goes in both ways, e.g. 
explicit->implicit as well as implicit->explicit.

I would rather like to keep the implicit->explicit handling (which this 
patch here completely disables) and only allow the explicit->implicit 
handling (which by using BOOKKEEP fences).

This way it is possible that we still over synchronize for example for a 
double buffered BO is re-used by an explicit client and implicit display 
server, but that's probably not something we should optimize in the 
first place.

Regards,
Christian.

>
> We do have a per-BO list on submission already, so we could add things 
> there, it is just very annoying to implement as currently at the point 
> we do fence wait/signal we lost the association with the BO list. 
> Given that I don't see an use case anytime soon (there are some 
> theoreticals like radeonsi might start doing READ usage instead of RW 
> usage with extra tracking) I feel it isn't worth that added 
> implementation complexity
>
>
>         Worth others more familiar with GL asking that question to
>         themselves also. I am definitely not totally up on what's
>         possible there.
>
>         Overall, I think I am OK with this approach, even though I
>         think mixing implicit and explicit sync is gross, and I want
>         the pain that is implicit sync to just go away forever. :-)
>
>
>     So say we all...
>
>     ~Faith
>
>         - Joshie 🐸✨
>
>
>         On August 7, 2024 4:39:32 PM GMT+01:00, Faith Ekstrand
>         <faith@gfxstrand.net> wrote:
>         >Previously, AMDGPU_GEM_CREATE_EXPLICIT_SYNC was used to
>         disable implicit
>         >synchronization on BOs when explicit synchronization can be
>         used.  The
>         >problem is that this flag is per-BO and affects all amdgpu
>         users in the
>         >system, not just the usermode drver which sets it.  This can
>         lead to
>         >some unintended consequences for userspace if not used carefully.
>         >
>         >Since the introduction of DMA_BUF_IOCTL_EXPORT_SYNC_FILE and
>         >DMA_BUF_IOCTL_IMPORT_SYNC_FILE, many userspace window system
>         components
>         >have grown the ability to convert between the Vulkan explicit
>         sync model
>         >and the legacy implicit sync model used by X11 and Wayland in
>         the past.
>         >This allows both old and new components to exist
>         simultaneously and talk
>         >to each other.  In particular, XWayland is able to convert
>         between the
>         >two to let Vulkan apps work seamlessly with older X11
>         compositors that
>         >aren't aware of explicit synchronizaiton.  This is rapidly
>         becoming the
>         >backbone of synchronization in the Linux window system space.
>         >
>         >Unfortunately, AMDGPU_GEM_CREATE_EXPLICIT_SYNC breaks this
>         because it
>         >disables all implicit synchronization on the given BO,
>         regardless of
>         >which userspace driver is rendering with it and regardless of the
>         >assumptions made by the client application.  In particular,
>         this is
>         >causing issues with RADV and radeonsi.  RADV sets the flag to
>         disable
>         >implicit sync on window system buffers so that it can safely
>         have them
>         >resident at all times without causing internal
>         over-synchronization.
>         >The BO is then handed off to a compositor which composites using
>         >radeonsi.  If the compositor uses the
>         EGL_ANDROID_native_fence_sync
>         >extension to pass explicit sync files through to radeonsi, then
>         >everything is fine.  However, if that buffer ever gets handed
>         to an
>         >instance of radeonsi with any assumption of implicit
>         synchronization,
>         >radeonsi won't be able sync on the BO because RADV disabled
>         implict sync
>         >on that BO system-wide.  It doesn't matter whether some
>         window system
>         >component used DMA_BUF_IOCTL_IMPORT_SYNC_FILE to set the
>         appropriate
>         >fence on the BO, amdgpu will ignore it.
>         >
>         >This new flag disables implicit sync on the context rather
>         than the BO.
>         >This way RADV can disable implicit sync (which is what RADV
>         has always
>         >wanted) without affecting other components in the system.  If
>         RADV (or
>         >some other driver) wants implicit sync on some BO, it can use
>         >DMA_BUF_IOCTL_EXPORT_SYNC_FILE and
>         DMA_BUF_IOCTL_IMPORT_SYNC_FILE to
>         >manually synchronize with other implicit-sync components. 
>         This is the
>         >approach we've taken with NVK/nouveau, ANV/xe, and similar to the
>         >approach taken by ANV/i915 and it works well for those drivers.
>         >
>         >Ideally, I would like to see something like this back-ported
>         to at least
>         >the kernel where DMA_BUF_IOCTL_IMPORT/EXPORT_SYNC_FILE were
>         introduced
>         >so that we don't have to wait another year for the fix to
>         reach users.
>         >However, I understand that back-porting UAPI is problematic
>         and I'll
>         >leave that decision up to the amdgpu maintainers. Michel
>         suggested that
>         >a new CTX_OP would make more sense if we want to back-port it
>         but the
>         >create flag made more sense to me from an API design PoV.
>         >
>         >Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
>         >Cc: Alex Deucher <alexander.deucher@amd.com>
>         >Cc: Christian König <christian.koenig@amd.com>
>         >Cc: David Airlie <airlied@gmail.com>
>         >Cc: Michel Dänzer <mdaenzer@redhat.com>
>         >Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>         >---
>         > drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  3 ++-
>         > drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 12 ++++++++----
>         > drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  7 +++++++
>         > include/uapi/drm/amdgpu_drm.h           | 12 +++++++++++-
>         > 4 files changed, 28 insertions(+), 6 deletions(-)
>         >
>         >diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>         b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>         >index ec888fc6ead8..8410b4426541 100644
>         >--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>         >+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>         >@@ -1196,7 +1196,8 @@ static int amdgpu_cs_sync_rings(struct
>         amdgpu_cs_parser *p)
>         >               struct dma_resv *resv = bo->tbo.base.resv;
>         >               enum amdgpu_sync_mode sync_mode;
>         >
>         >-              sync_mode = amdgpu_bo_explicit_sync(bo) ?
>         >+              sync_mode = (amdgpu_ctx_explicit_sync(p->ctx) ||
>         >+  amdgpu_bo_explicit_sync(bo)) ?
>         >                       AMDGPU_SYNC_EXPLICIT :
>         AMDGPU_SYNC_NE_OWNER;
>         >               r = amdgpu_sync_resv(p->adev, &p->sync, resv,
>         sync_mode,
>         > &fpriv->vm);
>         >diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>         b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>         >index 5cb33ac99f70..a304740ccedf 100644
>         >--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>         >+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
>         >@@ -318,7 +318,8 @@ static int
>         amdgpu_ctx_get_stable_pstate(struct amdgpu_ctx *ctx,
>         > }
>         >
>         > static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr,
>         int32_t priority,
>         >-                         struct drm_file *filp, struct
>         amdgpu_ctx *ctx)
>         >+                         uint32_t flags, struct drm_file *filp,
>         >+                         struct amdgpu_ctx *ctx)
>         > {
>         >       struct amdgpu_fpriv *fpriv = filp->driver_priv;
>         >       u32 current_stable_pstate;
>         >@@ -334,6 +335,7 @@ static int amdgpu_ctx_init(struct
>         amdgpu_ctx_mgr *mgr, int32_t priority,
>         >       ctx->mgr = mgr;
>         >       spin_lock_init(&ctx->ring_lock);
>         >
>         >+      ctx->flags = flags;
>         >       ctx->reset_counter =
>         atomic_read(&mgr->adev->gpu_reset_counter);
>         >       ctx->reset_counter_query = ctx->reset_counter;
>         >       ctx->generation = amdgpu_vm_generation(mgr->adev,
>         &fpriv->vm);
>         >@@ -474,6 +476,7 @@ static int amdgpu_ctx_alloc(struct
>         amdgpu_device *adev,
>         >                           struct amdgpu_fpriv *fpriv,
>         >                           struct drm_file *filp,
>         >                           int32_t priority,
>         >+                          uint32_t flags,
>         >                           uint32_t *id)
>         > {
>         >       struct amdgpu_ctx_mgr *mgr = &fpriv->ctx_mgr;
>         >@@ -493,7 +496,7 @@ static int amdgpu_ctx_alloc(struct
>         amdgpu_device *adev,
>         >       }
>         >
>         >       *id = (uint32_t)r;
>         >-      r = amdgpu_ctx_init(mgr, priority, filp, ctx);
>         >+      r = amdgpu_ctx_init(mgr, priority, flags, filp, ctx);
>         >       if (r) {
>         >  idr_remove(&mgr->ctx_handles, *id);
>         >               *id = 0;
>         >@@ -666,7 +669,7 @@ int amdgpu_ctx_ioctl(struct drm_device
>         *dev, void *data,
>         >                    struct drm_file *filp)
>         > {
>         >       int r;
>         >-      uint32_t id, stable_pstate;
>         >+      uint32_t id, stable_pstate, flags;
>         >       int32_t priority;
>         >
>         >       union drm_amdgpu_ctx *args = data;
>         >@@ -675,6 +678,7 @@ int amdgpu_ctx_ioctl(struct drm_device
>         *dev, void *data,
>         >
>         >       id = args->in.ctx_id;
>         >       priority = args->in.priority;
>         >+      flags = args->in.flags;
>         >
>         >       /* For backwards compatibility, we need to accept
>         ioctls with garbage
>         >        * in the priority field. Garbage values in the
>         priority field, result
>         >@@ -685,7 +689,7 @@ int amdgpu_ctx_ioctl(struct drm_device
>         *dev, void *data,
>         >
>         >       switch (args->in.op) {
>         >       case AMDGPU_CTX_OP_ALLOC_CTX:
>         >-              r = amdgpu_ctx_alloc(adev, fpriv, filp,
>         priority, &id);
>         >+              r = amdgpu_ctx_alloc(adev, fpriv, filp,
>         priority, flags, &id);
>         >               args->out.alloc.ctx_id = id;
>         >               break;
>         >       case AMDGPU_CTX_OP_FREE_CTX:
>         >diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>         b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>         >index 85376baaa92f..9431c8d2ea59 100644
>         >--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>         >+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
>         >@@ -45,6 +45,7 @@ struct amdgpu_ctx_entity {
>         > struct amdgpu_ctx {
>         >       struct kref                     refcount;
>         >       struct amdgpu_ctx_mgr           *mgr;
>         >+      uint32_t                        flags;
>         >       unsigned reset_counter;
>         >       unsigned reset_counter_query;
>         >       uint64_t                        generation;
>         >@@ -84,6 +85,12 @@ struct dma_fence
>         *amdgpu_ctx_get_fence(struct amdgpu_ctx *ctx,
>         > bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio);
>         > void amdgpu_ctx_priority_override(struct amdgpu_ctx *ctx,
>         int32_t ctx_prio);
>         >
>         >+static inline bool
>         >+amdgpu_ctx_explicit_sync(struct amdgpu_ctx *ctx)
>         >+{
>         >+      return ctx->flags & AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC;
>         >+}
>         >+
>         > int amdgpu_ctx_ioctl(struct drm_device *dev, void *data,
>         >                    struct drm_file *filp);
>         >
>         >diff --git a/include/uapi/drm/amdgpu_drm.h
>         b/include/uapi/drm/amdgpu_drm.h
>         >index 96e32dafd4f0..e9d87a6e3d86 100644
>         >--- a/include/uapi/drm/amdgpu_drm.h
>         >+++ b/include/uapi/drm/amdgpu_drm.h
>         >@@ -125,7 +125,14 @@ extern "C" {
>         > #define AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS     (1 << 5)
>         > /* Flag that BO is always valid in this VM */
>         > #define AMDGPU_GEM_CREATE_VM_ALWAYS_VALID     (1 << 6)
>         >-/* Flag that BO sharing will be explicitly synchronized */
>         >+/* Flag that BO sharing will be explicitly synchronized
>         >+ *
>         >+ * This flag should not be used unless the client can
>         guarantee that no
>         >+ * other driver which ever touches this BO will ever want to
>         use implicit
>         >+ * synchronization as it disables implicit sync on this BO
>         system-wide.
>         >+ * Instead, drivers which use an explicit synchronization
>         model should
>         >+ * prefer AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC.
>         >+ */
>         > #define AMDGPU_GEM_CREATE_EXPLICIT_SYNC      (1 << 7)
>         > /* Flag that indicates allocating MQD gart on GFX9, where
>         the mtype
>         >  * for the second page onward should be set to NC. It should
>         never
>         >@@ -240,6 +247,9 @@ union drm_amdgpu_bo_list {
>         > #define AMDGPU_CTX_OP_GET_STABLE_PSTATE       5
>         > #define AMDGPU_CTX_OP_SET_STABLE_PSTATE       6
>         >
>         >+/* indicate that all synchronization will be explicit */
>         >+#define AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC (1<<0)
>         >+
>         > /* GPU reset status */
>         > #define AMDGPU_CTX_NO_RESET           0
>         > /* this the context caused it */
>

--------------NwIRAj3pHzE1dVaM4UkpK80m
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    Am 07.08.24 um 22:33 schrieb Bas Nieuwenhuizen:<br>
    <blockquote type="cite"
cite="mid:CAP+8YyFMxBOSwBNLpcoUw8bsfNdYDiJoYT=8E3B=d3U-c3Am+A@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">On Wed, Aug 7, 2024 at 10:25 PM Faith Ekstrand
          &lt;<a href="mailto:faith@gfxstrand.net"
            moz-do-not-send="true" class="moz-txt-link-freetext">faith@gfxstrand.net</a>&gt;
          wrote:</div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Wed, Aug 7, 2024 at
                  2:23 PM Joshua Ashton &lt;<a
                    href="mailto:joshua@froggi.es" target="_blank"
                    moz-do-not-send="true" class="moz-txt-link-freetext">joshua@froggi.es</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I
                  was thinking about this more recently. I was initially
                  considering "maybe this should be a per-BO import,"
                  but I couldn't think of anything in the GL model that
                  would actually benefit given its not "true" bindless
                  and there's no update-after-bind there.<br>
                </blockquote>
                <div><br>
                </div>
                <div>That's also an option and it's the way it works on
                  i915. However, then you have to pass lists of things
                  to the kernel and that's kinda gross. If we need it,
                  we can do that. Otherwise, I think a more global thing
                  is fine.  I think Bas is currently investigating a
                  per-submit approach which is a tad different from
                  either but should also work okay.<br>
                </div>
                <div> </div>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>Yeah, I'm working on a per-submit thing (also using
            BOOKKEEP fences instead of using the EXPLICIT wait mode to
            ensure we also don't add implicit fences). <br>
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
    implicit display server, but that's probably not something we should
    optimize in the first place.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAP+8YyFMxBOSwBNLpcoUw8bsfNdYDiJoYT=8E3B=d3U-c3Am+A@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div><br>
          </div>
          <div>We do have a per-BO list on submission already, so we
            could add things there, it is just very annoying to
            implement as currently at the point we do fence wait/signal
            we lost the association with the BO list. Given that I 
            don't see an use case anytime soon (there are some
            theoreticals like radeonsi might start doing READ usage
            instead of RW usage with extra tracking) I feel it isn't
            worth that added implementation complexity<br>
          </div>
          <div><br>
          </div>
          <div><br>
          </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div class="gmail_quote">
                <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  Worth others more familiar with GL asking that
                  question to themselves also. I am definitely not
                  totally up on what's possible there.<br>
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
                <div> </div>
                <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                  - Joshie 🐸✨<br>
                  <br>
                  <br>
                  On August 7, 2024 4:39:32 PM GMT+01:00, Faith Ekstrand
                  &lt;<a href="mailto:faith@gfxstrand.net"
                    target="_blank" moz-do-not-send="true"
                    class="moz-txt-link-freetext">faith@gfxstrand.net</a>&gt;
                  wrote:<br>
                  &gt;Previously, AMDGPU_GEM_CREATE_EXPLICIT_SYNC was
                  used to disable implicit<br>
                  &gt;synchronization on BOs when explicit
                  synchronization can be used.  The<br>
                  &gt;problem is that this flag is per-BO and affects
                  all amdgpu users in the<br>
                  &gt;system, not just the usermode drver which sets
                  it.  This can lead to<br>
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
                  &gt;to each other.  In particular, XWayland is able to
                  convert between the<br>
                  &gt;two to let Vulkan apps work seamlessly with older
                  X11 compositors that<br>
                  &gt;aren't aware of explicit synchronizaiton.  This is
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
                  &gt;assumptions made by the client application.  In
                  particular, this is<br>
                  &gt;causing issues with RADV and radeonsi.  RADV sets
                  the flag to disable<br>
                  &gt;implicit sync on window system buffers so that it
                  can safely have them<br>
                  &gt;resident at all times without causing internal
                  over-synchronization.<br>
                  &gt;The BO is then handed off to a compositor which
                  composites using<br>
                  &gt;radeonsi.  If the compositor uses the
                  EGL_ANDROID_native_fence_sync<br>
                  &gt;extension to pass explicit sync files through to
                  radeonsi, then<br>
                  &gt;everything is fine.  However, if that buffer ever
                  gets handed to an<br>
                  &gt;instance of radeonsi with any assumption of
                  implicit synchronization,<br>
                  &gt;radeonsi won't be able sync on the BO because RADV
                  disabled implict sync<br>
                  &gt;on that BO system-wide.  It doesn't matter whether
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
                  system.  If RADV (or<br>
                  &gt;some other driver) wants implicit sync on some BO,
                  it can use<br>
                  &gt;DMA_BUF_IOCTL_EXPORT_SYNC_FILE and
                  DMA_BUF_IOCTL_IMPORT_SYNC_FILE to<br>
                  &gt;manually synchronize with other implicit-sync
                  components.  This is the<br>
                  &gt;approach we've taken with NVK/nouveau, ANV/xe, and
                  similar to the<br>
                  &gt;approach taken by ANV/i915 and it works well for
                  those drivers.<br>
                  &gt;<br>
                  &gt;Ideally, I would like to see something like this
                  back-ported to at least<br>
                  &gt;the kernel where
                  DMA_BUF_IOCTL_IMPORT/EXPORT_SYNC_FILE were introduced<br>
                  &gt;so that we don't have to wait another year for the
                  fix to reach users.<br>
                  &gt;However, I understand that back-porting UAPI is
                  problematic and I'll<br>
                  &gt;leave that decision up to the amdgpu maintainers. 
                  Michel suggested that<br>
                  &gt;a new CTX_OP would make more sense if we want to
                  back-port it but the<br>
                  &gt;create flag made more sense to me from an API
                  design PoV.<br>
                  &gt;<br>
                  &gt;Signed-off-by: Faith Ekstrand &lt;<a
                    href="mailto:faith.ekstrand@collabora.com"
                    target="_blank" moz-do-not-send="true"
                    class="moz-txt-link-freetext">faith.ekstrand@collabora.com</a>&gt;<br>
                  &gt;Cc: Alex Deucher &lt;<a
                    href="mailto:alexander.deucher@amd.com"
                    target="_blank" moz-do-not-send="true"
                    class="moz-txt-link-freetext">alexander.deucher@amd.com</a>&gt;<br>
                  &gt;Cc: Christian König &lt;<a
                    href="mailto:christian.koenig@amd.com"
                    target="_blank" moz-do-not-send="true"
                    class="moz-txt-link-freetext">christian.koenig@amd.com</a>&gt;<br>
                  &gt;Cc: David Airlie &lt;<a
                    href="mailto:airlied@gmail.com" target="_blank"
                    moz-do-not-send="true" class="moz-txt-link-freetext">airlied@gmail.com</a>&gt;<br>
                  &gt;Cc: Michel Dänzer &lt;<a
                    href="mailto:mdaenzer@redhat.com" target="_blank"
                    moz-do-not-send="true" class="moz-txt-link-freetext">mdaenzer@redhat.com</a>&gt;<br>
                  &gt;Cc: Bas Nieuwenhuizen &lt;<a
                    href="mailto:bas@basnieuwenhuizen.nl"
                    target="_blank" moz-do-not-send="true"
                    class="moz-txt-link-freetext">bas@basnieuwenhuizen.nl</a>&gt;<br>
                  &gt;---<br>
                  &gt; drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  3 ++-<br>
                  &gt; drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 12
                  ++++++++----<br>
                  &gt; drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h |  7
                  +++++++<br>
                  &gt; include/uapi/drm/amdgpu_drm.h           | 12
                  +++++++++++-<br>
                  &gt; 4 files changed, 28 insertions(+), 6 deletions(-)<br>
                  &gt;<br>
                  &gt;diff --git
                  a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
                  b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
                  &gt;index ec888fc6ead8..8410b4426541 100644<br>
                  &gt;--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
                  &gt;+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
                  &gt;@@ -1196,7 +1196,8 @@ static int
                  amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)<br>
                  &gt;               struct dma_resv *resv =
                  bo-&gt;tbo.base.resv;<br>
                  &gt;               enum amdgpu_sync_mode sync_mode;<br>
                  &gt; <br>
                  &gt;-              sync_mode =
                  amdgpu_bo_explicit_sync(bo) ?<br>
                  &gt;+              sync_mode =
                  (amdgpu_ctx_explicit_sync(p-&gt;ctx) ||<br>
                  &gt;+                         
                   amdgpu_bo_explicit_sync(bo)) ?<br>
                  &gt;                       AMDGPU_SYNC_EXPLICIT :
                  AMDGPU_SYNC_NE_OWNER;<br>
                  &gt;               r = amdgpu_sync_resv(p-&gt;adev,
                  &amp;p-&gt;sync, resv, sync_mode,<br>
                  &gt;                                   
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
                  &gt;-                         struct drm_file *filp,
                  struct amdgpu_ctx *ctx)<br>
                  &gt;+                         uint32_t flags, struct
                  drm_file *filp,<br>
                  &gt;+                         struct amdgpu_ctx *ctx)<br>
                  &gt; {<br>
                  &gt;       struct amdgpu_fpriv *fpriv =
                  filp-&gt;driver_priv;<br>
                  &gt;       u32 current_stable_pstate;<br>
                  &gt;@@ -334,6 +335,7 @@ static int
                  amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t
                  priority,<br>
                  &gt;       ctx-&gt;mgr = mgr;<br>
                  &gt;       spin_lock_init(&amp;ctx-&gt;ring_lock);<br>
                  &gt; <br>
                  &gt;+      ctx-&gt;flags = flags;<br>
                  &gt;       ctx-&gt;reset_counter =
                  atomic_read(&amp;mgr-&gt;adev-&gt;gpu_reset_counter);<br>
                  &gt;       ctx-&gt;reset_counter_query =
                  ctx-&gt;reset_counter;<br>
                  &gt;       ctx-&gt;generation =
                  amdgpu_vm_generation(mgr-&gt;adev, &amp;fpriv-&gt;vm);<br>
                  &gt;@@ -474,6 +476,7 @@ static int
                  amdgpu_ctx_alloc(struct amdgpu_device *adev,<br>
                  &gt;                           struct amdgpu_fpriv
                  *fpriv,<br>
                  &gt;                           struct drm_file *filp,<br>
                  &gt;                           int32_t priority,<br>
                  &gt;+                          uint32_t flags,<br>
                  &gt;                           uint32_t *id)<br>
                  &gt; {<br>
                  &gt;       struct amdgpu_ctx_mgr *mgr =
                  &amp;fpriv-&gt;ctx_mgr;<br>
                  &gt;@@ -493,7 +496,7 @@ static int
                  amdgpu_ctx_alloc(struct amdgpu_device *adev,<br>
                  &gt;       }<br>
                  &gt; <br>
                  &gt;       *id = (uint32_t)r;<br>
                  &gt;-      r = amdgpu_ctx_init(mgr, priority, filp,
                  ctx);<br>
                  &gt;+      r = amdgpu_ctx_init(mgr, priority, flags,
                  filp, ctx);<br>
                  &gt;       if (r) {<br>
                  &gt;             
                   idr_remove(&amp;mgr-&gt;ctx_handles, *id);<br>
                  &gt;               *id = 0;<br>
                  &gt;@@ -666,7 +669,7 @@ int amdgpu_ctx_ioctl(struct
                  drm_device *dev, void *data,<br>
                  &gt;                    struct drm_file *filp)<br>
                  &gt; {<br>
                  &gt;       int r;<br>
                  &gt;-      uint32_t id, stable_pstate;<br>
                  &gt;+      uint32_t id, stable_pstate, flags;<br>
                  &gt;       int32_t priority;<br>
                  &gt; <br>
                  &gt;       union drm_amdgpu_ctx *args = data;<br>
                  &gt;@@ -675,6 +678,7 @@ int amdgpu_ctx_ioctl(struct
                  drm_device *dev, void *data,<br>
                  &gt; <br>
                  &gt;       id = args-&gt;in.ctx_id;<br>
                  &gt;       priority = args-&gt;in.priority;<br>
                  &gt;+      flags = args-&gt;in.flags;<br>
                  &gt; <br>
                  &gt;       /* For backwards compatibility, we need to
                  accept ioctls with garbage<br>
                  &gt;        * in the priority field. Garbage values in
                  the priority field, result<br>
                  &gt;@@ -685,7 +689,7 @@ int amdgpu_ctx_ioctl(struct
                  drm_device *dev, void *data,<br>
                  &gt; <br>
                  &gt;       switch (args-&gt;in.op) {<br>
                  &gt;       case AMDGPU_CTX_OP_ALLOC_CTX:<br>
                  &gt;-              r = amdgpu_ctx_alloc(adev, fpriv,
                  filp, priority, &amp;id);<br>
                  &gt;+              r = amdgpu_ctx_alloc(adev, fpriv,
                  filp, priority, flags, &amp;id);<br>
                  &gt;               args-&gt;out.alloc.ctx_id = id;<br>
                  &gt;               break;<br>
                  &gt;       case AMDGPU_CTX_OP_FREE_CTX:<br>
                  &gt;diff --git
                  a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h
                  b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h<br>
                  &gt;index 85376baaa92f..9431c8d2ea59 100644<br>
                  &gt;--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h<br>
                  &gt;+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h<br>
                  &gt;@@ -45,6 +45,7 @@ struct amdgpu_ctx_entity {<br>
                  &gt; struct amdgpu_ctx {<br>
                  &gt;       struct kref                     refcount;<br>
                  &gt;       struct amdgpu_ctx_mgr           *mgr;<br>
                  &gt;+      uint32_t                        flags;<br>
                  &gt;       unsigned                       
                  reset_counter;<br>
                  &gt;       unsigned                       
                  reset_counter_query;<br>
                  &gt;       uint64_t                        generation;<br>
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
                  &gt;+      return ctx-&gt;flags &amp;
                  AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC;<br>
                  &gt;+}<br>
                  &gt;+<br>
                  &gt; int amdgpu_ctx_ioctl(struct drm_device *dev, void
                  *data,<br>
                  &gt;                    struct drm_file *filp);<br>
                  &gt; <br>
                  &gt;diff --git a/include/uapi/drm/amdgpu_drm.h
                  b/include/uapi/drm/amdgpu_drm.h<br>
                  &gt;index 96e32dafd4f0..e9d87a6e3d86 100644<br>
                  &gt;--- a/include/uapi/drm/amdgpu_drm.h<br>
                  &gt;+++ b/include/uapi/drm/amdgpu_drm.h<br>
                  &gt;@@ -125,7 +125,14 @@ extern "C" {<br>
                  &gt; #define AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS     (1
                  &lt;&lt; 5)<br>
                  &gt; /* Flag that BO is always valid in this VM */<br>
                  &gt; #define AMDGPU_GEM_CREATE_VM_ALWAYS_VALID     (1
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
                  &gt; #define AMDGPU_GEM_CREATE_EXPLICIT_SYNC         
                       (1 &lt;&lt; 7)<br>
                  &gt; /* Flag that indicates allocating MQD gart on
                  GFX9, where the mtype<br>
                  &gt;  * for the second page onward should be set to
                  NC. It should never<br>
                  &gt;@@ -240,6 +247,9 @@ union drm_amdgpu_bo_list {<br>
                  &gt; #define AMDGPU_CTX_OP_GET_STABLE_PSTATE       5<br>
                  &gt; #define AMDGPU_CTX_OP_SET_STABLE_PSTATE       6<br>
                  &gt; <br>
                  &gt;+/* indicate that all synchronization will be
                  explicit */<br>
                  &gt;+#define AMDGPU_CTX_ALLOC_FLAGS_EXPLICIT_SYNC
                  (1&lt;&lt;0)<br>
                  &gt;+<br>
                  &gt; /* GPU reset status */<br>
                  &gt; #define AMDGPU_CTX_NO_RESET           0<br>
                  &gt; /* this the context caused it */<br>
                </blockquote>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------NwIRAj3pHzE1dVaM4UkpK80m--
