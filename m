Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53689365518
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 11:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D8D6E4CA;
	Tue, 20 Apr 2021 09:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA746E4D0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 09:14:58 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id i3so18459202edt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 02:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dDLj435FJMgcHMaZd0a0zuW5fuAcU2aysUyArWhQuts=;
 b=NuoG+QINVS+BPXIBxMGFC/Raj89b//b09Ra0dUEJVuf771afdMBlFZHK/UR92mf81J
 7vX4/cWulGt3c2tKbmZUtRSPzxbhcwBbm6IusAPBUW5EfQIZ2z9kNINF32owD6W8MZ0j
 g0a4P1nOSW3HgUQeNiGdMu2E+JgUYPP6sbpDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dDLj435FJMgcHMaZd0a0zuW5fuAcU2aysUyArWhQuts=;
 b=NhbdFKOJ7am3NitO+jub6UpyGmUVpsdxICNeAdbp4xGoEI2QL9ZxactLSHykQK4b00
 x+BNZquKKja6AspxKqGEJjkdS2J1FPHf/Vw2grV3K7N0DeAPAvYxyUHYh+3NDrxWVV/M
 uuNutGmlLU9EiGOswUtFs7/RH40q/IDXiCgWl5kREA0S5hiFju5DuBwnFornWHOveONs
 I+Hlwm9rPBDzmwQ48fyHX0KE5Mu1jdUWgT6go5Tw9ao1iDArRXxNwiCxWe0h/jrwDLGO
 6wxM8QGCmD6MZKMRLTI877y9O9OoXg/YsX8mbr/ku/vL1v5vHmBTebwxjEnOdH/G34pZ
 LLyg==
X-Gm-Message-State: AOAM5300SPUS1nhJQuzYWDlko3cgwlgDYtxGnsLxogy7sWt0QeHjAZvs
 W7keOKunmhZ91V93yT4AU6Omog==
X-Google-Smtp-Source: ABdhPJzV4lwY3iOa44gfO+oUTYnxBFLQdQr8pp21pYL/1rShKgNxEaS68+F/ekk56dG40O6/zUyUuw==
X-Received: by 2002:aa7:c40b:: with SMTP id j11mr31277776edq.219.1618910097038; 
 Tue, 20 Apr 2021 02:14:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id by27sm11842302ejc.47.2021.04.20.02.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 02:14:56 -0700 (PDT)
Date: Tue, 20 Apr 2021 11:14:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/connector: demote connector force-probes for
 non-master clients
Message-ID: <YH6bjle8zyejKJD0@phenom.ffwll.local>
References: <20210402112212.5625-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210402112212.5625-1-contact@emersion.fr>
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

On Fri, Apr 02, 2021 at 01:22:12PM +0200, Simon Ser wrote:
> Force-probing a connector can be slow and cause flickering. As this
> affects the global KMS state, let's make it so only the DRM master
> can force-probe a connector.
> 
> Non-master DRM clients won't be able to force-probe a connector
> anymore. Instead, KMS will perform a regular read-only connector
> query.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 11 ++++++++---
>  include/uapi/drm/drm_mode.h     |  7 ++++---
>  2 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 7631f76e7f34..2f70a52a892b 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -20,6 +20,7 @@
>   * OF THIS SOFTWARE.
>   */
>  
> +#include <drm/drm_auth.h>
>  #include <drm/drm_connector.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_encoder.h>
> @@ -2374,9 +2375,13 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
>  
>  	mutex_lock(&dev->mode_config.mutex);
>  	if (out_resp->count_modes == 0) {
> -		connector->funcs->fill_modes(connector,
> -					     dev->mode_config.max_width,
> -					     dev->mode_config.max_height);
> +		if (drm_is_current_master(file_priv))
> +			connector->funcs->fill_modes(connector,
> +						     dev->mode_config.max_width,
> +						     dev->mode_config.max_height);
> +		else
> +			drm_dbg_kms(dev, "User-space requested a forced probe on [CONNECTOR:%d:%s] but is not the DRM master, demoting to read-only probe",
> +				    connector->base.id, connector->name);
>  	}
>  
>  	out_resp->mm_width = connector->display_info.width_mm;
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index a5e76aa06ad5..3efa2e38d89b 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -413,9 +413,10 @@ enum drm_mode_subconnector {
>   *
>   * **Force-probing a connector**
>   *
> - * If the @count_modes field is set to zero, the kernel will perform a forced
> - * probe on the connector to refresh the connector status, modes and EDID.
> - * A forced-probe can be slow, might cause flickering and the ioctl will block.
> + * If the @count_modes field is set to zero and the DRM client is the DRM

*current* DRM master

The drm master/client relationship survives a DROPMASTER ioctl, but also
it's only really relevant for the old authmagic dance. But just to be
consistent here.

> + * master, the kernel will perform a forced probe on the connector to refresh
> + * the connector status, modes and EDID. A forced-probe can be slow, might
> + * cause flickering and the ioctl will block.

Do we have an igt for this? Timing test should do the job I think,
assuming we have at least one output which requires an edid read (so maybe
skip the test if a forced probe takes less than 10ms or so).

Patch lgtm, but igt would be really nice here.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>   *
>   * User-space needs to force-probe connectors to ensure their metadata is
>   * up-to-date at startup and after receiving a hot-plug event. User-space
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
