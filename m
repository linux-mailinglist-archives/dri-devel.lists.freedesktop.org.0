Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6D711E326
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 13:05:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C9189E63;
	Fri, 13 Dec 2019 12:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 9639 seconds by postgrey-1.36 at gabe;
 Fri, 13 Dec 2019 12:04:59 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0439289E63
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 12:04:59 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBDC4XVd009037;
 Fri, 13 Dec 2019 06:04:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576238673;
 bh=oPWnTo7OHhVIsfM/IZdLvhaVisqBeA+2xiIqL/W9IoI=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=DcuNIe9KJZystd8ax+1WcBI2y8J/pVzn0KCq8WMRoP7DcIETCdVcfyWa4vP8XnFqz
 WhHmLkXN2Cd4nw2pLwTNW7lmNJUIB8zIoXNxnutR/bLbAbhW/Li6dY2vUSTjpRxou3
 mfFi74mrrrCjYK/xZ3J6FusBdfPNRQ+RVanVpfQg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBDC4XDq019047
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Dec 2019 06:04:33 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Dec 2019 06:04:33 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Dec 2019 06:04:33 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBDC4VWg057195;
 Fri, 13 Dec 2019 06:04:31 -0600
Subject: Re: [PATCH 1/4] ARM: dts: am437x-gp-evm: add HDMI support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
 <20191212172104.GY35479@atomide.com> <20191212173110.GA35479@atomide.com>
 <d09526b2-8435-bef2-0489-0c3c8173d451@ti.com>
 <20191213104204.GB4860@pendragon.ideasonboard.com>
 <2f5cfca4-d36d-da2d-59ba-b76669daeded@ti.com>
 <20191213114207.GC4860@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <36d8dde1-1a76-5a5f-2a41-8bc52dfcf2fa@ti.com>
Date: Fri, 13 Dec 2019 14:04:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213114207.GC4860@pendragon.ideasonboard.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-omap@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/12/2019 13:42, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Fri, Dec 13, 2019 at 12:56:31PM +0200, Tomi Valkeinen wrote:
>> On 13/12/2019 12:42, Laurent Pinchart wrote:
>>
>>>> I think the correct way would be to have DRM framework understand that we have two displays, which
>>>> are mutually exclusive, and the display pipeline drivers would have the means to switch the gpio.
>>>> And that the display setup could be communicated properly to the userspace, and the userspace would
>>>> understand it. I don't think any of those exists.
>>>
>>> Isn't this what possible_clones in drm_encoder is for ? It notifies
>>> userspace of mutual exclusions between encoders.
>>
>> Hmm, how would that work here? Isn't encoder cloning about having two encoders, which take the input
>> from the same video source, and then outputting to two displays?
> 
> That's the idea. If you have one encoder for HDMI and one for the panel,
> you can mark them as non-clonable, and then only one of the two can be
> active at a time.

We have a single DPI output from the SoC. That goes to the panel, or to SiI9022 bridge, depending on 
the GPIO switch.

So... In the DT file, we would have multiple endpoints in the same output port in DSS, one going to 
the panel, one to the SiI9022? omapdrm could then create two encoders, one abstracting the DPI 
output and the connection to the panel, one abstracting the DPI output and SiI9022?

And then someone would need to handle the GPIO, and set it based on the output used. These kind of 
gpios are always difficult, as they don't belong anywhere =).

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
