Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A100692740D
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 12:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E8910EA74;
	Thu,  4 Jul 2024 10:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QcrZsn27";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36D810EA76
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 10:28:56 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso664545a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2024 03:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720088935; x=1720693735; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W1n41ixNHOs7ND4dHyzhkd0g//JyZDb7AOEWRwz5JLA=;
 b=QcrZsn27D86lHMZJsFJeWj0cAYSonaLsVkiJCHBEAYqxXewPqN57hDFV8huLx584/3
 ZTkAJpENHwZ40EBZGitUZW1XSJxYMySiDbt7iyl2FXjmTIc+LTEW/Z072YVzjhWJAqvT
 ZGOD0JWCK4oQzMOayLzvwpklM1FM59VMRKdVWRWXL8BS6hkmGHlEAqWwrjZyIWqXp66j
 dOrLy7O6zsmGenGv+xQQ+ZH5xuRD2+0LVz5x49xDBoSs8aFEYqd3jKPaLLwQQVrgrSdD
 6q9gJMS+p0enN+vFjbVcwqndUFskqzpjm1IH8jxJa9MQMEPdsBSp1ftivDldtRQw/mSq
 aW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720088935; x=1720693735;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W1n41ixNHOs7ND4dHyzhkd0g//JyZDb7AOEWRwz5JLA=;
 b=Vs7EXW6lCzzU014tkFD6JuTv1Tej1mIacnqXzGdMFCvWWVSWpUwtK5tog3eCDCIz/R
 9gnEns3eb1Muso/aYwO+WjDOu8XtNC9uDxOazy8drhWkSN9itPxAsi3i7q7eE5QuzKKK
 vx3o0RtY27L/zM3KFYdzsnNLF88gQ7KEOGYjbcFUtxXb/CYaH0c8TYMbUilfpomnrXlo
 GzizNN3Lq8EKbBFaRNsODrwhiFsVSdBJgg2QMrg448foW4uI0uRu/u87nqwwTx/zaA2O
 PvPpLWysDB7fJckH1i10NsFDbRqTsN6udPNqZDh0CiUWTUKpohGWGM0L3f6hkoyLEluL
 +gwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxETj1aOYqHpm/gCXP/TIBoKurYhRYjNPcU3wAS3RQGUxZFctBh6obv8vhm1JYpjHKhE7LwVFJZiyjKQFUV9VoTrLzG6muNpuJsjuxy5mP
X-Gm-Message-State: AOJu0YyOQ9lo+c7s9Nv3az/MEw7Sta6JpyW9Dr/b4/u1TYUpE2ElpwRk
 GCjm2CUa5vGb8rm7m/mgwjR08Kck6n3ER8djXgYbQJzMjuYprZo=
X-Google-Smtp-Source: AGHT+IEq7rCkJ3goBqSiFAE3BU988m6dNO0UHFcNMG7KA3oE7u0dY94ILDMx5QFtaem3q5aXg9m0hg==
X-Received: by 2002:a05:6402:2754:b0:582:ca34:31b1 with SMTP id
 4fb4d7f45d1cf-58e5984c1ddmr996419a12.16.1720088934848; 
 Thu, 04 Jul 2024 03:28:54 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f40:4600:5f4b:4104:ca7b:6efb?
 ([2a02:810b:f40:4600:5f4b:4104:ca7b:6efb])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58612c838casm8325256a12.4.2024.07.04.03.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jul 2024 03:28:54 -0700 (PDT)
Message-ID: <61b8b328-b72a-4bb5-9fb6-c226c2b773c4@gmail.com>
Date: Thu, 4 Jul 2024 12:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/24] drm/rockchip: dw_hdmi: add regulator support
To: Diederik de Haas <didi.debian@cknow.org>,
 dri-devel@lists.freedesktop.org, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Peter Geis <pgwipeout@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
References: <20220422072841.2206452-1-s.hauer@pengutronix.de>
 <20220422072841.2206452-10-s.hauer@pengutronix.de>
 <16078476.GIfNKF0EQE@bagend>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <16078476.GIfNKF0EQE@bagend>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.07.24 um 11:09 schrieb Diederik de Haas:
