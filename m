Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F006AB43FC5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 16:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB44810EA7A;
	Thu,  4 Sep 2025 14:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="AuF7aTD3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013003.outbound.protection.outlook.com [52.101.127.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6486810EA7B;
 Thu,  4 Sep 2025 14:58:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ln8EfMHezu0QaVwtAlD3xzjKa2Fk2yAdFw+pxW208swAFfYSGNp0EyvbBEGxdOlx1FDIcXM8RMOLuQ1Qs6Evm4yPib+PzfKdQhbv1Ok/WAuVoBzNQGQFAp7wNZLyOJqVLqNj8Br9wtVhXhYsDParIdnzySCqHserBp1n7v6+XHnVJShkIogDZXs7+Ecb4ljHH5e4oLR1jhmFYcMxUUqTr5pA2EMVELAw2lD2ATVLBTQPhiGtK02jM3IoQWmJaqCqX3jTccX+t/8VrDj0JIrgsD1TCgxu3pU00Y9IhuK+MwgmReKiq3OLTbUGqZxYHIWg3dMVsMoEqYIZLdPeA1Lcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxSKD0a2QT5KLRQ4zS/7mwRJnaOc8baX/tXLXgBtukQ=;
 b=fCwTGVt16Y0AMhRFiSi0q7m1x/HcBD3wV7VCQbfMcpHwX7Xp0vCSXc3+2NP8l9xK2Ke8H1qYcNg0/kwCnMQcCwMNxyj+fRNslpIT09x02o698KoRdI8rpMNdohB19h5lPfdaGa8spJM2kJuvy+8Ndo/P620dH3SNUyh8dWO/lh3tOhpKkeGpHtriYACfqC2jnTccfekqm1QknS5oEqNxYIcEoPD5YZ9BNDSPkGPpv2u+gIfVctaCH9Ea8a0/44ylTomHLQ2Ulfa8s9hFnKsAdwU5CZNcHN+lFYgGeSWA3GPi7MSLpDUWfKpw37stDeM8bGe8/6caaru7WXW2SQqUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxSKD0a2QT5KLRQ4zS/7mwRJnaOc8baX/tXLXgBtukQ=;
 b=AuF7aTD3EVTO+C4ALQh5NcMN0uEiaG9Fr/fdZ6WB1xDavhrmJz7ooOV9ftMPJvd8DkUE2liliXvHKMOv7CvxISGvxpRaJwnz/5q2Dyg4vqTWmd4V8himrCbMc6oNgw/ph/uJyuiJZZCgHhO4Y0Atb2Ho8Qgoz2eZCwQtf7q1H+C5dJNCIbPuXlY4e/rwG7QhOj7SultP7AHABiGcM/wORd7T9MWHUFc/V1yvBFkOGGEhy+6q5lGAJF96GllgBz/3uZdko9o2WudvW9GJAm5BOdNQNxz79AyWq5zCRPn3WjfYA6LR2po6J9neb3uLi/F4o48D0q08wIxWqpB09f6XOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6013.apcprd06.prod.outlook.com (2603:1096:101:eb::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.30; Thu, 4 Sep 2025 14:58:21 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 14:58:21 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Qianfeng Rong <rongqianfeng@vivo.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Boyuan Zhang <boyuan.zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/pm: use int type to store negative error codes
Date: Thu,  4 Sep 2025 22:58:00 +0800
Message-Id: <20250904145807.556882-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce416f4-abd8-4cdd-1fe0-08ddebc37d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kBYrP6Fuufls/X8pDkAyHzOBwZFj69X7UeoZSc6xwbS+TUaUOTrik1Fior3I?=
 =?us-ascii?Q?uK4Igym1RNG/uXTw+jHMvmD2BV4i9h6rrY6J2jvRXHPKInaOefpBstALLU8K?=
 =?us-ascii?Q?66tF0ypZOpimOftWHgIUqR0QoAqc7EMtP4TXe5dkRewFETs5P8cW+I1voHkP?=
 =?us-ascii?Q?zPSBLFRUYcJ6own6tPtPMDujGC08mFBWEFxJq2lwSUpUeQDRJQWV+6oD4UQk?=
 =?us-ascii?Q?rrrnLInkSN7nStToSBvO9/I1Op7ehPDWVtDO1shnfSGBWlw1L4JdhUopD5f7?=
 =?us-ascii?Q?jeWsAlbp3DqDpGtuP5vR6551x6qi3r/QxwkqDYZcBG3xK5aMbryg+YJypsuH?=
 =?us-ascii?Q?KErsUjocpW41P+cggqwbfpFM+kCZ7F8iHKdGtEsIJitbErNiVgXN6ojgY4ow?=
 =?us-ascii?Q?tT5eFyyz304NC3OZ+OIw4q65vDbPE/XFMimh+9/VAOq2O0AnsXRDlgMW09mF?=
 =?us-ascii?Q?QW6qdaogS7zwCmbdoLOBWU2LHJ1VI06eeVSOCmM8IgvKj9Fv1Kxv3P+tC8G1?=
 =?us-ascii?Q?6cmveN6awOQqnghrZFCl5543X2lRQjha4qEVTCC5W/E6wtyYHsui3GK6pKMo?=
 =?us-ascii?Q?qEplU9GAkjL2DYqvovVGpkpTXYtgOjGilip3xNO7aMiQUYpEzTRTScxQ24Ae?=
 =?us-ascii?Q?Ia1L9v1D5k4ARG1qL3ZGy2vHaccCvSVY8vnredDd58s5beFAlPVdFgq8iALW?=
 =?us-ascii?Q?RrI0aPb060KJxvEsKqyf77vLoWyNV5gNV4k53VRJEvLtcCebPqg3CbXPlOd8?=
 =?us-ascii?Q?YjuE4Y+OWXkuBeMh3OPdJZROud9+wApaMxneLiSxsLYVleACl/0dv0u5NeUI?=
 =?us-ascii?Q?CmoVb3Oyv+CJcsDoVMK8Qcc/EBoByhhE2Tx5Ai211f4AjbxIgcPTPH2ltuLD?=
 =?us-ascii?Q?1tAPBtxEh4ohxSOZ7KsmBBYLBl9Ewjnvd71tpzfUk1GeBl5onts2EgpowcZ+?=
 =?us-ascii?Q?TybX9pVdvAVdpxaFwk38Pj0J0Ck3a2uVNz5zLlm0PjbNI20McH7uS43Czsvx?=
 =?us-ascii?Q?ZzW5pcA60E71+G4dWBZMLv9FgYiIzkcNOfkg32xLHurWvXunGPLCwUsa04pw?=
 =?us-ascii?Q?iRIxxv6ZDBfuTAkJ5SVny48keXU9xeoB/kglgozUYE0OuMjvpCCgp4tDR0tx?=
 =?us-ascii?Q?+ifivAP16v9l/2VGO0lNunA5PgWVuwWgro5dMKDPpvYjayhukjbb89e/Wyn8?=
 =?us-ascii?Q?Y6k3rkT3KlT/fb6CNIfTov2G7LMAvvaQEnnjTiZivK96TKnoWruSgjC7zXkL?=
 =?us-ascii?Q?Z2OHgvBaz7CsfIfPf5GL1tmvz3v5cRbPkNJdkThcOHIHeSlFc4A4fBrmSD7c?=
 =?us-ascii?Q?NNVDXuX/NG+Z+XAnYfQeOHj7ZvuINXJXxNLxcUkOcGKvQq0KJv//up6wrxfH?=
 =?us-ascii?Q?GoTu8VKOPEYuGbnTTx2RGYbN3khy/nMCSFCVBp6vUjxNOzJwjVYGS8BXD/m0?=
 =?us-ascii?Q?2VLd4pmJ98wV+N03O7oOEwKQ9LW7zlPCBuCM9HqEg04/GHPchItdLl7oTipU?=
 =?us-ascii?Q?PLVtlVrOKLksiZE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR06MB5140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HYxQo6U8XhXqhrrOHFWUrR1j2J2tRDBV+o+IfRpKiLVt9mg82KBYbfkY/hkS?=
 =?us-ascii?Q?Ugbmb70ZjSnObZneCJKRmjhcX8+B6VO6laGG4dxMqFOjQh9cf4K8RxLA/ZyW?=
 =?us-ascii?Q?MgKNJutlD7S6oL6CRCyphOUh1fNqE76I15xXDbKho/3bDH7Gj4DKHoyGVepC?=
 =?us-ascii?Q?htvroEpRLQjC1CU+2H9XsL3sVxgSWVw0/CdZK7ceWku1cX5lsPQTmBQ+sj8e?=
 =?us-ascii?Q?9+jUFWpnPl137ZeHCCnKHUg43vjg4GkX1P+j+PhVECRC170TyXfetYJSppeK?=
 =?us-ascii?Q?8m0TxY0h81Zfxnv7fWOnEExXvX0npcNL0iW8JRmOaAi4GAFgFWhSVklVvnvA?=
 =?us-ascii?Q?cNQxBhCyQVud1UxW1kQFFDZQqCgCw32nf8okQW08a/O4AAEKi+KfMIujwnzK?=
 =?us-ascii?Q?XyymthlgQnWRj7BtXYGmhptN3NtVERWraR6AIKvSPzfYZqm0zpWaPIfm+Ksl?=
 =?us-ascii?Q?f81eOeAYSbWcNpAaOslefBmCOnAMCpPIODK9XoCnHqtdNr77716p9zgI7V20?=
 =?us-ascii?Q?eciZLA+MTldonfARB30aYaKu4BOYr3zwakBxy/h8NXYsAvVOCp6hCJQmTuiw?=
 =?us-ascii?Q?4HSiEa/b2ShTYHrND0f5064gQ1p9fcdfyamFKshVcBAciYkSnEnzGE0SKaSV?=
 =?us-ascii?Q?wxvff/lv0bj0hk35fIH8nNstlaqirpZZFwjGr2Qc5SkFtlmNMAmgLtPus6od?=
 =?us-ascii?Q?VWp6fKd/CiSev0Auxxy3m5uPJBZcOu9iZcjtk9LVBnalL/kAEWXcApZXrM8t?=
 =?us-ascii?Q?GB+O4+P61m16AFaaNiecouyhrd2UXMdExibM3GYIiBB9G1hJTbiUXHgu6XnG?=
 =?us-ascii?Q?4KKLhnucVQ5MeeWndbSMm6beBzMm3a/CzdY96B7TytcYvAxgQTPSPAUJ+J6Y?=
 =?us-ascii?Q?VjCFf4K7OVNyGjyEiwNRzSFGtn6zCLNzHJRNgYw5gLOOtk63lhPSiQzSghZ6?=
 =?us-ascii?Q?gaZHKK736ngA9gqRtVwmxL9KzcJIkj5+JEzu6gbDyhN2A/PEUG8jP870dDce?=
 =?us-ascii?Q?oqJTZbiwKPzIuZV3ubli8Vley954aUokJsoUzFkDx8yQuCs+EH1Qakkqb9f6?=
 =?us-ascii?Q?GxgYFGwXUwt2fHDw4wzFUFKqbxIM+hDkeTRWXCu5w1P0t6mDb5muu3oc8GHm?=
 =?us-ascii?Q?VLKmmYkx9Y5xE8yRRV4blhcT9P+2WeZqW2waez12vH01ypOFzR3mJyKuTIHB?=
 =?us-ascii?Q?Xz8qTDRF4BASjRlTXSy5vhoua/4J0e5xxzqA2q4mAUIPK2VG50+mlbFSnrva?=
 =?us-ascii?Q?1oZCfexRrxWpViAmPvOtrbE+ow5Q6S6k/REP5vmFXLREtRjFgJHXWWjaKDOu?=
 =?us-ascii?Q?vkgZN31QmSveOpT30DR9QsKKXSrXq8qIEJylesr5C7n8pUZ9UYAtHvZzaFjk?=
 =?us-ascii?Q?6WuKnmkjVpoUwBUF2vNjdiaIDy8QK4kIQM/RVAjCYoII3Fa2O+v4fQnAmaI6?=
 =?us-ascii?Q?/GEwfhpIVuaqcVWk/9H24VGQHiaIUJN0mBCm7DRQ9OcAvQW/GYzIGXhxnvw9?=
 =?us-ascii?Q?b74GPCKW5E3E6CGcBHwyHDMufw9aU7T6t9EkjE4mS/gfQijjZixqmKuTsefW?=
 =?us-ascii?Q?3PpPDX5Ver1yl8RGA2RG3cIMf++MlI3VPt5oi2nO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce416f4-abd8-4cdd-1fe0-08ddebc37d30
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 14:58:20.9448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plXoip7WvJEyz4uGyee28D7TDKiCzcenyNK3/Prj5g2TDimaTiSo9qYVcOpKojGmr+NC9eWDOWCSt8lhS7xMmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6013
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

Use int instead of uint32_t for 'ret' variable to store negative error
codes or zero returned by other functions.

Storing the negative error codes in unsigned type, doesn't cause an issue
at runtime but can be confusing. Additionally, assigning negative error
codes to unsigned type may trigger a GCC warning when the -Wsign-conversion
flag is enabled.

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c  | 2 +-
 drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c | 2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
index 9a821563bc8e..14ccd743ca1d 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.c
@@ -1032,7 +1032,7 @@ static int smu10_print_clock_levels(struct pp_hwmgr *hwmgr,
 			data->clock_vol_info.vdd_dep_on_fclk;
 	uint32_t i, now, size = 0;
 	uint32_t min_freq, max_freq = 0;
-	uint32_t ret = 0;
+	int ret = 0;
 
 	switch (type) {
 	case PP_SCLK:
diff --git a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
index baf51cd82a35..0d4cbe4113a0 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/smu7_smumgr.c
@@ -401,7 +401,7 @@ int smu7_request_smu_load_fw(struct pp_hwmgr *hwmgr)
 int smu7_check_fw_load_finish(struct pp_hwmgr *hwmgr, uint32_t fw_type)
 {
 	struct smu7_smumgr *smu_data = (struct smu7_smumgr *)(hwmgr->smu_backend);
-	uint32_t ret;
+	int ret;
 
 	ret = phm_wait_on_indirect_register(hwmgr, mmSMC_IND_INDEX_11,
 					smu_data->soft_regs_start + smum_get_offsetof(hwmgr,
diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
index e97b0cf19197..3baf20f4c373 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
@@ -470,7 +470,7 @@ static int renoir_od_edit_dpm_table(struct smu_context *smu,
 static int renoir_set_fine_grain_gfx_freq_parameters(struct smu_context *smu)
 {
 	uint32_t min = 0, max = 0;
-	uint32_t ret = 0;
+	int ret = 0;
 
 	ret = smu_cmn_send_smc_msg_with_param(smu,
 								SMU_MSG_GetMinGfxclkFrequency,
-- 
2.34.1

