Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8955874CE20
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 09:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FBA10E1BC;
	Mon, 10 Jul 2023 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2101.outbound.protection.outlook.com [40.107.255.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744CC10E029;
 Mon, 10 Jul 2023 01:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a77q/XIZamn6dYy2tUR/qEkSmfenufEsK6q8a5WWHgE2EM0IdePp2qyhZGVi/pBQcKF5+9KLwWrPHce8jJQ8w1E3ItiX1ghcA1OBVUJuaX3fksMcJTzCEa5q0IfaJ9GGb9Wf5sH03dQR5YYNKiAbVHylwFrxsPO7arKvmZQOIpEZSP/oQvXko3z0FIT5Ph2PR7bqUHYWSxGaHn8hA5q78diR2v6/peTL6f02BBUej+xXuwMPu+F9J1MrAybqXKRaVqa+LfZkLDAHbeLgMMMZbse5Hh8sIHn5DNpd9I8RCZdj59/MgS+h2IZOqKWcRjVtvtwhVBwH4IW2KMoOVCqYOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/4XjqYRBHrnoQpucyfnNDxpI96ToYO9oO+4EPxzLVs=;
 b=FlD5kVu7x9p2lPt2MGmadhBCzRVjnhJjUgaIIBUk9KtPfThknWXD6L79D44BAylWkpP28w7ey0p+aBHBZgkdxTZYBkKyH1yXM2xZfcZKqjyN8NkpxuVT7d1TzuSaMqbuRXlZNxEFV9t0CIUWl/vXwregtgpiQhyTG6GPJFRfs8ljlF7Rk1YUgpoZvw/BaJXqWbqk7w+dTfbtc6ywDBpPQvUQuKOFmHxOOW8AnUuBrSec+kDSUqxiMdRjKSVwTtUVoI2d4OFRNDX5m/0OhrnW8M75O74xAXBBg1CUBR38Vr8DGfAU8WTU8aoBeN+7kxXfd3KLns3enT8BQCjOkZynGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/4XjqYRBHrnoQpucyfnNDxpI96ToYO9oO+4EPxzLVs=;
 b=BOX2ZJGidTQUmjtItSaGmZixrVs9vb1V+WNHzjlRd/wfmkhJ1J2132+YD+ACAKgZmHNCol7wrYl7zTN+gyi4jQIyHTH7bkPDb/6wanN9Li0o6HidjKYyQecawE3T2d7XVNj/vYR+Wa6LEj881IayHCwp+z0FW4N3bnX8RVKlRUwGr8MV/pOHwy2AbYU95/9Vh4ea6xnIAn6DxfzwxCne2ELn5SySLULt9XhhA7RGrZFwkzseYmfFIlXhbKAl1zvNISOxSk9cvjGv8VARLZVXqztIWX0kmyg56Q/AYBlTMEAyH5zZv0BkZNxFqdRKIo+t3+NEVu9TJbF3pJ0jyjr5mQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEYPR06MB6615.apcprd06.prod.outlook.com (2603:1096:101:172::11)
 by SEYPR06MB5694.apcprd06.prod.outlook.com (2603:1096:101:bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 01:36:54 +0000
Received: from SEYPR06MB6615.apcprd06.prod.outlook.com
 ([fe80::c817:d237:dc0d:576]) by SEYPR06MB6615.apcprd06.prod.outlook.com
 ([fe80::c817:d237:dc0d:576%4]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 01:36:54 +0000
From: Yang Rong <yangrong@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alvin Lee <Alvin.Lee2@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Josip Pavic <Josip.Pavic@amd.com>, Max Tseng <Max.Tseng@amd.com>,
 Cruise Hung <cruise.hung@amd.com>, Eric Yang <Eric.Yang2@amd.com>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dc_dmub_srv: Use max()/min() function for better coding
 conventions
Date: Mon, 10 Jul 2023 09:30:20 +0800
Message-ID: <20230710013518.2151-1-yangrong@vivo.com>
X-Mailer: git-send-email 2.41.0.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0121.apcprd02.prod.outlook.com
 (2603:1096:4:188::21) To SEYPR06MB6615.apcprd06.prod.outlook.com
 (2603:1096:101:172::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR06MB6615:EE_|SEYPR06MB5694:EE_
X-MS-Office365-Filtering-Correlation-Id: b0a330eb-a805-4344-a20d-08db80e62415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2ty4HuP9w2jvLT97FeRqXW8iP967OsRpRf8UNyFMGDdJIuQBfy/PA89hRr5inPzyPuCdYaNoVyVPLfvcFKZb6AuCQGoJucLzTn7WLp0dYP+rcoCDhIm4TzqjvzYb1TtxUQaXzCzfXCLHn0pEyodcFdaWOkW9XRONhKYvUJTaidRJwgKqPgOUobZIKg5EVpBgx1Zb45uB/Htj0kBszi6FDD1/yUF/ulQFfohYq6OkAEX4xL6id9XRELeNZ409vw6jnwBWsjMGmKYIchdl8APSVHurt67RZwXTXvGjtD22+6o+vndSS5PP5YqLPotqr72Ik0F1IPKYzCWNGVYClYIoXbsBRsvuIVNLaLK1FJlVEd5cdPRprHlxIn8fubnQxAVxfYNa4GvhUdZlmsUU+L0ZXG1IDaQcoSYLTArpBSblvDkBbWKbtZB/YWmMFxpQ+PaMiDTTwOOGIvCMKdg8qlutqsC2fymwgEIdw/D7r9xIjFcr5g7eNqy2BLBu7IFWQnIsZhqPQfAEJ3bFyRPrfYyfq4HVqM1dV6jLh9s9MY2soKDxf7QUh3lyGHP5rTY7DeDRYRPqSIKoHlDE0MDezuHZAZ7poZP1vi21qY7xSSkWJj0GJGrap8IQIYcixDf/GY0phvKgaTU4apDbqP0B7Ys+Zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR06MB6615.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199021)(186003)(26005)(1076003)(6506007)(2616005)(6512007)(107886003)(83380400001)(41300700001)(4326008)(2906002)(66556008)(316002)(7416002)(5660300002)(8676002)(8936002)(66476007)(66946007)(478600001)(6486002)(52116002)(6666004)(110136005)(36756003)(921005)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?19J47kTBiOo3hEpYytbMGGnuyk4lcoJt5Rk8FOubxt2J1VJJkSpjQk3mn42d?=
 =?us-ascii?Q?WITagMXADPxvKh8M0uU32D8FkFOPR3p7CB/aY5RicW2fcDkemICmgslRoK9G?=
 =?us-ascii?Q?by8pk1A3NajnKPmmxepezy6AcBOdNb/c9Ukqr8lyICtX63kkpLu2OH4gt9pP?=
 =?us-ascii?Q?LBBjTpaudGgy/bP4QWg5tfrIkGI0jKOxhlwnpIsydfiIm9AyqSWIOTGpAmHZ?=
 =?us-ascii?Q?MkrvCfhzrLe7Ovaj6k5eHQZ3S7nO84sQy9Hxki5Ff4IRyzk4fpfWRGMwddJv?=
 =?us-ascii?Q?toX/6pSeoi+BM8mAp5rxIGKS8U657CGMN7X/gqt75+wKbdoxSXy65B9CCsp2?=
 =?us-ascii?Q?h3+33R4HZOq+ljSuKBXvzrGLaklrEkMV9F4XaM2O296ANEs4xYD5Wvw6NW19?=
 =?us-ascii?Q?dUq3iaaX+TgGw6ju/MW0vqanjE+OqYIwRHs+CJb00x7ub3qCpE6Tlc7KcN15?=
 =?us-ascii?Q?BjIrkGs7F6IFZ4KSJ5jpLK6OcRmngWKfqEQZiBSHZQVyj27eCU77NTw6AjtQ?=
 =?us-ascii?Q?Yfn6ewBWmQ790sqFIR9oJaiM57cc9l0ZslAafzT6dkmXHC7XmzfHg2Piidnb?=
 =?us-ascii?Q?xHM7m0/7MYJ8EQFFEaOJFbF0FEZ3AsMrZRhGlmaKke5KopRUnS6SwX77NlsB?=
 =?us-ascii?Q?3f6a1DtYzOMO3LXQ0ICik3Ip6MV1qZUYUu1P4+bvPm9qLYD0VcYT+/Y3aRy0?=
 =?us-ascii?Q?P+AA86inbS5uTOFAN1F2ulr9nk/W8z92kZbnVpEshIlc7yr68RwiXy0l0YWj?=
 =?us-ascii?Q?rWcf6x1Fbc/U2zMm5lLcYnlv7Xxe4ISgKEFxhT/Nig7K9euB+Adc2L9iwFzz?=
 =?us-ascii?Q?TsWxu0XFQ/DezlDlai3v8nhY7iVTINX3j3zzns4+vmkL9hmq5ctrVh7TgkL7?=
 =?us-ascii?Q?ky/spZsDGrp1sTN5ZshhS1BhfDAMAE0qSSDDndEdi9jEtmcKcDA7LOWOemlk?=
 =?us-ascii?Q?HHnmqcjf5ApJBF462lN3/h2DTrm4gaxfLlNgWBpOdEu45kyZJyxp2d/8jMAt?=
 =?us-ascii?Q?eWCWf95nz9a2PgnleVUYvpHoCHA0oCHvuiZAI3cUaJMaw+vG3FLzlWmkkQWk?=
 =?us-ascii?Q?iIrvv05L3a66snqSP1kdMK/M83xkPWNP+aSUVG1xpiG9QuTRybHoKDgWNWxc?=
 =?us-ascii?Q?s8mGBcBVW4IqVzrtn4mwTbRAhgmpBU6pcDJITu7NKUMvtQHzLBtJYNvKBABc?=
 =?us-ascii?Q?mYGGgaEkd4N14YVlT3NB0iFUiBhoyBipGYsHjTvQSQS1lgrZBl3sIo+DESPq?=
 =?us-ascii?Q?e8lAE7U4ua7d3ZUIYBZu9wCLSuWVYbMqfwzXYy0DjL9EBOaIwA2YtKrhz3OW?=
 =?us-ascii?Q?4ZZRobXyFCMD/9usz80eqAseLRrOtNo4qEaDxTrerW/2bKMdmRaydgacvxtg?=
 =?us-ascii?Q?uzkhk2R9OlkXl6sy/97WnPrqgJW0QsWTAA9VL5aKfxZicfr7V3MKUpKwsPlZ?=
 =?us-ascii?Q?SQL5YhHIUv/zvXivdxZva+BeST1rLksTvuTbd11eXsubYeMX4mA1Jma/Cr//?=
 =?us-ascii?Q?K5PEmn4JDUzw1RJtfrxUD0Fyv6S9IkCrzdAEOYlug4Kpg2dNoYaLliFOi1LK?=
 =?us-ascii?Q?YYfVQKHosHtW1G++FMn/1Pzppw4TvLNF4cI0o3ga?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0a330eb-a805-4344-a20d-08db80e62415
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB6615.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 01:36:54.1125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /b4g/urkUU5GNceuHeitPifKH5e0XucqxyvmL6rXuwoU0ob7Q40UZo/njl6rbIk5uUKegexb6ap80TcQWGj27g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5694
X-Mailman-Approved-At: Mon, 10 Jul 2023 07:22:46 +0000
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
Cc: opensource.kernel@vivo.com, luhongfei@vivo.com,
 Yang Rong <yangrong@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is advisable to utilize the max() function in the dc_dmub_srv.c file, 
as it conforms better to programming conventions.

Signed-off-by: Yang Rong <yangrong@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 mode change 100644 => 100755 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c

diff --git a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
index c753c6f30dd7..df79aea49a3c
--- a/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
+++ b/drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c
@@ -22,7 +22,7 @@
  * Authors: AMD
  *
  */
-
+#include <linux/minmax.h>
 #include "dc.h"
 #include "dc_dmub_srv.h"
 #include "../dmub/dmub_srv.h"
@@ -481,7 +481,7 @@ static void populate_subvp_cmd_drr_info(struct dc *dc,
 	max_drr_vblank_us = div64_u64((subvp_active_us - prefetch_us -
 			dc->caps.subvp_fw_processing_delay_us - drr_active_us), 2) + drr_active_us;
 	max_drr_mallregion_us = subvp_active_us - prefetch_us - mall_region_us - dc->caps.subvp_fw_processing_delay_us;
-	max_drr_supported_us = max_drr_vblank_us > max_drr_mallregion_us ? max_drr_vblank_us : max_drr_mallregion_us;
+	max_drr_supported_us = max(max_drr_vblank_us, max_drr_mallregion_us);
 	max_vtotal_supported = div64_u64(((uint64_t)drr_timing->pix_clk_100hz * 100 * max_drr_supported_us),
 			(((uint64_t)drr_timing->h_total * 1000000)));
 
@@ -771,7 +771,7 @@ void dc_dmub_setup_subvp_dmub_command(struct dc *dc,
 		wm_val_refclk = context->bw_ctx.bw.dcn.watermarks.a.cstate_pstate.pstate_change_ns *
 				(dc->res_pool->ref_clocks.dchub_ref_clock_inKhz / 1000) / 1000;
 
-		cmd.fw_assisted_mclk_switch_v2.config_data.watermark_a_cache = wm_val_refclk < 0xFFFF ? wm_val_refclk : 0xFFFF;
+		cmd.fw_assisted_mclk_switch_v2.config_data.watermark_a_cache = min(wm_val_refclk, 0xFFFF);
 	}
 
 	dm_execute_dmub_cmd(dc->ctx, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
-- 
2.35.3

