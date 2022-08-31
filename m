Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 024F35A77F8
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 09:47:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23A0E10E21F;
	Wed, 31 Aug 2022 07:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B73E10E220
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 07:47:43 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C8206601688;
 Wed, 31 Aug 2022 08:47:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661932061;
 bh=W0y4oUWuQ2sZvJSfYO8MdMV3XL/CKswNqbqU/lyBoyw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ln16OWmxMVHFq6RDvuyB5G4weOtKDPCtEvlw/LKzyRI6QvqpqazUNDh6p7Y8kzufF
 gRJwaOpeFU/rIfp6mbRB/lBHK2aUjmb8QIB1hTdoME0XKp3BlF7ga6nC4112pkglzZ
 jmCuklfEHfDvmXPeTiGBJOkG7rRf9DtvFS5RhwJb8kpUoUjyZZ3ufojMvr1lzMCdJq
 4q0SUs+ox5wdPLjqxMy6+gnh1ELoTZkB+V1TBlYa1H9Tlemp1Rj1uhVwQIiWjTjPnq
 Za9XmZaGxAERAKVxeD9rEo07KZxRpodMEZnlDWL0SD04POTQ+XCBi/AjhOj3pJ3skX
 DnoBqoYG+wbHQ==
Message-ID: <2620c49f-1e55-efb0-bd21-ab8567030485@collabora.com>
Date: Wed, 31 Aug 2022 09:47:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
 <a209aea3-bf23-4670-91d0-e7f41ac57833@collabora.com>
 <bf2b277e-8b02-6a44-e463-6b7c4a697ce7@linaro.org>
 <b61776761eb0ab9a0b1dcf29d908e4bfd789d2ac.camel@mediatek.com>
 <22eb5611-84e2-23e9-f70b-48bef351133f@linaro.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <22eb5611-84e2-23e9-f70b-48bef351133f@linaro.org>
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 31/08/22 08:04, Krzysztof Kozlowski ha scritto:
> On 31/08/2022 05:29, zheng-yan.chen wrote:
>> On Tue, 2022-08-30 at 12:14 +0300, Krzysztof Kozlowski wrote:
>>> On 30/08/2022 10:49, AngeloGioacchino Del Regno wrote:
>>>> Il 30/08/22 08:39, zheng-yan.chen ha scritto:
>>>>> Modify gamma compatible for mt8195.
>>>>>
>>>>> Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for
>>>>> vdosys0")
>>>>> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
>>>>
>>>> Reviewed-by: AngeloGioacchino Del Regno <
>>>> angelogioacchino.delregno@collabora.com>
>>>
>>> Please also perform review on the commit msg and backport status.
>>>

Ack.

Cheers,
Angelo

>>> Best regards,
>>> Krzysztof
>> Hello Krzysztof,
>> Thanks for the review,
>> I will fix it at the next version.
> 
> This was to AngeloGioacchino...
> 
> Best regards,
> Krzysztof

