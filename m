Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7923A854831
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 12:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5963810E14E;
	Wed, 14 Feb 2024 11:23:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="fVWLZWg/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A0E10E14E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 11:23:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41EBNFgR117953;
 Wed, 14 Feb 2024 05:23:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1707909795;
 bh=PH0Rx/TGo6A+YAqh7yAPgthl3XrH8s/yUYRL3Tk7b7g=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=fVWLZWg/n/3O5x/EmTPzFDMtGuT0PotHKOvVVn1iGgzf2we1L1ig01BNtS19jxQ7s
 xVKm7q4llhXpB8LPe5FlbF/jaj5wYSMdJ5iAfC/CStLGtOyG19V7g/HuTvIKhsFK/h
 yIw9M6v427oP9td75CRWCkTP17p14qZKIY972COs=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41EBNFgb016640
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 14 Feb 2024 05:23:15 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Feb 2024 05:23:14 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Feb 2024 05:23:14 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41EBN8Va102851;
 Wed, 14 Feb 2024 05:23:09 -0600
Message-ID: <9314a841-d983-0254-c30a-4500864d0a1b@ti.com>
Date: Wed, 14 Feb 2024 16:53:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: display: ti,am65x-dss: Add support for
 common1 region
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <conor+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>, "Raghavendra,
 Vignesh" <vigneshr@ti.com>
CC: <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
 <j-luthra@ti.com>, <kristo@kernel.org>, <jyri.sarha@iki.fi>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <devarsht@ti.com>
References: <20240115125716.560363-1-devarsht@ti.com>
 <20240115125716.560363-2-devarsht@ti.com>
 <f8cc383e-1150-45d2-8325-a8dd69969300@ideasonboard.com>
 <839d6de4-b396-4799-8a62-9249727b6dcc@ideasonboard.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <839d6de4-b396-4799-8a62-9249727b6dcc@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi, Vignesh,

On 14/02/24 14:53, Tomi Valkeinen wrote:
> On 14/02/2024 11:10, Tomi Valkeinen wrote:
>> Hi,
>>
>> On 15/01/2024 14:57, Devarsh Thakkar wrote:
>>> TI keystone display subsystem present in AM65 and other SoCs such as AM62
>>> support two separate register spaces namely "common" and "common1" which
>>> can be used by two separate hosts to program the display controller as
>>> described in respective Technical Reference Manuals [1].
>>>
>>> The common1 register space has similar set of configuration registers as
>>> supported in common register space except the global configuration
>>> registers which are exclusive to common region.
>>>
>>> This adds binding for "common1" register region too as supported by the
>>> hardware.
>>>
>>> [1]:
>>> AM62x TRM:
>>> https://www.ti.com/lit/pdf/spruiv7 (Section 14.8.9.1 DSS Registers)
>>>
>>> AM65x TRM:
>>> https://www.ti.com/lit/pdf/spruid7 (Section 12.6.5 DSS Registers)
>>>
>>> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
>>> ---
>>>   .../devicetree/bindings/display/ti/ti,am65x-dss.yaml       | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>>> b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>>> index b6767ef0d24d..55e3e490d0e6 100644
>>> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>>> @@ -37,6 +37,7 @@ properties:
>>>         - description: OVR2 overlay manager for vp2
>>>         - description: VP1 video port 1
>>>         - description: VP2 video port 2
>>> +      - description: common1 DSS register area
>>>     reg-names:
>>>       items:
>>> @@ -47,6 +48,7 @@ properties:
>>>         - const: ovr2
>>>         - const: vp1
>>>         - const: vp2
>>> +      - const: common1
>>>     clocks:
>>>       items:
>>> @@ -147,9 +149,10 @@ examples:
>>>                       <0x04a07000 0x1000>, /* ovr1 */
>>>                       <0x04a08000 0x1000>, /* ovr2 */
>>>                       <0x04a0a000 0x1000>, /* vp1 */
>>> -                    <0x04a0b000 0x1000>; /* vp2 */
>>> +                    <0x04a0b000 0x1000>, /* vp2 */
>>> +                    <0x04a01000 0x1000>; /* common1 */
>>>               reg-names = "common", "vidl1", "vid",
>>> -                    "ovr1", "ovr2", "vp1", "vp2";
>>> +                    "ovr1", "ovr2", "vp1", "vp2", "common1";
>>>               ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
>>>               power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
>>>               clocks =        <&k3_clks 67 1>,
>>
>> Looks fine to me, I'll apply to drm-misc-next.
> 
> Hmm, now thinking about this, doesn't this cause dtb checks to start failing,
> as the dtbs are missing one entry? Is it better to merge these kind of changes
> with the dts changes? Or does it matter?
> 

Yes if one get's applied and other doesn't then there will be such issues.
I am sending shortly both the dt-binding and device-tree patches together, as
long as both look fine and ready to be accepted by respective maintainers, I
think both can get merged to respective trees and land in linux-next without
causing any issues.

Regards
Devarsh

>  Tomi
> 
