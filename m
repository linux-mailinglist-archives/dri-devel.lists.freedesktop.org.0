Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DAD189D27
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 14:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007206E20B;
	Wed, 18 Mar 2020 13:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F776E20B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 13:38:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 25so3429210wmk.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 06:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=6R5xf9NqTS0jMDexNFwg03hIQwJWepjqVTqQml3+25g=;
 b=PmLTKI+jZxj3t3dDPkHpXoEBiwtAI3ewtlXoBbpkAp+ImmLqcN8JC5QH7GPvRKLcPQ
 +xOBx6iL47cZLqOw1xytvO34OdPn8T8YR3OiTiEnuRpQta9BzxuhKNSukZ9T/BIrdA1N
 SYdLIlQuiwpi5pfQT+xJTLa+Zh7KNkvRsSHcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=6R5xf9NqTS0jMDexNFwg03hIQwJWepjqVTqQml3+25g=;
 b=HN2jVZF6Po3KsxAAyEzHhwHy1vFW1BwT+gc1MYq0jrh6qWsC+L50+Re5pqPTW6gRYk
 5RtfbboWu0iqZv6MLugbfINWBHG0tohE7audcW9IlddJmU2PG0HjkhASx00d0EWgogCB
 lm8kwnFrN7nGWwPPmZISV7dvHWirEW0SeVOIoGjICLC1UNEtD5BsPWKiTbaN0YWq76XJ
 YUjYJWjSJgjKBFgxIQCS/4AbHnsxaQaBue7dNi1vgE04Pi6XasPID6D+d+RS0Ztw4Hpe
 O+bsLWCBqmt+bWoUP39oKcJ6/+XENOwMMqF4SEYKFyI27oYpwENSPTCD5A3RLK4gznIW
 MxKQ==
X-Gm-Message-State: ANhLgQ1my7DlcqvDfgDgIX+O+x0wFSBaetJJZvtOlKbw8ENxhfhGxBqP
 cDhWQMpPTCWqzkq8d9GKSZjnAA==
X-Google-Smtp-Source: ADFU+vuUYj/OYML10zdOHlJ4Njc9aninKsXTvMVWhceXQ6IvYDvu1robtZJWgU11PbUN4ofmJi563Q==
X-Received: by 2002:a05:600c:2319:: with SMTP id
 25mr5364849wmo.106.1584538735341; 
 Wed, 18 Mar 2020 06:38:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j11sm2065580wrt.14.2020.03.18.06.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 06:38:54 -0700 (PDT)
Date: Wed, 18 Mar 2020 14:38:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Qiujun Huang <hqjagain@gmail.com>
Subject: Re: [PATCH v2] drm/lease: fix WARNING in idr_destroy
Message-ID: <20200318133852.GU2363188@phenom.ffwll.local>
Mail-Followup-To: Qiujun Huang <hqjagain@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, anenbupt@gmail.com
References: <1584518030-4173-1-git-send-email-hqjagain@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584518030-4173-1-git-send-email-hqjagain@gmail.com>
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
Cc: anenbupt@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 03:53:50PM +0800, Qiujun Huang wrote:
> drm_lease_create takes ownership of leases. And leases will be released
> by drm_master_put.
> 
> drm_master_put
>     ->drm_master_destroy
>             ->idr_destroy
> 
> So we needn't call idr_destroy again.
> 
> Reported-and-tested-by: syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com
> Signed-off-by: Qiujun Huang <hqjagain@gmail.com>

Thanks for the respin, and I've also seen the syzbot confirmation, so all
great.

Merged to -fixes with a cc: stable.
-Daniel

> ---
>  drivers/gpu/drm/drm_lease.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index b481caf..825abe3 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -542,10 +542,12 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  	}
>  
>  	DRM_DEBUG_LEASE("Creating lease\n");
> +	/* lessee will take the ownership of leases */
>  	lessee = drm_lease_create(lessor, &leases);
>  
>  	if (IS_ERR(lessee)) {
>  		ret = PTR_ERR(lessee);
> +		idr_destroy(&leases);
>  		goto out_leases;
>  	}
>  
> @@ -580,7 +582,6 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  
>  out_leases:
>  	put_unused_fd(fd);
> -	idr_destroy(&leases);
>  
>  	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
>  	return ret;
> -- 
> 1.8.3.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
