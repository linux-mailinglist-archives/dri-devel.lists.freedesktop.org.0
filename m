Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4CB1AAF392
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 08:18:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E958010E36F;
	Thu,  8 May 2025 06:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UiFEZStG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028DE10E32E;
 Thu,  8 May 2025 06:18:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A740E629EC;
 Thu,  8 May 2025 06:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A936C4CEEE;
 Thu,  8 May 2025 06:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746685116;
 bh=4qi/P67+uIyVReLfU5vjCz6ajupbpcjoxwPILqTAti4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UiFEZStGiIcWzwH57Q4Z5xVbDrbOdjIpEJB0bMIQyEOzawyELYmi7tHEErn0dPQv2
 dlxony58CRNFXVyO5ZIFM4SQZjbPjynGDXkkbEXNE3XtBUKHuXHWWL/Tt05g480fUf
 g5DBy8B89p+nZbYj/mYy5tgePS2f5xhK9mwgrjDwtVu0gZpMNdwJJ5BQKMr4Kn/lyN
 JDABKLlcdp/UFIAwuB0oSy988GOu0AH7tc5LKP/kwT8dTHQS2G0lGorZfvAU3Ipg6p
 edQZrzz5WVop/J/j+yeQwHU00KKuMpLZO0LktdaEMV+4iZn7uEcA5QId3hxEUmusDM
 UyVtnT8ZBmw0A==
Message-ID: <f7941d74-3856-4bd9-95db-0b7f09eb07fd@kernel.org>
Date: Thu, 8 May 2025 08:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: add stream 1 pixel clock
 binding
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Mahadevan <quic_mahap@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-3-9a9a43b0624a@quicinc.com>
 <39f8e20a-e8c3-4625-abb1-9f35f416705d@kernel.org>
 <50820e7b-b302-4f7f-baf9-778f3db6cfff@quicinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <50820e7b-b302-4f7f-baf9-778f3db6cfff@quicinc.com>
Content-Type: text/plain; charset=UTF-8
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

On 23/04/2025 04:46, Abhinav Kumar wrote:
> Hi Krzysztof
> 
> On 12/3/2024 12:04 AM, Krzysztof Kozlowski wrote:
>> On 03/12/2024 04:31, Abhinav Kumar wrote:
>>> On some chipsets the display port controller can support more
>>
>> Which chipsets?
>>
> 
>  From the current list of chipsets which support DP, the following can 
> support more than one stream.
> 
> qcom,sa8775p-dp
> qcom,sc7280-dp
> qcom,sc8180x-dp
> qcom,sc8280xp-dp
> qcom,sm8350-dp
> qcom,sm8650-dp
> qcom,sm8550-dp
> qcom,sm8450-dp
> qcom,sm8250-dp
> qcom,sm8150-dp
> 
> So do you also want all of these to be added in the same if block as
> qcom,sa8775p-dp?

That was talk in 2024. Entire context is gone if you reply after three
months. I do not have even that emails in my inbox anymore.

Probably I expected commit msg to mention at least some, so everyone
knows which chipsets are affected here and one can verify the statements
from commit msg.

> 
>>> than one pixel stream (multi-stream transport). To support MST
>>> on such chipsets, add the binding for stream 1 pixel clock for
>>> display port controller. Since this mode is not supported on all
>>> chipsets, add exception rules and min/max items to clearly mark
>>> which chipsets support only SST mode (single stream) and which ones
>>> support MST.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   .../bindings/display/msm/dp-controller.yaml        | 32 ++++++++++++++++++++++
>>>   .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  9 ++++--
>>>   2 files changed, 38 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index 9fe2bf0484d8..650d19e58277 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -50,30 +50,38 @@ properties:
>>>       maxItems: 1
>>>   
>>>     clocks:
>>> +    minItems: 5
>>>       items:
>>>         - description: AHB clock to enable register access
>>>         - description: Display Port AUX clock
>>>         - description: Display Port Link clock
>>>         - description: Link interface clock between DP and PHY
>>>         - description: Display Port stream 0 Pixel clock
>>> +      - description: Display Port stream 1 Pixel clock
>>>   
>>>     clock-names:
>>> +    minItems: 5
>>>       items:
>>>         - const: core_iface
>>>         - const: core_aux
>>>         - const: ctrl_link
>>>         - const: ctrl_link_iface
>>>         - const: stream_pixel
>>> +      - const: stream_1_pixel
>>>   
>>>     assigned-clocks:
>>> +    minItems: 2
>>>       items:
>>>         - description: link clock source
>>>         - description: stream 0 pixel clock source
>>> +      - description: stream 1 pixel clock source
>>>   
>>>     assigned-clock-parents:
>>> +    minItems: 2
>>>       items:
>>>         - description: Link clock PLL output provided by PHY block
>>>         - description: Stream 0 pixel clock PLL output provided by PHY block
>>> +      - description: Stream 1 pixel clock PLL output provided by PHY block
>>>   
>>>     phys:
>>>       maxItems: 1
>>> @@ -175,6 +183,30 @@ allOf:
>>>         required:
>>>           - "#sound-dai-cells"
>>>   
>>
>> Missing if: narrowing this to 5 items for other devices.
>>
> 
> OR would an else be better?

Usually not, although depends how this binding is written.


> 
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 5
> +        clock-names:
> +          items:
> +            - const: core_iface
> +            - const: core_aux
> +            - const: ctrl_link
> +            - const: ctrl_link_iface
> +            - const: stream_pixel
> 
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - qcom,sa8775p-dp
>>> +
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>
>> Missing minItems, otherwise it is pointless.
>>
> 
> I thought that since I have already specified the minItems as 5
> in the clocks in the section above, I need to specify only the maxItems 
> here?

No, you need explicit constraints here.



Best regards,
Krzysztof
