Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02732AFBA5D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 20:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2974410E0B7;
	Mon,  7 Jul 2025 18:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="W0DQ/8uP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BEC710E0B7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 18:07:41 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-b3182c6d03bso3994762a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jul 2025 11:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1751911660; x=1752516460;
 darn=lists.freedesktop.org; 
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0pCU08s8pyzb8vKED/GFzcPYQp4EDazDQK60prRI+oo=;
 b=W0DQ/8uPq9Pz3JuaKjWQ8Xim0SbXv4BEbQCX9kmG8Ho7dd7RHlCJsIRLQuBpmZE/zj
 w2v+50mlrpEBtYbIwkyfyHEOC+OOkEPSwfM097UEdRlvU4xnBuesx7j3mDyi6YTpMPc2
 vjCilAhnCikwsdWzmpGmdegX7CD7R6NySAIjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751911660; x=1752516460;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0pCU08s8pyzb8vKED/GFzcPYQp4EDazDQK60prRI+oo=;
 b=M+J+Sjw/CoRNjdQ2toEe05LRxocXvhfm+62SvfmET4DwN42Iph7O/Z5A1FiFgzo0SJ
 f7YXHkYqRqbKBLhNI2kQ8OlRSmxy96jkwFbrglkzjyYAq6Vw/8TmgsVAefZG0NFP3Plg
 YwamHXNF1F9Oa3kY3EZzOOIcz0AlmHylGOCFRv/wOdk18gaAdhw288KBADPckwmD1DQe
 AwMW2+g6YPBUjwkeiwf2t+cl+k2XujNiS5tiqQd/0MCUsr8PgiKugzPc3JF7eL3NmbX3
 kwBFrNqWgvTRuZe14vNQRnvHMLvxeOR9Fy221Vu/ijrmWfrNzeZIrVBGNIbizziKczhE
 Wkuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBQctAWN/JRs1jqAVxt16NbyIu2QrF3rotXUSGOagEg+yqJ+phASkeIlzcXiH1/ny1HcNGqKdWaqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw6i8KL9+DP89l9TDzKsH9aOE75ZkzrYr7xL+rJaL8EomDMiru
 RNPIyvWdXnIQ5ODSB58Es5dj+Z5JixPgwn8A+LLBRuDaj92cLiAS/RptAny7b9F5Lw==
X-Gm-Gg: ASbGncti7OKsxmvMnpaEMSmEkT3tWWXXdNjnkvcH9iWsjOUEkMugp9HbLA2VFYl10hE
 1ANexQkHGEsUoe3x7CtPXSUjvjt+xpUn8wxSTTbLA7tHWV5YwDxjT/zG3SZn5hVgL4RR4bXguYE
 n5s09MiJROPMMWAC96HR2JDAsbnfiwynWXES6eCd8WMt45psVXdsiXV/SFSeWeminiWANjZR1gh
 WKHb4jl/S6sUHNApl6tq4kER8pxBEeEsZ7EzTdU5v1NZS4SETR4XwsXOZe4yz6Z4/9LOGJdo0hJ
 ekexySMK86NPO2dPSd221tYPcDgU/34lCzZv1AhVU1NE5ZQyIuD72m8y1MbfoOUUKunXW6TG2Ny
 1CLEH6UGS0ONbRgJcNtSBQnJ3rZF2qj+ekvYz/QEE6eNfodlN
X-Google-Smtp-Source: AGHT+IGZ/Bql/c5VIs4UhzQl9SzztuAqHC//i8P6Z0HTDq4hADTsBo2RdoTip59/92a0ZMlSNbE2/w==
X-Received: by 2002:a17:90a:cb10:b0:308:7270:d6ea with SMTP id
 98e67ed59e1d1-31c20e7f994mr470317a91.30.1751911660204; 
 Mon, 07 Jul 2025 11:07:40 -0700 (PDT)
Received: from justonli3.c.googlers.com
 (206.138.168.34.bc.googleusercontent.com. [34.168.138.206])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a9cc6a184sm13124042a91.20.2025.07.07.11.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 11:07:39 -0700 (PDT)
Message-ID: <c764ba5c74447ed98f2b17d2b219f62ae79c7e30.camel@chromium.org>
Subject: Re: [PATCH v4 2/2] drm/xe/bo: add GPU memory trace points
From: Juston Li <justonli@chromium.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Tvrtko
 Ursulin <tursulin@ursulin.net>, Yiwei Zhang <zzyiwei@google.com>, Rodrigo
 Vivi	 <rodrigo.vivi@intel.com>
Date: Mon, 07 Jul 2025 11:07:39 -0700
In-Reply-To: <37a5f250-1c19-4b95-882b-b4ef3e5c6268@igalia.com>
References: <20250611225145.1739201-1-justonli@chromium.org>
 <20250611225145.1739201-2-justonli@chromium.org>
 <mrfsys5djmsbotxlaahed5ogmofn4pkmgqfhl47rj3bwxdtlbv@7xbekwpkte57>
 <37a5f250-1c19-4b95-882b-b4ef3e5c6268@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
