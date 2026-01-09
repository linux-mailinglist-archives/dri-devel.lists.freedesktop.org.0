Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24585D0B162
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 17:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA7710E8F9;
	Fri,  9 Jan 2026 16:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Xug3r07o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483E710E8F9
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 16:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1vDYv3V3EsuwEFPX14DSdyvs2kDX48bmpte86iO61pV5cRzrCZ4n3M4QXQJKyg0tIJV0+q+TjO9PFUY0laT8xiJO1O34l9k1QLVcjw7SieChHZAyq1nBULLN9yYqYiEyizvafqWIbTEkLz6y1OlCHKmVeWff0yYCIjT1eqCa9eAi2RfKXW/XCTj0n1Tsewxa8SsRBReFUDcb622bmwVe4YCOAt8XB4AkJBNDgyQLX/RLT/afJ3xxlGy8LKk0zZpRNAnjzU1w0kOkLBNaUcVU9NpZ+pfgUsy+1L3HE7gnpNCz8E6cqPXajU2q5/ESH9+NaITpvGqpsyhTAvMlwZXlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHhFUCgZj77AWutw/CVZbqjHswvXCkKOssI/Qsf5RLs=;
 b=jylzWgdsSQBlzanTnxn6nvsU8OUPCTW/GSedMzLmrfd1DCjqaWbHjozeIpoAJ/T7GIhYyqRtqdPZ9p9tvgW3cvI0c5Zi6xEab2F/VQZhUAG7LlKq9EmA2KhpHxUAERtCKqYAvq1QzdNrSAxLUD6x+pkMl3tWEs1YLTNlC8B65a5JPI1c+3E0wNczwMjIg+yNdvSDTQTvAkcY+JCfLZNm0yVc6xXFWj50Wrsnbr+aYcFKF0RoxZKseTNIhT+I+8OUF6Wg1mVq6nijbYjtjSYKgc8RDrY9Wb0up64dM908DzBVO54mmTHH9nV2rIBTU/RPOk4RWkAIkRwXFmbLiwSGsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHhFUCgZj77AWutw/CVZbqjHswvXCkKOssI/Qsf5RLs=;
 b=Xug3r07oJO9vyHRIZwAf4xwY3+Y5DhPglozuESl7rkSW/1CPBea7Kjc8smS4bGJw46GrkZh0g47t9WF3kIvNorOkEwjcbkDvZnkP0Hysbc9feVqrHi+NfeXPoj3d/4+u0uVEQZIllkyK5p5O4/mOZqMjrXH2vwFTOeXqFinwvts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16241.jpnprd01.prod.outlook.com (2603:1096:604:3e9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.2; Fri, 9 Jan
 2026 16:00:00 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9520.001; Fri, 9 Jan 2026
 15:59:59 +0000
Date: Fri, 9 Jan 2026 16:59:40 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 10/22] dt-bindings: display: renesas,rzg2l-du: Add
 support for RZ/G3E SoC
