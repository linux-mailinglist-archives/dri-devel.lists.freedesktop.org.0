Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFC23D9E1C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 09:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6526E1CF;
	Thu, 29 Jul 2021 07:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FDD6E1CF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 07:11:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id m19so3045690wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 00:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=3y+rd16FIAwV1gZA2SS3F1VzULWO1rpe8pBLQ2gKUyo=;
 b=ANsU4iQ/yjb5VFAyX8+nEREwn2v7Lb3Y/wdnS/YG4DbakDWwBNRx5ZQB0vG2fewWQC
 kChJnmTG5rWUUH0cH67Ms+TczS6Ts+WcMqvePQ5/QS3UPLJd42321zEq3Bk9D/DOQsy/
 6tqGPYgD/HfuACJ85gLU9UZq3ovpBrCTbzufA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=3y+rd16FIAwV1gZA2SS3F1VzULWO1rpe8pBLQ2gKUyo=;
 b=oznKPfL3h90nN1DOAicjNJKx+Mgrl8OgfOoAlvlm8N2m1s+GlywQ7oXH2LSA7DtIEb
 M6TODr8BxbY9lUXpVarJr/VPe4lu9Z/yuP8PAI5tIzbMF/GX1fw9kw3XVhjvFlQMWb3x
 QZC1Z/22/oZIVKIaZJ7NMDest0jT5X0gZI8Y7t0k1PqE6gKj6pBIL8Bj+7c5B02bpfjy
 vaeqd4i1v8UAuptQfkqUd5cEpgfFlH455+Q8Ex3p2DLuLpykoGnnRzDriKOj8QO/posZ
 U0TIM0eTBiV9xR7i9z1kbALlWiowGvq9oTDgcpkbzMhRTfQN2IcaciLxbziDCyt2yirk
 hquA==
X-Gm-Message-State: AOAM530ozHNM90BPoB0fdVyeV0jNyHRsyTgRV7Py0jZFL0keUazD+P4L
 /zAVyrZnompg9PcEYoraq6WLVg==
X-Google-Smtp-Source: ABdhPJxLr0OBEoejmsUerzksLGpaprHZctldHFct1NLhiFhqmdELFgnPVAEW6DegMRc0BcNIW6LaWw==
X-Received: by 2002:a05:600c:3554:: with SMTP id
 i20mr3314432wmq.68.1627542716912; 
 Thu, 29 Jul 2021 00:11:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r17sm7695700wmq.13.2021.07.29.00.11.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 00:11:56 -0700 (PDT)
Date: Thu, 29 Jul 2021 09:11:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v3] drm: clarify usage of drm leases
Message-ID: <YQJUuh2f0FbL/Mac@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210728102739.441543-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210728102739.441543-1-desmondcheongzx@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: corbet@lwn.net, airlied@linux.ie, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 28, 2021 at 06:27:39PM +0800, Desmond Cheong Zhi Xi wrote:
> We make the following changes to the documentation of drm leases to
> make it easier to reason about their usage. In particular, we clarify
> the lifetime and locking rules of lease fields in drm_master:
> 
> 1. Make it clear that &drm_device.mode_config.idr_mutex protects the
> lease idr and list structures for drm_master. The lessor field itself
> doesn't need to be protected as it doesn't change after it's set in
> drm_lease_create.
> 
> 2. Add descriptions for the lifetime of lessors and leases.
> 
> 3. Add an overview DOC: section in drm-uapi.rst that defines the
> terminology for drm leasing, and explains how leases work and why
> they're used.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Pushed to drm-misc-next.
-Daniel

