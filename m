Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9116A86B0C7
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 14:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7336D10E4B9;
	Wed, 28 Feb 2024 13:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="nIIafiJf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2115.outbound.protection.outlook.com [40.107.13.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417EF10E295
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 13:51:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmwDZx0FQypwvRFfPJjrSo63lwrWLopb1XMxIbGA/NqdDPLa/SmcF9dtPfw1/yYG2Wej0UrsYsQ15r92NdJt3T21pBXM4mG59kO39C2Cc+vxwSUSvPX47rI94Z9DJjXQ/T7aTiR2Aq3twGvfet9bs6xy/KAKN9Huds2vjIXV8wljsgzvUtjxrjJ9nh+zW5Dp8oLdMMclPvLV8EOm/GST+wyFUXI5IO8RKOFBYfGAoYOdqVgmFaa06M0Lr+X/KHpmKynwS0lcwqEliBJbO+I9IXHWPWSwUQZp8oz3ZZ1OeP9GJA3e5P4rvKUz+0lVrUyKFX2SoXXPBxZpIupC2Renwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wngdV70IOdXxwG/t4ulJ5gsPc03FZIHAJnqJg9zDh+M=;
 b=OptgRq/tf9lTsngAVB16HIjn+s/9Wei4xiq2LzYMcFo1CRC5Y//zwHLLg8DR9uiLUUwstgiLOyiy6zbO2STHCk3qmrQDLWU7ApNsOIs1ik9otNQOO+j9bacL1VrzJEBtKJJQiG1zdcw53tozSqX0iNz8/RvC9fDiSnPncf8AsEFtYAEI299Yi7kZxrM25rsupVEXPWrGv75qFbXBwpT906oHvn4oJ9knE9tw7+oIRWMVxkDDvxWaoJHdmRHUsCufmNFLqD0w2syip1+FoS/I/Xbtv9/NL/iLzUBh8XbfrPSR09l5U6OjWLauPn621fGgwFfUpxtVgmybMD5cJUChsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wngdV70IOdXxwG/t4ulJ5gsPc03FZIHAJnqJg9zDh+M=;
 b=nIIafiJfhqAvxT4RlrjHWrhDpFQnRvYZ+yu5XI7VMT3h3nxrwPMu0s4QRYi3D8KgF73Elw1eShH+JJzJmqSijQ9BqYmieO7Othuc+HPBogurtyvOjiuExWcrixYe1JNJOmnmhC3Bk0ddkF3hEksmHbLBP8HkRCsRyBBKbu2pbNM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by GV1PR08MB10523.eurprd08.prod.outlook.com (2603:10a6:150:16a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.40; Wed, 28 Feb
 2024 13:51:44 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Wed, 28 Feb 2024
 13:51:44 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Wed, 28 Feb 2024 14:51:34 +0100
Subject: [PATCH v5 7/8] ASoC: dt-bindings: xmos,xvf3500: add XMOS XVF3500
 voice processor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240228-onboard_xvf3500-v5-7-76b805fd3fe6@wolfvision.net>
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
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709128293; l=2130;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=rrF8Q2LYwFLaBUHIvIcp23yKN8GEsR4HPVSTq8weH24=;
 b=UzauIOpsKUfwQwer3RbntJs5Bp7eUgfsvYEmriJ2gaVuc6bqU7iy3ABXYXuKNMwcS/ExRFrWY
 ZdtXDxEL2z2AHwZJlALxCqjRhPIeLQ3Lc6/+rBIfMa4I+SBcwgKjR6N
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::19) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|GV1PR08MB10523:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db46445-2f8a-48f0-2774-08dc38646637
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gHluEKnXwqNstruL5T/a5Zsij9HCmKeLk1Tafh8ebMLuLLfimijfcvre4Rk5kuTGgF+SBEt2TiKY1lc02mV7jsY6MhQI8CQoWIJvEfp3qktKlmfrPT4PlGHYblpmGPtVgY5RHlD+rn2DRB0wMzjlqs+RbJd+l1S+OlObxcBYOfr4y2W+JWyxe+W90e3NrGG+1TD93aKJEgVfqUvSvqhgUeQbsOUq8VXcIVw/M7lDovm67xPyq6ryc/dFNktqFh1IjZcFbAyZqC3xs6yfH6D4HDlpC+bKsZE5KL5m3ewpeSGJaMV9J8xjOVbgcmZOe3YHqYt3FY3MPOI0h1hKHE0h379TPHqh67tiUhgAEiIMvihcB9H/PHgeZeug8h1tk1DwzJuKmqksScZrJ07fsZZ4XL9g8f4LDFTfc6qr8zDy0/7+T6X+NkdO6hZfc7CDyteNjRlzRL72ANzz3WG2oUqZ6wBXX/Sd7xyQaVBJd7pKLh4KEyscBBZDOq8ciFQU00xUmOMvsKWBDgeQaq2OGl7S318N4zS8nK4Ss3MXDdmbTK/FsBtjmyNmpnM7UzxT/mZFrD0kFZMvHxxCQCMrl8j3rVscNEnbBah3EEv+IXRaBnyCBF0QjDs2ioDblvVxha67lwg535uem1zxYThzPUXmY/Hrs1XinGSF6QJMFFoZise85vZxr1LSEcEBvJBEA+N0rj4ZxjfERtEkfxcAIDsoTFUG2UrkPkEEDh+KUcqMq64=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjB5MmJ5ZXB0OElKU0RPVzBXdFoxdTZvM1BuVXNRK25LNzZWcCt2S0JxcXg1?=
 =?utf-8?B?ZjR1dzRoL1RRRk1ZTG8vTUNDdmFXMDZZM2pYOW5TOC9JWWhtMzZ6MGoxZEdk?=
 =?utf-8?B?cmNGNHgxQTc1SUVjV0xjTzhFb1BIU0RoU2JVYlFLVDV2WnhFSkIvZEJhdDJV?=
 =?utf-8?B?dUZpaDQrZktJME9yMStCVm1ic2JQd2xkK2NGRE9SK3I5RU1CcllvcFlrMmRE?=
 =?utf-8?B?RGtYU0FQUTBBOXVsSGV5bnpNQlBiSmtPdFVLRFZHcE1tYVY3VlpjcFA1RlJW?=
 =?utf-8?B?TW5jQ2NOYjZta1JHWG1yek1SZVNTQTVNRlJHZTl2NmlIQm16b2s3NUlmNUda?=
 =?utf-8?B?THpMNjJBbFJyRVhubGZOZUpiUzlvcXdxZHBhUlhqWEkxTVZaZ1l1aXFna1Rn?=
 =?utf-8?B?UERJbkJGY2FKSVNieG5pbEN3VUJWeklFWWxtU3krQ3V3RUVsTXUrakpRaWg4?=
 =?utf-8?B?SzArc0xTTDYxdThWamI3a01tbzNrVEJ0RDRQVHpCcmFMSkJYNEtwVWVtcHZN?=
 =?utf-8?B?UmhLUDdnTE1yWmFybUxMU2VzRzBBeUZqWTYwU09lQ3hac1FZa2cxU2NkY01H?=
 =?utf-8?B?VU5mOWs1RUlMeWZURURmKzVYZlBEOS9EdkZybS94SllZK0VRVitnQ1lHYWxY?=
 =?utf-8?B?eXh1SzU5MGwwSWNvTDRaSGVPUm9lMTcyZjJkWG15SncwMVZXaU1sN1pYMlNn?=
 =?utf-8?B?SXZXUlgzUnZpVnZFZDk1U2FCdUcyRnluOHJxekJERWszdVRXMWtFL2hvZWNN?=
 =?utf-8?B?ejVXTk04bVgrUWJTQjhIbzdYYzUyamp3Z3FJNGwvaHYyZ3pWS0V0WExkYnhk?=
 =?utf-8?B?VmZnUnozeXBEcmpaZ2Q1ZHp5eHorbFhCcFBqZWxjTXBwSDZLWW9DZ090RFFG?=
 =?utf-8?B?RERDYnFwcUthRFh2UzRuSGdxOUxjTDljMjJFMmZUY054RjlOOG0xYXl0RjBC?=
 =?utf-8?B?Uk1tS1pCS1hkSG52MXBHNHoxR0J0SnM1R3FwR2hiWkQ3VjBOK2xNSUFxS2hZ?=
 =?utf-8?B?ZXJIU1pEUUxwaE9vUldvRHNocGkzWGhpOTJRS1FtNjk4emhqYkVVZXVKYnp4?=
 =?utf-8?B?Mk5vSG04Q0Mvbk9OWGYzK2JWYVp6MkVuSjJSNThEL2hpdlk4V0F3bHhZUFRo?=
 =?utf-8?B?bERhRHRpbTZWUXdDZmpySzVrdGhHSFlIbUFYbWF3Uk0xNG1tUFBqMVVhQm9C?=
 =?utf-8?B?MGJ4M2JvNkcvSXo3OHdwZ1huYnBnMmx2ODJJSmhWb0o1RU10cUhFS2tiK2Zh?=
 =?utf-8?B?WjI3SFN3cGZHbWxsS3NXVmZ3Y216R2pPODJ0TG5KWUMwdlNKTTVUcEtZUDNj?=
 =?utf-8?B?dGRqNUFXMFpqRlZ5cjhrWkdnTS9qeGs5aGRPNFlocWZTMFgxK2gvd0haVUlw?=
 =?utf-8?B?OHN0ZmlpNW9VaTVidHlyUXkwR1BHWjdjc1ZVTU5PQ1ZJRHp2ZHl2M25NOXpR?=
 =?utf-8?B?eTRQRHhCZy9ZbVJiWlB0RDhwYnBveXgyY3lZNDRUeDRUS0NTdlFabzJkYlFt?=
 =?utf-8?B?R25Tc1JXbDNHZEdKS25IK2lFQ2wwUzVqMUZSNTBpZXNUWDBEZG0vUmxydnVP?=
 =?utf-8?B?b2VrZnl4VnBjbFFZRmN2OGkxcG95dUR4RUFHN2pYWkdYSUU2WVM4TlNLL0Vm?=
 =?utf-8?B?UU1namFHRE1uOTBaY1pSRmJNRkYyNEJNWGFzK0JpL2FQbUxUMzhmUGhJeE0x?=
 =?utf-8?B?alUxeWhJN1NEMnlLSnhmQ1E1MmpYeCtYaVdDNkdNMUdGNm5OZFJFWDZqNnhx?=
 =?utf-8?B?MkFVb3g5WmEvejJrUTFEdnJMM1BuQzdObk9nOWE3TXE3TjB1TXBSbnlkTzIw?=
 =?utf-8?B?cC9BeDVmaDI2UGl1WU5Dd2Jqby94eUJ3SENNVkMwT0QrZzBJU3JGVHR1M1RV?=
 =?utf-8?B?TWsrYnBxSW5FNnBEN0kzV2VvTVl5eGhEblhzb2YzanIva2pNSGxVMFh2dmxL?=
 =?utf-8?B?MWV2R3pWRjFBV2pITUVLdE9lazZNZnBHQStNc203NzFRblJtYlptblJlRlRw?=
 =?utf-8?B?ays5TURZQVl4dTc5K2pnblMweFlNbzZmeHJmRmtXdW5EQ3kvM1pPd2Mrc3d4?=
 =?utf-8?B?RUg5cHBERFZxaTFRVEtxQ21DcWpkQURWRW0wK0pvWkFLNFhEQUVVRE1mcVBE?=
 =?utf-8?B?c2gvZ1FMUGFwRDBCUmNQSUJQbDFRR0U2dlkxcHZOVWtOT2tzR1JxVFV0Y0RW?=
 =?utf-8?Q?nO2Pk2GneO0GZdIJWSdPlfM=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db46445-2f8a-48f0-2774-08dc38646637
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 13:51:44.3650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gf2U0v/kzSgp7XCA3Fmw1wPsg54ilOWXzkYBt/vzJ2/V9n1UINStLcMthWw87sOUybWsRodqtuR6jOYxzT4beGGcUHjlyVSR53+uzJJLGJI=
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

