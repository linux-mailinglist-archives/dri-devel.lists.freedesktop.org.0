Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3556FB3E244
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 14:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3547E10E0B4;
	Mon,  1 Sep 2025 12:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ibNGoaEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC6510E0B4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 12:08:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756728514; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=IAenoKgSdHkPApz74EZGmlVOniq2XtY/P8m5hGfv1E7I53t3LbIJ98u2QQo4Q6BWRgzEOiYeAW/dCnd+ah/b4qBHcKggxSpwTqg8BXraBSeaS4WjftPkKK4x7nX5qyIh2N5UPnYByrLJ5mCEJTC/HbbtlGtdr+21CB5SwykZb+0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756728514;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=wSn46kqGPRJSiG1jxWiNXTJm7SdwZ5Rheg3tluvY79s=; 
 b=hWWbtqwSu6me+vVlfmg1hbVw07tPUXd0qPZLpxd2azq84x63q3kMv8vA8jA7uFCNziOSSIS9s/HDUD/HnGGc5usR1jAv9Kwlh941HDqPsqm1NVRTp8NKVdBQHPMrnyZnLTG+wA+cZlMB49SdES7s4wMm/IzOEy+qeuWhSwt7tX0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756728514; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=wSn46kqGPRJSiG1jxWiNXTJm7SdwZ5Rheg3tluvY79s=;
 b=ibNGoaEIzY8yJMCRiUPn5BOXMN+b8Xm4u301u00R6ZUzowi6e4ZOTC5OreW1qCrG
 lEY6XPxWG7Dm9MV6a2fr66Ir4kR+ziqnxTNhsr1dpdpWSU6aUVxFq9W35b4lO8cpJKY
 Px/+c5C5+NpnO7owR3PBR13gFAMkdLNJDP2eO+Bk=
Received: by mx.zohomail.com with SMTPS id 1756728512813355.1262272570633;
 Mon, 1 Sep 2025 05:08:32 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:08:28 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/5] drm/panfrost: Introduce uAPI for JM context creation
Message-ID: <eshxdimaszusaw5dq33wuvmwerzhmnvpy2jctwjzw6wp6j4jsx@mashpuuhppxp>
References: <20250828023422.2404784-1-adrian.larumbe@collabora.com>
 <20250828023422.2404784-3-adrian.larumbe@collabora.com>
 <56130662-4768-44ff-829e-9d77258c4342@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56130662-4768-44ff-829e-9d77258c4342@arm.com>
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

Hi Steven,

On 01.09.2025 11:52, Steven Price wrote:
>
> On 28/08/2025 03:34, Adrián Larumbe wrote:
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> >
> > The new uAPI lets user space query the KM driver for the available
> > priorities a job can be given at submit time. These are managed through
> > the notion of a context, which besides a priority, codifies the list
> > of L2 caches, shading cores and tiler units a job is allowed to use,
> > for all three of the available device job slots.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>
> There's no cover letter for this series, so maybe I'm missing some
> context. But I'm not sure why we want to expose the tiler/l2/core masks
> to user space.

Sorry about this, I believe this is the second time you face this issue, must be
something to do with my git sendmail configuration that only sends the cover letter
to a limited number of recipients, unlike the rest of patches in the series.

You can find it here:

https://lore.kernel.org/dri-devel/20250828023422.2404784-1-adrian.larumbe@collabora.com/

> If you were trying to better support OpenCL on T628 I can just about
> understand the core mask. But, I doubt you are... (does anyone care
> about that anymore? ;) ). And really it's the core groups that matter
> rather than the raw affinities.
>
> The tiler/l2 affinities (and the XAFFINITY register in general) is there
> as a power saving mechanism. If we know that a job is not going to use
> the shader cores at all (a tiler-only job) then we can avoid turning
> them on, but obviously we still need the L2 and tiler blocks to be powered.
>
> kbase handled this with a "core_req" field which listed the required
> cores for each job. We already have a "requirements" field which we
> could extend for the same purpose (PANFROST_JD_REQ_TILER_ONLY or
> similar). I don't think this makes sense to include in a "context".
>
> But like I said, maybe I'm missing something - what is the use case for
> controlling affinity?

You're right here, this seems to be a case of overengineering. I guess because
Panthor offers finer grained affinity control in its queue submission mechanism,
we probably thought there might be a use case for it on Panfrost in the future.

In fact in the Mesa MR I do mention that at the moment UM simply selects the
full mask of available l2 caches and tiling/shading cores for all new contexts,
so in practice we're not using it.

> [The priority parts look ok here, but that's mixed in with the affinity
> changes.]

I'll drop exposure of affinity parameters in a v2 of this series.

