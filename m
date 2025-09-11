Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EC2B533E6
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA0210E0F9;
	Thu, 11 Sep 2025 13:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="Fk3d5f5c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD8810E0F9
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:38:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757597924; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cW8WQVw54kCwOrp4Z6nOM5zB+0ttwfZp2WlQWstN3VR5HDOvUIUqj7OMd52M9joD6VV4KN+dfh1dQl0/5irEs3WahGrue0xzDie3hjaV5tdBCW5k0AttByOZuRIZk3wFOzjsTr7EerdMeKTQT6Q0jEdxIQCRmWwkyus6WmtY4rc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757597924;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=z0wfAw1RoyH3XxGnHu3OjGHYgzFrel7esRCkMh235Uo=; 
 b=OeyfDXnfBQFt2RGO4gMm6yb7HyyWhJFSbXpukrZivXBHUSu4zZB8tX0p+rGZvOotIcQlOG+e+z+/2AUnulQ/1bXPqaS4dqL3N5WfURJHVehrqpu51EIbJ/iUuIEJYOINb4anVnFgKEZp2BKvmfJNvG1rj5/t+jyUxszFxqMpZ4w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757597924; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=z0wfAw1RoyH3XxGnHu3OjGHYgzFrel7esRCkMh235Uo=;
 b=Fk3d5f5c7xQh1L26LGxVS1MYZeolPRgvuj4odZIpMebZ02Z5jpCxFefRidPAF1ey
 NwGxrrIocLa0JWk6u1Dpzl1zGCrU4lt1loeAoSLF2sMV/6OmrnCFottPBZbgLe1Y1W+
 P4w+y0nD1DpQDK/sWlie56qNQMIlY8RyUyzFaKLM=
Received: by mx.zohomail.com with SMTPS id 175759792104776.9989768199938;
 Thu, 11 Sep 2025 06:38:41 -0700 (PDT)
Message-ID: <f4a18a08-516a-4a0b-a477-1e9f5269f1d8@collabora.com>
Date: Thu, 11 Sep 2025 10:38:23 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/14] media: dt-bindings: Convert MediaTek mt8173-mdp
 bindings to YAML
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com,
 edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com,
 jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com,
 krzk+dt@kernel.org, kuba@kernel.org,
 kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com,
 linus.walleij@linaro.org, louisalexis.eyraud@collabora.com,
 maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com,
 mchehab@kernel.org, minghsiu.tsai@mediatek.com, mripard@kernel.org,
 p.zabel@pengutronix.de, pabeni@redhat.com, robh@kernel.org,
 sean.wang@kernel.org, simona@ffwll.ch, support.opensource@diasemi.com,
 tiffany.lin@mediatek.com, tzimmermann@suse.de, yunfei.dong@mediatek.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-2-ariel.dalessandro@collabora.com>
 <20250821-silky-slug-of-novelty-e4bb64@kuoka>
 <d286ec0b-c8dc-4103-9aa3-2f40e0ade4a3@collabora.com>
 <5421cfe7-dfe0-4bb8-8722-6f449cd365be@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <5421cfe7-dfe0-4bb8-8722-6f449cd365be@kernel.org>
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

Krzysztof,

On 9/9/25 3:32 AM, Krzysztof Kozlowski wrote:
> On 08/09/2025 19:52, Ariel D'Alessandro wrote:
>> Krzysztof,
>>
>> On 8/21/25 3:46 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 20, 2025 at 02:12:49PM -0300, Ariel D'Alessandro wrote:

[...]

>>>> +          - enum:
>>>> +              - mediatek,mt8173-mdp-rdma
>>>> +              - mediatek,mt8173-mdp-rsz
>>>> +              - mediatek,mt8173-mdp-wdma
>>>> +              - mediatek,mt8173-mdp-wrot
>>>> +      - items:
>>>> +          - enum:
>>>> +              - mediatek,mt8173-mdp-rdma
>>>> +              - mediatek,mt8173-mdp-rsz
>>>> +              - mediatek,mt8173-mdp-wdma
>>>> +              - mediatek,mt8173-mdp-wrot
>>>> +          - const: mediatek,mt8173-mdp
>>>
>>> This makes no sense. How devices can be compatible and can not be
>>> compatible.
>>
>> According to the driver source code (and the previous txt mt8173-mdp
>> bindings), there must be a "controller node" with compatible
>> `mediatek,mt8173-mdp`. Then its sibling nodes (including itself) should
> 
> But you did not define "mediatek,mt8173-mdp" here, so what are you
> talking about?
> 
> I talk here about "wrot" and others, I thought it is obvious from the
> mistake in the schema.

Ack.

[...]

>>>> +
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: mediatek,mt8173-mdp
>>>
>>> This makes no sense either.
>>
>> Same question above about compatibles.
> 
> How same question? Do you understand this code? It is nothing the same -
> you have here contains!


Ack. Will resubmit properly in v2.

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

