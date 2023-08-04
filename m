Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB28476FF5E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 13:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D245810E6DD;
	Fri,  4 Aug 2023 11:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaf::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F09310E6DD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 11:23:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhQu766iSgxBaaCLdMOFijlXMUWJ/xIiamzT+SHWcsou2YyytIOyimHmHo7NfQKsdT389m8t8JQ/eWF0tKLN7q1F4yMqISnjiy8OqknHwrP9KlchgOe5ThuzKWTAanpGdE0+11Qj3Ox2KabZr2sfugWmNYiCiyYe6hGu/GbO/0a06lPV/KHZ1W/WyiCzXIMQYvG/PguEYL68M/0PmMsDaFzrOdKSzKwKDqhZPlXxF2gXlMOwsb9zccj1CLA8lHJmGNTMsL+9eJCjEPfbLUpHQTu/0tMQIDDyeZoYU1E67sl5zhQWW3S22YTm20MFnKWcpWZes05qP6tqj6PTQQGjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQ/clY+OWy7UFsifIWw+74iLSR4Wu8gP35fXRLUXHH4=;
 b=A3E6KiB/WM+OL5SBT9/zQyJNWiaxqSrUZqqip0DRUJtQnG9WJioOCWr3OtGwXivbGu4iWLwCs76nTBpC1jD+X2OLt8QbKADLrnVPeBP/69fdUJfRuXPTDQOIEPJUB2dvcTkBmm0G7V4+VXrvASO01xcASZuxFX8vJPAUdDKwaftKLasY4DLqRZneH/3EoQU06GFpPdkuCnI1Z0vvJuTB26ZuDaez0nas/HcE0GoCgj2TD3d8xp1UFm7UOUfF6zDqHs3tisIWTXT/f3ac2d7bQGFtBLH12HqqCWcdalTDsqNlyXg61fiCqHfnM2s9dIZnAkB9v44pPwtGQLZWeNQUMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQ/clY+OWy7UFsifIWw+74iLSR4Wu8gP35fXRLUXHH4=;
 b=2N/c6KHw4g8E0d92O6cbt/AR0XQhjEeLovgM+ZoFmhcIBu2ubOKXa4i/rn7d9NiHXwTrNmIDxMcFPou4yvVy3qrk0x1yHIwZScvtUiUaTQ1NMF7Nu+JSB0qI2DiX5xWE6WA4koLGwJOw7PDzyikqpjpcK2f3DtgFj1tIrZkKqeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB9PR08MB6729.eurprd08.prod.outlook.com (2603:10a6:10:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 11:23:19 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 11:23:19 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Fri, 04 Aug 2023 13:23:08 +0200
Subject: [PATCH v3 1/3] drm/panel: sitronix-st7789v: fix indentation in
 drm_panel_funcs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-st7789v-v3-1-157d68fb63e2@wolfvision.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691148197; l=1121;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=ERBlt++yFzlTkLnkmGnLA7blKLBR3PTGqOxYi0qVgk0=;
 b=Vf64TlMNuf9+C9SOo0ZLEMMaaP3SVjYgV2Vv4JlJbNCDgWc3ob0b4qtymkRmKSvUqOSF33bEA
 pmkVJpkn5a3D4CojCy1p76vyVp38EwNbO0sOXZIcmw5tnMJ937GtQsH
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1PR07CA0281.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::48) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB9PR08MB6729:EE_
X-MS-Office365-Filtering-Correlation-Id: d134cea5-27b1-4025-d8d3-08db94dd34ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/39xwPPHhkffI8dezLtOj5yDl7efCpvQhi7pFe6Jd/N9MwOf32st0UwLrm9xYtMhdNCHlekt3MRjK++KcdPP3dJD4nRa3Bb6VGqBxPyXU8/PgAK/Q+cUef2qNq3+IJXvEsegGMr/xoN3myzCEFH+tZ/RRfvENlspJhRov135QjbemmnOiQ3/772i/e5wni+MiJi2w8XGoeOk2s4ujccRYbpTOZVA/TSrvCfL4S5AXEXmvfNfPaDw+Md9FKw5z484sw4Oc2hCC1qsrt2k7ErXn+bZeY1WDwEIyYbcc4bggAzRiG2HhRCWwiml2ewwrG9MPnxQOjnx9qwI+vMoPdNk39rdXkYy7juoRQm0PKX2gx9RSW/H0XdGdP33WCxVa9NFJsDCddCii2/DjfTV3E0Brt9F6v7XDoPw3q12lsHEsRXQQmk/S7qLO2tARdMs/ySEDwPpDB9ZE2QedoznAEbdpoiQKAZ+5UFJxHl5zhrusYRNMiFYdL3eiU84OcfwEiLVcTkxoAViNfUv4+dSoTmuCNeGJsDLRplkRnodutiOzyor4yO7dEeIMumZZlbrbJ4nGqY3nbSPvsTWLNjc5pz+n70jCzk4DTRB4hF2UCZK+fSMO9QItwrcI83tU6ZIIn89lglWpJplmMJa1Y6qaueMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(39850400004)(346002)(366004)(396003)(186006)(451199021)(1800799003)(44832011)(66476007)(66946007)(66556008)(4326008)(6636002)(2906002)(921005)(38100700002)(38350700002)(2616005)(6506007)(7416002)(83380400001)(110136005)(86362001)(6512007)(26005)(478600001)(107886003)(36756003)(52116002)(6486002)(6666004)(8936002)(8676002)(5660300002)(41300700001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2ExR2J4T2hCNzVWaU4zQ1RtUXlYOElLZnV0NzVzWUFDNlVRRjZ1dFVVUHRR?=
 =?utf-8?B?d0JTWVo3VlVFUkJ1VkptM3d6SFFzbWlTcFFGN1FFVFhLNXdQb0xYblZrV3NW?=
 =?utf-8?B?VVdmMUgxdTBIRmFnZXdWelAzREVLN09sVjVsUFJIL3RZVnNSbGdkcmpXOGYy?=
 =?utf-8?B?bTlTWnpKMVUycElnSzltOFkvTGJFTFZvZkdBa2pESnVpUVNTdTJnWk5vZlJQ?=
 =?utf-8?B?OFduc1JDdmpqSEVDWWQwUEFlRlY0bUNaeEdLMlpmUElaOUZja3c2RzgxZ094?=
 =?utf-8?B?VHR3MEVpWlRmclIwaWt2YjA4Z0t5b0NDQ2w4bGFIeWNjOU9tYUt6T1JMbnVr?=
 =?utf-8?B?Wmx1WjFpOEN6a2VlSE9GN1BlRXJKTmZpU0tPeVk0bG9ETzV4ZEd6Q2FnMnlw?=
 =?utf-8?B?THdBSm9HQ0ZQZXdKUzA3ZHRhUWk0c01WcHJjSmNJMmYvZ3phUWlrNzh5bHJv?=
 =?utf-8?B?cW9Dak0vMnIxR0NRT1ZaU0RNcndSSTRJZnVDZElXWk0rRXZmemlkNU9pRlp1?=
 =?utf-8?B?ay9MTjl5dndrblNKTXhXMVZHcC8vUitack05UDBBdm9sTGwzdm1RWTZ5R2hE?=
 =?utf-8?B?UDVhTlA3M2QxMUsyQ3B1SmNzbGp4ajdMd1JaVURXbkh2RitoNDVoZXhKeW4w?=
 =?utf-8?B?SlM2TFhPblZwTlV3ODNiWW5KY3REVElFaHRDbFVBdDRtWWxZSzI0NFRqcC9S?=
 =?utf-8?B?NCs5V1p1cjN1UnNDY0hlSjg4NVVrUXhnRmM3cVdURWJZbk54M1ZpdGNmeFg2?=
 =?utf-8?B?R0UzVG4zOTlqVUhnRHhDVmFTMDNJMmRKaXpZMGF3ZjM2aWRXRE1QUDJjVzky?=
 =?utf-8?B?N3hOUFExdE1rN0Vma3VzVWxkbEwwc3RyZWhRK01aS25vckI0bGt3bjdBTzVF?=
 =?utf-8?B?T3hDeGRZbWFkbTduUUNkUzByTUlCVEw5Y0IyWjAwVlpjZm9kV3JkWDRWNTRo?=
 =?utf-8?B?OXlIczBwWFEyRVBwK3RnNHJMNEJXNUJtNmtjNWdvVkFWaHR5S0FpczB4UDQw?=
 =?utf-8?B?QitiM0NvUnlTL0hkNUxwSlRHVGppRkRBR0YwYjl4Q2hMNXdIYUZTNXJoeVdT?=
 =?utf-8?B?aFJVemJEV0dlU2pnWGJLV2hodVE3dHgzYUJtQnlEN3d2S2JjT1hqc29zeGla?=
 =?utf-8?B?VUlhQmRheE90SC9MSUg3ZkhFbHVtVkxORTJobW8yTVJBa0lLQklwZ3ZEVjBO?=
 =?utf-8?B?TUlSZXNrYkx4YUc4SnJMRUk4Qy8wWlhReGllSm5XZVRnL0hud1Vha215L1hN?=
 =?utf-8?B?YjFidkFyREEzYVk5NnROa29tYndtSjlmSHpxVHVVTThHZktHYzVlNStscGhi?=
 =?utf-8?B?RGxMVjFmaGV6bFBJOXZzSjkxSjVOczRFKzhGNTVJRjhSbDlhOFhENGpPZzRT?=
 =?utf-8?B?ejFzejV0bHhVZGwvS2FkR3NPeWhUQ0VLOVhmU3kyczlSZ3lSek9pQ3hNT2Rr?=
 =?utf-8?B?LzdZcVVNOXBWUUYxZzdwM3FhMUY2VThoYWZtOVF0dnNqV1hoZW9aMjkrVGZ0?=
 =?utf-8?B?NXcvek9iUGVrT1VuYWJLQ0htZENjNmxMUGY3TVQ1TnBYc3RxcVpFVHppOUFl?=
 =?utf-8?B?Y2JVNW05WmU5V05PRWk3UTl0RXhUa1pLMXBhZmJHL2dublFXdXh1UlR6RlN6?=
 =?utf-8?B?VUZhUGtaVUgzZ2tSUnV5SWFCdlpLVGdJY1pSdHhRNWdaWlJ0N0NPSzZBOE1q?=
 =?utf-8?B?TUJWL1ZGOEh3VG9QOE9mY2NhZGsyUTdORFRDcnBJcmRweW1VTXRpY2Fnbm5B?=
 =?utf-8?B?c0ZDWjFsQmNURFl1SHk4ZFZsOGsyakNTYU1hTG04V2FUUTVOMmdqZStYQ2VG?=
 =?utf-8?B?M0tqb01oQ0tsN3hQUDM5a1lMY2ZJV1BQeVhhc0wraEZLNzJOek1QaFZjUmM2?=
 =?utf-8?B?R0VvWktvTHJJSnM3bFQvWHJjQnJLOUdpMUdaaE44Kzdsc0xrcGNvdnU2S0F6?=
 =?utf-8?B?YStaY2V5eGM1NjJqZFZYUEpnb3p4QStiMGdOdFAyNzBhRytlVTJmNm1LcVM5?=
 =?utf-8?B?QlMweHNPL1VFaG5PbHVXRFFxaWJEaWtTOEdrSUpiUi9iclVMZWFQQmtGTGtk?=
 =?utf-8?B?dWZKbTJzdm9yZmJtZ2FablhBQlBIU09nV0k5cGhLM242aExLOHdHVlc3emJN?=
 =?utf-8?B?dWNKYk4vUUxOK3BKQnlJbmY4RkhEcG4yc21wRmdyOUlFYWVyOWMzY1Blb3N2?=
 =?utf-8?B?Q2c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d134cea5-27b1-4025-d8d3-08db94dd34ab
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 11:23:19.6537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/EQxLbk3Nm1KCaQeUAhVOlQK6ZSCfEuoRiNUL3A3LAOsYeesyNDy6IwVNwdSxjfuSwd+gdNGDEk6RqjDH5+kg4Xy6dQ7T3H6NTr+eTHMuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6729
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

Fix indentation of the callbacks in struct drm_panel_funcs.
No functional changes.

Reviewed-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index dc010d87a9ef..bc8df51224de 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -519,11 +519,11 @@ static int st7789v_unprepare(struct drm_panel *panel)
 }
 
 static const struct drm_panel_funcs st7789v_drm_funcs = {
-	.disable	= st7789v_disable,
-	.enable		= st7789v_enable,
-	.get_modes	= st7789v_get_modes,
-	.prepare	= st7789v_prepare,
-	.unprepare	= st7789v_unprepare,
+	.disable = st7789v_disable,
+	.enable	= st7789v_enable,
+	.get_modes = st7789v_get_modes,
+	.prepare = st7789v_prepare,
+	.unprepare = st7789v_unprepare,
 };
 
 static int st7789v_probe(struct spi_device *spi)

-- 
2.37.2

