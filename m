Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C53CAD7A06
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 20:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9487610E095;
	Thu, 12 Jun 2025 18:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="4tbrhifN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC41C10E0E8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 18:54:12 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2357c61cda7so29385ad.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 11:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1749754451; x=1750359251;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q/ujh3/5vqQQHx/k29tdx2BhG8SWtHTOJrjeipzmEsQ=;
 b=4tbrhifNDSym2RlzkygP8RnL5uhh35a5101i4JZROCfd5kdbMVShrO7nWKp18YQPKf
 6s17AHk6ZAC09twY2qjvpad637Pm5I7dgvt18j1+9Snhz3jCE59uvy5PfmA+ILJdbL4V
 eguUjLH7FZequ9Nmq/QoqbHbIl0xsnk56HYOmleP3hMGygugLuv1tPtwzMQ4nrSOH9fu
 G9bS9d64UL6UNZ9jE42RMa/4OQa6Cj/cWXOjk/XHI0Zc9MEAvKGwHGLKwCi5o5BGkhhD
 hsWluMQrmyrDSe8e5gj0X1AjmP7vfnZOiHQzDo+6Ei/j0FeQ+izBmjUhHqNzgCbU8vZ5
 AZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749754451; x=1750359251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q/ujh3/5vqQQHx/k29tdx2BhG8SWtHTOJrjeipzmEsQ=;
 b=Z8Vqh8o5T1MbVZEFRnzRDFSXtPtuL22L2wZ7vM8/RuamT+9p7GVTDFagROfpiTOe+j
 fBz08Yqh64QxbirGkp2LO1Kl/ZCTTzmZvYZBIv6W/eCO9BJdrn3ION17WCaof+7SU9JO
 2ztv2DOJSfp/8blrK/tbgq8rCVW757ktX30aE+RpbInOBvhOSZNI4LcAJd1RUdFOgPxx
 r2OIDGmLwlqNW8w4yVkNgXuplynRnngTLN4hwvGE8N2Thec6ZlkzigSsiqSzsPz8jUib
 BSy0P0Xi/gbtQ7N9VjGmFMQJcLSkOTIdsiKVz0F+1XDFr8YHsVCbFZ3IVTE4eJDoTShs
 GQxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS6jpHCLIebsipTgs6Z0bHwyevPCNdyz65AIUjQ874Qknu/ZR6UF2HporzZmcmXmMRyjSE3sJR+Jg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMEA09GQBOCvnXWMVFYtBSQWb2ZKALKnxLW3mocpE0WcIJonyR
 t0r5cy+onQYJQWXWb3Q+c50QbyLG3hpmZeKSDXC40941K70+/W2nmTPmEE28sVKkNwXtaEJBPmI
 CYZfx7Nd1VjhWrnGkJmjVDaOuNJOvX1EuLZUp5m8=
X-Gm-Gg: ASbGncvZ5QnRvCexJ7mzriZ99sTar/GMJz+T1esG3cb+WR590pq5/n7mGaAixxTZJKn
 i1vXdrg5Ow8AGK3dTWqs2uSBtLRyQMPXqIvuSoNIm1IsuRkDk73M9mM46AN+e9qCI1Cm7r0MxNu
 LwD5xb6mLnS/i+8KGnzSWePK82mMHfxzHCkUxCT6M3s3TeYFpSxeCCkfx5aiRay2VYU/L/XxVTi
 OuLG4WCRLBsDg==
X-Google-Smtp-Source: AGHT+IFLMwOTtUYsAx6xAij+1Syo8iAX108mf5Ye5v+C5MuLx8msp2e28vZFe59t+Yq/+NR+QxacAWLZ9CtRVdtiGHs=
X-Received: by 2002:a17:902:f68e:b0:235:e8da:8e1 with SMTP id
 d9443c01a7336-2365e958b9bmr91225ad.18.1749754450607; Thu, 12 Jun 2025
 11:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250611225145.1739201-1-justonli@chromium.org>
 <20250611225145.1739201-2-justonli@chromium.org>
 <mrfsys5djmsbotxlaahed5ogmofn4pkmgqfhl47rj3bwxdtlbv@7xbekwpkte57>
 <37a5f250-1c19-4b95-882b-b4ef3e5c6268@igalia.com>
 <p7wq3wrsddp7pk7bk5follhkc4f7ybgmc2o4e652jc2cfuqbhh@tckgwpy3khcn>
