Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0892284B64F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 14:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDAC112BD8;
	Tue,  6 Feb 2024 13:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iYWDzEEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AB1112BD8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707226033;
 bh=hQ+QP63TDympmBm6f1787+x8JkcNvVe7bh5SVgAcn5c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iYWDzEEnv1nWRcUIeci/q5vSYZZ9aUERduKYgiTOqA/Kd60fzZRLg84hRqzdEewZh
 ZFSXZPdOHreGQCVnMMudxUFLJuT/6V+AA7WialF6TuGeV0lUtV5I4f1m0k12ipSrSJ
 pzlUIjNbWWX2NDZSwoXRuOZqLwWhQ8Kc90oohMV+Qw8dXBoD/1ZDLkiv1WuR6vBw6y
 L63+4nUOmSSH4qTZlG76DWRn81skPu0ZaCKYI2MclYNREMPdHmOjc06yGoWq8UZi93
 I+KNZaAEroMP2M5BNfaCtvpHpZuNUQQGoidab5TVMPXbcp1k+dgsoRF2fXCWfbjzdU
 i4HRrDMGCssEg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 69A233782072;
 Tue,  6 Feb 2024 13:27:12 +0000 (UTC)
Message-ID: <4fe9947f-b190-4dcc-8d1e-f532e6dcb827@collabora.com>
Date: Tue, 6 Feb 2024 14:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] drm/mediatek: dsi: Use GENMASK() for register mask
 definitions
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20240131113434.241929-1-angelogioacchino.delregno@collabora.com>
 <20240131113434.241929-2-angelogioacchino.delregno@collabora.com>
 <082bc4d9efd0746d7ec25eab0b3bf96018e997e5.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <082bc4d9efd0746d7ec25eab0b3bf96018e997e5.camel@mediatek.com>
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

Il 06/02/24 09:57, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Wed, 2024-01-31 at 12:34 +0100, AngeloGioacchino Del Regno wrote:
>> Change magic numerical masks with usage of the GENMASK() macro
>> to improve readability.
>>
>> While at it, also fix the DSI_PS_SEL mask to include all bits instead
>> of just a subset of them.
>>
>> This commit brings no functional changes.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 45 +++++++++++++++-------------
>> --
>>   1 file changed, 23 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index a2fdfc8ddb15..3b7392c03b4d 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -58,18 +58,18 @@
>>   
>>   #define DSI_TXRX_CTRL		0x18
>>   #define VC_NUM				BIT(1)
>> -#define LANE_NUM			(0xf << 2)
>> +#define LANE_NUM			GENMASK(5, 2)
>>   #define DIS_EOT				BIT(6)
>>   #define NULL_EN				BIT(7)
>>   #define TE_FREERUN			BIT(8)
>>   #define EXT_TE_EN			BIT(9)
>>   #define EXT_TE_EDGE			BIT(10)
>> -#define MAX_RTN_SIZE			(0xf << 12)
>> +#define MAX_RTN_SIZE			GENMASK(15, 12)
>>   #define HSTX_CKLP_EN			BIT(16)
>>   
>>   #define DSI_PSCTRL		0x1c
>> -#define DSI_PS_WC			0x3fff
>> -#define DSI_PS_SEL			(3 << 16)
>> +#define DSI_PS_WC			GENMASK(14, 0)
>> +#define DSI_PS_SEL			GENMASK(19, 16)
> 
> The original definition of DSI_PS_WC/DSI_PS_SEL is correct in MT8173.
> So both need two definition and let each SoC select its own definition.
> 

The additional bits are unused on older SoCs and, if set, will be simply ignored;
if we want to prevent setting bits that don't exist on the old ones, that should
be done as a later commit introducing SoC capabilities for those and when the new
capabilities for the new SoCs are introduced anyway.

As of now, this doesn't break anything.

Regards,
Angelo


