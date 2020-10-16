Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0EF290296
	for <lists+dri-devel@lfdr.de>; Fri, 16 Oct 2020 12:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63556E9C0;
	Fri, 16 Oct 2020 10:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902C06E9C0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 10:11:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s9so2070780wro.8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Oct 2020 03:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OqgK8GE8u8GgE7hCKgynT+rKrVW8dlpriZEb87vuAJM=;
 b=DRC+1IKG80ExkDHK/pP2DhvMdszkHIcaOw2nDv7BEjmpsGyM1MSi9YCX8ZdmimwXqu
 wjL6XOCkfKO9IBk8fGPrC7C54RQuokjuflCJgymxYlwgUtB2LwFZeM5ElArFOLJEUdh6
 Y8shi5MXlDcy4d9Zz41VDBJcoJTzL9Coy2rrIFlxAplsZ9WGxfuHn7hGwgVElWBS+MjG
 /t1o0CwOSVTA6/hCtgFEigRHggU6IH4n70MTnI6GEWLbsTSLk6/w8QxZNgGao2t9hXYC
 +dNU8x3bKPbHkUhqvUR8SnOOzWuOcj5yaYETOjluCyLA7raePXWBu8IZLiNjrZdNALeG
 YaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OqgK8GE8u8GgE7hCKgynT+rKrVW8dlpriZEb87vuAJM=;
 b=GLcljnHwyk6Z4XaybVn0/2TidKuSanulJDgIwHc3lAQUWAgsE8CfCTGTK+yweifslg
 F4ykM2fjTBCzig6WI8SOzW6gpP33nRY2CyQrrKpjQ1RbzpH9uo6vSd+jPrRkDWJdVdvg
 MXTSiVWXAfu5lS+nTTfwZN6EOtCjaGs2WZAs21gKkKGmbLByjz5g2BEYGoqn0VjrhCEE
 P9CLHQ07XZHHe+4xyP2MRo6GK2Rxk/t7NDG4A+tOi0s6AA5ivKMPP0lSn0262X4zE4Bl
 PwEMjN1c9rjHn7g2twJDyYjHCxKw9Mqw45JSAyQ+/A0D4fIv3fQdHctdV+QI92Krvagl
 370g==
X-Gm-Message-State: AOAM5338QiHW0v7kZNmId1FQpWsRdo6BKmW/gwLcUQH3xpY1Kh4dBavE
 Pwsnr0mjNeuXnK4ryi3e/wZP0jIqO6E=
X-Google-Smtp-Source: ABdhPJzWx4nuYV2O1JANxMaqzOIf1HDkolPDy4Dn4737wbGU4k//EBz2c6wC4ZZMy9b2y7bTuckSxg==
X-Received: by 2002:a5d:6592:: with SMTP id q18mr3015599wru.293.1602843063248; 
 Fri, 16 Oct 2020 03:11:03 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id k18sm2787625wrx.96.2020.10.16.03.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 03:11:02 -0700 (PDT)
Date: Fri, 16 Oct 2020 07:10:56 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/vkms: fbdev emulation support
Message-ID: <20201016101056.gqp4ezu7pyeqa6el@smtp.gmail.com>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <20201009232156.3916879-3-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009232156.3916879-3-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thanks for this improvement.

I could see that it increased the IGT test coverage, including now the
fbdev test cases. 

On 10/10, Daniel Vetter wrote:
> Hooray for generic fbdev support, making this a oneliner. We just
> needed to fix preferred_depth fixed and the vmap support added first.

I consider that including in the msg that, with this patch, both fbdev
test cases [info and mmap] are passing would be interesting for future
debugs.

> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 6221e5040264..cc09e2df5cb1 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -169,6 +169,8 @@ static int __init vkms_init(void)
>  	if (ret)
>  		goto out_devres;
>  
> +	drm_fbdev_generic_setup(&vkms_device->drm, 0);
> +
>  	return 0;
>  
>  out_devres:
> -- 
> 2.28.0
>

Looks good to me,

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
