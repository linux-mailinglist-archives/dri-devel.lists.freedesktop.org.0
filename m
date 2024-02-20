Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1495685D222
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:08:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA2510E63F;
	Wed, 21 Feb 2024 08:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="R/BL2AyA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2104.outbound.protection.outlook.com [40.107.22.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C4A010E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 14:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIbFo/twIxwOPfFhWymYXspldgKM0WJBguzl8XnrRiLwzeSs8Kbhk27qKJHx8LoGB+Zr3I8QvapYgkTHOS3tVgBxfqtvWtOdAgF6x4yZ2R8FiDQ2cFJ/IPIQ5b7yLxN/XnpbxST3qmnDJfhPRvHV2hnaqiai+eevyY9qhM0/oeLEPviidZnkLKqGbhhb64CqymBm/0lQnkYdK/7vUJs3nYhMKtbe2aUUyBinLpr414JPAiQXVZyqHPGEMArBGQ2jFOq4xSUQJjEKQB8KE1c96tif2Z1rI1JWMLXa3C7QeY05zdHAWY4PAmaVHye93VM4Ylo6OJQ6iWs2IJiQsdRWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fq03xRjDQ28owlDKvq/GnOa/lXRcjSb+m6v6YYdcPc8=;
 b=URtxGCQFKZBItjMfzYAOTRAGYxFg1s2yOP5taADmnBTEQoZSQH0m1838ymsp7xbm4aNAOnkiUr0JNvHYmhWh4KWPxQfakKPcI65/SSxPmukwjrgkpPPhZSeeGPY83ZTAqMyH37nF6BEo8BlG7m/lL7SiZ80CPjMrKnVBR6U8tDtzO0YRxCqxU+hllHCH6fV+TEWcbEN0rteTZjIbTt1gUqADBrmVc1cv5oT9KsZnQWiMcip3EItr2PUivIh9nd9IQYi5hhlCt8XGxBfUz1Ziw4syoGRNZ5zf8BGPxObZa9DVHvmd7qttQz3kUcx7JHKkrzQfgtrsA7KtiSj2/MwUCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fq03xRjDQ28owlDKvq/GnOa/lXRcjSb+m6v6YYdcPc8=;
 b=R/BL2AyAXIKnjTMAKHTnBLKpoYQ39njoGPGrcurOYWd2uGbgtUk1wWOr80kQdUhTUnybJzrqE5ioFxdpEVUhESRADMX2ZXutLB1sdomdTOo6yeYNTvXWBmIo1IQ0rdfqXaf+/wAD3ofpnqvpiB8WGCy1qosTFTiTltMDcW4bpZE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by PR3PR08MB5577.eurprd08.prod.outlook.com (2603:10a6:102:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 14:05:59 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9527:ec9f:ec4b:ec99%6]) with mapi id 15.20.7292.033; Tue, 20 Feb 2024
 14:05:59 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Tue, 20 Feb 2024 15:05:51 +0100
