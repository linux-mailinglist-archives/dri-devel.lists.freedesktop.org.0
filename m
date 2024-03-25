Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1567C88976F
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 10:15:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F6210E6C4;
	Mon, 25 Mar 2024 09:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="Egh5Iis5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2139.outbound.protection.outlook.com [40.107.7.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3515610E6B0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 09:15:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVBXAhqerKObVJmfQUDxeRn+K90nThHnt5Lk9gXc3oIyDpluUfizlmkSIjWIIwXp5FlLFETuDcxK6ZgEJ4IxHOhyhbOU2ZI7D3KSz2Ez/mI+a8THcRbqgyoUXBdeBUH3l39jb+5EVwiVO0kpotKLAjb1SJaP4sSrc0neU3ykqW63ET7EhEFSyBx/By7lnlH4X7wMvdZj0FKYGvFXrSOY5N2q4/AA04zjpfx0I1KinPKrbf1ymajcavSRaQMb4HgXDSnHvibVEuOH5Fce76J//1vyMedA6ownCnN8SaVP8XxHJlPDqRhVVa8iob4jlOfacKsCRspN8pWMS3M05Ma/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1eIx71K4MMtP7thaSHv2tS7Es3S7FuRoV0yOAolBjU=;
 b=LlYEYY9fJZ2ResJcQrL805kCv/OoiCmaybetP6q7fwQN/lmbuQzyIKc2ml4Lhh0iuwOfQTJXwaTY0SatCeQjZBGkWToXtZ/IbcY6XRhDV/BW2oM57HbZDkTtwiWVl9cpRrz58LrFEPs7wbqrKJyNEG0Dh3f2WlwUwA/lt4n41RAFJL34KIqDqEGMIcjTSbbkCBrJlTlYW2SLUBTFqy2eQMNaSUp3kuRmZuQ7YfkuYyeu89L2U0mbwVSW+JqJZDdlYAbyEGbd/Zu0eZHU8p4pGjKcIpmaoJ3gXPuRpGcdYU/S9BeaX/mTbyYXy438wPVFXg6c8rWjIOVrdiyYvZzuqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1eIx71K4MMtP7thaSHv2tS7Es3S7FuRoV0yOAolBjU=;
 b=Egh5Iis57ioQQlrxwVfkU2BvqPyoRQBxIp51vi9u8fekU5oMaqzEjpL2w4tqyFsrXUBLKlEemA5w1yPUYwkbcDqj++3JG52gskZCOQ9j+fHhdOcd9ksbRZzIrzFtySRLjgs/0B6jcJuOlllUzOsxkDmngX+GYgWCBrNGYNhrkMM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by AS2PR08MB8951.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 09:15:20 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%7]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 09:15:20 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Mon, 25 Mar 2024 10:15:17 +0100
