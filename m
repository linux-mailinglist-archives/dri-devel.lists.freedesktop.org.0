Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB90E87157A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 06:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7E2112854;
	Tue,  5 Mar 2024 05:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="lEZOx64G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2103.outbound.protection.outlook.com [40.107.247.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0CB11284C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 05:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/O3aPeoPOPh7sBUHFgntGogxxFruamImB1Rx0Lb6Bd5jvDwgdSCO3n8LLekxMW2w27SDcSxj99CLP8a/h4ofpa5i+JjzqzECnBhDcAHHl5/jy8lhqlQz06IF/cwe4Zl1+Q0OLnp2RUmNcaZaaKcr/F1eoW7DZIVmmKxJVWF7Cs/nr1HyTMtKqx7YoCb9ic5MalF6exKkxFwfQUFSNhjtul5KGTAVFXFdYmeRN4wwOXwlHHPdBqlEe8AIVSxuUztotX22CKi8Ie3hxnZG2sQMLUEc52OALOg7qAp9gquwQ4uEUgstSxuYnfgybdVIA3rfUMfQqCOntZkxTeqRdHD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kH/FV/aniOe96OINZx9QmxJsFeg8Zf2fzNrjgMA7/d0=;
 b=BvFjnoUzI/RwwmWkaYiZRdAdY+5P40Wfvzu+GS7ef5yEeUbuKAJa1I4E5kxsO4xXlnYGEmh8JYW5pwoOCSHGtjUKE+TbAo76e3Iv+QNAQ1kYCah3vxjFQB48SK+hF0+YayvSoR052CrkztlzQKufR3j1/sM1ihqtakMCBPLeGcuGLEoVeC5oMH5SyfHw2MpqyigpCKnKT9JjPAWl/QIZox6QcTIcLaukNjJyAZjf6HFpE3Gl8KhqmNJ242hdjDKnFy/gA0WHL2z7DR8cufpwSOvhq2jZSwl5lAGQsujrNyq+vGZwKHPirWJnTAJP0rR9RgeM2Z8CzELZvaX7+lGSRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kH/FV/aniOe96OINZx9QmxJsFeg8Zf2fzNrjgMA7/d0=;
 b=lEZOx64GFvi+S5wttkT4zxb8NrgBNtqKMLP//cYHXW1Tho7keIlUCHrfJObY4qRR3R7S5KLeng5mHeRCRKCw45sX8J0BQFJnHhSewowxHydJg5O7hyTuNQL2FDEM7kn+0Uj8prnPkHQh6Dzow+aAbF2bAo9mfeoCdr4KqlEUyKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DB9PR08MB8385.eurprd08.prod.outlook.com (2603:10a6:10:3da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Tue, 5 Mar
 2024 05:55:13 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 05:55:13 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 05 Mar 2024 06:55:03 +0100
Subject: [PATCH v7 3/9] usb: misc: onboard_hub: rename to onboard_dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240305-onboard_xvf3500-v7-3-ad3fb50e593b@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709618108; l=45953;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=r4R5Kgtl0rWmdeo2iAh1lY8GSO27edNwKwN9DBE/qlU=;
 b=NrX/4DP1z7jtXmwznzYXisXlzYS+q+gNDZej2f8uxM9ZlOHGhYRRtjaJbwfHrTT8UMhMEUzFH
 i2kQDv9DMIdBsIKQKQ+j+G4yJm2rwc//UNw1tGWwIpHUrZyIqpExb6z
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR4P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::18) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DB9PR08MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 56c1eb55-2563-475e-0d48-08dc3cd8d346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6ots9AKYdIQ0d+VW5YkOKXgswQsg2/RcHbmb+GSYuE7tJ6rfioxIs/XkbRiCczwnGun3vkcoSoxdar5vPHzbzx0Gui00nNH17/QTbdA5mgVUvFdK2UhLsfbucu8ltpF7dgDr5y+3cDJcbmctAEpW79zSaHaIp8mGsOAikxSgiW3kEGDFhjIUpOwmv77snh+hOlecacqawMRGVBt9MQtXjbLUpskjpGE20b25Dwe/bl1QhGlaS8n+OA/+hyW9oZ2t3MpddDILYAJKV5J6tyhfSTnUv1m6/zrFrGicqb1qKwTam9sB/PUK1gl5YV13lXURtHRB8xPFursMtfL3syTZGFoRsI4ReEttcrFgCTN2nYMMXH5yWDpadFXpm++2t6hvCSgfPpN27hnMY9PL+CQPx7/ghDMnOvGhHIkR40NbEgmnQY4F/J4uU14Bq4ND64O/qHpzUqNfSQ31lSWZZVe+mCwa4gGGcrkZc+83yahXdYMsAe/hgxOj6XGdi0d9CYJ0xIs3x75brwJks1IngD3AFW/Qn4A4yODGKauLHy9GkNQdo/iyCKqkG8MtvGleyxG0pkbYaYyVk89xXm0blyYMQf2tamqL4uwqnwomVFBJYZJJObHdmAq8fQIpFe4QAE2T5+pgcMFPjmYep5Z9D+uyoJIdQ+gFAK3F9VITIcn/++VyXSlUptGugEQkL3wAG84U3gHHzctOMZPfHUAiIUgNfztO+oA4vCLL/0f07OrNY2Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38350700005)(921011); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?andIZklhNVVENXp2VG1TQmxkRXYzdTY0SUVyQXNtMjlyYnEwMi9rSEN0T1Fp?=
 =?utf-8?B?akk4bEswM3dvcFByN3o2RzNpRXdQdnJQaXFlTVc2RXFtWHVXTTQrTitrd1Ju?=
 =?utf-8?B?VEMrYklUSmMxUkF5b3hJcURiZlJ6UCtQaEdZd2UvOFJIa3BoQVhEUVBrTWx4?=
 =?utf-8?B?U3pXdUNjNytEeWVkTWRBR1ZYZlRUcCt2OGh5RlhobGZTWmRSQkVJaWEyM1A5?=
 =?utf-8?B?M0ZSd1pmOGtMMWNWZDdOQk5lSGZMcnpOeUhORnVJb0VRT0JSZk9lYzhneGdk?=
 =?utf-8?B?VVlTMWU0Q1hWSE5YWExRbXJSVDNWQmRsSlBLRThIaGFqV2pEam5BZFowL21F?=
 =?utf-8?B?bkhUd1pSaTlodWJGRTVqWE5qMnVQSTE5cjBRdjYrMDlpWXl0UzZGemVnUkZy?=
 =?utf-8?B?ZDJORk91MVE5aU9aYS9WWERMQ0JybVdIeWIwSDNSTG5lWVJtL1RKZ1JENGhW?=
 =?utf-8?B?OUM5S0EyR1JtNDI3aDllb1dpejNGT3FqUmI4dWg4QzlDL3Zhdzc1aFdzRjgx?=
 =?utf-8?B?RnRmZUgwbitoU085QXltczlhbFZYU1RTczczQ2VxeTB2MjE2VFVpcjBla1Ju?=
 =?utf-8?B?aWFSR2w4bGRzdGF5THgxSU9tY3V3c2ZRckxuVzVYWjNhdTRIYnpXbjRCQ01k?=
 =?utf-8?B?WXB1L0k0Q1Z6UzI4RjV1Z04vNndjMkg2OGhnaS9IQ0VTN2JGNHgzSUtlWFFq?=
 =?utf-8?B?SEtYMVZza1VIbjgrRjVsNDdmSVc2V1VyS1FQc2MydjZObUJ0VHFLRXpVRzJM?=
 =?utf-8?B?bGx4b1Y3c2ZiYzBBN2RHYk5sLzR6amtzRTVPejRxcGZtZi90cDI0L0JNZmxW?=
 =?utf-8?B?b2IxY0pUeThZNFNNREFWNGFFUkxqWG9QM2F3bXhnSDhjbUhSckM3RkFleHVR?=
 =?utf-8?B?cG1GY2thUVE5OGhoTE5rWjJycTRDOVVrS0NLZ0JuRWhwbTRkOHpBaVlGZ0Zp?=
 =?utf-8?B?YXZKdjRzWUN3RFpsNm1iUFJFMTdGKzlSNXdRNzFQeU9NUmR2VjR2OXZ1NC9x?=
 =?utf-8?B?clVaSytld3RraG5Qd21ld2N6WDR3NVJJQWhSSVV0U1FlcTdKdnh4Z1J3cjdB?=
 =?utf-8?B?UjMwUmM3d1RWNGpDOE1wdzZkUjZCazl1RFJVQnpOclJvbzNmeTJmekJZNzdr?=
 =?utf-8?B?NUIwRGxoazRyTzk2bWlpWXQxRmRNdk54N09HOCtYajZFblhVVklFL0hxNGtT?=
 =?utf-8?B?c1lTWEVPcW8wd2dabzhOR1kwZlZZTEY3M3ExYXJXZGlMbGtYbitrUG9EWDZD?=
 =?utf-8?B?cDFsR1hUcHZrVC9PT1E1ai85b050NVZVeksxKzZuc2wrUWZ6RU9UWlVqaUdh?=
 =?utf-8?B?UmZieWVKTDIxa2wvazVhVzVycCtTNEN6SHdhc09wWlRZWXd6NjVROU11b2p4?=
 =?utf-8?B?QnRqMDJ0N2IwWmc4ZHp6Rkg3WDV5aDNjdnZkNDNIYUdQMDFsM1phUWdPMFBQ?=
 =?utf-8?B?ZjJLMjRIVUNjUVNpRWFhNktSSDBDbjNnSEpOak9STDFlWDErVFdLejRSZ2x5?=
 =?utf-8?B?TThQQStBdGdOemgrd1NUNVZFN0V2MVBmR2FyamxyWDZzcTJGUHZVbkdMNUE2?=
 =?utf-8?B?Y21KTTRsNlJGaWJtRkF3dGZOZm9PN01oN3RFc2RYOWdoTENYekFrY0R1TDlJ?=
 =?utf-8?B?ODB6UTVRaVdEUkJnTEZQS1R2eWd5V2IwejhHQUFHWDBlYmlHRTg5SjRTVmc5?=
 =?utf-8?B?RkZ2K3o0aWJXUlJseUgzSlZnZVBxL0dTaHkwQytRT1lIcmFYN2taV2p3OGRK?=
 =?utf-8?B?NCswbTl1dGFRbkpwL2dSVXVjTGs4aVBCcGh5aXBuRy9oUHpHOE42RHd0dWtj?=
 =?utf-8?B?Z0R4NFlCR1ptMTBOMVo4eGFiRVZBczh4WndXSVN3Zk02RENva0tXcEJYaXhl?=
 =?utf-8?B?N0ZqU3lhZmYrK003L1lZMEF3U2l4OUhZb2dUWFFQRWxlZjk2MnN6enVhOFFU?=
 =?utf-8?B?dy9aZ0VWYzFOc2gxd2JqVkNKaWNHTk1RUVg5UnBqcjNYSW8vVS9lUHhoWTJi?=
 =?utf-8?B?b3FxZ292R2NzNVRFY2t5Z2Q2M1FsUFUvaTlrTnNYT2podFJpeERRYk9zc0NH?=
 =?utf-8?B?THdMeWkweC96T21sY2N0V3pBd2ZhSkZhTGxVN0lHSy9PK0t0alkvc0NMVXVq?=
 =?utf-8?B?VC9YU0VLZzUyTHYzUWxDeFA1bUtXV21QOVhMaGRRblcwYkIyZFpLVVFBMjB2?=
 =?utf-8?B?MEE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c1eb55-2563-475e-0d48-08dc3cd8d346
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 05:55:13.6463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXxwuB28Jk1+X/2JDg4lU82HPaSTzeebQ4L5h6SqpmRqKf/imqpQKvwewqaS8wFLzQDNGv3u9jXUVDHAqXlBfHkm5pHyQJ9yZuGz1uVdj6E=
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

