Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581B87157B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 06:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B672112855;
	Tue,  5 Mar 2024 05:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="J1UAy32X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2103.outbound.protection.outlook.com [40.107.247.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2F611284F
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 05:55:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZN0b+4R04apOwElQScN192xqZwU0psM3eyM+Iau9dAPlAxi17ymoynHcD5YVdJkGwr5v8CSkAYNSdWTipog1pvvoYtMt19LsmTvlb5/TE9uAsqDXxGWqd18E383HvVwwHQAaFrY8fiWzWEUseTNq7drrQIon1/mV5+R64RCR9g+vG6153w7HUZPmvZeeWpKZ+E14cKKADsC6+ezLD7c/EHt6d+tPl25OjC01UyMX20pPu0F7Aqfr6YmRmkxhzAKsgmegDD147/u6An/B3re2Y15bxSJOi+NCrfPXOkZLQRXHqqqZkSIMa64poxFMJ/s2cv92vkk7sx4u2a7TedRlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnznfALKNm8NKge9AbvjBDSpkuRc5Zh/lpHyFzoaKZw=;
 b=QTB/JJXen+tINKYQOs8tJiZhlVpOzzCUqpZyecPMHkUl0Ybwq87B+QrwaLxt+598Y4IJxdhW4g0/GHfJS1hr4X0h+bHwOKFLY5h3BUMDaOk42UGuQX+3s8A58b1pP/1+TlSitq3rvLeFHBWtNpq0TyDjbWs2Jvl8ztqOhti42a73y2HppMjbzOBH69I/v4ntYiXIBo26IBWbPmDxm6TCEF2mk7OgiAS++z2fpxqNWckimnErVn3DH33Cz2E9AEtj2JIV2J+2KEwcqBe8qAYmoe/FMMCPsxLvtk+B/5WNB18CF8GN7EvTml4iOv27TLqVJwv41Zeph7H65tk4mPiM/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnznfALKNm8NKge9AbvjBDSpkuRc5Zh/lpHyFzoaKZw=;
 b=J1UAy32XqVduD+GuijQVUrnsmlYdXOhfRzgCWCiZ/TxkCOtTmDbgKV4GZnnx9BERXcuxVP7DvYPktC2nHixg1DmsEj1TuxI3PpNEgsLp+A3vrqhHd8PBSeZUe9tmFv9ts0qfdSV8iltY7xrm8d8OHE9KLh+Yel4t1vN529Wn1vM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 05:55:16 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 05:55:16 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 05 Mar 2024 06:55:05 +0100
Subject: [PATCH v7 5/9] arm64: defconfig: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-onboard_xvf3500-v7-5-ad3fb50e593b@wolfvision.net>
References: <20240305-onboard_xvf3500-v7-0-ad3fb50e593b@wolfvision.net>
In-Reply-To: <20240305-onboard_xvf3500-v7-0-ad3fb50e593b@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709618108; l=843;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=r21yUYwV8jx8UcRI3ydIC4Hjq7kpknUfqPyczBg6Q2Y=;
 b=p1CZQ3jtBpb3u4DiMvOxtP7YnER9nNvph5d6NqEfzN/frD8yEGVnpdAIZBGIlLFKPcg/71lRE
 +VpfeR2j+vWASUffZcwr2zCQswJjXg7bEVlwjS+o6S4hkFS8YCSPUN0
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DB9PR08MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e6f86e-f674-42d2-85c4-08dc3cd8d4b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UaN/vafiEV4I2346GNr9qFcgRUEs78AHhXLbfnZAdGVt2h+vvk4Whvq/xYia/PvolYpSc2iOgqatuRyAMnmyRQLEQXE66baaxTUb4ee0Nzd0I/T9cpjD23Jq2GzVoDh11KkDg3cZxV3VuiYDcF1FFmh/xW8Zh0ZYdTOVRDGje4rQjalYNt1tk83AQisxHQ1XCjN8YtANhReJBJbQSoq2ih55iEg9Ub+/ghcSdvjvujyk/SmWVLsUuDOhkaciSOvJEGD0v+lzvGd+5X5Ry6vmrJdQdcAnfICsz6bldxyBeUKta/wryfy5JO7M3mvqhI1CYO4GcccSJjWPvceS//cUbXXif8uGW1EhRa0HIJ1BliwaMqxfHNeSGGCnC8vej7ceFWLQGc1ukRG3q2gtxy562CUMRpgaCrDoTHayVzkYcvR9Z8kmitv0FL7q3A4PTfAwdx7w+T9Cz1sPjmjBazKEeNNTmHy0c+ZZ+eUFjbPNVLawkWn8u/60W/1Y6/FTMzj0wXD4sWSCV5xNbEc1y7EuJaBM8jdo9GHZ2KQ3oqBy7nGTVzSxpeSzPY1oDk03TP2N4cHD/TzWjspzZa66AbmVGzK9SVarrj9jCEsKRBLRStdTS4LGikKMGZJ8LMgMMLYcNUvMdQm7nXeFMqShOmfmF+i13wFEIMIJjbz2FN2scdx/1QvYfZKIngd2zfyucvf0yGsfZAFH4BK9HFbl3izLjWb3ejld0HaLakfl52PYSIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38350700005)(921011); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emI3bHFXc3dPTWlrbE5tYndEbEtYU0JwZ1V1SWVkajZCQ2s4d1F1RWRwZWdG?=
 =?utf-8?B?ZnNNVWpidXU0dDZsSWx4TU0xUG1KQW1ZN245S1MyL2JrZlVQbTIyMUJYVVIy?=
 =?utf-8?B?dDJRZG1aVGxMdy9SL2FYV0NZV3VmNWl6OXBNa0pjMXE3TlJRYkFkQVMwUVBn?=
 =?utf-8?B?dm16R3JKYnNVVktTUnRKWnpWN0kvUm1IWjQyeVR0bFVITlBLZUlFb2RacG0x?=
 =?utf-8?B?NXgrQW5KN0xlUU5Kd1FxUEJucFUweU9sVGVyanZCK3NqeGFSMUpINXRFTUJX?=
 =?utf-8?B?TTYwZVh3ZnVHelk5RGdRTDlwZFZwMmM5S0FDa3A4VmxkT2tDbDhMRWFTOHh1?=
 =?utf-8?B?OWMzNGJmbTY0L3hDWXJaVUd5dFBZeS9yQ2ZFV3o1bFplV1E2VTVTNDE5WUcx?=
 =?utf-8?B?UHhzcldZaFhtWE5JcTErOCtQRG1PcGkvKzlEVUx0c3pvZ3M5ekdqVW9XS0lt?=
 =?utf-8?B?Y0Jvb1Ewcy9MOWsxVFI0azN3dVFkdFJoR1d5ay8vQk5vdEVNeUlMcWJlbFo1?=
 =?utf-8?B?TFFhQXA2WWlzOUhlV1NnTVprRlYxR1FzZ0JVK1FSSmxBM0RueVRsb0h1TjhC?=
 =?utf-8?B?OXNSRVZ1eElvakM0ZUFlMVJQS2FSQ3RwNFRMMnRwMzYrN0tYZGthQ2pvajU1?=
 =?utf-8?B?YnQveW4zRmxRMXlWM0xWK2FGQkJsaWJxMDY1VzhqUUI4bWpzKzkwQ0xuUkFB?=
 =?utf-8?B?YVptVUExOVZHemliNXdDbE1vS2NJTEdQOEFFQk5vdVpXVG9zVkwwUW9zbXZ2?=
 =?utf-8?B?U29QQk82dFVrVW5OYUxJQmhyRjRFNGsraW9VOURYZ2hSYmpza0ordlI1ZkEr?=
 =?utf-8?B?b2NMcW1pbVNIRkFUV09DN2FhVWRkUHdmVWVvaTFCOXBQK2x6d2RXS1IyK2Mz?=
 =?utf-8?B?ODBsN0Z5OFpGN1Z3bkJTZVVISUJueDR0aVdobmdBcDl2cS91TUtFV3R4UWhi?=
 =?utf-8?B?cUlxaDdqcTgzMXZ4SnVuY3R4cGlqYXZKS0hieTYwcUNDdnhrN0pOdm1WRDFQ?=
 =?utf-8?B?eWdGaTI0YmpmYWpqM3Z6d2JlWmRWZmEwSVhyemtGWFRYa3BDUy83cFRyekIr?=
 =?utf-8?B?dmRwS0pzUXJJNlZ4ekE1L1ppM204QXpyTTl6a1hwOFJ5WGdXQ08wZ0RUMDcz?=
 =?utf-8?B?ajJEWmJuaEZydHBna1ViS3dGRm1tMzdwVmZuOXp1QmtPOEM0ZE1FcWp2U3dr?=
 =?utf-8?B?THozM1BYOGRuQmFHZjFUb3E2amFYUmttUFFNUzVRQXBMRUVVVmoxMUtoOHRy?=
 =?utf-8?B?OGxpeEk1dXRwUGhvV25JY09Na2kyQzVDS1pSTHVQNWwzcHdXTzgwNjJoS3I5?=
 =?utf-8?B?Y2x3L2IzbHMwYXFtNDZoSkNBdGtIcEhoQS9hczUrSTdmVVpob0JPN1FqSTBY?=
 =?utf-8?B?Zm9Jb0JNTjBQb3lQUzJhQThpQWlsQkJJZjdLSjl1WTdDOExIOEtMZWF0RTFR?=
 =?utf-8?B?S012Umc3NVB1NkswVXFlZ05palkxNEpvTGpjbE5DTkpqSFJ5KzhSNDJCeW04?=
 =?utf-8?B?Q2xDUnI3eGdja1ZFOXpmalZURVZVdnJGRDkxRkQxamFHeGZtc2lQTm9lb0pQ?=
 =?utf-8?B?bmEzZlZOclorbnB1MEdnOHdVRjNib1p5V3lXS2lodUx1eWZoREs3MXJqdFBv?=
 =?utf-8?B?aGphWHdVYllpd05qSFVNY2xybUh1RTZZZkp2eXZLRE0zQzIyNUFKVWhka3dS?=
 =?utf-8?B?TGRTc0RKVGx0UVV0cEhrZ0JwUnlaVTUweGR5SzlqeUVpSU14T3ZqTmJLcGJK?=
 =?utf-8?B?czFTbTc4VFhWanFwbjUwNUVUSzdJdTBvcTNMcmJSQmNrOU5Gblk4ZE5JVUY0?=
 =?utf-8?B?WkZyRUNJZ29zejVYWjJOK0ZWNXREWTRCTS9Fa21PWkRndDVVb1JLdXlkMFRa?=
 =?utf-8?B?M3llcVdBTnh2ZWlSc0VURWU1Z2kyUUQ0cEpQTTg5Tnp0cU9DbTdobDdTRnUr?=
 =?utf-8?B?S3A3NDE2ZGNnZlRMS3pOOTFNdHF6b3NYZ25FMjBaRWVOdEJ0ckFib1ZnSGJz?=
 =?utf-8?B?dFE3WHpwL0orOS9OUHVKNTBsOENDeFdiaTB2QVF1MEhmaDBCbWQwN2gzYzcr?=
 =?utf-8?B?N0VZRHNJcFczRVVqeFBJajdkVCtVQzNncFB2enJBblpobTRsUlZSTTFHL0xt?=
 =?utf-8?B?SDNBYUNsZzBvblVvUHczeEJFNGlzTkVvL0MwdzRsRFBwUVlYM0w0UW9OMk83?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e6f86e-f674-42d2-85c4-08dc3cd8d4b9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 05:55:16.0365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KRJZqW7AVoV505V5H392mweMNk6JEwd9Hbzkcf4nX+id7W1jY2Yyii+Sem7bY6plpcekOtPPqvbI1qk332CuCzmiw7d1/taAvu37qry+I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8385
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
which has led to some renaming.

Update to the new name (ONBOARD_USB_DEV) accordingly.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e6cf3e5d63c3..3c6196b6c984 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1047,7 +1047,7 @@ CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_QCOM_EUD=m
 CONFIG_USB_HSIC_USB3503=y
-CONFIG_USB_ONBOARD_HUB=m
+CONFIG_USB_ONBOARD_DEV=m
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m

-- 
2.40.1

