Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A512F2A66
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 09:56:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4C86E158;
	Tue, 12 Jan 2021 08:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3156E158
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 08:56:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t30so1620120wrb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jan 2021 00:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=gg3b4S3+NvBTyr0GUYFPJqJgJwEUKIraiC/Q4OrzhDU=;
 b=kV8jbVHGZ83kAA2ockVKP3nZ5skWlkzOniECMv+Rr/OaHN1qkfgvADTHs23Z849hPg
 cfxkiQwka5IjJInacK/GqMNA1rjVXxZhD5+JfCl8dSj1nLGSd6U9wAqRMJjtA6dgfOa+
 b/jSWh3tzjAmeno4fLk642Ita4/dgb+Vy3bTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=gg3b4S3+NvBTyr0GUYFPJqJgJwEUKIraiC/Q4OrzhDU=;
 b=n84Yo67mCvzDC0an055IRrfmZjeCFBiE1XWDqpIYZxj4zUdZE6dIM6DgpG/giDbQrC
 vxZsIlcT8u8xCA7UwsiW5sSd819YA0MSt09Vr6/Muj3OMeSgRO7VNzeJqQlXBX1fWWIC
 AT7ehvrvpbi7lzBrVq5D5SK60y0bTDGsj6AaHlgRWyHtNz1yEw0bPRBp33C/8o1WNNQc
 SH4kn6uMpYs4ECbW2Bi27pM5Os0q00Cp6kePg0SB3vdcDeZk6Xtz2/pnRf7Zjog7ucSA
 ptj3g6vvUFLdhQ36tb23FRIf8xr6tQ69ppDvO15hDjj/o0pJbi7t44eGgruy8miiMKNh
 /zkA==
X-Gm-Message-State: AOAM531EaAy0uJmXh//0fungrHfjBChHY27PM1l1dc6rWnWvaPO2170B
 5RcqYVHziQ7I5pEC0ywkcyN0fQ==
X-Google-Smtp-Source: ABdhPJz94xA5LyGQws93JRw6mmTqO9rvy26w4v3WTl1SAD+5pg6u83ZfeyEgolrvXRuDnKy0SDb+Qw==
X-Received: by 2002:adf:e60f:: with SMTP id p15mr3112146wrm.60.1610441803328; 
 Tue, 12 Jan 2021 00:56:43 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o23sm4068104wro.57.2021.01.12.00.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 00:56:42 -0800 (PST)
Date: Tue, 12 Jan 2021 09:56:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Zhaoge Zhang <zhangzhaoge@loongson.cn>
Subject: Re: [PATCH] drm: Fix macro name DRM_MODE_PROP_OBJECT in code comment
Message-ID: <X/1kSJ/y+5BIotd4@phenom.ffwll.local>
Mail-Followup-To: Zhaoge Zhang <zhangzhaoge@loongson.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1610416479-32736-1-git-send-email-zhangzhaoge@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1610416479-32736-1-git-send-email-zhangzhaoge@loongson.cn>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 12, 2021 at 09:54:39AM +0800, Zhaoge Zhang wrote:
> Signed-off-by: Zhaoge Zhang <zhangzhaoge@loongson.cn>
> ---
>  include/drm/drm_property.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_property.h b/include/drm/drm_property.h
> index 4a0a80d..bbf5c1fd 100644
> --- a/include/drm/drm_property.h
> +++ b/include/drm/drm_property.h
> @@ -114,7 +114,7 @@ struct drm_property {
>  	 *     by the property. Bitmask properties are created using
>  	 *     drm_property_create_bitmask().
>  	 *
> -	 * DRM_MODE_PROB_OBJECT
> +	 * DRM_MODE_PROP_OBJECT

Nice catch, merged to drm-misc-next, thanks for your patch.
-Daniel

>  	 *     Object properties are used to link modeset objects. This is used
>  	 *     extensively in the atomic support to create the display pipeline,
>  	 *     by linking &drm_framebuffer to &drm_plane, &drm_plane to
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
