Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30BBFA38603
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:21:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ACA10E4F0;
	Mon, 17 Feb 2025 14:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RRUTEK29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 783B610E4F0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739802104;
 bh=oZecdUe41XdWFJFknyCy/hPSBOSYPV73o7AnHI9OXfA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RRUTEK29awJ47yUoFkLA7awL6WqsrV/ia5k8H4IOXeX0TC6RNioFVVm90iXWisEwq
 h/KYi6lJDxjwGL/7VMBDsGgb+ThXKuBeA6lqodzEwwDEzXV2OewfLD2Y+gFPoYm+kO
 O5jBrydtNwTenNq/+6w9Z6q2vsD+S/fcFsU5mEFGo24lb4ilwkCFmisw/6+ZHerOja
 XaZUSOVCHWV29pa+U79bkPTXU9PlqLEx5Cx4VfwkPdqaaK31NvtG7U29d7hZZTgUfp
 RM24YGpNeWakL4GfCHGPT4ftbHdUo40bixF6PLS50wq4o8Al4yT+TssZeAq+V/CzVH
 +3tEY1VIzLfTA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CFA5917E0CD1;
 Mon, 17 Feb 2025 15:21:42 +0100 (CET)
Message-ID: <c47aeed5-1375-4922-8abc-a59b4d060051@collabora.com>
Date: Mon, 17 Feb 2025 15:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 39/42] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "jie.qiu@mediatek.com" <jie.qiu@mediatek.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?=
 <jitao.shi@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?B?TGV3aXMgTGlhbyAo5buW5p+P6YieKQ==?= <Lewis.Liao@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?VG9tbXlZTCBDaGVuICjpmbPlvaXoia8p?= <TommyYL.Chen@mediatek.com>,
 =?UTF-8?B?SXZlcyBDaGVuamggKOmZs+S/iuW8mCk=?= <Ives.Chenjh@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "junzhi.zhao@mediatek.com" <junzhi.zhao@mediatek.com>
References: <20250211113409.1517534-1-angelogioacchino.delregno@collabora.com>
 <20250211113409.1517534-40-angelogioacchino.delregno@collabora.com>
 <b5f3242a065f74fb3be7a2e36f049c11f6d36b40.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b5f3242a065f74fb3be7a2e36f049c11f6d36b40.camel@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 17/02/25 04:41, CK Hu (胡俊光) ha scritto:
> On Tue, 2025-02-11 at 12:34 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Add support for the newer HDMI-TX (Encoder) v2 and DDC v2 IPs
>> found in MediaTek's MT8195, MT8188 SoC and their variants, and
>> including support for display modes up to 4k60 and for HDMI
>> Audio, as per the HDMI 2.0 spec.
>>
>> HDCP and CEC functionalities are also supported by this hardware,
>> but are not included in this commit and that also poses a slight
>> difference between the V2 and V1 controllers in how they handle
>> Hotplug Detection (HPD).
>>
>> While the v1 controller was using the CEC controller to check
>> HDMI cable connection and disconnection, in this driver the v2
>> one does not.
>>
>> This is due to the fact that on parts with v2 designs, like the
>> MT8195 SoC, there is one CEC controller shared between the HDMI
>> Transmitter (HDMI-TX) and Receiver (HDMI-RX): before eventually
>> adding support to use the CEC HW to wake up the HDMI controllers
>> it is necessary to have support for one TX, one RX *and* for both
>> at the same time.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/Kconfig            |    7 +
>>   drivers/gpu/drm/mediatek/Makefile           |    2 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |   10 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |    9 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c  |  397 ++++++
>>   drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h |  263 ++++
>>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      | 1368 +++++++++++++++++++
>>   7 files changed, 2056 insertions(+)
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
>>   create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
>>
>> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
>> index 994b48b82d44..c89ae4ed2c96 100644
>> --- a/drivers/gpu/drm/mediatek/Kconfig
>> +++ b/drivers/gpu/drm/mediatek/Kconfig
>> @@ -45,3 +45,10 @@ config DRM_MEDIATEK_HDMI
>>          select DRM_MEDIATEK_HDMI_COMMON
>>          help
>>            DRM/KMS HDMI driver for Mediatek SoCs
>> +
>> +config DRM_MEDIATEK_HDMI_V2
>> +       tristate "DRM HDMI v2 IP support for MediaTek SoCs"
>> +       depends on DRM_MEDIATEK
>> +       select DRM_MEDIATEK_HDMI_COMMON
>> +       help
>> +         DRM/KMS HDMI driver for MediaTek SoCs with HDMIv2 IP
>> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
>> index 78cf2d4fc85f..e0ac49b07d50 100644
>> --- a/drivers/gpu/drm/mediatek/Makefile
>> +++ b/drivers/gpu/drm/mediatek/Makefile
>> @@ -25,5 +25,7 @@ obj-$(CONFIG_DRM_MEDIATEK_HDMI_COMMON) += mtk_hdmi_common.o
>>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_cec.o
>>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi.o
>>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi_ddc.o
>> +obj-$(CONFIG_DRM_MEDIATEK_HDMI_V2) += mtk_hdmi_v2.o
>> +obj-$(CONFIG_DRM_MEDIATEK_HDMI_V2) += mtk_hdmi_ddc_v2.o
>>
>>   obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk_dp.o
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> index d58752b772e8..2f2e77b664a2 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>> @@ -294,10 +294,20 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
>>          if (ret)
>>                  return dev_err_probe(dev, ret, "Failed to get clocks\n");
>>
>> +
>> +       hdmi->irq = platform_get_irq(pdev, 0);
>> +       if (!hdmi->irq)
>> +               return hdmi->irq;
>> +
>>          hdmi->regs = device_node_to_regmap(dev->of_node);
>>          if (IS_ERR(hdmi->regs))
>>                  return PTR_ERR(hdmi->regs);
>>
>> +       /* Populate HDMI sub-devices if present */
>> +       ret = devm_of_platform_populate(&pdev->dev);
>> +       if (ret)
>> +               return ret;
> 
> Why need this? v1 driver works fine without this.
> 

That's used by v2 only, yes, that's true... the reason why this is here is that
if I move it to v2, we would have to run the entire probe sequence, and if we
get a probe deferral at that call, we have to tear down literally everything...

I'll move it anyway, it belongs to v2 after all.

