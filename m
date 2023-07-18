Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1480F758085
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 17:13:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2FA10E366;
	Tue, 18 Jul 2023 15:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2053.outbound.protection.outlook.com [40.107.241.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7990310E0ED
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 15:13:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPp2llCgNtaCzg5hq0ioRvwMs8aMlOMrmC1Z9UTgzHPuCUQejJBwOA40u8RBP0AXShwsa+pdWmRcMUHj+9K3TrEDIS84gijp4jMhlc1KqArq1BtKwrAIU95N1Uth7cWD85x1lHbWB926c9EKJ40eMWZd8L186SFVPVYKs5bUHVBqRwNPqb8+3dlWC21+X8eG8bP5qdqCZQsr+Bi0Mqbibr+CSLsE/OH0Cg+3sUfYbb2kO0xrCPZzuiM4x8SdDpf8y/Mad/QtpySleLU/OMSLozn4qEH/YzugbPSiVrMFdDN0484971HQ23AmjMViqwTLc+ZBvcuyb9MA8q5USH4ddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QxIdY84z0xxjFqwr/cZUeQ2DRjRRdNEfJ9XkEmTOU8=;
 b=cz/x9N+RBOM9OK1wT/pJYuA+m+jCsXWbtXnPGTl4MUmyiLrKm9hBUS2Sy4D93WnlTNqzVwWFT44GqEzbicE+KZKUdz6VwpaQM/Vui/BHGOh1sNA8I096Azo+NGrxo8cunUoC1W04gxtVYaxu9SaX1JkdJRs6vEZsdv0pPYwXo/FBAX4jtOel91CK51FFlJlB3mqsbOhWy7X954rnyr3fxbQ1GoXXHrQJ76yveD3LmBL1XV9NeYM8eKAmIwD9BKX1bST9PBDvRPQa+2Sugg8olTEPp7DjeZAoDEtbfuX/N8jYkuMpzlNZTL2Ib0WrWEAwWqv9JGDDSvlWaIUQxgkltg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QxIdY84z0xxjFqwr/cZUeQ2DRjRRdNEfJ9XkEmTOU8=;
 b=o0cN7mAtEbVFos4CSGapL/UqF+T16nSOb1FGcV8iKy2a/vHXk4mlxsLEOuXGUuD4QT/nCLMsOyQzg9jNbpFr4TcluGBLPaggWgSnvzJ05IiOpHTd4VkUQRttveQMdiuV2ld1aJt65rdMnmZTzzGVyoBgX4dp6qvNhDUU9PSmj5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB8PR08MB5482.eurprd08.prod.outlook.com (2603:10a6:10:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 15:12:58 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4fd7:91a9:a92b:295a%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 15:12:58 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Tue, 18 Jul 2023 17:12:46 +0200
Subject: [PATCH 2/2] dt-bindings: display: add rotation property to
 sitronix,st7789v
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-st7789v-v1-2-76d6ca9b31d8@wolfvision.net>
References: <20230718-feature-st7789v-v1-0-76d6ca9b31d8@wolfvision.net>
In-Reply-To: <20230718-feature-st7789v-v1-0-76d6ca9b31d8@wolfvision.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689693175; l=1092;
 i=michael.riesch@wolfvision.net; s=20230406; h=from:subject:message-id;
 bh=xasEM9onlPWsBYYnSK28EPXsUvxEy3rE5vUNZ+nYS1Q=;
 b=be8lxs0W7YjHFzDZXP4aWffPfqjPR0Ybv3oV8YGQts4YiwYM1DtnK5DS8JZHw5chpjsZI/rE/
 cmVoNfsYU11D7tvxxT660Fuu+YF4y3B30Vm6Ap7Qe6EKDGGrQbR9uDX
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=G03kuYHL670EcdsWaNfVA7KnHWmkSpj98XziQm/hjbk=
X-ClientProxiedBy: VI1PR08CA0247.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::20) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB8PR08MB5482:EE_
X-MS-Office365-Filtering-Correlation-Id: fd177a17-67ff-463b-90fc-08db87a17843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dxfRtw1LaGcQggA/KJhhDm/Vxh5fMXi0oZMrbYT+o7AKFSywQbk4IMKy1GbnUaENdVK568GZd0/K5uvaggj0o2zQfPzo9XgTgnrphKHSxoJd6R9OgIy+PndyYWs1n5hTq/5AzL/Qw40PS/MHyCgIJT4FJa3/fDUByPe4of9PtCVFNk/d7NUNm8ySQOGqudcf28YpdDJf7adtRjaF2xVdmOoDVthurKsKOqEQAUXCJaF6uduNkYKvQsx6bHjxqbrKgdBmEiwjAot+MhKhKNQfgQ63Bm8JnsugGuHBLugXQZWuo3oaCF8Jgq/XnzcT9BSY4WE8b6OTtRUXPbdhAMeLUJ3CBLIHzyQmF6mKSdi8g4Z+S+7e5FWiO8CQSXgjGswvQ+cw1zzFVlujQ7MLluuo6vAC8lbnEYmoDAzGIr5lTZyj8cSi+dYOYKMfdDjYty71sPIeVytBM4fOD+Jk5Rb0MNJ2kv0kabcsWK19LVxiB0D41rLYfCNzzlRejStNUecFCXFSmGTasMVG0GVAUAiB6HAWIEJ8SwHFYNWtDV390VqIsAvOkGZOwFyreE9Up0HE/wdmkiAK1blQMMXSyZqHqGVB2dg0LNDKUgiAmQN9aU9OaK/OYhxKZVhNMf4cNJUpiAaEHaPQJVMo4dzc2btBag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(136003)(376002)(346002)(366004)(396003)(451199021)(186003)(110136005)(478600001)(6506007)(26005)(107886003)(6666004)(6486002)(6512007)(2906002)(66476007)(2616005)(52116002)(6636002)(41300700001)(38350700002)(86362001)(5660300002)(4326008)(38100700002)(66946007)(316002)(66556008)(36756003)(8936002)(7416002)(8676002)(44832011)(4744005)(921005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzVKb0JQSStkMm1UYzdLVVJLVStQUG9BUDFEMXlqWjZuUjU5c3JhRVhLN0Uz?=
 =?utf-8?B?UE04QzZETWFFYXNxZHRpT3NPK29EU0JxcTUzSGVmQ0ZOMlFpV3JXci8yRytl?=
 =?utf-8?B?M0xxT29tV2ZxekJFQkc1NFdiRitlV3NnKzdnTmNhTEV6NkhvTDBDVlZqeWcx?=
 =?utf-8?B?Mmx3K3hQV3RaZVB2cU1DNGJla3hJQnlZazgremtxZGY2aFhPUzdWVE42bXhO?=
 =?utf-8?B?MTlvYk9ubTZNem4vdVZQUlA4N2ZwUVcxTHhCdms5S1dNaWxoazJCUS9TMDdZ?=
 =?utf-8?B?Uk5iS2Q2Nk9pMU9XcklYdnRTMDVjUGErdUY0U2QrdGZkUUYyMGJaR2tPVW40?=
 =?utf-8?B?aDJUY2xaR1hoQW5TUjcvUUdqVWJwdkJsSWJVQlpCUEJQTnpzL3dQT2xLcjhO?=
 =?utf-8?B?V1NiNmdhdVFKOU9MeGRYUUhVbTVxSlBTZWZCU2JpQ3I5cGlZZ2JsQmwrYkta?=
 =?utf-8?B?aHhCWm9Nc1hYZjhJS29USno4emw4cGZVWUdxWDRBWGhqMHhyUm5vL3NaNHRz?=
 =?utf-8?B?NkN6WmdWR0hyamsybnF2bEd0aVpiZUJscCtNZjcrR3lJOWZCUGg4WEwxMjJw?=
 =?utf-8?B?SzVZWXRhZUNtdzB0R3puUmo4YWxNVGdKS1Zoem91ZTZkeG1VZnl5SHRESHEw?=
 =?utf-8?B?dFIzQlB5UXYyTmpQWDRveGF0VWNBUW5xUkhiWE1Wb0htc2g0VWFpL0liNHJO?=
 =?utf-8?B?L2JXWlNETU02enVqVUJTRXRpWHYxRitBSGVoMGFNRndLVXhDeGduNWlwcTY2?=
 =?utf-8?B?U2pQQ2xsK3BIOHIwL0FDZkxNbFZLOXRhZUNjR0wvQXdXcHhFbk5UcnZ1WHJv?=
 =?utf-8?B?c2tjUTdxREwyeUY1OGR6M3NXRmRoeDJmcUh1UzMzVTQ3STAvQTA3dXVaNWhO?=
 =?utf-8?B?OUFpVTd3ZUhIdm5KNlB3a3JMZ1Q5Tk0wN3QyVnFwTTFVK3UrSTY0eTBSNlpG?=
 =?utf-8?B?Mk1YN2FxVk5vUVYxTU91SlBPZ0c5b2ZRREJXMVNFeGMyWmJnTVZ4Yk1qV0JV?=
 =?utf-8?B?cm44L01mVG05bWw0RHEwRzhKNEdVYVM0cUNKdm1wSEJ6dkhVb3l6MWQrSDB5?=
 =?utf-8?B?aGF2cTJXYi9kNUFPdjJqWS9ENVF4VE5qTFRhS0hvUWFMVjBDaWxLOXVoeE80?=
 =?utf-8?B?WUl3QUVQWjhMQzZwK2gzSjVmeFN0ZUljK3ZkZHl6ZS9ob3g5MW45YWc2MGVR?=
 =?utf-8?B?UkEraFhBNlpPTDZramljM011R0dUdlhDMEZHYkJnOS9zM2hNdkJOSEgyQ1RB?=
 =?utf-8?B?d09XVVBZMVFGU3VwZFp5YWlMWkh1ZjQ4a1l3KzNpQSszQ05vdU9OSTJXeXpM?=
 =?utf-8?B?b2o3dHJjMGU0Q2xOd1RWVzd2OGJNYUMrWlkzZS9wMXhtd1ZYQ0drNjh3b1hk?=
 =?utf-8?B?TVJST2V1eGRSOW0rMTUwT0dnMWpqZGliMzdLM0Rkd1JBelZEOGhDZlM3QjRr?=
 =?utf-8?B?M1l3aUtVL3JiZ21OaDlXa2I1MEI3OGZCelU1VExEK1g2RmtSV3dSOGdDVTR2?=
 =?utf-8?B?Q3lwamZocVdWTmhtaUhsSVpTc3Q5OHcyd21hd0g0RzJrL2ZSOUdGZlBSbHRE?=
 =?utf-8?B?NnlEa0tadkRpRHNIMWZISWJZaXNaZGlaL0g0YzhIeGIrZVVPZjNSbERCSDJ2?=
 =?utf-8?B?V1N0VFZ1Ty9WUnBJRy8rWmRSQ0Z6emViKzRrc1lXY3NyYWtUcktGT2Z1c2Zi?=
 =?utf-8?B?cHBGN2pGSW5ORk9nMUtUeHNUQzdLcGxsSjk3Y1RSMzhQUGt4OFRPVGhRQ3E5?=
 =?utf-8?B?T1N0V0JsZE5RZVlkc2pXZnk1TllNaGtxTHNBei9WN0RrSFhBd1dRV05IMVBY?=
 =?utf-8?B?bWdZcmswbDRhZ2R6U05YdlFRVFBNd0ZvSnJFcTVWbTZPMW5MWlhnMXVDY0ll?=
 =?utf-8?B?TS84KzlqbTBjczA0WE1sYTN4ai9lN2U4TldQMFJUV05KaHltZzIveGRveXl2?=
 =?utf-8?B?SmJ1TVArVnIyUEZyRFgyaWpSQ01yenlwTjRraUQxTVp2RDgxQzZwR3cvTVdY?=
 =?utf-8?B?YnNMdWJOWlU1elBlWVBhRWllcyt0cnRLckNvdXhoVUhDZERPbEg0aWYwejJV?=
 =?utf-8?B?ZEZPZXpLNmJ3d29FNlo5czFwZ0xqZExBTkN1OE5SQXJuNWZJY3Z5aFJTdGFF?=
 =?utf-8?B?MGlQaDIvNGlQMUhKM3NvUGl6Ylk2NTZSckFhdlg1NTFJOUhKVkV6RUFYZzR5?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: fd177a17-67ff-463b-90fc-08db87a17843
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 15:12:58.1424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ALBRgqPsec2kCRIvJXlSjkGkOmfkR66hnrtmM5ZoGNh3i+4MqTFFsZlyMz8WjerGq+mAM545FMHSStE1Y6fDeVFZyc4i+CQaRVJ45G6rLwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5482
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

The sitronix-st7789v driver now considers the rotation property.
Add the property to the documentation.

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
2.30.2

