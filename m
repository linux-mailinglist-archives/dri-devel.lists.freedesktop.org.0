Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92AC76FF67
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 13:23:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF30B10E6E1;
	Fri,  4 Aug 2023 11:23:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2089.outbound.protection.outlook.com [40.107.241.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBBC10E6DE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 11:23:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgpmMjQJ7GgoB5VA3rYleH/07TApfSsJpSs1vV0/66QTKTAq7EU02DRQVeL3iyGzGC1mqL2a2Z1ohaH03SXkaLPQdhNvUPxJUi3h4n9xLhtw6Ydc+IumvePURXvA0Kw1n0kgQvce1pZdT+jpgUufWWPLXHxZXfyPm+jNpZYs6nfmX27yeaC3e9Nj+x1/CMpSqTVWY4IjjbZh3SneY3YtDQ174n4Iyr6weEH+dewE0Tn9KmHkPPNPj5IwTrrMr8VJDpCeGmjM86PUYaz1Z7C7wkcwInILBBMCfI8UMuvA8vsFiN6STKM5H8GT5WzuyOyai65IaGdr01C1zj8DZwVmdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vpva6H/WX4nNEtyd9z8f+zfvIpnlZwf99+l2CohkpTc=;
 b=MpKU9FbvuKhbjb0YH0nMGk6mzvJz/hL9nbRrxRWeaLuGAXi1T28d8fX/JhCbG6W2RYGFZJ0yX34Q1BxQnTG9wvc8OIiw48hHfcNUem994QKxNDwBnKHLzUQaMrwXSUBAgN7U2aJGKmC441IaTHD7PQOxmZ6CfMLsrtnsD0T7BtFwvSUhqZUh0IS5E8HtEKJT6WuJrIzbMP9Hgt6NnDBG0fDV2So5CmtSpAFiU2HJYod7L4fOZUMVupwFXc48nnyUU+jktRhuaMguproVHL67gGeTnTSGrrbqYx2MoASHDCTpsatqNkmZpOo768H+tATqhw/maKBm9Vi6Hw4ZYHcejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vpva6H/WX4nNEtyd9z8f+zfvIpnlZwf99+l2CohkpTc=;
 b=jZrTJlqMw6C1A/gTZt8qe+IsC+b3gbVzHqDUYJIxgF8vyMH8+D+IbBIJqVrarRlzG6G6Vb7ZvIKs6srzDd1KA91E4CMREmVlDja2jSNuxSGr5WrqH/oTWVZrRip9DzgbMF6+/Mm1HkuSWRgR/gwR0y79IFvCMk7dEkFDYpNsKzY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB5PR08MB10214.eurprd08.prod.outlook.com (2603:10a6:10:4a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 11:23:21 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 11:23:21 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Fri, 04 Aug 2023 13:23:10 +0200
Subject: [PATCH v3 3/3] dt-bindings: display: add rotation property to
 sitronix,st7789v
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-st7789v-v3-3-157d68fb63e2@wolfvision.net>
References: <20230718-feature-st7789v-v3-0-157d68fb63e2@wolfvision.net>
In-Reply-To: <20230718-feature-st7789v-v3-0-157d68fb63e2@wolfvision.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691148197; l=1194;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=51+dgMyblZdHf78k+gy2tvc9DDFORxX5ESbyVNy9IKw=;
 b=wogxheDo6OXh1+f0go41wAED7Pb5aMECwTDeOUGB0BsnMhuzAiXib59aezaLVwRSUdLXl5iun
 h7wGKWVztBABSqjrQEQ7ldGeF/vjGFc62WuUYHWkCeeD2GQ/RM/3EyK
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1PR07CA0281.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::48) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB5PR08MB10214:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a23ffec-bafa-47e4-f732-08db94dd35dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2kRz4OlHSeVncYP5KMFWMKexhS27+knV+zcWHGjZCvP7CwoXJRo3oJQgA/5oZFryTzs3pSdqpbBt4f+03Ozoq0LIVthyeEGSpAcrC1eUebYnjsgcpVKXkt4r3ml8GQicHow74Yc4pAW99OVxZ6VwP8izUGiPRzVxJIXsjCV1LdUXWuwDSVLWFonFMn7PrcWVqMEagr8YksA8AL1lpfErSy9snAh9jpPerIhMALSY6nlVMjiFbsDCHR+VvVANfGbV20PG4RSnhA2cgWSOaMdLIdKfpfVKnGo0f6FPzn8pHG9WAkZxACOabL9XYckugQc4SnlV+dw0RtZXXioQnJo1hEsoIfSzHTrbSxMKBSf9P5vhWvhFfnKbjgcHfztvqy8DLODEkAagL0qKsJYDOwiWc3DDkHAy7NRj48WWGB6ydYG2qhcEyZO8NECf5395xYsZlHD1sx63BzdHwhCHvNNMMzQgMM0fuR41e9NZ0+EF3VSXfc5MWF07VzkRUueeOqmXmSURnpiZSNXOtT+enF6000c+lE531OyLvXX42l1omW06imuZ9CVDcnQRpAFnc99KjzptvfLid5RrzEGd5DpBKHAk4s6jdaQayiUPJOXbyieEItPF/0OJAs0/K10JenHJD3tdq1tOGUWqXEfdfnwpLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39840400004)(366004)(346002)(396003)(451199021)(186006)(1800799003)(52116002)(6666004)(6486002)(6512007)(86362001)(6506007)(26005)(107886003)(36756003)(2616005)(38100700002)(38350700002)(921005)(5660300002)(41300700001)(8936002)(8676002)(6636002)(4326008)(2906002)(66556008)(66476007)(66946007)(316002)(7416002)(478600001)(44832011)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NVVxWHlIS2JlRDZ0Zy9acmZ0NXZua1ZjcFp6cHZyKzR2WnI4OEJQKzM3VmNH?=
 =?utf-8?B?MVpOeEt0THM0MEFQWGk3NTdpaTVuUU1GQVdKc0dsMjV2V0RYYmNkRFMwSGZ6?=
 =?utf-8?B?S3JQVjNNTTc5UUpJQTJoQUJ0dGNMME5LZkhSOFpWZklUendHcFdmK1BWaUJr?=
 =?utf-8?B?alRET2tlUitOalByNjBFUWNnT3UvM0NteU5xMk1PWDJTUUp5Sm4vaVdMSklh?=
 =?utf-8?B?eEV6OGo3ajJBb2RIR25qeWFPSCs4eHg2TG1WVTBPanRhZjlmSzk0UG5hU2pU?=
 =?utf-8?B?ZExaajlVdzZnRVQxMlN5Snc0STUxVnRhcThsV0pJbTgwenQxZTYyRkJhaWhU?=
 =?utf-8?B?cUtYaml6T2hRdGUycnNsL0lKZFd0L0dFazA3WSt1UWMzRHphQ3R0cmJhZTVD?=
 =?utf-8?B?aDFHM3NCYVBHZ2dkME1UT0R6TXlYZzVMMEhCUHRJYlAyV0wzQVA1aERPRC9i?=
 =?utf-8?B?RitITU5xNndUd0poL0FGbDRPdXRmRjU2bys5SnNVMHFWRFh4TlB3cUJ5eUxK?=
 =?utf-8?B?V3pVeGtxdHBoTXFlbTUxMkI5eFZQVHhMeDdPeTAxd2xrQWxEcnpCQmIzbzdi?=
 =?utf-8?B?MFJLQWxPWGQrcU9ZMWpoODhveDlzVzhYTi9vUGdhVHorNXRwQlpqWi9PaFcz?=
 =?utf-8?B?OUFyMjJXZ0Z2UzB6N001aDRzZTZzeFB5RUVTakhMYURHb3A4ZWpFR25HV0hv?=
 =?utf-8?B?Q2diQytwWjNIZVluSzdpTzJVNkpqWkhueWZCZmpqTUN4VktjNERjT0svN3lm?=
 =?utf-8?B?QURoRWtLVG5oK0RSZkwvM3RsbThOOEVYcnNBZmlyKzNoTi9yWGZYWFBycm9U?=
 =?utf-8?B?ZEdhd1FvTFhqUHZXRFNlc0c0OHl6QXJSaVRZbDFxNFhKOVUvckIvd0tldGFm?=
 =?utf-8?B?M1VLd0xaLzgxTm1ISW9GK21YK2dGTWtrYkpqS2ppNndjdzZDenZQWEVoOXN5?=
 =?utf-8?B?V2ZONlVQVU1mcndVM3NCMXIrcUpBaTlNOWp4MDJxdG5aTVpoVDMzd0o5NUhx?=
 =?utf-8?B?Uk5BUWxxOEFJbG02S0lhRVZvaGk5SFA4dkNSUlNlY3hVd0JBUCtKVXVHWjdH?=
 =?utf-8?B?NlJBL3Rsa01ZWFFuU3BaYlRCRjM4ZXhjUjFBendIaTRtQ3NBMkt1aHJEUEsx?=
 =?utf-8?B?YTk0WEMvcThiR2I2TFhDR2xUck9vRzE2U2Y0N01US1NqeGxPV1d5QXRHc1c2?=
 =?utf-8?B?amNENWg1VVZRSkQrWUlWQmRqcTZyNnJnTzZOMmJVTjludG4rby9yRVBpZnVB?=
 =?utf-8?B?R1FHcEZ5WXVqT0RzUi82akF5QnpTczFKWFNLUHVINHlQMTM4K2tlODlEMWxa?=
 =?utf-8?B?UWYydTVDa2MwSEpoOTcrZE83dUcrTVplQ2RTMHZGd1VFb2RWeUpKS2lBYnI5?=
 =?utf-8?B?N1dXNllNTnErbmVBT1lXVVdkVW5BNC9SK2NlVGNuSFNiNDlaZkxuRW01SEcw?=
 =?utf-8?B?Q1dQTk5aWFR2Z3FyeFBYejBBaG5OOWFoZHA0MU5nMWpHWml5MkZSdHc0bGNo?=
 =?utf-8?B?V0M4amRXR0hjcFVOQkxSNE1qMTdZdXVQTjlYZ3pULzhVNi9mU2cyZHFHSmNq?=
 =?utf-8?B?VjdKeWUydmlhSDZjUEJmbkFSQlNKRW5JSXVPa29IajZDY1kvT0E3V0g2TGtt?=
 =?utf-8?B?RlFJZS9yWG8rQjBmd3VzRTN2MUtFOE5NMWFFMkZxNWozMHJKZVdnczNJZFAy?=
 =?utf-8?B?aFpsSnc4aGxOcGcwd0pFMm5DZWFYUzlpOStiNE1Xb0tJV0NkU0IyR1o4eG12?=
 =?utf-8?B?a3NxMEJRNHNXQzBJOWRmcjkzMmxnRDA1QUc4anNLWmF6SllDYjJJdC9jTnJO?=
 =?utf-8?B?U3pta3Mrai9wQTBiZThlc0pub083L2ZrMFFudjEwNElEN2k2ZDUwV2lOa0x3?=
 =?utf-8?B?RjhWeEp4ek81Z3NkeGt4Ukw1WENlL25GcXdUaGp4QWZGSFFwcktGcFlpc2Nq?=
 =?utf-8?B?WE9GSS9pNE1EZjNyaXd1VllpMjl5dDJTdHI3eDNJOEhNMFZGSUhkVjhMY253?=
 =?utf-8?B?OTNaOVRlVHB2ajYwNnI4ZXdwL2VTVU0wSkFKZml4bmdPZytqTW1KYmw1c3pN?=
 =?utf-8?B?Y2c2RzdlV0pINFhXK3RBMFVBRmVkRHdCandkYzdmMzJQWVB2OGhYc1VoT1gx?=
 =?utf-8?B?WnNhbjhhNGV4NHpkRm9LM3RNMkJkbEd6VlFuQUx2Ung3Q2NJMWlidysxd3U2?=
 =?utf-8?B?dGc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a23ffec-bafa-47e4-f732-08db94dd35dc
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 11:23:21.6372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0lGE5Xj5zTkwZwP/wsylZYaC4zG3v4kLc5OgL+2w3jlwJ6fFWkdpgQdYFTnJqVup6ZvN9NPtKT35cgY3DWwLoBsvhoZtidvmu5Nler13QXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10214
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
Reviewed-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
index 905c064cd106..0da4c7e05097 100644
--- a/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
@@ -25,6 +25,7 @@ properties:
   power-supply: true
   backlight: true
   port: true
+  rotation: true
 
   spi-cpha: true
   spi-cpol: true
@@ -58,6 +59,7 @@ examples:
             reset-gpios = <&pio 6 11 GPIO_ACTIVE_LOW>;
             backlight = <&pwm_bl>;
             power-supply = <&power>;
+            rotation = <180>;
             spi-max-frequency = <100000>;
             spi-cpol;
             spi-cpha;

-- 
2.37.2

