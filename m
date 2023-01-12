Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A963666DDF
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7E910E8AA;
	Thu, 12 Jan 2023 09:14:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C4A10E8AA
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:14:30 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id l22so13450517eja.12
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Pja2gNWe2ReN5OXStdYLwxGkpVO8jliGiR3pyji90D8=;
 b=kizQr5rmGz5AOuclBEofdG+DJjG/LDElqqQS6UcahaCADCVMHshbZz90U5iV6xtwkE
 nctRulYesp8OUEkxpJFXOQQUv9SeB2xEDw1caufDFTzNog8Y21cIV6lGtTEWWtkbHE3N
 dNZv6FZe7wC2dO/sPXDAFnSlYvdBFsiTeBQLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pja2gNWe2ReN5OXStdYLwxGkpVO8jliGiR3pyji90D8=;
 b=Ewca1Wj3KgCLF60EXL2weLgtRkzk5r/fXlRCZ7QQphYVqluwre0cr4QBBjTfPKMjQc
 oWDEhKVOPJ9DvJDIUmWJo5oenNEGQ1ILQPkmYNcPEvu/hpbGsrtZjGa/2fg1kOb2fHd+
 9Fv09Ob4TcuA6QsJK54qjTyi3w+FJNuc2r1vqx5rsGVQjGqyyz42pV2YyBhhTxRDi65Y
 BicsqSh7rCeqM4QRVA+4Sq9zrvSSlsFNoYqZrXmlC3aawIeldDsBZn00yWawr5wew1a8
 kM//pK9tmXB6yBxM1iNiTYdX5UBGWhdni4KyHlw359uzxhjDFeK0R8q3qwCE+gX3A6Ko
 LDSg==
X-Gm-Message-State: AFqh2kqJ4tCl8fkLP3WxWE9MTFBNBF2+tavCgdLl63+LcAB2Ivlzn9rj
 GNVoOKVsr0VyYSCwNxw8lhAHeQ==
X-Google-Smtp-Source: AMrXdXvLi4nimrEjxLSpb6M3x2rEbBKYeMX6sf4txgnzpLh7r8nKWLTlcNys0bI+xqxEbG73LKJIfQ==
X-Received: by 2002:a17:906:dfcd:b0:7ff:7876:9c5d with SMTP id
 jt13-20020a170906dfcd00b007ff78769c5dmr62889457ejc.62.1673514868785; 
 Thu, 12 Jan 2023 01:14:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a17090653c500b007ae32daf4b9sm7225082ejo.106.2023.01.12.01.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:14:28 -0800 (PST)
Date: Thu, 12 Jan 2023 10:14:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 03/13] drm/debugfs: Create a debugfs infrastructure for
 connectors
Message-ID: <Y7/PclxPD6fZg5Vj@phenom.ffwll.local>
References: <20230111173748.752659-1-mcanal@igalia.com>
 <20230111173748.752659-4-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230111173748.752659-4-mcanal@igalia.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, Alain Volmat <alain.volmat@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 02:37:38PM -0300, Maíra Canal wrote:
