Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A8F51A4FC
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 18:11:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C3510E787;
	Wed,  4 May 2022 16:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2115.outbound.protection.outlook.com [40.107.215.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477AE10E787;
 Wed,  4 May 2022 16:11:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OuBKxtqu5MP3hVrNiQRofKJT2z+ytkDHStesfZ8r4P9kXFlsALZTSIh6jibos4SZPvXnRyTWR/p0QZFfhzm3qHBiWl6ALYVXVJUS9Xn7TeQvjN5uzex2o4epQDVCSr/igY7J1Y44aYFs+7Z9rhtPTRWGj1PvTjl7FxrvmVPyfjnaGIdeTBSiGT++cj1Vrta3eBuNuEmvoUS6XfRePEnXhWsllS4QF1483rp9IB8/ELOx2l8nwAZQX3LkvJR9lyrKBHcNRQS7IzTpW8oadPAEtUEpUY17/CsOQjWvhAs6O0cNV5wXuVxCZ639CXXV93AiapbzJ1t84XsDhkS1S8Cyyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nv/ilAyu2e0tCssc3GctQUqreN5drt6PfNFSRMrFeqQ=;
 b=J5OUWxh1hdqumbn9cYgbQPoWFNzcfSpk0GeX3hZD79TLsxgzEdeyVO7kbMplur9CyTB4VD8msooBPkStxR93biWhJMJ37WxXpFt1Ce+uovGNHg5NkKRep8A9kJa0zUqDiPauM3q1qHaGPIW6Nddn9fKl4twws7/T4cAQhwPQszCufbVynN7J6Hax8f+NrtJdcnUBXi6sFXSTQZRgUf7JI8HKAtHz+jVVvlYrHvCpkAdsiYdyqnHd7chsnKeu/khyQIylGNnRQOAeGingnCwzBCTUNYnEOplfZp0M1Sc0iVU1Ds8LjU7KHxadCYtABcG9t8a10YqQ5kwewKFZ+auFQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nv/ilAyu2e0tCssc3GctQUqreN5drt6PfNFSRMrFeqQ=;
 b=BhgOML8JJ9M0Ljsmn4+a/0eJCLRSHksDfy5AVK2a+qqvkZhVBuRvEGyGb1Sn1LUCmib9wfo8F7wZyb86nBTnbXP7QSIZkCUZy/uQFUkMLmFo54TP8OUBbVOF8phJc/ODvu5FrSnwAB5HZrU1rqIFTSyan99Se9d58l0d20zlNLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by PSAPR06MB4487.apcprd06.prod.outlook.com (2603:1096:301:87::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 16:11:29 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08%7]) with mapi id 15.20.5206.014; Wed, 4 May 2022
 16:11:29 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Guo Zhengkui <guozhengkui@vivo.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/devinit: fix returnvar.cocci warnings
Date: Thu,  5 May 2022 00:09:29 +0800
Message-Id: <20220504161003.9245-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0023.apcprd03.prod.outlook.com
 (2603:1096:202::33) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9203220c-30ce-4a91-997c-08da2de8bf06
