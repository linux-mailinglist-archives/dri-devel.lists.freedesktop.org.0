Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E558C985
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 15:32:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D93F96EB2;
	Mon,  8 Aug 2022 13:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072FF955E0;
 Mon,  8 Aug 2022 13:25:51 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id e69so7070488iof.5;
 Mon, 08 Aug 2022 06:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=68YFZMEC3HDKi0QaOaKu3aQ5ajl6AwHAA0kXrY5iQ1Q=;
 b=YskrSqzDRjwAS6zEM261EvA4vuSRbclnqunPEU681fpivWsF9cKCFz3cV2NndcUQoy
 L9hexw/43YJQYXzlVTxcP5xlAEpucUZGfp49DuIymQkFDM0O9qoVyW6pmIjBmEunyFg/
 HLzSH5rY+TfQoKJlCu53vJSYKFEnEJsUlDuBbnFRYRnGJE4iWlSKtrWE59nNbSVrtsXK
 SPQLFprvPHSfU9f7Y8QM9pHsfilvaQf+zKnaedszgM1CH1Lf5OFjJiweWVfJI/Zy0jSY
 nWmFKX7fPhul/ndOg18WcJLy/6mwTrtNwHfPuCh7WZEc8Jc186ngAWn1zOaBDaiTKfZw
 fl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=68YFZMEC3HDKi0QaOaKu3aQ5ajl6AwHAA0kXrY5iQ1Q=;
 b=r8+TOBi6kVYOZ7Ov0E47oaRdEcKAKGcG8WWlKACLXZV5aOwUwYxv8hk6LvuDlgIp7P
 T0pmVnfQhdwiV1cmsRq4BKaaBNinvxhUtMZTeA6R0haeqkABnvbre3AorAhvCOsClNTz
 Moq2a2km6lUyjhN9Ny7oW30nMLaKAIfTNwWPcryaTzHVNIk4egSZbqEzLPhNddsqqekF
 3M03CDZyiyF0NzdBeiNv4dm9Q4rUxk1LYZc1v1n5C5yfPs9h+HArvjCRuu2DChWOGETm
 Q01Hc750tir51qlAKFAUbvO7uyr3mXQnpZI7OrYJuC++ewbQmRliu3NPMzdVRD2zcGUE
 jkJg==
X-Gm-Message-State: ACgBeo1gzmYYkAda7Oo9C0aaBLG7IEFlqn1lDGEhYInafVcxBxScdj/5
 2wjXFuu2GBnHm3y7I8W/I/MJQyUcii7YZUyNjJfIih+l
X-Google-Smtp-Source: AA6agR5kgcCUFrKEOY6pQkBu7dL4BYwwYhkLVLcJXG2oUjiWGRcjk7WM5nj0V9FKf11K3BwZgSpkupnTmUgxGK2O/Sc=
X-Received: by 2002:a05:6638:2653:b0:343:146b:e74e with SMTP id
 n19-20020a056638265300b00343146be74emr1246643jat.85.1659965150208; Mon, 08
 Aug 2022 06:25:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220729170744.1301044-1-robdclark@gmail.com>
 <20220729170744.1301044-2-robdclark@gmail.com>
 <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com>
 <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
 <973de2f8-75e4-d4c7-a13a-c541a6cf7c77@amd.com>
 <CAF6AEGuhQT6A_jh8kLWh5xMoUGc1osdewyBk-8NoprtWOHseaQ@mail.gmail.com>
 <2fc74efe-220f-b57a-e804-7d2b3880d14f@gmail.com>
 <CAF6AEGv9H+fSFKPNqwPxYUjkgj05AimpXbp-p_JL8nKLnzON=w@mail.gmail.com>
 <e2423bd7-ef73-8d43-c661-a19c80ad1a26@gmail.com>
 <CAF6AEGsoYaXe2+qug_TfT99KXuXh9Ez2L2HjQZroE6c6GSW4SQ@mail.gmail.com>
 <e90caaaa-cae9-c6d1-bfb6-dc56aa559681@amd.com>
In-Reply-To: <e90caaaa-cae9-c6d1-bfb6-dc56aa559681@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 8 Aug 2022 06:26:16 -0700
Message-ID: <CAF6AEGtWjtF7_uCYAH4uARVXgnOnX3DZ3KQahxTdAi_9Myvw0w@mail.gmail.com>
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 8, 2022 at 4:22 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 07.08.22 um 21:10 schrieb Rob Clark:
> > On Sun, Aug 7, 2022 at 11:05 AM Christian K=C3=B6nig
> > <ckoenig.leichtzumerken@gmail.com> wrote:
> >> Am 07.08.22 um 19:56 schrieb Rob Clark:
> >>> On Sun, Aug 7, 2022 at 10:38 AM Christian K=C3=B6nig
> >>> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>>> [SNIP]
> >>>> And exactly that was declared completely illegal the last time it ca=
me
> >>>> up on the mailing list.
> >>>>
> >>>> Daniel implemented a whole bunch of patches into the DMA-buf layer t=
o
> >>>> make it impossible for KVM to do this.
> >>> This issue isn't really with KVM, it is not making any CPU mappings
> >>> itself.  KVM is just making the pages available to the guest.
> >> Well I can only repeat myself: This is strictly illegal.
> >>
> >> Please try this approach with CONFIG_DMABUF_DEBUG set. I'm pretty sure
> >> you will immediately run into a crash.
> >>
> >> See this here as well
> >> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fel=
ixir.bootlin.com%2Flinux%2Fv5.19%2Fsource%2Fdrivers%2Fdma-buf%2Fdma-buf.c%2=
3L653&amp;data=3D05%7C01%7Cchristian.koenig%40amd.com%7Cc1392f76994f4fef7c7=
f08da78a86283%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6379549618929967=
70%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DT3g9ICZizCWXkIn5vEnhFYs38Uj3=
7jCwHjMb1s3UtOw%3D&amp;reserved=3D0
> >>
> >> Daniel intentionally added code to mangle the page pointers to make it
> >> impossible for KVM to do this.
> > I don't believe KVM is using the sg table, so this isn't going to stop
> > anything ;-)
>
> Then I have no idea how KVM actually works. Can you please briefly
> describe that?
>
> >> If the virtio/virtgpu UAPI was build around the idea that this is
> >> possible then it is most likely fundamental broken.
> > How else can you envision mmap'ing to guest userspace working?
>
> Well long story short: You can't.
>
> See userspace mappings are not persistent, but rather faulted in on
> demand. The exporter is responsible for setting those up to be able to
> add reverse tracking and so can invalidate those mappings when the
> backing store changes.

