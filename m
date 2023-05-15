Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A02702F91
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:22:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92FC10E1F3;
	Mon, 15 May 2023 14:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99EA310E1F3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 14:22:43 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A2D5660309E;
 Mon, 15 May 2023 15:22:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1684160561;
 bh=ZZrfXP972sfV5Y+tOtvn+DgCDdAWngdy6rYVlJ53Otc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nTvbH8rGNM+fr5Lygp4cWg6duck3YxxkhOvtbsplOKtDQ1HQglqEcjiipdY8PxSEN
 QTnf2xgvII0Uvl+j4zAmcAeQgu9uiJ3hye55HrXARYljhnjKukdS1pAryXucUS3nO8
 cjcTHIoe82vvSoCik5qMY8z2/WM/Y9PbaGQ1irA39iH+ebeFWB+BdnBVLriCRtCgjt
 EH7hiIMi15sTTA4DaLIYci4Kepvjrv2fWQH2u4DaTIDP58MkxEibrgWLhldZ3WIhEP
 8/72IETEyXQN3Uxghx1Z1lLDgoZbZNh3CjE+E1b4oy4LnzWuN0Mlj8vdhS2B65tCSg
 WUD6EwY7zMkmQ==
Message-ID: <85500bcc-c5e8-8ce2-edea-233de86c2d35@collabora.com>
Date: Mon, 15 May 2023 16:22:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 2/2] phy: mtk-mipi-csi: add driver for CSI phy
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
References: <20230515090551.1251389-1-jstephan@baylibre.com>
 <20230515090551.1251389-3-jstephan@baylibre.com>
 <cd6067b2-660a-8f2c-697d-26814a9dc131@collabora.com>
 <ynrvqt24hjgng25r2xa3hxj35cvgotx7sdfrbqfjcvj3foegmr@4lqhen5yu6fh>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ynrvqt24hjgng25r2xa3hxj35cvgotx7sdfrbqfjcvj3foegmr@4lqhen5yu6fh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, chunkuang.hu@kernel.org,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Vinod Koul <vkoul@kernel.org>,
 "open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, krzysztof.kozlowski@linaro.org,
 linux-mediatek@lists.infradead.org, Andy Hsieh <andy.hsieh@mediatek.com>,
 Louis Kuo <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 "moderated list:ARM/Mediatek USB3 PHY DRIVER"
 <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 15/05/23 15:36, Julien Stephan ha scritto:
> On Mon, May 15, 2023 at 02:22:52PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 15/05/23 11:05, Julien Stephan ha scritto:
>   ..snip..
>>> +	port->is_cdphy = of_property_read_bool(dev->of_node, "mediatek,is_cdphy");
>>
>> This driver doesn't support C-PHY mode, so you either add support for that, or in
>> my opinion you should simply refuse to probe it, as it is *dysfunctional* for the
>> unsupported case (and might even introduce unstabilities).
>>
>> 	/* At the moment, only D-PHY mode is supported */
>> 	if (!port->is_cdphy)
>> 		return -EINVAL;
>>
>> Also, please don't use underscores for devicetree properties: "mediatek,is-cdphy"
>> is fine.
>>
> Hi Angelo,
> You are right this driver does not support C-PHY mode, but some of the
> PHYs themselves support BOTH C-PHY AND D-PHY. The idea of `is_cdphy` variable
> is to know if the CSI port supports BOTH C-PHY AND D-PHY or only DPHY.
> For example mt8365 has 2 PHYs: CSI0 and CSI1. CSI1 support only D-PHY,
> while CSI0 can be configured in C-PHY or D-PHY. Registers for CD-PHY and
> D-PHY are almost identical, except that CD-PHY compatible has some extra
> bitfields to configure properly the mode and the lanes (because supporting
> trios for CD-PHY).
> If C-PHY support is eventually added into the driver, I think we will need
> another variable such as `mode` to know the mode. I was also thinking
> of adding a phy argument to determine if the mode is C-PHY or D-PHY.
> 
> So here, I don't want to stop the probe if `is_cdphy` variable is set to
> true. Does it make sense ?
> 

Comments in the code convinced me that the other PHYs providing only C or D PHY
support weren't compatible at all with this driver.

I got it now - but at this point can you please add a comment in the code actually
clarifying that this driver supports both PHYs providing *only* D-PHY and ones
providing selectable C-or-D PHY?

That clarified, it would not make sense to stop probing if it's not a CDPHY because
as you said there might be a D-only PHY that would be actually supported here.

Regards,
Angelo


