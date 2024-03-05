Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81989871578
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 06:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C4FA112852;
	Tue,  5 Mar 2024 05:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="Er6TlnJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2103.outbound.protection.outlook.com [40.107.247.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A85411284E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 05:55:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtCxuMNtuHUTXM2DSk4eer4Nu+wQ0/voJpNcc1p1t54VkX6JLWfyNHuKrcL1sOzQcbTb7NyDUQTE0CXDM/dO5JJs9LL/rGUIM4NfaBstuRoUjPinaUnuX2uASOQ3EsgMsZKLKG8+uo7LS6fJDpUHIBTfGpXxyBZHUfl/c5ngOpCbRGOT4jVKultI0fA16I6Lu03ctSaPhlKhLbxUzaQgv0dP9b53Txc4y5RjEAfBpgjeXfAl3+Z2RzJif1c2QvpU67GtqJpJC+Jq7+hdW6PnvW1F5pEaJiC9I0Y2YMyvnkhMA9mOySjRxjNROPlTlTSbB9ET/SZAPMhB6FM2Z+LKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27+M+LbDLnHsClzqGVg0LPstQNKuBSCxXcEAn92RFTc=;
 b=RmnqY8YLZzzImKdyxKzS6URLzAhAyI4tMDaaWRZ1AksA5JHbjy6GE1kGxpNhKNeUkR+gTzlrrA9nCMDg3j/nQ3tHie8hODGDLzhmo71MKvqMO9LHGuwdpmgcsFls4bQsN1+K4IrjtuKP9O1C23KMbaCrWVsyO+qRRhonqsEbeUniKLNOc1owSW4uJKdw24GdxIJ8Ekr+gMtTc2tIARAQVDAYUoVqR87qXDcp2hia87RoSawXk7DsWW3/ZTczH/Khk3mFrB9RpNcsAVH0HMIfPbxSsVVy5S09hkErrLHrprWyoR4eyEVkHCXenRVoK9+zwvoxsbkNqKcyQDf1p3xXpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27+M+LbDLnHsClzqGVg0LPstQNKuBSCxXcEAn92RFTc=;
 b=Er6TlnJQ9EUUM6UAe+Q6j8/Cu6xPutxbYJ+nuu/0ymQAxmYoChrnbkQMqEugSxnanRvzvYYSE1Da+KZf6zsywbV2mpv/kk9QQEy7wVrgCsqWcWA7/C955Ub86zdPZEgSo5O0URdthZY+Wf5ZbY5Uz+qa9seoJpP6RFMRE6w3Woo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 05:55:14 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 05:55:14 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 05 Mar 2024 06:55:04 +0100
