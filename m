Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B7626049
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 18:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D03B10E17E;
	Fri, 11 Nov 2022 17:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7656810E17E
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 17:18:14 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id j6so3712836qvn.12
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 09:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rFoaqRu0NcN7M7Cgm6Ty0tTFif5Bn8rwUhcb5FvfYLA=;
 b=EFeIcZURS2AEXZmxmnHl2mP66G+FTnJw+vQlWa/2TF8aOsZUIl3YAPmVS+ZbvpRUv6
 HLWmpJ3OB7avnNkbeMW9w323JVpUIsNSB5sPGjDuhptxIFlO2x8pqcJL5zTMXBG0mya7
 F+WvCxR5MZqi6nOXnJTNeeeETLeHyh3f05BzPFghbOqV5pQXw7DIMkfmmCoV5xtab7VN
 415r/hFpxZ8ar3z5kxU0TUAjZTL/PeZs15dRhuI3G8cH+76PAroJleAgjJb/xlU+wxEn
 K72kLf1BY1fglTGgO9FNHtFOwAXJSiZI2abCVAuV4T7xHNk7XeeNn8PNRL1jSRyjuLKR
 /45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rFoaqRu0NcN7M7Cgm6Ty0tTFif5Bn8rwUhcb5FvfYLA=;
 b=h3+FF6poFLtdMDPtlMeTV/+j1pyWc/APmndu3tc7QG9A85PRBAxB1H9rS9jP04iuxt
 WB3CgRAwovDg2vlgK4VY+mXMkW7dmDzgWq3nbvzC+m5SUupRBzH65hKF1NqKUCYVtRtb
 ZqAJ8AoJK45/a/XDLtGE9OjkJMzCXNWh33T0UZjy6j/pmFub+VZ97n1IIUX/HPUZbwas
 v8I8kyIqAwILZdt8+eTRLNU4knJbMZw0x+mXNa2Y/2osiuU6vyZByTiyt5oSt4K99rlf
 bcLxtlIzZ5v7PySKYJEqPqKEWB4UZ/QFNtdLyMz247HyOEmMgsdvIusKkNmTemaX/r6N
 xp4g==
X-Gm-Message-State: ANoB5pmJ8qWn8d1cKCOdFZAKQh8hAxXQpzE8wAFMb7dQG0VL177DCWAM
 UBjlZstbLX1181HNyIXnkGltRA==
X-Google-Smtp-Source: AA0mqf6YMGzoNmLCmDE5OwahMwsNihO+8X6NjbcjP1wedicsJOUCucArx98BcVuNMGaDbcY++6btWg==
X-Received: by 2002:a0c:e841:0:b0:4bb:de25:e988 with SMTP id
 l1-20020a0ce841000000b004bbde25e988mr2773308qvo.131.1668187094013; 
 Fri, 11 Nov 2022 09:18:14 -0800 (PST)
Received: from localhost (200.234.86.34.bc.googleusercontent.com.
 [34.86.234.200]) by smtp.gmail.com with ESMTPSA id
 s11-20020a05620a29cb00b006ec62032d3dsm1793485qkp.30.2022.11.11.09.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 09:18:13 -0800 (PST)
Date: Fri, 11 Nov 2022 17:18:12 +0000
From: Sean Paul <sean@poorly.run>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v3 1/2] drm_bridge: register content protect property
Message-ID: <Y26D1Of8FserYa2L@art_vandelay>
References: <20221102111148.1810314-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102111148.1810314-1-hsinyi@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 02, 2022 at 07:11:46PM +0800, Hsin-Yi Wang wrote:
> Some bridges are able to update HDCP status from userspace request if
> they support HDCP.
> 
> HDCP property is the same as other connector properties that needs to be
> created after the connecter is initialized and before the connector is
> registered.
> 
> If there exists a bridge that supports HDCP, add the property to the
> bridge connector.
> 

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2->v3:
> Only register the property when there exists any bridge that supports
> hdcp.
> ---
>  drivers/gpu/drm/drm_bridge_connector.c | 8 ++++++++
>  include/drm/drm_bridge.h               | 4 ++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 1c7d936523df5..b4fb5da0b963f 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  
> +#include <drm/display/drm_hdcp_helper.h>
>  #include <drm/drm_atomic_state_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_bridge_connector.h>
> @@ -333,6 +334,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	struct i2c_adapter *ddc = NULL;
>  	struct drm_bridge *bridge, *panel_bridge = NULL;
>  	int connector_type;
> +	bool support_hdcp = false;
>  
>  	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
>  	if (!bridge_connector)
> @@ -376,6 +378,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  
>  		if (drm_bridge_is_panel(bridge))
>  			panel_bridge = bridge;
> +
> +		if (bridge->support_hdcp)
> +			support_hdcp = true;
>  	}
>  
>  	if (connector_type == DRM_MODE_CONNECTOR_Unknown) {
> @@ -398,6 +403,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>  	if (panel_bridge)
>  		drm_panel_bridge_set_orientation(connector, panel_bridge);
>  
> +	if (support_hdcp && IS_ENABLED(CONFIG_DRM_DISPLAY_HDCP_HELPER))
> +		drm_connector_attach_content_protection_property(connector, true);
> +
>  	return connector;
>  }
>  EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 6b65b0dfb4fb4..1d2ab70f3436a 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -768,6 +768,10 @@ struct drm_bridge {
>  	 * modes.
>  	 */
>  	bool interlace_allowed;
> +	/**
> +	 * @support_hdcp: Indicate that the bridge supports HDCP.
> +	 */
> +	bool support_hdcp;
>  	/**
>  	 * @ddc: Associated I2C adapter for DDC access, if any.
>  	 */
> -- 
> 2.38.0.135.g90850a2211-goog
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
