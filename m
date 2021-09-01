Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C933FE59B
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 01:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE296E3E5;
	Wed,  1 Sep 2021 23:20:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE376E3E5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 23:20:40 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CC3B24F;
 Thu,  2 Sep 2021 01:20:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1630538438;
 bh=+m+FMYnJYzRMCkZH9Bnprd6sDpe051YonvSHy1HVvf4=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=jtkDNJEWpK9zwGEyxdknyNoWXq0oMQDfwJOv63c7kP2A2rwQ6Z9Zm/CYBWnP81pJ5
 oVty+vcnHPM+T/LU4e8fjHJnfXPjRR5ZgNwehxG+svOLEUFpjiJGUsvkFDnVpcAsR2
 9Y495YgZz+E1xU7gHO9HcB6wRp1lLH35sAtME9XU=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Provide bindings for
 r8a779a0
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR RENESAS" <linux-renesas-soc@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20210622231146.3208404-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdW8vYC3+gVCv5eG_vkX79vU8RQL-6fSJd9McetDzikzSA@mail.gmail.com>
 <22bf664e-4a28-3ae2-0106-5913a8643625@ideasonboard.com>
 <YS/7BlBvEsU+rkXP@pendragon.ideasonboard.com>
Message-ID: <bd2f468b-40de-1fc6-bd97-3099c5d62f4e@ideasonboard.com>
Date: Thu, 2 Sep 2021 00:20:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YS/7BlBvEsU+rkXP@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
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

Hi Laurent,

On 01/09/2021 23:13, Laurent Pinchart wrote:
> Hi Kieran,
> 
> On Wed, Sep 01, 2021 at 11:01:11PM +0100, Kieran Bingham wrote:
>> On 23/06/2021 13:53, Geert Uytterhoeven wrote:
>>> On Wed, Jun 23, 2021 at 1:11 AM Kieran Bingham wrote:
>>>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>>
>>>> Extend the Renesas DU display bindings to support the r8a779a0 V3U.
>>>>
>>>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
>>>> @@ -39,6 +39,7 @@ properties:
>>>>        - renesas,du-r8a77980 # for R-Car V3H compatible DU
>>>>        - renesas,du-r8a77990 # for R-Car E3 compatible DU
>>>>        - renesas,du-r8a77995 # for R-Car D3 compatible DU
>>>> +      - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>>>>
>>>>    reg:
>>>>      maxItems: 1
>>>> @@ -774,6 +775,57 @@ allOf:
>>>>          - reset-names
>>>>          - renesas,vsps
>>>>
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            enum:
>>>> +              - renesas,du-r8a779a0
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          items:
>>>> +            - description: Functional clock for DU0
>>>> +            - description: Functional clock for DU1
>>>> +
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: du.0
>>>> +            - const: du.1
>>>
>>> The hardware block has only a single function clock for both channels,
>>> like on R-Car H1.
>>
>> Indeed, but I believe both channels still need to set them, if they can
>> be operated independently, the driver looks up the clock based on the
>> du.%d, and so for DU1, it is simply expressed as the same clock in DT.
>>
>> Is this acceptable? or is there further issues there?
> 
> Could we handle that on the driver side, like we do for H1 by not
> setting RCAR_DU_FEATURE_CRTC_IRQ_CLOCK ? We would probably need to split
> that flag in two, as there are two interrupts.

Ok, that's not so bad to split, Done.


> It's a bit annoying not knowing what the MSTP bits do exactly, we've
> modelled them as gates for the functional clock, but maybe in cases like
> this one the mapping isn't fully correct, I'm not sure.
> 
>>> And what about DU_DOTCLKIN?
>>
>> This thread has already discussed this with Laurent, and I concur -
>> There doesn't appear to be any relevant reference to DU_DOTCLKIN on the
>> DU side.
> 
