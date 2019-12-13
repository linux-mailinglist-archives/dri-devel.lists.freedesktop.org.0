Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2AD11EB91
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 370096ECF9;
	Fri, 13 Dec 2019 20:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700078.outbound.protection.outlook.com [40.107.70.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619266ECF9;
 Fri, 13 Dec 2019 20:09:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FLDdBbskqHvUQ0sgIVOjm/ejS+Ei7j0hmcvWD5CHBAdVpM+rQr1amWI56w+4pPxH1ZSBVyyWGWkwU3JVAJoXygnoP8vuut0TeLHXiYaE1zCQbNbTZ5I7qpD9lmVZ2y01ouxEtf7H46hq9EoT1Tu45ZtceM8gTBuLpqqziIL0ZrvvGkbuV7JgYaAzducfCBHLi/I4CueetnAEBX69BHObS3bk1d2wOKEp1XmlbpDHqTiZnCLNkxV7vVP8LveeOT4GCCA3jG8WdAAnq/MN9QQNuhUCtS5wzMPLqcORybUD13dS0YQKMI+57aSu5WVJXJze7tFoVk0SH5pEOam/JFvpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNtdTi730le5vXOcMW32LWiwmhRgZP1Nx53UKMWIccw=;
 b=GCV9pdAF61O2u55IGI+yPX9Iz7Zb+nQFklI3Ia+qdOl81Wk9vuiSPXei+1U9kQCxgjA9v35z2lez2ACYPJaxpp+O2UTzGYFzctN88TXA6NP1gXXP8cKoTLKK8iciCGyh5K+I6r1ry40m9uwrV7WkFhrsVYeqzTzMxQP0eEpil7ro72YLSlhwfdlpNgg89bP8M0dSFY/WvzbInwtqecq4euvv1tqL3jtnxTlxZwRqumLjVTqPOEeAmhiw/VrTc4zDlC3EMjlwfBi18dkdrkOphFa91pJTzpdDUVAwfX9LIFwpOnMrpCFetDxwiyd7jFeWSvbemTSSoMSjZYkpSQkmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNtdTi730le5vXOcMW32LWiwmhRgZP1Nx53UKMWIccw=;
 b=V3T8N6l5GhrZ+8OpXqQkxtGkmglqKhmTvPOmFHrCHSZNIK6RC0hDHCsRv79tUQbeLpXkNZNmDHoXKY7DM3hhvi5TjrZ9h5CM+XllM/lRdZSXBGthImJeAh2Naa20MgpO2Zpp86fGpdD6iuDGcZuW5wxoo54AFbvburbOzs9cb4s=
Received: from SN1PR12CA0069.namprd12.prod.outlook.com (2603:10b6:802:20::40)
 by MWHPR12MB1294.namprd12.prod.outlook.com (2603:10b6:300:10::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.13; Fri, 13 Dec
 2019 20:08:59 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eaa::207) by SN1PR12CA0069.outlook.office365.com
 (2603:10b6:802:20::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:08:59 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:08:59 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:08:58 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:08:58 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 01/18] drm/dp_mst: Add PBN calculation for DSC modes
Date: Fri, 13 Dec 2019 15:08:37 -0500
Message-ID: <20191213200854.31545-2-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(346002)(39860400002)(136003)(428003)(189003)(199004)(8676002)(478600001)(2616005)(1076003)(54906003)(36756003)(450100002)(4326008)(81156014)(336012)(8936002)(86362001)(2906002)(7696005)(186003)(5660300002)(6666004)(81166006)(26005)(426003)(316002)(70206006)(2876002)(70586007)(356004)(6916009)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1294; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5e60196-d25b-4939-1ec0-08d780084a7d
X-MS-TrafficTypeDiagnostic: MWHPR12MB1294:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1294EAC5BDC3EC88FB580CABE4540@MWHPR12MB1294.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nPGcCYySxgOXKUiEn2+R5x97TEoF5+pSr1RjG2gh5wHgzdNi4voghT80L2WSP3sRN/SSGIFcQKn3c8yrM7Flzzlx/9ddDl4M+lBPGWYj7NiOUFOLvzyawceIhi/F5qGvpiLQ/VaYY5gEmcHNoi803lBLwdU5eVAgdN7ImXCYXVOZeMEm28OXG2ZVywtBX/oiBs3G8HB2B/QC21etJBva+6/Xoe3a/r4oxncua3epxOIu34PUi7XDKduTbLG//udPL+fPBLd6oppG6rUhs1U0D2GUowUiFEU9Tc3EG2hLsqQDxLWmHzdOIHTsQS6eEcyTpZ3owrqNrxGZP76MrAorRVQQqGoAQE4wWy9LP0lzqcegNOeYtjOAHBzJ1tBWP8TYeW4QVVeuHg6kcEMZBTZp7Nw6XHlviOqrV+QLvSt4DzoAR6PifYjDrbkL4WgPLLmEyUDzAj0Bu4+6fEJosBw9aAdp7v5irfebVvs7aUDI+A4xsmWfW2n8wK/Ry1da+ef7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:08:59.3181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e60196-d25b-4939-1ec0-08d780084a7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1294
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
Cc: David Francis <David.Francis@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Francis <David.Francis@amd.com>

With DSC, bpp can be fractional in multiples of 1/16.

Change drm_dp_calc_pbn_mode to reflect this, adding a new
parameter bool dsc. When this parameter is true, treat the
bpp parameter as having units not of bits per pixel, but
1/16 of a bit per pixel

v2: Don't add separate function for this
v3: In the equation divide bpp by 16 as it is expected
not to leave any remainder

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c              | 12 +++++++++++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c        |  3 ++-
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c             |  2 +-
 drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c | 10 ++++++----
 include/drm/drm_dp_mst_helper.h                    |  3 +--
 7 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 455c51c38720..9fc03fc1017d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4967,7 +4967,7 @@ static int dm_encoder_helper_atomic_check(struct drm_encoder *encoder,
 								    is_y420);
 		bpp = convert_dc_color_depth_into_bpc(color_depth) * 3;
 		clock = adjusted_mode->clock;
-		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock, bpp);
+		dm_new_connector_state->pbn = drm_dp_calc_pbn_mode(clock, bpp, false);
 	}
 	dm_new_connector_state->vcpi_slots = drm_dp_atomic_find_vcpi_slots(state,
 									   mst_mgr,
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index ae5809a1f19a..363e7e58e7e7 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -4342,10 +4342,11 @@ EXPORT_SYMBOL(drm_dp_check_act_status);
  * drm_dp_calc_pbn_mode() - Calculate the PBN for a mode.
  * @clock: dot clock for the mode
  * @bpp: bpp for the mode.
+ * @dsc: DSC mode. If true, bpp has units of 1/16 of a bit per pixel
  *
  * This uses the formula in the spec to calculate the PBN value for a mode.
  */
-int drm_dp_calc_pbn_mode(int clock, int bpp)
+int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc)
 {
 	/*
 	 * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
@@ -4356,7 +4357,16 @@ int drm_dp_calc_pbn_mode(int clock, int bpp)
 	 * peak_kbps *= (1006/1000)
 	 * peak_kbps *= (64/54)
 	 * peak_kbps *= 8    convert to bytes
+	 *
+	 * If the bpp is in units of 1/16, further divide by 16. Put this
+	 * factor in the numerator rather than the denominator to avoid
+	 * integer overflow
 	 */
+
+	if (dsc)
+		return DIV_ROUND_UP_ULL(mul_u32_u32(clock * (bpp / 16), 64 * 1006),
+					8 * 54 * 1000 * 1000);
+
 	return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006),
 				8 * 54 * 1000 * 1000);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 03d1cba0b696..92be17711287 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -61,7 +61,8 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
 		crtc_state->pipe_bpp = bpp;
 
 		crtc_state->pbn = drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock,
