Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE3C6A4274
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 14:19:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FB1810E008;
	Mon, 27 Feb 2023 13:19:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2D610E008
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 13:19:13 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 21FCA6602EBB;
 Mon, 27 Feb 2023 13:19:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677503951;
 bh=M84hUc6FSjtfLLuQzMVefdgxCampFeISHt8LSmhyiIM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CDiCRdUU0NNxCM540FhfqUKkpo4mktrjuOYSHLlsZ13oHX2JlAsIydqSIIOir4PeH
 BmEw7i4EV1M0yfhKyziVFK634gam8zXe1GE3igvbIFD5f1ctEoQpDFbCkiF60YiRHn
 7hCyMAz6X7ahzt+xO6wqPYlnACJpPAGOZd41vWDaO9FM1FUyZf5XUAsSHnYwejfvHu
 Z9Yg89+hrrZBPLBwYW+TeM7N0ytvedykIhUPOrP8sRDqdMQDqIU3NzS/Gqj3s8GeBn
 tYkpcIH9Y/Ctre4OM0HYnqh0ed6KDfsy23E99j41mOaZIRfOcI6/y6eZX5dvTtWoE+
 hFB4Ml2GDtKwg==
Message-ID: <caddf39b-fb0d-c6ff-b98e-bbd5aac5f974@collabora.com>
Date: Mon, 27 Feb 2023 14:19:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 04/11] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8195 SoC
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-5-angelogioacchino.delregno@collabora.com>
 <CAGXv+5GJgAz4yvb-zvFwxRD2PGtkpV7gD-Lst9KDAaZDzLyDEg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5GJgAz4yvb-zvFwxRD2PGtkpV7gD-Lst9KDAaZDzLyDEg@mail.gmail.com>
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
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 24/02/23 11:08, Chen-Yu Tsai ha scritto:
> On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
>> same number of power domains and requirements as MT8192 in terms of
>> bindings.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>   Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> index 65fe139ceb83..4d9ab4702582 100644
>> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>> @@ -25,6 +25,11 @@ properties:
>>                 - rockchip,px30-mali
>>                 - rockchip,rk3568-mali
>>             - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
>> +      - items:
>> +          - enum:
>> +              - mediatek,mt8195-mali
> 
> This could be squashed into "- const: mediatek,mt8195-mali" like the
> following lines?
> 

Could be, but I expect more compatibles on this list, that's why I've modeled
that as enum. I prefer keeping this an enum.

> Otherwise,
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
>> +          - const: mediatek,mt8192-mali
>> +          - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
>>         - items:
>>             - enum:
>>                 - mediatek,mt8192-mali
>> --
>> 2.39.2
>>

