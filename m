Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A9B91CCCB
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2024 14:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D429E10E04F;
	Sat, 29 Jun 2024 12:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bDvLrGiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B9D10E04F
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 12:51:07 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-57cbc66a0a6so1281704a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jun 2024 05:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719665466; x=1720270266; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QlwoXKISijQ0DRcF+GZnJmixbJReAkQz34nOTF0Vuxk=;
 b=bDvLrGizmfXHhS7xRZcWDeae5FEV/MZYHNzFUNW86Zl/W6O/vlr+qvUlHLg68ghLEB
 Y/6Gt2e4UeS9L8x3lmy/tKXwLkXCC/DmIm6L0bGiIU5bzLc/cZ4oO0RKVcnfqNO1pTAP
 zjunszfK7fC9tN3sX5ZIWUvz99050/CwBOpAT1Zhes/mjayYvR3W6fjB5Xj7FwwLg8Fd
 hoTTan3bzALDBufDTpUrabGpyGLG/v584kWBSTVgGoWaYCX9yyAyF7SYna+QJ2OWKDpR
 s1eZhncWZBzyyERwOF/0CzSVtBVYhb+DEpHHYNvgwcZSEi2mGV6gYxGjXv9bfu2tANv7
 8cpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719665466; x=1720270266;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QlwoXKISijQ0DRcF+GZnJmixbJReAkQz34nOTF0Vuxk=;
 b=XV4yWgPaLF/v3mK/8ZHMjRoX+vP9XOG2q/36KnmaJvNcTCJTXl27gszNtY9HBe4DfJ
 xZqnZnTAtOnpf4hLxQg4zclhh/HqwXcnrL9V0zUsEC+6iPuZLCHC/yozURADnbskr11E
 JYMy/+L61zBUDnPd0CvUOaIL2MiHzZTjOB6pIIP77/D4Oz6KvzN4A4D19LzhYs2YnGjO
 FvyydAg2Dg28xPZspVpXFQ8Ylqu8KHIHwvBqUTOMU1JTjo0UBWqXSd5RBNIfoC/HkQiV
 K++CAZ1m7FYIeGpmKzyoJDQ14Y3c6eUWP9DUbCLqGijOO8mNwRcHilSIsLILAVyoS8Z5
 ++/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcvLNA1ko9Ou+KAw6lxsKU1AORMVsAqsJkMlYtZdsSD+wMRdBkniOVFm+nadt+o+bV03WlA2L3rt98uJYJljiJo6ckSN1duTp9w/V26Z5g
X-Gm-Message-State: AOJu0YzOPNvWGMzK/+dg0cx0Vghwtquw90bO+c1RaWQ/0u59JzwpWXs0
 HY7LZWVHko7Q9Z8ua/O6uFT8fNtlmMH8BHPT+cCJerqm8vls1CmBFTPsAw==
X-Google-Smtp-Source: AGHT+IF/MBEiMijU8GjgEXLJuB9PxQWKYMlbEYZlv/UgCvP3oFNMsmcWz1PuXDww6RQR6rVaR2ksVQ==
X-Received: by 2002:a17:907:2d86:b0:a72:5760:1424 with SMTP id
 a640c23a62f3a-a7513773b0dmr91562566b.0.1719656296728; 
 Sat, 29 Jun 2024 03:18:16 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:1:32d0:42ff:fe10:6983?
 (2a02-a449-4071-1-32d0-42ff-fe10-6983.fixed6.kpn.net.
 [2a02:a449:4071:1:32d0:42ff:fe10:6983])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06565csm151609666b.103.2024.06.29.03.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jun 2024 03:18:16 -0700 (PDT)
Message-ID: <a3a1ed17-17f7-480a-8faf-b493918956f0@gmail.com>
Date: Sat, 29 Jun 2024 12:18:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v7] drm/rockchip: rk3066_hdmi: add sound support
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, lgirdwood@gmail.com, broonie@kernel.org,
 linux-sound@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <5c651b3f-fe30-4874-98ed-044f7c62dd97@gmail.com>
 <7c53f7d.bb08.1905ef690ef.Coremail.andyshrk@163.com>
Content-Language: en-US
In-Reply-To: <7c53f7d.bb08.1905ef690ef.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy, thanks.

