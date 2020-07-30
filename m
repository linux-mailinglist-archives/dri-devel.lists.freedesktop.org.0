Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BFB2339CD
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 22:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B1266E96F;
	Thu, 30 Jul 2020 20:37:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700083.outbound.protection.outlook.com [40.107.70.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DE56E961;
 Thu, 30 Jul 2020 20:37:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQblMz0T2Qlwa6xA0y5XMt5X0Yn1CLS+vkJs128FZ4KDhYLBEyKLyO70lN0se5jLiC6sAhyvZyss21nSNeDNLVExo08K7cHJXj0tQgbIslvk0VCIrvqc6rKsURb6ozR3gJhltXIiBkgvKyA+68QazwGtD5/ZB6Uuqcxhd7F3tfu0xW9ukyzU5U3fc562FApygdfvFYzJlQewPxftmr5196KSrTgv6VuuObsQmp8YYPk7OKaM1XTeZrMqIz59NL4ser4kMvtHnzVJsj6FLYFaDc352t3Bf5wA1h3CBNBwRH1EAbJ9vO223MoIN8Df5pXxr84EUb/kwmy9/D2arHv2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyjIxa2wCpDw1DlylEWf9b+yyJmLgxVVlQpZqDHridw=;
 b=Mm7kAkLk0b2MQo2Vp2WLHfkvDe60TisJ/w5xl893HnE41aC4GidNDIe/u4Qzncle4++8uscoh1gLxwv8hSD/aH+esUiCMCHc+TUb3dadAtYvWAvo6eCU2oyAFYKnN5ld5sZ0iQ0ZOIdw+UkdGjEiUubM0AiyxJ1bwwXbWXvd8NpNxJKZXwcuU8Abuzqiw2XJUTLFW3qwQvSHekpsZVvhy0FJ0ip37H4RQROJi6U7CWd11mA/IKUmm1RMsd2FbL+9GakWt/pDwJ6HsYmRVEeN2i8EXOAQITVtKW+kZ13WB+EPIxlgtX8AxANJ3Sqzv2FNt1zseBxLNIV4ivnxXMtJ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FyjIxa2wCpDw1DlylEWf9b+yyJmLgxVVlQpZqDHridw=;
 b=pV4a26GuJmmT5vdUizQdQFsGAjGk4CouGVjf367PTBDQaVlKeJ9nIFCd3GT6RgwJ5uazosn0lINAAI51/VWlDOi3/GbfGCjL7CjXx8nXRXr0hBj2bosNEIt5gZITGpUA5W2wTAdhH+i6zRJuqRxWclkOOvY6gAMaguTVO2Wn9Fs=
Received: from MWHPR19CA0094.namprd19.prod.outlook.com (2603:10b6:320:1f::32)
 by MN2PR12MB4341.namprd12.prod.outlook.com (2603:10b6:208:262::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Thu, 30 Jul
 2020 20:37:34 +0000
Received: from CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:320:1f:cafe::9e) by MWHPR19CA0094.outlook.office365.com
 (2603:10b6:320:1f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Thu, 30 Jul 2020 20:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 CO1NAM11FT025.mail.protection.outlook.com (10.13.175.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3239.17 via Frontend Transport; Thu, 30 Jul 2020 20:37:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:30 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Thu, 30 Jul
 2020 15:37:30 -0500
Received: from DESKTOP-3JO4JG6.localdomain (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Thu, 30 Jul 2020 15:37:29 -0500
From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/7] drm/amd/display: Avoid using unvalidated tiling_flags and
 tmz_surface in prepare_planes
Date: Thu, 30 Jul 2020 16:36:38 -0400
Message-ID: <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 423c343e-8944-4f4c-a841-08d834c86388
X-MS-TrafficTypeDiagnostic: MN2PR12MB4341:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4341F88642EDAF0C1D504EACEC710@MN2PR12MB4341.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dbk8yN1KvCbjJ+LAR+2o+UWsYUl34txisVtQFXc8vmdH7dSrqFpg3ScSpkqVhquYy4R0gijIFICPm3d5XQXgfYWpu8Gdd1vc0fThtLpAOCzjF9cvKL5j9X9SgbTWuuWfhe/fTokp1eBQ86y/G675rmdzQ0xVvXeyL+RPD4SQn0ZVFlSdtKHvptlX4FXhezRyZrIGAAgsG2f9h64eZfppXzgUEmbSV3gvlzA3F5qytkg3ZsxeQAoFaqQEObXSLOG7ITMgq6fwGrYf8vgRWioyV0N/hjVRxZNI1U+Cud4FVay+1RNet5TpewNj3xavWSxYou/RtWjSpyf1P5rYr917xDHWoHIiiWfZMDsStfTaQ/B58/VSDf4AuRrkDOxA1XuURbAHN3dfFDkxm4sQDV74Sw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(39860400002)(396003)(346002)(46966005)(1076003)(186003)(44832011)(316002)(70586007)(81166007)(70206006)(356005)(47076004)(36756003)(82740400003)(5660300002)(8676002)(86362001)(336012)(4326008)(6666004)(54906003)(426003)(26005)(110136005)(83380400001)(450100002)(2906002)(2616005)(82310400002)(478600001)(8936002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2020 20:37:33.9320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 423c343e-8944-4f4c-a841-08d834c86388
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4341
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
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Why]
We're racing with userspace as the flags could potentially change
from when we acquired and validated them in commit_check.

[How]
We unfortunately can't drop this function in its entirety from
prepare_planes since we don't know the afb->address at commit_check
time yet.

So instead of querying new tiling_flags and tmz_surface use the ones
from the plane_state directly.

While we're at it, also update the force_disable_dcc option based
on the state from atomic check.

Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 ++++++++++---------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bf1881bd492c..f78c09c9585e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5794,14 +5794,8 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 	struct list_head list;
 	struct ttm_validate_buffer tv;
 	struct ww_acquire_ctx ticket;
-	uint64_t tiling_flags;
 	uint32_t domain;
 	int r;
-	bool tmz_surface = false;
-	bool force_disable_dcc = false;
-
-	dm_plane_state_old = to_dm_plane_state(plane->state);
-	dm_plane_state_new = to_dm_plane_state(new_state);
 
 	if (!new_state->fb) {
 		DRM_DEBUG_DRIVER("No FB bound\n");
@@ -5845,27 +5839,35 @@ static int dm_plane_helper_prepare_fb(struct drm_plane *plane,
 		return r;
 	}
 
-	amdgpu_bo_get_tiling_flags(rbo, &tiling_flags);
-
-	tmz_surface = amdgpu_bo_encrypted(rbo);
-
 	ttm_eu_backoff_reservation(&ticket, &list);
 
 	afb->address = amdgpu_bo_gpu_offset(rbo);
 
 	amdgpu_bo_ref(rbo);
 
+	/**
+	 * We don't do surface updates on planes that have been newly created,
+	 * but we also don't have the afb->address during atomic check.
+	 *
+	 * Fill in buffer attributes depending on the address here, but only on
+	 * newly created planes since they're not being used by DC yet and this
+	 * won't modify global state.
+	 */
+	dm_plane_state_old = to_dm_plane_state(plane->state);
+	dm_plane_state_new = to_dm_plane_state(new_state);
+
 	if (dm_plane_state_new->dc_state &&
-			dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
-		struct dc_plane_state *plane_state = dm_plane_state_new->dc_state;
+	    dm_plane_state_old->dc_state != dm_plane_state_new->dc_state) {
+		struct dc_plane_state *plane_state =
+			dm_plane_state_new->dc_state;
+		bool force_disable_dcc = !plane_state->dcc.enable;
 
-		force_disable_dcc = adev->asic_type == CHIP_RAVEN && adev->in_suspend;
 		fill_plane_buffer_attributes(
 			adev, afb, plane_state->format, plane_state->rotation,
-			tiling_flags, &plane_state->tiling_info,
-			&plane_state->plane_size, &plane_state->dcc,
-			&plane_state->address, tmz_surface,
-			force_disable_dcc);
+			dm_plane_state_new->tiling_flags,
+			&plane_state->tiling_info, &plane_state->plane_size,
+			&plane_state->dcc, &plane_state->address,
+			dm_plane_state_new->tmz_surface, force_disable_dcc);
 	}
 
 	return 0;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
