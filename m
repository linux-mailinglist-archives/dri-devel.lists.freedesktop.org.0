Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 862231BCAB4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 20:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707716E9DF;
	Tue, 28 Apr 2020 18:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2990A6E895
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 18:52:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e26so4010596wmk.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 11:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1fk1P+rnDe0umjeDIvp+vfpU9E3PVpmXBSETDQT9r8o=;
 b=Mbt0ltVAd+1nkTOL8h26e7uBY6VF6ArVCculxTkvpFnX1U4uEm+HYlzCOYyITYsiWx
 y7L0toiucza0Ht4FuD1NwixLenmGCpavI/EB7q3ZItHy/micvYyWP+/EJcebbdbNkLnX
 Ki+ITuma4rMuxtqnwmoeF6aTeyCenJpE61BAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1fk1P+rnDe0umjeDIvp+vfpU9E3PVpmXBSETDQT9r8o=;
 b=ZPNMmfhu7RWS79el8bREINGL6QMVXLueDPEdmutApcngRqDHzFUJCS+R+fjDMkQ9+5
 K/nEBNlhVJnCOD7Q2KvzIFHT2eDIZj2FotZr3SBf2EQ7Jzss5itPnIoSHgxx61VXRdry
 t6WVLcbZcrIM+knJXuoMR3YfkdRH28/Vk5GeDmmyTteoiFfTEWj6LPzqgZNcLJKep9MO
 YzECsRELO08WPK+oBaDH2NZBqYWO0enKaicQy2/WXBAMQ8lPFB/1N6Zh9cP8+jfkm39G
 MI+3qXNwhhwmvwLsWdX1iNxmqEgXIEPrQ94njtgFAKkVXX3g8nubWssg/+KxdJE4OSjl
 l43Q==
X-Gm-Message-State: AGi0PuanqYQQN4pCuEQvoeYJV9zxNoviuRybE3YuoPq6T1XdB7Cy3VR0
 ihC4tYWHp/BWzvWfhlXITX2Z80Lw+gc=
X-Google-Smtp-Source: APiQypJ8DnecuOacY+hmzcazm2b23nwzZL/SMbD2Yz3EV/dnz6F+8jFEupuYznsiAQbC4uqi19QV9g==
X-Received: by 2002:a1c:ba09:: with SMTP id k9mr5941540wmf.176.1588099939861; 
 Tue, 28 Apr 2020 11:52:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e2sm26543954wrv.89.2020.04.28.11.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 11:52:18 -0700 (PDT)
Date: Tue, 28 Apr 2020 20:52:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 38/59] drm/i915: Use devm_drm_dev_alloc
Message-ID: <20200428185217.GA3456981@phenom.ffwll.local>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-39-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415074034.175360-39-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 09:40:13AM +0200, Daniel Vetter wrote:
> Luckily we're already well set up in the main driver, with
> drm_dev_put() being the last thing in both the unload error case and
> the pci remove function.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Pushed to drm-misc-next with Jani's irc-ack.
-Daniel

> ---
>  drivers/gpu/drm/i915/i915_drv.c | 17 ++++-------------
>  drivers/gpu/drm/i915/i915_pci.c |  2 --
>  2 files changed, 4 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
> index 641f5e03b661..ff9a5b1b4c6d 100644
> --- a/drivers/gpu/drm/i915/i915_drv.c
> +++ b/drivers/gpu/drm/i915/i915_drv.c
> @@ -877,19 +877,11 @@ i915_driver_create(struct pci_dev *pdev, const struct pci_device_id *ent)
>  		(struct intel_device_info *)ent->driver_data;
>  	struct intel_device_info *device_info;
>  	struct drm_i915_private *i915;
> -	int err;
>  
> -	i915 = kzalloc(sizeof(*i915), GFP_KERNEL);
> -	if (!i915)
> -		return ERR_PTR(-ENOMEM);
> -
> -	err = drm_dev_init(&i915->drm, &driver, &pdev->dev);
> -	if (err) {
> -		kfree(i915);
> -		return ERR_PTR(err);
> -	}
> -
> -	drmm_add_final_kfree(&i915->drm, i915);
> +	i915 = devm_drm_dev_alloc(&pdev->dev, &driver,
> +				  struct drm_i915_private, drm);
> +	if (IS_ERR(i915))
> +		return i915;
>  
>  	i915->drm.pdev = pdev;
>  	pci_set_drvdata(pdev, i915);
> @@ -1006,7 +998,6 @@ int i915_driver_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	pci_disable_device(pdev);
>  out_fini:
>  	i915_probe_error(i915, "Device initialization failed (%d)\n", ret);
> -	drm_dev_put(&i915->drm);
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 66738f2c4f28..2741fb3e30cb 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -941,8 +941,6 @@ static void i915_pci_remove(struct pci_dev *pdev)
>  
>  	i915_driver_remove(i915);
>  	pci_set_drvdata(pdev, NULL);
> -
> -	drm_dev_put(&i915->drm);
>  }
>  
>  /* is device_id present in comma separated list of ids */
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
