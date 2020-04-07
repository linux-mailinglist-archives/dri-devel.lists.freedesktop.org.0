Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE12F1A08DD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232B36E588;
	Tue,  7 Apr 2020 08:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A53F6E588
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Apr 2020 08:04:30 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k1so2770494wrm.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Apr 2020 01:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9nnb+7lsqpjzr8qObcMWSISeFkOVqJo1c+VAVSYtKFw=;
 b=NSLxbQXW8IBb9HITX9hpesf/LAAwD0ajZ5aqdelS1qg+gcuOCaHAFuK8CS+CZechuG
 XTuJ40Ii8pqlmvr4QvyBqHEJEcV+5aczgxKPG6ilstE8PeE5bDNz5vT1ZuJnNh5QEVe0
 HvMm5POACoobT+MQLu/rfmo7dFBjf9SjIGlzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9nnb+7lsqpjzr8qObcMWSISeFkOVqJo1c+VAVSYtKFw=;
 b=l+8JtmRyknqgz+ObU3us9Bt1I4NXEe2Gg4M+RGbYUGaoVtxgatvzu9TWlYVXDlO32S
 Ba77XAc5XgaDWPQ8VP66b6sD4+gZ0QqY8yDGG2xg30WEQSVlsDXM1a7XIxHlVQuZ/N5A
 M2k/7GZSurv6ybgvTpz/dNiWzFFfX6oLeTnJQ7VlSLoVveVFjKWoO13SpbZbSz5XEvTv
 /FJ5YCekJbQ7hXEIHuswPOm1cmiTuKpOb4G1725aZdSFRaDeDfOKJjfPXKICAQXYjYUF
 PPS70C/dzdHvM54nYOePq80Xo6nroUiU3llMP+krdi5qkQLh6NrDQn3Xcxdt/XWWSAOi
 OtcA==
X-Gm-Message-State: AGi0PuaeKCWvXDUsKjr9Uln2Jnu4tesdojoahjlYajmLUO6G0jTXSZjN
 u3S5hUg0mXuZetD6MYHwlhRVVg==
X-Google-Smtp-Source: APiQypKmrAQFVviF7A53ZzFOcwvVaAt5Pn4F6rrZU5SoFcVdV2qXqHHGq/aicD1utxRHKhOPoMVYgQ==
X-Received: by 2002:a5d:6a43:: with SMTP id t3mr1284041wrw.87.1586246668926;
 Tue, 07 Apr 2020 01:04:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n11sm32734642wrg.72.2020.04.07.01.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 01:04:28 -0700 (PDT)
Date: Tue, 7 Apr 2020 10:04:26 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 03/10] drm/kirin: Set up fbdev after fully registering
 device
Message-ID: <20200407080426.GG3456981@phenom.ffwll.local>
References: <20200406134405.6232-1-tzimmermann@suse.de>
 <20200406134405.6232-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200406134405.6232-4-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 kraxel@redhat.com, sam@ravnborg.org, emil.velikov@collabora.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com,
 chunkuang.hu@kernel.org, puck.chen@hisilicon.com, hdegoede@redhat.com,
 jsarha@ti.com, matthias.bgg@gmail.com, sean@poorly.run, zourongrong@gmail.com,
 tiantao6@hisilicon.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 06, 2020 at 03:43:58PM +0200, Thomas Zimmermann wrote:
> Generic fbdev support is a DRM client. Set it up after fully registering
> the new DRM device.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index d3145ae877d74..981858cc8d2b5 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -277,8 +277,6 @@ static int kirin_drm_bind(struct device *dev)
>  	if (ret)
>  		goto err_kms_cleanup;
>  
> -	drm_fbdev_generic_setup(drm_dev, 32);
> -
>  	/* connectors should be registered after drm device register */
>  	if (driver_data->register_connects) {
>  		ret = kirin_drm_connectors_register(drm_dev);
> @@ -286,6 +284,8 @@ static int kirin_drm_bind(struct device *dev)
>  			goto err_drm_dev_unregister;
>  	}
>  
> +	drm_fbdev_generic_setup(drm_dev, 32);

The code you jump over is nonsense and should be reverted. I replied to
the patch that landed this.
-Daniel

> +
>  	return 0;
>  
>  err_drm_dev_unregister:
> -- 
> 2.26.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
