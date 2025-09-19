Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2147B89369
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 13:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DB010E996;
	Fri, 19 Sep 2025 11:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="L/j5DNx6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0107E10E98B;
 Fri, 19 Sep 2025 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7IAnsxZjH5AhBJ/tfYhtdLrenrS33yCd6ZMl51qI+Nk=; b=L/j5DNx6AWdvT0FlzORjKGkjTA
 oL4SJ9QjArw4uxAdFvmAEFtkBbMIVCAumtYWbxSJKW4gEh4Bxqh+7kmSfC8++euchHKon8xbUIy96
 BzdDtMsYN9WfDOdMPEuEFvqzSnboGWeg68JtvGrytlT5DlkDnbqEBiVGNixkurpqIJoskcCQiqIEC
 Z/suW+dy6X18IxjTgU2Mbo3boSl0EGg0P5FBxETSN5qSMA2u/xQlEJFQoRv1VOdyIFcM+tqTIRdZW
 3gdYlWxtbNVi6VpggaaE+nX3owigyKFgMOQ2ZCYEAO2TKs2a58z9AYnlHKZ0Lkwmi6105qwIZahRs
 JHa4kY+A==;
Received: from 179-125-87-227-dinamico.pombonet.net.br ([179.125.87.227]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uzZ3M-00E3o4-CX; Fri, 19 Sep 2025 13:13:24 +0200
Date: Fri, 19 Sep 2025 08:13:15 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel.daenzer@mailbox.org>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH RFC v2 0/3] drm/ttm: allow direct reclaim to be skipped
Message-ID: <aM06y7MP6LzHMBK7@quatroqueijos.cascardo.eti.br>
References: <20250918-ttm_pool_no_direct_reclaim-v2-0-135294e1f8a2@igalia.com>
 <6f92ff06-04c3-440b-becb-50a7693ecc39@amd.com>
 <67c83b24-01b6-4633-8645-52dc746c32e2@igalia.com>
 <96c117bc-389f-42d9-952e-894768aad780@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96c117bc-389f-42d9-952e-894768aad780@amd.com>
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

On Fri, Sep 19, 2025 at 10:01:26AM +0200, Christian König wrote:
> On 19.09.25 09:43, Tvrtko Ursulin wrote:
> > On 19/09/2025 07:46, Christian König wrote:
> >> On 18.09.25 22:09, Thadeu Lima de Souza Cascardo wrote:
> >>> On certain workloads, like on ChromeOS when opening multiple tabs and
> >>> windows, and switching desktops, memory pressure can build up and latency
> >>> is observed as high order allocations result in memory reclaim. This was
> >>> observed when running on an amdgpu.
> >>>
> >>> This is caused by TTM pool allocations and turning off direct reclaim when
> >>> doing those higher order allocations leads to lower memory pressure.
> >>>
> >>> Since turning direct reclaim off might also lead to lower throughput,
> >>> make it tunable, both as a module parameter that can be changed in sysfs
> >>> and as a flag when allocating a GEM object.
> >>>
> >>> A latency option will avoid direct reclaim for higher order allocations.
> >>>
> >>> The throughput option could be later used to more agressively compact pages
> >>> or reclaim, by not using __GFP_NORETRY.
> >>
> >> Well I can only repeat it, at least for amdgpu that is a clear NAK from my side to this.
> >>
> >> The behavior to allocate huge pages is a must have for the driver.
> > 
> > Disclaimer that I wouldn't go system-wide but per device - so somewhere in sysfs rather than a modparam. That kind of a toggle would not sound problematic to me since it leaves the policy outside the kernel and allows people to tune to their liking.
> 
> Yeah I've also wrote before when that is somehow beneficial for nouveau (for example) then I don't have any problem with making the policy device dependent.
> 
> But for amdgpu we have so many so bad experiences with this approach that I absolutely can't accept that.

The mechanism here allows it to be set per device. I even considered that
as a patch in the RFC, but I opted to get it out sooner so we could have
this discussion.

> 
> > One side question thought - does AMD benefit from larger than 2MiB contiguous blocks? IIUC the maximum PTE is 2MiB so maybe not? In which case it may make sense to add some TTM API letting drivers tell the pool allocator what is the maximum order to bother with. Larger than that may have diminishing benefit for the disproportionate pressure on the memory allocator and reclaim.
> 
> Using 1GiB allocations would allow for the page tables to skip another layer on AMD GPUs, but the most benefit is between 4kiB and 2MiB since that can be handled more efficiently by the L1. Having 2MiB allocations then also has an additional benefit for L2.
> 
> Apart from performance for AMD GPUs there are also some HW features which only work with huge pages, e.g. on some laptops you can get for example flickering on the display if the scanout buffer is back by to many small pages.
> 
> NVidia used to work on 1GiB allocations which as far as I know was the kickoff for the whole ongoing switch to using folios instead of pages. And from reading public available documentation I have the impression that NVidia GPUs works more or less the same as AMD GPUs regarding the TLB.
> 
> Another alternative would be that we add a WARN_ONCE() when we have to fallback to lower order pages, but that wouldn't help the end user either. It just makes it more obvious that you need more memory for a specific use case without triggering the OOM killer.
> 
> Regards,
> Christian.
> 
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> >> The alternative I can offer is to disable the fallback which in your case would trigger the OOM killer.
> >>

Warning could be as simple as removing __GFP_NOWARN. But I don't think we
want either a warning or to trigger the OOM killer when allocating lower
order pages are still possible. That will already happen when we get to 0
order pages, where there is no fallback available anymore, and, then, it
makes sense to try harder and warn if no page can be allocated.

Under my current workload, the balance skews torwards 0-order pages,
reducing the amount of 10 and 9 order pages to half, when comparing runs
with direct reclaim and without direct reclaim. So, I understand your
concern in respect to the impact on the GPU TLB and potential flickering.
Is there a way we can measure it on the devices we are using? And, then, if
it does not show to be a problem on those devices, would making this be a
setting per-device be acceptable to you? In a way that we could have in
userspace a list of devices where it is okay to prefer not to reclaim over
getting huge pages and that could be set if the workload prefers lower
latency in those allocations?

Thanks.
Cascardo.

> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Other drivers can later opt to use this mechanism too.
> >>>
> >>> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> >>> ---
> >>> Changes in v2:
> >>> - Make disabling direct reclaim an option.
> >>> - Link to v1: https://lore.kernel.org/r/20250910-ttm_pool_no_direct_reclaim-v1-1-53b0fa7f80fa@igalia.com
> >>>
> >>> ---
> >>> Thadeu Lima de Souza Cascardo (3):
> >>>        ttm: pool: allow requests to prefer latency over throughput
> >>>        ttm: pool: add a module parameter to set latency preference
> >>>        drm/amdgpu: allow allocation preferences when creating GEM object
> >>>
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  3 ++-
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  3 ++-
> >>>   drivers/gpu/drm/ttm/ttm_pool.c             | 23 +++++++++++++++++------
> >>>   drivers/gpu/drm/ttm/ttm_tt.c               |  2 +-
> >>>   include/drm/ttm/ttm_bo.h                   |  5 +++++
> >>>   include/drm/ttm/ttm_pool.h                 |  2 +-
> >>>   include/drm/ttm/ttm_tt.h                   |  2 +-
> >>>   include/uapi/drm/amdgpu_drm.h              |  9 +++++++++
> >>>   8 files changed, 38 insertions(+), 11 deletions(-)
> >>> ---
> >>> base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
> >>> change-id: 20250909-ttm_pool_no_direct_reclaim-ee0807a2d3fe
> >>>
> >>> Best regards,
> >>
> > 
> 
