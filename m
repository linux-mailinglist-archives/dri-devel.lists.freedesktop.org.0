Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D74F690458
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0FB10E982;
	Thu,  9 Feb 2023 09:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4B810E982
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:58:54 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id B6A0D66020BA;
 Thu,  9 Feb 2023 09:58:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675936732;
 bh=hmwCcLx8WeTfeTxPPlEq4SNZKG/+gNYPhLzgXs1TNbM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Uhbxg3iE7yYU/WPGRsHACnAzEfaS2O2azB5IhRKIevyKca4aaC24X39aY3WBpu4Yc
 Fij8iU9I5DPTGaBNCSMiqogPn6ZuoTLeKRMGphrNsF0mu9UKDVX8+tYVYy4bcLS7dH
 jmJiiZxGVOvOIccfDoMKORomGWxE+CijIXlcuVkiVU787yNSXuMRT4e5v7lnatRr8z
 NhxCPFelQM6JFNEiKOq54ejABVV9nVg6/qc2WzoNnYo4NFxfpedlDX3E4pF+SJ6old
 WqbIbFQ3hVJvUGdSxngA7kKgu+KPuyWIFm8P33Uv8UXVjD/9DEFBZcL405q44d0jmG
 /OGCMtM/jb+zg==
Message-ID: <33ae8a64-277b-0c53-fcf3-f4eb2fccda49@collabora.com>
Date: Thu, 9 Feb 2023 10:58:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 5/9] dt-bindings: gpu: mali-bifrost: Add a compatible for
 MediaTek MT8186
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
 <20230208103709.116896-6-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FZqrGzzG8FrmLVzMd7=a23ZJPYGSy5yhYWgH+BFHNmxw@mail.gmail.com>
 <7784f5a2-3cfc-9999-0ad6-cb9cfc1f2822@collabora.com>
 <CAGXv+5EhDGuzoBA9ZV2=3PVZ209eFq+wOOcTGVvG+gmOnf5txQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EhDGuzoBA9ZV2=3PVZ209eFq+wOOcTGVvG+gmOnf5txQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, tomeu.vizoso@collabora.com,
 Fei Shao <fshao@chromium.org>, Nick Fan <Nick.Fan@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 09/02/23 10:45, Chen-Yu Tsai ha scritto:
> On Thu, Feb 9, 2023 at 5:20 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 09/02/23 09:49, Chen-Yu Tsai ha scritto:
>>> On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Get GPU support on MT8186 by adding its compatible.
>>>
>>> I'd skip MT8186 for now. We have to work out some binning details for the
>>> OPP, in particular how to deal with both Panfrost (or Mali) and SVS adding
>>> the OPP table. We were just looking at the Mali driver today.
>>>
>>
>> Dealing with binning is fairly easy... I have something already done for
>> that one, but I'm not sure that it would be the best option.
>> My solution makes use of opp-supported-hw by "standard means", but perhaps
>> let's have a separated conversation about it?
>>
>> I don't think that skipping this would give any benefit though, because
>> that is only adding a compatible and whatever binning support would have
>> to be generic and 99% not bound to any mediatek specific compatible.
> 
> The binning is related to voltage range, not maximum OPP. So it's more
> like fast/slow example in Documentation/devicetree/bindings/opp/opp-v2.yaml
> or the opp/allwinner,sun50i-h6-operating-points.yaml, minus the efuse node.
> 
> The downstream DT currently looks like this:
> 
> opp-950000000 {
>          opp-hz = /bits/ 64 <950000000>;
> 
> /* This is Mali specific; ignore
>          opp-hz-real = /bits/ 64 <950000000>,
>                        /bits/ 64 <950000000>;
> */
>          opp-microvolt = <900000>, <1000000>;
>          opp-microvolt-bin4 = <875000>, <975000>;
>          opp-microvolt-bin5 = <850000>, <950000>;
> };
> 

Yes, my option is, in short:

	opp-900000000 {
		opp-hz = /bits/ 64 <900000000>;
		opp-microvolt = <850000>;
		opp-supported-hw = <0xcf>;
	};

	opp-900000000-bin4 {
		opp-hz = /bits/ 64 <900000000>;
		opp-microvolt = <837500>;
		opp-supported-hw = <0x10>;
	};

	opp-900000000-bin5 {
		opp-hz = /bits/ 64 <900000000>;
		opp-microvolt = <825000>;
		opp-supported-hw = <0x20>;
	};



> 
> ChenYu



