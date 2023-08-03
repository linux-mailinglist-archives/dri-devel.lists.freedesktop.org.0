Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2DE76F3EB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:14:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2FD10E0E8;
	Thu,  3 Aug 2023 20:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2079.outbound.protection.outlook.com [40.107.8.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B11D10E1F5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 20:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiSlexwkeXzA5PYdh4I6xkbFioE8i9JuC+1W6hBpYLMowWAMh5HDf25xBKwoca3DgRUqEnDbRNkJT981hOuXMoNbY8hsmQ7PpkMOUF9czFtStTYDaEnl3/5sk7II9SBp5RDlgLH95XaaTk8xYybtpQIx34PaBirBwHSELHrsjuqMfKdINaTFoBxF8lkOiOkpoNTYZ0N0lxkMW/2kwMpFHaJL3dHKLIIjlyJfIyw6V7zvDXxFpSoNIQoyuSl379mLXeW4kC6kglrRf4YA5H/xacj063Hb7sXZe79rh1qGc5Yx1Vak5NlLxuV6hj/K3KYWzcWPfHxLRIv3YCSzSgTWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QCXRIN1I3230LemB+LqSCz7erRZWynE9vlerojKPFo=;
 b=ICnLDVDdvP7+1Hr+ICMvIiezVwOC1bHgqr+I/lGKOHn+oJ6MVxqI3+rL2V5fM+hli4RS10lVEQMRCt8Ys5G0Xadt0YEwjJDu/h9EPyl9W4IQjRnJ0dO+gKsj5arApJwu945CZ9aurq5+3tXo3/VJpXBHFhfVdWdkXIfb2jJJn2CTKBbSsGhViag7Hx32ckmdyOE02AAMnju9LdkFImAVMlQiXdH+eUAkodx7NwrVpfkyOiHcY75naW1tp2Zav/eXR3O77ij14t4OPtQSj3wYslO3JteNn/qBiXOFigC1/H4A6JLoS53XhKFIiQ7ystFbPzyt01amB9n5gJejQitdfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QCXRIN1I3230LemB+LqSCz7erRZWynE9vlerojKPFo=;
 b=wa5iPsH5tUpFZa2F2tqTwVFSHdAKrQRN3eqqWKyRjCG1kCY7w3K1oO70HHlR1W9U0vzpR9iX1xgfIblDjp00KhJh77L1XQUvKmmcmf5iPOFiYK8H+i5/j0L0qFIWKHtF10+QHvB+xWX3TJhKTCRLEfspqDEF3JjoQx+v3PVG3+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB8277.eurprd08.prod.outlook.com (2603:10a6:10:40f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 20:14:03 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 20:14:03 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 03 Aug 2023 22:13:50 +0200
Subject: [PATCH v2 3/3] dt-bindings: display: add rotation property to
 sitronix,st7789v
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-st7789v-v2-3-207cb1baea0f@wolfvision.net>
References: <20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net>
In-Reply-To: <20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691093639; l=1145;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=PB0tfTx2W3+0I3R0IVOtpWhMbgFN5MTykJQXb79SCOE=;
 b=dDT9X1fQSrvlT41cV5SJFfjuwy7P/XUE8PHPo+t/oYIxcDLSuin8Hewp97Z+fqkyNq3qp3GO2
 ZrOfNc16ruCDNIPlGRLWEmmlPsHlxDALtwX5o10G5/le6tS66NgMVvr
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1PR06CA0212.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::33) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU0PR08MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: d542d29c-0d69-4ebc-ea51-08db945e2e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ry3eSZAQf30Mk7oRYRq95JUxS9D3jzSBmCGp0IyBpaUUWOyb54eXgEpDCqWHGN5zTesg8wWTHQ4HCvR+HIMPvKzYkteSZi3auYYleyYW4yLMfau101NVrnRiox21IXVAmxZhkx6d3wof45/8ZHygsQ+aM+I39oy415eOqBwGbacwDaIGyPjBarW2g7R+17gVczw920yuGpZpOS37I/NBsErvafSPMQFSSWGB2DH04Hcq3o0j7ufiD4GRR+H476Imw2OGvDBaZ8fEi5bVuLIIn2hwpukhFpFW+PpNtpZz8Nm24XQrIyxfmg2YmzQgEiBq7uEsPdDacpHCDJlJ1/yU0jCwr0bMoz7NP2E2kHzGfp3+L/n+RYnNuqjVL27duv7/4xRPnCgFQbF0xAyGs5AF955WwqWQD2gXLboQYO2F7ldDiJrgzWo6PQD1VLcnhHf1E7wcfn24t1yz2hgOfZd/sXWw/6JSPsyOpQjHzNOo1PwHKJ9zXJ0Q3qafGBg5d+bjWBMpu1Q65zWxElsqRA+JnXI6aC5UTJYKTs03vCtVarqV2vvQoeFesrjPvG3mg+BnNgh9hF6tDQesyImdP+eM5W0EwmC+gdWsv+1nObXkghOBOAB77ngnotZEhD5RxPXb4qOQc4NTOGqca2/ZIpp7gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(366004)(39840400004)(136003)(346002)(451199021)(2616005)(107886003)(6506007)(186003)(8676002)(26005)(4744005)(66476007)(2906002)(316002)(66556008)(6636002)(4326008)(66946007)(5660300002)(7416002)(44832011)(8936002)(41300700001)(6666004)(6486002)(6512007)(54906003)(52116002)(110136005)(478600001)(38350700002)(921005)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUtrTHB3Q2hFVyt2cnlLbkUzRHU2eXhzeHJIQmk1VUpua2I5aTZ5bU5QRGRZ?=
 =?utf-8?B?Wm4rV3FCRWUyeXBzUUxSbUQrKzFMWXppb3hnYlIvSUlFaUNLMm5LcndBT0R5?=
 =?utf-8?B?STdtYnV6SVZXN1ZCY2wvbUZ3N3UyZklaWER6RDh6OHlvbHVpUUtVNEpnZ1Bu?=
 =?utf-8?B?V3duZUpBRWlWd2tFT3Jma1JYdTJpS0tPc1hqSFk5QVJkaGh6TFJETVF5YjVN?=
 =?utf-8?B?K0gvZTNPUDF5L01MU2JxeW5VSCt3TTBmTGtORUVVdk83K2Q1a2RQSUlkeUgr?=
 =?utf-8?B?d25DTFVOVGFKY2lmNTQ0WTlsakFidVlpN3Fibk4wa0dvRERKZVFUbjBDcThk?=
 =?utf-8?B?dnRUYnV3dzhYaCthY3F0N3RRWHErUE9qWFZPK0lwMDhYTjZyaU9Yc0JleXMv?=
 =?utf-8?B?T1c0azR5UVZBQXN5MjhnQ2pEOUlZbHhTVVJYa0xoVVJwRmhuT1RCWUFCU0lo?=
 =?utf-8?B?MEg1Wm1OOXRYbDB6Z2JPbngzMkgyVThBMUk0VnFnMGxDcTRCZGZ4YmJJaDVp?=
 =?utf-8?B?NENFUmt5bklzc1BOYjlrY1p2K09NUHdJZTdQYk1RYkwzbzFXbWdJQTFKYStx?=
 =?utf-8?B?Z3ZzdmlyNDNXT0VYNUNIaHRYSW5FdHpCVVBJTjBIUUNxYjA4QWF2TkpyS1ly?=
 =?utf-8?B?Q3ArRlhrZzlYK1dibFFGODRSRGFsTDQwMWhXajdJb0RwVGVjZVBxZ1Z3Wmcw?=
 =?utf-8?B?ZVN2QjRjTHVFU2Y1TGVVUmRFUEc1MExTWU1mbTREUmN0WUNDV3hReDFveWFC?=
 =?utf-8?B?dEttTGo5NTVKYTdQSTVHZnlJbVJ1R3czRlM3Wm9DK3VxSlBBY2VyV290c3ZZ?=
 =?utf-8?B?czhvOSthdmRadlRmUU5nenlZVkkyUTJBVTN1MG4rdkVpSGVqc1hyanh2N2kw?=
 =?utf-8?B?U1JLSW1OVVRNek5rMGV0TDB6eDQvbksrTkZsY3FnLzBXcDlFRlgwRGtCSThN?=
 =?utf-8?B?bThWV01XU2JqL2txczRCaHduaG03bEVvTWFOSXh1MkFNNlc2Y0RXZ0tEMU1r?=
 =?utf-8?B?MUpadHlhWkoxWEoxNFNYeUxoYzR3enVBUXI0cWp6QzR2VFN2NmF1TWRQQlNX?=
 =?utf-8?B?U0VUSS9nUEhzSFl4cE91MzZUOXNWU2pFdWtPakZGeVQxSEloQm9UdklSa1hO?=
 =?utf-8?B?ZWJTUmtTVlhaajZxcnc0bFlOUG1TdnpTM2p4b1dmbHE2WlExTGcyYUZKbFJR?=
 =?utf-8?B?WHliYVZ6YzJDMjRiVVdGUElkeStwNmI3NUtPNno2RGkxOTh6Nnp0UWI5cW90?=
 =?utf-8?B?R00zY3dRR2QvVXBYUkJLUGhUcHJ5L2M0K2xTNFp4S1V4VkxLeGJNMGUrdkRv?=
 =?utf-8?B?djRqS2h6QlNBTjBPYUd0dE5KWjZUeW9UQ0JzOWVmSXUwU3cxVTJwMW1qUHc1?=
 =?utf-8?B?QXFFMTZzck5EZHhjWVc4ZnZuMUVFK21pbjFDZ01rUUlCMkdDQzYybnJUaXln?=
 =?utf-8?B?a0R1eWVKS2FQeVM3OURhRUFjQXJkTmpTaWlhVEZ6dTd6MldmNksrV0lWbGh6?=
 =?utf-8?B?Z2dEVHVqNms3bXNuMjlNTTJyM3lXNGxuZDJwSEpZRUZiblh0TEhma3dycEJm?=
 =?utf-8?B?Y2FaeHlLSlRja1lqek9lVXZ2aWlBMEdKQWRNYkFGMXY4cWxOWnRhN0ZrdGpu?=
 =?utf-8?B?alkyVFBzUExySVVrNE5uTVRkaG1GL3BEOFhrTWhZR3VoeW1DanpzYndXbjFQ?=
 =?utf-8?B?aUZSVkduK2hBYmc0aGFsT3lFZmlMZEhIb1RuL3pmOTlkZGFhakw4SmMrSWNo?=
 =?utf-8?B?TUdJMmU1dUtldnVWUlBXVTdrTEVtYXd5TklscTlsalBUaGs3SytnYzdyT25D?=
 =?utf-8?B?UHFxcFU4TC8vU2R3NCtZQml6ZmNaRDZ1VTFiYktQZEF2Yld0bDMzVkx0Tndi?=
 =?utf-8?B?a3FRS3JMNmttQkRlREQ0dUtCejljbGNGUlJTalZoYjBKNkpNMVJDODNZSkYr?=
 =?utf-8?B?aTRUMWJKWWdubFM0N3NUb3RNQUptOHpUNDFTeHRjVGFib25RUTNTYVc3NHFz?=
 =?utf-8?B?QmUxRjBqQWhwelh2cGtOczBZa2Z2M0NvWVgrbXVXNlVCa1BVWWhyS2lnUU1F?=
 =?utf-8?B?NXF4M3BUSS9MQUgydlJ1SWFyNFFJWmU3MFNIa2hBTm5DWFAwSHEwNkY5R2I4?=
 =?utf-8?B?OEFjcTFTQ3luWkRBMDdNS1V3OGVudHUvSGF1N0dSMlNSOFhab01TeXg0OGtZ?=
 =?utf-8?B?S1E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d542d29c-0d69-4ebc-ea51-08db945e2e76
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 20:14:03.1381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ffu5PPHw6p68R1PaoxXEjS5K47lmQ2oIjdzkIkfG84Mq3d/RERnKhZMH9S6DrfTdFOX8N863g35SQynkHBs91H6pfwbFMTCRNTd5qVRlZTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8277
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sitronix-st7789v driver now considers the rotation property.
Add the property to the documentation.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index fa6556363cca..694d7f771d0c 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -22,6 +22,7 @@ properties:
   power-supply: true
   backlight: true
   port: true
+  rotation: true
 
   spi-cpha: true
   spi-cpol: true
@@ -52,6 +53,7 @@ examples:
             reset-gpios = <&pio 6 11 GPIO_ACTIVE_LOW>;
             backlight = <&pwm_bl>;
             power-supply = <&power>;
+            rotation = <180>;
             spi-max-frequency = <100000>;
             spi-cpol;
             spi-cpha;

-- 
2.37.2

