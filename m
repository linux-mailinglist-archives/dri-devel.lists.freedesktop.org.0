Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2D92AD8A8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 15:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACA089A6D;
	Tue, 10 Nov 2020 14:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D24389A6D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 14:23:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b8so12853532wrn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 06:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Zqe7nwU/P8OkzukY/pv+arKyrBgWccNuW8X0SZjY9Ak=;
 b=VLpMTI7FT165N86D0aUyplJSCJFZJSPSJXdpUCZndgjhvu92UHeZ7yEYMijCqEJsmH
 e+CnUfdLk50PYKUwkqvGI10rfSorx66RnJtmHSmB5wwKXi0yZpEzkgDJbyozc0H48Zsp
 n4IVn6rlCCNlEpUcn+fta6RtK+vL5yNqKFxTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Zqe7nwU/P8OkzukY/pv+arKyrBgWccNuW8X0SZjY9Ak=;
 b=cMCwZNkOQqNi96eSCP2hPC9ztdtFmLTi1CmRgnl9nUyWUISrr6XbRZV/EwSoT1uVVI
 B8IPXPwKnAFmy8KQwYu+mj36NjtXpBIPxYtu33Pld/U5zKrXG4S72mDfgRUJjMAgk9NB
 JDJ53+gmzjYdsGkM/vw1uF2fAqXKIgHextMMmVpbqdARlULuwJjNgNIN3vBickoQlHHu
 S0JyGK21NVhZeRm9Fu+mxXf4lBiCl7A3E02uNWoXTTiDGdYOdZ1FIUoqecYJa9sMhF6l
 7jOyE7b3UsioxAdRJVWmCwu2P2Y0H959f5RDTAsuLakgDNc6tXXNHAlBn9pWDDaFLiCF
 w40A==
X-Gm-Message-State: AOAM533rlkjM0+mEKDE159DpZMdQSMGuB2lyAsU/Cek9ZjYfMB6J3D59
 egscSbTkdL1rS0jjJFfd+4yB4Q==
X-Google-Smtp-Source: ABdhPJwjck1JFyrzvOoLHZUGjC6+cXpmFd37Hf617BlCCoIt/Nw7WvCVimbI3hlvD6kONPYCtEUCSA==
X-Received: by 2002:adf:fb0f:: with SMTP id c15mr23084936wrr.86.1605018185766; 
 Tue, 10 Nov 2020 06:23:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t11sm3143479wmf.35.2020.11.10.06.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 06:23:04 -0800 (PST)
Date: Tue, 10 Nov 2020 15:23:03 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Abrecht <freedesktop-linux-dri-devel@nodmarc.danielabrecht.ch>
Subject: Re: [PATCH v2 RESEND] drm: mxsfb: Implement .format_mod_supported
Message-ID: <20201110142303.GJ401619@phenom.ffwll.local>
References: <2a99ffffc2378209307e0992a6e97e70@nodmarc.danielabrecht.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a99ffffc2378209307e0992a6e97e70@nodmarc.danielabrecht.ch>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 08, 2020 at 09:00:01PM +0000, Daniel Abrecht wrote:
> This will make sure applications which use the IN_FORMATS blob
> to figure out which modifiers they can use will pick up the
> linear modifier which is needed by mxsfb. Such applications
> will not work otherwise if an incompatible implicit modifier
> ends up being selected.
> 
> Before commit ae1ed0093281 ("drm: mxsfb: Stop using DRM simple
> display pipeline helper"), the DRM simple display pipeline
> helper took care of this.
> 
> Signed-off-by: Daniel Abrecht <public@danielabrecht.ch>
> Fixes: ae1ed0093281 ("drm: mxsfb: Stop using DRM simple display pipeline
> helper")

Makes sense and I picked it up since it seems to be a bit lost. Applied
tod drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> index 956f631997f2..fc4b1626261b 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -484,6 +484,13 @@ static void mxsfb_plane_overlay_atomic_update(struct
> drm_plane *plane,
>  	writel(ctrl, mxsfb->base + LCDC_AS_CTRL);
>  }
> 
> +static bool mxsfb_format_mod_supported(struct drm_plane *plane,
> +				       uint32_t format,
> +				       uint64_t modifier)
> +{
> +	return modifier == DRM_FORMAT_MOD_LINEAR;
> +}
> +
>  static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs
> = {
>  	.atomic_check = mxsfb_plane_atomic_check,
>  	.atomic_update = mxsfb_plane_primary_atomic_update,
> @@ -495,6 +502,7 @@ static const struct drm_plane_helper_funcs
> mxsfb_plane_overlay_helper_funcs = {
>  };
> 
>  static const struct drm_plane_funcs mxsfb_plane_funcs = {
> +	.format_mod_supported	= mxsfb_format_mod_supported,
>  	.update_plane		= drm_atomic_helper_update_plane,
>  	.disable_plane		= drm_atomic_helper_disable_plane,
>  	.destroy		= drm_plane_cleanup,
> -- 
> 2.20.1
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
