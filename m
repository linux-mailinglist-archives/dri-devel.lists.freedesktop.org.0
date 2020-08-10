Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69389240677
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 15:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DCD6E418;
	Mon, 10 Aug 2020 13:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2D46E418
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 13:12:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a5so8140813wrm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 06:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=iGTAL/+sIj6emRK3fqEhesmWaas0p8AJ5UO8Qp8MS1M=;
 b=kiybH+qBWuADveErVU6XG2NhmnEtx+jjpz4e5l4kPqdP+eOVGDVXTTuj7GzN8/usfb
 aqSyH2C6eba/f1bIp2y4Qwz89xvumnwQDUFTZn+O1+dhurhVQUQrPcper+mKqlPWKIJS
 /pjIiSSf4Jsk1WTPpS5yRa5EkgDThqB3kPG0g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=iGTAL/+sIj6emRK3fqEhesmWaas0p8AJ5UO8Qp8MS1M=;
 b=AaruDUUTi2ygXifC0C8uP/mwqAbgiurikpBVnBL9oW54xh9XLPFaW8Q1A2ikT/DMWU
 lGDqeukWYbI4Gd+RR4mG6w7ukfA2EWlvdNMJ6nY2cC6chJdCTHAytcfKe1jGWd0tiiTN
 cCFIvIYCSFBQPRRtegLstZLxdAjCMKvwwC3BTH6mksoyulWoCH8Hq21FBjHoWAHgzzo3
 MjGxVcqRrE3tz2rdcHs8XtiroxPkQZBZ59boXcixUwMwzjz0gqzRkBnykHCGdi9Z/qNE
 4qvPFl4ihT01alZLbW6iX69ihgKTN8NDWRU5ndbYzPEkX0wF6kaI+Nlki0ZVB7ybdKvW
 s2IQ==
X-Gm-Message-State: AOAM532/KVMzv0LRnr2nxt6mNrwCyTzSokB0KpHEWLU+LYnpCnZqdWwb
 5eLezKu44j0/nNyEdA/nsPQSdQ==
X-Google-Smtp-Source: ABdhPJzE2hOnuO6FJZJTN+hB/BfbT0RyysxtWTsn0jH+nB8VUjAb31vcXQl1nU79oHgj8G6691FpWQ==
X-Received: by 2002:a5d:5383:: with SMTP id d3mr1457089wrv.42.1597065150007;
 Mon, 10 Aug 2020 06:12:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t13sm20523157wru.65.2020.08.10.06.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 06:12:29 -0700 (PDT)
Date: Mon, 10 Aug 2020 15:12:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH] drm/vgem: add missing platform_device_unregister() in
 vgem_init()
Message-ID: <20200810131227.GU2352366@phenom.ffwll.local>
Mail-Followup-To: Qinglang Miao <miaoqinglang@huawei.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200810125942.186637-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810125942.186637-1-miaoqinglang@huawei.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 08:59:42PM +0800, Qinglang Miao wrote:
> When vgem_init() get into out_put, the unregister call of
> vgem_device->platform is missing. So add it before return.
> 
> Fixes: 363de9e7d4f6 "drm/vgem: Use drmm_add_final_kfree"
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>

Uh right I still have my series stuck which would have fixed this properly
... Thanks for your fix, both applied to drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/vgem/vgem_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
> index a775feda1..313339bbf 100644
> --- a/drivers/gpu/drm/vgem/vgem_drv.c
> +++ b/drivers/gpu/drm/vgem/vgem_drv.c
> @@ -471,8 +471,8 @@ static int __init vgem_init(void)
>  
>  out_put:
>  	drm_dev_put(&vgem_device->drm);
> +	platform_device_unregister(vgem_device->platform);
>  	return ret;
> -
>  out_unregister:
>  	platform_device_unregister(vgem_device->platform);
>  out_free:
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
