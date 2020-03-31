Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BE9198D7E
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1E66E5A1;
	Tue, 31 Mar 2020 07:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F8C6E5A1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 07:53:22 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id j17so24564089wru.13
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 00:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S0KxvCqxBZk4sWOz4tVh19Ritd4Pzuy2JWFMwb/O6BM=;
 b=UOWFOcw6TKU6adH6piPOosGJb91GVg1vQ+KL4dzKAS0APRqmPNZ2nrCdqFF4p1lwSX
 gOtU7sfj51QZkDgRBHBsK/hkI/MHtHZ4wqY2ScG+YJJtAfBwMsuzmxsBP8rFuAJPeA3L
 M2brBFCMffe8lZk/REVD3CDE9gbHyO18P1Z2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S0KxvCqxBZk4sWOz4tVh19Ritd4Pzuy2JWFMwb/O6BM=;
 b=aHtL5KuBXJL43ugMnniQqnHPTb7361FNtUti3FGtiGXq0zsoPQob3C8PMyiMmZMvYC
 lEcjhpYyBgrn3hcrowRdOtfW7Uhp1NnUFDpOPmlHmb8hrP0TFnYdTY3cIbiQ6OLQsh3Z
 by3IMFdUVlbdjWPI5DL1p9vxFnxSoilin2MUmIU14ooxd7XX5/cjF1ZYPeYQmjGbx3fa
 Xcxmn6TBpBjxyYkiVbcQZTWgMk29otqjdCKDsyNcL6F2KjCgJJ+JAlE0EJMMgxV4ripy
 qBwHLuKWxDn+DGV1M60xQiHxwkzLto/ZNS97XPVgo2AQyDjA556dtMLD0+aE/uu1NhER
 eDtw==
X-Gm-Message-State: ANhLgQ38utxZHhqDGA5jHhW9m5Vng0yJ4GrAkgyEBC3DOhSWqLkZUHxV
 Z8/BbGmHwMc1a+vHddVgOY3wTw==
X-Google-Smtp-Source: ADFU+vv4I948In8ej/FdRUvNhN9qFDiuEAf+hOyidfoNtlWmORSUtL0K6RL1VTkU3xloWt5i8I4sFQ==
X-Received: by 2002:adf:feca:: with SMTP id q10mr18741830wrs.199.1585641201094; 
 Tue, 31 Mar 2020 00:53:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s66sm607912wme.40.2020.03.31.00.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 00:53:20 -0700 (PDT)
Date: Tue, 31 Mar 2020 09:53:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 4/6] drm: writeback: document callbacks
Message-ID: <20200331075318.GF2363188@phenom.ffwll.local>
References: <20200328132025.19910-1-sam@ravnborg.org>
 <20200328132025.19910-5-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328132025.19910-5-sam@ravnborg.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Nirmoy Das <nirmoy.das@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 28, 2020 at 02:20:23PM +0100, Sam Ravnborg wrote:
> Document the callbacks:
>     drm_connector_helper_funcs.prepare_writeback_job
>     drm_connector_helper_funcs.cleanup_writeback_job
> 
> The documentation was pulled from the changelong introducing the
> callbacks, originally written by Laurent.
> 
> Addign the missing documentation fixes the following warnings:
> drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'prepare_writeback_job' not described in 'drm_connector_helper_funcs'
> drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'cleanup_writeback_job' not described in 'drm_connector_helper_funcs'
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> ---
>  include/drm/drm_modeset_helper_vtables.h | 31 ++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index 7c20b1c8b6a7..c51bca1ffec7 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1075,8 +1075,39 @@ struct drm_connector_helper_funcs {
>  	void (*atomic_commit)(struct drm_connector *connector,
>  			      struct drm_connector_state *state);
>  
> +	/**
> +	 * @prepare_writeback_job:

Formatting looks funny, your linebreaks here won't go into the generated
html and are a bit unusual. I'd remove them and just flow this as a full
paragraph.

> +	 *
> +	 * As writeback jobs contain a framebuffer, drivers may need to
> +	 * prepare and cleanup them the same way they can prepare and
> +	 * cleanup framebuffers for planes.
> +	 * This optional connector operation is used to support the
> +	 * preparation of writeback jobs.
> +	 * The job prepare operation is called from
> +	 * drm_atomic_helper_prepare_planes() to avoid a new atomic commit
> +	 * helper that would need to be called by all drivers not using
> +	 * drm_atomic_helper_commit().

I'd delete "to avoid a new ..." until the end of the sentence. That feels
more like stuff in the commit message/review than kernel docs for driver
writers.

Instead maybe add "... for struct &drm_writeback_connector connectors
only." This gives us a nice link to the writeback docs, and makes it clear
that this isn't some general prep/cleanup thing. Similar addition below.

> +	 *
> +	 * This hook is optional.
> +	 *
> +	 * This callback is used by the atomic modeset helpers.
> +	 */
>  	int (*prepare_writeback_job)(struct drm_writeback_connector *connector,
>  				     struct drm_writeback_job *job);
> +	/**
> +	 * @cleanup_writeback_job:
> +	 *
> +	 * This optional connector operation is used to support the
> +	 * cleanup of writeback jobs.
> +	 * The job cleanup operation is called from the existing
> +	 * drm_writeback_cleanup_job() function, invoked both when
> +	 * destroying the job as part of a aborted commit, or when
> +	 * the job completes.
> +	 *
> +	 * This hook is optional.
> +	 *
> +	 * This callback is used by the atomic modeset helpers.
> +	 */
>  	void (*cleanup_writeback_job)(struct drm_writeback_connector *connector,
>  				      struct drm_writeback_job *job);

With the bikesheds addressed as you see fit:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also Laurent owes you one, I've been pestering to fill this gap in his
docs since forever ...

Cheers, Daniel

>  };
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
