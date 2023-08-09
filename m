Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9D877714E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD92D10E4CD;
	Thu, 10 Aug 2023 07:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F169710E44F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 15:04:59 +0000 (UTC)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-586df08bba0so39242247b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Aug 2023 08:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691593499; x=1692198299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUNHA5k0oc4UJ3HPv3ruu/iAAkeeULdAZcTUmh4s50w=;
 b=cmUWaPIpgABWq6VhUwPcsQcIqckeGYwWCLHIzh5SmxxbhhwMNyabD5AclGPeSIGVeo
 VCv9i7pvL24DbcuKO4E0QcbZUCbZeKKoclw3CTwYtNZiHPTrLahEgvYyOPF71bWryO+X
 6d3G2ZHh11Eqn7D9jOKgyfpS/vqgITvWge1EKdRUvmWOxHD9Uz+J4AZu1Z7JzoTrDAxx
 WcTfzxLA3xKZJo6/uqFlRbNg3cjcKoLA8ewR92yRqvZ4P0scq0vdk8hsrYC7QXiTy6t9
 o4H30LSpSif7NeTq/cvVU5YDRHtLc4BGw9iF3+iCFAbfvR33CqyyahnTZ8qTAOIcy6vZ
 ieng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691593499; x=1692198299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUNHA5k0oc4UJ3HPv3ruu/iAAkeeULdAZcTUmh4s50w=;
 b=BkFfu0MN+3mJnxueoeYs8CoVDwbZQZqrsmP0XY00mGOUx2CbtAt6RBw++rM4wyBbQu
 Kr6exSWn4p82/lL41GpeLx6jxlLwhbQLCCFHPCjlDVgYo315T9wdNBABHxOj6tbJnzXw
 +0pn3AfGLiinucbVb+c4hVrXJcNmufklmkf4+WxPQEGGtlXHrsUBBCCYsvAH/S9aUHxU
 bO25jJPoZ2xfq+kkHMloNXiailN5BcCPZDugDlN3ebfh17qJVzOWsmq1Kp5dt0zeaZQ2
 7wG8brv3EV1Vwg64gKhGBAazftGxIKisoPJPXN2uQ0VApaCwR1nwy4sG3U488SW7CK3S
 32qA==
X-Gm-Message-State: AOJu0Yx2kZlNch6Ik3OqL6q2lWwkZ7TQ/+e+KmsHB06ODGHoheudaZPI
 qKPjPZdQSPmv6K/BpIDvSMiH7hXsWP7dqJI1/IA=
X-Google-Smtp-Source: AGHT+IGth0evnpBrLoCbQ/NjZeXG4/FKNjvMlrH8Pg4TU4y/1LSVl+3ahRRiojLkI+Z8Rb+JOAS+jkie9I21KObZ3x8=
X-Received: by 2002:a81:a107:0:b0:583:9018:29ec with SMTP id
 y7-20020a81a107000000b00583901829ecmr2934644ywg.32.1691593498807; Wed, 09 Aug
 2023 08:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <1690598115-26287-1-git-send-email-quic_pintu@quicinc.com>
 <20230731112155.GA3662@lst.de>
 <CAOuPNLjnfq1JefngtNrg0Q+JdMTSRz+eEqxGQJFfx9+af+k9WA@mail.gmail.com>
 <20230801171838.GA14599@lst.de>
 <CANDhNCq+3OEosUcQJ5GFgk+5OyG+JqXKM43UAo0aPz-V27OgAA@mail.gmail.com>
 <20230802094725.GA28241@lst.de>
 <CAOuPNLjAOk0BOXDcjbY+evX_uxbZyptrJXMf0ULhReECzEX0CQ@mail.gmail.com>
In-Reply-To: <CAOuPNLjAOk0BOXDcjbY+evX_uxbZyptrJXMf0ULhReECzEX0CQ@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 9 Aug 2023 20:34:47 +0530
Message-ID: <CAOuPNLjn3b3YSgy=ObnF+cE7kj-9vdZ+6fFzMp-bJYLFq3MgWw@mail.gmail.com>
Subject: Re: [PATCH v2] dma-contiguous: define proper name for global cma
 region
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 10 Aug 2023 07:25:03 +0000
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
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, iommu@lists.linux.dev,
 John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
 Pintu Kumar <quic_pintu@quicinc.com>, akpm@linux-foundation.org,
 Laura Abbott <labbott@redhat.com>, robin.murphy@arm.com,
 Sumit Semwal <sumit.semwal@linaro.org>, m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, 3 Aug 2023 at 23:04, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> Hi,
>
> On Wed, 2 Aug 2023 at 15:17, Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Tue, Aug 01, 2023 at 10:39:04PM -0700, John Stultz wrote:
> > > So, forgive me, I've not had a chance to look into this, but my
> > > recollection was "reserved" is the name we see on x86, but other name=
s
> > > are possibly provided via the dts node?
> >
> No, I think "reserved" is the name hard-coded (for all arch) in Kernel
> for global-cma.
> So, I don't think this is x86 specific. I am checking on arm32 itself.
> When we can dma_alloc_coherent we see these in the logs (if dts region
> is not present).
> cma: cma_alloc(cma (ptrval), name: reserved, count 64, align 6)
> Now, with this change we will see this:
> cma: cma_alloc(cma (ptrval), name: global-cma-region, count 64, align 6)
>
> > Indeed, dma_contiguous_default_area can also be set through
> > rmem_cma_setup, which then takes the name from DT.
> >
> I think this is a different case. If DT entry is present we get this:
> Reserved memory: created CMA memory pool at 0x98000000, name: name:
> linux,cma, size 128 MiB
> cma: cma_alloc(cma (ptrval), name: linux,cma, count 64, align 6)
>
> Here we are talking about the default hard-coded name in Kernel code
> if DT is not defined.
> So, in one of the boards, this DT entry was not present and it shows
> as "reserved".
>
> > > I believe on the hikey board its "linux,cma" is the name, so forcing
> > > it to reserved would break that.
> > >
> Yes, everywhere in the DT it's defined as "linux,cma".
> You mean this also should be changed to "linux,cma-global-region"
> everywhere with this change ?
>
> > > Maybe instead add a compat config option to force the cma name (so x8=
6
> > > can set it to "default" if needed)?
> >
> Yes, having it in config is also a good option instead of hard-coding in =
Kernel.
> >
> > I think we'll just need to leave it as-is.  I with dma-heaps had never
> > exposed the name to userspace, but we'll have to l=D1=96ve with it now.
>
> Can you point me to the userspace utility we are talking about here ?
> I think we should not worry much about userspace name exposure.
> I guess it should fetch whatever is declared in Kernel or DTS, right ?

Just to follow-up on this.
For now, can we change the Kernel hard-coded value from "reserved" to
"global-cma-region" ?
Later, for the DTS defined name let it be "linux,cma" or change that
also to "linux,global-cma-region" ?

Will this make sense ?
