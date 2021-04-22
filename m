Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C452368203
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 15:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88AE36E25B;
	Thu, 22 Apr 2021 13:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F286EAA0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 13:58:12 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id dp18so17386085qvb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 06:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pDNnkJPb2aQUATNCDosNiyczROSb5OwKI26xW7uSy28=;
 b=R4gYl8V9m76fiz5yMnlKUIbRJene//D0v8wbWVpqrHO13nHZEo37aC7E7PIRJDsGeq
 sfEgLFCT2klfSqwCXqz/IIT5X254leclwQZtLDrL5ONQafBUy+aPNsgEqJaO2mHBQd+o
 J6RM68h3qBw9hnHl99j17M1JzZwY8v7XBzy2Vqmjkfj5ZpIo5PXCfF2+jRZvl1eK0U0T
 dAGIPAH1bZDSJM82Et7l7ckY/uUPPqg4j3zspAHhT4ef2sCzxSwX6Eqvy8o0Slrchqoe
 lRX0E3VLVB0FKsqQ1xfL9ZlggAqn1sJTeHZ9Dee+xWmyAbNz1Tg07GG2m2Scla4qFYtg
 2JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pDNnkJPb2aQUATNCDosNiyczROSb5OwKI26xW7uSy28=;
 b=bGGoU6G1gZkuTUnRxxTi4AkBi1Y/NnTmStlOJDDBZZmssx2L4YYauJn5yOVGgNokm/
 tTzPkPuFdhWENnXPrA0bZIbPNdSfT0depw81D6CxFhDrRR88NFiqoJpwxQn+YEYY9IBg
 SBL5YH0+2mjO+JyAfEy1kj/nX42/I/k+ImHyMAUHSmw2khZqW9BUMEKMiD+dry+cfK8G
 2nXEIG5TkOkpGvRcI0Ur3UJHTrkw746L9C2dFZoi+1kuAxgNPLLCgOr3VgBC7v61e1N7
 mWgr4t+cFZkrEJqgPmk8cD4k1z6R7P0Ot+oHpZoyzklDVw9eGwppnIercHxzxRiR7ri9
 8bTw==
X-Gm-Message-State: AOAM533Eu93MyPrrPO5uEgVtsfzCQ4HxxxNEEwZWZDAUOjNMEVxf9Xez
 Vc0JYOCDaKa4PZvUkUTGXAJL0Q==
X-Google-Smtp-Source: ABdhPJyZJdGFuL+vpCjOqy7YRTYsaeQhy9BH3TnGMSu3vmr9Ghy8k0VdVdtgLaCfy2MyMPaAm45r2w==
X-Received: by 2002:a05:6214:2a9:: with SMTP id
 m9mr3807764qvv.39.1619099891662; 
 Thu, 22 Apr 2021 06:58:11 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-47-55-113-94.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.113.94])
 by smtp.gmail.com with ESMTPSA id r25sm2278007qtm.18.2021.04.22.06.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 06:58:11 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1lZZqM-00A2d6-Nq; Thu, 22 Apr 2021 10:58:10 -0300
Date: Thu, 22 Apr 2021 10:58:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] vfio/gvt: fix DRM_I915_GVT dependency on VFIO_MDEV
Message-ID: <20210422135810.GG2047089@ziepe.ca>
References: <20210422133547.1861063-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422133547.1861063-1-arnd@kernel.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 03:35:33PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Kconfig dependency is incomplete since DRM_I915_GVT is a 'bool'
> symbol that depends on the 'tristate' VFIO_MDEV. This allows a
> configuration with VFIO_MDEV=m, DRM_I915_GVT=y and DRM_I915=y that
> causes a link failure:
> 
> x86_64-linux-ld: drivers/gpu/drm/i915/gvt/gvt.o: in function `available_instances_show':
> gvt.c:(.text+0x67a): undefined reference to `mtype_get_parent_dev'
> x86_64-linux-ld: gvt.c:(.text+0x6a5): undefined reference to `mtype_get_type_group_id'
> x86_64-linux-ld: drivers/gpu/drm/i915/gvt/gvt.o: in function `description_show':
> gvt.c:(.text+0x76e): undefined reference to `mtype_get_parent_dev'
> x86_64-linux-ld: gvt.c:(.text+0x799): undefined reference to `mtype_get_type_group_id'
> 
> Clarify the dependency by specifically disallowing the broken
> configuration. If VFIO_MDEV is built-in, it will work, but if
> VFIO_MDEV=m, the i915 driver cannot be built-in here.
> 
> Fixes: 07e543f4f9d1 ("vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV")
> Fixes: 9169cff168ff ("vfio/mdev: Correct the function signatures for the mdev_type_attributes")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/i915/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Oh kconfig stuff like this makes my head hurt, thanks for finding it

I also can't see an alternative to this ugly thing, besides having the
i915 guys properly modularize this code someday

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
