Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62254855C60
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 09:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E61510E2B6;
	Thu, 15 Feb 2024 08:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Gmh4s2FE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 729 seconds by postgrey-1.36 at gabe;
 Thu, 15 Feb 2024 06:04:53 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3495010E204
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 06:04:53 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41F5qL7U033828;
 Wed, 14 Feb 2024 23:52:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1707976341;
 bh=+us7f9eh3WdZjRBmU3wiIE+bKdMW+MKZdorfLKKz1kM=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Gmh4s2FENIwoP0FQTJK9+kyGYT4KbzCvrcmonBCFFbJ9JeGmLaqxHsOruVijKUQHf
 spKKiiJIhBOSL1i2z8rvSDBH/BGPN2LJJ8VvNCTGAxVpxeloyHdfour+o5bJKNNSYI
 R1pkGtw2hLe0smumxHDH6hdTh9k/RO0K9CE5uYVU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41F5qLsu028333
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 14 Feb 2024 23:52:21 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Feb 2024 23:52:21 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Feb 2024 23:52:21 -0600
Received: from [172.24.227.94] (uda0132425.dhcp.ti.com [172.24.227.94])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41F5qFeA041729;
 Wed, 14 Feb 2024 23:52:16 -0600
Message-ID: <395e55f2-00d7-475c-9d71-0d51831bfe1c@ti.com>
Date: Thu, 15 Feb 2024 11:22:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: display: ti,am65x-dss: Add support
 for common1 region
Content-Language: en-US
To: Devarsh Thakkar <devarsht@ti.com>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <nm@ti.com>, <kristo@kernel.org>
CC: <praneeth@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>
References: <20240214125151.1965137-1-devarsht@ti.com>
 <20240214125151.1965137-2-devarsht@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
In-Reply-To: <20240214125151.1965137-2-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 15 Feb 2024 08:24:06 +0000
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



On 14/02/24 18:21, Devarsh Thakkar wrote:
> TI keystone display subsystem present in AM65 and other SoCs such as AM62
> support two separate register spaces namely "common" and "common1" which
> can be used by two separate hosts to program the display controller as
> described in respective Technical Reference Manuals [1].
> 
> The common1 register space has similar set of configuration registers as
> supported in common register space except the global configuration
> registers which are exclusive to common region.
> 
> This adds binding for "common1" register region too as supported by the
> hardware.
> 
> [1]:
> AM62x TRM:
> https://www.ti.com/lit/pdf/spruiv7 (Section 14.8.9.1 DSS Registers)
> 
> AM65x TRM:
> https://www.ti.com/lit/pdf/spruid7 (Section 12.6.5 DSS Registers)
> 
> AM62A TRM:
> https://www.ti.com/lit/pdf/spruj16 (Section 14.9.9.1 DSS Registers)
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---


I guess all AM65/62/62a DSS variants always had this common1 reg region
but wasn't captured in the binding? If so, then this looks like a bug in
the original adding this yaml and as such should have Fixes: tag and so
should DT patch (patch 2/2)

> V2: Add Acked-by tag
> ---
>  .../devicetree/bindings/display/ti/ti,am65x-dss.yaml       | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index b6767ef0d24d..55e3e490d0e6 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -37,6 +37,7 @@ properties:
>        - description: OVR2 overlay manager for vp2
>        - description: VP1 video port 1
>        - description: VP2 video port 2
> +      - description: common1 DSS register area
>  
>    reg-names:
>      items:
> @@ -47,6 +48,7 @@ properties:
>        - const: ovr2
>        - const: vp1
>        - const: vp2
> +      - const: common1
>  
>    clocks:
>      items:
> @@ -147,9 +149,10 @@ examples:
>                      <0x04a07000 0x1000>, /* ovr1 */
>                      <0x04a08000 0x1000>, /* ovr2 */
>                      <0x04a0a000 0x1000>, /* vp1 */
> -                    <0x04a0b000 0x1000>; /* vp2 */
> +                    <0x04a0b000 0x1000>, /* vp2 */
> +                    <0x04a01000 0x1000>; /* common1 */
>              reg-names = "common", "vidl1", "vid",
> -                    "ovr1", "ovr2", "vp1", "vp2";
> +                    "ovr1", "ovr2", "vp1", "vp2", "common1";
>              ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
>              power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
>              clocks =        <&k3_clks 67 1>,

-- 
Regards
Vignesh
