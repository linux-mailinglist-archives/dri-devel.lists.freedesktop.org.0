Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A53BDF21
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 23:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85E46E5BF;
	Tue,  6 Jul 2021 21:49:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A05B6E5BF
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 21:49:00 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l5so630436wrv.7
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jul 2021 14:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OsCogNNhwhio6JYdPBw8QXS8xWHflA728fjLuzDRTYc=;
 b=D/dJq6ZBOJdh60YHB3H/OQ0Ubysii+ui+PiVQb4bXGVXMK7svprZgZtv8eB1+yNcSH
 n7mrI6Dmc1oqxyYzFi+eABvpHqvnkUDCvs15RFA62J9rCbCb1ppJjDgGhrowoayyy+xy
 A8gfmA5XTNdr7R6PE6WMdVVvadJB+SQj0cHZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OsCogNNhwhio6JYdPBw8QXS8xWHflA728fjLuzDRTYc=;
 b=s1yGSARl7CwWOSjsz8U9X7JL5kX2GFTjPa3aSH5DcjyBtKFhrL19etVgSjydBI7A+J
 Re3o3VAYoQkJ5/qS74L3Q7rP4RjH8leqbytxPhZYctZEMQ5iokpg7LXZujvmaoLm8XAp
 bojgR0ma32KeMrPU80a/zWehLW3gcNwFXALy7kJuBvc7uzY49eVPliHVY1QMBvLhLMoY
 vURezExWBQiQ0JeG42QVZBKMM+XbqtgS2hk85FrdVmM+pbQCz8Mg3l4Dh0U+hFmF3nrY
 DSrVCimA0D3iNxdPfGeiHAi2M54SAQ9IcS1GVam+4MPE6RLz4m7aDee28AHisofzmjyK
 ae6g==
X-Gm-Message-State: AOAM533L+7Y3/0EakEA71owa5Pk4FpCUdkTht8aPLkCUtXZlzoRxDSm3
 Oeq4HEfJ8TdjBwQLgJ1YZ+wOKw==
X-Google-Smtp-Source: ABdhPJwov6/2lXCO0iYiktITu+/Av5dNsT3c7SfReqalZm0I1JNQHJR2F9UU3VxAbNcjHRnQP2jijw==
X-Received: by 2002:a5d:528d:: with SMTP id c13mr24226057wrv.343.1625608139317; 
 Tue, 06 Jul 2021 14:48:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x17sm2548898wru.6.2021.07.06.14.48.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 14:48:58 -0700 (PDT)
Date: Tue, 6 Jul 2021 23:48:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
Subject: Re: [PATCH] drm/vkms: replace macro in vkms_release()
Message-ID: <YOTPyGPY/WwteE9x@phenom.ffwll.local>
References: <20210706154510.224695-1-martinsdecarvalhobeatriz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706154510.224695-1-martinsdecarvalhobeatriz@gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: melissa.srw@gmail.com, bcarvalho.ic@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 06, 2021 at 04:45:10PM +0100, Beatriz Martins de Carvalho wrote:
> Replace macro in vkms_release()
> 
> Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>

Applied to drm-misc-next, thanks for the patch.
-Daniel

> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 496de38ad983..e806958027c2 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -52,7 +52,7 @@ DEFINE_DRM_GEM_FOPS(vkms_driver_fops);
>  
>  static void vkms_release(struct drm_device *dev)
>  {
> -	struct vkms_device *vkms = container_of(dev, struct vkms_device, drm);
> +	struct vkms_device *vkms = drm_device_to_vkms_device(dev);
>  
>  	destroy_workqueue(vkms->output.composer_workq);
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
