Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52F14EE5D9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 03:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3957610E464;
	Fri,  1 Apr 2022 01:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00085.outbound.protection.outlook.com [40.107.0.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10E010E464
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 01:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1fPkXveBBoB7y1CMfeWzp4h+CqU0DlBHTB6Z2KbUvTnvZU7vIXpFVBBBuHB9S/DNHOW0d3l8SwSGclSiyTqBxMM3LN79P/4nr+koMnI9IQhPEtXnnFHxKQ0gHaIpX3Hng1hPDW4MIwqXN3eSqZcoUw2cexlH+ASI+tQYJtQGsq7yBIR9FcIv7DyOOWPia3K/VG8OuR9JrGHMmNHW7xAuV93x+7mnCInSOUskJaggittk8ELUpWyN+MJlxgT6+JRRsGl3syPY0uhAyYWr1Z7Vrb+AxlyUZVXR0sYq4G1tHFU3y/tJCe3Vl4CRtAvybDfq7TPEO54sbAB/W36oUUOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7TwW0iIZbjcAXIVc/N0IvnmdRWcq09kzIYPajxVeTA=;
 b=Xb8dN1DSS5d46Mqx0UDa6JOCQ+TS8Ckt3NV3HKzaQaq5uNIu8A4qYa7pDWIo2icUR3yKq5loHd8tjNeB5wnGx+2tDAp7ECmG0uJc/h6sgEVuwXTyPCkucD3Xh/fJkLg8Nv4jNUc+ahp1aX+UfV9XkMy7/3yN7xAQcTxVIe7Touj9wyo6pOZmU+5enA2utmrk5bTGFSv7nM9I2aF5R8/PSXKModiNLUmDlpu97ZPObpwQ7JxscG/TJFQIhH9oMKXNqDSPdm48L14Mosws4ACM4dKtWNVxVyxRRFCDoMwVUwbCKO6lulK0Zh6O79leNiErptxL3W1JEPuPBAdzD1NX2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v7TwW0iIZbjcAXIVc/N0IvnmdRWcq09kzIYPajxVeTA=;
 b=E+8ndxFxEnu/xcz3lZFvz9HqVssCLxP09aSMz/yOWwxTWhze7QjDPz1iZF4d1rTZsFsw5XpPT+l63oQTJmMkC97D7giGiyNYGvnraGVX5ySH3a3NxkNGT3LhY8CUNtgYioUw0CrhonVJF83XDEyUNIZ19Jed2KiPp2md6zkffa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM5PR04MB2979.eurprd04.prod.outlook.com (2603:10a6:206:9::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Fri, 1 Apr
 2022 01:56:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.025; Fri, 1 Apr 2022
 01:56:46 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: nwl-dsi: Drop the drm_of_panel_bridge_remove()
 function call
Date: Fri,  1 Apr 2022 09:58:28 +0800
Message-Id: <20220401015828.2959505-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0196.apcprd04.prod.outlook.com
 (2603:1096:4:14::34) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b82abea-23af-46bc-4d5a-08da1382e041
X-MS-TrafficTypeDiagnostic: AM5PR04MB2979:EE_
X-Microsoft-Antispam-PRVS: <AM5PR04MB297947096DA785A65B438CDA98E09@AM5PR04MB2979.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vx/y4MpnrtsMo+ViVFprZqjVp7iAUGK+OqioU4trvVi5vU7s4uYnQHtPF5AmrppasvD4Kc5m8BUlO/DU21OtZvjpOMx1eBLUMgmkv1aD8oRucoyub+QUHIBK90H2lJhXsDm9DcAM/P9KKXhNU6RKmuxGv7CFGkIvQAo5ICJoQ27P1bFBMeW7N3Z+0NbvFR1gltKqIAFDgpjuHVVN2sW0nHpxPwKJkWjfKEShMyZ3cHSInsdaNr2d8QqCbWme8juCfl28Dh8NFHpmP72G2N5bonW+OWmJTXdMyMChmYm0s1SllqwDpkFrgi8Xk12DxyFGSyomROcmFthLyrKSxU7tv7WBjTrhCf4NMAuKNUi39b8mXPCLGaB/M8FaPdNfHZ7tUn9Tg4ID54aAYpVc51Tq/m6ADJhyLkwHT7sZsF4BnGLRaFsVuBZkKVQfN0Ohwgn3LmRKy+2Xz5xECZ6AyRZtC0bQNTr6AEW84FV6dFxmRNGpEqvlDgqwAorvAxt0f//3Xeg8omZFIJXtyCOsQsSFTQJ8WHWdKPKlhpD2sgpj9IxSScbbhb7g7Os8wgKNNtKwNk8Wm/nHtKGimPjjWJQE4ZE01WWbG6Vi/wdoGKG0faLafBKI17Parynn5aOYPHxWQKZyPL9peG5iUw3/TRfqavxOX0uEYB2t8j7SaKSgr/YIR+vilM5qVyTWxZtFtI+7a5dUvtaKPJPUB4CLgg6qYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(1076003)(2616005)(186003)(8936002)(36756003)(6512007)(2906002)(26005)(83380400001)(86362001)(5660300002)(52116002)(316002)(54906003)(38100700002)(66946007)(4326008)(6506007)(6666004)(66556008)(66476007)(38350700002)(6486002)(8676002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1BQQkRKejNoWC9jV2lXeUpSTHNxTmsvTzdYbWNmYmE3T0ZjakpCeWl1aTdJ?=
 =?utf-8?B?dEt3MHlmNTFEMHhxdDlXMGVuVDhRUnNOU25Wb2ZiNkF0ZnhZeW5RalFjQlBH?=
 =?utf-8?B?cjkzeFBXVHVYemt4U2c2S1pnQm13S05WMkRGLzRRdEZiMERnckhWdFdHampi?=
 =?utf-8?B?T2orK3NjcnhWOWZpWThGdmdXb0ZxYmxTZDhxRmZPRkZOc0RKcUhLQ3BTeXJ6?=
 =?utf-8?B?Z2JwRUJ1ajJVeUs0Z2NBWWV0Z1VVd0VzVXhCMU93UUZBUlgzV3JZM3N2bGlD?=
 =?utf-8?B?QzVkWnpUK29sb2o3ekdySmpRVzErOWlpeksrWUg0blNqclBjZW43clRRWUxC?=
 =?utf-8?B?UVZTZnRaNWpyVS9QczA1eEd4SjRLU1RxM2xCYndML3RMZTBXcWlsTlNuWVY1?=
 =?utf-8?B?Snd5M2R0YkZFdTNVU0JJdkhDNUdsdTZSazBKdmF2YTBJZ3l4cFU5TVZHalVs?=
 =?utf-8?B?Ym5FYm1mNHZ1SUlLeHhuNkRRU0t1ekR5UDVGRkR1QVdlSERpdHhJUE5Ma0Fy?=
 =?utf-8?B?T3ZxTHdZWEtvc3FqTkRPQVhPNEppMDY5MHRIUUt1Q0V0Qno2WEhsTDNNS1NC?=
 =?utf-8?B?d3c4bW0wcU1hQ2t6cDNsS3ZMbTRVeGhXTi91dDhGVHlDOTV0QmQ1M1dhV0Iw?=
 =?utf-8?B?TnZrSWNXd3poM0hsSFJEcEdsREFaWk9seEhQNkp2ZVAvV0txNC94K2xuL01K?=
 =?utf-8?B?ZldNUmxEUCtrTU42VHRqbzBGODA5akZJUXR2T0FDQ2lqV3JpbmhTMFY3aVI4?=
 =?utf-8?B?ZW9VUTh1VzhEZlN0dzhwbGJHYnJ0VzJIbEM0c05VUzJuRVVmYUR2RFA5SDlU?=
 =?utf-8?B?WVRqTmRsQ2dTNEtIb0FkdFVSL1hscXJyQk5NVUxBQlg4Z0VqczM3bjhIZ0tk?=
 =?utf-8?B?T0tOUFB6eFJPRHVlelh5NHBzVkZUTkVtVDBSYjJxSDdkUVZzc0hLYVR6WVNQ?=
 =?utf-8?B?Y3JrOFRtM2VEUGdLYVUwaHdJNFV1QWhaQlRjekdzV3hDNzliSy9FK0dpbnYv?=
 =?utf-8?B?RnpsV1NNeVJGMVQ1L3JIMjl4Q2pvUzB3TmxHOUxmb01lWTEwOE0ySVBpTG1R?=
 =?utf-8?B?ZUtadmJWWWJnaHliQVRiekcrWk9zazF6cUwrS29zRTZnYUNydUFNUmtqU2Ju?=
 =?utf-8?B?SXF3c051ZmlodGhqa3BvL2NoOSttQU1XZ3E1d0lPV1pWdkxWSzlGZFBMRUc5?=
 =?utf-8?B?SFhmMklsZmh0RFlmd3VBTThQNHFBNS9xL3RFQmRnRkdWU3BkSUJQTVg0T0NV?=
 =?utf-8?B?K2hZUDJndFV6MEIxNndoYllEbkszemdqTUJWUEIwak1JamtSMFNaOHNLYytt?=
 =?utf-8?B?Z3FNbTVvSTg3dEpBa0pyZUYrZHErM2Vza01YdXNYWDVPbEFVYVIvUXh0U2tv?=
 =?utf-8?B?Y3NRcmE1VGMvSTJwdEo2QUxXTGkxRHYwNEhKOVRQUVM1NllCVGIxTVJKQXVM?=
 =?utf-8?B?SjRqR3UzMGVqc0pXUDM4bWs3SHFCeDJyZUhLSmRZT1JXZDVNVUNXc05FQkFV?=
 =?utf-8?B?bVVEL2hDc1Vvb2JVS2JRRlNqbWJQRXRmTUJ0QUhyMjhhR013TUlOOTZDTlZH?=
 =?utf-8?B?S3Q3QmN0VlJYWFFuUit1U1VJd0tYam1YSS9BQjQxVURPZXdVZzJ3UHVIOW9C?=
 =?utf-8?B?Sk5SR3ZUdzYyZTRwT2tMUDV0eDFkcFB1WkJRbE82Y1hkSFppTXRGR1lMYVdS?=
 =?utf-8?B?bTBpcHlGbmI1WGNEaGU3MTVONFdhbWlyUjZBQ1RCaG9CcnNlVzRzUDN3RnBU?=
 =?utf-8?B?ZnU3U3ZqNWdsWmpGemRpU2NGTHo5akxKT1Z5SjBsanJOdnVyM0ZQVEZzZTl0?=
 =?utf-8?B?K2xYOUFUaG5pTHpVcXBhWUg3QkhoTVhKY2IrTnZ2d2dXdnlsaTl4SjgyTmdK?=
 =?utf-8?B?d0xuK0RncW1laXZ0RHEvUTlXSGVNUHo2a3RLTitUa1RHWVc2L0lXTVRLUmlO?=
 =?utf-8?B?NjZSSHN0NWZVYy9pQU5jdDlSOU1Rb3EyWjAySS9QVXdGa2I2cjZFb0NORGd6?=
 =?utf-8?B?cDR3Z1BXYThFRTBGQnBqcjFaL1pST0p2RlYwV0VMY2NRYkJPa3VFNFpHZHQy?=
 =?utf-8?B?QXJDRWd4VlV2VVpDMDV2c25DTWM5eTlDR2xvNlZvZXJmWXk2MDlMZXFJa2lC?=
 =?utf-8?B?MFZKVjlSZmt5VUpIZXhiMU1xMUVhTTF2ZzBFQzVuMzdINDZRSU1rNFJtdTJL?=
 =?utf-8?B?V0hkRm9KODJQUUJkdHhvY2tuOXE2dUU5eFUvWm9hd2ZYbmxBMUxEYnlCaVFV?=
 =?utf-8?B?RWZrRHhHdkJ6S1hjZVh2UjhqMmUrZzZwYlNWRzZpVHlrWkEyMVllMmVSdU9a?=
 =?utf-8?B?b05rdFhzNmxNSFNLYjdmWjRDalFsakZYckE1M3RDRm5kcEd1emVCdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b82abea-23af-46bc-4d5a-08da1382e041
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2022 01:56:45.9148 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vk5k27pqoYPMzRYw+RW63tBivGDRbqbKQi+7dr7bOcTdNQ/sRY4p5fXzky+yv5GZGCdPVwaUSV+oRe0PnGgBCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2979
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
Cc: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Foss <robert.foss@linaro.org>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since this driver has been changed to use the resource managed
devm_drm_of_get_bridge() to get bridge from ->attach(), it's
unnecessary to call drm_of_panel_bridge_remove() to remove the
bridge from ->detach().  So, let's drop the drm_of_panel_bridge_remove()
function call.  As nwl_dsi_bridge_detach() only calls
drm_of_panel_bridge_remove(), it can also be dropped.

Cc: Robert Foss <robert.foss@linaro.org>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index a549da5b3f93..47859d4506b4 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -919,12 +919,6 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
 	return drm_bridge_attach(bridge->encoder, panel_bridge, bridge, flags);
 }
 
-static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)
-{	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
-
-	drm_of_panel_bridge_remove(dsi->dev->of_node, 1, 0);
-}
-
 static u32 *nwl_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 						 struct drm_bridge_state *bridge_state,
 						 struct drm_crtc_state *crtc_state,
@@ -970,7 +964,6 @@ static const struct drm_bridge_funcs nwl_dsi_bridge_funcs = {
 	.mode_set		= nwl_dsi_bridge_mode_set,
 	.mode_valid		= nwl_dsi_bridge_mode_valid,
 	.attach			= nwl_dsi_bridge_attach,
-	.detach			= nwl_dsi_bridge_detach,
 };
 
 static int nwl_dsi_parse_dt(struct nwl_dsi *dsi)
-- 
2.25.1

