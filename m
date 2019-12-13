Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE4811E331
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 13:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F8D6E52A;
	Fri, 13 Dec 2019 12:06:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F6A6E52A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 12:06:22 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBD9O5OB120533;
 Fri, 13 Dec 2019 03:24:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576229045;
 bh=11ocqYIH8oHlulnnmzbnn8ms1756271GCd5ksM38j64=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FQZd9y93cFlQDmcVTGtaY5Qk03gH4KvQBEfjq1PEmOXOFsZuZAyVS3BP5RMu2/qHK
 GwlAO1cmNP9LuGjl4/uIW+PyZn7n5hzB0Wvd45wvO6pTkljjBR5sdcOESxNFGjOC8C
 wI7atAwHntlnBXlBaz4B5XQAzV0OLTe2mKZsLXe4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBD9O5jh051527
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 13 Dec 2019 03:24:05 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 13
 Dec 2019 03:24:05 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 13 Dec 2019 03:24:05 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD9O3Bh067719;
 Fri, 13 Dec 2019 03:24:03 -0600
Subject: Re: [PATCH 1/4] ARM: dts: am437x-gp-evm: add HDMI support
To: Tony Lindgren <tony@atomide.com>
References: <20191125131100.9839-1-tomi.valkeinen@ti.com>
 <20191212172104.GY35479@atomide.com> <20191212173110.GA35479@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <d09526b2-8435-bef2-0489-0c3c8173d451@ti.com>
Date: Fri, 13 Dec 2019 11:24:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191212173110.GA35479@atomide.com>
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
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/12/2019 19:31, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [191212 17:21]:
>> Hi,
>>
>> * Tomi Valkeinen <tomi.valkeinen@ti.com> [191125 05:11]:
>>> Add HDMI support for AM437x GP EVM. The HDMI uses SiI9022 HDMI encoder,
>>> and is mutually exclusive with the LCD. The choice between LCD and HDMI
>>> is made by booting either with am437x-gp-evm.dtb or
>>> am437x-gp-evm-hdmi.dtb.
>>
>> So Linux kernel needs a new board device tree file to toggle a GPIO line
>> to switch between LCD mode and HDMI?
>>
>> That does not sound very user friendly for something that's supposed
>> to be hot pluggabe :)

True. We've had this for a long time in the TI kernel. I don't know how to implement this better, 
except perhaps with DT overlays, but that's essentially the same method.

>>> +/* Override SelLCDorHDMI from am437x-gp-evm.dts to select HDMI */
>>> +&gpio5 {
>>> +	p8 {
>>> +		output-low;
>>> +	};
>>> +};
>>
>> How about just leave the gpio unconfigured and document that a userspace
>> tool or /sys/kernel/debug/gpio is needed to toggle between the modes?

That sounds much worse than two dts files. How does X or weston know about the gpio?

And the "external" gpio wouldn't work well with DRM. We need to add all the displays at probe time, 
so we'd have LCD and HDMI. The gpio makes one of those operable, but only the external parts. The 
display controller has just one output, and we'd have a conflict there too as both displays would be 
connected to that single output. And as the display controller driver doesn't know about the gpio, 
it would fail "randomly" for one of the displays if the other one is already enabled by the userspace.

I think the correct way would be to have DRM framework understand that we have two displays, which 
are mutually exclusive, and the display pipeline drivers would have the means to switch the gpio. 
And that the display setup could be communicated properly to the userspace, and the userspace would 
understand it. I don't think any of those exists.

So, the only good solution I have figured out is to just say that we have a single display at 
runtime, defined by the dt file.

On some boards (k2g-evm, if I recall right) we have similar HW setup, but with a physical switch. We 
use the same method there, with two dts files. Again, if I recall right, the switch setting can be 
seen by the SW, so if there's a better solution to the AM4 case, probably similar could be used with 
k2g-evm, where the drivers would react to the user changing the switch.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
