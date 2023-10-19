Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C30117CF47C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 11:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E176810E4B4;
	Thu, 19 Oct 2023 09:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E2110E4B8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 09:55:55 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D69B6607322;
 Thu, 19 Oct 2023 10:55:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697709354;
 bh=yuKemI62+zc0hC6m7ajh4gUvLspeNsvwTUgJd0PrQ3o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=E+k7IAIeoa8vocqyyDDT6Qgjn08rqbP1ptYlde1udC3I9r3cjr+YmIzxYfs2e6I8d
 v2xXGzIDV2iJAhtGZuvIs+vT1EWsK8VLcqw9t9CljyD47vIeES+qVZ+iWhyWgjhE0Q
 eyYgJmxNqJVwzv3dHP/dy39xoJhtz7aLAM8B6FDBtuC25Q6Jk27X0MiFVljt9RE+IS
 KwuoiIpl/g2z7ES3crb5rRImtMi+zYQLtEMjge2AqTCXNJBMmz2ORq4jLETdDGxx9w
 FarTWHblGKqm0Q4bYpU/GJyzutFlVEQ/uLNNMp2zh/mYzE7LIdEmdoa+Z1zC1uKfGx
 QQDaY5h5eq5kw==
Message-ID: <fdeea37a-6683-44dd-b946-ee708a0b9000@collabora.com>
Date: Thu, 19 Oct 2023 11:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 20/24] drm/mediatek: Add Padding to OVL adaptor
Content-Language: en-US
To: =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
 <20231019055619.19358-21-shawn.sung@mediatek.com>
 <0a3b0755-73e3-4698-9a3a-be38578ceb3f@collabora.com>
 <9939f8f5fbc2fcc469db212cf53fd3be0231384f.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <9939f8f5fbc2fcc469db212cf53fd3be0231384f.camel@mediatek.com>
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

Il 19/10/23 11:20, Shawn Sung (宋孝謙) ha scritto:
> Hi Angelo,
> 
> On Thu, 2023-10-19 at 11:10 +0200, AngeloGioacchino Del Regno wrote:
>>>    static const struct of_device_id mtk_ovl_adaptor_comp_dt_ids[] =
>>> {
>>> +	{ .compatible = "mediatek,mt8188-padding", .data = (void
>>> *)OVL_ADAPTOR_TYPE_PADDING },
>>
>> Uhm, for consistency I'd call this "mediatek,mt8188-disp-padding"
>> (you don't have
>> to drop Reviewed-by tags for such a change, not here and not in the
>> yaml commit),
>> but it's fine if you have reasons against that.
>>
>> So, regardless of this being changed or not
>>
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>
>>>    	{ .compatible = "mediatek,mt8195-disp-ethdr", .data = (void
>>> *)OVL_ADAPTOR_TYPE_ETHDR },
>>>    	{ .compatible = "mediatek,mt8195-disp-merge", .data = (void
>>> *)OVL_ADAPTOR_TYPE_MERGE },
>>>    	{ .compatible = "mediatek,mt8195-vdo1-rdma", .data = (void
>>> *)OVL_ADAPTOR_TYPE_MDP_RDMA },
>>
> 
> Thanks for pointing this out. Had changed Padding driver's name to
> "mtk-disp-padding", but I just notice that Padding will also be used by
> MDP and they will share the same driver with display. Should we change
> the name again or is it just fine to use "mtk-disp-padding"?
> 

That's like many other components in MediaTek, so we can keep the mtk-disp-padding
name.... in devicetree, we will anyway use "mediatek,mt8195-mdp3-padding" as one of
the compatible string(s).

This is the only way that we have to actually distinguish between components used
for MDP3 and components used for the display subsystem, if we keep them "generic"
we won't understand what's going on in case of issues.

The driver name should contain "disp" for consistency with all of the component
drivers in mediatek-drm; if this wasn't in this folder, we could've dropped the
"disp" in the name, but that's not the case.

Consistency is #1.

Cheers,
Angelo

> Thanks,
> Shawn



