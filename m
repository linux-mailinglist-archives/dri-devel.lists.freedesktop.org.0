Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DBD160CD7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A6B6E81D;
	Mon, 17 Feb 2020 08:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32A66E5D1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:19:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 5E10528D7ED
Subject: Re: [PATCH v7 01/13] dt-bindings: arm: move mmsys description to
 display
To: Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 matthias.bgg@kernel.org
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
 <20200213201953.15268-2-matthias.bgg@kernel.org>
 <1581662577.17949.3.camel@mtksdaap41>
 <2bda2dd7-9ed2-8b4c-897e-e585ccfa1fa5@gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <022e8f64-b414-67a5-722e-bdd7c00230ff@collabora.com>
Date: Fri, 14 Feb 2020 13:19:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <2bda2dd7-9ed2-8b4c-897e-e585ccfa1fa5@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: mark.rutland@arm.com, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, linux-clk@vger.kernel.org,
 drinkcat@chromium.org, Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>,
 sboyd@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi CK,

On 14/2/20 11:01, Matthias Brugger wrote:
> 
> 
> On 14/02/2020 07:42, CK Hu wrote:
>> Hi, Matthias:
>>
>> On Thu, 2020-02-13 at 21:19 +0100, matthias.bgg@kernel.org wrote:
>>> From: Matthias Brugger <mbrugger@suse.com>
>>>
>>> The mmsys block provides registers and clocks for the display
>>> subsystem. The binding description should therefore live together with
>>> the rest of the display descriptions. Move it to display/mediatek.
>>>
>>
>> Yes, for the upstreamed driver, only display (DRM) use mmsys clock. For
>> some MDP patches [1] in progress, MDP also use mmsys clock. So we just
>> consider what's upstreamed now?
> 

Let me jump into the discussion, and sorry if my question is silly because I'm
just starting to look at this code.

IMO we should consider all the cases to find a proper fix on all this, and if
MDP uses also mmsys clocks this approach will not work. I think the main problem
here and the big question is what exactly is the MMSYS block, is an independent
clock controller that provides clocks to DRM and other blocks? or is hardly tied
to the DRM block in some way?

Could you give us a block schema on how the things are interconnected?

If is an independent clock controller I think there was a mistake when the first
drm driver was pushed by using the compatible = "mediatek,mt8173-mmsys" as id
for that driver.

Thanks,
 Enric


> I'm not sure if I understand you correctly. Are you proposing to keep the
> binding description in arm/mediatek?
> 
> Regards,
> Matthias
> 
>>
>> [1] https://patchwork.kernel.org/patch/11140747/
>>
>> Regards,
>> CK
>>
>>> Signed-off-by: Matthias Brugger <mbrugger@suse.com>
>>>
>>> ---
>>>
>>> Changes in v7:
>>> - move the binding description
>>>
>>> Changes in v6: None
>>> Changes in v5: None
>>> Changes in v4: None
>>> Changes in v3: None
>>> Changes in v2: None
>>>
>>>  .../bindings/{arm => display}/mediatek/mediatek,mmsys.txt         | 0
>>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>>  rename Documentation/devicetree/bindings/{arm => display}/mediatek/mediatek,mmsys.txt (100%)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
>>> similarity index 100%
>>> rename from Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>>> rename to Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
