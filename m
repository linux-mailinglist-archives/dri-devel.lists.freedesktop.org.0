Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581E4BBFFD
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 19:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6559D10E7CE;
	Fri, 18 Feb 2022 18:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D4310E75B;
 Fri, 18 Feb 2022 18:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645210530; x=1676746530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=A/pt0JouG2A35RjAzS61fMx6Y80ODkG2+c2DnZHED/8=;
 b=EGx13HkNH73r6iDypX1icXNUi0i/HuISX2UzrUKCBVrDtniHapsjEJdM
 0U7rDyIt/RftRF2JQryeBjxFXmgKRS5h/UXi03EJzgjVjgtdcw4P0eDjP
 kerWkODWT9QTvqpqUvUOmyjhSdsYOBiUjinnO5VLs3CeNOJlyNyvopm+O
 IeNA22NBf4f7SvfD7w+Iv6QyzVyixHKpeONVycRXQD1BLXbWbp5CovA/F
 nDFXuylKg9zG8qbrDFRgFUVThPGKtMcrgxG/LrlxJKDa1Uc0DaxVeLpcd
 yAxDPOyuisDHKoQaiODMtq7kh3oVuL23RcahH6IBW+ExO6nNeJpMO6Vh0 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="238594527"
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="238594527"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 10:55:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,379,1635231600"; d="scan'208";a="637830201"
Received: from ramaling-i9x.iind.intel.com (HELO intel.com) ([10.203.144.108])
 by orsmga004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 10:55:25 -0800
Date: Sat, 19 Feb 2022 00:25:40 +0530
From: Ramalingam C <ramalingam.c@intel.com>
To: Robert Beckett <bob.beckett@collabora.com>
Subject: Re: [PATCH v8 5/5] drm/i915/uapi: document behaviour for DG2 64K
 support
Message-ID: <20220218185540.GA7762@intel.com>
References: <20220208203419.1094362-1-bob.beckett@collabora.com>
 <20220208203419.1094362-6-bob.beckett@collabora.com>
 <87ee40ojpc.fsf@jljusten-skl> <20220218134735.GB3646@intel.com>
 <78df4b73-9b2d-670b-a6b0-a45b476f1f0a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78df4b73-9b2d-670b-a6b0-a45b476f1f0a@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Tony Ye <tony.ye@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Jordan Justen <jordan.l.justen@intel.com>,
 intel-gfx@lists.freedesktop.org, Kenneth Graunke <kenneth@whitecape.org>,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 mesa-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-18 at 18:06:00 +0000, Robert Beckett wrote:
> 
> 
> On 18/02/2022 13:47, Ramalingam C wrote:
> > On 2022-02-17 at 20:57:35 -0800, Jordan Justen wrote:
> > > Robert Beckett <bob.beckett@collabora.com> writes:
> > > 
> > > > From: Matthew Auld <matthew.auld@intel.com>
> > > > 
> > > > On discrete platforms like DG2, we need to support a minimum page size
> > > > of 64K when dealing with device local-memory. This is quite tricky for
> > > > various reasons, so try to document the new implicit uapi for this.
> > > > 
> > > > v3: fix typos and less emphasis
> > > > v2: Fixed suggestions on formatting [Daniel]
> > > > 
> > > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > > Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> > > > Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> > > > Acked-by: Jordan Justen <jordan.l.justen@intel.com>
> > > > Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
> > > > Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > cc: Simon Ser <contact@emersion.fr>
> > > > cc: Pekka Paalanen <ppaalanen@gmail.com>
> > > > Cc: Jordan Justen <jordan.l.justen@intel.com>
> > > > Cc: Kenneth Graunke <kenneth@whitecape.org>
> > > > Cc: mesa-dev@lists.freedesktop.org
> > > > Cc: Tony Ye <tony.ye@intel.com>
> > > > Cc: Slawomir Milczarek <slawomir.milczarek@intel.com>
> > > > ---
> > > >   include/uapi/drm/i915_drm.h | 44 ++++++++++++++++++++++++++++++++-----
> > > >   1 file changed, 39 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > > > index 5e678917da70..77e5e74c32c1 100644
> > > > --- a/include/uapi/drm/i915_drm.h
> > > > +++ b/include/uapi/drm/i915_drm.h
> > > > @@ -1118,10 +1118,16 @@ struct drm_i915_gem_exec_object2 {
> > > >   	/**
> > > >   	 * When the EXEC_OBJECT_PINNED flag is specified this is populated by
> > > >   	 * the user with the GTT offset at which this object will be pinned.
> > > > +	 *
> > > >   	 * When the I915_EXEC_NO_RELOC flag is specified this must contain the
> > > >   	 * presumed_offset of the object.
> > > > +	 *
> > > >   	 * During execbuffer2 the kernel populates it with the value of the
> > > >   	 * current GTT offset of the object, for future presumed_offset writes.
> > > > +	 *
> > > > +	 * See struct drm_i915_gem_create_ext for the rules when dealing with
> > > > +	 * alignment restrictions with I915_MEMORY_CLASS_DEVICE, on devices with
> > > > +	 * minimum page sizes, like DG2.
> > > >   	 */
> > > >   	__u64 offset;
> > > > @@ -3145,11 +3151,39 @@ struct drm_i915_gem_create_ext {
> > > >   	 *
> > > >   	 * The (page-aligned) allocated size for the object will be returned.
> > > >   	 *
> > > > -	 * Note that for some devices we have might have further minimum
> > > > -	 * page-size restrictions(larger than 4K), like for device local-memory.
> > > > -	 * However in general the final size here should always reflect any
> > > > -	 * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REGIONS
> > > > -	 * extension to place the object in device local-memory.
> > > > +	 *
> > > > +	 * DG2 64K min page size implications:
> > > > +	 *
> > > > +	 * On discrete platforms, starting from DG2, we have to contend with GTT
> > > > +	 * page size restrictions when dealing with I915_MEMORY_CLASS_DEVICE
> > > > +	 * objects.  Specifically the hardware only supports 64K or larger GTT
> > > > +	 * page sizes for such memory. The kernel will already ensure that all
> > > > +	 * I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger page
> > > > +	 * sizes underneath.
> > > > +	 *
> > > > +	 * Note that the returned size here will always reflect any required
> > > > +	 * rounding up done by the kernel, i.e 4K will now become 64K on devices
> > > > +	 * such as DG2.
> > > > +	 *
> > > > +	 * Special DG2 GTT address alignment requirement:
> > > > +	 *
> > > > +	 * The GTT alignment will also need to be at least 2M for such objects.
> > > > +	 *
> > > > +	 * Note that due to how the hardware implements 64K GTT page support, we
> > > > +	 * have some further complications:
> > > > +	 *
> > > > +	 *   1) The entire PDE (which covers a 2MB virtual address range), must
> > > > +	 *   contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same
> > > > +	 *   PDE is forbidden by the hardware.
> > > > +	 *
> > > > +	 *   2) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
> > > > +	 *   objects.
> > > > +	 *
> > > > +	 * To keep things simple for userland, we mandate that any GTT mappings
> > > > +	 * must be aligned to and rounded up to 2MB.
> > > 
> > > Could I get a clarification about this "rounded up" part.
> > > 
> > > Currently Mesa is aligning the start of each and every buffer VMA to be
> > > 2MiB aligned. But, we are *not* taking any steps to "round up" the size
> > > of buffers to 2MiB alignment.
> > > 
> > > Bob's Mesa MR from a while ago,
> > > 
> > > https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14599
> > > 
> > > was trying to add this "round up" size for buffers. We didn't accept
> > > this MR because we thought if we have ensured that no other buffer will
> > > use the same 2MiB VMA range, then it should not be required.
> > > 
> > > If what we are doing is ok, then maybe this "round up" language should
> > > be dropped? Or, perhaps the "round up" mentioned here isn't implying we
> > > must align the size of buffers that we create, and I'm misinterpreting
> > > this.
> > Jordan,
> > 
> > as per my understanding this size rounding up to 2MB is for the VMA mapping,
> > not for the buffer size.
> correct, only the vma is rounded up
> 
> > 
> > Even if we drop this rounding up of vma size to 2MB but align the VMA
> > start to 2MB address then also this should be fine. Becasue the remaining of the
> > last PDE(2MB) will never be used for any other GTT mapping as the
> > starting addr wont align to 2MB.
> The kernel has to handle 4K pages also, which could in theory attempt to be
> placed in any remaining space within a 2MB region, which is not supported.
> For this reason, the kernel rounds up the vma to next 2MB to ensure no 4K
> pages can treat the remaining space as a candidate for placement.
> 
> For mesa, this is not required as they only ever use 2MB alignment for all
> buffers, hence the denial of the mesa mr.
> 
> Internally, the kernel will still round up the vma reservations to prevent
> any kernel 4K buffers being situated in remaining space.
> 
> If desired, we can make the wording clearer, maybe something like:
> 
> "To keep things simple for userland, we mandate that any GTT mappings
> must be aligned to 2MB. The kernel will internally pad them out to the next
> 2MB boundary"

Added the extra information in next version @ https://patchwork.freedesktop.org/patch/475166/?series=100419&rev=1

Jordan, hope this explanation clears your doubt.

Ram.
> 
> 
> > 
> > Bob, Is the above understanding is right? if so could we drop the
> > requirement of mapping the vma size to 2MB?
> > 
> > Ram
> > > 
> > > -Jordan
> > > 
> > > > As this only wastes virtual
> > > > +	 * address space and avoids userland having to copy any needlessly
> > > > +	 * complicated PDE sharing scheme (coloring) and only affects DG2, this
> > > > +	 * is deemed to be a good compromise.
> > > >   	 */
> > > >   	__u64 size;
> > > >   	/**
> > > > -- 
> > > > 2.25.1