Subject: [PATCH v8 7/8] ASoC: dt-bindings: xmos,xvf3500: add XMOS XVF3500
 voice processor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-onboard_xvf3500-v8-7-29e3f9222922@wolfvision.net>
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
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711358115; l=2173;
 i=javier.carrasco@wolfvision.net; s=20240320; h=from:subject:message-id;
 bh=aK/tqoGoFX3bOzP7we28NQCLoIDGur9v/pKHCEPg6Ug=;
 b=wYVjFhmPV+/oYLUUhPj+kMEMjoCWMZeHcgZK94IO8yxTLJiDhPFHmKzmN1rvEmKOZKsAAz3gx
 oPE2HERtqNPDi0FlDRxT3k94z1YlcjabQBifz2vaXBYT8cSnylUMupO
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=Vxk2/0sGIxM8rsKnceszFuSuHVfQwa1Yo8+is7BX2nY=
X-ClientProxiedBy: VI1PR08CA0223.eurprd08.prod.outlook.com
 (2603:10a6:802:15::32) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|AS2PR08MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d58f85-796b-4785-2a17-08dc4cac17e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lPAiqDrFv9RNGmPvcONEaoZTIXOvRqoD5jB5E3px9zUQrBu9v4QuACAc+5c5rOYPpP42EO5Xwa4dfLow4qJREZoXD1g9uHMLoLsPh6oMQLSpfUO3qtknQZFUrVB4rKoJ3GkBlwvf+z2nqy5nIiyk2BiEoOyUAo+9AwItfYxyIC0qiwiongXFgO7+wRFsdEcpGOXFuT94ya9SphPsGj7f2KY62J5p9HquSnskYKmPkdlsuv71GElsPZENyxrUJtbldnH8rI9GzMV+i0bKVXmEfq+aDzjqIvDWRU6cZuHaxwDFiJMGQTsKy8uUaHua/f/MyimfZp/A7ylySny6YTnreV4t0uLlH+uba0Z0AWRK5+4/Kcj3dieO2mEBTOwD3lX+s3LkOS0ehBUChn9XU1kQPGP0DVYaMUwyWAXMYBdzsIIetGKR0TJcB+hj+hOQpbrhJX61qmzzWhmKY0NO6x42jC5jxay9tCwBLj76Q7jeKGBDugfEj4OE+oOjV9WhMtwQJe6aMpazg5fH8jc5Iga4Cr5IgOtafjY/3xna0EbWyDC+8Q+7UyR0MCVagic+frQ+Ck+uF7088TH+K6hiIgXR2Vo7mb+8K96KXX7jfbOAmevyP2f50blc6rNTHormW7GneknvmLvce+DOKmsW60NXJf4FODZ7NH6kaI7dWoibhrrS9Ai40i3ii4aaKjwt3WNr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(921011)(38350700005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkpUWjhpWE8veWJpbklxamV3MzlWbjVlU1k1WElhVlZUSXo4N0doSmdCVU9G?=
 =?utf-8?B?bCtmZ0NxK1JrV1JMWXRjSkc1alZ3R2dhWlZLTTdUd1M3dllmNDhBRnRNRnBq?=
 =?utf-8?B?RnRoTGlmYzRuYmFVQTEyVEN3bXd5SldRazFjNUhBYWlOa2xhSURYWlFaWG5B?=
 =?utf-8?B?cExBWlFOdDBwT1liQTlCRDE0eng3S1g5N2l2SEk3L1FYM1dveW83NzQreWd0?=
 =?utf-8?B?MHRhZEEweEhxcFBRNWkrRFFiNWQ0VUFNM2lReUZBakR6TDZtWU1Ydms0UFky?=
 =?utf-8?B?eXdPRGtOT2t2ODQzYU1VZzZmbFFQUlkvMjJvY3IzRUk0cm5PcHpwQnNZL3Na?=
 =?utf-8?B?YXpxL1VhTjBYTmlxZk5wQkJOdSt6YWMzc0tRV2JGSHVia3ZWUmp3YUJOKzlY?=
 =?utf-8?B?bGQrQ0Q0QXJNUjRrTkQ1RUJiZnFXMWxvK1VUaEpNeGJVa0x2NXFXN0twNVJL?=
 =?utf-8?B?a0dYRlQxS01PRmlCdEc2TEVna2xZd0RXbXNUVm5SZkNYajVjdTlCamE5WFpx?=
 =?utf-8?B?Q1Fhd1N5NHYzaDludXhZREM4ektKa1BGS09XaXJPNHJLT3lqcjY3S1pYRVNk?=
 =?utf-8?B?Qm5MdDdPNW9RZ3FwZ2xwVEU2eC94cm9JUHhmMklUd25kbG40WjlFOGNvSFhu?=
 =?utf-8?B?bmZna3VadEhJWENWK05rZVgzTkFkZ0h0cEljSDkvOWxIMUFIdXhNRkNnWVYw?=
 =?utf-8?B?QmZDYmxTUW14OUN5NTZzZGpvWUxDR092N21OQ1hScjVVOHBxU3ZYaUkveXdo?=
 =?utf-8?B?S3hJQ2FMQ3NqeW5sWkFGcldIUWI3RUxSMHhxdVpvalptQXJQUHpyQkxCVEJl?=
 =?utf-8?B?a2ZXRHZNMlZlZVRUbUxVKzROZjM1QlBoMmF6Y2FMclFKSW9yREwrOU1FdzJx?=
 =?utf-8?B?L0syVUZiQXJFOHYzZS9TRmVES0dYL1lqYnJoamxGdHBHa1cwNlY2Znp2Z2h3?=
 =?utf-8?B?NHBiaUtMMzJoVVBZVUY5SUJDTXJObWVoQ3RtSzV3Z2ZqNURPMjBVaTNtS05T?=
 =?utf-8?B?VEIycnlKbHNJdnhXTk5udmtYK2gxWHdaUU5tUWRUamRQZ2NjRE8rTmhVR1Y4?=
 =?utf-8?B?dm1BQUFLQTZ6WTAwLzNvOXJrN3pzWFltYTk4RjkyWHBST2U5TlJOMzVRaHNF?=
 =?utf-8?B?YkpJQVVmRnpzRVZ3TERzd0lTMzFmeVg1aFprTDRVVWU2ZDZKUzZLZzNWc1hm?=
 =?utf-8?B?NkZzUS9pZ2xJMDFjL05nQVdrYmhzRHNJT1JGd2lLc3ZITHprOUU3eU91bmtL?=
 =?utf-8?B?TmpyL1BmUThlcEI5a3c0VVozaVJKZUR6VVdNcS9sSU5NL29uNCtCTkFTb2lk?=
 =?utf-8?B?MmVuZU5VUXU5b3d4c0ZtaTRWMmlvYkxEVG1vQmFDWld2ZSt5UmFCVFJwR2R0?=
 =?utf-8?B?dW1VWXBSL09UUFlRMDlxY0dRTGZ2R3c3VWFoc2tOZk5UeXFRSVJkNWVxK3Yy?=
 =?utf-8?B?UjQwVjB5SnZZN2NPd1Z0VFhZemV2UDBucThmRXllRE1PSE1HSkxIWWx0TGwx?=
 =?utf-8?B?Y1FkaGxCZVBZWVhxN1VwTmJCNWJMeVRkcDB0ZGhBUnEzelZQeG81Mm5XTVox?=
 =?utf-8?B?dGtpVGQvMmdpc0ZaSkdKaVZ6UFJEWVY5UlY4MmhvZjJnNzJaUzVZR0Q5VTdU?=
 =?utf-8?B?UjFVL0ttWm9qeURmZTZ0YWhNL1l2VUdHd0hSNFVKMEhhTWJDaWtTemlHTHZE?=
 =?utf-8?B?UGZwWC9LcHFlVE1RdWt6MG1YRm1oQUc0MVpvK2xWU1FoeHFHNkRxL1pJV3l5?=
 =?utf-8?B?dkMyczd2djZhVFBPYm1Sb3ZzOTQzUGpRYlBBL0k2enpycWZXcTFDSEM0NGtv?=
 =?utf-8?B?KzZYNGRvN2t4S3NJd3o0Q2dQNUxpaWxlTHdZWFVTcEppcG05azZVK2NjeWtu?=
 =?utf-8?B?aGZ6TnBpY1BZYUhiT3g5dUJlNmFTV2JLZDBiZ256azVydElQWWpRYWQrWnlX?=
 =?utf-8?B?YlhHQ25CQUVpeGEzOUlGQ2hDaU9nVUxqdkNvblA5THlVVkU1NGVoQmdrdmZr?=
 =?utf-8?B?cnZ2ODFxY0owY0g5UWlQemZ3dmM3cDVmOThsR0xNRUFMMy9nTTJYaFZBNW9I?=
 =?utf-8?B?ZklWeFVzd21nRGZWTHQyZzdQbkZUdDZJZzJDdVZkVUJoZDJGUGVNUytaT25W?=
 =?utf-8?B?eUZ2dFhRekxVTC9YbFp3SUpueXFtdHNyU1NobTdFNEZDYktRNEg4SjhiekVO?=
 =?utf-8?Q?DruK5W1WLUgCfZq7x5oO4Fo=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d58f85-796b-4785-2a17-08dc4cac17e4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 09:15:19.9749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1/SkBTjXZkOgYD9n+3AHLDLCadd+lRthOlS4ySXaCs/hlljPctYtxW88Ol1pqVr87bd3ERhkofG2HU/VEhL1+FxnfwzilRTgN5NvMGuGVw=
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

The XMOS XVF3500 VocalFusion Voice Processor[1] is a low-latency, 32-bit
multicore controller for voice processing.

Add new bindings to define the device properties.

[1] https://www.xmos.com/xvf3500/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Mark Brown <broonie@kernel.org>
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

