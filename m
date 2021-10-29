Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6028843F71D
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 08:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D486E6E9E8;
	Fri, 29 Oct 2021 06:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213EC6E9E8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 06:23:50 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20211029062349euoutp029018cfb3b0296100114346e7ebf6d8b0~ybD47wbAp1633916339euoutp02B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 06:23:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20211029062349euoutp029018cfb3b0296100114346e7ebf6d8b0~ybD47wbAp1633916339euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1635488629;
 bh=rJ16FssYK3o7LcEoECG2olzcM+aoR3uflMZOGlL9z2Q=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ToP4I0ESZeDEyrx/v0jG1ExulRyZVqLOyU82twI3w6Lx12Qwv2vuyy8ebLuJI27Iu
 cmTOyTirQurCaYiNxS0Kn+MlRQ9hdJF98EbNj22JVQClzLmik9tM4oP0HOY6zjKOq/
 cId0ukBgokWQIdAEaUnS7NU96swCwIB39Pg7LRJ4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211029062348eucas1p1911581cc90dfb9c59e503f889ef3265f~ybD4fTuvS3253432534eucas1p12;
 Fri, 29 Oct 2021 06:23:48 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 78.A2.45756.4739B716; Fri, 29
 Oct 2021 07:23:48 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20211029062347eucas1p1431402205321b066349e3ccf432d2452~ybD3dXMeS2847628476eucas1p12;
 Fri, 29 Oct 2021 06:23:47 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211029062347eusmtrp2d106d12b8d6740de5d6ef01138956eb3~ybD3cJbze2979829798eusmtrp2u;
 Fri, 29 Oct 2021 06:23:47 +0000 (GMT)
X-AuditID: cbfec7f2-7bdff7000002b2bc-c2-617b9374b772
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id C2.E3.31287.3739B716; Fri, 29
 Oct 2021 07:23:47 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211029062346eusmtip25b68d65e896e0cc641cc382f9733a6d5~ybD2DQ9yw0961309613eusmtip2F;
 Fri, 29 Oct 2021 06:23:46 +0000 (GMT)
