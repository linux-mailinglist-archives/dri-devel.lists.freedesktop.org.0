Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A15F358D96E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 15:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52574D6757;
	Tue,  9 Aug 2022 13:35:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C0FD66FB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 13:34:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 279DYLhX034492;
 Tue, 9 Aug 2022 08:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1660052061;
 bh=WWRi3nIHMWjo8QM+N+oh4W6m3/cOmkPPLuocntv/5zk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=VWMHk/XNgY2rO0zT2BX/nivDMaBJmhuSTnhZrylpLQv4KlbeLYFVskfGUagMKlr63
 DZk4IC78+VQWULAfyxokJxGDsMPqUU4XQuzyQG4FGJ7g+tZ5tQdDT+6BulkcltcBp4
 uKRUBFkrJBprAwv0M3dI4e4/R2uYKGRe44FLJMv4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 279DYLIO078605
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 9 Aug 2022 08:34:21 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 9
 Aug 2022 08:34:20 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 9 Aug 2022 08:34:20 -0500
Received: from [10.250.235.49] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 279DYEgY080291;
 Tue, 9 Aug 2022 08:34:15 -0500
Message-ID: <dcd04013-7e58-d36a-b2c4-21c6270747c1@ti.com>
Date: Tue, 9 Aug 2022 19:04:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 4/8] drm/tidss: Add support for Dual Link LVDS Bus Format
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20220719080845.22122-1-a-bhatia1@ti.com>
 <20220719080845.22122-5-a-bhatia1@ti.com>
 <f2909af1-be23-009b-ba71-34206f099473@ideasonboard.com>
 <ec8dce9b-51d6-a566-67bb-b76f6f3458d7@ideasonboard.com>
 <1f9de2d8-7507-bdc2-93c1-470c8e060586@ti.com>
 <b8fd1719-b0ec-495b-54f9-1d591ff8af9e@ideasonboard.com>
 <09682120-632a-1bfb-c0d7-034f5f076421@ti.com>
 <ff7448fd-e50c-1c6d-ad28-ea7e555cdd24@ideasonboard.com>
From: Aradhya Bhatia <a-bhatia1@ti.com>
In-Reply-To: <ff7448fd-e50c-1c6d-ad28-ea7e555cdd24@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Darren Etheridge <detheridge@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Rahul T R <r-ravikumar@ti.com>,
 Krunal Bhargav <k-bhargav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On 09-Aug-22 15:21, Tomi Valkeinen wrote:
> On 09/08/2022 12:06, Aradhya Bhatia wrote:
> 
>>>> Even in DT, the dss port (for OLDI) connects to the panel port's
>>>> endpoint directly. Even in cases of dual link or cloning, it's only a
>>>> singular remote-to-endpoint connection between the (OLDI) VP and the
>>>> panel port. Hence the requirement of the properties in the earlier
>>>> patches of the series.
>>>
>>> Sorry, I don't follow. If you use cloning, you have two TX outputs, 
>>> going to two panels, right? So you need two panel DT nodes, and those 
>>> would connect to two OLDI TX ports in the DSS.
>>>  > Afaics the existing dual link bridge/panel drivers also use two ports
>>> for the connection, so to use the dual link you need two ports in the 
>>> DSS.
>>>
>>> I admit I'm not familiar with LVDS dual link, but it's not clear to 
>>> me how you see the dual OLDI TX being used with other drivers if you 
>>> have only one port. What kind of setups have you tested?
>>>
>> In the DTs, the OLDIs are not modeled at all. Since the DSS only has a
>> single VP for OLDI, the DT dss port (for OLDI) is connected to a single
>> simple-panel node for dual link, bypassing the OLDI TX in DT. I have
>> this same OLDI setup and have been testing on this.
> 
> A DSS VP is a DSS internal port, whereas a port node in the DT is an 
> external port. There doesn't have to be a 1:1 match between those.
> 
> The port in the DT represents some kind of "connector" to the outside 
> world, which is usually a collection of pins that provide a video bus.
> 
Okay, I now understand what you are saying. Indeed, I was mapping the
DSS VP and DT DSS port as 1:1 in my mind, which should not be the case.

> Here, as far as I can see, the DSS clearly has three external ports, two 
> OLDI ports and one DPI port.
> 
>> I do not have a cloning display setup with me, but I have seen DT DSS
>> port connected to one of 2 panel nodes while the other panel (remains as
>> a companion panel to the first) without any endpoint connections. Since,
>> the OLDI TXes (0 and 1), receive the same clocks and inputs from DSS
>> OLDI VP, this 'method' has worked too.
> 
> This, and using simple-panel for dual link with single port connection, 
> sounds like a hack.
> 
> A practical example: TI's customer wants to use AM625 and THC63LVD1024 
> bridge. How does it work? THC63LVD1024 driver uses two LVDS ports for 
> input, both of which are used in dual-link mode.
> 
Right. There has to be 2 ports for OLDI in DSS, to be connected to 2
ports of a single panel (dual link) or 2 ports of 2 panels (cloning).

>>>> The use of lvds helper functions does not seem feasible in this case,
>>>> because even they read DT properties to determine the dual link
>>>> connection and those properties need to be a part of a lvds bridge
>>>> device.
>>>
>>> Can you elaborate a bit more why the DRM helpers couldn't be used here?
>>>
>> The drm_of.c helpers use DT properties to ascertain the presence of a
>> dual-link connection. While there wasn't a specific helper to determine
>> dual-link or not, the drivers use the odd/even pixel order helper which
>> is based on the properties "dual-lvds-odd-pixels" and "dual-lvds-odd-
>> pixels". If either of the properties are absent, the helper returns an
>> error making the driver to use single link.
>>
>> These properties are LVDS specific, but they could not be added in the
>> DT because there is no OLDI TX DT node for our case.
> 
> If I'm not mistaken, those properties are in the port node, not the 
> device node, and also, I believe those properties are on the sink side, 
> so they wouldn't even be in the AM625 data. See, for example:
> 
> arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts
Yeah, they are indeed on the sink side. I was misunderstood about this.
And the onus for properties is not on DSS nodes anymore.

This probably is a different discussion, but since the sink is now
responsible for those properties, these should get introduced in the
panel-common bindings, right?

The above example has a separate binding, but many dumb dual-link panels
will require those properties in panel-common.

> 
>>>> I have also been considering the idea of implementing a new device
>>>> driver for the OLDI TXes, not unlike the renesas' one. That way the
>>>> driver could have the properties and the lvds helper functions at their
>>>> disposal. I am just slightly unsure if that would allow space for any
>>>> conflicts because of the shared register space.
>>>
>>> No, I don't think new devices are needed here.
>> Okay...
>>
>> I am not quite sure I understand completely what you are recommending
>> the OLDI to be. It seems to me that you want the OLDI TXes to be modeled
>> as nodes, right? Wouldn't that automatically require some sort of
>> standalone driver arrangement for them? Or am I missing something
>> important here?
> 
> No, I'm only talking about the DT port nodes. At the moment the AM65x DT 
> bindings doc says that there are two ports, port@0 for OLDI and port@1 
> for DPI. I'm saying AM625 needs three ports.
Agreed.

Moreover, I will update the binding to reflect 3 ports for am625-dss.


Regards
Aradhya
