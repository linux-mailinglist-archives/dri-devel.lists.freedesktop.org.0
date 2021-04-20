Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D95F3654A7
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084556E49C;
	Tue, 20 Apr 2021 08:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150ED6E49C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:54:59 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id cq11so437898edb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 01:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OQ0bGSmF61lVuHRAxEBkn5f3XkSZTklGu+hYT4WzN9s=;
 b=RwnMxIQSK6ZsOWq1KAjkS7BHUuz+BlMaDqeW8B5MMkVrKW/wIBwhVwp3FldICE1lS9
 /qZLYQIaPVnBl9fgu0re3UK+HLDxFwhDkuccpfbjMkXUbAYArzq39UGEgH/ev1UZphvo
 /6bxIctVS07Mr9rIW70cXPWxBWvrfewSuieys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OQ0bGSmF61lVuHRAxEBkn5f3XkSZTklGu+hYT4WzN9s=;
 b=X1n6q4ikl/N2q4OdBwlOCKeF7JBKYWcxdL/R1YcW9yR0tWuvErcp0eUWMhn8rcTgmq
 f7WOuu0OLXTt+BpIhvTTF3dFgBP5TepEZhd8Io3KQ95EK4wQbSC2FFzHLU4wRHrtCs4a
 TyNPxVx7AZgu/1m0LBVKUy9XilIBnkWr5Oq1XUKksJdt4rR0giUj69sAzxGWN660sVxL
 l8e4C5PR+GmUIxdmY4r7s43S/NtNDNDcCMN76E8/82GE7ZJXt5jtzVwN6Wz4afmOxVba
 ZKdmljsSBnZ24xXYX5ep6TVzxrCfHs7Eh9ibA+fbapDZ0ARNRJyOJ4OqnY6JjIe9za5N
 9Wjg==
X-Gm-Message-State: AOAM532Ba0kUB0Vkn9xa92SyDKKnNWCYTuU8K7Xkhfn+NzzdFfVwi0om
 iY8C/I4bxnzaV1XeNwGtggloYQ==
X-Google-Smtp-Source: ABdhPJxmlJuea7lgXjHTO7W8Z4bYxQNP7KHdDaSRhM+1gzLVNo5Dsq8k6i7y0zMQb16opAye1HHiOw==
X-Received: by 2002:a05:6402:46:: with SMTP id
 f6mr31137197edu.252.1618908897839; 
 Tue, 20 Apr 2021 01:54:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g11sm14951850edy.9.2021.04.20.01.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 01:54:57 -0700 (PDT)
Date: Tue, 20 Apr 2021 10:54:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH v2] drm/drm_bufs.c: In switch, add break in default case
Message-ID: <YH6W3/dex+AJT93t@phenom.ffwll.local>
References: <20210417161552.6571-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210417161552.6571-1-fmdefrancesco@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, outreachy-kernel@googlegroups.com,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 17, 2021 at 06:15:52PM +0200, Fabio M. De Francesco wrote:
> Added a "break" in the default case of a switch select statement.
> GCC complains, although this "break" is not strictly necessary 
> for the code to work as expected.

Luckily we already have a comment stating that this is all just to make
gcc happy.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Applied to drm-misc-next, thanks for the patch.
-Daniel

> ---
> 
> Changes from v1: Added the reason why of this change in the log.
> 
>  drivers/gpu/drm/drm_bufs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
> index e3d77dfefb0a..fc40aa0adf73 100644
> --- a/drivers/gpu/drm/drm_bufs.c
> +++ b/drivers/gpu/drm/drm_bufs.c
> @@ -79,7 +79,7 @@ static struct drm_map_list *drm_find_matching_map(struct drm_device *dev,
>  				return entry;
>  			break;
>  		default: /* Make gcc happy */
> -			;
> +			break;
>  		}
>  		if (entry->map->offset == map->offset)
>  			return entry;
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
