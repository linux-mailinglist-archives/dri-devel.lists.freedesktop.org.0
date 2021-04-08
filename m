Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 046DD35814A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:06:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 438456EA8B;
	Thu,  8 Apr 2021 11:06:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0896EA8B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 11:06:17 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so2687767wmy.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 04:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=p0vtgOvE8iFrrW+FYLV4+rHA4rgvxJ8gg28Kh71P4qc=;
 b=kiFArAnZyBqtytpQIkNm5rEsRYCs5r6j4ZfOrS3OLJ7Tsux0s/Q/LgL6AVo3mxzz6o
 gvYQqRO5G6JmpJS32Uzi3tXm5SY3MDyT8UFiZRd9wuZknp3ajr3sDNUp5RIEsxptUe4M
 /HV33tb8kvUQXz+gyDd2XWUBnpuryuXCNmjGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=p0vtgOvE8iFrrW+FYLV4+rHA4rgvxJ8gg28Kh71P4qc=;
 b=jG3BkBqhOq/tw9xyGgkmcUtWhUXtZpOkLLRs6Kj+26dBKG7VvfdhJyHfFt2lKTmBkJ
 p9UI6rcg+vr0/e2E92LX6TcksM7jhEaym/u1d18xbxDJ26gxQTQN179fzCmz3vw/yAbS
 MrGjMaERGF42UG2QP6RUagot0MAIzPh1YqV3aaO4YYEFwFEyJRO+Mi+xzT19sW7k+A7y
 1JaLUf9kzA0wZ3E0g7ETs+7DLI35I5vZM5OFCzLLShh7oQpu3VqPRZxo/jez2sOhXU4B
 ePpF9j0/RY5VwPJYiV0CUSGSiLGwfc3dOq3vvqsABhPixLpICfy5aDjRam0JWY7+mF8g
 Na+g==
X-Gm-Message-State: AOAM530oPWAA88d4PrQyCKsBkBBx5ckuSl2xI42a8IxQAUVTCyEBZavH
 Nxqi3Cv3Lfm9BdQmkSYskFSfGDeS/HJnqw==
X-Google-Smtp-Source: ABdhPJwgyQbYDJJ03aWo7qFX343DdQllaEQEIJhPy+tbRI5+2U3016msP4YmDClhO/2MUePG8sheWg==
X-Received: by 2002:a1c:7c08:: with SMTP id x8mr7815815wmc.106.1617879976185; 
 Thu, 08 Apr 2021 04:06:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y31sm2907091wmp.46.2021.04.08.04.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:06:15 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:06:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] drm/drm_internal.h: Remove repeated struct declaration
Message-ID: <YG7jpSjGcCmMdoP7@phenom.ffwll.local>
Mail-Followup-To: Wan Jiabing <wanjiabing@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kael_w@yeah.net
References: <20210401081704.1000863-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401081704.1000863-1-wanjiabing@vivo.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, kael_w@yeah.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 01, 2021 at 04:17:03PM +0800, Wan Jiabing wrote:
> struct drm_gem_object is declared twice. One is declared
> at 40th line. The blew one is not needed. Remove the duplicate.
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Pushed to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_internal.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index fad2249ee67b..1265de2b9d90 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -170,7 +170,6 @@ void drm_sysfs_connector_remove(struct drm_connector *connector);
>  void drm_sysfs_lease_event(struct drm_device *dev);
>  
>  /* drm_gem.c */
> -struct drm_gem_object;
>  int drm_gem_init(struct drm_device *dev);
>  int drm_gem_handle_create_tail(struct drm_file *file_priv,
>  			       struct drm_gem_object *obj,
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
