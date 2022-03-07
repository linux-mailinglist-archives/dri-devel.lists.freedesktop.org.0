Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5474D0367
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B5A410E03A;
	Mon,  7 Mar 2022 15:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0049210E03A;
 Mon,  7 Mar 2022 15:50:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8ED4FB80CA8;
 Mon,  7 Mar 2022 15:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C24CC340EB;
 Mon,  7 Mar 2022 15:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646668214;
 bh=kOQrIB//kV8fsU32x9w7qLTU4u76ufnPafjP+aW2LGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xn3UfVQig7siysNhTckqEt/3YwfSb/hQX777ZeUBNR25CWtPmBg3AozCiz0C9Vx6e
 vI0+ZBFRrmaTJtZfVDBV/wXr9kndWweVAzDmNxzcrOpxEk6sb14183+qU7UsuGoPyD
 BJdWxk6dfqo2i8LIPODB/uTqA5n5E/QX1Oc7iq5pAYpzAleGc7lc3aIGfn/PwB89lT
 Ot8o/PrK/bdSm0BXhzDWSnMhi1VaTaPkbIEK8WSygHQZnXIc+PUDkiS/iC31zhENiH
 FHocAoA6uueu5ukIdmZ08K5KjK1lXb4Pte/4tQ3FvPFI29pSDVfw1hXJlmCJ0ZynWA
 ECBe+IItixYgw==
Date: Mon, 7 Mar 2022 17:49:33 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC 0/3] MAP_POPULATE for device memory
Message-ID: <YiYpjdD8BYcoGQ4s@iki.fi>
References: <20220306053211.135762-1-jarkko@kernel.org>
 <d6b09f23-f470-c119-8d3e-7d72a3448b64@redhat.com>
 <YiYVHTkS8IsMMw6T@iki.fi>
 <dab25b2d-88f1-7ad5-c28a-15a97b38af03@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dab25b2d-88f1-7ad5-c28a-15a97b38af03@redhat.com>
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
Cc: Michal Hocko <mhocko@suse.com>, zhangyiru <zhangyiru3@huawei.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linux-mm@kvack.org,
 Jason Ekstrand <jason@jlekstrand.net>,
 Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-unionfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Matthew Auld <matthew.auld@intel.com>,
 Vasily Averin <vvs@virtuozzo.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>,
 Reinette Chatre <reinette.chatre@intel.com>, linux-sgx@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nathaniel McCallum <nathaniel@profian.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexey Gladkov <legion@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 03:33:52PM +0100, David Hildenbrand wrote:
> On 07.03.22 15:22, Jarkko Sakkinen wrote:
> > On Mon, Mar 07, 2022 at 11:12:44AM +0100, David Hildenbrand wrote:
> >> On 06.03.22 06:32, Jarkko Sakkinen wrote:
> >>> For device memory (aka VM_IO | VM_PFNMAP) MAP_POPULATE does nothing. Allow
> >>> to use that for initializing the device memory by providing a new callback
> >>> f_ops->populate() for the purpose.
> >>>
> >>> SGX patches are provided to show the callback in context.
> >>>
> >>> An obvious alternative is a ioctl but it is less elegant and requires
> >>> two syscalls (mmap + ioctl) per memory range, instead of just one
> >>> (mmap).
> >>
> >> What about extending MADV_POPULATE_READ | MADV_POPULATE_WRITE to support
> >> VM_IO | VM_PFNMAP (as well?) ?
> > 
> > What would be a proper point to bind that behaviour? For mmap/mprotect it'd
> > be probably populate_vma_page_range() because that would span both mmap()
> > and mprotect() (Dave's suggestion in this thread).
> 
> MADV_POPULATE_* ends up in faultin_vma_page_range(), right next to
> populate_vma_page_range(). So it might require a similar way to hook
> into the driver I guess.
> 
> > 
> > For MAP_POPULATE I did not have hard proof to show that it would be used
> > by other drivers but for madvice() you can find at least a few ioctl
> > based implementations:
> > 
> > $ git grep -e madv --and \( -e ioc \)  drivers/
> > drivers/gpu/drm/i915/gem/i915_gem_ioctls.h:int i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
> > drivers/gpu/drm/i915/i915_driver.c:     DRM_IOCTL_DEF_DRV(I915_GEM_MADVISE, i915_gem_madvise_ioctl, DRM_RENDER_ALLOW),
> > drivers/gpu/drm/i915/i915_gem.c:i915_gem_madvise_ioctl(struct drm_device *dev, void *data,
> > drivers/gpu/drm/msm/msm_drv.c:static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
> > drivers/gpu/drm/msm/msm_drv.c:  DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
> > drivers/gpu/drm/panfrost/panfrost_drv.c:static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
> > drivers/gpu/drm/vc4/vc4_drv.c:  DRM_IOCTL_DEF_DRV(VC4_GEM_MADVISE, vc4_gem_madvise_ioctl, DRM_RENDER_ALLOW),
> > drivers/gpu/drm/vc4/vc4_drv.h:int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
> > drivers/gpu/drm/vc4/vc4_gem.c:int vc4_gem_madvise_ioctl(struct drm_device *dev, void *data,
> > 
> > IMHO this also provides supportive claim for MAP_POPULATE, and yeah, I
> > agree that to be consistent implementation, both madvice() and MAP_POPULATE
> > should work.
> 
> MADV_POPULATE_WRITE + MADV_DONTNEED/FALLOC_FL_PUNCH_HOLE is one way to
> dynamically manage memory consumption inside a sparse memory mapping
> (preallocate/populate via MADV_POPULATE_WRITE, discard via
> MADV_DONTNEED/FALLOC_FL_PUNCH_HOLE).  Extending that whole mechanism to
> deal with VM_IO | VM_PFNMAP mappings as well could be interesting.
> 
> At least I herd about some ideas where we might want to dynamically
> expose memory to a VM (via virtio-mem) inside a sparse memory mapping,
> and the memory in that sparse memory mapping is provided from a
> dedicated memory pool managed by a device driver -- not just using
> ordinary anonymous/file/hugetlb memory as we do right now.
> 
> Now, this is certainly stuff for the future, I just wanted to mention it.

For SGX purposes I'm now studying the possibly to use ra_state to get
idea where do "prefetching" (EAUG's) in batches, as it is something
that would not require any intrusive changes to mm but thank you for
sharing this. Looking into implementing this properly is the 2nd option,
if that does not work out.

> -- 
> Thanks,
> 
> David / dhildenb

BR, Jarkko