>> +
>>          remote = of_graph_get_remote_node(np, 1, 0);
>>          if (!remote)
>>                  return -EINVAL;
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
>> index d3de8afff40f..e74fe1371324 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
>> @@ -126,6 +126,12 @@ struct hdmi_audio_param {
>>          struct hdmi_codec_params codec_params;
>>   };
>>
>> +enum hdmi_hpd_state {
>> +       HDMI_PLUG_OUT = 0,
>> +       HDMI_PLUG_IN_AND_SINK_POWER_ON,
>> +       HDMI_PLUG_IN_ONLY,
>> +};
>> +
>>   struct mtk_hdmi_ver_conf {
>>          const struct drm_bridge_funcs *bridge_funcs;
>>          const struct hdmi_codec_ops *codec_ops;
>> @@ -138,6 +144,7 @@ struct mtk_hdmi_conf {
>>          bool tz_disabled;
>>          bool cea_modes_only;
>>          unsigned long max_mode_clock;
>> +       u32 reg_hdmi_tx_cfg;
>>   };
>>
>>   struct mtk_hdmi {
>> @@ -160,6 +167,8 @@ struct mtk_hdmi {
>>          bool audio_enable;
>>          bool powered;
>>          bool enabled;
>> +       unsigned int irq;
>> +       enum hdmi_hpd_state hpd;
>>          hdmi_codec_plugged_cb plugged_cb;
>>          struct device *codec_dev;
>>          struct mutex update_plugged_status_lock;
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
>> new file mode 100644
>> index 000000000000..d88fc8a2d859
>> --- /dev/null
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c
>> @@ -0,0 +1,397 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MediaTek HDMI v2 Display Data Channel Driver
>> + *
>> + * Copyright (c) 2021 MediaTek Inc.
>> + * Copyright (c) 2021 BayLibre, SAS
>> + * Copyright (c) 2024 Collabora Ltd.
>> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/types.h>
>> +
>> +#include <drm/drm_edid.h>
>> +
>> +#include "mtk_hdmi_common.h"
>> +#include "mtk_hdmi_regs_v2.h"
>> +
>> +#define DDC2_DLY_CNT 572 /* BIM=208M/(v*4) = 90Khz */
>> +#define DDC2_DLY_CNT_EDID 832 /* BIM=208M/(v*4) = 62.5Khz */
>> +#define SI2C_ADDR_READ 0xf4
>> +#define SCDC_I2C_SLAVE_ADDRESS 0x54
>> +
>> +struct mtk_hdmi_ddc {
>> +       struct device *dev;
>> +       void __iomem *regs;
>> +       struct clk *clk;
>> +       struct i2c_adapter adap;
>> +       /* Serialize read/write operations */
>> +       struct mutex mtx;
>> +};
>> +
>> +static int mtk_ddc_check_and_rise_low_bus(struct mtk_hdmi_ddc *ddc)
>> +{
>> +       u32 val;
>> +
>> +       regmap_read(ddc->regs, HDCP2X_DDCM_STATUS, &val);
>> +       if (val & DDC_I2C_BUS_LOW) {
>> +               regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
>> +                                  FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_CLOCK_SCL));
>> +               usleep_range(250, 300);
>> +       }
>> +
>> +       if (val & DDC_I2C_NO_ACK) {
>> +               u32 ddc_ctrl, hpd_ddc_ctrl, hpd_ddc_status;
>> +
>> +               regmap_read(ddc->regs, DDC_CTRL, &ddc_ctrl);
>> +               regmap_read(ddc->regs, HPD_DDC_CTRL, &hpd_ddc_ctrl);
>> +               regmap_read(ddc->regs, HPD_DDC_STATUS, &hpd_ddc_status);
>> +       }
>> +
>> +       if (val & DDC_I2C_NO_ACK)
>> +               return -EIO;
>> +
>> +       return 0;
>> +}
>> +
>> +static int mtk_ddc_wr_one(struct mtk_hdmi_ddc *ddc, u16 addr_id,
>> +                         u16 offset_id, u8 wr_data)
>> +{
>> +       u32 val;
>> +       int ret;
>> +
>> +       /* If down, rise bus for write operation */
>> +       mtk_ddc_check_and_rise_low_bus(ddc);
>> +
>> +       regmap_update_bits(ddc->regs, HPD_DDC_CTRL, HPD_DDC_DELAY_CNT,
>> +                          FIELD_PREP(HPD_DDC_DELAY_CNT, DDC2_DLY_CNT));
>> +
>> +       regmap_write(ddc->regs, SI2C_CTRL,
>> +                    FIELD_PREP(SI2C_ADDR, SI2C_ADDR_READ) |
>> +                    FIELD_PREP(SI2C_WDATA, wr_data) |
>> +                    SI2C_WR);
>> +
>> +       regmap_write(ddc->regs, DDC_CTRL,
>> +                    FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_SEQ_WRITE) |
>> +                    FIELD_PREP(DDC_CTRL_DIN_CNT, 1) |
>> +                    FIELD_PREP(DDC_CTRL_OFFSET, offset_id) |
>> +                    FIELD_PREP(DDC_CTRL_ADDR, addr_id));
>> +       usleep_range(1000, 1250);
>> +
>> +       ret = regmap_read_poll_timeout(ddc->regs, HPD_DDC_STATUS, val,
>> +                                      !(val & DDC_I2C_IN_PROG), 500, 1000);
>> +       if (ret) {
>> +               dev_err(ddc->dev, "DDC I2C write timeout\n");
>> +               return ret;
>> +       }
>> +
>> +       /* The I2C bus might be down after WR operation: rise it again */
>> +       ret = mtk_ddc_check_and_rise_low_bus(ddc);
>> +       if (ret) {
>> +               dev_err(ddc->dev, "Error during write operation: No ACK\n");
>> +               return ret;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static int mtk_ddcm_read_hdmi(struct mtk_hdmi_ddc *ddc, u16 dly_cnt, u16 uc_dev,
>> +                             u8 addr, u8 *puc_value, u16 data_cnt)
>> +{
>> +       u16 i, loop_counter, temp_length, uc_idx;
>> +       u32 rem, uc_read_count, val;
>> +       int ret;
>> +
>> +       if (!puc_value || !data_cnt || !dly_cnt) {
> 
> dly_cnt is DDC2_DLY_CNT which is 572. So it would not be zero.
> Maybe you need not to pass dly_cnt in this function because it is a constant.

dly_cnt parameter removed, now a local variable.

> puc_value is &msg->buf[0]. It would not be zero.
> How could data_cnt be zero?

In case a HW fault that was not handled happened, that check prevents a potential
kernel panic, so I would keep it - it's not expensive to perform anyway.

Though, that's a duplicated check that can be removed because we're actually
doing that in fg_ddc_data_read(), yes.

> 
>> +               dev_err(ddc->dev, "Bad DDCM read request\n");
>> +               return 0;
>> +       }
>> +
>> +       mtk_ddc_check_and_rise_low_bus(ddc);
>> +
>> +       regmap_update_bits(ddc->regs, DDC_CTRL, DDC_CTRL_CMD,
>> +                          FIELD_PREP(DDC_CTRL_CMD, DDC_CMD_CLEAR_FIFO));
>> +
>> +       if (data_cnt >= 16) {
>> +               temp_length = 16;
>> +               loop_counter = data_cnt;
>> +
>> +               rem = do_div(loop_counter, temp_length);
>> +               if (rem)
>> +                       loop_counter++;
>> +       } else {
>> +               temp_length = data_cnt;
>> +               loop_counter = 1;
>> +       }
>> +
>> +       if (uc_dev >= DDC_ADDR && dly_cnt < DDC2_DLY_CNT_EDID)
> 
> dly_cnt is DDC2_DLY_CNT, so checking 'dly_cnt < DDC2_DLY_CNT_EDID' is redundant.

yeah saw that while actually changing dly_cnt to be a local variable,
that was bad :-)

> 
>> +               dly_cnt = DDC2_DLY_CNT_EDID;
>> +
>> +       regmap_update_bits(ddc->regs, HPD_DDC_CTRL, HPD_DDC_DELAY_CNT,
>> +                          FIELD_PREP(HPD_DDC_DELAY_CNT, dly_cnt));
>> +

..snip..

>> +
>> +       return uc_read_count;
>> +}
>> +
>> +static int mtk_hdmi_fg_ddc_data_read(struct mtk_hdmi_ddc *ddc, u16 b_dev,
>> +                                    u8 data_addr, u16 data_cnt, u8 *pr_data)
>> +{
>> +       int read_data_cnt;
>> +       u16 req_data_cnt;
>> +
>> +       if (!pr_data || !data_cnt)
>> +               return -EINVAL;
> 
> pr_data is &msg->buf[0]. It would not be zero.
> 

Same as the comment before, in case of an unhandled HW failure, this would avoid a
potential kernel panic, and it's not expensive at all to perform - at least, after
deduplicating I think it makes sense to keep.

>> +
>> +       req_data_cnt = U8_MAX - data_addr + 1;
>> +       if (req_data_cnt > data_cnt)
>> +               req_data_cnt = data_cnt;
> 
> The req_data_cnt calculation looks weird.
> Could you explain how this work?
> 

I'm extremely sorry, but I wrote this months ago and I can't find any notes about
this calculation... so... while that's a bit embarassing, no, I don't remember why
I did that.

I do remember that I ended up writing that after quite a bit of debugging though...

>> +
>> +       mutex_lock(&ddc->mtx);
> 
> I don't know why use mutex to protect this?
> The function is call by i2c_algorithm callback function and v1 does not use mutex.
> So I think this mutex is redundant.
> 

You're right, this mutex is not needed. I'll remove it.

>> +
>> +       regmap_set_bits(ddc->regs, HDCP2X_POL_CTRL, HDCP2X_DIS_POLL_EN);
>> +
>> +       read_data_cnt = mtk_ddcm_read_hdmi(ddc, DDC2_DLY_CNT, b_dev, data_addr,
>> +                                          pr_data, req_data_cnt);
>> +
>> +       mutex_unlock(&ddc->mtx);
>> +
>> +       if (read_data_cnt < 0)
>> +               return read_data_cnt;
>> +       else if (read_data_cnt != req_data_cnt)
>> +               return -EINVAL;
>> +
>> +       return 0;
>> +}
>> +
>> +static int mtk_hdmi_ddc_fg_data_write(struct mtk_hdmi_ddc *ddc, u16 b_dev,
>> +                                     u8 data_addr, u16 data_cnt, u8 *pr_data)
>> +{
>> +       int i = 0, ret;
>> +
>> +       mutex_lock(&ddc->mtx);
> 
> I don't know why use mutex to protect this?
> The function is call by i2c_algorithm callback function and v1 does not use mutex.
> So I think this mutex is redundant.
> 

Same, will remove.

>> +
>> +       regmap_set_bits(ddc->regs, HDCP2X_POL_CTRL, HDCP2X_DIS_POLL_EN);
>> +       do {
>> +               ret = mtk_ddc_wr_one(ddc, b_dev, data_addr + i, pr_data[i]);
>> +               if (ret)
>> +                       break;
>> +       } while (++i < data_cnt);
>> +
>> +       mutex_unlock(&ddc->mtx);
>> +
>> +       return ret;
>> +}
>> +
>> +static int mtk_hdmi_ddc_v2_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num)
>> +{
>> +       struct mtk_hdmi_ddc *ddc;
>> +       u8 offset = 0;
>> +       int i, ret;
>> +
>> +       if (!adapter || !adapter->algo_data || !msgs)
> 
> In v1, it does not check these. These checking may be redundant.
> 

Yeah that's redundant because __i2c_transfer in i2c-core-base does already check
if (WARN_ON(!msgs || num < 1))

Removed, thanks.

>> +               return -EINVAL;
>> +
>> +       ddc = adapter->algo_data;
>> +
>> +       for (i = 0; i < num; i++) {
>> +               struct i2c_msg *msg = &msgs[i];
>> +
>> +               if (!msg->buf) {
> 
> In v1, it does not check these. This checking may be redundant.
> 
>> +                       pr_err("XFER: No message buffer\n");

That pr_err is a leftover from development (which I have to fix and change to
dev_err() as appropriate), and that did happen: I have this print here because
I did manage to make it crash and panic with some fuzzing.

It's unlikely to happen with regular functioning, but still, it's really not
expensive to keep, might as well just keep it for safety.

>> +                       return -EINVAL;
>> +               }
>> +
>> +               if (msg->flags & I2C_M_RD) {
>> +                       /*
>> +                        * The underlying DDC hardware always issues a write request
>> +                        * that assigns the read offset as part of the read operation,
>> +                        * therefore, use the `offset` value assigned in the previous
>> +                        * write request from drm_edid
>> +                        */
>> +                       ret = mtk_hdmi_fg_ddc_data_read(ddc, msg->addr, offset,
>> +                                                       msg->len, &msg->buf[0]);
>> +                       if (ret)
>> +                               return ret;
>> +               } else {
>> +                       ret = mtk_hdmi_ddc_fg_data_write(ddc, msg->addr, msg->buf[0],
>> +                                                        msg->len - 1, &msg->buf[1]);
> 
> In v1, it does not use &msg->buf[1]. Add comment to explain why v2 use this.
> 

That's because v2 is simply different hardware, and I'm not sure what v1 does as
I didn't write that driver, but v2 needs the data related offset in a different
register, while v1 seems to interpret that internally.

I'm not sure what to write there, if not what I just wrote - and writing something
that compares drivers for two completely different pieces of hardware looks wrong,
as much as adding a message that describes how the i2c protocol actually works...
also because it's clearly visible how the buf[0] and buf[1] are mapped, as in, it
is evident that [0] contains the data offset and the actual data to write to that
addr starts at [1] and its length is (msg->len - 1) because msg->len counts from
buf[0] onwards; if we use [0] separately, as it needs to be set in the HW
registers at every write, it's normal that the actual data length is len - 1.

But then again, all of this is just how I2C works, so if anyone reads this and
gets unclear, it's just a matter of actually reading this driver, and if still
unclear, a matter of finding the i2c specification, which is public anyway.

>> +                       if (ret)
>> +                               return ret;
>> +
>> +                       /*
>> +                        * Store the offset value requested by drm_edid or by
>> +                        * scdc to use in subsequent read requests.
>> +                        */
>> +                       if ((msg->addr == DDC_ADDR || msg->addr == SCDC_I2C_SLAVE_ADDRESS) &&
>> +                           msg->len == 1) {
>> +                               offset = msg->buf[0];
>> +                       }
>> +               }
>> +       }
>> +
>> +       return i;
>> +}
>> +
>> +static u32 mtk_hdmi_ddc_v2_func(struct i2c_adapter *adapter)
>> +{
>> +       return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
>> +}
>> +
>> +static const struct i2c_algorithm mtk_hdmi_ddc_v2_algorithm = {
>> +       .master_xfer = mtk_hdmi_ddc_v2_xfer,
>> +       .functionality = mtk_hdmi_ddc_v2_func,
>> +};
>> +
>> +static int mtk_hdmi_ddc_v2_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct mtk_hdmi_ddc *ddc;
>> +       int ret;
>> +
>> +       ddc = devm_kzalloc(dev, sizeof(*ddc), GFP_KERNEL);
>> +       if (!ddc)
>> +               return -ENOMEM;
>> +
>> +       ddc->dev = dev;
>> +       ddc->regs = device_node_to_regmap(dev->parent->of_node);
>> +       if (IS_ERR_OR_NULL(ddc->regs))
>> +               return dev_err_probe(dev,
>> +                                    IS_ERR(ddc->regs) ? PTR_ERR(ddc->regs) : -EINVAL,
>> +                                    "Cannot get regmap\n");
>> +
>> +       ddc->clk = devm_clk_get_enabled(dev, NULL);
>> +       if (IS_ERR(ddc->clk))
>> +               return dev_err_probe(dev, PTR_ERR(ddc->clk), "Cannot get DDC clock\n");
>> +
>> +       mutex_init(&ddc->mtx);
>> +
>> +       strscpy(ddc->adap.name, "mediatek-hdmi-ddc-v2", sizeof(ddc->adap.name));
>> +       ddc->adap.owner = THIS_MODULE;
>> +       ddc->adap.algo = &mtk_hdmi_ddc_v2_algorithm;
>> +       ddc->adap.retries = 3;
>> +       ddc->adap.dev.of_node = dev->of_node;
>> +       ddc->adap.algo_data = ddc;
>> +       ddc->adap.dev.parent = &pdev->dev;
>> +
>> +       ret = devm_pm_runtime_enable(&pdev->dev);
>> +       if (ret)
>> +               return dev_err_probe(&pdev->dev, ret, "Cannot enable Runtime PM\n");
>> +
>> +       pm_runtime_get_sync(dev);
>> +
>> +       ret = devm_i2c_add_adapter(dev, &ddc->adap);
>> +       if (ret < 0)
>> +               return dev_err_probe(dev, ret, "Cannot add DDC I2C adapter\n");
>> +
>> +       platform_set_drvdata(pdev, ddc);
>> +       return 0;
>> +}
>> +
>> +static const struct of_device_id mtk_hdmi_ddc_v2_match[] = {
>> +       { .compatible = "mediatek,mt8195-hdmi-ddc" },
>> +       { /* sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, mtk_hdmi_ddc_v2_match);
>> +
>> +struct platform_driver mtk_hdmi_ddc_v2_driver = {
>> +       .probe = mtk_hdmi_ddc_v2_probe,
>> +       .driver = {
>> +               .name = "mediatek-hdmi-ddc-v2",
>> +               .of_match_table = mtk_hdmi_ddc_v2_match,
>> +       },
>> +};
>> +module_platform_driver(mtk_hdmi_ddc_v2_driver);
>> +
>> +MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
>> +MODULE_AUTHOR("Can Zeng <can.zeng@mediatek.com>");
>> +MODULE_DESCRIPTION("MediaTek HDMIv2 DDC Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
>> new file mode 100644
>> index 000000000000..521b35c7e14d
>> --- /dev/null
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h
>> @@ -0,0 +1,263 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */

..snip...

>> +
>> +#endif /* _MTK_HDMI_REGS_H */
>> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
>> new file mode 100644
>> index 000000000000..338a6dda2fd2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
>> @@ -0,0 +1,1368 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MediaTek HDMI v2 IP driver
>> + *
>> + * Copyright (c) 2022 MediaTek Inc.
>> + * Copyright (c) 2022 BayLibre, SAS
>> + * Copyright (c) 2024 Collabora Ltd.
>> + *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/debugfs.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/irq.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mutex.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +#include <linux/suspend.h>
>> +#include <linux/units.h>
>> +#include <linux/phy/phy.h>
>> +
>> +#include <drm/display/drm_hdmi_helper.h>
>> +#include <drm/display/drm_hdmi_state_helper.h>
>> +#include <drm/display/drm_scdc_helper.h>
>> +#include <drm/drm_edid.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_probe_helper.h>
>> +
>> +#include "mtk_hdmi_common.h"
>> +#include "mtk_hdmi_regs_v2.h"
>> +
>> +#define MTK_HDMI_V2_CLOCK_MIN  27000
>> +#define MTK_HDMI_V2_CLOCK_MAX  594000
>> +
>> +#define HPD_PORD_HWIRQS                (HTPLG_R_INT | HTPLG_F_INT | PORD_F_INT | PORD_R_INT)
>> +
>> +enum mtk_hdmi_v2_clk_id {
>> +       MTK_HDMI_V2_CLK_HDCP_SEL,
>> +       MTK_HDMI_V2_CLK_HDCP_24M_SEL,
>> +       MTK_HDMI_V2_CLK_VPP_SPLIT_HDMI,
>> +       MTK_HDMI_V2_CLK_HDMI_APB_SEL,
>> +       MTK_HDMI_V2_CLK_COUNT,
>> +};
>> +
>> +const char *const mtk_hdmi_v2_clk_names[MTK_HDMI_V2_CLK_COUNT] = {
>> +       [MTK_HDMI_V2_CLK_HDMI_APB_SEL] = "bus",
>> +       [MTK_HDMI_V2_CLK_HDCP_SEL] = "hdcp",
>> +       [MTK_HDMI_V2_CLK_HDCP_24M_SEL] = "hdcp24m",
>> +       [MTK_HDMI_V2_CLK_VPP_SPLIT_HDMI] = "hdmi-split",
>> +};
>> +
>> +static inline void mtk_hdmi_v2_hwirq_disable(struct mtk_hdmi *hdmi)
>> +{
>> +       regmap_write(hdmi->regs, TOP_INT_ENABLE00, 0);
>> +       regmap_write(hdmi->regs, TOP_INT_ENABLE01, 0);
>> +}
>> +
>> +static inline void mtk_hdmi_v2_enable_hpd_pord_irq(struct mtk_hdmi *hdmi, bool enable)
>> +{
>> +       if (enable)
>> +               regmap_set_bits(hdmi->regs, TOP_INT_ENABLE00, HPD_PORD_HWIRQS);
>> +       else
>> +               regmap_clear_bits(hdmi->regs, TOP_INT_ENABLE00, HPD_PORD_HWIRQS);
>> +}
>> +
>> +static inline void mtk_hdmi_v2_clear_hpd_pord_irq(struct mtk_hdmi *hdmi)
>> +{
> 
> This function is never used, so drop it.
> 

Thanks, didn't notice. Will remove.

>> +       regmap_set_bits(hdmi->regs, TOP_INT_CLR00, HPD_PORD_HWIRQS);
>> +       regmap_clear_bits(hdmi->regs, TOP_INT_CLR00, HPD_PORD_HWIRQS);
>> +}
>> +
>> +static inline void mtk_hdmi_v2_set_sw_hpd(struct mtk_hdmi *hdmi, bool enable)
>> +{
> 
> enable is always true, so remove it.
> 
>> +       if (enable) {
>> +               regmap_set_bits(hdmi->regs, hdmi->conf->reg_hdmi_tx_cfg, HDMITX_SW_HPD);
>> +               regmap_set_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_OVR);
>> +               regmap_set_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_SW);
>> +       } else {
>> +               regmap_clear_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_OVR);
>> +               regmap_clear_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_SW);
>> +               regmap_clear_bits(hdmi->regs, hdmi->conf->reg_hdmi_tx_cfg, HDMITX_SW_HPD);
>> +       }
>> +}
>> +

