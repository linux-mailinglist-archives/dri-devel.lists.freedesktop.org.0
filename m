Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2450BC3633B
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:02:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B3CB10E75B;
	Wed,  5 Nov 2025 15:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="BebSUQse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D98810E75B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 15:02:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1762354919; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=XG6cTjDsLsGALnQJ82LQfLX4hq+3bVTEG11otHu3mzKnFco+0BBmqzz3h9ryzBy57G0cBSRKrEDCfg4CDkmEyndggwsUAiUIaxMzJWDjlRLTZBJzhIPGGj3Cgo3PwhhTMROt3mOBOMFqpqePtqiCaYibCDNZS2Pl9fa7h4Pu6LA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1762354919;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=UYKHq46cjKRQznrS8s3ZIt73/EO5M131HkjNrmD3x1g=; 
 b=bsuoVFIjcs0ZQUJVgaQTfe1Vc7dbqzd8fuMFScQHjI43js4NcRXPK0bsZl/+jFlS1z+w2HPf8KaF3s0Yr0uhJhikJUZu8GExGeDfq/mwShKTFcbJ8B7HD6rzSIqZ621GynupA9Y8T938naIOhD21QdC77Xjx8LsKuly8jpvk1Cw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762354919; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=UYKHq46cjKRQznrS8s3ZIt73/EO5M131HkjNrmD3x1g=;
 b=BebSUQse7xTN2IVaqXLKozqq9HikIrQMI8/pb0hdVzoBQSUfZyzMGgqyD/x2QWyv
 egRyOkbXtEQV36V4T5e0yo2vOCmNJd0ajGsAAE3ML9k1Oe2+3705FtNEUcfit4T+DcX
 YCBfMR95fvPGXMtiR9hPymtk3fb7FwD3oPwM/tl0=
Received: by mx.zohomail.com with SMTPS id 1762354914582132.16232616230138;
 Wed, 5 Nov 2025 07:01:54 -0800 (PST)
