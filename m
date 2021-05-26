Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AE5391934
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 15:52:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBE16E500;
	Wed, 26 May 2021 13:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB3C86ECD2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 13:51:57 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 66-20020a9d02c80000b02903615edf7c1aso1030187otl.13
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 06:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NQQ2QlKG8USraZgLg7Z7CLDTbkvH3Ja6tLYSMEaPvoE=;
 b=cCraq7xvMjGG//smEDF3crqdU4HWsYQchD8qCi2BqMEfFuW1sGYQI0dgAxXIx/Ie4M
 qFLXn09zsV4A7bWzmhslzvMwlVm++gaBpU5jmtv6lBphC3GrunX5x3rUQttT4iWQdbEN
 q0NTxpxz8XnUY41hdMRL+Dnb0npyp1q8FAiTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NQQ2QlKG8USraZgLg7Z7CLDTbkvH3Ja6tLYSMEaPvoE=;
 b=g/l2QPx93DE2I+U2W3I5pUF+LLyy5BmRwMwmQ4S+F8WojicyRwPH4D7vfK6xr6pzN9
 YIkZxl8FS5jj9UmxlICMn6/237wUIFxxjtep8fD0eHFQ60X39i1l3HvMrg+KEGYf0wyS
 pI0qbV1bI7aFrHwJ7I9HIkMuLr3VTFMZdyxy0m5I7jwweRFzJ2RjE4QETP0cqFNPvAk8
 SXHYWDHtIQ53ZMW+l9Xir0MoWwck3Ts4/o0KzLqRV8aGail0JOFFJrH2MuDozpZRmeSA
 hgywF+/YozzYnaWu296O41SnlLOl4PnA9wAS/YuifrEo+eRQjg3xBV5EpYBO/VFi6gE5
 lZYA==
X-Gm-Message-State: AOAM531uOgL8XxUgTPUjKHrdC6rsDIHkfEmBiU8ODRib2xIMqyZGxlnn
 MMZhKhUoqVgpQE5EKNHFj6IrFU6HSiiDdztDNxNU0A==
X-Google-Smtp-Source: ABdhPJw/zQ1FWrTEAmLzxtyN95lNd7ehO2fL/e4d75AeL/xc+dw8P3f31yEV6YEbV6cEvXkyTvF1e7adV89JJh1vh7g=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr2405346otq.303.1622037116909; 
 Wed, 26 May 2021 06:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <CAP+8YyEhRwgz2hCri3K7Kv1OusVa_LGEuKZqQEx5jv+NiDKZrA@mail.gmail.com>
 <YKfFqrlLrikGMn4K@phenom.ffwll.local>
 <CAP+8YyG0o58dQt_tvnJ2ESbeqo02xxvFdifpMwnhz2VYNk8HUw@mail.gmail.com>
 <YKfOymXrB7O4cYVb@phenom.ffwll.local>
 <31467363-e936-879b-8b0d-5a2a92644221@gmail.com>
 <CAKMK7uFswfc96hS40uc0Lug=doYAcf-yC-eu96iWqNJnM65MJQ@mail.gmail.com>
 <ae13093e-c364-7b90-1f91-39de42594cd6@amd.com>
 <YKz2KVppVoYMxB5u@phenom.ffwll.local>
 <312b183f-8eb2-d9e2-24ad-b429b74c886c@gmail.com>
 <CAKMK7uG-JYieYvnc0R-FXJJDrCZfypvstYw2NrLPRt+J9=oe1g@mail.gmail.com>
 <fe633922-53a4-2409-8697-d815650c65ac@gmail.com>
In-Reply-To: <fe633922-53a4-2409-8697-d815650c65ac@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 26 May 2021 15:51:45 +0200
Message-ID: <CAKMK7uFQczzpkdSLB1H-dVySGTiap2ONETZCaz5ErE1sca8YWQ@mail.gmail.com>
Subject: Re: [Mesa-dev] [PATCH 01/11] drm/amdgpu: Comply with implicit fencing
 rules
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 3:32 PM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 25.05.21 um 17:23 schrieb Daniel Vetter:
> > On Tue, May 25, 2021 at 5:05 PM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Hi Daniel,
> >>
> >> Am 25.05.21 um 15:05 schrieb Daniel Vetter:
> >>> Hi Christian,
> >>>
> >>> On Sat, May 22, 2021 at 10:30:19AM +0200, Christian K=C3=B6nig wrote:
> >>>> Am 21.05.21 um 20:31 schrieb Daniel Vetter:
> >>>> This works by adding the fence of the last eviction DMA operation to=
 BOs
> >>>> when their backing store is newly allocated. That's what the
> >>>> ttm_bo_add_move_fence() function you stumbled over is good for: http=
s://elixir.bootlin.com/linux/v5.13-rc2/source/drivers/gpu/drm/ttm/ttm_bo.c#=
L692
> >>>>
> >>>> Now the problem is it is possible that the application is terminated=
 before
> >>>> it can complete it's command submission. But since resource manageme=
nt only
> >>>> waits for the shared fences when there are some there is a chance th=
at we
> >>>> free up memory while it is still in use.
> >>> Hm where is this code? Would help in my audit that I wanted to do thi=
s
> >>> week? If you look at most other places like
> >>> drm_gem_fence_array_add_implicit() I mentioned earlier, then we don't
> >>> treat the shared fences special and always also include the exclusive=
 one.
> >> See amdgpu_gem_object_close():
> >>
> >> ...
> >>           fence =3D dma_resv_get_excl(bo->tbo.base.resv);
> >>           if (fence) {
> >>                   amdgpu_bo_fence(bo, fence, true);
> >>                   fence =3D NULL;
> >>           }
> >> ...
> >>
> >> We explicitly added that because resource management of some other
> >> driver was going totally bananas without that.
> >>
> >> But I'm not sure which one that was. Maybe dig a bit in the git and
> >> mailing history of that.
> > Hm I looked and it's
> >
> > commit 82c416b13cb7d22b96ec0888b296a48dff8a09eb
> > Author: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Date:   Thu Mar 12 12:03:34 2020 +0100
> >
> >     drm/amdgpu: fix and cleanup amdgpu_gem_object_close v4
> >
> > That sounded more like amdgpu itself needing this, not another driver?
>
> No, that patch was just a follow up moving the functionality around.

That patch added the "add exclusive fence to shared slots before
amdgpu_vm_clear_freed() call", which I thought was at least part of
your fix.

> > But looking at amdgpu_vm_bo_update_mapping() it seems to pick the
> > right fencing mode for gpu pte clearing, so I'm really not sure what
> > the bug was that you worked around here?The implementation boils down
> > to amdgpu_sync_resv() which syncs for the exclusive fence, always. And
> > there's nothing else that I could find in public history at least, no
> > references to bug reports or anything. I think you need to dig
> > internally, because as-is I'm not seeing the problem here.
> >
> > Or am I missing something here?
>
> See the code here for example:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/no=
uveau_fence.c#L361
>
> Nouveau assumes that when a shared fence is present it doesn't need to
> wait for the exclusive one because the shared are always supposed to
> finish after the exclusive one.
>
> But for page table unmap fences that isn't true and we ran into a really
> nasty and hard to reproduce bug because of this.
>
> I think it would be much more defensive if we could say that we always
> wait for the exclusive fence and fix the use case in nouveau and double
> check if somebody else does stuff like that as well.

Yeah most other drivers do the defensive thing here. I think it would
be good to standardize on that. I'll add that to my list and do more
auditing.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
