Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 448B13FFD27
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 11:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288446E862;
	Fri,  3 Sep 2021 09:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58B96E862
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 09:31:34 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id a25so10813283ejv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=+2zVhYW2JhNFC6ivmbY+NMg91kMXNKRAFmGUAVihMLE=;
 b=egJYq0hTL6e9zJ4V7sjc1cKL1hklggrK8sGHWrY5YYrrs9k9qB1aZGHCaGN2QE1qRE
 pfXwPcTs5GPZATJtSx/1BOg8pyR+/tDUrGKuA72LMtQD+EHdPlT3fUlCw9LHoMxWXQmV
 /+A6/pEfvoidDXhA5wbd6OTrVot0ls7umSqbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=+2zVhYW2JhNFC6ivmbY+NMg91kMXNKRAFmGUAVihMLE=;
 b=mQh7GJ/5U0WJAA3RZ5me1CAD6qWlMW2dNC/BcSDURRmtUzKyl8+Bti/roc2K/V0Y7+
 AKx6xrV1j9GLmOS5Xa3jYL23NRkpP7ivHILy71yNaEdLzemLJE7szzXpLJNJPEBnUsRI
 ommQYzeNijQpecfdha93rsn4C/AztC6ow63dsUt79Uw6vsPK/lk7QOy04Tw3YoGHiweG
 15+UtjmGhntjyfobRO1y3dmkWXHjI+zlhz50luGXKDhL3K97wdMsrNGa3XJMh5Aopbuz
 xJlkX3qsbkDufAVfbjR/5whw3mjU9ig3y9iYizRqNItHTFShYLI72ovI6L6k/ZOv7iMQ
 WCKQ==
X-Gm-Message-State: AOAM531qolIugRZU8Xeo/d3siZx+Xm4q7oe2SVvEsj6M3UWNT2fJJkB3
 Ra72oi175MkGbZL4ZvJ0Gliqiw==
X-Google-Smtp-Source: ABdhPJzFpo09Q80gAB68CXx6sks4KJyMaFKDKHqvNnWOaO9PAqGjgbMtfoIU6oM1fGsBi54AIg/AjA==
X-Received: by 2002:a17:906:354a:: with SMTP id
 s10mr3182477eja.357.1630661493357; 
 Fri, 03 Sep 2021 02:31:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p8sm2415031ejo.2.2021.09.03.02.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:31:32 -0700 (PDT)
Date: Fri, 3 Sep 2021 11:31:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>
Cc: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 botton_zhang@163.com
Subject: Re: [PATCH v4] drm: Improve the output_poll_changed description
Message-ID: <YTHrcvAXxoVgV0/9@phenom.ffwll.local>
Mail-Followup-To: "ZhiJie.Zhang" <zhangzhijie@loongson.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 botton_zhang@163.com
References: <20210903032402.11935-1-zhangzhijie@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903032402.11935-1-zhangzhijie@loongson.cn>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 03, 2021 at 11:24:02AM +0800, ZhiJie.Zhang wrote:
> From: zhangzhijie <zhangzhijie@loongson.cn>
> 
> this callback was used by drm_kms_helper_hotplug_event()
> 
> V2: (Thanks for Daniel's suggestions)
> - remove the FIXME below.since with the drm_client
> - infrastructure and the generic fbdev emulation we've
> - resolved this all very neatly now.
> 
> V3: Add comments that This hook is deprecated
> - new implementation methods instead of this hook
> 
> v4: used by drm_kms_helper_hotplug_event()
> - drm_fb_helper_hotplug_changed() is not found
> instead by drm_kms_helper_hotplug_event()
> 
> Signed-off-by: ZhiJie.Zhang <zhangzhijie@loongson.cn>

Applied to drm-misc-next, thanks for the patch.
-Daniel

> ---
>  include/drm/drm_mode_config.h | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
> index 1ddf7783fdf7..48b7de80daf5 100644
> --- a/include/drm/drm_mode_config.h
> +++ b/include/drm/drm_mode_config.h
> @@ -103,14 +103,13 @@ struct drm_mode_config_funcs {
>  	 * Callback used by helpers to inform the driver of output configuration
>  	 * changes.
>  	 *
> -	 * Drivers implementing fbdev emulation with the helpers can call
> -	 * drm_fb_helper_hotplug_changed from this hook to inform the fbdev
> -	 * helper of output changes.
> +	 * Drivers implementing fbdev emulation use drm_kms_helper_hotplug_event()
> +	 * to call this hook to inform the fbdev helper of output changes.
>  	 *
> -	 * FIXME:
> -	 *
> -	 * Except that there's no vtable for device-level helper callbacks
> -	 * there's no reason this is a core function.
> +	 * This hook is deprecated, drivers should instead use
> +	 * drm_fbdev_generic_setup() which takes care of any necessary
> +	 * hotplug event forwarding already without further involvement by
> +	 * the driver.
>  	 */
>  	void (*output_poll_changed)(struct drm_device *dev);
>  
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
