Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F829968183
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 10:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 987DF10E245;
	Mon,  2 Sep 2024 08:18:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=tuxon.dev header.i=@tuxon.dev header.b="WW0rHhfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AB810E245
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 08:18:12 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so448353866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 01:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1725265091; x=1725869891; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FzIYeIsII8peMIhHeVjDubC4HaKpmyTvf1l2x00PtxI=;
 b=WW0rHhfn26W58nVR+O3PzDOY68o+PypmT+ICNU7XsyrchvoXfuvdIRll/1wlQPPC45
 TstN529UJqB2nhotcl1X91Er1Ct/4CemlXBY2tMSdH8p0JOYzIuwba/UfmGeeOwE2JS/
 JhHSeN/JoXrY7eXpWHCk4VoRBjr8ryRd8bmlA3A8e7anHn1QUDAdYXhHoZSP6nZHeXs2
 MBuxl3EVp5bWgaqEt+vTdfT5SAOfskkFwLM1njxyUpAthIIcECz5+tnEqGpucwnCTEL4
 kyNIxpVu+imkb68hB6R3cBXoOxk+PXKtPJBVkmfJNITg5uKuSXNBjr7ubYuqPwYA8GOe
 lqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725265091; x=1725869891;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FzIYeIsII8peMIhHeVjDubC4HaKpmyTvf1l2x00PtxI=;
 b=OBrs/CvOnMVD0/zgweFOYpKpJ9tmIBUrVi2WZZkyhcTBRYH0bujnEKJsUtB+RgBkLb
 rycLy9OBk4wsOU6sBN+hEvvvdGLUd1uqyCly1tAic/6CP8zCrv+vXr8A1odYl2sDBRYR
 +6Rw6ofGwn2bOlrbITSh2VThKx7H9rUSKCOkgg301/iOMPpot0sjNltO58aQuvJze6XB
 4Yaevq5SebJ3qcN+HuifeRTp+sihy9y7dcvFhqL5v0EiqRxcW8YSJAPQe9YLBhMtld0J
 gmsb6c9tWgPllIpntlIDDg88s6FkMzK61yKpzRklu4ZelsiXCROdPIZALl/sFi/MR6PG
 Vdkw==
X-Gm-Message-State: AOJu0YyGQd1BnjZGIqr/bpfltuYR0C9JC9MTJ4u2grUt6h7N2YF2pF/b
 /dzK6r2wZcuEAATc2+bVYH7LzQld3yFnc748hBx1iEdu2FvPsoreYVg19FqwXRw=
X-Google-Smtp-Source: AGHT+IGyjNuT3Jd8noH/CX8Q2yoyXx8AC5qPYwGuLTvAzr5k4aQrYpMhxUXeJClV7S//bvmU8bBW4A==
X-Received: by 2002:a17:907:7da4:b0:a86:91ae:85e7 with SMTP id
 a640c23a62f3a-a897f7892aemr1030001266b.8.1725265090514; 
 Mon, 02 Sep 2024 01:18:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196715sm521843366b.113.2024.09.02.01.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 01:18:09 -0700 (PDT)
Message-ID: <0dac055e-9d31-43ff-8584-57565f53e761@tuxon.dev>
Date: Mon, 2 Sep 2024 11:18:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/bridge: microchip-lvds: Revert
 clk_prepare_enable() in case of failure
Content-Language: en-US
To: Dharma.B@microchip.com, Manikandan.M@microchip.com,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 Hari.PrasathGE@microchip.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240827161223.4152195-1-claudiu.beznea@tuxon.dev>
 <20240827161223.4152195-2-claudiu.beznea@tuxon.dev>
 <b9b8494e-8606-4f40-87ad-797617b72d18@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <b9b8494e-8606-4f40-87ad-797617b72d18@microchip.com>
Content-Type: text/plain; charset=UTF-8
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



On 02.09.2024 07:39, Dharma.B@microchip.com wrote:
> On 27/08/24 9:42 pm, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> In case pm_runtime_get_sync() fails the clock remains enabled. Disable
>> it to save power on this failure scenario.
>>
>> Fixes: 179b0769fc5f ("drm/bridge: add lvds controller support for sam9x7")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Reviewed-and-tested-by: Dharma Balasubiramani <dharma.b@microchip.com>

This tag is not valid, AFAIK. You should use 2 different tags: Reviewed-by,
Tested-by

>> ---
>>   drivers/gpu/drm/bridge/microchip-lvds.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/bridge/microchip-lvds.c b/drivers/gpu/drm/bridge/microchip-lvds.c
>> index b8313dad6072..027292ab0197 100644
>> --- a/drivers/gpu/drm/bridge/microchip-lvds.c
>> +++ b/drivers/gpu/drm/bridge/microchip-lvds.c
>> @@ -125,6 +125,7 @@ static void mchp_lvds_enable(struct drm_bridge *bridge)
>>
>>          ret = pm_runtime_get_sync(lvds->dev);
>>          if (ret < 0) {
>> +               clk_disable_unprepare(lvds->pclk);
>>                  dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
>>                  return;
>>          }
>> --
>> 2.39.2
>>
> 
> 
