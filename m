Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D287CAFFAA
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 13:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26F810E544;
	Tue,  9 Dec 2025 12:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="M3/QmY+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AE610E544
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 12:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765284927; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=BqlIyml/GVmKZTY0bKdvfpKwxQ9pd1WV+mtmh5uJh435YkQrBG8C7kIM2/wxVOfLS3VIIt57QC9Yz/R/73uKct/2jMj9yUshL5H/GSx7URC9oA7WUJ+xgkVJtwKunDa4QAVE+rouoL1DlBdKqAndsqLKK7khPuYoRU+5Ju3N3KM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765284927;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=1b9alC9YHru/OGD76tLetPP9LT958YsmL0GON0bDgUY=; 
 b=VnSHYHuOZlp5db2b45j8R9GRDHdbnZ6v74rrvAso+kWoNyWAMcbw4tsl91fb1qfSQyxgLe4E2DmLa+qH7s5qBMrQPNj7N48XN7tCcU5TSjDe/H9PJOO3lN0VicKy6QSAxm7txCEaa9QlvVQ4qpjQ3ppFSbefz+JIHlh7ZOT5VCE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765284927; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=1b9alC9YHru/OGD76tLetPP9LT958YsmL0GON0bDgUY=;
 b=M3/QmY+GIL+R4h3+YUdE3JFvVngRm0WrohjbB64AOxCsU9Pzt8x7xK+esdqZhylU
 S9djiqWH/G6p0W5e61uiBEW9Zkrkt0Di08/DmAY+oMcGtyUbJZRzvNcRd885ykdaSaA
 fRVQfTK7NNUsBR1RdmQX8gjy6/Em+GHhmqIRWns8=
Received: by mx.zohomail.com with SMTPS id 1765284925272946.9174692122524;
 Tue, 9 Dec 2025 04:55:25 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karunika Choo <karunika.choo@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/panthor: Add tracepoint for hardware utilisation
 changes
Date: Tue, 09 Dec 2025 13:55:19 +0100
Message-ID: <24184349.6Emhk5qWAg@workhorse>
In-Reply-To: <fb6cac11-6166-42c5-a5c2-afce1a902437@arm.com>
References: <20251203-panthor-tracepoints-v1-0-871c8917e084@collabora.com>
 <20251203-panthor-tracepoints-v1-1-871c8917e084@collabora.com>
 <fb6cac11-6166-42c5-a5c2-afce1a902437@arm.com>
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

On Monday, 8 December 2025 18:21:06 Central European Standard Time Karunika Choo wrote:
> On 03/12/2025 13:56, Nicolas Frattaroli wrote:
> > Mali GPUs have three registers that indicate which parts of the hardware
> > are powered and active at any moment. These take the form of bitmaps. In
> > the case of SHADER_PWRACTIVE for example, a high bit indicates that the
> > shader core corresponding to that bit index is active. These bitmaps
> > aren't solely contiguous bits, as it's common to have holes in the
> > sequence of shader core indices, and the actual set of which cores are
> > present is defined by the "shader present" register.
> > 
> > When the GPU finishes a power state transition, it fires a
> > GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> > received, the PWRACTIVE registers will likely contain interesting new
> > information.
> > 
> > This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
> > which is something related to Mali v14+'s power control logic. The
> > PWRACTIVE registers and corresponding interrupts are already available
> > in v9 and onwards.
> > 
> > Expose this as a tracepoint to userspace. This allows users to debug
> > various scenarios and gather interesting information, such as: knowing
> > how much hardware is lit up at any given time, correlating graphics
> > corruption with a specific active shader core, measuring when hardware
> > is allowed to go to an inactive state again, and so on.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.c |  1 +
> >  drivers/gpu/drm/panthor/panthor_gpu.c    |  9 ++++++++
> >  drivers/gpu/drm/panthor/panthor_trace.h  | 38 ++++++++++++++++++++++++++++++++
> >  3 files changed, 48 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> > index e133b1e0ad6d..a3cb934104b8 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.c
> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
> > @@ -548,6 +548,7 @@ int panthor_device_resume(struct device *dev)
> >  			    DRM_PANTHOR_USER_MMIO_OFFSET, 0, 1);
> >  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_ACTIVE);
> >  	mutex_unlock(&ptdev->pm.mmio_lock);
> > +
> >  	return 0;
> >  
> >  err_suspend_devfreq:
> > diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
> > index 9cb5dee93212..8830aa9a5c4b 100644
> > --- a/drivers/gpu/drm/panthor/panthor_gpu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_gpu.c
> > @@ -22,6 +22,9 @@
> >  #include "panthor_hw.h"
> >  #include "panthor_regs.h"
> >  
> > +#define CREATE_TRACE_POINTS
> > +#include "panthor_trace.h"
> > +
> >  /**
> >   * struct panthor_gpu - GPU block management data.
> >   */
> > @@ -46,6 +49,7 @@ struct panthor_gpu {
> >  	(GPU_IRQ_FAULT | \
> >  	 GPU_IRQ_PROTM_FAULT | \
> >  	 GPU_IRQ_RESET_COMPLETED | \
> > +	 GPU_IRQ_POWER_CHANGED_ALL | \
> 
> Also, we've seen customers complain about too many IRQs originating
> from this event, is there any chance we can enable this conditionally
> i.e. only when the trace point is enabled?

Yeah, that's something I've been trying to look into. I'll need to
do some more digging to see if there's a way to run a callback when
an event tracepoint is enabled. That'd be the ideal way to do this,
because then we can just modify the interrupt mask in the callback.

For what it's worth, it doesn't fire very often for me, magnitudes
less often than the job interrupt fires at least. But I assume this
is highly implementation dependent, e.g. on bigger designs that have
more complex power setups and more reasons to enable only part of the
hardware, it'll fire way more often.

Kind regards,
Nicolas Frattaroli

> 
> Kind regards,
> Karunika