> On Friday, 22 April 2022 09:28:26 CEST Sascha Hauer wrote:
>> The RK3568 has HDMI_TX_AVDD0V9 and HDMI_TX_AVDD_1V8 supply inputs needed
>> for the HDMI port. add support for these to the driver for boards which
>> have them supplied by switchable regulators.
>>
>> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
>> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 41 +++++++++++++++++++--
>>   1 file changed, 38 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c index
>> b64cc62c7b5af..fe4f9556239ac 100644
>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/platform_device.h>
>>   #include <linux/phy/phy.h>
>>   #include <linux/regmap.h>
>> +#include <linux/regulator/consumer.h>
>>
>>   #include <drm/bridge/dw_hdmi.h>
>>   #include <drm/drm_edid.h>
>> @@ -76,6 +77,8 @@ struct rockchip_hdmi {
>>   	struct clk *ref_clk;
>>   	struct clk *grf_clk;
>>   	struct dw_hdmi *hdmi;
>> +	struct regulator *avdd_0v9;
>> +	struct regulator *avdd_1v8;
>>   	struct phy *phy;
>>   };
>>
>> @@ -226,6 +229,14 @@ static int rockchip_hdmi_parse_dt(struct rockchip_hdmi
>> *hdmi) return PTR_ERR(hdmi->grf_clk);
>>   	}
>>
>> +	hdmi->avdd_0v9 = devm_regulator_get(hdmi->dev, "avdd-0v9");
>> +	if (IS_ERR(hdmi->avdd_0v9))
>> +		return PTR_ERR(hdmi->avdd_0v9);
>> +
>> +	hdmi->avdd_1v8 = devm_regulator_get(hdmi->dev, "avdd-1v8");
>> +	if (IS_ERR(hdmi->avdd_1v8))
>> +		return PTR_ERR(hdmi->avdd_1v8);
>> +
>>   	return 0;
>>   }
>>
>> @@ -566,11 +577,23 @@ static int dw_hdmi_rockchip_bind(struct device *dev,
>> struct device *master, return ret;
>>   	}
>>
>> +	ret = regulator_enable(hdmi->avdd_0v9);
>> +	if (ret) {
>> +		DRM_DEV_ERROR(hdmi->dev, "failed to enable avdd0v9:
> %d\n", ret);
>> +		goto err_avdd_0v9;
>> +	}
>> +
>> +	ret = regulator_enable(hdmi->avdd_1v8);
>> +	if (ret) {
>> +		DRM_DEV_ERROR(hdmi->dev, "failed to enable avdd1v8:
> %d\n", ret);
>> +		goto err_avdd_1v8;
>> +	}
>> +
>>   	ret = clk_prepare_enable(hdmi->ref_clk);
>>   	if (ret) {
>>   		DRM_DEV_ERROR(hdmi->dev, "Failed to enable HDMI
> reference clock: %d\n",
>>   			      ret);
>> -		return ret;
>> +		goto err_clk;
>>   	}
>>
>>   	if (hdmi->chip_data == &rk3568_chip_data) {
>> @@ -594,10 +617,19 @@ static int dw_hdmi_rockchip_bind(struct device *dev,
>> struct device *master, */
>>   	if (IS_ERR(hdmi->hdmi)) {
>>   		ret = PTR_ERR(hdmi->hdmi);
>> -		drm_encoder_cleanup(encoder);
>> -		clk_disable_unprepare(hdmi->ref_clk);
>> +		goto err_bind;
>>   	}
>>
>> +	return 0;
>> +
>> +err_bind:
>> +	clk_disable_unprepare(hdmi->ref_clk);
>> +	drm_encoder_cleanup(encoder);
>> +err_clk:
>> +	regulator_disable(hdmi->avdd_1v8);
>> +err_avdd_1v8:
>> +	regulator_disable(hdmi->avdd_0v9);
>> +err_avdd_0v9:
>>   	return ret;
>>   }
>>
>> @@ -608,6 +640,9 @@ static void dw_hdmi_rockchip_unbind(struct device *dev,
>> struct device *master,
>>
>>   	dw_hdmi_unbind(hdmi->hdmi);
>>   	clk_disable_unprepare(hdmi->ref_clk);
>> +
>> +	regulator_disable(hdmi->avdd_1v8);
>> +	regulator_disable(hdmi->avdd_0v9);
>>   }
>>
>>   static const struct component_ops dw_hdmi_rockchip_ops = {
> 
> Is it possible to probe for those avdd_0v9 and avdd_1v8 regulators only on
> devices that should have them?
> 
Those regulators exist for _all_ RK SoCs that use dw-hdmi controller, as it
has to be supplied in same why (as it is always the same controller). In
particular case of rock64[0] its:

DVIDEO_AVDD_1V8P6 -> VCC_18
DVIDEO_AVDD_1V0M6 -> VDD_10

So: Just fix the device tree and your warnings are gone :)

[0] https://files.pine64.org/doc/rock64/ROCK64_Schematic_v2.0_20171019.pdf

> On a Rock64 (rk3328), but probably for all VOP1 devices, they're not present
> and that results in the following warnings:
> dwhdmi-rockchip ff3c0000.hdmi: supply avdd-0v9 not found, using dummy regulator
> dwhdmi-rockchip ff3c0000.hdmi: supply avdd-1v8 not found, using dummy regulator
> 
> And those get repeated a number of times. In my last 6.10-rc5 boot it was 5
> each and in my last 6.10-rc6 boot it was 9 each. It seems the number varies
> per boot and is not connected to the specific kernel version.
> 
> In [1] I got 36 "dummy regulator" warnings, but some were from others.
> 
> [1] https://lore.kernel.org/linux-rockchip/2528743.FZeJfPzi8P@bagend/
> 
> Cheers,
>    Diederik
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

