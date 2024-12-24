Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347729FBA7E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 09:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EBB310E1A6;
	Tue, 24 Dec 2024 08:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WISWNJ/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484F010E1A6
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1735028907;
 bh=fPGKAEkjoUjrC502U/b/HN2G0sg/qsDBymW6yNgB+ck=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WISWNJ/lhUmpjM1wYwTclzaudCxnRtYimqrKbsFuEF5fdb/P2TMXcr87jjoiLc8vZ
 IACiLKiXZ99QCSoN6zkuhxAcJszWodDMVKIDoa0fXDYqKQYX9+D3tZ7XJDa86S8km8
 PnqmP9YOfY/VASeZG+vfIypmaQ1XQim7qWUtK68uBlFkBJGPg2r0JNBHsJ+FMLdXcG
 SMjAAdZfymI0OjlM91etpiGgkLSu+bK563wlKAu2BO0fCodkKFBKlQB6pTPYSNi9n7
 OuzvZvf8q8km9RkouF/v/arJX8kh3nlhjOPSX7CuFLrXPynWKnAOx5OtzuIuIhUUcb
 Zz3tp3dDRMdyQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AEC8517E137F;
 Tue, 24 Dec 2024 09:28:26 +0100 (CET)
Message-ID: <8ea0e19a-88dd-4c9a-a2a2-6322b6b529df@collabora.com>
Date: Tue, 24 Dec 2024 09:28:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: Add registers to pdata to fix
 MT8186/MT8188
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "simona@ffwll.ch" <simona@ffwll.ch>,
 =?UTF-8?B?WGlubGVpIExlZSAo5p2O5piV56OKKQ==?= <xinlei.lee@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?U2h1aWppbmcgTGkgKOadjuawtOmdmSk=?= <Shuijing.Li@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 =?UTF-8?B?UmV4LUJDIENoZW4gKOmZs+afj+i+sCk=?= <Rex-BC.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20241219112733.47907-1-angelogioacchino.delregno@collabora.com>
 <fa6e2d5eb434915006f56055634b5f22d9766e56.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <fa6e2d5eb434915006f56055634b5f22d9766e56.camel@mediatek.com>
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

Il 24/12/24 06:36, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Thu, 2024-12-19 at 12:27 +0100, AngeloGioacchino Del Regno wrote:
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>
>>
>> Registers DSI_VM_CMD and DSI_SHADOW_DEBUG start at different
>> addresses in both MT8186 and MT8188 compared to the older IPs.
>>
>> Add two members in struct mtk_dsi_driver_data to specify the
>> offsets for these two registers on a per-SoC basis, then do
>> specify those in all of the currently present SoC driver data.
>>
>> This fixes writes to the Video Mode Command Packet Control
>> register, fixing enablement of command packet transmission
>> (VM_CMD_EN) and allowance of this transmission during the
>> VFP period (TS_VFP_EN) on both MT8186 and MT8188.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> I'm curious that only some panel has problem without this patch?
> I think the fixed-patch sender has test on their panel.
> 

I think that depends on how the bootloader leaves the DSI registers before
booting Linux... but anyway, this was tested on the Startek panel found on the
latest HW revision of the Genio 700 EVK :-)

Cheers,
Angelo

> Regards,
> CK
> 
>>
>> Fixes: 03d7adc41027 ("drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.c")
>> Fixes: 814d5341f314 ("drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index e61b9bc68e9a..978332cd52f5 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -139,11 +139,11 @@
>>   #define CLK_HS_POST                    GENMASK(15, 8)
>>   #define CLK_HS_EXIT                    GENMASK(23, 16)
>>
>> -#define DSI_VM_CMD_CON         0x130
>> +/* DSI_VM_CMD_CON */
>>   #define VM_CMD_EN                      BIT(0)
>>   #define TS_VFP_EN                      BIT(5)
>>
>> -#define DSI_SHADOW_DEBUG       0x190U
>> +/* DSI_SHADOW_DEBUG */
>>   #define FORCE_COMMIT                   BIT(0)
>>   #define BYPASS_SHADOW                  BIT(1)
>>
>> @@ -187,6 +187,8 @@ struct phy;
>>
>>   struct mtk_dsi_driver_data {
>>          const u32 reg_cmdq_off;
>> +       const u32 reg_vm_cmd_off;
>> +       const u32 reg_shadow_dbg_off;
>>          bool has_shadow_ctl;
>>          bool has_size_ctl;
>>          bool cmdq_long_packet_ctl;
>> @@ -367,8 +369,8 @@ static void mtk_dsi_set_mode(struct mtk_dsi *dsi)
>>
>>   static void mtk_dsi_set_vm_cmd(struct mtk_dsi *dsi)
>>   {
>> -       mtk_dsi_mask(dsi, DSI_VM_CMD_CON, VM_CMD_EN, VM_CMD_EN);
>> -       mtk_dsi_mask(dsi, DSI_VM_CMD_CON, TS_VFP_EN, TS_VFP_EN);
>> +       mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, VM_CMD_EN, VM_CMD_EN);
>> +       mtk_dsi_mask(dsi, dsi->driver_data->reg_vm_cmd_off, TS_VFP_EN, TS_VFP_EN);
>>   }
>>
>>   static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>> @@ -714,7 +716,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>
>>          if (dsi->driver_data->has_shadow_ctl)
>>                  writel(FORCE_COMMIT | BYPASS_SHADOW,
>> -                      dsi->regs + DSI_SHADOW_DEBUG);
>> +                      dsi->regs + dsi->driver_data->reg_shadow_dbg_off);
>>
>>          mtk_dsi_reset_engine(dsi);
>>          mtk_dsi_phy_timconfig(dsi);
>> @@ -1263,26 +1265,36 @@ static void mtk_dsi_remove(struct platform_device *pdev)
>>
>>   static const struct mtk_dsi_driver_data mt8173_dsi_driver_data = {
>>          .reg_cmdq_off = 0x200,
>> +       .reg_vm_cmd_off = 0x130,
>> +       .reg_shadow_dbg_off = 0x190
>>   };
>>
>>   static const struct mtk_dsi_driver_data mt2701_dsi_driver_data = {
>>          .reg_cmdq_off = 0x180,
>> +       .reg_vm_cmd_off = 0x130,
>> +       .reg_shadow_dbg_off = 0x190
>>   };
>>
>>   static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
>>          .reg_cmdq_off = 0x200,
>> +       .reg_vm_cmd_off = 0x130,
>> +       .reg_shadow_dbg_off = 0x190,
>>          .has_shadow_ctl = true,
>>          .has_size_ctl = true,
>>   };
>>
>>   static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
>>          .reg_cmdq_off = 0xd00,
>> +       .reg_vm_cmd_off = 0x200,
>> +       .reg_shadow_dbg_off = 0xc00,
>>          .has_shadow_ctl = true,
>>          .has_size_ctl = true,
>>   };
>>
>>   static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
>>          .reg_cmdq_off = 0xd00,
>> +       .reg_vm_cmd_off = 0x200,
>> +       .reg_shadow_dbg_off = 0xc00,
>>          .has_shadow_ctl = true,
>>          .has_size_ctl = true,
>>          .cmdq_long_packet_ctl = true,
>> --
>> 2.47.0
>>
> 

