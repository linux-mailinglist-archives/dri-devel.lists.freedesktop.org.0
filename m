Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF4882EB53
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F07910E415;
	Tue, 16 Jan 2024 09:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D014510E415
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:13:57 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40G9DWUO127272;
 Tue, 16 Jan 2024 03:13:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1705396412;
 bh=nJQizBl1NxeJeism2TSUWEXRTwS6P64j/cHB1gifO1s=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Xq75KyWa5nqqS0y0Tbne7SalAk1kzexDlCgEm99U4JwqDy+D49qdRKtrOIKpjAyKN
 iReiPttyJP80YUw+rz0n6bZsbLsrs2Sc44z28MzqobE1t8lLPzeWpcf9gzzXe4EM0y
 Qn7piYX2N+G/obPzaAwudYV+2GHf7sOTNV9gaiJo=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40G9DWPS043190
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jan 2024 03:13:32 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jan 2024 03:13:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jan 2024 03:13:31 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40G9DPt4108827;
 Tue, 16 Jan 2024 03:13:26 -0600
Message-ID: <060358d6-ade1-b84e-4550-e2ae34a6d53c@ti.com>
Date: Tue, 16 Jan 2024 14:43:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: display: ti,am65x-dss: Add support for
 common1 region
To: Conor Dooley <conor@kernel.org>
References: <20240115125716.560363-1-devarsht@ti.com>
 <20240115125716.560363-2-devarsht@ti.com>
 <20240115-craftsman-capricorn-d2930678c222@spud>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240115-craftsman-capricorn-d2930678c222@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: nm@ti.com, devicetree@vger.kernel.org, conor+dt@kernel.org, j-luthra@ti.com,
 tzimmermann@suse.de, krzysztof.kozlowski+dt@linaro.org, praneeth@ti.com,
 tomi.valkeinen@ideasonboard.com, jyri.sarha@iki.fi, mripard@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, a-bhatia1@ti.com,
 airlied@gmail.com, kristo@kernel.org, vigneshr@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Conor,

Thanks for the review.

On 15/01/24 21:47, Conor Dooley wrote:
> On Mon, Jan 15, 2024 at 06:27:15PM +0530, Devarsh Thakkar wrote:
>> TI keystone display subsystem present in AM65 and other SoCs such as AM62
> 
> Do all 3 SoCs supported by this binding (am625 am62a7 am65x) have this
> common1 register? If not, you should limit it the platforms that do have
> it.
> 

Yes all 3 SoCs supported by binding have common1 register space supported.

AM62x TRM:
https://www.ti.com/lit/pdf/spruiv7 (Section 14.8.9.1 DSS Registers)

AM65x TRM:
https://www.ti.com/lit/pdf/spruid7 (Section 12.6.5 DSS Registers)

AM62A TRM:
https://www.ti.com/lit/pdf/spruj16 (Section 14.9.9.1 DSS Registers)

Regards
Devarsh

> Thanks,
> Conor.
> 
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
>>  .../devicetree/bindings/display/ti/ti,am65x-dss.yaml       | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> index b6767ef0d24d..55e3e490d0e6 100644
>> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
>> @@ -37,6 +37,7 @@ properties:
>>        - description: OVR2 overlay manager for vp2
>>        - description: VP1 video port 1
>>        - description: VP2 video port 2
>> +      - description: common1 DSS register area
>>  
>>    reg-names:
>>      items:
>> @@ -47,6 +48,7 @@ properties:
>>        - const: ovr2
>>        - const: vp1
>>        - const: vp2
>> +      - const: common1
>>  
>>    clocks:
>>      items:
>> @@ -147,9 +149,10 @@ examples:
>>                      <0x04a07000 0x1000>, /* ovr1 */
>>                      <0x04a08000 0x1000>, /* ovr2 */
>>                      <0x04a0a000 0x1000>, /* vp1 */
>> -                    <0x04a0b000 0x1000>; /* vp2 */
>> +                    <0x04a0b000 0x1000>, /* vp2 */
>> +                    <0x04a01000 0x1000>; /* common1 */
>>              reg-names = "common", "vidl1", "vid",
>> -                    "ovr1", "ovr2", "vp1", "vp2";
>> +                    "ovr1", "ovr2", "vp1", "vp2", "common1";
>>              ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
>>              power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
>>              clocks =        <&k3_clks 67 1>,
>> -- 
>> 2.34.1
>>
