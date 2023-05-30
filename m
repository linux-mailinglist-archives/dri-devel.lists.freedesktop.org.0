Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51206716BA2
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 19:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037B210E0BD;
	Tue, 30 May 2023 17:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CE9910E0BD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 17:55:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UHsPtj030299; Tue, 30 May 2023 17:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8Y/2JgpkJ6x4T6pUMTX9PFkSR0ZlrMtocgjiRNfUQ+I=;
 b=XsvwH6GXw8vUlJtikDzHYzpkw8vnRqYw4tEtmEcUpnAD3sejvU4L46rBMwNvyudntsDD
 U+IPn3ogc7KYqKtrDxfpfB04VhuXrH2qjytDQ0+Nt8M273+YDdMQkfpBlxGxUSkugubB
 INXd/sT0s4OJcP//wJCtAeubDOof5V+BPepLcKixHsT7h2jKFeotFczZknzGiMGsvECs
 XUr6Hqz2/8qGOK2b3gXaYFys5uxhluH6DD0STWr36pL+KlXbgCNPv4g7zPzJN7ceneVj
 v2wDIw0mwUsT0Wojmr8SftHT1b0GOtS+TCJ+ZH5MTtjM0wA45kGMH98XwcH84Qr/kMYE 7A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qvv7nu0v6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 17:54:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34UHsqU3020458
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 17:54:52 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Tue, 30 May
 2023 10:54:17 -0700
Message-ID: <00d30c09-d622-11c1-2e07-44a798659982@quicinc.com>
Date: Tue, 30 May 2023 10:54:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH RFC 03/10] drm/panel: Add LGD panel driver for Sony Xperia
 XZ3
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-3-541c341d6bee@somainline.org>
 <ccc97880-8e74-b85b-9679-9c12c44c4b99@linaro.org>
 <71675a02-0801-62dc-2673-4a0907636b21@linaro.org>
 <CAA8EJpq=HZqiBZ6bpUNH47VmASuH+Mi5OD5BHmg0TPwtsKHf8w@mail.gmail.com>
 <oxgtbj7qmsdvz5gl4bud64jedmhdmvphjfge7uy6uwulefqfsa@pleslv2zgwbp>
 <ebc3ff33-6e4f-b107-33c6-f35b03307058@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <ebc3ff33-6e4f-b107-33c6-f35b03307058@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: MZW0XBke_CM3cyveuuOoLMbT1dgCVJho
X-Proofpoint-GUID: MZW0XBke_CM3cyveuuOoLMbT1dgCVJho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_13,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300143
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
Cc: neil.armstrong@linaro.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Jami
 Kettunen <jami.kettunen@somainline.org>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Caleb Connolly <caleb@connolly.tech>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/29/2023 3:18 PM, Dmitry Baryshkov wrote:
