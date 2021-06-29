Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E03FD3B6CCB
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 05:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957C289E5B;
	Tue, 29 Jun 2021 03:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by gabe.freedesktop.org (Postfix) with ESMTP id A32E389E5B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 03:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=fxs95
 fsRxbbzZ9O38J6xNn5rE/Dj0y+AvP6ESQxVwLk=; b=PEU7wmwyhL7nmnyZLNijU
 Z6h/yHGimWaex2aaIeKOOjMdhLpnZREvONzBFfnUHr1PN5neXC2PyImjeJtjVr4N
 1RNeRzS0TtUddv0rt4CHc4XMH4t+TzuAsSJr9trj5u/rCGYfPJMdqT7TOgP1EgtB
 z1bdTjYrtpXBaAC7btJnF8=
Received: from localhost (unknown [218.17.89.111])
 by smtp8 (Coremail) with SMTP id DMCowAD3vzvBjtpgGvRNMQ--.338S2;
 Tue, 29 Jun 2021 11:08:50 +0800 (CST)
Date: Tue, 29 Jun 2021 11:08:49 +0800
From: Chunyou Tang <tangchunyou@163.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] drm/panfrost:report the full raw fault information
 instead
Message-ID: <20210629110849.0000781f@163.com>
In-Reply-To: <ebd984f1-19bd-4943-cbe6-2541aaa64946@arm.com>
References: <20210617062054.1864-1-tangchunyou@163.com>
 <2dcbb36a-b550-4c9d-cff8-73ca4b5abb11@arm.com>
 <20210619111852.00003e52@163.com>
 <23f675e9-698d-840d-104f-33aa594dcb96@arm.com>
 <20210622094000.00004f7e@163.com>
 <04bc1306-f8a3-2e3c-b55d-030d1448fad2@arm.com>
 <20210625174937.0000183f@163.com>
 <14b2a3c8-4bc2-c8f9-627b-9ac5840cad11@arm.com>
 <ebd984f1-19bd-4943-cbe6-2541aaa64946@arm.com>
Organization: icube
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.16.6; i586-pc-mingw32msvc)
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMCowAD3vzvBjtpgGvRNMQ--.338S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3AF43ZFykZw18Gw48Jr17GFg_yoWfJw1Upr
 yUJa1Ykr4ktr1Utw1jvw1UGryYyr1UJry8WF1DGr15tFnFvF1UJr48tryUCa4kXr1UCa1j
 yr1UJ3yxZ3WUZw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07ju89NUUUUU=
X-Originating-IP: [218.17.89.111]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiZQPAUV8ZPcwOHQAAsT
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
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 alyssa.rosenzweig@collabora.com, ChunyouTang <tangchunyou@icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Robin,
	thinks for you reply.
	I had send more detal to Steve in another mail,thinks for your
	messages.

于 Mon, 28 Jun 2021 15:17:51 +0100
Robin Murphy <robin.murphy@arm.com> 写道:

