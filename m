Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53892E0C6E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 16:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA936E880;
	Tue, 22 Dec 2020 15:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD936E880
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 15:09:12 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 190so2135323wmz.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 07:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=//6/GeLm2VjocWIIM23HGQmaKVrmBdF4eSj3qcdW/Vs=;
 b=JTBgUoCqQcd5SCzWzZjnHzp7aN9ufmIff1143L0brscU+vZrf8Y//nTo3FDLN6LAF4
 f+CW9Y78kw4j+Uy/Q4nvLrYQSJr/sne/zNUZkxY+9fHD+Qop1XRR/3ZGVH9OZs4jfsKT
 eMI1EuJYzesN8Jtv34OGqkDKPSgF1GDeB+ClE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=//6/GeLm2VjocWIIM23HGQmaKVrmBdF4eSj3qcdW/Vs=;
 b=HHSpPz9yftNXZEo9Y746XWbAJ4kyQpJrgevwJ/Tzvop9gCQ5NP9vczkWgKMid1oI9j
 l01t9Oa7J/ATF2fxD1/cQuq94Fp5OInouiNHDDw+pPoisPXFi0ue2jayEKZUWM5REoei
 eUTV4hIek7RIes7xZ1oXupcrfizNqMhrqrA1sxwbq0VDdTluGmrE3HdicYb4iQke6Xrx
 vnHs8EUnAW8mIpRhxsq2at0CYZRRjaduaSwZkEkrP92kUfrdHeTxnOjbpRRNxyzCfB/9
 gcorjEsg1FoXe6WcPTdEEvNuOAtnCDq+FfwN7Vqhdtr33zhR4T1vchI6q96J6IpXTMfK
 7R6Q==
X-Gm-Message-State: AOAM533salTcSi7bhjoqLCyfKpJWuTEVaSyu4eDDEAb56AE6SLjG58C+
 A0ZO+BYAoQtUjLyjjGrHXxB08g==
X-Google-Smtp-Source: ABdhPJwhLBWuozkQ35aJMrmNOVeGDapKA8K380NuJamR/r9MKueHjH4slJ6vNd1chN5CDL0uan+tEw==
X-Received: by 2002:a1c:2203:: with SMTP id i3mr21983827wmi.6.1608649750956;
 Tue, 22 Dec 2020 07:09:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j10sm30415658wmj.7.2020.12.22.07.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Dec 2020 07:09:10 -0800 (PST)
Date: Tue, 22 Dec 2020 16:09:08 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: warn if cursor plane is set with legacy funcs
Message-ID: <X+IMFOv0/76J2o52@phenom.ffwll.local>
References: <20201222134002.161613-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201222134002.161613-1-contact@emersion.fr>
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

On Tue, Dec 22, 2020 at 02:40:02PM +0100, Simon Ser wrote:
> A driver must not set drm_crtc.cursor and any of the legacy funcs at the
> same time, otherwise it's not clear which one DRM core should use for
> legacy cursor updates.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_mode_config.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
> index 9611f21bca00..92e56baf04ad 100644
> --- a/drivers/gpu/drm/drm_mode_config.c
> +++ b/drivers/gpu/drm/drm_mode_config.c
> @@ -645,6 +645,16 @@ void drm_mode_config_validate(struct drm_device *dev)
>  		WARN(!crtc->primary, "Missing primary plane on [CRTC:%d:%s]\n",
>  		     crtc->base.id, crtc->name);
>  
> +		WARN(crtc->cursor && crtc->funcs->cursor_set,
> +		     "[CRTC:%d:%s] must not have both a cursor plane and a cursor_set func",
> +		     crtc->base.id, crtc->name);
> +		WARN(crtc->cursor && crtc->funcs->cursor_set2,
> +		     "[CRTC:%d:%s] must not have both a cursor plane and a cursor_set2 func",
> +		     crtc->base.id, crtc->name);
> +		WARN(crtc->cursor && crtc->funcs->cursor_move,
> +		     "[CRTC:%d:%s] must not have both a cursor plane and a cursor_move func",
> +		     crtc->base.id, crtc->name);
> +
>  		if (crtc->primary) {
>  			WARN(!(crtc->primary->possible_crtcs & drm_crtc_mask(crtc)),
>  			     "Bogus primary plane possible_crtcs: [PLANE:%d:%s] must be compatible with [CRTC:%d:%s]\n",
> -- 
> 2.29.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
