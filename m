Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C74776D43
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 02:57:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0026810E13F;
	Thu, 10 Aug 2023 00:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25CF10E13F
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 00:57:33 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5223910acf2so3118a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 17:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691629052; x=1692233852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pENb1t85EdhZr2S/NRQldNOIuogVZkW2tw0vSMoDYS4=;
 b=DcyoSSCwJwp9vWokfe6dcIcLr97RyCLwBKjCbSskay0ACsx3/Izc9hLNsxwGuAVej/
 wB2ynNNpnWSk9rjEmycLvjbxhdjuGCr4gLKPNdtYax8aYtgx0roYCOdnsQxs2XvY8Kyz
 zm4+OHdnDZS1cSMHKnWNLEjHVbE+tLFR1H4cuVpsMI7fqGM3Rm7czFUMk2/pAODSkQ8h
 qpa6v2aLXK8WqWZ0zBc0vDg3ZDBlNkD+nEgNFbauOexdn14Eul3ITgPmwpU+k0aY3DlC
 U695WvJ65wCg4BdHjT1N2bzpnjEz1BPQGdzsN8A21gHFmb8YSwAg7Z0RT6ewZLnRVqRo
 JX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691629052; x=1692233852;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pENb1t85EdhZr2S/NRQldNOIuogVZkW2tw0vSMoDYS4=;
 b=RqMNYQvoT7QB4quFWpbUHYnnIX8b/zsBedqBf9mD2PXOUJ42XD2poG5HKZDdR0Mf3J
 NGGlfr5dHHtYZYbVcZRibhDQ4KkOKOrn9IUOG25Kma4FsPxbv1yqKEdv72c35DuSx5ux
 nreu1BK1WroXVU79dGG88IxTnGFlhkohDhD3bBlmmPf7IfFQahHj2gvJUQsZP4lo9ERS
 dSiR0ON0dLmHY0lyAALWvVhRLosqYjPsSp5uZ2t8C9MR5Of0PDmP3TgyL60bfF37vh/g
 jEms2x0fwCaKCWZltZIgfpOaBv0udH4QvkdIM6B7kg47turEILrBnrZ+OFjXixMygzNY
 enyQ==
X-Gm-Message-State: AOJu0YymDWmJz290TW6C5Uv4y03Rtv5fROMSPoh1xF7TmTDeJ/r2++uJ
 PE4KtF3btKXfSXQ7GsdUqkkO6dVPqZjSjYHufgQf
X-Google-Smtp-Source: AGHT+IGC3Ojhu3H3wyaJnO0AFrfMJr5XHWFXJ1jg2Nd0krAXKutumnTRxviNOopna7nevL3OGuuOsnupTL3vhP1snHY=
X-Received: by 2002:a50:99db:0:b0:522:28a1:2095 with SMTP id
 n27-20020a5099db000000b0052228a12095mr191965edb.3.1691629052118; Wed, 09 Aug
 2023 17:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <1690598115-26287-1-git-send-email-quic_pintu@quicinc.com>
 <20230731112155.GA3662@lst.de>
 <CAOuPNLjnfq1JefngtNrg0Q+JdMTSRz+eEqxGQJFfx9+af+k9WA@mail.gmail.com>
 <20230801171838.GA14599@lst.de>
 <CANDhNCq+3OEosUcQJ5GFgk+5OyG+JqXKM43UAo0aPz-V27OgAA@mail.gmail.com>
 <20230802094725.GA28241@lst.de>
 <CAOuPNLjAOk0BOXDcjbY+evX_uxbZyptrJXMf0ULhReECzEX0CQ@mail.gmail.com>
 <CAOuPNLjn3b3YSgy=ObnF+cE7kj-9vdZ+6fFzMp-bJYLFq3MgWw@mail.gmail.com>
In-Reply-To: <CAOuPNLjn3b3YSgy=ObnF+cE7kj-9vdZ+6fFzMp-bJYLFq3MgWw@mail.gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 9 Aug 2023 17:57:19 -0700
Message-ID: <CANDhNCpJ_di5sjyExPw8itoSOfSoG5syy-t8CmKHzHBSp4qqFQ@mail.gmail.com>
Subject: Re: [PATCH v2] dma-contiguous: define proper name for global cma
 region
