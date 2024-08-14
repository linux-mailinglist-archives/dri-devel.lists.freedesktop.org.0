Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9DC951106
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 02:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401D510E3EF;
	Wed, 14 Aug 2024 00:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SHY1uJPb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5DD10E347
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 00:28:51 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-70d1fb6c108so4446954b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723595331; x=1724200131;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VhqvxtsoSwNwxr5Jjd+awQeFEA3CdtcC5PD6Cr4xSzg=;
 b=SHY1uJPby7I8+/Z6vE+9FA/0vGXN14rHuWphDqyFE77XeJY+NQ2DbVESAVF2Y3Kk1V
 wW+ZTj2Eq2hnR1nwZyojPPB2ffwKITgn3RXKv95UFA0CcO1AgGso+M2QGC3LG6L6tEVY
 4v2DxbM4uOmo8fkCs/lQxINVgQWBD9DpRp6C4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723595331; x=1724200131;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VhqvxtsoSwNwxr5Jjd+awQeFEA3CdtcC5PD6Cr4xSzg=;
 b=mUx0BEPQCPH2cL7oWzMDj3UhQe0YOmRgeMi6W91xWf8LpMg2N4cCDQlp1mUCRjzox0
 PwYy5ggmArVAHahC2LpZSx4sRu5Gg+n6CPe0YeQ5Mk0IaochXOmc7+8hpux9qOH3/J59
 YUlYt7KeOXYApqRA8DR1xvoKyYYVcGAoa3f8aGnwRbYCiOAKhlfgGEXtzQjOyCgbcYJa
 y8TgM1mzWOXKNJ6i5Vuh6reuu6NS7sD9YA6l2Ebdx6lPlUpK8JHPeCMMEfbdtJHgDxm8
 NDz7mXPO6RNHgaICe1JZBmcWYNDMhsqIsGUxoqdK4r1XVmiYFF5IdDWAgXwAizGNPVMu
 ejVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0nPdS83VnJkPVzJIRRSGHCq9FTNaLXX8zrX53sy2i9Qb/swGvRvl7gHe3jtbNuGVpunYjVeKdkCvpII7MzuMhM9JCUHTEEuygeCybtnxN
X-Gm-Message-State: AOJu0YyKnA8izZCQV2VmfDuc3vtL39NeGQvi468Lf5wyC/2PVX5l1Ur/
 pbtbxbOXBAkdEQ7kFih9yo9HmooZzCdU5gC9FvH73ZhhfKODb0xXr129rXPJvQ==
X-Google-Smtp-Source: AGHT+IGdhRYoSwp5tG4mBSBiS7xFlKdpDsew9wYyDZz5NpATPRrWf22js/1XxEICy6sgFSFgcGLkyg==
X-Received: by 2002:a05:6a20:33aa:b0:1c3:a411:dc49 with SMTP id
 adf61e73a8af0-1c8eaf8aff5mr1203174637.51.1723595331197; 
 Tue, 13 Aug 2024 17:28:51 -0700 (PDT)
Received: from [10.211.41.59] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-201cd1c4556sm19050385ad.248.2024.08.13.17.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 17:28:50 -0700 (PDT)
Message-ID: <d8690b7a-2608-4c7f-b730-c10096573cff@broadcom.com>
Date: Tue, 13 Aug 2024 17:28:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Trigger a modeset when the screen moves
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com
References: <20240624205951.23343-1-ian.forbes@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20240624205951.23343-1-ian.forbes@broadcom.com>
Content-Type: text/plain; charset=UTF-8
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

On 6/24/24 13:59, Ian Forbes wrote:
> When multi-monitor is cycled the X,Y position of the Screen Target will
> likely change but the resolution will not. We need to trigger a modeset
> when this occurs in order to recreate the Screen Target with the correct
> X,Y position.
> 
> Fixes a bug where multiple displays are shown in a single scrollable
> host window rather than in 2+ windows on separate host displays.
> 
> Fixes: 426826933109 ("drm/vmwgfx: Filter modes which exceed graphics memory")
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 29 +++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> index a04e0736318da..9becd71bc93bc 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -877,6 +877,32 @@ vmw_stdu_connector_mode_valid(struct drm_connector *connector,
>  	return MODE_OK;
>  }
>  
> +/*
> + * Trigger a modeset if the X,Y position of the Screen Target changes.
> + * This is needed when multi-mon is cycled. The original Screen Target will have
> + * the same mode but its relative X,Y position in the topology will change.
> + */
> +static int vmw_stdu_connector_atomic_check(struct drm_connector *conn,
> +					   struct drm_atomic_state *state)
> +{
> +	struct drm_connector_state *conn_state;
> +	struct vmw_screen_target_display_unit *du;
> +	struct drm_crtc_state *new_crtc_state;
> +
> +	conn_state = drm_atomic_get_connector_state(state, conn);
> +	du = vmw_connector_to_stdu(conn);
> +
> +	if (!conn_state->crtc)
> +		return 0;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);

We should be checking for new_crtc_state being NULL here.

> +	if (du->base.gui_x != du->base.set_gui_x ||
> +	    du->base.gui_y != du->base.set_gui_y)
> +		new_crtc_state->mode_changed = true;
> +
> +	return 0;
> +}
> +
>  static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
>  	.dpms = vmw_du_connector_dpms,
>  	.detect = vmw_du_connector_detect,
> @@ -891,7 +917,8 @@ static const struct drm_connector_funcs vmw_stdu_connector_funcs = {
>  static const struct
>  drm_connector_helper_funcs vmw_stdu_connector_helper_funcs = {
>  	.get_modes = vmw_connector_get_modes,
> -	.mode_valid = vmw_stdu_connector_mode_valid
> +	.mode_valid = vmw_stdu_connector_mode_valid,
> +	.atomic_check = vmw_stdu_connector_atomic_check,
>  };
>  
>  

Maaz Mombasawala <maaz.mombasawala@broadcom.com>


