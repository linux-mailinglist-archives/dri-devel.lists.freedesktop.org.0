Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38C86B0C0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 14:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 550C710E295;
	Wed, 28 Feb 2024 13:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="gcynDwGJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2109.outbound.protection.outlook.com [40.107.13.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E068210E295
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 13:51:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EpxfyUX/aNakoAx8nPPhwMV2He4c8h8wn3vb/7fwLQNowh94d4UnlaAuy1Q9vvg9G+9QZZVShug3ILQ10ankZ005kt/MRYKx06X8JUP6wWpvMcCjOHib712FTKrTXYGsPTihrWjOqaqkmPrmK/AymArJQg5EaGnLhlSEFifMmUj8NHqbrUafkDCcxXXNovpjDBjUZBJWGWr9J2GKEuGf+rKLu4hclHAS9B6pdKiLlBdX/3VakHVBoSQWZ7XB45vY4IExVHiQHhwAOALhqks3gA4FbcQkcAka61f8XoRcZcew8IfxytMifjEXLbsUUALXzEy74X+GQU/RauqcfKRsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwxTPyHk173LH7OLvpI8Mk3rAWKwhtS83y1hH7zVRz4=;
 b=Ta9fJBTphaSNQ6afAnzVZeKK4G9I+C7J56UyvbVQXwbvegf+/EB0IyNhtpS/rbvgrGDLZHd4S5dWK94Qy3uzWL6mDN+bfosKklE1zNqSJq+BvMt1W6CCi5Tk5j9a3XdgnbiZaHHjKKYscaZmeqOqQpP/eZi45ZNFTixig+4zw4hmw7yfuwowwfK5WFSGaTxA4CykysmTH7DEACGroINlTylsY2We82awC2M3RyZYF1ssARah2vv2c+faom6wKGwRH5HCjwQlAaI3Ilu2UxCtOg/lUJJaj/Wv//gC3bXEIlzP/jWgBuEdyCYLqziP+oUJlOZKXOhjXthxQ+0oVo72Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwxTPyHk173LH7OLvpI8Mk3rAWKwhtS83y1hH7zVRz4=;
 b=gcynDwGJ+mnxmbJQQr2PHbJpVR7Ba/Dj6HlnQwGcnAkrydBvLKbEmuwGinNCzbfG0VeQ05ykGkVHOCVwFXVgfbJEB0KOpUgvbd1v6Uei8i9RCwld5e44AsFKjD7oNL9srd37Nqdw7JR9usH0l+7KxsdRd81sTt3DaLMLCjBKavA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV1PR08MB10523.eurprd08.prod.outlook.com (2603:10a6:150:16a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.40; Wed, 28 Feb
 2024 13:51:42 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 13:51:41 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 28 Feb 2024 14:51:32 +0100
Subject: [PATCH v5 5/8] ARM: multi_v7_defconfig: update ONBOARD_USB_HUB to
 ONBOAD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240228-onboard_xvf3500-v5-5-76b805fd3fe6@wolfvision.net>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
In-Reply-To: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Helen Koike <helen.koike@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco@wolfvision.net>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709128293; l=852;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=GYIorgCuxQ34b4lu1hFXgE4alR4MOyW2uxp4IG/bCFo=;
 b=e5SR8X/GI4eakhxzqwM4biB0TXPFP6a93Gfk5uQgMMP5F0Vhda/8D4WHZby44VS26ETO+IRR6
 4SqjmoCh/GPB4SFZchLfwn6Wytys7e+srGD6L04b9s/WMKZfWmMT9Kb
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::19) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV1PR08MB10523:EE_
X-MS-Office365-Filtering-Correlation-Id: 876d5711-11af-447c-c406-08dc38646484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4ylxM2SwxkQ+2othuuPBg6dVnmGwKMlrsFOT4eOyuBByPlnTlkQ+Jn+ersztyWP0YyCY9wnjdN/Uo9LFFWZipgGhPNqamXZNbwtdLhzD9WVOf6H912QqYSkE7/fK2VT+I1YlSFW6dSgjsp99RqqcBRQrawIhGfnE2djzXakYo7WQz7Igh6bB7+NOIynLDKJd5Ps2t9xzYuEegojBGyhtfKdrNknV0CkVWql0gEuhR55MDD2276pi4vOG3hwO6ClXhDbnBSlFJVGR8Z8hYps/wPJBMxpKnBjl5oMw5xQzKoCdmlweqNzcdXgZ0QUMUSmu0ZpNXMwtjXVFOIMIgU9K41vv1DSXwQslWIxNPD/ORq/gXPDJZMYWxxvexpE11Iicg2KwB2Ygdazv8X66WnmfOjiD6f6T36vnxNg7I9gfn2IDahohzilYhdPzKAZMXf5NMi2BcVBivWQPe9V/5gMGZLjkT0XJzbxyyfdvWYJRaN3LEu1waJbaaLwG8PMcovxhvN99Tg0Jbh0rlyMyNU8/G6YCPDJDhYDmgljicVyL5uuEvbJp/Nnd95wMT2/xlpt6N2nfCBGAG/Ww2AtP2R9+oushgZIgilsWLbp/GkpqslaYpyIKBHonAzV2LKWfbkiK4Sa7RMbiCqL04isuzbCioAEVw3VV97gL6jBoe0WMFE6wShoK6+IhMNAy9OgufONCFLH0Gn+AMoxCRF3rL4VVnmF+x2R9eRxrANArwQaVfhw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXJUUUdKUkM0bzJRcUpwQ3RoZjg3RzJnU0hBc3hnZ1JTMVFtL2RnSmJaRFBq?=
 =?utf-8?B?ZVNEV1ZMNUpWOTJIOUJwcWRqSXlJbWIzdFJtRHpLV21hZXI1S2ViL1ZIeXY4?=
 =?utf-8?B?MDlGTGdSWVp2TXdlT0Q5RXJDaGRldndPRjNBazdyNk56b20vallzek1mZkxR?=
 =?utf-8?B?eS9QSFNZYk1yQTNZeXVZVUVWZ081WG0xRVVVNWdvSUw5aW1FcHN1Zkd3RXF1?=
 =?utf-8?B?cFV1MGRMNlVDS0Y1dEhiRzNpbE9rQlVEand0UnBiaWV2S1BkTjcrSmhBSTdS?=
 =?utf-8?B?S2FzMzBrcytNbmdDNDNUc04rSWk2aFRzMUtMKzdmMDYvU20rQXVvbkVLR3d0?=
 =?utf-8?B?SjBXVEhTN3RUZHNqbHl4dE9hUTVlWDVaVkJTdjhaQWhrdnhocStjTFA3Mjho?=
 =?utf-8?B?REFrVThxclUrOFhxOFFTNit4L0VqbEdKdXE3Q2xXR2ROaG9DVHFVZ08vdGRw?=
 =?utf-8?B?NzhPZ0MydjE4eFNEMjFUWmZaVEVldnpIOTZjWmo3VW5BYXlZdWs1N0dZSGla?=
 =?utf-8?B?YUpKSTViZmZVUytpVWhTV0Uyb2dXQnhtWW00citaU0xGU2sxTm5RZWdWVmhw?=
 =?utf-8?B?cTJiVm04KzZMWDFpai81cmNPQ3Jza05UR3VKM3ozKzhPNyt4MjlINWFwcTJX?=
 =?utf-8?B?SDI2ejlGd3BvdlpJRHFZS3BsQldMbk4yWkxkVmxCVGg3NGVLUlR0V0hKYkVV?=
 =?utf-8?B?UXI1MHRYK3JQeFZlektBN2s4OVl2T1J3dyt3anBtK1dKak81Z2JiVkcwVXFz?=
 =?utf-8?B?V1lza0l4Q21raVJKSGR3Q1Z4Vmd1Q1dnYXU5czFzcTFianZJWTZXdnRKODl2?=
 =?utf-8?B?cHMxeDZPMmxNZWdPMDdKK281dkxQbGtzeThOL0g0dmE1bkMvbmY5aE5QUmNZ?=
 =?utf-8?B?OHNKZURSRlNDM0ZqZzZHaVFBKzU3ZW1CTnQ0V0EyUkdvZ0UzUWY0QXFvZDJS?=
 =?utf-8?B?MSsvRzhiMGpzcUtUbVlQTVc2VTYzbWhTMXZ5QXIvdGt5V0owVmVORDZTUnh4?=
 =?utf-8?B?SElIK3VsVmRBQnpwNWE0bVQ3RDM1a1QwMHloZncvYStZbHBiV0lma2hCdWww?=
 =?utf-8?B?MENEWWRUa1ZsY1VTMGNiR1l4TFhtWjM3WFpPMmVUejFXTElNTUVxdTM0VDBk?=
 =?utf-8?B?MEVWdzV2a1h6Y29JYllld09BaXV0azFlYzV6eDQvdmpUNTh2RVBlODZNN0k0?=
 =?utf-8?B?VE9MVlc1OVgzU0M3bkllVlk2NkF5Y0hTbGorNVBMcjFsd0hDVEZlcDY4TzlL?=
 =?utf-8?B?amdmMzFkWjVHU01ZYkhDMVI5cmRFeUFQSk5Uanl1bmVJeTRLNW1wNk1CMHNz?=
 =?utf-8?B?SDE2TjFzTXE4M0lhUXNlRE9CNjJmWXZLUjUxZHZSQ3l6OWFCQzNHMUZualpo?=
 =?utf-8?B?VzdYWTZYRE5xNGtkT3hLNXJ1YXdiYmxTZ2plOVhMZndUcktkZmNYQUR4SU1x?=
 =?utf-8?B?M25qOE5yakxRVTFpbEpsYyszd0RFY1lkU3prZlhwamZaVWxTcmpWenlCRllz?=
 =?utf-8?B?aXdhZURsNWkzZlpoUW1QVG4vM0xvUzB3TC82S3NIY3R1Y1Zyc1ZTUzdhTllV?=
 =?utf-8?B?VVgrdEllaVJQWDhRc3V6V3JESzZsWHBHRDB4SFRIdkV4TC9ic29XQzNXQ05E?=
 =?utf-8?B?S0Nhb096WUpjakJLYUdZN3p3SlpIZ2dzZkNVelc1d1lIay9LWHJ5R1Y5NHRQ?=
 =?utf-8?B?Wm1lcmtxRTNRenQxU0xGdENjY3Q0Y0hOdU9BcEVOT1NxYmFEWS9wOWZlSHBm?=
 =?utf-8?B?K0oxT2hOM3d4amRyd1ErSkFHMXc3WlhVSTEvNzNRSVhKcnJSbUg1bFFmYWR2?=
 =?utf-8?B?R2dXU0NDemdFZ1NZV05HU2JjZWUwcllsNTJjQnhPeTNZeldxaWV1OGNLWFN5?=
 =?utf-8?B?YTd5YWlCRm4vWmJCQ3Qrc1hYZkRkajdZSENScFptb29sQ3MvTjU4U0RsYzEw?=
 =?utf-8?B?dDNmYTBqbm1jVmdVNHdta3RWd1BBOXZDVkFtdXR3RVNjc3p6dUJyZDRSaUdU?=
 =?utf-8?B?T254OW5tTzM4MVZrSWJGdTNSMUxPajE0WFFiQ3pDdDhiTmt5SktwaHdLdXVq?=
 =?utf-8?B?djFxZUJyKzVvOG1jYTF2S0pIWXl3K3o0RElFZ2g2TSt0cklBSmtCODZXcThw?=
 =?utf-8?B?WDB5M3RIWUtuTVVVWW5zY1pRMWtZajFKR1RxTy9USm5FNVd1VDRuQWlta2dB?=
 =?utf-8?Q?j3JE0U7VaTPB4G/mhCfnYV8=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 876d5711-11af-447c-c406-08dc38646484
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 13:51:41.7485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqkA9toy9lGR9MtdksDcWAWYRtZoR0xAZylA8esY37Dis7jk58E18KpWVtqx4vDKs56PjehIlijeQxKzizspQOZ6+2KFgtRLMjQkswHsCNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10523
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

The onboard_usb_hub driver has been updated to support non-hub devices,
which has led to some renaming. Update to the new name accordingly.

Update to the new name (ONBOARD_USB_DEV) accordingly.

Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ecb3e286107a..6a6ebec173dc 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -876,7 +876,7 @@ CONFIG_USB_CHIPIDEA_UDC=y
 CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_USB_ISP1760=y
 CONFIG_USB_HSIC_USB3503=y
-CONFIG_USB_ONBOARD_HUB=m
+CONFIG_USB_ONBOARD_DEV=m
 CONFIG_AB8500_USB=y
 CONFIG_KEYSTONE_USB_PHY=m
 CONFIG_NOP_USB_XCEIV=y

-- 
2.40.1

