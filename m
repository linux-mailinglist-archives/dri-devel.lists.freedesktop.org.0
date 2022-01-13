Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8048D53B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 11:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF9410E6C6;
	Thu, 13 Jan 2022 10:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E52D10E6C6
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 10:11:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E4E661F4585E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642068704;
 bh=D/XYC6ZGl5zYQW2bPb5HgmDBOTYg/Taj7564Kp6Xo1w=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=mE4sw4YvYqPtPCeGgdYDQbOGYr1D0sRwnP4JUyOyjhZj86DL2KdqFn53kzdPhLzVf
 Bw1VvaPOhimlqvAni2KTggbrrVF2tMVgZUYZ8GT3HumFLMHl/swIw8OEmuB63xYT9D
 ry4EVMAhrR1d8HMl2egIRfzRMjosarxVeMM5DKaB83CPATfsl/FDKcekgbGiXopEIL
 MnHuCbLxWgj6rZKBy6qsMzCkq0MxYh4lCNn7zCBOc/+l8UBmSPACrlbKg9pzt44nrH
 jFeTmjYUIPMAWJwQeXwYslmZrcg0H+P/WZvI2jlUHmT8gdPkXem6ziG4wdUDcl9DH5
 E8ZqIX9/NoQSw==
Subject: Re: [PATCH v9 12/15] media: mtk-vcodec: enc: Remove
 mtk_vcodec_release_enc_pm
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-13-yong.wu@mediatek.com>
 <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
Message-ID: <4bd9e849-96dd-6f1c-2841-979459366ee5@collabora.com>
Date: Thu, 13 Jan 2022 11:11:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
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

Il 11/01/22 11:57, AngeloGioacchino Del Regno ha scritto:
> Il 12/11/21 11:55, Yong Wu ha scritto:
>> After this patchset, mtk_vcodec_release_enc_pm has only one line.
>> then remove that function, use pm_runtime_disable instead.
>>
>> meanwhile, mtk_vcodec_init_enc_pm only operate for the clocks,
>> rename it from the _pm to _clk.
>>
>> No functional change.
>>
>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>> CC: Irui Wang <irui.wang@mediatek.com>
>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

Hello Yong,
the mtk-vcodec patches were merged in Yunfei's vcodec patch series and Hans has
scheduled that for v5.18.

Can you please send a v10 and drop patches 10/15, 11/15, 12/15 (all of the
media: mtk-vcodec: *) from this series?

For the records, I think that after sending v10 this series is ready to be merged,
as it was well reviewed and also tested on many MTK platforms.

Thank you,
- Angelo