> > ---
> >  include/uapi/drm/panfrost_drm.h | 93 +++++++++++++++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >
> > diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> > index ed67510395bd..2d8b32448e68 100644
> > --- a/include/uapi/drm/panfrost_drm.h
> > +++ b/include/uapi/drm/panfrost_drm.h
> > @@ -22,6 +22,8 @@ extern "C" {
> >  #define DRM_PANFROST_PERFCNT_DUMP		0x07
> >  #define DRM_PANFROST_MADVISE			0x08
> >  #define DRM_PANFROST_SET_LABEL_BO		0x09
> > +#define DRM_PANFROST_JM_CTX_CREATE		0x0a
> > +#define DRM_PANFROST_JM_CTX_DESTROY		0x0b
> >
> >  #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
> >  #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
> > @@ -31,6 +33,8 @@ extern "C" {
> >  #define DRM_IOCTL_PANFROST_GET_BO_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_BO_OFFSET, struct drm_panfrost_get_bo_offset)
> >  #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_MADVISE, struct drm_panfrost_madvise)
> >  #define DRM_IOCTL_PANFROST_SET_LABEL_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SET_LABEL_BO, struct drm_panfrost_set_label_bo)
> > +#define DRM_IOCTL_PANFROST_JM_CTX_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_CREATE, struct drm_panfrost_jm_ctx_create)
> > +#define DRM_IOCTL_PANFROST_JM_CTX_DESTROY	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_DESTROY, struct drm_panfrost_jm_ctx_destroy)
> >
> >  /*
> >   * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
> > @@ -71,6 +75,12 @@ struct drm_panfrost_submit {
> >
> >  	/** A combination of PANFROST_JD_REQ_* */
> >  	__u32 requirements;
> > +
> > +	/** JM context handle. Zero if you want to use the default context. */
> > +	__u32 jm_ctx_handle;
> > +
> > +	/** Padding field. MBZ. */
> > +	__u32 pad;
> >  };
> >
> >  /**
> > @@ -177,6 +187,7 @@ enum drm_panfrost_param {
> >  	DRM_PANFROST_PARAM_AFBC_FEATURES,
> >  	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP,
> >  	DRM_PANFROST_PARAM_SYSTEM_TIMESTAMP_FREQUENCY,
> > +	DRM_PANFROST_PARAM_ALLOWED_JM_CTX_PRIORITIES,
> >  };
> >
> >  struct drm_panfrost_get_param {
> > @@ -299,6 +310,88 @@ struct panfrost_dump_registers {
> >  	__u32 value;
> >  };
> >
> > +enum drm_panfrost_jm_ctx_priority {
> > +	/**
> > +	 * @PANFROST_JM_CTX_PRIORITY_LOW: Low priority context.
> > +	 */
> > +	PANFROST_JM_CTX_PRIORITY_LOW = 0,
> > +
> > +	/**
> > +	 * @PANFROST_JM_CTX_PRIORITY_MEDIUM: Medium priority context.
> > +	 */
> > +	PANFROST_JM_CTX_PRIORITY_MEDIUM,
> > +
> > +	/**
> > +	 * @PANFROST_JM_CTX_PRIORITY_HIGH: High priority context.
> > +	 *
> > +	 * Requires CAP_SYS_NICE or DRM_MASTER.
> > +	 */
> > +	PANFROST_JM_CTX_PRIORITY_HIGH,
> > +};
> > +
> > +#define PANFROST_JS_FLAG_ENABLED		(1 << 0)
> > +
> > +struct drm_panfrost_js_ctx_info {
> > +	/** @flags: Combination of PANFROST_JS_FLAG_xxx values */
> > +	__u32 flags;
> > +
> > +	/** @priority: Context priority (see enum drm_panfrost_jm_ctx_priority). */
> > +	__u8 priority;
> > +
> > +	/**
> > +	 * @tiler_mask: Mask encoding tiler units that can be used by the job slot
> > +	 *
> > +	 * When this field is zero, it means the tiler won't be used.
> > +	 *
> > +	 * The bits set here should also be set in drm_panthor_gpu_info::tiler_present.
> > +	 */
> > +	__u8 tiler_mask;
> > +
> > +	/**
> > +	 * @l2_mask: Mask encoding L2 caches that can be used by the job slot
> > +	 *
> > +	 * The bits set here should also be set in drm_panthor_gpu_info::l2_present.:
> > +	 */
> > +	__u16 l2_mask;
> > +
> > +	/**
> > +	 * @core_mask: Mask encoding cores that can be used by the job slot
> > +	 *
> > +	 * When this field is zero, it means the queue won't be used.
> > +	 *
> > +	 * The bits set here should also be set in drm_panthor_gpu_info::shader_present.
> > +	 */
> > +	__u64 core_mask;
> > +};
> > +
> > +struct drm_panfrost_jm_ctx_create {
> > +	/** @handle: Handle of the created JM context */
> > +	__u32 handle;
> > +
> > +	/** @pad: Padding field, MBZ. */
> > +	__u32 pad;
> > +
> > +	/**
> > +	 * @slots: Job slots
> > +	 *
> > +	 * This field must be greater than zero and less than 8 (only three slots
> > +	 * available).
> > +	 */
> > +	struct drm_panfrost_js_ctx_info slots[3];
>
> We don't allow user space to choose which slot is being targetted, so
> this feels odd. I guess this allows deliberately disabling slot 1 to
> force slot 2. But the code in this series doesn't seem to implement
> this. I'm also not sure I understand why you would want a different
> priority for different slots?
>
> Thanks,
> Steve
>
> > +};
> > +
> > +struct drm_panfrost_jm_ctx_destroy {
> > +	/**
> > +	 * @handle: Handle of the JM context to destroy.
> > +	 *
> > +	 * Must be a valid context handle returned by DRM_IOCTL_PANTHOR_JM_CTX_CREATE.
> > +	 */
> > +	__u32 handle;
> > +
> > +	/** @pad: Padding field, MBZ. */
> > +	__u32 pad;
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif

Adrian Larumbe
