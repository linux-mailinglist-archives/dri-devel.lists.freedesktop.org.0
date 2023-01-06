Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFED66080F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 21:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBC010E8ED;
	Fri,  6 Jan 2023 20:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F1F910E8ED
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 20:19:09 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so1864251wms.4
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 12:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HIAM0suU1+vto0GHCwsmDjqm/WjWit3Redd5TQMQDhw=;
 b=C/ZaMvDpAUoVg8tJA4m7T8tRcV/yfg+m1Jbs73a3nblep+fFepL1aUZ+croiJENWAk
 X0ldr8dkvjdArkV5aSwkK74saT7DyFA8842tfGzDi2armdgh+QHdj5BAebZxql0/eXI/
 7Vh5c60HarHMJ3S2NG3ZX9qmvele2XWlUlIM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HIAM0suU1+vto0GHCwsmDjqm/WjWit3Redd5TQMQDhw=;
 b=Om6K1thBPCIPyI4yd5ygrzldedjhP6onqblFbKfH4PsOn2qAFKwmGbCLe14hgF5MRg
 vVSiGyihAXlWuXB1RQkXiVdFauyOmVAA4q9QhUgAJZqfo69QbRTklNNNKM+yvz2RthIe
 V9qPZgMByXdrXu+8qq/MlTNuj6tgushbtyY9inzhThfEYKch/s/BM+pbNTQa93Wmkyyw
 eaC8zsl/cjJcjiuwncSN5U9QD3TKpY5CDMHnSYZEumw7ilsZYleUxszvDoxhd8gS8Nei
 CbK5CZLzMlt5jvLHVFkAuSfkfxm2GG4XPcU/5b3GVSrqQ48g2ItNkksLf+XDUgb5mE9L
 SxCQ==
X-Gm-Message-State: AFqh2koe6E7ykyxOdOUU+LDIAUanJz58SJm/UaFo7P1N4i9k4aoaPAww
 P4+1P2D7JCTypnx+p3i+U9uGDg==
X-Google-Smtp-Source: AMrXdXttFvNQSvhSh/wyqzgV6fjfB2h+/lik9CCASkQZcxzJzoE2G7j1I1mV0/4AJXiZqV/5pGaAiQ==
X-Received: by 2002:a05:600c:1503:b0:3d0:8722:a145 with SMTP id
 b3-20020a05600c150300b003d08722a145mr39134766wmg.40.1673036347651; 
 Fri, 06 Jan 2023 12:19:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b003d96efd09b7sm8950446wmp.19.2023.01.06.12.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 12:19:06 -0800 (PST)
Date: Fri, 6 Jan 2023 21:19:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH 2/2] drm/debugfs: add descriptions to struct parameters
Message-ID: <Y7iCOD1mylBX/VuB@phenom.ffwll.local>
Mail-Followup-To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20230105193039.287677-1-mcanal@igalia.com>
 <20230105193039.287677-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105193039.287677-2-mcanal@igalia.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 04:30:39PM -0300, Maíra Canal wrote:
> The structs drm_debugfs_info and drm_debugfs_entry don't have
> descriptions for their parameters, which is causing the following warnings:
> 
> include/drm/drm_debugfs.h:93: warning: Function parameter or member
> 'name' not described in 'drm_debugfs_info'
> include/drm/drm_debugfs.h:93: warning: Function parameter or member
> 'show' not described in 'drm_debugfs_info'
> include/drm/drm_debugfs.h:93: warning: Function parameter or member
> 'driver_features' not described in 'drm_debugfs_info'
> include/drm/drm_debugfs.h:93: warning: Function parameter or member
> 'data' not described in 'drm_debugfs_info'
> include/drm/drm_debugfs.h:105: warning: Function parameter or member
> 'dev' not described in 'drm_debugfs_entry'
> include/drm/drm_debugfs.h:105: warning: Function parameter or member
> 'file' not described in 'drm_debugfs_entry'
> include/drm/drm_debugfs.h:105: warning: Function parameter or member
> 'list' not described in 'drm_debugfs_entry'
> 
> Therefore, fix the warnings by adding descriptions to all struct
> parameters.
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>  include/drm/drm_debugfs.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
> index 53b7297260a5..7616f457ce70 100644
> --- a/include/drm/drm_debugfs.h
> +++ b/include/drm/drm_debugfs.h
> @@ -86,9 +86,22 @@ struct drm_info_node {
>   * core.
>   */
>  struct drm_debugfs_info {
> +	/** @name: File name */
>  	const char *name;
> +
> +	/**
> +	 * @show:
> +	 *
> +	 * Show callback. &seq_file->private will be set to the &struct
> +	 * drm_debugfs_entry corresponding to the instance of this info
> +	 * on a given &struct drm_device.

So this is a bit late, but why don't we pass that drm_debugfs_entry as an
explicit parameter? Or maybe just the struct drm_device, because that and
the void *data is really all there is to pass along. Would give us more
type-safety, which really is the main reason for having drm-specific
debugfs functions.

Either way, on the series: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	 */
>  	int (*show)(struct seq_file*, void*);
> +
> +	/** @driver_features: Required driver features for this entry. */
>  	u32 driver_features;
> +
> +	/** @data: Driver-private data, should not be device-specific. */
>  	void *data;
>  };
>  
> @@ -99,8 +112,13 @@ struct drm_debugfs_info {
>   * drm_debugfs_info on a &struct drm_device.
>   */
>  struct drm_debugfs_entry {
> +	/** @dev: &struct drm_device for this node. */
>  	struct drm_device *dev;
> +
> +	/** @file: Template for this node. */
>  	struct drm_debugfs_info file;
> +
> +	/** @list: Linked list of all device nodes. */
>  	struct list_head list;
>  };
>  
> -- 
> 2.39.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
