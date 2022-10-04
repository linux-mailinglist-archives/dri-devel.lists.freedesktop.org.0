Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8A95F4AC3
	for <lists+dri-devel@lfdr.de>; Tue,  4 Oct 2022 23:15:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D9310E175;
	Tue,  4 Oct 2022 21:15:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BD910E175;
 Tue,  4 Oct 2022 21:15:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUL8lDJBLxWV4HU799Eb6FR462ivh5vZSK7SrAPo8WLLylojSJbCcmYR3P120048SVsxiOkqf2pytY5i6zu9OVCzYnoHw+d8kXnkQUvZEJC9XtoLcdk5oDwG3kz5ppsQcZsNynexbX9TF3svWcly+f1zf0wD7vluB7UGu9QAk0myvDZifdeyqGmkuOBOZdtTNhPqeV1/v5domET2NGGpdqIzmsugOhDkwrVztrTpT/xCtgYxNnVOtJ7sKxDkMigH/BmqG0ZrgIjuX5p0iLINZJSp+uwSrsMLDbpX1AV3z2YCKrjSDxfKXrJOiOPg5dOW+CQ98/klTeOh6RKt9ewhgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FV858alN1mcjh+MzxWw1Af0T0pExKwQlZvu/eoWwt5E=;
 b=AGP48r1R4ioBjJmlz+CO7blXjNKIkD7hSkQ0cvUje2Pf8TBxz4JhoiMqRsfjoiMxZ2hRxpfT+rfn8cBZoTkVG4PbptFB9OpqDx/Yqe+WQlem6GIgAU5QRwbjzzS/gYrqoRjqKDC5DjM3NWyNt4qVjCIg/tKoIQk09frx6BHgARjleWnNmknnzKxYph9O6wpHQFqlKlofJxZbIaM24EMnL8lm9/nborxr6cJ/OG4bMjeivz5/E7zvfgyfX5HwiIeqMah8yGLosIEMPhZcc/hkWp9XM/nLjcXpfBC0wwra/8B6owepo1lEHADYe0D7ga1ifiIrhc7DPa0EfYlekarThg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FV858alN1mcjh+MzxWw1Af0T0pExKwQlZvu/eoWwt5E=;
 b=ljk3v3yCgdbG3CYe/6P9kqauEfpe5VxFV2M3Swk2tcF0CcVq2yVVSSCosfBqLhPw6cjXb4bDFJcniBG3b1ndr5hVusk/KP8SHGPvqgsm4caoiY7mzSgK1bIC12qhLJLWgcpJxsWqyYI9TXE+f0pGsLfS2c3HDkzAlyGp/LE2kdA=
Received: from BN9PR03CA0537.namprd03.prod.outlook.com (2603:10b6:408:131::32)
 by LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 4 Oct
 2022 21:15:35 +0000
