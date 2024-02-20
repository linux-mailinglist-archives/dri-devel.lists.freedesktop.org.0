Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89C285D22A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C0210E653;
	Wed, 21 Feb 2024 08:09:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="PVtXVViM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2107.outbound.protection.outlook.com [40.107.22.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E071910E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:05:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLvdj3nQyD8iFAbzRsABDxFzzXMrO/gcC5VWQuaFWEQrmgz8KjDIwlmFmZ+Ba6oeuFzJ9iJsYXZZA9osJ1qjlR4wFxuDyCW8fb327Ky4V3NMDeRJmvJbeIq6VF1y9H6/Luz2LEokUyvIikGdZoOGwp81uwnaO1VZ7+CLnuAOi1SONJN2YS5BL2a+G9SoiQOcg1uR0SkGGD8j4fQTjLqUYfpKkHjaxKo7O5EbU9z07yQeStnLkWQdjQpO/UeuZQczCTVmE0sgKzvqFBfZuPkI/21Q569ex/d4tCf0e4Ji36af/nzjP1WCfMRVxehnF2K886ptut+1Kdlh7Tp01fYPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbaOGiQnqMim73n95NNuOUW1VNxYpJ3bWE0RQMANOTk=;
 b=aeoPRI20xW3t+Na+oE5sLW4IdOc6AWvq89xU3TYl+xgWrcgMf44u/DUiNBzkHTYa/9JQvUlgJtUY+JxbTUXk/5f0/iz85YzWBOlGuPZMS3CXGU9q8ca79qtT+QwagXmyOnLS2H17l6qYE8SDtoPCOl2hg3e3SIbgg9BPDdv/GJcw9fX8MJBLTlY93FjU9VAgnAs4jTwP4wVEM5qgjb47m4Ii8vJ5nw2KeeFHfeHAeuSsc+F6raHXFjaeMOtyQQVbfZlgj9cbgKyhDbe9O9HuWi47ZMAr+tektuCvzVHnLGkGaY6zuDAmxGmpGEPphpDKXQxlFtWhF/UD7qAe0Y5e/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbaOGiQnqMim73n95NNuOUW1VNxYpJ3bWE0RQMANOTk=;
 b=PVtXVViMh8dATpgAUUfRXEPB9uUGIhfoQW+k69lsinavyiP/iF920qBIYBcTjI6U22/c2UgXitLp7pAG+ecagyE8qceCocMV4NU6wvTHHGMiV8u+Dk6SXwFZU1QyDljVkWW1SGSFJtp9yNCZDApLFL1kr05hk0Af5QFoQQRem3A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PR3PR08MB5577.eurprd08.prod.outlook.com (2603:10a6:102:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:05:55 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Tue, 20 Feb 2024
 14:05:55 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 20 Feb 2024 15:05:48 +0100
Subject: [PATCH v4 4/8] arm64: defconfig: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-onboard_xvf3500-v4-4-dc1617cc5dd4@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708437949; l=792;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=Hn7W5NquFOfa2SPwHz+COI8OES/VcCwNF5nc43UmJR0=;
 b=OPPzzjhHtWj8Z532+WD3LepV7vfoXgmKh44+nlOQTl7f1AHjxSCPVkKSVMpiNR5G1WH8zz6p5
 lRf7yfTskxYBGnLwYcAKV7QGW/UMy5+xTSvkhadHSpevZtfrgGw8H7A
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: VI1PR0102CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::23) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PR3PR08MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: d998ea84-2f3c-404b-cb58-08dc321d0e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 199F83Dh5NRulhc2yOF2JBJPqbCjr7stuUvCYh5Fpp2aOq3jBAG9JQoZ3dx1kXRnVZkudCKCpZxxiQQsS0uVXMeludpRfviu7XSUX82+MjaPmjzi38wTflXDBPKCsa6+Cq8Hru/K8Ka2zOTrUR5ktf8Pno51FKu/TJCEbiFbk98TJVu8LAU2pSRKDm+3clVj9DkiDgvvHKy2uoO4WsxXUGd/6C+kOj+tzxhaSKVyRkic1k2iD2PMIy60x2AqOCPAPXO/2YZhazY319NVFJyKj5ulRxjUrolxNY2ssMKeDx9ZkOiMTs/OrL1adhsQBzIpIpQpJzATh5JBs8OyEjixcDGDSVqogCjoZvZSKMxlqa42Pv0RMplhE3uyIpDCPQAeg2VcOAvU/ggOJQCClMPMVCfGtAKtmfNTBR700tNLuDC+Kvwue+EbvG7SLlOqQtMojU+cgegfYAFXqi5B8nH1ro/gbUah2qyr+iDYuLi8KLjj4XaC83PZ/NwSjucUPw79c8EmXuv8frWKx0mmOg51KijN3BOHeKqbKczTUImXs6stK6b5qoL/91PfnVhfN65JbBsnQ0ZpmhP0YJbzNggJMbv1mRMSCrtxMcamEtNijyTDNO65+XGu4A5wiY9tOM5ePmA4Y7x2k2pDUn4EQZAzSw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0lML0JYbFloTTl4NVUwU3hiYVo2ZnVhelVESWhDWFFwbldsKzJDaHdZSGRW?=
 =?utf-8?B?a1JLTk5hWHpaL0NPQjlzWkc1WkZRdVVEY2pueUZXZi9xdHljVXR0WWhTMjdy?=
 =?utf-8?B?YWVTZ0lUMjRKS05jekxMNWNuY200T2h1cU1nYkpaczBDRldOSUlOaE53Witw?=
 =?utf-8?B?N0p4dVp2Tzd1M011L2JaaXpMb2g1QUpNb1NVa3B1eVJqT0o1RThCaFgzMFZs?=
 =?utf-8?B?WVYyQmd6aXVGWmFwaW9tKzRjdXo4UWlHWUVjR2FZLzlONHl3TmY1UElZSTB4?=
 =?utf-8?B?TE5lRzgvL0pnMWppZlVmYnpuTVJRR01wUXgza0ZXYmNRd1Z5emU4NjAreHA0?=
 =?utf-8?B?RUZ5RFlwZVJVeS9zeVo5aVJpN2FzNXlwaW1OeFh4TEhITWVGMHF1eFR6UjFD?=
 =?utf-8?B?MUtFeDBZak1jdkZ6WEo1Z3lob3BhdVFjRzk0YnMwK0dGRW8vTk92dENySXh5?=
 =?utf-8?B?Tk9sOVZTU1MwKzYwL0N3QUhnT0RsSEFYckpneDFlQ0ljbWlWOXNEQlFabFlV?=
 =?utf-8?B?WHJ1cnYrVm8xYmU4K1ZXWEF1SDJpdGNXbEp2WEhob3JMS1VGaksybVhPYUJC?=
 =?utf-8?B?TlhWRE9vMkVXN1pOSzYwc2MrZkdCVmtRWW0xZHpxc09rWGd5MlFvWThEbFRZ?=
 =?utf-8?B?dk9TZkU1a2hpREErWkVYTmswcWpHcDZzYW4wRUFubTNKYVVVNlhKUTNpSm5R?=
 =?utf-8?B?M3g3Yk85aTZSWEZYN0lLazRpUHIxQWlFM1FPTU91ZnlGNVI3UTIwNzVTM1JS?=
 =?utf-8?B?QmZLUDdnZHBqdnRBL2ErdnEvc3NqWDRHdjEyZktnVmpaNmhILzRPS2ZFeGJv?=
 =?utf-8?B?T2dieWJSeFRiMTdMTVdXL21KNVBYOHRWNCs4VFRydDF1dnhHQ2E5WEhCakM3?=
 =?utf-8?B?RjhsSHNCdndPSXQ5QU9mQWhVWkVQenFDS3BhMHVvOUNidWtDTXBIeHI2VUZp?=
 =?utf-8?B?eG9EVE90YzRJekRzdlBWRmJHVlRwQ1I5YkVFQXpTNVpoQ0I2QTczTlI4K2lM?=
 =?utf-8?B?MEQ3RzBBeFBmSk9JSk9LYW5wTVJzaUpwS1V6UUppOUNpdVdOK0M5djQ5YzVV?=
 =?utf-8?B?Mk00c1pDNjRrTnIwbkh1dWtjaWlWUWpiVSt6SDRDdTVteE1pSDBHNElOUDI1?=
 =?utf-8?B?czFPa0s2TkMwQkVaOWFYdUhyZlBMcWsyanpWWm1yaHBhQUQyeHlGbEpIMjlC?=
 =?utf-8?B?UG5SeWN4ZkNwYXUwZUVpNGRSS3MxOElWaDRoZ0dUMXdaMmtQd2RBZGUwQjFu?=
 =?utf-8?B?dUpYU3NqdS93aXBnRlgvbmFPWFVQQlhTQ1hrbTJna0NONS8wbDdoand3bUZN?=
 =?utf-8?B?MHkrYk1nbUVOV1lKVkg5a0VJSEVDaTVTcnVGL3Ntd1Q3N05QTTdOSG5RVHBN?=
 =?utf-8?B?Vyt5alpPb1hRVUZKQW5NTTlZS1pxVWxnZHR6MGVqVFlRRHp4TUg0ajFyNXE3?=
 =?utf-8?B?OS9VMlFhVnFwN2kraUV1VXNHME91K2RmL0ZmNVBSZm02UW1MU3IxTElySWN2?=
 =?utf-8?B?c1pJcGY4OTRoM2IvTGMyakVMVTlhdU5LMFNKRkZhbFJMYzYvUHRhWFpxK284?=
 =?utf-8?B?UWViWEVtWTR0YUt4M0JaL1VYYnJ2YW5BZnE3OWdPVVhFb1ovZytIZkNIdWx5?=
 =?utf-8?B?ZUtYV1M1aXA0eG1QU0VoelZ0dkRGM3AwSHBTd3czOFArQVNYdmVucXhTekJR?=
 =?utf-8?B?NmRibGxrTUtRMVlMRVZRZ0FrSVoxbS95TnhnVEJGYnJZV1FPNEpyMVoxcTRk?=
 =?utf-8?B?Mm90aVRIRHhGRHBtTFRuMnVRMXRtc2pCa0lZK0VLWUpqb2lJZWx4SG5EcHZz?=
 =?utf-8?B?aU45VUFnck01MVYzcG1vVE1TNHpXTWNxNGNHbzFuYlprMVk2WG4yRTVrYU1J?=
 =?utf-8?B?bG01dE9RM2I0bXdDdUswdnppalZiRDk5QjZjbzYrdDd2ZUd5Vi9SY0NaUFAx?=
 =?utf-8?B?Yy85KzdDcW5hRHkwSUloZlF1VXlETmdleHYxRkhmTERwU1kzR2ZVajNBem0v?=
 =?utf-8?B?YzMrTHE4bFBZcytWbTBwczBsSEtWNThqWkp5T21jbjFZTmxxYlpLYTVLY3hQ?=
 =?utf-8?B?aFNSLzJFcXRZRjh2cksrZ1dIM2ZNcjcyU2h5VHQ1emYvVmVDME1YeVpWSUpx?=
 =?utf-8?B?M1BqeWVuVFhWLzNRVUNEeTRNUzZ2R0gyNzVWTHBDYVFUSmZaOWd4UGJnN241?=
 =?utf-8?Q?SIhz96cmArrGFQjwGdpLbbA=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d998ea84-2f3c-404b-cb58-08dc321d0e5a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:05:55.7794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNaAsT1jMESGY63kxCmVO85TlzebgddVU45qxYj2vG8HSvexQvjZt4QY8jNy54OSKYyZwwDKJSj8TWVtB0y2/sJGbzG3dd2t8lohOZmW+AM=
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

