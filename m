Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F591AB7003
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 17:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE7710E675;
	Wed, 14 May 2025 15:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K03nUuVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
 [209.85.166.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDE610E670;
 Wed, 14 May 2025 15:38:17 +0000 (UTC)
Received: by mail-il1-f176.google.com with SMTP id
 e9e14a558f8ab-3da739653b2so24046185ab.0; 
 Wed, 14 May 2025 08:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747237097; x=1747841897; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1LoXk61oIPBafF9IIlAcC3BA14YR2/yu0PVLlM3XziM=;
 b=K03nUuVuHr/Tp0IWGdXtwT/V8usOvSNsvqzb2hdD+KngpJ7elD7C6KlubRfODHL61h
 MRuD3npz/ph8y95871BcnV+QJdxdLi6VYvVgNxOrKmyeNEr11I/g1bz2kws3Vf7ZDw5p
 jXdznJN0q8CqXLNNq0iH8ss8lQ3hGtxDHZPADt/U81YdUucePQTqlPhzkdhVOYNhjrWb
 9NaEqPXpcl2KzVaeBU3CMQXb6AhoEPL8VFukwC2gLxBSuy7XOk/kaKPLJlZNfEhoikK/
 r7LW9soruw796hlJl9mNIFhXzIozaKJlYs1D8DuvTl6mrOe9GijwJ67pzCq0AoPdOkJo
 c/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747237097; x=1747841897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1LoXk61oIPBafF9IIlAcC3BA14YR2/yu0PVLlM3XziM=;
 b=iFzklXAM8xYnS0G3mQhL1rw615jX0zIktMcpA9k6TgXcyRNNRoQ1xh898M/6SiOPkD
 kJfDlDh6o0CbgGgtqaaD9p4+XaLOD6dfuNfUczI75Nk2IFZJJrhy4+R1uXUCVRwdqYOe
 QNzhIKhtaXtFpqi4z/oHmLqzyT9g/yYSdWPpSEOC6rcqEXFwU9rKYID0N3iaENKLpEbx
 ZB1Wdh2g6obMq7E3B63n2WFHR/VDEgLGlaagZ8ijPqhBoJH+DSAwnPHqpB4lsQKkIClJ
 7gxEiDbjPnKrXt196FENxrxu8CkeBqdhSIsG0NnjPlb+ae3guv7HA/GJpHNs3agRIdeo
 5fZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUawVWWxj+Fv+qXeuZcugFyK+5sIiZh/Amd/8zCrNJXjTx/SDOLW8yxMVyCMk2wc9SZmm5sILJz@lists.freedesktop.org,
 AJvYcCUhT6WaelJkBHzRMk9N4S39NqyoMeSNeF6FITaxewhMDQgquwqcb1xkNWtec+NCbYFOea0TJhZQ47V8@lists.freedesktop.org,
 AJvYcCWsrTdUV0jVxnI8oO1ZilklPevEtwJywgOyBQ84xdgiESPtyCJuStgJqJ4eMjhwzgiUwT5baXAPLKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4EXW9ULdiB/ZnQW8AWaXvbrrlyB6+9wNwJul1e7djYnQ8fqyE
 O5WlmI3NGVvel/yvfv4Yc/CqH4dp4ivnHA31CYnVCz+zxC6x6eEicOLlcDATjHly2FELIt0+Xwp
 5TcPHZm8hpufsKhJTi3OADv1CRtc=
X-Gm-Gg: ASbGncsBgPdqLI+t2x+jUFpnJi5GlCeV77zeSHlOWgT0vKNHmAVAx1BzJhUtQeM0W99
 L0CAKGVKSGLd4VCqbLDj/UsYan/i5pTcS824aV4hhKV0KxzCfGcjr+bB3PGYLmOBUn8pO1CEjOP
 dYgjxbncgUU4BAaLsEeiW+Wn5o1j0JzOOQY2SIOlxVjPUC7hbxYtVJGAHqZM4nkg==
X-Google-Smtp-Source: AGHT+IEsKXRO4rCv7VVmECVH6gnJsI6ggcy/26/VlehMp48QAKyy00D5SvWKHExtpRWv4vkYvb6OQnmMaz28ZHbU0CA=
X-Received: by 2002:a05:6e02:1605:b0:3d9:6cd9:5074 with SMTP id
 e9e14a558f8ab-3db6f7f19cfmr41036615ab.16.1747237096796; Wed, 14 May 2025
 08:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-11-tvrtko.ursulin@igalia.com>
 <CAF6AEGuOC4NnSTQexvD5tk8VLfOR_gGq-cqs3gnJcS1qNtMjQg@mail.gmail.com>
 <dddebe25-9fe2-4c3d-89ee-c90168b5a017@igalia.com>
 <CAF6AEGsP2TyjaRVtSXAYyDbNJqZ3NsL-2TCKZ+SAyZaONrJvjA@mail.gmail.com>
 <3cdf8bf9-1807-496e-baf4-8c069df3fdc1@igalia.com>
In-Reply-To: <3cdf8bf9-1807-496e-baf4-8c069df3fdc1@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 14 May 2025 08:38:04 -0700
X-Gm-Features: AX0GCFt70bRGIXZRzMncV2__PoGPpZ3VBD_5macze4QWiN-31Y70AxZWgBtjrvk
Message-ID: <CAF6AEGumRDD0n+S4U1pmjXbpttzw1K4fJhpHuAzF-bB9wRCtDw@mail.gmail.com>
Subject: Re: [RFC v2 10/13] dma-fence: Add safe access helpers and document
 the rules
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, amd-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 kernel-dev@igalia.com, Rob Clark <robdclark@chromium.org>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
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

On Wed, May 14, 2025 at 7:58=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
>
> On 14/05/2025 14:57, Rob Clark wrote:
> > On Wed, May 14, 2025 at 3:01=E2=80=AFAM Tvrtko Ursulin
> > <tvrtko.ursulin@igalia.com> wrote:
> >>
> >>
> >> On 13/05/2025 15:16, Rob Clark wrote:
> >>> On Fri, May 9, 2025 at 8:34=E2=80=AFAM Tvrtko Ursulin <tvrtko.ursulin=
@igalia.com> wrote:
> >>>>
> >>>> Dma-fence objects currently suffer from a potential use after free p=
roblem
> >>>> where fences exported to userspace and other drivers can outlive the
> >>>> exporting driver, or the associated data structures.
> >>>>
> >>>> The discussion on how to address this concluded that adding referenc=
e
> >>>> counting to all the involved objects is not desirable, since it woul=
d need
> >>>> to be very wide reaching and could cause unloadable drivers if anoth=
er
> >>>> entity would be holding onto a signaled fence reference potentially
> >>>> indefinitely.
> >>>>
> >>>> This patch enables the safe access by introducing and documenting a
> >>>> contract between fence exporters and users. It documents a set of
> >>>> contraints and adds helpers which a) drivers with potential to suffe=
r from
> >>>> the use after free must use and b) users of the dma-fence API must u=
se as
> >>>> well.
> >>>>
> >>>> Premise of the design has multiple sides:
> >>>>
> >>>> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
> >>>> signalling a fence and freeing the driver private data associated wi=
th it.
> >>>>
> >>>> The grace period does not have to follow the signalling immediately =
but
> >>>> HAS to happen before data is freed.
> >>>>
> >>>> 2. Users of the dma-fence API marked with such requirement MUST cont=
ain
> >>>> the complete access to the data within a single code block guarded b=
y the
> >>>> new dma_fence_access_begin() and dma_fence_access_end() helpers.
> >>>>
> >>>> The combination of the two ensures that whoever sees the
> >>>> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to =
a
> >>>> valid fence->lock and valid data potentially accessed by the fence->=
ops
> >>>> virtual functions, until the call to dma_fence_access_end().
> >>>>
> >>>> 3. Module unload (fence->ops) disappearing is for now explicitly not
> >>>> handled. That would required a more complex protection, possibly nee=
ding
> >>>> SRCU instead of RCU to handle callers such as dma_fence_wait_timeout=
(),
> >>>> where race between dma_fence_enable_sw_signaling, signalling, and
> >>>> dereference of fence->ops->wait() would need a sleeping SRCU context=
.
> >>>>
> >>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >>>> ---
> >>>>    drivers/dma-buf/dma-fence.c | 69 ++++++++++++++++++++++++++++++++=
+++++
> >>>>    include/linux/dma-fence.h   | 32 ++++++++++++-----
> >>>>    2 files changed, 93 insertions(+), 8 deletions(-)
> >>>>
> >>>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence=
.c
> >>>> index dc2456f68685..cfe1d7b79c22 100644
> >>>> --- a/drivers/dma-buf/dma-fence.c
> >>>> +++ b/drivers/dma-buf/dma-fence.c
> >>>> @@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
> >>>>           struct dma_fence *fence =3D
> >>>>                   container_of(kref, struct dma_fence, refcount);
> >>>>
> >>>> +       dma_fence_access_begin();
> >>>>           trace_dma_fence_destroy(fence);
> >>>>
> >>>>           if (WARN(!list_empty(&fence->cb_list) &&
> >>>> @@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
> >>>>                   fence->ops->release(fence);
> >>>>           else
> >>>>                   dma_fence_free(fence);
> >>>> +
> >>>> +       dma_fence_access_end();
> >>>>    }
> >>>>    EXPORT_SYMBOL(dma_fence_release);
> >>>>
> >>>> @@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
> >>>>     */
> >>>>    void dma_fence_describe(struct dma_fence *fence, struct seq_file =
*seq)
> >>>>    {
> >>>> +       dma_fence_access_begin();
> >>>>           seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> >>>>                      dma_fence_driver_name(fence),
> >>>>                      dma_fence_timeline_name(fence),
> >>>>                      fence->seqno,
> >>>>                      dma_fence_is_signaled(fence) ? "" : "un");
> >>>> +       dma_fence_access_end();
> >>>>    }
> >>>>    EXPORT_SYMBOL(dma_fence_describe);
> >>>>
> >>>> @@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, con=
st struct dma_fence_ops *ops,
> >>>>           __set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
> >>>>    }
> >>>>    EXPORT_SYMBOL(dma_fence_init64);
> >>>> +
> >>>> +/**
> >>>> + * dma_fence_driver_name - Access the driver name
> >>>> + * @fence: the fence to query
> >>>> + *
> >>>> + * Returns a driver name backing the dma-fence implementation.
> >>>> + *
> >>>> + * IMPORTANT CONSIDERATION:
> >>>> + * Dma-fence contract stipulates that access to driver provided dat=
a (data not
> >>>> + * directly embedded into the object itself), such as the &dma_fenc=
e.lock and
> >>>> + * memory potentially accessed by the &dma_fence.ops functions, is =
forbidden
> >>>> + * after the fence has been signalled. Drivers are allowed to free =
that data,
> >>>> + * and some do.
> >>>> + *
> >>>> + * To allow safe access drivers are mandated to guarantee a RCU gra=
ce period
> >>>> + * between signalling the fence and freeing said data.
> >>>> + *
> >>>> + * As such access to the driver name is only valid inside a RCU loc=
ked section.
> >>>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE b=
lock guarded
> >>>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> >>>> + */
> >>>> +const char *dma_fence_driver_name(struct dma_fence *fence)
> >>>> +{
> >>>> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> >>>> +                        "rcu_read_lock() required for safe access t=
o returned string");
> >>>> +
> >>>> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> >>>> +               return fence->ops->get_driver_name(fence);
> >>>> +       else
> >>>> +               return "detached-driver";
> >>>> +}
> >>>> +EXPORT_SYMBOL(dma_fence_driver_name);
> >>>> +
> >>>> +/**
> >>>> + * dma_fence_timeline_name - Access the timeline name
> >>>> + * @fence: the fence to query
> >>>> + *
> >>>> + * Returns a timeline name provided by the dma-fence implementation=
.
> >>>> + *
> >>>> + * IMPORTANT CONSIDERATION:
> >>>> + * Dma-fence contract stipulates that access to driver provided dat=
a (data not
> >>>> + * directly embedded into the object itself), such as the &dma_fenc=
e.lock and
> >>>> + * memory potentially accessed by the &dma_fence.ops functions, is =
forbidden
> >>>> + * after the fence has been signalled. Drivers are allowed to free =
that data,
> >>>> + * and some do.
> >>>> + *
> >>>> + * To allow safe access drivers are mandated to guarantee a RCU gra=
ce period
> >>>> + * between signalling the fence and freeing said data.
> >>>> + *
> >>>> + * As such access to the driver name is only valid inside a RCU loc=
ked section.
> >>>> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE b=
lock guarded
> >>>> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> >>>> + */
> >>>> +const char *dma_fence_timeline_name(struct dma_fence *fence)
> >>>> +{
> >>>> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> >>>> +                        "rcu_read_lock() required for safe access t=
o returned string");
> >>>> +
> >>>> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> >>>> +               return fence->ops->get_driver_name(fence);
> >>>> +       else
> >>>> +               return "signaled-timeline";
> >>>
> >>> This means that trace_dma_fence_signaled() will get the wrong
> >>> timeline/driver name, which probably screws up perfetto and maybe
> >>> other tools.
> >>
> >> Do you think context and seqno are not enough for those tools and they
> >> actually rely on the names? It would sound weird if they decided to
> >> index anything on the names which are non-standardised between drivers=
,
> >> but I guess anything is possible.
> >
> > At some point perfetto uses the timeline name to put up a named fence
> > timeline, I'm not sure if it is using the name or context # for
> > subsequent fence events (namely, signalled).  I'd have to check the
> > code and get back to you.
>
> If you can it would be useful. Presumably it saves the names from the
> start edge of fence lifetime. But again, who knows.

Ok, it looks like perfetto is ok... mostly..
DrmTracker::GetFenceTimelineByContext() will try to lookup the
timeline by context #, and then if that fails, create a new timeline
with the name from the trace event, and add it to the hashmap.

It might be that "signaled-timeline" shows up if the first event seen
is the fence-signaled event.

> > There is also gpuvis, which I guess does something similar, but
> > haven't looked into it.  Idk if there are others.
>
> I know GpuVis uses DRM sched tracepoints since Pierre-Eric was
> explaining me about those in the context of tracing rework he did there.
> I am not sure about dma-fence tracepoints.
>
> +Pierre-Eric on the off chance you know from the top of your head how
> much GpuVis depends on them (dma-fence tracepoints).
>
> >>> Maybe it would work well enough just to move the
> >>> trace_dma_fence_signaled() call ahead of the test_and_set_bit()?  Idk
> >>> if some things will start getting confused if they see that trace
> >>> multiple times.
> >>
> >> Another alternative is to make this tracepoint access the names
> >> directly. It is under the lock so guaranteed not to get freed with
> >> drivers which will be made compliant with the documented rules.
> >
> > I guess it would have been better if, other than dma_fence_init
> > tracepoint, later tracepoints didn't include the driver/timeline
> > name.. that would have forced the use of the context.  But I guess too
> > late for that.  Perhaps the least bad thing to do is use the locking?
>
> You mean this last alternative I mentioned? I think that will work fine.
> I'll wait a little bit longer for more potential comments before re-spi
> ning with that.

yes

> Were you able to test the series for your use case? Assuming it is not
> upstream msm since I don't immediately see a path in msm_fence which
> gets freed at runtime?

Not yet, but I think it should because it is the exact same problem
your igt test triggers.

This is with my VM_BIND series, which will dynamically create/teardown
sched entities

BR,
-R
