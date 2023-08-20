Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9E6782099
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 00:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D75A10E160;
	Sun, 20 Aug 2023 22:21:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BB910E160;
 Sun, 20 Aug 2023 22:21:41 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-991c786369cso359461566b.1; 
 Sun, 20 Aug 2023 15:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692570099; x=1693174899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/fO+DzwvYyS7ty51jaKKc7uhLpWol4NpPa1fM34YjiI=;
 b=kDf35+n76ZHlFyloB7ru5PEgo6xfYAc/pN2hdlVFyD9WVYTrURVeo97mlakGmR63rh
 BdRQrR8YacX/kMe+dpWoJyxop7n6H0FP2gFFjXDrs7Doqi0CIS1Htpq87LxrQrfaJsjg
 nDHEF3IpUcN6sTGSsRFihxbCVtdDX3ROXNfDOSqZ2B1UL9x+gRSG7IxS/SswGjpKs/vB
 vQ9/By3vYqXcWMHdzzJXU/jmqJZlXC7aPEXLbvaVvGGduruT2ajD8l5d5R6oQvvxRfFF
 YlqR6qwDb5HqIxkp9NfnHcjnjaUXyMl3aZdcGSkLTKaqC+HGfazFPjCSEuYyQeLHsnAB
 jMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692570099; x=1693174899;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/fO+DzwvYyS7ty51jaKKc7uhLpWol4NpPa1fM34YjiI=;
 b=aRZKIK2Hny67Z90gHcxbrinIZwFmUjJlgOkr3uoLiJ7HP6GT7Az/mXlZ2v+Lwh5dje
 8d6b7ljhvEoAcBxMElOqguZILQy/2Z1WDEeJedYsyreDnSdl8RKpBwTYx3D1kadw1qEe
 1wqWvTC5qGhfr7t/LbCosUz/3+SPnGb26McmYFLwPijqxs+Thip2dTk7CLOovlb8mPAy
 C36AcncnIroJUF9YpcKoSYjJzJANZGy0Hh3MA5A20z29H3IDHxrQLPlZ2xJg67ekWP0Z
 TdwNePzSY8VgKkU1M/E/CNzPGRWDZ1dD+xJw8vdz+YxMcuubpYccihehmZUjpkv5YKzb
 oIaQ==
X-Gm-Message-State: AOJu0Yxq324NUQ9qqs5GVX3YMN+DVFYn79YgWahFgcjFJXfW8fQAMt7E
 aOb0AtAW40NGtSWDKUNNMvPOHzcxTJ8Iol6CPe0=
X-Google-Smtp-Source: AGHT+IGYja4fgpmlb3lsJ4H7NFfqHYCj7KSV3ffEzZ0PnNy0qHSe28NrukOhnRseaMq9qCqlz00xJ0uYW7uD5MS1k5o=
X-Received: by 2002:a17:907:2712:b0:96f:8439:6143 with SMTP id
 w18-20020a170907271200b0096f84396143mr3575005ejk.40.1692570099261; Sun, 20
 Aug 2023 15:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991F9E3107C963BDF95E04E9214A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <e0d7d6a2-5c9d-6e17-4b4b-be03deb6c130@amd.com>
 <SA1PR11MB69918E5603E286961789DE6D9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <3c125b60-df60-2037-c23f-918734e4973f@amd.com>
 <SA1PR11MB69916E51CE5A9217D447B91C9215A@SA1PR11MB6991.namprd11.prod.outlook.com>
 <7ae5f112-d0e9-cc52-2b22-7265ea435cc2@amd.com>
 <CAPM=9tyots9C8wEU0TgGnFmLOkfqn62ngaYYjV2yuTf7jwDGFw@mail.gmail.com>
 <SA1PR11MB6991D7E239EAB23CC8A9A36B921AA@SA1PR11MB6991.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB6991D7E239EAB23CC8A9A36B921AA@SA1PR11MB6991.namprd11.prod.outlook.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 21 Aug 2023 08:21:27 +1000
Message-ID: <CAPM=9tw3wGhZ3ByfizM8+G4Ny5wQLwf4fw8pD4sySVk08355tg@mail.gmail.com>
Subject: Re: Implement svm without BO concept in xe driver
To: "Zeng, Oak" <oak.zeng@intel.com>
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
 Philip Yang <Philip.Yang@amd.com>, Felix Kuehling <felix.kuehling@amd.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Aug 2023 at 12:13, Zeng, Oak <oak.zeng@intel.com> wrote:
>
> > -----Original Message-----
> > From: Dave Airlie <airlied@gmail.com>
> > Sent: August 16, 2023 6:52 PM
> > To: Felix Kuehling <felix.kuehling@amd.com>
> > Cc: Zeng, Oak <oak.zeng@intel.com>; Christian K=C3=B6nig
> > <christian.koenig@amd.com>; Thomas Hellstr=C3=B6m
> > <thomas.hellstrom@linux.intel.com>; Brost, Matthew
> > <matthew.brost@intel.com>; maarten.lankhorst@linux.intel.com;
> > Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; Welty=
,
> > Brian <brian.welty@intel.com>; Philip Yang <Philip.Yang@amd.com>; intel=
-
> > xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> > Subject: Re: Implement svm without BO concept in xe driver
> >
> > On Thu, 17 Aug 2023 at 08:15, Felix Kuehling <felix.kuehling@amd.com> w=
rote:
> > >
> > > On 2023-08-16 13:30, Zeng, Oak wrote:
> > > > I spoke with Thomas. We discussed two approaches:
> > > >
> > > > 1) make ttm_resource a central place for vram management functions =
such as
> > eviction, cgroup memory accounting. Both the BO-based driver and BO-les=
s SVM
> > codes call into ttm_resource_alloc/free functions for vram allocation/f=
ree.
> > > >      *This way BO driver and SVM driver shares the eviction/cgroup =
logic, no
> > need to reimplment LRU eviction list in SVM driver. Cgroup logic should=
 be in
> > ttm_resource layer. +Maarten.
> > > >      *ttm_resource is not a perfect match for SVM to allocate vram.=
 It is still a
> > big overhead. The *bo* member of ttm_resource is not needed for SVM - t=
his
> > might end up with invasive changes to ttm...need to look into more deta=
ils
> > >
> > > Overhead is a problem. We'd want to be able to allocate, free and evi=
ct
> > > memory at a similar granularity as our preferred migration and page
> > > fault granularity, which defaults to 2MB in our SVM implementation.
> > >
> > >
> > > >
> > > > 2) svm code allocate memory directly from drm-buddy allocator, and =
expose
> > memory eviction functions from both ttm and svm so they can evict memor=
y
> > from each other. For example, expose the ttm_mem_evict_first function f=
rom
> > ttm side so hmm/svm code can call it; expose a similar function from sv=
m side so
> > ttm can evict hmm memory.
> > >
> > > I like this option. One thing that needs some thought with this is ho=
w
> > > to get some semblance of fairness between the two types of clients.
> > > Basically how to choose what to evict. And what share of the availabl=
e
> > > memory does each side get to use on average. E.g. an idle client may =
get
> > > all its memory evicted while a busy client may get a bigger share of =
the
> > > available memory.
> >
> > I'd also like to suggest we try to write any management/generic code
> > in driver agnostic way as much as possible here. I don't really see
> > much hw difference should be influencing it.
> >
> > I do worry about having effectively 2 LRUs here, you can't really have
> > two "leasts".
> >
> > Like if we hit the shrinker paths who goes first? do we shrink one
> > object from each side in turn?
>
> One way to solve this fairness problem is to create a driver agnostic drm=
_vram_mgr. Maintain a single LRU in drm_vram_mgr. Move the memory eviction/=
cgroups memory accounting logic from ttm_resource manager to drm_vram_mgr. =
Both BO-based driver and SVM driver calls to drm_vram_mgr to allocate/free =
memory.
>
> I am not sure whether this meets the 2M allocate/free/evict granularity r=
equirement Felix mentioned above. SVM can allocate 2M size blocks. But BO d=
river should be able to allocate any arbitrary sized blocks - So the evicti=
on is also arbitrary size.
>
> >
> > Also will we have systems where we can expose system SVM but userspace
> > may choose to not use the fine grained SVM and use one of the older
> > modes, will that path get emulated on top of SVM or use the BO paths?
>
>
> If by "older modes" you meant the gem_bo_create (such as xe_gem_create or=
 amdgpu_gem_create), then today both amd and intel implement those interfac=
es using BO path. We don't have a plan to emulate that old mode on tope of =
SVM, afaict.

I'm not sure how the older modes manifest in the kernel I assume as bo
creates (but they may use userptr), SVM isn't a specific thing, it's a
group of 3 things.

coarse-grained SVM which I think is BO
fine-grained SVM which is page level
fine-grained system SVM which is HMM

I suppose I'm asking about the previous versions and how they would
operate in a system SVM capable system.

Dave.
>
> Thanks,
> Oak
>
> >
> > Dave.
