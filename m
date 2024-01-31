Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AB9843D65
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 11:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB4010E67D;
	Wed, 31 Jan 2024 10:57:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE6510E67D
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 10:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1706698603;
 bh=ArCKganMXw62AGJb0zZlcKm0qW0r4yqmABnzcnkhfeI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dScLujFz6JUPDzJq9MeqX2WYSMqI7BEMmD7BZtwn3WLJjTvEPMz+xDM6c25rL4EKV
 VS3LLK6b1BwsPZ/Rtw4lYBeStzsoZD7K975jN2+OWp+O4tJJMz9dFgmzQPg0vrul3v
 U4uyOMZJO4BnLNn25LfVKRU/7Mn/jjo/5EdQGY22v1sXhmrl9VJvKp0f2ktWnY49+J
 Hfdom9jKQg3jm6zaEAre7gXCESHE7zpxXDNlnPMNcninyXBIUAhhATcTQYvw1cRdAc
 nBqaKXiUQ9mFgDWqiqwmdfHBPpkj/jjm1BbFHHUv9SPiPX/eHq5dmNYXgsxss+3LQf
 2+VqMzBGhItpA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id DC7AC3780016;
 Wed, 31 Jan 2024 10:56:42 +0000 (UTC)
Message-ID: <d8c364a6-932d-4669-af70-5b113556121d@collabora.com>
Date: Wed, 31 Jan 2024 11:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/mediatek: dsi: Use GENMASK() for register mask
 definitions
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>
References: <20231220135722.192080-1-angelogioacchino.delregno@collabora.com>
 <20231220135722.192080-2-angelogioacchino.delregno@collabora.com>
 <CAC=S1ng+kkJS-g3FHe4SC-r1a6hegj3=Any07TCdvTU_apvZNg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAC=S1ng+kkJS-g3FHe4SC-r1a6hegj3=Any07TCdvTU_apvZNg@mail.gmail.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 26/12/23 11:46, Fei Shao ha scritto:
> Hi Angelo,
> 
> On Wed, Dec 20, 2023 at 9:57 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Change magic numerical masks with usage of the GENMASK() macro
>> to improve readability.
>>
>> This commit brings no functional changes.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 46 ++++++++++++++++--------------
>>   1 file changed, 24 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index a2fdfc8ddb15..23d2c5be8dbb 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -58,18 +58,18 @@
>>
>>   #define DSI_TXRX_CTRL          0x18
>>   #define VC_NUM                         BIT(1)
>> -#define LANE_NUM                       (0xf << 2)
>> +#define LANE_NUM                       GENMASK(5, 2)
>>   #define DIS_EOT                                BIT(6)
>>   #define NULL_EN                                BIT(7)
>>   #define TE_FREERUN                     BIT(8)
>>   #define EXT_TE_EN                      BIT(9)
>>   #define EXT_TE_EDGE                    BIT(10)
>> -#define MAX_RTN_SIZE                   (0xf << 12)
>> +#define MAX_RTN_SIZE                   GENMASK(15, 12)
>>   #define HSTX_CKLP_EN                   BIT(16)
>>
>>   #define DSI_PSCTRL             0x1c
>> -#define DSI_PS_WC                      0x3fff
>> -#define DSI_PS_SEL                     (3 << 16)
>> +#define DSI_PS_WC                      GENMASK(14, 0)
>> +#define DSI_PS_SEL                     GENMASK(19, 16)
> 
> GENMASK(17, 16)

That was intended, and depends on the SoC - I should effectively advertise that
in the commit description and I will.

As per the datasheets:

MT8192 - DSI_PS_SEL[18:16]
MT8195 - DSI_PS_SEL[19:16]

...on SoCs that don't have those additional bits, the higher ones are reserved
(unused), so it is safe to have this as 19, 16.

>>
>>   #define PACKED_PS_16BIT_RGB565         (0 << 16)
>>   #define LOOSELY_PS_18BIT_RGB666                (1 << 16)
>>   #define PACKED_PS_18BIT_RGB666         (2 << 16)
>> @@ -109,26 +109,27 @@
>>   #define LD0_WAKEUP_EN                  BIT(2)
>>
>>   #define DSI_PHY_TIMECON0       0x110
>> -#define LPX                            (0xff << 0)
>> -#define HS_PREP                                (0xff << 8)
>> -#define HS_ZERO                                (0xff << 16)
>> -#define HS_TRAIL                       (0xff << 24)
>> +#define LPX                            GENMASK(7, 0)
>> +#define HS_PREP                                GENMASK(15, 8)
>> +#define HS_ZERO                                GENMASK(23, 16)
>> +#define HS_TRAIL                       GENMASK(31, 24)
>>
>>   #define DSI_PHY_TIMECON1       0x114
>> -#define TA_GO                          (0xff << 0)
>> -#define TA_SURE                                (0xff << 8)
>> -#define TA_GET                         (0xff << 16)
>> -#define DA_HS_EXIT                     (0xff << 24)
>> +#define TA_GO                          GENMASK(7, 0)
>> +#define TA_SURE                                GENMASK(15, 8)
>> +#define TA_GET                         GENMASK(23, 16)
>> +#define DA_HS_EXIT                     GENMASK(31, 24)
>>
>>   #define DSI_PHY_TIMECON2       0x118
>> -#define CONT_DET                       (0xff << 0)
>> -#define CLK_ZERO                       (0xff << 16)
>> -#define CLK_TRAIL                      (0xff << 24)
>> +#define CONT_DET                       GENMASK(7, 0)
>> +#define DA_HS_SYNC                     GENMASK(15, 8)
> 
> This is new, so please introduce it in a separate patch if intended.
> 

I wouldn't really be comfortable doing so: this would mean that I'd
have to first write a constant and then fix that in a later patch...

P.S.: Sorry for working again on this one whole month after .... :-)

Regards,
Angelo

> The rest looks good to me.
> 
> Regards,
> Fei
> 
> 
>>
>> +#define CLK_ZERO                       GENMASK(23, 16)
>> +#define CLK_TRAIL                      GENMASK(31, 24)
>>
>>   #define DSI_PHY_TIMECON3       0x11c
>> -#define CLK_HS_PREP                    (0xff << 0)
>> -#define CLK_HS_POST                    (0xff << 8)
>> -#define CLK_HS_EXIT                    (0xff << 16)
>> +#define CLK_HS_PREP                    GENMASK(7, 0)
>> +#define CLK_HS_POST                    GENMASK(15, 8)
>> +#define CLK_HS_EXIT                    GENMASK(23, 16)
>>
>>   #define DSI_VM_CMD_CON         0x130
>>   #define VM_CMD_EN                      BIT(0)
>> @@ -138,13 +139,14 @@
>>   #define FORCE_COMMIT                   BIT(0)
>>   #define BYPASS_SHADOW                  BIT(1)
>>
>> -#define CONFIG                         (0xff << 0)
>> +/* CMDQ related bits */
>> +#define CONFIG                         GENMASK(7, 0)
>>   #define SHORT_PACKET                   0
>>   #define LONG_PACKET                    2
>>   #define BTA                            BIT(2)
>> -#define DATA_ID                                (0xff << 8)
>> -#define DATA_0                         (0xff << 16)
>> -#define DATA_1                         (0xff << 24)
>> +#define DATA_ID                                GENMASK(15, 8)
>> +#define DATA_0                         GENMASK(23, 16)
>> +#define DATA_1                         GENMASK(31, 24)
>>
>>   #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
>>
>> --
>> 2.43.0
>>
>>
