Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D176A5580
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 10:22:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F13F10E4C3;
	Tue, 28 Feb 2023 09:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7970C10E4C3;
 Tue, 28 Feb 2023 09:22:00 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id i9so12254733lfc.6;
 Tue, 28 Feb 2023 01:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677576118;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=XjtJVhGRBCDGP/is6/3T+zNp4V+GDc3TNme85Sg5PY0=;
 b=pVdEb78DTn3eQBQcq6N4sGN3dLfU3ywxYnOMElKqn+oSSbT7fZHi2Z8LKtgVj4C7xg
 uFV+ZPaoR77M1cb8uLQhx991oUGKUuS1gHZLluPI6jmqMeSGmoKd0X7GyfVZq32aNSTw
 fI9rN3HppMU/GGFJiPsXciC+kvSr+1TNqVYWxMCff3IDtwiw4N7Rjwh5Hn6C65eCdyta
 hJq8T6UKgMfG1CzOvwUYbM/yEZsyLedwSy27x3xlAzkrldtw5OE+lJGboZvzkAhLb/2U
 +jsuvnsy9Y7O3Tx7utZeqMGWWKOKMw3y6Zg4Lv+ESVvQLckx30lwQQisAOQhh7Qb3Kdo
 w2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677576118;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XjtJVhGRBCDGP/is6/3T+zNp4V+GDc3TNme85Sg5PY0=;
 b=FBIB25rmKF2cOKtQvk0/ta4/2NjtTnbohjLOrXjmoegp5ks3pwXfBB09hnxqYwyxpP
 cewFwJsh9o0zBM4OaXlgMyy45lEMWZcnW/QeiahK3zSr6BULBbuRGK3DRiMJd2cxDUxJ
 TN2/zLHnLRx5W6i71izuDWST9ktWMSTi5ll5QEUQj/Vw5wq6g29U6k5qXTBklzRe+gBG
 qTUjSZTUlzRfGnNZ8fYbRbaw+7dCfIN1qbzC8PNzALNcvqTF0eDlBos4ZCTbLNI3pCmw
 wShypBHyxOl2z4NQy16CBLU9s32HxnYE9wueCmGfPFhzImM+Kmi8ZK330ouLb7LHU+G5
 fDaA==
X-Gm-Message-State: AO0yUKXaLD0nMQ7L+aSsly2ltH0A7lT/oOQsAv0rwbw08bcUCK0nld2U
 QjWSL1lfvjXCr9vuYwe+mGE=
X-Google-Smtp-Source: AK7set+dJBbdBoZvb2afjs4Y2ULjyyN8Zs8NDLuybShWYRGUSeI2os45dkGDgdtNd/GFltEUQKG7tg==
X-Received: by 2002:ac2:538a:0:b0:4e0:6e01:7ebe with SMTP id
 g10-20020ac2538a000000b004e06e017ebemr486405lfh.36.1677576118312; 
 Tue, 28 Feb 2023 01:21:58 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 q25-20020ac25299000000b004e048852377sm752107lfm.263.2023.02.28.01.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 01:21:57 -0800 (PST)
Date: Tue, 28 Feb 2023 11:21:54 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v7 01/15] dma-buf/dma-fence: Add deadline awareness
Message-ID: <20230228112154.207dc66c@eldfell>
In-Reply-To: <20230227193535.2822389-2-robdclark@gmail.com>
References: <20230227193535.2822389-1-robdclark@gmail.com>
 <20230227193535.2822389-2-robdclark@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6el54_V3G4c7URCr0CD3eSr";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Rob Clark <robdclark@chromium.org>, Gustavo Padovan <gustavo@padovan.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Christian =?UTF-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, "moderated list:DMA BUFFER SHARING
 FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6el54_V3G4c7URCr0CD3eSr
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Feb 2023 11:35:07 -0800
Rob Clark <robdclark@gmail.com> wrote:

