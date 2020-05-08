Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3FB1CA4B4
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 09:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6ED36EA85;
	Fri,  8 May 2020 07:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CBD6EA85
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 07:00:37 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g12so9431932wmh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 May 2020 00:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8MnCc1khSljqIz98fLPIacDy/8apvfnoTAzjX1a/XTA=;
 b=NJ58n12wUmvKp+G7bWopRKxtR/va+EFmrzC9cpGIOeOqvMOAgJfdASAR/dk4e46lrx
 4IqkG5/MwNcOIPcxaoCxzw5waP18CXhGYNfdbLUCsfODEXLbAhklGp5tFN8az8sRayzd
 Cf3dc41BXm+quJsgzmm7Uc+yVIE3Svmt2nDrU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8MnCc1khSljqIz98fLPIacDy/8apvfnoTAzjX1a/XTA=;
 b=Pvu08/LO9O03cEF5EwzrsBZKRttoD04sBJq7uQdGbMDj5Tp06Ee3KD6Ftzr5nUz/4X
 CvqPub9CdD9ATIadnW+C2GbPlgZrQOUvB5mmPaTnICjEHuUjX0Q9IqlGOaJlhfjULNJp
 tsZ481kqITgBuh1Wtlej7lmlUE5Gnx8IPiKp7ne92Iz7i6P6zBeCrpppxjrpoiUHNdLt
 zQukvkZZWymDle994I6gjWYUiDQJng7ABEC07iNm2PCfAMRnHPea7JlncjSTi+13g+Ax
 Z2Z/yd3lTA6i6VERsueRyIoC4wY6gmk6gxzlNU/41MVUN1tLrAxIe5gVF49d9FQgmvgI
 pNdQ==
X-Gm-Message-State: AGi0PubMRusrPAiKeX3o+Vb+ONJX+cnn3Q772RYUWkTQapki3KvC6ADn
 F60MWZ68bLEj8bYZ9Xqc2jhonQ==
X-Google-Smtp-Source: APiQypLOqs4JdrZ323p/FA7Dw8Zkacjt0l2kb4eU+AwHxgdaHxIjPyu74gv/Tyfnwg4V31/pphUu2Q==
X-Received: by 2002:a1c:4c3:: with SMTP id 186mr10967389wme.75.1588921235701; 
 Fri, 08 May 2020 00:00:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x18sm11050540wmi.29.2020.05.08.00.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 00:00:34 -0700 (PDT)
Date: Fri, 8 May 2020 09:00:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3] drm/ast: Don't check new mode if CRTC is being disabled
Message-ID: <20200508070033.GE1383626@phenom.ffwll.local>
References: <20200507090640.21561-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507090640.21561-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: cogarre@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com, airlied@redhat.com,
 stable@vger.kernel.org, sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 07, 2020 at 11:06:40AM +0200, Thomas Zimmermann wrote:
> Suspending failed because there's no mode if the CRTC is being
> disabled. Early-out in this case. This fixes runtime PM for ast.
> 
> v3:
> 	* fixed commit message
> v2:
> 	* added Tested-by/Reported-by tags
> 	* added Fixes tags and CC (Sam)
> 	* improved comment
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: Cary Garrett <cogarre@gmail.com>
> Tested-by: Cary Garrett <cogarre@gmail.com>
> Fixes: b48e1b6ffd28 ("drm/ast: Add CRTC helpers for atomic modesetting")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: <stable@vger.kernel.org> # v5.6+

Yeah legacy crtc helpers just let you shut stuff off and no checks.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ast/ast_mode.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 7a9f20a2fd303..0cbbb21edb4e1 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -801,6 +801,9 @@ static int ast_crtc_helper_atomic_check(struct drm_crtc *crtc,
>  		return -EINVAL;
>  	}
>  
> +	if (!state->enable)
> +		return 0; /* no mode checks if CRTC is being disabled */
> +
>  	ast_state = to_ast_crtc_state(state);
>  
>  	format = ast_state->format;
> -- 
> 2.26.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
