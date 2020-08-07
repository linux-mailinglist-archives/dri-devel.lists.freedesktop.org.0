Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6369323E999
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 10:53:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1C26E989;
	Fri,  7 Aug 2020 08:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172396E989
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 08:53:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r4so930580wrx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 01:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=2VcR1BDuGxPd+uco3kzeUdvgveolzvXOgl61y+LceLQ=;
 b=IQiHh+mOHTWbvSJ5MhHFvhQ9o5IriJWOXtk2hnDr0S0jKb5RBZvqVTQohVUW8zZtTz
 9+0Lg8yW0nHUrAZqymlHr98qpvrCsG9xBotNaMXmmdAH3qKbXnN4ArZr+MLNdDWFrhJf
 ixnLqOQ2MZH+OPkAnMBfTa6cMRhlnhZ/YxQRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=2VcR1BDuGxPd+uco3kzeUdvgveolzvXOgl61y+LceLQ=;
 b=HucPZb26pv8ZIiF2FerNgWdWeqUJSh02iWdTlThmkTSse4p/uuK8PamZyu86T/xUc0
 1i8hk6zOvlrqGSinUnJ2kL3LseGPEIWFHfJVnRNDkMUx0JGlPDEEWh6rm34H/pg5ELxi
 5vp8ltAtXazkGJ9A6e4fX2HCPX3EANtX3n8r2xPA/zrRyKK+uz7l0CZk5anKZIhrPWhl
 SiOEFyid3pWU5uSxj9jZ0EtY91CDFAsVzG0Ptl3IzNwBXewTCALmm+AirWwVLi4R/+Ev
 Fay7pd9swORq9KQr9LwyMx9cYcv+wwuh+mrRadPf48QNDquE6ZLCT/NYox9ZgeBgmbfi
 dB0g==
X-Gm-Message-State: AOAM531JkvZxd1UcCDVqzfXpZszgR3xcXMK8hAe/txgJY7f32XL2QFO3
 8VtOjZ0eSjtb5ZU6NUwvQkE4qA==
X-Google-Smtp-Source: ABdhPJz3F9pgtvDG875F9ck9GiThy96pkEWsAliV4QS3QkMPwCaukt5ASD6++GHHlV8T7yhBqZwrJw==
X-Received: by 2002:adf:fa4b:: with SMTP id y11mr10914375wrr.349.1596790390818; 
 Fri, 07 Aug 2020 01:53:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v11sm9571033wrr.10.2020.08.07.01.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 01:53:10 -0700 (PDT)
Date: Fri, 7 Aug 2020 10:53:08 +0200
From: daniel@ffwll.ch
To: 
Subject: Re: [PATCH] drm/gma500: fix spelling mistake "pannel" -> "panel"
Message-ID: <20200807085308.GQ6419@phenom.ffwll.local>
Mail-Followup-To: Colin King <colin.king@canonical.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200805124227.20005-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805124227.20005-1-colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 05, 2020 at 01:42:27PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There a handful of spelling mistakes. fix them.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Queued up for 5.10, should show up in linux-next right after the merge
window closes.
-Daniel

> ---
>  drivers/gpu/drm/gma500/mdfld_dsi_output.c | 4 ++--
>  drivers/gpu/drm/gma500/psb_intel_sdvo.c   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_output.c b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
> index f350ac1ead18..2f3486f32fed 100644
> --- a/drivers/gpu/drm/gma500/mdfld_dsi_output.c
> +++ b/drivers/gpu/drm/gma500/mdfld_dsi_output.c
> @@ -366,7 +366,7 @@ static enum drm_mode_status mdfld_dsi_connector_mode_valid(struct drm_connector
>  	/**
>  	 * FIXME: current DC has no fitting unit, reject any mode setting
>  	 * request
> -	 * Will figure out a way to do up-scaling(pannel fitting) later.
> +	 * Will figure out a way to do up-scaling(panel fitting) later.
>  	 **/
>  	if (fixed_mode) {
>  		if (mode->hdisplay != fixed_mode->hdisplay)
> @@ -531,7 +531,7 @@ void mdfld_dsi_output_init(struct drm_device *dev,
>  	dsi_config->connector = dsi_connector;
>  
>  	if (!dsi_config->fixed_mode) {
> -		DRM_ERROR("No pannel fixed mode was found\n");
> +		DRM_ERROR("No panel fixed mode was found\n");
>  		goto dsi_init_err0;
>  	}
>  
> diff --git a/drivers/gpu/drm/gma500/psb_intel_sdvo.c b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> index 06e44f47e73e..907f966d6f22 100644
> --- a/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> +++ b/drivers/gpu/drm/gma500/psb_intel_sdvo.c
> @@ -125,7 +125,7 @@ struct psb_intel_sdvo {
>  	bool is_lvds;
>  
>  	/**
> -	 * This is sdvo fixed pannel mode pointer
> +	 * This is sdvo fixed panel mode pointer
>  	 */
>  	struct drm_display_mode *sdvo_lvds_fixed_mode;
>  
> -- 
> 2.27.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
