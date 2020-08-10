Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7526224067A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 15:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08086E41A;
	Mon, 10 Aug 2020 13:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302756E41A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 13:13:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l2so8123684wrc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 06:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=TrZwb620Hz71sfU/k5dAR4LB1pIwkE/ea0quH9JSpzM=;
 b=HM7oYo6K3fJxWIR8x+0drnpWjVhrBdO50qE+dWcIqR5/oC9uYZUuwR7iagR04m1TNV
 H0AuDtOlggvOXdo3XO4GHJnVJ5nBZcabZ8fffgHaZlbS0g6b1h9CFtOaX/hqFnTf6v3e
 7C/EZFdN6rMqZQ2LWIMze6Umg7aWjUUTDt6T0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=TrZwb620Hz71sfU/k5dAR4LB1pIwkE/ea0quH9JSpzM=;
 b=K6bdU9RBJJ1AyErBiBZkPdT8WNr54ewygs8gJ9aRONsG5/XIolG6auy86EVzpqfGV7
 n/VVXsJwPa1aewgKUsA03S5a4M3nFlyXN3wb6V+h1uv8aLheBJiUTh++E0ZQg+sxIyPo
 kf1W0dO6yebOfLa2hEMRR0GTYH6rK4j0QHh+yNt7mPOdEp3GPyba+cgIwX+EwHhHvGMC
 Go2w7cBIjmseIkL6e8SfyBz5fXSPwXK/qM23e/D6CHeB/NbSub5jIYinNRvGSzqj+GFf
 HDV/+mxDz0ehPZrl/gSP34OD8YTUdq9XYsiMJNYHfdySvdXvYdlDHtqrhDJbYhsQgVz8
 AsbA==
X-Gm-Message-State: AOAM530Ykj9F5XRcwL+dOpgDP9xrK8f/27V8nilvM14XgswUGrPf40Dt
 POP2/waL7woBcrWmDhx06GOX7Q==
X-Google-Smtp-Source: ABdhPJzqMtWNZOVPtAjaOpl8/MRH2p+hSFH2Gy7kOohMkzxgp3egVhv0ZI/g57f/cTHzvbKhayGR6Q==
X-Received: by 2002:adf:ed0f:: with SMTP id a15mr1474297wro.341.1597065198916; 
 Mon, 10 Aug 2020 06:13:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h13sm20752323wrx.17.2020.08.10.06.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 06:13:18 -0700 (PDT)
Date: Mon, 10 Aug 2020 15:13:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH] drm/v3d: convert to use module_platform_driver
Message-ID: <20200810131316.GV2352366@phenom.ffwll.local>
Mail-Followup-To: Qinglang Miao <miaoqinglang@huawei.com>,
 Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200810125931.186456-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810125931.186456-1-miaoqinglang@huawei.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 08:59:31PM +0800, Qinglang Miao wrote:
> Get rid of boilerplate code by using module_platform_driver macro
> for v3d_drm.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

lgtm, merged to drm-misc-next for 5.10
-Daniel

> ---
>  drivers/gpu/drm/v3d/v3d_drv.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
> index 82a7dfdd1..9f7c26193 100644
> --- a/drivers/gpu/drm/v3d/v3d_drv.c
> +++ b/drivers/gpu/drm/v3d/v3d_drv.c
> @@ -358,18 +358,7 @@ static struct platform_driver v3d_platform_driver = {
>  	},
>  };
>  
> -static int __init v3d_drm_register(void)
> -{
> -	return platform_driver_register(&v3d_platform_driver);
> -}
> -
> -static void __exit v3d_drm_unregister(void)
> -{
> -	platform_driver_unregister(&v3d_platform_driver);
> -}
> -
> -module_init(v3d_drm_register);
> -module_exit(v3d_drm_unregister);
> +module_platform_driver(v3d_platform_driver);
>  
>  MODULE_ALIAS("platform:v3d-drm");
>  MODULE_DESCRIPTION("Broadcom V3D DRM Driver");
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
