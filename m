Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D14AB6D79
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 15:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4BE10E090;
	Wed, 14 May 2025 13:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eGqpfkEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C5EA89A4E;
 Wed, 14 May 2025 13:57:14 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3da741bcedcso13238135ab.1; 
 Wed, 14 May 2025 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747231033; x=1747835833; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MgCmvbU22TlHNQI/j8glSzzRZPdd5Tz37NOzI6EnK/c=;
 b=eGqpfkEQZnpYBtI4EM9Q5rNTA555ElPoueuIK8g5ps7mOg9WQpzRFLVVZCS3jxUsNE
 PEvg2rrD33yoYS37LuLgb1AgkJltdE5REtvU82gSeoTvfGaag95nkNe7qeMFC0o8T3uu
 ydbnMjK95hvmE2Xecs/fW0X+Meqp8S3WSFBh2aN9oZYbulGTDnMgkXhxwcqJUapeZPV8
 DIIXFNQjeYA36ZzOK+cQxwPNa3GD/xGC7aQXsP72Lqcui1KuZCOv3XlGzd2fxdtS9UVY
 GbH9wZg4+73g9PskhZpbnxa4VvC02c646Xbkerj3pO+1lgCY+Kc3kvBDktZaFLnIXXmm
 ks6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747231033; x=1747835833;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MgCmvbU22TlHNQI/j8glSzzRZPdd5Tz37NOzI6EnK/c=;
 b=q6rVpa0Fnag1IjVtCVtI9OvuQPjQOfnEls+iCBFtHVk+vWbDIcmRL4JIDN1nTSZzVB
 yfyz+1NaDUhu+vslhZrYmLnen7RuDrFFZqHM8jakuANAED+7OCvhqeegzEsIwHmHDeZB
 8ItAMTHXS5lADFhkXW7k4LGP6WKpfHZ44JJn7FR6T9uWT2FVuGzA0aNyLuxyurLcGuDt
 RUzprxuuP+HgFfczKk7L6i/K8N8x+sKdj5PO4UnHUbIpFcPEnGRJAx7hTVPhF1VJJTuE
 B/4mg71KqG/ClueHPxAMGLeiAwtP+duzoKxMHu8yxGxZqKgqQxGpKcw1pJoGZIjGUZAE
 dxHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8OIYo2plj7uzPfdcYzxjhGmTmX7Qn+P9G56co79Zo3tdjc7Ng5CQnAZtdq1+E8UrkGaxWTUkLAAQ=@lists.freedesktop.org,
 AJvYcCVdOUc3fCHM1z/J75udWU44R3Xn8eFsL0cl9ihcoy4GYwPh2vGlHdUJ176UW2RDRrlECZ+3DRspPtwo@lists.freedesktop.org,
 AJvYcCWlTjgtz4zer9aNQ4Kx0ae30PR699D+xhiaLLVPQHEnK4jrP8ZXeoc7HbMTmRlGPXDVJJPTJb7q@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLR5f+wSUAwWqZi4hxyqqjjghChzFibJYJECO9Z+2pXPc5fyG3
 /HVVyoWsZnMEzq94R6/cCOzrJfIVTuUKrIXBCXxYeElLDGbjlhgDxDlGY7RJ5z9yYMVBA8kDHwu
 tUf/m5hyIUCDopxZCcDDFKo5/zW0=
X-Gm-Gg: ASbGncs5Qbflio33VaaiVbcRdTV4PNub+ZlX8egPb1pFj8msjzyAyIycRJe6pUykZt0
 54i/50VyCysxx8dIJwH+d5JTq5bdzpSHLu+CXoKaCdgeBqiQgx1arSaDPQTRr4NqGAWOVE6xD1Z
 qE5Y0H5lM3TyMHu0e2MwCIac2VW48fl1sf
X-Google-Smtp-Source: AGHT+IE42TmblYaLtD0IQrSrhpiLKxuUdkN+txUzkzbyrrbRU6Tz+L9MbbrnGz7ZIIHPzBwsN83m/OUcsivazuYW8nw=
X-Received: by 2002:a05:6e02:2503:b0:3d3:db70:b585 with SMTP id
 e9e14a558f8ab-3db6f7fa09fmr40763325ab.21.1747231032651; Wed, 14 May 2025
 06:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-11-tvrtko.ursulin@igalia.com>
 <CAF6AEGuOC4NnSTQexvD5tk8VLfOR_gGq-cqs3gnJcS1qNtMjQg@mail.gmail.com>
 <dddebe25-9fe2-4c3d-89ee-c90168b5a017@igalia.com>
