Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF4C86C396
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BED10E116;
	Thu, 29 Feb 2024 08:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="U4731ceG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2110.outbound.protection.outlook.com [40.107.22.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BAE10E1F4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:35:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xp4ys2S7Ad91l6aSG049K6np9zFxeEzM3y4d/kPyy6DPE3E9NJeUdnkC5ZeEpVSZ1cdBJwKi3zlILT6uVVuT2TaEFmkiuOkkkHhmQuyWpd9h9YHfWqx0qq6riIQTlQyfE7qu1YgpV8s/G7lxQiByWv/rZyGnF/6eQZmlKIUqrpQh9hKIj84hKgycAo5EPrvJS+od3VG6vh+oXIh1fBOPkk5aDat/scf2sCbKArkp7z/tut+YQpGVqEI+E0DKX7QmSEN+6VsVAaQGpQ1dqn6xAExcaObiBQpbjreL2NTpZ5/66TA73LSvpJh0Ul1wOT7ahThdqgqHATd6Hs1Cyn7V0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwxTPyHk173LH7OLvpI8Mk3rAWKwhtS83y1hH7zVRz4=;
 b=aSuq5WxUKuoogfXpS7Xz8CUe45Jp82PigEm3w/dR4ysjZAo4bh+WblvpGA8zv95OjbAnpDcw9nYMBPbPUsLKPqty41dzM+zA2daQ0sQ4RyqfIep7nEPbxjAoU0Z0iIrpN4Qo4T285krgGU7Egj4txEgzb1iq36Vwee0BcUqO1TKMsP/yOQHZ1Uz0MvsshxzR0Z7o7oEMn4Fgjw/CjiWPe52oEq3fYV64uksXVwnywsqEyAjDGNIZfzquuY5gvVTZRPGoir8ZOpSRLnqCVkTjE36T9x8Qd7NNvmzA3wN3Xy35AJjuh4SsnBG0/Gs9nRF+rHqsNQglwyYXCaKHbW9U+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwxTPyHk173LH7OLvpI8Mk3rAWKwhtS83y1hH7zVRz4=;
 b=U4731ceG3/ZrLrOnMDIBtovq9aKVE3ZzXKtQs39m9bA+X5DXtIqh+Hdl8WOYjihMyj7ApF6Cup9JGt++VFoqU4Nv/xf2x1l0Ma1DwLxbK1POrxJnOIhSkupjvZO1hAg147Flrztn/k+Hj++PmEN+3gogs5HrrXlQN5JFVAVQY84=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DU0PR08MB9727.eurprd08.prod.outlook.com (2603:10a6:10:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 08:35:00 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 08:35:00 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Thu, 29 Feb 2024 09:34:49 +0100
Subject: [PATCH v6 6/9] ARM: multi_v7_defconfig: update ONBOARD_USB_HUB to
 ONBOAD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-onboard_xvf3500-v6-6-a0aff2947040@wolfvision.net>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
In-Reply-To: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709195691; l=852;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=GYIorgCuxQ34b4lu1hFXgE4alR4MOyW2uxp4IG/bCFo=;
 b=gZbczGL3U/gwunqCnXvBXPrBTgAYMDRX09PR7beYv7MA1hMksPcl/THmanBCv5Nbkw4TeAlAN
 vb2Rm6dfAqWB0kqJbOUzhDCx2ckai+NeaX4pwDp0F0iFE2eGL7X+Hhj
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DU0PR08MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f940327-9cf2-4327-0287-08dc3901512f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MjWgJ6f2ZryRDvUj3MU2bkA4+W4wr0sgLxfvIf0htTEXYRB4Q5j8AEnrrtR7vXB+DvzalmdkMPIQMiC4jjA9FA2d/EA+/CPkZk8S3ouTTNjBiomTiB4wI2opvw9EXsO057vTNJ9TGPz7U/y2Cep7rYwwqXZsQrdSXwg1zsLG3VPEUQvisairskvuKNK5NPcArFQmpWdrFNPi+UO3z5zwHBUmJAzqT0HeLjI1fAWKbybzLdNQdmx/uAeFbbECk+Eh/F/qQELVKo5PSaZnSSYYQ6sgFfHLvK4gBrPOUF6ImYSC9oFbml/xNnnnL2tRGNRRdOVVuyGNNDpSgD5oypismP3G9oBJKoE1i1MBQAjozRnImbNPvQa2ARIR+QpHpTBfd0yAQ44SMfYi55KOereeWdlEPaDArOqZg6tG4lGeTC/mXNbc0W0YLKHx2NjqpiiS+2KC52HwQqNRvBdvYxGX+hnTP+dEq5iZM2NKbWHq5jYI6r6KryIX3QZCAPV4hp6FRT1nqJY+SHbxGJe4GdFZbdXkdxLpqs1pIOgxr01yQv1dSnOkdqP+5A1nbFPJ62CxGcMmVwvV4xDKAHooVTvvtl304KFGtRwTsvXBVIOUAaWWuU1PXXwMLlImXCT/rfi0vZHk0f3/k0k8AMlE5k4p6wKc93f4TyL2mvoZdh1HurwzzhHJQXC1Xqfn6UQL/KHhQC/IAB3Df7QhSnfQ67+fNTH4mt3oFSMFdLYOLGDdpS4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTN6MHRDOFYzRHNHSTZNcUxnalRMYXdkR3hBVHh0bHFxZkxCTXVDaGdlR1Nm?=
 =?utf-8?B?NU9aV3NNb21tZFpmbzR5R1BmLzFyZnlqUzdPaEdlQlR4WnpvTmU1Wnp1Yjky?=
 =?utf-8?B?MVc1a2ErNW5mejVmQmtwWGNhTm5iN0VSWVp0UFBaMVQ2cWVRcFVhTG80cjEy?=
 =?utf-8?B?TzZGeUFWcHpjVXBQV3dxM2lVZ1dsaG56MXFXWk1Bam13THR1NjJiSHpaWHc2?=
 =?utf-8?B?c3A2VmQ5d1dELzIrZ3hVQVdsUGIxeU1UeFV1WHhrM2p2WHpzdFJwY3M2VklJ?=
 =?utf-8?B?aUQxYk9wd3N0TDdTaUhYcmJ4azdZRW1MVnErTUx2dmNwQ1pmQWlnWFY5OCtE?=
 =?utf-8?B?ZlAvVDVFOTRpWVNRYkVKQThpOU1jbXdsTDFYU2NkYnVvTWxKZmxWVGczOG4x?=
 =?utf-8?B?T3pBYVlrZmJGREdyMytzQVpIK3ZVTitrcUVBeDc5dDRqL3J0SHNkbHkvRFhr?=
 =?utf-8?B?Q1N6TU45MUh3ZnJuclNDaTY1MjBscm1FSlBwY3owL01ybjV5VTRtSVM3OXlT?=
 =?utf-8?B?a3lZeVE1ZFUyeDFvRC9GSXkwajkvaEpGYkRjRFJRWmtGRDZ5KzNZM05JdEZH?=
 =?utf-8?B?MzdaWE1ZYk1sSk1EdWFKcm5FNVZOeEVHUHAyZWpCY3VTdzZ5b3NKSUJIbmRO?=
 =?utf-8?B?aXZnODRzRUpWOVdodzkwbzZGdjh5aXp4VE12MWFtOU04TlB4dnBpenUyOU1k?=
 =?utf-8?B?VnJzUy9DZW1XbmROOXl4ZVRXd0RQS1BvcGloOW52ek5PZ2dFMHg0eDdWOWkr?=
 =?utf-8?B?Q0tMSUVzVGRxZXJIVDQ3eFlVOHJ3K2ZNZWsvVnR0UWNLRVk0aml2bnJKY3V3?=
 =?utf-8?B?NDU0Q2lCWk11ZW9DM0NneGVZeWlaUDltTDJLOGxMMWIwcEYvL2tkWGxZaHdO?=
 =?utf-8?B?MWZtSGZ2akNzUnRDazB0ZDFPTXl4aWQwcFlYN0w2LzRkODJaZzY2dUhUbk05?=
 =?utf-8?B?dHNteE1wemh4NzFNU2RrY3A4aFRnK1J5Vnp0SDhKTXBlZ0ZsQVQ3RUkvYWVp?=
 =?utf-8?B?dWZVeHZocm5Fc0drRDk3OHdFOGdkVUYvZHlEVkVtc0lNa2NmL2hNZTZCc3k2?=
 =?utf-8?B?d2JXVzFqRnR6eXdDRWxoY25pdTBlWitHZkJ2c2l5eWhoT1ltMmNrNVZ5U0Nq?=
 =?utf-8?B?UXlCVHNwdVVoa08yUkQxTGdpV0FYSmg3aXd0Q1QxcEdjMkNaaDlpTUMwclEv?=
 =?utf-8?B?WGNtQXYwdjYrUmVNdzlYdSswQzdRcFZxakE4dGRvd0liNmRQYndEa3RpSWRn?=
 =?utf-8?B?b1BpcW5TRThJQ0d1VGZ6YkpxVFBXNlZsNzRWKzZQc0JESjk5cHhScnhkRWFJ?=
 =?utf-8?B?ZnE2TkF5alYzeWVVbVpwSEFyczU2UlJDTWxlRCtRK3cwRUVFUUlkVUZzZzcz?=
 =?utf-8?B?cmEwZHhKWEFiRmplbU04WHlPNVdtdUxRL20rSFVyYm9PVzFrQzQ5VUV4OWhX?=
 =?utf-8?B?eE5YeDVPMWNtNjJvTzlwRlNZTkV1ZEJDemxCMlJlY1lzZ3htc2RUYmhoUUN0?=
 =?utf-8?B?U0tESUU5V0l1QjZLY0thSFlFaXFmZ1lYSXN2NGRYVXBid0M0TXRRQzdiWTN3?=
 =?utf-8?B?aEN2cW9uQXdvdUhrUnFXY2I0eDRURVZlNFVKMUtBb3JBRStYUm90c0tvQjFt?=
 =?utf-8?B?L3paZFU5cnpRdEVtQlJWcWttekx6SVVSVUNvVGJ6UUNsd085U2dEYmhJNnQ0?=
 =?utf-8?B?eVkzNUJvSGE0UldTMTc5TE80SnF5bUhtWm5sMkdrZlRrK0ozckhjTXR2ZG0v?=
 =?utf-8?B?aXVLT28xYnNJd1dUSVRBd0hYVk82L2dkbjc2dlNPZ3lPeGo0Q1k0M3UrYVk0?=
 =?utf-8?B?Q0t2aW1DK3pCK2Y1djJaSWJZUXdxQzRDenhlRERoVmU1OGhyUmRXVDZpdkpo?=
 =?utf-8?B?SEJva1dCSlZlMVNNYXF1cE1rdit1NEtVRVdXa3dJTVF4c0JLTlE2ZTNUTTlr?=
 =?utf-8?B?aHFFVHAwMWthcU1vMDRuTGNXYlVDWkZSR21sbE14bnJSOUxra2hXTDZiTjhW?=
 =?utf-8?B?UDdyKzA3WFVNaGgyM1hLcExmd2gwVFBpSmNqM3R1WVZSTjZ4MkNRTVBoaXor?=
 =?utf-8?B?RHJ0YVdmTjFSaG9GRjBPVWFFV09tWjZiUVdHTExTZ2FiTTArV2lKRjBPc1Za?=
 =?utf-8?B?MUNqVHdiakdDOG56emh0SFlpWmJ6MFR6ZzgvUFgxcEkzR3JVcUFURm1DNDJ3?=
 =?utf-8?Q?1szpWtFxC+oYwIJnmtEoBHc=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f940327-9cf2-4327-0287-08dc3901512f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 08:35:00.0842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUdVHkVoZF+mE/wF/qO4N4LRGTMnMuXari/KVPnpOktnInrcUs524OOQHDziXz98tnC0hfKOFOr4XUCE3uXUssONGVgG4mMI5vhGTJLyOj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9727
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

