Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3916972BD4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 10:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2608F10E747;
	Tue, 10 Sep 2024 08:14:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="P6+nbddx";
	dkim=pass (1024-bit key; unprotected) header.d=amazonses.com header.i=@amazonses.com header.b="MSdY733J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 363 seconds by postgrey-1.36 at gabe;
 Tue, 10 Sep 2024 08:14:45 UTC
Received: from a7-40.smtp-out.eu-west-1.amazonses.com
 (a7-40.smtp-out.eu-west-1.amazonses.com [54.240.7.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEF310E747
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725955720;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=CMzM2OmUAjHBG7xyXlb5CqeG7AYsJx3XrH0ReYN+K80=;
 b=P6+nbddx9e8GQe8AEJCW5t1Wu7f5l0l96bnP+ujVgcAgIROuRWvJIdBhySUQsOtw
 j7Lt8UqBZNfztPGgr2ARPCEnl56LBm9jkfZf0QVfToehnx62GnGlNRMErQ+ChNLBb4Z
 r2GGVsh0pt3C//K7D2A6oQuCNUMNRSSF/Y65xC2lWU6p7bUmjbMiaq2iLsXx7oOVKOV
 I95MP0BzEtmWEcJQG134t3/sHo5NuSb3dODZ0MyM2H1QE/JpGjQmDxicFxhZNED7pR+
 aEL7JGQC1PCW1LWMH5FtGsZjq/xJ6X8hrh9SbVIkDmgqXdiae8NqFmflFz4f1lyifQv
 2ZI1Aee8lA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725955720;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
 bh=CMzM2OmUAjHBG7xyXlb5CqeG7AYsJx3XrH0ReYN+K80=;
 b=MSdY733JFvyqSrkXqPdO6T2dgUOs8csMz301DyjJ3BBiuHbsC/UDV8fx4LaXZQae
 oY+V2/L9RO7BgNdUoLzsEsTCawwLhgru3Q4yqIi4sL3zoBjs3KA5BjJm/se1Ny4FoA7
 1ZmGsBhP2uozcYc/b6rxC2EQEW0DD71Dfujeh9cc=
Message-ID: <01020191dafa43a8-cca2fb3f-7eda-4e39-9ca1-eccb78c566a4-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 08:08:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "sui.jingfeng@linux.dev" <sui.jingfeng@linux.dev>, 
 "wenst@chromium.org" <wenst@chromium.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 =?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>, 
 "mripard@kernel.org" <mripard@kernel.org>, 
 =?UTF-8?B?Sml0YW8gU2hpICjnn7PorrDmtpsp?= <jitao.shi@mediatek.com>, 
 "michael@walle.cc" <michael@walle.cc>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
 "robh@kernel.org" <robh@kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, 
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
 "kernel@collabora.com" <kernel@collabora.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 =?UTF-8?B?WXUtY2hhbmcgTGVlICjmnY7nprnnkosp?= <Yu-chang.Lee@mediatek.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "amergnat@baylibre.com" <amergnat@baylibre.com>
References: <20240618101726.110416-1-angelogioacchino.delregno@collabora.com>
 <20240618101726.110416-2-angelogioacchino.delregno@collabora.com>
 <3e58a224e6323e28c370d460fa72e23b958bcf62.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <3e58a224e6323e28c370d460fa72e23b958bcf62.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.40
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

Il 08/08/24 05:45, CK Hu (胡俊光) ha scritto:
> Hi, Angelo:
> 
> On Tue, 2024-06-18 at 12:17 +0200, AngeloGioacchino Del Regno wrote:
>> The display IPs in MediaTek SoCs support being interconnected with
>> different instances of DDP IPs (for example, merge0 or merge1) and/or
>> with different DDP IPs (for example, rdma can be connected with either
>> color, dpi, dsi, merge, etc), forming a full Display Data Path that
>> ends with an actual display.
>>
>> The final display pipeline is effectively board specific, as it does
>> depend on the display that is attached to it, and eventually on the
>> sensors supported by the board (for example, Adaptive Ambient Light
>> would need an Ambient Light Sensor, otherwise it's pointless!), other
>> than the output type.
>>
>> Add support for OF graphs to most of the MediaTek DDP (display) bindings
>> to add flexibility to build custom hardware paths, hence enabling board
>> specific configuration of the display pipeline and allowing to finally
>> migrate away from using hardcoded paths.
>>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
> 
> [snip]
> 
>>   
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
>> index 677882348ede..98db47894eeb 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
>> @@ -110,6 +110,28 @@ properties:
>>         include/dt-bindings/gce/<chip>-gce.h, mapping to the register of display
>>         function block.
>>   
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    description:
>> +      Input and output ports can have multiple endpoints, each of those
>> +      connects to either the primary, secondary, etc, display pipeline.
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: ETHDR input, usually from one of the MERGE blocks.
> 
> Sorry, I find one question now.
> I think ETHDR may have multiple input, and ETHDR receive data from all input at the same time.
> Why here has only one input port?
> 
> MERGE -->+-----------------+
>           |                 |
> MERGE -->|                 |
>           |      ETHDR      |
> MERGE -->|                 |
>           |                 |
> MERGE -->+-----------------+
> 

Because ETHDR takes one input (ex. "one image", or "one data stream") port, which
is composed of multiple input endpoints (where each endpoint is a MERGE block) :-)

Cheers,
Angelo

> Regards,
> CK
> 
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description:
>> +          ETHDR output to the input of the next desired component in the
>> +          display pipeline, for example one of the available MERGE blocks,
>> +          or others.
>> +
>> +    required:
>> +      - port@0
>> +      - port@1
>> +
>>   required:
>>     - compatible
>>     - reg
>>

