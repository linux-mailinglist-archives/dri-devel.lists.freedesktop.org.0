Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3795A2EE73B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 21:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B5B6E527;
	Thu,  7 Jan 2021 20:53:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07406E524;
 Thu,  7 Jan 2021 20:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enJf5BJKUw6x1ucICd09KMsh900rbdjh1ON/q0mUZ3nBViXjLyPDEjAgIbZOno9HMrC7UEfSmzk1eo43SZoOTS4KSIfwtQLG5nJ0EuOW3/1WYddYJBCyiaIC8KZoQ6x4esiLilB4p8Qs1L/Mkxj4movvhNv63uyUlCg68uY23yvjVc1dO3P2ioIiU2/aqhC8mH1FDAlx75mzZU0W1aNJavwrWAvZHazmW/aAI6Og2M2NogD0O2Nj2rkWQfHa57igLmWt8VgvEuUN3gvk+Xft+/I72+eF8qrCWM6T6C6sBIn0+trgJwS9n/goL23OS5lAW0iAL49aP8e13AtwirJX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSIuqWUtn+1C3xEqIGAlaDZFM60Pkt6rV+C8VWATRs8=;
 b=npcCUvJhL8cSpnjIkmCH4vlMtIautHenLFBKUBNLPdTzr26SzKuCKze9Tz5CkEObXr5AYuGKEbs61qCwWpkTSd+YTGk2CdW30gSn9OlRN5QIWrFHGr4sG8NkbiLv2+JXMLX7HA43qZaiYv2WM2BEjcQdK6/To/gn+/NQRZoagyLAD3gzwh+nWyTQ7seFZaQOnWU1rO79in1oYtv5BIWNgRcOH8p9geh4msgpo+CoqRqo8UyFZltQKcCEU+jt21M1jxy0rC0yGURp7aFr/d0C3yFc619xcgzVzTvEOYNNcUcOpiow8y6ooixhbIoZ9o2DOtibbEe5vOoY/LLjeJl7uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSIuqWUtn+1C3xEqIGAlaDZFM60Pkt6rV+C8VWATRs8=;
 b=g4xQrBK7FnnSipsXXUrKuf83T4NR0Ma9p09MBq8+pUbB+84ltx7w0Hy8GS44cKkuOq2OpdBLSMSSj7lMPSdXmMpZHUgGxB/ciW2ToAaUXx8m89HovzZh0R/hfyuWe+JvpRUpFtPSaU74tUciXJ87YnFZaEjRurTkRAx7/5KyqkE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM6PR12MB3595.namprd12.prod.outlook.com (2603:10b6:5:118::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 20:53:39 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540%12]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 20:53:39 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] Revert "drm/amd/display: Fix unused variable warning"