In-Reply-To: <dddebe25-9fe2-4c3d-89ee-c90168b5a017@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 14 May 2025 06:57:01 -0700
X-Gm-Features: AX0GCFu9_cD6xBE41jTXRzOPv3Dbpx1RYAvoYeJn3S6DUuFSDJFfxf64WuPvA44
Message-ID: <CAF6AEGsP2TyjaRVtSXAYyDbNJqZ3NsL-2TCKZ+SAyZaONrJvjA@mail.gmail.com>
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
 kernel-dev@igalia.com, Rob Clark <robdclark@chromium.org>
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

On Wed, May 14, 2025 at 3:01=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@igalia.com> wrote:
>
>
> On 13/05/2025 15:16, Rob Clark wrote:
> > On Fri, May 9, 2025 at 8:34=E2=80=AFAM Tvrtko Ursulin <tvrtko.ursulin@i=
galia.com> wrote:
> >>
> >> Dma-fence objects currently suffer from a potential use after free pro=
blem
> >> where fences exported to userspace and other drivers can outlive the
> >> exporting driver, or the associated data structures.
> >>
> >> The discussion on how to address this concluded that adding reference
> >> counting to all the involved objects is not desirable, since it would =
need
> >> to be very wide reaching and could cause unloadable drivers if another
> >> entity would be holding onto a signaled fence reference potentially
> >> indefinitely.
> >>
> >> This patch enables the safe access by introducing and documenting a
> >> contract between fence exporters and users. It documents a set of
> >> contraints and adds helpers which a) drivers with potential to suffer =
from
> >> the use after free must use and b) users of the dma-fence API must use=
 as
> >> well.
> >>
> >> Premise of the design has multiple sides:
> >>
> >> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
> >> signalling a fence and freeing the driver private data associated with=
 it.
