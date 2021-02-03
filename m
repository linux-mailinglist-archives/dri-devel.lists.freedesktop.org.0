Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729E430E237
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 19:15:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4FC6EB71;
	Wed,  3 Feb 2021 18:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34A36EB71
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 18:15:03 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id a6so58968vkb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 10:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jTjc5saP18Z9ZHrsWYL0aarveqABgO38FSaqDhJr1pU=;
 b=qXRC5KH2McF3+nHNT+aNPj6UjiewloENUZY6MIMqUnJD03qfo0kPHOC88M5EQNUW58
 KHeWB1vv/Lns8LWKDIAdU0PQOlsnGE8Qz4699T5g8Z8hnkYuUVn64FwiyyO3M2QwbFjl
 TPM9QoLc7BpSXyUAKeiH1m4b+gx4lefk6O+iKcDMcyndbyBe3QI8HXJbABqOJ5euMbhp
 GLdlkoyHKugaJB0wPW7E0rggsnseDn0w59sMTNNXBFdcHQSgO2s94BAqYsBTcvHmIwa7
 fE5xaly1dWXBIBuaNUSHLC2dl0hJFdoYt31HYP+C0cIxl9Is0jUOfHpEXuQyTennrIci
 +aHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jTjc5saP18Z9ZHrsWYL0aarveqABgO38FSaqDhJr1pU=;
 b=FfqdkpqVCKxKjlCfLH977ClruOV1ny/eLF19QMOn7KppQuga5Wj7pPtmrLBVjarhKG
 DejU9GG+TlzoxANvoSdi+DKz+neIsqquQQFh3eUXqVvYiG7tr1SpD46RaN5MOk1PgeUE
 4o1FUHOdFfw1AeMTgOZRjJuX/SBLpgHhmZPlhk1RUcSzF/OXFqN9GiuwTnoutzRCkJD/
 gFhbjvxpg5VuoZ4KgmHl76P4hfutflkoXo+Ok0IQT2FZrc91Kqy4T18JhVzwLhNWefar
 CdAsDyZWM9eJCTjajIzSEIj4wJlWuRiyFDfea+WbgTtfFPGkCWX5TT8nVrJgOCXClu9J
 X9Nw==
X-Gm-Message-State: AOAM530+Gqg4kicZWQYv4HGQMAdldmGhxj2Rr3RQI7V9CJYPmi6u8DuS
 XAN5fAkl3mL1jtWam3UQ3LZzd3DoSDK/yhT6jPU=
X-Google-Smtp-Source: ABdhPJyOA7VskZ/5XNF1GDtfe083hA/WrGqvZICr1i8BiVEniIT2WP0MrXv5l2Mw/Hh5HB/Dqs4j/vcwKXdBR2sYQ48=
X-Received: by 2002:a1f:a78c:: with SMTP id q134mr2748109vke.17.1612376102779; 
 Wed, 03 Feb 2021 10:15:02 -0800 (PST)
MIME-Version: 1.0
References: <1611604622-86968-1-git-send-email-jianxin.xiong@intel.com>
 <1611604622-86968-5-git-send-email-jianxin.xiong@intel.com>
 <137f406b-d3e0-fdeb-18e7-194a2aed927c@amazon.com>
 <20210201061603.GC4593@unreal>
 <CAKMK7uE0kSC1si0E9D1Spkn9aW2jFJw_SH3hYC6sZL7mG6pzyg@mail.gmail.com>
 <20210201152922.GC4718@ziepe.ca>
 <MW3PR11MB455569DF7B795272687669BFE5B69@MW3PR11MB4555.namprd11.prod.outlook.com>
 <YBluvZn1orYl7L9/@phenom.ffwll.local> <20210203060320.GK3264866@unreal>
 <MW3PR11MB455563A3F337F789613A9940E5B49@MW3PR11MB4555.namprd11.prod.outlook.com>
 <CAKMK7uHAD5FbDPeT2cD03HjHhvmMMG__muXqo=rTjd=htSMhtg@mail.gmail.com>
 <MW3PR11MB455504E449DC36622361DD22E5B49@MW3PR11MB4555.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB455504E449DC36622361DD22E5B49@MW3PR11MB4555.namprd11.prod.outlook.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 3 Feb 2021 18:14:51 +0000
