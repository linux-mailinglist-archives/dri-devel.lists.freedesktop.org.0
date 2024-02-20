Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DADEB85D22B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:09:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E846110E65A;
	Wed, 21 Feb 2024 08:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="AyJfmFbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2104.outbound.protection.outlook.com [40.107.22.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B0010E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:05:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrAGNU29L8PY9e6LABcdXRJjIBlJIy8s8JcIHuRII208oy4IGA2o7GUWbyJRmJ710fY4Wr3H4rGhL601ebtEEvY9nNfHUFE+l8g542CgFYvo1l6DwqcdW9pildd6JSkCnGfi7vUn1RrQwQhXp7hHoneLhXsV5RswQCmCSFODHKPbarWbOQwBKPNchCKTYYCsbNF07gbI7aOgpsceN0diCEtQnNO1JOIO+1BAzFa0WIM9aDnYPzUoAOzfgZS6nM9HushNFdAXHpiSOxZoNOIRBDxWiR0E8CUUCGtDutdNGkYgQ5JTitFFPgmLA79Z+mt1NzwbQ13b6KgA22dgCWjVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwxTPyHk173LH7OLvpI8Mk3rAWKwhtS83y1hH7zVRz4=;
 b=lwSlzpWzFtpLxisbqdlfB/WyzQhQYrY5WMumS/VFPx+hUTof6O6+IPOm9Pi0YFPFi/Tz01DyRPv12GaBxMSxVk5NrRPXPQHFd8f76rDsuo5HG1+M1rkuNbcz2M8NYg75D2K8XG9vFxrz/ZN3xsbh9hEBFUpk4wKww3ygZr6w+6TwZa1yJrlCY0+dy2TxKRfW+403juumHhHK+EnR/jhn5kGgFSDx6vBDF1sV4ZUBC/vEMCgMYTm32TITFe5Hp19XldmHXOUFLtZ1sZ+pPSOQ+Q+rgvaJThOpRMBSBms1UkD5UizQOuwD/gcOLMAbuqavARHay+EOI5+CwCeoaU/ykw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BwxTPyHk173LH7OLvpI8Mk3rAWKwhtS83y1hH7zVRz4=;
 b=AyJfmFbY13cpzRn7PaSclZh/Ak/ThIcldIw7Fy0Hz2vORdUKR+4PoTO7pS4+QMMYiiyLpOE4FpIohC4YHv5hiZmd1pnqjSHGGOsH0wOb8qOvb0rhWioP0gcSCMGFyNNzWMa7NxrhpJ8DhS/iNjuFQzFaSgN/9HF+oKQlP8sNf4k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PR3PR08MB5577.eurprd08.prod.outlook.com (2603:10a6:102:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:05:57 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Tue, 20 Feb 2024
 14:05:57 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 20 Feb 2024 15:05:49 +0100
Subject: [PATCH v4 5/8] ARM: multi_v7_defconfig: update ONBOARD_USB_HUB
 name
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-onboard_xvf3500-v4-5-dc1617cc5dd4@wolfvision.net>
References: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
In-Reply-To: <20240220-onboard_xvf3500-v4-0-dc1617cc5dd4@wolfvision.net>
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
X-Mailer: b4 0.14-dev-8b532
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708437949; l=852;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=GYIorgCuxQ34b4lu1hFXgE4alR4MOyW2uxp4IG/bCFo=;
 b=whEgHdyBThgyN6VX99Kt1UTaJZOZJbGAvKe5p+Hv9eaE5VyqW2gGRPtLq1Lg7nNtTNKFKABJf
 IXNHAhOpTFmDy1XlKBFEYPueC62C2nK8tji1SAJ/RPraSZdPfPa9WZl
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: VI1PR0102CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::23) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PR3PR08MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ffdc478-c64f-408a-6e98-08dc321d0f1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p/fX7U0utxUuvw3kSDq+j6ODyGHfYN423jA28EBFPZK1cm8QxqajcG1J8u8DxxRYZbWb99BJufhZETfLSaKtpHLwO0f4lAtfzJPUQ7G1QrKW9xJyOUfyXGmGUuV1Prpyc6cpM4yPYBj8kkJoVS4s/afdRgZY+LTLUlOMPskAzOKXhiAFAiJeyJuRYOSbm7M6EiKEYpoX2vHLrIKVtqU+sAOksYOdPZGDwyrFbXdgj8kX4fC6/rY07CEgGm4eKqIhUPUB/6Nc9wimwc/RPzPu9gyiMoclhpxKcTwOoLyMyXyCnwqPR1uvL+NneEbYN1jchu4P8roULwA5T0z9M1I0yrnXgIPQqjcqEbhuAv5tqeMnYoMT4GWtzlroBc+qdyvkNLLH8BJWF73YDYbnRV0c1sCsHB2SAOtqbfHDhIr+RP1xnacx8HMun5NwRvkv3BdQhZOV4o9gqefZMOoq55JFe9GVe1kCtjixoYdahJ6PIPV30POVSiPRheUGc4lFTZlV1iqYUTHwEZa2IP3HfhYykJq6n6buuapLWihuHg/4Dg2ki3viXKacjAw866BeU8Q2q8bYZ3eYyXap0QWTqPSwNg1FaIj3ER43cPp3y0uMI5xd0SfaPs/R0d7Z6YNQG5UCkawtD0r8ruFA8Gdv45UsYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sk1kUWlOS3dQUGVqcGZZUklNWG5BemRlMG1IY1hCbXJ4OWlkUFFYbEMyL25n?=
 =?utf-8?B?MTYwQ0VFNXUwQW8wNkdCYVZnandlL1B5a0pJekw3dUU3dmRXQVc5OVlhSCsv?=
 =?utf-8?B?cnZScEVVdjErWHdkazRBNXNYLzNBdklnU3VZbTFCSWpwdGgwMnlYeDdTVEhk?=
 =?utf-8?B?RVBwa0t2a2JHQzlMWVUzejZLQmZEemFZQXJSSWpGS0RjVURKS08rYkxhK1FO?=
 =?utf-8?B?Qkk1YzJoZ3JmWi9zR1lvaXFORHFiQVZLNkxZbzNGMlJMUnVPQ01nUGl6bXMv?=
 =?utf-8?B?RGlWNVVCZkdJQ3VBOW9VaEw1dkFuaFFaaWVSamcycExwbjVsWk9ad2Npd3JK?=
 =?utf-8?B?bk9xUENucHJTcHVjVW1Oakd1ZHlxRnZGN0QzRGZUMUcyd0pvSXlpOTFERGtl?=
 =?utf-8?B?Mkw5M1dBamVQVGRrTDhVSFM0cUtoNXNMU3FuNDU0L01rUG1NVWptMGh1M1BH?=
 =?utf-8?B?SW55R0x1L1VqRm9kYmxmSHFCeDVHT09XbVYvbWF4UVhiQjVyZGM1b0hOQ3d3?=
 =?utf-8?B?djN3aHYvYUdRaUwyUm9pQmdPYjJEOVdhMlJsVXFxZWk2N0NaWnVYQ3A1T2c4?=
 =?utf-8?B?amtFOUljOWVqWUVNdi9pSys4TVN3UE91ZkJVcDN0VmE2amRyMG1MMUhtZmY5?=
 =?utf-8?B?a3BVNTY1SGtyNG5scUFKTGkyRUJOQWx0cjRrUkUrdkRrTk0vZ0ovVXVmbDlD?=
 =?utf-8?B?M01DNHdVSitQcDJmU1JqT1F0QUdsMXQxYVB4Zkx6ekZDcDc5ckxqVThzZXYr?=
 =?utf-8?B?emZtWXlEQ2pvN1NlZTkzdmpES3FUQmNJd3pzMUJlQTkyTTJ0TnUzYVRNVjNs?=
 =?utf-8?B?Z2NFSW9nY0dlcEZ6TURsZm9zVHpMbjUvL0sxRVMyNmVTd3F5ai96NGxvQzRM?=
 =?utf-8?B?K0hJUUNnV3AybndKNnJkQ2J0eEN3QnFxZTFadW95Z2dRM3p1WEFEU1pKRXpD?=
 =?utf-8?B?ZVdpK3M0WXpkcW55QzdGN0J2V0pES1BJTmtFT0pEZ255cUVOZXFXV0JWYVVC?=
 =?utf-8?B?L0YxbE9HUE90K2FlOEltdFowRGo4UDFZa2FtSytJSnRhM016RlQ5NFR3dkZM?=
 =?utf-8?B?MFpPa3oyR3ZINlU3ZWNPZU9FTVRXQXcxdmEzL1QxeWx0Nkc1cG04OE12bWZS?=
 =?utf-8?B?Nkd2aytXUWZ4MGd2SXBoN2ZHV3VnM1NZejVCelorQUlDb3o2dlpBUllwNlNP?=
 =?utf-8?B?aW4ycmRabkJYTTZiWGJ1bk42MHZEc1E3YmtmZlNRWHdaUHBJNXBPMmZDUy9Q?=
 =?utf-8?B?a0xScVV5RFp6SStZQW9JRlhINGlmOTZYY0F3WHlXUnFNTUJmNW5wUkUwRmpJ?=
 =?utf-8?B?RVRQQzB3clovMjVLaGFjQmNEYzgzampqcmpMUEFaU0NaZWxPUW1OUmlTUXlr?=
 =?utf-8?B?eUR4VERzZ29saE5nNEF0citDNkt1SFNuRVQ1ZERIdWlRRHZBbXpDUmR2UlhP?=
 =?utf-8?B?WXFFbE1HME1SeVZ6cnRqbkFPamRPVll1bCtSYkRkN2xkbXJtd3daUlNYVXJx?=
 =?utf-8?B?ekF0WTl3MXZ5K2loYjFZaUNvSVNKV2dIUXVnaDUzWmlrekRKMDJVVXgxYm4x?=
 =?utf-8?B?dHFCTURueDhGL2FmbFUzeWk3c3NpRVdWcHNHTzROaFowYUZ1RmVqNG1ONXU2?=
 =?utf-8?B?U3YxWEtFOHJ0UHdlQnB3LzJOMjZyZ2tyckxidW5BdHBTZXVVeDB5b3Q2Z1RD?=
 =?utf-8?B?NzhYdmprSG05bDlZY0pBRXhlRnpqa0xwMThOYUJXeGdSTStiM2gzc3QzTnlr?=
 =?utf-8?B?UjZaY1ExSWZWZTgrTFFCdFBVLzdvTGJvOVc2ZnZuV05aYmd0M3NNRTVUSldE?=
 =?utf-8?B?UDlWVmpFN1dhY2xLT21BYldYQ3JGb29VeHFvNkVOWWV4Wjc0VXAvRjNZOVhj?=
 =?utf-8?B?K2hTbXdkOHdBR0QxcmhPL1VmY2J3SCtjK0oyTHkrQ0xVVnhLN2tJOEpFdkxS?=
 =?utf-8?B?aHNGWWRBSkpSa01wQzhad3Nrc3A4bXl4R3NtQi9TNmhSMjl0d3hDdnhqY3E0?=
 =?utf-8?B?VStSeHlpZUh4cnhxdzYxMmxhTjdza2VCTHJxdWIyd3hIdnpoNUxmQ0FiODJP?=
 =?utf-8?B?a09pUWJhR1gwcGdEOVVScmt1NXlmRkJzUncvOHRGUFlKbVlCNTlLZVRaTG9i?=
 =?utf-8?B?SFVxeTJESlBncmpxZldPd2pqY2srSGZaWWxoeDMwOXNVa1hJYWJWZXVpWG9a?=
 =?utf-8?Q?azeRbK0efHYTlokJnUjUM8k=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffdc478-c64f-408a-6e98-08dc321d0f1a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:05:56.9627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BCt78nBEgENORgGUrWvksREyR3lz3v2icYnJ+AiCrx4wbUsFtIz7zHDD9o74ltxptzgF7sAwxlIpd7X6cemLsHWOp/5iAXWWyIdfeq2SWmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5577
X-Mailman-Approved-At: Wed, 21 Feb 2024 08:08:40 +0000
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

