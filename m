Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43695A1D2A0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 09:56:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC5710E1F3;
	Mon, 27 Jan 2025 08:56:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="o/DdY28C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A852F10E1F3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1737968193;
 bh=TPpiy3zgnN/Boyv66TB9NhHG05kaN1e+33CML8Libeo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=o/DdY28C1N5QFMQUOlY8aBioFp/kzmWW8MCwO56H9J91gb6VmMRUrQZHOB+oNTb8k
 9LK4PO8ZQFozXZ74q0cRXlMP1qpYV9c6bVaVsXoWV3krKe/p9LSoJZPwQPE+lM669R
 tKLwkRACXRcW//AZechUm94lpVileJYhhw7aBR3yG+CUoh6nVejRz6pxBIzGUyyOUf
 26ssUH1cTo7gl/AHmTlixOoE7ewWA0+892yp9k9PHqdoZolZue+4uc10wR7A5cIMu8
 FQsSpnvRXQ4WdwTtKorQoy2TkqhfWwTogUOk+e0XyAV38R/e/gQyCmUpL2x1b/LjJu
 6POF0kE+LEv4A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F0E217E0858;
 Mon, 27 Jan 2025 09:56:32 +0100 (CET)
Message-ID: <6100a94f-0485-4db5-a599-877b2364ed9a@collabora.com>
Date: Mon, 27 Jan 2025 09:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/34] drm/mediatek: Add support for MT8195 Digital
 Parallel Interface
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
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
 <20250113145232.227674-7-angelogioacchino.delregno@collabora.com>
 <c729539dae9bc882574ea9e1048e0fd23b4c5aca.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c729539dae9bc882574ea9e1048e0fd23b4c5aca.camel@mediatek.com>
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

