Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7E9278398
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 11:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D768C6E02E;
	Fri, 25 Sep 2020 09:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F1A6E02E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 09:10:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id e17so2280960wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4bxN2fagu2rIKQxxyvxxjzncZ5aqxZkwbZ2FY0Psst0=;
 b=LxdC9Zu/73+wFvQcMk2+2joqpYrO9qtRHkxX8hNdZGlt7eQGoB9dygmySiEslOrlEF
 wYF0qYgQZbhczxJ8t5Tbl0VtdDZ+vruEJxtx0jq6acTdd+c4jq3aJAVLO1nc6afAK3qQ
 RgBq81pCn5niW1axKn/dLdeUnGx5zfai6EX7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=4bxN2fagu2rIKQxxyvxxjzncZ5aqxZkwbZ2FY0Psst0=;
 b=SmsLdB9gpv54TtIwTWFUtU9MAmjCpORPch7hhuLI5cuSPzPBXQVsrAknmvDKby/qJg
 0EjGnSRCMt3vM48pnd0awvXKUdUKwR5aiHt2bYisWiiYsdUkzNZAZAYFlk5Q1UTrb3Vs
 Ai7l7F1c2G96hiKSu9/BD/TS9p0LHyo3nIDSxoi/401sipl0YZ6lf8IxFbH70nHoy1O3
 DvgcbZXwJu505t3gOUlTRB8qLT04fWEssfJTx6oAw5UO4+dR7HPwi+aqq+eO/I6YBNG2
 73CJpuH+EtPqesP4rfT+gBKa9Y0/C3EnOc2F0nuDAz1lGGU55yjbYbaxchTGS0Yj7NOr
 Ecng==
X-Gm-Message-State: AOAM531vp6kKAXxTJK+XQnpleiWa53TJB6Sc8SeYeK2QcgQaRNfmMufK
 nVfWvwxIOTQGvCulUoVRkFnEZg==
X-Google-Smtp-Source: ABdhPJz39Njw83y/iQ1by8WVklDBrwBAysH2nbHjX1h9i0Z3FFq/537COlQ1R7PRkQNkxthD8z2i+g==
X-Received: by 2002:a1c:5f46:: with SMTP id t67mr2003936wmb.71.1601025025796; 
 Fri, 25 Sep 2020 02:10:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm2106005wrt.38.2020.09.25.02.10.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 02:10:24 -0700 (PDT)
Date: Fri, 25 Sep 2020 11:10:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] drm/vc4: Deleted the drm_device declaration
Message-ID: <20200925091023.GE438822@phenom.ffwll.local>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>, eric@anholt.net,
 airlied@linux.ie, sumit.semwal@linaro.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <1601023898-29886-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1601023898-29886-1-git-send-email-tiantao6@hisilicon.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 04:51:38PM +0800, Tian Tao wrote:
> drm_modeset_lock.h already declares struct drm_device, so there's no
> need to declare it in vc4_drv.h
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Just an aside, when submitting patches please use
scripts/get_maintainers.pl to generate the recipient list. Looking through
past few patches from you it seems fairly arbitrary and often misses the
actual maintainers for a given piece of code, which increases the odds the
patch will get lost a lot.

E.g. for this one I'm only like the 5th or so fallback person, and the
main maintainer isn't on the recipient list.

Cheeers, Daniel

> ---
>  drivers/gpu/drm/vc4/vc4_drv.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index 8c8d96b..8717a1c 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -19,7 +19,6 @@
>  
>  #include "uapi/drm/vc4_drm.h"
>  
> -struct drm_device;
>  struct drm_gem_object;
>  
>  /* Don't forget to update vc4_bo.c: bo_type_names[] when adding to
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
