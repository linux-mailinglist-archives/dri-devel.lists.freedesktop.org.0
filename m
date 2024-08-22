Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD5895AD8F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E8210E751;
	Thu, 22 Aug 2024 06:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="PjEO3pv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2088.outbound.protection.outlook.com [40.107.215.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C4910E75A;
 Thu, 22 Aug 2024 06:33:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhydPUqTXtWKBKsHC48XTbizSwLETDEWuIIBu6k1/u1YecVvm1CzwSgBLt6UydgdVmnjHwkYhVNCwguiGWwoJ/pDqiKPsuHXTqCAU2VGy3TTHuS0LwX62Gnf0clCE3booNpwGKFHGld6zZYt0Ajyb8cs9RUol3JIaPj4/hmRJ7PAWKsDJiOHhm+tMSmQa4Gb4XqH1PU1qRGHznbm4Zj3bH9YZ8wfxs74dPI1uFpHXxbNpu8FwUy5J4VIsK3GjjIObFNHX7Z/bE0T1Uaz4P8JjpgafIzLROP4dhHX7iqd0vM/aCJ/MhizxVkhuzyiTcTrzuCLM2K8VWcH7XQ+DhssFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Nf4qHOg4Wy94B4bQcsuL4rSf5VRXrwo3ygBKI6+/bM=;
 b=cH2f3YPlAeLukcXZzrKdXgNVccBi/NhBJtHTBrHoefF+mElLpStTF+bSZAb8JWv/5Vu7zOgs5RxX8BZQQ1LE1pimajW38g7MVpQFwBDPJMR9bLejEmHx/41fB2mya+bOxkb6T0pFLBEWamDjnStEsWuoguiRxJCjsUqpjOySLcEpehZLCbUYr/MDNTjc+Psmq7jQOBLHtDvmTUefHGxniHPl+ACVxnl/jWABl9XPeLOtKBrQ/awO7SQbs8u8EO8OpxQVKeWjZQb0LKlmQJtA73U5udjaikewPueoR39X4/2oSbfuYYOsJR2wzybm2SDn96w9mC/UeDHH1apx2ABQYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Nf4qHOg4Wy94B4bQcsuL4rSf5VRXrwo3ygBKI6+/bM=;
 b=PjEO3pv2oR/S+PLWmRo0vScE1OWfK8PGa8AoKr6rgGNP7ij0F0GL+rMLW7OLTrwiSVXS3A4Oo8FkWptLxPggioFCOwKsNOJMJzA7TXC/JMFpPrbVj8NEhMJMteFDuPiiqBWfAuxtSRInm7qKJAVxSglaexmgujcOT2f5ERD36aL4N2iyrBfnxspfM0yx7L/Jb9PwY6eQ0rTDJga84QtEVcETaT+GlHZuOqk9ozXhHFcq3A6Kux7ePP3KGelPN2xkhG+mVRWlFx4P3H1YHFPzR90ZBDKV5MpzPyO7wT03F4BL73JoKuFxJ3XPBe7YQoloaQ60FS13Ay4Qqz+3RwreKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by JH0PR06MB6344.apcprd06.prod.outlook.com (2603:1096:990:17::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:33:37 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:33:37 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Hung <alex.hung@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>,
 Muhammad Ansari <muhammad.ansari@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 6/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:29:32 +0800
Message-Id: <20240822062947.1318340-7-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822062947.1318340-1-yujiaoliang@vivo.com>
References: <20240822062947.1318340-1-yujiaoliang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::7) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|JH0PR06MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 2af0cf4c-f12f-4cb6-962a-08dcc2745ae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|1800799024|376014|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4W16E6UpVblwdo9GArypANUqazeLf2MIOQ+68FB6QqE6VwOxw3s4kK0vRr5m?=
 =?us-ascii?Q?pfVQ5I6oOCMLeVk7NsOQ84ALaLXjAlSxerQGUYuZzUaQ9nW6Z+bG11f/JdzX?=
 =?us-ascii?Q?UCu+hOaDUtfMUmVdmkTn2k0yYV+i2OUsoMLvIZ4bVZM4XgnmkOFKMaZrC4BU?=
 =?us-ascii?Q?WeCEGWeSb8I0CZINyuCaxWcaAapso22bMcTYT4hGNnsCSUpJKtDAP6sK6txD?=
 =?us-ascii?Q?lDMubDQHRYmKRCxzWQ5Ugj+MVN2Zdvf4AoP1r1GcY/ZIuj4dRoyv2/+Eb4OP?=
 =?us-ascii?Q?L401TfaPu4Wud0CtMD3h4nRzpvO3fSnry4oJAK73wXRL9xK8Qi8MEjmSuP5p?=
 =?us-ascii?Q?kdbyLWx7LKGEjf03QvoVq6r77LCfMAHGGOLReb7C0tMzFJ/1+4o2Oz4R2oaT?=
 =?us-ascii?Q?TD9ibP0lHelQXFhgqzItjXD5nyxOHEIpzc72MEfh4JBW4RqrIZOp4osN01dT?=
 =?us-ascii?Q?xOnNFwSEsWO2s1ELJgXyCRe6wskEJBJmWGL602Q7GXKUFUw9CYjDVXoS5q/J?=
 =?us-ascii?Q?hBm76OB8x7HEbICJRafFESijK7YNwm7xD7+EjlgPUsm/I00cMqDDQzphnr21?=
 =?us-ascii?Q?94HW6uy8/DLGgofg9IMCjp+fwnxBNs1nzZUf52V9i/7osFZiHlX8DUrfVXKs?=
 =?us-ascii?Q?TgqN9hz8D8wunktTEqRqorWDBDuaCeLGQHabD0cNRAqg8eM6g6E8XGjCCGJk?=
 =?us-ascii?Q?EenwzN0nKqjttYpVQg+Zt+dGe2xT1BhMOGVo8dtXefo1IlsoxI0syxmJ4UJM?=
 =?us-ascii?Q?K04YkzFmzy1XBrYmBubCsAYU5vYolPPcVe7MO0t7gD7Lrd6BSuCKrA0K5fve?=
 =?us-ascii?Q?L50eZa6NeZufyUeGGWeORoGPn/mQICrWjJo4BTvT51LLf+eHms+VD2WRrvnM?=
 =?us-ascii?Q?ZqdKyko0vOQCqDlaMIgOG7YZX37hGJRuh6S6SFq6clqV6f51w64ijnJxGzmU?=
 =?us-ascii?Q?xx8D2spazCbisrLJMJFsvLmbmhjKc2FqNx0OjwlD+wZY+sEOBOIeWAEFrMtA?=
 =?us-ascii?Q?30IojyaRBnAMqCu12utxotypAqLJz9DaguSqPuRJNGsfi383jWCoW0P6jjFS?=
 =?us-ascii?Q?+rD1y8cQtdXJH7QnZwL9x4kPaYmSC0T+B8C+hrZE8OnFEx3i4nVynTYKABTL?=
 =?us-ascii?Q?gPBDFJRwRb7GeF3r0SmktPUgLv+E/6EZfrRjP0sxE5OdjM/kx+ngzVqSCBpZ?=
 =?us-ascii?Q?lmt6dZ7UZN/x6epafOUB6A0+zPqEI99cO7VPpp61kvXxB3WMD3Q4Z9HOPufu?=
 =?us-ascii?Q?2Xd2oEGdd+XToRtyUZ+omyFIgJ6ci4XxwdNAIGVX3hQ9sB5KpRgzxEXtIZ/7?=
 =?us-ascii?Q?2R90TDKPsABea0o+ArjZnbIiSeKL2cwGS4Aad9CL7+WMAK/Bo5OF4tkJJ8fd?=
 =?us-ascii?Q?Bye3yjxRtBnLbq48t7EMFgQuTAAUQs/OkY1RxkgNxcJiJNX5rghpggFuNqha?=
 =?us-ascii?Q?qUtpo8tICfA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l+k5A/zjVJglLaikg/BaflaoCswhou4nWKEgZizY1LNncU2JAzeLnspUJdqx?=
 =?us-ascii?Q?Bw5JRqwtZeNejj3thQOZA3Ig5jE6CO/XCIUimyfz8Nm7bodAhyz7foymLaJS?=
 =?us-ascii?Q?bwJJW9dPTyrQOD5vkiESLKGe6qER9LyoEjZftHnBeo5ZfS7C5H1l8ERDac69?=
 =?us-ascii?Q?xRir/NFe/8oz09E/p7LHQOB+lKBWNK4k/UNPgBrvXQZeVZHNV4A3xtWyPLid?=
 =?us-ascii?Q?CQHefdH9u9I87nH8SIhSICdxSr/Lkk+E8nQu+QWOWUGoxuowwc6JrYxdzk92?=
 =?us-ascii?Q?rrz9Y6zlV4wgC9E6wHhTl/D9s1F2BBen7H0Xr7ZhURq9v7dTsRezJHyl8bI4?=
 =?us-ascii?Q?ekAffHGENu5sNEbnkymJ2VXYx8Urchx5qNOIQyS03rEMEiEQ2JsQoZ/Wgr01?=
 =?us-ascii?Q?m5l6k4IzsacH5SIgNuQw3gYrF3Px6B6smrjcHHf8a6M1/2LYO8GHqKX0K9/d?=
 =?us-ascii?Q?5LEO7/GNSlEL9JOYH7J9aVMxAkjB2QcecupOKJXa1LncGjilOzmGCnTsI02M?=
 =?us-ascii?Q?u47wbGhZzZ15VOVo3HUx//RxFWRk9Rl/DrmQdQhSBkgRKv4/XqgW1VfYMLUz?=
 =?us-ascii?Q?KFOksEu8PP+vbXHCrrYFVfz+28HXCj5IXZq8VO7+VCdz7I5MsNmK1PUjAd/b?=
 =?us-ascii?Q?55VAyKxpWNhMtiTcZ8lnDzPKuplo9DqhsZ80rdTS/Fz79DjKkvA5rp4kVIMi?=
 =?us-ascii?Q?D57t+rk2noqkltavP2VaimuTpHUILdpTbXHMtEi5HKW0psjdwGf4ckK3GDrb?=
 =?us-ascii?Q?W8nKYzOqBGY36mSzYdGtujWT43NhmauNY/C8AyZubsAEHuCk+MivsN0iFqa7?=
 =?us-ascii?Q?0J2faep4RXX7UNHex29/MdUkFoIlKKvjnE91w/swzcxz27io1mwL3Ki1Vf5s?=
 =?us-ascii?Q?fC331qIUXIsj7i18RQACQfK2bYOUVGLBjqPl17eRi4rFOKgqjBPnccCZbEky?=
 =?us-ascii?Q?Kd0CVcyK/oNa1AB3t3b7Nb9sHSsYo5c5DAZb5k8jI6Bc8qOpPvWeP6Tiq/qk?=
 =?us-ascii?Q?gU1TwQsWHTj/uLOc4dlslLlhIGOkAaUxrh/cvOgJLJioZ39NRHNLb4NYmQ/K?=
 =?us-ascii?Q?N8yK2toHrhdtlLghZ8VOL9CUOg8jdoPNgfS3+4hoTl5rAwdDrHDS2+aIYlHO?=
 =?us-ascii?Q?FO4rUVajuJ03MDU2QJgWFZ1yR+NJcIlMAQQDTZrG9bAnG1PnptVwY7SXFese?=
 =?us-ascii?Q?GQdHmk0rUxCheOv1S5h48Sjqhaz839cpO5aMCzH+wO1dpahQP8jZGGmZL5W4?=
 =?us-ascii?Q?O6xNKyiCnbqZaDvj+rRvooGy4z8O2d2jFell+GKqgWrYU48PYiLI9jLZpXWL?=
 =?us-ascii?Q?YcOXyHFJl2V1mmt1tKVtxc7khMTpI8ZKdvZfFihzZpKN2YtyYW7cloEucWg0?=
 =?us-ascii?Q?84332n4XgY8g/U64+P4DPJChx4zCOAFC961JwkR5+kEVwcPKTIKeaM41FAVJ?=
 =?us-ascii?Q?EGeQfMtP5cyDnxhiPSFHnLuwmvqoO7KLaBo0AHsdBuSHhlnaKUg/RkT7Lvk+?=
 =?us-ascii?Q?DDRJWFZzEJfNYlsiW6kNhn2xIwoC3HtU1f8cvZlRaouI9ZGa8OiehzB4nkGz?=
 =?us-ascii?Q?Kr39wGz4rtoUoO7I0l4+pZI7nKXd/EzKQ15lYnb5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af0cf4c-f12f-4cb6-962a-08dcc2745ae1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:33:37.8211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cEE1oyLWatkKE2unKjnt4GuVjH5dYzsbbPpqxwRof8YikDLTaclD96KWD/UazaqbvqBp4bV1h0dEyaOhO4S2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6344
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

Use the macro instead of ternary operator.

Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
---
 drivers/gpu/drm/amd/display/modules/freesync/freesync.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
index a40e6590215a..33b9b87d8d3a 100644
--- a/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
+++ b/drivers/gpu/drm/amd/display/modules/freesync/freesync.c
@@ -1005,8 +1005,8 @@ void mod_freesync_build_vrr_params(struct mod_freesync *mod_freesync,
 			(stream->timing.h_total * (long long)stream->ctx->dc->caps.max_v_total));
 	}
 	/* Limit minimum refresh rate to what can be supported by hardware */
-	min_refresh_in_uhz = min_hardware_refresh_in_uhz > in_config->min_refresh_in_uhz ?
-		min_hardware_refresh_in_uhz : in_config->min_refresh_in_uhz;
+	min_refresh_in_uhz =
+		max(min_hardware_refresh_in_uhz, in_config->min_refresh_in_uhz);
 	max_refresh_in_uhz = in_config->max_refresh_in_uhz;
 
 	/* Full range may be larger than current video timing, so cap at nominal */
-- 
2.34.1