Il 24/01/25 10:00, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Mon, 2025-01-13 at 15:52 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Add support for the DPI block found in the MT8195 and MT8188 SoCs.
>> Inside of the SoC, this block is directly connected to the HDMI IP.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dpi.c      | 55 ++++++++++++++++++++++---
>>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h |  6 +++
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  2 +
>>   3 files changed, 58 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index bb1a17f1384b..dca801f589c8 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -145,6 +145,7 @@ struct mtk_dpi_factor {
>>    * @csc_enable_bit: Enable bit of CSC.
>>    * @pixels_per_iter: Quantity of transferred pixels per iteration.
>>    * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
>> + * @is_internal_hdmi: Specifies whether the DPI is internally connected to the HDMI block
> 
> MT8173 HDMI is also internal hdmi, so I think modification for this is not because of internal hdmi.
> Find out the reason and use a correct naming.
> 

Right. That should be hdmi_shared_clocks or something similar.
I'll change that in the next version.

>>    */
>>   struct mtk_dpi_conf {
>>          const struct mtk_dpi_factor *dpi_factor;
>> @@ -165,6 +166,7 @@ struct mtk_dpi_conf {
>>          u32 csc_enable_bit;
>>          u32 pixels_per_iter;
>>          bool edge_cfg_in_mmsys;
>> +       bool is_internal_hdmi;
>>   };
>>
>>   static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
>> @@ -493,6 +495,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
>>
>>          mtk_dpi_disable(dpi);
>>          clk_disable_unprepare(dpi->pixel_clk);
>> +       clk_disable_unprepare(dpi->tvd_clk);
> 
> You control tvd_clk for all SoC.
> Does other SoC need this modification?
> If so, separate tvd_clk control to another patch.

This doesn't need to be in a different patch because the TVD clock, on instances
that are not reserved to HDMI (so, on DPINTF and on other SoCs' DPI), this is a
parent (or a parent of a parent) of engine_clk.

Of course this means that in the aforementioned case, the TVD clock is already
being prepared and enabled by the clock framework.

In the case of MT8195 DPI, this is not a parent of engine or pixel, so we need
to enable it manually.

The call to clk_prepare_enable(clk->tvd_clk) practically does *nothing* on the
currently supported SoCs (so this does not change any behavior!), other than
incrementing the refcount for this clock (and decrementing it later, obviously,
when we disable it).

Cheers,
Angelo

> 
> Regards,
> CK
> 
>>          clk_disable_unprepare(dpi->engine_clk);
>>   }
>>
>> @@ -509,6 +512,12 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>>                  goto err_refcount;
>>          }
>>
>> +       ret = clk_prepare_enable(dpi->tvd_clk);
>> +       if (ret) {
>> +               dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
>> +               goto err_engine;
>> +       }
>> +
>>          ret = clk_prepare_enable(dpi->pixel_clk);
>>          if (ret) {
>>                  dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
>> @@ -518,6 +527,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>>          return 0;
>>
>>   err_pixel:
>> +       clk_disable_unprepare(dpi->tvd_clk);
>> +err_engine:
>>          clk_disable_unprepare(dpi->engine_clk);
>>   err_refcount:
>>          dpi->refcount--;
>> @@ -585,7 +596,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>>          struct videomode vm = { 0 };
>>
>>          drm_display_mode_to_videomode(mode, &vm);
>> -       mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
>> +
>> +       if (!dpi->conf->is_internal_hdmi)
>> +               mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
>>
>>          dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
>>          dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
>> @@ -648,10 +661,18 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>>          if (dpi->conf->support_direct_pin) {
>>                  mtk_dpi_config_yc_map(dpi, dpi->yc_map);
>>                  mtk_dpi_config_2n_h_fre(dpi);
>> -               mtk_dpi_dual_edge(dpi);
>> +               /* DPI can connect to either an external bridge or the internal HDMI encoder */
>> +               if (dpi->conf->is_internal_hdmi) {
>> +                       mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN, DPI_OUTPUT_1T1P_EN);
>> +                       mtk_dpi_mask(dpi, DPI_CON,
>> +                                    dpi->conf->input_2pixel ? DPI_INPUT_2P_EN : 0,
>> +                                    DPI_INPUT_2P_EN);
>> +               } else {
>> +                       mtk_dpi_dual_edge(dpi);
>> +               }
>>                  mtk_dpi_config_disable_edge(dpi);
>>          }
>> -       if (dpi->conf->input_2pixel) {
>> +       if (dpi->conf->input_2pixel && !dpi->conf->is_internal_hdmi) {
>>                  mtk_dpi_mask(dpi, DPI_CON, DPINTF_INPUT_2P_EN,
>>                               DPINTF_INPUT_2P_EN);
>>          }
>> @@ -920,14 +941,16 @@ void mtk_dpi_start(struct device *dev)
>>   {
>>          struct mtk_dpi *dpi = dev_get_drvdata(dev);
>>
>> -       mtk_dpi_power_on(dpi);
>> +       if (!dpi->conf->is_internal_hdmi)
>> +               mtk_dpi_power_on(dpi);
>>   }
>>
>>   void mtk_dpi_stop(struct device *dev)
>>   {
>>          struct mtk_dpi *dpi = dev_get_drvdata(dev);
>>
>> -       mtk_dpi_power_off(dpi);
>> +       if (!dpi->conf->is_internal_hdmi)
>> +               mtk_dpi_power_off(dpi);
>>   }
>>
>>   unsigned int mtk_dpi_encoder_index(struct device *dev)
>> @@ -1022,6 +1045,8 @@ static const struct mtk_dpi_factor dpi_factor_mt8195_dp_intf[] = {
>>          { 70000 - 1, 4 }, { 200000 - 1, 2 }, { U32_MAX, 1 }
>>   };
>>
>> +static const struct mtk_dpi_factor dpi_factor_mt8195_dpi = { U32_MAX, 1 };
>> +
>>   static const struct mtk_dpi_conf mt8173_conf = {
>>          .dpi_factor = dpi_factor_mt8173,
>>          .num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8173),
>> @@ -1114,6 +1139,25 @@ static const struct mtk_dpi_conf mt8192_conf = {
>>          .csc_enable_bit = CSC_ENABLE,
>>   };
>>
>> +static const struct mtk_dpi_conf mt8195_conf = {
>> +       .dpi_factor = &dpi_factor_mt8195_dpi,
>> +       .num_dpi_factor = 1,
>> +       .max_clock_khz = 594000,
>> +       .output_fmts = mt8183_output_fmts,
>> +       .num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
>> +       .pixels_per_iter = 1,
>> +       .is_ck_de_pol = true,
>> +       .swap_input_support = true,
>> +       .support_direct_pin = true,
>> +       .dimension_mask = HPW_MASK,
>> +       .hvsize_mask = HSIZE_MASK,
>> +       .channel_swap_shift = CH_SWAP,
>> +       .yuv422_en_bit = YUV422_EN,
>> +       .csc_enable_bit = CSC_ENABLE,
>> +       .is_internal_hdmi = true,
>> +       .input_2pixel = true,
>> +};
>> +
>>   static const struct mtk_dpi_conf mt8195_dpintf_conf = {
>>          .dpi_factor = dpi_factor_mt8195_dp_intf,
>>          .num_dpi_factor = ARRAY_SIZE(dpi_factor_mt8195_dp_intf),
>> @@ -1217,6 +1261,7 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
>>          { .compatible = "mediatek,mt8188-dp-intf", .data = &mt8195_dpintf_conf },
>>          { .compatible = "mediatek,mt8192-dpi", .data = &mt8192_conf },
>>          { .compatible = "mediatek,mt8195-dp-intf", .data = &mt8195_dpintf_conf },
>> +       { .compatible = "mediatek,mt8195-dpi", .data = &mt8195_conf },
>>          { /* sentinel */ },
>>   };
>>   MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
>> index a0b1d18bbbf7..3c24d9e9f241 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
>> @@ -40,6 +40,12 @@
>>   #define FAKE_DE_LEVEN                  BIT(21)
>>   #define FAKE_DE_RODD                   BIT(22)
>>   #define FAKE_DE_REVEN                  BIT(23)
>> +
>> +/* DPI_CON: DPI instances */
>> +#define DPI_OUTPUT_1T1P_EN             BIT(24)
>> +#define DPI_INPUT_2P_EN                        BIT(25)
>> +
>> +/* DPI_CON: DPINTF instances */
>>   #define DPINTF_YUV422_EN               BIT(24)
>>   #define DPINTF_CSC_ENABLE              BIT(26)
>>   #define DPINTF_INPUT_2P_EN             BIT(29)
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index f22ad2882697..772c3d0f5d14 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -810,6 +810,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>>            .data = (void *)MTK_DPI },
>>          { .compatible = "mediatek,mt8195-dp-intf",
>>            .data = (void *)MTK_DP_INTF },
>> +       { .compatible = "mediatek,mt8195-dpi",
>> +         .data = (void *)MTK_DPI },
>>          { .compatible = "mediatek,mt2701-dsi",
>>            .data = (void *)MTK_DSI },
>>          { .compatible = "mediatek,mt8173-dsi",
>> --
>> 2.47.0
>>
> 

