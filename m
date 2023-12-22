Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4B181C6D8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 09:49:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2993D10E756;
	Fri, 22 Dec 2023 08:49:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7E310E756
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 08:49:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3BM5kUo5029531; Fri, 22 Dec 2023 09:48:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=DXnKNS2zZsB/JGQbwoIOXKKoinM3JySMYdHFE4nrpZE=; b=gZ
 TkRA7JkKE/ZLWoAT+HRyZ9u8wnxdq+/ialw26uKASyNf1c7NtnXE3K4kliKag55X
 VakRbzK16GQE2JVTbMWGGenrIFfXn0I97np3raSdI+Qd+048BV6hZK0+bJMznTcn
 8Y3iJTu4NCiviZ2O+3oL+VVFwxRafZa3skEAroeCNS22v52nqEtPMv8VyoyrEOJM
 EH9u0QB6Cs6UTvJkNGV4uBvjU3lggSaytQKGkMxh+f+LWrKD+VDZEzhSFxMONcIe
 RrEl6u1JKG4TolrXFBYxvF+4FoK2O4H5t34zcR9tdSYM72kaQ3vLMpY09+yblKRJ
 Z95BufTojylX3aM78dCQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3v54ksrm2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Dec 2023 09:48:59 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1D82E10004F;
 Fri, 22 Dec 2023 09:48:40 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0FB4220B607;
 Fri, 22 Dec 2023 09:48:40 +0100 (CET)
Received: from [10.252.15.82] (10.252.15.82) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Dec
 2023 09:48:39 +0100
Message-ID: <24110918-5402-4877-a80f-db1228afeaa1@foss.st.com>
Date: Fri, 22 Dec 2023 09:48:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] dt-bindings: display: add dt-bindings for STM32
 LVDS device
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, Sam
 Ravnborg <sam@ravnborg.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding
 <thierry.reding@gmail.com>
References: <20231221122843.418650-1-raphael.gallais-pou@foss.st.com>
 <20231221122843.418650-3-raphael.gallais-pou@foss.st.com>
 <fcd68fbe-c543-4b6d-9b7f-bcea09918fb9@linaro.org>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <fcd68fbe-c543-4b6d-9b7f-bcea09918fb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.15.82]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-22_04,2023-12-21_02,2023-05-22_02
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,


Thanks for your review. I wall send another serie later with those modifications.


Best regards,

Raphaël


On 12/21/23 18:27, Krzysztof Kozlowski wrote:
> On 21/12/2023 13:28, Raphael Gallais-Pou wrote:
>> Add dt-binding file for "st,stm32-lvds" compatible.
>>
> A nit, subject: drop second/last, redundant "dt-bindings for". The
> "dt-bindings" prefix is already stating that these are bindings.
>
>> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
>> ---
>>  .../bindings/display/st,stm32-lvds.yaml       | 114 ++++++++++++++++++
>>  1 file changed, 114 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/st,stm32-lvds.yaml
>>
> ...
>
>> +properties:
>> +  "#clock-cells":
>> +    const: 0
>> +
>> +  compatible:
>> +    const: st,stm32-lvds
> Please put compatible as first.
>
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: APB peripheral clock
>> +      - description: Reference clock for the internal PLL
>> +
>> +  clock-names:
>> +    items:
>> +      - const: pclk
>> +      - const: ref
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: |
>> +          LVDS input port node, connected to the LTDC RGB output port.
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: |
>> +          LVDS output port node, connected to a panel or bridge input port.
> Ports are not required? I would assume it won't work without input and
> output.
>
>> +
>> +required:
>> +  - "#clock-cells"
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - ports
>> +
>> +unevaluatedProperties: false
> additionalProperties instead... or did I miss some $ref anywhere?
>
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/bus/stm32mp25_sys_bus.h>
>> +    #include <dt-bindings/clock/stm32mp25-clks.h>
>> +    #include <dt-bindings/reset/stm32mp25-resets.h>
>> +
>> +    lvds: lvds@48060000 {
>> +        #clock-cells = <0>;
>> +        compatible = "st,stm32-lvds";
> compatible is always the first property.
>
>> +        reg = <0x48060000 0x2000>;
> put clock-cells here
>
>> +        clocks = <&rcc CK_BUS_LVDS>, <&rcc CK_KER_LVDSPHY>;
>> +        clock-names = "pclk", "ref";
>> +        resets = <&rcc LVDS_R>;
> Best regards,
> Krzysztof
>