..snip..

>> +
>> +static void mtk_hdmi_yuv420_downsampling(struct mtk_hdmi *hdmi, bool enable)
> 
> enable is always false, so drop it.
> 

It's there because YUV420 is a TODO in the current HDMI State Helper code and
if we keep this there is a rather good chance that this will be used as soon
as someone implements YUV420 support in the HDMI State Helper code.

If we remove the enable param, whoever implements that support will have to
understand how the MediaTek hardware works, before doing that, or this driver
will simply get some random "hack" to ignore 420, making it sub-par yet again
like other MediaTek drivers, compared to the other drivers.

Those are the little things that will make the difference.

Besides - the compiler also knows that `enable` is always false and the other
part of the branch will be optimized out, if size and/or performance are your
concern.

>> +{
>> +       u32 val;
>> +
>> +       regmap_read(hdmi->regs, VID_DOWNSAMPLE_CONFIG, &val);
>> +
>> +       if (enable) {
>> +               regmap_set_bits(hdmi->regs, hdmi->conf->reg_hdmi_tx_cfg,
>> +                               HDMI_YUV420_MODE | HDMITX_SW_HPD);
>> +
>> +               val |= C444_C422_CONFIG_ENABLE | C422_C420_CONFIG_ENABLE;
>> +               val |= C422_C420_CONFIG_OUT_CB_OR_CR;
>> +               val &= ~C422_C420_CONFIG_BYPASS;
>> +               regmap_write(hdmi->regs, VID_DOWNSAMPLE_CONFIG, val);
>> +
>> +               regmap_set_bits(hdmi->regs, VID_OUT_FORMAT, OUTPUT_FORMAT_DEMUX_420_ENABLE);
>> +       } else {
>> +               regmap_update_bits(hdmi->regs, hdmi->conf->reg_hdmi_tx_cfg,
>> +                                  HDMI_YUV420_MODE | HDMITX_SW_HPD, HDMITX_SW_HPD);
> 
>  From the naming, HDMITX_SW_HPD has no relation with YUV420 downsampling.
> And there is another function to set HDMITX_SW_HPD, it's not necessary to set HDMITX_SW_HPD here.

That's right, will fix, thanks!

> 
>> +
>> +               val &= ~(C444_C422_CONFIG_ENABLE | C422_C420_CONFIG_ENABLE);
>> +               val &= ~C422_C420_CONFIG_OUT_CB_OR_CR;
>> +               val |= C422_C420_CONFIG_BYPASS;
>> +               regmap_write(hdmi->regs, VID_DOWNSAMPLE_CONFIG, val);
>> +
>> +               regmap_clear_bits(hdmi->regs, VID_OUT_FORMAT, OUTPUT_FORMAT_DEMUX_420_ENABLE);
>> +       }
>> +}
>> +
>> +static int mtk_hdmi_v2_setup_audio_infoframe(struct mtk_hdmi *hdmi)
>> +{
>> +       struct hdmi_codec_params *params = &hdmi->aud_param.codec_params;
>> +       struct hdmi_audio_infoframe frame;
>> +       u8 buffer[14];
>> +       ssize_t ret;
>> +
>> +       memcpy(&frame, &params->cea, sizeof(frame));
>> +
>> +       ret = hdmi_audio_infoframe_pack(&frame, buffer, sizeof(buffer));
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       mtk_hdmi_v2_hw_write_audio_infoframe(hdmi, buffer);
>> +
>> +       return 0;
>> +}
>> +
>> +static inline void mtk_hdmi_v2_hw_reset_av_mute_regs(struct mtk_hdmi *hdmi)
>> +{
> 
> This function is called only by mtk_hdmi_v2_hw_av_mute(), so merge this function into mtk_hdmi_v2_hw_av_mute().
> 
>> +       /* GCP packet */
>> +       regmap_clear_bits(hdmi->regs, TOP_CFG01, CP_CLR_MUTE_EN | CP_SET_MUTE_EN);
>> +       regmap_clear_bits(hdmi->regs, TOP_INFO_RPT, CP_RPT_EN);
> 
> This would finally be set, why clear?
> 
>> +       regmap_clear_bits(hdmi->regs, TOP_INFO_EN, CP_EN | CP_EN_WR);
> 
> Ditto.
> 

This function describes how we reset the HW state machine for the GCP packet's
AVMUTE info fields.

Besides describing for human readability:

If you don't stop packet send autorepeat, you get glitches, because the HW wants
to auto-resend the GCP frame without any request, and could result in sending GCP
data that is only partially configured (partial WR in FIFO during reconfiguration);

If you don't stop GCP infoframe sending, you get glitches, because the HW may get
a request from the sink for which will reply with sending a GCP infoframe;

If you don't stop GCP infoframe writing (by HW), you get glitches because the
HW may send an infoframe after a partial write during SET/CLR mute operation.


>> +}
>> +

