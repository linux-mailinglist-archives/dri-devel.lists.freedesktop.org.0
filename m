Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E48C54F552
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:26:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762C811A717;
	Fri, 17 Jun 2022 10:26:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D3111A6E5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:26:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id o16so5170036wra.4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0V4txETkh4OC6KR1JwtAbUywtvqTqvyWUoGqYG1qTno=;
 b=ZumNluAg2++Z6tVDPIe87wTQsIfiXqSsJ25LO5ZYLQXzGQo30okhuHmC+0m1BhS8cF
 THMC1RadCYsEoWrS7pYTJP3Y/Z56BIZWJMZsFxVOTxL4jUKaXxzj1GnfePozGeuPWk8Q
 ypw6O12uiujHWwRjFmA0aicIdugJ5X5UBIuJA56Ie8PhEK8VibxyMFuqV6vMOM4WQy0a
 LzGL4p7x47uoF6uZvsEMTPsrRYoKj9EuimAnWuFsd6KEqfAn53PidrrBHhGok0UZjO8t
 CfFkheZdsiydJgmV14hprGDRLjS8cuZIaB/v0Twz2Oep9wZk4hxulZhVW3JFvI209JKE
 aPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0V4txETkh4OC6KR1JwtAbUywtvqTqvyWUoGqYG1qTno=;
 b=aWKIDVy5mJyD1nEbM16SqYPycaga1WbeJ8DuaDIxzV+uTIyhNIt8R1FBrv2MlKcCdk
 QJ6QEwLHkIOw0kWHn1wq32TVs6e/+ckoAD2RK+Ldt1WKl0pXRpEezzFYUlBGFfI3UgEQ
 W3inWpVPT0ZeotLEnVvnjrVJy8seF8K1ja1NbS91vu6+0YRXPK+uQV7ZDMGQXnHWAXoD
 o1PsNjX5KS+ovPa+AboZGNYsjMGu9JwrjdmYIZ/H5SFPEInn8Q4b9Bf6xB+ugrdE3sVr
 TU7TVZoMWNBQkxxUpsRRRdeILN5/WKb0WAUR37iHz0jhDmRbJm5WTe4zj0e4LOhJR1AO
 /oNA==
X-Gm-Message-State: AJIora9Ja1hNIXKOD6X1Y/pYfNAVPtSE7SAPlH1dqodEC3bTJ52OuROk
 PD24tm9Qegvmm/+2YRCqNo0=
X-Google-Smtp-Source: AGRyM1tKvTyXEe+SbTIXtoOamsvWi8005PX6vL8Exs37RRoEJILnRb2ud6H55Iyt5n6uIlvw/5zvAQ==
X-Received: by 2002:a5d:4e47:0:b0:21a:39fd:5bb5 with SMTP id
 r7-20020a5d4e47000000b0021a39fd5bb5mr5427556wrt.712.1655461584860; 
 Fri, 17 Jun 2022 03:26:24 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
 by smtp.gmail.com with ESMTPSA id
 i27-20020a1c541b000000b0039c5ab7167dsm8743231wmb.48.2022.06.17.03.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 03:26:23 -0700 (PDT)
Message-ID: <be6949f8-e379-6358-6c49-72632f7cd07f@gmail.com>
Date: Fri, 17 Jun 2022 12:26:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 4/7] soc: mediatek: mutex: add MT8365 support
Content-Language: en-US
To: CK Hu <ck.hu@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 jitao.shi@mediatek.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
References: <20220530201436.902505-1-fparent@baylibre.com>
 <20220530201436.902505-4-fparent@baylibre.com>
 <e63682c60d3f3c29c941c1ff5db10903466d3d34.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <e63682c60d3f3c29c941c1ff5db10903466d3d34.camel@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17/06/2022 07:50, CK Hu wrote:
> Hi, Fabien:
> 
> On Mon, 2022-05-30 at 22:14 +0200, Fabien Parent wrote:
>> Add mutex support for MT8365 SoC.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

Applied thanks!

