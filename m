Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C93F7CA11F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 10:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E3A10E12D;
	Mon, 16 Oct 2023 08:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE0310E12D
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 08:01:21 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id CB32D66072AF;
 Mon, 16 Oct 2023 09:01:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1697443280;
 bh=1qoI2NcTPM67udTkaBwYJkrXK+5Ym0B+bxwOJZO701U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Vv+mGcDMzBLHWwbe4xCV03VQR6rzeihSWz5RrABE6IOYAxc1bk/uQQrxK4hZT4nUz
 Hn9T2oOmbNoOGhR3vdx34V0K3HDznRoWYK5cridCg61u69n8jnnOCS77xKwdj0RsTy
 jtzWSD7Wu8MSbJvxCWWPeaKmFTDJfubF07EUgNViZJOpmffzupOGgT3bNyZSO8vQHd
 z4BqEYr7Nkjb3/SMwkB2PIu3HnR+UCdYgzdS8IwtYv3pfhKtesFBKfZGbCt3UyUA/W
 LsaMVWUAiDn7v0C5xPCaOKNfVroN3mzuJd8bdnMO5E+ZBEsU8LEblGeHaBIFF5rbUc
 SRWXKKqWGBqDg==
Message-ID: <b1f42bab-7670-c099-8c7a-882f7268b358@collabora.com>
Date: Mon, 16 Oct 2023 10:01:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v7 15/16] dt-bindings: display: mediatek: split: add
 compatible for MT8195
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20231012084037.19376-1-moudy.ho@mediatek.com>
 <20231012084037.19376-16-moudy.ho@mediatek.com>
 <e58ecc95-5133-4542-8178-338583bca2ab@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <e58ecc95-5133-4542-8178-338583bca2ab@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 13/10/23 08:52, Krzysztof Kozlowski ha scritto:
> On 12/10/2023 10:40, Moudy Ho wrote:
>> Add compatible string and GCE property for MT8195 SPLIT, of
>> which is operated by MDP3.
>>
>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> 
> 
>> +allOf:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: mediatek,mt8195-mdp3-split
>> +
>> +    then:
>> +      required:
>> +        - mediatek,gce-client-reg
> 
> else:
>    mediatek,gce-client-reg: false
> 
> 

Technically, all of the display components do support GCE, using it is
a matter of preference, so disallowing gce-client-reg on anything that
is not mt8195-mdp3-split is *technically* wrong, as much as not having
that from the beginning was also technically wrong... :-)

P.S.: The driver for the display split component doesn't use GCE yet,
only mdp3 for now, but again, it's the driver - while the HW is actually
capable of using that

Cheers,
Angelo

>> +
>>   additionalProperties: false
>>   
>>   examples:
> 
> Best regards,
> Krzysztof
> 

