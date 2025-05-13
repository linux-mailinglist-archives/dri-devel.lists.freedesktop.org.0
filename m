Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A03AB56D8
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 16:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE60810E39F;
	Tue, 13 May 2025 14:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PjgZNt+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCF810E1F6;
 Tue, 13 May 2025 14:17:06 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3d9189e9a06so23610245ab.2; 
 Tue, 13 May 2025 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747145826; x=1747750626; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V7JvgoF1myyPp51kXMFO7KeBiBPtIqWZF4DhsDiCmkU=;
 b=PjgZNt+N1VfW8wUM+1XbLit2sSXQEgrPt4BaAoM35xnVK+nayazMQ0T7Ys9/y9oNL1
 Ta638qUoDsMPQ/m7ICe282xSCUyJzs4jbap/VkN7jceUFfaRJGy95tOHNQt0Pll+HUuM
 I3ASZu/6yQPYK1gjitxPYbfvY133dlli9A5Lc+abE5L4jpP/lHDTZY0QmvDDODzgMCaG
 /PfGlxmLvFu1BGaPMl/ml9CEOEjpkPL1TIrIu5KPw2b7ZE3W/r1f/LdaaavmUD4zCl1e
 q3pqN+Zv+GzuX5ZDAfLR+0udWV9nXJs9yna+0dLENGmGnvStsE3YrAVmbiudhxxfLeBD
 eYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747145826; x=1747750626;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V7JvgoF1myyPp51kXMFO7KeBiBPtIqWZF4DhsDiCmkU=;
 b=rJs52xJFyGi5Xymf2U/NhRX6/GmefyKpF/PbWgsZBNVDGb+hZEMTpZTmR87EcwpLzq
 XFRQq5REBRZVTswRia1yE8+kSar9BixgH35PTVGDHhihHn0wdG/5qECt86DfMgOT+zaH
 ObvLt2p8/TdrIuPjqbIRTuTUUOJ/T+v+UiA2URPJnw/fYCeP30kva3CgezW3UL47/aoI
 lOYjtxOHkNfwpnZYaETubjrHvHndzblMQj4yMQbEfBouwEPoU/droaDYmp08QTxlHDDh
 ZAscI8CVQQtsnja+oc0/Qxe1OGqhD5sSJOAXRswj41r7PPxuHPyzkh7vS+B2KRDyerqY
 w9Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVa540366YDfHmbMafyJs+LLDuWeek1tGF3ZXZzVKVCLtavygsP8qKyrP1FR+yBcwEfhfPiKjX7jipm@lists.freedesktop.org,
 AJvYcCWNInJlmAz8ZXo2KYbpEd8krWi0fAYNj61PJ+nYGmHAI9/r4T8yj7ulc5iFjwT0Vq/RwixtZBn9TSM=@lists.freedesktop.org,
 AJvYcCX8e3XSZGabpeC+npwVnc1nJ//c4Vus1pZrcktM5l8pPWOHPxSJCFoPg3T7E4YX9N1b/yrCe6nI@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxItqcEXjadxMDtlbxgmjeKqAuhYgn5D2o3lphFDT59duLtvPX1
 ATVp8oV9WZ8C2xCkcAsFVtMOH9F/IZuNsw4XKN+A4KAzZ/Z0pCGFR45zViPriI221xmKTDIIywH
 BNEhdQtrL/4sVn9Ppsgqxt6zzbnQ=
X-Gm-Gg: ASbGnctnVJgWqTOPLsETAz6dq7Kjyphr38CSeeBW1Ns+QLnqPYTzGe1Vu3zedlOyjMV
 E6Cz71spr0lGruXC3HWpTm+GLyd8OUMmE1HkVep/wqeIgY1puY1gvHUqePJd3tmTfyF3WnYUO9I
 xwWZSsQ6bblElbXKOmWo+2hy4WerI0pYtX9AtRrh5r0zbV5lkvbkcK/d178carzIk=
X-Google-Smtp-Source: AGHT+IGiTGnKZsysreFCsBlhWepL/hQV58J2zh5LT1gGazMVzNwO9kv9W4HW2fzPjKZ0XABsGEeKFoY6ux7cVV7hQFM=
X-Received: by 2002:a05:6e02:2292:b0:3d6:cd54:ba53 with SMTP id
 e9e14a558f8ab-3da7e21658cmr209314645ab.22.1747145825748; Tue, 13 May 2025
 07:17:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250509153352.7187-1-tvrtko.ursulin@igalia.com>
 <20250509153352.7187-11-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250509153352.7187-11-tvrtko.ursulin@igalia.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 13 May 2025 07:16:53 -0700
