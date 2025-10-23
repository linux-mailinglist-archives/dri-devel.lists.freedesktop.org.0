Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C29C01B57
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 16:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91B210E105;
	Thu, 23 Oct 2025 14:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="eYa+S+Ub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023082.outbound.protection.outlook.com
 [52.101.83.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9FC10E105
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 14:19:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj72Q4PZt3oAs6XR7+hkZMjHR/LA56axsAXiADjx3CO59Qv9gAN+Lh2Nlp+TMyvWjQuXgUtVRtMomCYr5C705MJ//JipAIJMmFOrj5294eR5tedylHuquPPYd5pJ/w3U1P5HczCCczmnHXlk4gVcACUqobudx+C9okQFLPNTUFlY1B2wy6YuCxrIfX16mHer+Vz/+GbGzYEwbnr4xSskFcMZShJitBEXCHwPDN79JRjLul+36nS67tkMFK9mv+SkTETIlupIn0NLg/LCSchvqqkQuSNLJUPDUAmeiAEYCSv1uov+pv8Jn13PTpN8yNW4Eg2sdUjFggxr9wN9EBqpgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twrMFMzUHlwWHmGhDEuhAJ2vxIzV1lEqXJIVNkFeL5E=;
 b=SmCbv52McJ6oPRyubrFsbxSqStB05ib/ao2fPnIaUL/3JGqGXSKyyXHwUasThWVWkVA4uteJBUf1MgPUbUzh70xxfY3WkiKKDUvt8aDNhM4MHTZIMrJUwT+oG0mZVSGySMAiIBIfKaR48DvIwnP326swgM++z5l7YudZ87sS1Y496dh9KxepTFwJ4LIy3K5HLYHfMIkTv41qOMmfgC21t9z5cb6zlzAcdUkx50g9VZrnJICeEcd0ji6S8B2UtG9JVMwePx7hS3+Qd+4OLpw1GhOsWnpx6DfmwGIPH+2T/3VCvfAApbiPMcJIwnwpZhcEcookReUXG0WmRQAPToIxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twrMFMzUHlwWHmGhDEuhAJ2vxIzV1lEqXJIVNkFeL5E=;
 b=eYa+S+Ub1xk6B8Co5ryciTH8iW/nh9F3zLNbBqArFbDZh5CM2TrbSGiETYjEN9//3y31T7HpsBGbON5gXOqOCSJea/2VRQwFc2DtMZvOOUTwhidT58kWqQZMhTh5Yj7b7NV2scH2zalh+o5Igkz6A1IdpjYaMa24neRrKEsc3ridf/mA26cE+gUMzDfyzozHgND4jGB0xmMAysrLMEvcgARfk6C4HTS+yLybEVRNvMv8rHFlXYAOkiYtDsZVCUrJ5Kw9L9K73gndtWQLcmQLnPXV8x9zymdkvHQbpQMdcVJGEZZOugzAmIIWTQu/DOwL7r68SgIIf2YyGLhgytyFbQ==
Received: from AM0PR06CA0134.eurprd06.prod.outlook.com (2603:10a6:208:ab::39)
 by AMBP195MB2858.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:6ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Thu, 23 Oct
 2025 14:19:10 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:208:ab:cafe::9b) by AM0PR06CA0134.outlook.office365.com
 (2603:10a6:208:ab::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Thu,
 23 Oct 2025 14:19:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Thu, 23 Oct 2025 14:19:10 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 23 Oct
 2025 16:19:09 +0200
From: Jan Remmet <j.remmet@phytec.de>
Date: Thu, 23 Oct 2025 16:18:48 +0200
Subject: [PATCH v2] drm/bridge: ti-sn65dsi83: move clk setup to enable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251023-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v2-1-10d79d13ea4a@phytec.de>
X-B4-Tracking: v=1; b=H4sIAEc5+mgC/62OWwqDMBREtyL57i1Janz0q/soIjFe6y1EQyJRE
 fdea7fQzzMwc2ZjAT1hYPdkYx4jBRqHA+QlYabXwwuB2oOZ5FLxUiqYycEbPFqLE7h+ndBAi9A
 ER3YpLNwKLmqHDegIgtczTX2tjeQlcFXoBos0z03Gjn3nsaPldD+rg3sK0+jX80oU3/Qf1iiAQ
 5l2ZZfnCjGTj1/92iKr9n3/AAQP5mICAQAA
X-Change-ID: 20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-058abe8477c6
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Devarsh Thakkar
 <devarsht@ti.com>, Dmitry Baryshkov <lumag@kernel.org>, Alexander Sverdlin
 <alexander.sverdlin@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <upstream@lists.phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.81]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5D:EE_|AMBP195MB2858:EE_
