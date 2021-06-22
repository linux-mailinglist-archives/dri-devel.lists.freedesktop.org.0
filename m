Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA503AFAAA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 03:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D086E063;
	Tue, 22 Jun 2021 01:40:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by gabe.freedesktop.org (Postfix) with ESMTP id EA7B36E063
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 01:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=toPYW
 TZX5DEEUFVoKeHUPnohkQ8xxp2EkZf9C87R7eA=; b=T3tdSYrOZ8QiagGsaz7gq
 dB+pXeRhoV3ZAlRuu9o78eu7r5NOrSUVl0zVFLHtb+YUJuRzDtiDdbYgrEevbSQr
 yMi0SrmrCDjQwtIUUDpsDCZusvpDoS0HTSDe1yKl6J72q6nhGobXZSmTTPthtXeJ
 W49xD9I3FQqWF7QZQV31Is=
Received: from localhost (unknown [218.17.89.111])
 by smtp9 (Coremail) with SMTP id DcCowACn7gpwP9Fgv65SHg--.10294S2;
 Tue, 22 Jun 2021 09:40:01 +0800 (CST)
Date: Tue, 22 Jun 2021 09:40:00 +0800
From: Chunyou Tang <tangchunyou@163.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2] drm/panfrost:report the full raw fault information
 instead
Message-ID: <20210622094000.00004f7e@163.com>
In-Reply-To: <23f675e9-698d-840d-104f-33aa594dcb96@arm.com>
References: <20210617062054.1864-1-tangchunyou@163.com>
 <2dcbb36a-b550-4c9d-cff8-73ca4b5abb11@arm.com>
 <20210619111852.00003e52@163.com>
 <23f675e9-698d-840d-104f-33aa594dcb96@arm.com>
Organization: icube
X-Mailer: Claws Mail 3.10.1 (GTK+ 2.16.6; i586-pc-mingw32msvc)
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowACn7gpwP9Fgv65SHg--.10294S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr1rGw1UuF4xGFy3Cw13twb_yoW7XrW3pr
 yUGayakrWkt342q3Wq9a1qgFyYvw4UJFyvgFnrCr15tFsFvF45W3s2ya4jga4DZr4UCay2
 vw4kA3yI9a4UZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jKApnUUUUU=
X-Originating-IP: [218.17.89.111]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiHhO5UVSIvWmBjAAAsg
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
	I will send a new patch with suitable subject/commit message.
But I send a V3 or a new patch?

	I met a bug about the GPU,I have no idea about how to fix it,
If you can give me some suggestion,it is perfect.

You can see such kernel log:

Jun 20 10:20:13 icube kernel: [  774.566760] mvp_gpu 0000:05:00.0: GPU
Fault 0x00000088 (SHAREABILITY_FAULT) at 0x000000000310fd00 Jun 20
10:20:13 icube kernel: [  774.566764] mvp_gpu 0000:05:00.0: There were
multiple GPU faults - some have not been reported Jun 20 10:20:13 icube
kernel: [  774.667542] mvp_gpu 0000:05:00.0: AS_ACTIVE bit stuck Jun 20
10:20:13 icube kernel: [  774.767900] mvp_gpu 0000:05:00.0: AS_ACTIVE
bit stuck Jun 20 10:20:13 icube kernel: [  774.868546] mvp_gpu
0000:05:00.0: AS_ACTIVE bit stuck Jun 20 10:20:13 icube kernel:
[  774.968910] mvp_gpu 0000:05:00.0: AS_ACTIVE bit stuck Jun 20
10:20:13 icube kernel: [  775.069251] mvp_gpu 0000:05:00.0: AS_ACTIVE
bit stuck Jun 20 10:20:22 icube kernel: [  783.693971] mvp_gpu
0000:05:00.0: gpu sched timeout, js=1, config=0x7300, status=0x8,
head=0x362c900, tail=0x362c100, sched_job=000000003252fb84

In
https://lore.kernel.org/dri-devel/20200510165538.19720-1-peron.clem@gmail.com/
there had a same bug like mine,and I found you at the mail list,I don't
know how it fixed?

I need your help!

thinks very much!

Chunyou

于 Mon, 21 Jun 2021 11:45:20 +0100
Steven Price <steven.price@arm.com> 写道:

