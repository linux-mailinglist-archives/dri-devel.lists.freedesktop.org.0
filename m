Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A678C450A
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 18:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2FA10E3D2;
	Mon, 13 May 2024 16:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with ESMTP id B208910E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 16:27:01 +0000 (UTC)
Received: from [172.38.8.164] (unknown [219.141.235.82])
 by mail (Coremail) with SMTP id AQAAfwBH+dknP0JmjBV4AA--.42648S3;
 Tue, 14 May 2024 00:26:17 +0800 (CST)
Message-ID: <4b6e49ee-d2fd-4e54-88d5-ab06d8ebf644@bosc.ac.cn>
Date: Tue, 14 May 2024 00:26:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm/bridge: adv7511: Attach next bridge without creating connector
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, biju.das.jz@bp.renesas.com, aford173@gmail.com,
 bli@bang-olufsen.dk, robh@kernel.org, jani.nikula@intel.com
References: <20240513080243.3952292-1-victor.liu@nxp.com>
Content-Language: en-US, en-AU
From: Sui Jingfeng <suijingfeng@bosc.ac.cn>
Organization: bosc
In-Reply-To: <20240513080243.3952292-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAfwBH+dknP0JmjBV4AA--.42648S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXF18XF1xtrWrJFWxCr4fAFb_yoW5Cw1rpF
 W2qFZ0yryrXF13GayDAr1UCas8Z39rJFWrJFZF93yFva4xWF1DZrWqyr1rCFy7JFWUJ3WY
 yr47JF18KF1kCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
 A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
 c2xSY4AK67AK6r1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
 6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
 xUsPl1DUUUU
X-CM-SenderInfo: xvxlyxpqjiv03j6e02nfoduhdfq/
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

Hi,


On 5/13/24 16:02, Liu Ying wrote:
> The connector is created by either this ADV7511 bridge driver or
> any DRM device driver/previous bridge driver, so this ADV7511
> bridge driver should not let the next bridge driver create connector.
> 
> If the next bridge is a HDMI connector, the next bridge driver
> would fail to attach bridge from display_connector_attach() without
> the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.
> 
> Add that flag to drm_bridge_attach() function call in
> adv7511_bridge_attach() to fix the issue.
> 
> This fixes the issue where the HDMI connector bridge fails to attach
> to the previous ADV7535 bridge on i.MX8MP EVK platform:
> 
> [    2.216442] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /hdmi-connector to encoder None-37: -22
> [    2.220675] mmc1: SDHCI controller on 30b50000.mmc [30b50000.mmc] using ADMA
> [    2.226262] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@30800000/i2c@30a30000/hdmi@3d to encoder None-37: -22
> [    2.245204] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc@0/bus@32c00000/dsi@32e60000 to encoder None-37: -22
> [    2.256445] imx-lcdif 32e80000.display-controller: error -EINVAL: Failed to attach bridge for endpoint0
> [    2.265850] imx-lcdif 32e80000.display-controller: error -EINVAL: Cannot connect bridge
> [    2.274009] imx-lcdif 32e80000.display-controller: probe with driver imx-lcdif failed with error -22
> 
> Fixes: 14b3cdbd0e5b ("drm/bridge: adv7511: make it honour next bridge in DT")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index dd21b81bd28f..66ccb61e2a66 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -953,7 +953,8 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
>   	int ret = 0;
>   
>   	if (adv->next_bridge) {
> -		ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge, flags);
> +		ret = drm_bridge_attach(bridge->encoder, adv->next_bridge, bridge,
> +					flags | DRM_BRIDGE_ATTACH_NO_CONNECTOR);

As a side note, I think, maybe you could do better in the future.

If we know that the KMS display driver side has the HDMI connector
already created for us, we should pass DRM_BRIDGE_ATTACH_NO_CONNECTOR
from the root KMS driver side. Which is to forbidden all potential
drm bridge drivers to create a connector in the middle.

The KMS display driver side could parse the DT to know if there is
a hdmi connector, or merely just hdmi connector device node, or
something else.

However, other maintainer and/or reviewer's opinion are of cause
more valuable. I send a A-b because I thought the bug is urgency
and it's probably more important to solve this bug first. And
maybe you can Cc: <stable@vger.kernel.org> if you like.

Thanks.

>   		if (ret)
>   			return ret;
>   	}

-- 
Best regards
Sui Jingfeng