Message-ID: <aWEl7A43aW9MAGvq@tom-desktop>
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcfc4fc5123c2351d96ac102aa5081bd99c8a40e.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16241:EE_
X-MS-Office365-Filtering-Correlation-Id: e169db5b-60d1-48a5-8aef-08de4f98241d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5IF2kiea7lo6QjM/mhMnRXnpFoUtpQcLCpdgN4DGhDlbHYb4PE6P/j+zET3o?=
 =?us-ascii?Q?FW7yygKxiWMphj7FDxh4y1CIhQP8LLy8XX+4ub9MyKsVbT1evb6Dp6vdc2E/?=
 =?us-ascii?Q?ED1r42uY/YPtDUbcTWSd5+yPMqY1rJw6yF5GJyNVUSgaJAawSRhP79HU7tge?=
 =?us-ascii?Q?gnb9DnuYKz+E0i1PSQbhtU7XztB6h1HXiI3h8+lb0nQpdx3c4ALGHwgIytvj?=
 =?us-ascii?Q?kJOkdU2rNX9Du+7RsFa/y3sLMBaK2OwS/4bu/wU9AUnBO+/VGAziMg83r+3c?=
 =?us-ascii?Q?ddLEhecUO24VgPC72WDFV2tNGF0Ns1M4e/l5LYGxEc6DpzJq57yGGLqOP0ww?=
 =?us-ascii?Q?w7estU36NxeAsEb/HhqgvLaXhqTXGLafFpqxYfLgsg36i9nBSWpLInGlvjxt?=
 =?us-ascii?Q?YpVh8izZ03foCzaqu9bNusVtipPH0iyjKeiUzg/RIePLHzKJKjeisMzNw/ay?=
 =?us-ascii?Q?Wnhljv+xoMBhTdaWKgTRLg6CQp68XNYJSCdHTBMVVCw2yEvq0SVbU9EOJOLf?=
 =?us-ascii?Q?/71BswzSZwHsY+4a+lfBwCvpeUG3Sx7oyKhtQq//zGE2A/lE6gmfU831aVJf?=
 =?us-ascii?Q?/rchkbycQy76BLwT73W0OxTTS3lnxxFQEdaMpKB/jBShXGl4WeD/xOKovtke?=
 =?us-ascii?Q?H6cBJ5aMD5W04DZxWIn8aO27JxJSp1Fo7+NYMindyNLf/MMtruESXsELpSXo?=
 =?us-ascii?Q?0IBaISi1N3mKtvtMCMboJ5QK2T+6MEnDDNFoAkXYvuOdkVS8EUzqeUvhB7jf?=
 =?us-ascii?Q?rdwoEzf76TEIWp8VwrJpAsz+xNZLMn69Z7LirnlYoOxk3oMqFs404KpUuuIA?=
 =?us-ascii?Q?T3NmvLMyio0PyOZwJrC5kL/HMpEI12ZZIvSH+x3CeyS1pm3wXum+bU484gai?=
 =?us-ascii?Q?xLOY/E9d51quUsM0ZLj7ulQK+qrm/+4/PPFjGM8/dYqxn/fgLNl+VMfJR79u?=
 =?us-ascii?Q?InAOUjVvghuo+W2eKZw4/xLw33j8gxUeFsXbHSBSv6NtDa/DX8XCpad+Ri3R?=
 =?us-ascii?Q?Brm5cUlvl7ja2XA3Vy5o119bu90JVv+etXRqGAeNfa7caDKGInRD9Dv/NDlN?=
 =?us-ascii?Q?KshnHHU4IbzG86QrD6P9FbsQ3L1q0LbazAEkRQ39oruCslMiNS4PGOy4zmsb?=
 =?us-ascii?Q?CJ0AdLQgHjnhTpmEZ+IPhvun8eWGRSWO2XsaNGMvoS2JklX87gIzsvS+2Ppy?=
 =?us-ascii?Q?a56qtvC0HKtx0IOc+uMH8+yOaqK2D4tx5Q3ekru6EuU7AX+8Cm5CHbCfOAa7?=
 =?us-ascii?Q?kMoNxOjUmdnurdgVhG/lfSaw2SrNM4fRy4u+Hje4bhjg7RxsJKJBe8Fhe2Co?=
 =?us-ascii?Q?XF6Mgb9RQx5eddLJNw7vVHKy3RXilYIDpAwK19hvOdIWt4gwBHpVcLQpt31Q?=
 =?us-ascii?Q?b4xMMzSoFIHVPEks4Cvb6npprzGeLThQ+Tx7zi9k/5Rby0u1QzjsoHnGfUSE?=
 =?us-ascii?Q?Rb9jYF8CyxCgsfBCCFcQZqwSrLqlfUIzK1iqTgOLbxRTfPInQ2p4IP0xiZ9H?=
 =?us-ascii?Q?duHEbjuhkPhOeYfRfPvFvOPtaB2LgjcxOCOq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OMPXy6lWgmYyWOY4wbWBmwG29ODNTb6Ofwh5pI+DVb3kZMNSHsjaOK3gmiZB?=
 =?us-ascii?Q?O7lRTgLLPxo1N8+AYzXA50bszC1kL/tZA8xPzVQSgWx2gnxIX6qFTFF21hrQ?=
 =?us-ascii?Q?LfWUh1AIXKJyj+VzbF0My8T79hPwnlRvnNXKxaF4Ruwwo6a+OTLj/dZTXnIe?=
 =?us-ascii?Q?EiGzy4eqYXF0f5L3GogCYcrPspTkVTdx58zoE4dPQb55ht7uJMg8yvawDeoz?=
 =?us-ascii?Q?aSGWz8JeaZabtYACXv1ZObpY4lNd9CKq/CS40fs6CeZQ8Ngy/JrrJfwYHPUn?=
 =?us-ascii?Q?zMo7zTnDlbY7YMqwbsMJ7wVXZcYINCzaz1hI3o7WrvTotcwWHdb7R2y+mw/u?=
 =?us-ascii?Q?BeevwFrRSNx3U3ZVQv59U2xrrdr9CqEuBji56V65tOn3WPZ/VAsnWafpHOE8?=
 =?us-ascii?Q?NgnP/5UYZm7bxnrOp53wNDGGqksbSaKq3MdyuRa26pt+YTAvCopDDyFCl0cr?=
 =?us-ascii?Q?ZQBitWYKrCGd0UVxM+Nb3i/oHOz+YJegAjyyHpVkL55C+JP4ArONbb84ZFfv?=
 =?us-ascii?Q?50OmJ/S/+MBRSiVwti0rxKUawpboyV3+3NmSnX513bOtIF5ow972xJAj2Lrl?=
 =?us-ascii?Q?JbtpVKkJH5IMvIGtrSz2jBXfifmhY6Jj5kx5otuWToRSsdDMugzAU5YbaFc6?=
 =?us-ascii?Q?YhGCWoOAMrIkYKqvwyLADi3Az/Qzkb7sNZMsnTNvpOIk0pRLuwFdKkf5K8CV?=
 =?us-ascii?Q?PlGfXadL168PDUh54OzJWZICCqmaMwBQ1+JpPPwFFBWjcL1EH9AN5r2lGDsq?=
 =?us-ascii?Q?DDg6KTBHwrXQ2tIWXplJDyGMSo/tiHY5DycdB7jZjzcw5nlMpRKXMNYrEu40?=
 =?us-ascii?Q?Xvqc3ImpkulkfayDdCIOrIbB1xuXmjuTzpuaWQWoaRfw6x9aC3pKr/8rMNEI?=
 =?us-ascii?Q?t3A2NHRALjeECX8HNPeKIAjgIaVf+YTajltR+EBgzLg7WsZV3RuuGcLNVMQt?=
 =?us-ascii?Q?RDFoCCU6lHuxiy7cy2sgJqCl/6kPwUR5JlBzAjjM/8xSRH3OG/a+9GbjCtzK?=
 =?us-ascii?Q?rV8kI6p2hQveS1Hk969QulgSaMnSIPQJoWo13OjTto/vfREsmvlV1zZIwYID?=
 =?us-ascii?Q?krvp5Q4N/6p4MjjRFy8jiEpLJgxTqC2o0xdTbu/v/AeAGwXJ4CdO47Elf+WO?=
 =?us-ascii?Q?eLzr0GoneETaDXVLShuW4mNbID3pW1g9EptuAhGNKmO8rxU0AAh4loXzr6Wa?=
 =?us-ascii?Q?3FVhxyFKesWV2pyRLwdP8wAKgCX4c0lFqimu8L6FXaDrNs9IXqpE/0NeqLmO?=
 =?us-ascii?Q?sQhCPOprAOItNDo5hvfb4WJvkv46w6gqMqPOIuphrm1umMdnsN0UWDhWLpIZ?=
 =?us-ascii?Q?usabuCOhg+9VUihX+QJIQXfa7qMeZaLoLGx5qCGdpPuIP07cRXHCAuXyvsWD?=
 =?us-ascii?Q?KMYMBKc90G1tZWplfEhVD1q15B1PbHVVR8j/6vJ9h1I5DNuVgSDZmBtHHRAT?=
 =?us-ascii?Q?00vWW9hgLGdyj60Wlv1JNrQ1Md3mbwr3RpTyYp0TkqRUDxVOn9d1GtzHRKRf?=
 =?us-ascii?Q?SOvcbuWjM3aj8esbA1tiCPU4xqVNud2Il/zCjwiySMftmEC1Ns0m4fT83kRV?=
 =?us-ascii?Q?WhPOufGFojly3JWvBtD+Pi2kE3S6H5NthBXs2OYwlNjm4HnZw3EJzmFF+egd?=
 =?us-ascii?Q?g+WTZ9Zhu265lBZCpW+4ccQCDBg++MDWfkGOA0VyDwUxGlMwG+VlEZsRW60o?=
 =?us-ascii?Q?nXhTiL5zOYmWc+RrCVD6ECN1+wYtnAZAP/mgGbevr4m36fZHPaNf7BRKQoSI?=
 =?us-ascii?Q?iYWLv5FDM+Q79gQk8ieZzdNDg90IAmmyGunmJwHTYo4e0O7896xy?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e169db5b-60d1-48a5-8aef-08de4f98241d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 15:59:59.6183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cO29CUMWOyQ0KdUOPNhuvPpXdH6vCRdXTq00HKQTf2Dulgydt+ctJtq+25wsqbtF20UkDZp//QDYmXgYQGrg9kGifU2A0rGZVLU57zrw7f6WtEJIeUUoVHlWnGAZwiyV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16241
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

