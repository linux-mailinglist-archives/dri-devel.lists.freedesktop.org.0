Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4137AA54F70
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 16:46:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8549B10E2A0;
	Thu,  6 Mar 2025 15:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GkyCsmhj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FC110E270
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 15:46:25 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43bbb440520so9678205e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 07:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1741275984; x=1741880784; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pOewatoKYHf39n5I/gBakpchgBZgxuefOyKrDhg+irg=;
 b=GkyCsmhj7vBl7A6dkp2/mlQWuCKtxGQUzDYzXzO2WSnhp+6ts04PXDtAMIejJzbRc2
 K4CZH9lxGhKh5Ky5/xPMqP1ULnfxaKwTLFOf1BMxw+GqiHxt/jExCb0Xoa3GXZ6WLz/3
 EoqRESgo7ZwjtGk97qjQJYDtVLWqrvC8xsgOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741275984; x=1741880784;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pOewatoKYHf39n5I/gBakpchgBZgxuefOyKrDhg+irg=;
 b=qevq7itKhKD1bBZ1zSxytm2jtfqO9k6vJJaP72+bhlAdcpGlOLp7j8iqVPwRT5Ba+/
 lnbhAx1eUhH7GROp5z4wcfC6iIu3FfJZtFJxA5JleAtyFZhNaHf0dxlQNhMhiTjTEp0S
 y2m1R3O0upcmN4xkD0hYvhr4BTv2HyOtYctZILxmnZK1p71ix7BG4YwF8nzj9JfNqHaK
 Vbj5HMVxCnDQW01KuQTmYY5vZiyhAXVdvEi9WZxR1+CN2KwQBOHCd5tpFvRMs882pxnx
 Gcu8SN1i+USkkP84CWQ144VMz5CZJkBcuIHIdmX+EN/d2oMhOCymogVIaITlfiIuBR/o
 zWtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqx8lPTvlrbPRLMDykvBaOFLKZO5aRZtWu7/NaHbGS4uRy7hNJKdN//vVlSCL+wTI/etX9BwSnl6c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtelY//JwcpmYYBqvb/t5PmWjRXvHcX5Er+dgO6W6oOe5zuw6+
 eImGhXJlIVvRbpXkXP3AJGSxkClzutrrUDXFkMcqu4TXcIGhUA3xM1Rsv+NSCSk=
X-Gm-Gg: ASbGnctKPj/+QRXmAjYJOz2KsmFA36PcgjNYYwWscb3yTlhEG5T+hXLLaNXOA+zs9FJ
 6RxJs0pFeQpQCZOhyeIMBIuTSomVVkTD0A1BkLPkxBp68omlXSbqWZ2gEtZU23p0g6zbeKpsCRi
 9w6qYzQoMrYScKW52yBzytep1ADXc6tXp7Gd73AAHj3L/dsiEV9fW9d2QvPCalNMKEuFXL58S2L
 4MqvTbGSXqFlvZWXAHm1opuXpCZvgof2sZy5ElSvAqXU4VlHwtKAAHax1sr/Zl9D1+Va5iVEbFP
 K8VdtKhlMpMAUqRoJ1fDEDEGL6grmHWeXdFmx8PeSJt7kLMpjyHCa/zo
X-Google-Smtp-Source: AGHT+IEleCsxq8XUaIidU8IaWiDtE2BKMf9XcERDyGpucqoDTck67pGcLD/bIIWyInB/FTtB5CBCgw==
X-Received: by 2002:a05:6000:1447:b0:390:d73a:4848 with SMTP id
 ffacd0b85a97d-3911f7beb20mr7168916f8f.47.1741275984072; 
 Thu, 06 Mar 2025 07:46:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e2f4fsm2357683f8f.77.2025.03.06.07.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 07:46:23 -0800 (PST)