Message-ID: <CACvgo509W372mhrvAp5hmhddGWuWYe20xiwc68SROtHO9_sfsA@mail.gmail.com>
Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
To: "Xiong, Jianxin" <jianxin.xiong@intel.com>
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, Edward Srouji <edwards@nvidia.com>,
 Gal Pressman <galpress@amazon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 3 Feb 2021 at 17:58, Xiong, Jianxin <jianxin.xiong@intel.com> wrote:
>
> > -----Original Message-----
> > From: Daniel Vetter <daniel@ffwll.ch>
> > Sent: Wednesday, February 03, 2021 9:53 AM
> > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > Cc: Leon Romanovsky <leon@kernel.org>; Jason Gunthorpe <jgg@ziepe.ca>; Gal Pressman <galpress@amazon.com>; Yishai Hadas
> > <yishaih@nvidia.com>; linux-rdma <linux-rdma@vger.kernel.org>; Edward Srouji <edwards@nvidia.com>; dri-devel <dri-
> > devel@lists.freedesktop.org>; Christian Koenig <christian.koenig@amd.com>; Doug Ledford <dledford@redhat.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
> >
> > On Wed, Feb 3, 2021 at 5:57 PM Xiong, Jianxin <jianxin.xiong@intel.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Leon Romanovsky <leon@kernel.org>
> > > > Sent: Tuesday, February 02, 2021 10:03 PM
> > > > To: Daniel Vetter <daniel@ffwll.ch>
> > > > Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Jason Gunthorpe
> > > > <jgg@ziepe.ca>; Gal Pressman <galpress@amazon.com>; Yishai Hadas
> > > > <yishaih@nvidia.com>; linux-rdma <linux-rdma@vger.kernel.org>;
> > > > Edward Srouji <edwards@nvidia.com>; dri-devel <dri-
> > > > devel@lists.freedesktop.org>; Christian Koenig
> > > > <christian.koenig@amd.com>; Doug Ledford <dledford@redhat.com>;
> > > > Vetter, Daniel <daniel.vetter@intel.com>
> > > > Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR
> > > > support
> > > >
> > >
> > > <...>
> > >
> > > > > > > > > > > +#include <drm/drm.h>
> > > > > > > > > > > +#include <drm/i915_drm.h> #include <drm/amdgpu_drm.h>
> > > > > > > > > > > +#include <drm/radeon_drm.h>
> > > > > > > > > >
> > > > > > > > > > I assume these should come from the kernel headers package, right?
> > > > > > > > >
> > > > > > > > > This is gross, all kernel headers should be placed in
> > > > > > > > > kernel-headers/* and "update" script needs to be extended to take drm/* files too :(.
> > > > > > > >
> > > > > > > > drm kernel headers are in the libdrm package. You need that
> > > > > > > > anyway for doing the ioctls (if you don't hand-roll the restarting yourself).
> > > > > > > >
> > > > > > > > Also our userspace has gone over to just outright copying
> > > > > > > > the driver headers. Not the generic headers, but for the
> > > > > > > > rendering side of gpus, which is the topic here, there's really not much generic stuff.
> > > > > > > >
> > > > > > > > > Jianxin, are you fixing it?
> > > > > > > >
> > > > > > > > So fix is either to depend upon libdrm for building, or have
> > > > > > > > copies of the headers included in the package for the
> > > > > > > > i915/amdgpu/radeon headers (drm/drm.h probably not so good idea).
> > > > > > >
> > > > > > > We should have a cmake test to not build the drm parts if it can't be built, and pyverbs should skip the tests.
> > > > > > >
> > > > > >
> > > > > > Yes, I will add a test for that. Also, on SLES, the headers
> > > > > > could be under /usr/include/libdrm instead of /usr/include/drm.
> > > > > > The make test
> > > > should check that and use proper path.
> > > > >
> > > > > Please use pkgconfig for this, libdrm installs a .pc file to make
> > > > > sure you can find the right headers.
> > > >
> > > > rdma-core uses cmake build system and in our case cmake find_library() is preferable over pkgconfig.
> > >
> > > Only the headers are needed, and they could be installed via either the libdrm-devel package or the kernel-headers package. The cmake
> > find_path() command is more suitable here.
> >
> > Except if your distro is buggy (or doesn't support any gpu drivers at
> > all) they will never be installed as part of kernel-headers.
>
> Right, that's why we want to check for the existence of the header file (find_path() does just that) instead of the existence of the package(s).
>
Fwiw the .pc file does not list "packages", but the location of the
headers and/or libraries.
Last time I tried find_path() wasn't that great, since it had no way
to detect non-standard (aka outside of /usr/include) installs.

HTH
-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
