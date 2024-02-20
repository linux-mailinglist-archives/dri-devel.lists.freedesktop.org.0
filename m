Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B292785D229
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:09:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94BF10E64D;
	Wed, 21 Feb 2024 08:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="H3GGYXZz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2107.outbound.protection.outlook.com [40.107.22.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8198C10E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwJUXqCJwGArrQkJvswf2zJM4ddHct6L2mmu1f10CcVak7yK7jtTUXx9b7DTY7rmJEvNFFv/XQQjL6FAOokwyZdb9AH11YIS6DoO2VKdGq6qUjvOemruBzx7aJnNzn+4gGSkNaYDaaQKN6nnP0SC3w8kocyKiolgt4sKTWoCybYYUUqjQkgzz/MhCTyiwuOyK1MiPd75Y73CoPJWG0gSvLyT5MNWyF61cxu4LQGV9YEm1QAei2ovMHgBSOhM1E2OrMpnyYEQGL2egnJFpdSy2qcSs3paJrOVVsSCY+OOzn1wFuEMWJrV16RHYTqGIna3zSAuzScCDBjGKh/ubEz8Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2fcPywiN44+BPGaXpHzkDdxp4Z9BT1tDuUyT0+2Jyk=;
 b=P8nGd9qh3dYgCDu/SkIL44S+I3F0q/su367bWgfiTh8MYF+69JL3gj2Qgyg4+YA6fZ2Aroj7WY6aeZ/Q5FhX7qQmI9hAUpxpp0bgHLm7P9hwKwY4fG5hX6UOj7zkPucwK3Y6IHC0geVQAHiBq/uGBV0y6yujeKH5odsyVchLPaCka5Q90YYeI1Xd8QMKWb74vEhfQRjQTLvUBJ81oIN7kyw3P0g/zy8L74C/DW+sCPtz5O6nK94EQg+DcY6x6rxjouPnnx9x2Q9jY5dhPqXLzktTwkdQxzcIYuEYUA6/OiM6JRRforpZ4532XV4nl9VnRGti5pakn+ydCdQcUylbnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2fcPywiN44+BPGaXpHzkDdxp4Z9BT1tDuUyT0+2Jyk=;
 b=H3GGYXZzseuvxrdMKPk8hGbccRhFm8naRft0PJb9PUIPHvM5d9t8mUP4KiEC4fADTy27iNgJNPzh0Pblk7skwr+qvnwxHjEqt5Oae6affgt/vFEAHkwMGbT3eIenFJBku7FBjD1eorE7JTTTA0udjG56YScsCDZFgQ67WU8ZhaQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PR3PR08MB5577.eurprd08.prod.outlook.com (2603:10a6:102:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:05:54 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Tue, 20 Feb 2024
 14:05:54 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 20 Feb 2024 15:05:47 +0100
Subject: [PATCH v4 3/8] drm: ci: arm64.config: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-onboard_xvf3500-v4-3-dc1617cc5dd4@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708437949; l=1001;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=6Ht5ynmIJIX21g9C4JpOADohFLbwFWj8jYgr/isAV+M=;
 b=OmCZA6Ger2HI0w5q9rl900pKLlvS239auOHjR8NKqYOb987A1wOyH2RsZqohFP0HPFOeyGytu
 5pxnWf0zZGPDNGAuen/VkAoPmL5j1tkD8lnurS+uKollQqWEYOx5zvZ
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: VI1PR0102CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::23) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PR3PR08MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: 11233766-96cf-45a3-9243-08dc321d0dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hA08wHFYwKSPZCnFjBXVzsqh6Ng0ULxWm/WAFNg3kxYgtT/2wRl8vWN3GnB7ytU2nLA0KqFzH19pvnbyBuxucMliQPgmjsCUNZ/k9NdPh/OJrtFJxx16SmB+XIBRsaMdgIUoruBX1GmoWmenXng8QEhzSX4IjmH43P8C9h7aXDtOIEck/rw3T/7Y3YD/E0N62+6ukP1MiIfaPWcb/rGw7tJxnwQkOhOIE5flGAoLK4jt4KQB5/4JyOYxMaA70OjFfTKjIAb4TySLDCKyzqMvTXqApx831E3+t5CLp4BR9ojPrsB9rCcoS1wIN48CchUnlYz0rDalTkoMpdfgSgB/dyK4Z7eyU/SpTWl8OZSoTUHrEwTpVjaPPLoPFecdjdnqXBwPlLaMNF8jLLG8Z6BQd12r8mvRdl46eBD+NBAZ964UO4paPoFoZc1BVt1cgeJ503gHm6bobi7G2tNb+ux1yUh2gYAFzYCrXczZAVTQ3T6JIawCrnNxbaMFr6LAObmT7cN448xkeiIMytlD1NWaZKEHoGP4Tk+MCqb6lLl3zJ3TrUI83JWqUvV08vBaJZUUjfpMWVj7eom/0E07efEE+p+WzKHka+OfHu/jliZ6VO3R2wqL/sUoQ+hhSmkvitkdLwTkZkWePs2sFQifs8kZcg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWhJT0xWTVkzUEo4MldwRkFMRnA1bmNCRWdUTTRRUkpDcWZPU0IzWHRDdURT?=
 =?utf-8?B?a1Y4S0pSanFFR1JiaVFVc1QyWnl1VTBCN3JpN2Ird3c3Qkh4eHlGcVl6YVpL?=
 =?utf-8?B?WnYySlVQS0t2ME9MVmN3Y2Vzdm1LdGRtWnRXdWxaNUUvQ05FNThlaUVURm9G?=
 =?utf-8?B?ZEQrKzhVU0ZNTTBObUVKbzZ1bTN2eXM2d0E1dElzaHlUbUlhR2dJeEhJSmU2?=
 =?utf-8?B?T3BDcTlFTFFscnRJZVNGSjRzMG9jL1VNTnkrbjVBNU9EaVg3MGF3bG1NdzUy?=
 =?utf-8?B?YmJRb0I2RUVFVEJMelBwWVZHbUw3QklUQUlVdEEzTjE1eGtUY1dnLzUrY2Vv?=
 =?utf-8?B?U2FxRHJWeXZoeFVpdjFpTVFBUllBc2dvbTJmUkpEb1hLVTFhRkwwVjhtTDR2?=
 =?utf-8?B?a3hSSTNSRi8yMEMzODZNeksrQnNlWWgwUDdFaXFxVllGVzZTSlRJcjhQTFdn?=
 =?utf-8?B?ZGR5RGw0QTZVcUxEVkNWb1drUi94UnZpVWZOekJYMmtLUU4zVW9yWkcxekRY?=
 =?utf-8?B?NDY4OXdWTXhQUTcxemxlWU8yWlduVXhqZ2FGUlNTbHArTi9FdHBwamVzT2JH?=
 =?utf-8?B?UHZlUVdJSS9hT05LQjFSZTFSQlNPa1dLYUdvOHhXbExGOEhqY0ZTNnpMNUd3?=
 =?utf-8?B?eFhTZzNUMi9vSlZCZGo3aURQQjJyek9iYnIwa212czlrdDFQcEdsd0FaRi9Q?=
 =?utf-8?B?Y054dDFCd25jSDRwUXRDK2I5QUJEcllOcWhPNURTbGgzRnczenZ2VnNpTENP?=
 =?utf-8?B?R3VaVVZXOENkaTZKallkcXVkMkV2azR1SHp4U3JFTkhTektZa252T29XTTV1?=
 =?utf-8?B?QW5OSWJVeEUvKzJML241L0tiTTBuZFJxNWczL3VsbHhKR0VGRFpYSzRBZ3Y5?=
 =?utf-8?B?NVpjVnpvVFRvekxiNU0yYWhZQ2g1T0hSakNmVFh3am04Znk3ZWVXQkdrdEFX?=
 =?utf-8?B?SXZ4N2pzOTVYNDdxWXVHUHhMMDJrY0crOGY1WXFMOThVckFDOU04dHZ0RnN3?=
 =?utf-8?B?S3huTXNpcFRDRHFDR1JpVm8wQVJlUTErVFI4emJROHVrbU9JWFZGaUdlZTNi?=
 =?utf-8?B?dGpVRXRIbHpoWTFkS2w0SnZKSDNtNTVueDlsdjJLTFcrSG9FQ1Jia3N5TER4?=
 =?utf-8?B?RUkwUllrbmdEaXVTREdoMnNXTmV1MnlEWHZmZDNhWWorOHVtY29zeENVRDli?=
 =?utf-8?B?WXVZZWFCVGhNd3VaNWJ3T052VzdBNFRCN0pJU05BbFcxMlF2T212QjV0RG9w?=
 =?utf-8?B?WHdjNGZXMW9GcG5wSFQ0ckRNUUFtSnVFWnlUZi9Pdk9kRGNsQzZoOVhjVHZx?=
 =?utf-8?B?WHZBNWpyNk82VTcvaWRueDZTNVAzRlRMOEg2VjdVWHlQTXhFcDBYZzN1OTRG?=
 =?utf-8?B?Y3QrRVpiNHZaYXRIQXgxaW4rTVRCc2xoOHhhZHcySE9tQ3VyMDhIcTI1MTdV?=
 =?utf-8?B?MFl5SGRTWHdhQ3NsazdHbW9YNmM5aEFvMmthS0FjeXRKUDFyZGI2djVxZlVN?=
 =?utf-8?B?MXFLSytXcVo2WlZHdllWUk5zLzREejJPVnUvZHpzYVd3WU9SVmR4NzJyT2dr?=
 =?utf-8?B?QzRlU21sUnZwRE80VHpJZmJxMytzQ2tyMnltbGNGU1dCSlZxUk1TWmI4bzdw?=
 =?utf-8?B?N05GcUhPdExUWVZ0bjU1aWxXR3BNeXlIV0Y0T3BHd3M1VWFVYmN1K2tPaUww?=
 =?utf-8?B?RWhzZGpwNEZNd0hXaHozVlNUWmRaLytKZW5BM0dFdHlUdWFseXNHZjJXN2Q0?=
 =?utf-8?B?bXZtQkNZbHMwY0JGd1hPZFAxNS81OXBXRHVrbC8raUxudFFJNjlWVkxHU1pR?=
 =?utf-8?B?MTQwUE9mZmNkVGFCN2pSYzVtSythM3dlZjdnYWpEL2QrZVBNb3pEdlNab0x6?=
 =?utf-8?B?RHorcUFxc0xsVitkM2t5c2FvRVkycy9ieUVrRHg4WHNDTmhNNEVTVGVjZFBn?=
 =?utf-8?B?MDBLVnB0L0ZPV3IwKzJNSDR4Ykh3d2hZQlRsQzFUWGkzQmZxeHNDcXJkZ1pi?=
 =?utf-8?B?aHg3N2lwNzNIZDQvenczRlRkK01PbTNiaWtnUXZtQVNZWHlxakRHczROWUJR?=
 =?utf-8?B?cnVLZEQ1cXVxdmhSTVRwU1hHVFZQejdFN0orMU5Cc1NEWStld042N3pBRGxH?=
 =?utf-8?B?TUM3d0xyQlBLMHl6N0Rsa2xaY0VsOTl4bG5wWE1vRTk1d3N0Rlh2V242SkV2?=
 =?utf-8?Q?WCvmn+fJwnbO+GdYSSHyPXI=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 11233766-96cf-45a3-9243-08dc321d0dae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:05:54.5740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q2lvR1SCb8FXle4F4kG1PcWNZWw4pEdSRO0TE4mlz/GnxXb/Ks3NRjDPUObx+ByG5AvL9oKE1Bt5oEYzTfcNzp/bADHo+v8WRMy3dubQdVk=
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
which has led to some renaming.

Update to the new name (ONBOARD_USB_DEV) accordingly.

Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 drivers/gpu/drm/ci/arm64.config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 8dbce9919a57..4140303d6260 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -87,7 +87,7 @@ CONFIG_DRM_PARADE_PS8640=y
 CONFIG_DRM_LONTIUM_LT9611UXC=y
 CONFIG_PHY_QCOM_USB_HS=y
 CONFIG_QCOM_GPI_DMA=y
-CONFIG_USB_ONBOARD_HUB=y
+CONFIG_USB_ONBOARD_DEV=y
 CONFIG_NVMEM_QCOM_QFPROM=y
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 
@@ -97,7 +97,7 @@ CONFIG_USB_RTL8152=y
 # db820c ethernet
 CONFIG_ATL1C=y
 # Chromebooks ethernet
-CONFIG_USB_ONBOARD_HUB=y
+CONFIG_USB_ONBOARD_DEV=y
 # 888 HDK ethernet
 CONFIG_USB_LAN78XX=y
 

-- 
2.40.1

