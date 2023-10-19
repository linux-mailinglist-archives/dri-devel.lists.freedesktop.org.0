Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6986D7CF4EA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 12:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A694F8825B;
	Thu, 19 Oct 2023 10:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1E010E4B2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 10:17:17 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B35136607322;
 Thu, 19 Oct 2023 11:17:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697710635;
 bh=0P71wcdmZeNDRgq2k3g+efA5oDtGoggSn0l1TpQZ17k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ttpn6UU4pcVlAK9qmpH2/G52og116jTuzlfzkXrQlp+kr/iFMn+jZ7pj3wdRYK4Uk
 DGRUSWSidFaLwUL7IObs7lYi43ktQUdnUwE8/L63vPmpT6TYRg7Z9dlf5AbyGus2fs
 abwR9bFieb8jZpsER4FUP1W3sck4RS53F0T2jrobMfN5BY+JAyS/s2kFWN9d5J5t3u
 z6KAbfY6K8NNxU11N7LqnGC0T03FhbnfaE0lYNeN2dWW672oOPcpFtgzCqFDdFGmQK
 5FDEeeXbRAsIuHfLUOAjhLUbLscwsaa24tySuE1e2ajXuZcBSI5tYd/9QE9TCpqskn
 Zqtu4MHWRPdFw==
Message-ID: <0fd83158-5f7c-4f0b-95ff-5857668ab9e8@collabora.com>
Date: Thu, 19 Oct 2023 12:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/24] drm/mediatek: Remove ineffectual power
 management codes
Content-Language: en-US
To: =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
 <20231019055619.19358-16-shawn.sung@mediatek.com>
 <5a059ca0-fcb7-4730-a0d8-29103fb71d54@collabora.com>
 <2313a4b08f57ab24b48a13a31845eed7e0ab042d.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2313a4b08f57ab24b48a13a31845eed7e0ab042d.camel@mediatek.com>
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
Cc: =?UTF-8?B?TmF0aGFuIEx1ICjlkYLmnbHpnJYp?= <Nathan.Lu@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "johnson.wang@mediatek.corp-partner.google.com"
 <johnson.wang@mediatek.corp-partner.google.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/10/23 11:52, Shawn Sung (宋孝謙) ha scritto:
> Hi Angelo,
> 
> On Thu, 2023-10-19 at 11:07 +0200, AngeloGioacchino Del Regno wrote:
>> Il 19/10/23 07:56, Hsiao Chien Sung ha scritto:
>>> Display modules will be powered on when .atomic_enable(),
>>> there is no need to do it again in mtk_crtc_ddp_hw_init().
>>> Besides, the DRM devices are created manually when mtk-mmsys
>>> is probed and there is no power domain linked to it.
>>>
>>> Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC
>>> MT8173.")
>>>
>>> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
>>> ---
>>>    drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 +++---------------
>>>    1 file changed, 3 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> index bc4cc75cca18..c7edd80be428 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>>> @@ -6,7 +6,6 @@
>>>    #include <linux/clk.h>
>>>    #include <linux/dma-mapping.h>
>>>    #include <linux/mailbox_controller.h>
>>> -#include <linux/pm_runtime.h>
>>>    #include <linux/soc/mediatek/mtk-cmdq.h>
>>>    #include <linux/soc/mediatek/mtk-mmsys.h>
>>>    #include <linux/soc/mediatek/mtk-mutex.h>
>>> @@ -362,22 +361,16 @@ static int mtk_crtc_ddp_hw_init(struct
>>> mtk_drm_crtc *mtk_crtc, struct drm_atomic
>>>    		drm_connector_list_iter_end(&conn_iter);
>>>    	}
>>>    
>>> -	ret = pm_runtime_resume_and_get(crtc->dev->dev);
>>> -	if (ret < 0) {
>>> -		DRM_ERROR("Failed to enable power domain: %d\n", ret);
>>> -		return ret;
>>> -	}
>>> -
>>
>> Are you really sure that writes to DISP_REG_OVL_xxx and others in
>> other modules,
>> called by the .layer_config() callback, can be successfully done on
>> an unpowered
>> and/or unclocked module, on all MediaTek SoCs?
>> This looks a bit odd.
> 
> Not sure if I get your point correctly. We removed this PM API because:
> 
> 1. mtk_crtc_ddp_hw_init() is called by mtk_drm_crtc_atomic_enable(),
> and the new inline function mtk_ddp_comp_power_on() is called before hw
> init, we can make sure the power is on before configuring the hardware.
> 
> 2. The device "crtc->dev->dev" here is assigned by the probe function
> of mtk-mmsys, which will be look like "mediatek-drm.auto.13", and this
> device is not linked to any power domain.
> 

Thanks for the clarification. In this case:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>>
>>>    	ret = mtk_mutex_prepare(mtk_crtc->mutex);
>>>    	if (ret < 0) {
>>>    		DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
>>> -		goto err_pm_runtime_put;
>>> +		goto error;
>>>    	}
>>>    
>>>    	ret = mtk_crtc_ddp_clk_enable(mtk_crtc);
>>>    	if (ret < 0) {
>>>    		DRM_ERROR("Failed to enable component clocks: %d\n",
>>> ret);
>>> -		goto err_mutex_unprepare;
>>> +		goto error;
>>>    	}
>>>    
>>>    	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
>>> @@ -426,16 +419,13 @@ static int mtk_crtc_ddp_hw_init(struct
>>> mtk_drm_crtc *mtk_crtc, struct drm_atomic
>>>    
>>
>> ...because you could otherwise just call pm_runtime_put() here,
>> instead of removing
>> the pm_runtime_resume_and_get() call, which is something I would
>> advise to do.
>>
>> Regards,
>> Angelo
>>
> 
> Thanks,
> Shawn


