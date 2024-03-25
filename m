Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1361F889771
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 10:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6691310E6BF;
	Mon, 25 Mar 2024 09:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="l0vVZkMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2139.outbound.protection.outlook.com [40.107.7.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4376110E684
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 09:15:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mh5Dc+u6PImoevrJTPSEfvOIalgFWsTXz0eVpU/OdZ4yXelFDRLkg1Jw2gpkNGazkgZXx9LQT+oCXBp2vDu6XOCjM3ZtcZ4+7Lyz98T64VWNPj0rA5Nz3NIoZ/wm1U53m5uTyQSKqPdJFSliIS8spUkll/9VuEEAWwmx47UKEzFUvnBh24op9X3m7bK8+NxLILPpGEKtQfUvGpw0ak+KBxL8GM2bpF2u4ZFTDpDxeGslT8jyRqKXh+waxHGgLNXwqAg0NmYefW7mE21Fccz2IgQ5BS1oiuEXLHuupknfqpK7W/zA9bFkdwFRWo6ntLjP/TXtJozQ19E2j1Gr77ixaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCQtvY/ILI4tgniMnY/da3mpNbrJpcmwnUUC9eerPFQ=;
 b=Fxhn28H85tLZ/3u8ge6Q82ZEJz+fM1ACJuJdSsiPv27Bk/yAEo02K/W9AcxChT5hVJ7h1XqUzR6rY7xXfLjBjJXGYl15jZw/LYSA/tHMu6JXyRyhT7A2ZVacGnAfflGvhhjw0veL39uiPNNgNMkz0v582SmWMVb85syjZPrwczhm4WK4sEHIQNeU0h09ibG5cp41agNGXWAEUdm6jYoIalgWolIH+om90AzSwAFB2SWrsHLDN8iJPgv4v8h60GOH8ajtyCy/S8Q2O8KSANCRjV2RsFdjvyGHjIqduuE3t9BKbzplc5pCvKOQRJjp6EVZ/4Fyq1twkrhk8QxulRSclw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCQtvY/ILI4tgniMnY/da3mpNbrJpcmwnUUC9eerPFQ=;
 b=l0vVZkMeqGjLw01xeLLL3+4DM8UmGZVhjPJir4OeiIhBqx/R/bC2ukju5I4GY/YLOvCb6YSisskagZOqjEy8G4Lws2VIpRcoPrPDJ3BpTmsrWfBJpArOjkieABKV97cDWwZ42JXixGfzjV2jV1higrRXbs7bBbxD5lYFd2h/V8Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by AS2PR08MB8951.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 09:15:18 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 09:15:18 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Mon, 25 Mar 2024 10:15:14 +0100