To: Pintu Agarwal <pintu.ping@gmail.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 linux-media@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, Liam Mark <lmark@codeaurora.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, iommu@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Pintu Kumar <quic_pintu@quicinc.com>, akpm@linux-foundation.org,
 Laura Abbott <labbott@redhat.com>, robin.murphy@arm.com,
 Christoph Hellwig <hch@lst.de>, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 9, 2023 at 8:04=E2=80=AFAM Pintu Agarwal <pintu.ping@gmail.com>=
 wrote:
>
> Hi,
>
> On Thu, 3 Aug 2023 at 23:04, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> >
> > Hi,
> >
> > On Wed, 2 Aug 2023 at 15:17, Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > On Tue, Aug 01, 2023 at 10:39:04PM -0700, John Stultz wrote:
> > > > So, forgive me, I've not had a chance to look into this, but my
> > > > recollection was "reserved" is the name we see on x86, but other na=
mes
> > > > are possibly provided via the dts node?
> > >
> > No, I think "reserved" is the name hard-coded (for all arch) in Kernel
> > for global-cma.
> > So, I don't think this is x86 specific. I am checking on arm32 itself.
> > When we can dma_alloc_coherent we see these in the logs (if dts region
> > is not present).
> > cma: cma_alloc(cma (ptrval), name: reserved, count 64, align 6)
> > Now, with this change we will see this:
> > cma: cma_alloc(cma (ptrval), name: global-cma-region, count 64, align 6=
)
> >
> > > Indeed, dma_contiguous_default_area can also be set through
> > > rmem_cma_setup, which then takes the name from DT.
> > >
> > I think this is a different case. If DT entry is present we get this:
> > Reserved memory: created CMA memory pool at 0x98000000, name: name:
> > linux,cma, size 128 MiB
> > cma: cma_alloc(cma (ptrval), name: linux,cma, count 64, align 6)
> >
> > Here we are talking about the default hard-coded name in Kernel code
> > if DT is not defined.
> > So, in one of the boards, this DT entry was not present and it shows
> > as "reserved".
> >
> > > > I believe on the hikey board its "linux,cma" is the name, so forcin=
g
> > > > it to reserved would break that.
> > > >
> > Yes, everywhere in the DT it's defined as "linux,cma".
> > You mean this also should be changed to "linux,cma-global-region"
> > everywhere with this change ?
> >
> > > > Maybe instead add a compat config option to force the cma name (so =
x86
> > > > can set it to "default" if needed)?
> > >
> > Yes, having it in config is also a good option instead of hard-coding i=
n Kernel.
> > >
> > > I think we'll just need to leave it as-is.  I with dma-heaps had neve=
r
> > > exposed the name to userspace, but we'll have to l=D1=96ve with it no=
w.
> >
> > Can you point me to the userspace utility we are talking about here ?
> > I think we should not worry much about userspace name exposure.
> > I guess it should fetch whatever is declared in Kernel or DTS, right ?
>
> Just to follow-up on this.
> For now, can we change the Kernel hard-coded value from "reserved" to
> "global-cma-region" ?
> Later, for the DTS defined name let it be "linux,cma" or change that
> also to "linux,global-cma-region" ?
>
> Will this make sense ?

Apologies, sorry for not responding to your earlier message, it slipped by.

So, the concern is there may be allocators (like gralloc in Android)
that allocate from the CMA region via the dma-buf heaps interface.

So by changing the name (either hardcoded or DTS names), you'll change
the user-visible heap name, potentially breaking those userland
allocators.

Now, the dmabuf heaps are designed to be like other dynamic devices
(like disks or partitions), which may be different from device to
device. However, changing the name would still be an inconvenience for
folks who have hard-coded that name in their userland allocator which
was designed for a single device.  This would be similar to the old
issue of an existing fstab breaking from the ide (hda) to sata (sda)
driver transition.  Or similar to what folks went through a while back
with network device names changing from eth0 -> ens0 or whatever.

That said, most android devices historically haven't upreved to new
kernel versions wihtout major userspace changes, so the impact might
be minimal, but that is likely to change in the future so we should be
careful here.

What I'd propose instead is to either leave it alone as Christoph
suggested, or have a build option/boot argument so folks can preserve
the legacy name if they need.

thanks
-john