Date: Thu,  7 Jan 2021 15:53:19 -0500
Message-Id: <20210107205321.166698-2-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
References: <20210107205321.166698-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:2ddc:b09e:3e2e:10b3]
X-ClientProxiedBy: BN9PR03CA0064.namprd03.prod.outlook.com
 (2603:10b6:408:fc::9) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:2ddc:b09e:3e2e:10b3)
 by BN9PR03CA0064.namprd03.prod.outlook.com (2603:10b6:408:fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Thu, 7 Jan 2021 20:53:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d1525d0c-13b1-4ca1-1ce6-08d8b34e4faa
X-MS-TrafficTypeDiagnostic: DM6PR12MB3595:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB35951F8B2EA59D4FDEB3488798AF0@DM6PR12MB3595.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMBb0LGk+B4kyvi1AE8zwmBMZ8yHehNFpa+Ws9rxd51W3d9x7RQpY+dOIkkRyTeYGZz+Z1De//mKFOXRJdU09pikyb/i/DPk7FGNtG8/717/36xVrrDBxAi4sILtLP+BZJcROqylIP0kddcdDK9L4wimKHJ1dSA+HRdwbzpTkPiTWjJJTXSTEWMY9NF49ELhJHVuMIQu/rFBbqrVuimlfzojj8yhg8P+/vYxolOiWhYrwzReDzsBhx+WN8PKSe2KHnesY8huzX5ea3Otfyt0FlgIIHo19/zIZsaN7EEBkh2A1HGjTXLZot2zGQySOreQFKglXrlp2oUw4qqblQffRt7dtCbdYjxK9nOqMhxaYeOctZM/HywPVd/uconFKQ8Gyiszt/WG2pFgOhKG5590Wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(2906002)(86362001)(6512007)(6666004)(478600001)(4326008)(8676002)(54906003)(5660300002)(66946007)(2616005)(66556008)(66476007)(1076003)(83380400001)(186003)(6486002)(16526019)(52116002)(8936002)(316002)(6506007)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+vNwnoUK5ddV0sn6ec/TN4xQv/ooRPQmjxXzOHbD7kQYpxSVpOoH4QBN87QC?=
 =?us-ascii?Q?CJ2sens9rldQD/k0RbMNRNtBVJDOeVu8bPByTC1v6yYUnZSlT2qi1yUWEt3b?=
 =?us-ascii?Q?gKld4v54J8YSHlB6DUBx2i80R2jcZw2x4zBZINRJdbAJLepN8oyif51Uyt7a?=
 =?us-ascii?Q?Qn2DY0Ap+Rnufsl5JhYdZLzk83l9gNN6PiVmkPLBEljTBP0m3s+6ZVSUB72a?=
 =?us-ascii?Q?e/ZzZ/PDMaxGdvPVzwReaPoF9sFzdoa72HmJalKAfIHDoJOJkk/p9XYzlwpM?=
 =?us-ascii?Q?zqoD5FmUt7HzKKluxQRYWhVYnR5W3tG3N3dtQIvh4UIEsWu4Xw0I0B3sk0b/?=
 =?us-ascii?Q?rDBU8ciAsd0CehmkXoZJ4Rz5LzVKwAGAo3ggWpteLS6LvGORte15afLF6Mxq?=
 =?us-ascii?Q?GofpCSVBl11KBfgHBnoRu9KOAtIXbxc+AGqPsqAUyGk56Ob9rsjVjlI8aRwX?=
 =?us-ascii?Q?JPzL98/KoB6GqQa8g7HMJnrYQficoju7+k952eNseBbnmYhwNYrEz+nIGeHH?=
 =?us-ascii?Q?YxMnt7JECOHq7HwL04hwERcKWMiaya7QPEAKu4vt7LAYhuHQ9w7GHp6Fm5hL?=
 =?us-ascii?Q?Drl+Xl/U7Bs5xsaoahA7heKM7D1dBVKsa7qE17KMho52LvOym3Dq+kzaGcw3?=
 =?us-ascii?Q?j/pPbJ/2j+r9pGl6Gp3/ANuxnKIVy4a1PxKBb3/iXSyzFMnj46dNPJlQFAPA?=
 =?us-ascii?Q?RgxWGoQn2+U9FoTmSv7Rb4RJhPhkKVkmzRdafMEz3pV3DIBlLyptB6saxvJz?=
 =?us-ascii?Q?agWLyWVe/bcPJZXOqbOCMRRiX67C8CKE7xX6U7bXligWP/9k5CXq29I9dw91?=
 =?us-ascii?Q?VD1eNNJx2GPHOcDhUYAJ9NRKGbFOky+9O1MHCaPy14XtMKRytpnMP6GwFCqg?=
 =?us-ascii?Q?+1zqA4mh8vh7YTODkuP8FyqDrm0GDMwn9eSz/XWhiAP74Te1NtKj1zEFN7GX?=
 =?us-ascii?Q?aC6zt7t9MMIBO530g09GMjjL02E4ZyVd8k7+bmphyfAYhJ5Vmr8t2gzGolmT?=
 =?us-ascii?Q?4/8jto2kwEob5dUEDWBONXIl620/dCUGqomFBG5w1jWWub6GAQ4ufAS56nXR?=
 =?us-ascii?Q?ADUEmVIk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 20:53:39.7355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: d1525d0c-13b1-4ca1-1ce6-08d8b34e4faa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqxzBZxCB3IaqUf5FXqKd8jj5uoOLcSKRCCTG2i+3rHWutPjUDTD0Tr9BcFZpedd0LfbtWSqpf4QUgwYwRLrdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3595
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
Cc: Roman Li <Roman.Li@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Bindu R <Bindu.R@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit b5d8f1d02ba7021cad1bd5ad8460ce5611c479d8.

Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Cc: Roman Li <Roman.Li@amd.com>
Cc: Bindu R <Bindu.R@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     | 4 +++-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 99c7f9eb44aa..a06554745238 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8549,7 +8549,8 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
 			manage_dm_interrupts(adev, acrtc, true);
 		}
-		if (IS_ENABLED(CONFIG_DEBUG_FS) && new_crtc_state->active &&
+#ifdef CONFIG_DEBUG_FS
+		if (new_crtc_state->active &&
 			amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
 			/**
 			 * Frontend may have changed so reapply the CRC capture
@@ -8570,6 +8571,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 				amdgpu_dm_crtc_configure_crc_source(
 					crtc, dm_new_crtc_state, dm_new_crtc_state->crc_src);
 		}
+#endif
 	}
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, j)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index eba2f1d35d07..0235bfb246e5 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -46,13 +46,13 @@ static inline bool amdgpu_dm_is_valid_crc_source(enum amdgpu_dm_pipe_crc_source
 }
 
 /* amdgpu_dm_crc.c */
+#ifdef CONFIG_DEBUG_FS
 bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state);
 bool amdgpu_dm_crc_window_changed(struct dm_crtc_state *dm_new_crtc_state,
 					struct dm_crtc_state *dm_old_crtc_state);
 int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 					struct dm_crtc_state *dm_crtc_state,
 					enum amdgpu_dm_pipe_crc_source source);
-#ifdef CONFIG_DEBUG_FS
 int amdgpu_dm_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name);
 int amdgpu_dm_crtc_verify_crc_source(struct drm_crtc *crtc,
 				     const char *src_name,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