Subject: [PATCH v8 4/8] arm64: defconfig: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-onboard_xvf3500-v8-4-29e3f9222922@wolfvision.net>
References: <20240325-onboard_xvf3500-v8-0-29e3f9222922@wolfvision.net>
In-Reply-To: <20240325-onboard_xvf3500-v8-0-29e3f9222922@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711358115; l=833;
 i=javier.carrasco@wolfvision.net; s=20240320; h=from:subject:message-id;
 bh=5TrVho2t7NxGZRrCfuOFV/VkqKNEVvY/Ue3yforCmIo=;
 b=ISBhrhOSHTZKO3EgA8M+gbCCk3Qrwje6DsGGhSkdao9use/iyC9gv33rixI24SqIXi7Ydl8Zi
 /ZpkBSSiNt2B2bSFNPXh9eDhx0uhOB6+gJD7oG3qKiE6sO/sU+zJ0PR
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=Vxk2/0sGIxM8rsKnceszFuSuHVfQwa1Yo8+is7BX2nY=
X-ClientProxiedBy: VI1PR08CA0223.eurprd08.prod.outlook.com
 (2603:10a6:802:15::32) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|AS2PR08MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: a38f7658-d0a6-4e99-3192-08dc4cac16fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JWijJXHF5QanX6vqOhjFrZOdLcNXy4LAuq4bDjBE3ohyPuFSI1UCp5cjZuLukMWwSlKFPqjbLfojRYf6aPXmC6qf6D23ocFOKQ4OdB9vF77KLyGEnqES7TAnKQnPBnonqD+BPVDAVie4JpVQ8sX/XtyfKCkE05EqCcjdLIXmYFBqS+iPL2ljBj7XciVPhgwgCPTp/OmeVR62s8KYSSKKVQciN704XsFgcr2HPPcMWoDkGNJipwi+N7r1+hkQA2D07X4RSNm5FliDv+4JyqOHy4ZhFB6spxYsANaFBxQ42P48YsyyC4MPJaFIvu7tH2xtSrvVNeGz3FPJRGL4qb6QD3s6gwWw72KuKSyEP9/BHBPln/9bGeu6lJ1aIB2rmAoEo5Sxx0BTr1K2O9Or9pM9b2Lona1tx9dxx/X5cdSiqF5oeu0mkgPi485TpQD4nJ08RqKz9XIQHW7UJEY2bXJ+Cr053HAGoJQxHU/0GlCma2PWovilTN3mKAy0KFuLnT6tm7teQT5aQw1ht79aDI5L2HoWU1yZOiEbS6Vj32dOhF+XCBFkJsPcGMgp+2wWL/v6mVi2NxcaY7hrpunfAW1EFgEg6Y2crQEpG8JUbeGZxgMKshmIq1TbwpVoo4TKvFZIZk0sUKqZffxMUL62wy4TzQDJXLRbFgeviawSpph2jr/UkZydfBH7X9oI+svHX66OtIvpAGp/R1p0Pga9MrhxQZ+FCQnpWyISIXcWZGHu0Ek=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmVhbzJVdXd0VkR2MmM1S3BXc3lUN2c5aHJHSGJHMndQS2ZxeElsYytYdFNV?=
 =?utf-8?B?OHdqc0ZDaVd6OGlkdExxSjFuY1VGczRROWU1OHZQaXRQYytWRHF4aGFDN25S?=
 =?utf-8?B?SzNqeGxpZEZlUFRGZ0QwRXF4MzN5YkhySUdWbzVIWDR0R1BpVmxRMlMrTEk0?=
 =?utf-8?B?akVXdEU0SHJQZ2JHcDNEV3Vuc1RLbFZCOFFFY2orN0d4UzVrbUc2aU5xK1E1?=
 =?utf-8?B?OVNTa3hicC96TFhhOEt4Uk45Z2MrRmNmWlMwU0hmTnBaeDJVSUJNYlE3RHNS?=
 =?utf-8?B?OUxuaC95VXZoU2MzT0I3RDIzc3R4cEF6SlNaT2MraklpN0F0NGc4Z1ZhTXl4?=
 =?utf-8?B?RFVaWU5tTkNDRng5VjZwUWZ6dnlYdWFYUGpnbjJ1b1BXWjNzd3Q2KzFSRDhv?=
 =?utf-8?B?SnA1ajg1elQrbmdGYWFHamRKTERQTUFIeVJuMThEbVh1NjlOcjlMWWNmQk94?=
 =?utf-8?B?YjNLb1d5eFNSMER1Ly9MMFlUTS9RUUFSc203YnNhUUREVlkvcE9VMEZkcWJL?=
 =?utf-8?B?YlR2ZEtVODRCMzNJOHpoRVJTU1ZyRzZHME1pbmM5bEl6L0RRUjZ1YncwUVJU?=
 =?utf-8?B?OUNrLzR0S3A0OFNTR010MkZhUVNXTHpMUjB2eDF3eEFXR0Nhck5mR0FiK3pZ?=
 =?utf-8?B?c0VrZkZRVGFTY2hBaUs1cUdkUjVwRGsxS3dSZlhkdEw4YVh6dGRZaU1HZTR1?=
 =?utf-8?B?U3BhZHlseURiQnZjTGZiS1dxWUlOb3phN3R3RFhybGR5REdTWVlMMkNnYnFB?=
 =?utf-8?B?QitzcXhLajJoK1BOM0tyUDduMnphampOTUxNcVg4THd0eU9TU1RUNnFyWVB3?=
 =?utf-8?B?L2pYcHVrdjF3aDl1bWphWG1lKzJrUWIyT0luRjJLK0d2dk9reGN4bGlWVHBa?=
 =?utf-8?B?WFp2Y3lVVFFGcWF6VE1xTDNVdjFaVjY3UUo5eUZ4UVllVVFvMXk2UzBwZXNS?=
 =?utf-8?B?SHRINlMzbklMN3BuK2hpblRRM3Q0ZEd0RjcxMmwyRzllN3FDaHphcWtXcU1u?=
 =?utf-8?B?TlU0TEpsOU9YNFNKbTIrL3R3ai9oRnkwRHdhd2ZESzYrYlNPYXM0Y2s5MS9Y?=
 =?utf-8?B?eXl2emIxUGVJQitaTjNtZlRIMXNFTmhiN3ZJSEo3dEVmV1ZXT0ZESDVCY1dR?=
 =?utf-8?B?Ymc1bXl5cWhKL2pLWUlxTHFhQ1R6dTYyZUlabkRGQitndjNZZmlzNUE1dFJt?=
 =?utf-8?B?b2o1ODJzSFhrazIrNVhJWUE1TDBvZ0YwbUNyamt2VXZxemZjT0QvZC9kcVpm?=
 =?utf-8?B?SlJpTDFrL0w4TUVsSDlSenUzc2xibG12KzBDeStSV2hQWXZSVEpxSThQR0tm?=
 =?utf-8?B?dnZkOWdMaGsxWlN6R1NiUlV6QWNmRUlILzN2b2VTbUxaUGNWSlNhWFA1VEJ4?=
 =?utf-8?B?UVlsZnFPZ2puc2pYWjJ5d2Q2SlNvVHpKdksrZXBsbDNrcHk5UFRrQ3IxNklK?=
 =?utf-8?B?Nnh2YzlVZlBQNitsZnErK0xPTFBmeG53NEw1NVZQTzRXVm1ZSWJvbUdrU25L?=
 =?utf-8?B?V0hSRVRvYXJtV1J3VGVuTmpYRENickFZalhKOGRUT1ZCa04zTzcvZVFGY09D?=
 =?utf-8?B?UVJSU0EzMTdObWlvR2RxL2R6RzRmRFdweTc0c1VrNEVkVmxLM3pnQVlBUFNG?=
 =?utf-8?B?azJLRndDU3ZnRlBNMGlxYkgyRDROcWJHM0hWNjVUT3EvTWNyMENNWk94RlM1?=
 =?utf-8?B?V1JzdWFQRDRJdGl5emZmZGtTbWx4SnR2a2djRGpObkxLSFBxZ3VrcjZnczNR?=
 =?utf-8?B?RWNaVE9PbDdlQS91dWhtY3V2ek44bVFLcGpKdlM5QzhXZTdhaWZwdDFjVGRi?=
 =?utf-8?B?N24rVHNreUpOcTk4c3IrTTVRV1RnUkNtMHZMS29wcjdZQWtsaW5TRnM0NWpY?=
 =?utf-8?B?OHdQSi8zYnljZ0xvNHU1a2Y4RW9lUi9lYy96dStLZ0lkd2pwTEhLYVhWbU10?=
 =?utf-8?B?VC9pa09ZUndqbnlOZ0Q2akQ4V0Zzd011ZExERGkwS0IvVTczZCtkbHJacHRV?=
 =?utf-8?B?WXloQWtUa0ZZNnBiYXVqZzQyWFhvRThBcjFTWjN4YXUxUjcrSDQvTFlYSzNV?=
 =?utf-8?B?N3ZHUWdWNzZxQjBMSWFLaW1wUUgxMi94WWhLb3RtRUhCTzFvamUvTllST21C?=
 =?utf-8?B?NkRpWGJ6VFhvc29vbmNLRjRwc296TTlqY0w1cjhKNkFYNHE0ZEdHUlRxd2Vz?=
 =?utf-8?Q?aeDXCAjk63PmFhT58q5PbJM=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a38f7658-d0a6-4e99-3192-08dc4cac16fa
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 09:15:18.4428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwthkmCrSO26eBqtjKaS9DvOORXBbZf7L9duMSDRIqLQZvZqpr0L6ux8WLQ3xCU8wXsRcVkh1MJ2MRDr0DjeHnkoJPbbLJu3mXx0RQKH0LI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8951
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
index 2c30d617e180..fe1c55a41791 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1060,7 +1060,7 @@ CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_QCOM_EUD=m
 CONFIG_USB_HSIC_USB3503=y
-CONFIG_USB_ONBOARD_HUB=m
+CONFIG_USB_ONBOARD_DEV=m
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_MXS_PHY=m
 CONFIG_USB_GADGET=y

-- 
2.40.1

