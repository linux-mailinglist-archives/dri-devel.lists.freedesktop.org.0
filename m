Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6465539F60
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B725C10E4F6;
	Wed,  1 Jun 2022 08:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2034.outbound.protection.outlook.com [40.92.21.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C45610E4D1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XBlW3kvQpLFGspHrCiKCBIPSyejGtz3h/4mB+6lyR6/9EBW8g1LvWEEu1Psqe/5Arr7g/TiRx/xjWwOQ8/4E7KX5UcR2cjhgeb9VugQTbXU7hbgyGKe/uCE5uwkODbdbi/14Uh9/cdG0qgdXm7OaUawdnk6SYr0llie8ANKhW6y/4ABQq3mElLcB2OietzGQVGGI8B6AHub+sRC4erx/qST2pdnKtj24+RlRt5tnKIB092hGPwS+XV5EJEhS1GdT0W+/cvKhHVoAJptjUxADto7gCg2fCYOkXdbr/iqwD3gMlEvD7apY5mtqy0Ev8ckOtRyyJLtp3w8Lnrq6vX39bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xAhCxglhjETDo1dxAJqXbFmX9hh34CCjHj2E6dHtQC0=;
 b=JHg1KjOe72ibGN1hBHsjGgvov77qUFvvijdT5fe/EK/xmDXgtexE/WNptOp8KxvlGU3IGatVc799ng1xBChDbSXT15u33dN0Ehnc0RrXz9OpgqqpmKABdXr43jwiovyFUIRxoS9Z9g4yJyIWudOKBeb2Wh+MP4wuGeNgA6iCH5iI6qilRv24yOz9jppUwHBJ7/HoLAEI8y+LNgEm9D9v8GTxOhk0IlNbIkwZo/vkerpAbC+ZeGYyewf14YEj1/9i5whGW4ZJkWuTJIzryDNsDV21ghF7BfeRAmbTOXR0C8vrqB1AWvMJO/DsgIY9wjqxlGu93VICb31eKfIvgbxPUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by DM6PR02MB5708.namprd02.prod.outlook.com (2603:10b6:5:7c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Wed, 1 Jun
 2022 08:24:44 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e%5]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 08:24:44 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH v4 2/4] dt-bindings: display: Add bindings for EBBG FT8719