> ---
> 
> v2 -> v3 (suggestions from Daniel Vetter):
> - Clarified that device owners are changed through SETMASTER or
> DROPMASTER IOCTL.
> - Removed unneccessary includes for drm_lease.[hc] and kerneldoc
> formatting changes.
> 
> v1 -> v2 (suggestions from Daniel Vetter):
> - Clarified description of lease fields in drm_master.
> - Added an overview DOC: section for drm leases in drm-uapi.rst.
> - Cleaned up function documentation in drm_lease.c to use kernel-doc formatting.
> 
>  Documentation/gpu/drm-uapi.rst |  9 +++++
>  drivers/gpu/drm/drm_lease.c    | 51 ++++++++++++++++++++++++++
>  include/drm/drm_auth.h         | 67 ++++++++++++++++++++++++++++------
>  3 files changed, 116 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 7e51dd40bf6e..199afb503ab1 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -37,6 +37,15 @@ Primary Nodes, DRM Master and Authentication
>  .. kernel-doc:: include/drm/drm_auth.h
>     :internal:
>  
> +
> +.. _drm_leasing:
> +
> +DRM Display Resource Leasing
> +============================
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_lease.c
> +   :doc: drm leasing
> +
>  Open-Source Userspace Requirements
>  ==================================
>  
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index 92eac73d9001..79be797e8689 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -15,6 +15,57 @@
>  #include "drm_crtc_internal.h"
>  #include "drm_internal.h"
>  
> +/**
> + * DOC: drm leasing
> + *
> + * DRM leases provide information about whether a DRM master may control a DRM
> + * mode setting object. This enables the creation of multiple DRM masters that
> + * manage subsets of display resources.
> + *
> + * The original DRM master of a device 'owns' the available drm resources. It
> + * may create additional DRM masters and 'lease' resources which it controls
> + * to the new DRM master. This gives the new DRM master control over the
> + * leased resources until the owner revokes the lease, or the new DRM master
> + * is closed. Some helpful terminology:
> + *
> + * - An 'owner' is a &struct drm_master that is not leasing objects from
> + *   another &struct drm_master, and hence 'owns' the objects. The owner can be
> + *   identified as the &struct drm_master for which &drm_master.lessor is NULL.
> + *
> + * - A 'lessor' is a &struct drm_master which is leasing objects to one or more
> + *   other &struct drm_master. Currently, lessees are not allowed to
> + *   create sub-leases, hence the lessor is the same as the owner.
> + *
> + * - A 'lessee' is a &struct drm_master which is leasing objects from some
> + *   other &struct drm_master. Each lessee only leases resources from a single
> + *   lessor recorded in &drm_master.lessor, and holds the set of objects that
> + *   it is leasing in &drm_master.leases.
> + *
> + * - A 'lease' is a contract between the lessor and lessee that identifies
> + *   which resources may be controlled by the lessee. All of the resources
> + *   that are leased must be owned by or leased to the lessor, and lessors are
> + *   not permitted to lease the same object to multiple lessees.
> + *
> + * The set of objects any &struct drm_master 'controls' is limited to the set
> + * of objects it leases (for lessees) or all objects (for owners).
> + *
> + * Objects not controlled by a &struct drm_master cannot be modified through
> + * the various state manipulating ioctls, and any state reported back to user
> + * space will be edited to make them appear idle and/or unusable. For
> + * instance, connectors always report 'disconnected', while encoders
> + * report no possible crtcs or clones.
> + *
> + * Since each lessee may lease objects from a single lessor, display resource
> + * leases form a tree of &struct drm_master. As lessees are currently not
> + * allowed to create sub-leases, the tree depth is limited to 1. All of
> + * these get activated simultaneously when the top level device owner changes
> + * through the SETMASTER or DROPMASTER IOCTL, so &drm_device.master points to
> + * the owner at the top of the lease tree (i.e. the &struct drm_master for which
> + * &drm_master.lessor is NULL). The full list of lessees that are leasing
> + * objects from the owner can be searched via the owner's
> + * &drm_master.lessee_idr.
> + */
> +
>  #define drm_for_each_lessee(lessee, lessor) \
>  	list_for_each_entry((lessee), &(lessor)->lessees, lessee_list)
>  
> diff --git a/include/drm/drm_auth.h b/include/drm/drm_auth.h
> index f99d3417f304..ba248ca8866f 100644
> --- a/include/drm/drm_auth.h
> +++ b/include/drm/drm_auth.h
> @@ -58,12 +58,6 @@ struct drm_lock_data {
>   * @refcount: Refcount for this master object.
>   * @dev: Link back to the DRM device
>   * @driver_priv: Pointer to driver-private information.
> - * @lessor: Lease holder
> - * @lessee_id: id for lessees. Owners always have id 0
> - * @lessee_list: other lessees of the same master
> - * @lessees: drm_masters leasing from this one
> - * @leases: Objects leased to this drm_master.
> - * @lessee_idr: All lessees under this owner (only used where lessor == NULL)
>   *
>   * Note that master structures are only relevant for the legacy/primary device
>   * nodes, hence there can only be one per device, not one per drm_minor.
> @@ -88,17 +82,68 @@ struct drm_master {
>  	struct idr magic_map;
>  	void *driver_priv;
>  
> -	/* Tree of display resource leases, each of which is a drm_master struct
> -	 * All of these get activated simultaneously, so drm_device master points
> -	 * at the top of the tree (for which lessor is NULL). Protected by
> -	 * &drm_device.mode_config.idr_mutex.
> +	/**
> +	 * @lessor:
> +	 *
> +	 * Lease grantor, only set if this &struct drm_master represents a
> +	 * lessee holding a lease of objects from @lessor. Full owners of the
> +	 * device have this set to NULL.
> +	 *
> +	 * The lessor does not change once it's set in drm_lease_create(), and
> +	 * each lessee holds a reference to its lessor that it releases upon
> +	 * being destroyed in drm_lease_destroy().
> +	 *
> +	 * See also the :ref:`section on display resource leasing
> +	 * <drm_leasing>`.
>  	 */
> -
>  	struct drm_master *lessor;
> +
> +	/**
> +	 * @lessee_id:
> +	 *
> +	 * ID for lessees. Owners (i.e. @lessor is NULL) always have ID 0.
> +	 * Protected by &drm_device.mode_config's &drm_mode_config.idr_mutex.
> +	 */
>  	int	lessee_id;
> +
> +	/**
> +	 * @lessee_list:
> +	 *
> +	 * List entry of lessees of @lessor, where they are linked to @lessees.
> +	 * Not used for owners. Protected by &drm_device.mode_config's
> +	 * &drm_mode_config.idr_mutex.
> +	 */
>  	struct list_head lessee_list;
> +
> +	/**
> +	 * @lessees:
> +	 *
> +	 * List of drm_masters leasing from this one. Protected by
> +	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
> +	 *
> +	 * This list is empty if no leases have been granted, or if all lessees
> +	 * have been destroyed. Since lessors are referenced by all their
> +	 * lessees, this master cannot be destroyed unless the list is empty.
> +	 */
>  	struct list_head lessees;
> +
> +	/**
> +	 * @leases:
> +	 *
> +	 * Objects leased to this drm_master. Protected by
> +	 * &drm_device.mode_config's &drm_mode_config.idr_mutex.
> +	 *
> +	 * Objects are leased all together in drm_lease_create(), and are
> +	 * removed all together when the lease is revoked.
> +	 */
>  	struct idr leases;
> +
> +	/**
> +	 * @lessee_idr:
> +	 *
> +	 * All lessees under this owner (only used where @lessor is NULL).
> +	 * Protected by &drm_device.mode_config's &drm_mode_config.idr_mutex.
> +	 */
>  	struct idr lessee_idr;
>  	/* private: */
>  #if IS_ENABLED(CONFIG_DRM_LEGACY)
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
