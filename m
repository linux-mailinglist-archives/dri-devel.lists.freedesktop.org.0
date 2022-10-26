Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A506060DF72
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 13:24:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4A810E4B3;
	Wed, 26 Oct 2022 11:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30EE710E4B3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 11:24:04 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id bx35so15382560ljb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 04:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RdM68UP4J380cFfJCck4+2zTIv1FinWj9xtR9Ddn7GY=;
 b=O3C/bJqGTm06zSL1cRtfNR8GOY5qPOb7Mg9LJpvMgQH/IMrwcUH2dwYjo3R92t0amB
 I6KdB7WrugytX+99V5g18tVODPiS53vQPng+J+Jp9EGncIXgc8unKvvb1KkYeF3KQhUZ
 amQcuy6Hpu1CsbzVxj0hJqkAsYWD7U4xin9erf2LxvUhQW0HIjTnIN1oqYu2h/q4Ftmx
 yvrjc9FVx8nHgqEQrKvF+OFUPZ8YaYP74oRpGVruotkkeAS2YMAdIiw8DSTn5Aif7Rt+
 EDj7BHVrU7DdQ3PHs0/tzSZnl4zaWAmgJpzrqT6w4NH4HDJWtvCE+1nyDKJFZOG6KkG/
 6xHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RdM68UP4J380cFfJCck4+2zTIv1FinWj9xtR9Ddn7GY=;
 b=HL1qXRz1/G0nQmDqRdglxl0TVbimVpty5ide10ZCbuL/SV67I2SP91aTJrKdEAX9IS
 IahlSICPMShdnz2M5YI/MzufGEYln8bgSp9kjMqR+58SmmnobjNLPncloHw58pIQBpbi
 OR6d1LjgOWGbt5Hb2geMasQHfwOX+abYFcqJ86oOA/iD172dkuJQ4uo/HXn2t7/Z8rNC
 8FttCiRmuTFNsl0aVDyEV2gOD3uyqlH7ubpQn451Nx8Nu3vW9EGlPF+jFycW1Yta04Dn
 zoE5MYTwZElQoFtGK8vFf+QBvrUxWBT+auywCHdZng/WmUbhupJZuEcKOCclh/fxRVdk
 i+kw==
X-Gm-Message-State: ACrzQf2wdokbJGNeRXCQDlZGF2Jor4FPk/aEjhoQ5EUTRTKN9iUOlzgO
 YDHHkL3g4oMMcKFhILhoy3tYVA==
X-Google-Smtp-Source: AMsMyM4sW/B/UAv17zfdOj0B5Fs8l76Zd6KnGTfJd/WIp5VwQlqroX/C254V236i0uZZ9whZ7/y8UA==
X-Received: by 2002:a2e:938b:0:b0:26d:fd3d:4b5c with SMTP id
 g11-20020a2e938b000000b0026dfd3d4b5cmr15375528ljh.12.1666783442388; 
 Wed, 26 Oct 2022 04:24:02 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u27-20020a2e141b000000b0026df5232c7fsm907675ljd.42.2022.10.26.04.24.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 04:24:02 -0700 (PDT)
Message-ID: <058c990c-655b-be3b-703f-9adff71fbc8c@linaro.org>
Date: Wed, 26 Oct 2022 14:24:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 0/7] drm/bridge_connector: perform HPD enablement
 automatically
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
 <bfb23b03-1270-b196-3379-85ff5a55b02b@ideasonboard.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bfb23b03-1270-b196-3379-85ff5a55b02b@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/10/2022 14:21, Tomi Valkeinen wrote:
> On 24/10/2022 18:39, Dmitry Baryshkov wrote:
>>  From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
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
>> Changes since v1:
>>   - Rebased on top of v6.1-rc1
>>   - Removed the drm_bridge_connector_enable_hpd() from
>>     drm_bridge_connector_init()
>>   - Removed extra underscore prefix from
>>     drm_bridge_connector_en/disable_hpd() helpers
>>
>> Dmitry Baryshkov (7):
>>    drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
>>    drm/probe-helper: enable and disable HPD on connectors
>>    drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
>>    drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
>>    drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
>>    drm/omap: stop using drm_bridge_connector_en/disable_hpd()
>>    drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()
>>
>>   drivers/gpu/drm/drm_bridge_connector.c   | 27 +++-------------
>>   drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
>>   drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
>>   drivers/gpu/drm/imx/dcss/dcss-kms.c      |  2 --
>>   drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
>>   drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
>>   include/drm/drm_bridge_connector.h       |  2 --
>>   include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
>>   8 files changed, 59 insertions(+), 81 deletions(-)
>>
> 
> For the series:
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> 
> This fixes the issue (WARN for "Hot plug detection already enabled") 
> introduced by 09077bc3116581f4d1cb961ec359ad56586e370b, which you revert 
> in the third patch. You could mention this, maybe as a fixes tag and a 
> mention in the description.

I'll add it to the description. However I don't think it's a good idea 
to add Fixes tag. It increases the chances of picking up this single 
patch for the stable tree, which would disable the HPD notifications for 
the non OMAP/iMX boards.


-- 
With best wishes
Dmitry