X-MS-TrafficTypeDiagnostic: PSAPR06MB4487:EE_
X-Microsoft-Antispam-PRVS: <PSAPR06MB4487AE90B047F6CF3E2E8EA7C7C39@PSAPR06MB4487.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJEBii/TiRk4NAFLhheo9elhxBN16SmhlXIzimj2jZQ293mOrPe8IxCWtJU3wRwFMnYlvq+V/ZM1LYl0BUM78uDvGd6+sbBpsczsqmy34EbvszYod0B2UevWAXgrkfZNv/LeSr9MPcWWqjhI/YwBJlzFJebsHnrkWAoR9hrMTPjxumj/ymdEWD4/DUyI+OjSUPe5Y4LnQSdif2AVr1CoNPvp+SP1cB9ME/VN0TRUUGBc+Nbmxxl0U2TTG4hW7lzxV1xBYV56wu5dCYFj2uN/yivEMReG/uvxKFz2C5qjzbwYXb3K+wym62bshTfZg/0s8iVW+lte1zpS+2ZrEy9C/WWif2g7B3CH63rouI61n41ngzMZr+Z3sImiNle70XJ2G5+s1cN1yTNK80c//8felyDqvGH2m9qHki7/dynm99Nmzgbv5ZIPA3FdqSDwLj371Am0rXnmADReP9K/lKYv5uKHqZH9tx+mo4GCe0M1Iht6Q8aaz9Qp3eECL1j8/6AgtWP/wrU6yB1gRGjng0Ig6UChp0jglDzIY1ZUSa8mFYFwzh575nCDQFBnOrybdHllk0W+JWxXGH1fysW4GlxRzF+AvbU+/UnWgBFzvKdYC80U0kAnZQVvsf+qaUQvH34mjc1+tX9WwJ7glfIIXetutSXtry+K2+GAK2rPcnQrPD0jgL7I2KwxCUKbzCzExdjZeaKB7DSR3kVoT2ac4TRMCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(6512007)(66476007)(36756003)(38350700002)(38100700002)(8936002)(83380400001)(2906002)(1076003)(110136005)(66946007)(316002)(26005)(86362001)(6506007)(52116002)(66556008)(4326008)(8676002)(6486002)(186003)(2616005)(508600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ip4xu6lPJ2d4CJDreB7LGixVTDDZIyuN//ykpG35A/EM+jSbfn11LzbgNfZL?=
 =?us-ascii?Q?xbGWIZS0wNj2ZLW3G6DYe5HbWUf5saI3T8YQldNsrAeqJltJ+WOgiymSuuLv?=
 =?us-ascii?Q?qUi8m+ZP5bO8Y3zdkeZabb+U+9oWXnfcq8IU5pWgDnCtjx3Si6b6Vpcu13y0?=
 =?us-ascii?Q?N7O63IfZQH4L1wWeI+y46kxgshIb7OC1Lb/jvsv9Sc7JiD4Uve5XPD5Jai3Y?=
 =?us-ascii?Q?hjOV3RFWEAcnDO3ZXRQVL+z9v3VDDoTgSm0bmobhCfJ+eTmPfDgM3fPvae2I?=
 =?us-ascii?Q?ckKwb1/ssAE8tkn+IrjV3xUbk6DRKAG1oyj3n4PNpVDQcqE20UhztRIzdRNa?=
 =?us-ascii?Q?VvlkeC8P7rzqtlI49yCDsDDctk+cpM/xbhRB0DrXoUjLjM00XOEcHTTZjCPW?=
 =?us-ascii?Q?pFf2NX43l5IPqeVYC28D7KayFOrmhmhi2bHtYdw8zSQ9DNNhh3T7lUcLW4AK?=
 =?us-ascii?Q?y+JC1nuExhh9cgdvGjIhZYT89Nk64Yt+haTGKcDjNp1WFMJ0POxINJek/ivz?=
 =?us-ascii?Q?rjSt9UqudVug2NZ7A7no80Z1m6M+mTt+uy3S9A6eSExq06FAAzyeXhQmWxmJ?=
 =?us-ascii?Q?dhyhAvV5n2R8o+M6q+iten4nFalt1auCF8cz7ILFKAqWfqdBXUFdazdlldvF?=
 =?us-ascii?Q?rvX7VrUMfwsEfqCg68S6niNcD7y9U8gsOH+CcAx8PgHeTGAlZt+IGjkyuiEi?=
 =?us-ascii?Q?eXrMqMsTkb3qr+ge5EYa102lMYxS7xtzG7tDj5z78Gl1Ogy73nP4ecE8o9rc?=
 =?us-ascii?Q?85AavPxbE6CPC3jiH+3ZeQhr7HHM51q/kfJqz4xgcZcIB1PYPtSlgttrn3O/?=
 =?us-ascii?Q?BhZyjOTmIG4P7j9WhkXLdVcBcdlf4wUhw6U0jrckbD/c7qSycFKS5cKTY7US?=
 =?us-ascii?Q?H1MRFM+XvHDnmArw+lH/oRieS/M7veFbhi2i9Z7tTh1hfjQCWMsQ6C+VFQZ9?=
 =?us-ascii?Q?LCldhWlD+/5Obl31efOgFsJHzI4jI61h+xLalw/i42W8ec4sertjWB+lrJp9?=
 =?us-ascii?Q?qyaGleuhGTfJA+Lu3l4OBeaM33folvgGjDj7avIepkuiHk5UC5FilX53BbrJ?=
 =?us-ascii?Q?TXg2a5Yx/dJugpJBgAirmafll4Kz61IwjrcRuQpRyBvj4ARAfT00AUEL2NGG?=
 =?us-ascii?Q?TNaYmiEaZ/GiKlpxTCEdKe88tKYKxmIka9yaA8gN2WWqkoxZ/pwQMwm51KAR?=
 =?us-ascii?Q?LVQgnhgbEvMEXJjoOhRZ0GFpcXuofsGjJl7HAZxFv2YAwJi0BWdhHFiKcpzX?=
 =?us-ascii?Q?XFGlo4dLLi+f2yGMXLt4ila7jZ606P+q5oHIaeeI7PIh1BzaHbJ739hiHso7?=
 =?us-ascii?Q?C51WGinKAWUXmGbwEDwWsXO56JSxeqcESN1SwOtxlE1nUKZqq0EmYYx5n5RU?=
 =?us-ascii?Q?B+a3+B5VAHveKuy9vswj99zKUdu5T8kMTqDc1iI7W8H1E8tgFzWA4cFPZPNI?=
 =?us-ascii?Q?o+NqooxXPBWLk/2gU1198FFPJWgl9IefGNywytHYvsAAIBAQAswRuB7c1XZp?=
 =?us-ascii?Q?EBtVEEGdxJ9b3mF8g+utsuU4MFtPnphw3kSqPQrEdXwnIFQaqEQxucrRc/jV?=
 =?us-ascii?Q?la7w7bfznFHv0oan9C3sz/pQpfnrDjCo4gg5aF2eOBgGf7DqkoKq858nJ8SA?=
 =?us-ascii?Q?hnXyIPLxxEE0m4CEEkftPy8G815+YZhwZTNWb7KYACeHjgyluc+VVu6yFOIJ?=
 =?us-ascii?Q?rNXcDN40nA1e56+2Jh575LWvhCGRg9QRBpDNIdIK6PURpPqzVzX57h6cGr6J?=
 =?us-ascii?Q?y9af3QCrOQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9203220c-30ce-4a91-997c-08da2de8bf06
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 16:11:28.9389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0Ov5RfxE4Mey0+rewuB0ZjG5fk4KJybKkWUtc+wWGq/kw8aiTx8+xphPLrdKYYFvUkEOF0m65yhiNmIFVoJBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4487
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
Cc: zhengkui_guo@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warnings:

drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c:71:5-12:
Unneeded variable: "disable". Return "0ULL" on line 90.
drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c:35:5-12:
Unneeded variable: "disable". Return "0ULL" on line 44.
drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c:35:5-12:
Unneeded variable: "disable". Return "0ULL" on line 50.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c   | 3 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c | 3 +--
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
index 05729ca19e9a..8977483a9f42 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/g98.c
@@ -32,7 +32,6 @@ g98_devinit_disable(struct nvkm_devinit *init)
 	struct nvkm_device *device = init->subdev.device;
 	u32 r001540 = nvkm_rd32(device, 0x001540);
 	u32 r00154c = nvkm_rd32(device, 0x00154c);
-	u64 disable = 0ULL;
 
 	if (!(r001540 & 0x40000000)) {
 		nvkm_subdev_disable(device, NVKM_ENGINE_MSPDEC, 0);
@@ -47,7 +46,7 @@ g98_devinit_disable(struct nvkm_devinit *init)
 	if (!(r00154c & 0x00000040))
 		nvkm_subdev_disable(device, NVKM_ENGINE_SEC, 0);
 
-	return disable;
+	return 0ULL;
 }
 
 static const struct nvkm_devinit_func
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
index 051cfd6a5caf..5b7cb1fe7897 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gf100.c
@@ -68,7 +68,6 @@ gf100_devinit_disable(struct nvkm_devinit *init)
 {
 	struct nvkm_device *device = init->subdev.device;
 	u32 r022500 = nvkm_rd32(device, 0x022500);
-	u64 disable = 0ULL;
 
 	if (r022500 & 0x00000001)
 		nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
@@ -87,7 +86,7 @@ gf100_devinit_disable(struct nvkm_devinit *init)
 	if (r022500 & 0x00000200)
 		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 1);
 
-	return disable;
+	return 0ULL;
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
index 4323732a3cb2..8955af2704c7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/gm107.c
@@ -32,7 +32,6 @@ gm107_devinit_disable(struct nvkm_devinit *init)
 	struct nvkm_device *device = init->subdev.device;
 	u32 r021c00 = nvkm_rd32(device, 0x021c00);
 	u32 r021c04 = nvkm_rd32(device, 0x021c04);
-	u64 disable = 0ULL;
 
 	if (r021c00 & 0x00000001)
 		nvkm_subdev_disable(device, NVKM_ENGINE_CE, 0);
@@ -41,7 +40,7 @@ gm107_devinit_disable(struct nvkm_devinit *init)
 	if (r021c04 & 0x00000001)
 		nvkm_subdev_disable(device, NVKM_ENGINE_DISP, 0);
 
-	return disable;
+	return 0ULL;
 }
 
 static const struct nvkm_devinit_func
-- 
2.20.1

