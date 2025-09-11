Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDE8B533FC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5979210E376;
	Thu, 11 Sep 2025 13:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="NsRlRzli";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856EB10E376
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:41:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757598055; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Wd4WA6Er9cB9s6Hkt5aT6OBU5Qo5bfiy5l1P+Xa+5VFE3pcj0EYC1irYclVw44xfA/LGEE1P3H5NoyDRj8g5aYL5DO6LFfOSdTi8Xo68/Y7PYyTuxxfNdOv2I+XK48iy/vJy4GjAsgOcqTkVjb0ACFfdnqJgaw2FRauP6e/Vqb0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757598055;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=akxgWnU52qi2aW5V4nycRXC1MA1p0XXtUX8b0SkdlHI=; 
 b=LfUX1aQVAVFdHj8+y0//AJhf1fsHBn+VlpRO4LG22OXZv6/dMLXEYKunDdZoe364LrK8PnREgYhBB/fWBvWDinro5SWb85l1HU8gYCD9V+RoB8cvwAKdJEOq+hDpLHGB00DB6JJkrLd/THhPkaxSJdT3eQR6r8MibvY/ip2bat8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757598055; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=akxgWnU52qi2aW5V4nycRXC1MA1p0XXtUX8b0SkdlHI=;
 b=NsRlRzlifXvTvvkDhLOg2YrB9VbwSR8DvKqJVdp8u4HzCFR5KM3LbVsfzq9vFNLv
 HWBTS+duRr9SPP50E7s5ev8uzaDXlk5sQhS7q0jMxjng1FJa7tsWMU7IDEw8Cg44Nka
 20rr30YjpaoW+uxdoNzBf0ZcDiNq8aysDR0/skEo=
Received: by mx.zohomail.com with SMTPS id 1757598052583569.5590919976829;
 Thu, 11 Sep 2025 06:40:52 -0700 (PDT)
Message-ID: <c473c6ff-856a-4950-9c75-7bace41886ca@collabora.com>
Date: Thu, 11 Sep 2025 10:40:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/14] dt-bindings: arm: mediatek: mmsys: Add
 assigned-clocks/rates properties
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
 <20250820171302.324142-4-ariel.dalessandro@collabora.com>
 <20250821-electric-kestrel-of-awe-cb89dc@kuoka>
 <1cf0b296-adaa-4c80-864c-9b78f09cd3e3@collabora.com>
 <898bf39e-1b34-40e9-bdfa-ec4eca1c3f7d@kernel.org>
Content-Language: en-US
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <898bf39e-1b34-40e9-bdfa-ec4eca1c3f7d@kernel.org>
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

On 9/9/25 3:29 AM, Krzysztof Kozlowski wrote:
> On 08/09/2025 21:19, Ariel D'Alessandro wrote:
>> Krzysztof,
>>
>> On 8/21/25 3:43 AM, Krzysztof Kozlowski wrote:
>>> On Wed, Aug 20, 2025 at 02:12:51PM -0300, Ariel D'Alessandro wrote:
>>>> Current, the DT bindings for MediaTek mmsys controller is missing the
>>>> assigned-clocks and assigned-clocks-rates properties. Add these and
>>>
>>> No, they do not miss them. I don't understand why you are adding these.
>>
>> The reason I added these is due to the following check error:
>>
>> $ make -j$(nproc) CHECK_DTBS=y mediatek/mt8173-elm.dtb
>>     DTC [C] arch/arm64/boot/dts/mediatek/mt8173-elm.dtb
>> [...]
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtb: syscon@14000000
>> (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do
>> not match any of the regexes: '^pinctrl-[0-9]+$'
>> 	from schema $id:
>> http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
> 
> This is looking like missing clocks or other unevaluated property by the
> binding.

Agreed, the rate assignment has to be moved in other DT nodes, it's not 
a binding issue.

Thanks,

-- 
Ariel D'Alessandro
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK 
Registered in England & Wales, no. 5513718