I think that is not actually a problem.  At least for how it works on
arm64 but I'm almost positive x86 is similar.. I'm not sure how else
you could virtualize mmu/iommu/etc in a way that didn't have horrible
performance.

There are two levels of pagetable translation, the first controlled by
the host kernel, the second by the guest.  From the PoV of host
kernel, it is just memory mapped to userspace, getting faulted in on
demand, just as normal.  First the guest controlled translation
triggers a fault in the guest which sets up guest mapping.  And then
the second level of translation to translate from what guest sees as
PA (but host sees as VA) to actual PA triggers a fault in the host.

>
> > The guest kernel is the one that controls the guest userspace pagetable=
s,
> > not the host kernel.  I guess your complaint is about VMs in general,
> > but unfortunately I don't think you'll convince the rest of the
> > industry to abandon VMs ;-)
>
> I'm not arguing against the usefulness of VM, it's just that what you
> describe here technically is just utterly nonsense as far as I can tell.
>
> I have to confess that I'm totally lacking how this KVM mapping works,
> but when the struct pages pointers from the sg_table are not used I see
> two possibilities what was implemented here:
>
> 1. KVM is somehow walking the page tables to figure out what to map into
> the guest VM.

it is just mapping host VA to the guest.. the guest kernel sees this
as the PA and uses the level of pgtable translation that it controls
to map to guest userspace.  *All* that is needed (which this patch
provides) is the correct cache attributes.

>      This would be *HIGHLY* illegal and not just with DMA-buf, but with
> pretty much a whole bunch of other drivers/subsystems as well.
>      In other words it would be trivial for the guest to take over the
> host with that because it doesn't take into account that the underlying
> backing store of DMA-buf and other mmaped() areas can change at any time.
>
> 2. The guest VM triggers the fault handler for the mappings to fill in
> their page tables on demand.
>
>      That would actually work with DMA-buf, but then the guest needs to
> somehow use the caching attributes from the host side and not use it's ow=
n.

This is basically what happens, although via the two levels of pgtable
translation.  This patch provides the missing piece, the caching
attributes.

>      Because otherwise you can't accommodate that the exporter is
> changing those caching attributes.

Changing the attributes dynamically isn't going to work.. or at least
not easily.  If you had some sort of synchronous notification to host
userspace, it could trigger an irq to the guest, I suppose.  But it
would mean host kernel has to block waiting for host userspace to
interrupt the guest, then wait for guest vgpu process to be scheduled
and handle the irq.

At least in the case of msm, the cache attributes are static for the
life of the buffer, so this scenario isn't a problem.  AFAICT this
should work fine for at least all UMA hw.. I'm a bit less sure when it
comes to TTM, but shouldn't you at least be able to use worst-cache
cache attributes for buffers that are allowed to be mapped to guest?

BR,
-R

>
> > But more seriously, let's take a step back here.. what scenarios are
> > you seeing this being problematic for?  Then we can see how to come up
> > with solutions.  The current situation of host userspace VMM just
> > guessing isn't great.
>
> Well "isn't great" is a complete understatement. When KVM/virtio/virtgpu
> is doing what I guess they are doing here then that is a really major
> security hole.
>
> >    And sticking our heads in the sand and
> > pretending VMs don't exist isn't great.  So what can we do?  I can
> > instead add a msm ioctl to return this info and solve the problem even
> > more narrowly for a single platform.  But then the problem still
> > remains on other platforms.
>
> Well once more: This is *not* MSM specific, you just absolutely *can't
> do that* for any driver!
>
> I'm just really wondering what the heck is going on here, because all of
> this was discussed in lengthy before on the mailing list and very
> bluntly rejected.
>
> Either I'm missing something (that's certainly possible) or we have a
> strong case of somebody implementing something without thinking about
> all the consequences.
>
> Regards,
> Christian.
>
>
> >
> > Slightly implicit in this is that mapping dma-bufs to the guest won't
> > work for anything that requires DMA_BUF_IOCTL_SYNC for coherency.. we
> > could add a possible return value for DMA_BUF_INFO_VM_PROT indicating
> > that the buffer does not support mapping to guest or CPU access
> > without DMA_BUF_IOCTL_SYNC.  Then at least the VMM can fail gracefully
> > instead of subtly.
> >
> > BR,
> > -R
>
