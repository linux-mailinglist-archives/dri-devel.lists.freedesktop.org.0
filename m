Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04A13DBFF6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 22:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A2006E3DB;
	Fri, 30 Jul 2021 20:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A21B6F495;
 Fri, 30 Jul 2021 20:41:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YShuV2WuOgPVoZWTccEbnaUKNgVyZTTEXSB6m5AWPPMNS74rMAdja1utpvkf1h1Y9ZjE0+PnNBb7xucytBq9zRNRph+xmKLgI77Trs2bHumKesxbxvfRpcVmyU8phNEIMIXHzP6QE6JfgM9o43XYawZdxqppIb5QoLOVssW7EJYLkJzHs7J5nPjxcQ/EuhUK6bw1ko2gQv19X2DwOPwgo5fdsEiZLjEqr3IEmYTVgJQGgw8+uIFTWlTEKn9gOYJj3YHCzVF/YQoYVrpvTsWlOKuCRnFd+3mnHc4ya8T0W8f8TJvul08yG0ENg/Z4t5CLifT8FhfDo3GPOpJHTQkHxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZZO68mxu6lEwxjNG09IkAjIEd0GhmFzRsLi5ycuChU=;
 b=ZLUReyTVxiI4csO8GunUpkT3AM9g91IwNFZIGe5FYmYiPWtBkfJ734d1wAQDaq+Om4jfFPtErCLk3oLcWP57kg2JVRzDXy+o6LCzdEijJQn2jLiexj3tvkTB2s1qby/wSDWrwEA6tSWeMhm78RejnzCAfgbh0hERIkSn6SvCRVq1Ok7KJ5sqS1S0h9W/D6f6si3RTJHoEwY84vKKQHqvXGrFTTu+C3HXvBAjEoJYC4YxKXfoi56O+wZ9bO2H9hH5ojrJNfLijjJCMnPMKY8o2IJ65+DhN02kt/WAZmkDhQ5qHrx1A9CFJWXXo8xRUCQXJVFnzSBUlOfKYyQb2VZgVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ZZO68mxu6lEwxjNG09IkAjIEd0GhmFzRsLi5ycuChU=;
 b=EOZxuVxZM7vclwDm3ezZwtnbmxoRqVpYc7i597svaIXdbxadffRKB7Kzo2exyTEao1Pty0ABVB+rIGmXLa6jtmFGz25ar10u1GceyQi9mc28YRYPEfcE5z9WIb4sDGnytMGE8zBGXdpQm5xKKvL1uxuKlLUBCzZ5ew/LlP8S2NU=
