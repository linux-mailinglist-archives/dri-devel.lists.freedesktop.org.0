Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666312DD11E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 13:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4E96E2EF;
	Thu, 17 Dec 2020 12:14:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D8A6E2EF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:14:03 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id i9so26378854wrc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 04:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YpjJPUfn+UnKJ+EPx8Qzy0xB1f+/S2erSj9Uis6OSCo=;
 b=K/c8bsBhRkvOawJeJ+fTNKBnokjo8DZs0s60prEZR1Q+CFllUHb+R42D4oijqJNDTC
 kyUij3WLIKp8LgO54Zgu+F5GTyqaKrhUDuKzhwsIBq1+l9HF/3MZ2iMKeq/91W1vgkP+
 MQR7Az7EBedKRxcDoXEMkPWeu8/x1+pxIlsTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YpjJPUfn+UnKJ+EPx8Qzy0xB1f+/S2erSj9Uis6OSCo=;
 b=FnT3hev2dYZ32zSkbKLAZp7A53UbI4DI1xObcxL8tL+H7TwFCEBWafK58AiSY4uFjL
 x/4I/Ym75HoRwE+DcpXcLb5spvYcRk3Db8ZeXuStHUMxWyJEckiuASujLnoi3SW2GN2f
 KRVpspQIDDWPGQLTmzzthF48ZYmTMBXD3AXP1vxCukGUlQ90Vncjxvw1ComrH8Quj1wa
 X/T1nCRhoPX3Q4DR8k0e8Q9ezj8nakOwS2lyH8HhA2VHZq0ZGdyR9KZceVGFpFvCjDKv
 nP41bB+lGotGXavOsYQcmXqQOwjN2Tz15Ud4Wl6ICzy9yV+4fOLFuAPL71z+UWzDrkus
 vjug==
X-Gm-Message-State: AOAM533CZDCvltA9Y6kVM1axyuMuJppW18zZEDNR1Nqas6dfdxdW+zau
 NhsLhMzsl5HiMqFIpireZ2AEIg==
X-Google-Smtp-Source: ABdhPJyEmFQ2RumPhEGeKoY41kqsG/R93SOvVYnbXa/Q2SAXX3HwWf7X19z8aEoowJX/LIvT32QwOQ==
X-Received: by 2002:adf:ebc5:: with SMTP id v5mr42940715wrn.392.1608207241899; 
 Thu, 17 Dec 2020 04:14:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d191sm7366491wmd.24.2020.12.17.04.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:14:01 -0800 (PST)
Date: Thu, 17 Dec 2020 13:13:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 8/9] drm/doc: demote old doc-comments in drm.h
Message-ID: <X9tLh8jgRXKTZbkD@phenom.ffwll.local>
References: <20201217113220.102271-1-contact@emersion.fr>
 <20201217113220.102271-9-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217113220.102271-9-contact@emersion.fr>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 12:32:19PM +0100, Simon Ser wrote:
> Sphinx doesn't like old doc-comments in drm.h and generates warnings
> like:
> 
>     ./include/uapi/drm/drm.h:87: warning: cannot understand function prototype: 'struct drm_clip_rect '
>     ./include/uapi/drm/drm.h:97: warning: cannot understand function prototype: 'struct drm_drawable_info '
>     ./include/uapi/drm/drm.h:105: warning: cannot understand function prototype: 'struct drm_tex_region '
>     ...
> 
> Demote these to regular comments, because converting all of them is
> quite a lot of work (also requires documenting all of the struct fields
> for instance). Also many of these structures aren't really used by
> modern user-space.
> 
> We can easily convert these remaining old comments to Sphinx style on a
> one-by-one basis.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  include/uapi/drm/drm.h | 84 +++++++++++++++++++++---------------------
>  1 file changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 783f666152a1..512ca80e8d4a 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -75,7 +75,7 @@ typedef unsigned int drm_context_t;
>  typedef unsigned int drm_drawable_t;
>  typedef unsigned int drm_magic_t;
>  
> -/**
> +/*
>   * Cliprect.
>   *
>   * \warning: If you change this structure, make sure you change
> @@ -91,7 +91,7 @@ struct drm_clip_rect {
>  	unsigned short y2;
>  };
>  
> -/**
> +/*
>   * Drawable information.
>   */
>  struct drm_drawable_info {
> @@ -99,7 +99,7 @@ struct drm_drawable_info {
>  	struct drm_clip_rect *rects;
>  };
>  
> -/**
> +/*
>   * Texture region,
>   */
>  struct drm_tex_region {
> @@ -110,7 +110,7 @@ struct drm_tex_region {
>  	unsigned int age;
>  };
>  
> -/**
> +/*
>   * Hardware lock.
>   *
>   * The lock structure is a simple cache-line aligned integer.  To avoid
> @@ -122,7 +122,7 @@ struct drm_hw_lock {
>  	char padding[60];			/**< Pad to cache line */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_VERSION ioctl argument type.
>   *
>   * \sa drmGetVersion().
> @@ -139,7 +139,7 @@ struct drm_version {
>  	char __user *desc;	  /**< User-space buffer to hold desc */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_GET_UNIQUE ioctl argument type.
>   *
>   * \sa drmGetBusid() and drmSetBusId().
> @@ -158,7 +158,7 @@ struct drm_block {
>  	int unused;
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_CONTROL ioctl argument type.
>   *
>   * \sa drmCtlInstHandler() and drmCtlUninstHandler().
> @@ -173,7 +173,7 @@ struct drm_control {
>  	int irq;
>  };
>  
> -/**
> +/*
>   * Type of memory to map.
>   */
>  enum drm_map_type {
> @@ -185,7 +185,7 @@ enum drm_map_type {
>  	_DRM_CONSISTENT = 5	  /**< Consistent memory for PCI DMA */
>  };
>  
> -/**
> +/*
>   * Memory mapping flags.
>   */
>  enum drm_map_flags {
> @@ -204,7 +204,7 @@ struct drm_ctx_priv_map {
>  	void *handle;		 /**< Handle of map */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_GET_MAP, DRM_IOCTL_ADD_MAP and DRM_IOCTL_RM_MAP ioctls
>   * argument type.
>   *
> @@ -221,7 +221,7 @@ struct drm_map {
>  	/*   Private data */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_GET_CLIENT ioctl argument type.
>   */
>  struct drm_client {
> @@ -253,7 +253,7 @@ enum drm_stat_type {
>  	    /* Add to the *END* of the list */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_GET_STATS ioctl argument type.
>   */
>  struct drm_stats {
> @@ -264,7 +264,7 @@ struct drm_stats {
>  	} data[15];
>  };
>  
> -/**
> +/*
>   * Hardware locking flags.
>   */
>  enum drm_lock_flags {
> @@ -279,7 +279,7 @@ enum drm_lock_flags {
>  	_DRM_HALT_CUR_QUEUES = 0x20  /**< Halt all current queues */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_LOCK, DRM_IOCTL_UNLOCK and DRM_IOCTL_FINISH ioctl argument type.
>   *
>   * \sa drmGetLock() and drmUnlock().
> @@ -289,7 +289,7 @@ struct drm_lock {
>  	enum drm_lock_flags flags;
>  };
>  
> -/**
> +/*
>   * DMA flags
>   *
>   * \warning
> @@ -318,7 +318,7 @@ enum drm_dma_flags {
>  	_DRM_DMA_LARGER_OK = 0x40     /**< Larger-than-requested buffers OK */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_ADD_BUFS and DRM_IOCTL_MARK_BUFS ioctl argument type.
>   *
>   * \sa drmAddBufs().
> @@ -341,7 +341,7 @@ struct drm_buf_desc {
>  				  */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_INFO_BUFS ioctl argument type.
>   */
>  struct drm_buf_info {
> @@ -349,7 +349,7 @@ struct drm_buf_info {
>  	struct drm_buf_desc __user *list;
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_FREE_BUFS ioctl argument type.
>   */
>  struct drm_buf_free {
> @@ -357,7 +357,7 @@ struct drm_buf_free {
>  	int __user *list;
>  };
>  
> -/**
> +/*
>   * Buffer information
>   *
>   * \sa drm_buf_map.
> @@ -369,7 +369,7 @@ struct drm_buf_pub {
>  	void __user *address;	       /**< Address of buffer */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_MAP_BUFS ioctl argument type.
>   */
>  struct drm_buf_map {
> @@ -382,7 +382,7 @@ struct drm_buf_map {
>  	struct drm_buf_pub __user *list;	/**< Buffer information */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_DMA ioctl argument type.
>   *
>   * Indices here refer to the offset into the buffer list in drm_buf_get.
> @@ -407,7 +407,7 @@ enum drm_ctx_flags {
>  	_DRM_CONTEXT_2DONLY = 0x02
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_ADD_CTX ioctl argument type.
>   *
>   * \sa drmCreateContext() and drmDestroyContext().
> @@ -417,7 +417,7 @@ struct drm_ctx {
>  	enum drm_ctx_flags flags;
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_RES_CTX ioctl argument type.
>   */
>  struct drm_ctx_res {
> @@ -425,14 +425,14 @@ struct drm_ctx_res {
>  	struct drm_ctx __user *contexts;
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_ADD_DRAW and DRM_IOCTL_RM_DRAW ioctl argument type.
>   */
>  struct drm_draw {
>  	drm_drawable_t handle;
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_UPDATE_DRAW ioctl argument type.
>   */
>  typedef enum {
> @@ -446,14 +446,14 @@ struct drm_update_draw {
>  	unsigned long long data;
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_GET_MAGIC and DRM_IOCTL_AUTH_MAGIC ioctl argument type.
>   */
>  struct drm_auth {
>  	drm_magic_t magic;
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_IRQ_BUSID ioctl argument type.
>   *
>   * \sa drmGetInterruptFromBusID().
> @@ -495,7 +495,7 @@ struct drm_wait_vblank_reply {
>  	long tval_usec;
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_WAIT_VBLANK ioctl argument type.
>   *
>   * \sa drmWaitVBlank().
> @@ -508,7 +508,7 @@ union drm_wait_vblank {
>  #define _DRM_PRE_MODESET 1
>  #define _DRM_POST_MODESET 2
>  
> -/**
> +/*
>   * DRM_IOCTL_MODESET_CTL ioctl argument type
>   *
>   * \sa drmModesetCtl().
> @@ -518,7 +518,7 @@ struct drm_modeset_ctl {
>  	__u32 cmd;
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_AGP_ENABLE ioctl argument type.
>   *
>   * \sa drmAgpEnable().
> @@ -527,7 +527,7 @@ struct drm_agp_mode {
>  	unsigned long mode;	/**< AGP mode */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_AGP_ALLOC and DRM_IOCTL_AGP_FREE ioctls argument type.
>   *
>   * \sa drmAgpAlloc() and drmAgpFree().
> @@ -539,7 +539,7 @@ struct drm_agp_buffer {
>  	unsigned long physical;	/**< Physical used by i810 */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_AGP_BIND and DRM_IOCTL_AGP_UNBIND ioctls argument type.
>   *
>   * \sa drmAgpBind() and drmAgpUnbind().
> @@ -549,7 +549,7 @@ struct drm_agp_binding {
>  	unsigned long offset;	/**< In bytes -- will round to page boundary */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_AGP_INFO ioctl argument type.
>   *
>   * \sa drmAgpVersionMajor(), drmAgpVersionMinor(), drmAgpGetMode(),
> @@ -570,7 +570,7 @@ struct drm_agp_info {
>  	unsigned short id_device;
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_SG_ALLOC ioctl argument type.
>   */
>  struct drm_scatter_gather {
> @@ -578,7 +578,7 @@ struct drm_scatter_gather {
>  	unsigned long handle;	/**< Used for mapping / unmapping */
>  };
>  
> -/**
> +/*
>   * DRM_IOCTL_SET_VERSION ioctl argument type.
>   */
>  struct drm_set_version {
> @@ -588,14 +588,14 @@ struct drm_set_version {
>  	int drm_dd_minor;
>  };
>  
> -/** DRM_IOCTL_GEM_CLOSE ioctl argument type */
> +/* DRM_IOCTL_GEM_CLOSE ioctl argument type */
>  struct drm_gem_close {
>  	/** Handle of the object to be closed. */
>  	__u32 handle;
>  	__u32 pad;
>  };
>  
> -/** DRM_IOCTL_GEM_FLINK ioctl argument type */
> +/* DRM_IOCTL_GEM_FLINK ioctl argument type */
>  struct drm_gem_flink {
>  	/** Handle for the object being named */
>  	__u32 handle;
> @@ -604,7 +604,7 @@ struct drm_gem_flink {
>  	__u32 name;
>  };
>  
> -/** DRM_IOCTL_GEM_OPEN ioctl argument type */
> +/* DRM_IOCTL_GEM_OPEN ioctl argument type */
>  struct drm_gem_open {
>  	/** Name of object being opened */
>  	__u32 name;
> @@ -642,7 +642,7 @@ struct drm_gem_open {
>  #define DRM_CAP_SYNCOBJ		0x13
>  #define DRM_CAP_SYNCOBJ_TIMELINE	0x14
>  
> -/** DRM_IOCTL_GET_CAP ioctl argument type */
> +/* DRM_IOCTL_GET_CAP ioctl argument type */
>  struct drm_get_cap {
>  	__u64 capability;
>  	__u64 value;
> @@ -690,7 +690,7 @@ struct drm_get_cap {
>   */
>  #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
>  
> -/** DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
> +/* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>  struct drm_set_client_cap {
>  	__u64 capability;
>  	__u64 value;
> @@ -942,7 +942,7 @@ extern "C" {
>  
>  #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
>  
> -/**
> +/*
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.
>   * Generic IOCTLS restart at 0xA0.
> @@ -953,7 +953,7 @@ extern "C" {
>  #define DRM_COMMAND_BASE                0x40
>  #define DRM_COMMAND_END			0xA0
>  
> -/**
> +/*
>   * Header for events written back to userspace on the drm fd.  The
>   * type defines the type of event, the length specifies the total
>   * length of the event (including the header), and user_data is
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