> >>
> >> The grace period does not have to follow the signalling immediately bu=
t
> >> HAS to happen before data is freed.
> >>
> >> 2. Users of the dma-fence API marked with such requirement MUST contai=
n
> >> the complete access to the data within a single code block guarded by =
the
> >> new dma_fence_access_begin() and dma_fence_access_end() helpers.
> >>
> >> The combination of the two ensures that whoever sees the
> >> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
> >> valid fence->lock and valid data potentially accessed by the fence->op=
s
> >> virtual functions, until the call to dma_fence_access_end().
> >>
> >> 3. Module unload (fence->ops) disappearing is for now explicitly not
> >> handled. That would required a more complex protection, possibly needi=
ng
> >> SRCU instead of RCU to handle callers such as dma_fence_wait_timeout()=
,
> >> where race between dma_fence_enable_sw_signaling, signalling, and
> >> dereference of fence->ops->wait() would need a sleeping SRCU context.
> >>
> >> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >> ---
> >>   drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++++++++++++=
++
> >>   include/linux/dma-fence.h   | 32 ++++++++++++-----
> >>   2 files changed, 93 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> >> index dc2456f68685..cfe1d7b79c22 100644
> >> --- a/drivers/dma-buf/dma-fence.c
> >> +++ b/drivers/dma-buf/dma-fence.c
> >> @@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
> >>          struct dma_fence *fence =3D
> >>                  container_of(kref, struct dma_fence, refcount);
> >>
> >> +       dma_fence_access_begin();
> >>          trace_dma_fence_destroy(fence);
> >>
> >>          if (WARN(!list_empty(&fence->cb_list) &&
> >> @@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
> >>                  fence->ops->release(fence);
> >>          else
> >>                  dma_fence_free(fence);
> >> +
> >> +       dma_fence_access_end();
> >>   }
> >>   EXPORT_SYMBOL(dma_fence_release);
> >>
> >> @@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
> >>    */
> >>   void dma_fence_describe(struct dma_fence *fence, struct seq_file *se=
q)
> >>   {
> >> +       dma_fence_access_begin();
> >>          seq_printf(seq, "%s %s seq %llu %ssignalled\n",
> >>                     dma_fence_driver_name(fence),
> >>                     dma_fence_timeline_name(fence),
> >>                     fence->seqno,
> >>                     dma_fence_is_signaled(fence) ? "" : "un");
> >> +       dma_fence_access_end();
> >>   }
> >>   EXPORT_SYMBOL(dma_fence_describe);
> >>
> >> @@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, const=
 struct dma_fence_ops *ops,
> >>          __set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
> >>   }
> >>   EXPORT_SYMBOL(dma_fence_init64);
> >> +
> >> +/**
> >> + * dma_fence_driver_name - Access the driver name
> >> + * @fence: the fence to query
> >> + *
> >> + * Returns a driver name backing the dma-fence implementation.
> >> + *
> >> + * IMPORTANT CONSIDERATION:
> >> + * Dma-fence contract stipulates that access to driver provided data =
(data not
> >> + * directly embedded into the object itself), such as the &dma_fence.=
lock and
> >> + * memory potentially accessed by the &dma_fence.ops functions, is fo=
rbidden
> >> + * after the fence has been signalled. Drivers are allowed to free th=
at data,
> >> + * and some do.
> >> + *
> >> + * To allow safe access drivers are mandated to guarantee a RCU grace=
 period
> >> + * between signalling the fence and freeing said data.
> >> + *
> >> + * As such access to the driver name is only valid inside a RCU locke=
d section.
> >> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE blo=
ck guarded
> >> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> >> + */
> >> +const char *dma_fence_driver_name(struct dma_fence *fence)
> >> +{
> >> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> >> +                        "rcu_read_lock() required for safe access to =
returned string");
> >> +
> >> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> >> +               return fence->ops->get_driver_name(fence);
> >> +       else
> >> +               return "detached-driver";
> >> +}
> >> +EXPORT_SYMBOL(dma_fence_driver_name);
> >> +
> >> +/**
> >> + * dma_fence_timeline_name - Access the timeline name
> >> + * @fence: the fence to query
> >> + *
> >> + * Returns a timeline name provided by the dma-fence implementation.
> >> + *
> >> + * IMPORTANT CONSIDERATION:
> >> + * Dma-fence contract stipulates that access to driver provided data =
(data not
> >> + * directly embedded into the object itself), such as the &dma_fence.=
lock and
> >> + * memory potentially accessed by the &dma_fence.ops functions, is fo=
rbidden
> >> + * after the fence has been signalled. Drivers are allowed to free th=
at data,
> >> + * and some do.
> >> + *
> >> + * To allow safe access drivers are mandated to guarantee a RCU grace=
 period
> >> + * between signalling the fence and freeing said data.
> >> + *
> >> + * As such access to the driver name is only valid inside a RCU locke=
d section.
> >> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE blo=
ck guarded
> >> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> >> + */
> >> +const char *dma_fence_timeline_name(struct dma_fence *fence)
> >> +{
> >> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> >> +                        "rcu_read_lock() required for safe access to =
returned string");
> >> +
> >> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> >> +               return fence->ops->get_driver_name(fence);
> >> +       else
> >> +               return "signaled-timeline";
> >
> > This means that trace_dma_fence_signaled() will get the wrong
> > timeline/driver name, which probably screws up perfetto and maybe
> > other tools.
>
> Do you think context and seqno are not enough for those tools and they
> actually rely on the names? It would sound weird if they decided to
> index anything on the names which are non-standardised between drivers,
> but I guess anything is possible.

At some point perfetto uses the timeline name to put up a named fence
timeline, I'm not sure if it is using the name or context # for
subsequent fence events (namely, signalled).  I'd have to check the
code and get back to you.

There is also gpuvis, which I guess does something similar, but
haven't looked into it.  Idk if there are others.

> > Maybe it would work well enough just to move the
> > trace_dma_fence_signaled() call ahead of the test_and_set_bit()?  Idk
> > if some things will start getting confused if they see that trace
> > multiple times.
>
> Another alternative is to make this tracepoint access the names
> directly. It is under the lock so guaranteed not to get freed with
> drivers which will be made compliant with the documented rules.

I guess it would have been better if, other than dma_fence_init
tracepoint, later tracepoints didn't include the driver/timeline
name.. that would have forced the use of the context.  But I guess too
late for that.  Perhaps the least bad thing to do is use the locking?

BR,
-R