X-Gm-Features: AX0GCFuH1j40yQO1HsIKDsTCJ5uHO4NcgonBSju0wMc3XxKpk3t9K9r-1vi2EhU
Message-ID: <CAF6AEGuOC4NnSTQexvD5tk8VLfOR_gGq-cqs3gnJcS1qNtMjQg@mail.gmail.com>
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

On Fri, May 9, 2025 at 8:34=E2=80=AFAM Tvrtko Ursulin <tvrtko.ursulin@igali=
a.com> wrote:
>
> Dma-fence objects currently suffer from a potential use after free proble=
m
> where fences exported to userspace and other drivers can outlive the
> exporting driver, or the associated data structures.
>
> The discussion on how to address this concluded that adding reference
> counting to all the involved objects is not desirable, since it would nee=
d
> to be very wide reaching and could cause unloadable drivers if another
> entity would be holding onto a signaled fence reference potentially
> indefinitely.
>
> This patch enables the safe access by introducing and documenting a
> contract between fence exporters and users. It documents a set of
> contraints and adds helpers which a) drivers with potential to suffer fro=
m
> the use after free must use and b) users of the dma-fence API must use as
> well.
>
> Premise of the design has multiple sides:
>
> 1. Drivers (fence exporters) MUST ensure a RCU grace period between
> signalling a fence and freeing the driver private data associated with it=
.
>
> The grace period does not have to follow the signalling immediately but
> HAS to happen before data is freed.
>
> 2. Users of the dma-fence API marked with such requirement MUST contain
> the complete access to the data within a single code block guarded by the
> new dma_fence_access_begin() and dma_fence_access_end() helpers.
>
> The combination of the two ensures that whoever sees the
> DMA_FENCE_FLAG_SIGNALED_BIT not set is guaranteed to have access to a
> valid fence->lock and valid data potentially accessed by the fence->ops
> virtual functions, until the call to dma_fence_access_end().
>
> 3. Module unload (fence->ops) disappearing is for now explicitly not
> handled. That would required a more complex protection, possibly needing
> SRCU instead of RCU to handle callers such as dma_fence_wait_timeout(),
> where race between dma_fence_enable_sw_signaling, signalling, and
> dereference of fence->ops->wait() would need a sleeping SRCU context.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> ---
>  drivers/dma-buf/dma-fence.c | 69 +++++++++++++++++++++++++++++++++++++
>  include/linux/dma-fence.h   | 32 ++++++++++++-----
>  2 files changed, 93 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index dc2456f68685..cfe1d7b79c22 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -533,6 +533,7 @@ void dma_fence_release(struct kref *kref)
>         struct dma_fence *fence =3D
>                 container_of(kref, struct dma_fence, refcount);
>
> +       dma_fence_access_begin();
>         trace_dma_fence_destroy(fence);
>
>         if (WARN(!list_empty(&fence->cb_list) &&
> @@ -560,6 +561,8 @@ void dma_fence_release(struct kref *kref)
>                 fence->ops->release(fence);
>         else
>                 dma_fence_free(fence);
> +
> +       dma_fence_access_end();
>  }
>  EXPORT_SYMBOL(dma_fence_release);
>
> @@ -982,11 +985,13 @@ EXPORT_SYMBOL(dma_fence_set_deadline);
>   */
>  void dma_fence_describe(struct dma_fence *fence, struct seq_file *seq)
>  {
> +       dma_fence_access_begin();
>         seq_printf(seq, "%s %s seq %llu %ssignalled\n",
>                    dma_fence_driver_name(fence),
>                    dma_fence_timeline_name(fence),
>                    fence->seqno,
>                    dma_fence_is_signaled(fence) ? "" : "un");
> +       dma_fence_access_end();
>  }
>  EXPORT_SYMBOL(dma_fence_describe);
>
> @@ -1033,3 +1038,67 @@ dma_fence_init64(struct dma_fence *fence, const st=
ruct dma_fence_ops *ops,
>         __set_bit(DMA_FENCE_FLAG_SEQNO64_BIT, &fence->flags);
>  }
>  EXPORT_SYMBOL(dma_fence_init64);
> +
> +/**
> + * dma_fence_driver_name - Access the driver name
> + * @fence: the fence to query
> + *
> + * Returns a driver name backing the dma-fence implementation.
> + *
> + * IMPORTANT CONSIDERATION:
> + * Dma-fence contract stipulates that access to driver provided data (da=
ta not
> + * directly embedded into the object itself), such as the &dma_fence.loc=
k and
> + * memory potentially accessed by the &dma_fence.ops functions, is forbi=
dden
> + * after the fence has been signalled. Drivers are allowed to free that =
data,
> + * and some do.
> + *
> + * To allow safe access drivers are mandated to guarantee a RCU grace pe=
riod
> + * between signalling the fence and freeing said data.
> + *
> + * As such access to the driver name is only valid inside a RCU locked s=
ection.
> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block =
guarded
> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> + */
> +const char *dma_fence_driver_name(struct dma_fence *fence)
> +{
> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> +                        "rcu_read_lock() required for safe access to ret=
urned string");
> +
> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +               return fence->ops->get_driver_name(fence);
> +       else
> +               return "detached-driver";
> +}
> +EXPORT_SYMBOL(dma_fence_driver_name);
> +
> +/**
> + * dma_fence_timeline_name - Access the timeline name
> + * @fence: the fence to query
> + *
> + * Returns a timeline name provided by the dma-fence implementation.
> + *
> + * IMPORTANT CONSIDERATION:
> + * Dma-fence contract stipulates that access to driver provided data (da=
ta not
> + * directly embedded into the object itself), such as the &dma_fence.loc=
k and
> + * memory potentially accessed by the &dma_fence.ops functions, is forbi=
dden
> + * after the fence has been signalled. Drivers are allowed to free that =
data,
> + * and some do.
> + *
> + * To allow safe access drivers are mandated to guarantee a RCU grace pe=
riod
> + * between signalling the fence and freeing said data.
> + *
> + * As such access to the driver name is only valid inside a RCU locked s=
ection.
> + * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block =
guarded
> + * by the &dma_fence_access_being and &dma_fence_access_end pair.
> + */
> +const char *dma_fence_timeline_name(struct dma_fence *fence)
> +{
> +       RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
> +                        "rcu_read_lock() required for safe access to ret=
urned string");
> +
> +       if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +               return fence->ops->get_driver_name(fence);
> +       else
> +               return "signaled-timeline";

This means that trace_dma_fence_signaled() will get the wrong
timeline/driver name, which probably screws up perfetto and maybe
other tools.

Maybe it would work well enough just to move the
trace_dma_fence_signaled() call ahead of the test_and_set_bit()?  Idk
if some things will start getting confused if they see that trace
multiple times.

Maybe a better solution would be to add a new bit for this purpose,
which is set after the tracepoint in
dma_fence_signal_timestamp_locked().

(trace_dma_fence_destroy() will I guess be messed up regardless.. it
doesn't look like perfetto cares about this tracepoint, so maybe that
is ok.  It doesn't seem so useful.)

BR,
-R


> +}
> +EXPORT_SYMBOL(dma_fence_timeline_name);
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index c814a86087f8..c8a9915eb360 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -387,15 +387,31 @@ bool dma_fence_remove_callback(struct dma_fence *fe=
nce,
>                                struct dma_fence_cb *cb);
>  void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>
> -static inline const char *dma_fence_driver_name(struct dma_fence *fence)
> -{
> -       return fence->ops->get_driver_name(fence);
> -}
> +/**
> + * DOC: Safe external access to driver provided object members
> + *
> + * All data not stored directly in the dma-fence object, such as the
> + * &dma_fence.lock and memory potentially accessed by functions in the
> + * &dma_fence.ops table, MUST NOT be accessed after the fence has been s=
ignalled
> + * because after that point drivers are allowed to free it.
> + *
> + * All code accessing that data via the dma-fence API (or directly, whic=
h is
> + * discouraged), MUST make sure to contain the complete access within a
> + * &dma_fence_access_begin and &dma_fence_access_end pair.
> + *
> + * Some dma-fence API handles this automatically, while other, as for ex=
ample
> + * &dma_fence_driver_name and &dma_fence_timeline_name, leave that
> + * responsibility to the caller.
> + *
> + * To enable this scheme to work drivers MUST ensure a RCU grace period =
elapses
> + * between signalling the fence and freeing the said data.
> + *
> + */
> +#define dma_fence_access_begin rcu_read_lock
> +#define dma_fence_access_end   rcu_read_unlock
>
> -static inline const char *dma_fence_timeline_name(struct dma_fence *fenc=
e)
> -{
> -       return fence->ops->get_timeline_name(fence);
> -}
> +const char *dma_fence_driver_name(struct dma_fence *fence);
> +const char *dma_fence_timeline_name(struct dma_fence *fence);
>
>  /**
>   * dma_fence_is_signaled_locked - Return an indication if the fence
> --
> 2.48.0
>
