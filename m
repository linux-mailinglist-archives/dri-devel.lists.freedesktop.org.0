Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F5887157C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 06:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C9CD112856;
	Tue,  5 Mar 2024 05:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="Avnvq1SM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2103.outbound.protection.outlook.com [40.107.247.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36487112852
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 05:55:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4RYdcUSpnFkZZLpehRqlEH3SGMJJgH6HuoC81K86OsAEwo/VMdv+92CXnnX5Sv62iYMrQebTL46W0BXFtZC+fmSf3t+uJHLhvfXv9jgTPNzuurbfl4Wu3tvv13E0tGodpLu5jmJlFfFFntCHYOzoTQJmffGlUQ70tQnHpxwQepk78T4UTT43T1CF76AtPX5TXQVpYRQsGX4yv3RN8Yzk+xlLoyYk37/oqXV3A+1pWbdFYbd3FqeMyOWgZP7AOzi4X1WFU1hKGJ2zsvn3+S4fZ78F+39MJ0KTPfhqiLZT/cua7za9EV2k1ZAb51MlUSgiD4nJ08fjPSNGXf2hvjOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiGZDt5sC4cczcJU4BozY6Tqgd/Hy8BbY7gF7Z1dhSM=;
 b=VF0VZXEapcaklUtst+RAzg4cStu59pJZlcYB+i/tjTvBHKpgt83zOfdLJZxI5TcVCN/ucz7T09bMX9Rf9NM1hC+D1RgZI0hIjgXf1lLQKP4CVCMh8S6d0O2nm3Ba2mrJVP/w+rXG0YyUdbGBF2v9R6rfMOXKKAjM9muKlc1R1qxRlCapVXZTG6OZRVG0LCrIZoKiggJo11iGRZ7GKr7PGnI5NPmkXw/quDITQzm17RbanYavUXoWHfjmPd5eSmsR12W/VpCzpIGOV99qAkSip4lght3Y5k9Qa+PUj7zC0iUa5Rfp0j7gRbWG/8iakI09XuVWMQoI3wxFDWNcUXdJ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiGZDt5sC4cczcJU4BozY6Tqgd/Hy8BbY7gF7Z1dhSM=;
 b=Avnvq1SMmNguE5NhK93EcU16DM9/TabmTA4VVkIrGGb2422mLPSKYtV0sM2zgJNlg+0ev9Z2DTwr6jQWCsoKCPyszq8LiD0CQsFTrRJPb0b2cMC/IA17cGxsLqVng8aZIp2MMIoDJAiqeS5Wv5uejMJ8Fi5h3VzBfWBT6Nq0VA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 05:55:17 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 05:55:17 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 05 Mar 2024 06:55:06 +0100
