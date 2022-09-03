Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B745ABF0B
	for <lists+dri-devel@lfdr.de>; Sat,  3 Sep 2022 15:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0142110E5C0;
	Sat,  3 Sep 2022 13:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2126.outbound.protection.outlook.com [40.107.94.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A200F10E5C0
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Sep 2022 13:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxxY4BcgWsuvGdNYUUmm7HabUkriuyge6giRTWXrudAn2D/0R4j4oCoXUEtcglRKU7thVWciszyl/rxQZ6tJoeNE7W1M8+RZ3n7XzaRvrX0evgklSUkFsEdArbdRge9nfBy5QiGdw4U9e7JRKY0VItHrkicLkvP3sbfABTYO1HXGT3G+Q0FDb5AWaLtDM2GXiFPfEpIDx2STjuFNbu4/1JIA2wz66uuXDbSnjrTlSBho/U4PxK+z3/fq+QC2cSuS2KiYfWZQukVtavmghYbEq8NGFkD8YmjtR6Q0fR0Bi+LcmtHVHMwy5yOQQ6Q84AIMsTnY4uic7vpn3UveM9XHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2UaCSavDG62F08hDCwHmoO+mWP1oqYWzJVTbj+2l7I=;
 b=IcakWxXbj//pcTPP0gzyKTPdPKpekhfomTtFD1xHbsQa3dzcVll5WObO/zDLq3yp62jU1er+Kr256Ub64hpQ3h+cVCFFfPzr3SH4AZlXKybJ9wDLPFNfM2UZco8ef5obuwL5fidc06vRPWcJaPPGj1wiNNyhwplHj74sUwE/QYMJM7LRDL369vebdf8F6hE5HntHWOz+NWSNegSliNyP0VMaxTi/B/+6ot9Hbm/bSVCTurBJTAKB/SGSqL29gC/uXK9m0zrpEUDpAzVTuwWAWpftVUUwEXWOetfczmp7YUYKltcTOCNRc8O3zTSAByxwao0ZAP9XkKraguXLYO/TDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2UaCSavDG62F08hDCwHmoO+mWP1oqYWzJVTbj+2l7I=;
 b=gKT8VehpCZofl9mam3zAb3UGRMYgm3MjlajaOvwijTjyCB6e+SZAGDeHBnaBOlE2dSV1CzG3bD9Gby22PRO2WEg2CeN9Af9lbfdnW3mXeFwSTHQT6cPWLjFZhlY2a0WRopK0D6B/S9YBJAgZggKJzQvnLof+Lleq+LhbqOKHrns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by DM6PR04MB4458.namprd04.prod.outlook.com (2603:10b6:5:2e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Sat, 3 Sep
 2022 13:09:07 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::1ad:536d:f2aa:8d13]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::1ad:536d:f2aa:8d13%3]) with mapi id 15.20.5588.017; Sat, 3 Sep 2022
 13:09:07 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: anx7625: Set HPD irq detect window to 2ms
