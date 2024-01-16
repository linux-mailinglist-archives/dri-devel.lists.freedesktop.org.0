Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD9182EEA1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 13:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F91210E484;
	Tue, 16 Jan 2024 12:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 9724 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jan 2024 12:01:37 UTC
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404E410E4B1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 12:01:37 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40G9J06o094644;
 Tue, 16 Jan 2024 03:19:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1705396740;
 bh=+f0VemhyFwFnGlJoV6Z/6zvcuO/sA8b/sNMJ7K0g+fw=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=rpvc4JTiBq5NkJv7NzywIZG3UI8vvJBWKFeeCCsCpST3uDWpwR6eF9hL8STki1M9k
 xPvjCnTdU5o9WQET7BQpH28k14UmiknVnIlgIgON2FY//jrSmriQLWR1+qmne05Sx3
 K4RNA15d6Nhid0TD9aM0/sskyYY+veKq3dsrsvQk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40G9J0Q7037956
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Jan 2024 03:19:00 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jan 2024 03:18:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jan 2024 03:18:59 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40G9IrAI020250;
 Tue, 16 Jan 2024 03:18:54 -0600
Message-ID: <4c5cb4ed-96a3-7bd8-f660-2a3bb041ca09@ti.com>
Date: Tue, 16 Jan 2024 14:48:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [DO NOT MERGE PATCH 2/2] arm64: dts: ti: Add common1 register
 space for AM62x and AM65x SoCs
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
References: <20240115125716.560363-1-devarsht@ti.com>
 <20240115125716.560363-3-devarsht@ti.com>
 <20240115-penpal-pluck-d156ccf21b2f@spud>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20240115-penpal-pluck-d156ccf21b2f@spud>
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

On 15/01/24 21:44, Conor Dooley wrote:
> On Mon, Jan 15, 2024 at 06:27:16PM +0530, Devarsh Thakkar wrote:
>> This adds common1 register space for AM62x and AM65x SoC's which are using
>> TI's Keystone display hardware and supporting it as described in
>> Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml.
>>
>> This region is documented in respective Technical Reference Manuals [1].
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
> 
> "[DO NOT MERGE PATCH 2/2]" but no rationale here as to why this cannot
> be merged? What's the problem with it?
> 

No problem as such from my point of view, but this is the process I follow
since maintainer trees for device-tree file and bindings are different. I
generally mark a [DO NOT MERGE] tag for device-tree file patches until binding
patch gets merged so that the device-tree patches don't get applied by mistake
if binding patch has some pending comments.

Once binding patch gets merged, I re-send the device-tree file patches again
to respective list.

Regards
Devarsh

> Cheers,
> Conor.
> 
>>  arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 5 +++--
>>  arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 5 +++--
>>  2 files changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
>> index 464b7565d085..298bf8d5de8c 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
>> @@ -779,9 +779,10 @@ dss: dss@30200000 {
>>  		      <0x00 0x30207000 0x00 0x1000>, /* ovr1 */
>>  		      <0x00 0x30208000 0x00 0x1000>, /* ovr2 */
>>  		      <0x00 0x3020a000 0x00 0x1000>, /* vp1: Used for OLDI */
>> -		      <0x00 0x3020b000 0x00 0x1000>; /* vp2: Used as DPI Out */
>> +		      <0x00 0x3020b000 0x00 0x1000>, /* vp2: Used as DPI Out */
>> +		      <0x00 0x30201000 0x00 0x1000>; /* common1 */
>>  		reg-names = "common", "vidl1", "vid",
>> -			    "ovr1", "ovr2", "vp1", "vp2";
>> +			    "ovr1", "ovr2", "vp1", "vp2", "common1";
>>  		power-domains = <&k3_pds 186 TI_SCI_PD_EXCLUSIVE>;
>>  		clocks = <&k3_clks 186 6>,
>>  			 <&dss_vp1_clk>,
>> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> index fcea54465636..5b2d4365b911 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>> @@ -1019,9 +1019,10 @@ dss: dss@4a00000 {
>>  		      <0x0 0x04a07000 0x0 0x1000>, /* ovr1 */
>>  		      <0x0 0x04a08000 0x0 0x1000>, /* ovr2 */
>>  		      <0x0 0x04a0a000 0x0 0x1000>, /* vp1 */
>> -		      <0x0 0x04a0b000 0x0 0x1000>; /* vp2 */
>> +		      <0x0 0x04a0b000 0x0 0x1000>, /* vp2 */
>> +		      <0x0 0x04a01000 0x0 0x1000>; /* common1 */
>>  		reg-names = "common", "vidl1", "vid",
>> -			"ovr1", "ovr2", "vp1", "vp2";
>> +			"ovr1", "ovr2", "vp1", "vp2", "common1";
>>  
>>  		ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
>>  
>> -- 
>> 2.34.1
>>
