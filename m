Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED803987064
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 11:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA9910EB7F;
	Thu, 26 Sep 2024 09:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="HZGLDGGc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39F310EB7F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1727343503;
 bh=7p82Z+0K/eh4XfuDiQGpTvGvbH3Kqj994es0zyo9h2o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HZGLDGGcTzSqmFrsD6xl58A2Yj+XdU/wYAjesI8ExXUhHFBFFPXDYHLguwq/Qmh9j
 zhw+ZoLkrcGpwTWsV9LzzD0CUaZUKZI+6V4BbdiaAj0pKYa1PiFfBmgliB8/c74O0C
 j468Yl+8mDdbBU9b0OsZcPfwd5/CqnNCfp91OauB6YwsUc486MARmTYQPeIoweIgWU
 5oG7xbgOX0pwfO0n2eJlL8gBwpwQKqaOZwoyWuaYbig1wcFpPn16FEGhIkSmsNqJgV
 qbopcnutnivTro5SNGl4CssyrbK3dO7XkhLD3qL+K1BvLqKxUpZW/jcUexE012XBoM
 elcSX6ScQOYFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 36D2117E10AF;
 Thu, 26 Sep 2024 11:38:22 +0200 (CEST)
Message-ID: <7a1315ef-4be5-4528-858b-9f07c814636d@collabora.com>
Date: Thu, 26 Sep 2024 11:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] dt-bindings: display: mediatek: Fix clocks count
 constraint for new SoCs
To: Conor Dooley <conor@kernel.org>, Macpaul Lin <macpaul.lin@mediatek.com>
Cc: moudy.ho@mediatek.com, macross.chen@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang
 <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>, MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-3-macpaul.lin@mediatek.com>
 <ffc1900b-3921-48ca-a2b2-1b798c57e572@collabora.com>
 <20240924-commute-collision-13ad39717d31@spud>
 <2821ef09-1b32-082d-69d1-e09a3a302447@mediatek.com>
 <20240925-satisfy-epidermal-bd414891479a@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240925-satisfy-epidermal-bd414891479a@spud>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 25/09/24 16:34, Conor Dooley ha scritto:
> On Wed, Sep 25, 2024 at 04:42:59PM +0800, Macpaul Lin wrote:
>>
>> On 9/25/24 00:00, Conor Dooley wrote:
>>> On Tue, Sep 24, 2024 at 01:42:01PM +0200, AngeloGioacchino Del Regno wrote:
>>>> Il 24/09/24 12:31, Macpaul Lin ha scritto:
>>>>> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
>>>>> to an excessively long 'clocks' property:
>>>>>      display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
>>>>>
>>>>> To resolve this issue, add "maxItems: 3" to the 'clocks' property in
>>>>> the DT schema.
>>>>>
>>>>> Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
>>>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>>>> ---
>>>>>     .../devicetree/bindings/display/mediatek/mediatek,split.yaml     | 1 +
>>>>>     1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>>>>> index e4affc854f3d..42d2d483cc29 100644
>>>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
>>>>> @@ -57,6 +57,7 @@ properties:
>>>>>       clocks:
>>>>>         items:
>>>>>           - description: SPLIT Clock
>>>>
>>>> That's at least confusing (granted that it works) - either add a description for
>>>> each clock and then set `minItems: 1` (preferred), or remove this "SPLIT Clock"
>>>> description and allow a maximum of 3 clocks.
>>>>
>>>> Removing the description can be done - IMO - because "SPLIT Clock" is, well,
>>>> saying that the SPLIT block gets a SPLIT clock ... stating the obvious, anyway.
>>>
>>> Right, but what are the other two new clocks? Are they as obvious?
>>> There's no clock-names here to give any more information as to what the
>>> other clocks are supposed to be.
>>>
>>> Kinda unrelated, but I think that "SPLIT Clock" probably isn't what the
>>> name of the clock in the IP block is anyway, sounds more like the name
>>> for it on the provider end..
>>
>> Thanks for the suggestions. I think Moudy could help on the new fixes
>> for both DT schem and mt8195.dtsi. This patch could be separated from
>> origin patch set.
> 
> Not sure what you mean about separating it, if you mean correcting the
> description for the split clock sure. The other stuff I mentioned needs
> to be resolved before I'm willing to ack this.

He means separating this patch from the rest of the series that he pushed - which
is okay, as it's a bit mixed anyway :-)

Besides ... Moudy, can you please help to clarify the description of those clocks?

Cheers,
Angelo
