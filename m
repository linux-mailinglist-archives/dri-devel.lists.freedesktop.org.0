Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A915A58D1B7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 03:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B378FD9F;
	Tue,  9 Aug 2022 01:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF87B8719
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 01:25:14 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 94CB1845A5;
 Tue,  9 Aug 2022 03:25:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1660008311;
 bh=goK8Xyy9CXnnnf5aAlKG6fKJPnCIUrulzRORKlgOilg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OJyY+JZVJF8GVtbbz92GXnTeWynqEa2Gfb6K0/BOUVjuV/WpEnqWXxNIrw4CcX1bZ
 3LypYW6m/ynPf82BIJfOSZr4TP+oAbw4yCc2i40BUx34a5LJhKswMymFLhwdfg1LW+
 QFwR549mlYbg5BcDir8gmDt6x1ycjgchvmxFUIo2ygDFOdhj8bH2a3fUOqFmG2Np4e
 8XY5utnnYKQkltJjJYNFFQiTf+/tHsT239xyKvp26bRwgSZXCK//R5qmu4RyszmrTJ
 3J2oIVr+hhVkJnf64RfBAdhy7rEHXdNjtrSBFp0mLarDL6570BzGik6nefc6udnZed
 yjOaHTC4lvbwg==
Message-ID: <aa288917-9841-aab8-0a6a-764b775d8c02@denx.de>
Date: Tue, 9 Aug 2022 03:25:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 2/4] dt-bindings: display: add new bus-format property
 for panel-dpi
Content-Language: en-US
To: Max Krummenacher <max.oss.09@gmail.com>
References: <20220628181838.2031-1-max.oss.09@gmail.com>
 <20220628181838.2031-3-max.oss.09@gmail.com>
 <7e30f558-d42e-9751-7729-f0422f3926fa@denx.de>
 <CAEHkU3WJ75W0RAtSKECNHmr-KLmZyziPz_t80wFNubxvGvD21g@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAEHkU3WJ75W0RAtSKECNHmr-KLmZyziPz_t80wFNubxvGvD21g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 max.krummenacher@toradex.com,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/8/22 15:56, Max Krummenacher wrote:
> Hi Marek

Hello Max,

[...]

>>> +        properties:
>>> +          bus-format:
>>> +            $ref: /schemas/types.yaml#/definitions/uint32
>>> +            minimum: 0x1001
>>> +            maximum: 0x1fff
>>> +            description: |
>>> +              Describes how the display panel is connected to the display interface.
>>> +              Valid values are defined in <dt-bindings/display/dt-media-bus-format.h>.
>>> +              The mapping between the color/significance of the panel lines to the
>>> +              parallel data lines are defined in:
>>> +              https://www.kernel.org/doc/html/v5.17/userspace-api/media/v4l/subdev-formats.html#packed-rgb-formats
>>
>> I am not sure whether I should re-open this discussion, but I still
>> wonder, wouldn't it be better to describe the DPI bus color channel
>> ordering (RGB, BGR, ...), width of each color channel in bits, pixel
>> format (RGB, YUV, ...) instead of using specific constants for the
>> entire format ?
> 
>>From a system view it would be hard to define that structure which
> will catch any and all future requirements. Assume that there will be
> 3D panels and they will need an additional depth field.

You can very much say you have panels which require Y/U/V color channels 
instead of R/G/B , and then just add more color channels as needed. But 
that -- color channel, their order, offset, bit width, can be described 
rather easily, something like:

color-channel-names = "R", "G", "B";
color-channel-width = <8 8 8>;
color-channel-shift = <16 8 0>;

> Or in
> in addition to RGB data there will be a fourth color component. Or
> whatever the panel manufacturers might come up with...
> Or consider the Tegra 30 example I brought up in this thread. Tegras can
> output RGB666 for 18bit panels, and then use the next 8 bits to extend
> to 24bit (Maybe RGB666RGB222 ?).

I think there are two options here:

1) Look at 'data-lanes' property on DSI ? Both the DSI host and DSI
    device define the 'data-lanes' property per endpoint and they might
    not be the same.

But with DPI, the better option might be:

2) Implement something like LVDS codec, some sort of transparent DPI
    bridge driver which can be defined in DT and represent the "glue"
    wiring adapter between the mismatched DPI source and sink formats.

> https://lore.kernel.org/all/71ef1b35301330d0bbb64844247b6c4c2237ad1c.camel@gmail.com/
> If such requirements pop up the enumeration can be extended with a new
> value without changing the binding in any way, with a structured
> approach this will require changed bindings, maybe even with issues
> in backward compatibility.

If we have 2) which would describe how the DPI wires were connected, 
like "channel R got shifted by two bits, bottom two bits got replicated, 
etc.", then maybe we can avoid introducing new non-standard formats 
altogether ?

>>From an implementation perspective for Linux the busformat in code is
> currently an enumeration. So one would have to take the device tree
> structured busformat and run it through a potentially complicated
> function to get to the Linux busformat enumeration value. The final
> consumer has no advantage over what is there today.
> 
> IMHO a change away from one enumeration value to a structured approach
> creates some drawbacks without any obvious advantages.
> 
> Comments, other views on that?

See above.