Message-ID: <73c13cf5-ca36-f47b-f53a-11d4f015505c@samsung.com>
Date: Fri, 29 Oct 2021 08:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [v6,02/21] drm/bridge: adv7511: Register and attach our DSI
 device at probe
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Thierry Reding
 <thierry.reding@gmail.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Jernej Skrabec <jernej.skrabec@gmail.com>, Sam
 Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, linux-arm-msm@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Rob Clark <robdclark@gmail.com>,
 Tian Tao <tiantao6@hisilicon.com>, Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, Kyungmin Park
 <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, Xinliang Liu
 <xinliang.liu@linaro.org>, John Stultz <john.stultz@linaro.org>,
 linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, Sean Paul
 <sean@poorly.run>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20211025151536.1048186-3-maxime@cerno.tech>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0yTVxje6XcrzUo+wI0zlGG6zMkIRUxnzoI2TLfk24yJS1xccIJVPxEH
 lbXcHFFZYaaAlwKO1VYRJ4tY5TJXQEgHWlYZYAuDQgwrl24uyMUpVymXMsqHG/+e532f93ne
 9+TwMV8TGcCPkyexCrksXkQK8OoHrrbQpIJ02aaLhvXonK2Zh248LMeQfeoZiS4PWgHK79fg
 aPBqOUAP50JR82gXjp70/Y6jmYV6AllVoxTKziuhUF6DlUKddZdJpG2r56FrY1U40s64ATKf
 34f6C3VLHtdmMDSuc2Ko1FUFUG/BrwBpC4ZI5KorwtGtkXoKGUfzCGRpMBCR65hnj76lGIet
 jWRqdb0U89eVnyhGr75EMNdNQzzmN00Hj3F0m0imZnqAYIqaP2X6c5t4TFNdD8WUFHaRzHmj
 ATA/t6YzE3fe3E1HCbYeZuPjUlhFmPSA4Gif+x6RWLY5bTLfgGeA9pAc4MWHtAT2/DlP5gAB
 35cuBdBmthAcmVwi6ucrnQkAa29mES9H/pjqXlHdALCxQINzZAxAS54N96iEtBSOvajAPBin
 34b328oIru4Dmy89Xta8Rh+E6n+yl7EfHQUXzlVQHozR/rDn8VWex3QNXYxDe+UFzEMwuhOH
 D1pmllUkHQ5znuaQHuxFvw/LbCrATQfBzCr98gCkrQKoGZ5dsuIvkQ+h07qHu8EPDjcZKQ6v
 g4u1XBqkMwF02soojpwFsFOlBZwqAjpss6THCKODYUVdGFf+APZYZjHO3xs+eurD7eAN86u/
 XykLofqML6feAHVN5f/F3m/vwDRApFv1LrpV9+tWXaP7P7cY4AbgzyYrE2JZZbicTRUrZQnK
 ZHms+NDxhDtg6YO3upvG74Irw2NiM+DxgRlAPiZaI+wsSpX5Cg/LTnzNKo7HKJLjWaUZrOXj
 In+hQX87xpeOlSWxX7JsIqt42eXxvQIyeJ9Rt/jy5+9dlIy7ukIcQf5PWqtzf9GCxV3ynujP
 E519zEz85hOqAeqQ8dQxu33ROP1R7Y6Ahv2ERjLil1icdnubaHKBenV6NvD0zTei9RucB9B2
 jalDsjYoTnowrNpHnX7SKbBku2OTMpgdO90b9d0XSkuHvuuSqrIz35mrm0+JGXG3Rw8GM+XX
 h+MqPxmy74RfuNqDR+f1Jd6vnwo8uesr1YsWaUuq5Oym3T+sX3jLbZ6fiGosHMC2bOyN2hO3
 NaTi471TEXvlgnuqwC1ai7jmtCaiJTJSnTFy5O/KlP1Hfrzrzt1+LKUxq0D5jb9qW5Yj1DFX
 OBdWs+8VicmSJj6zKMKVR2Xh72IKpexfsNDKnU8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTZxTH9/S+tHVjuasQ7lCnadZlkVgotuwp66omc7u6LIN9MERc2J3c
 AOGlpC0brhoYFDNraKgsBVuKNKKOKihqQQkDwWGtlYLWwsZLmQMDKqxhDqQrkLXgEr79zsv/
 f05ODgfhebAYTna+mlHm07l8fAPqWnH4dqiqNHS8qzMaDje7MVjhdrLghfvNCHw078dh7VQf
 gKfGK1E4daYZwPvBHdA540XhtO8BCheXOzHYVzrDhicMDWxo6OpjQ097LQ5r+jtZ0DpnR2HN
 4gqAPfo0OG40hTysiwj82/QYgT8H7ACOVf0KYE3VUxwG2utQePF5JxtenzFgsLfLhu3eQvl/
 K2dTo+5+nLppGmNTE5YWNmX+8TRGne14yqLuVj5kUaODHTjVtvAHRtU5U6jxkw4W5WgfZlMN
 Ri9O6a/bAHXNpaFeXH0nmTgolCkVhWpmW5ZCpf6InyaCCUKRFAoTxFKhaOcHXyUlSPhxclkG
 k5v9LaOMk38tzPKt3MIKmhKK/jllQ0vAQKwOcDkkISZH5gcxHdjA4RHnADnV+gN7rbCZdBpL
 sDXeSC4N6vC1Jj8gF9usq4UIQk7OvbyMhBklBGR3f9Or/Fuk8/QkGuYo4huytT4AwryROEgu
 V1xeHYAQ0eTw5BlW2DSSaEDJvx62oeEAITyhYKxv1YlHQPK4xb7qhBMiUjcbXoPL4RJSssld
 CtacEkmdXfeKt5JldjNSCXimdYuY1g00rZOY1knqAWoDkUyhKi8zTyUSqug8VWF+pvCwIu8q
 CH1X653AtRug7tmcsAewOKAHkByEHxnhqfuO5kVk0Ee+Z5SKdGVhLqPqAZLQNQxITNRhReg9
 89XposR4iUicKI2XSBN38qMj7JZL6Twik1YzOQxTwCj/17E43JgS1om45PKZc7GY3nfTv3+T
 bHv7h8yw1/KE3nPol03aHJtGX3zD8dNS9Wu+Wwt7cFeZfekA93GUEP1zbPT2eV8QT6F/F/ce
 ijdk5xwbmLW/3VK2pVpQ/K7h0+KoRkKgFVjvOeR7JU2pb/IHZo9OVKec9Ern5EuftZTLUg90
 i5efe6+YB/bS+tpp89FnHO2oskjLb65fMP5bMXLpiyO7ApvvRr4e1GSepdDgk9hkv2PfGwVp
 9t4sgUOTJM6pjvt4IrCt+1ia3jNuPO4qQ227UztaPGpzY6Nb6wh88jL1feT2xS/REf/n9K73
 rrwoIrbWBIdkk+UpQ5bpriFPadK8NWMfH1Vl0aLtiFJF/wdy1oYh5gMAAA==
