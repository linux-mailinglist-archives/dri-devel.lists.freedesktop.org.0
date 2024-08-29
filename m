Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD9D963E0F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 10:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9AE10E60E;
	Thu, 29 Aug 2024 08:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AOKOA77f";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="PSXztn6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 348 seconds by postgrey-1.36 at gabe;
 Thu, 29 Aug 2024 08:09:22 UTC
Received: from a7-41.smtp-out.eu-west-1.amazonses.com
 (a7-41.smtp-out.eu-west-1.amazonses.com [54.240.7.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6F010E60E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 08:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1724918612;
 h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=ZxP0DMWGEIInE6u3+mBnoIiiVlADlsQK6Zqu8r0Oge0=;
 b=AOKOA77fWHi7qbllVfAvvh34ESesZzdTfa8r6CMRcqwtvS9jz1JfO4WxAvnJv4dz
 V87+qM2cFdIMjudgN1TnXLraLIDUn/1yJCDcP99YTjj7EKkmAE8WhVzFzmPn6TeA7rB
 5byjaviWsJ0eo1jbsSxD3zPCwoxUGNJc4MNKhh6PQ4fhP0voE8sKl7GZTD3PowO+/4d
 u25QNfg6f41yvBrGwrDvDeZOI+BatH9YLUPvqwlVc/39yuKCdXXbdwqgz30HmuP3hl1
 tO95xc8H//sP3PVOLgQyibmmjVeErCBSKvyMYvNZwZvz9RLh8rq4kRIAHMBebsPF7or
 Q6gH629ITw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1724918612;
 h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=ZxP0DMWGEIInE6u3+mBnoIiiVlADlsQK6Zqu8r0Oge0=;
 b=PSXztn6JciVPDqbuVFQYLe2717oq+RChpQGu9U4txh03ags9py//PgR4GhMzyGps
 FxpQY0sh1ApDOFi8V7x6f/JWsi00Mc/9orOlrO94yYDQPiN2umAQ1wwkp34a1sbrDmt
 lFDRXuQTtK622Y+0N7ONCbd8cYCTeIQMACYBLrZw=
Date: Thu, 29 Aug 2024 08:03:32 +0000
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mihail Atanassov <mihail.atanassov@arm.com>
Cc: Mary Guillemard <mary.guillemard@collabora.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 kernel@collabora.com, Christopher Healy <healych@amazon.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 nd@arm.com
Subject: Re: [PATCH] drm/panthor: Add DEV_QUERY_TIMESTAMP_INFO dev query
Message-ID: <010201919d2941b2-30e06345-f86a-487c-9414-40fe2e6f2c58-000000@eu-west-1.amazonses.com>
In-Reply-To: <da61aa7c-0cee-4d44-a0f3-4b7eed3a8b58@arm.com>
References: <20240807153553.142325-2-mary.guillemard@collabora.com>
 <327a3440-8d01-4787-83be-a00fbbe0b593@arm.com>
 <20240828140929.5c602436@collabora.com>
 <c38324e4-055f-44b5-beb4-6b3e6b860e69@arm.com>
 <20240828180703.4510a4e2@collabora.com>
 <010201919a07868c-a8b90e57-0e61-4a05-8271-f4f4f86ca4cf-000000@eu-west-1.amazonses.com>
 <da61aa7c-0cee-4d44-a0f3-4b7eed3a8b58@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.08.29-54.240.7.41
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

On Wed, 28 Aug 2024 18:37:41 +0100
Mihail Atanassov <mihail.atanassov@arm.com> wrote:

> On 28/08/2024 18:27, Boris Brezillon wrote:
> > On Wed, 28 Aug 2024 18:07:03 +0200
> > Boris Brezillon <boris.brezillon@collabora.com> wrote:
> >   
> >> On Wed, 28 Aug 2024 14:22:51 +0100
> >> Mihail Atanassov <mihail.atanassov@arm.com> wrote:
> >>  
> >>> Hi Boris,
> >>>
> >>> On 28/08/2024 13:09, Boris Brezillon wrote:  
> >>>> Hi Mihail,
> >>>>
> >>>> On Thu, 8 Aug 2024 12:41:05 +0300
> >>>> Mihail Atanassov <mihail.atanassov@arm.com> wrote:
> >>>>        
> >>>>>>
> >>>>>> +/** + * struct drm_panthor_timestamp_info - Timestamp information +
> >>>>>> * + * Structure grouping all queryable information relating to the
> >>>>>> GPU timestamp. + */ +struct drm_panthor_timestamp_info { +	/**
> >>>>>> @timestamp_frequency: The frequency of the timestamp timer. */ +
> >>>>>> __u64 timestamp_frequency; + +	/** @current_timestamp: The current
> >>>>>> timestamp. */ +	__u64 current_timestamp;  
> >>>>>
> >>>>> As it stands, this query has nothing to do with the actual GPU so
> >>>>> doesn't really belong here.
> >>>>>
> >>>>> It'd be more valuable, and can maybe give better calibration results
> >>>>> than querying the system timestamp separately in userspace, if you
> >>>>> reported all of:
> >>>>>     * the system timer value
> >>>>>     * the system timer frequency
> >>>>>     * the GPU timer value
> >>>>>     * the GPU timer frequency (because it _could_ be different in some
> >>>>> systems)  
> >>>>
> >>>> Duh, I wish this wasn't the case and all SoC vendors went for the
> >>>> arch-timer which guarantees the consistency of the timestamp on the GPU
> >>>> and CPU. But let's say this is a case we need to support, wouldn't it
> >>>> be more useful to do the CPU/GPU calibration kernel side (basically at
> >>>> init/resume time) and then expose the formula describing the
> >>>> relationship between those 2 things:
> >>>>
> >>>> CPU_time = GPU_time * GPU_to_CPU_mul / GPU_to_CPU_div +
> >>>> 	   GPU_to_CPU_offset;
> >>>>        
> >>>
> >>> TIMESTAMP_OFFSET should indeed be set by the kernel (on resume). But I
> >>> don't think we need to post M/D+offset to userspace. The 2 Frequencies +
> >>> the scalar offset are the raw sources, and userspace can work back from
> >>> there.  
> >>
> >> Sure. No matter how you express the relationship, my point was, if the
> >> calibration is supposed to happen in the kernel at resume time,
> >> returning both the CPU/GPU time in DEV_QUERY_TIMESTAMP to make sure the
> >> sampling is close enough that they actually represent the same
> >> timestamp might not be needed, because you can easily convert from one
> >> domain to the other.  
> > 
> > I think it makes more sense after reading [1] :-). This being said, the
> > maxDeviation is here to account for any latency that might exists
> > between each domain sampling, so I'd be tempted to read the CPU
> > monotonic time through the regular syscalls rather than add it to the
> > DEV_QUERY_TIMESTAMP ioctl.
> >   
> 
> Wouldn't that defeat the point of getting low-latency consecutive reads 
> of both time domains? If you leave it to a separate syscall, you're at 
> the mercy of a lot of things, so it's not just a scalar time delta, 
> you'll get much higher measurement variance.

I guess you're not calling clock_gettime() and instead do the cycles ->
nanoseconds conversion manually for VK_TIME_DOMAIN_CLOCK_MONOTONIC_RAW,
but it's unclear how you do that for VK_TIME_DOMAIN_CLOCK_MONOTONIC.

> Doing it in-kernel with no 
> sleeps in the middle gets you better confidence in your samples being 
> consistently correlated in time. If you have that in-kernel low latency 
> correlation pairwise for all time domains you're interested in (in this 
> case CPU & GPU timestamps, but you could get CPU & display IP 
> timestamps, etc), you can then correlate all of the clocks in userspace.
> 
> Fundamentally, though, if you don't report CPU timestamps in v1 of the 
> ioctl, you can extend later if it becomes clear that the maxDeviation is 
> not low enough with the samples being across a syscall.

Yeah, I think I'd prefer this option. Note that all other drivers in
mesa do it one syscall at a time (see vk_clock_gettime() users [1]).
Not saying this is necessarily the best option, but the ioctl()
overhead doesn't seem to cause issues there.

[1]https://elixir.bootlin.com/mesa/mesa-24.2.1/A/ident/vk_clock_gettime