>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> ---
>>   drivers/soc/mediatek/mtk-mutex.c | 40
>> ++++++++++++++++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/drivers/soc/mediatek/mtk-mutex.c
>> b/drivers/soc/mediatek/mtk-mutex.c
>> index 981d56967e7a..b8d5c4a62542 100644
>> --- a/drivers/soc/mediatek/mtk-mutex.c
>> +++ b/drivers/soc/mediatek/mtk-mutex.c
>> @@ -110,6 +110,20 @@
>>   #define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
>>   #define MT8195_MUTEX_MOD_DISP_PWM0		27
>>   
>> +#define MT8365_MUTEX_MOD_DISP_OVL0		7
>> +#define MT8365_MUTEX_MOD_DISP_OVL0_2L		8
>> +#define MT8365_MUTEX_MOD_DISP_RDMA0		9
>> +#define MT8365_MUTEX_MOD_DISP_RDMA1		10
>> +#define MT8365_MUTEX_MOD_DISP_WDMA0		11
>> +#define MT8365_MUTEX_MOD_DISP_COLOR0		12
>> +#define MT8365_MUTEX_MOD_DISP_CCORR		13
>> +#define MT8365_MUTEX_MOD_DISP_AAL		14
>> +#define MT8365_MUTEX_MOD_DISP_GAMMA		15
>> +#define MT8365_MUTEX_MOD_DISP_DITHER		16
>> +#define MT8365_MUTEX_MOD_DISP_DSI0		17
>> +#define MT8365_MUTEX_MOD_DISP_PWM0		20
>> +#define MT8365_MUTEX_MOD_DISP_DPI0		22
>> +
>>   #define MT2712_MUTEX_MOD_DISP_PWM2		10
>>   #define MT2712_MUTEX_MOD_DISP_OVL0		11
>>   #define MT2712_MUTEX_MOD_DISP_OVL1		12
>> @@ -315,6 +329,22 @@ static const unsigned int
>> mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>>   	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
>>   };
>>   
>> +static const unsigned int mt8365_mutex_mod[DDP_COMPONENT_ID_MAX] = {
>> +	[DDP_COMPONENT_AAL0] = MT8365_MUTEX_MOD_DISP_AAL,
>> +	[DDP_COMPONENT_CCORR] = MT8365_MUTEX_MOD_DISP_CCORR,
>> +	[DDP_COMPONENT_COLOR0] = MT8365_MUTEX_MOD_DISP_COLOR0,
>> +	[DDP_COMPONENT_DITHER] = MT8365_MUTEX_MOD_DISP_DITHER,
>> +	[DDP_COMPONENT_DPI0] = MT8365_MUTEX_MOD_DISP_DPI0,
>> +	[DDP_COMPONENT_DSI0] = MT8365_MUTEX_MOD_DISP_DSI0,
>> +	[DDP_COMPONENT_GAMMA] = MT8365_MUTEX_MOD_DISP_GAMMA,
>> +	[DDP_COMPONENT_OVL0] = MT8365_MUTEX_MOD_DISP_OVL0,
>> +	[DDP_COMPONENT_OVL_2L0] = MT8365_MUTEX_MOD_DISP_OVL0_2L,
>> +	[DDP_COMPONENT_PWM0] = MT8365_MUTEX_MOD_DISP_PWM0,
>> +	[DDP_COMPONENT_RDMA0] = MT8365_MUTEX_MOD_DISP_RDMA0,
>> +	[DDP_COMPONENT_RDMA1] = MT8365_MUTEX_MOD_DISP_RDMA1,
>> +	[DDP_COMPONENT_WDMA0] = MT8365_MUTEX_MOD_DISP_WDMA0,
>> +};
>> +
>>   static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
>>   	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
>>   	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
>> @@ -423,6 +453,14 @@ static const struct mtk_mutex_data
>> mt8195_mutex_driver_data = {
>>   	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
>>   };
>>   
>> +static const struct mtk_mutex_data mt8365_mutex_driver_data = {
>> +	.mutex_mod = mt8365_mutex_mod,
>> +	.mutex_sof = mt8183_mutex_sof,
>> +	.mutex_mod_reg = MT8183_MUTEX0_MOD0,
>> +	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
>> +	.no_clk = true,
>> +};
>> +
>>   struct mtk_mutex *mtk_mutex_get(struct device *dev)
>>   {
>>   	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
>> @@ -665,6 +703,8 @@ static const struct of_device_id
>> mutex_driver_dt_match[] = {
>>   	  .data = &mt8192_mutex_driver_data},
>>   	{ .compatible = "mediatek,mt8195-disp-mutex",
>>   	  .data = &mt8195_mutex_driver_data},
>> +	{ .compatible = "mediatek,mt8365-disp-mutex",
>> +	  .data = &mt8365_mutex_driver_data},
>>   	{},
>>   };
>>   MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
> 