X-CMS-MailID: 20211029062347eucas1p1431402205321b066349e3ccf432d2452
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211029062347eucas1p1431402205321b066349e3ccf432d2452
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211029062347eucas1p1431402205321b066349e3ccf432d2452
References: <20211025151536.1048186-3-maxime@cerno.tech>
 <CGME20211029062347eucas1p1431402205321b066349e3ccf432d2452@eucas1p1.samsung.com>
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

On 25.10.2021 17:15, Maxime Ripard wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time. Let's do this.
>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Tested-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

This patch landed in linux-next as commit 864c49a31d6b ("drm/bridge: 
adv7511: Register and attach our DSI device at probe"). Sadly it causes 
endless probe-fail-defer loop on DragonBoard 410c board 
(arch/arm64/boot/dts/qcom/apq8016-sbc.dts):

qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: PMIC 
REV: 1      CODEC Version: 1
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
source widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
source widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget ADC1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget ADC1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
source widget PDM_RX3 overwritten
debugfs: File 'Capture' in directory 'dapm' already present!
adv7511 3-0039: failed to find dsi host
adv7511 3-0039: supply dvdd not found, using dummy regulator
adv7511 3-0039: supply pvdd not found, using dummy regulator
adv7511 3-0039: supply a2vdd not found, using dummy regulator
debugfs: Directory '7708000.audio-controller' with parent 'DB410c' 
already present!
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: PMIC 
REV: 1      CODEC Version: 1
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
source widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
source widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget ADC1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget ADC1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
source widget PDM_RX3 overwritten
debugfs: File 'Capture' in directory 'dapm' already present!
adv7511 3-0039: failed to find dsi host
adv7511 3-0039: supply dvdd not found, using dummy regulator
adv7511 3-0039: supply pvdd not found, using dummy regulator
adv7511 3-0039: supply a2vdd not found, using dummy regulator
debugfs: Directory '7708000.audio-controller' with parent 'DB410c' 
already present!
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: PMIC 
REV: 1      CODEC Version: 1
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
source widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
source widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget ADC1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget ADC1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
sink widget PDM_RX1 overwritten
qcom,pm8916-wcd-spmi-codec 200f000.spmi:pmic@1:audio-codec@f000: ASoC: 
source widget PDM_RX3 overwritten
debugfs: File 'Capture' in directory 'dapm' already present!
adv7511 3-0039: failed to find dsi host
adv7511 3-0039: supply dvdd not found, using dummy regulator
adv7511 3-0039: supply pvdd not found, using dummy regulator
adv7511 3-0039: supply a2vdd not found, using dummy regulator
debugfs: Directory '7708000.audio-controller' with parent 'DB410c' 
already present!

...

Reverting it on top of linux next-20211028 'fixes' this issue.

> ---
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 9e3585f23cf1..f8e5da148599 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -910,9 +910,6 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
>   			return ret;
>   	}
>   
> -	if (adv->type == ADV7533 || adv->type == ADV7535)
> -		ret = adv7533_attach_dsi(adv);
> -
>   	if (adv->i2c_main->irq)
>   		regmap_write(adv->regmap, ADV7511_REG_INT_ENABLE(0),
>   			     ADV7511_INT0_HPD);
> @@ -1288,8 +1285,18 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>   	drm_bridge_add(&adv7511->bridge);
>   
>   	adv7511_audio_init(dev, adv7511);
> +
> +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535) {
> +		ret = adv7533_attach_dsi(adv7511);
> +		if (ret)
> +			goto err_unregister_audio;
> +	}
> +
>   	return 0;
>   
> +err_unregister_audio:
> +	adv7511_audio_exit(adv7511);
> +	drm_bridge_remove(&adv7511->bridge);
>   err_unregister_cec:
>   	i2c_unregister_device(adv7511->i2c_cec);
>   	clk_disable_unprepare(adv7511->cec_clk);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

