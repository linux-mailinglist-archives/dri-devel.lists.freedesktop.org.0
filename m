Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B3AC40AEC
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 16:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461DE10E04F;
	Fri,  7 Nov 2025 15:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fP2Jadg9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27CF810E04F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 15:53:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zV8WEsTm2AP8dW0kc3/5BNnfDFmO+7kJNsBIbYtG9r5BftVGMcIB7FcXQBCH0XDjZxsUrwCwuyIkYXaJhH/Th9jKrFm7ti1lB7FwQulRK7jO+gaaV751vdEsmuHQLTsJlYic182JwJUfBHYNR0hBmLNLWjH/Z4IiUHw3LifSepDsSKM2ifEdxUvezQPXYP73K5wcZDGhpZaGoltmLEnyCPEAG6n+hYBp3Dn5s+8LoosgRPLWg5kZBQ8P94i5yO4iBAvt0d0KzEzl5t1FMTEMpkymifaCFljv1MRjiKB2YA89FLmUQCBmOv6aRs0OOavRknyI3UaAqF6sJKL1DucKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxJ41yeq/l2XIXDmYkUxV8mMQ2xwrHY8KVDenWfIoiU=;
 b=rw+PWpIADI6UUOuvEjO8bpsKANJ/BCN2JUpplpz//j9shOHaDYmbQxeAH17WfA6p2EThkWPEFpOenm+kofsyQ77ZCkRa5MNI2HISrF89WYWMM2NtO1QwwMIOUDD1Nhb8pMqEHUviH7o0bWtTBDpi7g/z9Ftfv8swbb2IlwEZX/A2BGsq3OpNrEjxwch7MUnoAua1h27zr+/U7oJEM96JhhUopRZSP/JWgH8VOlDS0nYqtkCa1f/kJhsFHQzZ1BAq1eqmf0szlwgEUV14MmuvZA85qmZXi8CwG/eivZKAsvV6uXxdZ5vLyJqooG/DXzdzUSohD3wnVSi1Dlr8vKHRGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxJ41yeq/l2XIXDmYkUxV8mMQ2xwrHY8KVDenWfIoiU=;
 b=fP2Jadg9P7t5ZZcBm/RN/r+dPa2ZTPhKsWGjGOFmXoFzaRuE+igyLqzpYFUWZsc2F9HNyTmuQOubu1amkuM382NmKtStunyHMoBNJYgTC5NfC/NJL9QcGVmTBndIl6v/ETDkUlJh/0epGBrEI0B+yEziaUng2gZhrEzDAkT0sDkj+3E3mcDH2OnCsFFMrJpTjSMwofV79Mwje7d9HWDBjPMpOoWzQSD+ty8rc7zc9qkNm4wgvbxW0rztHUck8t7kTlAh4f8TXSr1fIB2yQcNE2C7G5dRqH9Dtgl6t30iEcFW+l04QJ7qPSpeS0ECSeV/t69lvW8+K6ffEcf41cB/2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DB9PR04MB9673.eurprd04.prod.outlook.com (2603:10a6:10:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.9; Fri, 7 Nov
 2025 15:53:41 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 15:53:41 +0000
Date: Fri, 7 Nov 2025 10:53:29 -0500
From: Frank Li <Frank.li@nxp.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 02/11] dt-bindings: display: panel: ronbo,rb070d30:
 panel-common ref
Message-ID: <aQ4V+QW8l4X5yEV2@lizhi-Precision-Tower-5810>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
 <20251107-imx8mp-hb-iiot-v2-2-d8233ded999e@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-2-d8233ded999e@solid-run.com>