Subject: [PATCH v7 4/9] drm: ci: arm64.config: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-onboard_xvf3500-v7-4-ad3fb50e593b@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709618108; l=1103;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=DmgEWOcnW+zWzi4DnyV1Dvia2Y3q3WjzCukDR64EU/g=;
 b=44BjrUmLz+LlI0tSsIhwL+gpzuLTE9hoeOM8nhwDrQKrqBdiG4tyH76ZysfDaJUM++Cs3WxEL
 RM1mwJ2Zj7QAa5uSBfrXgQr39l5iaHC0dHMYfApJhla1KGKh1+JtsLS
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DB9PR08MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 350d97f3-c8df-441b-0de7-08dc3cd8d402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lhh8nbDN8KnOcmVXahBGc48xRVM+zpYvCN1elApKNAcDZlT8+yg11BfC15HLydtXPYYgGv+A7x6skOtq8nbgdfMuJ/Nw0p7SXl8tAh8185flz8Qe4Vjdxwuvl0WDRiKZQ3asdtWALr5Pk8SCGfWJ1xzyWATufxT03msRUysfx2jVE1rYxsp9T2AfHCVtTwdgKAS3MJFg+n0bgGqtLJGy82vsce8E87KTxupxVHfIuoxUzw0wvHHGHjQxZK62JcUzMqvxgCBNqslK++5MQ3GPod/MXePzpp5f1/UDndzD6w0xi8NIulQIEmhHcKSaWtt9H4p2opEyUoxCm2sKUZMBxvSKqUomn1cj6bvuyVLKiTQbRS/17A1xBBHN3Ji6tRrUw81e+EO4oqN+Fz97xJg0YVKuZeBIneRp03+ZC1RFrfbnigqZwHFHUiW1Hc+rEbFdIvZT72kDpgY7uo0Gfmvafj9Ioox83vIJq+Blv5LR8lJwSslUMYiEWObcnVI/fq4vID8XUzyTEWJR14gqERYtuvy0mWLi7Xzc+oRzywvqFsa3ZKfnCI9WFTkCe4vTt79pNKVAm/6eFi05Z3umsBw4FXRtzeIpN2FhY94Ey0NBg6XSzXxCUedcYfyxY7SPJqjkvs2h9m08HmAB76OgOyRtn6gbrOj8jexL0GdLJavGM6Uc0iCg4vIjKqyU+mvp4sluS66hslPBQD3PJwVEUoUavMwCLkebKBYwvFM+IHTz1GQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38350700005)(921011); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDdrTW1iWHJkcERURERMQ1ZwK0pndDZnVm5CVFQ5Z3Q2UWRxRHpRUTNyczVk?=
 =?utf-8?B?ayszV29iMFdsVG5jbGhRZ21PRVFlR1ovUjQ4Zis1bTJuQk1FTXBCWjRLZzhZ?=
 =?utf-8?B?SjExK0JLODNtZ3FXS2FrZ2hsTHBiY1JmMUpRamhRZ2tWQkdKdUNvVkgrTWYy?=
 =?utf-8?B?eUhLd2xmMHA5dkxRZ1Z1R0cvNHI4WDZBRGc3d1NNN2RRV1JnYWQwcjJPTCtD?=
 =?utf-8?B?WXNtNGx6Y0NaOHphUVV3SHhjMUdpbFlYbmhBOFh5dXl4OUpHMTlxd25mc2Jw?=
 =?utf-8?B?Ym51SCttVEpqeTBOdzBJOXFPQVhWWTg3Y2UraGJZRk5oTThRYWtLQkpDWm8r?=
 =?utf-8?B?d0VNOE9aM2UrMFByTUlsUlJET3MrQkpYUnAybXRRa0dsNmlYdGRHYmZNUHRG?=
 =?utf-8?B?MmpQYk9xL1YwUEdwR2xScExRYlRQYWkrQWcrSGRYcDVFUGxvTzdlQnpaVmxR?=
 =?utf-8?B?QXpDM1Y5d3NNR2ZqU1puekU0SVcvMjZFbExMdFZWVVNBTWpKS25MQkZwMkp1?=
 =?utf-8?B?RmhkR1Jibmh5NlNFYTNjR010bTBlOGU1YVV4UjRVaEdwSUNoYXRRUTdSZnEx?=
 =?utf-8?B?WUVoVHczZ1ZBU2t4TGp3REhMRHlVelAwUVpMS21JaU1iY3RmT3ZMWTFSaDlK?=
 =?utf-8?B?UnhZZjlxdENnamM0V1lueUZaWDJ2Y2RqaDJPRTNnWFo3SUc0OXpaWG5mV1JE?=
 =?utf-8?B?dFJRVk1kNXowdEdhWm5LaGpnQW9QSlo3QzVlL3N2aDJ0MHJpWS9qVHdLSHNX?=
 =?utf-8?B?blNNZnJVcmM1NnNMazVzdFZ4aHV5NkZpTisxUTA0Q29hbFdlb1RIWGxWVzl2?=
 =?utf-8?B?RGdDM2h4eEpLZmZoOG5tMU1vVjBUTnZ4YkRyYXd5MDVWalh0dTR0TkFRbUNM?=
 =?utf-8?B?K0dUNStCb0hwdUt0Wm80U0RaYWJtTXlWd0NIYXY1VkRSSnl0M0FzdTBJUFJ0?=
 =?utf-8?B?bEd1VmMwTWlsSXp4anhaK1lqUmxObUxwZDFoVld3ZHhyUFVhYng2bUZ2TGZF?=
 =?utf-8?B?NkFqQzg4dWVhZVduMXUvU1h5K2RQSjhVYUZaamNjUEkzVWh1L2ErOUVzeThR?=
 =?utf-8?B?WWkvY1FjQzVKRzBxdnArU1YyRXk1WkxydjM1QXhrVEwwMzliNUNNVXhaRDY4?=
 =?utf-8?B?bThLUk1KNDhZS2N4eTBZRkY1Wm1IT3NFbjhJZnQ2M0pHMkxIV0tDLzZpQjlm?=
 =?utf-8?B?blNFbWhDVkZ5ZFZtNnR4bit4WWFrY1UybTNzRWphaGJYa0FqZTJBTzIxaGZS?=
 =?utf-8?B?bE5mWDJyUXBCSWxZdWp3SUxodW1MNDJLRTlYenR3S3JpbU1oMVBDS2tSb20y?=
 =?utf-8?B?UVBoV1laSmJrOHVsRm1maUVPclV1M3c1eUZIOHFMZC9xWUZvVW9RUENHY2E2?=
 =?utf-8?B?eDEybllJVDRaRGF6ZTN5V0ZVRXRpQksrTjY3Und6NThQZmxuYU5NU3F0dVV1?=
 =?utf-8?B?L2hTY0xXdXl2UytlcWd4YWdRYVdveHkxTUV5NlJQQ1YxUWhjNE1wdjQrSDZr?=
 =?utf-8?B?Kzl5RnRPRUhCMDNVK3hSVnkzbnZWeDFDWHBpTVREOWNSalpZVVJaYURyTEJv?=
 =?utf-8?B?T0pxeUw1SDcwYzFhcVNwaXNuSXpSYkEyeWdTUHN0SCtid2pYSTlNUlZtZTlk?=
 =?utf-8?B?UVJycThYMVhLVUEwbzlWVFVVRDN5Q0JRTm92eHJOMXFOVFBqclVWSWdlck93?=
 =?utf-8?B?SllKcVNTVFpDTUlkUEZJb1BSa2x4QXlXK0dhTkVnMjdQMWZoYU5FczZobTh5?=
 =?utf-8?B?SUcvK0Jobno3NTdpemlST2ZhMUNEVUg1b2ZBNnY1WHBQU2dQcmpCWUxSa1g2?=
 =?utf-8?B?QlIrYkJYSy9NM1oxUmhELzNMSmxRYTdTcjZqR09iNWFuUEFFL1REL2JCUUtj?=
 =?utf-8?B?WHhNUXcvTlNublNnU2RlcG9xQzJLSkFzYUZZMFdsQjdFR3V1dTRyVldwQ3V3?=
 =?utf-8?B?WlVKUzBBc3ZiYmQ5aDNpVHRoZ0RzK1FEZkpsbFJkcjVHc1F4Umc4aERJZFJX?=
 =?utf-8?B?Z1pES0xDck5CL01mM3pXYlNGMlJjOXY2Y0NLL3JYSUltYnFlNHVEZ3ZuUGtF?=
 =?utf-8?B?V0IzL1Y5Z2t3YktvSzJIWjBYMm80Z3JHb2pmaFVFWUtHb3JlMzNSY1BwN1ph?=
 =?utf-8?B?Ti9TS3lzR0ZmNVovN1NpZFVWSUxpUzFiM2NRRGV3bjgzZEoyNlRnZ2hKZStU?=
 =?utf-8?B?YlE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 350d97f3-c8df-441b-0de7-08dc3cd8d402
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 05:55:14.8136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 992ZxmpLcrMrU/sAPa7qnG6ytd6Z67zPfVQms6wpBBBJip1BwerCsZDuS3IMfR1po2P/L42XogoP4KQG8+VLqBCQk8Oe7sPjq2e5YltsHJA=
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

Acked-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
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

