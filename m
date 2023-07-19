Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B390B759FD5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2893B10E50E;
	Wed, 19 Jul 2023 20:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F27410E50F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 20:32:08 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6b9c5362a51so59566a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 13:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689798726; x=1692390726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hVa5fBSVAdHHhZFj/pRkL4ALpTE995mDIMsnkkRTm0Q=;
 b=Lde5n1cKOA1T4bKffkRp7OCLFw3kIzNszFORWjdILVZqUjkjtj/r9hJnWetWPtfHma
 ljuFtQpXVY4jecYQAp9auj6671m4eJtWAWASvcxJ0vh6TBOL3L3JPhny0qmlkfIO9s+W
 8B9dU1kPuZnzPVLrgJf4wHRzdb2yDbMwGZLSaAOSX8ifu+zNVAZ4k00aAjhvtL71UYFE
 zBzIW5qzWajLb4R1YlKHx0jzIA1FhXb9NOCMhsidexUSwl+9zzaHMeWSsIwt4d/UKdn3
 ou8P9mOiEJewUTZVMKvwVKWKgZcn3ZknSYuePQSkjSIgj6WoH4BvzHG+o4ET6ZkJEN1+
 idEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689798726; x=1692390726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hVa5fBSVAdHHhZFj/pRkL4ALpTE995mDIMsnkkRTm0Q=;
 b=dH8J3kjliB8fuQIwNRScC85qM9UFcjgaSlcY8X+LKlb4JpWIB63vzGGLrTeexkLBSt
 NnHmYP3oWwS7+E4mtp+UYVQT36zcDOQy736aRhaJF5CkB7B/1p0ntCqQX6NROljB6Un7
 CllRVA0pQ6BenXzPMA0Y349qSs959ME/uNjwT8Tte2JjU3kD3PO0Po5+X8SqXA0aZYc0
 G9RAzfOrW6by13gvAi3/ECIoedt58KjaXmRawKZ/PNrTseLe+MGDTcK+m3pZAZiV6SVw
 oW1/KS+eVbpX7pL0W7ROsoxbW57l5puWVBuFPICLOfVIzE/zytHGPwGDittCuDT0pOuq
 IdSg==
X-Gm-Message-State: ABy/qLbItnW7ICqB3sAcIKru5Q19IJa0zsT1iYUEgchDVysGecNaZlqT
 +e9JGPxiWbq/3bQ3hufZI7Z2rsi/bEhJSu/95CYqmA==
X-Google-Smtp-Source: APBJJlG0LOmFWJJYoiI2DoFv8CdP9UbzzCs8Y7kDwJRTGKPR2LDaC31eQP8L8zN0JJDBJcCQwWuezCzERqGP128mCXI=
X-Received: by 2002:a05:6808:138c:b0:3a3:eab8:8710 with SMTP id
 c12-20020a056808138c00b003a3eab88710mr4242718oiw.43.1689798726160; Wed, 19
 Jul 2023 13:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230712114605.519432-1-tvrtko.ursulin@linux.intel.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 19 Jul 2023 13:31:54 -0700
Message-ID: <CABdmKX1PUF+X897ZMOr0RNiYdoiL_2NkcSt+Eh55BfW-05LopQ@mail.gmail.com>
Subject: Re: [RFC v5 00/17] DRM cgroup controller with scheduling control and
 memory stats
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Kenny.Ho@amd.com,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Brian Welty <brian.welty@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 12, 2023 at 4:47=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>   drm.memory.stat
>         A nested file containing cumulative memory statistics for the who=
le
>         sub-hierarchy, broken down into separate GPUs and separate memory
>         regions supported by the latter.
>
>         For example::
>
>           $ cat drm.memory.stat
>           card0 region=3Dsystem total=3D12898304 shared=3D0 active=3D0 re=
sident=3D12111872 purgeable=3D167936
>           card0 region=3Dstolen-system total=3D0 shared=3D0 active=3D0 re=
sident=3D0 purgeable=3D0
>
>         Card designation corresponds to the DRM device names and multiple=
 line
>         entries can be present per card.
>
>         Memory region names should be expected to be driver specific with=
 the
>         exception of 'system' which is standardised and applicable for GP=
Us
>         which can operate on system memory buffers.
>
>         Sub-keys 'resident' and 'purgeable' are optional.
>
>         Per category region usage is reported in bytes.
>
>  * Feedback from people interested in drm.active_us and drm.memory.stat i=
s
>    required to understand the use cases and their usefulness (of the fiel=
ds).
>
>    Memory stats are something which was easy to add to my series, since I=
 was
>    already working on the fdinfo memory stats patches, but the question i=
s how
>    useful it is.
>
Hi Tvrtko,

I think this style of driver-defined categories for reporting of
memory could potentially allow us to eliminate the GPU memory tracking
tracepoint used on Android (gpu_mem_total). This would involve reading
drm.memory.stat at the root cgroup (I see it's currently disabled on
the root), which means traversing the whole cgroup tree under the
cgroup lock to generate the values on-demand. This would be done
rarely, but I still wonder what the cost of that would turn out to be.
The drm_memory_stats categories in the output don't seem like a big
value-add for this use-case, but no real objection to them being
there. I know it's called the DRM cgroup controller, but it'd be nice
if there were a way to make the mem tracking part work for any driver
that wishes to participate as many of our devices don't use a DRM
driver. But making that work doesn't look like it would fit very
cleanly into this controller, so I'll just shut up now.

Thanks!
-T.J.
