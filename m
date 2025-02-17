Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0A8A386C4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 15:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5348410E31D;
	Mon, 17 Feb 2025 14:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OVID06cC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5C210E31D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 14:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1739803235;
 bh=OVYHI4VIbnJazFaLF3pUhlCt++RZBQtTTuEqeJGFegA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OVID06cCDpY/UZaJcMIRfZbGqFE1fTIeO42R97aHrIeN32evrFtIQNS5Z0lkPew7T
 ECf4JsNgv1J1rpBsdHA8WjxcxbUhocD4DDWZcw6mPXZOsUbHCzbGKyakX52mfVIlBr
 JBkd00iIiaPxmo2QLnF2sBJpJhEHlh7xT4Hx+hkHse6laJOMTPnYb1IigP3edzCYaE
 gg4xmpT0Oqfkht9xQl0ySoR5EcX93hYKE0D6OM79hBkxMWncjwHTLqL/BPoQ3pJ99J
 9fW+hZFVrtCgCK2opnpemY0IggNcqyysUb6k4PCLM7YvKdb2la7fyUWYioPjMft7nD
 mwNgUGkv4tdZQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 56A8B17E0F86;
 Mon, 17 Feb 2025 15:40:34 +0100 (CET)
Message-ID: <6feb3c06-c4bd-4e8b-bd89-c73fae9801d1@collabora.com>
Date: Mon, 17 Feb 2025 15:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/42] drm/mediatek: mtk_dpi: Add support for DPI input
 clock from HDMI
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
 <20250211113409.1517534-8-angelogioacchino.delregno@collabora.com>
 <500ce64dd1f4d0b18289418183011ea24938fe99.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <500ce64dd1f4d0b18289418183011ea24938fe99.camel@mediatek.com>
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

Il 14/02/25 03:09, CK Hu (胡俊光) ha scritto:
> On Tue, 2025-02-11 at 12:33 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> On some SoCs, like MT8195 and MT8188, the DPI instance that is
>> reserved to the HDMI Transmitter uses a different clock topology.
>>
>> In this case, the DPI is clocked by the HDMI IP, and this outputs
>> its clock to the MM input of dpi_pixel_clk, which is essential to
>> enable register access to the DPI IP.
>>
>> Add a `clocked_by_hdmi` member to struct mtk_dpi_conf, and check
>> it to avoid enabling the DPI clocks in the mediatek-drm internal
>> .start() callback (and avoid disabing in the .stop() component
>> callback): this will make sure that the clock configuration
>> sequence is respected during display pipeline setup by following
>> the bridge ops between DPI and HDMI, where the HDMI driver is
>> expected to enable the clocks in the bridge's pre_enable(), and
>> DPI in the enable() cb.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dpi.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> index ad07005ad56e..6493c7e2fae4 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
>> @@ -146,6 +146,8 @@ struct mtk_dpi_factor {
>>    * @input_2p_en_bit: Enable bit of two pixel per round feature
>>    * @pixels_per_iter: Quantity of transferred pixels per iteration.
>>    * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
>> + * @clocked_by_hdmi: HDMI IP outputs clock to dpi_pixel_clk input clock, needed
>> + *                  for DPI registers access.
>>    */
>>   struct mtk_dpi_conf {
>>          const struct mtk_dpi_factor *dpi_factor;
>> @@ -167,6 +169,7 @@ struct mtk_dpi_conf {
>>          u32 input_2p_en_bit;
>>          u32 pixels_per_iter;
>>          bool edge_cfg_in_mmsys;
>> +       bool clocked_by_hdmi;
>>   };
>>
>>   static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
>> @@ -587,7 +590,9 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>>          struct videomode vm = { 0 };
>>
>>          drm_display_mode_to_videomode(mode, &vm);
>> -       mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
>> +
>> +       if (!dpi->conf->clocked_by_hdmi)
>> +               mtk_dpi_set_pixel_clk(dpi, &vm, mode->clock);
>>
>>          dpi_pol.ck_pol = MTK_DPI_POLARITY_FALLING;
>>          dpi_pol.de_pol = MTK_DPI_POLARITY_RISING;
>> @@ -922,14 +927,16 @@ void mtk_dpi_start(struct device *dev)
>>   {
>>          struct mtk_dpi *dpi = dev_get_drvdata(dev);
>>
>> -       mtk_dpi_power_on(dpi);
>> +       if (!dpi->conf->clocked_by_hdmi)
>> +               mtk_dpi_power_on(dpi);
> 
> mtk_dpi_bridge_enable() also call mtk_dpi_power_on().
> Add this checking in mtk_dpi_bridge_enable() also.
> 

That's wanted.

>>   }
>>
>>   void mtk_dpi_stop(struct device *dev)
>>   {
>>          struct mtk_dpi *dpi = dev_get_drvdata(dev);
>>
>> -       mtk_dpi_power_off(dpi);
>> +       if (!dpi->conf->clocked_by_hdmi)
>> +               mtk_dpi_power_off(dpi);
> 
> mtk_dpi_bridge_disable() also call mtk_dpi_power_off().
> Add this checking in mtk_dpi_bridge_disable() also.
> 

That's also wanted.

> Because the clock is from hdmi, I think the clock define in DPI node in device tree should be removed.
> Also change the binding document and let the clock not required in MT8195.

No, because the clock is from HDMI, but there's a gate that needs to be
enabled in order to enable the clock output to the DPI hardware.

The clock being *generated from* HDMI IP doesn't mean that there's no
gate in DPI - and that's the actual problem here that we're solving
with clocked_by_hdmi. We are preventing the clock to be ungated to DPI
while it is wrong or unstable.

I didn't miss any check, all that was on purpose.

Regards,
Angelo

> 
> Regards,
> CK
> 
>>   }
>>
>>   unsigned int mtk_dpi_encoder_index(struct device *dev)
>> --
>> 2.48.1
>>
> 