..snip..

>> +
>> +static inline void mtk_hdmi_i2s_sck_edge_rise(struct mtk_hdmi *hdmi, bool rise)
> 
> rise is always true, so drop it.
> 
>> +{
>> +       if (rise)
>> +               regmap_set_bits(hdmi->regs, AIP_I2S_CTRL, SCK_EDGE_RISE);
>> +       else
>> +               regmap_clear_bits(hdmi->regs, AIP_I2S_CTRL, SCK_EDGE_RISE);
>> +}
>> +
>> +static inline void mtk_hdmi_i2s_cbit_order(struct mtk_hdmi *hdmi, unsigned int cbit)
> 
> cbit is always CBIT_ORDER_SAME, so drop it.
> 
>> +{
>> +       regmap_update_bits(hdmi->regs, AIP_I2S_CTRL, CBIT_ORDER_SAME, cbit);
>> +}
>> +
>> +static inline void mtk_hdmi_i2s_vbit(struct mtk_hdmi *hdmi, unsigned int vbit)
> 
> vbit is always 0, so drop it.
> 
>> +{
>> +       /* V bit: 0 for PCM, 1 for Compressed data */
>> +       regmap_update_bits(hdmi->regs, AIP_I2S_CTRL, VBIT_COMPRESSED, vbit);
>> +}
>> +
>> +static inline void mtk_hdmi_i2s_data_direction(struct mtk_hdmi *hdmi, unsigned int is_lsb)
> 
> is_lsb is always 0, so drop it.
> 
>> +{
>> +       regmap_update_bits(hdmi->regs, AIP_I2S_CTRL, I2S_DATA_DIR_LSB, is_lsb);
>> +}
>> +
>> +static inline void mtk_hdmi_v2_hw_audio_type(struct mtk_hdmi *hdmi, unsigned int spdif_i2s)
> 
> spdif_is2 is always HDMI_AUD_INPUT_I2S, so drop it.
> 
>> +{
>> +       regmap_update_bits(hdmi->regs, AIP_CTRL, SPDIF_EN, FIELD_PREP(SPDIF_EN, spdif_i2s));
>> +}
> 
> There is so many function just write one register,
> and these function is called only when audio input type is default.
> I think it's better to merge these function into one function for default audio input type.
> 

