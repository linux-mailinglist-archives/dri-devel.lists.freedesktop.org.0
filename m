Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D3BC04C20
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 09:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BDE710E9EC;
	Fri, 24 Oct 2025 07:38:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="YWKvLEZT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756A710E9EC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 07:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761291492;
 bh=4Q/i2AfvzaHtxQMuaNR55KE24+V/RETj+PZmgX0d3dE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YWKvLEZT6CiFPTHQkO1X2YLgdN/fTq1eAbHAhmwIb+c/iRejgob+HFVQx1mRW4AN8
 cDUVqfiIK/RdX/Qe81kVBwFlouVoTFHcoT95e3tilRkG6wytUFhNDo6FoIShQQKKtQ
 +p1K/ibluWb5qz4pysDWtJ5HLrP04pbO+UGN7nRPBLpP6yFayf9PRmTVg7vEPXCZUz
 Y5CfZGQltutBrf5MhmDnoZ5PeMMkTqncscpUNGj0emKHgwOeEg1ltu4lC6IRf3dhDt
 3VWEg0BRp+oUhMwRaj5hTfrqU1hpvrWG+N3HIkkLLWlSjL9oDIc4FcF5sJuU9pvTB1
 rDu3zssv/uLWw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B6A017E00AC;
 Fri, 24 Oct 2025 09:38:11 +0200 (CEST)
Message-ID: <8dbe85de-fc03-4b17-90ac-7b939a701a53@collabora.com>
Date: Fri, 24 Oct 2025 09:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 09/11] drm/mediatek: Introduce HDMI/DDC v2 for
 MT8195/MT8188
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 CK Hu <ck.hu@mediatek.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251023-mediatek-drm-hdmi-v2-v11-0-7873ec4a1edf@collabora.com>
 <20251023-mediatek-drm-hdmi-v2-v11-9-7873ec4a1edf@collabora.com>
 <CAAOTY_9o-hHv5Lrd+EKX_mN2PXDC+ifoxSsR6bf6oJdD=N=46A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAAOTY_9o-hHv5Lrd+EKX_mN2PXDC+ifoxSsR6bf6oJdD=N=46A@mail.gmail.com>
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

Il 24/10/25 03:05, Chun-Kuang Hu ha scritto:
> Hi, Louis:
> 
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> 於 2025年10月23日
> 週四 上午10:32寫道：
>>
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>> ---
>>   drivers/gpu/drm/mediatek/Kconfig            |    7 +
>>   drivers/gpu/drm/mediatek/Makefile           |    2 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.c  |    4 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi_common.h  |    9 +
>>   drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c  |  395 ++++++++
>>   drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h |  263 +++++
>>   drivers/gpu/drm/mediatek/mtk_hdmi_v2.c      | 1398 +++++++++++++++++++++++++++
>>   7 files changed, 2078 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
>> index 994b48b82d447c47391122e6ff2d139edb223536..c89ae4ed2c96123684ecd357314fa2d2ba5a4433 100644
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
>>
> 
> The checkpatch show this warning. Maybe other old description just has
> one line, I think it's better to have more information.
> Please provide more information and I would modify this patch when I apply it.
> 
> WARNING: please write a help paragraph that fully describes the config
> symbol with at least 4 lines
> #54: FILE: drivers/gpu/drm/mediatek/Kconfig:49:
> +config DRM_MEDIATEK_HDMI_V2
> +    tristate "DRM HDMI v2 IP support for MediaTek SoCs"
> +    depends on DRM_MEDIATEK
> +    select DRM_MEDIATEK_HDMI_COMMON
> +    help
> +      DRM/KMS HDMI driver for MediaTek SoCs with HDMIv2 IP
> 
> Regards,
> Chun-Kuang.

	help
	  Say yes here to enable support for the HDMIv2 IP and related
	  DDCv2 as found in the MediaTek MT8195, MT8188 SoCs and other
	  variants.

	  This driver can also be built as a module. If so, the HDMIv2
	  module will be called "mtk_hdmi_v2", and the DDCv2 module
	  will be called "mtk_hdmi_ddc_v2".

Cheers,
Angelo
