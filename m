Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9745E66317A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 21:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DE510E4FF;
	Mon,  9 Jan 2023 20:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D316310E502
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 20:26:31 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id j17so14869790lfr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 12:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vG2rLkKQzLwsW4cA+jY3MG5O3NUS9GFU+CxE1+/7o2Q=;
 b=xWZp9nUNTWKwD74R8LaFCrCez8o4RmpZDe2jPbbuvl4uC1rDQUqJJRW+yDyUK97YZf
 UlDRwPOIfLuj5nj6I9YHWJcI7S1x67PFhQ7LOj7Zghh+Jw7wtCMPuGM9D1yeuvFfmgMM
 U+vms6vmDnLysmNTOmDHJ0x2mMtBGiPblOXkfVdFVt1/0sGBFlS1KD1dcZMlj8fCb7DB
 ZLFDR9xw359oFd5rQ9m50XQl8J1K0F4Hgy0O0Go8G6WqeL4EslIBZTjldCdqMptV10VH
 Kg5kdCUCTz0Mp989/XxQgN9Xeh7FO68uU2yZKLYHTN19utWqLUCQLRJjNQQqtHG2QX3U
 CoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vG2rLkKQzLwsW4cA+jY3MG5O3NUS9GFU+CxE1+/7o2Q=;
 b=cro5KhiAOHGVfZbgtwndRJRoVGiDjlgaXKyraRbH67jBeph/h90CiPKua/z/7HlqbA
 0TFvaNe4BFckGiAfYa+A/eGYMS3bn8eBnE7uMmgO7bpj9N+C9xYIPPcOA/X6+QJQ032d
 7eZ8hoApC5QlKBtSrUXqkJZrnAPzrxRVThrKLMc+g0v9OICOauBskWSXRDw9NuqHuS2h
 cT5bPt+913VryDirSDtWLZF2W8adF37F7zw/eCc7pIlKpjmA1EsEOLoIVTt1ISUNlTQ7
 EONbJZhUr09KS2D0bMvAibNJwIf73ezoB8DhCmhgci0V/uRKbp6vmm6Gl2kKGXzmU/fF
 QXxQ==
X-Gm-Message-State: AFqh2kph/XAGJn527NFnGpwFGAX1PqLirTe8U6W2+afkDUaoxE7cyOOr
 x1Yc8CMbYxfNkUyiXpoiskSL2Q==
X-Google-Smtp-Source: AMrXdXud+zuLlxBWWyOW8OFiUXQuyNeAZskXTT6VzcQR7Vsc/7FYAkAwHzAXPDGI0iNZBUPabeVROQ==
X-Received: by 2002:a05:6512:39ce:b0:4b4:e559:8b10 with SMTP id
 k14-20020a05651239ce00b004b4e5598b10mr20842770lfu.24.1673295990084; 
 Mon, 09 Jan 2023 12:26:30 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 a9-20020ac25e69000000b004cafb150134sm1208799lfr.67.2023.01.09.12.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 12:26:29 -0800 (PST)
Message-ID: <323ec70e-4613-c0e9-0b39-ad2a0a76673d@linaro.org>
Date: Mon, 9 Jan 2023 22:26:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Content-Language: en-GB
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
References: <20221102180705.459294-1-dmitry.baryshkov@linaro.org>
 <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109162140.yelgy2da7aqa6sqv@fsr-ub1664-121.ea.freescale.net>
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

Hi,

On 09/01/2023 18:21, Laurentiu Palcu wrote:
> Hi Dmitry,
> 
> It looks like there are some issues with this patchset... :/ I just
> fetched the drm-tip and, with these patches included, the "Hot plug
> detection already enabled" warning is back for i.MX DCSS.

Could you please provide a backtrace?

> 
> After a short investigation, it seems that we end up calling
> drm_bridge_hpd_enable() from both drm_kms_helper_poll_init() and
> drm_fbdev_generic_setup(), hence the warning.
> 
> There are drivers using the drm_bridge_connector API that also call
> drm_kms_helper_poll_init() followed by drm_fbdev_generic_setup(). So,
> they might experience the same behavior, unless I'm missing something...
> :/
> 
> Also, even if drm_fbdev_generic_setup() is not called in the driver
> initialization, the warning will still appear the first time the
> GETCONNECTOR ioctl is called, because that'll call
> drm_helper_probe_single_connector_modes() helper which will eventually
> call drm_bridge_hpd_enable().
> 
> Any idea?
> 
> Cheers,
> Laurentiu
> 
> On Wed, Nov 02, 2022 at 09:06:58PM +0300, Dmitry Baryshkov wrote:
>>  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
>> DRM driver do a proper work of calling
>> drm_bridge_connector_en/disable_hpd() in right places. Rather than
>> teaching each and every driver how to properly handle
>> drm_bridge_connector's HPD, make that automatic.
>>
>> Add two additional drm_connector helper funcs: enable_hpd() and
>> disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
>> is the time where the drm_bridge_connector's functions are called by the
>> drivers too).
>>
>> Changes since v2:
>>   - Fixed a typo in the commit message of the second patch.
>>
>> Changes since v1:
>>   - Rebased on top of v6.1-rc1
>>   - Removed the drm_bridge_connector_enable_hpd() from
>>     drm_bridge_connector_init()
>>   - Removed extra underscore prefix from
>>     drm_bridge_connector_en/disable_hpd() helpers
>>
>> Dmitry Baryshkov (7):
>>    drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
>>    drm/probe-helper: enable and disable HPD on connectors
>>    drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
>>    drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
>>    drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
>>    drm/omap: stop using drm_bridge_connector_en/disable_hpd()
>>    drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
>>
>>   drivers/gpu/drm/drm_bridge_connector.c   | 27 +++-------------
>>   drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
>>   drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
>>   drivers/gpu/drm/imx/dcss/dcss-kms.c      |  2 --
>>   drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
>>   drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
>>   include/drm/drm_bridge_connector.h       |  2 --
>>   include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
>>   8 files changed, 59 insertions(+), 81 deletions(-)
>>
>> -- 
>> 2.35.1
>>

-- 
With best wishes
Dmitry