This patch prepares onboad_hub to support non-hub devices by renaming
the driver files and their content, the headers and their references.

The comments and descriptions have been slightly modified to keep
coherence and account for the specific cases that only affect onboard
hubs (e.g. peer-hub).

The "hub" variables in functions where "dev" (and similar names) variables
already exist have been renamed to onboard_dev for clarity, which adds a
few lines in cases where more than 80 characters are used.

No new functionality has been added.

Acked-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 ...-usb-hub => sysfs-bus-platform-onboard-usb-dev} |   3 +-
 MAINTAINERS                                        |   4 +-
 drivers/usb/core/Makefile                          |   4 +-
 drivers/usb/core/hub.c                             |   8 +-
 drivers/usb/core/hub.h                             |   2 +-
 drivers/usb/misc/Kconfig                           |  16 +-
 drivers/usb/misc/Makefile                          |   2 +-
 drivers/usb/misc/onboard_usb_dev.c                 | 519 +++++++++++++++++++++
 .../misc/{onboard_usb_hub.h => onboard_usb_dev.h}  |  28 +-
 ...ard_usb_hub_pdevs.c => onboard_usb_dev_pdevs.c} |  47 +-
 drivers/usb/misc/onboard_usb_hub.c                 | 504 --------------------
 include/linux/usb/onboard_dev.h                    |  18 +
 include/linux/usb/onboard_hub.h                    |  18 -
 13 files changed, 595 insertions(+), 578 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub b/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
similarity index 74%
rename from Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
rename to Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
index 42deb0552065..b06a48c3c85a 100644
--- a/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
+++ b/Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
@@ -5,4 +5,5 @@ Contact:	Matthias Kaehlcke <matthias@kaehlcke.net>
 		linux-usb@vger.kernel.org
 Description:
 		(RW) Controls whether the USB hub remains always powered
-		during system suspend or not.
\ No newline at end of file
+		during system suspend or not. This attribute is not
+		available for non-hub devices.
diff --git a/MAINTAINERS b/MAINTAINERS
index 8999497011a2..7ad556ecca40 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16297,8 +16297,8 @@ ONBOARD USB HUB DRIVER
 M:	Matthias Kaehlcke <mka@chromium.org>
 L:	linux-usb@vger.kernel.org
 S:	Maintained
-F:	Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-hub
-F:	drivers/usb/misc/onboard_usb_hub.c
+F:	Documentation/ABI/testing/sysfs-bus-platform-onboard-usb-dev
+F:	drivers/usb/misc/onboard_usb_dev.c
 
 ONENAND FLASH DRIVER
 M:	Kyungmin Park <kyungmin.park@samsung.com>
diff --git a/drivers/usb/core/Makefile b/drivers/usb/core/Makefile
index 7d338e9c0657..ac006abd13b3 100644
--- a/drivers/usb/core/Makefile
+++ b/drivers/usb/core/Makefile
@@ -12,8 +12,8 @@ usbcore-$(CONFIG_OF)		+= of.o
 usbcore-$(CONFIG_USB_PCI)		+= hcd-pci.o
 usbcore-$(CONFIG_ACPI)		+= usb-acpi.o
 
-ifdef CONFIG_USB_ONBOARD_HUB
-usbcore-y			+= ../misc/onboard_usb_hub_pdevs.o
+ifdef CONFIG_USB_ONBOARD_DEV
+usbcore-y			+= ../misc/onboard_usb_dev_pdevs.o
 endif
 
 obj-$(CONFIG_USB)		+= usbcore.o
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index ffd7c99e24a3..f85b3e928a35 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -23,7 +23,7 @@
 #include <linux/usb.h>
 #include <linux/usbdevice_fs.h>
 #include <linux/usb/hcd.h>
