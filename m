Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 256AA3B7FCD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 11:17:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046576E974;
	Wed, 30 Jun 2021 09:17:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0009F6E974
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 09:17:51 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id v7so1659240pgl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 02:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SGxHKBuGZkCU1I+kyNcTwBrZAXyCdyYBNGIIT95dpcY=;
 b=PitW6imfDn0IzY3RG7JEiKUR+7Nsn4w2y1bEvPgW/HS2AbzJNtJNRONqnYjnNN01RO
 f4Cy3TS0FXR+ruq1aYhiZGEJMhWbD1l8vF9wU2uLP3NYm94onDiG0L+Sdwsda2NHyvii
 j6adVFIua9Ybkbk/RCb14aonwq2ISknAbeRG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SGxHKBuGZkCU1I+kyNcTwBrZAXyCdyYBNGIIT95dpcY=;
 b=c2xdddtFGq+7dDZQS5UtqMK1FVvYMr/ebZ/jW7/sArJbNhnWaTGoOIKu/jcYGOP/da
 u0yzYi7UmaB2mB+FCRs/sBNhMy7ToRWfy4NoAyyxp1YKJYuyLAtY9aDE4dOAEQjLZ/Zy
 e2mURRzRrPi/IQaD2jqQhDhopyZlVK7IQYCC4m/FPQF/AtlwiuiQ3w44w6GWtLTO2sEe
 Du/mXoqn4DSkiBHA2Dp4yjhIAee1Oy+IugihvghAvetmg5UbkHbdG6de6sOXFxHp022W
 QFoj4Y0ZDa6xK9WAP3h41yafURb5+a+ZuHdRjN/zS4LcaVwkZNhsUgQMkzZArTzknDKM
 WnQg==
X-Gm-Message-State: AOAM533J6E3LuCUX2Zc1ZafEarOm2RNy0nnvYiAfv3FG70Im8tXV+JUj
 G+6d8LH5QwjgY+h3oW5i79AWikwzTQ898Q==
X-Google-Smtp-Source: ABdhPJwjBFAEvKQJOxHfJ1W0Gs5X7chPFUtl0gyuS5llc6Yq9LUA9ULrLVVc8kqPWg/Q3xVDMExKCw==
X-Received: by 2002:a63:514c:: with SMTP id r12mr3100971pgl.70.1625044671325; 
 Wed, 30 Jun 2021 02:17:51 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com.
 [209.85.215.177])
 by smtp.gmail.com with ESMTPSA id i6sm24129521pgg.50.2021.06.30.02.17.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 02:17:50 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id a2so1634174pgi.6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 02:17:49 -0700 (PDT)
X-Received: by 2002:a6b:e013:: with SMTP id z19mr7163972iog.34.1625044658498; 
 Wed, 30 Jun 2021 02:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-7-tientzu@chromium.org>
 <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
In-Reply-To: <YNvMDFWKXSm4LRfZ@Ryzen-9-3900X.localdomain>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 30 Jun 2021 17:17:27 +0800
X-Gmail-Original-Message-ID: <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
Message-ID: <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 30, 2021 at 9:43 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Thu, Jun 24, 2021 at 11:55:20PM +0800, Claire Chang wrote:
> > Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
> > use it to determine whether to bounce the data or not. This will be
> > useful later to allow for different pools.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> > Tested-by: Will Deacon <will@kernel.org>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>
> This patch as commit af452ec1b1a3 ("swiotlb: Use is_swiotlb_force_bounce
> for swiotlb data bouncing") causes my Ryzen 3 4300G system to fail to
> get to an X session consistently (although not every single time),
> presumably due to a crash in the AMDGPU driver that I see in dmesg.
>
> I have attached logs at af452ec1b1a3 and f127c9556a8e and I am happy
> to provide any further information, debug, or test patches as necessary.

Are you using swiotlb=force? or the swiotlb_map is called because of
!dma_capable? (https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/kernel/dma/direct.h#n93)

`BUG: unable to handle page fault for address: 00000000003a8290` and
the fact it crashed at `_raw_spin_lock_irqsave` look like the memory
(maybe dev->dma_io_tlb_mem) was corrupted?
The dev->dma_io_tlb_mem should be set here
(https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pci/probe.c#n2528)
through device_initialize.

I can't tell what happened from the logs, but maybe we could try KASAN
to see if it provides more clue.

Thanks,
Claire

>
> Cheers,
> Nathan
