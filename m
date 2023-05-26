Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EC6712630
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 14:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6610110E7F6;
	Fri, 26 May 2023 12:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC9710E7F6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 May 2023 12:04:30 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34QB9RZk010987; Fri, 26 May 2023 14:04:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=m3cJVkCFNQF2leqnS9Qg9XF0d/nmB54SuFFqMjaXqbc=;
 b=RskGATPlhzQdHBxRTT8T+tyvofn6NYBLv46g3YoFniuh6BY4WVRBIbfgpFUcVJ9jPiqX
 ZjVtahK0Ista0dD/OP8cq6L/aG9qcwH/2+QslBnVgMSStLZndPrEvcEIpvtKqKbvb7U9
 kJFe7XKDnSqxtDscih73Nt4N7jXKs0a3ZKta5xerWJ62T/tQIel1mLMXWUEs8uzZTde5
 E5jbDCeVf6UpMQlgON54AOmshCvFjxlG+T2KVCbQiHBnKeRv6VCWAe/flR2mx01iFpmX
 SxCpfVoU12u9wbBW8/KWQqoRmrjwHNSM34aKXRbv1O5367+SVmtJdQp/7KMY0T4nc+05 /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qt2uyhjja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 May 2023 14:04:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5A02710002A;
 Fri, 26 May 2023 14:04:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5172C22A6FC;
 Fri, 26 May 2023 14:04:13 +0200 (CEST)
Received: from [10.48.0.148] (10.48.0.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 26 May
 2023 14:04:12 +0200
Message-ID: <d7fc3df2-aae7-d3b2-ea29-14d266289d1d@foss.st.com>
Date: Fri, 26 May 2023 14:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] backlight: gpio_backlight: add new property
 default-brightness-level
Content-Language: en-US
To: Alexandru Ardelean <alex@shruggie.ro>, <dri-devel@lists.freedesktop.org>, 
 <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-fbdev@vger.kernel.org>
References: <20230519200520.10657-1-alex@shruggie.ro>
From: Philippe CORNU <philippe.cornu@foss.st.com>
In-Reply-To: <20230519200520.10657-1-alex@shruggie.ro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.0.148]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_01,2023-05-25_03,2023-05-22_02
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
Cc: daniel.thompson@linaro.org, pavel@ucw.cz, jingoohan1@gmail.com,
 deller@gmx.de, lee@kernel.org, conor+dt@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Yannick Fertre <yannick.fertre@foss.st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/19/23 22:05, Alexandru Ardelean wrote:
> From: Yannick Fertre <yannick.fertre@foss.st.com>
> 
> Add new property to set a brightness by default at probe.
> 
> Reviewed-by: Philippe CORNU <philippe.cornu@foss.st.com>

Hi Alexandru,

Many thanks for your patch.

You have sent a patch originally pushed on the STMicroelectronics github 
as mentioned in your commit message (no problem with that :-). But, the 
"Reviewed-by" inside this github patch is linked to our gerrit STM 
internal server so you can not use it directly for mainlining this patch.

So please, re-send your this patch without my "Reviewed-by".

Many thanks
Philippe :-)


> Signed-off-by: Yannick Fertre <yannick.fertre@foss.st.com>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> ---
> 
> Link to original patch:
>    https://github.com/STMicroelectronics/linux/commit/c4067d7bd883c6fa14ffd49892c4ce663cdafe98
> 
>   drivers/video/backlight/gpio_backlight.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/backlight/gpio_backlight.c
> index 6f78d928f054..d3fa3a8bef4d 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -53,6 +53,7 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>   	struct backlight_device *bl;
>   	struct gpio_backlight *gbl;
>   	int ret, init_brightness, def_value;
> +	u32 value;
>   
>   	gbl = devm_kzalloc(dev, sizeof(*gbl), GFP_KERNEL);
>   	if (gbl == NULL)
> @@ -93,7 +94,11 @@ static int gpio_backlight_probe(struct platform_device *pdev)
>   	else
>   		bl->props.power = FB_BLANK_UNBLANK;
>   
> -	bl->props.brightness = 1;
> +	ret = device_property_read_u32(dev, "default-brightness-level", &value);
> +	if (!ret && value <= props.max_brightness)
> +		bl->props.brightness = value;
> +	else
> +		bl->props.brightness = 1;
>   
>   	init_brightness = backlight_get_brightness(bl);
>   	ret = gpiod_direction_output(gbl->gpiod, init_brightness);
