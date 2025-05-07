Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B902BAAEC83
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 21:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C00810E168;
	Wed,  7 May 2025 19:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="NbCugbQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com
 [136.143.184.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00F310E88C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 19:54:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746647658; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DuradkHdEFy7/gQzhew9CmSqIs3Q3dqZzws4+Vct1QjXi0Tqo3+lZs4S8G8fCQMotI9rgLcdm1haKaTh7kJp59Va1gpSKNhxyjchrU/xTsXstghAhsthu2p1h3TMtPZkzQTYVeUsO5W69UXv0a4pM8GT4XTeRpLUznLfkF1DI7E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746647658;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=+iN7D7m+g9ZRAwJ3G4WSoK6I9OpM4X/jW0rOaKusDvY=; 
 b=R0RnzPTDraT9RX2mNGXs7d/Mh1OW7h253VlRNkOv/wIyOB9wPd+Gj0LaPAXnYdTFm7AovevpBemXoQ+7+JkgiFWRh2IBdBzTkICwrwX+yGUEt1UsDWybpDBySuFXLb+C5lcP3VEWXdosxvWrbhOLZl8WowMQyEANghXhYOWjhH0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746647658; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=+iN7D7m+g9ZRAwJ3G4WSoK6I9OpM4X/jW0rOaKusDvY=;
 b=NbCugbQnQ8wLUPSe6QfUe0J4YJgXF8SAM/l/VXKm2QVEMrp3riZ91+giam/mOC3S
 C68OvTr1ZNTAz9KX/NeW/Jdz9tvMc5XuW/WPSfprrrI3kHWCJbdDrc/aNYRAeL/4zXI
 yZzQvaIDJe8zK3Hh6Maw5mdv595Ofg41Pe8+Hp/c=
Received: by mx.zohomail.com with SMTPS id 1746647657507808.5456379150136;
 Wed, 7 May 2025 12:54:17 -0700 (PDT)
Date: Wed, 7 May 2025 20:54:13 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] drm/panthor: Add performance counters with manual
 sampling mode
Message-ID: <xqxyuzrerw5b3rndifpyklkarzio2j7ioe7nyedvhli55teevf@kb6lkfueeypf>
References: <cover.1743517880.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1743517880.git.lukas.zapolskas@arm.com>
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

Hi Lukas,

I wanted to review this series for quite some time but lately have found myself caught up in quite
a few other things. I've had a look into it last week, but before I delve into it any further, I was
wondering whether you could take some time to go over the questions and comments I left in the review
for the previous patch series version.

That way I could know what changes you introduced in response to issues I raised, and which ones are
due to a rethinking of the whole design.

I remember some of the questions I posed dealt with a genuine lack of understanding of the way
performance counters in CSF GPUs operate, so if you could find some time to answer them or else
point me to the right sections of the TRM I'd find the review of this latest revision a lot easier.

Kind Regards,
Adrian Larumbe

On 01.04.2025 16:48, Lukas Zapolskas wrote:
> Hello,
>
> This patch set implements initial support for performance counter
> sampling in Panthor, as a follow-up for Adrián Larumbe's patch
> set [1]. With this patch series, the RFC tag is dropped,
> following [2]. The Mesa implementation is in progress, and
> will be posted within the next week or two.
>
> Existing performance counter workflows, such as those in game
> engines, and user-space power models/governor implementations
> require the ability to simultaneously obtain counter data. The
> hardware and firmware interfaces support a single global
> configuration, meaning the kernel must allow for the multiplexing.
> It is also in the best position to supplement the counter data
> with contextual information about elapsed sampling periods,
> information on the power state transitions undergone during
> the sampling period, and cycles elapsed on specific clocks chosen
> by the integrator.
>
> Each userspace client creates a session, providing an enable
> mask of counter values it requires, a BO for a ring buffer,
> and a separate BO for the insert and extract indices, along with
> an eventfd to signal counter capture, all of which are kept fixed
> for the lifetime of the session. When emitting a sample for a
> session, counters that were not requested are stripped out,
> and non-counter information needed to interpret counter values
> is added to either the sample header, or the block header,
> which are stored in-line with the counter values in the sample.
>
> The proposed uAPI specifies two major sources of supplemental
> information:
> - coarse-grained block state transitions are provided on newer
>   FW versions which support the metadata block, a FW-provided
>   counter block which indicates the reason a sample was taken
>   when entering or exiting a non-counting region, or when a
>   shader core has powered down.
> - the clock assignments to individual blocks is done by
>   integrators, and in order to normalize counter values
>   which count cycles, userspace must know both the clock
>   cycles elapsed over the sampling period, and which
>   of the clocks that particular block is associated
>   with.
>
> All of the sessions are then aggregated by the sampler, which
> handles the programming of the FW interface and subsequent
> handling of the samples coming from FW.
>
> v2:
> - Fixed offset issues into FW ring buffer
> - Fixed sparse shader core handling
> - Added pre- and post- reset handlers
> - Added module param to control size of FW ring buffer
> - Clarified naming on sampler functions
> - Added error logging for PERF_SETUP
>
> [1]: https://lore.kernel.org/lkml/20240305165820.585245-1-adrian.larumbe@collabora.com/T/#m67d1f89614fe35dc0560e8304d6731eb1a6942b6
> [2]: https://lore.kernel.org/lkml/20241211165024.490748-1-lukas.zapolskas@arm.com/
>
> Adrián Larumbe (1):
>   drm/panthor: Implement the counter sampler and sample handling
>
> Lukas Zapolskas (6):
>   drm/panthor: Add performance counter uAPI
>   drm/panthor: Add DEV_QUERY.PERF_INFO handling for Gx10
>   drm/panthor: Add panthor perf initialization and termination
>   drm/panthor: Introduce sampling sessions to handle userspace clients
>   drm/panthor: Add suspend, resume and reset handling
>   drm/panthor: Expose the panthor perf ioctls
>
>  drivers/gpu/drm/panthor/Makefile         |    1 +
>  drivers/gpu/drm/panthor/panthor_device.c |   14 +-
>  drivers/gpu/drm/panthor/panthor_device.h |   11 +-
>  drivers/gpu/drm/panthor/panthor_drv.c    |  150 +-
>  drivers/gpu/drm/panthor/panthor_fw.c     |    6 +
>  drivers/gpu/drm/panthor/panthor_fw.h     |    9 +-
>  drivers/gpu/drm/panthor/panthor_perf.c   | 1940 ++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_perf.h   |   40 +
>  include/uapi/drm/panthor_drm.h           |  546 ++++++
>  9 files changed, 2712 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_perf.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_perf.h
>
> --
> 2.33.0.dirty
