Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA1C275E6B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 19:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338BB6E98B;
	Wed, 23 Sep 2020 17:15:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06966E98B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 17:15:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08NHFKXo087475;
 Wed, 23 Sep 2020 12:15:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600881320;
 bh=r8HOyXiGU54STKU6S811Il3oIJwaV6yhgGzfkd2uQ10=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=KwhKedNvEiP8fYI6JZEmDGiZS/WagcavMjkPdA6YxtQD/mwyG+vZcquVV1fHIRYIa
 9yVGGzRAbokDSoRUgM8OejJhG1o/bqcj5Dflm2nmoFDqyjR2HnK2zoXOmNH7Alz2P/
 1lzoysO8xely2tzEp/rslecey5B9NOyoRpnziGS0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08NHFKLV037525
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Sep 2020 12:15:20 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 23
 Sep 2020 12:15:19 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 23 Sep 2020 12:15:19 -0500
Received: from [192.168.2.10] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08NHFHWR115783;
 Wed, 23 Sep 2020 12:15:17 -0500
Subject: Re: [PATCHv2] dt-bindings: dp-connector: add binding for DisplayPort
 connector
To: Rob Herring <robh@kernel.org>
References: <20200917055210.22868-1-tomi.valkeinen@ti.com>
 <20200923161712.GA836725@bogus>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <04d93618-12b1-d8f5-ece5-0f87e644d52e@ti.com>
Date: Wed, 23 Sep 2020 20:15:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923161712.GA836725@bogus>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Swapnil Kashinath Jakhade <sjakhade@cadence.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On 23/09/2020 19:17, Rob Herring wrote:

>> * No eDP. There's really no "eDP connector", as it's always a custom
>>    made connection between the DP and the DP panel. So possibly there is
>>    no need for edp-connector binding, but even if there is, I don't want
>>    to guess what it could look like, and could it be part of the
>>    dp-connector binding.
> 
> I don't think that's true. Do an image search for 'edp pinout'. AFAICT,
> there's 2 lane 30 pin and 4 lane 40 pin. One image says 'Table 5-3 in
> eDP v1.2'. Of course, I'm sure there's custom ones too. From a binding
> perspective, we probably don't care about the differences, but just need
> to be able to describe HPD, backlight power, enable, and pwm, and LCD
> power.

That's true. The eDP spec lists 4 different standard pinouts (how 
strictly those are followed, I have no idea). But it does not define a 
connector or a cable. And afaik eDP is defined to be not user-detachable.

I think from the binding perspective the connectors present in the dts 
files are user-visible connectors, meant for plugging in and out. The 
connector node is the "end of the chain".

And non user-detachable ones (like MIPI DPI) do not have a connector in 
the dts, but just the video source and the panel linked together, and 
the panel is the end of the chain.

My thinking was that eDP is similar to MIPI DPI, and that we always 
define the eDP panel in the dts too. But I guess that might not be the 
case, as eDP does have all the bells and whistles to fully detect the 
panel. Although can it do all the probing needed for backlight and 
touch... And even then, should we have a generic-epd-panel present in 
the dts, or just a connector...

I don't know. So as I said, I'd rather leave eDP out for now (and you 
agreed, so no disagreement =).

I think we can later extend this binding, or if eDP just doesn't seem to 
fit into this, we can create a fully separate binding for eDP.

  Tomi

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
