Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AE03B9A8C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 03:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AFD6EC79;
	Fri,  2 Jul 2021 01:40:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95AEE6EC79
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 01:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=NFqOO
 gC2TpUHPNiBTgBnyCWVqf6zzZelwM0t3zf8bJw=; b=XCcq4MQQr1SAi4bGjDyDi
 Js2Vzv9w54HWP5sfgIPPhjWqcqgWIGm2t+dzzzEUfZ+N5+AMbkR6XuP8qj/foKeg
 v6vwU18KBGWu7JW0tkYPBIQq3v5fE+EfqiPmD8dA/Bu88OLIMlT1iDI1SNKds12h
 L06FYu59SktELhjcgB4/rw=
Received: from localhost (unknown [218.17.89.111])
 by smtp9 (Coremail) with SMTP id DcCowACHaOaHbt5ghYmbJA--.16524S2;
 Fri, 02 Jul 2021 09:40:25 +0800 (CST)
Date: Fri, 2 Jul 2021 09:40:23 +0800
From: Chunyou Tang <tangchunyou@163.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2] drm/panfrost:report the full raw fault information
 instead
Message-ID: <20210702094023.00006ba3@163.com>
In-Reply-To: <3fe0e553-ac73-0d97-4404-c597fd4993a0@arm.com>
References: <20210617062054.1864-1-tangchunyou@163.com>
 <2dcbb36a-b550-4c9d-cff8-73ca4b5abb11@arm.com>
 <20210619111852.00003e52@163.com>
 <23f675e9-698d-840d-104f-33aa594dcb96@arm.com>
 <20210622094000.00004f7e@163.com>
 <04bc1306-f8a3-2e3c-b55d-030d1448fad2@arm.com>
 <20210625174937.0000183f@163.com>
 <14b2a3c8-4bc2-c8f9-627b-9ac5840cad11@arm.com>
 <20210629110453.00007ace@163.com>
 <3fe0e553-ac73-0d97-4404-c597fd4993a0@arm.com>
Organization: icube
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.16.6; i586-pc-mingw32msvc)
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowACHaOaHbt5ghYmbJA--.16524S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw17tw4DuF4kJFWrGw15urg_yoW5GF1kpF
 W5JrW2yr4qqFyjvw1rJw4Du345tan8Jr45Gr95Gr1jqrn8J348Xr17JrZ8CFy8CryrK345
 tr1YyrZxZF1qvrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jNa9-UUUUU=
X-Originating-IP: [218.17.89.111]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbipRrCUVUMfGGJJQABsF
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 ChunyouTang <tangchunyou@icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steve,
> You didn't answer my previous question:
> 
> > Is this device working with the kbase/DDK proprietary driver?

I don't know whether I used kbase/DDK,I only know I used the driver of
panfrost in linux 5.11.

> What you are describing sounds like a hardware integration issue, so
> it would be good to check that the hardware is working with the
> proprietary driver to rule that out. And perhaps there is something
> in the kbase for this device that is setting a chicken bit to 'fix'
> the coherency?

I don't have the proprietary driver,I only used driver in linux 5.11.

Thinks very much!

Chunyou.


ÓÚ Thu, 1 Jul 2021 11:15:14 +0100
Steven Price <steven.price@arm.com> Ð´µÀ:

> On 29/06/2021 04:04, Chunyou Tang wrote:


> > Hi Steve,
> > 	thinks for your reply.
> > 	I set the pte in arm_lpae_prot_to_pte(),
> > ***********************************************************************
> > 	/*
> > 	 * Also Mali has its own notions of shareability wherein its
> > Inner
> > 	 * domain covers the cores within the GPU, and its Outer
> > domain is
> > 	 * "outside the GPU" (i.e. either the Inner or System
> > domain in CPU
> > 	 * terms, depending on coherency).
> > 	 */
> > 	if (prot & IOMMU_CACHE && data->iop.fmt != ARM_MALI_LPAE)
> > 		pte |= ARM_LPAE_PTE_SH_IS;
> > 	else
> > 		pte |= ARM_LPAE_PTE_SH_OS;
> > ***********************************************************************
> > I set pte |= ARM_LPAE_PTE_SH_NS.
> > 
> > 	If I set pte to ARM_LPAE_PTE_SH_OS or
> > 	ARM_LPAE_PTE_SH_IS,whether I use singel core GPU or multi
> > core GPU,it will occur GPU Fault.
> > 	if I set pte to ARM_LPAE_PTE_SH_NS,whether I use singel core
> > 	GPU or multi core GPU,it will not occur GPU Fault.
> 
> Hi,
> 
> So this is a difference between Panfrost and kbase. Panfrost (well
> technically the IOMMU framework) enables the inner-shareable bit for
> all memory, whereas kbase only enables it for some memory types (the
> BASE_MEM_COHERENT_LOCAL flag in the UABI controls it). However this
> should only be a performance/power difference (and AFAIK probably an
> irrelevant one) and it's definitely required that "inner shareable"
> (i.e. within the GPU) works for communication between the different
> units of the GPU.
> 
> You didn't answer my previous question:
> 
> > Is this device working with the kbase/DDK proprietary driver?
> 
> What you are describing sounds like a hardware integration issue, so
> it would be good to check that the hardware is working with the
> proprietary driver to rule that out. And perhaps there is something
> in the kbase for this device that is setting a chicken bit to 'fix'
> the coherency?
> 
> Steve


