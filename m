Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3667A45C4
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 11:21:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB8B10E05D;
	Mon, 18 Sep 2023 09:21:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7D410E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Sep 2023 09:21:49 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B3D036607122;
 Mon, 18 Sep 2023 10:21:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695028908;
 bh=YTlzKMW/0OtSmibUGJ5lMjEhNq6syCtetx5FkGedM/w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IUliO9kmejttZPTVRZez6rnPT7OS5T+Qf1DXTQM+X++CktDVCCcKuKKE7qKBPUuy6
 Rfdhj3t0dg+0JkTe4HQXUV0xRZzYWE4OGHv+7wU8mWVZ5vZffenwVhJGWVQuLog2Jp
 o7dJq3b70+HpD4zH0LtLUAsZHIGedZGjaRo/W7vEJmCefJUdFEYnvzvBK7ftK9RDxz
 rEAJjdkhy7ZiOqwQGdi/WvhFqdyNos035QxNEBjOe1+AKUF0qzIRgH606gwqsZ2rys
 uzVlD3OPthQ75PZx2Komo5izvdmK2MP6iahgc91VW4OAAUtiltmuisyW8PdB2f5pj2
 qX2FRu6yUB4+w==
Message-ID: <30cc93a5-b3de-d23f-fd4d-e695551a71e3@collabora.com>
Date: Mon, 18 Sep 2023 11:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 04/11] drm/mediatek: Add OVL compatible name for MT8195
Content-Language: en-US
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
References: <20230918084207.23604-1-shawn.sung@mediatek.com>
 <20230918084207.23604-5-shawn.sung@mediatek.com>
 <ffcf35cb8ca1ff0fe0a0f0176e3199b9c944b3b9.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ffcf35cb8ca1ff0fe0a0f0176e3199b9c944b3b9.camel@mediatek.com>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/09/23 11:09, CK Hu (胡俊光) ha scritto:
> On Mon, 2023-09-18 at 16:42 +0800, Hsiao Chien Sung wrote:
>> Add OVL compatible name for MT8195.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> but it's weird to put this patch into IGT series. Without this patch,
> mt8195 drm driver does not work not only IGT.
> 

The driver does work because the devicetree node declares two compatibles,
"mediatek,mt8195-disp-ovl", "mediatek,mt8183-disp-ovl" where the second
compatible is matched in mtk_drm_drv, and the first is matched in mtk_disp_ovl
as both are platform_driver.

This commit is not necessary, even... :-)

Regards,
Angelo

> Regards,
> CK
> 
>>
>> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> index 93552d76b6e7..7759a06e5c0e 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
>> @@ -715,6 +715,8 @@ static const struct of_device_id
>> mtk_ddp_comp_dt_ids[] = {
>>   	  .data = (void *)MTK_DISP_OVL },
>>   	{ .compatible = "mediatek,mt8192-disp-ovl",
>>   	  .data = (void *)MTK_DISP_OVL },
>> +	{ .compatible = "mediatek,mt8195-disp-ovl",
>> +	  .data = (void *)MTK_DISP_OVL },
>>   	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
>>   	  .data = (void *)MTK_DISP_OVL_2L },
>>   	{ .compatible = "mediatek,mt8192-disp-ovl-2l",


