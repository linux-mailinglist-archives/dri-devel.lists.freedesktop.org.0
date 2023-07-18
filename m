Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A486F7580ED
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:32:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8754610E36A;
	Tue, 18 Jul 2023 15:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A525710E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:31:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E07NkhMDLJmNM9u3zTUHxlKZHmTkZJxws4+cxhKgWjrHmc8Swm7GiRrCfUzde5m8JXvYQTpsskgble76ktg9qfHjjcQgnfjUrqp8uGQ0uU583mlCAKUskQdLpP2J/CSGglyuFlAZnEG2kQGj9/7U5rjsV94YENzFe9PtSjPqn2mg7vGZWv49DCZ+NJZqIpNKfYu/PpbEr+Wux03N7sy+Ykoq8MsOui3fL+sb0U46adNEArIyj08Wk14LZk757NpiykmXiuHORy003ocnifZHBzHW1ywEIlwp7i8miHiFE+1/cs35TZagIOcpi9Vut/13MAxFsqTGR8nVzNg0cZwdoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duJ+jxzUrXUa/0GgAspixNT46XMkNthvAifbiM8Pu3Q=;
 b=gDuR0dN41IakhVbcCOSgoY902SNOV5JMJ7hnoLNoyxNb5TxMKCcg36R9A8D2SS7CZvjV/c99FrlESc3FCfyf2mJmCrH74zvOZihZ6RMlUpkPXfPJzd/1rnPWJ0bkea2HtvAQMR2p3K6/nT17GYB8ujWDIhUSKuGcefjDVTw6rFGjTUwYbZdP/jH+nFOwvpCIIketx1Lwei0btNBD/l51kkp4Ce1B15d9/T/4hC/OX31LOEjfK4fd9hoEc2Lnazu6gj21ffEDa/2ekCpNzXtsdTUpVhXd13EeLkhfFAoPX1LUm0TLvrpsxNhPWyA8Sp3GybhMKwL+ppngZP7cfrUGpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duJ+jxzUrXUa/0GgAspixNT46XMkNthvAifbiM8Pu3Q=;
 b=PPxZo4+NuNVJDkmwLwTUt+fdRu5fTvAY5GNy8xA0y/YHqM/Edg0q6G9GQUc3Pjn4FiGsZzDbmtQWjEHyvPsC10KZkigL8M0GZq0sjWLKqqFMkI3/e0uVB7SNabQJdxjJ0WAUQOFnbPMADoFnCt9kaA3nReP4yBWentu6g7R5OOw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU2PR08MB10201.eurprd08.prod.outlook.com (2603:10a6:10:496::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:31:54 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:31:54 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Tue, 18 Jul 2023 17:31:50 +0200
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: add jasonic
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-lcd-panel-v1-1-e9a85d5374fd@wolfvision.net>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
In-Reply-To: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689694312; l=850;
 i=michael.riesch@wolfvision.net; s=20230406; h=from:subject:message-id;
 bh=pizIoCVzWQ6pHdKcVc/LnH1AyKvbpZTNhUfr4pYE+qQ=;
 b=4hWFkrp5xlPcI3v4Wagu+yK7CQJ27yzYcrgiCYdGLXMdyNZCCYrXDVG4JYTemhKbZl/YklXEX
 MEc0B8HNCfoC5Ckp7nSgDR1FvzgQyFI6p8Jvg+TVXg2HtHkq/hf0phn
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=G03kuYHL670EcdsWaNfVA7KnHWmkSpj98XziQm/hjbk=
X-ClientProxiedBy: VI1PR0102CA0027.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::40) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU2PR08MB10201:EE_
X-MS-Office365-Filtering-Correlation-Id: c6a8742c-13ea-4888-da2e-08db87a41d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eF8WBWMq7x5tiZBXS2E3fzLzb0uYvi6X9D7vvSjqs54Y5Oueum8mK+dvjWTD3uDEE6MTNvjrPnQG4/WgNSjoHoLbYKVgzFgbOCSO4bXFIbY/CPw79nmpVAc3x5MF5AThz/G3FKYyfSag8pz3GAgmJxZEdid3gu6+Y+5PRqCDbHrsskD5u6ET2Ta8hfttCDu1uw4EwFCuaBsypI22cW7yjwigH/cEXju3ElVQHehDuCL+ECFJgmQ6IsuOtetxBdVNsFgW0vbl8kV3WId/rTtvkpMCjKjN4T0ZXIZJNKSO24J71CF6sMYkb1eNPF5wWqH9GGiyadjPXnHXNhJ4KNp+1+8q2ua8kc7WwT7JfE4kCvg9b6/AeJZoN8n4o0jClRXLZpBy5XW2dXDcMaU32y5afZ6PUjJs1GnQb3UaqVsX3LvTA8jOrgzuqV2K3c68AY5dc96eYHg89dfjrbFwf700x47pBLoXaPEBUK3qgwuCZRuiozm3AA0r+J/DCJhtFtuFVpQQx+rbzXL8L5Qvnt1CCwl4cnTIe7Mdl/IeUTb78CG1XA5kOzh7kYmMvCn+LuqMDr5NM6d/hPdXzZfh36NabAChZ7KTeMv4MuzeBKNi8hU661A3FPulTLQAdIHFycLsYfEOoO5RzNzGIdTfWVEGxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(136003)(366004)(39840400004)(346002)(451199021)(6486002)(107886003)(52116002)(26005)(6506007)(6512007)(38350700002)(2616005)(86362001)(38100700002)(921005)(186003)(36756003)(8676002)(8936002)(4744005)(2906002)(41300700001)(478600001)(7416002)(5660300002)(4326008)(6636002)(316002)(66556008)(66946007)(66476007)(44832011)(110136005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bitaTE9kMXpoYmJBdjdNa2FiaWNHQTFyUnVVQ1lEYmdVMlFqUk02UmlxUnJo?=
 =?utf-8?B?WnhrT05PUXZMTlZkVVR4L1BZUHNObnU0dEZhS1hVTGF2YzBKZldYbFNBV0VB?=
 =?utf-8?B?bnRoMStCTjhqZEQ3aXU5WTRva1dwazdUcmgySzJpaFJHTlJVLzEvb0VieXcz?=
 =?utf-8?B?OU52OHNGMEI5cCt3TlNINm5QNTBBbkkwdjlOd1c4ZzBlSkRwRGpkZkwzV0tn?=
 =?utf-8?B?bXR1TkRJeXNYQWQ3aVRPc21vcE1xb1BlOEp5L0h6cU5sRCtjd2dQOEIzOXVG?=
 =?utf-8?B?N1ZJZVdHR3FibFhUNHM1RkxuKy9VNUJvNjB4YzRqaSs4SzloRHkzYjM3Uldn?=
 =?utf-8?B?MTVyZXEzZklwL0RXM0RsRmFMSXNyUXB2SmcrWWw3bmgxbTE5cWprbnRFYTVP?=
 =?utf-8?B?cGFGcXF3WHY3SnZDUTdISFY2N2RyeXhGeEdRM0RlTEVIRzRlZHVaT0xJR3dw?=
 =?utf-8?B?eWFkN0RCOVZMSDliVjlGM3JRYkhWazJmZVR1UzRZNXlzclJJN1VKbmlJSjdQ?=
 =?utf-8?B?QmpwVXhicXBraFY4L09Ya3c3cjBENEkyWEdtb3dDWjl3eDN6NVRnMlNDWXBj?=
 =?utf-8?B?eEFWMGY0Q3BOek81ekkzY2t5YlVOSTJiUHJEVVkwZ3lRVC9mekkyc2dTakZr?=
 =?utf-8?B?MlFDL3hQaXpCeEIzVlVHdXJVNlhsNWdsRm5QdU82K0lFbk9LU1k0SkNBZkhR?=
 =?utf-8?B?aWg4YUwvaVFNUVU4SnJLRkZUSzJkWXhCUXZUNGFvRkY4c0sxR3hHcDZPeWVx?=
 =?utf-8?B?UU9Ld2lIOUNNTTIzNkhLazl3Skh3aEFsNlFTM2R2TWFpa2R6T0tzL0FhWVJ0?=
 =?utf-8?B?eVhOVTYwb0NHT05jYWJFbHQ2ZEpZVjF1OTdNQ0I5UDJHNFJIRzhGUjNVWlFz?=
 =?utf-8?B?d1ZucVBDOXFvb2huRUZXcDZFTHRRSUJzekZxSThKanRid2FMc25VNi9ld2lw?=
 =?utf-8?B?QjhMWUQzeWpmUlpnY1hjZkRnamxLT0FodGhkV0ZUL25CWlNYeUFNKzkxSmkx?=
 =?utf-8?B?SlE2c1g2cmVoU1JzU3VpenVyUlR3YjNEMS9XT2t5VTF5QVhCc0swUTd0QjlP?=
 =?utf-8?B?WFdMUVVrZnJuakJpYi9yUndpNFQzcDVsbTdPMSt4a2VVbWt2MHRXVHZWL3FI?=
 =?utf-8?B?NEpBUnlIYzVDd200Y2NyR01KY0Z3bGtlQis0OXVjWDViZVYwd0oxa3NkTnRI?=
 =?utf-8?B?ZDNuNm5JcDdQUDBrclFGWk1iM29uTnhYMTlOZkpDOGdpaDBHdDRadmZ6bGxz?=
 =?utf-8?B?ejgxWnBoYitiZXRBVngvVWJhVzdsaG9pZjlJSDdYb3J2VTg5QXhMaG5CUXVZ?=
 =?utf-8?B?elZuZjY2QVRyWlZhbzdoU3gyZnE5SlZjaGVQME56UHFDY1dSVDRQTWZpb20y?=
 =?utf-8?B?RDcyUlNOUjJTMmV2Wm9qNmtTZG5wSHB0ZzBidVdEZ3JDRy9Oc0g0MzBWcmxx?=
 =?utf-8?B?SjZzUmlsNkNIV1RIbVIwaWphazdFdG1ob1hHam5kK1N2Sjc5Vmw3MlI2UHF3?=
 =?utf-8?B?Z0VIdDA0VjRRZnpPeVhxMFpjZUhyMkg2SEw1MnZ1bkcwK1JXYVl0SVhPSzhP?=
 =?utf-8?B?aUJpcFpuc3c4V2tWZDRQb3lQWFBqandCSWVPaW5RM0IvTklsMXZXZjluZlpL?=
 =?utf-8?B?ZWp5SEVEOFlQNHRyWXhzUWtyY1JURXg0enBlRUxETDFxdXBaZEs0TzJyOTFH?=
 =?utf-8?B?UWNMcFJDbXRzRSszOWhTK3BNbnBBWVRzZ0YrdUVHRG9oc1N1dVdxMzN2TDRn?=
 =?utf-8?B?K2taeHdHaytybFRFeUpKMmJibVBjeklTWTFXbXEzcE5RZ3ljWEJvOHlubEcx?=
 =?utf-8?B?OThuMW1kODRSS2p5bndpNndSUU5yNW1YZzFidElVVmkrWllwZEVma3IwM3Vu?=
 =?utf-8?B?cVdPb0piY2x4UkRJOWRQRlRLUUFkOVljZVJvWlZ4Z2NyUnRNR0ZVVUtxdTFR?=
 =?utf-8?B?c2kyQkJyQzA5d0JqRGE4dzFZRlRXT0VkVHp4aEtMWTRMNGlVdzUwUG5SRkUv?=
 =?utf-8?B?NE9ZZnlHWGd0SHYvejhBU2NPWmg1c0pEaUlEbUFZVU1ZODNMRDdSZjZWZUZR?=
 =?utf-8?B?VDZZcGhFeWNta0JjT0gzamVkTld6Sm9sbTVPUnpJbnFnaXVWSlZ0OUJoTnIr?=
 =?utf-8?B?cWE5WFU3WUowZFdWMldCZXRmNDFtRCtadU4yb29UMWdPczJ3cE1kU1VPRDlC?=
 =?utf-8?B?TVE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a8742c-13ea-4888-da2e-08db87a41d81
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:31:54.3394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roe4AEX9aj2G5eF5qGr5WNQabRejCoinZplJETVvCWx05+siqw7OjqdBbBhGJa4LNuNVYV00TlLtyqWHm0BZ9c8FpGIcMaGse3PeosMdC9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10201
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
 dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vendor prefix for Jasonic Technology Ltd., a manufacturer
of custom LCD panels.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1e2e51401dc5..1dfafc339ddd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -677,6 +677,8 @@ patternProperties:
     description: iWave Systems Technologies Pvt. Ltd.
   "^jadard,.*":
     description: Jadard Technology Inc.
+  "^jasonic,.*":
+    description: Jasonic Technology Ltd.
   "^jdi,.*":
     description: Japan Display Inc.
   "^jedec,.*":

-- 
2.30.2

