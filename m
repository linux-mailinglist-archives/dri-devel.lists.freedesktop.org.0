Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B65CBF803
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 20:14:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EA510E445;
	Mon, 15 Dec 2025 19:14:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="B5iqO6s0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85C910E445
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 19:14:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765826036; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=CliNdOkQrlF50rv7BPBgMmM0l6xa2SNVZquURRXijqj22sU3SkCkgCzf+AaG3F5VJKKzRw+Vch4gO5/DS3/TyUEbA+HralT/uQHjaSSn/MQrvtWBk4mKCJSkvUMZ2t/h0BXqZ4U4g6CiyecFVWfmWaKKBLD9T1lwy2EzSJd+hMI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765826036;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=yo0T7sS2ngtDSyQyvmQ31CWWTxPiT9Hz7GtkQbjSYzc=; 
 b=C/EFd8r8br6ei+gYrJYqV4vO52HG068hlpXr6lGwrCqbiJd9P43l7N1bFHagJ6knjY/Bcs8+gAkfXwcK5HwTOX12fUnsRn8S3jSk9bb4/kIuh+xjJI61ffQizcp6+TZOvZJ6ZKT1kwvkGvL49Hz5zd7xkWh66nkRWleRa5JPFss=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765826036; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=yo0T7sS2ngtDSyQyvmQ31CWWTxPiT9Hz7GtkQbjSYzc=;
 b=B5iqO6s0r89haSpEONhASIxRFE6ed/f8t8sZLvar7DfxS2Kq9Tuj5lzA+zb/q4HK
 j8y4BSkQZpSFzDDIyUsx9Pw5Dhm4KgY4fC38o1qEGlKPiMTuH8DtmnRi2uW1Jgrs3ON
 8fRIXjwxfF7AEvrD1nTLOnFaI0MYpegJiqwy52kM=
Received: by mx.zohomail.com with SMTPS id 1765826033022171.65175311538212;
 Mon, 15 Dec 2025 11:13:53 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chia-I Wu <olvaffe@gmail.com>, Karunika Choo <karunika.choo@arm.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 2/3] drm/panthor: Add tracepoint for hardware
 utilisation changes
Date: Mon, 15 Dec 2025 20:13:39 +0100
Message-ID: <5534715.31r3eYUQgx@workhorse>
In-Reply-To: <df93c238-c9d0-4f32-a371-b0bf4bcaaa0d@arm.com>
References: <20251211-panthor-tracepoints-v3-0-924c9d356a5c@collabora.com>
 <20251211-panthor-tracepoints-v3-2-924c9d356a5c@collabora.com>
 <df93c238-c9d0-4f32-a371-b0bf4bcaaa0d@arm.com>
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

