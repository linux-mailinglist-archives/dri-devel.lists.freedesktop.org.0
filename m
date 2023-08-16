Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCC677ED6B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 00:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F6E10E3DF;
	Wed, 16 Aug 2023 22:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE75410E3DB;
 Wed, 16 Aug 2023 22:52:10 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe85fd3d27so11770464e87.0; 
 Wed, 16 Aug 2023 15:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692226329; x=1692831129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mvsfyfQv/bBDPqR+U9oMm9lfLxeMxfNdU7tZWDaoRG8=;
 b=Y/4SMJQv1BlfNiGD3efCwGBwiTfG7NLs5HbBNeX2gUsqQXrRxALZugNwI6wLIMb/DD
 UylGzWl7YoMdeHXciHh2N3QWKBVsMRW4GQNa5+m5KDzeT0ix8AtNhulAqlzX3W2eZ2XW
 T/rGpCAV966rSV25OvsNRPhnu1oEGDYqSFepKZ1VuCmHzyKfLaQIabjfmHzHcHn3MnJc
 ULSQXWxEJiNWQ8BWRC4zurQEVgqzIRPQ5Uwd2udzjgm2ImjKqtBGRfqEdER7clFuliDx
 BAzpR3Q+Zi9mo3w048Vt2lNAw+wvVPO7OZd5eAKafaMqmDffgUkNq3TVsj3KyA9ewGXl
 WC6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692226329; x=1692831129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mvsfyfQv/bBDPqR+U9oMm9lfLxeMxfNdU7tZWDaoRG8=;
 b=ez3FFD0SZmppbs4PG1xNPzi9VCkK5+9kXJgsgpv48rzkpx8HDZDzP2cWbk5nfH+Qdv
 HAC62oqYuoMEoWbbvG+C2/xYYpXNf+ptmGPGzsfIug1XQnbk0Uy4/6qdbgxwPDW+2c4j
 UX3qgLplwP20lfLo1hsxTu0hM9ec83kDmMAJrrp4zfjzDuZ6V5cQEMYWqbao6vmf0Vxs
 UMtUyW2wyj2BdV/NTmffyQibVna2jV1/zTWepQBPbZISrU9yHAwsugwUe0/e4EEOe/0E
 30tA8o3eVO2zV1TZ2gx+R5kC+0YxgQe0pL0GKwLVzsfdc8MI5romKGowaW3EL5eU5HyT
 NBVw==
X-Gm-Message-State: AOJu0Yw/SO/EEcapveHP9M/KxWdfSluyvflrjwpav6tEkYOzAlW23sFu
 UW7izlXb/gqkp361pbZG8OywbRD8w5AL9w0OZJhyoGEjB1M=
X-Google-Smtp-Source: AGHT+IEscuSyTKTC/BNayYHGLsI+l7nktHOw7wGlPPwZPmtJ1kH4ILcfF8wVeYbNrrquIn2bmH2a3NG2UnH1kD2CjBM=
X-Received: by 2002:a2e:7d07:0:b0:2b6:ed80:15d1 with SMTP id
 y7-20020a2e7d07000000b002b6ed8015d1mr2430325ljc.24.1692226328835; Wed, 16 Aug
 2023 15:52:08 -0700 (PDT)
MIME-Version: 1.0
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
 <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
In-Reply-To: <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 17 Aug 2023 08:51:57 +1000
Message-ID: <CAPM=9tyots9C8wEU0TgGnFmLOkfqn62ngaYYjV2yuTf7jwDGFw@mail.gmail.com>
Subject: Re: Implement svm without BO concept in xe driver
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Philip Yang <Philip.Yang@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Zeng, Oak" <oak.zeng@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Aug 2023 at 08:15, Felix Kuehling <felix.kuehling@amd.com> wrote=
:
>
> On 2023-08-16 13:30, Zeng, Oak wrote:
> > I spoke with Thomas. We discussed two approaches:
> >
> > 1) make ttm_resource a central place for vram management functions such=
 as eviction, cgroup memory accounting. Both the BO-based driver and BO-les=
s SVM codes call into ttm_resource_alloc/free functions for vram allocation=
/free.
> >      *This way BO driver and SVM driver shares the eviction/cgroup logi=
c, no need to reimplment LRU eviction list in SVM driver. Cgroup logic shou=
ld be in ttm_resource layer. +Maarten.
> >      *ttm_resource is not a perfect match for SVM to allocate vram. It =
is still a big overhead. The *bo* member of ttm_resource is not needed for =
SVM - this might end up with invasive changes to ttm...need to look into mo=
re details
>
> Overhead is a problem. We'd want to be able to allocate, free and evict
> memory at a similar granularity as our preferred migration and page
> fault granularity, which defaults to 2MB in our SVM implementation.
>
>
> >
> > 2) svm code allocate memory directly from drm-buddy allocator, and expo=
se memory eviction functions from both ttm and svm so they can evict memory=
 from each other. For example, expose the ttm_mem_evict_first function from=
 ttm side so hmm/svm code can call it; expose a similar function from svm s=
ide so ttm can evict hmm memory.
>
> I like this option. One thing that needs some thought with this is how
> to get some semblance of fairness between the two types of clients.
> Basically how to choose what to evict. And what share of the available
> memory does each side get to use on average. E.g. an idle client may get
> all its memory evicted while a busy client may get a bigger share of the
> available memory.

I'd also like to suggest we try to write any management/generic code
in driver agnostic way as much as possible here. I don't really see
much hw difference should be influencing it.

I do worry about having effectively 2 LRUs here, you can't really have
two "leasts".

Like if we hit the shrinker paths who goes first? do we shrink one
object from each side in turn?

Also will we have systems where we can expose system SVM but userspace
may choose to not use the fine grained SVM and use one of the older
modes, will that path get emulated on top of SVM or use the BO paths?

Dave.
