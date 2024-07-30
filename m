Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCB7940A11
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 09:39:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8EE10E4CF;
	Tue, 30 Jul 2024 07:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="diHIv3wb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBE310E4CF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 07:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722325190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aUZPwDjvCNuvdtbiS5aTn8Kyj+I15Nv8TBu2F0oVisY=;
 b=diHIv3wbD3Xf/PgcLAIzKrKkj3xuvvqJmBLtLOL5icVaaS/CT/2LaiwjAvNMw2ZZIg9x6B
 p5HpNvpAD/b4w7gXNgPuQB/44a4ccZ1j8U9TiBuXE+5MmSK5YgoOUeUcknc0w+fT6yv0jJ
 /GfuVOP2WNgfvCaDRH+CcTRG2d4eTrc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-nJOzIYo3PEytt23iKjL3LQ-1; Tue, 30 Jul 2024 03:39:49 -0400
X-MC-Unique: nJOzIYo3PEytt23iKjL3LQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4280cf2be19so23147845e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 00:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722325187; x=1722929987;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aUZPwDjvCNuvdtbiS5aTn8Kyj+I15Nv8TBu2F0oVisY=;
 b=u3jGufJ6vZ5IQbBlcKyBpCOunGUkmIyBk8N9PGvtAsgbqeB8eQWd+lfMvxkAkq++9E
 UW1t3dgmlI+zcjhr94ztqNYpgXOjJcmdlfnUwO9xAPoFXYDQlIK5Rj+r5TIkX2Zo1OEW
 jQ2iEOSadGtkuiwX1crmqpH4ieGibemzS3j8qm3B2S5pu175YFB8RZQI0cXQ2rwxD1pw
 a8JDRgiitfsSrS7ZLpphck9SFuxS0QllnApKsFPKpnD+e41nJhy87NzjbIv1x7OjYdZD
 GEZNUEGKMw8TnLubLHbi7aFj+/3GLI8pMswOgXvPuL0smGq0luFrZpkRSPmTe2pxdnRR
 lEKg==
X-Gm-Message-State: AOJu0YxqTI5LnkJcwjH8VeGm3NZloDbevNna37PP4HFbxzP1JRSX1nI9
 tsjCcbNSMFaU6Oziyyf33jzuStfSS4FBv4TStE6n0b6LCydtEL164mxyQeG4VHMUuUBJVvgtlRf
 /9dODemvnLJ1BOEQe0CdLPA4GE7wuU/S/P1eL3oJUZQsdi6Or0f7LC/AnpKsNzWifXA==
X-Received: by 2002:a5d:64ed:0:b0:368:6b28:5911 with SMTP id
 ffacd0b85a97d-36b5cefd512mr6645313f8f.2.1722325186655; 
 Tue, 30 Jul 2024 00:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6FvzK9O4osBRDPn7KTIhgJWdregInCISkYcU6ZaQWQ+9Ipp/gxcHDxA2pnW/GZViF/YvC/w==
X-Received: by 2002:a5d:64ed:0:b0:368:6b28:5911 with SMTP id
 ffacd0b85a97d-36b5cefd512mr6645292f8f.2.1722325186194; 
 Tue, 30 Jul 2024 00:39:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d3ea:62cf:3052:fac6?
 ([2a01:e0a:d5:a000:d3ea:62cf:3052:fac6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b3686fdc5sm13798420f8f.114.2024.07.30.00.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 00:39:45 -0700 (PDT)
Message-ID: <b1d2c7da-a545-4963-9b74-fbd34c3ce089@redhat.com>
Date: Tue, 30 Jul 2024 09:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/ast: astdp: Wake up during connector status
 detection
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org
References: <20240717143319.104012-1-tzimmermann@suse.de>
 <20240717143319.104012-2-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240717143319.104012-2-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 17/07/2024 16:24, Thomas Zimmermann wrote:
> Power up the ASTDP connector for connection status detection if the
> connector is not active. Keep it powered if a display is attached.
> 
> This fixes a bug where the connector does not come back after
> disconnecting the display. The encoder's atomic_disable turns off
> power on the physical connector. Further HPD reads will fail,
> thus preventing the driver from detecting re-connected displays.
> 
> For connectors that are actively used, only test the HPD flag without
> touching power.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Fixes: f81bb0ac7872 ("drm/ast: report connection status on Display Port.")
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.6+
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_dp.c   |  7 +++++++
>   drivers/gpu/drm/ast/ast_drv.h  |  1 +
>   drivers/gpu/drm/ast/ast_mode.c | 29 +++++++++++++++++++++++++++--
>   3 files changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
> index 1e9259416980..e6c7f0d64e99 100644
> --- a/drivers/gpu/drm/ast/ast_dp.c
> +++ b/drivers/gpu/drm/ast/ast_dp.c
> @@ -158,7 +158,14 @@ void ast_dp_launch(struct drm_device *dev)
>   			       ASTDP_HOST_EDID_READ_DONE);
>   }
>   
> +bool ast_dp_power_is_on(struct ast_device *ast)
> +{
> +	u8 vgacre3;
> +
> +	vgacre3 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xe3);
>   
> +	return !(vgacre3 & AST_DP_PHY_SLEEP);
> +}
>   
>   void ast_dp_power_on_off(struct drm_device *dev, bool on)
>   {
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index ba3d86973995..47bab5596c16 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -472,6 +472,7 @@ void ast_init_3rdtx(struct drm_device *dev);
>   bool ast_astdp_is_connected(struct ast_device *ast);
>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
>   void ast_dp_launch(struct drm_device *dev);
> +bool ast_dp_power_is_on(struct ast_device *ast);
>   void ast_dp_power_on_off(struct drm_device *dev, bool no);
>   void ast_dp_set_on_off(struct drm_device *dev, bool no);
>   void ast_dp_set_mode(struct drm_crtc *crtc, struct ast_vbios_mode_info *vbios_mode);
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index dc8f639e82fd..049ee1477c33 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -28,6 +28,7 @@
>    * Authors: Dave Airlie <airlied@redhat.com>
>    */
>   
> +#include <linux/delay.h>
>   #include <linux/export.h>
>   #include <linux/pci.h>
>   
> @@ -1687,11 +1688,35 @@ static int ast_astdp_connector_helper_detect_ctx(struct drm_connector *connector
>   						 struct drm_modeset_acquire_ctx *ctx,
>   						 bool force)
>   {
> +	struct drm_device *dev = connector->dev;
>   	struct ast_device *ast = to_ast_device(connector->dev);
> +	enum drm_connector_status status = connector_status_disconnected;
> +	struct drm_connector_state *connector_state = connector->state;
> +	bool is_active = false;
> +
> +	mutex_lock(&ast->modeset_lock);
> +
> +	if (connector_state && connector_state->crtc) {
> +		struct drm_crtc_state *crtc_state = connector_state->crtc->state;
> +
> +		if (crtc_state && crtc_state->active)
> +			is_active = true;
> +	}
> +
> +	if (!is_active && !ast_dp_power_is_on(ast)) {
> +		ast_dp_power_on_off(dev, true);
> +		msleep(50);
> +	}
>   
>   	if (ast_astdp_is_connected(ast))
> -		return connector_status_connected;
> -	return connector_status_disconnected;
> +		status = connector_status_connected;
> +
> +	if (!is_active && status == connector_status_disconnected)
> +		ast_dp_power_on_off(dev, false);
> +
> +	mutex_unlock(&ast->modeset_lock);
> +
> +	return status;
>   }
>   
>   static const struct drm_connector_helper_funcs ast_astdp_connector_helper_funcs = {

