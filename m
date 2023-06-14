Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B16367188BA
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 19:46:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B41410E501;
	Wed, 31 May 2023 17:46:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306CA10E4FF
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 17:46:16 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34VEn1Wt009755; Wed, 31 May 2023 17:46:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=GfS47MlQhdnYLMdpeAhkwO0njbnAka46cKgfupwXxys=;
 b=mDrpxBvmDY3BWCM5sn6YSyPiaqTmYQEPyv9oVEomwZUYM0hMwaajC1ki8I4sjEjomBWl
 pkcO9UaV1Mw9IIu31OFW2KB6mIZ6XDZcQH5M+L5zzmhfAgQy1tbUP+YsmYfc3WaOb2en
 mvSRL3eH4r1XsRIAHY6/tYZjEf3j0lqo2gGQWg8+dZwDo17/UeaiOd6ivKYyEuGlw3vW
 FYrrWDjga+1ZZZ1Ca5bZzFzeRwPUjCW43D5k/ghxxrjCxqjs4dkMCPT/yL4/lzHdTuVq
 HJ0RSeUCGkacXdq8e5ZALMonWFleSfEyZoyaX1C0IBUrgWK3pxtJCU8sDT2R5ldgh/8/ sA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qx39d17vb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 17:45:57 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34VHjuCG011521
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 31 May 2023 17:45:56 GMT
Received: from [10.71.110.193] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 31 May
 2023 10:45:55 -0700
Message-ID: <a8448fbc-ff62-0eca-66cc-a10a5e833926@quicinc.com>
Date: Wed, 31 May 2023 10:45:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] drm/panel: Add driver for Visionox r66451 panel
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230516-b4-r66451-panel-driver-v1-0-4210bcbb1649@quicinc.com>
 <20230516-b4-r66451-panel-driver-v1-2-4210bcbb1649@quicinc.com>
 <3cca2809-fa26-f0cf-2ccc-6737d150b43d@linaro.org>
 <aeef04c4-7952-2b7c-d673-5c75dda19154@quicinc.com>
 <196a43da-1f59-6213-7c4f-2cfcb8d39b32@quicinc.com>
 <f3908927-e9b7-c61e-d5e6-8223dfe45bf8@linaro.org>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <f3908927-e9b7-c61e-d5e6-8223dfe45bf8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 1mWDBebI_cJIctGiH_cB116TF9dR3UR3
