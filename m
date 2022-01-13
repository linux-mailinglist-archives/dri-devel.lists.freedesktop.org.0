Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A848948D58B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 11:18:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90D610F2D8;
	Thu, 13 Jan 2022 10:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2838010F2F9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 10:17:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 45B681F45862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642069076;
 bh=T7qkUHIGvD2MBe7s1NOE5lt53pqK04MKOvifdF0rNoY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CyaAEO9rKcBvrFhGLZAoimPcLxSMEm92hJLMuMf+HJhwZKp4K+aDCaMMjizvaR73Q
 Inqb0z4Oz2NjS6TY824HPwSZlfAHNcxjIM3WWAawNuH4gMOfwLkOmN+2WDz5h+EZv8
 1+ifhD4rF61qu6rdox/qBG8zvqGFvGZwhrYJoyw8ohTL4g/pZtH4nT7f6V468ia4Tn
 5xuSfcNlzHQWInMD+bcG5dDvl+bPVWshrAptVXkEJt78UZjM8CImZgMC4Hd9hCeLda
 pI1WdpGlX+smpBtL/nBLQT3l3OFJZddqzu9xFL3EF2XfSemxDCqF6A72RKzQCtgBxG
 sYToruJydriyQ==
Subject: Re: [PATCH v9 12/15] media: mtk-vcodec: enc: Remove
 mtk_vcodec_release_enc_pm
To: Hans Verkuil <hverkuil@xs4all.nl>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-13-yong.wu@mediatek.com>
 <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
 <4bd9e849-96dd-6f1c-2841-979459366ee5@collabora.com>
 <fa9b2b73-c6bb-5737-93ac-ba2ab6b3b771@xs4all.nl>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d3f4896f-d254-e0fb-0d2a-e78fbe50d84d@collabora.com>
Date: Thu, 13 Jan 2022 11:17:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fa9b2b73-c6bb-5737-93ac-ba2ab6b3b771@xs4all.nl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 devicetree@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 acourbot@chromium.org, srv_heupstream@mediatek.com, yf.wang@mediatek.com,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/01/22 11:15, Hans Verkuil ha scritto:
> On 13/01/2022 11:11, AngeloGioacchino Del Regno wrote:
>> Il 11/01/22 11:57, AngeloGioacchino Del Regno ha scritto:
>>> Il 12/11/21 11:55, Yong Wu ha scritto:
>>>> After this patchset, mtk_vcodec_release_enc_pm has only one line.
>>>> then remove that function, use pm_runtime_disable instead.
>>>>
>>>> meanwhile, mtk_vcodec_init_enc_pm only operate for the clocks,
>>>> rename it from the _pm to _clk.
>>>>
>>>> No functional change.
>>>>
>>>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>>>> CC: Irui Wang <irui.wang@mediatek.com>
>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>
>> Hello Yong,
>> the mtk-vcodec patches were merged in Yunfei's vcodec patch series and Hans has
>> scheduled that for v5.18.
>>
>> Can you please send a v10 and drop patches 10/15, 11/15, 12/15 (all of the
>> media: mtk-vcodec: *) from this series?
>>
>> For the records, I think that after sending v10 this series is ready to be merged,
>> as it was well reviewed and also tested on many MTK platforms.
> 
> Good to know. When I have the v10 I'll try to prioritize reviewing it and running
> my usual tests.

Thank you Hans, that's very much appreciated!

> 
> Yong, please make sure you run 'checkpatch.pl --strict' over the v10 patches and fix
> any issues (using common sense).
> 
> Regards,
> 
> 	Hans
> 
>>
>> Thank you,
>> - Angelo
> 