Subject: [PATCH v7 6/9] ARM: multi_v7_defconfig: update ONBOARD_USB_HUB to
 ONBOAD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-onboard_xvf3500-v7-6-ad3fb50e593b@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709618108; l=903;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=5HWgsmTtck7nNPdlmIAo1wtxif4fEJzdIeQ3MU4/0n8=;
 b=Li0HhXs9vKBdjCkMWSJMOX5RlgYfAKGPYFhi+goaxbIDq1q7SU0hVUQBXxhkfNcrN2TPHbbbM
 785TfA6MXWoA8P1opl3MFSp4p4BTV4H68BalcfrVZnH03NExx1a0wPe
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DB9PR08MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 9607432e-4927-41d6-5a34-08dc3cd8d56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJL+1RmWrUkcFoxl4ZDgEA63iV1nERHA30U0O3oql2nn6Z4b4TVYyh6rHX92Jbdw8CLej8NRUidGh835k45MZUT/k3/b6XmpIQO4XjJCcoaAznGPnW0LXS2qHmQI4Yg1F/y9cj8hrlD0OgjwMmHAhEAFHgFdM9ujh9492u8g6TKM5ESlqOEOTlHIg/RWesh4dpfnEDPJ6u1RUr2l6JlkiWfTh6hm3DfqO82vKlGlQkZ9ViFyKYwNgoAM9uTGQ6T7Ned41+uAmapKQm5oaZKIQkPsg29PQPdUi9YNbqvUP7q3jAyI3iUr7Ink3/PwsNOst3AptEDYBioSU06F6iYZSLnndffWnnSAfcPKaZYAOtX1RwDLTOXRjCrHLoSc/FNdYpAitGplQ7c8EUwkfkJOtl7uevhIQbQtyxW2Nz+3dDenprZIERSe5vi7ZQV7kapkwgPa3znMCo4OF99jc7I8fcGzRpX+q5a9NIWdeFUKqQoWp5uNVZZxMm2c/98Nufz9SC+q1ruPWycLHhnN5/xEcoFnbnXrbb8/N4kDsZGGu1xcrXCsapX5eWmeK9nHfriufqljqPQ+ARvao0baJIY+awh4NYcpxUc+TfG4a9BdvBQc/ha/wh8WYBO2KVcoJzdvhm7lzGAY1om+nNWwQHnLRtGE9qNHCfzdH8Gkond7xw+pHW4it+ikK/j0UkaYKPiSh2Jfi48NMdvD3fD0JKQhZqFXj356Vxc9TfvIecR/5Ag=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38350700005)(921011); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blMxOUNJbTJjZ0Nxc3d4OW95OC8wZjJaNjNtdk40bWl3VEZta25jN1daSG1K?=
 =?utf-8?B?QzRvWGVDTWx1NWdyYThUekZaaVpKeEo2cGtOa2MwTGJvWUgrZnY0dkZNcFc2?=
 =?utf-8?B?RytQNmRrK3YvVFhGbEgzaG9DZnhKdk94N3pHWlNRdTJlaWpCQytGQVpYam1H?=
 =?utf-8?B?SXYrSjlaalczbStid3NIUG9MWUxobWtXa3JTbTJNbWdqMW5TNmMzV3Uwb0Jv?=
 =?utf-8?B?LzYrQ2VtQlYxV2hOQUhRY2ljZnVXdDZGQmJHcXRDNHZNcFhML2lrUEs0MkpZ?=
 =?utf-8?B?ay9OYi8vOER5ZStuQUQwOW5jOEdXRzdvWmVvYldBZVpTZ2N0VlFQUFp2dk5J?=
 =?utf-8?B?WVN5dUVqZWNLMGEyRUpIUHVpVTFISzJrSkJrVFFEU0tOZDJJNkFpYnpuVFdD?=
 =?utf-8?B?K0NJMTBlcDEyR3REYlZzR0swRHp0VHdRZWhHZnRaaFM2RUZ0MjdmSHZLNVNj?=
 =?utf-8?B?V1ZnWGEvemdMN2ZhSlpDQ1FPU3NHc0RCNDFQVUJ2YTJyeTVvNGZ3RWxNbmYr?=
 =?utf-8?B?MlhtK204ZmhUVE00UFBhdUIydHk2KysvbnpqMGFCSFJvSnROaWdnOHhyanhI?=
 =?utf-8?B?ekV0aEdqZW5EdWd4TnFkWHBJK2xrTXk0dkZ3dVlIUDYzQkF5aHlZMVcyYlNo?=
 =?utf-8?B?RHdzWm5ZRVZibDdpNE1pdDQ0a1VVNFU1WEFEc0xhMUwwL2tLbFhaWUlWbU5Y?=
 =?utf-8?B?YlljUXpCdTUyUVN4Vm80NExIV2I2ZUxxWUNxbjZsV3NNYXZnN2FsYW1tT3Bz?=
 =?utf-8?B?dVd0Y2RaKzhBRy94S3RTalRRdmVOakZNSjBYK1JLN25Zd3F6NS9CeHg3TFBO?=
 =?utf-8?B?ZlYwVUd2aDZEOUlSL21Lcmp0ZHcwU3V0RVpCc0ZhT1RlOXFxNTJzNlFOVFM1?=
 =?utf-8?B?ZmVRS3hwV3lKd3FRa2tQREk2dUx3VVpUVFVsa0Vubko3a0tOam5XT1JWdmFG?=
 =?utf-8?B?R1Iza2dhVkVlc0k5bmkzN056dGZHV1hvUjhkVkNFMHdDU04xYkpTQ1ZZWncx?=
 =?utf-8?B?bVY1d3hjQksxQ09Ya1l3dGNKMmlUVlhLcmhOdmsxa3hvRHVEd2JkelNNeUtw?=
 =?utf-8?B?YWlWbmFlbGVZV1UyRzlaVlU4WjBiYXQ0dStIV21EZWZtT2xRck9jZFMvRkxH?=
 =?utf-8?B?czdIN0xDQnFsd00ydHo1ZWVXMG0zS0M3V0xYZnBIbW1GMlJXN1IyS2l3S0Ry?=
 =?utf-8?B?UWJhUkdpdmhzelMzSDI4L2hZbm9Yd2p5RmdOYzJ2dkdvSUR4aFluOHZWV2or?=
 =?utf-8?B?YWNSd1hxSE8zOVdNNUZobmxZUnhqYTE2aVJzVm1vNkxuMTNOYjAvay83ZklT?=
 =?utf-8?B?Vit6UnIrTGVSOGs3b0J1M2VVWmQ3SGhabE95aFI4a2MwOU9vd0N5bnhnRGps?=
 =?utf-8?B?YkFkM0l3T0JCVXJieUtqMHJPRkc0bStnd1pHYUNFbXNhdmZKcGJBbFI4V3VJ?=
 =?utf-8?B?RVdPN1hPYnFSTyt4Y2FXZ2kvS0oxd2lKVHdnM0JvSVU0ZExZNWRrNUNBUVUv?=
 =?utf-8?B?dXpoeUpoWFltL2UvbGlqNmtsV2NXQWF5U2xqQUswK1F2dTQ2Rm1rZG90S2RN?=
 =?utf-8?B?Vk41YmxJUlN0N3NXcTJoRFpBRlZrRXc5QUFvOThQSVRFRFg3UXNOSGYyVERh?=
 =?utf-8?B?WHZDSyswL0RrRnRuY0pkc2N5YmlnQlpPeHJDZkEvRTVrMUdGMldKQ0NBUm1T?=
 =?utf-8?B?b05HeDJRRHlFK0puM2Zqd0pwNXptM0pkOHMvQWVwVU8zT3pib1g3WElBcnpR?=
 =?utf-8?B?WEU2a3dhUUU2Ync1aXB4SmRIaFBhK2NXRER5ZkhXV2FrKytJdWFDQWpzVE5F?=
 =?utf-8?B?aU9SMUtHSkVQWHN5b2lIajE5aE5CV1Zxd0FRQWM4ZGFqUmpoM1NmbC9HZ0Zp?=
 =?utf-8?B?QlBzckF2UG1QNEJMYVdqTjVqMXgyUUZMZ3hHTEIvWkhXck5Iak56bFFkNHpX?=
 =?utf-8?B?b3hHNWZBSU50WTZBVEUxSklkRFAyTXR0VEx6VGhsSmxYTXhGSElYdXpZUEsx?=
 =?utf-8?B?RWdBN3plcERWanRtRXlJbXlyUUs5ZHNyWnY0NWhDWGdTUWVRSXZSYTh4NTlP?=
 =?utf-8?B?eXY4bTRhZkR6THdvZ3FZL2VIY3FJTTJqODBLcnlYNll2cG5MYW5hYTVJaVBs?=
 =?utf-8?B?OERsQXFiUkRpTGFRRjJiQ24yQlJWczN6M3NyR0Z3RW9LUlc2aCtUSFlXeUNY?=
 =?utf-8?B?dlE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9607432e-4927-41d6-5a34-08dc3cd8d56c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 05:55:17.1921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCkGxX89ztvdW7aaErcffY5wIZ6TJWRNis+1w1d97t6rA4OYKsdf3AjG3lb/qyLSx+UQdocFRbC/aoeC1GlAWm9e9WO/PeONSBF9ir5HCAU=
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
which has led to some renaming. Update to the new name accordingly.

Update to the new name (ONBOARD_USB_DEV) accordingly.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
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

