Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D31265CCC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9416E9A3;
	Fri, 11 Sep 2020 09:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4A3F6E92B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 13:34:49 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z13so7046709iom.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 06:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h8Tpj5wYSQjiK+TAJfFO0Tf9jiEY5yGG/m2aEP5Z4pw=;
 b=YqA5PLut0xGMj0S2JsZ1nqoWnAI87qW2iB6rBuyzlNr/i8p2GIELK1QX+lKWUsTwzK
 J2dSARVPeG4IwzzuA8pE1P+5OVAa2eHFRKGaWb7NjIZv2LfVgNFdgO/O5efipKLRnyRj
 59Ivydb0yd96322f4OP7eAyli9gq1bJJqNWwr7UQp7WOJw13CiHGa50UV4LiwaciCZ54
 rPVab7PqDAVXapxusuMo+bEb8iCDOteeaNoCp92DVDajkbd2ofZmMkGtoG3Skprhh9uL
 /U8Q1jK9UaeuY5X3L97dgHkQYmRrGLYCXPbuv3z5NyjgpChQ4n/amkDeY/PGFcsIM7Fy
 bAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h8Tpj5wYSQjiK+TAJfFO0Tf9jiEY5yGG/m2aEP5Z4pw=;
 b=j8f5m0NaPbZ9SgCwcEbuPBFxq5apMDuO2aDJJx4P3g6tWrwjRONYp+jgYTN9tmxaXh
 wqxDrWM3T41toj5sK5CeVrFMhUj+N3x+uGrtaxHMDsX5gc72px/W8CJaSUevpgQTDB3Q
 CO3K6AOfXfGpqwXMbzcoaCnPuvSl+8L7+Ktpet3gAgCwjm4Vm871U/IHFkjZQN4yYaqH
 KVa2Elu5VO5LxSfy6R/SQ6lKKl1k9g5htLw0rPssoKTLJn8yI6WpqtMihbs+LlItwH2S
 fk5nx3YxC56+p+G1QnfraURZ+wLwOWAt1jE7jglegWdk4F8i1hS/JL7IgK910K5gKBdV
 ea5Q==
X-Gm-Message-State: AOAM533f34Ggq2jjl2jAFkht9pbMhU9AVS3mjnmoZH04EC6XARki1OY0
 52/rHzJcIIb3S3XxQS0GMVvV2kqPriHcy5/HKCAAug==
X-Google-Smtp-Source: ABdhPJwu6upi5knKzGwyXFCyYTEZCPzreSot+419n5zt9A65oGcyQgjDJ6G718nc8PHKFashtF6vKw91+qlabsYr8+c=
X-Received: by 2002:a02:b199:: with SMTP id t25mr8370395jah.124.1599744889300; 
 Thu, 10 Sep 2020 06:34:49 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org>
 <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
 <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
 <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
 <766525c3-4da9-6db7-cd90-fb4b82cd8083@deltatee.com>
 <60a82319-cbee-4cd1-0d5e-3c407cc51330@linux.intel.com>
 <e598fb31-ef7a-c2ee-8a54-bf62d50c480c@deltatee.com>
 <b27cae1f-07ff-bef2-f125-a5f0d968016d@linux.intel.com>
 <CALQxJut5c=cWdi+SVkN3JnbkhPSYmLkOyRUhduL-UJ9gyKn9Ow@mail.gmail.com>
 <7106602a-9964-851e-9c4e-d8acf4033b89@linux.intel.com>
 <ea24e077-5aa6-dd8e-69a7-d186b606703f@linux.intel.com>
 <CALQxJus4prs0T6G9Z4bw5BDgwmkaiynBcoknLsYEY45SNZ6Ukg@mail.gmail.com>