All those functions are here to improve human readability, avoiding to turn this
driver into a mess of register writes for apparently random reasons, and making
it easier to both understand what we're doing and how the registers are laid out.

External contributors won't have datasheets in their hands (besides, it's easier
even for the ones having them, as reading the driver gives more immediate info,
instead of having to open a doc with more than 3000 pages and search), and if
any bug appears at any point in time, keeping this driver nicely readable makes
it possible for those external contributors to *actually help* with fixing stuff.

Besides, all those are inline functions, and when there's only one possible value
the compilers will optimize the case, if performance and/or binary size are your
concern here.

By removing all those small inline functions, the only option would be to add
one comment for each regmap_update_bits() call... and when comments are too many,
the code starts getting a bit difficult to follow.

So, please, let's keep this driver (a bit more) understandable for everyone, not
just for MediaTek and me.

>> +
>> +static u8 mtk_hdmi_v2_get_i2s_ch_mapping(struct mtk_hdmi *hdmi, u8 channel_type)
>> +{
>> +       switch (channel_type) {
>> +       case HDMI_AUD_CHAN_TYPE_1_1:
>> +       case HDMI_AUD_CHAN_TYPE_2_1:
>> +               return 0x01;
>> +       case HDMI_AUD_CHAN_TYPE_3_0:
>> +               return 0x02;
>> +       case HDMI_AUD_CHAN_TYPE_3_1:
>> +               return 0x03;
>> +       case HDMI_AUD_CHAN_TYPE_3_0_LRS:
>> +       case HDMI_AUD_CHAN_TYPE_4_0:
>> +               return 0x08;
>> +       case HDMI_AUD_CHAN_TYPE_5_1:
>> +               return 0x0b;
>> +       case HDMI_AUD_CHAN_TYPE_4_1_CLRS:
>> +       case HDMI_AUD_CHAN_TYPE_6_0:
>> +       case HDMI_AUD_CHAN_TYPE_6_0_CS:
>> +       case HDMI_AUD_CHAN_TYPE_6_0_CH:
>> +       case HDMI_AUD_CHAN_TYPE_6_0_OH:
>> +       case HDMI_AUD_CHAN_TYPE_6_0_CHR:
>> +               return 0x0e;
>> +       case HDMI_AUD_CHAN_TYPE_1_0:
>> +       case HDMI_AUD_CHAN_TYPE_2_0:
>> +       case HDMI_AUD_CHAN_TYPE_3_1_LRS:
>> +       case HDMI_AUD_CHAN_TYPE_4_1:
>> +       case HDMI_AUD_CHAN_TYPE_5_0:
>> +       case HDMI_AUD_CHAN_TYPE_4_0_CLRS:
>> +       case HDMI_AUD_CHAN_TYPE_6_1:
>> +       case HDMI_AUD_CHAN_TYPE_6_1_CS:
>> +       case HDMI_AUD_CHAN_TYPE_6_1_CH:
>> +       case HDMI_AUD_CHAN_TYPE_6_1_OH:
>> +       case HDMI_AUD_CHAN_TYPE_6_1_CHR:
>> +       case HDMI_AUD_CHAN_TYPE_7_0:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_LH_RH:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_LSR_RSR:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_LC_RC:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_LW_RW:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_LSD_RSD:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_LHS_RHS:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_CS_CH:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_CS_OH:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_CS_CHR:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_CH_OH:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_CH_CHR:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_OH_CHR:
>> +       case HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS_LSR_RSR:
>> +       case HDMI_AUD_CHAN_TYPE_8_0_LH_RH_CS:
>> +       case HDMI_AUD_CHAN_TYPE_7_1:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_LH_RH:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_LSR_RSR:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_LC_RC:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_LW_RW:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_LSD_RSD:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_LHS_RHS:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_CS_CH:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_CS_OH:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_CS_CHR:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_CH_OH:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_CH_CHR:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_OH_CHR:
>> +       case HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS_LSR_RSR:
>> +       default:
>> +               return 0;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static inline void mtk_hdmi_v2_hw_i2s_ch_swap(struct mtk_hdmi *hdmi, unsigned char swapbit)
>> +{
> 
> swapbit is constant. So drop it.
> 

As for the others, this is done for human reaadability...

>> +       regmap_update_bits(hdmi->regs, AIP_SPDIF_CTRL, MAX_2UI_I2S_HI_WRITE,
>> +                          FIELD_PREP(MAX_2UI_I2S_HI_WRITE, swapbit));
>> +}
>> +

..snip..

>> +
>> +static void mtk_hdmi_v2_aud_set_sw_ncts(struct mtk_hdmi *hdmi,
>> +                                       struct drm_display_mode *display_mode)
>> +{
>> +       mtk_hdmi_v2_hw_ncts_enable(hdmi, false);
> 
> This function is called only by mtk_hdmi_v2_aud_output_config(),
> and mtk_hdmi_v2_aud_output_config() calls mtk_hdmi_v2_hw_ncts_enable(hdmi, true);
> so I think this mtk_hdmi_v2_hw_ncts_enable(hdmi, false) should also place in mtk_hdmi_v2_aud_output_config().
> After this, this function seems does only one thing and mtk_hdmi_v2_aud_output_config() should directly call mtk_hdmi_v2_hw_aud_set_ncts() and drop this function.
> 

That was messy, I agree, changed :-)

>> +       mtk_hdmi_v2_hw_aud_set_ncts(hdmi, hdmi->aud_param.codec_params.sample_rate,
>> +                                display_mode->clock);
>> +}
>> +
>> +static inline void mtk_hdmi_v2_hw_audio_input_enable(struct mtk_hdmi *hdmi, bool ena)
>> +{
> 
> ena is always true, so drop it.
> 
>> +       if (ena)
>> +               regmap_set_bits(hdmi->regs, AIP_CTRL, AUD_IN_EN);
>> +       else
>> +               regmap_clear_bits(hdmi->regs, AIP_CTRL, AUD_IN_EN);
>> +}
>> +
>> +static void mtk_hdmi_v2_aip_ctrl_init(struct mtk_hdmi *hdmi)
>> +{
>> +       regmap_set_bits(hdmi->regs, AIP_CTRL,
>> +                       AUD_SEL_OWRT | NO_MCLK_CTSGEN_SEL | MCLK_EN | CTS_REQ_EN);
>> +       regmap_clear_bits(hdmi->regs, AIP_TPI_CTRL, TPI_AUDIO_LOOKUP_EN);
>> +}
>> +
>> +static void mtk_hdmi_v2_audio_reset(struct mtk_hdmi *hdmi, bool reset)
>> +{
>> +       const u32 arst_bits = RST4AUDIO | RST4AUDIO_FIFO | RST4AUDIO_ACR;
>> +
>> +       if (reset)
>> +               regmap_set_bits(hdmi->regs, AIP_TXCTRL, arst_bits);
>> +       else
>> +               regmap_clear_bits(hdmi->regs, AIP_TXCTRL, arst_bits);
>> +}
>> +
>> +static void mtk_hdmi_v2_aud_output_config(struct mtk_hdmi *hdmi,
>> +                                         struct drm_display_mode *display_mode)
>> +{
>> +       mtk_hdmi_v2_hw_aud_mute(hdmi, true);
>> +       mtk_hdmi_v2_hw_aud_enable(hdmi, false);
>> +       mtk_hdmi_v2_audio_reset(hdmi, true);
>> +       mtk_hdmi_v2_aip_ctrl_init(hdmi);
>> +       mtk_hdmi_v2_aud_set_input(hdmi);
>> +       mtk_hdmi_v2_hw_aud_set_channel_status(hdmi);
>> +       mtk_hdmi_v2_setup_audio_infoframe(hdmi);
>> +       mtk_hdmi_v2_hw_audio_input_enable(hdmi, true);
>> +       mtk_hdmi_v2_audio_reset(hdmi, false);
>> +       mtk_hdmi_v2_aud_set_sw_ncts(hdmi, display_mode);
>> +
>> +       /* Wait for the HW to apply settings */
>> +       usleep_range(25, 50);
>> +
>> +       mtk_hdmi_v2_hw_ncts_enable(hdmi, true);
>> +       mtk_hdmi_v2_hw_aud_enable(hdmi, true);
> 
> In audio_startup() and audio_shutdown() also call mtk_hdmi_v2_hw_aud_enable(),
> and would them conflict?

No those wouldn't conflict.

What we're doing here is only temporarily disabling audio while we configure
the hardware, then we re-enable it - as that's the only way to prevent any
audio glitches which would happen during configuration.

Note that the audio may be shutdown and started up during the life of a plugged
in sink, and it's guaranteed that any calls involving output config, or startup
or shutdown are serialized, so there's never going to be any conflict.

> In v1 audio enable/disable is done in audio_startup() and audio_shutdown().
> Maybe removing audio enable/disable here would prevent conflict.
> 
>> +       mtk_hdmi_v2_hw_aud_mute(hdmi, false);
>> +}
>> +
>> +static void mtk_hdmi_v2_change_video_resolution(struct mtk_hdmi *hdmi)
>> +{
>> +       mtk_hdmi_v2_hw_reset(hdmi);
>> +       mtk_hdmi_v2_set_sw_hpd(hdmi, true);
>> +       udelay(2);
>> +
>> +       regmap_write(hdmi->regs, HDCP_TOP_CTRL, 0);
>> +
>> +       /* Enable HDCP reauthentication interrupt */
>> +       regmap_set_bits(hdmi->regs, TOP_INT_ENABLE00, HDCP2X_RX_REAUTH_REQ_DDCM_INT);
> 
> In isr, I does not see any thing about reauthentication, so this is not necessary to enable this interrupt.
> 

It's necessary because the hardware uses this one internally for the hotplug state
machine - if this is not enabled, there's no internal hotplug detection after cable
plug-in.

And yes, it's not handled by the driver, because the driver doesn't care, it's the
hardware that does: the hotplug is internally handled in the HDCP state machine.

>> +
>> +       /* Enable hotplug and pord interrupts */
>> +       mtk_hdmi_v2_enable_hpd_pord_irq(hdmi, true);
>> +
>> +       /* Force enabling HDCP HPD */
>> +       regmap_set_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_OVR);
>> +       regmap_set_bits(hdmi->regs, HDCP2X_CTRL_0, HDCP2X_HPD_SW);
>> +
>> +       /* Set 8 bits per pixel */
>> +       regmap_update_bits(hdmi->regs, TOP_CFG00, TMDS_PACK_MODE,
>> +                          FIELD_PREP(TMDS_PACK_MODE, TMDS_PACK_MODE_8BPP));
>> +       /* Disable generating deepcolor packets */
>> +       regmap_clear_bits(hdmi->regs, TOP_CFG00, DEEPCOLOR_PKT_EN);
>> +       /* Disable adding deepcolor information to the general packet */
>> +       regmap_clear_bits(hdmi->regs, TOP_MISC_CTLR, DEEP_COLOR_ADD);
>> +
>> +       if (hdmi->curr_conn->display_info.is_hdmi)
>> +               regmap_set_bits(hdmi->regs, TOP_CFG00, HDMI_MODE_HDMI);
>> +       else
>> +               regmap_clear_bits(hdmi->regs, TOP_CFG00, HDMI_MODE_HDMI);
>> +
>> +       udelay(5);
>> +       mtk_hdmi_v2_hw_vid_mute(hdmi, true);
>> +       mtk_hdmi_v2_hw_aud_mute(hdmi, true);
>> +       mtk_hdmi_v2_hw_av_mute(hdmi, false);
> 
> I'm confused with these three statement.
> mtk_hdmi_v2_hw_vid_mute(true) would mute video.
> mtk_hdmi_v2_hw_aud_mute(hdmi, true) would mute audio.
> mtk_hdmi_v2_hw_av_mute(hdmi, false) would let video and audio unmute?

vid_mute would mute video - makes the HW to constantly send the data contained
into TOP_VMUTE_CFG1/2's reg_d_mute_r, vmute_data_b, vmute_data_g (which is zero
by default - so, it's a black image).

aud_mute would mute audio - makes the AIP HW to constantly send empty (0x0) data.

av_mute would set the AVMUTE info field(s) in theGeneral Control Packet (GCP),
as dictated by the HDMI specification, which is optional (but checked in the
HDMI compliance tests..!).

> This looks weird.

I agree it's really weird, I'll change av_mute to gcp_set_av_mute, so that becomes

mtk_hdmi_v2_hw_gcp_avmute(hdmi, false);

> Add comment to describe why doing this.
> 
>> +
>> +       regmap_update_bits(hdmi->regs, TOP_CFG01,
>> +                          NULL_PKT_VSYNC_HIGH_EN | NULL_PKT_EN, NULL_PKT_VSYNC_HIGH_EN);
>> +       usleep_range(100, 150);
>> +
>> +       /* Enable scrambling if tmds clock is 340MHz or more */
>> +       mtk_hdmi_v2_enable_scrambling(hdmi, hdmi->mode.clock >= 340 * KILO);
>> +
>> +       /* Disable YUV420 downsampling */
>> +       mtk_hdmi_yuv420_downsampling(hdmi, false);
>> +}
>> +
>> +static void mtk_hdmi_v2_output_set_display_mode(struct mtk_hdmi *hdmi,
>> +                                               struct drm_display_mode *mode)
>> +{
>> +       union phy_configure_opts opts = {
>> +               .dp = { .link_rate = hdmi->mode.clock * KILO }
>> +       };
>> +       int ret;
>> +
>> +       ret = phy_configure(hdmi->phy, &opts);
>> +       if (ret)
>> +               dev_err(hdmi->dev, "Setting clock=%d failed: %d", mode->clock, ret);
>> +
>> +       mtk_hdmi_v2_change_video_resolution(hdmi);
>> +       mtk_hdmi_v2_aud_output_config(hdmi, mode);
>> +}
>> +
>> +static int mtk_hdmi_v2_clk_enable(struct mtk_hdmi *hdmi)
>> +{
>> +       int ret;
>> +
>> +       ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_SEL]);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_24M_SEL]);
>> +       if (ret)
>> +               goto disable_hdcp_clk;
>> +
>> +       ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_V2_CLK_HDMI_APB_SEL]);
>> +       if (ret)
>> +               goto disable_hdcp_24m_clk;
>> +
>> +       ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_V2_CLK_VPP_SPLIT_HDMI]);
>> +       if (ret)
>> +               goto disable_bus_clk;
>> +
>> +       return 0;
>> +
>> +disable_bus_clk:
>> +       clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDMI_APB_SEL]);
>> +disable_hdcp_24m_clk:
>> +       clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_24M_SEL]);
>> +disable_hdcp_clk:
>> +       clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_SEL]);
>> +
>> +       return ret;
>> +}
>> +
>> +static void mtk_hdmi_v2_clk_disable(struct mtk_hdmi *hdmi)
>> +{
>> +       clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_VPP_SPLIT_HDMI]);
>> +       clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDMI_APB_SEL]);
>> +       clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_24M_SEL]);
>> +       clk_disable_unprepare(hdmi->clk[MTK_HDMI_V2_CLK_HDCP_SEL]);
>> +}
>> +
>> +static void mtk_hdmi_hpd_event(enum hdmi_hpd_state hpd, struct device *dev)
>> +{
>> +       struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>> +
>> +       if (hdmi && hdmi->bridge.encoder && hdmi->bridge.encoder->dev)
>> +               drm_helper_hpd_irq_event(hdmi->bridge.encoder->dev);
> 
> This function just do one thing and is called only by isr thread, so merge this function into isr thread.
> 

Yeah that's a leftover - it was called in multple places before I cleaned up
some stuff in here.

I'll move that code in the ISR thread, thanks for pointing that out.

>> +}
>> +
>> +static enum hdmi_hpd_state mtk_hdmi_v2_hpd_pord_status(struct mtk_hdmi *hdmi)
>> +{
>> +       u8 hpd_pin_sta, pord_pin_sta;
>> +       u32 hpd_status;
>> +
>> +       regmap_read(hdmi->regs, HPD_DDC_STATUS, &hpd_status);
>> +       hpd_pin_sta = FIELD_GET(HPD_PIN_STA, hpd_status);
>> +       pord_pin_sta = FIELD_GET(PORD_PIN_STA, hpd_status);
>> +
>> +       if (hpd_pin_sta && pord_pin_sta)
>> +               return HDMI_PLUG_IN_AND_SINK_POWER_ON;
>> +       else if (hpd_pin_sta)
>> +               return HDMI_PLUG_IN_ONLY;
> 
> I'm not sure why need this state?
> HDMI_PLUG_IN_ONLY is plugged in or not plugged in?

It's plugged in, but the sink is powered off: this means that we are waiting for
the sink to power on in order to continue with hotplug handling.

This is not important for the HDMI driver itself, but other DRM connectors in the
pipeline, which may have the DRM_CONNECTOR_POLL_HPD flag, need this for their own
handling.

I can make multiple different examples, but I'll do just one:
For example, a board not using the MTK IP internal DDC, but an external one and
perhaps even with its own HPD pin, may need to enable a power pin when the HDMI
cable is inserted, or may need programming/commands, to power on the sink.

> In audio_hook_plugged_cb, HDMI_PLUG_IN_ONLY is not plugged.

Yes, because audio cannot work if the SINK is not powered on: once this driver
is picked and reaches upstream, I'm planning to simplify it by using the new
helpers for HDMI(/dp) audio (which require a bit of testing, and that's why I
am not willing to do that for the first version of this driver landing upstream).

That will also make it clearer that audio has a different handling, as in, the
sink must be powered on in order to get audio functionality.

> In bridge_detect, it's connected (plugged in)
> This is really confused.
> I think we just need two status: one for plug in and one for plug out.
> 

Using only two statuses for this will make handling other external connectors
*much* more complicated than how it is right now: we're lucky that MediaTek
thought about this and implemented it in the HDMIv2 IP, and since we are, we
might as well use that :-)

