Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6393B7B2E23
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 10:43:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA1810E6EF;
	Fri, 29 Sep 2023 08:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5863210E6E1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 08:43:03 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 00D826607342;
 Fri, 29 Sep 2023 09:43:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695976981;
 bh=uiFIr0QtcCv98GNZksTz1IxuKJn0A6If3Wrm+S+R9Dc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eJoJRtp1NC059atmmhRsvEF31BihjtVtAugFx9dlHoCrFMBZh1jrGhteZOlo7RtkQ
 lnd8AHDTWkDdCIK+dU4OKIxtlycUe2lQzyaHoPniUsh9504Jfx5K2Q2Xo2ivAMIR5y
 lZ0Wgvy5icrDdyae2/OPe8IfKJm4NVH6i7Z1QfGsAo3HHSmGrpwsXVNCD1wt9pTl8W
 sfDdjupPGdPFFqDZcxRGfx1uIrxFP8kzYqO70uBvOtPFpvG+t9ZDwvJFv7jCFWuueV
 pD63I9XS/sLFkPbSWcXovtm+qQ7OQLva188CiILIbcZDUrtKapgfnyTyr0EWLfYlSD
 zzETDP2l5hs7A==
Message-ID: <7dbadd86-f408-bc94-92fc-22f460eebb43@collabora.com>
Date: Fri, 29 Sep 2023 10:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v6 12/16] dt-bindings: display: mediatek: color: add
 compatible for MT8195
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?=
 <Moudy.Ho@mediatek.com>
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-13-moudy.ho@mediatek.com>
 <20230922-zebra-modify-87ff23c70bb3@spud>
 <20230922-overhung-deception-e9b461ba0372@spud>
 <7c445195e17e15d5af5fcb30ae53f76c713e958b.camel@mediatek.com>
 <20230927-crunching-prancing-36fe3eb79607@wendy>
 <825ac03b692043d48563620ad9542a4ee43211e7.camel@mediatek.com>
 <20230928-keep-attractor-1e7cd0df03b2@spud>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230928-keep-attractor-1e7cd0df03b2@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/09/23 18:49, Conor Dooley ha scritto:
> On Thu, Sep 28, 2023 at 02:52:23AM +0000, Moudy Ho (何宗原) wrote:
>> On Wed, 2023-09-27 at 10:47 +0100, Conor Dooley wrote:
>>> On Wed, Sep 27, 2023 at 07:19:28AM +0000, Moudy Ho (何宗原) wrote:
>>>> On Fri, 2023-09-22 at 16:51 +0100, Conor Dooley wrote:
>>>>> On Fri, Sep 22, 2023 at 04:49:14PM +0100, Conor Dooley wrote:
>>>>>> On Fri, Sep 22, 2023 at 03:21:12PM +0800, Moudy Ho wrote:
>>>>>>> Add a compatible string for the COLOR block in MediaTek
>>>>>>> MT8195
>>>>>>> that
>>>>>>> is controlled by MDP3.
>>>>>>>
>>>>>>> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
>>>>>>> ---
>>>>>>>   .../devicetree/bindings/display/mediatek/mediatek,color.yaml
>>>>>>>      
>>>>>>>   | 1 +
>>>>>>>   1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git
>>>>>>> a/Documentation/devicetree/bindings/display/mediatek/mediatek
>>>>>>> ,col
>>>>>>> or.yaml
>>>>>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek
>>>>>>> ,col
>>>>>>> or.yaml
>>>>>>> index f21e44092043..b886ca0d89ea 100644
>>>>>>> ---
>>>>>>> a/Documentation/devicetree/bindings/display/mediatek/mediatek
>>>>>>> ,col
>>>>>>> or.yaml
>>>>>>> +++
>>>>>>> b/Documentation/devicetree/bindings/display/mediatek/mediatek
>>>>>>> ,col
>>>>>>> or.yaml
>>>>>>> @@ -26,6 +26,7 @@ properties:
>>>>>>>             - mediatek,mt2701-disp-color
>>>>>>>             - mediatek,mt8167-disp-color
>>>>>>>             - mediatek,mt8173-disp-color
>>>>>>> +          - mediatek,mt8195-mdp3-color
>>>>>>
>>>>>> How come this one is a "mdp3" not a "disp"?
>>>>>
>>>>> I don't know what mdp3 means & googling gives me no answers.
>>>>> What's
>>>>> the
>>>>> "disp" one controlled by, since it isn't controlled by mdp3?
>>>>>
> 
>>>> Mediatek's Media Data Path ver.3 (MDP3) is associated with MMSYS
>>>> and
>>>> acts as an independent driver that operates between VDEC and DISP.
>>>> By controlling multiple components, it carries out tasks like
>>>> converting color formats, resizing, and applying specific Picture
>>>> Quality (PQ) effects.
>>>> The driver can be found at "driver/media/platform/mediatek/mdp3".
>>>> Since the same hardware components are configured in both MDP3 and
>>>> DISP, considering previous discussions, I attemped to integrate
>>>> into a
>>>> single binding, named after the controlling user.
>>>
>>> I'm still kinda struggling to understand this. Do you mean that the
>>> hardware can be controlled by either of the disp and mdp3 drivers,
>>> and
>>> a compatible containing "disp" would use one driver, and one
>>> containing
>>> "mdp3" would use another?
>>>
> 
>> Sorry for any confusion caused by the software information. In the
>> video pipeline, after decoding, the data flows sequentially through two
>> subsystems: MDP and DISP. Each subsystems has multiple IPs, with some
>> serving the same functionality as COLOR mentioned here. However, these
>> IPs cannot be controlled by different subsystems. Therefore, I included
>> the name of the subsystem after SoC to identify the configuration's
>> location. Is this approach feasible?
> 
> I'll have to leave things to the likes of Laurent to comment here I
> think. I don't understand this hardware well enough to have a useful
> opinion. It would seem like a different part of the datapath is a
> different device that should be documented separately, but I don't know
> enough to say for sure, sorry.

Hardware speaking, it's not a different device: those all reside in the
same block, except they are configured to route their I/O *either* to the
display pipeline, *or* to the MDP3 pipeline.

I would agree though in that this could be more flexible, as in, not
having a requirement to say "mdp3" or "disp", and managing the COLOR
blocks generically and letting the drivers to choose the actual path
transparently from what the devicetree compatible is, but there's no
practical point in doing this in the end, because there is an enough
number of (for example, COLOR) blocks such that one can be completely
reserved to MDP3 and one completely reserved to DISP.

So, we don't *need* this flexibility, but would be nice to have for
different (unexistant, basically) usecases...

The thing is, if we go for the maximum flexibility, the drawback is
that we'd see a number of nodes like

shared_block: something@somewhere {
	compatible = "mediatek,something";
}

mdp3: dma-controller@14001000 {
	......
	mediatek,color = <&color0>;
	mediatek,stitch = <&stitch0>;
	mediatek,hdr = <&hdr0>;
	mediatek,aal = <&aal0>;
	....
	long list of another 10 components
}

display: something@somewhere {
	......
	an even longer list than the MDP3 one
}

...or perhaps even a graph, which is even longer in the end.

I'm not against this kind of structure, but I wonder if it's worth it.

Cheers,
Angelo
