Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9F93A7792
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 09:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290266E17E;
	Tue, 15 Jun 2021 07:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by gabe.freedesktop.org (Postfix) with ESMTP id E4B1D6E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 07:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=qGzxM
 niwEnz+TW0B1jfi0/LF61vnODnLw/09tRX/Ndg=; b=AgVy/xw11uqx8qtauj1z+
 9+GcBda6Gf+epCpYRKrU6yoxrzM3m7K1fCLNsvFsvFQvYkE6eB6auXk0zk5yhuPx
 cVRXCvd3656dvci5CbK6KupnoBnEn3tjvLuhsxMwth0HLUpNUnd2GdQI9g3Q1xwn
 xXVVCFqXCzF9qQ6A39MYxY=
Received: from localhost (unknown [218.17.89.111])
 by smtp12 (Coremail) with SMTP id EMCowADH348UUchgMAO_xQ--.62185S2;
 Tue, 15 Jun 2021 15:04:54 +0800 (CST)
Date: Tue, 15 Jun 2021 15:04:52 +0800
From: Chunyou Tang <tangchunyou@163.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] modified: gpu/drm/panfrost/panfrost_gpu.c
Message-ID: <20210615150452.00007abc@163.com>
In-Reply-To: <d1304645-f2bf-8cea-2b60-24e0a3936ed7@arm.com>
References: <20210609063850.2060-1-tangchunyou@163.com>
 <78a2488a-71d5-548a-e221-7786f788509c@arm.com>
 <20210610210659.00003155@163.com>
 <d1304645-f2bf-8cea-2b60-24e0a3936ed7@arm.com>
Organization: icube
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.16.6; i586-pc-mingw32msvc)
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EMCowADH348UUchgMAO_xQ--.62185S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCw4xCr1kJryxtFWxWFy3Arb_yoWrur4fpF
 yUAFyYyFy8Xw1jqayq93WIkFyYva4rtFy8WF1DArZ8AFsIqFn8tFsFya409Fy8Cr4rX3Wj
 qws7Ga47Wa1UArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07js8n5UUUUU=
X-Originating-IP: [218.17.89.111]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/xtbBRRWyUVPAMdTX4QAAsz
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
 tangchunyou <tangchunyou@163.icubecorp.cn>, tangchunyou@icubecorp.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi steve,
	After I send the V2,I found I setting a wrong email 
configuration,I hope it doesn't affect the patch submission :)
	Did you received my another patch about panfrost_job.c?


	Author: tangchunyou <tangchunyou@163.icubecorp.cn>
Date:   Wed Jun 9 14:44:52 2021 +0800

    modified: gpu/drm/panfrost/panfrost_job.c

    The 'break' can cause 'Memory manager not clean during takedown'
    It cannot use break to finish the circulation,it should use
    continue to traverse the circulation.

    Signed-off-by: tangchunyou <tangchunyou@163.icubecorp.cn>

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 6003cfeb1322..52bccc1d2d42 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -281,7 +281,7 @@ static void panfrost_job_cleanup(struct kref *ref)
        if (job->mappings) {
                for (i = 0; i < job->bo_count; i++) {
                        if (!job->mappings[i])
-                               break;
+                               continue;

                        atomic_dec(&job->mappings[i]->obj->gpu_usecount);
                        panfrost_gem_mapping_put(job->mappings[i]);


Thank you!



于 Fri, 11 Jun 2021 11:10:16 +0100
Steven Price <steven.price@arm.com> 写道:

> On 10/06/2021 14:06, Chunyou Tang wrote:
> > Hi Steven,
> 
> Hi Chunyou,
> 
> For some reason I'm not directly receiving your emails (only via the
> list) - can you double check your email configuration?
> 
> >>> The GPU exception fault status register(0x3C),the low 8 bit is the
> >>> EXCEPTION_TYPE.We can see the description at P3-78 in spec.
> > 
> > 	You can see the spec
> > 	<arm_heimdall_technical_reference_manual_100612_0001_00_en.pdf>.
> 
> Thanks - please include that in the commit message - there are many
> TRMs (one for each GPU) so without the information about exactly which
> specification the page number is pretty useless. Sadly this
> documentation isn't public which would be even better but I don't
> think there are any public specs for this information.
> 
> >> However this change is correct - panfrost_exception_name() should
> >> be taking only the lower 8 bits. Even better though would be to to
> >> report the full raw fault information as well as the high bits can
> >> contain useful information:
> >>
> >> 	dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at
> >> 0x%016llx\n", fault_status,
> >> 		 panfrost_exception_name(pfdev, fault_status &
> >> 0xFF), address);
> > 
> > So I change it according to what you said?
> 
> Yes, please send a v2.
> 
> Thanks,
> 
> Steve
> 
> > 于 Thu, 10 Jun 2021 11:41:52 +0100
> > Steven Price <steven.price@arm.com> 写道:
> > 
> >> The subject should have the prefix "drm/panfrost" and should
> >> mention what the patch is changing (not just the filename).
> >>
> >> On 09/06/2021 07:38, ChunyouTang wrote:

> >>> From: tangchunyou <tangchunyou@163.icubecorp.cn>
> >>>
> >>> The GPU exception fault status register(0x3C),the low 8 bit is the
> >>> EXCEPTION_TYPE.We can see the description at P3-78 in spec.
> >>
> >> Nit: When referring to a spec it's always good to mention the name
> >> - I'm not sure which specification you found this in.
> >>
> >>>
> >>> Signed-off-by: tangchunyou <tangchunyou@163.icubecorp.cn>
> >>> ---
> >>>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> >>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c index
> >>> 2aae636f1cf5..1fffb6a0b24f 100644 ---
> >>> a/drivers/gpu/drm/panfrost/panfrost_gpu.c +++
> >>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c @@ -33,7 +33,7 @@ static
> >>> irqreturn_t panfrost_gpu_irq_handler(int irq, void *data) address
> >>> |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO); 
> >>>  		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at
> >>> 0x%016llx\n",
> >>> -			 fault_status & 0xFF,
> >>> panfrost_exception_name(pfdev, fault_status),
> >>> +			 fault_status & 0xFF,
> >>> panfrost_exception_name(pfdev, fault_status & 0xFF),
> >>
> >> However this change is correct - panfrost_exception_name() should
> >> be taking only the lower 8 bits. Even better though would be to to
> >> report the full raw fault information as well as the high bits can
> >> contain useful information:
> >>
> >> 	dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at
> >> 0x%016llx\n", fault_status,
> >> 		 panfrost_exception_name(pfdev, fault_status &
> >> 0xFF), address);
> >>
> >> Thanks,
> >>
> >> Steve
> >>
> >>>  			 address);
> >>>  
> >>>  		if (state & GPU_IRQ_MULTIPLE_FAULT)
> >>>
> > 
> > 