> On 19/06/2021 04:18, Chunyou Tang wrote:
> > Hi Steve,
> > 	1,Now I know how to write the subject
> > 	2,the low 8 bits is the exception type in spec.
> > 
> > and you can see prnfrost_exception_name()
> > 
> > switch (exception_code) {
> >                 /* Non-Fault Status code */
> > case 0x00: return "NOT_STARTED/IDLE/OK";
> > case 0x01: return "DONE";
> > case 0x02: return "INTERRUPTED";
> > case 0x03: return "STOPPED";
> > case 0x04: return "TERMINATED";
> > case 0x08: return "ACTIVE";
> > ........
> > ........
> > case 0xD8: return "ACCESS_FLAG";
> > case 0xD9 ... 0xDF: return "ACCESS_FLAG";
> > case 0xE0 ... 0xE7: return "ADDRESS_SIZE_FAULT";
> > case 0xE8 ... 0xEF: return "MEMORY_ATTRIBUTES_FAULT";
> > }
> > return "UNKNOWN";
> > }
> > 
> > the exception_code in case is only 8 bits,so if fault_status
> > in panfrost_gpu_irq_handler() don't & 0xFF,it can't get correct
> > exception reason,it will be always UNKNOWN.
> 
> Yes, I'm happy with the change - I just need a patch that I can apply.
> At the moment this patch only changes the first '0x%08x' output rather
> than the call to panfrost_exception_name() as well. So we just need a
> patch which does:
> 
> - fault_status & 0xFF, panfrost_exception_name(pfdev, fault_status),
> + fault_status, panfrost_exception_name(pfdev, fault_status & 0xFF),
> 
> along with a suitable subject/commit message describing the change. If
> you can send me that I can apply it.
> 
> Thanks,
> 
> Steve
> 
> PS. Sorry for going round in circles here - I'm trying to help you get
> setup so you'll be able to contribute patches easily in future. An
> important part of that is ensuring you can send a properly formatted
> patch to the list.
> 
> PPS. I'm still not receiving your emails directly. I don't think it's
> a problem at my end because I'm receiving other emails, but if you can
> somehow fix the problem you're likely to receive a faster response.
> 
> > 于 Fri, 18 Jun 2021 13:43:24 +0100
> > Steven Price <steven.price@arm.com> 写道:
> > 
> >> On 17/06/2021 07:20, ChunyouTang wrote:
> >>> From: ChunyouTang <tangchunyou@icubecorp.cn>
> >>>
> >>> of the low 8 bits.
> >>
> >> Please don't split the subject like this. The first line of the
> >> commit should be a (very short) summary of the patch. Then a blank
> >> line and then a longer description of what the purpose of the
> >> patch is and why it's needed.
> >>
> >> Also you previously had this as part of a series (the first part
> >> adding the "& 0xFF" in the panfrost_exception_name() call). I'm not
> >> sure we need two patches for the single line, but as it stands this
> >> patch doesn't apply.
> >>
> >> Also I'm still not receiving any emails from you directly (only via
> >> the list), so it's possible I might have missed something you sent.
> >>
> >> Steve
> >>
> >>>
> >>> Signed-off-by: ChunyouTang <tangchunyou@icubecorp.cn>
> >>> ---
> >>>  drivers/gpu/drm/panfrost/panfrost_gpu.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c
> >>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c index
> >>> 1fffb6a0b24f..d2d287bbf4e7 100644 ---
> >>> a/drivers/gpu/drm/panfrost/panfrost_gpu.c +++
> >>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c @@ -33,7 +33,7 @@ static
> >>> irqreturn_t panfrost_gpu_irq_handler(int irq, void *data) address
> >>> |= gpu_read(pfdev, GPU_FAULT_ADDRESS_LO); 
> >>>  		dev_warn(pfdev->dev, "GPU Fault 0x%08x (%s) at
> >>> 0x%016llx\n",
> >>> -			 fault_status & 0xFF,
> >>> panfrost_exception_name(pfdev, fault_status & 0xFF),
> >>> +			 fault_status,
> >>> panfrost_exception_name(pfdev, fault_status & 0xFF), address);
> >>>  
> >>>  		if (state & GPU_IRQ_MULTIPLE_FAULT)
> >>>
> > 
> > 


