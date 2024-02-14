Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03391854509
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 10:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A288710E58B;
	Wed, 14 Feb 2024 09:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d2oZ0m8B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4790D10E4F4
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 09:23:10 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-128.elisa-laajakaista.fi
 [91.154.35.128])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62DEB673;
 Wed, 14 Feb 2024 10:23:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707902586;
 bh=BzXd7RuiwCTqBRO3TrKhE8xbVkPb0y7sK2NROp8pCZo=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=d2oZ0m8Bhk2IB/H2j5z6rKeUnA1tftzalI8uarCo30Bsq4XiRVAv6lFroGxGJIDYb
 1ILjo5z1NnlFOC/nFHkXLCuFPyWMMg9PWQXgfy2htLK/ShBui/5FOqIPvfd/r3z7Hh
 c02gDS7di1d7lTCdSoZ0s6hOWAa7GMGL1HqE1ijg=
Message-ID: <839d6de4-b396-4799-8a62-9249727b6dcc@ideasonboard.com>
Date: Wed, 14 Feb 2024 11:23:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: display: ti,am65x-dss: Add support for
 common1 region
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Devarsh Thakkar <devarsht@ti.com>, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Cc: praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
 j-luthra@ti.com, kristo@kernel.org, jyri.sarha@iki.fi, airlied@gmail.com,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240115125716.560363-1-devarsht@ti.com>
 <20240115125716.560363-2-devarsht@ti.com>
 <f8cc383e-1150-45d2-8325-a8dd69969300@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <f8cc383e-1150-45d2-8325-a8dd69969300@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 14/02/2024 11:10, Tomi Valkeinen wrote:
> Hi,
> 
> On 15/01/2024 14:57, Devarsh Thakkar wrote:
>> TI keystone display subsystem present in AM65 and other SoCs such as AM62
>> support two separate register spaces namely "common" and "common1" which
>> can be used by two separate hosts to program the display controller as
>> described in respective Technical Reference Manuals [1].
>>
>> The common1 register space has similar set of configuration registers as
>> supported in common register space except the global configuration
>> registers which are exclusive to common region.
>>
>> This adds binding for "common1" register region too as supported by the
>> hardware.
>>
>> [1]:
>> AM62x TRM:
>> https://www.ti.com/lit/pdf/spruiv7 (Section 14.8.9.1 DSS Registers)
>>
>> AM65x TRM:
>> https://www.ti.com/lit/pdf/spruid7 (Section 12.6.5 DSS Registers)
>>
>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>> ---
>>   .../devicetree/bindings/display/ti/ti,am65x-dss.yaml       | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git 
>> a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml 
>> b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> index b6767ef0d24d..55e3e490d0e6 100644
>> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> @@ -37,6 +37,7 @@ properties:
>>         - description: OVR2 overlay manager for vp2
>>         - description: VP1 video port 1
>>         - description: VP2 video port 2
>> +      - description: common1 DSS register area
>>     reg-names:
>>       items:
>> @@ -47,6 +48,7 @@ properties:
>>         - const: ovr2
>>         - const: vp1
>>         - const: vp2
>> +      - const: common1
>>     clocks:
>>       items:
>> @@ -147,9 +149,10 @@ examples:
>>                       <0x04a07000 0x1000>, /* ovr1 */
>>                       <0x04a08000 0x1000>, /* ovr2 */
>>                       <0x04a0a000 0x1000>, /* vp1 */
>> -                    <0x04a0b000 0x1000>; /* vp2 */
>> +                    <0x04a0b000 0x1000>, /* vp2 */
>> +                    <0x04a01000 0x1000>; /* common1 */
>>               reg-names = "common", "vidl1", "vid",
>> -                    "ovr1", "ovr2", "vp1", "vp2";
>> +                    "ovr1", "ovr2", "vp1", "vp2", "common1";
>>               ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
>>               power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
>>               clocks =        <&k3_clks 67 1>,
> 
> Looks fine to me, I'll apply to drm-misc-next.

Hmm, now thinking about this, doesn't this cause dtb checks to start 
failing, as the dtbs are missing one entry? Is it better to merge these 
kind of changes with the dts changes? Or does it matter?

  Tomi

