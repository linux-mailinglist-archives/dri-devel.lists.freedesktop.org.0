Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85EC53CA73
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 15:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD89911370C;
	Fri,  3 Jun 2022 13:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB1E11370C
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 13:11:10 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id kq6so2829749ejb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 06:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=agYH7QLWFnI6HTioYWm+7c/6pGqBMEJOub7GNsmjjv4=;
 b=E1rsboZMUIJ4EOSIejtOy+UOUtTYHJKM4hKsjHBsp/qqB9zLSug58T5G9za3ujrM9d
 ufUf8pJ7tF8r2dS1Yt6xahO2NUSr8kThPn40iqhu662bs5NV6cmPRVa0U9vPDuPziDKB
 4oQWK4+joicZsT3ldjhraaE71MwDHIFUEoZgHdezR0XUDPaaZXFf1mrvV9EhKKmPHV5k
 yvebCbK83EPk7oAy5aCMrxIL8/3/v90fHIGag5q+TFmgF3J+08DOTnakEXCSphav6M3S
 ShQ7RwTutyKWhIhxY8dMnnl7f2xZ8/1laN6HHcP7IobTEZk753oLEs8ITJBKKaShfsga
 z+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=agYH7QLWFnI6HTioYWm+7c/6pGqBMEJOub7GNsmjjv4=;
 b=5VM6ae68Z20sPo1T1KiudEqOlckacTTfk3dIMReWOx72nEz+Odp5x65F8JMdGPCibw
 MrFkdFCy98KASNyNuhFcqw79CLer5eHzvfr0gfeCLYIEq2JxsJpvA3Ig8gP1hkiOpnGq
 4nRRX60KstUA182Y7koqRYZoZFmTXrzpPfePtzhfchJJmzhQip7Wc+OgEOHmcYz4hhwi
 T5eMHcWxPL/4vM7ljaFRv/xqipRs4bVKgPTWT+tF+1NNyIQeK5W5sfHZM3mpSkCOoqrx
 YKM+8qBgnEf9CCsGuV4oOVKdfRD5YV/N9F6BUm6BGYMQXBXIKaOxgyKGMWb2/4Y0Nf+g
 8m7w==
X-Gm-Message-State: AOAM533J5R1ooH0huNjdSedWPi783apKu94qT1iCwaJu2hzebJgYrmx4
 rlytAb7gx6NXHtp63q+9rjfnVZ78+QXACQ==
X-Google-Smtp-Source: ABdhPJwNCsm1kNoCPd+3SG4E0FesYj+nXikWozCFwY0UW0UtSmzVyrOnQd3TM9ZYZqrb+V9USkF6GQ==
X-Received: by 2002:a17:907:2cc7:b0:709:f1e1:7b17 with SMTP id
 hg7-20020a1709072cc700b00709f1e17b17mr8237976ejc.498.1654261869223; 
 Fri, 03 Jun 2022 06:11:09 -0700 (PDT)
Received: from [192.168.2.181] (46-10-149-62.ip.btc-net.bg. [46.10.149.62])
 by smtp.gmail.com with ESMTPSA id
 oq3-20020a170906cc8300b006fe921fcb2dsm2817687ejb.49.2022.06.03.06.11.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 06:11:08 -0700 (PDT)
Message-ID: <e5c77d0e-cec4-1f13-2295-e9f5b21f9824@gmail.com>
Date: Fri, 3 Jun 2022 16:11:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/6] drm/vmwgfx: Create mouse hotspot properties on cursor
 planes
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20220602154243.1015688-1-zack@kde.org>
 <20220602154243.1015688-3-zack@kde.org>
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20220602154243.1015688-3-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>

On 2.06.22 г. 18:42 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> Atomic modesetting got support for mouse hotspots via the hotspot
> properties. Drivers need to create those properties on cursor planes
> which require the mouse hotspot coordinates.
>
> Add the code creating hotspot properties and port away from old legacy
> hotspot API. The legacy hotspot paths have an implementation that works
> with new atomic properties so there's no reason to keep them and it
> makes sense to unify both paths.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Martin Krastev <krastevm@vmware.com>
> Cc: Maaz Mombasawala <mombasawalam@vmware.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 11 ++---------
>   drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  |  2 ++
>   drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c |  1 +
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  2 ++
>   4 files changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 693028c31b6b..a4cd312fee46 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -652,13 +652,8 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
>   	struct vmw_plane_state *vps = vmw_plane_state_to_vps(new_state);
>   	s32 hotspot_x, hotspot_y;
>   
> -	hotspot_x = du->hotspot_x;
> -	hotspot_y = du->hotspot_y;
> -
> -	if (new_state->fb) {
> -		hotspot_x += new_state->fb->hot_x;
> -		hotspot_y += new_state->fb->hot_y;
> -	}
> +	hotspot_x = du->hotspot_x + new_state->hotspot_x;
> +	hotspot_y = du->hotspot_y + new_state->hotspot_y;
>   
>   	du->cursor_surface = vps->surf;
>   	du->cursor_bo = vps->bo;
> @@ -2270,8 +2265,6 @@ int vmw_du_crtc_gamma_set(struct drm_crtc *crtc,
>   	int i;
>   
>   	for (i = 0; i < size; i++) {
> -		DRM_DEBUG("%d r/g/b = 0x%04x / 0x%04x / 0x%04x\n", i,
> -			  r[i], g[i], b[i]);
>   		vmw_write(dev_priv, SVGA_PALETTE_BASE + i * 3 + 0, r[i] >> 8);
>   		vmw_write(dev_priv, SVGA_PALETTE_BASE + i * 3 + 1, g[i] >> 8);
>   		vmw_write(dev_priv, SVGA_PALETTE_BASE + i * 3 + 2, b[i] >> 8);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> index e4347faccee0..43e89c6755b2 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
> @@ -474,6 +474,8 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
>   			(&connector->base,
>   			 dev_priv->implicit_placement_property,
>   			 1);
> +	if (vmw_cmd_supported(dev_priv))
> +		drm_plane_create_hotspot_properties(&cursor->base);
>   
>   	return 0;
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> index c89ad3a2d141..8d46b0cbe640 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c
> @@ -932,6 +932,7 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
>   				   dev->mode_config.suggested_x_property, 0);
>   	drm_object_attach_property(&connector->base,
>   				   dev->mode_config.suggested_y_property, 0);
> +	drm_plane_create_hotspot_properties(&cursor->base);
>   	return 0;
>   
>   err_free_unregister:
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> index eb014b97d156..d940b9a525e7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -1822,6 +1822,8 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
>   				   dev->mode_config.suggested_x_property, 0);
>   	drm_object_attach_property(&connector->base,
>   				   dev->mode_config.suggested_y_property, 0);
> +	drm_plane_create_hotspot_properties(&cursor->base);
> +
>   	return 0;
>   
>   err_free_unregister:


LGTM!

Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin

