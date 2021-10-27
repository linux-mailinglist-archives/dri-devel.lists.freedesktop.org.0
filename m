Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6D43C9E1
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 14:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF198989A;
	Wed, 27 Oct 2021 12:42:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9868989A
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:42:38 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 363F883230;
 Wed, 27 Oct 2021 14:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1635338556;
 bh=dPn6ZThvG6na3Ywg21b3UNeAyKNGJlcW859GbKfn58w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=iPV7JEdQr0yfrvGWUON2UN44qr8IKwFJsi5UdUtUvfQ3V8KFAheFpfHtB+6IfxWwG
 IwZv53kiZx0HXIwhwtZe/3Ev0OCLFp1+mVP5rDvTJU+SlQ5wPgRAL33hy6fmwPuN9a
 VG8Egkc8N4Wvs4yCu3wxZP+PRvFPDd4jo78cKm8BDMQ6+rPQsPRgMrlN8ksVFIKEX0
 bZJojJvTo8YM34gOLaxzK4JqXBvEd5pzL5UtJFV2SpwnpvG5/Tx55yvQfVhJU3HUsV
 DjmMGmU6cN8ygmLK/cNR+amzO11NirZlQ/wwXwPq8glDqKh60WC4NLRLz/2vtioXzM
 sd6Ucn0jOCNXA==
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: lvds-codec: Document
 pixel data sampling edge select
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org
References: <20211017001204.299940-1-marex@denx.de>
 <YW24EbfbtJdMMDRV@pendragon.ideasonboard.com>
 <c34f8a7e-eec6-9373-0c52-f6546ad689a8@denx.de>
 <YW3Rw0hZmB6plu+V@pendragon.ideasonboard.com>
 <4f235f45-5c03-eaeb-69ac-3d801a1dd58c@denx.de>
 <YW5qlXPyy6ZOHS6N@pendragon.ideasonboard.com>
 <c3f74fc5-3ec7-f01a-3195-273c28ceec83@denx.de>
 <YXiSoEdKUDRr3K5E@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <8f366113-2516-4599-1885-6a7fcb09524d@denx.de>
Date: Wed, 27 Oct 2021 14:29:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXiSoEdKUDRr3K5E@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/27/21 1:43 AM, Laurent Pinchart wrote:

[...]

>>>>>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>>>>>>>> index 1faae3e323a4..708de84ac138 100644
>>>>>>>> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>>>>>>>> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
>>>>>>>> @@ -79,6 +79,14 @@ properties:
>>>>>>>>            - port@0
>>>>>>>>            - port@1
>>>>>>>>      
>>>>>>>> +  pclk-sample:
>>>>>>>> +    description:
>>>>>>>> +      Data sampling on rising or falling edge.
>>>>>>>> +    enum:
>>>>>>>> +      - 0  # Falling edge
>>>>>>>> +      - 1  # Rising edge
>>>>>>>> +    default: 0
>>>>>>>> +
>>>>>>>
>>>>>>> Shouldn't this be moved to the endpoint, the same way data-mapping is
>>>>>>> defined as an endpoint property ?
>>>>>>
>>>>>> The strapping is a chip property, not port property, so no.
>>>>>
>>>>> For this particular chip that's true. I'm still not convinced overall.
>>>>> For some cases it could be a per-port property
>>>>
>>>> Can you be more specific about "some cases" ?
>>>
>>> I'm thinking about bridges that could have multiple parallel inputs.
>>
>> Can you draft an example how such a binding would look like within the
>> confines of this lvds-codec.yaml ?
>>
>> I also have to wonder how such a hypothetical device would work, would
>> it serialize two parallel bussed into single LVDS one ?
> 
> Such a device would require custom bindings I think, as lvds-codec is
> limited to a single input and a single output. thine,thc63lvd1024.yaml
> is an example of such a device.

It seems THC63LVD1024 is LVDS->to->Parallel DPI, so pclk-sample does not 
seem applicable there either.

[...]
