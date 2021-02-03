Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102BA30E179
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 18:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B686E1D3;
	Wed,  3 Feb 2021 17:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A7E6E1D3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 17:53:31 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id n7so725437oic.11
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 09:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wtellCtuRHt39fV3/yu1FjrgezEXEIq4OIkAdBng4Ts=;
 b=VLpKen1N7lDl43I6PTlTNoI6QsI0mU1Y1cWmWSZ6PaSl1FYWFNa0gjWZyeLLz49pCP
 DxLTLF3GNhvlF6QF9ru+n97f/p7FGVLJfkPBvliZGyryAbGuQTFxFcEIHW5SJeuPWfM3
 yPcrUjDtZpGjMbM1yUKoGXm21HcXU3bub2xfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wtellCtuRHt39fV3/yu1FjrgezEXEIq4OIkAdBng4Ts=;
 b=AX9fe2NHn5iI6ysHUjnO2vgxnjWuPewKzHZxWZ07dD5VKm3l+JFHlC20cfSHhmQS3m
 sVgCqMIDVnw27lZMI5AuRUa8oe9DE4RkP3YlMlV0RX6Sx9248EoDwX39Oig/h2QwxqCG
 IPKuJfX33wYnbM1VmzxdsbL8MW2n0Voq+zRoWxKzCj1lHd5suUfvUwcJuUPwayHabfjg
 Fzh8TWVpiE/uSxinTTQ5JRrUHeUYb7pVtbVodtvJmiISnaODGEEE1G8NGuMKp5WqKVWs
 kpIPhwmXzO5Hb0eZkMbwmymdvnA78YbicJr9hfezOVu5SqNXvTTtA+ZNl2JgWvVbXO0h
 jyPA==
X-Gm-Message-State: AOAM533u7sAOB1Bsg23ZMw11wTyaAkGB5oKgRW8DB+mnIRWaeyYHgoh9
 nCIH6ED1IUhRw2MHiCmMCa4MTGVJsLUrLdu894gNHg==
X-Google-Smtp-Source: ABdhPJxjKGrH3kmcv87UU6MfsVoIgLplBwJqW0cDMOUEJh9i1EwCDVmsyHS8yzJJLvHUWJ1kW4ZpziQ8HZQRbm7ibxo=
X-Received: by 2002:aca:1906:: with SMTP id l6mr2700082oii.101.1612374810519; 
 Wed, 03 Feb 2021 09:53:30 -0800 (PST)
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
In-Reply-To: <MW3PR11MB455563A3F337F789613A9940E5B49@MW3PR11MB4555.namprd11.prod.outlook.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 3 Feb 2021 18:53:19 +0100
Message-ID: <CAKMK7uHAD5FbDPeT2cD03HjHhvmMMG__muXqo=rTjd=htSMhtg@mail.gmail.com>
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

On Wed, Feb 3, 2021 at 5:57 PM Xiong, Jianxin <jianxin.xiong@intel.com> wrote:
>
> > -----Original Message-----
> > From: Leon Romanovsky <leon@kernel.org>
> > Sent: Tuesday, February 02, 2021 10:03 PM
> > To: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Jason Gunthorpe <jgg@ziepe.ca>; Gal Pressman <galpress@amazon.com>; Yishai Hadas
> > <yishaih@nvidia.com>; linux-rdma <linux-rdma@vger.kernel.org>; Edward Srouji <edwards@nvidia.com>; dri-devel <dri-
> > devel@lists.freedesktop.org>; Christian Koenig <christian.koenig@amd.com>; Doug Ledford <dledford@redhat.com>; Vetter, Daniel
> > <daniel.vetter@intel.com>
> > Subject: Re: [PATCH rdma-core v7 4/6] pyverbs: Add dma-buf based MR support
> >
>
> <...>
>
> > > > > > > > > +#include <drm/drm.h>
> > > > > > > > > +#include <drm/i915_drm.h> #include <drm/amdgpu_drm.h>
> > > > > > > > > +#include <drm/radeon_drm.h>
> > > > > > > >
> > > > > > > > I assume these should come from the kernel headers package, right?
> > > > > > >
> > > > > > > This is gross, all kernel headers should be placed in
> > > > > > > kernel-headers/* and "update" script needs to be extended to take drm/* files too :(.
> > > > > >
> > > > > > drm kernel headers are in the libdrm package. You need that
> > > > > > anyway for doing the ioctls (if you don't hand-roll the restarting yourself).
> > > > > >
> > > > > > Also our userspace has gone over to just outright copying the
> > > > > > driver headers. Not the generic headers, but for the rendering
> > > > > > side of gpus, which is the topic here, there's really not much generic stuff.
> > > > > >
> > > > > > > Jianxin, are you fixing it?
> > > > > >
> > > > > > So fix is either to depend upon libdrm for building, or have
> > > > > > copies of the headers included in the package for the
> > > > > > i915/amdgpu/radeon headers (drm/drm.h probably not so good idea).
> > > > >
> > > > > We should have a cmake test to not build the drm parts if it can't be built, and pyverbs should skip the tests.
> > > > >
> > > >
> > > > Yes, I will add a test for that. Also, on SLES, the headers could be under /usr/include/libdrm instead of /usr/include/drm. The make test
> > should check that and use proper path.
> > >
> > > Please use pkgconfig for this, libdrm installs a .pc file to make sure
> > > you can find the right headers.
> >
> > rdma-core uses cmake build system and in our case cmake find_library() is preferable over pkgconfig.
>
> Only the headers are needed, and they could be installed via either the libdrm-devel package or the kernel-headers package. The cmake find_path() command is more suitable here.

Except if your distro is buggy (or doesn't support any gpu drivers at
all) they will never be installed as part of kernel-headers.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