X-ClientProxiedBy: BYAPR07CA0085.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::26) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DB9PR04MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: e5668ea7-7b8b-4a1c-cc3d-08de1e15d29c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|52116014|1800799024|366016|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?67zou6KwctBiUqSfuvR9r9rdYwY3+ZfN2Vc2oInUeoeK6TnKSetcpnLCK74Z?=
 =?us-ascii?Q?dSMD4D2U44qlzUF66PK2Xw0St2Qnyss1LEvf1OHyDRgluUU6yuIvuiRtO53K?=
 =?us-ascii?Q?0p1yY4isfLQWTVgDsZkD8hdoJvqSCWjbo7HaJz/htFQiCOPedq6NBpdhKiLc?=
 =?us-ascii?Q?yUMg7cFUIoVhfuYK+JJxScAiSyWhzJe+lu5zZ7kdKvGI+/cZ0aHpfTQOGhd7?=
 =?us-ascii?Q?Y1J7iYD3dB3zhu4VD6Xc8tHzKcfhaJbKFXLU/Gvm2K2rypkdAczqYiawQJ8m?=
 =?us-ascii?Q?/UHrZyw49X4Ed/O/w6jlk66JP9A+MyoY3c4vnR4olBl01t9V1KJlTZzhizTO?=
 =?us-ascii?Q?76PGAb5Y2IjazhO4dysefuWdR9mQA01d5jS2iSUJby5izWFfsMbc0sKdzdnq?=
 =?us-ascii?Q?8GpTMUkyn/fSDieunis5A6646v5MJ01EXl4v6CgO+raGDTvGjFPZlCPLmdWk?=
 =?us-ascii?Q?FIPjdapPU7LXkrVtZNJGyu8SzpcZ7G3f9uht1azB5DMDaijARYzkoacl5Mpa?=
 =?us-ascii?Q?Ys7Mlt3U2MQcxpxRbwn4ecHq0eBoCamGH/zcpzHOWssjzm7HkMTPIFlfYPlu?=
 =?us-ascii?Q?erfST9PDNxpxa/OqzVf7Ckp55NwQYbfyBw3kMfjSMedbEZjVZoTblsxgCWEJ?=
 =?us-ascii?Q?ydh/iMoW4qUDjYoJpP2SFK/fW4LkRjWRKj/DawTp29VH7l5fUbhzCHS6lrZb?=
 =?us-ascii?Q?Dmh0xxU/8aeE8iG4P1Z90vT5jAv/2BypXOwfsGqqwx1miKZEXdhHxKhttVzK?=
 =?us-ascii?Q?PCOpz7TrBTeQgKrjGTlkBtqjWhgDSdBvbxiCQcNXrJ46vs07Ml7tcpti9rii?=
 =?us-ascii?Q?ZLyWrzdOaZuRbEC0hLM0ayQnN1XpfC/pEQ5BCepzoISKsToRsTOyG0E3R71x?=
 =?us-ascii?Q?yymveEpdQgn/XZd4nwkug8KU4psmAazIwc17tlJadSFckNjL4VNmj4SXfgYj?=
 =?us-ascii?Q?Qzhahh8PztbC6ojeTEbY0L9zJP7yOlG/GYEO82seWgzDztY8XnkTRKMSu7kN?=
 =?us-ascii?Q?URn0lId0ormCIRNfIKYg78MLvTBpbFdfMoGDC/vLJ1dNy8PA67iE6DyTXx3K?=
 =?us-ascii?Q?9vYB53Es1DKXcKAM2We0d8910TiLcFkF2pSVy/AdA6BV4S4pGoVeED8AeDHi?=
 =?us-ascii?Q?oF9eunH1tdye7q2mZH85EmObKEP+sTKMh7gG+ncblFsUPpk3n5g4g4xG2K+E?=
 =?us-ascii?Q?zmVzGO8KRvbbgCj1mjiLZHuqu1QIXxfbDGLFWgu69uMKMLLDxHe51COCB85U?=
 =?us-ascii?Q?RE0H3Pir6bLe8NxHiBxEo7WWS5dgDhmzYWUbfOgpHbGyX16/QO2OCVD0pY8E?=
 =?us-ascii?Q?MBOxJ+3fAHmmGBFo2gKTizLqIFm1XoSX69z8ev6I9wRj/jvpcWantKJ3ze4z?=
 =?us-ascii?Q?QUurB0THLAwYleqKKRucq8GTNQ4tj38xNpHtnlgV4Yw2Wm/OEXcK0zuNxyac?=
 =?us-ascii?Q?+3UQFNaZJwQBgQKratAgzcTOsJr+6pPjkfXmZuq4RGt8Jbt9UIP6PsILj784?=
 =?us-ascii?Q?iyYmw54qBR326AEZ5nMOvfeouNomj6KLIBaX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXSPRMB0053.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(19092799006)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NFH4bL56ZnRZ72WNE6A1oWSxYfcirWDJ1YZVntUiBvXFtxtV4341q8HwOi90?=
 =?us-ascii?Q?NnlkbIZvjFi2dNQ1FWRHVg5bDKIjzP8M4exgPNbOrDnIFWjisXgp0PhE067y?=
 =?us-ascii?Q?u83+cHekcOATRQJmdWP1EkM+ExjIZDs/Y4He6Zsg1KVOXKyy9RpxLWs2vMQd?=
 =?us-ascii?Q?AyiuNgTSR367OQgjPLaXLhNDvJZ7SwgLE/CW2//Svf66KDgp5LrvV9+vzKG1?=
 =?us-ascii?Q?abdTEfaXFHT01+3l+FOWvg0LQekXdxAGIQaLIhi0Ac0nexPrD9XGqOcyMddR?=
 =?us-ascii?Q?YWmoSF12rvWLjIwf4yhgtNYKVzahLsCjO7D7Qa+wg6cHM4VtqMpOBB0+WEIQ?=
 =?us-ascii?Q?CHj3uXBET3q6PQdwHBdEGumC3JbhybROZcVV74Up0aw9isct37hCZTkQPzKx?=
 =?us-ascii?Q?GczilkIX5RTxh1SVGgBLJ5zEN+FCaaJ4AQDP/VG4oCtvJ+fVRzYGuLS4Ff9N?=
 =?us-ascii?Q?RjLqIqzVGVIjwggJO+jURKTyz8XFRX2WKaNnCDPQHd+MCwbOA8dUHEPum4hm?=
 =?us-ascii?Q?xLqN/lwVo1+4qAB0cpdEyaygOMCgnGMgfJK9YDNNXsNZSAnY+NLugCU7ds+4?=
 =?us-ascii?Q?cz528NPedXVVley+60snHO8V+T71LUGDOGirdElzfSqWmiyKECaKn/0EJG2p?=
 =?us-ascii?Q?QEZsptkYti2h8xoDDrE44zVA4i9jk0o/qvncmKj+3612uuo1tZPcQxbAmwFJ?=
 =?us-ascii?Q?Y5hmEdebVKiQdNOYbhelnkYiCAw5iPvqPdc1M4NnFarYwLcg4maoqyPxQaeC?=
 =?us-ascii?Q?gHffiqND5Zl/Zl0sASn3fWMK8Whg2MShz4NICHpK3OOoYEIL06ZBK4EAS+uK?=
 =?us-ascii?Q?GK8Uk72EaLiuvOQ7BjqIGGkoiHwZRkWiN0TTrxAGHo8tGtcoBug47VGGFpbX?=
 =?us-ascii?Q?3f99IdSU+0ZqJKROt2LZ8QbZhIRn1+nZrsrM4qGQkG9Nrjw5KPXJ8yY2f+EO?=
 =?us-ascii?Q?MgUCrMpZMpiMIbUTAF9+5vBBCqKZBP69C/vEyYvXjv0bGfSYNyYXoZUem4qK?=
 =?us-ascii?Q?r39ffRzV6AzNghggYLMKCLATGVO4kNTKp01qRCMiKacjq/33gu1YTJBWDXrV?=
 =?us-ascii?Q?kBU82vQGWQQhSc3sHNgHhv046TKvn9z0zFdrldIODMYPaNbPR0onMtkaDwVQ?=
 =?us-ascii?Q?hTlzxoUx32i8My1UMVLr4kd03CLf9RLtrrS1fjpDMgGx3LtiDoq1llCIHI2+?=
 =?us-ascii?Q?YpiuKqai3zNgO6iHTltLn9UQPkKVopnZJUmj+ECq+2WZpbFg9m/fafoJ4tyD?=
 =?us-ascii?Q?/w8eDVw5Y7Y0CssHeKK+ZuwnUj3inuyESlstYGlNjwYTPmzdgnlWkRYMGv+v?=
 =?us-ascii?Q?5ndtcF24wYvGI0EGGyikKRW4vH67TfAWsEt7qqXl2hQrvL0uRhHcs3T8mYDc?=
 =?us-ascii?Q?r4N8sK6Q/5pUW0zLXykZyYzN/ZpbF5tPDeDyIywh2ekNi9WIsGmy81unjKnG?=
 =?us-ascii?Q?/Z8pIRGil2rLSArqpIfolHY5nMRUnVzU8rFAGyNlzsa0VuTerKCaijPvyyeo?=
 =?us-ascii?Q?rhsjVLqaEG0hnSaXK24boZdg7RuSCNa/HCnyxPpUD+i08TZfiY3uXKNImF6f?=
 =?us-ascii?Q?Dl8tRNgQx9WFmtWIy27KR9MgMCsYrCHSsQU5koUD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5668ea7-7b8b-4a1c-cc3d-08de1e15d29c
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 15:53:41.1172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTaXvSk/yiDmJQ++bAAdbIEv3r1wrYjTQl1CVqVOjGmgVkfeVj2Ae/SdUdrZqf+5gJ6e5bOBX/3LtqKzCr4aDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9673
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

