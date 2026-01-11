Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0098AD0EBD8
	for <lists+dri-devel@lfdr.de>; Sun, 11 Jan 2026 12:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6E210E205;
	Sun, 11 Jan 2026 11:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="b4uzreFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BBA10E205
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 11:50:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1768132200; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=AMszW9mzf7RCdeBG2YkCxGzO98dzh32zKD5ITI/LuFt7NF/5Yp1DJofQHgcKF7vVwUfwM3UyN1a7Vh3IWiu5qyztHFMHOdHpKNOVbmWC8H05KbXgkxe6ZryoaFA86XWyGaeaTeiLUg3TjzrRXr4qUZCdc3WKxa8l0QcmAy1FRHI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1768132200;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=9IkfbEtla6YJHcufGJvw4Hf3TfZP9r5IxC6tRB8yI4E=; 
 b=jLZA7LMxL/Dbgb0KNnwHWUCKzhLAYf6B0ehJduY52J/VTHsp8h7vRy7iqVtwIlCJBXp2k/JWArag60aptwFU4fJkPHPaWg0wYvlKb4sA+wwOv6XEEiD3n1pZ3reyDVn2d9EYl985t66ak8aiWkgj/1f4qNISVkMuV9DzaRcYuZs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768132200; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=9IkfbEtla6YJHcufGJvw4Hf3TfZP9r5IxC6tRB8yI4E=;
 b=b4uzreFKEuiEKgyqhG38Yy3toSpMApuPJhUtHOGnehPn/AnariO4HsgW54Iodukw
 wcrhYEmS0tCnUY2n2C2lBqEB4JmW0fxDrMp74J1h/WeVFhlxsbxHDL75Njp2g7xWd2b
 n0hUxURr1iDOa02VdEABiLYo74Sq/nWypupknSOA=
Received: by mx.zohomail.com with SMTPS id 1768132199201551.1665896418114;
 Sun, 11 Jan 2026 03:49:59 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 4/4] drm/panthor: Add gpu_job_irq tracepoint
Date: Sun, 11 Jan 2026 12:49:53 +0100
Message-ID: <5773030.GXAFRqVoOG@workhorse>
In-Reply-To: <0772b791-85ad-4eb0-8c71-daeae74f0b79@arm.com>
References: <20260108-panthor-tracepoints-v7-0-afeae181f74a@collabora.com>
 <20260108-panthor-tracepoints-v7-4-afeae181f74a@collabora.com>
 <0772b791-85ad-4eb0-8c71-daeae74f0b79@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Friday, 9 January 2026 17:23:32 Central European Standard Time Steven Price wrote:
> On 08/01/2026 14:19, Nicolas Frattaroli wrote:
> > Mali's CSF firmware triggers the job IRQ whenever there's new firmware
> > events for processing. While this can be a global event (BIT(31) of the
> > status register), it's usually an event relating to a command stream
> > group (the other bit indices).
> > 
> > Panthor throws these events onto a workqueue for processing outside the
> > IRQ handler. It's therefore useful to have an instrumented tracepoint
> > that goes beyond the generic IRQ tracepoint for this specific case, as
> > it can be augmented with additional data, namely the events bit mask.
> > 
> > This can then be used to debug problems relating to GPU jobs events not
> > being processed quickly enough. The duration_ns field can be used to
> > work backwards from when the tracepoint fires (at the end of the IRQ
> > handler) to figure out when the interrupt itself landed, providing not
> > just information on how long the work queueing took, but also when the
> > actual interrupt itself arrived.
> > 
> > With this information in hand, the IRQ handler itself being slow can be
> > excluded as a possible source of problems, and attention can be directed
> > to the workqueue processing instead.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_fw.c    | 13 +++++++++++++
> >  drivers/gpu/drm/panthor/panthor_trace.h | 28 ++++++++++++++++++++++++++++
> >  2 files changed, 41 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > index 0e46625f7621..b3b48c1b049c 100644
> > --- a/drivers/gpu/drm/panthor/panthor_fw.c
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> > @@ -26,6 +26,7 @@
> >  #include "panthor_mmu.h"
> >  #include "panthor_regs.h"
> >  #include "panthor_sched.h"
> > +#include "panthor_trace.h"
> >  
> >  #define CSF_FW_NAME "mali_csffw.bin"
> >  
> > @@ -1060,6 +1061,12 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
> >  
> >  static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
> >  {
> > +	u32 duration;
> > +	u64 start;
> > +
> > +	if (tracepoint_enabled(gpu_job_irq))
> > +		start = ktime_get_ns();
> > +
> >  	gpu_write(ptdev, JOB_INT_CLEAR, status);
> >  
> >  	if (!ptdev->fw->booted && (status & JOB_INT_GLOBAL_IF))
> > @@ -1072,6 +1079,12 @@ static void panthor_job_irq_handler(struct panthor_device *ptdev, u32 status)
> >  		return;
> >  
> >  	panthor_sched_report_fw_events(ptdev, status);
> > +
> > +	if (tracepoint_enabled(gpu_job_irq)) {
> > +		if (check_sub_overflow(ktime_get_ns(), start, &duration))
> 
> It's minor but if the tracepoint was enabled during the handler, the
> duration will use start uninitialised. It's probably best to initialise
> start just to avoid a potential stack leak.

Good catch.

Should I unconditionally initialize it to ktime_get_ns(), or do we want
to avoid a call into that and initialize it to something that will result
in a nonsense duration? Alternatively we initialize it to 0 and skip the
tracepoint if !start.

My gut tells me reading the monotonic clock shouldn't be considered
expensive, though having the tracepoint overhead with an inactive
tracepoint be within a Planck time of "free" would be preferable,
so I'm leaning towards

    u64 start = 0;

    if (tracepoint_enabled(gpu_job_irq))
            start = ktime_get_ns();

    ...

    if (start && tracepoint_enabled(gpu_job_irq)) {
            ...

Kind regards,
Nicolas Frattaroli

> 
> Thanks,
> Steve
> 
> > +			duration = U32_MAX;
> > +		trace_gpu_job_irq(ptdev->base.dev, status, duration);
> > +	}
> >  }
> >  PANTHOR_IRQ_HANDLER(job, JOB, panthor_job_irq_handler);
> >  
> > diff --git a/drivers/gpu/drm/panthor/panthor_trace.h b/drivers/gpu/drm/panthor/panthor_trace.h
> > index 5bd420894745..6ffeb4fe6599 100644
> > --- a/drivers/gpu/drm/panthor/panthor_trace.h
> > +++ b/drivers/gpu/drm/panthor/panthor_trace.h
> > @@ -48,6 +48,34 @@ TRACE_EVENT_FN(gpu_power_status,
> >  	panthor_hw_power_status_register, panthor_hw_power_status_unregister
> >  );
> >  
> > +/**
> > + * gpu_job_irq - called after a job interrupt from firmware completes
> > + * @dev: pointer to the &struct device, for printing the device name
> > + * @events: bitmask of BIT(CSG id) | BIT(31) for a global event
> > + * @duration_ns: Nanoseconds between job IRQ handler entry and exit
> > + *
> > + * The panthor_job_irq_handler() function instrumented by this tracepoint exits
> > + * once it has queued the firmware interrupts for processing, not when the
> > + * firmware interrupts are fully processed. This tracepoint allows for debugging
> > + * issues with delays in the workqueue's processing of events.
> > + */
> > +TRACE_EVENT(gpu_job_irq,
> > +	TP_PROTO(const struct device *dev, u32 events, u32 duration_ns),
> > +	TP_ARGS(dev, events, duration_ns),
> > +	TP_STRUCT__entry(
> > +		__string(dev_name, dev_name(dev))
> > +		__field(u32, events)
> > +		__field(u32, duration_ns)
> > +	),
> > +	TP_fast_assign(
> > +		__assign_str(dev_name);
> > +		__entry->events		= events;
> > +		__entry->duration_ns	= duration_ns;
> > +	),
> > +	TP_printk("%s: events=0x%x duration_ns=%d", __get_str(dev_name),
> > +		  __entry->events, __entry->duration_ns)
> > +);
> > +
> >  #endif /* __PANTHOR_TRACE_H__ */
> >  
> >  #undef TRACE_INCLUDE_PATH
> > 
> 
> 