In-Reply-To: <p7wq3wrsddp7pk7bk5follhkc4f7ybgmc2o4e652jc2cfuqbhh@tckgwpy3khcn>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Thu, 12 Jun 2025 11:53:58 -0700
X-Gm-Features: AX0GCFv7aYTTGhbOvIbhtXDVsf05e4kPRfikE7NBXIYQpZHKE4ONyE8LXGXfYDY
Message-ID: <CAKT=dDkjYQUSwtYwFTvWppn-2sTdwYu_FE2jfhGXd6vWkQHvgg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/xe/bo: add GPU memory trace points
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Juston Li <justonli@chromium.org>, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rodrigo Vivi <rodrigo.vivi@intel.com>
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

On Thu, Jun 12, 2025 at 11:02=E2=80=AFAM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Thu, Jun 12, 2025 at 05:46:52PM +0100, Tvrtko Ursulin wrote:
> >
> >On 12/06/2025 06:40, Lucas De Marchi wrote:
> >>On Wed, Jun 11, 2025 at 03:51:24PM -0700, Juston Li wrote:
> >>>Add TRACE_GPU_MEM tracepoints for tracking global and per-process GPU
> >>>memory usage.
> >>>
> >>>These are required by VSR on Android 12+ for reporting GPU driver memo=
ry
> >>>allocations.
> >>>
> >>>v3:
> >>>- Use now configurable CONFIG_TRACE_GPU_MEM instead of adding a
> >>>  per-driver Kconfig (Lucas)
> >>>
> >>>v2:
> >>>- Use u64 as preferred by checkpatch (Tvrtko)
> >>>- Fix errors in comments/Kconfig description (Tvrtko)
> >>>- drop redundant "CONFIG" in Kconfig
> >>>
> >>>Signed-off-by: Juston Li <justonli@chromium.org>
> >>>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>>---
> >>>drivers/gpu/drm/xe/xe_bo.c           | 47 ++++++++++++++++++++++++++++
> >>>drivers/gpu/drm/xe/xe_device_types.h | 16 ++++++++++
> >>>2 files changed, 63 insertions(+)
> >>>
> >>>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> >>>index 4e39188a021ab..89a3d23e3b800 100644
> >>>--- a/drivers/gpu/drm/xe/xe_bo.c
> >>>+++ b/drivers/gpu/drm/xe/xe_bo.c
> >>>@@ -19,6 +19,8 @@
> >>>
> >>>#include <kunit/static_stub.h>
> >>>
> >>>+#include <trace/events/gpu_mem.h>
> >>>+
> >>>#include "xe_device.h"
> >>>#include "xe_dma_buf.h"
> >>>#include "xe_drm_client.h"
> >>>@@ -418,6 +420,35 @@ static void xe_ttm_tt_account_subtract(struct
> >>>xe_device *xe, struct ttm_tt *tt)
> >>>        xe_shrinker_mod_pages(xe->mem.shrinker, -(long)tt->num_pages, =
0);
> >>>}
> >>>
> >>>+#if IS_ENABLED(CONFIG_TRACE_GPU_MEM)
> >>>+static void update_global_total_pages(struct ttm_device *ttm_dev,
> >>>long num_pages)
> >>>+{
> >>>+    struct xe_device *xe =3D ttm_to_xe_device(ttm_dev);
> >>>+    u64 global_total_pages =3D
> >>>+        atomic64_add_return(num_pages, &xe->global_total_pages);
> >>>+
> >>>+    trace_gpu_mem_total(0, 0, global_total_pages << PAGE_SHIFT);
> >>>+}
> >>>+
> >>>+static void update_process_mem(struct drm_file *file, ssize_t size)
> >>>+{
> >>>+    struct xe_file *xef =3D to_xe_file(file);
> >>>+    u64 process_mem =3D atomic64_add_return(size, &xef->process_mem);
> >>>+
> >>>+    rcu_read_lock(); /* Locks file->pid! */
> >>>+    trace_gpu_mem_total(0, pid_nr(rcu_dereference(file->pid)),
> >>>process_mem);
> >>
> >>Isn't the first arg supposed to be the gpu id? Doesn't this become
> >>invalid when I have e.g. LNL + BMG and the trace is enabled?
> >
> >Good point.
> >
> >u32 gpu_id does not seem possible to map to anything useful.
>
> maybe minor_id? although I'm not sure if the intention is to share this
> outside drm as seems the case.

Yes, that was for render minor in the case of drm.

>
> >
> >Shall we replace it with a string obtained from dev_name(struct device
> >*) ? As only Android parses them I think we can get still away with
> >changing the tracepoints ABI.
>
> works for me too. Is Android actually parsing it or just ignoring?
> Because afaics it's always 0 in msm.

Android has used it as part of the bpf map key:
https://cs.android.com/android/platform/superproject/main/+/main:frameworks=
/native/services/gpuservice/bpfprogs/gpuMem.c

>
> Lucas De Marchi
