Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8272F86C39B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 09:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A1510E2E3;
	Thu, 29 Feb 2024 08:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=wolfvision.net header.i=@wolfvision.net header.b="zHbGC9nL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2103.outbound.protection.outlook.com [40.107.7.103])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB35E10E116
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 08:35:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7bLJHvjjQ40piKAhQKRsQy2gJXVoHvwlDlDtEVXXFuNpxucEFSgolEAvXDHFVNr7dARu76WcAV8e05DMJwxzjfQom7gWDaLcjX3i/SS1LfI5NFq2ek8i0rkOvFGJgTBwpo+oQbrI6BhZ0BAzMCF08o3CdThBEHShJmwdw3ZTTtarrKtDSi/Bio1uQcnzhZtzFpS1Edy++POwPM0Oato4l9mt9keVCqyjjvft+fEbqo4c+SwMyi3WpAa7JOMA/WgCheFAndYw94mI3/2MSo/K0oYwF2xafszN2UVQzM/o5UPUSDiGA4bHRkz3Z2LYstnqm4sBFXcG1H3vvE+tnKkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1eIx71K4MMtP7thaSHv2tS7Es3S7FuRoV0yOAolBjU=;
 b=nYVtU+DWjXbemH5jhbIIg95hfvVshUEplMvnBDXzvVLOznAJqzLrooJkpWR0y39Sd6FRaSSKuAsHHcvqaj7iBYcpaXYwDgb3DjcdYbjiDfhPmga5w3/h+1mbkqrHJmbvdGPu97aOaSfFStwOdy/dZMIBQoK/GLxFbib4+2E1gmfi/vuJwtyfV9lHb8ooHR18jK4F8FF23cVKR1ueXd5Iu6PDuwgsfrPXLJAjqfzbs0CdCvAvx0McL73Uhp5jWKOxWzHbcA84H4FDGv3utQ3cxSKM7J2ZLeyg//e5M9xomvwAzG6hbF34t9xU0NEdmL/bZAq97RSkRS6nPQ+hU752pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1eIx71K4MMtP7thaSHv2tS7Es3S7FuRoV0yOAolBjU=;
 b=zHbGC9nLPhhMW7ziAelt9AqlyqPU1jcPG1/OgewqwgjjG4OvW6uwett7B6eZxJx3tPQ6JDBVDONqxoVdkmR4aXiiCDPkvtt10f2XkcGNATyjrEfgmGZzxBzj1rL3LUQIss7UBkpn5GRbtfeb/bwv/pzlKABiKKvsn+81limZRn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com (2603:10a6:803:111::15)
 by DU0PR08MB9727.eurprd08.prod.outlook.com (2603:10a6:10:445::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Thu, 29 Feb
 2024 08:35:02 +0000
Received: from VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f]) by VE1PR08MB4974.eurprd08.prod.outlook.com
 ([fe80::9e35:6de9:e4fc:843f%6]) with mapi id 15.20.7316.035; Thu, 29 Feb 2024
 08:35:02 +0000
From: Javier Carrasco <javier.carrasco@wolfvision.net>
Date: Thu, 29 Feb 2024 09:34:51 +0100
Subject: [PATCH v6 8/9] ASoC: dt-bindings: xmos,xvf3500: add XMOS XVF3500
 voice processor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240229-onboard_xvf3500-v6-8-a0aff2947040@wolfvision.net>
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
 Javier Carrasco <javier.carrasco@wolfvision.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709195691; l=2173;
 i=javier.carrasco@wolfvision.net; s=20230509; h=from:subject:message-id;
 bh=aK/tqoGoFX3bOzP7we28NQCLoIDGur9v/pKHCEPg6Ug=;
 b=lxweYve4imy32cXmiM2F8jOSTG8L4naBn92Yy7D08gBjoT6vmV10zvSuD+paMf3gY6IH6LzaS
 VJT4YnfvyZPCQv7TEOKiRK7KLqV1s8Qmmr18vmj2WEzHW4io5V7SYIs
X-Developer-Key: i=javier.carrasco@wolfvision.net; a=ed25519;
 pk=tIGJV7M+tCizagNijF0eGMBGcOsPD+0cWGfKjl4h6K8=