Date: Sat,  3 Sep 2022 21:08:33 +0800
Message-Id: <20220903130833.541463-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::24) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2345198-b7d9-4e5e-1dc8-08da8dad7bc0
X-MS-TrafficTypeDiagnostic: DM6PR04MB4458:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pRrqIj8jRP7Bu6YsYJhc0itWnndGQtSl22TL17Rn7xK11K+pjvd8hZmtXRvMNjooO5b4hXTZSKcelz4xjMCiM2R69rp0AmxazrIFV0A+9Hf3xHV1CrU0I8+Rc4Rre8jR7ZeaNv9/6tLE5QbaNK9Iwz81ONUVmXUC1BF1wc8VOMegdwh7/Wz+N/wCwrgwzXvlIlOD1OyK3Ygku2SrThiQl3KEAZKIX6MavV8KGDMFV/Ym+KljpnaKr1/Nt/2/ehuL6W6NgXm3t0hGXItYjARa/gdfr963OFwOlLlCtxbjAk7p9H4HwopC7sRQ0eK82pj8SNAhBznCMWdRwAY4eILaSW+CpOY2nEaJbhZrAXNMZZnoPB9lb38vuUBjPPkgfAOorv5dKGJPjrOFBs06u9fl7yZBRwwQaovL1W5efD1BbPiMlUIbd1G8Z7AlPn4w07tSG8nAhb0CukyjyJuyM90s/L9Cy/wqauGACGjd+GaH0EpIUpfwCzi3sHLbG+CzGCDKOhQsbpLsZUBo1ngN+eDldG5EJlIa3Kw73uj3GmDFut6gXV92o67ZgGmCIhtQVwO7A4fiBtz7HTYqm4xAuLZs5v2p9HKYD1KNrvTObUpb1sGkSsuiuEPSTVirA6cGbUl9f6ooHBTDpHPgyHiqOKWFbWB4WQse3IwUuJ/hMR3yS0jZ9PgPxxswGHb85MK6zilfoduwf1fUXmlOupAwEA11UsuiSSds2jvWBTpgWMu3XanoLb1VpPywi3Pg8gNYz40OQvtdIUkHuzg7nKdDJp7yTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(39830400003)(346002)(396003)(366004)(38350700002)(5660300002)(66476007)(110136005)(66556008)(316002)(4326008)(66946007)(7416002)(2906002)(8936002)(38100700002)(8676002)(52116002)(6666004)(36756003)(6512007)(6506007)(86362001)(1076003)(26005)(2616005)(41300700001)(6486002)(83380400001)(478600001)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZNXgPHRGVLkpnrK67SfGQfE6jumMSL9+6iWNrNHzqGFU00Pa+2QGHjfB8uih?=
 =?us-ascii?Q?GkdjB4Ba6L/SsFxIpwn9kd9PGVu9JFky52U94L8RUfxG0cLvtz5aBFw4Gc8A?=
 =?us-ascii?Q?yuEaAFBAb8uefsQZf9AsXh8gZqLE43fwecQFWUloUEr5WAAlnAJcEUYBEjw9?=
 =?us-ascii?Q?w8GDFOrjkTFii1Vufg60OsRje1nsNwIkXjH0KWamQWaiEpj/4v6TzB2eTZYC?=
 =?us-ascii?Q?ji2HA46scrjhlCyyg9PXFQ++DW8YZvq91S2Gag60pcoAx9Yhf8bPJZOmQ/ps?=
 =?us-ascii?Q?/HeEnvGjFxoGGG9kleUHaMZvM2O/FL3VDx/9AXEl/dZz0CXymi5qmjg4ZpIs?=
 =?us-ascii?Q?nCOSfBleYrde0YAWuS7rBJA8VD3xdPbLtUtz16jDpe3RCwf2jGJNExA4mpNf?=
 =?us-ascii?Q?OkoKD68OojFoy05Jkk2R6RkxI4UsLnXxQkHQpB0zMmC5BrMmvOVl6YEYHhNv?=
 =?us-ascii?Q?Khxxj20Q8FGCoB4UZ2QFOR4/sU0oYLFililx4+TKDOquBAFu1aL3DBTEG/q8?=
 =?us-ascii?Q?ZGmoMU+H0RteBDA/5//R04q5jr2sn+teZidD13x2Ap3HmNL9cTdChl8Fi80Z?=
 =?us-ascii?Q?hchqieH6xp0qY4AaN5dPZlVVS2AkMQta1uldQ/+nN58hG2sse4GwjWnxjeBt?=
 =?us-ascii?Q?A2DSM2SJlVSXkD5wecqHRTmE+wRX/pu7X+0jBQw0AdIOUwj4R/5NC58ul/Ek?=
 =?us-ascii?Q?ORiMSifpNv00jaMZLEs++lz9cJcvKtb+AK6CWMUSlxGprv2N/idgXa4cvllR?=
 =?us-ascii?Q?TpQQJXqlIF0amRfjQbnToAl3O11mMsvTc6QCYvJ+JU5OX5da3UCd2SsrHKc3?=
 =?us-ascii?Q?B4/DR7E/oX1VtmRYBLnWWv8aDuDl4RjvNscI/n6jC4l6K1DmzVS+dxy0kbC3?=
 =?us-ascii?Q?kgHRC/igqFwiGcnIzO74x/+Lf++J7AK/pby7dyXTC1+bGYyC2EwaeFgxjZ8h?=
 =?us-ascii?Q?Lcm+pm3ZpwELv5GrOoH/hYS/7WjgA3BOIZ8L4L45TSkfqp+huBx9yoBpCHIo?=
 =?us-ascii?Q?6JZLn7PFP8U0ATiLu6RNJtOr9hwrWaTuAifRXJMjpB8cijUX7VnyRHKmOK6k?=
 =?us-ascii?Q?oyuNTp/Ku6hj/94QZIFBwKoHaBxLZ6IjJCwKIg/CvJ0SU2t/zBLhP0jy2EFH?=
 =?us-ascii?Q?8YmNx941M1LcCjJYELWfLTCzLYB/E4FSQWedSnEopJRgoY+oRZEAxQHBrMmL?=
 =?us-ascii?Q?EFZ4rLvKbrkXhHTd+gAgPVfOmasoojmuNGn+KLbTIfh5JfTlR/TsP5EYINMx?=
 =?us-ascii?Q?yqhK0PAW45HqLCrV76CVuBwvRPUGW8GNXegWdQH/EpHsRJ9DnwnAnk7pXfC8?=
 =?us-ascii?Q?5qeYxexgMmIKZb7vKwawT7AkKOcW4GqLfvbuk08YsCmBuKnUhLb9USZyeWbB?=
 =?us-ascii?Q?cOL6NZ52n3QEmkY8YqMcUKdVXJDbDnsPqsYKmw87KJroyZcWqG2VXHDIE9Bt?=
 =?us-ascii?Q?VxM5D0jMuKd1g7VitFOpvUEfF8BUYiyWsYVhSAdRyEu9fxlYjRBNtgx3UVoK?=
 =?us-ascii?Q?NSHXNrAldpG56G15adlZL4fCs552vVxpLWO6+PXetKnUcTMUsQvIFqOA9h3W?=
 =?us-ascii?Q?VOuqYs/jJSaFv5Fgq5yFfJQZxDzaH0rD+THp/DEJ?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2345198-b7d9-4e5e-1dc8-08da8dad7bc0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2022 13:09:07.3424 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIppu2hiWXpkHtwNFRin+WsGvsTXBbZIsiIPrf6LPvYf0ze0PjxXF9X865SrsYrkAwbvSRaVmsanHjGTEy8mKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4458
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
Cc: qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mliu@analogixsemi.com, hsinyi@chromium.org,
 bliang@analogixsemi.com, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some panels trigger HPD irq due to noise, the HPD debounce