Received: from BN8NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:131:cafe::b5) by BN9PR03CA0537.outlook.office365.com
 (2603:10b6:408:131::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23 via Frontend
 Transport; Tue, 4 Oct 2022 21:15:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT099.mail.protection.outlook.com (10.13.177.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5709.10 via Frontend Transport; Tue, 4 Oct 2022 21:15:35 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 4 Oct
 2022 16:15:26 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC PATCH 2/5] drm: Add Plane 3DLUT and 3DLUT mode properties
Date: Tue, 4 Oct 2022 15:14:48 -0600
Message-ID: <20221004211451.1475215-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221004211451.1475215-1-alex.hung@amd.com>
References: <20221004211451.1475215-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT099:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: aa37bec4-da73-4537-2123-08daa64d93f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K7e0NXhsh/ZCP4t4/zE8vE2zQgePMlHo77gBnmnsVAO5q4qib+677woHVBBYqirAxDoBMA1uOAkT5/1IWBV9ZwVhttrZqPdtM5tstbd9MRgWgD9yyKMY4SJ8XLVt9BH7ISbreve2VepcQwUpUCR3ZFsRXBvV79aKXv7qt/1TbDADyvXgFXa+Rn8wV1r091mKmQarALNdIBsgd3Sw6V6QBu4BmddI37JAYz41EqgYeq8AHdL+GoEEfcx9cEjwT/k/wymkxHqOGkA3WNqf7TsIHgV/avnmtSSCXm+aVodZ1WgUdA+i9rbIW6bYxRdCUBJeD9fHbX+RREOOlCLJ0+YSGgauvUzmfaAgHpwgqdN8z0B3d1IdNqXGa/KsnDaFp9OewAPsjC/0Rxzg06AfdTaAm1HSzoNK/KGC8ixdpItk4pU9JX1M6045O2h4WFPEalaKzvOehVtqpM1j8pSHsC97/TQwmdQNAc5DR5jaR3aIrjWOhwt1XCRb+H7u1IlvgPU+DzDPjXRCRWLrlAgZIEGNInAdbGwN4V2XHdx7sWnxJJJk1RT+tO+JxDkNB5s7LVJh65WkWuJjnf5cvrpLqe+p4Qk7UhvpBJHo/qPqB8cV234UvHcRrBZTr7+QOFwff/tKoUHd7xGojEI02mQnBq+iEiv8m8AVpFdSCf1xSg1M8dNHJiJm98QjGS/r7FexHCRwSoEtA7daHNQQrXylKTn/KcehTlHCgzEGN5XoVS7D6atyIlob5M5vgp8hiPwH58zv3cCEWXxKDne/1idCuSyGexU5326RXWOD3bJt9VZy51Gfn5eGsvydCopckW4kCm1A
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(82740400003)(16526019)(70586007)(40460700003)(81166007)(8676002)(2616005)(356005)(70206006)(186003)(426003)(40480700001)(478600001)(6666004)(336012)(1076003)(47076005)(36756003)(7696005)(36860700001)(316002)(4326008)(54906003)(26005)(86362001)(110136005)(82310400005)(83380400001)(2906002)(44832011)(41300700001)(5660300002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 21:15:35.0392 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa37bec4-da73-4537-2123-08daa64d93f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728
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
Cc: mwen@igalia.com, bhawanpreet.lakha@amd.com, Alex Hung <alex.hung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add plane lut_3d mode and lut_3d as blob properties.

lut_3d mode is an enum property with values as blob_ids.
Userspace can get supported modes and also set one of the modes.

Note: A patchset "IGT tests for pre-blending 3D LUT interfaces" for this
proposal is sent to IGT mailing list.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 ++
 drivers/gpu/drm/drm_atomic_state_helper.c     |  3 ++
 drivers/gpu/drm/drm_atomic_uapi.c             | 11 ++++++
 drivers/gpu/drm/drm_color_mgmt.c              | 37 +++++++++++++++++++
 include/drm/drm_mode_object.h                 |  2 +-
 include/drm/drm_plane.h                       | 31 ++++++++++++++++
 6 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f546c1326db3..ee277f357140 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -8006,6 +8006,10 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	drm_plane_attach_gamma_properties(plane);
 	drm_plane_attach_ctm_property(plane);
 
+	/* TODO need to check ASICs */
+	drm_plane_create_3d_lut_properties(plane->dev, plane, 1);
+	drm_plane_attach_3dlut_properties(plane);
+
 	/* Create (reset) the plane state */
 	if (plane->funcs->reset)
 		plane->funcs->reset(plane);
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 7ddf6e4b956b..85900cd1bffe 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -318,6 +318,8 @@ void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 		drm_property_blob_get(state->ctm);
 	if (state->gamma_lut)
 		drm_property_blob_get(state->gamma_lut);
+	if (state->lut_3d)
+		drm_property_blob_get(state->lut_3d);
 
 	state->color_mgmt_changed = false;
 }
@@ -369,6 +371,7 @@ void __drm_atomic_helper_plane_destroy_state(struct drm_plane_state *state)
 	drm_property_blob_put(state->degamma_lut);
 	drm_property_blob_put(state->ctm);
 	drm_property_blob_put(state->gamma_lut);
+	drm_property_blob_put(state->lut_3d);
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_destroy_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ba3e64cb184a..66e59e7c194d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -622,6 +622,13 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 					&replaced);
 		state->color_mgmt_changed |= replaced;
 		return ret;
+	} else if (property == plane->lut_3d_property) {
+		ret = drm_atomic_replace_property_blob_from_id(dev,
+					&state->lut_3d, val, -1, 8, &replaced);
+		state->color_mgmt_changed |= replaced;
+		return 0;
+	} else if (property == plane->lut_3d_mode_property) {
+		state->lut_3d_mode = val;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -700,6 +707,10 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 	} else if (property == plane->gamma_lut_property) {
 		*val = (state->gamma_lut) ?
 			state->gamma_lut->base.id : 0;
+	} else if (property == plane->lut_3d_property) {
+		*val = (state->lut_3d) ? state->lut_3d->base.id : 0;
+	} else if (property == plane->lut_3d_mode_property) {
+		*val = state->lut_3d_mode;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index b5b3ff7f654d..4bfe5b5c9670 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -706,6 +706,43 @@ void drm_plane_attach_gamma_properties(struct drm_plane *plane)
 }
 EXPORT_SYMBOL(drm_plane_attach_gamma_properties);
 