X-Proofpoint-ORIG-GUID: 1mWDBebI_cJIctGiH_cB116TF9dR3UR3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_12,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310150
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/30/2023 4:12 PM, Dmitry Baryshkov wrote:
> On 30/05/2023 23:09, Jessica Zhang wrote:
>>
>>
>> On 5/18/2023 3:17 PM, Jessica Zhang wrote:
>>>
>>>
>>> On 5/17/2023 5:19 PM, Dmitry Baryshkov wrote:
>>>> On 16/05/2023 23:20, Jessica Zhang wrote:
>>>>> Add support for the 1080x2340 Visionox R66451 AMOLED DSI panel that
>>>>> comes with the Qualcomm HDK8350 display expansion pack.
>>>>>
>>>>> The panel enables display compression (DSC v1.2) by default.
>>>>>
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> ---
>>>>>   drivers/gpu/drm/panel/Kconfig                 |   8 +
>>>>>   drivers/gpu/drm/panel/Makefile                |   1 +
>>>>>   drivers/gpu/drm/panel/panel-visionox-r66451.c | 395 
>>>>> ++++++++++++++++++++++++++
>>>>>   3 files changed, 404 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panel/Kconfig 
>>>>> b/drivers/gpu/drm/panel/Kconfig
>>>>> index 29cf5fa39ff2..9c2c36dbddf3 100644
>>>>> --- a/drivers/gpu/drm/panel/Kconfig
>>>>> +++ b/drivers/gpu/drm/panel/Kconfig
>>>>> @@ -766,6 +766,14 @@ config DRM_PANEL_VISIONOX_VTDR6130
>>>>>         Say Y here if you want to enable support for Visionox
>>>>>         VTDR6130 1080x2400 AMOLED DSI panel.
>>>>> +config DRM_PANEL_VISIONOX_R66451
>>>>> +    tristate "Visionox R66451"
>>>>> +    depends on OF
>>>>> +    depends on DRM_MIPI_DSI
>>>>> +    help
>>>>> +      Say Y here if you want to enable support for Visionox
>>>>> +      R66451 1080x2340 AMOLED DSI panel.
>>>>> +
>>>>>   config DRM_PANEL_WIDECHIPS_WS2401
>>>>>       tristate "Widechips WS2401 DPI panel driver"
>>>>>       depends on SPI && GPIOLIB
>>>>> diff --git a/drivers/gpu/drm/panel/Makefile 
>>>>> b/drivers/gpu/drm/panel/Makefile
>>>>> index b3e8ba29edd3..e043a92ee676 100644
>>>>> --- a/drivers/gpu/drm/panel/Makefile
>>>>> +++ b/drivers/gpu/drm/panel/Makefile
>>>>> @@ -78,5 +78,6 @@ obj-$(CONFIG_DRM_PANEL_TPO_TPG110) += 
>>>>> panel-tpo-tpg110.o
>>>>>   obj-$(CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA) += panel-truly-nt35597.o
>>>>>   obj-$(CONFIG_DRM_PANEL_VISIONOX_RM69299) += panel-visionox-rm69299.o
>>>>>   obj-$(CONFIG_DRM_PANEL_VISIONOX_VTDR6130) += 
>>>>> panel-visionox-vtdr6130.o
>>>>> +obj-$(CONFIG_DRM_PANEL_VISIONOX_R66451) += panel-visionox-r66451.o
>>>>>   obj-$(CONFIG_DRM_PANEL_WIDECHIPS_WS2401) += panel-widechips-ws2401.o
>>>>>   obj-$(CONFIG_DRM_PANEL_XINPENG_XPP055C272) += 
>>>>> panel-xinpeng-xpp055c272.o
>>>>> diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c 
>>>>> b/drivers/gpu/drm/panel/panel-visionox-r66451.c
>>>>> new file mode 100644
>>>>> index 000000000000..e3648ead3e84
>>>>> --- /dev/null
>>>>> +++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
>>>>> @@ -0,0 +1,395 @@
>>>>> +//SPDX-License-Identifier: GPL-2.0-only
>>>>> +//Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
>>>>> reserved.
>>>>> +
>>>>> +#include <linux/backlight.h>
>>>>> +#include <linux/delay.h>
>>>>> +#include <linux/gpio/consumer.h>
>>>>> +#include <linux/module.h>
>>>>> +#include <linux/of.h>
>>>>> +#include <linux/regulator/consumer.h>
>>>>> +
>>>>> +#include <drm/drm_mipi_dsi.h>
>>>>> +#include <drm/drm_modes.h>
>>>>> +#include <drm/drm_panel.h>
>>>>> +#include <drm/display/drm_dsc.h>
>>>>> +#include <drm/display/drm_dsc_helper.h>
>>>>> +
>>>>> +#include <video/mipi_display.h>
>>>>> +
>>>>> +struct visionox_r66451 {
>>>>> +    struct drm_panel panel;
>>>>> +    struct mipi_dsi_device *dsi;
>>>>> +    struct gpio_desc *reset_gpio;
>>>>> +    struct regulator_bulk_data supplies[2];
>>>>> +    bool prepared, enabled;
>>>>> +};
>>>>> +
>>>>> +static inline struct visionox_r66451 *to_visionox_r66451(struct 
>>>>> drm_panel *panel)
>>>>> +{
>>>>> +    return container_of(panel, struct visionox_r66451, panel);
>>>>> +}
>>>>> +
>>>>> +static void visionox_r66451_reset(struct visionox_r66451 *ctx)
>>>>> +{
>>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>>>> +    usleep_range(10000, 10100);
>>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>>> +    usleep_range(10000, 10100);
>>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>>>>> +    usleep_range(10000, 10100);
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_on(struct visionox_r66451 *ctx)
>>>>> +{
>>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>>> +    struct device *dev = &dsi->dev;
>>>>> +    int ret;
>>>>> +
>>>>> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>>>>> +
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xc2,
>>>>> +                   0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, 0x00, 
>>>>> 0x00,
>>>>> +                   0x09, 0x3c);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd7,
>>>>> +                   0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 
>>>>> 0x0a,
>>>>> +                   0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>>> 0x19,
>>>>> +                   0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xde,
>>>>> +                   0x40, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 
>>>>> 0x18,
>>>>> +                   0x10, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x02, 
>>>>> 0x00, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe8, 0x00, 0x02);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x00, 0x08);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xc4,
>>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>>> 0x00,
>>>>> +                   0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x32);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xcf,
>>>>> +                   0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>>> 0x08,
>>>>> +                   0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, 0x01, 0x01, 
>>>>> 0x01,
>>>>> +                   0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd3,
>>>>> +                   0x45, 0x00, 0x00, 0x01, 0x13, 0x15, 0x00, 0x15, 
>>>>> 0x07,
>>>>> +                   0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, 0x11, 0x00, 
>>>>> 0xa0,
>>>>> +                   0x3c, 0x9c);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd7,
>>>>> +                   0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 
>>>>> 0x0a,
>>>>> +                   0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>>> 0x19,
>>>>> +                   0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xd8,
>>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>>> 0x00,
>>>>> +                   0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 
>>>>> 0x3a,
>>>>> +                   0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>>> 0x00,
>>>>> +                   0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 
>>>>> 0x00,
>>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>>> 0x0a,
>>>>> +                   0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xdf,
>>>>> +                   0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, 0x00, 0x00, 
>>>>> 0x00,
>>>>> +                   0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00, 0x00, 
>>>>> 0x00,
>>>>> +                   0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e, 0x00, 
>>>>> 0x00,
>>>>> +                   0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, 0xf1, 0x00, 
>>>>> 0x00,
>>>>> +                   0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x01);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x34, 0xb4, 0x00, 0x00, 
>>>>> 0x00, 0x39, 0x04, 0x09, 0x34);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x40);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x50, 0x00, 0x00, 0x00, 0x00);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x11);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x01, 0x00, 0x00, 0x00, 0x01);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x00, 0x02);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x19);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x42);
>>>>> +    mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>>>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, 
>>>>> 0x00, 0x04, 0x37);
>>>>
>>>> Please use mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
>>>
>>> Hi Dmitry,
>>>
>>> Acked.
>>>
>>>>
>>>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, 
>>>>> 0x00, 0x09, 0x23);
>>>>
>>>> mipi_dsi_dcs_set_page_address(dsi, 0, 2340 - 1);
>>>
>>> Acked.
>>>
>>>>
>>>>> +
>>>>> +    ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +    msleep(120);
>>>>> +
>>>>> +    ret = mipi_dsi_dcs_set_display_on(dsi);
>>>>
>>>> Should the mipi_dsi_dcs_set_display_on() (and maybe exit sleep mode) 
>>>> be a a part of _enable()? Correspondingly _off should IMO be a part 
>>>> of _disable callback().
>>>
>>> Acked. Looking at the downstream code, it seems that all the dcs on 
>>> commands can be sent within _enable() (and similarly for the off 
>>> commands with _disable()).
>>>
>>>>
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(dev, "Failed on set display on: %d\n", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +    msleep(20);
>>>>
>>>>
>>>> Do we need to add here the following line?
>>>>
>>>> dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>>
>>> Do you mean within the return on error block?
>>>
>>>  From my understanding, we should be setting the MIPI_DSI_MODE_LPM 
>>> for panel_on() then unsetting MODE_LPM in panel_off().
>>>
>>>>
>>>>
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_off(struct visionox_r66451 *ctx)
>>>>> +{
>>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>>> +    struct device *dev = &dsi->dev;
>>>>> +    int ret;
>>>>> +
>>>>> +    dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>>>>> +
>>>>> +    ret = mipi_dsi_dcs_set_display_off(dsi);
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(dev, "Failed to set display off: %d\n", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +    msleep(20);
>>>>> +
>>>>> +    ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
>>>>> +        return ret;
>>>>> +    }
>>>>> +    msleep(120);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_prepare(struct drm_panel *panel)
>>>>> +{
>>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>>> +    struct device *dev = &ctx->dsi->dev;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (ctx->prepared)
>>>>> +        return 0;
>>>>> +
>>>>> +    ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies),
>>>>> +                    ctx->supplies);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    visionox_r66451_reset(ctx);
>>>>> +
>>>>> +    ret = visionox_r66451_on(ctx);
>>>>> +    if (ret < 0) {
>>>>> +        dev_err(dev, "Failed to initialize panel: %d\n", ret);
>>>>> +        gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>>> +        regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), 
>>>>> ctx->supplies);
>>>>> +        return ret;
>>>>> +    }
>>>>> +
>>>>> +    ctx->prepared = true;
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_unprepare(struct drm_panel *panel)
>>>>> +{
>>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>>> +    struct device *dev = &ctx->dsi->dev;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (!ctx->prepared)
>>>>> +        return 0;
>>>>> +
>>>>> +    ret = visionox_r66451_off(ctx);
>>>>> +    if (ret < 0)
>>>>> +        dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
>>>>> +
>>>>> +    gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>>> +    regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>>>>> +
>>>>> +    ctx->prepared = false;
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct drm_display_mode visionox_r66451_mode = {
>>>>> +    .clock = (1080 + 95 + 1 + 40) * (2340 + 25 + 1 + 4) * 120 / 1000,
>>>>> +    .hdisplay = 1080,
>>>>> +    .hsync_start = 1080 + 95,
>>>>> +    .hsync_end = 1080 + 95 + 1,
>>>>> +    .htotal = 1080 + 95 + 1 + 40,
>>>>> +    .vdisplay = 2340,
>>>>> +    .vsync_start = 2340 + 25,
>>>>> +    .vsync_end = 2340 + 25 + 1,
>>>>> +    .vtotal = 2340 + 25 + 1 + 4,
>>>>> +    .width_mm = 0,
>>>>> +    .height_mm = 0,
>>>>
>>>> Please provide real values here.
>>>
>>> Acked.
>>>
>>>>
>>>>> +};
>>>>> +
>>>>> +static int visionox_r66451_enable(struct drm_panel *panel)
>>>>> +{
>>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>>> +    struct drm_dsc_picture_parameter_set pps;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (ctx->enabled)
>>>>> +        return 0;
>>>>> +
>>>>> +    if (!dsi->dsc) {
>>>>> +        dev_err(&dsi->dev, "DSC not attached to DSI\n");
>>>>> +        return -ENODEV;
>>>>> +    }
>>>>> +
>>>>> +    drm_dsc_pps_payload_pack(&pps, dsi->dsc);
>>>>> +    ret = mipi_dsi_picture_parameter_set(dsi, &pps);
>>>>> +
>>>>> +    ctx->enabled = true;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_disable(struct drm_panel *panel)
>>>>> +{
>>>>> +    struct visionox_r66451 *ctx = to_visionox_r66451(panel);
>>>>> +
>>>>> +    ctx->enabled = false;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int visionox_r66451_get_modes(struct drm_panel *panel,
>>>>> +                    struct drm_connector *connector)
>>>>> +{
>>>>> +    struct drm_display_mode *mode;
>>>>> +
>>>>> +    mode = drm_mode_duplicate(connector->dev, &visionox_r66451_mode);
>>>>> +    if (!mode)
>>>>> +        return -ENOMEM;
>>>>> +
>>>>> +    drm_mode_set_name(mode);
>>>>> +
>>>>> +    mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>>>>> +    connector->display_info.width_mm = mode->width_mm;
>>>>> +    connector->display_info.height_mm = mode->height_mm;
>>>>> +    drm_mode_probed_add(connector, mode);
>>>>
>>>> Can we use drm_connector_helper_get_modes_fixed() instead?
>>>
>>> Acked.
>>
>> Hi Dmitry,
>>
>> Just wanted to follow up on this -- As Marijn mentioned in a separated 
>> thread, DRM_MODE_TYPE_DRIVER is not set within 
>> drm_connector_helper_get_modes_fixed(), and looking at the kernel 
>> docs, that's a required flag for this mode.
> 
> You can set this flag in the visionox_r66451_mode, can you not?

Sure, I can set it during initialization then; just didn't see a 
precedent for it in existing drivers.

> 
>> Since I'm not able to set the *_TYPE_DRIVER flag before 
>> *_get_modes_fixed() is called, I'll stick to using the previous method 
>> of calling drm_mode_probed_add() directly in 
>> visionox_r66451_get_modes(). (FWIW, other drivers such as 
>> panel-visionox-vtdr6130, panel-truly-nt35597, and 
>> panel-visionox-rm69299 also don't use *_get_modes_fixed() and call 
>> drm_mode_probed_add() directly in their get_mode() implementations.)
> 
> That doesn't mean that we should increase the amount of the c&p code.
> 
> If I have time, I'try doing a rework of existing panel drivers.

Sounds good -- I think that would help get rid of a lot of duplicate code.

Thanks,

Jessica Zhang

> 
> -- 
> With best wishes
> Dmitry
> 