On Fri, Nov 07, 2025 at 12:46:09PM +0100, Josua Mayer wrote:
> Add missing ref on panel-common.yaml for this dsi panel so that common
> properties can be shared.
>
> Drop reset-gpios and backlight as they are already in panel-common.
>
> Switch from additionalProperties to unevaluatedProperties so that common
> panel properties are available without repeating them in this binding.
>
> Notably panel-common defines the "port" property for linking panels to a
> source - which was missing from this panel. Mark it as required.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  .../devicetree/bindings/display/panel/ronbo,rb070d30.yaml  | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> index 04f86e0cbac91..6940373015833 100644
> --- a/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/ronbo,rb070d30.yaml
> @@ -9,6 +9,9 @@ title: Ronbo RB070D30 DSI Display Panel
>  maintainers:
>    - Maxime Ripard <mripard@kernel.org>
>
> +allOf:
> +  - $ref: panel-common.yaml#
> +

Can you move allof after required incase add if-else branch later.

Frank
>  properties:
>    compatible:
>      const: ronbo,rb070d30
> @@ -20,10 +23,6 @@ properties:
>      description: GPIO used for the power pin
>      maxItems: 1
>
> -  reset-gpios:
> -    description: GPIO used for the reset pin
> -    maxItems: 1
> -
>    shlr-gpios:
>      description: GPIO used for the shlr pin (horizontal flip)
>      maxItems: 1
> @@ -35,10 +34,6 @@ properties:
>    vcc-lcd-supply:
>      description: Power regulator
>
> -  backlight:
> -    description: Backlight used by the panel
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -
>  required:
>    - compatible
>    - power-gpios
> @@ -47,5 +42,6 @@ required:
>    - shlr-gpios
>    - updn-gpios
>    - vcc-lcd-supply
> +  - port
>
> -additionalProperties: false
> +unevaluatedProperties: false
>
> --
> 2.51.0
>
