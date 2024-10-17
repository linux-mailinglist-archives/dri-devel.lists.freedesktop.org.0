Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0E39A1F97
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 12:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39C510E7E7;
	Thu, 17 Oct 2024 10:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EIW9+gK3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B9F10E7E7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 10:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729160339;
 bh=KeFu36mCItfWOePECeVZ+XeDaIlTzQ3wJJF1ACCR8i0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EIW9+gK301gAQ/bKH0OL+b8GExqE4i31EKVwqBPoMKE1Q+FjLRzKir2TjKUsc27dV
 kFOOyvtt+aXrn3PCcZxiRGNQJuh6rD0l1xODg0Tt1vWsx3QBpOezP5EU73dsne2Bkc
 RKQd03Nggc70KYWiAaxAhOpYQtUitperzhOBW/Ul9YZBDxAEdPIMMatI9vZSnsLFO6
 nDksj6gCfCQRGduKHTCem6DM9h5LxHJ5vyS3Nf92FxsK2tmZOPAh5FuLrXAJEdI7BK
 rYQW3abqSe8zNIoLydQ/jGHtdMBA20GjJtBPuNXnoiF/8Tp4+kiwVYe64rTkCCggok
 +Mm6tbdEv4ORA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 4553C17E137F;
 Thu, 17 Oct 2024 12:18:58 +0200 (CEST)
Message-ID: <1d4a042b-8138-4480-b61d-e12b470ef195@collabora.com>
Date: Thu, 17 Oct 2024 12:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
To: Rob Herring <robh@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, matthias.bgg@kernel.org,
 chunkuang.hu@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 wenst@chromium.org, kernel@collabora.com, sui.jingfeng@linux.dev,
 michael@walle.cc, sjoerd@collabora.com,
 Alexandre Mergnat <amergnat@baylibre.com>, Michael Walle <mwalle@kernel.org>
References: <20241014085148.71105-1-angelogioacchino.delregno@collabora.com>
 <20241014085148.71105-2-angelogioacchino.delregno@collabora.com>
 <CAL_Jsq+hpTPCkuXoCF88nyS_D+iFZB5osrt1q04RxffDsY7cXw@mail.gmail.com>
 <ec14b01e-7237-4f52-82a6-b8de42fb120b@collabora.com>
 <20241015134802.GB447702-robh@kernel.org>
 <e5612a1d-b609-4f4a-aec4-601f7060e4cf@collabora.com>
 <CAL_JsqLsFbJbLn76QYwzCfu+bmpjfsxCDp_OuKAFnktMXMbTBA@mail.gmail.com>
 <ff272e72-c5a2-4b67-a8c9-ee41219aa1bb@collabora.com>
 <CAL_JsqKXD=2zwckmNvCuZ2qyaopaxDE7WnaYUXkWPXBK2EYBQg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqKXD=2zwckmNvCuZ2qyaopaxDE7WnaYUXkWPXBK2EYBQg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 16/10/24 18:09, Rob Herring ha scritto:
> On Wed, Oct 16, 2024 at 10:26 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 16/10/24 16:00, Rob Herring ha scritto:
>>> On Wed, Oct 16, 2024 at 4:23 AM AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>
>>>> Il 15/10/24 15:48, Rob Herring ha scritto:
>>>>> On Tue, Oct 15, 2024 at 10:32:22AM +0200, AngeloGioacchino Del Regno wrote:
>>>>>> Il 14/10/24 19:36, Rob Herring ha scritto:
>>>>>>> On Mon, Oct 14, 2024 at 3:51 AM AngeloGioacchino Del Regno
>>>>>>> <angelogioacchino.delregno@collabora.com> wrote:
>>>>>>>>
>>>>>>>> The display IPs in MediaTek SoCs support being interconnected with
>>>>>>>> different instances of DDP IPs (for example, merge0 or merge1) and/or
>>>>>>>> with different DDP IPs (for example, rdma can be connected with either
>>>>>>>> color, dpi, dsi, merge, etc), forming a full Display Data Path that
>>>>>>>> ends with an actual display.
>>>>>>>>
>>>>>>>> The final display pipeline is effectively board specific, as it does
>>>>>>>> depend on the display that is attached to it, and eventually on the
>>>>>>>> sensors supported by the board (for example, Adaptive Ambient Light
>>>>>>>> would need an Ambient Light Sensor, otherwise it's pointless!), other
>>>>>>>> than the output type.
>>>>>>>>
>>>>>>>> Add support for OF graphs to most of the MediaTek DDP (display) bindings
>>>>>>>> to add flexibility to build custom hardware paths, hence enabling board
>>>>>>>> specific configuration of the display pipeline and allowing to finally
>>>>>>>> migrate away from using hardcoded paths.
>>>>>>>>
>>>>>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>>>>>>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>>>>>> Tested-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>>>>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>>>>>>> Tested-by: Michael Walle <mwalle@kernel.org> # on kontron-sbc-i1200
>>>>>>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>>>>> ---
>>>>>>>>      .../display/mediatek/mediatek,aal.yaml        | 40 +++++++++++++++++++
>>>>>>>>      .../display/mediatek/mediatek,ccorr.yaml      | 21 ++++++++++
>>>>>>>>      .../display/mediatek/mediatek,color.yaml      | 22 ++++++++++
>>>>>>>>      .../display/mediatek/mediatek,dither.yaml     | 22 ++++++++++
>>>>>>>>      .../display/mediatek/mediatek,dpi.yaml        | 25 +++++++++++-
>>>>>>>>      .../display/mediatek/mediatek,dsc.yaml        | 24 +++++++++++
>>>>>>>>      .../display/mediatek/mediatek,dsi.yaml        | 27 ++++++++++++-
>>>>>>>>      .../display/mediatek/mediatek,ethdr.yaml      | 22 ++++++++++
>>>>>>>>      .../display/mediatek/mediatek,gamma.yaml      | 19 +++++++++
>>>>>>>>      .../display/mediatek/mediatek,merge.yaml      | 23 +++++++++++
>>>>>>>>      .../display/mediatek/mediatek,od.yaml         | 22 ++++++++++
>>>>>>>>      .../display/mediatek/mediatek,ovl-2l.yaml     | 22 ++++++++++
>>>>>>>>      .../display/mediatek/mediatek,ovl.yaml        | 22 ++++++++++
>>>>>>>>      .../display/mediatek/mediatek,postmask.yaml   | 21 ++++++++++
>>>>>>>>      .../display/mediatek/mediatek,rdma.yaml       | 22 ++++++++++
>>>>>>>>      .../display/mediatek/mediatek,ufoe.yaml       | 21 ++++++++++
>>>>>>>>      16 files changed, 372 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>>>>>>>> index cf24434854ff..47ddba5c41af 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
>>>>>>>> @@ -62,6 +62,27 @@ properties:
>>>>>>>>          $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>>>>>          maxItems: 1
>>>>>>>>
>>>>>>>> +  ports:
>>>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>>>> +    description:
>>>>>>>> +      Input and output ports can have multiple endpoints, each of those
>>>>>>>> +      connects to either the primary, secondary, etc, display pipeline.
>>>>>>>> +
>>>>>>>> +    properties:
>>>>>>>> +      port@0:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description: AAL input port
>>>>>>>> +
>>>>>>>> +      port@1:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description:
>>>>>>>> +          AAL output to the next component's input, for example could be one
>>>>>>>> +          of many gamma, overdrive or other blocks.
>>>>>>>> +
>>>>>>>> +    required:
>>>>>>>> +      - port@0
>>>>>>>> +      - port@1
>>>>>>>> +
>>>>>>>>      required:
>>>>>>>>        - compatible
>>>>>>>>        - reg
>>>>>>>> @@ -89,5 +110,24 @@ examples:
>>>>>>>>                 power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>>>>>>>>                 clocks = <&mmsys CLK_MM_DISP_AAL>;
>>>>>>>>                 mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
>>>>>>>> +
>>>>>>>> +           ports {
>>>>>>>> +               #address-cells = <1>;
>>>>>>>> +               #size-cells = <0>;
>>>>>>>> +
>>>>>>>> +               port@0 {
>>>>>>>> +                   reg = <0>;
>>>>>>>> +                   aal0_in: endpoint {
>>>>>>>> +                       remote-endpoint = <&ccorr0_out>;
>>>>>>>> +                   };
>>>>>>>> +               };
>>>>>>>> +
>>>>>>>> +               port@1 {
>>>>>>>> +                   reg = <1>;
>>>>>>>> +                   aal0_out: endpoint {
>>>>>>>> +                       remote-endpoint = <&gamma0_in>;
>>>>>>>> +                   };
>>>>>>>> +               };
>>>>>>>> +           };
>>>>>>>>             };
>>>>>>>>          };
>>>>>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
>>>>>>>> index 9f8366763831..fca8e7bb0cbc 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
>>>>>>>> @@ -57,6 +57,27 @@ properties:
>>>>>>>>          $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>>>>>          maxItems: 1
>>>>>>>>
>>>>>>>> +  ports:
>>>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>>>> +    description:
>>>>>>>> +      Input and output ports can have multiple endpoints, each of those
>>>>>>>> +      connects to either the primary, secondary, etc, display pipeline.
>>>>>>>> +
>>>>>>>> +    properties:
>>>>>>>> +      port@0:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description: CCORR input port
>>>>>>>> +
>>>>>>>> +      port@1:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description:
>>>>>>>> +          CCORR output to the input of the next desired component in the
>>>>>>>> +          display pipeline, usually only one of the available AAL blocks.
>>>>>>>> +
>>>>>>>> +    required:
>>>>>>>> +      - port@0
>>>>>>>> +      - port@1
>>>>>>>> +
>>>>>>>>      required:
>>>>>>>>        - compatible
>>>>>>>>        - reg
>>>>>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>>>>>>>> index 7df786bbad20..6160439ce4d7 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>>>>>>>> @@ -65,6 +65,28 @@ properties:
>>>>>>>>          $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>>>>>          maxItems: 1
>>>>>>>>
>>>>>>>> +  ports:
>>>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>>>> +    description:
>>>>>>>> +      Input and output ports can have multiple endpoints, each of those
>>>>>>>> +      connects to either the primary, secondary, etc, display pipeline.
>>>>>>>> +
>>>>>>>> +    properties:
>>>>>>>> +      port@0:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description: COLOR input port
>>>>>>>> +
>>>>>>>> +      port@1:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description:
>>>>>>>> +          COLOR output to the input of the next desired component in the
>>>>>>>> +          display pipeline, for example one of the available CCORR or AAL
>>>>>>>> +          blocks.
>>>>>>>> +
>>>>>>>> +    required:
>>>>>>>> +      - port@0
>>>>>>>> +      - port@1
>>>>>>>> +
>>>>>>>>      required:
>>>>>>>>        - compatible
>>>>>>>>        - reg
>>>>>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
>>>>>>>> index 6fceb1f95d2a..abaf27916d13 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
>>>>>>>> @@ -56,6 +56,28 @@ properties:
>>>>>>>>          $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>>>>>          maxItems: 1
>>>>>>>>
>>>>>>>> +  ports:
>>>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>>>> +    description:
>>>>>>>> +      Input and output ports can have multiple endpoints, each of those
>>>>>>>> +      connects to either the primary, secondary, etc, display pipeline.
>>>>>>>> +
>>>>>>>> +    properties:
>>>>>>>> +      port@0:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description: DITHER input, usually from a POSTMASK or GAMMA block.
>>>>>>>> +
>>>>>>>> +      port@1:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description:
>>>>>>>> +          DITHER output to the input of the next desired component in the
>>>>>>>> +          display pipeline, for example one of the available DSC compressors,
>>>>>>>> +          DP_INTF, DSI, LVDS or others.
>>>>>>>> +
>>>>>>>> +    required:
>>>>>>>> +      - port@0
>>>>>>>> +      - port@1
>>>>>>>> +
>>>>>>>>      required:
>>>>>>>>        - compatible
>>>>>>>>        - reg
>>>>>>>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>>>>>>> index 3a82aec9021c..b567e3d58aa1 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
>>>>>>>> @@ -71,13 +71,34 @@ properties:
>>>>>>>>            Output port node. This port should be connected to the input port of an
>>>>>>>>            attached HDMI, LVDS or DisplayPort encoder chip.
>>>>>>>>
>>>>>>>> +  ports:
>>>>>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>>>>>> +
>>>>>>>> +    properties:
>>>>>>>> +      port@0:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description: DPI input port
>>>>>>>> +
>>>>>>>> +      port@1:
>>>>>>>> +        $ref: /schemas/graph.yaml#/properties/port
>>>>>>>> +        description: DPI output to an HDMI, LVDS or DisplayPort encoder input
>>>>>>>
>>>>>>> This is wrong. The existing 'port' is the output. 'port' and 'port@0'
>>>>>>> are treated as the same thing. Since you are adding an input port, the
>>>>>>> new port has to be 'port@1' (or any number but 0).
>>>>>>>
>>>>>>> I haven't looked at the driver code, but it should request port 0 and
>>>>>>> always get the output port. And requesting port 1 will return an error
>>>>>>> or the input port.
>>>>>>
>>>>>> Hello Rob,
>>>>>>
>>>>>> I want to remind you that in v2 of this series you said that it'd be wrong for
>>>>>> port@0 to be an output, I replied that you misread that as I had modeled it indeed
>>>>>> as an input, and then you gave me your Reviewed-by tag.
>>>>>
>>>>> I have not misread it. Then I guess I forgot about it and missed it the
>>>>> next time on v3.
>>>>>
>>>>
>>>> Okay, that was some misunderstanding then - it's fine, no problem.
>>>>
>>>>>> Anyway - I get your concern about the previous behavior of `port`, but I chose to
>>>>>> model this that way purely for consistency.
>>>>>>
>>>>>> First of all - the driver(s) will check if we're feeding a full graph, as it will
>>>>>> indeed first check if port@1 is present: if it is, then it follows this scheme with
>>>>>> port@0 as INPUT and port@1 as OUTPUT.
>>>>>> If the component in port@0 is an OUTPUT, the bridge attach will fail.
>>>>>>
>>>>>> Getting to bindings themselves, then... it would be a mistake to model port@0 as an
>>>>>> output and port@1 as an input, because that would be not only inconsistent with the
>>>>>> DRM Bridge bindings, but would be highly confusing when reading the devicetree.
>>>>>
>>>>> Somewhat confusing, yes. Highly, no. Put a comment in the DT.
>>>>>
>>>>
>>>> "Somewhat or highly" boils down to personal opinion, so I still go for "highly"
>>>> but won't argue about that as wouldn't be productive and would bring us nowhere
>>>> anyway, so, whatever :-)
>>>>
>>>> Putting a comment in DT is an option, yes, but that comment would need to be put
>>>> on all of the MediaTek SoC device trees - current and future - and IMO would scream
>>>> "inconsistency warning" (in different words, of course) all over, which honestly
>>>> doesn't really look clean... at least to my eyes...
>>>
>>> What I find more confusing is my updated DT doesn't work with my
>>> existing kernel...
>>>
>>>>>> Please note that the bridge bindings are always declaring port@0 as an INPUT and
>>>>>> other ports as OUTPUT(s).
>>>>>
>>>>> There is no guarantee on that. Port numbering is local to the bridge and
>>>>> opaque to anything outside that bridge. That is why you have to document
>>>>> what each port represents.
>>>>>
>>>>
>>>> I know and I agree that there's no guarantee on the numbering. I can see that in
>>>> other non-drm-bridge bindings, and that's fine.
>>>>
>>>>> Would we have followed that convention if all the ports were defined
>>>>> from the start? Certainly. But that didn't happen and you are stuck with
>>>>> the existing binding and ABI.
>>>>>
>>>>
>>>> I thought about adding a new compatible for the new port scheme, but that looked
>>>> even worse to me as, after doing that (yeah, I actually went for it in the first
>>>> version that I have never sent upstream) during my own proof-read I started
>>>> screaming "HACK! HACK! NOOO!" all over, and rewritten the entire thing.
>>>>
>>>>>> As an example, you can check display/bridge/analogix,anx7625.yaml or
>>>>>> display/bridge/samsung,mipi-dsim.yaml (and others) for bridges, otherwise
>>>>>> display/st,stm32mp25-lvds.yaml or display/allwinner,sun4i-a10-display-frontend.yaml
>>>>>> (and others) for display controllers, which do all conform to this logic, where
>>>>>> the input is always @0, and the output is @1.
>>>>>>
>>>>>> Of course, doing this required me to do extra changes to the MTK DRM drivers to
>>>>>> actually be retro-compatible with the old devicetrees as I explained before.
>>>>>
>>>>> You can't fix existing software...
>>>>>
>>>>
>>>> That's true, but I don't see that as an "excuse" (grant me this term please) to
>>>> "carelessly" keep it in a suboptimal state.
>>>>
>>>> This driver has been growing almost uncontrollably with (wrong, anyway!)
>>>> board-specific component vectors - and writing a new one would just add up
>>>> more code duplication to the mix and/or worsen the maintainability of older
>>>> MediaTek SoCs (as the "old" driver will get forgotten and never updated anymore).
>>>>
>>>>> If you want to break the ABI, then that's ultimately up to you and
>>>>> Mediatek maintainers to decide0. This case is easy to avoid, why would
>>>>> you knowingly break the ABI here.
>>>>
>>>> Because if we don't do this, we condemn (forever) this driver, or part of it
>>>> to have an inverted port scheme compared to either:
>>>>     A. The other drm/mediatek components; or
>>>>     B. The other bridge drivers (of which, some are used with MTK as well)
>>>>
>>>> ...and we also condemn (forever, again) all MediaTek device trees to scream
>>>> "port inconsistency warning: A for drm/mediatek components, B for every other
>>>> thing", which would scream "drm/mediatek is somewhat broken", which can be
>>>> avoided.
>>>
>>> Sure. The cost is just an ABI break to do that.
>>>
>>>>> OTOH, this seems like a big enough
>>>>> change I would imagine it is a matter of time before supporting a
>>>>> missing OF graph for the components will be a problem.
>>>>>
>>>>
>>>> Sorry I didn't understand this part, can you please-please-please reword?
>>>
>>> I think keeping the kernel working with the old and new binding will
>>> be a challenge. Partly because testing with the old binding won't
>>> happen, but also if the binding and drivers continue to evolve. So
>>> while maintaining old ABI might be possible with this change, it will
>>> continue to be an issue with each change.
>>
>> That's... exactly my point, so I am happy that we agree on that.
>>
>>> BTW, did you actually test
>>> backwards compatibility with this? I can see you fallback to the old
>>> binding, but there's a lot of other changes in there I can't really
>>> tell by looking at it.
>>
>>
>> Short answer: Yes, largely
>>
>> Long answer:
>>
>> Yes, with this series applied, I have tested both *old* and *new* devicetrees on
>> 7 boards with 4 different SoCs and different display pipelines (hence, graphs):
>> one smartphone (MT6795), a "bunch of" Chromebooks (MT8173, MT8186, MT8195), and
>> a SBC (MT8195).
>>
>> Of course those had DSI or eDP displays, with or without DisplayPort external
>> display support.
>>
>>>
>>> What I haven't heard from you is "yes, we need to maintain the ABI" or
>>> "no, we can break it". Decide that, then the path here is simple.
>>
>> No, we have to break it.
> 
> Okay, then my reviewed-by stands. But please make it clear in the
> binding and dts commit msgs that it is an ABI break.
> 
Thanks for that.

I'll send a v13 that adds a snippet of text in this commit's description stating
that it breaks the ABI, and I will keep your R-b tag.

Cheers,
Angelo
