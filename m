Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2660F40FD58
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 17:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D156EE33;
	Fri, 17 Sep 2021 15:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CB46EDDB
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 15:55:51 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id p4so18857726qki.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 08:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=buBsN91tBTD9XzuW83EFBeK8bvxWcgfDDWAYD4HYD0U=;
 b=VeRfM+zp0s5hKkgE1qZuWXnfrAdVjV0wh/Vs7zhmbijOoMRBbaTTgcRBzhdrEr1kNc
 /I1Q/1RBGGuV/gCdJQaJHB7tu348uDwShFNEPo3aqHJNke5lvi/qg5kOnT2finge4Ece
 YhO+rn6ri2KgB7FoGhfr37N55pFJPSe9ZGaFiVniP8n22HNnJ3eSzReuAnuuHfxbI5J4
 xUHvXbvLkHk6fshrrbbcIn+2LewR/jpbfbk9IZqWmZAb4ZrmqgT8GqG632DkOlLQ41om
 dQIGffXzy+CtF4xGTrydBnQSvUqegQzfQAGUBxI+Pvvaofu0gwZDNiYIvU3evB8Tdra2
 0pzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=buBsN91tBTD9XzuW83EFBeK8bvxWcgfDDWAYD4HYD0U=;
 b=Qg0LVU7jdjcgrTVsQJgz3vaRLKdXFd92hWo80exwZNt6f/U8egSTJEZ/faEfffZL4A
 L2gj605HSU2ehSBIizhBOjIZt92jAMbZutx+OO2oEkG2Qky04SFDw++m5lQvgSItQRY2
 JMXzgVwn+sTg0Py9cwpm05GLBj/d+F4RUgvx4oIxKRa705rzVuwYFnoeopNqa7UwvV50
 MYEfdWiRyHp9tUYttYMTgQb4W/vmpOWbUG/+UMv6eOIyPQWi+JdznRoDhMzTE8cbKUur
 +Mx4etP0cSN8UqgyoznhYyz7ETOAtz59jK98sgFH3LR06fuqLbyk6qfwoFyFUrkeWk+T
 MYJg==
X-Gm-Message-State: AOAM530UMhhG2A4geiMbJCpQKXj7qsmn34spjijbNVHFdBuaV4tw7n3a
 88KBQqXQs9lR1mFFAA9D447opw==
X-Google-Smtp-Source: ABdhPJwfv8gzZlZMfSbl/3eVXePmA6a2u1iN7QS4uq8+CeqsiRoPMlOEJagQkf1x2ZSTKIHmPrA1MA==
X-Received: by 2002:a05:620a:8cb:: with SMTP id
 z11mr11601699qkz.328.1631894150376; 
 Fri, 17 Sep 2021 08:55:50 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id c10sm4419227qtb.20.2021.09.17.08.55.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 Sep 2021 08:55:49 -0700 (PDT)
Date: Fri, 17 Sep 2021 11:55:48 -0400
From: Sean Paul <sean@poorly.run>
To: Fernando Ramos <greenfoo@u92.eu>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 sean@poorly.run, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH 14/15] drm/amd: cleanup: drm_modeset_lock_all() -->
 DRM_MODESET_LOCK_ALL_BEGIN()
Message-ID: <20210917155548.GO2515@art_vandelay>
References: <20210916211552.33490-1-greenfoo@u92.eu>
 <20210916211552.33490-15-greenfoo@u92.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916211552.33490-15-greenfoo@u92.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Sep 16, 2021 at 11:15:51PM +0200, Fernando Ramos wrote:
> As requested in Documentation/gpu/todo.rst, replace driver calls to
> drm_modeset_lock_all() with DRM_MODESET_LOCK_ALL_BEGIN() and
> DRM_MODESET_LOCK_ALL_END()
> 
> Signed-off-by: Fernando Ramos <greenfoo@u92.eu>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 13 +++--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 50 +++++++++----------
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 23 +++++----
>  3 files changed, 46 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index 7a7316731911..55ecc4aa859f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -40,6 +40,7 @@
>  #include <drm/drm_fb_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_vblank.h>
> +#include <drm/drm_drv.h>
>  
>  static void amdgpu_display_flip_callback(struct dma_fence *f,
>  					 struct dma_fence_cb *cb)
> @@ -1543,16 +1544,18 @@ int amdgpu_display_suspend_helper(struct amdgpu_device *adev)
>  	struct drm_crtc *crtc;
>  	struct drm_connector *connector;
>  	struct drm_connector_list_iter iter;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int r;
> +	int ret;

