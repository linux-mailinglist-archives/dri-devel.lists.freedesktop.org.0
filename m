Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E954F5BC5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B7410E5E9;
	Wed,  6 Apr 2022 10:51:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4D410E5E9
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:51:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5357A1F40EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649242298;
 bh=au3kCGpBvELGj1O6aCEDgSZw3PDmNnTwCgo2ZapgbJY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k8lcVf8I9OjzL+Yob0GKMFrCpB3OMWOSdFSJ1vEdCc/3LPY7XhF7g1KGHrHyO7+Je
 akVMl7CsoT5V5aCZINzeQhUH3RmtO9hQyQdMsksPUFuULZiaZVd7i/CI08Yx0999Qc
 uKMhT0MPfHPsCxFNq3wbodLtSinV4mCnKSe+cwWmSz1Bi9RAIMl5ZoguOabgGmDeoM
 W2tiM8+ihWlLanFyMB1oKFA3yGBon14UGi/jwC7d12ikEczIYrXo8dHHsAA2tPDWtP
 zpSLlIDK0j0/ObDa8X5bXKRqjWkuXUbN+HivTzFDsR7F2AgbuzmpX2TksYqkyRS0Na
 bv7dX0vBwdH1Q==
Message-ID: <0e6d110d-0637-2be8-cab0-9d936668fa7b@collabora.com>
Date: Wed, 6 Apr 2022 12:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8192
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-4-rex-bc.chen@mediatek.com>
 <2449070b-d7e1-122f-abe6-4148855a9aba@collabora.com>
 <4ed2dc24d600fa73b91bb411391c98a5bf4f8d8b.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4ed2dc24d600fa73b91bb411391c98a5bf4f8d8b.camel@mediatek.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?= <yongqiang.niu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/04/22 12:48, Rex-BC Chen ha scritto:
> On Wed, 2022-04-06 at 18:40 +0800, AngeloGioacchino Del Regno wrote:
>> Il 06/04/22 11:46, Rex-BC Chen ha scritto:
>>> The driver data for MT8192 is the same with MT8183. Therefore, we
>>> correct it.
>>>
>>> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>
>> ...though, from what I know, you should also move MT8195 down there!
> 
> Hello Angelo,
> 
> Thanks for your review.
> But for MT8195, disp_aal is using the same compatible with MT8173.
> 
>  From the MT8195 project DTS is using:
> 
> aal0: disp_aal@1c005000 {
> 	compatible = "mediatek,mt8195-disp-aal",
> 		     "mediatek,mt8173-disp-aal";
> 	reg = <0 0x1c005000 0 0x1000>;
> 	interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
> 	power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
> 	clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
> 	mediatek,gce-client-reg =
> 		 <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
> };
> 
> BRs,
> Rex
> 

I'm sorry Rex, I've just realized - I was confusing this one with the
8195 gamma binding instead!

Cheers,
Angelo
