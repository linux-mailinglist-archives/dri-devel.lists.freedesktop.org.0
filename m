Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAD48712DB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 03:04:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36BC1112837;
	Tue,  5 Mar 2024 02:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dEFYMIVo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF483112834;
 Tue,  5 Mar 2024 02:04:06 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-51321e71673so5901415e87.2; 
 Mon, 04 Mar 2024 18:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709604245; x=1710209045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tNlCYCD3A5X7opMa78QyTbPYgKpu//YZT0Q5xl7o9vw=;
 b=dEFYMIVoX3+2gmAlVnT+dtn8tnfQfZfyoQIoJt7VO5i950CwM7zD7PVx4MXE3KM5pH
 cPGxXjlQyTi2yFTEv0aAtVJPHaLmigu+XRpb9lKk4d1MQEzYCGzzBOTO9COfgkgkSdQh
 T3o3GzR9qxLt4+R1OzpKQADbdULkdMklAkNHHweRQn5CXIdaokDLp9355nvqZFs8hhqj
 GYoym77fM9nRShknOPu58gglsSAftwFUh1CdMzgnKI4ZdNQ+KjRcZ6yEjBf9wXi4MajV
 X4LVeke6PRGi9M4ANbW+RTdwFw6/PJygnVc3SJJuojuCj0U8Gtw81J3OfEffA8lGu7sy
 vgHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709604245; x=1710209045;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tNlCYCD3A5X7opMa78QyTbPYgKpu//YZT0Q5xl7o9vw=;
 b=C1SpR4zAsR6nYZzDRxpsDi9yTqlR8hMi8/TSSJry3u7C8mmwY8coJbEgl+BJbiAOAi
 BqSkodxzce2NF/RTvvU+CRZ97r5DTfKq+EmRuUAoiGTfkcZf0KK/56tnKsS2dNMivIcE
 4AcX86j0SDP7pifKEFax5qNWv8CKoJPjsRRj8pu0kv3UgaBYv49vIn0d6MYVB1wDL+Ql
 AcBQeSJwtOjrVZJ6rzHG10Mr1dCcy471ep7MZV/PrDztMpIEDNTFFAhbEhTk0DXldeAE
 JFvUKTTCqR00Mw1K0h/8q7I0ZMY5zw7VhpNfM2kv8o4dXKO0T1ldfzX5hqeLmNjhm39O
 eVXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiDR/5aNlYnk2PZyH8qw40TfJDvhtCe9QkTg5ZigwAmwJb5hZu0EJK3i+CyWJCACvG8GfZEJ/vGm0TSysO6/KFMLZ3tGoEKwMj6Hsw9iRn
X-Gm-Message-State: AOJu0Yx386yIwk/48Pa74Mc+cpyGfkwrnu4gDSTTZgbOo6ZmG2oy5x6V
 5Yvi/8ZxYKBMOn6AWUfVzjSgcN73qw51bIYh55tFLRb/JJ/u9AEOl01W9DOzbZtBmjDD8cfhb/5
 Xj/QUoTuQMEvqf88aC7LLJXQcGsA=
X-Google-Smtp-Source: AGHT+IGRZQ/BGfXr4JyRSnaEMtBihRHwRoaenXLEwD0fFOB7V17Y1jXXWBjl3v+IqZFEixVDxybirYpjYDfuPmdJPZg=
X-Received: by 2002:ac2:428a:0:b0:513:3309:cc62 with SMTP id
 m10-20020ac2428a000000b005133309cc62mr303303lfh.47.1709604244339; Mon, 04 Mar
 2024 18:04:04 -0800 (PST)
MIME-Version: 1.0
References: <20240301185346.10412-1-robdclark@gmail.com>
 <CAAfnVBnXCqCQjamnSC0SArrNykiSgjwNpMvrkmb7kTuufW-opg@mail.gmail.com>
