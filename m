Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA49E42C1AF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 15:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CDA6E063;
	Wed, 13 Oct 2021 13:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1B56E063
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 13:47:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u18so8685789wrg.5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YZh8AhTGxGeYNvwzNhyFBnxSWOoBOzTeWfFnP+fKct8=;
 b=U4EwWlAcU/EVqIS3dui60Kf6v/hExcHAvu7XT5Su4o0SxU0G2CYsvT/RWgvJxm2zhU
 Tha/FFeMab/KWTrN3FOx9ShBBJpRPCH+dWviO1zYz6Od2kaq0kJUuWDEp8gLQT1IlJSh
 /yRUC9ew+VINXEWca2McdsA5FwEUjB3C5U+JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YZh8AhTGxGeYNvwzNhyFBnxSWOoBOzTeWfFnP+fKct8=;
 b=re/6GKg/RuSYdQEh9SJylstyv8xMJuUj4UaJByFM6hUxKgK4IgA9RRnXhWY3IgWv07
 DZAshDIUqSBJ/TxzEBbpy8OzmPoIshk5rrPESYZjZB+Wo9rtFa9yOwg+udYTc3T7+tD7
 UIsGqyp0WNm1VjZiWOsT1UWFnQcDMIkDqBO6cgmwaRFByQlh1gnB5HDS9g9QpMPM3J6h
 yW2X2q3QyGZPBkuXPs0QGu03OMTaLB1MeTH0KHXaf3uCKIl8AM3MHv0JWrffSWSWNgVm
 KDPc6zI/LDESV3KgwCrEL7FPh81evlSautWH359V+xxqmFkDcfGv1npdRTrOIWPKKkWD
 eWMA==
X-Gm-Message-State: AOAM533ns2w2b1nYB77PdtPKu9UdK88umlV7ipOzrz2aMPO1Tt6yXEc0
 GE4Oxm0RU4+7G6Ddpo/FLJeGNg==
X-Google-Smtp-Source: ABdhPJwYdwGKVCTfVGjxohAuBriYpdEp/xfbKwbxwvKqZrc6EE8y+yeUpSM3FiIyOncZtZsgkgGrJw==
X-Received: by 2002:a1c:9dd1:: with SMTP id g200mr12885124wme.42.1634132820685; 
 Wed, 13 Oct 2021 06:47:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c17sm5194106wmr.15.2021.10.13.06.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 06:47:00 -0700 (PDT)
Date: Wed, 13 Oct 2021 15:46:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ramalingam C <ramalingam.c@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>, CQ Tang <cq.tang@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>
Subject: Re: [PATCH 13/14] drm/i915/uapi: document behaviour for DG2 64K
 support
Message-ID: <YWbjUv3LHyCRQ1xS@phenom.ffwll.local>
References: <20211011161155.6397-1-ramalingam.c@intel.com>
 <20211011161155.6397-14-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011161155.6397-14-ramalingam.c@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Mon, Oct 11, 2021 at 09:41:54PM +0530, Ramalingam C wrote:
