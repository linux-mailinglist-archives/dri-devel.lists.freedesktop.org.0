Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B53917714B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE11388635;
	Tue,  3 Mar 2020 08:31:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151BD88635
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 08:31:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n7so3123000wrt.11
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 00:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=j1X+kOl9uPGIFA7u5a2AdFDqq6QZcBX90u+2y/X3AF0=;
 b=B6wK6J0qouZfGHcyqrYtFFfJ61r++Fw5BQTPE7e7Mh9cX1qDO+q5Rh26xSsLQ3/jpK
 ystGYc66JLeqmDQGGKe5q1Qm/MipV9DOIdRPsBE2ppGoVrB6m6if1IXC82nlQZfO5vO8
 +wg/g772SyssmKUvtFyDN1wytbaAZWeEMu3qI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=j1X+kOl9uPGIFA7u5a2AdFDqq6QZcBX90u+2y/X3AF0=;
 b=C/W5b7k6HWf17vlK04/o4CPxYreupvCPZm27ugHLFvz4Wz3LEXIKi7R0UTb9ydJTH2
 O0xPZkHxBccvrMCKvagLL6lqTz2WlTjgmIboHYBDyok23H/jF0mLydjowIOLOm2wVVLE
 hdsSA//x1COPmiP4WxowF4ehs9eLnIs2nuNO33Yga+cJcH9yzDUhLv+/kRP811AuqsTT
 AfGIFPQdYvSZjX43cfy5YVKi1lHKilqKbYxt8Ahm9XmWkfkAQEnbWXsxkHiCBjLt5E6m
 2emnwGlR9F5tI9UbFhpQnN9guxgnDflPwuRh7Nkm3uLgRMHyGvqk74KSSA/3hZ2jvDZk
 WcNQ==
X-Gm-Message-State: ANhLgQ1Mou1izs9QKk+ZypDDMC7iAKjkTHCuYSd8FkCEe88Op38kEvAQ
 H7ub6+uJ8cP4rySsXGafIRPI4A==
X-Google-Smtp-Source: ADFU+vusmj8hJu5emj6MZ3Z/ZKfXWt8vNgRO8G8uVfTqDrq7AaKJj0l+2BgYTfaFt7DYJHtvMLG86A==
X-Received: by 2002:adf:ecca:: with SMTP id s10mr4452053wro.255.1583224287781; 
 Tue, 03 Mar 2020 00:31:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l8sm2825851wmj.2.2020.03.03.00.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 00:31:27 -0800 (PST)
Date: Tue, 3 Mar 2020 09:31:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/simple-kms: Fix documentation for
 drm_simple_encoder_init()
Message-ID: <20200303083125.GM2363188@phenom.ffwll.local>
References: <20200303071807.9288-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303071807.9288-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 08:18:07AM +0100, Thomas Zimmermann wrote:
> Brings the documentation of drm_simple_encoder_init() in sync with the
> function's signature.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 63170ac6f2e8 ("drm/simple-kms: Add drm_simple_encoder_{init,create}()")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 5a2abe2dea3e..2fab80aaf52e 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -40,7 +40,7 @@ static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
>  /**
>   * drm_simple_encoder_init - Initialize a preallocated encoder
>   * @dev: drm device
> - * @funcs: callbacks for this encoder
> + * @encoder: the encoder to initialize
>   * @encoder_type: user visible type of the encoder
>   *
>   * Initialises a preallocated encoder that has no further functionality.
> --
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
