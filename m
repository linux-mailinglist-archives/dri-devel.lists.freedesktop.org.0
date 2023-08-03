Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6479C76FAE8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 09:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6602B10E687;
	Fri,  4 Aug 2023 07:17:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 106E810E64E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 17:34:15 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id
 ada2fe7eead31-4475d891d0eso837639137.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 10:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691084054; x=1691688854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s8Xa9pYsN9q26Cy2OfWksmVuBviyVuvzRMdasYi4RPE=;
 b=ieYA6bVxf1lbXkgHAn+hXhVfxzKe711nmI2r+8a2Pkje45GQmKLftZmaLt0qar82gg
 SFBl/K1845mX6+FAqPkGcjyrpBXYikncS74nQOppvoyKSHXe0rCclfsEAXrPauDBdjLV
 e25KI/Uu6/whFSVJCUzOwGJkV3uYaP9OmOzDMNjjkk1ts8gnSQW1ex6gNo+0kzwO65XL
 HyypX83EJT7/21befwOJ9uRlgd3lhXqtj1LN6iNBdvKWKSCrS9QQZFXiZGxHkCMMLy82
 +seRRUC93Y1mRKPJn8r746QD8Gi1bfCC2+B+iopA0nXA09o5X8xylmqFAP/A/rLnnA0P
 /oIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691084054; x=1691688854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s8Xa9pYsN9q26Cy2OfWksmVuBviyVuvzRMdasYi4RPE=;
 b=TdN8g3FjZSHGJCPm3iLodeffvv00VGAQl+lrnpRSOc2adjPDW5rcuE5YmxYOvs6h5G
 Vk9E7sWaRAfqFATpaFPhLK4gDyyjfzIjcSxXdgPQbIuTrGvv+E92UhivXqY7b6HMeGVr
 1cRpxMzCq4eWiVOHXQ9TCfIPjn6esn0GjDRrghB5hzzgxfpaOcWhiHCDE8YB8Y5yCBN9
 pOQsz0yKXrKmj1/hMg6NfAZ2RJou50O6HOKziFtEOWbvSZzFYrogiOJB71oR2DImOU50
 QaNHN1tgLYDgCTWsRxgK+jkyT8RCJIw2V949pSikrAaK6UIeVRVSs1pGBFT1BItjuWea
 eH+w==
X-Gm-Message-State: ABy/qLYsaW63rnKkTMT/gAF9G6GQB917zw64IW6/A4t58HKwUCvSnoUp
 cJIhV6lW9MyidpzWlqOlJc20j+h6TFopo5GKGtU=
X-Google-Smtp-Source: APBJJlG6pjOoG0q6RAsawh+9qeUBUHt8XE1GKbQlIBPYmQFLRffHoU6WGPDLy5lU6fh2CQ1SS4cFWeU/BvylteONzOI=
X-Received: by 2002:a05:6102:d8a:b0:443:5524:8f8b with SMTP id
 d10-20020a0561020d8a00b0044355248f8bmr4828038vst.4.1691084054017; Thu, 03 Aug
 2023 10:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <1690598115-26287-1-git-send-email-quic_pintu@quicinc.com>
 <20230731112155.GA3662@lst.de>
 <CAOuPNLjnfq1JefngtNrg0Q+JdMTSRz+eEqxGQJFfx9+af+k9WA@mail.gmail.com>
 <20230801171838.GA14599@lst.de>
 <CANDhNCq+3OEosUcQJ5GFgk+5OyG+JqXKM43UAo0aPz-V27OgAA@mail.gmail.com>
 <20230802094725.GA28241@lst.de>
In-Reply-To: <20230802094725.GA28241@lst.de>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Thu, 3 Aug 2023 23:04:02 +0530
Message-ID: <CAOuPNLjAOk0BOXDcjbY+evX_uxbZyptrJXMf0ULhReECzEX0CQ@mail.gmail.com>
Subject: Re: [PATCH v2] dma-contiguous: define proper name for global cma
 region
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 04 Aug 2023 07:17:40 +0000
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

On Wed, 2 Aug 2023 at 15:17, Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Aug 01, 2023 at 10:39:04PM -0700, John Stultz wrote:
> > So, forgive me, I've not had a chance to look into this, but my
> > recollection was "reserved" is the name we see on x86, but other names
> > are possibly provided via the dts node?
>
No, I think "reserved" is the name hard-coded (for all arch) in Kernel
for global-cma.
So, I don't think this is x86 specific. I am checking on arm32 itself.
When we can dma_alloc_coherent we see these in the logs (if dts region
is not present).
cma: cma_alloc(cma (ptrval), name: reserved, count 64, align 6)
Now, with this change we will see this:
cma: cma_alloc(cma (ptrval), name: global-cma-region, count 64, align 6)

> Indeed, dma_contiguous_default_area can also be set through
> rmem_cma_setup, which then takes the name from DT.
>
I think this is a different case. If DT entry is present we get this:
Reserved memory: created CMA memory pool at 0x98000000, name: name:
linux,cma, size 128 MiB
cma: cma_alloc(cma (ptrval), name: linux,cma, count 64, align 6)

Here we are talking about the default hard-coded name in Kernel code
if DT is not defined.
So, in one of the boards, this DT entry was not present and it shows
as "reserved".

> > I believe on the hikey board its "linux,cma" is the name, so forcing
> > it to reserved would break that.
> >
Yes, everywhere in the DT it's defined as "linux,cma".
You mean this also should be changed to "linux,cma-global-region"
everywhere with this change ?

> > Maybe instead add a compat config option to force the cma name (so x86
> > can set it to "default" if needed)?
>
Yes, having it in config is also a good option instead of hard-coding in Ke=
rnel.
>
> I think we'll just need to leave it as-is.  I with dma-heaps had never
> exposed the name to userspace, but we'll have to l=D1=96ve with it now.

Can you point me to the userspace utility we are talking about here ?
I think we should not worry much about userspace name exposure.
I guess it should fetch whatever is declared in Kernel or DTS, right ?
