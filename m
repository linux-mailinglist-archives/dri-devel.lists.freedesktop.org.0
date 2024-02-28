Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413F386B0C4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 14:52:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8188B10E562;
	Wed, 28 Feb 2024 13:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="hBQbFj5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2109.outbound.protection.outlook.com [40.107.13.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D87010E295
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 13:51:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJk1bcOij4IaOHmYkYbLYp8SpgIBM50bau9K40eerkM1zibs67sUlD/LiCrbyLGgT63xJitZcoZwU2o2A4w5aoOBDVde0jULlr/jN6ZTIymf66XLPwl836N460Q4+Qv2DoxLbGgmsZteTsGQ19ekVz8MfXv/JgrtWzuEtPOIlzEeKNF5K9e5/uFchyGlINpEvdGXgactBjtoULYlOLeTM0b0zI9IzZ8Zugy6q2fJh5VYp1ltjGb0sRIn5HDYqyc5WHaFbhjp13Po2RqXS9ZzxEL8TMSQG4uCxpB2eds2cUbk+wvRVlEmRHFN+VhcwlmuSMo4HNXZUSjLsVr04Xh8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWT5qTUoBybcuWRrrtvTKlGHfdiit8E0volSwnQvULs=;
 b=MeJZcDzfHfcxJiwRs1GhD21f6MkMF/i+WzW2tecMT1pJBhqi30FEQSFi4AQAmzqz+V6ub9DYA/Sv87138PWmoUdRfjKZdXoWtcLdYHnuyro6kS9P5mW3j4nESI3rZlfYfKseEIHIv6octL3l2+jf4xIU4HoqQdLPv2JJAaH7oUf3qKhiO8kCqpgP9QzDZggldaacrnWh4otUyF/1GRDmyUex3zodON+t5w2tkJV/uRIEnTm8CPx29uPNlYtSbxXCZHhgilFolEGFY/LeOedRi3jG2qswpcfmZPFWu+8CY3fTA9yn0+XFmZP9cMnDo7IQ8lFHvKCXSW85UmRRovszGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWT5qTUoBybcuWRrrtvTKlGHfdiit8E0volSwnQvULs=;
 b=hBQbFj5ghsPp2xB0n+WckOfx0gCWMwfnbBjIsjWlbUpndPbwREOXDXWGkdZJUL2rch/w3a1JdMDgbG1PCGdgF5/mIetohutZjuIzLL3TpbsJdkPjtDhBHuWtHXMux+/rmDuVXUYDaqjY/hMmvxC0E7CtAPTVnLsc+WvH3A2R5Yg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV1PR08MB10523.eurprd08.prod.outlook.com (2603:10a6:150:16a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.40; Wed, 28 Feb
 2024 13:51:39 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 13:51:39 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 28 Feb 2024 14:51:30 +0100
Subject: [PATCH v5 3/8] drm: ci: arm64.config: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240228-onboard_xvf3500-v5-3-76b805fd3fe6@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709128293; l=1052;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=8N+eqRO95PGeajXAAAiRwSPUATjuHBDxxAPxCCAJmv0=;
 b=aR3y4hg7UaqM/bVdgPpKCR0gjJ78URcQKBqfbgRvRqDwPnXQjYPYjc+2XRnslFQdmhgOJzK/A
 Ea7CvvRpPQZAZnsbtu24BQLtWSNrfAcabLjkq8KYD6zAH1SgIy6Erdd
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::19) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV1PR08MB10523:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd09ae2-87ac-4e23-41f6-08dc38646312
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EjjJ/PgLfE//g6Ds4HkAbUP/T65S/3M4bW8xDdOp6ADYV9hPGwTEaRmjZy535Ol6xCzt0ho78+h//bscrnQ4VkeTjPOuidaaBBga2jYRHEYuZm3ES9jYgoLVC/Nht70YawWPC52v+4Yb4RHqOu6WIqwOLzYGJ8bbHi4FWpLSwTL7//Vl8EltYmZh3Up6Xay+ETrhtH7D8oHY9mVNT8fdMHCSx695S72ySfLEg4UxCsurq5/+rs4PxjxqC+6eW6wDtKMILc6olzTZwrFC+72xc9frO2EttNoO/egwZUziMJ68QhZtWD78mF09AEq2cT3COaaTWVMXlwVVxZdtE6zBa+wnhPdQjoxvynM+Kcr9CwKVenFmzxQvFmefusaNWB+omeXd7HqXc0VR8iwEFS9BKS8K6aF85cykF3aOSMSSzhGengx2wabW0SqrtpHtc4fX/Uc+CYSQKF8ZCkjNV1Zs7in5z3OZW208H9iIVJtWiCNgK1E3kCLustPio/sNDSrB1xYGTjE2WsSfVI5Hfahev6oSjUmtox7GukkW0d3UfwdyzI9SOTIufOXhJnHhnvnDL869lfxxmPST+gBSbOfrV5sE1EVWN0JLnSm2a0dJO3fsh/vDRuv35cOIMX9R/8fTbErcQ5Wid3xTPON4OcFd2Q/MTak8XMAnYdV5LEVBblEMzbLJnjlm+x7Ip5NY0VUR4GtNwIwI3HMEJxI6Yr3SMsi8wpLf3zhPmOks3Iea0Qo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUJUU3dDTWxocWRHUlY2UlJFSG9UUXpzZTdWNW92VndVdCsrN2ozckEreWxs?=
 =?utf-8?B?d0pTR2o4RlNtRHd1Y2ZuWTBVU3VaYWRuZWFHRUEySUQzTjl1RnBpSCtWa0ho?=
 =?utf-8?B?UDFZZ3ZqR1ExV3F2eksxWFptVlFWVHZJUkJVWFhxWjlpVVdIRGt5UWg0UXJq?=
 =?utf-8?B?MVFwbmdMQ0hEWmZJVTdPSS9hOXlVNFpFT2sxSEhJcGhEYlJOblY5d2IzNHlz?=
 =?utf-8?B?UnFxbzY3VjZENHdYa2dCS2JGVExhQW96am1BMXg3aGt5WG5KYXIrKzhVeVhE?=
 =?utf-8?B?czJQR25CR2hjRTI0a3Z5YXoxOGhGUnpCanF5OFlEeTBrRzRVMnZrM3ZnOFha?=
 =?utf-8?B?TmFaaTY3TU84ZWVhUkdPZFF6UmwwaVNUU095bHlrdmZFdC9qaitjM0dFL09B?=
 =?utf-8?B?RUlYY2V3b29Bdm03OHE2QzN1em9KMmZPTWkzTGxuUTVEV0owZnBsdHdXV2NP?=
 =?utf-8?B?ZStKTlBmc09HVUs0VTloanV1UDVpMWkvZjZzcEJ3N25Ealk3Y1RTYXhYak9Z?=
 =?utf-8?B?NVRYbm0xYUtBSU82YUphUG9BU21KU2J4SDBlOVJqWVFxeUphMllJMW93OTJO?=
 =?utf-8?B?UDg0OUlqclZWQ1pWV2JaYkNvU2pmL2d6RUdWU28wTlRvV1k1cHlQTVdmSkhJ?=
 =?utf-8?B?dWlwN1RwSEZtSGlaYjNnSWpVTkdjUjlpQTRzM3dPYUlWMm9QekhOdHNBS25V?=
 =?utf-8?B?Y2tsTzRSSEVzNlo3cWh3VEpkeFB0eGhteUdRSkxlSjE4Rk13bUNTTkYyOU81?=
 =?utf-8?B?RzBaRHNUakpiQWl1L3NoZVE2TGNhVFl1aVp5WDdTZkpLWlJyUFhKSmEwZkZM?=
 =?utf-8?B?aDNjSlRnZjB6dGljY09ybUlSUXZmMGxBdXF4WXNsa0x2OGUyazlzMmhRMGsr?=
 =?utf-8?B?cFMvU05qcVJBZDcwUnBhUVNTSVBIWmRwUGtrSnJ5UnZ3UnlkOGRrNEZpTk1E?=
 =?utf-8?B?WklTc09BY1RiOVJPNVpXYXgvOUFjMWtwaFFVdWpOY1A5d3JEUGxab0lNWVpX?=
 =?utf-8?B?TVFBbC9BVFZMdlg1a2hlVjFJVjVTbkRSQnk3aWpEdWcyUmM1VXZrRDZoc0h6?=
 =?utf-8?B?aHJPaGswK1RVMmNRaFMzOVQ5UzhrYk53dzJhS043VHhTMDdSVWlySHVzaUlF?=
 =?utf-8?B?VVRhRGZvcnV3Y1NieXVQS0h0ZTJuNUFTY3NLaW4xNFhWVWVWbE9Ha3d4Wkxw?=
 =?utf-8?B?SzlFY3ZiN3NGOE1RcDVjejVSYkNCSGpNM2I0UFFjRm82NGoxRzNzZW9WV1Bu?=
 =?utf-8?B?WWpGc05UaVBLN0RuWjdPbUFoekpPMmYwYU9TOC9ZNGI0dlNJWjZ5OEtGd3M4?=
 =?utf-8?B?V1VEK0daTWJQNkJvWDFkSEI1SEN1Q2k0MlFraFJMN0xNckova3Rpb0JkR1Rp?=
 =?utf-8?B?QzVob3BoQXo5YTk2WG42UXVHQW1QWk9yVGM5NEhQWDNiOHJzR2ovTWNGcUo0?=
 =?utf-8?B?Mnc0UGlVNnFSekNnZ1RNbzN1NkU3Q3RGQ1J3MUllVGJ3TWRKYkwwSjBXSlFV?=
 =?utf-8?B?bGNKWDJnUlZ1bThyOXJtK3Q2M2JMOVY4L2o1YXNMeFVhQzNvcUhLWGt1U2Vn?=
 =?utf-8?B?eC9BczVqTUhFSVRxRUtkSlJEL1p1OTlrN2M4UVZNVXdMb0ZqZktQWjVZSDF4?=
 =?utf-8?B?SmdNcFRHc2o0STVOZG4wTFc0eUMva21EQVlGNnpGdEd2OEpQYUwydmtCSnBy?=
 =?utf-8?B?K3h3ZUYrdkwwTnBmdXNGSHkwbE0wU1hyNmxNY2orcWJ2WnZiOXRKWTRqWHJB?=
 =?utf-8?B?R2wzeFJvRFpSeldvTWVKaGhCSHJvVDhTR2tDcjkrcHFJcjVOaWtub054QXdF?=
 =?utf-8?B?eERwRU1aR3FzaEVLV3R0bU11eTA4cjBzY3JGTGxwVzR0MkxHNE5xaExHdUsy?=
 =?utf-8?B?QmtDQ2JlcTF4TEdlaWVQT0kwN01YV3JTZjdRZElhNy9JbG1KK0tFM3pVejJt?=
 =?utf-8?B?N2dISU9FbVVXdWhyam5kdWtZNE4vcXpvTUdZbVQxUktobFAwRnZHK3V6d3pT?=
 =?utf-8?B?NUZ3dEI4djJpSVFDTTU4MFAxZEs4c0dHOE9VYzArRHZmZnRhTzlNK29oakZn?=
 =?utf-8?B?aFk5MDBybThFaGtRbmphOVN6WXhRYkdVV2dOWHhQYnZtV1pRaklTNHFWMS9T?=
 =?utf-8?B?VTRRckoxK3FMMlBqTDF6NldCVTNRc0NEWmp3SVNiQUtVKzh4UnZCU2lHakM2?=
 =?utf-8?Q?6Op1L1jm1AKvhCUiv5ZCRNU=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd09ae2-87ac-4e23-41f6-08dc38646312
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 13:51:39.0864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IT3TgFKNk9OIU/nloq+lc9dZzTVezyz9yqTOhCTVtcao7VQTKm/ZTIYw6b5BIs47RloP5PI/uGRbeoruPaWBCi5HxDXdR57IlxnDr379rDY=
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
which has led to some renaming.

Update to the new name (ONBOARD_USB_DEV) accordingly.

Acked-by: Helen Koike <helen.koike@collabora.com>
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