may be 1.8ms, exceeding the default irq detect window, ~1.4ms.
This patch set HPD irq detection window to 2ms to
tolerate the HPD noise.

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 14 ++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index c74b5df4cade..0c323b5a1c99 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1440,6 +1440,20 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 
 static int anx7625_read_hpd_status_p0(struct anx7625_data *ctx)
 {
+	int ret;
+
+	/* Set irq detect window to 2ms */
+	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				HPD_DET_TIMER_BIT0_7, HPD_TIME & 0xFF);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HPD_DET_TIMER_BIT8_15,
+				 (HPD_TIME >> 8) & 0xFF);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 HPD_DET_TIMER_BIT16_23,
+				 (HPD_TIME >> 16) & 0xFF);
+	if (ret < 0)
+		return ret;
+
 	return anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, SYSTEM_STSTUS);
 }
 
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index e257a84db962..14f33d6be289 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -132,6 +132,12 @@
 #define I2S_SLAVE_MODE 0x08
 #define AUDIO_LAYOUT   0x01
 
+#define HPD_DET_TIMER_BIT0_7   0xea
+#define HPD_DET_TIMER_BIT8_15  0xeb
+#define HPD_DET_TIMER_BIT16_23 0xec
+/* HPD debounce time 2ms for 27M clock */
+#define HPD_TIME               54000
+
 #define AUDIO_CONTROL_REGISTER 0xe6
 #define TDM_TIMING_MODE 0x08
 
-- 
2.25.1

