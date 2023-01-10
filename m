Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE34664611
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 17:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9E910E09A;
	Tue, 10 Jan 2023 16:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACAF110E0E0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 16:29:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id d30so14404667lfv.8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 08:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aJaOVxwzpfNT5mm5KlqjKiRiFU8oBS8a18JCmwVw3uw=;
 b=BMJ1xJrWzFmCm3hFzV1U7MpH4iBldxRqhEJZDXlRQkJcF0XTzIn+kQXAQsXu+b8Bod
 lMBaACXQszaNh4b6k0X1cF/yPkRSx42ZGpPUMiPtlc33MOKaqc2+QEd7TVE3Ij0D02SA
 58u2e8aUf3QYiTDRfdaEdahv/Nwgr9g7xcVE0kYa6ZTbb/pBHbHG2Qzq9HGqGECOM0/x
 IrAJG9o6MTSsC6EAAv+09yHlkfooIHUfBQRo5V2snwkdG9Wd9uAJYWO1/4Ionf8DazvY
 X93CJXQR/U9NjJvg1hgGV18Qf7S+3Di2qwLEl6qczw93jUmxmturXDbXUDY7wKU72m6I
 hsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aJaOVxwzpfNT5mm5KlqjKiRiFU8oBS8a18JCmwVw3uw=;
 b=t0E/UtiaBvXjQlq7u9TxbS35jbAXnbiCvKmPYMue6BHXEbsZMNsqtFT0WeQ3xrzRLA
 PdlnkUS2pLDQvzE5fEdnNdlyDQ4sxkUSdqSGYfErm9AIHX2gkK0plj6hlgtchlKKQxLQ
 TpK/QPqXRyeqXrPqhHCQeEcHrRGsi/vFYUQuLqBvckaICGqX9olI4pDiCMuMIKbJDqoq
 +Fy6WUr5UzZJ0iYIpeitj/I4xaCjYGfSHRgHrx+UXoIc3/claUuTg/WdZEhL4OMzDYl3
 9+G2Ur3YNWnKvWc4sSCkti38WZLVQzZxPbFiap/4EPrImff+p9MXZkGMeF9aT2McOQ+H
 /kwQ==
X-Gm-Message-State: AFqh2kqYfTcXwBQnCGfS9few7hwN/N/QTuto1d2pD29MLBis8axvHOvC
 jB7B13D9bC3iJKIegMOvWjaiow==
X-Google-Smtp-Source: AMrXdXvTEzrZKwBX5EBVrjImPyMb0X5uk5irAjKxaCdxZPfcIHaAaBX2yz4y3Y2SYx6iei4ZX+Pg0A==
X-Received: by 2002:a19:f514:0:b0:4b7:2a7:1241 with SMTP id
 j20-20020a19f514000000b004b702a71241mr17474924lfb.64.1673368153935; 
 Tue, 10 Jan 2023 08:29:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w4-20020ac25984000000b004a46a9cebe2sm2249039lfn.289.2023.01.10.08.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 08:29:13 -0800 (PST)
Message-ID: <bf92569b-3886-113c-9e27-508e4cbfa4ba@linaro.org>
Date: Tue, 10 Jan 2023 18:29:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Content-Language: en-GB
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
 <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
 <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230110065712.lgjnmb66s4tlpoly@fsr-ub1664-121.ea.freescale.net>
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
Cc: Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/01/2023 08:57, Laurentiu Palcu wrote:
> Hi,
> 
> On Mon, Jan 09, 2023 at 10:26:28PM +0200, Dmitry Baryshkov wrote:
>> Hi,
>>
>> On 09/01/2023 18:21, Laurentiu Palcu wrote:
>>> Hi Dmitry,
>>>
>>> It looks like there are some issues with this patchset... :/ I just
>>> fetched the drm-tip and, with these patches included, the "Hot plug
>>> detection already enabled" warning is back for i.MX DCSS.
>>
>> Could you please provide a backtrace?
> 
> Sure, see below:

I wondered, why didn't I see this on msm, my main target nowadays. The 
msm driver is calling msm_kms_helper_poll_init() after initializing 
fbdev, so all previous kms_helper_poll_enable() calls return early.

I think I have the fix ready. Let me test it locally before posting.

> 
> ------------[ cut here ]------------
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
> Cheers,
> Laurentiu
> 
>>
>>>
>>> After a short investigation, it seems that we end up calling
>>> drm_bridge_hpd_enable() from both drm_kms_helper_poll_init() and
>>> drm_fbdev_generic_setup(), hence the warning.
>>>
>>> There are drivers using the drm_bridge_connector API that also call
>>> drm_kms_helper_poll_init() followed by drm_fbdev_generic_setup(). So,
>>> they might experience the same behavior, unless I'm missing something...
>>> :/
>>>
>>> Also, even if drm_fbdev_generic_setup() is not called in the driver
>>> initialization, the warning will still appear the first time the
>>> GETCONNECTOR ioctl is called, because that'll call
>>> drm_helper_probe_single_connector_modes() helper which will eventually
>>> call drm_bridge_hpd_enable().
>>>
>>> Any idea?
>>>
>>> Cheers,
>>> Laurentiu
>>>
>>> On Wed, Nov 02, 2022 at 09:06:58PM +0300, Dmitry Baryshkov wrote:
>>>>   From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
>>>> DRM driver do a proper work of calling
>>>> drm_bridge_connector_en/disable_hpd() in right places. Rather than
>>>> teaching each and every driver how to properly handle
>>>> drm_bridge_connector's HPD, make that automatic.
>>>>
>>>> Add two additional drm_connector helper funcs: enable_hpd() and
>>>> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
>>>> is the time where the drm_bridge_connector's functions are called by the
>>>> drivers too).
>>>>
>>>> Changes since v2:
>>>>    - Fixed a typo in the commit message of the second patch.
>>>>
>>>> Changes since v1:
>>>>    - Rebased on top of v6.1-rc1
>>>>    - Removed the drm_bridge_connector_enable_hpd() from
>>>>      drm_bridge_connector_init()
>>>>    - Removed extra underscore prefix from
>>>>      drm_bridge_connector_en/disable_hpd() helpers
>>>>
>>>> Dmitry Baryshkov (7):
>>>>     drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
>>>>     drm/probe-helper: enable and disable HPD on connectors
>>>>     drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
>>>>     drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
>>>>     drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
>>>>     drm/omap: stop using drm_bridge_connector_en/disable_hpd()
>>>>     drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
>>>>
>>>>    drivers/gpu/drm/drm_bridge_connector.c   | 27 +++-------------
>>>>    drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
>>>>    drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
>>>>    drivers/gpu/drm/imx/dcss/dcss-kms.c      |  2 --
>>>>    drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
>>>>    drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
>>>>    include/drm/drm_bridge_connector.h       |  2 --
>>>>    include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
>>>>    8 files changed, 59 insertions(+), 81 deletions(-)
>>>>
>>>> -- 
>>>> 2.35.1
>>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