On 6/28/24 15:08, Andy Yan wrote:
> 
> Hi Johan,
> 
> At 2024-06-28 17:23:39, "Johan Jonker" <jbx6244@gmail.com> wrote:
>> Add sound support to the RK3066 HDMI driver.
>> The HDMI TX audio source is connected to I2S_8CH.
>>
>> Signed-off-by: Zheng Yang <zhengyang@rock-chips.com>
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
>>
>> Changed V7:
>>  rebase
>> ---
>> drivers/gpu/drm/rockchip/Kconfig       |   2 +
>> drivers/gpu/drm/rockchip/rk3066_hdmi.c | 274 ++++++++++++++++++++++++-
>> 2 files changed, 275 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
>> index 1bf3e2829cd0..a32ee558408c 100644
>> --- a/drivers/gpu/drm/rockchip/Kconfig
>> +++ b/drivers/gpu/drm/rockchip/Kconfig
>> @@ -102,6 +102,8 @@ config ROCKCHIP_RGB
>> config ROCKCHIP_RK3066_HDMI
>> 	bool "Rockchip specific extensions for RK3066 HDMI"
>> 	depends on DRM_ROCKCHIP
>> +	select SND_SOC_HDMI_CODEC if SND_SOC
>> +	select SND_SOC_ROCKCHIP_I2S if SND_SOC
>> 	help
>> 	  This selects support for Rockchip SoC specific extensions
>> 	  for the RK3066 HDMI driver. If you want to enable
>> diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> index 784de990da1b..d3128b787629 100644
>> --- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> +++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
>> @@ -15,12 +15,20 @@
>> #include <linux/platform_device.h>
>> #include <linux/regmap.h>
>>
>> +#include <sound/hdmi-codec.h>
>> +
>> #include "rk3066_hdmi.h"
>>
>> #include "rockchip_drm_drv.h"
>>
>> #define DEFAULT_PLLA_RATE 30000000
>>
>> +struct audio_info {
>> +	int channels;
>> +	int sample_rate;
>> +	int sample_width;
>> +};
>> +
>> struct hdmi_data_info {
>> 	int vic; /* The CEA Video ID (VIC) of the current drm display mode. */
>> 	unsigned int enc_out_format;
>> @@ -54,9 +62,16 @@ struct rk3066_hdmi {
>>
>> 	unsigned int tmdsclk;
>>
>> +	struct platform_device *audio_pdev;
>> +	stru
> 
> ......
> 
>> +
>> +	return ret;
>> +}
>> +
>> +static const struct hdmi_codec_ops audio_codec_ops = {
>> +	.hw_params = rk3066_hdmi_audio_hw_params,
>> +	.audio_shutdown = rk3066_hdmi_audio_shutdown,
>> +	.mute_stream = rk3066_hdmi_audio_mute_stream,
>> +	.get_eld = rk3066_hdmi_audio_get_eld,
>> +	.no_capture_mute = 1,
>> +};
>> +
>> +static int rk3066_hdmi_audio_codec_init(struct rk3066_hdmi *hdmi,
>> +					struct device *dev)
>> +{
>> +	struct hdmi_codec_pdata codec_data = {
>> +		.i2s = 1,
>> +		.ops = &audio_codec_ops,
>> +		.max_i2s_channels = 8,
>> +	};
>> +
>> +	hdmi->audio.channels = 2;
>> +	hdmi->audio.sample_rate = 48000;
>> +	hdmi->audio.sample_width = 16;
>> +	hdmi->audio_enable = false;
>> +	hdmi->audio_pdev =
>> +		platform_device_register_data(dev,
>> +					      HDMI_CODEC_DRV_NAME,
>> +					      PLATFORM_DEVID_NONE,
>> +					      &codec_data,
>> +					      sizeof(codec_data));
>> +
>> +	return PTR_ERR_OR_ZERO(hdmi->audio_pdev);
>> +}
>> +
>> static int
>> rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
>> {
>> @@ -566,6 +834,8 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
>>
>> 	drm_connector_attach_encoder(&hdmi->connector, encoder);
>>
>> +	rk3066_hdmi_audio_codec_init(hdmi, dev);
> 
> 
> According to Documentation/driver-api/driver-model/driver.rst,
> 

> It is best not to register at the bind callback：

Question for the DRM experts:
What would be the correct location/level for the rk3066_hdmi_audio_codec_init() function?
Is that at the rk3066_hdmi_encoder_enable() function?
Are there other functions/examples for sound in the DRM toolbox?

Johan
> 
> .. warning::
>       -EPROBE_DEFER must not be returned if probe() has already created
>       child devices, even if those child devices are removed again
>       in a cleanup path. If -EPROBE_DEFER is returned after a child
>       device has been registered, it may result in an infinite loop of
>       .probe() calls to the same driver.
> 
> For example：
> vop_probe --》component_add--》rk3066_hdmi_bind--》rk3066_hdmi_audio_codec_init--》hdmi_codec_probe--》rockchip_rgb_init（DEFER when panel not ready）
> 
> This  may result in an infinite loop of probe
> 
> 
>> +
>> 	return 0;
>> }
>>
>> @@ -813,6 +1083,7 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
>> 	return 0;
>>
>> err_cleanup_hdmi:
>> +	platform_device_unregister(hdmi->audio_pdev);
>> 	hdmi->connector.funcs->destroy(&hdmi->connector);
>> 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
>> err_disable_i2c:
>> @@ -828,6 +1099,7 @@ static void rk3066_hdmi_unbind(struct device *dev, struct device *master,
>> {
>> 	struct rk3066_hdmi *hdmi = dev_get_drvdata(dev);
>>
>> +	platform_device_unregister(hdmi->audio_pdev);
>> 	hdmi->connector.funcs->destroy(&hdmi->connector);
>> 	hdmi->encoder.encoder.funcs->destroy(&hdmi->encoder.encoder);
>>
>> --
>> 2.39.2
>>
