Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2B155751E
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:13:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D4A11A123;
	Thu, 23 Jun 2022 08:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C737411A123
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:13:27 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CA8A66016E1;
 Thu, 23 Jun 2022 09:13:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1655972006;
 bh=aKUeSQS7JjwmLoA51+Y/QiVigSc3OYpsPtreXvN2cyY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iCOPl6Mb1zctioVnRoo1h+YmE6mUnuFw6iO0R+k3aLmZKHCKnku7NBVDmt00tdhoN
 DhQE2vLNb8WLU+xrS2XgPH4MFO/HJ8LPVVJZR7V83SApXqioJXOHOLzBujAgm0PYCW
 Zki3btv0GC5UionwXKUjI+CLAY0lueTfh9o4u/dwYtALK60Su/15OzH+rDzbNnrZLm
 A+LS85neuTq48igqYhv8BjyuTWQg484OqXKz3PFsezICja8Ei/GbaeAHbZ9wPQFcul
 cAbmjq7ULZ1Nhhxk1lx9mWiFWL9yKSjbbtaQG3whgyH3mF9tJJx6ds9IDhYz1Nm0e2
 0bHCntzaXUQNg==
Message-ID: <ff4dc55c-bb87-ac15-2d39-1f1ed41f4221@collabora.com>
Date: Thu, 23 Jun 2022 10:13:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] soc: mediatek: mutex: add suffix 0 to
 DDP_COMPONENT_DITHER for mt8395
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Fabien Parent <fparent@baylibre.com>
References: <20220622131952.29583-1-jason-jh.lin@mediatek.com>
 <26854a9b-09c2-c14e-eabe-cfc574d6012e@collabora.com>
 <66d3a7719eb7797acfe3ccfd8ed0f710ea384023.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <66d3a7719eb7797acfe3ccfd8ed0f710ea384023.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/06/22 02:33, Jason-JH Lin ha scritto:
> Hi Angelo,
> 
> Yes, I missed that!
> So just forget about this patch and use yours.
> 
> Thanks for your help :)
> 

No worries, it happens...
Btw, you're welcome.

Cheers!

> Regard,
> Jason-JH.Lin
> 
> On Wed, 2022-06-22 at 15:31 +0200, AngeloGioacchino Del Regno wrote:
>> Il 22/06/22 15:19, Jason-JH.Lin ha scritto:
>>> Add suffix 0 to DDP_COMPONENT_DITHER for mt8395.
>>>
>>> Fixes: 141311b856d8 ("soc: mediatek: mutex: add MT8365 support")
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>
>>
>> Hello Jason-JH,
>>
>> you must've missed my commit, sent two days ago, which is doing the
>> same:
>>
>>
> https://lore.kernel.org/lkml/20220620102454.131417-1-angelogioacchino.delregno@collabora.com/T/#u
>>
>> Anyway, I have avoided to rename the definition, as from what I
>> understand
>> MT8365 has only one dither mod and that's called "DITHER", not
>> "DITHER0"...
>> ...but I've added the suffix to the array assignment, as that's what
>> we have
>> in the enumeration.
>>
>> I think that #define MT8365_MUTEX_MOD_DISP_DITHER should be kept as-
>> is.
>>
>> Also... this commit is not fixing anything, as it was already working
>> before,
>> so the Fixes tag shouldn't be present.
>>
>> Regards,
>> Angelo
>>