Date: Wed, 5 Nov 2025 15:01:48 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/panfrost: fix UAPI kernel-doc warnings
Message-ID: <dg75knqmkgntq5w4p35den2wauza6aavkuufmxwu4ljdchkitw@pbwaxxavrqfs>
References: <20251031054152.1406764-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251031054152.1406764-1-rdunlap@infradead.org>
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

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 30.10.2025 22:41, Randy Dunlap wrote:
> Fix all kernel-doc warnings in include/uapi/drm/panfrost_drm.h.
> This mostly means modifying existing comments to conform to
> kernel-doc format, but there also some additions of missing
> kernel-doc comments and changing non-kernel-doc comments to
> use "/*" to begin them.
>
> Warning: panfrost_drm.h:83 struct member 'jc' not described
>  in 'drm_panfrost_submit'
> Warning: panfrost_drm.h:83 struct member 'in_syncs' not described
>  in 'drm_panfrost_submit'
> Warning: panfrost_drm.h:83 struct member 'in_sync_count' not described
>  in 'drm_panfrost_submit'
> Warning: panfrost_drm.h:83 struct member 'out_sync' not described
>  in 'drm_panfrost_submit'
> Warning: panfrost_drm.h:83 struct member 'bo_handles' not described
>  in 'drm_panfrost_submit'
> Warning: panfrost_drm.h:83 struct member 'bo_handle_count' not described
>  in 'drm_panfrost_submit'
> Warning: panfrost_drm.h:83 struct member 'requirements' not described
>  in 'drm_panfrost_submit'
> Warning: panfrost_drm.h:83 struct member 'jm_ctx_handle' not described
>  in 'drm_panfrost_submit'
> Warning: panfrost_drm.h:83 struct member 'pad' not described
>  in 'drm_panfrost_submit'
> Warning: panfrost_drm.h:116 Incorrect use of kernel-doc format:
>   * Returned offset for the BO in the GPU address space.  This offset
> Warning: panfrost_drm.h:124 struct member 'size' not described
>  in 'drm_panfrost_create_bo'
> Warning: panfrost_drm.h:124 struct member 'flags' not described
>  in 'drm_panfrost_create_bo'
> Warning: panfrost_drm.h:124 struct member 'handle' not described
>  in 'drm_panfrost_create_bo'
> Warning: panfrost_drm.h:124 struct member 'pad' not described
>  in 'drm_panfrost_create_bo'
> Warning: panfrost_drm.h:124 struct member 'nonzero' not described
>  in 'drm_panfrost_create_bo'
> Warning: panfrost_drm.h:143 struct member 'handle' not described
>  in 'drm_panfrost_mmap_bo'
> Warning: panfrost_drm.h:143 struct member 'flags' not described
>  in 'drm_panfrost_mmap_bo'
> Warning: panfrost_drm.h:143 struct member 'offset' not described
>  in 'drm_panfrost_mmap_bo'
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> ---
>  include/uapi/drm/panfrost_drm.h |  118 ++++++++++++++++++++----------
>  1 file changed, 82 insertions(+), 36 deletions(-)
>
> --- linux-next-20251029.orig/include/uapi/drm/panfrost_drm.h
> +++ linux-next-20251029/include/uapi/drm/panfrost_drm.h
> @@ -54,32 +54,46 @@ extern "C" {
>   * This asks the kernel to have the GPU execute a render command list.
>   */
>  struct drm_panfrost_submit {
> -
> -	/** Address to GPU mapping of job descriptor */
> +	/**
> +	 * @jc: Address to GPU mapping of job descriptor
> +	 */
>  	__u64 jc;
> -
> -	/** An optional array of sync objects to wait on before starting this job. */
> +	/**
> +	 * @in_syncs: An optional array of sync objects to wait on
> +	 * before starting this job.
> +	 */
>  	__u64 in_syncs;
> -
> -	/** Number of sync objects to wait on before starting this job. */
> +	/**
> +	 * @in_sync_count: Number of sync objects to wait on before
> +	 * starting this job.
> +	 */
>  	__u32 in_sync_count;
> -
> -	/** An optional sync object to place the completion fence in. */
> +	/**
> +	 * @out_sync: An optional sync object to place the completion fence in.
> +	 */
>  	__u32 out_sync;
> -
> -	/** Pointer to a u32 array of the BOs that are referenced by the job. */
> +	/**
> +	 * @bo_handles: Pointer to a u32 array of the BOs that are
> +	 * referenced by the job.
> +	 */
>  	__u64 bo_handles;
> -
> -	/** Number of BO handles passed in (size is that times 4). */
> +	/**
> +	 * @bo_handle_count: Number of BO handles passed in (size is
> +	 * that times 4).
> +	 */
>  	__u32 bo_handle_count;
> -
> -	/** A combination of PANFROST_JD_REQ_* */
> +	/**
> +	 * @requirements: A combination of PANFROST_JD_REQ_*
> +	 */
>  	__u32 requirements;
> -
> -	/** JM context handle. Zero if you want to use the default context. */
> +	/**
> +	 * @jm_ctx_handle: JM context handle. Zero if you want to use the
> +	 * default context.
> +	 */
>  	__u32 jm_ctx_handle;
> -
> -	/** Padding field. MBZ. */
> +	/**
> +	 * @pad: Padding field. Must be zero.
> +	 */
>  	__u32 pad;
>  };
>
> @@ -92,9 +106,18 @@ struct drm_panfrost_submit {
>   * completed.
>   */
>  struct drm_panfrost_wait_bo {
> +	/**
> +	 * @handle: Handle for the object to wait for.
> +	 */
>  	__u32 handle;
> +	/**
> +	 * @pad: Padding, must be zero-filled.
> +	 */
>  	__u32 pad;
> -	__s64 timeout_ns;	/* absolute */
> +	/**
> +	 * @timeout_ns: absolute number of nanoseconds to wait.
> +	 */
> +	__s64 timeout_ns;
>  };
>
>  /* Valid flags to pass to drm_panfrost_create_bo */
> @@ -107,16 +130,26 @@ struct drm_panfrost_wait_bo {
>   * The flags argument is a bit mask of PANFROST_BO_* flags.
>   */
>  struct drm_panfrost_create_bo {
> +	/**
> +	 * @size: size of shmem/BO area to create (bytes)
> +	 */
>  	__u32 size;
> +	/**
> +	 * @flags: see PANFROST_BO_* flags
> +	 */
>  	__u32 flags;
> -	/** Returned GEM handle for the BO. */
> +	/**
> +	 * @handle: Returned GEM handle for the BO.
> +	 */
>  	__u32 handle;
> -	/* Pad, must be zero-filled. */
> +	/**
> +	 * @pad: Padding, must be zero-filled.
> +	 */
>  	__u32 pad;
>  	/**
> -	 * Returned offset for the BO in the GPU address space.  This offset
> -	 * is private to the DRM fd and is valid for the lifetime of the GEM
> -	 * handle.
> +	 * @offset: Returned offset for the BO in the GPU address space.
> +	 * This offset is private to the DRM fd and is valid for the
> +	 * lifetime of the GEM handle.
>  	 *
>  	 * This offset value will always be nonzero, since various HW
>  	 * units treat 0 specially.
> @@ -136,10 +169,17 @@ struct drm_panfrost_create_bo {
>   * used in a future extension.
>   */
>  struct drm_panfrost_mmap_bo {
> -	/** Handle for the object being mapped. */
> +	/**
> +	 * @handle: Handle for the object being mapped.
> +	 */
>  	__u32 handle;
> +	/**
> +	 * @flags: currently not used (should be zero)
> +	 */
>  	__u32 flags;
> -	/** offset into the drm node to use for subsequent mmap call. */
> +	/**
> +	 * @offset: offset into the drm node to use for subsequent mmap call.
> +	 */
>  	__u64 offset;
>  };
>
> @@ -196,7 +236,7 @@ struct drm_panfrost_get_param {
>  	__u64 value;
>  };
>
> -/**
> +/*
>   * Returns the offset for the BO in the GPU address space for this DRM fd.
>   * This is the same value returned by drm_panfrost_create_bo, if that was called
>   * from this DRM fd.
> @@ -244,12 +284,14 @@ struct drm_panfrost_madvise {
>   * struct drm_panfrost_set_label_bo - ioctl argument for labelling Panfrost BOs.
>   */
>  struct drm_panfrost_set_label_bo {
> -	/** @handle: Handle of the buffer object to label. */
> +	/**
> +	 * @handle: Handle of the buffer object to label.
> +	 */
>  	__u32 handle;
> -
> -	/**  @pad: MBZ. */
> +	/**
> +	 * @pad: Must be zero.
> +	 */
>  	__u32 pad;
> -
>  	/**
>  	 * @label: User pointer to a NUL-terminated string
>  	 *
> @@ -330,10 +372,13 @@ enum drm_panfrost_jm_ctx_priority {
>  };
>
>  struct drm_panfrost_jm_ctx_create {
> -	/** @handle: Handle of the created JM context */
> +	/**
> +	 * @handle: Handle of the created JM context
> +	 */
>  	__u32 handle;
> -
> -	/** @priority: Context priority (see enum drm_panfrost_jm_ctx_priority). */
> +	/**
> +	 * @priority: Context priority (see enum drm_panfrost_jm_ctx_priority).
> +	 */
>  	__u32 priority;
>  };
>
> @@ -344,8 +389,9 @@ struct drm_panfrost_jm_ctx_destroy {
>  	 * Must be a valid context handle returned by DRM_IOCTL_PANTHOR_JM_CTX_CREATE.
>  	 */
>  	__u32 handle;
> -
> -	/** @pad: Padding field, MBZ. */
> +	/**
> +	 * @pad: Padding field, must be zero.
> +	 */
>  	__u32 pad;
>  };

Adrian Larumbe