MIME-Version: 1.0
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

On Thu, 2025-06-12 at 17:46 +0100, Tvrtko Ursulin wrote:
>=20
> On 12/06/2025 06:40, Lucas De Marchi wrote:
> > On Wed, Jun 11, 2025 at 03:51:24PM -0700, Juston Li wrote:
> > > Add TRACE_GPU_MEM tracepoints for tracking global and per-process
> > > GPU
> > > memory usage.
> > >=20
> > > These are required by VSR on Android 12+ for reporting GPU driver
> > > memory
> > > allocations.
> > >=20
> > > v3:
> > > - Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
> > > =C2=A0 per-driver Kconfig (Lucas)
> > >=20
> > > v2:
> > > - Use u64 as preferred by checkpatch (Tvrtko)
> > > - Fix errors in comments/Kconfig description (Tvrtko)
> > > - drop redundant "CONFIG" in Kconfig
> > >=20
> > > Signed-off-by: Juston Li <justonli@chromium.org>
> > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_bo.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 47
> > > ++++++++++++++++++++++++++++
> > > drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
> > > 2 files changed, 63 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > b/drivers/gpu/drm/xe/xe_bo.c
> > > index 4e39188a021ab..89a3d23e3b800 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -19,6 +19,8 @@
> > >=20
> > > #include <kunit/static_stub.h>
> > >=20
> > > +#include <trace/events/gpu_mem.h>
> > > +
> > > #include "xe_device.h"
> > > #include "xe_dma_buf.h"
> > > #include "xe_drm_client.h"
> > > @@ -418,6 +420,35 @@ static void
> > > xe_ttm_tt_account_subtract(struct=20
> > > xe_device *xe, struct ttm_tt *tt)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_shrinker_mod_pages(xe->=
mem.shrinker, -(long)tt-
> > > >num_pages, 0);
> > > }
> > >=20
> > > +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> > > +static void update_global_total_pages(struct ttm_device
> > > *ttm_dev,=20
> > > long num_pages)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct xe_device *xe =3D ttm_to_xe_device(ttm_dev=
);
> > > +=C2=A0=C2=A0=C2=A0 u64 global_total_pages =3D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 atomic64_add_return(num_p=
ages, &xe->global_total_pages);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 trace_gpu_mem_total(0, 0, global_total_pages << P=
AGE_SHIFT);
> > > +}
> > > +
> > > +static void update_process_mem(struct drm_file *file, ssize_t
> > > size)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 struct xe_file *xef =3D to_xe_file(file);
> > > +=C2=A0=C2=A0=C2=A0 u64 process_mem =3D atomic64_add_return(size, &xe=
f-
> > > >process_mem);
> > > +
> > > +=C2=A0=C2=A0=C2=A0 rcu_read_lock(); /* Locks file->pid! */
> > > +=C2=A0=C2=A0=C2=A0 trace_gpu_mem_total(0, pid_nr(rcu_dereference(fil=
e->pid)),=20
> > > process_mem);
> >=20
> > Isn't the first arg supposed to be the gpu id? Doesn't this become
> > invalid when I have e.g. LNL + BMG and the trace is enabled?
>=20
> Good point.
>=20
> u32 gpu_id does not seem possible to map to anything useful.
>=20
> Shall we replace it with a string obtained from dev_name(struct
> device=20
> *) ? As only Android parses them I think we can get still away with=20
> changing the tracepoints ABI.
>=20
> >=20
> > > +=C2=A0=C2=A0=C2=A0 rcu_read_unlock();
> > > +}
> > > +#else
> > > +static inline void update_global_total_pages(struct ttm_device=20
> > > *ttm_dev, long num_pages)
> > > +{
> > > +}
> > > +
> > > +static inline void update_process_mem(struct drm_file *file,
> > > ssize_t=20
> > > size)
> > > +{
> > > +}
> > > +#endif
> > > +
> > > static struct ttm_tt *xe_ttm_tt_create(struct ttm_buffer_object
> > > *ttm_bo,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 page_fl=
ags)
> > > {
> > > @@ -525,6 +556,7 @@ static int xe_ttm_tt_populate(struct
> > > ttm_device=20
> > > *ttm_dev, struct ttm_tt *tt,
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0xe_tt->purgeable =3D false;
> > > =C2=A0=C2=A0=C2=A0=C2=A0xe_ttm_tt_account_add(ttm_to_xe_device(ttm_de=
v), tt);
> > > +=C2=A0=C2=A0=C2=A0 update_global_total_pages(ttm_dev, tt->num_pages)=
;
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0return 0;
> > > }
> > > @@ -541,6 +573,7 @@ static void xe_ttm_tt_unpopulate(struct
> > > ttm_device=20
> > > *ttm_dev, struct ttm_tt *tt)
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0ttm_pool_free(&ttm_dev->pool, tt);
> > > =C2=A0=C2=A0=C2=A0=C2=A0xe_ttm_tt_account_subtract(xe, tt);
> > > +=C2=A0=C2=A0=C2=A0 update_global_total_pages(ttm_dev, -(long)tt->num=
_pages);
> > > }
> > >=20
> > > static void xe_ttm_tt_destroy(struct ttm_device *ttm_dev, struct=20
> > > ttm_tt *tt)
> > > @@ -1653,6 +1686,15 @@ static void xe_gem_object_free(struct=20
> > > drm_gem_object *obj)
> > > =C2=A0=C2=A0=C2=A0=C2=A0ttm_bo_put(container_of(obj, struct ttm_buffe=
r_object,
> > > base));
> > > }
> > >=20
> > > +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> > > +static int xe_gem_object_open(struct drm_gem_object *obj,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
> > > +{
> > > +=C2=A0=C2=A0=C2=A0 update_process_mem(file_priv, obj->size);
> > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > +}
> > > +#endif
> > > +
> > > static void xe_gem_object_close(struct drm_gem_object *obj,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
> > > {
> > > @@ -1665,6 +1707,8 @@ static void xe_gem_object_close(struct=20
> > > drm_gem_object *obj,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_bo_set_bulk_move(&bo->=
ttm, NULL);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xe_bo_unlock(bo);
> > > =C2=A0=C2=A0=C2=A0=C2=A0}
> > > +
> > > +=C2=A0=C2=A0=C2=A0 update_process_mem(file_priv, -obj->size);
> > > }
> > >=20
> > > static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
> > > @@ -1762,6 +1806,9 @@ static const struct vm_operations_struct=20
> > > xe_gem_vm_ops =3D {
> > >=20
> > > static const struct drm_gem_object_funcs xe_gem_object_funcs =3D {
> > > =C2=A0=C2=A0=C2=A0=C2=A0.free =3D xe_gem_object_free,
> > > +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> > > +=C2=A0=C2=A0=C2=A0 .open =3D xe_gem_object_open,
> > > +#endif
> > > =C2=A0=C2=A0=C2=A0=C2=A0.close =3D xe_gem_object_close,
> > > =C2=A0=C2=A0=C2=A0=C2=A0.mmap =3D drm_gem_ttm_mmap,
> > > =C2=A0=C2=A0=C2=A0=C2=A0.export =3D xe_gem_prime_export,
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/=20
> > > xe/xe_device_types.h
> > > index e5d02a47a5287..b797e766ccbc2 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -641,6 +641,14 @@ struct xe_device {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int fsb_freq, mem=
_freq, is_ddr3;
> > > =C2=A0=C2=A0=C2=A0=C2=A0};
> > > #endif
> > > +
> > > +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> > > +=C2=A0=C2=A0=C2=A0 /**
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @global_total_pages: global GPU page usag=
e tracked for
> > > gpu_mem
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * tracepoints
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0 atomic64_t global_total_pages;
> > > +#endif
> > > };
> > >=20
> > > /**
> > > @@ -702,6 +710,14 @@ struct xe_file {
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0/** @refcount: ref count of this xe file */
> > > =C2=A0=C2=A0=C2=A0=C2=A0struct kref refcount;
> > > +
> > > +#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> > > +=C2=A0=C2=A0=C2=A0 /**
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * @process_mem: per-process GPU memory usag=
e tracked for
> > > gpu_mem
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 * tracepoints
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0 atomic64_t process_mem;
> >=20
> > so... this is not per-process, it's actually "per dev node" open.
> > Does
> > this map correctly to the intended use and how it's handled in msm?
>=20
> Per struct drm_file. Yes it is the same, both do it via=20
> drm_gem_object_funcs->open/close.

Sorry this went over my head previously :)

It turns out this does cause issues; Since process_mem is getting
tracked per drm_file, a process with multiple drm_file opens will emit
traces mapping to the same PID entry causing it to overwrite each
other. Eg we actually end up showing the process_mem from the most
recent drm_file trace emitted for that PID, not the collective total of
all drm_file's for that PID...

We'd probably need to add a new field to the ABI; ~ctx_id and let
userspace combine them to get the actual process total.

For now though, it turns out the Android requirement will be satisfied
with just the global_total so for v5 I'll drop process_mem tracking and
evaluate how to add it back later as we have to worry about backwards-
compat for the gpu_trace ABI on Android.

Regards
Juston

> Regards,
>=20
> Tvrtko
>=20
> >=20
> > Lucas De Marchi
> >=20
> > > +#endif
> > > };
> > >=20
> > > #endif
> > > --=20
> > > 2.50.0.rc1.591.g9c95f17f64-goog
> > >=20