Date: Wed,  1 Jun 2022 13:54:08 +0530
Message-ID: <BY5PR02MB7009E821B0D4AC20E11F8F13D9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601082410.55266-1-jo@jsfamily.in>
References: <20220601082410.55266-1-jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [wESAOYkhkOs+GrHj2wd/EEN0ebDE/QSWI89BfDTMrretPz07LuCszqa6j+zKsMAS]
X-ClientProxiedBy: BM1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::13) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220601082410.55266-3-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: feb48d2a-2109-42d0-5f36-08da43a82e4b
X-MS-TrafficTypeDiagnostic: DM6PR02MB5708:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eYQyuVBV/n59VcWWqCJjkMlr6evDUJDIi0uDu7bEJufJ9J5F2xUxCG6gCKd7feHbDGICqxNCZT2O2EKVCyxc3GldZH+Pg4hLuO6VWSEXWjtiU0oB7kPwX8+p/ZsosOJWT69Uy50m1FzMxCzb5DDHXkJvgBtAtw8Slg3G0yzqNwktBGeyiEO6SiatrPjix1+M0BDGEdh0478+4N4Ar0QURq6V/fRyEXRK34NAPqNMQfTeegsWLnQALiS4+6FjYj9oOINi5YmaGyIFLHLYgBvk3AYqTy4UkTNC9FD9vFaJxr9+pIwClbVcxtoq+aAMU6pNt6O4fEQrCEd1fScs1JXESBE5DAlxdbFO9++f6G2eMCs+3rTsO3qHiUEz8Bo0qYZVAjS0iHX/rSUsMxiZ8ACRsO2UYn/XnMuXkebRc63DV96rl/6g+sXsVAtJ3uwf68UoKZfoWB2kywMNrtKCzLxG7tjHY4m1AYe58tXWvfB3FJJ76SuMfk0yxVSdCikHCWeZCCyVdU5k1sNFoJCxOnERMGgWxqBOWLXcf67l/AJI8xHdWzn0v7Oi+dFSBMvzAYYibbpBdZN+Knj//YElMlCjiOJLTg1tNepsNYOcCAikia65GG+ExOQzf+NYv3fxu86O
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kICgw7OF9Ww+19kT9HrRYD+/UrBKBXE1QKrErpC+TRhE2ROhAWwHUmAFFg0d?=
 =?us-ascii?Q?ApimFYJjGVifXx+KiX5AVMD77/CRrbaq8ra2TWqZd29KdNnHctwJR5gNbM3v?=
 =?us-ascii?Q?B143mCK9DT5/wGn0GSrk5vNiQFRhHP+PimTxmw018IfeBagTdoOzhFYCCODl?=
 =?us-ascii?Q?jVV3D3ufphfAIbDfs47JYS2OBTgZh/bmC3imjWNUbweLxHzTvDAxvicZ5P+V?=
 =?us-ascii?Q?c6bA1w4IMMkOhilPst3r4+2YFtD66x2I8a23ltGQveTwZXyw2fki2OBnsn61?=
 =?us-ascii?Q?HQM2v1t7gKJJgtXTd+bHvQYZznGcmyFEy+84DN/tzqW29aKc2+vYsZVELlW4?=
 =?us-ascii?Q?Ec8EW1SXnkNaQYh2WhjluTDjn/Y5cNubFjznxefu2w7JiwoECTabzIs4RHp+?=
 =?us-ascii?Q?il1ZQ4lYqyQhUBW+siPwMOgj5oElFQYVQ+Ey4WinUOa9F///fKZWaRG6tn1v?=
 =?us-ascii?Q?3RY3huPjOt+zLuWi8mVxEgO4nrfounqcYrOmfcqx9peIwUTxCRKXCNFzfaM/?=
 =?us-ascii?Q?nqvEFL4nDDFe1cinJsoBgHmX3nnKP0BphTCahQXlDqL7tasEANWqH6leoEcP?=
 =?us-ascii?Q?T6egJNh1Sxt4LG0igZymbekjVFhjJL6OJDGcuBa8O8Z/9DBhJpsws36simvK?=
 =?us-ascii?Q?truO3pzp6NaNSEg8JGqfnbQ1mda8uvpXe45FXUPh88Yv4C0oIXKhI7K8fkXr?=
 =?us-ascii?Q?8YqZsrVmz30j27DRy4i0x5iAQaIHUu2f2tUPhTVuy65BCd54ya5+giP1jZAr?=
 =?us-ascii?Q?MiOs41h6vgAjn8Ug8MR2KfzhFlwY7bZVBsTX+PkIk338Y4DkDbH6pAZiuKnU?=
 =?us-ascii?Q?on6JANkiiHgXkccB2lM4RT+7SIacFMNkCU+8kuZHx5PRRi3s10nt077grLIC?=
 =?us-ascii?Q?sTxY7JvmJ5tBOXiI1mFLZt/eHH6Ye+5YNULSfd1THzierEGs8UJYqWmQLyZ0?=
 =?us-ascii?Q?ggmFsHEXyjoKh7O4myVq4e3JQKwLMxvsNwfoc0zsxB7DyA1e1khJ/3wrnSbg?=
 =?us-ascii?Q?5uCI8eQnqXvgdmqefeKVuuEb5+Mauw+i3ZSZEer+nsraVqYRXp89GY5pcVXT?=
 =?us-ascii?Q?3WCdefxugXbPS9OmA96K+5bPtVexjg1Gf1FldF+1TbRJ6wbG9lDxS81DLqFn?=
 =?us-ascii?Q?4EKL7SHEViKrtOI2x4sknmGk3oJ8F7Mhdntw/cKHb6FA9NS5WJloofBCQNOG?=
 =?us-ascii?Q?oyfCLzdhHp349bg/iPG1EaL4BDV25mUuz7RalPPBbBRPsaIPIH46NIoKL0sC?=
 =?us-ascii?Q?0P6z9L7DqXzoxPzy0YBJ+nxUUw30YfIlf14/loqbcaNMJAAmHgQvxwlg5IYq?=
 =?us-ascii?Q?LrzDo8piNzfGMaTcxK2jwS2m6ts+aW7ZYALqnfvwE890VVYzCQv65cIOcCMf?=
 =?us-ascii?Q?i/3dAOgvqHPV4srjb07QNMbGZ3GN3oyCQ1WX/uo00IMgfJvL7+wp6rsGkp56?=
 =?us-ascii?Q?mbWXCR+5KxnJDR+a+oTkgJyNkYDvCI1iPjCiyOjjVtM39B+TRL4HZw=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: feb48d2a-2109-42d0-5f36-08da43a82e4b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:24:44.0510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5708
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bindings for the EBBG FT8719 6.18" 2246x1080 DSI video mode panel,
which can be found on some Xiaomi Poco F1 phones. The backlight is
managed through the QCOM WLED driver.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2: (Krzysztof Kozlowski's Suggestions)
 - Specify maxItems for reg
 - Cleanup and simplify the panel properties
 - In example change "|+" to "|' and "dsi0" to "dsi"

 .../bindings/display/panel/ebbg,ft8719.yaml   | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml b/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
new file mode 100644
index 000000000000..80deedc01c7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/ebbg,ft8719.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EBBG FT8719 MIPI-DSI LCD panel
+
+maintainers:
+  - Joel Selvaraj <jo@jsfamily.in>
+
+description: |
+  The FT8719 panel from EBBG is a FHD+ LCD display panel with a resolution
+  of 1080x2246. It is a video mode DSI panel. The backlight is managed
+  through the QCOM WLED driver.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: ebbg,ft8719
+
+  reg:
+    maxItems: 1
+    description: DSI virtual channel of the peripheral
+
+  vddio-supply:
+    description: power IC supply regulator
+
+  vddpos-supply:
+    description: positive boost supply regulator
+
+  vddneg-supply:
+    description: negative boost supply regulator
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - vddpos-supply
+  - vddneg-supply
+  - reset-gpios
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      panel@0 {
+        compatible = "ebbg,ft8719";
+        reg = <0>;
+
+        vddio-supply = <&vreg_l14a_1p88>;
+        vddpos-supply = <&lab>;
+        vddneg-supply = <&ibb>;
+
+        reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+        backlight = <&pmi8998_wled>;
+
+        port {
+          ebbg_ft8719_in_0: endpoint {
+            remote-endpoint = <&dsi0_out>;
+          };
+        };
+      };
+    };
-- 
2.36.1