Relocate ret with r please

>  
>  	/* turn off display hw */
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  	drm_connector_list_iter_begin(dev, &iter);
>  	drm_for_each_connector_iter(connector, &iter)
>  		drm_helper_connector_dpms(connector,
>  					  DRM_MODE_DPMS_OFF);
>  	drm_connector_list_iter_end(&iter);
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);


You should check ret here

>  	/* unpin the front buffers and cursors */
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
>  		struct amdgpu_crtc *amdgpu_crtc = to_amdgpu_crtc(crtc);
> @@ -1590,7 +1593,9 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
>  	struct drm_connector *connector;
>  	struct drm_connector_list_iter iter;
>  	struct drm_crtc *crtc;
> +	struct drm_modeset_acquire_ctx ctx;
>  	int r;
> +	int ret;

Relocate ret with r

>  
>  	/* pin cursors */
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head) {
> @@ -1612,7 +1617,7 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
>  	drm_helper_resume_force_mode(dev);
>  
>  	/* turn on display hw */
> -	drm_modeset_lock_all(dev);
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
>  
>  	drm_connector_list_iter_begin(dev, &iter);
>  	drm_for_each_connector_iter(connector, &iter)
> @@ -1620,7 +1625,7 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev)
>  					  DRM_MODE_DPMS_ON);
>  	drm_connector_list_iter_end(&iter);
>  
> -	drm_modeset_unlock_all(dev);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
>  
>  	return 0;

Return ret

>  }
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 9b1fc54555ee..5196c1d26f87 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -80,6 +80,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_vblank.h>
>  #include <drm/drm_audio_component.h>
> +#include <drm/drm_drv.h>
>  
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
>  #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
> @@ -2621,6 +2622,9 @@ static void handle_hpd_irq(void *param)
>  #ifdef CONFIG_DRM_AMD_DC_HDCP
>  	struct dm_connector_state *dm_con_state = to_dm_connector_state(connector->state);
>  #endif
> +	struct drm_modeset_acquire_ctx ctx;
> +	int ret;
> +
>  
>  	if (adev->dm.disable_hpd_irq)
>  		return;
> @@ -2646,14 +2650,6 @@ static void handle_hpd_irq(void *param)
>  	if (aconnector->base.force && new_connection_type == dc_connection_none) {
>  		emulated_link_detect(aconnector->dc_link);
>  
> -
> -		drm_modeset_lock_all(dev);
> -		dm_restore_drm_connector_state(dev, connector);
> -		drm_modeset_unlock_all(dev);
> -
> -		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
> -			drm_kms_helper_hotplug_event(dev);
> -
>  	} else if (dc_link_detect(aconnector->dc_link, DETECT_REASON_HPD)) {
>  		if (new_connection_type == dc_connection_none &&
>  		    aconnector->dc_link->type == dc_connection_none)
> @@ -2661,13 +2657,18 @@ static void handle_hpd_irq(void *param)
>  
>  		amdgpu_dm_update_connector_after_detect(aconnector);
>  
> -		drm_modeset_lock_all(dev);
> -		dm_restore_drm_connector_state(dev, connector);
> -		drm_modeset_unlock_all(dev);
> -
> -		if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
> -			drm_kms_helper_hotplug_event(dev);
> +	} else {
> +		goto out;
>  	}
> +
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> +	dm_restore_drm_connector_state(dev, connector);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);

Check ret here please