> On 2021-06-28 11:48, Steven Price wrote:
> > On 25/06/2021 10:49, Chunyou Tang wrote:
> >> Hi Steve,
> >> 	Thinks for your reply.
> >> 	When I only set the pte |= ARM_LPAE_PTE_SH_NS;there have
> >> no "GPU Fault",When I set the pte |= ARM_LPAE_PTE_SH_IS(or
> >> ARM_LPAE_PTE_SH_OS);there have "GPU Fault".I don't know how the pte
> >> effect this issue?
> >> 	Can you give me some suggestions again?
> >>
> >> Thinks.
> >>
> >> Chunyou
> > 
> > Hi Chunyou,
> > 
> > You haven't given me much context so I'm not entirely sure which
> > PTE you are talking about (GPU or CPU), or indeed where you are
> > changing the PTE values.
> > 
> > The PTEs control whether a page is shareable or not, the GPU
> > requires that accesses are consistent (i.e. either all accesses to
> > a page are shareable or all are non-shareable) and will race a
> > fault if it detects this isn't the case. Mali also has a quirk for
> > its version of 'LPAE' where inner shareable actually means only
> > within the GPU and outer shareable means outside the GPU (which I
> > think usually means Inner Shareable on the external bus).
> 
> Furthermore, the way the io-pgtable code works for ARM_MALI_LPAE
> format means that *all* GPU mappings are unconditionally
> outer-shareable, so it's not clear how the GPU could observe a
> mismatch in the first place (other than major integration issues
> causing data corruption).
> 
> Robin.
> 
> > 
> > Steve
> > 
> >> 于 Thu, 24 Jun 2021 14:22:04 +0100
> >> Steven Price <steven.price@arm.com> 写道:
> >>
> >>> On 22/06/2021 02:40, Chunyou Tang wrote:
> >>>> Hi Steve,
> >>>> 	I will send a new patch with suitable subject/commit
> >>>> message. But I send a V3 or a new patch?
> >>>
> >>> Send a V3 - it is a new version of this patch.
> >>>
> >>>> 	I met a bug about the GPU,I have no idea about how to fix
> >>>> it, If you can give me some suggestion,it is perfect.
> >>>>
> >>>> You can see such kernel log:
> >>>>
> >>>> Jun 20 10:20:13 icube kernel: [  774.566760] mvp_gpu
> >>>> 0000:05:00.0: GPU Fault 0x00000088 (SHAREABILITY_FAULT) at
> >>>> 0x000000000310fd00 Jun 20 10:20:13 icube kernel: [  774.566764]
> >>>> mvp_gpu 0000:05:00.0: There were multiple GPU faults - some have
> >>>> not been reported Jun 20 10:20:13 icube kernel: [  774.667542]
> >>>> mvp_gpu 0000:05:00.0: AS_ACTIVE bit stuck Jun 20 10:20:13 icube
> >>>> kernel: [  774.767900] mvp_gpu 0000:05:00.0: AS_ACTIVE bit stuck
> >>>> Jun 20 10:20:13 icube kernel: [  774.868546] mvp_gpu
> >>>> 0000:05:00.0: AS_ACTIVE bit stuck Jun 20 10:20:13 icube kernel:
> >>>> [  774.968910] mvp_gpu 0000:05:00.0: AS_ACTIVE bit stuck Jun 20
> >>>> 10:20:13 icube kernel: [  775.069251] mvp_gpu 0000:05:00.0:
> >>>> AS_ACTIVE bit stuck Jun 20 10:20:22 icube kernel: [  783.693971]
> >>>> mvp_gpu 0000:05:00.0: gpu sched timeout, js=1, config=0x7300,
> >>>> status=0x8, head=0x362c900, tail=0x362c100,
> >>>> sched_job=000000003252fb84
> >>>>
> >>>> In
> >>>> https://lore.kernel.org/dri-devel/20200510165538.19720-1-peron.clem@gmail.com/
> >>>> there had a same bug like mine,and I found you at the mail list,I
> >>>> don't know how it fixed?
> >>>
> >>> The GPU_SHAREABILITY_FAULT error means that a cache line has been
> >>> accessed both as shareable and non-shareable and therefore
> >>> coherency cannot be guaranteed. Although the "multiple GPU
> >>> faults" means that this may not be the underlying cause.
> >>>
> >>> The fact that your dmesg log has PCI style identifiers
> >>> ("0000:05:00.0") suggests this is an unusual platform - I've not
> >>> previously been aware of a Mali device behind PCI. Is this device
> >>> working with the kbase/DDK proprietary driver? It would be worth
> >>> looking at the kbase kernel code for the platform to see if there
> >>> is anything special done for the platform.
> >>>
> >>>  From the dmesg logs all I can really tell is that the GPU seems
> >>> unhappy about the memory system.
> >>>
> >>> Steve
> >>>
> >>>> I need your help!
> >>>>
> >>>> thinks very much!
> >>>>
> >>>> Chunyou
> >>>>
> >>>> 于 Mon, 21 Jun 2021 11:45:20 +0100
> >>>> Steven Price <steven.price@arm.com> 写道:
> >>>>
> >>>>> On 19/06/2021 04:18, Chunyou Tang wrote:
> >>>>>> Hi Steve,
> >>>>>> 	1,Now I know how to write the subject
> >>>>>> 	2,the low 8 bits is the exception type in spec.
> >>>>>>
> >>>>>> and you can see prnfrost_exception_name()
> >>>>>>
> >>>>>> switch (exception_code) {
> >>>>>>                  /* Non-Fault Status code */
> >>>>>> case 0x00: return "NOT_STARTED/IDLE/OK";
> >>>>>> case 0x01: return "DONE";
> >>>>>> case 0x02: return "INTERRUPTED";
> >>>>>> case 0x03: return "STOPPED";
> >>>>>> case 0x04: return "TERMINATED";
> >>>>>> case 0x08: return "ACTIVE";
> >>>>>> ........
> >>>>>> ........
> >>>>>> case 0xD8: return "ACCESS_FLAG";
> >>>>>> case 0xD9 ... 0xDF: return "ACCESS_FLAG";
> >>>>>> case 0xE0 ... 0xE7: return "ADDRESS_SIZE_FAULT";
> >>>>>> case 0xE8 ... 0xEF: return "MEMORY_ATTRIBUTES_FAULT";
> >>>>>> }
> >>>>>> return "UNKNOWN";
> >>>>>> }
> >>>>>>
> >>>>>> the exception_code in case is only 8 bits,so if fault_status
> >>>>>> in panfrost_gpu_irq_handler() don't & 0xFF,it can't get correct
> >>>>>> exception reason,it will be always UNKNOWN.
> >>>>>
> >>>>> Yes, I'm happy with the change - I just need a patch that I can
> >>>>> apply. At the moment this patch only changes the first '0x%08x'
> >>>>> output rather than the call to panfrost_exception_name() as
> >>>>> well. So we just need a patch which does:
> >>>>>
> >>>>> - fault_status & 0xFF, panfrost_exception_name(pfdev,
> >>>>> fault_status),
> >>>>> + fault_status, panfrost_exception_name(pfdev, fault_status &
> >>>>> 0xFF),
> >>>>>
> >>>>> along with a suitable subject/commit message describing the
> >>>>> change. If you can send me that I can apply it.
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>> Steve
> >>>>>
> >>>>> PS. Sorry for going round in circles here - I'm trying to help
> >>>>> you get setup so you'll be able to contribute patches easily in
> >>>>> future. An important part of that is ensuring you can send a
> >>>>> properly formatted patch to the list.
> >>>>>
> >>>>> PPS. I'm still not receiving your emails directly. I don't think
> >>>>> it's a problem at my end because I'm receiving other emails, but
> >>>>> if you can somehow fix the problem you're likely to receive a
> >>>>> faster response.
> >>>>>
> >>>>>> 于 Fri, 18 Jun 2021 13:43:24 +0100
> >>>>>> Steven Price <steven.price@arm.com> 写道:
> >>>>>>
> >>>>>>> On 17/06/2021 07:20, ChunyouTang wrote:
> >>>>>>>> From: ChunyouTang <tangchunyou@icubecorp.cn>
> >>>>>>>>
> >>>>>>>> of the low 8 bits.
> >>>>>>>
> >>>>>>> Please don't split the subject like this. The first line of
> >>>>>>> the commit should be a (very short) summary of the patch.
> >>>>>>> Then a blank line and then a longer description of what the
> >>>>>>> purpose of the patch is and why it's needed.
> >>>>>>>
> >>>>>>> Also you previously had this as part of a series (the first
> >>>>>>> part adding the "& 0xFF" in the panfrost_exception_name()
> >>>>>>> call). I'm not sure we need two patches for the single line,
> >>>>>>> but as it stands this patch doesn't apply.
> >>>>>>>
> >>>>>>> Also I'm still not receiving any emails from you directly
> >>>>>>> (only via the list), so it's possible I might have missed
> >>>>>>> something you sent.
> >>>>>>>
> >>>>>>> Steve
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Signed-off-by: ChunyouTang <tangchunyou@icubecorp.cn>
> >>>>>>>> ---
> >>>>>>>>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
> >>>>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>>
> >>>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> >>>>>>>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c index
> >>>>>>>> 1fffb6a0b24f..d2d287bbf4e7 100644 ---
> >>>>>>>> a/drivers/gpu/drm/panfrost/panfrost_gpu.c +++
> >>>>>>>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c @@ -33,7 +33,7 @@
> >>>>>>>> static irqreturn_t panfrost_gpu_irq_handler(int irq, void
> >>>>>>>> *data) address |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO);
> >>>>>>>>   		dev_warn(pfdev->dev, "GPU Fault 0x%08x
> >>>>>>>> (%s) at 0x%016llx\n",
> >>>>>>>> -			 fault_status & 0xFF,
> >>>>>>>> panfrost_exception_name(pfdev, fault_status & 0xFF),
> >>>>>>>> +			 fault_status,
> >>>>>>>> panfrost_exception_name(pfdev, fault_status & 0xFF),
> >>>>>>>> address); 
> >>>>>>>>   		if (state & GPU_IRQ_MULTIPLE_FAULT)
> >>>>>>>>
> >>>>>>
> >>>>>>
> >>>>
> >>>>
> >>
> >>
> > 