Received: from DM5PR15CA0065.namprd15.prod.outlook.com (2603:10b6:3:ae::27) by
 BY5PR12MB4999.namprd12.prod.outlook.com (2603:10b6:a03:1da::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Fri, 30 Jul
 2021 20:41:48 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:ae:cafe::63) by DM5PR15CA0065.outlook.office365.com
 (2603:10b6:3:ae::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Fri, 30 Jul 2021 20:41:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Fri, 30 Jul 2021 20:41:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 30 Jul
 2021 15:41:42 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 30 Jul 2021 15:41:41 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>,
 <jshargo@google.com>, <Shashank.Sharma@amd.com>
CC: <Deepak.Sharma@amd.com>, <Shirish.S@amd.com>, <Vitaly.Prosyak@amd.com>,
 <aric.cyr@amd.com>, <Bhawanpreet.Lakha@amd.com>, <Krunoslav.Kovac@amd.com>,
 <hersenxs.wu@amd.com>, <Nicholas.Kazlauskas@amd.com>,
 <laurentiu.palcu@oss.nxp.com>, <ville.syrjala@linux.intel.com>, "Harry
 Wentland" <harry.wentland@amd.com>
Subject: [RFC PATCH v3 4/6] drm/color: Add sdr boost property
Date: Fri, 30 Jul 2021 16:41:32 -0400
Message-ID: <20210730204134.21769-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210730204134.21769-1-harry.wentland@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a0f21661-8a38-4f96-bdda-08d9539a73df
X-MS-TrafficTypeDiagnostic: BY5PR12MB4999:
X-Microsoft-Antispam-PRVS: <BY5PR12MB4999CC09AAE35F1064B35D678CEC9@BY5PR12MB4999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OJsNZp+e7L0CRpmbukSWl/+cD8A/LudpgJZPbG+YIHCdmscsQU0RHuXcoEneoQtrtkBl29ldQknV00c5qHav2+M17vGu1HVqmN5Ll7Nwalgq/GeY1QZVPeyuOC4z0d23MdU6ndVK/AxWbxFRp7srY4LpaV5NMb2u9HbSJiQ1W2DRfwapR9bTGbVGQgXoa6ob7Cf0GHnr8aAtwszxOyA9WqX+vqnLer/Zbh2KoM08VutoYAv9k5b1C2g9NjQZiSZECvdtG3D5Lch+SKcZYTN8oOznFVLr9XnbKf0+y8+AiLaeqTnSdtcAGV4sS8ra/8LKgZxosPNwD3DUWs9tr4TfWYQ+V2ir7YoV4Ho83VONbsaeQFSlMoLfuFG9KBG4kYBTH+C4JmLs4nqHTvA95/2Cjad2nu0WMJJA/BYBjYbEG4TtFel8iWCXkBKpe+5yBB1bo4a6x/TGrbaMhS7X962QrQt9USU++cPqVI2QrbTE70iSVMQXHah0wlfo1Nn9IANstNmqjXJdQgtoY7i2khRiRMKa8jf0y7K8O9YaPGSPnkUf+2OSLjgxC+lA8GZQzSIe9KSpAGu5dQ8SToPp155XrWqQfBoH3zit9zC/eLHfmvownsGsg5YiWJGdMfLJmJMOcOMETmnWPEetnG+Fevk8a+mKtfyFn03fCc+6sEuQDz1lYNLQ5vy37pjs/vHsktlwqNK0FknCtS0DOJHJc1Hgb4p7+w4aaoEcEOmwlTSUtoI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(346002)(136003)(376002)(46966006)(36840700001)(2906002)(83380400001)(26005)(1076003)(4326008)(54906003)(2616005)(336012)(8936002)(86362001)(44832011)(426003)(81166007)(7696005)(478600001)(82740400003)(5660300002)(186003)(316002)(6666004)(356005)(70586007)(36756003)(8676002)(70206006)(6636002)(110136005)(82310400003)(47076005)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2021 20:41:48.2808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f21661-8a38-4f96-bdda-08d9539a73df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4999
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

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

SDR is typically mastered at 200 nits and HDR is mastered at up to 10,000
nits. Due to this luminance range difference if we blend a SDR and
HDR plane together, we can run into problems where the HDR plane is too
bright or the SDR plane is too dim

A common solution to this problem is to boost the SDR plane so that its
not too dim.

This patch introduces a "sdr_white_level" property, this property can be
used by the userspace to boost the SDR content luminance. The boost
value is an explicit luminance value in nits. This allows the userspace
to set the maximum white level for the SDR plane.

v2:
 - fix type in description

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_color_mgmt.c  | 17 +++++++++++++++++
 include/drm/drm_color_mgmt.h      |  6 ++++++
 include/drm/drm_plane.h           | 15 ++++++++++++++-
 4 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 9582515dd12e..e5a193657f7d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -598,6 +598,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->color_range = val;
 	} else if (property == plane->transfer_function_property) {
 		state->transfer_function = val;
+	} else if (property == plane->sdr_white_level_property) {
+		state->sdr_white_level = val;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -666,6 +668,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_range;
 	} else if (property == plane->transfer_function_property) {
 		*val = state->transfer_function;
+	} else if (property == plane->sdr_white_level_property) {
+		*val = state->sdr_white_level;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 196544951ab7..44842ba0454d 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -556,6 +556,23 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 	return color_range_name[range];
 }
 
+int drm_plane_create_sdr_white_level_property(struct drm_plane *plane){
+
+	struct drm_property *prop;
+
+	prop = drm_property_create_range(plane->dev, 0, "SDR_WHITE_LEVEL", 0, UINT_MAX);
+
+	if (!prop)
+		return -ENOMEM;
+
+	plane->sdr_white_level_property = prop;
+	drm_object_attach_property(&plane->base, prop, DRM_DEFAULT_SDR_WHITE_LEVEL);
+
+	if (plane->state)
+		plane->state->sdr_white_level = DRM_DEFAULT_SDR_WHITE_LEVEL;
+
+	return 0;
+}
 /**
  * drm_get_transfer_function - return a string for transfer function
  * @tf: transfer function to compute name of
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 408561acdb3d..2a356a9601df 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -26,6 +26,12 @@
 #include <linux/ctype.h>
 #include <drm/drm_property.h>
 
+/**
+ * Default SDR white level in nits. Although there is no standard SDR nit level, 200
+ * is chosen as the default since that is the generally accepted value.
+ */
+#define DRM_DEFAULT_SDR_WHITE_LEVEL 200
+
 struct drm_crtc;
 struct drm_plane;
 
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index cff56994513f..93ee308a46af 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -187,6 +187,11 @@ struct drm_plane_state {
 	 * format for a proper HDR color/luminance output.
 	 */
 	enum drm_transfer_function transfer_function;
+	/**
+	 * @sdr_white_level:
+	 * SDR white level boost for HDR+SDR multi plane usecases. max white level in nits
+	 */
+	unsigned int sdr_white_level;
 	/**
 	 * @fb_damage_clips:
 	 *
@@ -757,7 +762,15 @@ struct drm_plane {
 	 * See drm_plane_create_color_properties().
 	 */
 	struct drm_property *transfer_function_property;
-
+	/**
+	 * @sdr_white_level:
+	 *
+	 * Optional sdr_white_level. When HDR and SDR are combined in multi plane
+	 * overlay cases, the sdr plane will be very dim. This property allows
+	 * the driver to boost the sdr plane's white level. The value should be
+	 * max white level in nits.
+	 */
+	struct drm_property *sdr_white_level_property;
 	/**
 	 * @scaling_filter_property: property to apply a particular filter while
 	 * scaling.
-- 
2.32.0