On Monday, 15 December 2025 18:21:52 Central European Standard Time Lukas Zapolskas wrote:
> Hello Nicolas,
> 
> 
> On 11/12/2025 16:15, Nicolas Frattaroli wrote:
> > Mali GPUs have three registers that indicate which parts of the hardware
> > are powered at any moment. These take the form of bitmaps. In the case
> > of SHADER_READY for example, a high bit indicates that the shader core
> > corresponding to that bit index is powered on. These bitmaps aren't
> > solely contiguous bits, as it's common to have holes in the sequence of
> > shader core indices, and the actual set of which cores are present is
> > defined by the "shader present" register.
> > 
> > When the GPU finishes a power state transition, it fires a
> > GPU_IRQ_POWER_CHANGED_ALL interrupt. After such an interrupt is
> > received, the _READY registers will contain new interesting data. During
> > power transitions, the GPU_IRQ_POWER_CHANGED interrupt will fire, and
> > the registers will likewise contain potentially changed data.
> > 
> > This is not to be confused with the PWR_IRQ_POWER_CHANGED_ALL interrupt,
> > which is something related to Mali v14+'s power control logic. The
> > _READY registers and corresponding interrupts are already available in
> > v9 and onwards.
> > 
> > Expose the data as a tracepoint to userspace. This allows users to debug
> > various scenarios and gather interesting information, such as: knowing
> > how much hardware is lit up at any given time, correlating graphics
> > corruption with a specific powered shader core, measuring when hardware
> > is allowed to go to a powered off state again, and so on.
> > 
> > The registration/unregistration functions for the tracepoint go through
> > a wrapper in panthor_hw.c, so that v14+ can implement the same
> > tracepoint by adding its hardware specific IRQ on/off callbacks to the
> > panthor_hw.ops member.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_gpu.c   | 38 ++++++++++++++++++--
> >  drivers/gpu/drm/panthor/panthor_gpu.h   |  2 ++
> >  drivers/gpu/drm/panthor/panthor_hw.c    | 62 +++++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_hw.h    |  8 +++++
> >  drivers/gpu/drm/panthor/panthor_trace.h | 59 +++++++++++++++++++++++++++++++
> >  5 files changed, 167 insertions(+), 2 deletions(-)
> > 
> > [... snip ...]
> > +/**
> > + * gpu_power_status - called whenever parts of GPU hardware are turned on or off
> > + * @dev: pointer to the &struct device, for printing the device name
> > + * @shader_bitmap: bitmap where a high bit indicates the shader core at a given
> > + *                 bit index is on, and a low bit indicates a shader core is
> > + *                 either powered off or absent
> > + * @tiler_bitmap: bitmap where a high bit indicates the tiler unit at a given
> > + *                bit index is on, and a low bit indicates a tiler unit is
> > + *                either powered off or absent
> > + * @l2_bitmap: bitmap where a high bit indicates the L2 cache at a given bit
> > + *             index is on, and a low bit indicates the L2 cache is either
> > + *             powered off or absent
> > + */
> > +TRACE_EVENT_FN(gpu_power_status,
> > +	TP_PROTO(const struct device *dev, u64 shader_bitmap, u64 tiler_bitmap,
> > +		 u64 l2_bitmap),
> > +	TP_ARGS(dev, shader_bitmap, tiler_bitmap, l2_bitmap),
> > +	TP_STRUCT__entry(
> > +		__string(dev_name, dev_name(dev))
> > +		__field(u64, shader_bitmap)
> > +		__field(u64, tiler_bitmap)
> > +		__field(u64, l2_bitmap)
> > +	),
> > +	TP_fast_assign(
> > +		__assign_str(dev_name);
> > +		__entry->shader_bitmap	= shader_bitmap;
> > +		__entry->tiler_bitmap	= tiler_bitmap;
> > +		__entry->l2_bitmap	= l2_bitmap;
> > +	),
> > +	TP_printk("%s: shader_bitmap=0x%llx tiler_bitmap=0x%llx l2_bitmap=0x%llx",
> > +		  __get_str(dev_name), __entry->shader_bitmap, __entry->tiler_bitmap,
> > +		  __entry->l2_bitmap
> > +	),
> > +	panthor_hw_power_status_register, panthor_hw_power_status_unregister
> > +);
> 
> What is the expectation of stability for this tracepoint? Because I worry about future architectures 
> that add different hardware blocks: we would have to either extend this tracepoint, or deprecate it
> and make another one that is very similar.

There is no problem with extending this tracepoint in the future.
Linux tracepoints automatically have a machine-readable description
of their data layout in tracefs, in the "format" file. Adding new
fields to the tracepoint will not interfere with any tooling that
uses the format description to parse the data. The tracepoint's ABI
is self-describing in that sense.

> Do you have any sort of userspace tooling that is consuming
> this or is this more for local debugging? 
 
The specific use-case is Perfetto. This tracepoint can be consumed
by Perfetto with no special parsing added to Perfetto itself, as
it can consume event tracepoints like this based on their "format"
description.

Perfetto can do manual parsing for some tracepoints to integrate
them into the timeline differently, but for instantaneous events
like this, that is not needed.

Kind regards,
Nicolas Frattaroli

> > +
> > +#endif /* __PANTHOR_TRACE_H__ */
> > +
> > +#undef TRACE_INCLUDE_PATH
> > +#define TRACE_INCLUDE_PATH .
> > +#undef TRACE_INCLUDE_FILE
> > +#define TRACE_INCLUDE_FILE panthor_trace
> > +
> > +#include <trace/define_trace.h>
> > 
> 
> Kind regards,
> Lukas
> 
> 