> From: Matthew Auld <matthew.auld@intel.com>
> 
> On discrete platforms like DG2, we need to support a minimum page size
> of 64K when dealing with device local-memory. This is quite tricky for
> various reasons, so try to document the new implicit uapi for this.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  include/uapi/drm/i915_drm.h | 61 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 56 insertions(+), 5 deletions(-)
> 
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index aa2a7eccfb94..d62e8b7ed8b6 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -1118,10 +1118,16 @@ struct drm_i915_gem_exec_object2 {
>  	/**
>  	 * When the EXEC_OBJECT_PINNED flag is specified this is populated by
>  	 * the user with the GTT offset at which this object will be pinned.
> +	 *
>  	 * When the I915_EXEC_NO_RELOC flag is specified this must contain the
>  	 * presumed_offset of the object.
> +	 *
>  	 * During execbuffer2 the kernel populates it with the value of the
>  	 * current GTT offset of the object, for future presumed_offset writes.
> +	 *
> +	 * See struct drm_i915_gem_create_ext for the rules when dealing with
> +	 * alignment restrictions with I915_MEMORY_CLASS_DEVICE, on devices with
> +	 * minimum page sizes, like DG2.
>  	 */
>  	__u64 offset;
>  
> @@ -3001,11 +3007,56 @@ struct drm_i915_gem_create_ext {
>  	 *

I think a heading here (or a bit earlier) about Page alignment would be
good. Just mark it up as bold or something (since real sphinx headings
won't work).

>  	 * The (page-aligned) allocated size for the object will be returned.
>  	 *
> -	 * Note that for some devices we have might have further minimum
> -	 * page-size restrictions(larger than 4K), like for device local-memory.
> -	 * However in general the final size here should always reflect any
> -	 * rounding up, if for example using the I915_GEM_CREATE_EXT_MEMORY_REGIONS
> -	 * extension to place the object in device local-memory.
> +	 * On discrete platforms, starting from DG2, we have to contend with GTT
> +	 * page size restrictions when dealing with I915_MEMORY_CLASS_DEVICE
> +	 * objects.  Specifically the hardware only supports 64K or larger GTT
> +	 * page sizes for such memory. The kernel will already ensure that all
> +	 * I915_MEMORY_CLASS_DEVICE memory is allocated using 64K or larger page
> +	 * sizes underneath.
> +	 *
> +	 * Note that the returned size here will always reflect any required
> +	 * rounding up done by the kernel, i.e 4K will now become 64K on devices
> +	 * such as DG2. The GTT alignment will also need be at least 64K for
> +	 * such objects.
> +	 *

I think here we should have a "Special DG2 placement restrictions" heading
for clarity

> +	 * Note that due to how the hardware implements 64K GTT page support, we
> +	 * have some further complications:
> +	 *
> +	 *   1.) The entire PDE(which covers a 2M virtual address range), must

Does this really format into a nice list in the html output? Also not both
. and ), usually in text it's just )

> +	 *   contain only 64K PTEs, i.e mixing 4K and 64K PTEs in the same
> +	 *   PDE is forbidden by the hardware.
> +	 *
> +	 *   2.) We still need to support 4K PTEs for I915_MEMORY_CLASS_SYSTEM
> +	 *   objects.
> +	 *
> +	 * To handle the above the kernel implements a memory coloring scheme to
> +	 * prevent userspace from mixing I915_MEMORY_CLASS_DEVICE and
> +	 * I915_MEMORY_CLASS_SYSTEM objects in the same PDE. If the kernel is
> +	 * ever unable to evict the required pages for the given PDE(different
> +	 * color) when inserting the object into the GTT then it will simply
> +	 * fail the request.
> +	 *
> +	 * Since userspace needs to manage the GTT address space themselves,
> +	 * special care is needed to ensure this doesn't happen. The simplest
> +	 * scheme is to simply align and round up all I915_MEMORY_CLASS_DEVICE
> +	 * objects to 2M, which avoids any issues here. At the very least this
> +	 * is likely needed for objects that can be placed in both
> +	 * I915_MEMORY_CLASS_DEVICE and I915_MEMORY_CLASS_SYSTEM, to avoid
> +	 * potential issues when the kernel needs to migrate the object behind
> +	 * the scenes, since that might also involve evicting other objects.
> +	 *
> +	 * To summarise the GTT rules, on platforms like DG2:
> +	 *
> +	 *   1.) All objects that can be placed in I915_MEMORY_CLASS_DEVICE must
> +	 *   have 64K alignment. The kernel will reject this otherwise.
> +	 *
> +	 *   2.) All I915_MEMORY_CLASS_DEVICE objects must never be placed in
> +	 *   the same PDE with other I915_MEMORY_CLASS_SYSTEM objects. The
> +	 *   kernel will reject this otherwise.
> +	 *
> +	 *   3.) Objects that can be placed in both I915_MEMORY_CLASS_DEVICE and
> +	 *   I915_MEMORY_CLASS_SYSTEM should probably be aligned and padded out
> +	 *   to 2M.

I think this is good for the 64k side of things. Ofc the patch needs as
many acks as you can get, so please cc all the userspace people you can
get hold of (Jason, Ken on the mesa side, plus media and compute people
too).

>  	 */
>  	__u64 size;
>  	/**
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
