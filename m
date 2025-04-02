Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083B3A78B23
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 11:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E999B10E061;
	Wed,  2 Apr 2025 09:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AcDlYr59";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACDA110E061
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743586410;
 bh=3My4gJld4RfMeL+Sp+iPPQtscgLDbHhJKzXiLsm0yqk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AcDlYr59vqTfzUIPZTdnkKDux8witurLaR9/M/ppwM5AstkZx0rRZHMa+4zDp+IBx
 PK3lj9XhEUZYc5bZp7eOuQhKPZN7qTS8RPM8CNSSvbpbz+6MhP/s/PCsL0qyP0vcOz
 7OAd6zZd+JLWC9Oe9HyIA3WC2U3wjPBkwJpEdQ6YR2STdNEBxTLgOgR5MSglL+te08
 1XI63/chGf5xW/850olYMs/gOGChDhv/YEtC1ms9nou/heyYxb27B9S4wQqVAETy+9
 JthpCmxwlanvkQKDQAXz5uajFZAOilbW919I+nfFLMkmyHluuSLeudLD4aGcRLdqZ6
 ozpNZnlI0nJTw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8F6AD17E014F;
 Wed,  2 Apr 2025 11:33:29 +0200 (CEST)
Message-ID: <8e4bafe5-b080-4b9d-8894-ff19eb972660@collabora.com>
Date: Wed, 2 Apr 2025 11:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] soc: mediatek: add mmsys support for MT8196
To: =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: =?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>,
 =?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 =?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?=
 <Xiandong.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "treapking@chromium.org" <treapking@chromium.org>
References: <20250321093435.94835-1-paul-pl.chen@mediatek.com>
 <20250321093435.94835-7-paul-pl.chen@mediatek.com>
 <67337197-abec-450c-b400-ae37a0cd0692@collabora.com>
 <17b12339c2ac5231cbbd88358691cca7f58f8e3f.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <17b12339c2ac5231cbbd88358691cca7f58f8e3f.camel@mediatek.com>
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

Il 02/04/25 06:06, Paul-pl Chen (陳柏霖) ha scritto:
> On Mon, 2025-03-24 at 18:09 +0100, AngeloGioacchino Del Regno wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> Il 21/03/25 10:33, paul-pl.chen ha scritto:
>>> From: Nancy Lin <nancy.lin@mediatek.com>
>>>
>>> 1. Defining driver data and adding compatible string
>>> for different subsystems
>>> (DISPSYS0, DISPSYS1, OVLSYS0, OVLSYS1, VDISP_AO)
>>> 2. Adding functions to control top clocks and ddp clocks.
>>> 3. Updating the probe function to initialize clocks and
>>> enable runtime PM if its node has the power-domains property.
>>> 4. Adding functions to configure ddp components and
>>> set default configurations.
>>> 5. Adding the routing table for each mmsys in MT8196.
>>
>> You need at least two commits for all that you're doing here... and
>> adding MT8196
>> tables should be the last one.
>>
> Hi AngeloGioacchino,
> 
> Thank you for your feedback. I appreciate your suggestion to split the
> changes into at least two commits. Based on your advice, I'm
> considering dividing the changes as follows:
> 
> Commit 1: Add mmsys support
> This commit would include:
> (1) Defining driver data and adding compatible strings for different
> subsystems (DISPSYS0, DISPSYS1, OVLSYS0, OVLSYS1, VDISP_AO)
> (2) Adding functions to control top clocks and ddp clocks
> (3) Updating the probe function to initialize clocks and enable runtime
> PM if its node has the power-domains property
> (4) Adding functions to configure ddp components and set default
> configurations
> 
> Commit 2: Add mmsys tables support for MT8196
> This commit would focus on:
> (5) Adding the routing table for each mmsys in MT8196
> 
> Does this division align with your expectations?

Yes, but if you want, you can even do more than two commits - just make it
readable; each commit needs a precise scope, only changes that *need to*
be together go in a single commit.