The XMOS XVF3500 VocalFusion Voice Processor[1] is a low-latency, 32-bit
multicore controller for voice processing.

Add new bindings to define the device properties.

[1] https://www.xmos.com/xvf3500/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
---
 .../devicetree/bindings/sound/xmos,xvf3500.yaml    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/xmos,xvf3500.yaml b/Documentation/devicetree/bindings/sound/xmos,xvf3500.yaml
new file mode 100644
index 000000000000..fb77a61f1350
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/xmos,xvf3500.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/xmos,xvf3500.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: XMOS XVF3500 VocalFusion Voice Processor
+
+maintainers:
+  - Javier Carrasco <javier.carrasco@wolfvision.net>
+
+description:
+  The XMOS XVF3500 VocalFusion Voice Processor is a low-latency, 32-bit
+  multicore controller for voice processing.
+  https://www.xmos.com/xvf3500/
+
+allOf:
+  - $ref: /schemas/usb/usb-device.yaml#
+
+properties:
+  compatible:
+    const: usb20b1,0013
+
+  reg: true
+
+  reset-gpios:
+    maxItems: 1
+
+  vdd-supply:
+    description:
+      Regulator for the 1V0 supply.
+
+  vddio-supply:
+    description:
+      Regulator for the 3V3 supply.
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vdd-supply
+  - vddio-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    usb {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        voice_processor: voice-processor@1 {
+            compatible = "usb20b1,0013";
+            reg = <1>;
+            reset-gpios = <&gpio 5 GPIO_ACTIVE_LOW>;
+            vdd-supply = <&vcc1v0>;
+            vddio-supply = <&vcc3v3>;
+        };
+    };
+
+...

-- 
2.40.1