+int drm_plane_create_3d_lut_properties(struct drm_device *dev,
+					   struct drm_plane *plane,
+					   int num_values)
+{
+	struct drm_property *mode;
+	struct drm_property *blob;
+
+	mode = drm_property_create(dev, DRM_MODE_PROP_ENUM, "PLANE_3D_LUT_MODE", num_values);
+	if (!mode)
+		return -ENOMEM;
+
+	plane->lut_3d_mode_property = mode;
+
+	blob = drm_property_create(dev, DRM_MODE_PROP_BLOB, "PLANE_3D_LUT", 0);
+	if (!blob)
+		return -ENOMEM;
+
+	plane->lut_3d_property = blob;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_create_3d_lut_properties);
+
+void drm_plane_attach_3dlut_properties(struct drm_plane *plane)
+{
+	if (!plane->lut_3d_property)
+		return;
+
+	drm_object_attach_property(&plane->base, plane->lut_3d_property, 0);
+
+	if (!plane->lut_3d_mode_property)
+		return;
+
+	drm_object_attach_property(&plane->base, plane->lut_3d_mode_property, 0);
+}
+EXPORT_SYMBOL(drm_plane_attach_3dlut_properties);
+
 int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 						 const char *name,
 						 const struct drm_color_lut_range *ranges,
diff --git a/include/drm/drm_mode_object.h b/include/drm/drm_mode_object.h
index d4128c7daa08..c2b31dbf7325 100644
--- a/include/drm/drm_mode_object.h
+++ b/include/drm/drm_mode_object.h
@@ -60,7 +60,7 @@ struct drm_mode_object {
 	void (*free_cb)(struct kref *kref);
 };
 
-#define DRM_OBJECT_MAX_PROPERTY 26
+#define DRM_OBJECT_MAX_PROPERTY 28
 /**
  * struct drm_object_properties - property tracking for &drm_mode_object
  */
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 8989bb1aa46c..4e272144170f 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -275,6 +275,21 @@ struct drm_plane_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @lut_3d_mode:
+	 * This is a blob_id and exposes the platform capabilities wrt
+	 * various 3dlut. This also helps user select a 3dlut mode amongst
+	 * the supported ones.
+	 */
+	u32 lut_3d_mode;
+
+	/**
+	 * @lut_3d:
+	 * 3D lookup table blob. The blob data is laid out as defined by the
+	 * FOURCC value in color_format in the drm_mode_3dlut_mode struct.
+	 */
+	struct drm_property_blob *lut_3d;
+
 	u8 color_mgmt_changed : 1;
 };
 
@@ -818,6 +833,18 @@ struct drm_plane {
 	 * used to convert the framebuffer's colors to non-linear gamma.
 	 */
 	struct drm_property *gamma_lut_property;
+
+	/**
+	 * @lut_3d_mode_property: Optional Plane property to set the 3DLUT mode
+	 * used to convert the framebuffer's colors to non-linear gamma.
+	 */
+	struct drm_property *lut_3d_mode_property;
+
+	/**
+	 * @lut_3d_property: Optional Plane property to set the 3DLUT
+	 * used to convert the framebuffer's colors to non-linear gamma.
+	 */
+	struct drm_property *lut_3d_property;
 };
 
 #define obj_to_plane(x) container_of(x, struct drm_plane, base)
@@ -915,6 +942,10 @@ int drm_plane_create_color_mgmt_properties(struct drm_device *dev,
 void drm_plane_attach_degamma_properties(struct drm_plane *plane);
 void drm_plane_attach_ctm_property(struct drm_plane *plane);
 void drm_plane_attach_gamma_properties(struct drm_plane *plane);
+int drm_plane_create_3d_lut_properties(struct drm_device *dev,
+					   struct drm_plane *plane,
+					   int num_values);
+void drm_plane_attach_3dlut_properties(struct drm_plane *plane);
 int drm_plane_color_add_gamma_degamma_mode_range(struct drm_plane *plane,
 						 const char *name,
 						 const struct drm_color_lut_range *ranges,
-- 
2.37.3

