Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 345B22612F2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 16:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06CE89FA0;
	Tue,  8 Sep 2020 14:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A71A89F8B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 14:48:55 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B154F47;
 Tue,  8 Sep 2020 16:48:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599576522;
 bh=lvuH3mHmFR9FWeXOZYD3vPI3zMXgRaK78p8ySrX6YIs=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mU7jGnXsS6A3cBz+uMMka46IWBFtttpP68LYhszJ2OVdvY4JbfMcwnzD3cY8a0dp/
 AXR5fUeGyRT4QrhaNXkB6BZ0/4eRjlnZuEuZweVPTBgOmz0lmp6JHABR0zNgHTYgZu
 kN5TcnDtVLPGUgDd1WOoP6B+H5uO32Fvjg1EnSNs=
Subject: Re: [PATCH v2 02/10] dt-bindings: display: renesas: dw-hdmi: tidyup
 example compatible.
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhlrtwp.wl-kuninori.morimoto.gx@renesas.com>
 <6e1eedf0-d05f-81cd-e437-33fc4c7337f3@ideasonboard.com>
 <20200908144317.GA11405@pendragon.ideasonboard.com>
 <20200908144623.GB11405@pendragon.ideasonboard.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <e6c388c1-d48d-cc0f-a4ed-fe9b8892fe68@ideasonboard.com>
Date: Tue, 8 Sep 2020 15:48:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908144623.GB11405@pendragon.ideasonboard.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: Linux-DT <devicetree@vger.kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 "\(Renesas\) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
 Magnus <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 08/09/2020 15:46, Laurent Pinchart wrote:
> On Tue, Sep 08, 2020 at 05:43:25PM +0300, Laurent Pinchart wrote:
>> Hi Kieran,
>>
>> On Tue, Sep 08, 2020 at 03:18:20PM +0100, Kieran Bingham wrote:
>>> On 08/09/2020 01:34, Kuninori Morimoto wrote:
>>>> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>>
>>>> required is "renesas,r8a7795-hdmi", instead of "renesas,r8a7795-dw-hdmi"
>>>
>>> Hrm, technically the driver will currently only match on :
>>>   "renesas,rcar-gen3-hdmi"
>>>
>>> But I see how the '-dw-' has probably snuck in from other devices, and
>>> is inappropriate.
>>>
>>> Perhaps this should be more clear that it matches on the generic compatible:
>>> 	renesas,rcar-gen3-hdmi
>>>
>>> (or a combination of both?)
>>>
>>>> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>>>
>>> But if the generic isn't required, then this patch alone does fix what I
>>> would call an error, so ...
>>
>> You're right, the generic compatible string should be required. I'll
>> update this patch accordingly, and will address the bindings as part of
>> the conversion to YAML.
> 
> Proposed new commit:
> 
> commit cc487cbb06d841ca76efade63201a41bd04f6015
> Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Date:   Tue Sep 8 09:34:11 2020 +0900
> 
>     dt-bindings: display: renesas: dw-hdmi: Tidyup example compatible
> 
>     The DT example erronously uses the "renesas,r8a7795-dw-hdmi", when the
>     correct value is "renesas,r8a7795-hdmi". It is furthermore missing the
>     generic "renesas,rcar-gen3-hdmi" compatible string. Fix it.
> 
>     Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>     Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>     Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>     [Add "renesas,rcar-gen3-hdmi" and rework commit message]
>     Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> index f275997ab947..9c56c5169a88 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> @@ -43,7 +43,7 @@ Optional properties:
>  Example:
> 
>  	hdmi0: hdmi@fead0000 {
> -		compatible = "renesas,r8a7795-dw-hdmi";
> +		compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
>  		reg = <0 0xfead0000 0 0x10000>;
>  		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
> 


Perfect, looks good to me.
--
Kieran


>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>>
>>> We could always make this more clear when converting to YAML.
>>>
>>>> ---
>>>>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt      | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
>>>> index 819f3e31013c..e6526ab485d0 100644
>>>> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
>>>> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
>>>> @@ -42,7 +42,7 @@ Optional properties:
>>>>  Example:
>>>>  
>>>>  	hdmi0: hdmi@fead0000 {
>>>> -		compatible = "renesas,r8a7795-dw-hdmi";
>>>> +		compatible = "renesas,r8a7795-hdmi";
>>>>  		reg = <0 0xfead0000 0 0x10000>;
>>>>  		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
>>>>  		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
