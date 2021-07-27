Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DBD3D7586
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 15:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CFC26E0E1;
	Tue, 27 Jul 2021 13:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE1A6E0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 13:04:32 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id n11so7538778wmd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 06:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lIHdtmc7Pc4OZ9ODMPWwZujpvXHPx2nkxuRuGb5xEvk=;
 b=NfKirlFhQfIivsBBaK3VCTLPm9Cqn+QECfZJbfB+wLImrMHxL+CGJ27u70MtEmRivA
 FOY28DpJtvHOw9BDUyWq8BSZ1Qha2zQhE0tmdUG017RR7735QXeCmrj+KQBzD2zqdgg+
 qRJ4oOQeta4Et53+BtJ4fTX2HHj4Eert+WRRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=lIHdtmc7Pc4OZ9ODMPWwZujpvXHPx2nkxuRuGb5xEvk=;
 b=dlMb8INYZQYBuxsPqZ8lp2k0i+/LSjJHVUaejcx/uDBQwyUwopEsb41CbCvn1b/vWt
 Pri+gHqb/qU8qCwBArrUH+aB8BM171NlvkmhY9AI2tldB/XXrvNF9CiR+GC1QJdP7PY+
 y/88+PPBY6STNV8e+JXdnEhkkKPCxLZGKFOV+6xeoO6yQhoelONeYTRQJDqdDoJMnaAP
 7ZLnxM/OpgnGso0EHKJ3SjHOWplsL4WN8/J5FUy380J/0C53LnoyTF25G1Z2FG5+1Qvi
 rm5HzxwonqgKe0bcky1BrJWKqbVZpb31RrZvVo4Pb0/2rai5HCpMRiOhgYrlFGmPYSeo
 Ljhw==
X-Gm-Message-State: AOAM530EeAjahwqOfTIR0DUJa4k8/ZuG7JExhRFVO7HtQjO2LrUHMSxZ
 BBiIP8M+gG+7tin6oG1g0tTApQ==
X-Google-Smtp-Source: ABdhPJyC+onv/7KlsmJ9zxf9zt3skPthQIBeGYjDJXbiZQ+vnIkBX6qMkzZ+9RYBzRR6iFCl5O9V1Q==
X-Received: by 2002:a7b:cc8d:: with SMTP id p13mr3907556wma.145.1627391071253; 
 Tue, 27 Jul 2021 06:04:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k6sm2209963wrm.10.2021.07.27.06.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 06:04:30 -0700 (PDT)
Date: Tue, 27 Jul 2021 15:04:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH v2 2/3] drm: clarify usage of drm leases
Message-ID: <YQAEXLyr0aBiOH42@phenom.ffwll.local>
Mail-Followup-To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 intel-gfx@lists.freedesktop.org
References: <20210724111824.59266-1-desmondcheongzx@gmail.com>
 <20210724111824.59266-3-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210724111824.59266-3-desmondcheongzx@gmail.com>
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
Cc: tzimmermann@suse.de, corbet@lwn.net, airlied@linux.ie,
 gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com,
 dri-devel@lists.freedesktop.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 07:18:23PM +0800, Desmond Cheong Zhi Xi wrote:
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
> 4. Clean up function documentation in drm_lease.c to use kernel-doc
> formatting.
> 
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
> 
> Hi,
> 
> After I updated the formatting for comments in drm_lease.c, I noticed
> that none of these were driver interfaces (i.e. no structs/inline
> functions declared in headers, and no exported symbols in .c files).
> 
> I left the kernel-doc links inside drm-uapi.rst so that if any such
> interfaces are defined in the future, they'll go to the appropriate
> place. But if these should be removed, or if the formatting changes for
> function comments should be removed, please let me know.


Hm indeed, so there's not really any need to either include the
drm_lease.c or drm_lease.h kerneldoc. The DOC section itself is still
useful.

