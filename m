Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005FA1A2FD9
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA0F6EB55;
	Thu,  9 Apr 2020 07:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F9A6EB55
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 07:17:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g3so10703343wrx.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Apr 2020 00:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=XEywRyOXwpoRuTWlJ5j+LMEado440dnVx99CELnLolo=;
 b=J3TnySVG7X0SRfOQujg6yOG3DavP+JDN0lkGk+UlvIFcT6iYa5Q8C65gCTkCAtE2Mo
 kGmMZx6JLxF4erEc4I6K7rg8br6hzlz0f38KYmgt7Sh0IBzxOCuZ9JUe4h1rgeUm2VwD
 exythHc/jTstzJ2Fb1HjOoqzOI1cfvOyGgXMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=XEywRyOXwpoRuTWlJ5j+LMEado440dnVx99CELnLolo=;
 b=NDocP2j8kayeohkNrcQaE1piEnvCa70DKrojd0dGO+Nio2uj7I1EHFmp/sVCE5OZpn
 H6dwUXXkWVGnK2SiBCqVKShMgTZo/w9ELMwaeOclVsK/Q0QZ8WcOgchTSoWZfE9b7ApF
 V0j6ghIUEOtJDfvUxXpogjqT/CksEdDl/yXY/rRzx4pXfxGX3qY3dbExPS0AYwFJ1yio
 vuPFlqN55Gw4aTP2mBw/NGyJYYSMlJ9rpfoIIbV6ulKN9hj5kL6A81CrG1ao/fdyKQrG
 YnwdJhXPbqWPqpS3z/Qe97HDdd/WfmNsSQrUdR7CZ4MvcQ/bdt2DE/46OnaxPZCZ98p5
 Q/8w==
X-Gm-Message-State: AGi0PuYPRCTPLGII9deP7iLteX95HA0OXvnaWs9c5p6s4iBAQLCj2vGW
 95rIG8eaHG47a90zNvJVHXYvlQ==
X-Google-Smtp-Source: APiQypKS89n1ukOHevM/fA/En9CkkMkPx2aqkN1GaCwQI3yncisvGnWmhFn0YJmrjhmGia2Bk2TIOQ==
X-Received: by 2002:a5d:4081:: with SMTP id o1mr13176684wrp.114.1586416672112; 
 Thu, 09 Apr 2020 00:17:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v7sm2294539wmg.3.2020.04.09.00.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 00:17:51 -0700 (PDT)
Date: Thu, 9 Apr 2020 09:17:49 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] drm: kirin: Revert change to add register connect helper
 functions
Message-ID: <20200409071749.GQ3456981@phenom.ffwll.local>
Mail-Followup-To: John Stultz <john.stultz@linaro.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Xu YiPing <xuyiping@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20200409004306.18541-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200409004306.18541-1-john.stultz@linaro.org>
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 09, 2020 at 12:43:06AM +0000, John Stultz wrote:
> Daniel noted[1] that commit d606dc9a6323 ("drm: kirin: Add
> register connect helper functions in drm init") was unnecessary
> and incorrect, as drm_dev_register does register connectors for
> us.
> 
> Thus, this patch reverts the change as suggested by Daniel.
> 
> [1]: https://lore.kernel.org/lkml/CAKMK7uHr5U-pPsxdQ4MpfK5v8iLjphDFug_3VTiUAf06nhS=yQ@mail.gmail.com/
> 
> Cc: Xu YiPing <xuyiping@hisilicon.com>
> Cc: Rongrong Zou <zourongrong@gmail.com>
> Cc: Xinliang Liu <xinliang.liu@linaro.org>
> Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
> Cc: Chen Feng <puck.chen@hisilicon.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel <dri-devel@lists.freedesktop.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks for the quick fix!

Cheers, Daniel

> ---
>  .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  1 -
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   | 43 -------------------
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.h   |  1 -
>  3 files changed, 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> index 86000127d4ee..c339e632522a 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
> @@ -940,7 +940,6 @@ static struct drm_driver ade_driver = {
>  };
>  
>  struct kirin_drm_data ade_driver_data = {
> -	.register_connects = false,
>  	.num_planes = ADE_CH_NUM,
>  	.prim_plane = ADE_CH1,
>  	.channel_formats = channel_formats,
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> index d3145ae877d7..4349da3e2379 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
> @@ -219,40 +219,6 @@ static int kirin_drm_kms_cleanup(struct drm_device *dev)
>  	return 0;
>  }
>  
> -static int kirin_drm_connectors_register(struct drm_device *dev)
> -{
> -	struct drm_connector *connector;
> -	struct drm_connector *failed_connector;
> -	struct drm_connector_list_iter conn_iter;
> -	int ret;
> -
> -	mutex_lock(&dev->mode_config.mutex);
> -	drm_connector_list_iter_begin(dev, &conn_iter);
> -	drm_for_each_connector_iter(connector, &conn_iter) {
> -		ret = drm_connector_register(connector);
> -		if (ret) {
> -			failed_connector = connector;
> -			goto err;
> -		}
> -	}
> -	drm_connector_list_iter_end(&conn_iter);
> -	mutex_unlock(&dev->mode_config.mutex);
> -
> -	return 0;
> -
> -err:
> -	drm_connector_list_iter_begin(dev, &conn_iter);
> -	drm_for_each_connector_iter(connector, &conn_iter) {
> -		if (failed_connector == connector)
> -			break;
> -		drm_connector_unregister(connector);
> -	}
> -	drm_connector_list_iter_end(&conn_iter);
> -	mutex_unlock(&dev->mode_config.mutex);
> -
> -	return ret;
> -}
> -
>  static int kirin_drm_bind(struct device *dev)
>  {
>  	struct kirin_drm_data *driver_data;
> @@ -279,17 +245,8 @@ static int kirin_drm_bind(struct device *dev)
>  
>  	drm_fbdev_generic_setup(drm_dev, 32);
>  
> -	/* connectors should be registered after drm device register */
> -	if (driver_data->register_connects) {
> -		ret = kirin_drm_connectors_register(drm_dev);
> -		if (ret)
> -			goto err_drm_dev_unregister;
> -	}
> -
>  	return 0;
>  
> -err_drm_dev_unregister:
> -	drm_dev_unregister(drm_dev);
>  err_kms_cleanup:
>  	kirin_drm_kms_cleanup(drm_dev);
>  err_drm_dev_put:
> diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> index 4d5c05a24065..dee8ec2f7f2e 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> +++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.h
> @@ -37,7 +37,6 @@ struct kirin_drm_data {
>  	u32 channel_formats_cnt;
>  	int config_max_width;
>  	int config_max_height;
> -	bool register_connects;
>  	u32 num_planes;
>  	u32 prim_plane;
>  
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
