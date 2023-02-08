Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE5D68F690
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 19:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3143710E80B;
	Wed,  8 Feb 2023 18:06:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1539910E80B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 18:06:24 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id a10so14532762edu.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Feb 2023 10:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=n6gBVMW0HYobaV+4xxdawYbFT2Qb/O6rq9vWjh5VaUI=;
 b=X2648YS54L5yACdJho8gIuPx12IMwpB310/jr1eStBt5wtimPpnEuQINWlcT1rK+3H
 4PG207c3yVnWsLN1LF4lWWejRKoCyDVp2EkwXwJbZ0VqC6HnqtDhIZveZJymanYJjXU2
 a58zh3/0G6+PzwProtNpAhQd9TMQN15Jc8HI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n6gBVMW0HYobaV+4xxdawYbFT2Qb/O6rq9vWjh5VaUI=;
 b=La6s+1Yha1Pjp7bM87KjUzFWc5ik+Tzy5l2ouJjy79CftxtxLaSxdFVFeN0la8unn7
 Zpt18NF9ifNpOaNzs8MlPnVXLET6Wkp+v95EisnRRs+s/ERmycF9SGS6zzRVkqtHr5L6
 pcaJBfi8wxZVvpecnXkpYvUwAnXw4OUk1VXCziZ9tL4GDzhX5yZGCV9zhMP0Fx0MqzGV
 XSuHB3OGXfPp4dSiI8ag+HQ4WoLpn6reJalV/DlJoU5F1bTtWKabi8Ujv5GsgaYsEMMq
 KCM6rPuAxrHRKzqJtWHnvVyMHs2K48Rp19I6E6aj4HaqsDxmukawL7oNZth0ktlLqyMe
 nyzw==
X-Gm-Message-State: AO0yUKV+UgtX0ZEJ+7ZlScVDMxXcFy91aQmKiKUtpjeRapjzl5MmfA9V
 kyvQkjSatNvCj59fGN9PdNTodg==
X-Google-Smtp-Source: AK7set/JKZDWgMoFe8ItCYE2g0Akc8TDUzrL0rPEBkeXrNIiX/7Xl/F7Bhnf0jKIlSOeeuTnGumlGQ==
X-Received: by 2002:a05:6402:278a:b0:4aa:b394:7b30 with SMTP id
 b10-20020a056402278a00b004aab3947b30mr10145733ede.3.1675879582436; 
 Wed, 08 Feb 2023 10:06:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 fd8-20020a056402388800b004a245350e0fsm8204731edb.36.2023.02.08.10.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 10:06:21 -0800 (PST)
Date: Wed, 8 Feb 2023 19:06:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v3 1/6] drm/debugfs: Introduce wrapper for debugfs list
Message-ID: <Y+Pkm3ORQAipa/iD@phenom.ffwll.local>
References: <20230131195825.677487-1-mcanal@igalia.com>
 <20230131195825.677487-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230131195825.677487-2-mcanal@igalia.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 04:58:21PM -0300, Maíra Canal wrote:
> Introduce a struct wrapper for all the debugfs-related stuff: the list
> of debugfs files and the mutex that protects it. This will make it
> easier to initialize all the debugfs list in a DRM object and will
> create a good abstraction for a possible implementation of the debugfs
> infrastructure for KMS objects.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/drm_debugfs.c  | 18 ++++++++++++++++++
>  drivers/gpu/drm/drm_internal.h | 12 ++++++++++++
>  include/drm/drm_debugfs.h      | 16 ++++++++++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 4f643a490dc3..8658d3929ea5 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -218,6 +218,24 @@ void drm_debugfs_create_files(const struct drm_info_list *files, int count,
>  }
>  EXPORT_SYMBOL(drm_debugfs_create_files);
>  
> +struct drm_debugfs_files *drm_debugfs_files_init(void)
> +{
> +	struct drm_debugfs_files *debugfs_files;
> +
> +	debugfs_files = kzalloc(sizeof(*debugfs_files), GFP_KERNEL);
> +
> +	INIT_LIST_HEAD(&debugfs_files->list);
> +	mutex_init(&debugfs_files->mutex);
> +
> +	return debugfs_files;
> +}
> +
> +void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files)
> +{
> +	mutex_destroy(&debugfs_files->mutex);
> +	kfree(debugfs_files);
> +}
> +
>  int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  		     struct dentry *root)
>  {
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index ed2103ee272c..f1c8766ed828 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -23,6 +23,7 @@
>  
>  #include <linux/kthread.h>
>  
> +#include <drm/drm_debugfs.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_vblank.h>
>  
> @@ -183,6 +184,8 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
>  
>  /* drm_debugfs.c drm_debugfs_crc.c */
>  #if defined(CONFIG_DEBUG_FS)
> +struct drm_debugfs_files *drm_debugfs_files_init(void);
> +void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files);
>  int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  		     struct dentry *root);
>  void drm_debugfs_cleanup(struct drm_minor *minor);
> @@ -193,6 +196,15 @@ void drm_debugfs_crtc_add(struct drm_crtc *crtc);
>  void drm_debugfs_crtc_remove(struct drm_crtc *crtc);
>  void drm_debugfs_crtc_crc_add(struct drm_crtc *crtc);
>  #else
> +static inline struct drm_debugfs_files *drm_debugfs_files_init(void)
> +{
> +	return NULL;
> +}
> +
> +static inline void drm_debugfs_files_destroy(struct drm_debugfs_files *debugfs_files)
> +{
> +}
> +
>  static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  				   struct dentry *root)
>  {
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index 7616f457ce70..423aa3de506a 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -32,6 +32,8 @@
>  #ifndef _DRM_DEBUGFS_H_
>  #define _DRM_DEBUGFS_H_
>  
> +#include <linux/list.h>
> +#include <linux/mutex.h>
>  #include <linux/types.h>
>  #include <linux/seq_file.h>
>  /**
> @@ -79,6 +81,20 @@ struct drm_info_node {
>  	struct dentry *dent;
>  };
>  
> +/**
> + * struct drm_debugfs_files - Encapsulates the debugfs list and its mutex
> + *
> + * This structure represents the debugfs list of files and is encapsulated
> + * with a mutex to protect the access of the list.
> + */
> +struct drm_debugfs_files {
> +	/** @list: List of debugfs files to be created by the DRM object. */
> +	struct list_head list;
> +
> +	/** @mutex: Protects &list access. */
> +	struct mutex mutex;

I'm not seeing any use for the mutex here? Also unless you also plan to
put like the debugfs directory pointers in this struct, I'm not sure we
need this abstraction since it's purely internal to debugfs code (so also
should really be in the headers where drivers could perhaps come up with
funny ideas).
-Daniel

> +};
> +
>  /**
>   * struct drm_debugfs_info - debugfs info list entry
>   *
> -- 
> 2.39.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