>> +       else
>> +               return HDMI_PLUG_OUT;
>> +}
>> +
>> +static irqreturn_t mtk_hdmi_v2_isr(int irq, void *arg)
>> +{
>> +       struct mtk_hdmi *hdmi = arg;
>> +       unsigned int irq_sta;
>> +       int ret = IRQ_HANDLED;
>> +
>> +       regmap_read(hdmi->regs, TOP_INT_STA00, &irq_sta);
>> +
>> +       /* Handle Hotplug Detection interrupt */
>> +       if (irq_sta & (HTPLG_R_INT | HTPLG_F_INT | PORD_F_INT | PORD_R_INT)) {
> 
> if (irq_sta & HPD_PORD_HW_IRQS)
> 
>> +               mtk_hdmi_v2_enable_hpd_pord_irq(hdmi, false);
> 
> I think you should not dynamic enable/disable hotplug interrupt.
> In one case that user plug in, isr is called and disable interrupt here,
> then in __mtk_hdmi_v2_isr_thread(), call mtk_hdmi_v2_hpd_pord_status() and status is plug in,
> but then user plug out immediately before tk_hdmi_v2_enable_hpd_pord_irq(hdmi, true),
> so the plug out interrupt is missed and driver thought it's plug in.
> Generally, in probe function enable the interrupt and not dynamically enable/disable it.
> 

The reason why the interrupt is disabled here is that this is a threaded interrupt:
if the interrupt flips, the ISR is called again and the thread is rescheduled - and
we don't want that to happen.

So, This is here to control the flow, as in, the interrupt fires - we disable it
until we are able to run the *actual hotplug detection*: mtk_hdmi_v2_isr_thread()
is called after this, and after performing hotplug detection (during which time
if the user unplugs and/or replugs the cable, we're still able to detect that
because the HW is performing detection at that time), we are re-enabling the
interrupt.

This way, it also becomes clear that noone is polling the cable detection registers
during regular function, and that the actual detection is called only due to the
interrupt firing.

There is no risk of losing status here - or, if any, it's a window of just a few
nanoseconds and only after detection is fully determined and complete.

>> +               ret = IRQ_WAKE_THREAD;
>> +       }
>> +
>> +       /*
>> +        * Clear all 32 + 19 interrupts in CLR00 and CLR01: this is important
>> +        * to avoid unwanted retriggering of any interrupts
>> +        */

The first paragraph of what I wrote there is also kind-of-explicitly described
in the comment up there ;-)