> +
> +	if (aconnector->base.force == DRM_FORCE_UNSPECIFIED)
> +		drm_kms_helper_hotplug_event(dev);
> +
> +out:
>  	mutex_unlock(&aconnector->hpd_lock);
>  
>  }
> @@ -2756,12 +2757,14 @@ static void handle_hpd_rx_irq(void *param)
>  	struct drm_connector *connector = &aconnector->base;
>  	struct drm_device *dev = connector->dev;
>  	struct dc_link *dc_link = aconnector->dc_link;
> +	struct drm_modeset_acquire_ctx ctx;
>  	bool is_mst_root_connector = aconnector->mst_mgr.mst_state;
>  	bool result = false;
>  	enum dc_connection_type new_connection_type = dc_connection_none;
>  	struct amdgpu_device *adev = drm_to_adev(dev);
>  	union hpd_irq_data hpd_irq_data;
>  	bool lock_flag = 0;
> +	int ret;
>  
>  	memset(&hpd_irq_data, 0, sizeof(hpd_irq_data));
>  
> @@ -2828,12 +2831,6 @@ static void handle_hpd_rx_irq(void *param)
>  
>  			amdgpu_dm_update_connector_after_detect(aconnector);
>  
> -
> -			drm_modeset_lock_all(dev);
> -			dm_restore_drm_connector_state(dev, connector);
> -			drm_modeset_unlock_all(dev);
> -
> -			drm_kms_helper_hotplug_event(dev);
>  		} else if (dc_link_detect(dc_link, DETECT_REASON_HPDRX)) {
>  
>  			if (aconnector->fake_enable)
> @@ -2841,14 +2838,17 @@ static void handle_hpd_rx_irq(void *param)
>  
>  			amdgpu_dm_update_connector_after_detect(aconnector);
>  
> +		} else {
> +			goto finish;

You used 'out' above and 'finish' here. It would be nice to be consistent with
naming, I see 'out' a lot more than 'finish', so my vote would be to change this
label to 'out'.

> +		}
>  
> -			drm_modeset_lock_all(dev);
> -			dm_restore_drm_connector_state(dev, connector);
> -			drm_modeset_unlock_all(dev);
> +		DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> +		dm_restore_drm_connector_state(dev, connector);
> +		DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);

Check ret here?

>  
> -			drm_kms_helper_hotplug_event(dev);
> -		}
> +		drm_kms_helper_hotplug_event(dev);
>  	}
> +finish:
>  #ifdef CONFIG_DRM_AMD_DC_HDCP
>  	if (hpd_irq_data.bytes.device_service_irq.bits.CP_IRQ) {
>  		if (adev->dm.hdcp_workqueue)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 87daa78a32b8..6e5a8f4fc6bd 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -37,6 +37,8 @@
>  #include "link_hwss.h"
>  #include "dc/dc_dmub_srv.h"
>  
> +#include <drm/drm_drv.h>
> +

Top-level headers generally come above the driver headers. Also, now that I think
about this a bit more, all of the new includes in this set should probably be
for 'drm_modeset_lock.h' instead of 'drm_drv.h'.

>  struct dmub_debugfs_trace_header {
>  	uint32_t entry_count;
>  	uint32_t reserved[3];
> @@ -1191,12 +1193,14 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
>  	struct drm_connector *connector = &aconnector->base;
>  	struct dc_link *link = NULL;
>  	struct drm_device *dev = connector->dev;
> +	struct drm_modeset_acquire_ctx ctx;
>  	enum dc_connection_type new_connection_type = dc_connection_none;
>  	char *wr_buf = NULL;
>  	uint32_t wr_buf_size = 42;
>  	int max_param_num = 1;
>  	long param[1] = {0};
>  	uint8_t param_nums = 0;
> +	int ret;
>  
>  	if (!aconnector || !aconnector->dc_link)
>  		return -EINVAL;
> @@ -1236,12 +1240,6 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
>  			goto unlock;
>  
>  		amdgpu_dm_update_connector_after_detect(aconnector);
> -
> -		drm_modeset_lock_all(dev);
> -		dm_restore_drm_connector_state(dev, connector);
> -		drm_modeset_unlock_all(dev);
> -
> -		drm_kms_helper_hotplug_event(dev);
>  	} else if (param[0] == 0) {
>  		if (!aconnector->dc_link)
>  			goto unlock;
> @@ -1259,13 +1257,16 @@ static ssize_t trigger_hotplug(struct file *f, const char __user *buf,
>  
>  		amdgpu_dm_update_connector_after_detect(aconnector);
>  
> -		drm_modeset_lock_all(dev);
> -		dm_restore_drm_connector_state(dev, connector);
> -		drm_modeset_unlock_all(dev);
> -
> -		drm_kms_helper_hotplug_event(dev);
> +	} else {
> +		goto unlock;
>  	}
>  
> +	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
> +	dm_restore_drm_connector_state(dev, connector);
> +	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);

Check ret here?

> +
> +	drm_kms_helper_hotplug_event(dev);
> +
>  unlock:
>  	mutex_unlock(&aconnector->hpd_lock);
>  
> -- 
> 2.33.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