> On 30/05/2023 00:07, Marijn Suijten wrote:
>> On 2023-05-22 15:58:56, Dmitry Baryshkov wrote:
>>> On Mon, 22 May 2023 at 12:04, Neil Armstrong 
>>> <neil.armstrong@linaro.org> wrote:
>>>>
>>>> On 22/05/2023 03:16, Dmitry Baryshkov wrote:
>>>>> On 22/05/2023 00:23, Marijn Suijten wrote:
>>>>>> Sony provides an unlabeled LGD + Atmel maXTouch assembly in its 
>>>>>> Xperia
>>>>>> XZ3 (tama akatsuki) phone, with custom DCS commands to match.
>>>>>>
>>>>>> This panel features Display Stream Compression 1.1.
>>>>>>
>>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>>> ---
>>>>>>    drivers/gpu/drm/panel/Kconfig                   |  11 +
>>>>>>    drivers/gpu/drm/panel/Makefile                  |   1 +
>>>>>>    drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c | 362 
>>>>>> ++++++++++++++++++++++++
>>>>>>    3 files changed, 374 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/panel/Kconfig 
>>>>>> b/drivers/gpu/drm/panel/Kconfig
>>>>>> index 67ef898d133f2..18bd116e78a71 100644
>>>>>> --- a/drivers/gpu/drm/panel/Kconfig
>>>>>> +++ b/drivers/gpu/drm/panel/Kconfig
>>>>>> @@ -706,6 +706,17 @@ config DRM_PANEL_SONY_ACX565AKM
>>>>>>          Say Y here if you want to enable support for the Sony 
>>>>>> ACX565AKM
>>>>>>          800x600 3.5" panel (found on the Nokia N900).
>>>>>> +config DRM_PANEL_SONY_AKATSUKI_LGD
>>>>>> +    tristate "Sony Xperia XZ3 LGD panel"
>>>>>> +    depends on GPIOLIB && OF
>>>>>> +    depends on DRM_MIPI_DSI
>>>>>> +    depends on BACKLIGHT_CLASS_DEVICE
>>>>>> +    help
>>>>>> +      Say Y here if you want to enable support for the Sony 
>>>>>> Xperia XZ3
>>>>>> +      1440x2880@60 6.0" OLED DSI cmd mode panel produced by LG 
>>>>>> Display.
>>>>>> +
>>>>>> +      This panel uses Display Stream Compression 1.1.
>>>>>> +
>>>>>>    config DRM_PANEL_SONY_TD4353_JDI
>>>>>>        tristate "Sony TD4353 JDI panel"
>>>>>>        depends on GPIOLIB && OF
>>>>>> diff --git a/drivers/gpu/drm/panel/Makefile 
>>>>>> b/drivers/gpu/drm/panel/Makefile
>>>>>> index ff169781e82d7..85133f73558f3 100644
>>>>>> --- a/drivers/gpu/drm/panel/Makefile
>>>>>> +++ b/drivers/gpu/drm/panel/Makefile
>>>>>> @@ -71,6 +71,7 @@ obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7701) += 
>>>>>> panel-sitronix-st7701.o
>>>>>>    obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7703) += panel-sitronix-st7703.o
>>>>>>    obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) += 
>>>>>> panel-sitronix-st7789v.o
>>>>>>    obj-$(CONFIG_DRM_PANEL_SONY_ACX565AKM) += panel-sony-acx565akm.o
>>>>>> +obj-$(CONFIG_DRM_PANEL_SONY_AKATSUKI_LGD) += 
>>>>>> panel-sony-akatsuki-lgd.o
>>>>>>    obj-$(CONFIG_DRM_PANEL_SONY_TD4353_JDI) += panel-sony-td4353-jdi.o
>>>>>>    obj-$(CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521) += 
>>>>>> panel-sony-tulip-truly-nt35521.o
>>>>>>    obj-$(CONFIG_DRM_PANEL_TDO_TL070WSH30) += panel-tdo-tl070wsh30.o
>>>>>> diff --git a/drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c 
>>>>>> b/drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c
>>>>>> new file mode 100644
>>>>>> index 0000000000000..f55788f963dab
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/gpu/drm/panel/panel-sony-akatsuki-lgd.c
>>>>>> @@ -0,0 +1,362 @@
>>>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>>>> +/*
>>>>>> + * Copyright (c) 2023 Marijn Suijten <marijn.suijten@somainline.org>
>>>>>> + *
>>>>>> + * Based on Sony Downstream's "Atmel LGD ID5" Akatsuki panel dtsi.
>>>>>> + */
>>>>>> +
>>>>>> +#include <linux/backlight.h>
>>>>>> +#include <linux/delay.h>
>>>>>> +#include <linux/gpio/consumer.h>
>>>>>> +#include <linux/module.h>
>>>>>> +#include <linux/of.h>
>>>>>> +#include <linux/of_device.h>
>>>>>> +#include <linux/regulator/consumer.h>
>>>>>> +
>>>>>> +#include <video/mipi_display.h>
>>>>>> +
>>>>>> +#include <drm/drm_mipi_dsi.h>
>>>>>> +#include <drm/drm_modes.h>
>>>>>> +#include <drm/drm_panel.h>
>>>>>> +#include <drm/drm_probe_helper.h>
>>>>>> +#include <drm/display/drm_dsc.h>
>>>>>> +#include <drm/display/drm_dsc_helper.h>
>>>>>> +
>>>>>> +struct sony_akatsuki_lgd {
>>>>>> +    struct drm_panel panel;
>>>>>> +    struct mipi_dsi_device *dsi;
>>>>>> +    struct regulator *vddio;
>>>>>> +    struct gpio_desc *reset_gpio;
>>>>>> +    bool prepared;
>>>>>> +};
>>>>>> +
>>>>>> +static inline struct sony_akatsuki_lgd 
>>>>>> *to_sony_akatsuki_lgd(struct drm_panel *panel)
>>>>>> +{
>>>>>> +    return container_of(panel, struct sony_akatsuki_lgd, panel);
>>>>>> +}
>>>>>> +
>>>>>> +static int sony_akatsuki_lgd_on(struct sony_akatsuki_lgd *ctx)
>>>>>> +{
>>>>>> +    struct mipi_dsi_device *dsi = ctx->dsi;
>>>>>> +    struct device *dev = &dsi->dev;
>>>>>> +    int ret;
>>>>>> +
>>>>>> +    dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>>>>>> +
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x5a, 0x5a);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf1, 0x5a, 0x5a);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x5a, 0x5a);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0x02, 0x01);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0x59, 0x01);
>>>>>> +    /* Enable backlight control */
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 
>>>>>> BIT(5));
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0x57, 0x20, 0x80, 0xde, 0x60, 0x00);
>>>>>> +
>>>>>> +    ret = mipi_dsi_dcs_set_column_address(dsi, 0, 1440 - 1);
>>>>>> +    if (ret < 0) {
>>>>>> +        dev_err(dev, "Failed to set column address: %d\n", ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    ret = mipi_dsi_dcs_set_page_address(dsi, 0, 2880 - 1);
>>>>>> +    if (ret < 0) {
>>>>>> +        dev_err(dev, "Failed to set page address: %d\n", ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
>>>>>> +
>>>>>> +    ret = mipi_dsi_dcs_set_tear_on(dsi, 
>>>>>> MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>>>>>> +    if (ret < 0) {
>>>>>> +        dev_err(dev, "Failed to set tear on: %d\n", ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x5a, 0x5a);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf1, 0x5a, 0x5a);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x5a, 0x5a);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x03);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf6, 0x04);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x05);
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xf6, 0x01, 0x7f, 0x00);
>>>>>> +
>>>>>> +    ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>>>>>> +    if (ret < 0) {
>>>>>> +        dev_err(dev, "Failed to exit sleep mode: %d\n", ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>> +    msleep(120);
>>>>>> +
>>>>>> +    mipi_dsi_dcs_write_seq(dsi, 0xe3, 0xac, 0x19, 0x34, 0x14, 0x7d);
>>>>>> +
>>>>>> +    ret = mipi_dsi_dcs_set_display_on(dsi);
>>>>>> +    if (ret < 0) {
>>>>>> +        dev_err(dev, "Failed to turn display on: %d\n", ret);
>>>>>> +        return ret;
>>>>>> +    }
>>>>>
>>>>> My usual question: should the mipi_dsi_dcs_exit_sleep_mode() / 
>>>>> mipi_dsi_dcs_set_display_on() be moved from prepare() to enable() 
>>>>> part?
>>>>
>>>>
>>>> No, prepare is called before the video stream is started and when 
>>>> display is still in LPM mode and the mode hasn't been set.
>>>>
>>>
>>> Yes, that's my point. Shouldn't we enable the panel _after_ starting 
>>> the stream?
>>
>> I have never investigated what it takes to split these functions, but
>> some of these panels do show some corruption at startup which may be
>> circumvented by powering the panel on after starting the video stream?
>>
>> I'm just not sure where to make the split: downstream does describe a
>> qcom,mdss-dsi-on-command and qcom,mdss-dsi-post-panel-on-command, where
>> the latter only contains set_display_on() (not exit_sleep_mode()).
>> It is documented like:
>>
>>      same as "qcom,mdss-dsi-on-command" except commands are sent after
>>      displaying an image."
>>
>> So this seems like the right way to split them up, I'll test this out on
>> all submitted panel drivers.
> 
> Interesting enough, Neil suggested that sending all the commands during 
> pre_enable() is the correct sequence (especially for VIDEO mode panels), 
> since not all DSI hosts can send commands after switching to the VIDEO 
> mode.
> 

I agree with Neil here.

Yes, it does seem natural to think that sending the video stream before 
sending the on commands would avoid any potential corruption / garbage 
screen issues.

But even from panel side should allow that. I have seen panel ON 
sequences where some explicitly ask for ON commands before the video stream.

So, we cannot really generalize it and needs to be treated on a 
host-to-host and panel-to-panel basis.

