Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15452DD110
	for <lists+dri-devel@lfdr.de>; Thu, 17 Dec 2020 13:05:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5848997E;
	Thu, 17 Dec 2020 12:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F808997E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 12:05:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id n16so3826254wmc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Dec 2020 04:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=lGnTDengcfKb/ObwIkexkS6sfUXdtJA38Ezv9vTT09w=;
 b=BCHf8bjFSTdDpAbHRg9aHUS9NkBYr+kj495YKxVkTCuq53QFoBAPQGJ17cD+OgIlF6
 6WCVkkdS7tCbg8TUioXnwAMz+Cy5rnlHc/vyVftbeh0HJk4MmRn82QgLaF31bjKmyYmQ
 2lVWKpF8L/sxbFVzxWA6aVBXI/nYsBo9oAxNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lGnTDengcfKb/ObwIkexkS6sfUXdtJA38Ezv9vTT09w=;
 b=HnVSIEXWe661xe4LUXtL3gN2acL12WIUBb5oZlOtwKgZEuUOWLKICddZN5q/IUq28X
 OsDfaYsfd2gpwgD4bs85dLIAXIUCWkbeQ1VlX/dM1bWSoWtdr9NVm62/o2tOubEZDU1M
 4zG/8MPSfFvpZeRImMaeINOdC7OHORAbhpeRvxwvSCgzJUGN2flAySOHvbZFO/oSbi+o
 +4Yc7arsGMSyvNZB2kIXx1hzXF50IEhzEtxR01Q1xmbx3JyzI85Mh1gf13lVpQ36JKAO
 99ZdgIetXXoY5yFUT/Z7P8lzf6f8ESRaTVp+W+5Ll3sir+Q97+qny6K/dQulxBZVDw8u
 fAOA==
X-Gm-Message-State: AOAM532zmE3jW/Fy/u20wIfCFuEEeijdBGFCRSeBxfnLNaoph/+0/VYy
 PYmNb4SN0U6wdIktn2ZKgCuPTA==
X-Google-Smtp-Source: ABdhPJyidlTSeIIU0rhE3xPbCabiPsML6aD8sR77q4R5S0QMytYHisokqnjbtkQTqck97PhJDeiB7A==
X-Received: by 2002:a05:600c:208:: with SMTP id
 8mr8356116wmi.143.1608206744761; 
 Thu, 17 Dec 2020 04:05:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g11sm8754346wrq.7.2020.12.17.04.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 04:05:44 -0800 (PST)
Date: Thu, 17 Dec 2020 13:05:42 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 6/9] drm/doc: atomic implicitly enables other caps
Message-ID: <X9tJluvNVJH0sk0V@phenom.ffwll.local>
References: <20201217113220.102271-1-contact@emersion.fr>
 <20201217113220.102271-7-contact@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217113220.102271-7-contact@emersion.fr>
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

On Thu, Dec 17, 2020 at 12:32:17PM +0100, Simon Ser wrote:
> Document that enabling atomic also enables universal planes and aspect
> ratio modes.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/drm.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 808b48a93330..5c31aea1f342 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -678,7 +678,9 @@ struct drm_get_cap {
>  /**
>   * DRM_CLIENT_CAP_ATOMIC
>   *
> - * If set to 1, the DRM core will expose atomic properties to userspace
> + * If set to 1, the DRM core will expose atomic properties to userspace. This
> + * implicitly enables &DRM_CLIENT_CAP_UNIVERSAL_PLANES and
> + * &DRM_CLIENT_CAP_ASPECT_RATIO.
>   */
>  #define DRM_CLIENT_CAP_ATOMIC	3
>  
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
