Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7973F79B8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 18:02:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB026E39B;
	Wed, 25 Aug 2021 16:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C6676E39B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 16:02:45 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so45767648otc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9NAsls5nSJbGtmvDwmcT+koAZqC+Ph4mk6tDD/U7RvI=;
 b=uRUjgyPDNTfyYu+ZfNAzvTD0wRtMK9jaFxp99mjWhtrpaN57a4BRv0/6RZ2Jch1Tc/
 ahIzT4T1rvdWPqf7G1RwWdHNYupM+L6fHs5NwKGLY10HFixhziKmnJ9W1lRBOGDaTKtD
 DIl29vOyfWNeZZ2FAInUmJCphPGE/3GSLGATZi/YETUEWHeNqdnSJu03MSSAQ+/7kA3k
 V4TPHfRVfBqAh+MOxU8SBO7HjcQ+4mZfL/aCZjTyTP6AobFLZC8Q4tSscUC23wEdov/S
 f8041US4eoBPcClxqOBSjahfaqkK+A2Ys0z5zXExZpU0P3mRwFyMrIwQPxbJhV7iCTl4
 DzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9NAsls5nSJbGtmvDwmcT+koAZqC+Ph4mk6tDD/U7RvI=;
 b=jwkkDQE10EiO3q8w2tk/5uIh3mC0dRYjdodoYDgzDoQCNytqBe19+vBCI7fC/kTbK4
 4j3N74FXRfkO+OR6eCT38I6SP5OHqg2lCFTdEC/gU7Ay/AqxnE3VjIeEndtZKiyt+mIa
 sI+9KbCuPLZZW37ajhxkZIvZq4jNV/Y8N+kyGhPutxVoKZaHVE5QqMQe/pIaMvlz0LDt
 VAuab+olTySk29TZ5vshlJlrSbqqHHRRaLzyLNUdQwyUyiqNvP78AlqkBlQ/vZ+aRSA/
 4ejK6cu7/53cRE4rhqwF7AI15FpenteG+qtvDrk7L61YqAhnnaxlBq7O474ri0xcf735
 G1Vw==
X-Gm-Message-State: AOAM530H3lEyvKa24eBZdJsUUDWJyrI47R6rycPjBWrT5sCOsrSZNvmR
 whz8R6zT/je4VgpBgmjUDjJVX3geZ1zmrLVWK5g=
X-Google-Smtp-Source: ABdhPJx17sT8FcWFf+dzTZ75z6SZk2fiVHVLmEyX+32nRRSkAw06E9PY/3TI7K4Ty0EMa3zVY6Lq80XbSzgpV5VwsW4=
X-Received: by 2002:a9d:6a4b:: with SMTP id h11mr24390359otn.143.1629907364369; 
 Wed, 25 Aug 2021 09:02:44 -0700 (PDT)
MIME-Version: 1.0
References: <fa124990-ee0c-7401-019e-08109e338042@amd.com>
 <e2c47256-de89-7eaa-e5c2-5b96efcec834@amazon.com>
 <6b819064-feda-b70b-ea69-eb0a4fca6c0c@amd.com>
 <a9604a39-d08f-6263-4c5b-a2bc9a70583d@nvidia.com>
 <20210824173228.GE543798@ziepe.ca>
 <a716ae41-2d8c-c75a-a779-cc85b189fea2@amd.com>
 <20210825121832.GA1162709@nvidia.com>
 <fa22a1f9-fee6-21ea-3377-3ba99e9eb309@amd.com>
 <20210825123802.GD1721383@nvidia.com>
 <9c9ebc3b-44d0-0a81-04cc-d500e7f6da8d@amd.com>
 <20210825144736.GG1721383@nvidia.com>
 <92ae1a45-3903-8228-c299-7ba1506079bb@amd.com>
In-Reply-To: <92ae1a45-3903-8228-c299-7ba1506079bb@amd.com>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 25 Aug 2021 19:02:17 +0300
Message-ID: <CAFCwf11VoyPBC_30wbFNi5PntZUpH1t0u4piCoda5NgkL8y3Pg@mail.gmail.com>
Subject: Re: [RFC] Make use of non-dynamic dmabuf in RDMA
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Gal Pressman <galpress@amazon.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Doug Ledford <dledford@redhat.com>, 
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, 
 Oded Gabbay <ogabbay@habana.ai>, Tomer Tayar <ttayar@habana.ai>, 
 Yossi Leybovich <sleybo@amazon.com>, Alexander Matushevsky <matua@amazon.com>, 
 Leon Romanovsky <leonro@nvidia.com>, Jianxin Xiong <jianxin.xiong@intel.com>
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

