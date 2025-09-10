Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C79B51C6F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF99810E27F;
	Wed, 10 Sep 2025 15:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="H0jHV6yu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D729910E959
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 15:51:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757519478; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=i/p8AVc1BSekWX4Lt0Dw6EglB1upCj+tY/DuxcJdAKelj/805ap6QjnB2sy6CU4hs8AQVtSC9XTJeXT2YWaC7/kF1ukjvjy5E+FhYu0Il5ux3IKxX1sgRBDS+D6M5jDA2si7QOLHVHSPCN4UdV9LXVoI6LbJcSuxlppaxNOeszw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757519478;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=mipfafpKe4+epi8rhd9VJ21QHidqNimDzrKTJaqkwGE=; 
 b=SrfTp56rOukd1bPhU1vdDrOhe0AzS34sHk3Wu6wsqq7DFO/XQW6X7KXa3fB8iRIkjWyASiJSAQGg1M758xjUfqxM5usDXjSzVMJswWElqXp8oNLPHXEg0Ah/NfkInNB9acaEK3lbp0mPlC9XirzHHrZcVOU7lTr3a7ZB5mkayL0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757519478; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=mipfafpKe4+epi8rhd9VJ21QHidqNimDzrKTJaqkwGE=;
 b=H0jHV6yuSzKnuEQQ6ZummRHbYzEC6s23vy+gecAvVk4q+zdPaRfXyUsiDW45SgiY
 YQoq8ZVhkDgBo3pDR4uCWRhKZC3ONXuWa2MffuAMX8ndEqU98xYfQaHFgQmGUNybAW9
 Tr64L2Mc48Djjk/cg1JvyPmmiTsPJrhpkwtRkfyU=
Received: by mx.zohomail.com with SMTPS id 1757519475232994.3231024073066;
 Wed, 10 Sep 2025 08:51:15 -0700 (PDT)
Message-ID: <742b8fe9-bbff-4f36-ab81-33772aed2d6e@collabora.com>
Date: Wed, 10 Sep 2025 12:51:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: Rob Herring <robh@kernel.org>
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
 p.zabel@pengutronix.de, pabeni@redhat.com, sean.wang@kernel.org,
 simona@ffwll.ch, support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-14-ariel.dalessandro@collabora.com>
 <20250822155257.GA3865729-robh@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20250822155257.GA3865729-robh@kernel.org>
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

On 8/22/25 12:52 PM, Rob Herring wrote:
> On Wed, Aug 20, 2025 at 02:13:01PM -0300, Ariel D'Alessandro wrote:
>> Convert the existing text-based DT bindings for MELFAS MIP4 Touchscreen
>> controller to a YAML schema.
>>
>> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> ---
>>   .../input/touchscreen/melfas,mip4_ts.yaml     | 55 +++++++++++++++++++
>>   .../input/touchscreen/melfas_mip4.txt         | 20 -------
>>   2 files changed, 55 insertions(+), 20 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/melfas_mip4.txt
>>
>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
>> new file mode 100644
>> index 0000000000000..170fd4212467e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/touchscreen/melfas,mip4_ts.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/touchscreen/melfas,mip4_ts.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: MELFAS MIP4 Touchscreen
>> +
>> +maintainers:
>> +  - Ariel D'Alessandro <ariel.dalessandro@collabora.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: "melfas,mip4_ts"
> 
> Drop quotes. With that,
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Ack.

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

