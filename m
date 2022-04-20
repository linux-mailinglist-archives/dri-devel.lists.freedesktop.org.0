Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD795081AD
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC11510F175;
	Wed, 20 Apr 2022 07:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D73010F179
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:05:40 +0000 (UTC)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi
 [91.156.85.209])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECC0625B;
 Wed, 20 Apr 2022 09:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1650438338;
 bh=XI60ceOSPiOukm0RgGIMWmc07mkMjnkrZjqcQsrwgeI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VP5344N7sW30pjejQzEYeRU72UYfQq6pmhRTDBQhDQceHec72h4/ndutm5YbALjJh
 zHK/HVvwAhsTafWTtjvE3rYp5aHDvRw1yOcZaW6Hwo2Nc6UtiMflPFdD+1SmJ9h1su
 no87Z1//a8Iy1x4F1TdwnhnIgetHUrBDTjOrpvt0=
Message-ID: <f5eb63b1-8381-99c8-55fa-cc9287103aa8@ideasonboard.com>
Date: Wed, 20 Apr 2022 10:05:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: display: ti,am65x-dss: Add missing
 register & interrupt
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20220419070302.16502-1-a-bhatia1@ti.com>
 <20220419070302.16502-2-a-bhatia1@ti.com>
 <Yl7FEuHEy66KUc5F@robh.at.kernel.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Yl7FEuHEy66KUc5F@robh.at.kernel.org>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/04/2022 17:20, Rob Herring wrote:
> On Tue, Apr 19, 2022 at 12:33:01PM +0530, Aradhya Bhatia wrote:
>> The DSS IP on the ti-am65x soc supports an additional register space,
>> named "common1". Further. the IP services a maximum number of 2
>> interrupts.
>>
>> Add the missing register space "common1" and the additional interrupt.
>>
>> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
>> ---
>>   .../devicetree/bindings/display/ti/ti,am65x-dss.yaml   | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> index 5c7d2cbc4aac..102059e9e0d5 100644
>> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> @@ -26,6 +26,7 @@ properties:
>>         Addresses to each DSS memory region described in the SoC's TRM.
>>       items:
>>         - description: common DSS register area
>> +      - description: common1 DSS register area
> 
> You've just broken the ABI.
> 
> New entries have to go on the end.

I'm curious, if the 'reg-names' is a required property, as it is here, 
does this still break the ABI?

  Tomi
