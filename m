Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E9C6A66D0
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 04:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1764410E09D;
	Wed,  1 Mar 2023 03:50:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FE510E06F;
 Wed,  1 Mar 2023 03:50:25 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id h8so9356291plf.10;
 Tue, 28 Feb 2023 19:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677642625;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AG9TChwIFMajojqyXqEeGeimL/z1mkcKZGzrMps/uis=;
 b=ajRS1aeLUGnojhe1k7eA812UZUIS3hY2jYVS9d5zFM0jhBxx21nQDwPW3geiY5KdeQ
 BLJMUnJBC0FmwAMVRJEcPC9h0yvElO0Eg4yDrZbRdVlSIVYHyBj/m4hs6t8WNbsFUqIe
 rH563UfNysxfDommzDram0sYc1BZmnZj2FUzWTi5xO0uTP2sfaVaeCQUeK1/IcD5cc6p
 TzzxeiJ/hJHzTQVGK+QWUFWZ5uh72U6Idw9I1DX94dvL6OxxKIxwA+cvL2ZbI35X9A60
 3qXtquqAHJ1GzCZtW3AsuAXPBYrJr472ZEbkXsI/W3Y33j9rgc+bJ/06sk2nvgjF+AwV
 GZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677642625;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AG9TChwIFMajojqyXqEeGeimL/z1mkcKZGzrMps/uis=;
 b=VfCiiJ4bAqWplSnDecvET2peFU1Ya7UreYmp4i+Zg1Zg8tCPZptKNRyxWc+hIqMsp2
 LFPVhErHZ+U4SoYSVbajGfUpuHLjShyKlpXgqZ+JqahSO+muOPEtC8ez+M2UR1q87SKf
 dUK+9KP0gNT1mUS7DfTGLq9p1vJkvJ8AezeZ+5IUQO04LQ4XOXCrpfpTr4jhD5yjGu5a
 FbHf1vBBVGjVNifPakb1BahAAdjxE/qkVh1qj4yEKHf7Sc7W2LnSOVqKt4SBDAf66Kfe
 vg24LXKB/6C0cMLFvLvrPdw58C0Q8v8cxpYdw7/eKHutHnFv142NKU9p33ujA+DKDNOC
 rjgg==
X-Gm-Message-State: AO0yUKXZiRsqGmXEjiMZLww0YvAxp1ubtp5oF0CtuhtGYHNtHuxeUq6X
 oI4g/4qjuqcnMeFPRQ2qcpQ=
X-Google-Smtp-Source: AK7set81We+ge3qRlyt7CmGR9AL4sF3286rRoAlURb45cbwztk4MA141kwF+DBy8DFaVodZF3XnfTQ==
X-Received: by 2002:a17:903:707:b0:19c:be57:9c6e with SMTP id
 kk7-20020a170903070700b0019cbe579c6emr3963565plb.39.1677642624977; 
 Tue, 28 Feb 2023 19:50:24 -0800 (PST)
Received: from debian.me (subs02-180-214-232-27.three.co.id. [180.214.232.27])
 by smtp.gmail.com with ESMTPSA id
 x6-20020a1709029a4600b001992b8cf89bsm7279993plv.16.2023.02.28.19.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:50:24 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
 id D41941034B0; Wed,  1 Mar 2023 10:50:20 +0700 (WIB)
Date: Wed, 1 Mar 2023 10:50:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 01/15] dma-buf/dma-fence: Add deadline awareness
Message-ID: <Y/7LfLxhIjDpD4D3@debian.me>
References: <20230227193535.2822389-1-robdclark@gmail.com>
 <20230227193535.2822389-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oTYOw6gqQhDOyhTR"
Content-Disposition: inline
In-Reply-To: <20230227193535.2822389-2-robdclark@gmail.com>
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
 Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oTYOw6gqQhDOyhTR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 11:35:07AM -0800, Rob Clark wrote:
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

The doc LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--oTYOw6gqQhDOyhTR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY/7LdwAKCRD2uYlJVVFO
o+yRAQCD//a9bLGYLjTrMNBYwCLBiPxnmV7phSin6w6b2ykgIgD+IsVkADZfyUA7
J+62fGEud4jd/xybHjUgjSdSoJL4sQI=
=yfmJ
-----END PGP SIGNATURE-----

--oTYOw6gqQhDOyhTR--