In-Reply-To: <CALQxJus4prs0T6G9Z4bw5BDgwmkaiynBcoknLsYEY45SNZ6Ukg@mail.gmail.com>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Thu, 10 Sep 2020 14:34:38 +0100
Message-ID: <CALQxJuuU4vpx=5Dg07epSWws-fshC6PJnrPWu-ir5nadgXspKw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/8] Convert the intel iommu driver to the
 dma-iommu api
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, David Woodhouse <dwmw2@infradead.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Sep 2020 at 14:33, Tom Murphy <murphyt7@tcd.ie> wrote:
>
> On Wed, 9 Sep 2020 at 13:56, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
> >
> >
> > On 09/09/2020 10:16, Tvrtko Ursulin wrote:
> > > On 08/09/2020 23:43, Tom Murphy wrote:
> > >> On Tue, 8 Sep 2020 at 16:56, Tvrtko Ursulin
> > >> <tvrtko.ursulin@linux.intel.com> wrote:
> > >>> On 08/09/2020 16:44, Logan Gunthorpe wrote:
> > >>>> On 2020-09-08 9:28 a.m., Tvrtko Ursulin wrote:
> > >>>>>>
> > >>>>>> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h
> > >>>>>> b/drivers/gpu/drm/i915/i915
> > >>>>>> index b7b59328cb76..9367ac801f0c 100644
> > >>>>>> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> > >>>>>> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> > >>>>>> @@ -27,13 +27,19 @@ static __always_inline struct sgt_iter {
> > >>>>>>     } __sgt_iter(struct scatterlist *sgl, bool dma) {
> > >>>>>>            struct sgt_iter s = { .sgp = sgl };
> > >>>>>>
> > >>>>>> +       if (sgl && !sg_dma_len(s.sgp))
> > >>>>>
> > >>>>> I'd extend the condition to be, just to be safe:
> > >>>>>       if (dma && sgl && !sg_dma_len(s.sgp))
> > >>>>>
> > >>>>
> > >>>> Right, good catch, that's definitely necessary.
> > >>>>
> > >>>>>> +               s.sgp = NULL;
> > >>>>>> +
> > >>>>>>            if (s.sgp) {
> > >>>>>>                    s.max = s.curr = s.sgp->offset;
> > >>>>>> -               s.max += s.sgp->length;
> > >>>>>> -               if (dma)
> > >>>>>> +
> > >>>>>> +               if (dma) {
> > >>>>>> +                       s.max += sg_dma_len(s.sgp);
> > >>>>>>                            s.dma = sg_dma_address(s.sgp);
> > >>>>>> -               else
> > >>>>>> +               } else {
> > >>>>>> +                       s.max += s.sgp->length;
> > >>>>>>                            s.pfn = page_to_pfn(sg_page(s.sgp));
> > >>>>>> +               }
> > >>>>>
> > >>>>> Otherwise has this been tested or alternatively how to test it?
> > >>>>> (How to
> > >>>>> repro the issue.)
> > >>>>
> > >>>> It has not been tested. To test it, you need Tom's patch set without
> > >>>> the
> > >>>> last "DO NOT MERGE" patch:
> > >>>>
> > >>>> https://lkml.kernel.org/lkml/20200907070035.GA25114@infradead.org/T/
> > >>>
> > >>> Tom, do you have a branch somewhere I could pull from? (Just being lazy
> > >>> about downloading a bunch of messages from the archives.)
> > >>
> > >> I don't unfortunately. I'm working locally with poor internet.
> > >>
> > >>>
> > >>> What GPU is in your Lenovo x1 carbon 5th generation and what
> > >>> graphical/desktop setup I need to repro?
> > >>
> > >>
> > >> Is this enough info?:
> > >>
> > >> $ lspci -vnn | grep VGA -A 12
> > >> 00:02.0 VGA compatible controller [0300]: Intel Corporation HD
> > >> Graphics 620 [8086:5916] (rev 02) (prog-if 00 [VGA controller])
> > >>      Subsystem: Lenovo ThinkPad X1 Carbon 5th Gen [17aa:224f]
> > >>      Flags: bus master, fast devsel, latency 0, IRQ 148
> > >>      Memory at eb000000 (64-bit, non-prefetchable) [size=16M]
> > >>      Memory at 60000000 (64-bit, prefetchable) [size=256M]
> > >>      I/O ports at e000 [size=64]
> > >>      [virtual] Expansion ROM at 000c0000 [disabled] [size=128K]
> > >>      Capabilities: [40] Vendor Specific Information: Len=0c <?>
> > >>      Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
> > >>      Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
> > >>      Capabilities: [d0] Power Management version 2
> > >>      Capabilities: [100] Process Address Space ID (PASID)
> > >>      Capabilities: [200] Address Translation Service (ATS)
> > >
> > > Works for a start. What about the steps to repro? Any desktop
> > > environment and it is just visual corruption, no hangs/stalls or such?
> > >
> > > I've submitted a series consisting of what I understood are the patches
> > > needed to repro the issue to our automated CI here:
> > >
> > > https://patchwork.freedesktop.org/series/81489/
> > >
> > > So will see if it will catch something, or more targeted testing will be
> > > required. Hopefully it does trip over in which case I can add the patch
> > > suggested by Logan on top and see if that fixes it. Or I'll need to
> > > write a new test case.
> > >
> > > If you could glance over my series to check I identified the patches
> > > correctly it would be appreciated.
> >
> > Our CI was more than capable at catching the breakage so I've copied you
> > on a patch (https://patchwork.freedesktop.org/series/81497/) which has a
> > good potential to fix this. (Or improve the robustness of our sg walks,
> > depends how you look at it.)
> >
> > Would you be able to test it in your environment by any chance? If it
> > works I understand it unblocks your IOMMU work, right?

And yes this does unblock the iommu work

>
> I tested your latest patch set ([PATCH 1/2] drm/i915: Fix DMA mapped
> scatterlist walks) and it fixes the issue. great work!
>
> >
> > Regards,
> >
> > Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
