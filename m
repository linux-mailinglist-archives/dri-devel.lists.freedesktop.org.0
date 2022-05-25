Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA50533A6D
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 12:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843EC10E6E9;
	Wed, 25 May 2022 10:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E320810EA31
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 10:08:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 968391F44BDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653473309;
 bh=f7K6y+dJjMBoG72vq/rLJZEBSpBO8+vaOYzhtZ/0Lls=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KMyTR4v/JWGVhJKk8F7Kdw/mFlyVJgFd4MfDTQIIS7bjrD53k8B3IpL0ilhdwuPS8
 hdm4xxgCAWA8PaU5bE9mLyfPPO1XBZWqYpHt1ZZuDYqvBynJfAVQhTJOFP04DvutTt
 6eE528/1CT/39gQnZP+PsH3AYSohwz6tk+QEzFrMqkXTzDKrjVFaLmuf73Xvn4q6eg
 YwXptzgTCh2d3GMQQh5soNMjNe9tSOqQxAhchyITrk+m9GRLVdSECYZ3R/U3o9xrO/
 PMapcVFMXP3AZ0/2/cqdonoKvv/DkHkul+lKDM27wDMcsGXBeQwF1e3Y3JBJmBsRBU
 h6NY3FQroIg0w==
Message-ID: <79863f1b-7bdd-61c7-2209-23011d8e1558@collabora.com>
Date: Wed, 25 May 2022 12:08:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v21 00/25] Add MediaTek SoC DRM (vdosys1) support for
 mt8195
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, "Nancy.Lin"
 <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220512053128.31415-1-nancy.lin@mediatek.com>
 <8c6ceb14be7e53a7dab9d6f045a48deaef54f683.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8c6ceb14be7e53a7dab9d6f045a48deaef54f683.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 18/05/22 04:47, Rex-BC Chen ha scritto:
> On Thu, 2022-05-12 at 13:31 +0800, Nancy.Lin wrote:
>> The hardware path of vdosys1 with DPTx output need to go through by
>> several modules, such as, OVL_ADAPTOR and MERGE.
>>
>> Add DRM and these modules support by the patches below:
>>
>> Changes in v21:
>> - fix reviewer comment
>>    - fix rdma and ethdr binding doc and dts
>>

..snip..

> 
> Hello Matthias,
> 
> Could you also spare some time to give us some suggestion for the mmsys
> and mutex patches of this series?
> If we can improve anything, we can do it before 5.19.
> Thanks for your big support!
> 
> BRs,
> Rex
> 

Even though there may be something to further improve, keep in mind that we're
already at v21... that's... a lot of versions, and vdosys0/1 are practically
tied together even though they're coming from two different engineers.

I can confirm that this entire stack works on the new HW as intended and that
there's no regression on older ones, so on all patches you can add my:

[Tested on MT6795, MT8173, MT8192, MT8195]
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


.... BUT! ....


This series won't apply cleanly anymore on next-20220525 (same for vdosys0,
already pinged Jason about it) because of the commits adding support for MT8186,
so *please rebase this series once again*.


Cheers,
Angelo