> From: Rob Clark <robdclark@chromium.org>
>=20
> Add a way to hint to the fence signaler of an upcoming deadline, such as
> vblank, which the fence waiter would prefer not to miss.  This is to aid
> the fence signaler in making power management decisions, like boosting
> frequency as the deadline approaches and awareness of missing deadlines
> so that can be factored in to the frequency scaling.
>=20
> v2: Drop dma_fence::deadline and related logic to filter duplicate
>     deadlines, to avoid increasing dma_fence size.  The fence-context
>     implementation will need similar logic to track deadlines of all
>     the fences on the same timeline.  [ckoenig]
> v3: Clarify locking wrt. set_deadline callback
> v4: Clarify in docs comment that this is a hint
> v5: Drop DMA_FENCE_FLAG_HAS_DEADLINE_BIT.
> v6: More docs
>=20
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  Documentation/driver-api/dma-buf.rst |  6 +++
>  drivers/dma-buf/dma-fence.c          | 59 ++++++++++++++++++++++++++++
>  include/linux/dma-fence.h            | 20 ++++++++++
>  3 files changed, 85 insertions(+)
>=20
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-=
api/dma-buf.rst
> index 622b8156d212..183e480d8cea 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -164,6 +164,12 @@ DMA Fence Signalling Annotations
>  .. kernel-doc:: drivers/dma-buf/dma-fence.c
>     :doc: fence signalling annotation
> =20
> +DMA Fence Deadline Hints
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: drivers/dma-buf/dma-fence.c
> +   :doc: deadline hints
> +
>  DMA Fences Functions Reference
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> =20
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 0de0482cd36e..e103e821d993 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -912,6 +912,65 @@ dma_fence_wait_any_timeout(struct dma_fence **fences=
, uint32_t count,
>  }
>  EXPORT_SYMBOL(dma_fence_wait_any_timeout);
> =20
> +/**
> + * DOC: deadline hints
> + *
> + * In an ideal world, it would be possible to pipeline a workload suffic=
iently
> + * that a utilization based device frequency governor could arrive at a =
minimum
> + * frequency that meets the requirements of the use-case, in order to mi=
nimize
> + * power consumption.  But in the real world there are many workloads wh=
ich
> + * defy this ideal.  For example, but not limited to:
> + *
> + * * Workloads that ping-pong between device and CPU, with alternating p=
eriods
> + *   of CPU waiting for device, and device waiting on CPU.  This can res=
ult in
> + *   devfreq and cpufreq seeing idle time in their respective domains an=
d in
> + *   result reduce frequency.
> + *
> + * * Workloads that interact with a periodic time based deadline, such a=
s double
> + *   buffered GPU rendering vs vblank sync'd page flipping.  In this sce=
nario,
> + *   missing a vblank deadline results in an *increase* in idle time on =
the GPU
> + *   (since it has to wait an additional vblank period), sending a singl=
e to

Hi Rob,

s/single/signal/ ?

> + *   the GPU's devfreq to reduce frequency, when in fact the opposite is=
 what is
> + *   needed.
> + *
> + * To this end, deadline hint(s) can be set on a &dma_fence via &dma_fen=
ce_set_deadline.
> + * The deadline hint provides a way for the waiting driver, or userspace=
, to
> + * convey an appropriate sense of urgency to the signaling driver.
> + *
> + * A deadline hint is given in absolute ktime (CLOCK_MONOTONIC for users=
pace
> + * facing APIs).  The time could either be some point in the future (suc=
h as
> + * the vblank based deadline for page-flipping, or the start of a compos=
itor's
> + * composition cycle), or the current time to indicate an immediate dead=
line
> + * hint (Ie. forward progress cannot be made until this fence is signale=
d).

As "current time" not a special value, but just an absolute timestamp
like any other, deadlines already in the past must also be accepted?

> + *
> + * Multiple deadlines may be set on a given fence, even in parallel.  Se=
e the
> + * documentation for &dma_fence_ops.set_deadline.
> + *
> + * The deadline hint is just that, a hint.  The driver that created the =
fence
> + * may react by increasing frequency, making different scheduling choice=
s, etc.
> + * Or doing nothing at all.
> + */

Yes! Thank you for writing this! Well explained.