X-ClientProxiedBy: FR3P281CA0020.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::21) To VE1PR08MB4974.eurprd08.prod.outlook.com
 (2603:10a6:803:111::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR08MB4974:EE_|DU0PR08MB9727:EE_
X-MS-Office365-Filtering-Correlation-Id: 8947e320-2d80-4c29-76b2-08dc3901529c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jrjREZSftahjCSfgSE7JJ2JE4ClrlOmUz256PoFKLbLinBw0lImNrT5sSBwN7e9jVD/jlZP+kMpFrmovHIOi4T7oiUsSacsecmsQpXRyFpXj+NcHJuFo2CAc+laPKo8pu6pCZ+3VPTCQLh1oh4klQT8cHVhsHJgsj3J2vlXWgumgsormxUwx1vN3JhQ1M4lw6qBTr9tkC5baFIvFviJ8ZHIzkJpNzIXv6NzzsO8JTkqkys7x9/WMZbZNdc3pFEkm8vIioJOY1YS/fHxt3rvwUnSBr3ghPvzxjekc3sIUUidMpGtI2bijDsww77N/ukRAT4Nut+to2yhO+a4k4sz4pXfs2cR4jI63wU0H0UgzQjpP+7ufjcam8GLR9sNKyRrXsObHPe0a7LX5QGPa81nQW2GmOGqP1WFWq6O5rdQ/H1tEP5wobdJTefC+4QFjL7QiCLIhh0UPFfWmw01iRz9ITB0ZteuSTIUBsuM3f+9fQX09kY/xpER9eqFgs1kEVg7FHJUqrq7BVjsHOrZzB7zlebVrFQzVQ5d24B5P6+K1tPymQvY3EuRDmFb4Pxg2FMJtWbRfLzpAnLB1hruXYiy3IUL3/9JfkOwwyA7cGm/joSYSLCASzkw06oMyb28+sHayg9+odyQ9s8NPGIiOt8Z7B3n2Vvj2ya5GwWvG8tzqM7vDB7FdcEOW+83p0TVu62uxukrFqEI8qmEsjQKZdQ7vRxYzc82rXnazNN2zcP/WIBs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR08MB4974.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011)(38350700005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGFLazBhM2pnVzF4TlhRTGxlN2xtNXllMS91N0hJNUp6ekZrcHRpaWJyZFh2?=
 =?utf-8?B?VCtoSlZYaWphMlZTNmNDZDd5Lzk1REhMdk03YzhUOEhzSXJpd2pLUVpiaFVv?=
 =?utf-8?B?b3hHeW1VckR0eGlYdVBpVkpuaUJuaEhCWC9HTXZRU0V3c3dqTGFIWDY1cHhZ?=
 =?utf-8?B?SmZaWExUemFVcHY2eEhLbFBXYlRySWFaZmt3L3c5b2N1ZktGQlE5V1hlMEc2?=
 =?utf-8?B?ZCtlUnZnNjFMVmxwZ0RLeVErVlZKdGtmSTJUVkdzZVdaalkwUzJRcGl6Z1Uv?=
 =?utf-8?B?dlJsWDRzM1QyamlUaWhKUVZCcnptZ0dwUkFsclovdStxcklIS1RPMnhqK0pL?=
 =?utf-8?B?OU1WSHU0QWRndjN3M0wxTCtTb2E0c2dxWmV2WDJxV05uYmxnRFd2M2UzSG5o?=
 =?utf-8?B?bW1uT3grNUU2SWdkTVR0NGhDcW5XTlRVSE56azZoV0RRU0svNVNpOGIzZXZx?=
 =?utf-8?B?Qk5QQVNSc1Vqby9icmFuR20zdWx3ZXBHTnpuMU9wZmJqL1FEY1VRQmg3b1pR?=
 =?utf-8?B?akgrYUg4L2ZLeSs3dGl1dlNPMDh3cWJnV0JibzJxb1Q4SUpYd3hOWVVzSHVF?=
 =?utf-8?B?TmRRSFpJSmY3ZVZUVStHUTRadnIyUTBPRkpUSWRWaGp5bTZ3aU0ySU43Zklj?=
 =?utf-8?B?UjNjdUxzSVFISmhrVjF6Szh0SncreXE1UDg2akRZY1RhZzlEYVR4UktQWGFx?=
 =?utf-8?B?bjJUbWxwcXRLcWlVTjU2N1pGMmxORXZhY3Z2UjUxN3VTTHcrRDFSR1lmMWhH?=
 =?utf-8?B?bnJ5Rm5iODNzbFBvSnIrbHNlK3YvV2tYZWhGWnhGMEpnL1Y4RHMrOXVRYUNs?=
 =?utf-8?B?c0RlQlc5U3BPYlFWbXNTZm1zTzFuVUoyZ1QxNzVLWkdUTEhKQmhEelJ4RUZx?=
 =?utf-8?B?OWxzc2FxL2d6TWVabCtJcG9vMm9KeGJlRXhZZEJzOXloQlRpaXdobWVkNzU4?=
 =?utf-8?B?VmJlTkdJQlhvaXdRT2JLcUxOb2pKQzdqRTJMZDVORk9aVHRudzNVM2lseFZF?=
 =?utf-8?B?dTZUYytDQWFmdkdxWFFyRnRXM2dwUlpRMmtlTWNXbHoyWWlVUkNQdWxGUlRy?=
 =?utf-8?B?S1pDQzJVWVNtM1ozRFJoSjdJWXlmWHRpM3JkUjRFWS9FSkRBVGJqQ3daZGw2?=
 =?utf-8?B?V2hwSGc2UzJHMFlSSmlrNGptUE1aaEo5ZlA4S096MUh5WmE3NzNGRWhWUDd6?=
 =?utf-8?B?WmgwR0dNR2l1VzNpVFB1WFBXcWpaREJ6Rm40SndaYXNxV0orSmxFeWc1ZVZt?=
 =?utf-8?B?VmJRUUlQTnlaT3JwVys1QytaVFZZVVNlczBHKzFhbTd5alVNSnNiYmVFTTJt?=
 =?utf-8?B?bmxzRTI1REcxL1dUSWJBWVlteDVJdmZYYjBEMXVjVUs5Ky90VGxsaDBvdmFT?=
 =?utf-8?B?Y1YrVnA5T1N6UkRRR1grRHh5ZjFFdXJkT1A0OEhrbDNpeG4wV20wTjhHK0o5?=
 =?utf-8?B?a2REejJ5b2hpZ3pNZm5lMWxQT3B4aGthdERVcFZVeWFrVkNaSFl1STY3WVZL?=
 =?utf-8?B?TjRQZ3VVSW9OYnVpUENPalFENTh2Z1pDYWV2UUk1VUt4UjJXUXZpNkRhMFMw?=
 =?utf-8?B?Vkp4TUZpNEtORlNkY0lwMjNVbVRSVkd5bktFUnRyZVdNM1NxcFU4MDVCVy9x?=
 =?utf-8?B?dzB4SDRKOWhrQ294bEhBZURSclZmSTg3U3VGalVzN0l0Rkh5RGVvbUNhYXBi?=
 =?utf-8?B?RzBGeFd2alloVWZRVjdjVHFnNXp5QmRJRVphdFhYamMwdCtWcGt5ZGJOS2gw?=
 =?utf-8?B?RWV6SE1xQTd4SGhwbTlUQU5JQ2ZyT1F1MGkyRHJicDJiYW9OTFVhRFlqS1pY?=
 =?utf-8?B?TE14cVBRUFE3MVpUYlVGWXJjL2REUDdyVmJORkZsUmIrZ214RTBld3FrV09w?=
 =?utf-8?B?Zk5uMUZiTXRqRjRVU29FVVNnZ1poL2JBT3h6bHhZb3JyS28rVVRDQVIxaHhY?=
 =?utf-8?B?TkltdnVDemRDU3l6SVJJNDZkMXZzUDRUSTZuSWNNSFdMcmRhL3ovYzBZdkUy?=
 =?utf-8?B?ZmxhaGsyZkR1UlRzTHQrRHJweEptUlA3Yk1OTmVBZ3RBRTl5eStJYzBqeFF3?=
 =?utf-8?B?ZEVOWVI5K3pNTzRGYVBwdEoybFRDK3AzT1RzMTZhZzdaUkJNcGphemNGY2NM?=
 =?utf-8?B?d3l3ZjRHRWMxYjloUUhrVHpoM1Z5d25KTUVBT0xVVkRrL1VzejBTejVtSStK?=
 =?utf-8?Q?mpE5KXoUMrIZ3Q1MSUJ1Flk=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8947e320-2d80-4c29-76b2-08dc3901529c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR08MB4974.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 08:35:02.4663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lr62E3wHT2O8mkmo8bn0+bwLsU4phLurQCLAIATCmV71vuKmFDtz+RukwSipHntnoZQr3hbccc3UmyvdzfS8lGibyRvsFsxh2Eo84Gc/eWE=
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

