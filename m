Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B021ECB69
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 10:24:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED716E087;
	Wed,  3 Jun 2020 08:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAFB6E087
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 08:24:14 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c71so984614wmd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jun 2020 01:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=qRRViGgr/XMXuK899gyJpd+glkMI9g3TUAqhc5bIdms=;
 b=diAPk9NzqmTTMCUpwWl/9I43wRC0s9YisBeaJ3i/Ao27NvMQV2tq0o/amb5EsgN5Dc
 m7UOzOkQ1IcJFbc/rP+zbfrn4e78xzB8fxvBTJwqpUCIS+KXHxZzWv0fJ8aqglCSFuUF
 PsgSO47gzy0i41trTDnIz8ohkR0xLziwSCsy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=qRRViGgr/XMXuK899gyJpd+glkMI9g3TUAqhc5bIdms=;
 b=XyGvv0ab812dU7fYEIatnxoRugSv/LfbJvcRieWTeDEI2nu7ZbcFoa8PMqPunWi/NY
 8sqvXB5br54y/UkKKIVxxAkcrcNHEY77t26U9CDjeoGWUGmGclBineQVc6PyHd+qvcVw
 It5MKosCPa26nveIlttrHEAaJuWiK6awcwVK4URcLLj3ViP8pDcEcsWRSj6wdoNQs44X
 CYscFPwC/1WvCWX/lwC30DxjEMR6W0s+DDC7JpS7u+YB0fEbAIzqhk62t2LNLXcVWSY3
 NiIZGIkmi4+Vatyiewr9M+hY2JCZvvWta7Kz+a7G4Qt+N1NXEsHxHhNxOOoffZR6If5R
 Fy5w==
X-Gm-Message-State: AOAM530//lSFfZI7CqNwrjx5egPsTIjlZ+C4ZFZRWCZ6KAAICpSTrnLF
 DMO5+0z1fHYN3vLx7jHlptlLyw==
X-Google-Smtp-Source: ABdhPJwF05tJg2U8YAuUBqkP69xy0KO/yd1uPSYB+TFlsp2LQxAA+L8XZMe3ryw0UOWY+kevnffgNw==
X-Received: by 2002:a05:600c:1:: with SMTP id g1mr7447279wmc.142.1591172653407; 
 Wed, 03 Jun 2020 01:24:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p10sm2318468wra.78.2020.06.03.01.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jun 2020 01:24:12 -0700 (PDT)
Date: Wed, 3 Jun 2020 10:24:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jeykumar Sankaran <jsanka@codeaurora.org>
Subject: Re: [PATCH] drm/connector: notify userspace on hotplug after
 register complete
Message-ID: <20200603082411.GI20149@phenom.ffwll.local>
Mail-Followup-To: Jeykumar Sankaran <jsanka@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Steve Cohen <cohens@codeaurora.org>, seanpaul@chromium.org
References: <1591155451-10393-1-git-send-email-jsanka@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591155451-10393-1-git-send-email-jsanka@codeaurora.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: linux-arm-kernel@lists.infradead.org, seanpaul@chromium.org,
 Steve Cohen <cohens@codeaurora.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 02, 2020 at 08:37:31PM -0700, Jeykumar Sankaran wrote:
> drm connector notifies userspace on hotplug event prematurely before
> late_register and mode_object register completes. This leads to a race
> between userspace and kernel on updating the IDR list. So, move the
> notification to end of connector register.
> 
> Signed-off-by: Jeykumar Sankaran <jsanka@codeaurora.org>
> Signed-off-by: Steve Cohen <cohens@codeaurora.org>

Hm on the unregister side we don't have the race, there we remove
everything and then send out the uevent. But there the uevent is also
generated in a separate step, so I wonder whether we shouldn't do the same
for register for symmetry ...

Anyway this looks good, nice catch, I'll add cc: stable and merge.
-Daniel

> ---
>  drivers/gpu/drm/drm_connector.c | 5 +++++
>  drivers/gpu/drm/drm_sysfs.c     | 3 ---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index b1099e1..d877ddc 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -27,6 +27,7 @@
>  #include <drm/drm_print.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_sysfs.h>
>  
>  #include <linux/uaccess.h>
>  
> @@ -523,6 +524,10 @@ int drm_connector_register(struct drm_connector *connector)
>  	drm_mode_object_register(connector->dev, &connector->base);
>  
>  	connector->registration_state = DRM_CONNECTOR_REGISTERED;
> +
> +	/* Let userspace know we have a new connector */
> +	drm_sysfs_hotplug_event(connector->dev);
> +
>  	goto unlock;
>  
>  err_debugfs:
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index 939f003..f0336c8 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -291,9 +291,6 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
>  		return PTR_ERR(connector->kdev);
>  	}
>  
> -	/* Let userspace know we have a new connector */
> -	drm_sysfs_hotplug_event(dev);
> -
>  	if (connector->ddc)
>  		return sysfs_create_link(&connector->kdev->kobj,
>  				 &connector->ddc->dev.kobj, "ddc");
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