Subject: [PATCH v4 7/8] ASoC: dt-bindings: xmos,xvf3500: add XMOS XVF3500
 voice processor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-onboard_xvf3500-v4-7-dc1617cc5dd4@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708437949; l=2063;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=oR6a5xqQsOGc1uMLfQupb0mPr7OXyz+ZGxt/49f9RUI=;
 b=PRJPQlk4A+rooh7Fw7N/NT12s2VAYBpe/wnZGTwHgqu3Qb1Fug9nlPw6vT8lBhUX9rvknaT77
 cORylSJhXqXCBUkZhH88B2RArbZKPesZ7keB7cVCjh0oTyjhVaI2F8K
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: VI1PR0102CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::23) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|PR3PR08MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e765a91-a687-4b3e-652d-08dc321d1079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kIV61SycbSrcjBS8g682zY/aZ3ZWSdUkj72Ch/qZWO5LKty6/tK5O2xw3ImwY43Ilh9absV8fzHIeWdoWp8gCR8M5nrPyAtKIBG6FKtIdFa0NS2baRXtVp9Flw8u0wyG8BVddt3jtCfY0P5/Ljtq7wZYkXW0YkJG8NrHJAUwHHfp+IYwO+tCggq5bsPLM92Z8KpHShDWP3ZFFQQvOU6XoC1R8er1reqgpohHwHapIgVUAtO8AH5bRFYK2n4X1CC8zXMgz5CzMD6h9ERyhWRCL+cCFSg6NUMx3BcGTfl4r8b2Lsx45ccro5PK0hl2A9D4613oFDFEsP7lntjTFdpPKyClUmHPM6vywqLRgkGGio9H86CUaR8njeq1lBm2G05xl2uKQxOA6dTArnFH0cDbmmFH4IHEZ1JgbZmqCWwuLcBWUuGYv0C6NHo6pnRJR8btoVLKL7TGaciIWOegj+HanebTul8cClDej5PxpzSHFVBGJz0o+IR32bP/cMAm+3zo6AiAnLtrHYLltwD4yGybDxOExFQbePqEEM3GA8e98NIszes0VXd7XHQ+t5RElQn171DWMYw+SYxbd5HCGf8tmOZdQeOdowURpnGni9rwCCkYuvUEyiiPm2qaUQBEyDTO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDRpZjFINFprbHRTYjkxS3JNRnRwMFRtQXpqR2xCdVJ0dksyZDBYZ2dBRjJa?=
 =?utf-8?B?bVlIa2hFZXBTWXFaSThhOGJDOENTVGhGaG9pblVFQk5uUkI1cGxOVldvL0pn?=
 =?utf-8?B?a3dBcFBnVHNXWWdGQ3MvUjlRbDZlTnJsNFE1Ulh4eHNVQXRpc0FmcmljRitj?=
 =?utf-8?B?K2Q1NFZpUmYrNGNISEhGUXoxbkE4N1UyMXNhZVdhZ3hwbEpHQTVKV3BRTnFK?=
 =?utf-8?B?T0hFdmYvU0NTekRHR2tTV1lhblJQVXFMSXA0WTZzZWUvL1ZCcVhGT2lpNGZU?=
 =?utf-8?B?RHJEZ0RBdzhncmFSNUplNFJvUXFiTWx6MjB0cTFUK0dyUVdLUEwzWjJBcXFi?=
 =?utf-8?B?T0VVK2tTSVdrenU4dUs3M1NTcmJza0VGRmxuSjA1U05qdXNneEVQWEFZLzBD?=
 =?utf-8?B?WlFJUTlGVTRvcE82U1p0ZEdtUnNsbHhqYXpYN1QyU0lKQjNGRC9EZUpDQm5J?=
 =?utf-8?B?NDIrbXJQekdlTEd0cU9Zc1pBemNTd3lBNlhkNVNvbU9wYUJXMnYzakZmWUlp?=
 =?utf-8?B?STJsdkkzbGp5QzY5RmhhVTRmR0pESVdNcGI2M3JWS21sVStkREZlcG81S3Bn?=
 =?utf-8?B?Yzg4YlVDZWN5US95SGk5b1owNHJTU2wxRyt1bWxGdkIyS2wvaVNjbjVJTGU4?=
 =?utf-8?B?d0ViNEFnUTQ0QVJEUHg5Q2l6SjJKNUhmb2VGWlZWUEVXakJHS3hlV0JjZHp5?=
 =?utf-8?B?SHFIdGVlSGdjWnljRWZZQ3ZwNDZWOFZxVDZPNjB3Qko4UEk3d1puLzA2L1BZ?=
 =?utf-8?B?a2NLT3ZRS1FKV3dNMjExVEg5cThJU2prdGlyeFVrTWlJV0FncU5tVERINWd3?=
 =?utf-8?B?N3dLbHFkeU1jYU5IRUhzU3dUQTlzM2tUVDgxUW01cE8zYUNXaXJHWXZNYWZJ?=
 =?utf-8?B?UTdJVll4SFJtd1hpQ2xvUEZOUkhLL0p0MVRtb3duNitIc0hoSk55VW9BTFVm?=
 =?utf-8?B?NUk4VEZLQjV5azg2TTZrbm9BZktxMSt1WnFXNTFPazRTSWhKeG1JVGxLbnRX?=
 =?utf-8?B?RE1nQUl4NURsclZiQ0laUFBBWFRSL3JGWGh0bmlaU1crRU1BTlB6V1VMckRx?=
 =?utf-8?B?WTBsZ3l2Nm9EUk9wUjR3MjBYVXNYUTh1R0MxSC91OGFSZVNONUZlczJTaDVT?=
 =?utf-8?B?R0dsSUdpU3l2UnRHdVZYYkNOZzlBRVc5VE1aaURQNFVjZWZ6bjhpM3JuR0Vv?=
 =?utf-8?B?UHdCVWlrdFI5aHBPdm0wMnVIaWpseGw5NVhUamp5MCtIYUdOSzJ0THVUNS9i?=
 =?utf-8?B?Y01LekdjU2FJMjhLL1hzQlhiWmdOc0s4c00wajBmRmRtdUk1THBBczcxZzFw?=
 =?utf-8?B?MDhKOWM0bFRBRnBxWjh3WW1icmdxNkwxL3VSSEN3dVJyZFR0OTBibVRtdHgz?=
 =?utf-8?B?QTlrMVJqY3pacDJOUzllbFhsbDY1NnZVdEovV2wyY1VJK0JzbElDdno5a2Qv?=
 =?utf-8?B?R3JVYXo3VWUyQmxnTGdZMHhqME9FUXlrZHBWL082dmZySzZieGFyQk5abHhE?=
 =?utf-8?B?UVM4Y2V2cnRaU0xWN2JSLzJHT1NwMTYxUitoVmNtZGhNVWRkcG5qTTRlcGxy?=
 =?utf-8?B?Z2FNZC82bEl6NnV3a2FWeVVWTlpEN3FBN2JjK3ZBRHI5Y25rNkJxWSsxR0lZ?=
 =?utf-8?B?OVpXTzZHQmRDL2IwVFc5RERjUjJsaWszVGJHUTl3cW1BQnZoM1VsOUZCdXNp?=
 =?utf-8?B?UDNmV2loTThTa0N3NXFNWWdhVENoRWVna2djTnVUanpKdHIzZGZZOTcrZ1BU?=
 =?utf-8?B?TG05ZzFsYjBiQ29CUmNwK21aS3dXUjdTMm1KZnViSGcwSG5hTHh3T0dudVpM?=
 =?utf-8?B?VWdrYWx6LzZVQXB0Z1RucnBBdTB5NS92aEJ6TngwQ3VQd2FodnFDZStkT3po?=
 =?utf-8?B?T1FvOHduNEZYeXhaVjVwYmMrNjcwRXBCWE1rUzNNeFJkdWpuSUpCRTFhcUdn?=
 =?utf-8?B?RzVYMzdRUWN6YXRZQU9CMjNPT2ViVVFlY0JEcDF4R0JWcnBYMklsM2pSMWRJ?=
 =?utf-8?B?OHplTG0vWVE2ZEgySTFZbUY1azRLc09rYlFRZ0tsQmp4Ky9zWk9Sd2lEa2lm?=
 =?utf-8?B?VmJKdXVGK1JjQXBISFpPdWlZTFA5NldRZ1hwVURvRUJrMWlRc1BkWVNSTUpI?=
 =?utf-8?B?MnhGR1ZlVzdpbWM2anFRSWxvaUUydEpueEorM3lSSkNIeUtPYUc2bEViNkRs?=
 =?utf-8?Q?fWohnUBCY0mn7MPiXvMqZm8=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e765a91-a687-4b3e-652d-08dc321d1079
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 14:05:59.2546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gmsxSe0lNICyXF2LcE9XTlBqOFpF9XpSp0JnJ4eNiZEM5Fv3id+5LxPZFdba9BSP8RkkXNW2yYzNJV3VxG4nx/yoNbxxQ5b+OMolnG5D574=
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

The XMOS XVF3500 VocalFusion Voice Processor[1] is a low-latency, 32-bit
multicore controller for voice processing.

Add new bindings to define the device properties.

[1] https://www.xmos.com/xvf3500/

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