In-Reply-To: <CAAfnVBnXCqCQjamnSC0SArrNykiSgjwNpMvrkmb7kTuufW-opg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 4 Mar 2024 18:03:52 -0800
Message-ID: <CAF6AEGuvXAXgtDgVTL0Z80pbR4d-oUnwBf0uB1GRJkZHd=2ftQ@mail.gmail.com>
Subject: Re: [RFC] drm/msm: Add GPU memory traces
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@chromium.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, open list <linux-kernel@vger.kernel.org>
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

On Mon, Mar 4, 2024 at 5:38=E2=80=AFPM Gurchetan Singh
<gurchetansingh@chromium.org> wrote:
>
>
>
>
> On Fri, Mar 1, 2024 at 10:54=E2=80=AFAM Rob Clark <robdclark@gmail.com> w=
rote:
>>
>> From: Rob Clark <robdclark@chromium.org>
>>
>> Perfetto can use these traces to track global and per-process GPU memory
>> usage.
>>
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>> I realized the tracepoint that perfetto uses to show GPU memory usage
>> globally and per-process was already upstream, but with no users.
>>
>> This overlaps a bit with fdinfo, but ftrace is a lighter weight
>> mechanism and fits better with perfetto (plus is already supported in
>> trace_processor and perfetto UI, whereas something fdinfo based would
>> require new code to be added in perfetto.
>>
>> We could probably do this more globally (ie. drm_gem_get/put_pages() and
>> drm_gem_handle_create_tail()/drm_gem_object_release_handle() if folks
>> prefer.  Not sure where that leaves the TTM drivers.
>>
>>  drivers/gpu/drm/msm/Kconfig   |  1 +
>>  drivers/gpu/drm/msm/msm_drv.h |  5 +++++
>>  drivers/gpu/drm/msm/msm_gem.c | 37 +++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/msm/msm_gpu.h |  8 ++++++++
>>  4 files changed, 51 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
>> index f202f26adab2..e4c912fcaf22 100644
>> --- a/drivers/gpu/drm/msm/Kconfig
>> +++ b/drivers/gpu/drm/msm/Kconfig
>> @@ -33,6 +33,7 @@ config DRM_MSM
>>         select PM_OPP
>>         select NVMEM
>>         select PM_GENERIC_DOMAINS
>> +       select TRACE_GPU_MEM
>>         help
>>           DRM/KMS driver for MSM/snapdragon.
>>
>> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv=
.h
>> index 16a7cbc0b7dd..cb8f7e804b5b 100644
>> --- a/drivers/gpu/drm/msm/msm_drv.h
>> +++ b/drivers/gpu/drm/msm/msm_drv.h
>> @@ -137,6 +137,11 @@ struct msm_drm_private {
>>         struct msm_rd_state *hangrd;   /* debugfs to dump hanging submit=
s */
>>         struct msm_perf_state *perf;
>>
>> +       /**
>> +        * total_mem: Total/global amount of memory backing GEM objects.
>> +        */
>> +       atomic64_t total_mem;
>> +
>>         /**
>>          * List of all GEM objects (mainly for debugfs, protected by obj=
_lock
>>          * (acquire before per GEM object lock)
>> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem=
.c
>> index 175ee4ab8a6f..e04c4af5d154 100644
>> --- a/drivers/gpu/drm/msm/msm_gem.c
>> +++ b/drivers/gpu/drm/msm/msm_gem.c
>> @@ -12,6 +12,9 @@
>>  #include <linux/pfn_t.h>
>>
>>  #include <drm/drm_prime.h>
>> +#include <drm/drm_file.h>
>> +
>> +#include <trace/events/gpu_mem.h>
>>
>>  #include "msm_drv.h"
>>  #include "msm_fence.h"
>> @@ -33,6 +36,34 @@ static bool use_pages(struct drm_gem_object *obj)
>>         return !msm_obj->vram_node;
>>  }
>>
>> +static void update_device_mem(struct msm_drm_private *priv, ssize_t siz=
e)
>> +{
>> +       uint64_t total_mem =3D atomic64_add_return(size, &priv->total_me=
m);
>> +       trace_gpu_mem_total(0, 0, total_mem);
>> +}
>> +
>> +static void update_ctx_mem(struct drm_file *file, ssize_t size)
>> +{
>> +       struct msm_file_private *ctx =3D file->driver_priv;
>> +       uint64_t ctx_mem =3D atomic64_add_return(size, &ctx->ctx_mem);
>> +
>> +       rcu_read_lock(); /* Locks file->pid! */
>> +       trace_gpu_mem_total(0, pid_nr(file->pid), ctx_mem);
>> +       rcu_read_unlock();
>> +
>> +}
>> +
>> +static int msm_gem_open(struct drm_gem_object *obj, struct drm_file *fi=
le)
>> +{
>> +       update_ctx_mem(file, obj->size);
>> +       return 0;
>> +}
>> +
>> +static void msm_gem_close(struct drm_gem_object *obj, struct drm_file *=
file)
>> +{
>> +       update_ctx_mem(file, -obj->size);
>> +}
>> +
>>  /*
>>   * Cache sync.. this is a bit over-complicated, to fit dma-mapping
>>   * API.  Really GPU cache is out of scope here (handled on cmdstream)
>> @@ -156,6 +187,8 @@ static struct page **get_pages(struct drm_gem_object=
 *obj)
>>                         return p;
>>                 }
>>
>> +               update_device_mem(dev->dev_private, obj->size);
>> +
>>                 msm_obj->pages =3D p;
>>
>>                 msm_obj->sgt =3D drm_prime_pages_to_sg(obj->dev, p, npag=
es);
>> @@ -209,6 +242,8 @@ static void put_pages(struct drm_gem_object *obj)
>>                         msm_obj->sgt =3D NULL;
>>                 }
>>
>> +               update_device_mem(obj->dev->dev_private, -obj->size);
>> +
>>                 if (use_pages(obj))
>>                         drm_gem_put_pages(obj, msm_obj->pages, true, fal=
se);
>>                 else
>> @@ -1118,6 +1153,8 @@ static const struct vm_operations_struct vm_ops =
=3D {
>>
>>  static const struct drm_gem_object_funcs msm_gem_object_funcs =3D {
>>         .free =3D msm_gem_free_object,
>> +       .open =3D msm_gem_open,
>> +       .close =3D msm_gem_close,
>>         .pin =3D msm_gem_prime_pin,
>>         .unpin =3D msm_gem_prime_unpin,
>>         .get_sg_table =3D msm_gem_prime_get_sg_table,
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu=
.h
>> index 2bfcb222e353..f7d2a7d6f8cc 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>> @@ -428,6 +428,14 @@ struct msm_file_private {
>>          * level.
>>          */
>>         struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_=
MAX_RINGS];
>> +
>> +       /**
>> +        * ctx_mem:
>> +        *
>> +        * Total amount of memory of GEM buffers with handles attached f=
or
>> +        * this context.
>> +        */
>> +       atomic64_t ctx_mem;
>>  };
>
>
>
> Just for added context, past discussions on TRACE_GPU_MEM:
>
> https://lists.freedesktop.org/archives/dri-devel/2021-October/328260.html
> https://lists.freedesktop.org/archives/dri-devel/2021-January/295120.html
>
> Some have even suggested deleting the tracepoint altogether.
>
> Personally, I think we should land an internal user in a non-breaking way=
, since userspace (Perfetto) already depends on it.  Right now, we're in li=
mbo for multiple years ...

For better or for worse, the tracepoint already landed.. and tbh I
don't see any real problem with it.  And it defn seems like a valid
option to land support for in-driver and later refactor for more
shared code.  We already have the uapi and the userspace consuming it,
so doesn't seem like there is any debate there.  Maybe there is
something from the original series that could be recycled for
something less driver specific.

Re: some of the discussion about cgroups, I think that is a
non-sequitur because (AFAICT) perfetto wants a global view of pids/etc
(at least I'm not really sure what the value of system tracing is if
it isn't, you know, system level.. I deliberately avoided using
virtual-pid's for that reason)

BR,
-R

>>
>>  /**
>> --
>> 2.44.0
>>
