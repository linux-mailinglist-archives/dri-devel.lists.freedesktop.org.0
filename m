Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC32F67957D
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 11:41:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5CC10E65E;
	Tue, 24 Jan 2023 10:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13DF10E65D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:41:29 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id x10so17770584edd.10
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 02:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VBtPR9EV/j1GDMMuetVOwTWuaVWVAI+3JPenaJaxtxI=;
 b=hvyC62NqSJNFOZ7SdaJ+aNb2KfMRE6SnKRhxKL4cTOO0pjJitKXARfQFt3gReOEZeN
 XfEOkXkHa6CO4qutf0yvdzvZ9IU7ZDVam19i+HHYpEbHnOcfE6Q3nysBeJBmR8Ps6PxQ
 q3Id0zcJPlD/EFUSdHLB1/MekKdjHUOcFzprIsFxofcgArOv0RKxb6bhsfPanxhwz9Xa
 S+rFvxSTVLKL/w/34d70rgYuamcqwa/L+fysopgoPITNp8mqYwfxo47wU+48v33qICGd
 bTeL79pwYsPvTaCHfyQTPUbohfcczgBcct3a1zXDnSP823q4BTWcsphKMhp6Tpno1bJ5
 nFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VBtPR9EV/j1GDMMuetVOwTWuaVWVAI+3JPenaJaxtxI=;
 b=JlgSeMOfNvYjfa+lvIDAOA9BBGJ27QrRmPhp9AkY1oEyB+DjTYHoadWm2pmVlrtid5
 XxtpsUBM9MIXB42A5VdQmjg0+/2edL0c2CzcpDeqLjSUUcKw8XRpwF13NN2CZ0H8hbuC
 u78Jyv7oI/nPmUMvCaTD3aWV0zmkH7friKMrERbUNFZUYm4n6HRcWLPbhYO+akaF79Sf
 D3SqHLHZoTpjIZP5Y2Fr/FpUZBvyuK9Vx0wKi/uLYxasKkXqCIuAss/8hZOMm+ONboS6
 UqSv5ojC/uH611n4UqZbUhpFxFSUujvtZ6tm3ElacFVsh/cXEzZM55rE3R79iWpSllx3
 r/Gw==
X-Gm-Message-State: AFqh2koDK9UjXi3i5jBjrlO8rkz5Ro6LR5aqGXi/j2vxcJ2q4tgKVl5M
 Uwc6UQegz6THLvU6LqISsdQK8A==
X-Google-Smtp-Source: AMrXdXui6jaXhAJec9B2Gka/8KcTK+QTCZPselVD9fWoQutt+zyCBEtqtmCVFohugnIS4Dy4j/VNzA==
X-Received: by 2002:a05:6402:4025:b0:49b:67c3:39ae with SMTP id
 d37-20020a056402402500b0049b67c339aemr34690041eda.33.1674556888131; 
 Tue, 24 Jan 2023 02:41:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 qx24-20020a170906fcd800b007aece68483csm701795ejb.193.2023.01.24.02.41.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 02:41:27 -0800 (PST)
Message-ID: <e9ebf14a-668e-9e3a-cf51-309db4e4848e@linaro.org>
Date: Tue, 24 Jan 2023 12:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] drm/probe_helper: sort out poll_running vs poll_enabled
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20230117233905.1662645-1-dmitry.baryshkov@linaro.org>
 <Y8rDyk6VNdqlKUn4@pendragon.ideasonboard.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <Y8rDyk6VNdqlKUn4@pendragon.ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2023 18:39, Laurent Pinchart wrote:
