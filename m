Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC5A2D72B9
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 10:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3A26ECF6;
	Fri, 11 Dec 2020 09:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C736ECF6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 09:19:23 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id w206so4270587wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 01:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=c8okHmMvXK/VjoDCB4HCJOKyrGeN/EQ/yVS/n76V9Ag=;
 b=dGHV8MCiYa7F9QPNKroPHL9yNVzmxWyQ5hqx3D5hdSnDFD5UPOxCGa4rbi5FPlfGYy
 YPbxEXAuwTABorCY0eaPwGWOePfBnOlyv4ql0lit5Q8fV4UNuA34hbFzPuzn3UCKOu0A
 u+lamwgY35aSuVCUM6uiFynr0QusUpwDCj8hs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c8okHmMvXK/VjoDCB4HCJOKyrGeN/EQ/yVS/n76V9Ag=;
 b=gOBcXJQyvDYF+Cw61xyugnIUnW0r4Ot3RUPYbz0Do+nLjxhsMGi1mRCRwv8f6wyiMF
 IM1btp6L5S8txH2j9Vi9cxYScY0dlWFGcvfX/okK+qOPiCCzpJSmAWZN+h27xzrvBX8z
 o6QnIo1ysQ867erKTu7DME683u0vNV11GQEbUzxfS6fpLskcqgf6SVDFptjGb6t7Irrk
 PmmTwe73pEaKND35AnM8h04IiKk5bbB4mTyqVV4lcgyd9o+Bfbshm89zR/ZtWj1ozDR9
 mw7vZiIjiw6pyLQI1Kka5Fn0WW6RiI1Mw1bGLvtQZoiaJzsKD9aNHGdjhn/uZFZyUp/M
 sLmg==
X-Gm-Message-State: AOAM533Dol1phL8Uw/lZMAPSQwFTnJKOHN1MNibuFBBeHo6IOyJkFFi0
 WvDsuZxThWacnLeZ2lB8PTyeRRD6fm5g0Q==
X-Google-Smtp-Source: ABdhPJxN89SsC0ZLi89XfPspUyIv69z8viF5c4F1HSniVZ5SbSjRESlcwE8CZrhQzv0D0DBE/Gmigg==
X-Received: by 2002:a1c:4c07:: with SMTP id z7mr12333467wmf.142.1607678362237; 
 Fri, 11 Dec 2020 01:19:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c2sm13444706wrv.41.2020.12.11.01.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 01:19:21 -0800 (PST)
Date: Fri, 11 Dec 2020 10:19:19 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/3] drm: require a non_NULL drm_crtc.primary
Message-ID: <20201211091919.GH401619@phenom.ffwll.local>
References: <kW7vylF0J6Nbh0g1bvYEuG1DgaYRFH0ovsnD0c0SeU@cp3-web-024.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <kW7vylF0J6Nbh0g1bvYEuG1DgaYRFH0ovsnD0c0SeU@cp3-web-024.plabs.ch>
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

On Thu, Dec 10, 2020 at 03:50:35PM +0000, Simon Ser wrote:
> If a CRTC is missing a legacy primary plane pointer, a lot of things
> will be broken for user-space: fbdev stops working and the entire legacy
> uAPI stops working.
> 
> Require all drivers to populate drm_crtc.primary to prevent these
> issues. Warn if it's NULL.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

For context we even kinda guarantee that xrgb8888 is available, with
in-kernel conversion, because just too much of the simplistic userspace
falls over otherwise. If we don't have a primary plane then kms is
practically useless I think :-)

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_mode_config.c | 3 +++
>  drivers/gpu/drm/drm_plane.c       | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 2c73a60e8765..fbe680035129 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -639,6 +639,9 @@ void drm_mode_config_validate(struct drm_device *dev)
>  	}
>  
>  	drm_for_each_crtc(crtc, dev) {
> +		WARN(!crtc->primary, "Missing primary plane on [CRTC:%d:%s]\n",
> +		     crtc->base.id, crtc->name);
> +
>  		if (crtc->primary) {
>  			WARN(!(crtc->primary->possible_crtcs & BIT(crtc->index)),
>  			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 5d33ca9f0032..49b0a8b9ac02 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -57,7 +57,7 @@
>   * Legacy uAPI doesn't expose the primary and cursor planes directly. DRM core
>   * relies on the driver to set the primary and optionally the cursor plane used
>   * for legacy IOCTLs. This is done by calling drm_crtc_init_with_planes(). All
> - * drivers should provide one primary plane per CRTC to avoid surprising legacy
> + * drivers must provide one primary plane per CRTC to avoid surprising legacy
>   * userspace too much.
>   */
>  
> -- 
> 2.29.2
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
