Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1386C67ADAC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 10:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AC310E08C;
	Wed, 25 Jan 2023 09:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B70310E0C9
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 09:22:54 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso762899wmn.5
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 01:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=t+N+EMX2pDcp34EKAh0LrB9pPYaXOcJI7eTQbMha6Zg=;
 b=b5SISg0nh3aL9r/5/n0DmLHL1WyrSaQAJn+I9OLsgPDEjHx4mRxXhaqF2Pz7k6neXl
 szBCGYopZyahD0oZepZjhy2Ej73nLEbK9h7x+OOvCaYntwEGFr4vIq8JtCBZiOq21ecy
 ADaQ+N/lfuCzA1MtnU7/EjSoMU9FH6B2Ne01RDczs5zEt8kCppKcjaE8ZP4tAm4w4cky
 PevgP3/M/iNmEurWGJSR0lK8WxDCImx0vyptUaVhvSYQ6aEfQRm2xlbNhqbh7gGaXIP7
 O6yoze/WQcz651WSz4UO4Fl2JW+I4VxKVIyEuuC6zIAsj3p6sP/poxjZCKfw+qZ5yPDk
 Fvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t+N+EMX2pDcp34EKAh0LrB9pPYaXOcJI7eTQbMha6Zg=;
 b=vBN0W0Iyy7W20efD5rL6icvmonv78VH60VfdSKEDb5X4Z+539h9/+STemV6jf+bQSI
 MgAuP8BxYNd7qQ6U+tmzNoqo6SfnzeRu8Vc2reayGIUPujhcnxXyrfNjIFmlnysjd1Bv
 vz3zBMwJMQaaXL6Pfxx+ECqdm9TXdSleeEHMa8/jqRkutLsAebMkQnQ2fJID86j06WzY
 FkQ7hBqiFGEBcgkDMdXUPxPQ0zXPF4LaTWM6voDqdS91ISoPCxWZWdqxDSR5X4tnkqT8
 euwGu8zKumNbDXcDkqsVax06/AqZvKnWZWvzb7mhmlUQI46UVoJ+REFgUbKZchcdAbep
 tJLQ==
X-Gm-Message-State: AFqh2kpm82g+GLouWptt3+WHN0vAj9MjTvAu2C7SUKWPXW6RT14KJ6qE
 4eHHD/ib97jLAVg/QjiY00h1lA==
X-Google-Smtp-Source: AMrXdXs68hlsEvYMICZNhUDF64wGFIEDr8fw8a6Xf2dGMc7gJWZCns5M/wwhBsqy38xl8/2k45+Oaw==
X-Received: by 2002:a05:600c:5386:b0:3da:f670:a199 with SMTP id
 hg6-20020a05600c538600b003daf670a199mr30656943wmb.36.1674638572425; 
 Wed, 25 Jan 2023 01:22:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ad2f:6fa7:d25a:7047?
 ([2a01:e0a:982:cbb0:ad2f:6fa7:d25a:7047])
 by smtp.gmail.com with ESMTPSA id
 h14-20020a05600c2cae00b003cf6a55d8e8sm1339840wmc.7.2023.01.25.01.22.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 01:22:51 -0800 (PST)
Message-ID: <e297c6c0-b922-18c3-c4a7-e16185839e13@linaro.org>
Date: Wed, 25 Jan 2023 10:22:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/2] drm/probe_helper: sort out poll_running vs
 poll_enabled
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230124104548.3234554-1-dmitry.baryshkov@linaro.org>
 <20230124104548.3234554-2-dmitry.baryshkov@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230124104548.3234554-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 intel-gfx@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>,
 dri-devel@lists.freedesktop.org, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 freedreno@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 24/01/2023 11:45, Dmitry Baryshkov wrote:
> There are two flags attemting to guard connector polling:
> poll_enabled and poll_running. While poll_enabled semantics is clearly
> defined and fully adhered (mark that drm_kms_helper_poll_init() was
> called and not finalized by the _fini() call), the poll_running flag
> doesn't have such clearliness.
> 
> This flag is used only in drm_helper_probe_single_connector_modes() to
> guard calling of drm_kms_helper_poll_enable, it doesn't guard the
> drm_kms_helper_poll_fini(), etc. Change it to only be set if the polling
> is actually running. Tie HPD enablement to this flag.
> 
> This fixes the following warning reported after merging the HPD series:

Seems this patchset is ready to be applied to drm-misc-next, if it's ok
for everyone I'll apply it later today.

Thanks,
Neil