>> +       regmap_write(hdmi->regs, TOP_INT_CLR00, GENMASK(31, 0));
>> +       regmap_write(hdmi->regs, TOP_INT_CLR01, GENMASK(18, 0));
> 
> You never enable interrupt in TOP_INT_ENABLE01,
> so it's not necessary to clear TOP_INT_CLR01.
> 
>> +
>> +       /* Restore interrupt clearing registers to zero */
>> +       regmap_write(hdmi->regs, TOP_INT_CLR00, 0);
>> +       regmap_write(hdmi->regs, TOP_INT_CLR01, 0);
>> +
>> +       return ret;
>> +}
>> +
>> +static irqreturn_t __mtk_hdmi_v2_isr_thread(struct mtk_hdmi *hdmi)
>> +{
>> +       enum hdmi_hpd_state hpd;
>> +
>> +       hpd = mtk_hdmi_v2_hpd_pord_status(hdmi);
>> +       if (hpd != hdmi->hpd) {
>> +               hdmi->hpd = hpd;
>> +               mtk_hdmi_hpd_event(hpd, hdmi->dev);
>> +       }
>> +
>> +       mtk_hdmi_v2_enable_hpd_pord_irq(hdmi, true);
>> +       return IRQ_HANDLED;
>> +}
>> +
>> +static irqreturn_t mtk_hdmi_v2_isr_thread(int irq, void *arg)
>> +{
>> +       struct mtk_hdmi *hdmi = arg;
>> +
>> +       /*
>> +        * Debounce HDMI monitor HPD status.
>> +        * Empirical testing shows that 30ms is enough wait
>> +        */
>> +       msleep(30);
>> +
>> +       return __mtk_hdmi_v2_isr_thread(hdmi);
>> +}
>> +
>> +static int mtk_hdmi_v2_enable(struct mtk_hdmi *hdmi)
>> +{
>> +       bool was_active = pm_runtime_active(hdmi->dev);
> 
> When will it enable twice?
> 

This is a way to avoid adding/using more members to struct mtk_hdmi to track
if this function was ever called (if the hw is on or off), and...

That's necessary because .hpd_enable() may resume the hardware for handling
the HPD (as much as .hpd_disable() may try to disable the HW for HPD done
case).

Note that there's no conflict then, because we reset the HW only if it really
is a poweron and not if the HW was powered on before; in case it was already
powered on when this function gets called, it was_active, so we don't reset
the HW, and we don't lose status.

...and that's why this is here :-)

>> +       int ret;
>> +
>> +       ret = pm_runtime_resume_and_get(hdmi->dev);
>> +       if (ret) {
>> +               dev_err(hdmi->dev, "Cannot resume HDMI\n");
>> +               return ret;
>> +       }
>> +
>> +       mtk_hdmi_v2_clk_enable(hdmi);
> 
> Check return value.
> 

...and also pm_runtime_put (async) if this failed, yes, done, thanks!

>> +       if (!was_active) {
>> +               mtk_hdmi_v2_hw_reset(hdmi);
>> +               mtk_hdmi_v2_set_sw_hpd(hdmi, true);
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static void mtk_hdmi_v2_disable(struct mtk_hdmi *hdmi)
>> +{
>> +       mtk_hdmi_v2_clk_disable(hdmi);
>> +       pm_runtime_put_sync(hdmi->dev);
>> +}
>> +
>> +/*
>> + * Bridge callbacks
>> + */
>> +
>> +static int mtk_hdmi_v2_bridge_attach(struct drm_bridge *bridge,
>> +                                    enum drm_bridge_attach_flags flags)
>> +{
>> +       struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>> +       int ret;
>> +
>> +       if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
>> +               DRM_ERROR("The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n");
>> +               return -EINVAL;
>> +       }
>> +       if (hdmi->next_bridge) {
>> +               ret = drm_bridge_attach(bridge->encoder, hdmi->next_bridge, bridge, flags);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +

CK: hdmi_v2_enable

>> +       ret = mtk_hdmi_v2_enable(hdmi);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* Enable Hotplug and Pord pins internal debouncing */
>> +       regmap_set_bits(hdmi->regs, HPD_DDC_CTRL,
>> +                       HPD_DDC_HPD_DBNC_EN | HPD_DDC_PORD_DBNC_EN);
>> +
>> +       irq_clear_status_flags(hdmi->irq, IRQ_NOAUTOEN);
>> +       enable_irq(hdmi->irq);
>> +
>> +       /*
>> +        * Check if any HDMI monitor was connected before probing this driver
>> +        * and/or attaching the bridge, without debouncing: if so, we want to
>> +        * notify the DRM so that we start outputting an image ASAP.
>> +        * Note that calling the ISR thread function will also perform a HW
>> +        * registers write that enables both the HPD and Pord interrupts.
>> +        */
>> +       __mtk_hdmi_v2_isr_thread(hdmi);
>> +

...and hdmi_v2_disable() .... now check your own comment below ;-)

>> +       mtk_hdmi_v2_disable(hdmi);>> +
>> +       return 0;
>> +}
>> +

..snip..

>> +
>> +static void mtk_hdmi_v2_bridge_pre_enable(struct drm_bridge *bridge,
>> +                                         struct drm_bridge_state *old_state)
>> +{
>> +       struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>> +       struct drm_atomic_state *state = old_state->base.state;
>> +       struct drm_connector_state *conn_state;
>> +       union phy_configure_opts opts = {
>> +               .dp = { .link_rate = hdmi->mode.clock * KILO }
>> +       };
>> +       int ret;
>> +
>> +       /* Power on the controller before trying to write to registers */
>> +       ret = mtk_hdmi_v2_enable(hdmi);
> 
> In bridge attach, it already call mtk_hdmi_v2_enable(), so it's not necessary to call it here.
> 

In bridge_attach():
1. we call mtk_hdmi_v2_enable() to...
2. ...Configure the controller, then we
3. check if the cable was connected before probing this driver, and
4. we call mtk_hdmi_v2_disable() even if cable was attached, because
the actual setup happens during bridge enablement.

So yes, it's necessary, because when we reach bridge_pre_enable(), the controller
is powered off.

>> +       if (WARN_ON(ret))
>> +               return;
>> +
>> +       /* Retrieve the connector through the atomic state */
>> +       hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
>> +
>> +       conn_state = drm_atomic_get_new_connector_state(state, hdmi->curr_conn);
>> +       if (WARN_ON(!conn_state))
>> +               return;
>> +
>> +       /*
>> +        * Preconfigure the HDMI controller and the HDMI PHY at pre_enable
>> +        * stage to make sure that this IP is ready and clocked before the
>> +        * mtk_dpi gets powered on and before it enables the output.
>> +        */
>> +       mtk_hdmi_v2_output_set_display_mode(hdmi, &hdmi->mode);
>> +
>> +       /* Reconfigure phy clock link with appropriate rate */
>> +       phy_configure(hdmi->phy, &opts);
>> +
>> +       /* Power on the PHY here to make sure that DPI_HDMI is clocked */
>> +       phy_power_on(hdmi->phy);
>> +
>> +       hdmi->powered = true;
>> +}
>> +
>> +static void mtk_hdmi_v2_bridge_enable(struct drm_bridge *bridge,
>> +                                     struct drm_bridge_state *old_state)
>> +{
>> +       struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>> +       struct drm_atomic_state *state = old_state->base.state;
>> +       int ret;
>> +
>> +       if (WARN_ON(!hdmi->powered))
>> +               return;
>> +
>> +       ret = drm_atomic_helper_connector_hdmi_update_infoframes(hdmi->curr_conn, state);
>> +       if (ret)
>> +               dev_err(hdmi->dev, "Could not update infoframes: %d\n", ret);
>> +
>> +       mtk_hdmi_v2_hw_vid_mute(hdmi, false);
>> +
>> +       /* signal the connect event to audio codec */
>> +       mtk_hdmi_v2_handle_plugged_change(hdmi, true);
> 
> Why plugged parameter is true?
> 

Because if we reached bridge_enable, the cable is plugged in for sure...!

>> +
>> +       hdmi->enabled = true;
>> +}
>> +
>> +static void mtk_hdmi_v2_bridge_disable(struct drm_bridge *bridge,
>> +                                      struct drm_bridge_state *old_bridge_state)
>> +{
>> +       struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>> +
>> +       if (!hdmi->enabled)
>> +               return;
>> +
>> +       mtk_hdmi_v2_hw_av_mute(hdmi, true);
>> +       msleep(50);
>> +       mtk_hdmi_v2_hw_vid_mute(hdmi, true);
>> +       mtk_hdmi_v2_hw_aud_mute(hdmi, true);
>> +       mtk_hdmi_v2_disable_hdcp_encrypt(hdmi);
> 
> You never enable encrypt, why disable it?
> So drop this.
> 

Whoops! That's a leftover, will remove, thanks!

>> +       msleep(50);
>> +
>> +       hdmi->enabled = false;
>> +}
>> +
>> +static void mtk_hdmi_v2_bridge_post_disable(struct drm_bridge *bridge,
>> +                                           struct drm_bridge_state *old_state)
>> +{
>> +       struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
>> +
>> +       if (!hdmi->powered)
>> +               return;
>> +
>> +       /* Disable VSync interrupt */
>> +       regmap_clear_bits(hdmi->regs, TOP_INT_ENABLE00, HDMI_VSYNC_INT);
> 
> You never enable vsync interrupt, so this disable is redundant.
> 

Another leftover... ugh :-)

>> +
>> +       phy_power_off(hdmi->phy);
>> +       hdmi->powered = false;
>> +
>> +       /* signal the disconnect event to audio codec */
>> +       mtk_hdmi_v2_handle_plugged_change(hdmi, false);
>> +
>> +       /* Power off */
>> +       mtk_hdmi_v2_disable(hdmi);
>> +}
>> +

..snip..

>> +static __maybe_unused int mtk_hdmi_v2_suspend(struct device *dev)
>> +{
>> +       struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>> +
>> +       mtk_hdmi_v2_disable(hdmi);
>> +
>> +       return 0;
>> +}
>> +
>> +static __maybe_unused int mtk_hdmi_v2_resume(struct device *dev)
>> +{
>> +       struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
>> +       int ret;
>> +
>> +       pm_runtime_get_sync(dev);
>> +
>> +       ret = mtk_hdmi_v2_clk_enable(hdmi);
>> +       if (ret)
>> +               return ret;
>> +
>> +       mtk_hdmi_v2_enable_hpd_pord_irq(hdmi, true);
> 
> I expect the things in suspend and resume would symmetric.
> Suspend does only mtk_hdmi_v2_disable(), so resume should only mtk_hdmi_v2_enable().
> 

That's a miss here - during a cleanup I forgot to change this function.
Thanks for pointing that out!

Regards,
Angelo