On Wed, Aug 25, 2021 at 6:14 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 25.08.21 um 16:47 schrieb Jason Gunthorpe:
> > On Wed, Aug 25, 2021 at 03:51:14PM +0200, Christian K=C3=B6nig wrote:
> >> Am 25.08.21 um 14:38 schrieb Jason Gunthorpe:
> >>> On Wed, Aug 25, 2021 at 02:27:08PM +0200, Christian K=C3=B6nig wrote:
> >>>> Am 25.08.21 um 14:18 schrieb Jason Gunthorpe:
> >>>>> On Wed, Aug 25, 2021 at 08:17:51AM +0200, Christian K=C3=B6nig wrot=
e:
> >>>>>
> >>>>>> The only real option where you could do P2P with buffer pinning ar=
e those
> >>>>>> compute boards where we know that everything is always accessible =
to
> >>>>>> everybody and we will never need to migrate anything. But even the=
n you want
> >>>>>> some mechanism like cgroups to take care of limiting this. Otherwi=
se any
> >>>>>> runaway process can bring down your whole system.
> >>>>> Why? It is not the pin that is the problem, it was allocating GPU
> >>>>> dedicated memory in the first place. pinning it just changes the
> >>>>> sequence to free it. No different than CPU memory.
> >>>> Pinning makes the memory un-evictable.
> >>>>
> >>>> In other words as long as we don't pin anything we can support as ma=
ny
> >>>> processes as we want until we run out of swap space. Swapping sucks =
badly
> >>>> because your applications become pretty much unuseable, but you can =
easily
> >>>> recover from it by killing some process.
> >>>>
> >>>> With pinning on the other hand somebody sooner or later receives an =
-ENOMEM
> >>>> or -ENOSPC and there is no guarantee that this goes to the right pro=
cess.
> >>> It is not really different - you have the same failure mode once the
> >>> system runs out of swap.
> >>>
> >>> This is really the kernel side trying to push a policy to the user
> >>> side that the user side doesn't want..
> >> But which is still the right thing to do as far as I can see. See user=
space
> >> also doesn't want proper process isolation since it takes extra time.
> > Why? You are pushing a policy of resource allocation/usage which
> > more properly belongs in userspace.
> >
> >> Kernel development is driven by exposing the hardware functionality in=
 a
> >> save and manageable manner to userspace, and not by fulfilling userspa=
ce
> >> requirements.
> > I don't agree with this, that is a 1980's view of OS design. So much
> > these days in the kernel is driven entirely by boutique userspace
> > requirements and is very much not about the classical abstract role of
> > an OS.
>
> But it's still true never the less. Otherwise you would have libraries
> for filesystem accesses and no system security to speak of.
>
> >>> Dedicated systems are a significant use case here and should be
> >>> supported, even if the same solution wouldn't be applicable to someon=
e
> >>> running a desktop.
> >> And exactly that approach is not acceptable.
> > We have knobs and settings all over the place to allow Linux to
> > support a broad set of use cases from Android to servers, to HPC. So
> > long as they can co-exist and the various optional modes do not
> > critically undermine the security of the kernel, it is well in line
> > with how things have been evolving in the last 15 years.
>
> Yeah, that's exactly what I'm talking about by adding cgroup or similar.
> You need a knob to control this.
>
> > Here you are talking entirely about policy to control memory
> > allocation, which is already well trodden ground for CPU memory.
> >
> > There are now endless boutique ways to deal with this, it is a very
> > narrow view to say that GPU memory is so special and different that
> > only one way can be the correct/allowed way.
>
> Well I'm not talking about GPU memory in particular here. This is
> mandatory for any memory or saying more general any resource.
>
> E.g. you are not allowed to pin large amount of system memory on a
> default installation for exactly those reasons as well.

Unless you are working on a h/w architecture that is designed
specifically for a single user.
At least in our h/w architecture, we aim for 100% utilization of the
h/w when you are running DL training workloads, as opposed to what is
happening inside a GPU when you are running training.
Therefore, it is counter-productive to serve multiple users from a
performance perspective.
In fact, the training problem is so large, that a single ASIC is
hardly sufficient, and you need to run on anywhere between 8 ASICs to
64-128 ASICs to get a reasonable time for training.
So there is no point in serving multiple users in that case and that's
why our device memory (HBM) is always pinned.

This is totally different from the usual role of a GPU, where you
serve the desktop and multiple other applications that draw on the
screen.

I wouldn't want some knob in the kernel to control what is the limit
of memory I can pin or not. I just don't think it is useful and/or
user friendly.

btw, regarding ODP, we don't support it in h/w (yet) because 99% of
the use-cases in DL training will suffer from performance issues if we
don't pin the host memory.
There are extreme topologies, with 10TB of parameters that may require
this, but like I said, it's very rare and not worth the effort.

Thanks,
Oded

>
> That you can have a knob to disable this behavior for your HPC system is
> perfectly fine, but I thing what Dave notes here as well that this is
> most likely not the default behavior we want.
>
> Christian.
>
> >
> > Jason
>
