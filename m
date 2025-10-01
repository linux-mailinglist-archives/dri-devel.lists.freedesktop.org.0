Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F68CBB1574
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 19:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BF010E45B;
	Wed,  1 Oct 2025 17:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="ksINNn9R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA61410E45B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 17:17:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759339054; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=g6eeKVe8q5UYu/Zyv+4f8spD2OVynk46aIqjrhPwvud4pg/yFU6GJ8m/Y+1A38QxhJIyMHo9XvP2zVwJvaf/koqQdRI7iWsrnIYH03ufiggiwoc8wIKBaqBtmNuHNS3TWVaLJgEmt6Fefs8/PbI5VQDaVTNFQ38gfghwAncUdSI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759339054;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=SkWCXVZn9oQwr9fOneaWYc16aLwPTVni5B0m5Fk1lXU=; 
 b=PXCmVyZKF60Fi3lkeBl8zsfau5T0mvo/+YUBztmCZGuI3hDgh8QllEmRMfQbbgGMoKMd6NpZArnRZfrbBQ6qU0VMrSsDFscLsUkiHKPlNfxm2mHOvEE/MuGlBOc92dOt6bAR2SQCSepwaMg2H0rHrr1SVIUaN7fmLbAM2i5Vss8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759339053; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=SkWCXVZn9oQwr9fOneaWYc16aLwPTVni5B0m5Fk1lXU=;
 b=ksINNn9Ry5kbkov/RYjCPthrjeR/B3ir8QZC1VLMfigTV/SQeRC/9naX5P5o+oQt
 gcY1Xc/8D9yh670ZLUBONiSf31YNccaNSXJ9MVf3Ct2t0tT28Smz/yZBpoLObK3k8S4
 J9608xI9dzJLMBP3t+Ok40Iuj+DdtKnf3vUZ3udU=
Received: by mx.zohomail.com with SMTPS id 175933905208321.77046877084581;
 Wed, 1 Oct 2025 10:17:32 -0700 (PDT)
Message-ID: <a3b54ec9-e4d7-4d56-8493-f40be81f803e@collabora.com>
Date: Wed, 1 Oct 2025 14:17:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/12] MediaTek dt-bindings sanitization (MT8173)
To: Rob Herring <robh@kernel.org>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, heiko@sntech.de, houlong.wei@mediatek.com,
 jeesw@melfas.com, kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
 <20250923214834.GC91441-robh@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250923214834.GC91441-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Rob,

On 9/23/25 6:48 PM, Rob Herring wrote:
> On Thu, Sep 11, 2025 at 12:09:49PM -0300, Ariel D'Alessandro wrote:
>> This patch series continues the effort to address Device Tree validation
>> warnings for MediaTek platforms, with a focus on MT8173. It follows the
>> initial cleanup series by Angelo [0].
>>
>> Similarly to the ongoing MT8183 work done by Julien Massot, this patchset
>> eliminates several of the remaining warnings by improving or converting DT
>> bindings to YAML, adding missing properties, and updating device tree files
>> accordingly.
>>
>> [0] https://www.spinics.net/lists/kernel/msg5780177.html
>>
>> Changes in v2:
>> * Wrapped commit messages to 75 columns line wrap.
>> * Replaced "YAML" by "DT schema" in patches subject and content.
>> * mt8173-mdp: Fixed properties: compatible, clocks, iommus and
>>    mediatek,vpu.
>> * mt8173-vpu: Fixed line wrap. Dropped memory-region property description.
>> * mediatek,mmsys: Dropped patch as it's not a binding issue.
>> * mediatek,od: Rewrote commit log with details on DT schema users missing
>>    the related property. Rewrote mediatek,gce-client-reg property.
>> * mediatek,ufoe: Rewrote commit log with details on DT schema users missing
>>    the related property. Rewrote mediatek,gce-client-reg property.
>> * marvell,sd8897-bt: Moved to net/bluetooth/. Added missing ref to
>>    bluetooth-controller.yaml. Dropped example. Updated reference in another
>>    file. Minor fixes in properties.
>> * mediatek,mt8173-rt5650: Dropped unnecessary quotes and unused label.
>> * dlg,da9211: Dropped enable-gpios description. Rewrote generic example
>>    node names. Minor fixes in properties.
>> * melfas,mip4_ts: Dropped unnecessary quotes. Added "active high" to
>>    ce-gpios property description.
>> * mediatek,jpeg: Dropped patch as it doesn't apply.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>>
>> Ariel D'Alessandro (12):
>>    dt-bindings: media: Convert MediaTek mt8173-mdp bindings to DT schema
>>    dt-bindings: media: Convert MediaTek mt8173-vpu bindings to DT schema
>>    dt-bindings: net: Convert Marvell 8897/8997 bindings to DT schema
>>    dt-bindings: ASoC: Convert MediaTek RT5650 codecs bindings to DT
>>      schema
>>    dt-bindings: display: mediatek,od: Add mediatek,gce-client-reg
>>      property
>>    dt-bindings: display: mediatek,ufoe: Add mediatek,gce-client-reg
>>      property
>>    arm64: dts: mediatek: mt8173: Fix mt8173-pinctrl node names
>>    dt-bindings: pinctrl: mt65xx: Allow gpio-line-names
>>    dt-bindings: regulator: Convert Dialog DA9211 Regulators to DT schema
>>    arm64: dts: mediatek: mt8173-elm: Drop unused bank supply
>>    dt-bindings: soc: mediatek: pwrap: Add power-domains property
>>    dt-bindings: input: Convert MELFAS MIP4 Touchscreen to DT schema
> 
> As we're close to the merge window, I applied patches 2, 8, and 11.

Great, I can see that patches 5 and 6 were also applied (with small 
modifications).

Thanks!

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