> 
> Hot plug detection already enabled
> WARNING: CPU: 2 PID: 9 at drivers/gpu/drm/drm_bridge.c:1257 drm_bridge_hpd_enable+0x94/0x9c [drm]
> Modules linked in: videobuf2_memops snd_soc_simple_card snd_soc_simple_card_utils fsl_imx8_ddr_perf videobuf2_common snd_soc_imx_spdif adv7511 etnaviv imx8m_ddrc imx_dcss mc cec nwl_dsi gov
> CPU: 2 PID: 9 Comm: kworker/u8:0 Not tainted 6.2.0-rc2-15208-g25b283acd578 #6
> Hardware name: NXP i.MX8MQ EVK (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_bridge_hpd_enable+0x94/0x9c [drm]
> lr : drm_bridge_hpd_enable+0x94/0x9c [drm]
> sp : ffff800009ef3740
> x29: ffff800009ef3740 x28: ffff000009331f00 x27: 0000000000001000
> x26: 0000000000000020 x25: ffff800001148ed8 x24: ffff00000a8fe000
> x23: 00000000fffffffd x22: ffff000005086348 x21: ffff800001133ee0
> x20: ffff00000550d800 x19: ffff000005086288 x18: 0000000000000006
> x17: 0000000000000000 x16: ffff8000096ef008 x15: 97ffff2891004260
> x14: 2a1403e194000000 x13: 97ffff2891004260 x12: 2a1403e194000000
> x11: 7100385f29400801 x10: 0000000000000aa0 x9 : ffff800008112744
> x8 : ffff000000250b00 x7 : 0000000000000003 x6 : 0000000000000011
> x5 : 0000000000000000 x4 : ffff0000bd986a48 x3 : 0000000000000001
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000000250000
> Call trace:
>   drm_bridge_hpd_enable+0x94/0x9c [drm]
>   drm_bridge_connector_enable_hpd+0x2c/0x3c [drm_kms_helper]
>   drm_kms_helper_poll_enable+0x94/0x10c [drm_kms_helper]
>   drm_helper_probe_single_connector_modes+0x1a8/0x510 [drm_kms_helper]
>   drm_client_modeset_probe+0x204/0x1190 [drm]
>   __drm_fb_helper_initial_config_and_unlock+0x5c/0x4a4 [drm_kms_helper]
>   drm_fb_helper_initial_config+0x54/0x6c [drm_kms_helper]
>   drm_fbdev_client_hotplug+0xd0/0x140 [drm_kms_helper]
>   drm_fbdev_generic_setup+0x90/0x154 [drm_kms_helper]
>   dcss_kms_attach+0x1c8/0x254 [imx_dcss]
>   dcss_drv_platform_probe+0x90/0xfc [imx_dcss]
>   platform_probe+0x70/0xcc
>   really_probe+0xc4/0x2e0
>   __driver_probe_device+0x80/0xf0
>   driver_probe_device+0xe0/0x164
>   __device_attach_driver+0xc0/0x13c
>   bus_for_each_drv+0x84/0xe0
>   __device_attach+0xa4/0x1a0
>   device_initial_probe+0x1c/0x30
>   bus_probe_device+0xa4/0xb0
>   deferred_probe_work_func+0x90/0xd0
>   process_one_work+0x200/0x474
>   worker_thread+0x74/0x43c
>   kthread+0xfc/0x110
>   ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> 
> Reported-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Fixes: c8268795c9a9 ("drm/probe-helper: enable and disable HPD on connectors")
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Tested-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/drm_probe_helper.c | 42 +++++++++++++++---------------
>   1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index ab787d71fa66..8127be134c39 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -282,7 +282,8 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
>   	bool poll = false;
>   	unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
>   
> -	if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
> +	if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll ||
> +	    dev->mode_config.poll_running)
>   		return;
>   
>   	poll = drm_kms_helper_enable_hpd(dev);
> @@ -304,6 +305,8 @@ void drm_kms_helper_poll_enable(struct drm_device *dev)
>   
>   	if (poll)
>   		schedule_delayed_work(&dev->mode_config.output_poll_work, delay);
> +
> +	dev->mode_config.poll_running = true;
>   }
>   EXPORT_SYMBOL(drm_kms_helper_poll_enable);
>   
> @@ -592,10 +595,7 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>   	}
>   
>   	/* Re-enable polling in case the global poll config changed. */
> -	if (drm_kms_helper_poll != dev->mode_config.poll_running)
> -		drm_kms_helper_poll_enable(dev);
> -
> -	dev->mode_config.poll_running = drm_kms_helper_poll;
> +	drm_kms_helper_poll_enable(dev);
>   
>   	if (connector->status == connector_status_disconnected) {
>   		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
> @@ -735,8 +735,11 @@ static void output_poll_execute(struct work_struct *work)
>   	changed = dev->mode_config.delayed_event;
>   	dev->mode_config.delayed_event = false;
>   
> -	if (!drm_kms_helper_poll)
> +	if (!drm_kms_helper_poll && dev->mode_config.poll_running) {
> +		drm_kms_helper_disable_hpd(dev);
> +		dev->mode_config.poll_running = false;
>   		goto out;
> +	}
>   
>   	if (!mutex_trylock(&dev->mode_config.mutex)) {
>   		repoll = true;
> @@ -833,19 +836,6 @@ bool drm_kms_helper_is_poll_worker(void)
>   }
>   EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
>   
> -static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
> -{
> -	if (!dev->mode_config.poll_enabled)
> -		return;
> -
> -	if (fini)
> -		dev->mode_config.poll_enabled = false;
> -
> -	drm_kms_helper_disable_hpd(dev);
> -
> -	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
> -}
> -
>   /**
>    * drm_kms_helper_poll_disable - disable output polling
>    * @dev: drm_device
> @@ -862,7 +852,12 @@ static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
>    */
>   void drm_kms_helper_poll_disable(struct drm_device *dev)
>   {
> -	drm_kms_helper_poll_disable_fini(dev, false);
> +	if (dev->mode_config.poll_running)
> +		drm_kms_helper_disable_hpd(dev);
> +
> +	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
> +
> +	dev->mode_config.poll_running = false;
>   }
>   EXPORT_SYMBOL(drm_kms_helper_poll_disable);
>   
> @@ -900,7 +895,12 @@ EXPORT_SYMBOL(drm_kms_helper_poll_init);
>    */
>   void drm_kms_helper_poll_fini(struct drm_device *dev)
>   {
> -	drm_kms_helper_poll_disable_fini(dev, true);
> +	if (!dev->mode_config.poll_enabled)
> +		return;
> +
> +	drm_kms_helper_poll_disable(dev);
> +
> +	dev->mode_config.poll_enabled = false;
>   }
>   EXPORT_SYMBOL(drm_kms_helper_poll_fini);
>   