-#include <linux/usb/onboard_hub.h>
+#include <linux/usb/onboard_dev.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/quirks.h>
 #include <linux/workqueue.h>
@@ -1776,7 +1776,7 @@ static void hub_disconnect(struct usb_interface *intf)
 	if (hub->quirk_disable_autosuspend)
 		usb_autopm_put_interface(intf);
 
-	onboard_hub_destroy_pdevs(&hub->onboard_hub_devs);
+	onboard_dev_destroy_pdevs(&hub->onboard_devs);
 
 	kref_put(&hub->kref, hub_release);
 }
@@ -1895,7 +1895,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	INIT_DELAYED_WORK(&hub->leds, led_work);
 	INIT_DELAYED_WORK(&hub->init_work, NULL);
 	INIT_WORK(&hub->events, hub_event);
-	INIT_LIST_HEAD(&hub->onboard_hub_devs);
+	INIT_LIST_HEAD(&hub->onboard_devs);
 	spin_lock_init(&hub->irq_urb_lock);
 	timer_setup(&hub->irq_urb_retry, hub_retry_irq_urb, 0);
 	usb_get_intf(intf);
@@ -1925,7 +1925,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	}
 
 	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
-		onboard_hub_create_pdevs(hdev, &hub->onboard_hub_devs);
+		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
 
 		return 0;
 	}
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 43ce21c96a51..3820703b11d8 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -74,7 +74,7 @@ struct usb_hub {
 	spinlock_t		irq_urb_lock;
 	struct timer_list	irq_urb_retry;
 	struct usb_port		**ports;
-	struct list_head        onboard_hub_devs;
+	struct list_head        onboard_devs;
 };
 
 /**
diff --git a/drivers/usb/misc/Kconfig b/drivers/usb/misc/Kconfig
index c510af7baa0d..50b86d531701 100644
--- a/drivers/usb/misc/Kconfig
+++ b/drivers/usb/misc/Kconfig
@@ -316,18 +316,18 @@ config BRCM_USB_PINMAP
 	  signals, which are typically on dedicated pins on the chip,
 	  to any gpio.
 
-config USB_ONBOARD_HUB
-	tristate "Onboard USB hub support"
+config USB_ONBOARD_DEV
+	tristate "Onboard USB device support"
 	depends on OF
 	help
-	  Say Y here if you want to support discrete onboard USB hubs that
-	  don't require an additional control bus for initialization, but
-	  need some non-trivial form of initialization, such as enabling a
-	  power regulator. An example for such a hub is the Realtek
-	  RTS5411.
+	  Say Y here if you want to support discrete onboard USB devices
+	  that don't require an additional control bus for initialization,
+	  but need some non-trivial form of initialization, such as
+	  enabling a power regulator. An example for such device is the
+	  Realtek RTS5411 hub.
 
 	  This driver can be used as a module but its state (module vs
 	  builtin) must match the state of the USB subsystem. Enabling
 	  this config will enable the driver and it will automatically
 	  match the state of the USB subsystem. If this driver is a
-	  module it will be called onboard_usb_hub.
+	  module it will be called onboard_usb_dev.
diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
index 0bc732bcb162..0cd5bc8f52fe 100644
--- a/drivers/usb/misc/Makefile
+++ b/drivers/usb/misc/Makefile
@@ -33,4 +33,4 @@ obj-$(CONFIG_USB_CHAOSKEY)		+= chaoskey.o
 obj-$(CONFIG_USB_SISUSBVGA)		+= sisusbvga/
 obj-$(CONFIG_USB_LINK_LAYER_TEST)	+= lvstest.o
 obj-$(CONFIG_BRCM_USB_PINMAP)		+= brcmstb-usb-pinmap.o
-obj-$(CONFIG_USB_ONBOARD_HUB)		+= onboard_usb_hub.o
+obj-$(CONFIG_USB_ONBOARD_DEV)		+= onboard_usb_dev.o
diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
new file mode 100644
index 000000000000..4ae580445408
--- /dev/null
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -0,0 +1,519 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for onboard USB devices
+ *
+ * Copyright (c) 2022, Google LLC
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/suspend.h>
+#include <linux/sysfs.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+#include <linux/usb/onboard_dev.h>
+#include <linux/workqueue.h>
+
+#include "onboard_usb_dev.h"
+
+static void onboard_dev_attach_usb_driver(struct work_struct *work);
+
+static struct usb_device_driver onboard_dev_usbdev_driver;
+static DECLARE_WORK(attach_usb_driver_work, onboard_dev_attach_usb_driver);
+
+/************************** Platform driver **************************/
+
+struct usbdev_node {
+	struct usb_device *udev;
+	struct list_head list;
+};
+
+struct onboard_dev {
+	struct regulator_bulk_data supplies[MAX_SUPPLIES];
+	struct device *dev;
+	const struct onboard_dev_pdata *pdata;
+	struct gpio_desc *reset_gpio;
+	bool always_powered_in_suspend;
+	bool is_powered_on;
+	bool going_away;
+	struct list_head udev_list;
+	struct mutex lock;
+	struct clk *clk;
+};
+
+static int onboard_dev_get_regulators(struct onboard_dev *onboard_dev)
+{
+	const char * const *supply_names = onboard_dev->pdata->supply_names;
+	unsigned int num_supplies = onboard_dev->pdata->num_supplies;
+	struct device *dev = onboard_dev->dev;
+	unsigned int i;
+	int err;
+
+	if (num_supplies > MAX_SUPPLIES)
+		return dev_err_probe(dev, -EINVAL, "max %d supplies supported!\n",
+				     MAX_SUPPLIES);
+
+	for (i = 0; i < num_supplies; i++)
+		onboard_dev->supplies[i].supply = supply_names[i];
+
+	err = devm_regulator_bulk_get(dev, num_supplies, onboard_dev->supplies);
+	if (err)
+		dev_err(dev, "Failed to get regulator supplies: %pe\n",
+			ERR_PTR(err));
+
+	return err;
+}
+
+static int onboard_dev_power_on(struct onboard_dev *onboard_dev)
+{
+	int err;
+
+	err = clk_prepare_enable(onboard_dev->clk);
+	if (err) {
+		dev_err(onboard_dev->dev, "failed to enable clock: %pe\n",
+			ERR_PTR(err));
+		return err;
+	}
+
+	err = regulator_bulk_enable(onboard_dev->pdata->num_supplies,
+				    onboard_dev->supplies);
+	if (err) {
+		dev_err(onboard_dev->dev, "failed to enable supplies: %pe\n",
+			ERR_PTR(err));
+		return err;
+	}
+
+	fsleep(onboard_dev->pdata->reset_us);
+	gpiod_set_value_cansleep(onboard_dev->reset_gpio, 0);
+
+	onboard_dev->is_powered_on = true;
+
+	return 0;
+}
+
+static int onboard_dev_power_off(struct onboard_dev *onboard_dev)
+{
+	int err;
+
+	gpiod_set_value_cansleep(onboard_dev->reset_gpio, 1);
+
+	err = regulator_bulk_disable(onboard_dev->pdata->num_supplies,
+				     onboard_dev->supplies);
+	if (err) {
+		dev_err(onboard_dev->dev, "failed to disable supplies: %pe\n",
+			ERR_PTR(err));
+		return err;
+	}
+
+	clk_disable_unprepare(onboard_dev->clk);
+
+	onboard_dev->is_powered_on = false;
+
+	return 0;
+}
+
+static int __maybe_unused onboard_dev_suspend(struct device *dev)
+{
+	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
+	struct usbdev_node *node;
+	bool power_off = true;
+
+	if (onboard_dev->always_powered_in_suspend)
+		return 0;
+
+	mutex_lock(&onboard_dev->lock);
+
+	list_for_each_entry(node, &onboard_dev->udev_list, list) {
+		if (!device_may_wakeup(node->udev->bus->controller))
+			continue;
+
+		if (usb_wakeup_enabled_descendants(node->udev)) {
+			power_off = false;
+			break;
+		}
+	}
+
+	mutex_unlock(&onboard_dev->lock);
+
+	if (!power_off)
+		return 0;
+
+	return onboard_dev_power_off(onboard_dev);
+}
+
+static int __maybe_unused onboard_dev_resume(struct device *dev)
+{
+	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
+
+	if (onboard_dev->is_powered_on)
+		return 0;
+
+	return onboard_dev_power_on(onboard_dev);
+}
+
+static inline void get_udev_link_name(const struct usb_device *udev, char *buf,
+				      size_t size)
+{
+	snprintf(buf, size, "usb_dev.%s", dev_name(&udev->dev));
+}
+
+static int onboard_dev_add_usbdev(struct onboard_dev *onboard_dev,
+				  struct usb_device *udev)
+{
+	struct usbdev_node *node;
+	char link_name[64];
+	int err;
+
+	mutex_lock(&onboard_dev->lock);
+
+	if (onboard_dev->going_away) {
+		err = -EINVAL;
+		goto error;
+	}
+
+	node = kzalloc(sizeof(*node), GFP_KERNEL);
+	if (!node) {
+		err = -ENOMEM;
+		goto error;
+	}
+
+	node->udev = udev;
+
+	list_add(&node->list, &onboard_dev->udev_list);
+
+	mutex_unlock(&onboard_dev->lock);
+
+	get_udev_link_name(udev, link_name, sizeof(link_name));
+	WARN_ON(sysfs_create_link(&onboard_dev->dev->kobj, &udev->dev.kobj,
+				  link_name));
+
+	return 0;
+
+error:
+	mutex_unlock(&onboard_dev->lock);
+
+	return err;
+}
+
+static void onboard_dev_remove_usbdev(struct onboard_dev *onboard_dev,
+				      const struct usb_device *udev)
+{
+	struct usbdev_node *node;
+	char link_name[64];
+
+	get_udev_link_name(udev, link_name, sizeof(link_name));
+	sysfs_remove_link(&onboard_dev->dev->kobj, link_name);
+
+	mutex_lock(&onboard_dev->lock);
+
+	list_for_each_entry(node, &onboard_dev->udev_list, list) {
+		if (node->udev == udev) {
+			list_del(&node->list);
+			kfree(node);
+			break;
+		}
+	}
+
+	mutex_unlock(&onboard_dev->lock);
+}
+
+static ssize_t always_powered_in_suspend_show(struct device *dev,
+					      struct device_attribute *attr,
+					      char *buf)
+{
+	const struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", onboard_dev->always_powered_in_suspend);
+}
+
+static ssize_t always_powered_in_suspend_store(struct device *dev,
+					       struct device_attribute *attr,
+					       const char *buf, size_t count)
+{
+	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
+	bool val;
+	int ret;
+
+	ret = kstrtobool(buf, &val);
+	if (ret < 0)
+		return ret;
+
+	onboard_dev->always_powered_in_suspend = val;
+
+	return count;
+}
+static DEVICE_ATTR_RW(always_powered_in_suspend);
+
+static struct attribute *onboard_dev_attrs[] = {
+	&dev_attr_always_powered_in_suspend.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(onboard_dev);
+
+static void onboard_dev_attach_usb_driver(struct work_struct *work)
+{
+	int err;
+
+	err = driver_attach(&onboard_dev_usbdev_driver.driver);
+	if (err)
+		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
+}
+
+static int onboard_dev_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct onboard_dev *onboard_dev;
+	int err;
+
+	onboard_dev = devm_kzalloc(dev, sizeof(*onboard_dev), GFP_KERNEL);
+	if (!onboard_dev)
+		return -ENOMEM;
+
+	onboard_dev->pdata = device_get_match_data(dev);
+	if (!onboard_dev->pdata)
+		return -EINVAL;
+
+	onboard_dev->dev = dev;
+
+	err = onboard_dev_get_regulators(onboard_dev);
+	if (err)
+		return err;
+
+	onboard_dev->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(onboard_dev->clk))
+		return dev_err_probe(dev, PTR_ERR(onboard_dev->clk),
+				     "failed to get clock\n");
+
+	onboard_dev->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+							  GPIOD_OUT_HIGH);
+	if (IS_ERR(onboard_dev->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(onboard_dev->reset_gpio),
+				     "failed to get reset GPIO\n");
+
+	mutex_init(&onboard_dev->lock);
+	INIT_LIST_HEAD(&onboard_dev->udev_list);
+
+	dev_set_drvdata(dev, onboard_dev);
+
+	err = onboard_dev_power_on(onboard_dev);
+	if (err)
+		return err;
+
+	/*
+	 * The USB driver might have been detached from the USB devices by
+	 * onboard_dev_remove() (e.g. through an 'unbind' by userspace),
+	 * make sure to re-attach it if needed.
+	 *
+	 * This needs to be done deferred to avoid self-deadlocks on systems
+	 * with nested onboard hubs.
+	 */
+	schedule_work(&attach_usb_driver_work);
+
+	return 0;
+}
+
+static void onboard_dev_remove(struct platform_device *pdev)
+{
+	struct onboard_dev *onboard_dev = dev_get_drvdata(&pdev->dev);
+	struct usbdev_node *node;
+	struct usb_device *udev;
+
+	onboard_dev->going_away = true;
+
+	mutex_lock(&onboard_dev->lock);
+
+	/* unbind the USB devices to avoid dangling references to this device */
+	while (!list_empty(&onboard_dev->udev_list)) {
+		node = list_first_entry(&onboard_dev->udev_list,
+					struct usbdev_node, list);
+		udev = node->udev;
+
+		/*
+		 * Unbinding the driver will call onboard_dev_remove_usbdev(),
+		 * which acquires onboard_dev->lock. We must release the lock
+		 * first.
+		 */
+		get_device(&udev->dev);
+		mutex_unlock(&onboard_dev->lock);
+		device_release_driver(&udev->dev);
+		put_device(&udev->dev);
+		mutex_lock(&onboard_dev->lock);
+	}
+
+	mutex_unlock(&onboard_dev->lock);
+
+	onboard_dev_power_off(onboard_dev);
+}
+
+MODULE_DEVICE_TABLE(of, onboard_dev_match);
+
+static const struct dev_pm_ops __maybe_unused onboard_dev_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(onboard_dev_suspend, onboard_dev_resume)
+};
+
+static struct platform_driver onboard_dev_driver = {
+	.probe = onboard_dev_probe,
+	.remove_new = onboard_dev_remove,
+
+	.driver = {
+		.name = "onboard-usb-dev",
+		.of_match_table = onboard_dev_match,
+		.pm = pm_ptr(&onboard_dev_pm_ops),
+		.dev_groups = onboard_dev_groups,
+	},
+};
+
+/************************** USB driver **************************/
+
+#define VENDOR_ID_CYPRESS	0x04b4
+#define VENDOR_ID_GENESYS	0x05e3
+#define VENDOR_ID_MICROCHIP	0x0424
+#define VENDOR_ID_REALTEK	0x0bda
+#define VENDOR_ID_TI		0x0451
+#define VENDOR_ID_VIA		0x2109
+
+/*
+ * Returns the onboard_dev platform device that is associated with the USB
+ * device passed as parameter.
+ */
+static struct onboard_dev *_find_onboard_dev(struct device *dev)
+{
+	struct platform_device *pdev;
+	struct device_node *np;
+	struct onboard_dev *onboard_dev;
+
+	pdev = of_find_device_by_node(dev->of_node);
+	if (!pdev) {
+		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
+		if (!np) {
+			dev_err(dev, "failed to find device node for peer hub\n");
+			return ERR_PTR(-EINVAL);
+		}
+
+		pdev = of_find_device_by_node(np);
+		of_node_put(np);
+
+		if (!pdev)
+			return ERR_PTR(-ENODEV);
+	}
+
+	onboard_dev = dev_get_drvdata(&pdev->dev);
+	put_device(&pdev->dev);
+
+	/*
+	 * The presence of drvdata indicates that the platform driver finished
+	 * probing. This handles the case where (conceivably) we could be
+	 * running at the exact same time as the platform driver's probe. If
+	 * we detect the race we request probe deferral and we'll come back and
+	 * try again.
+	 */
+	if (!onboard_dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	return onboard_dev;
+}
+
+static int onboard_dev_usbdev_probe(struct usb_device *udev)
+{
+	struct device *dev = &udev->dev;
+	struct onboard_dev *onboard_dev;
+	int err;
+
+	/* ignore supported devices without device tree node */
+	if (!dev->of_node)
+		return -ENODEV;
+
+	onboard_dev = _find_onboard_dev(dev);
+	if (IS_ERR(onboard_dev))
+		return PTR_ERR(onboard_dev);
+
+	dev_set_drvdata(dev, onboard_dev);
+
+	err = onboard_dev_add_usbdev(onboard_dev, udev);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static void onboard_dev_usbdev_disconnect(struct usb_device *udev)
+{
+	struct onboard_dev *onboard_dev = dev_get_drvdata(&udev->dev);
+
+	onboard_dev_remove_usbdev(onboard_dev, udev);
+}
+
+static const struct usb_device_id onboard_dev_id_table[] = {
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6504) }, /* CYUSB33{0,1,2}x/CYUSB230x 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6506) }, /* CYUSB33{0,1,2}x/CYUSB230x 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6570) }, /* CY7C6563x 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 HUB */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2744) }, /* USB5744 USB 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x5744) }, /* USB5744 USB 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 HUB */
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 HUB */
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 HUB */
+	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 HUB */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 HUB */
+	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 HUB */
+	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 HUB */
+	{}
+};
+MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
+
+static struct usb_device_driver onboard_dev_usbdev_driver = {
+	.name = "onboard-usb-dev",
+	.probe = onboard_dev_usbdev_probe,
+	.disconnect = onboard_dev_usbdev_disconnect,
+	.generic_subclass = 1,
+	.supports_autosuspend =	1,
+	.id_table = onboard_dev_id_table,
+};
+
+static int __init onboard_dev_init(void)
+{
+	int ret;
+
+	ret = usb_register_device_driver(&onboard_dev_usbdev_driver, THIS_MODULE);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&onboard_dev_driver);
+	if (ret)
+		usb_deregister_device_driver(&onboard_dev_usbdev_driver);
+
+	return ret;
+}
+module_init(onboard_dev_init);
+
+static void __exit onboard_dev_exit(void)
+{
+	usb_deregister_device_driver(&onboard_dev_usbdev_driver);
+	platform_driver_unregister(&onboard_dev_driver);
+
+	cancel_work_sync(&attach_usb_driver_work);
+}
+module_exit(onboard_dev_exit);
+
+MODULE_AUTHOR("Matthias Kaehlcke <mka@chromium.org>");
+MODULE_DESCRIPTION("Driver for discrete onboard USB devices");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_dev.h
similarity index 74%
rename from drivers/usb/misc/onboard_usb_hub.h
rename to drivers/usb/misc/onboard_usb_dev.h
index 0ee515e7feae..4da9f3b7f9e9 100644
--- a/drivers/usb/misc/onboard_usb_hub.h
+++ b/drivers/usb/misc/onboard_usb_dev.h
@@ -3,72 +3,72 @@
  * Copyright (c) 2022, Google LLC
  */
 
