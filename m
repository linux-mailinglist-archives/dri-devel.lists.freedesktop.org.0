Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A92A86C39E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D1110E30F;
	Thu, 29 Feb 2024 08:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="uRBzs480";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2103.outbound.protection.outlook.com [40.107.7.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D78CA10E116
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:35:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJPxuNOtYXjyDRnewh9YIgbVh7+fEEW33t4QVZ3rWzGjDpSz9Q5ts7xM+rlrSN3GVcb6xIRJ53dc+dyEkY3GVrnwV8pcvR2A7uo5hNoo9p6G0O38AMxt57/UZZt+OeI4ZMP/316SOfN/grgoAafW/ph+H7g0wXeR9iKegnP3eV3pQ7I472Sf96WxsTIDjplj50c5AEAiEGb02chRHPIyW45tnNY9/Ne+MjvbbEBtaP51gG24Shqe1BqTCaMqcRYsGerUKObPpjM+NFqYYdRc3OPpfvey0EwV8r1OiY8KhDR0jXlnoKOaSjDI8pFiASqX7bfjR1GEDdm6qE+PsY9CCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbaOGiQnqMim73n95NNuOUW1VNxYpJ3bWE0RQMANOTk=;
 b=dCW/PNuBcz2M38OqUEy9u+9wIYxuc3zxS8+GDRE9/DyIuSODvlyaWTrMxZPNgckeZAHXO48bsrfagDjVeCi7abMOwj95XtdWiGBDHzudvsjCjTuEwyBsElxbysRTFKAayMbGdoSVIrzzcBW6FrQQfTfggAqxGtaaeUdun0Rpo3d9f7tS08CIfaFf1x3A8DYNHHrsztF2bOwoZnX5dbwu7VMBeKHLwKmen4YBgvYNcFc17M5nXR7v0/gitC75ceOtcLvceR6ynD5VmNnuM172+xmInFL9rQj6L3c+BbQTGCOcgAx2AcQ37JR0CfUd3yYnV3NuFxl7U0/WVws1qBYw9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbaOGiQnqMim73n95NNuOUW1VNxYpJ3bWE0RQMANOTk=;
 b=uRBzs480iC+cEz8NzNBQX9r55+TNVAATyiJB56f+ZsNdYF7Hib1Wpag5X6rIPNTwfFgHKDanMshpG3bvfbU4zp2r8GM4hSKHzauRWdK3QtJDedi4r3AWaPeWgKT5rc4YCDZK5K7feH9J+0B/YMMkPEen6C+SqGXHlNPoTUSn1LE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DU0PR08MB9727.eurprd08.prod.outlook.com (2603:10a6:10:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 08:34:58 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 08:34:58 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Thu, 29 Feb 2024 09:34:48 +0100
Subject: [PATCH v6 5/9] arm64: defconfig: update ONBOARD_USB_HUB to
 ONBOARD_USB_DEV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-onboard_xvf3500-v6-5-a0aff2947040@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709195691; l=792;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=Hn7W5NquFOfa2SPwHz+COI8OES/VcCwNF5nc43UmJR0=;
 b=u/LaO/chcN7lQmro8tWIQuhtfMBKpyFt8WvecRDdKVmHicLy5a93QgvGABSxw6XtmCH+/mhci
 Yvn2qBORU0TAI3RpdhjjwexzKwCt4tH9VraX6uF05EHi2SEBv47Z2k8
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DU0PR08MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: 22726d13-4f38-4a31-7095-08dc39015071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ZpNKC8WfoQFAwFfVnwqRM+DONeSaAJqEctX/09gZIZQxfWbKJ5HOQ011XXZdGB9LQ0h9fTYdqCUux9INaiIaXFHNlZrZKUplVNUJP4vf70h+gBBdqn0ut+VfX+pbQNQGlbq3xtRjlLVHxsKxAUwEWFhoK0g/8BPDKHFvl2Y4B5rifdmsknRPczH7KuUkH1imphUNxatpGwV4Y5sg8w1oMLNX1/+P9C4DcR82wWZGBpu86jXS8n3zLGYh1LjYsgaO6Wxt5oR8Iru4JXTw+M+1mX9Pyx6e7QM8rERkakxCLwSmpWy0LK1QMstyGgudnlmhndVh/SMXSjq3Lhv1HtStf2TgQjNoDaQrZkl0FVZWa9a5vBeNoD1t652JfPuSS3PeWmTnmijP8cOgOAsf2aLtOX/SonnVufXv9j8dNd58nOsH1P/rozyKkXAIwqJp/nEr374ehZUG2Scls5jgK9wLzoPEq0RSegPt69zVnSK6KwBp21kTn/GpWLV6WYBPz3PUcKsOyx1OWfm8SePHqslRBh4len54SUZLY556NtpizNFuTgncGkxUXJfdzFHeX0rCxcL/adAdIa/VMBMMwsgxaocPTx3xYeMm4yUxAqoHL9WPOXr9GklcFqjeOuJzbsRT2T0DtNyZ5mXRAKXuyURilnBYVif2aD2QeVkzR802YCvjUGpuEweGxU2jKOIsxV39wb5ut7s015nAE4kO+Bsn+aarZcnRbn1kVigzAWs1ug=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU04ZkVUemxoc0RCTFVvZlA1RUs1OTV6SVpzaHlDNFRiMzRGamdWNkN5V2k0?=
 =?utf-8?B?OWVpVVlVOHpyZlBtVUNNUFhsYm91R0gyQjJCdDN6eHE1K2M4N3AvWTdYaS9r?=
 =?utf-8?B?QVpHK3hMeHluaklxRlEyWkx6U0tHZHRKbkNCaGNiSnpzaDNLUGxiS3Q0KzJl?=
 =?utf-8?B?RGVnMTRXVmI1L3BReE1YRWcyNjJsQmRzQlVQeUhqQm0yQkw4V1NwL2Y2QVBa?=
 =?utf-8?B?bXFIRHZuUGpRRWdweUdiVWdsM2ZQNndCUjZGU05ORy85WkNkRzlmNnczV3JM?=
 =?utf-8?B?bnJLck4vdjF1ZitPc0grdnkrQjZFMzE2aW1RUS9PWVFnbFVUeWJlSDNNWXZB?=
 =?utf-8?B?bVE1d1k3ZElndDhMUEtWb2hzRFdpS2diZnNZN2dhUkFhdUVJRS9uTnVJZC9m?=
 =?utf-8?B?NEtYRGFHTkx2eVBkUUpuZkt2SnJVUjllWkpRRFhrVlFKbGoxbE5heXNlNmNu?=
 =?utf-8?B?ZzQ1VDVFYUtvY0dQeHdkUDFvWlpobzMveFlwVDMzRjl2Qm4rdHNxcjNDWms5?=
 =?utf-8?B?ZXFVWXRLc01PeDdYL1RSMWNHa3dDaHpZRlZYZFpKVlRpZjQwUGxyOW5QL3g0?=
 =?utf-8?B?elJGeGxvQXI5Nyt2eExpazdZMW1WWjBGa2JwTm1YYVh1V3dzYVZObVBjaVZa?=
 =?utf-8?B?d3dKRUZSNnRvOGhOQkljQ2djaUJxMlRZTW5kS3hFU2h0ZGNZZ0pnY2JiM3pm?=
 =?utf-8?B?dHR4WnA2WGRHazkrSmUvckhuU3paMnlpSU5wNy9uWkVLclFUQ0ZqUDJ5THFY?=
 =?utf-8?B?aHk5ZkF1RlJURUpUcHVJUVRtVWIrNDVub1BIUkJXNFBlN2tQV0FlcEJ1SSt3?=
 =?utf-8?B?UktJUFZhUnhxcURxa3l1UnVTM3FnL00xWDRuUzIwcmFheXRyVWx3QWpNK2Zz?=
 =?utf-8?B?OU9SZFkvdlFSSXFBV0wrdW5jSFZzd0JHcmQzczl4dExNSTFqY1N1TExjdlRE?=
 =?utf-8?B?RFhWM2o1ZFlCL0ZkZWE2NmJCUUlnQWpVUkxVZHdsSTd5TUhmMCt3MGdFTVVK?=
 =?utf-8?B?SjBqS0V3YXBvcWZoc2FRYk5WYkFrZGdtOHlEejNidFk0K1dQZGh3Sjd6ZG8r?=
 =?utf-8?B?anloQVdxUWx6R3BlaUpOVUlrRDVTVWNZc3g0VEVpaVlHWElNTktXWnU1YXBV?=
 =?utf-8?B?bmNsZWd3bHk0UjJSZlRGZ0QycVVvNjVkMTZwbzVFUEtBYXdSbTl5YU00Vm1R?=
 =?utf-8?B?YXJhcFlzWmFZOFhDMnBQZTNtYlpBY1VLeEJzUW1iMUR0UnpiWjJZa2Z5M0t0?=
 =?utf-8?B?eVJ4SThGc2lDd2pCazRLM29KNlNQMmEydWxGMll1cmFUZkx3SjhMUkZBVzVO?=
 =?utf-8?B?MGI3UnNEa0N5NHhhTXZzeGhrY01HT2Jvc21BNmQ3K0tmMnhJemtiOTFiRTI3?=
 =?utf-8?B?YUJ0MGFGV2ZkWFd2Rk5nbkVuV2RRRzdUb2E5REVyclVSRWVQNElTWEpyVjN4?=
 =?utf-8?B?QzNuVlNkZjdoQ01Xb3hkTHJYTnlBd2FZRVFOaEZVbEtZdnFRUkx6bkpXZ3Ry?=
 =?utf-8?B?R0twYW03ZGpVMFZHSUIxUG9ySHBwV29RQXMrQlhiajR6VzYrbmpheHU5S1pB?=
 =?utf-8?B?dUtJemN3Vm5mTS9PR0MrL3pVNmNMTUdkRnUxaHd1NGh1K3FvUTRDZzRsTldm?=
 =?utf-8?B?NzFQY0c4Mzk0Wkk0emNiemtYT1FtejZnVWhwTGtJOTg5V1BkZjFVeEd0cmxk?=
 =?utf-8?B?Zzh1SjVGMXFVeHFTM1dEekJnZjJiODlRcElBQjFhM2pjZGZOb3d4dC81ZGJC?=
 =?utf-8?B?bFI1ZzRiQkd3Ti9FbThPQ1QyN2hldXl6c082NlljMzRBNFNETDZDMGsxOS9S?=
 =?utf-8?B?T1dwZ0xSK3p3Nko4NVh2dTFzVzdIb2hVTjhBb1R0NzdTbUZKTEhsamlUbEU4?=
 =?utf-8?B?NzRnVmN2eEU0b050ekhIckdIMjJnUkVWa0F3OEc0Wk9ZcU1TTHhyQmdPTHN5?=
 =?utf-8?B?RFhGdUZZdTYzcGdtbnUwNVBSYVY1aGZEVW54WXhxS0ZJN1d5R1NIWndZNGRn?=
 =?utf-8?B?WnRWL3lhbGU5QmpLdjg0NkZmcGl6V2U3bkwwc1ZHaGhjV0ZkZjhMYVQrbW15?=
 =?utf-8?B?ZmF2MmN1c0xCWm1Yam1SemZyRjk3UnEzbzVtREt4MTZvY1hSVzgxem9TTEx3?=
 =?utf-8?B?akFUNkZJSVNXc0o1R3VuZnJnQkFBWGVsZzlYOGlQajYzcGs2VzcyRElOUGRN?=
 =?utf-8?Q?YYLuZRx9VrImRzYwhnJ8mso=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 22726d13-4f38-4a31-7095-08dc39015071
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 08:34:58.8032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xPDllP14fp5FmM78W6EsElDT57pOPaXlNeOsq63yR4Z+k9ue7dDCq9nOZo5Rb3GeuI1XHhC58//fXEjAHC/MqL5h/c50UtTE7Ozf8ThpPxk=
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