X-MS-Office365-Filtering-Correlation-Id: 450cad4e-6791-47f0-0683-08de123f2295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|1800799024|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVpEeXVha2xhTit3YUh0ZFBlUnJqQzJhZkRKUVp4MUNPbEtXVEpYNVZybHFG?=
 =?utf-8?B?OVVndUxEM055eVh0WDdyTFNuM0l2WC9EWjVjdU4rSFNwSmNaeUpQb0R6WEYr?=
 =?utf-8?B?Q3FHcDNqaklydG9KTnUvK0JhVlJQV3VYS1NJQTg4TFJuWTlNQkltdjBPOFIz?=
 =?utf-8?B?WUkyTmVuNVJGUnVUZVFoaTN2QUtBZnpYb3ZweGxGQ1FkVW9JTEtDWG9tSy9Q?=
 =?utf-8?B?SkFUazFpMkFZUThWTE9jbHNXRmVKOGhoOCt2bUYyUWRNWUw2K0QweVJPVzRG?=
 =?utf-8?B?QlhqRFU5MDI5VU53cWQzY3JCd1VCd2xsOUUxN3g4VGcwWHZoeDVVWnFjcmpj?=
 =?utf-8?B?dUVYRy8vdW1lVEtUSXY1Y1NHbWZQSUVxcmY0dmkvYWpkd1FZWWlyWkJpK1pG?=
 =?utf-8?B?WnN6YThGK0xHZ3Q5Y3NGRGNXM1Z5NTlhelpta2htOGRZdE5QMmZ3ZWttanJ0?=
 =?utf-8?B?T25WdS9VVmNKbDhpZmxhcm5PaEsvRGRpcndQekVOaEVVSExRUkQyY0h0Vmxx?=
 =?utf-8?B?aHkrc0VxaDM0RVNrN1hscElCTEtlUmhReTR2b0cvam1jeXdOMzY1NDBhN3I2?=
 =?utf-8?B?NG5acXNoQjJnNDk1bTJ4UzROSlFJSFpqdWtuQklZT1VvdHI5a2VreTFsdDFw?=
 =?utf-8?B?dUxGeEFPWllrWEd3dURsZndyT05xMUsxWHhkSXNrd0xweTRqSUU5RlFTZk5Q?=
 =?utf-8?B?UW5GU1c1dmV4anlTRzU4cFdXamo2QnhlUUtCNFIzQVQ4Z3NYZmVrak5kN0JR?=
 =?utf-8?B?dXRTVUVIWXo4dmRFV0FBYUpYeWhyQ2V4M0sxZ1VMTGhZT0NUVjh4RWVIanB0?=
 =?utf-8?B?OFZYa0d1NnFrWkRYaitycnN1YkFsMWp1cHo2bDNiNGRWSWxaaW9JZEcxUHBJ?=
 =?utf-8?B?bDRaTUhDc2Q2ZnZHN0xJRGxXY3F6UzB2alVhNzl0elRmTHdGTEFzSXE0Q2xn?=
 =?utf-8?B?T09hQ3ZCejJiQTN5aWkwZVhEMnVwd1F0MWE1M2YyUjRiT0VvcWNRb0w3SlQy?=
 =?utf-8?B?VVdLZGR3TUU3ZUFkaG1WWG9tTEpXUy9TNW1FbStobnNjQmpxSHk3Y2lsaUJG?=
 =?utf-8?B?UEtDMG5jclhwSk1TVjZadWRaNHdra0tvRUdIOS9pVk5QcEptNG9YbCs5N1ZN?=
 =?utf-8?B?N0svSjlLYk82bUpQbGQ5M3hQa0t2elpiNmFLYko1QStScnB3S1VPc3ROUDhR?=
 =?utf-8?B?dnNPdGpka2F2RThxZWZhUmFaTlloR0JweXphSHd4ZW94WWpMRno1Y1c0WjFB?=
 =?utf-8?B?K3RFRGxCak1RcU1zQ0t6SW85Y3dwL0NDWDZTd2FtWWtvLzhOemN6b3lrK2VJ?=
 =?utf-8?B?Q3plSkZxM0x6ZmlqdjJEclNFUkc1bjk3S2Foc3RvSFFQL2FqYjQrNVVycXhu?=
 =?utf-8?B?OCtKNDNRWWhkeDdBMWp6VkdUbk0zcG90NE1jM1NyakNtMXMyY3ZlcHZqTGJV?=
 =?utf-8?B?SWRXRExiUER0bVVpV1JPb0xWUFRmUGpwa0hhby9FMDRaOEN4bDRiTVpqWXpF?=
 =?utf-8?B?dVpQMXlic2tpNDBoUWlxelM1UkNLREZxSlFZMUdsdGczQWhNcno1TEhZS21v?=
 =?utf-8?B?NGwxcUppdHlPZFlDRlJLM0JSVDRXcEx3WUExeDVGdVhwK0UzdE9lSG0vT01z?=
 =?utf-8?B?M0tNTm1EaVFrVzBiUCtUNmprNlpyVkNWemlXY2U0N2R5RmhBclEybHdwWVFl?=
 =?utf-8?B?djA0UE03NTFOQ1hKQ1dEdnZoUnE3alZEYmlyQ3R1ZHUwdFhWY2xrd0xhdXZo?=
 =?utf-8?B?MDJDNDVxb0tOR3ZJSDFzMEYwN0R4QjdGTG5pa29NVXhuZFlFWllUTjYrbjNv?=
 =?utf-8?B?ZGpaelRzdlBCd1pYa0d0QzZJZUdIeDUxaHNPUzFSbWVyTmJoWXE2MGhDQmI2?=
 =?utf-8?B?bEszMnJvY0xhcTR5dVg3VzBpVXVrOGxtOWxYcHVKNjNFazlOdVc4YVBXWEdD?=
 =?utf-8?B?ZUVvUFhRaURvdEtpMUYrbzhUQ2wwY1JqenBqOEF4WDNLMTNNLzJKajZpM09D?=
 =?utf-8?B?ejByVm1JMkpEaHMwaHVERzkzTWlRdEhFV2tJbHV6YkxTTC9HdStZZDgvaHpS?=
 =?utf-8?B?dDRQWXhOKzVEdUVITXE1bWdFYjBiUEVxSmlSdXQzQVFndWdOSzM3TWp5TmNV?=
 =?utf-8?B?a2FVQWFXa3JncThoNm1HNSsvK0gxakdWNm8yUDRITVRuS0pKL21JdkxyaHJ1?=
 =?utf-8?B?TUE9PQ==?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(1800799024)(376014)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 14:19:10.5191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450cad4e-6791-47f0-0683-08de123f2295
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBP195MB2858
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

