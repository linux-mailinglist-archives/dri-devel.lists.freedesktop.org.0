Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5347036D38E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 09:59:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F1F6EABF;
	Wed, 28 Apr 2021 07:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2106.outbound.protection.outlook.com [40.107.21.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 124C16EAC5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 07:59:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LyPYVstVD+jN3QbMdSfjs4LRcToLBBUinwrF9DhS9gSknacUDHbL2W88PXaUqi2z8pbx2iJQClcEYMWpG5LuKT/bFMbestDAgPyTToX/f9tu43EsDAuG704HClPL8Lqu9ObCge8/rY2MQEgi9eJFfPe9CZVnpU5kG8b9AG+jRk27nh6yca7UD5l0gQoISa8rKbMejq6jKmPDbJKAfHbd46XlJCGlsu3RVioGZiZ3AULpUaMNCON0x0Scby3ZJiSX3MRSpcHvPj8fPo2fXKnpx1ObvkouiYd2sKYDpdnGJenz+Xg61y8USMuQR/V4Zg8TMZYPPj+KGRPg9UiWxN7p7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3LMBJQ9u+gAqEqUKR8Ivsd2NonCGu4UPdlBL+YastA=;
 b=f2IpeG88OtB/BM2YPaelFXGzr16g2xIMmrQloXj13caMutIAWnz2i+P3nZEf8tHxfgLiTiz9ie9QOtUgZPeF5gT6FPwzYrq3yChtAdYfz02/egnvushyENvUTtEzqjHCCbBG+rVyCalGKY2jZjhvQNh7CjS19MgaS/H8tQfARKNJO/8UvhKQ+hztxSaRutnBKbPN3n1TNS77DeJKMjjm6L3pQ5Y+1Gu54G3Tl0O+BM0GAu/wu8zfYB28CDeOo4FO2KJo7bhrwRZR4xvY9Pfny7mp56sqP58YepNIU/Ydu+2TYuv7BMLSip3wov7NkWHFalspTvkQxjA90gOs9XDtNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3LMBJQ9u+gAqEqUKR8Ivsd2NonCGu4UPdlBL+YastA=;
 b=SWwSChkpids469Ilwig8puGEsvFOhORFNEqmAJs2BM/61GGAYI+DS5Ws1xurDEZnij3Y2Np2FWEqkA2HHJUuc14RVmRVsDyPEWm056BWgKGSVh3NbyJFuYAU3Nls4tH997fP/dt2RZqUQvaSVuRxd0/m6SABf92251y/cQLmy8Q=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB3252.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 07:56:29 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3d8a:f56b:3a0c:8a87%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 07:56:29 +0000
Subject: Re: [PATCH V2 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 and SN65DSI84 bindings
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
References: <20210421223122.112736-1-marex@denx.de>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <a39a107e-284d-2f4a-8b69-ff507a6a0d62@kontron.de>
Date: Wed, 28 Apr 2021 09:56:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210421223122.112736-1-marex@denx.de>
Content-Language: en-US
X-Originating-IP: [89.244.188.238]
X-ClientProxiedBy: AM4PR07CA0009.eurprd07.prod.outlook.com
 (2603:10a6:205:1::22) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.10.27] (89.244.188.238) by
 AM4PR07CA0009.eurprd07.prod.outlook.com (2603:10a6:205:1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.8 via Frontend Transport; Wed, 28 Apr 2021 07:56:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 246c390d-e393-4262-42f6-08d90a1b210e
X-MS-TrafficTypeDiagnostic: AM0PR10MB3252:
X-Microsoft-Antispam-PRVS: <AM0PR10MB325220AF627996549A235406E9409@AM0PR10MB3252.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: krdsOGLEvqq8Lbz1oiUt2TAK+xU9eYFRy0bzknDJ77B7NuzTFYpd3zEM10GtLuKNQjEUItAcBFl6fT0tOUJAa6/pQ2ME4XQB3OvSUX2ucfjv9vZrgZ1Q6WFHIlU3zkvP1+JiAp0edOipilzqaPxzs82gEiGERKCK+G/qmUE/VQ+ULGRqwKW3V9eCg9TaJeKyyJebvP/zp4Ln9+mbfinv3Je6zaujLJWrDf5WXvZVqLSoA3UYAnNuSCejmIMKVHh7+pZnlODa9pQnvtilkndm+rxdlVFHVBWum9YBr7BdmgV6DegYmyhsY5qoYQi9ei5OfxWiYx8kHY2f9PwbG0mH4NQwmYGm6xX4r7ooiEDBs+70Zzka33q93hlRCyg8nBCZMVGU6JmU0KlveykgxlNVRN9JiOo7JElNJoLioydehSxLhCDaI8t9O6/tvm7B+QcJKeiHB+wi96i/guR/MwGa11CtOu5lSAL0Xq84Ig5zHnjzIojCAldJLMoNEiSNrjd3RMYSvyaKxHF1UW6Wbars3SNHLU7LFwlTrCp5CYVBp7v0tyoTUmYz/zd1d9gP+rRrXIhYZRtFPSNUKdMjELkJEvGUagf1b71vLOwjxiIz8vDveCYCC7LnghezNWQeJDVwDfOyzR8Vke2r7TXNVniU8sijS1mGaHwN+K7HEe5C/Uz4AyzdKsCF6MjndiT7VWfyXiSKldtIo2S9vD0Tw08ujgwS7AGJ7PQFfkWwC3n4892/XWhxrjOvrncBQNb2UM33SbUetXYPFYchOpmfAtAXBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(956004)(316002)(5660300002)(2616005)(16576012)(86362001)(6486002)(2906002)(4326008)(8676002)(54906003)(478600001)(31696002)(966005)(53546011)(8936002)(31686004)(186003)(26005)(7416002)(16526019)(66946007)(66476007)(36756003)(38100700002)(66556008)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UjVydWN0TEpXNDRWaWlHb3k2eDFvSWo4eCt3VDd2UkFaaEEvRHVYWWhiWWRO?=
 =?utf-8?B?djFJOFdkNEd0cUdFc3k4SHo2QkV6MUZqWld4THZ4YUgxNEVmSXZmK0dhZE4z?=
 =?utf-8?B?UTFHR3J5dVIzZXB2VmVnWU8wTzFtYWxKd3VjM2tMVC9yNExldWtWc1Y4aGpq?=
 =?utf-8?B?VWRUUU5ncVZTdVdLdnlONlc4WllObmRaenVhZEYrc05DSzJMUE1pMURZNkFF?=
 =?utf-8?B?dGtDSW5HdHJNSURqUEZTYXN3WU5SVlZnT3hLTXBuN2MxNm1SZ2RqeG9kYTI5?=
 =?utf-8?B?SEFvd2h4VzFiV0EvV3p0UndUUFFhQkNZYjc3YmxDY05jbmNMcWVBakx0ZjRV?=
 =?utf-8?B?MFlzaDJSVFNJOWNSTDQ2ZjFUemd5NXdJT0diM1dRbzBwcFBvd3hJTmNjbFFT?=
 =?utf-8?B?bjlpUktlUmV5VnpBdXN1cHJWZDZXQzFMYjlnYTZJUU1wREFoc0pGSEowQ1VU?=
 =?utf-8?B?Q0haVEdMQWloYkhnN2tXM2t3M1JlNjNWcVNyQWdjS0VDVWFHa3I2SHpPbGNk?=
 =?utf-8?B?UnZzR25qMitlMTFtYURybkVOVGZHZExudHp1RWgzblB0WlpsZVlPVGRac2tI?=
 =?utf-8?B?enpDWXFmNEFWL0pPR2lMV01DUUJFd2U4V29yV1hxVzNJcnVKNThwVmwrcWxK?=
 =?utf-8?B?Q3pKMXlPd1kxQTZIU281cndOdG5WaVJmSnNEemk4bVF0OStwOU1sWGtKVjgx?=
 =?utf-8?B?cWRLenVkM0MrMlZCNTl2VkFDdVhHMG9NcWxUM3k2azZad1pTVGN4OG9uNFFw?=
 =?utf-8?B?d0V4T041bGRDSzlNb1Rkc2pyU2NqUklWb0RMeU4vVy9FZkgrMk5xNndtdjVx?=
 =?utf-8?B?ZFNWSERCcXpYV0hXZ0lUUXRITzZyVm9sTFd0RHEwanU4bkpNWHhYUmVGQjA5?=
 =?utf-8?B?UGNnQTFaWG9HUTdSVHRHcTE5SVQyNjZwbkkxQzVxTFoxNUs3UzkrTXdtSVg3?=
 =?utf-8?B?NzFkYzhpdVlDYktycEhaSzJvTS8rS0hiK1dLUmp1ck5odmtzUXlVMzI3blgr?=
 =?utf-8?B?TG1jb25RTGcrTUFYcnNMbUdhQVNFcHlBV3phZER2YWkxcWkrclp6NTFxaHcy?=
 =?utf-8?B?MGkvbDQxOVFTZ3VoTkR1ZVpNUSswNnNBSWhBNndpeVo1ZytlSjRWTWIyQVd4?=
 =?utf-8?B?YnowVGJ5SW9RU3FqdEdRMU81bytHUmYxVGZHcnBHV1FXTHlmY3pZT2JUZGhF?=
 =?utf-8?B?Q3VPMXdIdzh2UUtFNU00cnNnaytWWmVYZ0VSRFNiSkZad0NkcFo0cDVUNW1q?=
 =?utf-8?B?M3JrNEZ3OWtScGVWQUE1MUs1OERaWVUzejdZbUxXNXdTZW9oMXhmMlJVdlRU?=
 =?utf-8?B?LytBTzJGV01zMDhDNTRjY3dDUUxCMkgzNU5jMVFTaFRqY29MM0k5cG82WFNt?=
 =?utf-8?B?V2QzQUpKakI3cEhuNGtRVThPZTRkY25taVFyZjlXY1RoWVZqUytTZnBoK3U5?=
 =?utf-8?B?RDVlMlQ5bHc0ckRkZC9tSmZMRjJKeHZSOG1jSHNGUEprODRmaDJCeU1RZkMr?=
 =?utf-8?B?Qm1pY29MWGU5T0FmaTF1YnNQUUhRbFNQZE5NY0wzbytsSllQcXlpUmxnVEJ5?=
 =?utf-8?B?MFBqbTh6Y0tCc3dDVHJNcXFYSVFYMFJ3bDlaeVF4R3NXTHBSU3NWajN5OThB?=
 =?utf-8?B?WGlDaWw5ajdmcUFsa2lDTkpIdmlPaG9yQjFRcERZWGoxRGUwbzYwc2R0MjdM?=
 =?utf-8?B?T0NEUEJtdG9uVTZkQmRLaUVJaEdhb0xjWTdnZ05wbzZzUkpkdFk4VUFRWU5G?=
 =?utf-8?Q?7CI+RffEBgJCqcyx+lAB18NsaRx/0igNRasKfnV?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 246c390d-e393-4262-42f6-08d90a1b210e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 07:56:29.0489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6X6gTnvs+bZxTJwpGpLGEx3WkRO3hqZjjnmaElxto6s+sMTl2TGMoyIMvaA3OZeq8wVkxBsA3+0nu5BcX53rswMB7Ltc7UhbVwhirC+hCgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3252
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
Cc: devicetree@vger.kernel.org, ch@denx.de,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.04.21 00:31, Marek Vasut wrote:
> Add DT binding document for TI SN65DSI83 and SN65DSI84 DSI to LVDS bridge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: Add compatible string for SN65DSI84, since this is now tested on it
> ---
>   .../bindings/display/bridge/ti,sn65dsi83.yaml | 134 ++++++++++++++++++
>   1 file changed, 134 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> new file mode 100644
> index 000000000000..42d11b46a1eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> @@ -0,0 +1,134 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/ti,sn65dsi83.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SN65DSI83 and SN65DSI84 DSI to LVDS bridge chip
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +
> +description: |
> +  Texas Instruments SN65DSI83 1x Single-link MIPI DSI
> +  to 1x Single-link LVDS
> +  https://www.ti.com/lit/gpn/sn65dsi83
> +  Texas Instruments SN65DSI84 1x Single-link MIPI DSI
> +  to 1x Dual-link or 2x Single-link LVDS
> +  https://www.ti.com/lit/gpn/sn65dsi84
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: ti,sn65dsi83
> +      - const: ti,sn65dsi84
> +
> +  reg:
> +    const: 0x2d

There is a strapping pin to select the last bit of the address, so apart 
from 0x2d also 0x2c is valid here.

> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO specifier for bridge_en pin (active high).
> +
> +  ports:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        additionalProperties: false
> +
> +        description:
> +          Video port for MIPI DSI input
> +
> +        properties:
> +          reg:
> +            const: 0
> +
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +            properties:
> +              remote-endpoint: true
> +              data-lanes:
> +                description: array of physical DSI data lane indexes.
> +
> +        required:
> +          - reg
> +
> +      port@1:
> +        type: object
> +        additionalProperties: false
> +
> +        description:
> +          Video port for LVDS output (panel or bridge).
> +
> +        properties:
> +          reg:
> +            const: 1
> +
> +          endpoint:
> +            type: object
> +            additionalProperties: false
> +            properties:
> +              remote-endpoint: true
> +
> +        required:
> +          - reg
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - enable-gpios
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      bridge@2d {
> +        compatible = "ti,sn65dsi83";
> +        reg = <0x2d>;
> +
> +        enable-gpios = <&gpio2 1 GPIO_ACTIVE_HIGH>;
> +
> +        ports {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +
> +          port@0 {
> +            reg = <0>;
> +            endpoint {
> +              remote-endpoint = <&dsi0_out>;
> +              data-lanes = <1 2 3 4>;
> +            };
> +          };
> +
> +          port@1 {
> +            reg = <1>;
> +            endpoint {
> +              remote-endpoint = <&panel_in_lvds>;
> +            };
> +          };
> +        };
> +      };
> +    };
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