> +
> +/**
> + * dma_fence_set_deadline - set desired fence-wait deadline hint
> + * @fence:    the fence that is to be waited on
> + * @deadline: the time by which the waiter hopes for the fence to be
> + *            signaled
> + *
> + * Give the fence signaler a hint about an upcoming deadline, such as
> + * vblank, by which point the waiter would prefer the fence to be
> + * signaled by.  This is intended to give feedback to the fence signaler
> + * to aid in power management decisions, such as boosting GPU frequency
> + * if a periodic vblank deadline is approaching but the fence is not
> + * yet signaled..
> + */
> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline)
> +{
> +	if (fence->ops->set_deadline && !dma_fence_is_signaled(fence))
> +		fence->ops->set_deadline(fence, deadline);
> +}
> +EXPORT_SYMBOL(dma_fence_set_deadline);
> +
>  /**
>   * dma_fence_describe - Dump fence describtion into seq_file
>   * @fence: the 6fence to describe
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 775cdc0b4f24..87c0d846dbb4 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -257,6 +257,24 @@ struct dma_fence_ops {
>  	 */
>  	void (*timeline_value_str)(struct dma_fence *fence,
>  				   char *str, int size);
> +
> +	/**
> +	 * @set_deadline:
> +	 *
> +	 * Callback to allow a fence waiter to inform the fence signaler of
> +	 * an upcoming deadline, such as vblank, by which point the waiter
> +	 * would prefer the fence to be signaled by.  This is intended to
> +	 * give feedback to the fence signaler to aid in power management
> +	 * decisions, such as boosting GPU frequency.
> +	 *
> +	 * This is called without &dma_fence.lock held, it can be called
> +	 * multiple times and from any context.  Locking is up to the callee
> +	 * if it has some state to manage.  If multiple deadlines are set,
> +	 * the expectation is to track the soonest one.
> +	 *
> +	 * This callback is optional.
> +	 */
> +	void (*set_deadline)(struct dma_fence *fence, ktime_t deadline);
>  };
> =20
>  void dma_fence_init(struct dma_fence *fence, const struct dma_fence_ops =
*ops,
> @@ -583,6 +601,8 @@ static inline signed long dma_fence_wait(struct dma_f=
ence *fence, bool intr)
>  	return ret < 0 ? ret : 0;
>  }
> =20
> +void dma_fence_set_deadline(struct dma_fence *fence, ktime_t deadline);
> +
>  struct dma_fence *dma_fence_get_stub(void);
>  struct dma_fence *dma_fence_allocate_private_stub(void);
>  u64 dma_fence_context_alloc(unsigned num);

This is exactly what I wanted to see. Already
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/6el54_V3G4c7URCr0CD3eSr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP9x7IACgkQI1/ltBGq
qqf39hAArfMVaNzoWkdJ/XBP/lqf8srlm1Wy/5FOim9RJPwgYpDNH72V4oAdf0nJ
wFjOZrbG2b0D4P9XHz0eKHojoYgSHN1Mn+mabZWz84zxRCt5uIN9jYACuxeWNjLA
kg3pNda0riISHO+htQ73+0cfX8B11UkgtPI3fm8vnYKlKmGkQW4TcDLdtogj7OPy
nDRuJcjDLzCcmb41fEyeZGZg76qb99ey+WyBJAgdT9M59mC/FJvHPIVVtd1B+OVA
uVXhryCtV8CZBrBSTZIOV4kWHr1SWhtFiuo8PI3xTawoO+euKf/cyILRFXrzOPb8
sLuAoU2A2pofKZEyctLU5fffH6X8Dx7ymaIOv87p13hNBA3Xh9uHb7uBZQ0zTtpu
F4XKlf/Fxxhumn+/Iz/CG4EZRnMs7PKb7PTCnmz+s8mZiQhAvaWT+PmHn2SiggYy
mBTiSGMQy/UAUGW9SESF79GOUdiH6upQNoVxQ8vj5ASbu1lqGuhjD4TZ2n8GOi5C
p0bsSo2AbkYsx8Wfw7Z9vpu6zuTAODKHx0A8ZdOVut+kBspG2oJdO3/8P6aTt6B0
oF6fCAyvJsXovguCgqk2CW4X3JAKrLMmZOEb6Xs8ab8CZSwC0ic+XAS6mogwHs0B
QAkHh7DMz7/JoTKuOxp6A7WAe1G7fYzmGaZZhuuLZ9O5mVLG6kE=
=CNyQ
-----END PGP SIGNATURE-----

--Sig_/6el54_V3G4c7URCr0CD3eSr--