Move enable PLL from pre_enable to sn65dsi83_atomic_pre_enable.

The base clocks may not be ready when pre_enable is called.

commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
		and post-disable") points out that pre_enable hook definition says that
"The display pipe (i.e. clocks and timing signals) feeding this bridge
will not yet be running when this callback is called".

Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable
and post-disable") caused our display [1] to flicker constantly.

Our setup is
i.MX8MM mxsfb -> samsung_dsim ->
 sn65dsi83 (MIPI to LVDS) -> ETML1010G3DRA (display)

Reverting the commit [2] let the display work again.
Only difference in clk_summary is the change of
dsi_phy_ref from 72400000 (flickering) to 18100000 (working)

The same behavior can be seen with a ph128800t006-zhc01 display
and dsi_phy_ref from 66500000 (flickering) to 16625000 (working)

The root cause seems to be that mxsfb_crtc_atomic_enable is called after
samsung_dsim_atomic_pre_enable. This changes the parent clock after
the PLL is already configured.

According to the commit [2] pre_enable hooks should not rely on clocks.
Both drivers used in our setup work with clocks in pre_enable.

Moving the clock setup from pre_enable to enable fix the issue for
our setup.

Please note that I am not deeply familiar with the DRM subsystem internals,
and there might be side effects of this change that I haven't considered.

[1] arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
[2] https://lore.kernel.org/all/20250605171524.27222-4-aradhya.bhatia@linux.dev/
---
Changes in v2:
- remove samsung_dsim patch
- tested on top of https://lore.kernel.org/all/20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com/
- Link to v1: https://lore.kernel.org/r/20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-v1-0-94f9f775ee62@phytec.de
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 033c44326552ab167d4e8d9b74957c585e4c6fb7..4cbdbafc3e85821ef6fcd9f74bf07faf6b9f84ff 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -474,7 +474,6 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 	struct drm_crtc *crtc;
 	bool lvds_format_24bpp;
 	bool lvds_format_jeida;
-	unsigned int pval;
 	__le16 le16val;
 	u16 val;
 	int ret;
@@ -614,6 +613,14 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 	regmap_write(ctx->regmap, REG_VID_CHA_VERTICAL_FRONT_PORCH,
 		     mode->vsync_start - mode->vdisplay);
 	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);
+}
+
+static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
+				    struct drm_atomic_state *state)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+	unsigned int pval;
+	int ret;
 
 	/* Enable PLL */
 	regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);
@@ -633,13 +640,6 @@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 
 	/* Wait for 10ms after soft reset as specified in datasheet */
 	usleep_range(10000, 12000);
-}
-
-static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
-				    struct drm_atomic_state *state)
-{
-	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
-	unsigned int pval;
 
 	/* Clear all errors that got asserted during initialization. */
 	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);

---
base-commit: 93213d0743010ac6a6a21e97e75c695a423b81b3
change-id: 20250925-wip-j-remmet-phytec-de-bspimx8m-3801_peb-av-10_with_ac209-058abe8477c6

Best regards,
-- 
Jan Remmet <j.remmet@phytec.de>