>>>
>>> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>
>>> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
>>> ---
>>>    drivers/soc/mediatek/mt8196-mmsys.h    | 451
>>> +++++++++++++++++++++++++
>>>    drivers/soc/mediatek/mtk-mmsys.c       | 203 ++++++++++-
>>>    drivers/soc/mediatek/mtk-mmsys.h       |  18 +
>>>    include/linux/soc/mediatek/mtk-mmsys.h |  60 ++++
>>>    4 files changed, 731 insertions(+), 1 deletion(-)
>>>    create mode 100644 drivers/soc/mediatek/mt8196-mmsys.h
>>>
>>> diff --git a/drivers/soc/mediatek/mt8196-mmsys.h
>>> b/drivers/soc/mediatek/mt8196-mmsys.h
>>> new file mode 100644
>>> index 000000000000..ff841ae9939a
>>> --- /dev/null
>>> +++ b/drivers/soc/mediatek/mt8196-mmsys.h
>>> @@ -0,0 +1,451 @@
>>
>> ..snip..
>>
>>> +static const struct mtk_mmsys_default
>>> mmsys_mt8196_disp0_default_table[] = {
>>> +     {MT8196_OVLSYS_GCE_EVENT_SEL, MT8196_EVENT_GCE_EN, GENMASK(1,
>>> 0)},
>>> +     {MT8196_DISP0_BYPASS_MUX_SHADOW,
>>> +      MT8196_CB_BYPASS_MUX_SHADOW | MT8196_BYPASS_MUX_SHADOW,
>>> +      MT8196_CB_BYPASS_MUX_SHADOW | MT8196_BYPASS_MUX_SHADOW},
>>> +     {MT8196_DISP0_DLI_RELAY0, MT8196_DLI_RELAY_1T2P, GENMASK(31,
>>> 30)},
>>> +     {MT8196_DISP0_DLI_RELAY1, MT8196_DLI_RELAY_1T2P, GENMASK(31,
>>> 30)},
>>> +     {MT8196_DISP0_DLI_RELAY8, MT8196_DLI_RELAY_1T2P, GENMASK(31,
>>> 30)},
>>> +     {MT8196_DISP0_DLO_RELAY1, MT8196_DLI_RELAY_1T2P, GENMASK(31,
>>> 30)},
>>> +     {MT8196_DISP0_DLO_RELAY2, MT8196_DLI_RELAY_1T2P, GENMASK(31,
>>> 30)},
>>> +     {MT8196_DISP0_DLO_RELAY3, MT8196_DLI_RELAY_1T2P, GENMASK(31,
>>> 30)},
>>> +};
>>> +
>>> +static const struct mtk_mmsys_default
>>> mmsys_mt8196_disp1_default_table[] = {
>>> +     {MT8196_OVLSYS_GCE_EVENT_SEL, MT8196_EVENT_GCE_EN, GENMASK(1,
>>> 0)},
>>> +     {MT8196_DISP1_INT_MERGE, 0, BIT(0)},
>>> +     {MT8196_DISP1_BYPASS_MUX_SHADOW,
>>> +      MT8196_CB_BYPASS_MUX_SHADOW | MT8196_BYPASS_MUX_SHADOW,
>>> +      MT8196_CB_BYPASS_MUX_SHADOW | MT8196_BYPASS_MUX_SHADOW},
>>> +     {MT8196_DISP1_DLI_RELAY21, MT8196_DLI_RELAY_1T2P, GENMASK(31,
>>> 30)},
>>> +     {MT8196_DISP1_DLI_RELAY22, MT8196_DLI_RELAY_1T2P, GENMASK(31,
>>> 30)},
>>> +     {MT8196_DISP1_DLI_RELAY23, MT8196_DLI_RELAY_1T2P, GENMASK(31,
>>> 30)},
>>> +     {MT8196_DISP1_GCE_FRAME_DONE_SEL0, MT8196_FRAME_DONE_DVO,
>>> GENMASK(5, 0)},
>>> +     {MT8196_DISP1_GCE_FRAME_DONE_SEL1,
>>> MT8196_FRAME_DONE_DP_INTF0, GENMASK(5, 0)},
>>> +};
>>> +
>>> +static const struct mtk_mmsys_routes
>>> mmsys_mt8196_ovl0_routing_table[] = {
>>> +     {
>>> +             DDP_COMPONENT_OVL0_EXDMA2,
>>> DDP_COMPONENT_OVL0_BLENDER1,
>>
>> There's a new MMSYS_ROUTE macro that was introduced because tables
>> contained
>> wrong values in multiple instances and in multiple SoCs: please use
>> it here and
>> for all routing tables.
>>
> Sure, I will use the new MMSYS_ROUTE macro " MMSYS_ROUTE " to replace
> the old routing table.
>>> +             MT8196_OVL_RSZ_IN_CB2_MOUT_EN,
>>> MT8196_DISP_OVL_EXDMA2_1_TO_OVL_EXDMA_OUT_CB3,
>>> +             MT8196_DISP_OVL_EXDMA2_1_TO_OVL_EXDMA_OUT_CB3
>>
>> ..snip..
>>
>>> +};
>>> +#endif /* __SOC_MEDIATEK_MT8196_MMSYS_H */
>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
>>> b/drivers/soc/mediatek/mtk-mmsys.c
>>> index bb4639ca0b8c..1d3ca4f9f237 100644
>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>> @@ -4,12 +4,14 @@
>>>     * Author: James Liao <jamesjj.liao@mediatek.com>
>>>     */
>>>
>>> +#include <linux/clk.h>
>>>    #include <linux/delay.h>
>>>    #include <linux/device.h>
>>>    #include <linux/io.h>
>>>    #include <linux/module.h>
>>>    #include <linux/of.h>
>>>    #include <linux/platform_device.h>
>>> +#include <linux/pm_runtime.h>
>>>    #include <linux/reset-controller.h>
>>>    #include <linux/soc/mediatek/mtk-mmsys.h>
>>>
>>> @@ -21,6 +23,7 @@
>>>    #include "mt8188-mmsys.h"
>>>    #include "mt8192-mmsys.h"
>>>    #include "mt8195-mmsys.h"
>>> +#include "mt8196-mmsys.h"
>>>    #include "mt8365-mmsys.h"
>>>
>>>    #define MMSYS_SW_RESET_PER_REG 32
>>> @@ -144,6 +147,54 @@ static const struct mtk_mmsys_driver_data
>>> mt8195_vppsys1_driver_data = {
>>>        .is_vppsys = true,
>>>    };
>>>
>>> +static const struct mtk_mmsys_driver_data
>>> mt8196_dispsys0_driver_data = {
>>> +     .clk_driver = "clk-mt8196-disp0",
>>> +     .routes = mmsys_mt8196_disp0_routing_table,
>>> +     .num_routes = ARRAY_SIZE(mmsys_mt8196_disp0_routing_table),
>>> +     .async_info = mmsys_mt8196_disp0_async_comp_table,
>>> +     .num_async_info =
>>> ARRAY_SIZE(mmsys_mt8196_disp0_async_comp_table),
>>> +     .def_config = mmsys_mt8196_disp0_default_table,
>>> +     .num_def_config =
>>> ARRAY_SIZE(mmsys_mt8196_disp0_default_table),
>>> +     .num_top_clk = 1,
>>> +};
>>> +
>>> +static const struct mtk_mmsys_driver_data
>>> mt8196_dispsys1_driver_data = {
>>> +     .clk_driver = "clk-mt8196-disp1",
>>> +     .routes = mmsys_mt8196_disp1_routing_table,
>>> +     .num_routes = ARRAY_SIZE(mmsys_mt8196_disp1_routing_table),
>>> +     .async_info = mmsys_mt8196_disp1_async_comp_table,
>>> +     .num_async_info =
>>> ARRAY_SIZE(mmsys_mt8196_disp1_async_comp_table),
>>> +     .def_config = mmsys_mt8196_disp1_default_table,
>>> +     .num_def_config =
>>> ARRAY_SIZE(mmsys_mt8196_disp1_default_table),
>>> +     .num_top_clk = 1,
>>> +};
>>> +
>>> +static const struct mtk_mmsys_driver_data
>>> mt8196_ovlsys0_driver_data = {
>>> +     .clk_driver = "clk-mt8196-ovl0",
>>> +     .routes = mmsys_mt8196_ovl0_routing_table,
>>> +     .num_routes = ARRAY_SIZE(mmsys_mt8196_ovl0_routing_table),
>>> +     .async_info = mmsys_mt8196_ovl0_async_comp_table,
>>> +     .num_async_info =
>>> ARRAY_SIZE(mmsys_mt8196_ovl0_async_comp_table),
>>> +     .def_config = mmsys_mt8196_ovl0_default_table,
>>> +     .num_def_config =
>>> ARRAY_SIZE(mmsys_mt8196_ovl0_default_table),
>>> +};
>>> +
>>> +static const struct mtk_mmsys_driver_data
>>> mt8196_ovlsys1_driver_data = {
>>> +     .clk_driver = "clk-mt8196-ovl1",
>>> +     .routes = mmsys_mt8196_ovl1_routing_table,
>>> +     .num_routes = ARRAY_SIZE(mmsys_mt8196_ovl1_routing_table),
>>> +     .async_info = mmsys_mt8196_ovl1_async_comp_table,
>>> +     .num_async_info =
>>> ARRAY_SIZE(mmsys_mt8196_ovl1_async_comp_table),
>>> +     .def_config = mmsys_mt8196_ovl0_default_table,
>>> +     .num_def_config =
>>> ARRAY_SIZE(mmsys_mt8196_ovl0_default_table),
>>> +};
>>> +
>>> +static const struct mtk_mmsys_driver_data
>>> mt8196_vdisp_ao_driver_data = {
>>> +     .clk_driver = "clk-mt8196-vdisp_ao",
>>> +     .def_config = mmsys_mt8196_vdisp_ao_default_table,
>>> +     .num_def_config =
>>> ARRAY_SIZE(mmsys_mt8196_vdisp_ao_default_table),
>>> +};
>>> +
>>>    static const struct mtk_mmsys_driver_data
>>> mt8365_mmsys_driver_data = {
>>>        .clk_driver = "clk-mt8365-mm",
>>>        .routes = mt8365_mmsys_routing_table,
>>> @@ -158,6 +209,9 @@ struct mtk_mmsys {
>>>        spinlock_t lock; /* protects mmsys_sw_rst_b reg */
>>>        struct reset_controller_dev rcdev;
>>>        struct cmdq_client_reg cmdq_base;
>>> +     struct clk **async_clk;
>>> +     int num_async_clk;
>>> +     struct clk **top_clk;
>>>    };
>>>
>>>    static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32
>>> offset, u32 mask, u32 val,
>>> @@ -180,6 +234,99 @@ static void mtk_mmsys_update_bits(struct
>>> mtk_mmsys *mmsys, u32 offset, u32 mask,
>>>        writel_relaxed(tmp, mmsys->regs + offset);
>>>    }
>>>
>>> +int mtk_mmsys_top_clk_enable(struct device *dev)
>>> +{
>>> +     struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>>> +     int ret, i;
>>> +
>>> +     if (!mmsys->data->num_top_clk)
>>> +             return 0;
>>> +
>>> +     for (i = 0; i < mmsys->data->num_top_clk; i++)
>>> +             ret = clk_prepare_enable(mmsys->top_clk[i]);
>>> +     return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(mtk_mmsys_top_clk_enable);
>>> +
>>> +void mtk_mmsys_top_clk_disable(struct device *dev)
>>> +{
>>> +     struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>>> +     int i;
>>> +
>>> +     for (i = 0; i < mmsys->data->num_top_clk; i++)
>>> +             clk_disable_unprepare(mmsys->top_clk[i]);
>>> +}
>>> +EXPORT_SYMBOL_GPL(mtk_mmsys_top_clk_disable);
>>> +
>>> +int mtk_mmsys_ddp_clk_enable(struct device *dev, enum
>>> mtk_ddp_comp_id comp_id)
>>> +{
>>> +     struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>>> +     const struct mtk_mmsys_async_info *async = mmsys->data-
>>>> async_info;
>>> +
>>> +     int i;
>>> +
>>> +     if (!mmsys->data->num_async_info)
>>> +             return 0;
>>> +
>>> +     for (i = 0; i < mmsys->data->num_async_info; i++)
>>> +             if (comp_id == async[i].comp_id)
>>> +                     return clk_prepare_enable(mmsys-
>>>> async_clk[async[i].index]);
>>
>> Why can't you add the clocks in the mediatek-drm nodes and handle
>> enablement in the
>> drm driver?!
>>
> The "async" is not like other components under mediate-drm that have
> independent functions.It only controls which clocks need to be enabled
> when the path MUX goes through certain routes.
> 
> That's why it's placed in mtk-mmsys. It's only activated when it needs
> to be connected to the necessary path MUX.
> 
> Currently, the path order is represented through component IDs.
> Therefore, to indicate its relative position on the DDP path, we
> defined a component ID for it to use.
> 

I'm still not convinced - this explanation still doesn't exclude the possibility
of doing that in mediatek-drm, really.

Having one big node containing clocks for multiple hardware IPs doesn't correctly
describe the hardware in the devicetree as well, and this is because those clocks
don't belong to the big VDO, but to the single hardware components that are
children of a VDO.

While this means that the clocks are still contained in a VDO macro-block, they
are relative to a sub-block and enable register access of a sub-block, not of
the VDO macro-block.


>>> +     return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_clk_enable);
>>> +
>>> +void mtk_mmsys_ddp_clk_disable(struct device *dev, enum
>>> mtk_ddp_comp_id comp_id)
>>> +{
>>> +     struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>>> +     const struct mtk_mmsys_async_info *async = mmsys->data-
>>>> async_info;
>>> +     int i;
>>> +
>>> +     if (!mmsys->data->num_async_info)
>>> +             return;
>>> +
>>> +     for (i = 0; i < mmsys->data->num_async_info; i++)
>>> +             if (comp_id == async[i].comp_id)
>>> +                     clk_disable_unprepare(mmsys-
>>>> async_clk[async[i].index]);
>>> +}
>>> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_clk_disable);
>>> +
>>> +void mtk_mmsys_ddp_config(struct device *dev, enum mtk_ddp_comp_id
>>> comp_id,
>>> +                       int width, int height, struct cmdq_pkt
>>> *cmdq_pkt)
>>> +{
>>> +     struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>>> +     const struct mtk_mmsys_async_info *async = mmsys->data-
>>>> async_info;
>>> +     int i;
>>> +
>>> +     if (!mmsys->data->num_async_info)
>>> +             return;
>>> +
>>> +     for (i = 0; i < mmsys->data->num_async_info; i++)
>>> +             if (comp_id == async[i].comp_id)
>>> +                     break;
>>> +
>>> +     if (i == mmsys->data->num_async_info)
>>> +             return;
>>> +
>>> +     mtk_mmsys_update_bits(mmsys, async[i].offset, async[i].mask,
>>> +                           height << 16 | width, cmdq_pkt);
>>
>> linux/bitfield.h provides macros that you should use for those
>> register fields.
>>
> 
> We use "mtk_mmsys_update_bits" to check if a cmdq packet exists.
> If the cmdq packet exists, the function will make settings through
> cmdq.
> If cmdq is NULL, it will directly make settings through the CPU.
> 
> Regarding your comment
> "linux/bitfield.h provides macros that you should use for those
> register fields", are they suggesting that:
> 
> [1] We should use the macros provided by linux/bitfield.h to replace
> expressions like "height << 16"
> 

You have to use those macros to replace expressions like "height << 16".

val = FIELD_PREP(SOMETHING, height);
val |= FIELD_PREP(SOMETHING_ELSE, width);

mtk_mmsys_update_bits(mmsys, async[i].offset, async[i].mask, val, cmdq_pkt);

Regards,
Angelo

> or [2] We should rewrite mtk_mmsys_update_bits using kernel APIs
>>> +}
>>> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
>>> +
>>> +void mtk_mmsys_default_config(struct device *dev)
>>> +{
>>> +     struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>>> +     const struct mtk_mmsys_default *def_config = mmsys->data-
>>>> def_config;
>>> +     int i;
>>> +
>>> +     if (!mmsys->data->num_def_config)
>>> +             return;
>>> +
>>> +     for (i = 0; i < mmsys->data->num_def_config; i++)
>>> +             mtk_mmsys_update_bits(mmsys, def_config[i].offset,
>>> def_config[i].mask,
>>> +                                   def_config[i].val, NULL);
>>> +}
>>> +EXPORT_SYMBOL_GPL(mtk_mmsys_default_config);
>>> +
>>>    void mtk_mmsys_ddp_connect(struct device *dev,
>>>                           enum mtk_ddp_comp_id cur,
>>>                           enum mtk_ddp_comp_id next)
>>> @@ -390,7 +537,7 @@ static int mtk_mmsys_probe(struct
>>> platform_device *pdev)
>>>        struct platform_device *clks;
>>>        struct platform_device *drm;
>>>        struct mtk_mmsys *mmsys;
>>> -     int ret;
>>> +     int ret, i;
>>>
>>>        mmsys = devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
>>>        if (!mmsys)
>>> @@ -432,6 +579,49 @@ static int mtk_mmsys_probe(struct
>>> platform_device *pdev)
>>>                return PTR_ERR(clks);
>>>        mmsys->clks_pdev = clks;
>>>
>>> +     if (mmsys->data->num_top_clk) {
>>> +             struct device_node *node;
>>> +
>>> +             node = of_get_child_by_name(dev->of_node, "top");
>>
>> No, you can't do that if there's no binding to support that.
>>
> We will add the "async" component in the MMSYS YAML file.
> "async" is a nessceary clock in the specific routing display
> path MUX configuration
>>
>>> +             if (!node) {
>>> +                     dev_err(&pdev->dev, "Couldn't find top
>>> node\n");
>>> +                     return -EINVAL;
>>> +             }
>>> +
>>> +             mmsys->top_clk = devm_kmalloc_array(dev, mmsys->data-
>>>> num_top_clk,
>>> +                                                 sizeof(*mmsys-
>>>> top_clk), GFP_KERNEL);
>>> +             if (!mmsys->top_clk)
>>> +                     return -ENOMEM;
>>> +
>>> +             for (i = 0; i < mmsys->data->num_top_clk; i++) {
>>> +                     mmsys->top_clk[i] = of_clk_get(node, i);
>>> +                     if (IS_ERR(mmsys->top_clk[i]))
>>> +                             return PTR_ERR(mmsys->top_clk[i]);
>>> +             }
>>> +     }
>>> +
>>> +     if (mmsys->data->num_async_info) {
>>> +             struct device_node *node;
>>> +
>>> +             node = of_get_child_by_name(dev->of_node, "async");
>>> +             if (!node) {
>>> +                     dev_err(&pdev->dev, "Couldn't find async
>>> node\n");
>>> +                     return -EINVAL;
>>> +             }
>>> +
>>
>> Also this looks like you have children providing only clocks?!
>> I really need to look at the bindings to decide, but this looks
>> wrong.
>>
> We will add the "async" component in the MMSYS YAML file.
> "async" is a nessceary clock in the specific routing display
> path MUX configuration
>> Regards,
>> Angelo
>>
>>
>> Best Regards,
> Paul