> Hi Dmitry,
> 
> Thank you for the patch.
> 
> On Wed, Jan 18, 2023 at 01:39:05AM +0200, Dmitry Baryshkov wrote:
>> There are two flags attemting to guard connector polling:
>> poll_enabled and poll_running. While poll_enabled semantics is clearly
>> defined and fully adhered (mark that drm_kms_helper_poll_init() was
>> called and not finalized by the _fini() call), the poll_running flag
>> doesn't have such clearliness.
>>
>> This flag is used only in drm_helper_probe_single_connector_modes() to
>> guard calling of drm_kms_helper_poll_enable, it doesn't guard the
>> drm_kms_helper_poll_fini(), etc. Change it to only be set if the polling
>> is actually running. Tie HPD enablement to this flag.
>>
>> This fixes the following warning reported after merging the HPD series:
>>
>> Hot plug detection already enabled
>> WARNING: CPU: 2 PID: 9 at drivers/gpu/drm/drm_bridge.c:1257 drm_bridge_hpd_enable+0x94/0x9c [drm]
>> Modules linked in: videobuf2_memops snd_soc_simple_card snd_soc_simple_card_utils fsl_imx8_ddr_perf videobuf2_common snd_soc_imx_spdif adv7511 etnaviv imx8m_ddrc imx_dcss mc cec nwl_dsi gov
>> CPU: 2 PID: 9 Comm: kworker/u8:0 Not tainted 6.2.0-rc2-15208-g25b283acd578 #6
>> Hardware name: NXP i.MX8MQ EVK (DT)
>> Workqueue: events_unbound deferred_probe_work_func
>> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : drm_bridge_hpd_enable+0x94/0x9c [drm]
>> lr : drm_bridge_hpd_enable+0x94/0x9c [drm]
>> sp : ffff800009ef3740
>> x29: ffff800009ef3740 x28: ffff000009331f00 x27: 0000000000001000
>> x26: 0000000000000020 x25: ffff800001148ed8 x24: ffff00000a8fe000
>> x23: 00000000fffffffd x22: ffff000005086348 x21: ffff800001133ee0
>> x20: ffff00000550d800 x19: ffff000005086288 x18: 0000000000000006
>> x17: 0000000000000000 x16: ffff8000096ef008 x15: 97ffff2891004260
>> x14: 2a1403e194000000 x13: 97ffff2891004260 x12: 2a1403e194000000
>> x11: 7100385f29400801 x10: 0000000000000aa0 x9 : ffff800008112744
>> x8 : ffff000000250b00 x7 : 0000000000000003 x6 : 0000000000000011
>> x5 : 0000000000000000 x4 : ffff0000bd986a48 x3 : 0000000000000001
>> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000000250000
>> Call trace:
>>   drm_bridge_hpd_enable+0x94/0x9c [drm]
>>   drm_bridge_connector_enable_hpd+0x2c/0x3c [drm_kms_helper]
>>   drm_kms_helper_poll_enable+0x94/0x10c [drm_kms_helper]
>>   drm_helper_probe_single_connector_modes+0x1a8/0x510 [drm_kms_helper]
>>   drm_client_modeset_probe+0x204/0x1190 [drm]
>>   __drm_fb_helper_initial_config_and_unlock+0x5c/0x4a4 [drm_kms_helper]
>>   drm_fb_helper_initial_config+0x54/0x6c [drm_kms_helper]
>>   drm_fbdev_client_hotplug+0xd0/0x140 [drm_kms_helper]
>>   drm_fbdev_generic_setup+0x90/0x154 [drm_kms_helper]
>>   dcss_kms_attach+0x1c8/0x254 [imx_dcss]
>>   dcss_drv_platform_probe+0x90/0xfc [imx_dcss]
>>   platform_probe+0x70/0xcc
>>   really_probe+0xc4/0x2e0
>>   __driver_probe_device+0x80/0xf0
>>   driver_probe_device+0xe0/0x164
>>   __device_attach_driver+0xc0/0x13c
>>   bus_for_each_drv+0x84/0xe0
>>   __device_attach+0xa4/0x1a0
>>   device_initial_probe+0x1c/0x30
>>   bus_probe_device+0xa4/0xb0
>>   deferred_probe_work_func+0x90/0xd0
>>   process_one_work+0x200/0x474
>>   worker_thread+0x74/0x43c
>>   kthread+0xfc/0x110
>>   ret_from_fork+0x10/0x20
>> ---[ end trace 0000000000000000 ]---
>>
>> Reported-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>> Fixes: c8268795c9a9 ("drm/probe-helper: enable and disable HPD on connectors")
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> This fixes the issue on my Renesas boards.
> 
> Tested-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Please see below for a few comments.
> 

[skipped two small comments, will fix them in v3]


>> @@ -886,7 +897,12 @@ EXPORT_SYMBOL(drm_kms_helper_poll_init);
>>    */
>>   void drm_kms_helper_poll_fini(struct drm_device *dev)
>>   {
>> -	drm_kms_helper_poll_disable_fini(dev, true);
>> +	if (!dev->mode_config.poll_enabled)
>> +		return;
>> +
>> +	drm_kms_helper_poll_disable(dev);
>> +
>> +	dev->mode_config.poll_enabled = false;
> 
> The fact that poll_enabled guard init/fini and poll_running guards
> enable/disable is confusing :-S It would be nice if the poll_enable flag
> matched the enable/disable function names. One option could be
> 
> - drm_kms_helper_poll_enable() -> drm_kms_helper_poll_resume()
> - drm_kms_helper_poll_disable() -> drm_kms_helper_poll_suspend()
> - drm_kms_helper_poll_init() -> drm_kms_helper_poll_enable()
> - drm_kms_helper_poll_fini() -> drm_kms_helper_poll_disable()
> 
> This would align quite well with intended usage in drivers I think, the
> current enable/disable functions are documented as being used by drivers
> for suspend/resume, and the init()/fini() functions are documented as
> "init and enable" and "disable and cleanup".
> 
> This isn't a candidate for this patch of course, it can be done on top.

Yes, but I'd extremely dislike renaming a function to use the name of 
the function that existed previously. It can lead to very confusing issue.

What do you think about keeping poll_init()/_fini() as is, reaming 
dev->mode_config.poll_enabled to poll_initialized, and renaming 
poll_enable()/disable() to suspend()/resume() as you suggested?

> 
>>   }
>>   EXPORT_SYMBOL(drm_kms_helper_poll_fini);
>>   
> 

-- 
With best wishes
Dmitry

