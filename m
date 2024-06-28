Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB80991BF82
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 15:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D0610E2FB;
	Fri, 28 Jun 2024 13:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="JtSd36/M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2537 seconds by postgrey-1.36 at gabe;
 Fri, 28 Jun 2024 13:29:17 UTC
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2A110E5E8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 13:29:17 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S8sB1T016273;
 Fri, 28 Jun 2024 14:46:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 qGjl6eaDmBGNoa5xPDUSWRlAlN5BydjJMGHNZtDEO74=; b=JtSd36/MXla3MJZo
 gL09bV0JtR3H1M4bdIwLdPzXRVxItr+zIDlXR7LdtOzuJWiY0WZPkSRkWHnfaPLy
 IQhqqknX6cOpVYDIzpVon3cBZkH3CbZ0p7OGJ42WVBUvfPxU04ckZfdoELqn4qzO
 1tReypOqHYbSB/LFGWv9PwRUv04NUEpAfzLjGTdVTGgjGFwUxIRAMbiWsPnLzcqQ
 TcRDpjs0w7vPxixS+h78M0BkR1iTzOieLHpKCAkKyNGrOJQ4VCUYMSkGCb3wIFtp
 e3eI/q64fR/j2LmaI7xy5FvP//16Gg4l2/3eDwTXkjgNKcFQ7dk1Rv95Rmk3w6+a
 9+cIKQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx860yxds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2024 14:46:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 839E74002D;
 Fri, 28 Jun 2024 14:46:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDD6B2248DA;
 Fri, 28 Jun 2024 14:45:35 +0200 (CEST)
Received: from [10.48.86.145] (10.48.86.145) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 28 Jun
 2024 14:45:35 +0200
Message-ID: <422a643f-1035-6be1-607c-85c43e2cf148@foss.st.com>
Date: Fri, 28 Jun 2024 14:45:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 3/3] drm/stm: ltdc: add lvds pixel clock
Content-Language: en-US
To: Yannick FERTRE <yannick.fertre@foss.st.com>, Raphael Gallais-Pou
 <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240226-lvds-v6-0-15e3463fbe70@foss.st.com>
 <20240226-lvds-v6-3-15e3463fbe70@foss.st.com>
 <7cdeaaab-ab8f-4b0c-89ec-cb61764a4abb@foss.st.com>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <7cdeaaab-ab8f-4b0c-89ec-cb61764a4abb@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.145]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_08,2024-06-28_01,2024-05-17_01
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


On 6/21/24 16:55, Yannick FERTRE wrote:
> Hi Raphaël,
> 
> Thanks for your patch, it will not merged due to a new clock management.
> 
> Philippe,
> 
> this patch will be replaced by another which manages all clocks that the 
> display controller
> 
>   will need (pixel clock, bus clock reference clock).

Hi Raphaël & Yannick,
I applied 1 & 2 on drm-misc-next.
Many thanks,
Philippe :-)


> 
> 
> Best regards
> 
> 
> Le 26/02/2024 à 11:48, Raphael Gallais-Pou a écrit :
>> The STM32MP25x display subsystem presents a mux which feeds the loopback
>> pixel clock of the current bridge in use into the LTDC. This mux is only
>> accessible through sysconfig registers which is not yet available in the
>> STM32MP25x common clock framework.
>>
>> While waiting for a complete update of the clock framework, this would
>> allow to use the LVDS.
>>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
>> ---
>> Changes in v2:
>>     - Fixed my address
>>     - Fixed smatch warning
>> ---
>>   drivers/gpu/drm/stm/ltdc.c | 19 +++++++++++++++++++
>>   drivers/gpu/drm/stm/ltdc.h |  1 +
>>   2 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
>> index 5576fdae4962..23011a8913bd 100644
>> --- a/drivers/gpu/drm/stm/ltdc.c
>> +++ b/drivers/gpu/drm/stm/ltdc.c
>> @@ -838,6 +838,12 @@ ltdc_crtc_mode_valid(struct drm_crtc *crtc,
>>       int target_max = target + CLK_TOLERANCE_HZ;
>>       int result;
>> +    if (ldev->lvds_clk) {
>> +        result = clk_round_rate(ldev->lvds_clk, target);
>> +        DRM_DEBUG_DRIVER("lvds pixclk rate target %d, available %d\n",
>> +                 target, result);
>> +    }
>> +
>>       result = clk_round_rate(ldev->pixel_clk, target);
>>       DRM_DEBUG_DRIVER("clk rate target %d, available %d\n", target, 
>> result);
>> @@ -1896,6 +1902,8 @@ void ltdc_suspend(struct drm_device *ddev)
>>       DRM_DEBUG_DRIVER("\n");
>>       clk_disable_unprepare(ldev->pixel_clk);
>> +    if (ldev->lvds_clk)
>> +        clk_disable_unprepare(ldev->lvds_clk);
>>   }
>>   int ltdc_resume(struct drm_device *ddev)
>> @@ -1910,6 +1918,13 @@ int ltdc_resume(struct drm_device *ddev)
>>           DRM_ERROR("failed to enable pixel clock (%d)\n", ret);
>>           return ret;
>>       }
>> +    if (ldev->lvds_clk) {
>> +        if (clk_prepare_enable(ldev->lvds_clk)) {
>> +            clk_disable_unprepare(ldev->pixel_clk);
>> +            DRM_ERROR("Unable to prepare lvds clock\n");
>> +            return -ENODEV;
>> +        }
>> +    }
>>       return 0;
>>   }
>> @@ -1981,6 +1996,10 @@ int ltdc_load(struct drm_device *ddev)
>>           }
>>       }
>> +    ldev->lvds_clk = devm_clk_get(dev, "lvds");
>> +    if (IS_ERR(ldev->lvds_clk))
>> +        ldev->lvds_clk = NULL;
>> +
>>       rstc = devm_reset_control_get_exclusive(dev, NULL);
>>       mutex_init(&ldev->err_lock);
>> diff --git a/drivers/gpu/drm/stm/ltdc.h b/drivers/gpu/drm/stm/ltdc.h
>> index 9d488043ffdb..4a60ce5b610c 100644
>> --- a/drivers/gpu/drm/stm/ltdc.h
>> +++ b/drivers/gpu/drm/stm/ltdc.h
>> @@ -44,6 +44,7 @@ struct ltdc_device {
>>       void __iomem *regs;
>>       struct regmap *regmap;
>>       struct clk *pixel_clk;    /* lcd pixel clock */
>> +    struct clk *lvds_clk;    /* lvds pixel clock */
>>       struct mutex err_lock;    /* protecting error_status */
>>       struct ltdc_caps caps;
>>       u32 irq_status;
>>