-						       crtc_state->pipe_bpp);
+						       crtc_state->pipe_bpp,
+						       false);
 
 		slots = drm_dp_atomic_find_vcpi_slots(state, &intel_dp->mst_mgr,
 						      port, crtc_state->pbn);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 549486f1d937..1c9e23d5a6fd 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -782,7 +782,7 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
 			const int bpp = connector->display_info.bpc * 3;
 			const int clock = crtc_state->adjusted_mode.clock;
 
-			asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, bpp);
+			asyh->dp.pbn = drm_dp_calc_pbn_mode(clock, bpp, false);
 		}
 
 		slots = drm_dp_atomic_find_vcpi_slots(state, &mstm->mgr,
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index ee28f5b3785e..28eef9282874 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -518,7 +518,7 @@ static bool radeon_mst_mode_fixup(struct drm_encoder *encoder,
 
 	mst_enc = radeon_encoder->enc_priv;
 
-	mst_enc->pbn = drm_dp_calc_pbn_mode(adjusted_mode->clock, bpp);
+	mst_enc->pbn = drm_dp_calc_pbn_mode(adjusted_mode->clock, bpp, false);
 
 	mst_enc->primary->active_device = mst_enc->primary->devices & mst_enc->connector->devices;
 	DRM_DEBUG_KMS("setting active device to %08x from %08x %08x for encoder %d\n",
diff --git a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
index af2b2de65316..73fc1c485283 100644
--- a/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_dp_mst_helper.c
@@ -18,15 +18,17 @@ int igt_dp_mst_calc_pbn_mode(void *ignored)
 		int rate;
 		int bpp;
 		int expected;
+		bool dsc;
 	} test_params[] = {
-		{ 154000, 30, 689 },
-		{ 234000, 30, 1047 },
-		{ 297000, 24, 1063 },
+		{ 154000, 30, 689, false },
+		{ 234000, 30, 1047, false },
+		{ 297000, 24, 1063, false },
 	};
 
 	for (i = 0; i < ARRAY_SIZE(test_params); i++) {
 		pbn = drm_dp_calc_pbn_mode(test_params[i].rate,
-					   test_params[i].bpp);
+					   test_params[i].bpp,
+					   test_params[i].dsc);
 		FAIL(pbn != test_params[i].expected,
 		     "Expected PBN %d for clock %d bpp %d, got %d\n",
 		     test_params[i].expected, test_params[i].rate,
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index d5fc90b30487..68656913cfe5 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -719,8 +719,7 @@ bool drm_dp_mst_port_has_audio(struct drm_dp_mst_topology_mgr *mgr,
 struct edid *drm_dp_mst_get_edid(struct drm_connector *connector, struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
 
 
-int drm_dp_calc_pbn_mode(int clock, int bpp);
-
+int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);
 
 bool drm_dp_mst_allocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 			      struct drm_dp_mst_port *port, int pbn, int slots);
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