Hi Krystoff, Laurent, Geert,

On Wed, Nov 26, 2025 at 03:07:22PM +0100, Tommaso Merciai wrote:
> The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
> Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
> Processor (VSPD), and Display Unit (DU).
> 
>  - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
>  - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.
> 
> Add then two new SoC-specific compatible strings 'renesas,r9a09g047-du0'
> and 'renesas,r9a09g047-du1'.
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> index 2cc66dcef870..a68252ae02fb 100644
> --- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -20,6 +20,8 @@ properties:
>        - enum:
>            - renesas,r9a07g043u-du # RZ/G2UL
>            - renesas,r9a07g044-du # RZ/G2{L,LC}
> +          - renesas,r9a09g047-du0 # RZ/G3E DU0
> +          - renesas,r9a09g047-du1 # RZ/G3E DU1
>            - renesas,r9a09g057-du # RZ/V2H(P)
>        - items:
>            - enum:
> @@ -137,6 +139,46 @@ allOf:
>  
>            required:
>              - port@0
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-du0
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1:
> +              description: LVDS
> +            port@2:
> +              description: LVDS
> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a09g047-du1
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI
> +            port@1:
> +              description: LVDS
> +            port@2:
> +              description: DPAD
> +
> +          required:
> +            - port@0
> +            - port@1
> +            - port@2
>  
>  examples:
>    # RZ/G2L DU
> -- 
> 2.43.0
> 

What is your opinion on this patch?
I posted some more HW details on [0]

Thanks & Regards,
Tommaso

[0] https://patchwork.kernel.org/comment/26686746/



