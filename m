Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BC83E578E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 11:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8212E89F24;
	Tue, 10 Aug 2021 09:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586BD89F24
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 09:54:46 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628589286; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=60vq8IZG6c8Gs1cuSWU7oo0+DBbyu3c+ZH4aBblmawM=;
 b=E0amdOA/2bwWDp4+FrVanJQTDe8GNKUBWu5+JdV3pw05vPr1xBqz6o3PX+5TxJ8T1Pgx94/q
 eLlV7Zg9GgcKjgcrw8SQXo9wRUUfAggEUyP+CZ49ZvHjMAAyBdsJjDU9AzigluTCoTFOjfOh
 RRVlCdNhSZkAvJoxL4h8uJSEk84=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61124ce37ee604097765fbce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 09:54:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 00FF6C43217; Tue, 10 Aug 2021 09:54:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 05E71C4338A;
 Tue, 10 Aug 2021 09:54:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 10 Aug 2021 15:24:41 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, "Isaac J. Manjarres"
 <isaacm@codeaurora.org>, freedreno <freedreno@lists.freedesktop.org>, Jordan
 Crouse <jcrouse@codeaurora.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Akhil P Oommen
 <akhilpo@codeaurora.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, "list@263.net:IOMMU
 DRIVERS , Joerg Roedel <joro@8bytes.org>,"
 <iommu@lists.linux-foundation.org>, Kristian H Kristensen
 <hoegsberg@google.com>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul
 <sean@poorly.run>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [Freedreno] [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters
 to use system cache
In-Reply-To: <20210810091619.GA2494@willie-the-truck>
References: <20210802105544.GA27657@willie-the-truck>
 <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
 <20210802151409.GE28735@willie-the-truck>
 <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
 <20210809145651.GC1458@willie-the-truck>
 <CAF6AEGsSUojA=V0n2iRWTCn++buqN=Eoxo0r3=+=PBu1O=H-AQ@mail.gmail.com>
 <20210809170508.GB1589@willie-the-truck>
 <CAF6AEGtmZ3LzAJdtnKDQDbEN-a6_JgdN-fZ96pkU3dZqkiW91g@mail.gmail.com>
 <20210809174022.GA1840@willie-the-truck>
 <76bfd0b4248148dfbf9d174ddcb4c2a2@codeaurora.org>
 <20210810091619.GA2494@willie-the-truck>
Message-ID: <5b6953c5afdf566c248a2da59f91d9de@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-08-10 14:46, Will Deacon wrote:
> On Mon, Aug 09, 2021 at 11:17:40PM +0530, Sai Prakash Ranjan wrote:
>> On 2021-08-09 23:10, Will Deacon wrote:
>> > On Mon, Aug 09, 2021 at 10:18:21AM -0700, Rob Clark wrote:
>> > > On Mon, Aug 9, 2021 at 10:05 AM Will Deacon <will@kernel.org> wrote:
>> > > > On Mon, Aug 09, 2021 at 09:57:08AM -0700, Rob Clark wrote:
>> > > > > But I suppose we could call it instead IOMMU_QCOM_LLC or something
>> > > > > like that to make it more clear that it is not necessarily something
>> > > > > that would work with a different outer level cache implementation?
>> > > >
>> > > > ... or we could just deal with the problem so that other people can reuse
>> > > > the code. I haven't really understood the reluctance to solve this properly.
>> > > >
>> > > > Am I missing some reason this isn't solvable?
>> > >
>> > > Oh, was there another way to solve it (other than foregoing setting
>> > > INC_OCACHE in the pgtables)?  Maybe I misunderstood, is there a
>> > > corresponding setting on the MMU pgtables side of things?
>> >
>> > Right -- we just need to program the CPU's MMU with the matching memory
>> > attributes! It's a bit more fiddly if you're just using ioremap_wc()
>> > though, as it's usually the DMA API which handles the attributes under
>> > the
>> > hood.
>> >
>> > Anyway, sorry, I should've said that explicitly earlier on. We've done
>> > this
>> > sort of thing in the Android tree so I assumed Sai knew what needed to
>> > be
>> > done and then I didn't think to explain to you :(
>> >
>> 
>> Right I was aware of that but even in the android tree there is no 
>> user :)
> 
> I'm assuming there are vendor modules using it there, otherwise we 
> wouldn't
> have been asked to put it in. Since you work at Qualcomm, maybe you 
> could
> talk to your colleagues (Isaac and Patrick) directly?
> 

Right I will check with them regarding the vendor modules in android.

>> I think we can't have a new memory type without any user right in 
>> upstream
>> like android tree?
> 
> Correct. But I don't think we should be adding IOMMU_* anything 
> upstream
> if we don't have a user.
> 

Agreed, once we have the fix for GPU crash I can continue further on 
using
this properly.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