> Introduce the ability to add DRM debugfs files to a list managed by the
> connector and, during drm_connector_register(), all added files will be
> created at once.
> 
> Moreover, introduce some typesafety as struct drm_debugfs_connector_entry
> holds a drm_connector instead of a drm_device. So, the drivers can get
> a connector object directly from the struct drm_debugfs_connector_entry
> in the show() callback.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  drivers/gpu/drm/drm_connector.c |  5 +++++
>  drivers/gpu/drm/drm_debugfs.c   | 35 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_internal.h  |  5 +++++
>  include/drm/drm_connector.h     | 15 ++++++++++++++
>  include/drm/drm_debugfs.h       | 26 ++++++++++++++++++++++++
>  5 files changed, 86 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 8d92777e57dd..c93655bb0edf 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -273,8 +273,10 @@ static int __drm_connector_init(struct drm_device *dev,
>  	INIT_LIST_HEAD(&connector->global_connector_list_entry);
>  	INIT_LIST_HEAD(&connector->probed_modes);
>  	INIT_LIST_HEAD(&connector->modes);
> +	INIT_LIST_HEAD(&connector->debugfs_list);
>  	mutex_init(&connector->mutex);
>  	mutex_init(&connector->edid_override_mutex);
> +	mutex_init(&connector->debugfs_mutex);
>  	connector->edid_blob_ptr = NULL;
>  	connector->epoch_counter = 0;
>  	connector->tile_blob_ptr = NULL;
> @@ -581,6 +583,7 @@ void drm_connector_cleanup(struct drm_connector *connector)
>  						       connector->state);
>  
>  	mutex_destroy(&connector->mutex);
> +	mutex_destroy(&connector->debugfs_mutex);
>  
>  	memset(connector, 0, sizeof(*connector));
>  
> @@ -627,6 +630,8 @@ int drm_connector_register(struct drm_connector *connector)
>  			goto err_debugfs;
>  	}
>  
> +	drm_debugfs_connector_init(connector);
> +
>  	drm_mode_object_register(connector->dev, &connector->base);
>  
>  	connector->registration_state = DRM_CONNECTOR_REGISTERED;
> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
> index 23f6ed7b5d68..d9ec1ed5a7ec 100644
> --- a/drivers/gpu/drm/drm_debugfs.c
> +++ b/drivers/gpu/drm/drm_debugfs.c
> @@ -260,6 +260,17 @@ int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  	return 0;
>  }
>  
> +void drm_debugfs_connector_init(struct drm_connector *connector)
> +{
> +	struct drm_minor *minor = connector->dev->primary;
> +	struct drm_debugfs_connector_entry *entry, *tmp;
> +
> +	if (!minor)
> +		return;
> +
> +	drm_create_file_from_list(connector);
> +}
> +
>  void drm_debugfs_late_register(struct drm_device *dev)
>  {
>  	struct drm_minor *minor = dev->primary;
> @@ -369,6 +380,30 @@ void drm_debugfs_add_files(struct drm_device *dev, const struct drm_debugfs_info
>  }
>  EXPORT_SYMBOL(drm_debugfs_add_files);
>  
> +/**
> + * drm_debugfs_connector_add_file - Add a given file to the DRM connector debugfs file list
> + * @connector: DRM connector object
> + * @name: debugfs file name
> + * @show: show callback
> + * @data: driver-private data, should not be device-specific
> + *
> + * Add a given file entry to the DRM connector debugfs file list to be created on
> + * drm_debugfs_connector_init().
> + */
> +void drm_debugfs_connector_add_file(struct drm_connector *connector, const char *name,
> +				    int (*show)(struct seq_file*, void*), void *data)
> +{
> +	struct drm_debugfs_connector_entry *entry = drmm_kzalloc(connector->dev,
> +								 sizeof(*entry),
> +								 GFP_KERNEL);
> +
> +	if (!entry)
> +		return;
> +
> +	drm_debugfs_add_file_to_list(connector);
> +}
> +EXPORT_SYMBOL(drm_debugfs_connector_add_file);
> +
>  static int connector_show(struct seq_file *m, void *data)
>  {
>  	struct drm_connector *connector = m->private;
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index ed2103ee272c..dd9d7b8b45bd 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -185,6 +185,7 @@ int drm_gem_dumb_destroy(struct drm_file *file, struct drm_device *dev,
>  #if defined(CONFIG_DEBUG_FS)
>  int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  		     struct dentry *root);
> +void drm_debugfs_connector_init(struct drm_connector *connector);
>  void drm_debugfs_cleanup(struct drm_minor *minor);
>  void drm_debugfs_late_register(struct drm_device *dev);
>  void drm_debugfs_connector_add(struct drm_connector *connector);
> @@ -199,6 +200,10 @@ static inline int drm_debugfs_init(struct drm_minor *minor, int minor_id,
>  	return 0;
>  }
>  
> +static inline void drm_debugfs_connector_init(struct drm_connector *connector)
> +{
> +}
> +
>  static inline void drm_debugfs_cleanup(struct drm_minor *minor)
>  {
>  }
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 9037f1317aee..51340f3162ed 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -1720,6 +1720,21 @@ struct drm_connector {
>  	/** @debugfs_entry: debugfs directory for this connector */
>  	struct dentry *debugfs_entry;
>  
> +	/**
> +	 * @debugfs_mutex:
> +	 *
> +	 * Protects &debugfs_list access.
> +	 */
> +	struct mutex debugfs_mutex;
> +
> +	/**
> +	 * @debugfs_list:
> +	 *
> +	 * List of debugfs files to be created by the DRM connector. The files
> +	 * must be added during drm_connector_register().
> +	 */
> +	struct list_head debugfs_list;
> +
>  	/**
>  	 * @state:
>  	 *
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index 7616f457ce70..c09c82274622 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -122,6 +122,23 @@ struct drm_debugfs_entry {
>  	struct list_head list;
>  };
>  
> +/**
> + * struct drm_debugfs_connector_entry - Per-connector debugfs node structure
> + *
> + * This structure represents a debugfs file, as an instantiation of a &struct
> + * drm_debugfs_info on a &struct drm_connector.
> + */
> +struct drm_debugfs_connector_entry {
> +	/** @connector: &struct drm_connector for this node. */
> +	struct drm_connector *connector;
> +
> +	/** @file: Template for this node. */
> +	struct drm_debugfs_info file;
> +
> +	/** @list: Linked list of all connector nodes. */
> +	struct list_head list;
> +};

I missed it in the main api, but I'm not a big fan of exposing this struct
to driver. And I don't see the need ... if we just directly put the
drm_connector into seq_file->private (or an explicit parameter for our
show function, with some glue provided) then drivers don't need to be able
to see this? This really should be just an implementation detail I think.
-Daniel

> +
>  #if defined(CONFIG_DEBUG_FS)
>  void drm_debugfs_create_files(const struct drm_info_list *files,
>  			      int count, struct dentry *root,
> @@ -134,6 +151,9 @@ void drm_debugfs_add_file(struct drm_device *dev, const char *name,
>  
>  void drm_debugfs_add_files(struct drm_device *dev,
>  			   const struct drm_debugfs_info *files, int count);
> +
> +void drm_debugfs_connector_add_file(struct drm_connector *connector, const char *name,
> +				    int (*show)(struct seq_file*, void*), void *data);
>  #else
>  static inline void drm_debugfs_create_files(const struct drm_info_list *files,
>  					    int count, struct dentry *root,
> @@ -155,6 +175,12 @@ static inline void drm_debugfs_add_files(struct drm_device *dev,
>  					 const struct drm_debugfs_info *files,
>  					 int count)
>  {}
> +
> +static inline void drm_debugfs_connector_add_file(struct drm_connector *connector,
> +						  const char *name,
> +						  int (*show)(struct seq_file*, void*),
> +						  void *data)
> +{}
>  #endif
>  
>  #endif /* _DRM_DEBUGFS_H_ */
> -- 
> 2.39.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
