Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A36AC54F555
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBF811A727;
	Fri, 17 Jun 2022 10:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE12911A6E5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:26:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id a15so5185577wrh.2
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 03:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VoPEBTe8GIWOjbjulVhuWkgAmLX2oZ/qEHBUDv8Xq4A=;
 b=T8mspU3pKYdO8CUcvqthLXqrOQjJPUSkkv257NLusbuA8D/FXqWjAsPN4BlAbrUh18
 Iuj7wTUJYyyWy/R59XJTqtBCjIwAh/Zw766eyhjpZE27PfcPNEy9P8SxB+vzhrrvTyfI
 LalDITAZYpx+jrf26Z77xY913zVn716mxfAo9TRTUkwHbsNzzxMd8owSzazAfVmq+gaS
 RioAf09Li9mX5EhwESX9qKJ/anXW3aNmzNHTOaSJ29ICo3kL44+gmjDjYYnqCdizV9OA
 RmPsiJHvBjTysXlujz8NjWwuhk5U6NIfEBK9CBy9+SH/sbgoFVi8h2+igSYptJKqGSwa
 rLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VoPEBTe8GIWOjbjulVhuWkgAmLX2oZ/qEHBUDv8Xq4A=;
 b=3NP5i0LfrPTHfYXbEG5T+zQLITwcZyCTZRA1Lc7M9W0x1esM6Lv+2Jc0J75ReAHzU5
 v/GExDfAfQ0ATCjdkvbuS+BdktHAFrBCRddL/9XfPEtLGJSJFZlIm4/GGeZ2zVKg+vma
 Fn4+LBeDPoUD9aKrKVKsyHIt6A7ZXM25XQmKCzeAyIJ2Vd4Q782FLPqSklHZ1mMWQe/p
 rbvAX6lcYJJFRsQLJLxi9q5dE5gdG18pe+DeJYpQxKQoYLZO2T5Phkb5Rj8nCqPaFtUl
 cJqALffHpcUhE5/cM/J9pdgP4hYzHp5NPVXGxGk8mhQPJbyMEDYLSo1zkvcwNchpzZao
 8nYQ==
X-Gm-Message-State: AJIora91PdSl3TpotzIS7LJgEN/wTk1eDV5oTltHPX3MR8UmkwDlekRI
 7CfbkQPZDfwyPKfjcv5lHTY=
X-Google-Smtp-Source: AGRyM1v/yWcwiAGw1BrqNvRucAgFNGX7IUS4GB4H5cVgcY5uvNLqpVZZyYaS3ErTF+o1i11IIwOO8w==
X-Received: by 2002:a5d:5c04:0:b0:21a:23e0:6ba3 with SMTP id
 cc4-20020a5d5c04000000b0021a23e06ba3mr8861230wrb.71.1655461596259; 
 Fri, 17 Jun 2022 03:26:36 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a05600c220c00b0039c5b4ab1b0sm4774639wml.48.2022.06.17.03.26.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 03:26:35 -0700 (PDT)
Message-ID: <9f36c019-dff7-7fa8-b8c8-ed118cef716e@gmail.com>
Date: Fri, 17 Jun 2022 12:26:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 5/7] soc: mediatek: mt8365-mmsys: add DPI/HDMI display path
Content-Language: en-US
To: CK Hu <ck.hu@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 jitao.shi@mediatek.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
References: <20220530201436.902505-1-fparent@baylibre.com>
 <20220530201436.902505-5-fparent@baylibre.com>
 <3b5e4d1e3b8dd8593c4a0cf0edbb0cee4538fa8e.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <3b5e4d1e3b8dd8593c4a0cf0edbb0cee4538fa8e.camel@mediatek.com>
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



On 17/06/2022 07:53, CK Hu wrote:
> Hi, Fabien:
> 
> On Mon, 2022-05-30 at 22:14 +0200, Fabien Parent wrote:
>> Right now only the DSI path connections are described in the mt8365
>> mmsys driver. The external path will be DPI/HDMI. This commit adds
>> the connections for DPI/HDMI.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 


Applied, thanks!

>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> ---
>>   drivers/soc/mediatek/mt8365-mmsys.h | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/soc/mediatek/mt8365-mmsys.h
>> b/drivers/soc/mediatek/mt8365-mmsys.h
>> index 24129a6c25f8..7abaf048d91e 100644
>> --- a/drivers/soc/mediatek/mt8365-mmsys.h
>> +++ b/drivers/soc/mediatek/mt8365-mmsys.h
>> @@ -10,6 +10,9 @@
>>   #define MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN	0xf60
>>   #define MT8365_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0xf64
>>   #define MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0xf68
>> +#define MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL	0xfd0
>> +#define MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN		0xfd8
>> +#define MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00	0xfdc
>>   
>>   #define MT8365_RDMA0_SOUT_COLOR0			0x1
>>   #define MT8365_DITHER_MOUT_EN_DSI0			0x1
>> @@ -18,6 +21,10 @@
>>   #define MT8365_RDMA0_RSZ0_SEL_IN_RDMA0			0x0
>>   #define MT8365_DISP_COLOR_SEL_IN_COLOR0			0x0
>>   #define MT8365_OVL0_MOUT_PATH0_SEL			BIT(0)
>> +#define MT8365_RDMA1_SOUT_DPI0				0x1
>> +#define MT8365_DPI0_SEL_IN_RDMA1			0x0
>> +#define MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK		0x1
>> +#define MT8365_DPI0_SEL_IN_RDMA1			0x0
>>   
>>   static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] =
>> {
>>   	{
>> @@ -55,6 +62,21 @@ static const struct mtk_mmsys_routes
>> mt8365_mmsys_routing_table[] = {
>>   		MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN,
>>   		MT8365_RDMA0_RSZ0_SEL_IN_RDMA0,
>> MT8365_RDMA0_RSZ0_SEL_IN_RDMA0
>>   	},
>> +	{
>> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
>> +		MT8365_DISP_REG_CONFIG_DISP_LVDS_SYS_CFG_00,
>> +		MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK,
>> MT8365_LVDS_SYS_CFG_00_SEL_LVDS_PXL_CLK
>> +	},
>> +	{
>> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
>> +		MT8365_DISP_REG_CONFIG_DISP_DPI0_SEL_IN,
>> +		MT8365_DPI0_SEL_IN_RDMA1, MT8365_DPI0_SEL_IN_RDMA1
>> +	},
>> +	{
>> +		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
>> +		MT8365_DISP_REG_CONFIG_DISP_RDMA1_SOUT_SEL,
>> +		MT8365_RDMA1_SOUT_DPI0, MT8365_RDMA1_SOUT_DPI0
>> +	},
>>   };
>>   
>>   #endif /* __SOC_MEDIATEK_MT8365_MMSYS_H */
> 