-#ifndef _USB_MISC_ONBOARD_USB_HUB_H
-#define _USB_MISC_ONBOARD_USB_HUB_H
+#ifndef _USB_MISC_ONBOARD_USB_DEV_H
+#define _USB_MISC_ONBOARD_USB_DEV_H
 
 #define MAX_SUPPLIES 2
 
-struct onboard_hub_pdata {
+struct onboard_dev_pdata {
 	unsigned long reset_us;		/* reset pulse width in us */
 	unsigned int num_supplies;	/* number of supplies */
 	const char * const supply_names[MAX_SUPPLIES];
 };
 
-static const struct onboard_hub_pdata microchip_usb424_data = {
+static const struct onboard_dev_pdata microchip_usb424_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
 };
 
-static const struct onboard_hub_pdata microchip_usb5744_data = {
+static const struct onboard_dev_pdata microchip_usb5744_data = {
 	.reset_us = 0,
 	.num_supplies = 2,
 	.supply_names = { "vdd", "vdd2" },
 };
 
-static const struct onboard_hub_pdata realtek_rts5411_data = {
+static const struct onboard_dev_pdata realtek_rts5411_data = {
 	.reset_us = 0,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
 };
 
-static const struct onboard_hub_pdata ti_tusb8041_data = {
+static const struct onboard_dev_pdata ti_tusb8041_data = {
 	.reset_us = 3000,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
 };
 
-static const struct onboard_hub_pdata cypress_hx3_data = {
+static const struct onboard_dev_pdata cypress_hx3_data = {
 	.reset_us = 10000,
 	.num_supplies = 2,
 	.supply_names = { "vdd", "vdd2" },
 };
 
-static const struct onboard_hub_pdata cypress_hx2vl_data = {
+static const struct onboard_dev_pdata cypress_hx2vl_data = {
 	.reset_us = 1,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
 };
 
-static const struct onboard_hub_pdata genesys_gl850g_data = {
+static const struct onboard_dev_pdata genesys_gl850g_data = {
 	.reset_us = 3,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
 };
 
-static const struct onboard_hub_pdata genesys_gl852g_data = {
+static const struct onboard_dev_pdata genesys_gl852g_data = {
 	.reset_us = 50,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
 };
 
-static const struct onboard_hub_pdata vialab_vl817_data = {
+static const struct onboard_dev_pdata vialab_vl817_data = {
 	.reset_us = 10,
 	.num_supplies = 1,
 	.supply_names = { "vdd" },
 };
 
-static const struct of_device_id onboard_hub_match[] = {
+static const struct of_device_id onboard_dev_match[] = {
 	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2514", .data = &microchip_usb424_data, },
 	{ .compatible = "usb424,2517", .data = &microchip_usb424_data, },
@@ -92,4 +92,4 @@ static const struct of_device_id onboard_hub_match[] = {
 	{}
 };
 
-#endif /* _USB_MISC_ONBOARD_USB_HUB_H */
+#endif /* _USB_MISC_ONBOARD_USB_DEV_H */
diff --git a/drivers/usb/misc/onboard_usb_hub_pdevs.c b/drivers/usb/misc/onboard_usb_dev_pdevs.c
similarity index 68%
rename from drivers/usb/misc/onboard_usb_hub_pdevs.c
rename to drivers/usb/misc/onboard_usb_dev_pdevs.c
index ed22a18f4ab7..722504752ce3 100644
--- a/drivers/usb/misc/onboard_usb_hub_pdevs.c
+++ b/drivers/usb/misc/onboard_usb_dev_pdevs.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * API for creating and destroying USB onboard hub platform devices
+ * API for creating and destroying USB onboard platform devices
  *
  * Copyright (c) 2022, Google LLC
  */
@@ -15,29 +15,30 @@
 #include <linux/usb.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/of.h>
-#include <linux/usb/onboard_hub.h>
+#include <linux/usb/onboard_dev.h>
 
-#include "onboard_usb_hub.h"
+#include "onboard_usb_dev.h"
 
 struct pdev_list_entry {
 	struct platform_device *pdev;
 	struct list_head node;
 };
 
-static bool of_is_onboard_usb_hub(const struct device_node *np)
+static bool of_is_onboard_usb_dev(struct device_node *np)
 {
-	return !!of_match_node(onboard_hub_match, np);
+	return !!of_match_node(onboard_dev_match, np);
 }
 
 /**
- * onboard_hub_create_pdevs -- create platform devices for onboard USB hubs
- * @parent_hub	: parent hub to scan for connected onboard hubs
- * @pdev_list	: list of onboard hub platform devices owned by the parent hub
+ * onboard_dev_create_pdevs -- create platform devices for onboard USB devices
+ * @parent_hub	: parent hub to scan for connected onboard devices
+ * @pdev_list	: list of onboard platform devices owned by the parent hub
  *
- * Creates a platform device for each supported onboard hub that is connected to
- * the given parent hub. The platform device is in charge of initializing the
- * hub (enable regulators, take the hub out of reset, ...) and can optionally
- * control whether the hub remains powered during system suspend or not.
+ * Creates a platform device for each supported onboard device that is connected
+ * to the given parent hub. The platform device is in charge of initializing the
+ * device (enable regulators, take the device out of reset, ...). For onboard
+ * hubs, it can optionally control whether the device remains powered during
+ * system suspend or not.
  *
  * To keep track of the platform devices they are added to a list that is owned
  * by the parent hub.
@@ -50,9 +51,9 @@ static bool of_is_onboard_usb_hub(const struct device_node *np)
  * node. That means the root hubs of the primary and secondary HCD share the
  * same device tree node (the HCD node). As a result this function can be called
  * twice with the same DT node for root hubs. We only want to create a single
- * platform device for each physical onboard hub, hence for root hubs the loop
- * is only executed for the root hub of the primary HCD. Since the function
- * scans through all child nodes it still creates pdevs for onboard hubs
+ * platform device for each physical onboard device, hence for root hubs the
+ * loop is only executed for the root hub of the primary HCD. Since the function
+ * scans through all child nodes it still creates pdevs for onboard devices
  * connected to the root hub of the secondary HCD if needed.
  *
  * Further there must be only one platform device for onboard hubs with a peer
@@ -63,7 +64,7 @@ static bool of_is_onboard_usb_hub(const struct device_node *np)
  * the function processes the nodes of both peers. A platform device is only
  * created if the peer hub doesn't have one already.
  */
-void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
+void onboard_dev_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
 {
 	int i;
 	struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
@@ -82,7 +83,7 @@ void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *p
 		if (!np)
 			continue;
 
-		if (!of_is_onboard_usb_hub(np))
+		if (!of_is_onboard_usb_dev(np))
 			goto node_put;
 
 		npc = of_parse_phandle(np, "peer-hub", 0);
@@ -104,7 +105,7 @@ void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *p
 		pdev = of_platform_device_create(np, NULL, &parent_hub->dev);
 		if (!pdev) {
 			dev_err(&parent_hub->dev,
-				"failed to create platform device for onboard hub '%pOF'\n", np);
+				"failed to create platform device for onboard dev '%pOF'\n", np);
 			goto node_put;
 		}
 
@@ -121,16 +122,16 @@ void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *p
 		of_node_put(np);
 	}
 }
-EXPORT_SYMBOL_GPL(onboard_hub_create_pdevs);
+EXPORT_SYMBOL_GPL(onboard_dev_create_pdevs);
 
 /**
- * onboard_hub_destroy_pdevs -- free resources of onboard hub platform devices
- * @pdev_list	: list of onboard hub platform devices
+ * onboard_dev_destroy_pdevs -- free resources of onboard platform devices
+ * @pdev_list	: list of onboard platform devices
  *
  * Destroys the platform devices in the given list and frees the memory associated
  * with the list entry.
  */
-void onboard_hub_destroy_pdevs(struct list_head *pdev_list)
+void onboard_dev_destroy_pdevs(struct list_head *pdev_list)
 {
 	struct pdev_list_entry *pdle, *tmp;
 
@@ -140,4 +141,4 @@ void onboard_hub_destroy_pdevs(struct list_head *pdev_list)
 		kfree(pdle);
 	}
 }
-EXPORT_SYMBOL_GPL(onboard_hub_destroy_pdevs);
+EXPORT_SYMBOL_GPL(onboard_dev_destroy_pdevs);
diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
deleted file mode 100644
index 1f3e0094957d..000000000000
--- a/drivers/usb/misc/onboard_usb_hub.c
+++ /dev/null
@@ -1,504 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Driver for onboard USB hubs
- *
- * Copyright (c) 2022, Google LLC
- */
-
-#include <linux/clk.h>
-#include <linux/device.h>
-#include <linux/export.h>
-#include <linux/err.h>
-#include <linux/gpio/consumer.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
-#include <linux/list.h>
-#include <linux/module.h>
-#include <linux/mutex.h>
-#include <linux/of.h>
-#include <linux/of_platform.h>
-#include <linux/platform_device.h>
-#include <linux/regulator/consumer.h>
-#include <linux/slab.h>
-#include <linux/suspend.h>
-#include <linux/sysfs.h>
-#include <linux/usb.h>
-#include <linux/usb/hcd.h>
-#include <linux/usb/onboard_hub.h>
-#include <linux/workqueue.h>
-
-#include "onboard_usb_hub.h"
-
-static void onboard_hub_attach_usb_driver(struct work_struct *work);
-
-static struct usb_device_driver onboard_hub_usbdev_driver;
-static DECLARE_WORK(attach_usb_driver_work, onboard_hub_attach_usb_driver);
-
-/************************** Platform driver **************************/
-
-struct usbdev_node {
-	struct usb_device *udev;
-	struct list_head list;
-};
-
-struct onboard_hub {
-	struct regulator_bulk_data supplies[MAX_SUPPLIES];
-	struct device *dev;
-	const struct onboard_hub_pdata *pdata;
-	struct gpio_desc *reset_gpio;
-	bool always_powered_in_suspend;
-	bool is_powered_on;
-	bool going_away;
-	struct list_head udev_list;
-	struct mutex lock;
-	struct clk *clk;
-};
-
-static int onboard_hub_get_regulators(struct onboard_hub *hub)
-{
-	const char * const *supply_names = hub->pdata->supply_names;
-	unsigned int num_supplies = hub->pdata->num_supplies;
-	struct device *dev = hub->dev;
-	unsigned int i;
-	int err;
-
-	if (num_supplies > MAX_SUPPLIES)
-		return dev_err_probe(dev, -EINVAL, "max %d supplies supported!\n",
-				     MAX_SUPPLIES);
-
-	for (i = 0; i < num_supplies; i++)
-		hub->supplies[i].supply = supply_names[i];
-
-	err = devm_regulator_bulk_get(dev, num_supplies, hub->supplies);
-	if (err)
-		dev_err(dev, "Failed to get regulator supplies: %pe\n",
-			ERR_PTR(err));
-
-	return err;
-}
-
-static int onboard_hub_power_on(struct onboard_hub *hub)
-{
-	int err;
-
-	err = clk_prepare_enable(hub->clk);
-	if (err) {
-		dev_err(hub->dev, "failed to enable clock: %pe\n", ERR_PTR(err));
-		return err;
-	}
-
-	err = regulator_bulk_enable(hub->pdata->num_supplies, hub->supplies);
-	if (err) {
-		dev_err(hub->dev, "failed to enable supplies: %pe\n", ERR_PTR(err));
-		return err;
-	}
-
-	fsleep(hub->pdata->reset_us);
-	gpiod_set_value_cansleep(hub->reset_gpio, 0);
-
-	hub->is_powered_on = true;
-
-	return 0;
-}
-
-static int onboard_hub_power_off(struct onboard_hub *hub)
-{
-	int err;
-
-	gpiod_set_value_cansleep(hub->reset_gpio, 1);
-
-	err = regulator_bulk_disable(hub->pdata->num_supplies, hub->supplies);
-	if (err) {
-		dev_err(hub->dev, "failed to disable supplies: %pe\n", ERR_PTR(err));
-		return err;
-	}
-
-	clk_disable_unprepare(hub->clk);
-
-	hub->is_powered_on = false;
-
-	return 0;
-}
-
-static int __maybe_unused onboard_hub_suspend(struct device *dev)
-{
-	struct onboard_hub *hub = dev_get_drvdata(dev);
-	struct usbdev_node *node;
-	bool power_off = true;
-
-	if (hub->always_powered_in_suspend)
-		return 0;
-
-	mutex_lock(&hub->lock);
-
-	list_for_each_entry(node, &hub->udev_list, list) {
-		if (!device_may_wakeup(node->udev->bus->controller))
-			continue;
-
-		if (usb_wakeup_enabled_descendants(node->udev)) {
-			power_off = false;
-			break;
-		}
-	}
-
-	mutex_unlock(&hub->lock);
-
-	if (!power_off)
-		return 0;
-
-	return onboard_hub_power_off(hub);
-}
-
-static int __maybe_unused onboard_hub_resume(struct device *dev)
-{
-	struct onboard_hub *hub = dev_get_drvdata(dev);
-
-	if (hub->is_powered_on)
-		return 0;
-
-	return onboard_hub_power_on(hub);
-}
-
-static inline void get_udev_link_name(const struct usb_device *udev, char *buf, size_t size)
-{
-	snprintf(buf, size, "usb_dev.%s", dev_name(&udev->dev));
-}
-
-static int onboard_hub_add_usbdev(struct onboard_hub *hub, struct usb_device *udev)
-{
-	struct usbdev_node *node;
-	char link_name[64];
-	int err;
-
-	mutex_lock(&hub->lock);
-
-	if (hub->going_away) {
-		err = -EINVAL;
-		goto error;
-	}
-
-	node = kzalloc(sizeof(*node), GFP_KERNEL);
-	if (!node) {
-		err = -ENOMEM;
-		goto error;
-	}
-
-	node->udev = udev;
-
-	list_add(&node->list, &hub->udev_list);
-
-	mutex_unlock(&hub->lock);
-
-	get_udev_link_name(udev, link_name, sizeof(link_name));
-	WARN_ON(sysfs_create_link(&hub->dev->kobj, &udev->dev.kobj, link_name));
-
-	return 0;
-
-error:
-	mutex_unlock(&hub->lock);
-
-	return err;
-}
-
-static void onboard_hub_remove_usbdev(struct onboard_hub *hub, const struct usb_device *udev)
-{
-	struct usbdev_node *node;
-	char link_name[64];
-
-	get_udev_link_name(udev, link_name, sizeof(link_name));
-	sysfs_remove_link(&hub->dev->kobj, link_name);
-
-	mutex_lock(&hub->lock);
-
-	list_for_each_entry(node, &hub->udev_list, list) {
-		if (node->udev == udev) {
-			list_del(&node->list);
-			kfree(node);
-			break;
-		}
-	}
-
-	mutex_unlock(&hub->lock);
-}
-
-static ssize_t always_powered_in_suspend_show(struct device *dev, struct device_attribute *attr,
-			   char *buf)
-{
-	const struct onboard_hub *hub = dev_get_drvdata(dev);
-
-	return sysfs_emit(buf, "%d\n", hub->always_powered_in_suspend);
-}
-
-static ssize_t always_powered_in_suspend_store(struct device *dev, struct device_attribute *attr,
-			    const char *buf, size_t count)
-{
-	struct onboard_hub *hub = dev_get_drvdata(dev);
-	bool val;
-	int ret;
-
-	ret = kstrtobool(buf, &val);
-	if (ret < 0)
-		return ret;
-
-	hub->always_powered_in_suspend = val;
-
-	return count;
-}
-static DEVICE_ATTR_RW(always_powered_in_suspend);
-
-static struct attribute *onboard_hub_attrs[] = {
-	&dev_attr_always_powered_in_suspend.attr,
-	NULL,
-};
-ATTRIBUTE_GROUPS(onboard_hub);
-
-static void onboard_hub_attach_usb_driver(struct work_struct *work)
-{
-	int err;
-
-	err = driver_attach(&onboard_hub_usbdev_driver.driver);
-	if (err)
-		pr_err("Failed to attach USB driver: %pe\n", ERR_PTR(err));
-}
-
-static int onboard_hub_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct onboard_hub *hub;
-	int err;
-
-	hub = devm_kzalloc(dev, sizeof(*hub), GFP_KERNEL);
-	if (!hub)
-		return -ENOMEM;
-
-	hub->pdata = device_get_match_data(dev);
-	if (!hub->pdata)
-		return -EINVAL;
-
-	hub->dev = dev;
-
-	err = onboard_hub_get_regulators(hub);
-	if (err)
-		return err;
-
-	hub->clk = devm_clk_get_optional(dev, NULL);
-	if (IS_ERR(hub->clk))
-		return dev_err_probe(dev, PTR_ERR(hub->clk), "failed to get clock\n");
-
-	hub->reset_gpio = devm_gpiod_get_optional(dev, "reset",
-						  GPIOD_OUT_HIGH);
-	if (IS_ERR(hub->reset_gpio))
-		return dev_err_probe(dev, PTR_ERR(hub->reset_gpio), "failed to get reset GPIO\n");
-
-	mutex_init(&hub->lock);
-	INIT_LIST_HEAD(&hub->udev_list);
-
-	dev_set_drvdata(dev, hub);
-
-	err = onboard_hub_power_on(hub);
-	if (err)
-		return err;
-
-	/*
-	 * The USB driver might have been detached from the USB devices by
-	 * onboard_hub_remove() (e.g. through an 'unbind' by userspace),
-	 * make sure to re-attach it if needed.
-	 *
-	 * This needs to be done deferred to avoid self-deadlocks on systems
-	 * with nested onboard hubs.
-	 */
-	schedule_work(&attach_usb_driver_work);
-
-	return 0;
-}
-
-static void onboard_hub_remove(struct platform_device *pdev)
-{
-	struct onboard_hub *hub = dev_get_drvdata(&pdev->dev);
-	struct usbdev_node *node;
-	struct usb_device *udev;
-
-	hub->going_away = true;
-
-	mutex_lock(&hub->lock);
-
-	/* unbind the USB devices to avoid dangling references to this device */
-	while (!list_empty(&hub->udev_list)) {
-		node = list_first_entry(&hub->udev_list, struct usbdev_node, list);
-		udev = node->udev;
-
-		/*
-		 * Unbinding the driver will call onboard_hub_remove_usbdev(),
-		 * which acquires hub->lock.  We must release the lock first.
-		 */
-		get_device(&udev->dev);
-		mutex_unlock(&hub->lock);
-		device_release_driver(&udev->dev);
-		put_device(&udev->dev);
-		mutex_lock(&hub->lock);
-	}
-
-	mutex_unlock(&hub->lock);
-
-	onboard_hub_power_off(hub);
-}
-
-MODULE_DEVICE_TABLE(of, onboard_hub_match);
-
-static const struct dev_pm_ops __maybe_unused onboard_hub_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(onboard_hub_suspend, onboard_hub_resume)
-};
-
-static struct platform_driver onboard_hub_driver = {
-	.probe = onboard_hub_probe,
-	.remove_new = onboard_hub_remove,
-
-	.driver = {
-		.name = "onboard-usb-hub",
-		.of_match_table = onboard_hub_match,
-		.pm = pm_ptr(&onboard_hub_pm_ops),
-		.dev_groups = onboard_hub_groups,
-	},
-};
-
-/************************** USB driver **************************/
-
-#define VENDOR_ID_CYPRESS	0x04b4
-#define VENDOR_ID_GENESYS	0x05e3
-#define VENDOR_ID_MICROCHIP	0x0424
-#define VENDOR_ID_REALTEK	0x0bda
-#define VENDOR_ID_TI		0x0451
-#define VENDOR_ID_VIA		0x2109
-
-/*
- * Returns the onboard_hub platform device that is associated with the USB
- * device passed as parameter.
- */
-static struct onboard_hub *_find_onboard_hub(struct device *dev)
-{
-	struct platform_device *pdev;
-	struct device_node *np;
-	struct onboard_hub *hub;
-
-	pdev = of_find_device_by_node(dev->of_node);
-	if (!pdev) {
-		np = of_parse_phandle(dev->of_node, "peer-hub", 0);
-		if (!np) {
-			dev_err(dev, "failed to find device node for peer hub\n");
-			return ERR_PTR(-EINVAL);
-		}
-
-		pdev = of_find_device_by_node(np);
-		of_node_put(np);
-
-		if (!pdev)
-			return ERR_PTR(-ENODEV);
-	}
-
-	hub = dev_get_drvdata(&pdev->dev);
-	put_device(&pdev->dev);
-
-	/*
-	 * The presence of drvdata ('hub') indicates that the platform driver
-	 * finished probing. This handles the case where (conceivably) we could
-	 * be running at the exact same time as the platform driver's probe. If
-	 * we detect the race we request probe deferral and we'll come back and
-	 * try again.
-	 */
-	if (!hub)
-		return ERR_PTR(-EPROBE_DEFER);
-
-	return hub;
-}
-
-static int onboard_hub_usbdev_probe(struct usb_device *udev)
-{
-	struct device *dev = &udev->dev;
-	struct onboard_hub *hub;
-	int err;
-
-	/* ignore supported hubs without device tree node */
-	if (!dev->of_node)
-		return -ENODEV;
-
-	hub = _find_onboard_hub(dev);
-	if (IS_ERR(hub))
-		return PTR_ERR(hub);
-
-	dev_set_drvdata(dev, hub);
-
-	err = onboard_hub_add_usbdev(hub, udev);
-	if (err)
-		return err;
-
-	return 0;
-}
-
-static void onboard_hub_usbdev_disconnect(struct usb_device *udev)
-{
-	struct onboard_hub *hub = dev_get_drvdata(&udev->dev);
-
-	onboard_hub_remove_usbdev(hub, udev);
-}
-
-static const struct usb_device_id onboard_hub_id_table[] = {
-	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6504) }, /* CYUSB33{0,1,2}x/CYUSB230x 3.0 */
-	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6506) }, /* CYUSB33{0,1,2}x/CYUSB230x 2.0 */
-	{ USB_DEVICE(VENDOR_ID_CYPRESS, 0x6570) }, /* CY7C6563x 2.0 */
-	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0608) }, /* Genesys Logic GL850G USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0610) }, /* Genesys Logic GL852G USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_GENESYS, 0x0620) }, /* Genesys Logic GL3523 USB 3.1 */
-	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2412) }, /* USB2412 USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2514) }, /* USB2514B USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2517) }, /* USB2517 USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x2744) }, /* USB5744 USB 2.0 */
-	{ USB_DEVICE(VENDOR_ID_MICROCHIP, 0x5744) }, /* USB5744 USB 3.0 */
-	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0411) }, /* RTS5411 USB 3.1 */
-	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5411) }, /* RTS5411 USB 2.1 */
-	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x0414) }, /* RTS5414 USB 3.2 */
-	{ USB_DEVICE(VENDOR_ID_REALTEK, 0x5414) }, /* RTS5414 USB 2.1 */
-	{ USB_DEVICE(VENDOR_ID_TI, 0x8140) }, /* TI USB8041 3.0 */
-	{ USB_DEVICE(VENDOR_ID_TI, 0x8142) }, /* TI USB8041 2.0 */
-	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 */
-	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 */
-	{}
-};
-MODULE_DEVICE_TABLE(usb, onboard_hub_id_table);
-
-static struct usb_device_driver onboard_hub_usbdev_driver = {
-	.name = "onboard-usb-hub",
-	.probe = onboard_hub_usbdev_probe,
-	.disconnect = onboard_hub_usbdev_disconnect,
-	.generic_subclass = 1,
-	.supports_autosuspend =	1,
-	.id_table = onboard_hub_id_table,
-};
-
-static int __init onboard_hub_init(void)
-{
-	int ret;
-
-	ret = usb_register_device_driver(&onboard_hub_usbdev_driver, THIS_MODULE);
-	if (ret)
-		return ret;
-
-	ret = platform_driver_register(&onboard_hub_driver);
-	if (ret)
-		usb_deregister_device_driver(&onboard_hub_usbdev_driver);
-
-	return ret;
-}
-module_init(onboard_hub_init);
-
-static void __exit onboard_hub_exit(void)
-{
-	usb_deregister_device_driver(&onboard_hub_usbdev_driver);
-	platform_driver_unregister(&onboard_hub_driver);
-
-	cancel_work_sync(&attach_usb_driver_work);
-}
-module_exit(onboard_hub_exit);
-
-MODULE_AUTHOR("Matthias Kaehlcke <mka@chromium.org>");
-MODULE_DESCRIPTION("Driver for discrete onboard USB hubs");
-MODULE_LICENSE("GPL v2");
diff --git a/include/linux/usb/onboard_dev.h b/include/linux/usb/onboard_dev.h
new file mode 100644
index 000000000000..b79db6d193c8
--- /dev/null
+++ b/include/linux/usb/onboard_dev.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_USB_ONBOARD_DEV_H
+#define __LINUX_USB_ONBOARD_DEV_H
+
+struct usb_device;
+struct list_head;
+
+#if IS_ENABLED(CONFIG_USB_ONBOARD_DEV)
+void onboard_dev_create_pdevs(struct usb_device *parent_dev, struct list_head *pdev_list);
+void onboard_dev_destroy_pdevs(struct list_head *pdev_list);
+#else
+static inline void onboard_dev_create_pdevs(struct usb_device *parent_dev,
+					    struct list_head *pdev_list) {}
+static inline void onboard_dev_destroy_pdevs(struct list_head *pdev_list) {}
+#endif
+
+#endif /* __LINUX_USB_ONBOARD_DEV_H */
diff --git a/include/linux/usb/onboard_hub.h b/include/linux/usb/onboard_hub.h
deleted file mode 100644
index d9373230556e..000000000000
--- a/include/linux/usb/onboard_hub.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __LINUX_USB_ONBOARD_HUB_H
-#define __LINUX_USB_ONBOARD_HUB_H
-
-struct usb_device;
-struct list_head;
-
-#if IS_ENABLED(CONFIG_USB_ONBOARD_HUB)
-void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list);
-void onboard_hub_destroy_pdevs(struct list_head *pdev_list);
-#else
-static inline void onboard_hub_create_pdevs(struct usb_device *parent_hub,
-					    struct list_head *pdev_list) {}
-static inline void onboard_hub_destroy_pdevs(struct list_head *pdev_list) {}
-#endif
-
-#endif /* __LINUX_USB_ONBOARD_HUB_H */

-- 
2.40.1

