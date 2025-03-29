Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7342A75682
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 14:54:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2296B10E23F;
	Sat, 29 Mar 2025 13:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="ON2HE2nC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DB110E23F
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
 t=1743256469; bh=4n6gakwcu0PhUp9+6uuyFcPnhmioTI0TXWmXpfOEzJA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ON2HE2nCYM+IiKTjO32HjB4U+sgj1thCQr1MdtjDPy6MbDMUpCnfnWTCCi7UkvywA
 pI+l6G+IGyzhGRGlEU8wc1In+MB9l7Qxx8xg2SbS68xoCOijadwCH/a3qq/61FLFcC
 pLuXhAQgFOq+xsevEhkhovsBry3oRd6Idow5rqQk=
Message-ID: <ad132ebd-92f2-428c-95c2-d1986b5d060f@lucaweiss.eu>
Date: Sat, 29 Mar 2025 14:54:27 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] dt-bindings: display: panel: Add Himax HX83112B
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250222-fp3-display-v1-0-ccd812e16952@lucaweiss.eu>
 <20250222-fp3-display-v1-2-ccd812e16952@lucaweiss.eu>
 <20250223-tricky-saffron-rattlesnake-aaad63@krzk-bin>
 <89cbb27e-414a-472f-8664-db5b4d37ddc1@lucaweiss.eu>
 <cf3a0429-0c36-426f-b9b0-ae7749877bf3@kernel.org>
Content-Language: en-US
From: Luca Weiss <luca@lucaweiss.eu>
In-Reply-To: <cf3a0429-0c36-426f-b9b0-ae7749877bf3@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

On 2/24/25 9:16 AM, Krzysztof Kozlowski wrote:
> On 23/02/2025 16:29, Luca Weiss wrote:
>> Hi Krzysztof,
>>
>> On 23-02-2025 12:54 p.m., Krzysztof Kozlowski wrote:
>>> On Sat, Feb 22, 2025 at 06:58:05PM +0100, Luca Weiss wrote:
>>>> Himax HX83112B is a display driver IC used to drive LCD DSI panels.
>>>> Describe it and the Fairphone 3 panel from DJN using it.
>>>>
>>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>>> ---
>>>>    .../bindings/display/panel/himax,hx83112b.yaml     | 75 ++++++++++++++++++++++
>>>>    1 file changed, 75 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
>>>> new file mode 100644
>>>> index 0000000000000000000000000000000000000000..e6bd4b33d40be98e479d84617aea6d2af0df70e4
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112b.yaml
>>>> @@ -0,0 +1,75 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/panel/himax,hx83112b.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Himax HX83112B-based DSI display panels
>>>> +
>>>> +maintainers:
>>>> +  - Luca Weiss <luca@lucaweiss.eu>
>>>> +
>>>> +description:
>>>> +  The Himax HX83112B is a generic DSI Panel IC used to control
>>>> +  LCD panels.
>>>> +
>>>> +allOf:
>>>> +  - $ref: panel-common.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    contains:
>>>> +      const: djn,fairphone-fp3-panel
>>>
>>> Why no himax,hx83112b fallback?
>>
>> While this is the driver IC for this panel, I don't think there's any
>> "generic" init sequence that can successfully configure this panel, so
>> generic hx83112b driver could work I'd say.
> 
> 
> Hm, indeed usually this would mean no need for unusable fallback alone,
> but still drivers could use it for some common pieces of code. I imagine
> there could be a piece of init sequence which is generic. Or some piece
> of attributes.
> We already have examples of both approaches for panels - with generic
> fallback (himax,hx83102) and without (himax,hx83112a).
> 
> @Rob
> what is your generic advice? Which of above (himax,hx83102 vs
> himax,hx83112a) should be used, if the fallback compatible cannot be
> used alone?

I believe this thread is still pending of a resolution, based on the 
model number I've found, I made the compatible "djn,98-03057-6598b-i" 
for v2, but it's still a question whether himax,hx83112b should be part 
of the compatible.

Regards
Luca

> 
> Best regards,
> Krzysztof