Date: Thu, 6 Mar 2025 16:46:21 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v5 08/16] drm/bridge: Add helper to reset bridge pipeline
Message-ID: <Z8nDTfYqfn1utDaH@phenom.ffwll.local>
Mail-Followup-To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-8-aacf461d2157@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-bridge-connector-v5-8-aacf461d2157@kernel.org>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Tue, Mar 04, 2025 at 12:10:51PM +0100, Maxime Ripard wrote:
> Let's provide an helper to make it easier for bridge drivers to
> power-cycle their bridge.
> 
> In order to avoid a circular dependency between that new helper and
> drm_atomic_helper_reset_crtc(), this new helper will be in a
> drm_bridge_helper.c file to follow the pattern we have for other
> objects.
> 
> Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/Makefile            |  1 +
>  drivers/gpu/drm/drm_bridge_helper.c | 55 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge_helper.h     | 12 ++++++++
>  3 files changed, 68 insertions(+)
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 4cd054188faf0b3dec442efd99ae52604541bce1..5a332f7d3ecccb6e5e1fb9fb811eab7aa5a84a21 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -131,10 +131,11 @@ obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
>  #
>  
>  drm_kms_helper-y := \
>  	drm_atomic_helper.o \
>  	drm_atomic_state_helper.o \
> +	drm_bridge_helper.o \
>  	drm_crtc_helper.o \
>  	drm_damage_helper.o \
>  	drm_flip_work.o \
>  	drm_format_helper.o \
>  	drm_gem_atomic_helper.o \
> diff --git a/drivers/gpu/drm/drm_bridge_helper.c b/drivers/gpu/drm/drm_bridge_helper.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..521df9d5dcb3fef842a95cdb2865a8b8d09b0fbe
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_bridge_helper.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_helper.h>
> +#include <drm/drm_modeset_lock.h>
> +
> +/**
> + * drm_bridge_helper_reset_crtc - Reset the pipeline feeding a bridge
> + * @bridge: DRM bridge to reset
> + * @ctx: lock acquisition context
> + *
> + * Reset a @bridge pipeline. It will power-cycle all active components
> + * between the CRTC and connector that bridge is connected to.

You need to minimally add that the same caveats and limitations of
drm_atomic_helper_reset_crtc() apply to this function here.

Might also be good to link from that kerneldoc to here so people can find
stuff easier, or maybe the overview section I've asked for once that's
landed.

With the kerneldoc polished:

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Signed-off-by: Simona Vetter <simona.vetter@intel.com>

> + *
> + * Returns:
> + *
> + * 0 on success or a negative error code on failure. If the error
> + * returned is EDEADLK, the whole atomic sequence must be restarted.
> + */
> +int drm_bridge_helper_reset_crtc(struct drm_bridge *bridge,
> +				 struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct drm_connector *connector;
> +	struct drm_encoder *encoder = bridge->encoder;
> +	struct drm_device *dev = encoder->dev;
> +	struct drm_crtc *crtc;
> +	int ret;
> +
> +	ret = drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> +	if (ret)
> +		return ret;
> +
> +	connector = drm_atomic_get_connector_for_encoder(encoder, ctx);
> +	if (IS_ERR(connector)) {
> +		ret = PTR_ERR(connector);
> +		goto out;
> +	}
> +
> +	if (!connector->state) {
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	crtc = connector->state->crtc;
> +	ret = drm_atomic_helper_reset_crtc(crtc, ctx);
> +	if (ret)
> +		goto out;
> +
> +out:
> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +	return ret;
> +}
> +EXPORT_SYMBOL(drm_bridge_helper_reset_crtc);
> diff --git a/include/drm/drm_bridge_helper.h b/include/drm/drm_bridge_helper.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..6c35b479ec2a84aa43283351a6f18e49a9f9c177
> --- /dev/null
> +++ b/include/drm/drm_bridge_helper.h
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#ifndef __DRM_BRIDGE_HELPER_H_
> +#define __DRM_BRIDGE_HELPER_H_
> +
> +struct drm_bridge;
> +struct drm_modeset_acquire_ctx;
> +
> +int drm_bridge_helper_reset_crtc(struct drm_bridge *bridge,
> +				 struct drm_modeset_acquire_ctx *ctx);
> +
> +#endif // __DRM_BRIDGE_HELPER_H_
> 
> -- 
> 2.48.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
