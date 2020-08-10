Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AB524069B
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 15:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E14A6E40D;
	Mon, 10 Aug 2020 13:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64DBE6E40D
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 13:32:42 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f1so8192173wro.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=a+nmwnQku2NPETSpBDN/P5VVyyO+hZH4dE82TSAC310=;
 b=XgunidY4u2HlfrT7vWG1augSLzJLtFtt3MwWEaGZU0TEkWgCm8vp13Wp9OEkdH8cif
 Myvc84JtAWcLoxHkNL54GxRSxWXMuRjjH6BJf4aKPj78zZmGJ3l/dUaVNmHN81D5faLR
 NB3OTBiN1rgf+K3sqXS7g2el9wItvmalo6Wlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=a+nmwnQku2NPETSpBDN/P5VVyyO+hZH4dE82TSAC310=;
 b=dYrJtEYLenIwzMADnjJFjsdhNmmYuKYgCB/SxGq8p8Y4gAia/sNE9xbtp7Ax87xPss
 hdAywdEEMYMO4Jm9Cbw/zigjxhD3NzQ2JyT36oRgtwnSPS2/Qr6kzMSLnk+d/0U/o/EZ
 pBQvNLprukkoyJ868X9jmaK9nMIdzwnGm3X1FuwESmgBtbPlane7Nw+8ydnoZrc1am2x
 U/u1fXDwqPEhjKosI7BpMmLzCasUt9IsNY+Sf509sMwSbyzuu78gHyKihnvcfz+9jjfC
 6DHKbDvbJ1o++5ab+ngKhWUeZngjeM9+mfSGBk64hV9Hqzc/miv6ixxbqEUEe7VJP64i
 9DCw==
X-Gm-Message-State: AOAM532DCW6CgeWynZYDASUaN1sy+odGy73dGXJhaX+KynPS2T44xUSx
 xmNMsLP5FoCwzuc1Jvmrs/aRQA==
X-Google-Smtp-Source: ABdhPJwTLj+RebIoQLWCXGNcoMBm0EOS1JlGZLvmXwPU1hi7d1FhGfALDOJkrCtq5nQijkDH6PGBsQ==
X-Received: by 2002:adf:a351:: with SMTP id d17mr24489798wrb.111.1597066361100; 
 Mon, 10 Aug 2020 06:32:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k10sm20501231wrm.74.2020.08.10.06.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 06:32:40 -0700 (PDT)
Date: Mon, 10 Aug 2020 15:32:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH] drm/vkms: add missing platform_device_unregister() in
 vkms_init()
Message-ID: <20200810133238.GW2352366@phenom.ffwll.local>
Mail-Followup-To: Qinglang Miao <miaoqinglang@huawei.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200810130011.187691-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810130011.187691-1-miaoqinglang@huawei.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 09:00:11PM +0800, Qinglang Miao wrote:
> When vkms_init() get into out_put, the unregister call of
> vkms_device->platform is missing. So add it before return.
> 
> Fixes: c27f0cc4d43a "drm/vkms: enable cursor by default"

This is the wrong commit, I fixed that up while applying.
-Daniel

> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 57a8a397d..83dd5567d 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -190,8 +190,8 @@ static int __init vkms_init(void)
>  
>  out_put:
>  	drm_dev_put(&vkms_device->drm);
> +	platform_device_unregister(vkms_device->platform);
>  	return ret;
> -
>  out_unregister:
>  	platform_device_unregister(vkms_device->platform);
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