For the internal pieces usually what we do is remove the comment outright
if it doesn't provide anything useful (like just repeats what the function
name says already). If there's something interesting in the comment then
we leave it that sentence in there as a normal comment, but without any of
the structured comment stuff (so no /**, nor @arguments, or the function
summary).



> 
> Best wishes,
> Desmond
> 
>  Documentation/gpu/drm-uapi.rst |  15 +++
>  drivers/gpu/drm/drm_lease.c    | 182 ++++++++++++++++++++-------------
>  include/drm/drm_auth.h         |  67 ++++++++++--
>  3 files changed, 180 insertions(+), 84 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 7e51dd40bf6e..6d7233a9fb14 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -37,6 +37,21 @@ Primary Nodes, DRM Master and Authentication
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
> +.. kernel-doc:: drivers/gpu/drm/drm_lease.c
> +   :export:
> +
> +.. kernel-doc:: include/drm/drm_lease.h
> +   :internal:
> +
>  Open-Source Userspace Requirements
>  ==================================
>  
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index 92eac73d9001..9b68617840ed 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -15,18 +15,67 @@
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
> + * these get activated simultaneously, so &drm_device.master points to the

I think it would be good to clarify that this happens when the top level
owner changes through the SETMASTER/DROPMASTER IOCTL. Otherwise this all
looks good, thanks for typing it up.

> + * owner at the top of the lease tree (i.e. the &struct drm_master for which
> + * &drm_master.lessor is NULL). The full list of lessees that are leasing
> + * objects from the owner can be searched via the owner's
> + * &drm_master.lessee_idr.
> + */
> +
>  #define drm_for_each_lessee(lessee, lessor) \
>  	list_for_each_entry((lessee), &(lessor)->lessees, lessee_list)
>  
>  static uint64_t drm_lease_idr_object;
>  
>  /**
> - * drm_lease_owner - return ancestor owner drm_master
> - * @master: drm_master somewhere within tree of lessees and lessors
> - *
> - * RETURN:
> + * drm_lease_owner - return the device owner in @master's lease tree
> + * @master: &struct drm_master somewhere within tree of lessees and lessors
>   *
> - * drm_master at the top of the tree (i.e, with lessor NULL
> + * Returns the &struct drm_master that owns the device, i.e. the &struct
> + * drm_master at the top of the tree for which &drm_master.lessor is NULL.
>   */
>  struct drm_master *drm_lease_owner(struct drm_master *master)
>  {
> @@ -37,12 +86,10 @@ struct drm_master *drm_lease_owner(struct drm_master *master)
>  
>  /**
>   * _drm_find_lessee - find lessee by id (idr_mutex held)
> - * @master: drm_master of lessor
> - * @lessee_id: id
> + * @master: &struct drm_master of lessor
> + * @lessee_id: &drm_master.lessee_id of lessee
>   *
> - * RETURN:
> - *
> - * drm_master of the lessee if valid, NULL otherwise
> + * Returns &struct drm_master of the lessee if the ID is valid, NULL otherwise.
>   */
>  
>  static struct drm_master*
> @@ -53,15 +100,12 @@ _drm_find_lessee(struct drm_master *master, int lessee_id)
>  }
>  
>  /**
> - * _drm_lease_held_master - check to see if an object is leased (or owned) by master (idr_mutex held)
> - * @master: the master to check the lease status of
> - * @id: the id to check
> - *
> - * Checks if the specified master holds a lease on the object. Return
> - * value:
> + * _drm_lease_held_master - check to see if an object is leased (or owned) by
> + * @master (idr_mutex held)
> + * @master: the &struct drm_master to check the lease status of
> + * @id: the object ID to check
>   *
> - *	true		'master' holds a lease on (or owns) the object
> - *	false		'master' does not hold a lease.
> + * Returns true if @master holds a lease on (or owns) the object, false if not.
>   */
>  static int _drm_lease_held_master(struct drm_master *master, int id)
>  {
> @@ -73,14 +117,11 @@ static int _drm_lease_held_master(struct drm_master *master, int id)
>  
>  /**
>   * _drm_has_leased - check to see if an object has been leased (idr_mutex held)
> - * @master: the master to check the lease status of
> - * @id: the id to check
> + * @master: the &struct drm_master to check the lease status of
> + * @id: the object ID to check
>   *
> - * Checks if any lessee of 'master' holds a lease on 'id'. Return
> - * value:
> - *
> - *	true		Some lessee holds a lease on the object.
> - *	false		No lessee has a lease on the object.
> + * Returns true if any lessee of @master holds a lease on the given object,
> + * false if no lessee has a lease on the object.
>   */
>  static bool _drm_has_leased(struct drm_master *master, int id)
>  {
> @@ -95,14 +136,11 @@ static bool _drm_has_leased(struct drm_master *master, int id)
>  
>  /**
>   * _drm_lease_held - check drm_mode_object lease status (idr_mutex held)
> - * @file_priv: the master drm_file
> - * @id: the object id
> - *
> - * Checks if the specified master holds a lease on the object. Return
> - * value:
> + * @file_priv: the master &struct drm_file
> + * @id: the object ID
>   *
> - *	true		'master' holds a lease on (or owns) the object
> - *	false		'master' does not hold a lease.
> + * Returns true if @file_priv's &drm_file.master holds a lease on (or owns) the
> + * object, false if it does not.
>   */
>  bool _drm_lease_held(struct drm_file *file_priv, int id)
>  {
> @@ -123,14 +161,11 @@ bool _drm_lease_held(struct drm_file *file_priv, int id)
>  
>  /**
>   * drm_lease_held - check drm_mode_object lease status (idr_mutex not held)
> - * @file_priv: the master drm_file
> - * @id: the object id
> + * @file_priv: the master &struct drm_file
> + * @id: the object ID
>   *
> - * Checks if the specified master holds a lease on the object. Return
> - * value:
> - *
> - *	true		'master' holds a lease on (or owns) the object
> - *	false		'master' does not hold a lease.
> + * Returns true if @file_priv's &drm_file.master holds a lease on (or owns) the
> + * object, false if it does not.
>   */
>  bool drm_lease_held(struct drm_file *file_priv, int id)
>  {
> @@ -157,7 +192,8 @@ bool drm_lease_held(struct drm_file *file_priv, int id)
>  }
>  
>  /**
> - * drm_lease_filter_crtcs - restricted crtc set to leased values (idr_mutex not held)
> + * drm_lease_filter_crtcs - restricted crtc set to leased values
> + * (idr_mutex not held)
>   * @file_priv: requestor file
>   * @crtcs_in: bitmask of crtcs to check
>   *
> @@ -207,13 +243,14 @@ uint32_t drm_lease_filter_crtcs(struct drm_file *file_priv, uint32_t crtcs_in)
>  }
>  
>  /*
> - * drm_lease_create - create a new drm_master with leased objects (idr_mutex not held)
> + * drm_lease_create - create a new &struct drm_master with leased objects
> + * (idr_mutex not held)
>   * @lessor: lease holder (or owner) of objects
>   * @leases: objects to lease to the new drm_master
>   *
> - * Uses drm_master_create to allocate a new drm_master, then checks to
> - * make sure all of the desired objects can be leased, atomically
> - * leasing them to the new drmmaster.
> + * Uses drm_master_create() to allocate a new &struct drm_master, then checks
> + * to make sure all of the desired objects can be leased, atomically
> + * leasing them to the new &struct drm_master.
>   *
>   * 	ERR_PTR(-EACCES)	some other master holds the title to any object
>   * 	ERR_PTR(-ENOENT)	some object is not a valid DRM object for this device
> @@ -280,13 +317,13 @@ static struct drm_master *drm_lease_create(struct drm_master *lessor, struct idr
>  }
>  
>  /**
> - * drm_lease_destroy - a master is going away (idr_mutex not held)
> - * @master: the drm_master being destroyed
> + * drm_lease_destroy - destroy a master  (idr_mutex not held)
> + * @master: the &struct drm_master being destroyed
>   *
> - * All lessees will have been destroyed as they
> - * hold a reference on their lessor. Notify any
> - * lessor for this master so that it can check
> - * the list of lessees.
> + * Destroys @master, then notifies any lessor for this master so that it can
> + * check the list of lessees. Note that all lessees of @master will have been
> + * destroyed for this function to be called as they hold a reference on their
> + * lessor.
>   */
>  void drm_lease_destroy(struct drm_master *master)
>  {
> @@ -323,7 +360,7 @@ void drm_lease_destroy(struct drm_master *master)
>  
>  /**
>   * _drm_lease_revoke - revoke access to all leased objects (idr_mutex held)
> - * @top: the master losing its lease
> + * @top: the &struct drm_master losing its lease
>   */
>  static void _drm_lease_revoke(struct drm_master *top)
>  {
> @@ -365,7 +402,7 @@ static void _drm_lease_revoke(struct drm_master *top)
>  
>  /**
>   * drm_lease_revoke - revoke access to all leased objects (idr_mutex not held)
> - * @top: the master losing its lease
> + * @top: the &struct drm_master losing its lease
>   */
>  void drm_lease_revoke(struct drm_master *top)
>  {
> @@ -500,14 +537,16 @@ static int fill_object_idr(struct drm_device *dev,
>  
>  /**
>   * drm_mode_create_lease_ioctl - create a new lease
> - * @dev: the drm device
> - * @data: pointer to struct drm_mode_create_lease
> - * @lessor_priv: the file being manipulated
> + * @dev: the &struct drm_device
> + * @data: pointer to &struct drm_mode_create_lease
> + * @lessor_priv: the &struct drm_file being manipulated
>   *
> - * The master associated with the specified file will have a lease
> + * The &struct drm_master associated with @lessor_priv will have a lease
>   * created containing the objects specified in the ioctl structure.
>   * A file descriptor will be allocated for that and returned to the
>   * application.
> + *
> + * Note that creating recursive sub-leases for existing lessees is not allowed.
>   */
>  int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  				void *data, struct drm_file *lessor_priv)
> @@ -626,15 +665,13 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  }
>  
>  /**
> - * drm_mode_list_lessees_ioctl - list lessee ids
> - * @dev: the drm device
> - * @data: pointer to struct drm_mode_list_lessees
> - * @lessor_priv: the file being manipulated
> + * drm_mode_list_lessees_ioctl - list lessee IDs
> + * @dev: the &struct drm_device
> + * @data: pointer to &struct drm_mode_list_lessees
> + * @lessor_priv: the &struct drm_file being manipulated
>   *
> - * Starting from the master associated with the specified file,
> - * the master with the provided lessee_id is found, and then
> - * an array of lessee ids associated with leases from that master
> - * are returned.
> + * Returns an array of &drm_master.lessee_id associated with lessees of
> + * @lessor_priv's &drm_file.master that have unrevoked leases.
>   */
>  
>  int drm_mode_list_lessees_ioctl(struct drm_device *dev,
> @@ -685,9 +722,9 @@ int drm_mode_list_lessees_ioctl(struct drm_device *dev,
>  
>  /**
>   * drm_mode_get_lease_ioctl - list leased objects
> - * @dev: the drm device
> - * @data: pointer to struct drm_mode_get_lease
> - * @lessee_priv: the file being manipulated
> + * @dev: the &struct drm_device
> + * @data: pointer to &struct drm_mode_get_lease
> + * @lessee_priv: the &struct drm_file being manipulated
>   *
>   * Return the list of leased objects for the specified lessee
>   */
> @@ -747,13 +784,12 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>  
>  /**
>   * drm_mode_revoke_lease_ioctl - revoke lease
> - * @dev: the drm device
> - * @data: pointer to struct drm_mode_revoke_lease
> - * @lessor_priv: the file being manipulated
> + * @dev: the &struct drm_device
> + * @data: pointer to &struct drm_mode_revoke_lease
> + * @lessor_priv: the &struct drm_file being manipulated
>   *
> - * This removes all of the objects from the lease without
> - * actually getting rid of the lease itself; that way all
> - * references to it still work correctly
> + * Removes all of the objects from the lessee without actually getting rid
> + * of the lessee itself; that way all references to it still work correctly.
>   */
>  int drm_mode_revoke_lease_ioctl(struct drm_device *dev,
>  				void *data, struct drm_file *lessor_priv)
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

This also looks great now. With the one improvement addressed and I guess
the includes for drm_lease.[hc] and those parts of the patch removed
again:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

If you want perhaps do a follow-up patch to clean up the comments in
drm_lease.c and remove the outdated/unused kerneldoc? It tends to not be
maintained when it's not included, so short comments where they provide
real insight is imo best.
-Daniel

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
