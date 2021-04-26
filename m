Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A399E36B833
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 19:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8E66E865;
	Mon, 26 Apr 2021 17:39:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B196E862;
 Mon, 26 Apr 2021 17:39:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g56Fb0C0fmq4H8iiyoZk4kjf/G2SxBMhjfT2HbCFoIVK1ApWiKhxydDqP3Fi/U+boweL8zfTI3+HprY27aPIZjfFTkbjQ+vXeDATmNfMCzdrPbsGqlPzhowyQjoiD+tAMst0Z7EyanT5CnS9OoetYR6x0twmOj6SG7FmYUF4mqldPm4AVDh1fHhqO02jX7LAQAG1quuJbjpCV3CaLzSrZ9q2FjxPWaHGW24jhlMtontC0tyFcWA923R3o+H4tDJrrfLNthdot1jCJtIX4GoeH8/mfUJi5Pv06SvW7WzH1l6qjrsBRAgQ/wQj7UOwwEGxMrl6TEaRwDHobpkooQWoWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikquFlJnuLC76swOpZRg3Ntc3i4IR3jV36mJ0MxA0+Y=;
 b=V49Gq+hOtJHQOuYife1Ul9BEwKZuxHkcKcAtiGqn/AKuTi6UE9uho75FDMwfz+BIfxF0Jzsn/QrxXkUdoBizdQomaOoq3R60dOU5wt7wVl72FyJUOrTvWVidHXtXJYMi3m2jeVzbp/w1tR1caw/Pwsq6ebyOnUIhVSsyu4hdWiQQc9UwvXdJlMRk6wHnepxfikijF7szyQiC5S8vGZykYvhFt3RNmVz0wRxKsLXdgGg3BQwR5oSafCAiLKq264Ex1mxANz7VT3Rd9cZhCTZXvBumcsm6W31nGdeKIro0k8+wEnV/lda3wvvPTUmQdw5KMs7gU2EPkcLh97JC8d9VOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ikquFlJnuLC76swOpZRg3Ntc3i4IR3jV36mJ0MxA0+Y=;
 b=aPlIKPKpJWoUiIensPTbDVwMLaHCViaktv6pCA6n1ibrbbvhCm51xdzDaEQvSEtGo2nXVLifvELx36FaLEdOo1+m3qLW2TGvdJnB/c94n3NWzZpBHQEg5XfpU0IaluI5fz6e7li2GSYNi5rQJdPFeq2zK4pyHdnRiAn8FSRyMXs=
Received: from BN9PR03CA0126.namprd03.prod.outlook.com (2603:10b6:408:fe::11)
 by DM6PR12MB3129.namprd12.prod.outlook.com (2603:10b6:5:3b::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Mon, 26 Apr
 2021 17:39:02 +0000
Received: from BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::ac) by BN9PR03CA0126.outlook.office365.com
 (2603:10b6:408:fe::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Mon, 26 Apr 2021 17:39:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT066.mail.protection.outlook.com (10.13.177.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Mon, 26 Apr 2021 17:39:02 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Apr
 2021 12:39:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Apr
 2021 12:39:01 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Apr 2021 12:39:00 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>
Subject: [RFC PATCH 3/3] drm/color: Add sdr boost property
Date: Mon, 26 Apr 2021 13:38:52 -0400
Message-ID: <20210426173852.484368-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210426173852.484368-1-harry.wentland@amd.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6287b01-348f-4e4b-df61-08d908da2e45
X-MS-TrafficTypeDiagnostic: DM6PR12MB3129:
X-Microsoft-Antispam-PRVS: <DM6PR12MB31291C028FEC9C39002768BE8C429@DM6PR12MB3129.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: upbMYWGrG9FMeemRBCI+OUcGIHkvtUJueyO/IZvq5UrWlIbXezX7O+82roVBYCkP2JHkOdTCtji9goYL79h3KdQNmWTJFqo6vLYIDZ7MiSIs7bzxG5363km4VJIpUZ34YgiJrpVWK9xsMPEf98oFz/pM9ffYYVQw6apFGV+j+CsZwP2mGTzgi/P+xP26ET94lCsZv/PYDX3OyF9tfbG76/ArHDqaD3jCMCkrXiWzwaHf64A0EiXh8Tgh26uqXNqx98T10/TTn7vKLy4MIBypOhl9lXA59wafpSOrEZKUFouS3bsQwSPqKItQKjIQsRHRjWcfrc93Cb6V1rZ5zJb5ARHfYSC/VVPWfz0+0Xzym6zLfyOq5B18CkcNaG2fF3N/mtp/cqa3TBU+kDHZtYYQrXqieRj9xv8Ei+OrUsN2MiCo/usWwTLcYhA2LnruBcSBxIl920XbOUuoahiI9tCv4EnxFcz/wgjstd/cts9hkwr7+DBkY6OBfKKXpGeHBO+7QTr+59Hjx+4icgqPZj6FBukzq5MVffI1dYOve+gffbGxyGm56++ESybPG2pXMGdRTV4tV9e/3BbPqBFDjUCqUxRAm+QmlqErTF2lufuxX3PzI+xvGJM+qd+Xa1gyz8zoC8rQpadb8ZWswk/T+znuNeXuqq1Q5Mr6Nz+zKsrqtzJVLZZg2/LCqFxSLVCHr8MX
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(46966006)(36840700001)(54906003)(70586007)(70206006)(82740400003)(110136005)(5660300002)(2906002)(478600001)(186003)(8676002)(82310400003)(7696005)(4326008)(36756003)(8936002)(2616005)(6666004)(336012)(426003)(1076003)(26005)(36860700001)(47076005)(86362001)(81166007)(316002)(44832011)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2021 17:39:02.1429 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6287b01-348f-4e4b-df61-08d908da2e45
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT066.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3129
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, Shashank.Sharma@amd.com,
 Shirish.S@amd.com, hersenxs.wu@amd.com, Vitaly.Prosyak@amd.com,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
value is a explicit luiminance value in nits. This allows the userspace
to set the maximum white level for the SDR plane.

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  4 ++++
 drivers/gpu/drm/drm_color_mgmt.c  | 17 +++++++++++++++++
 include/drm/drm_color_mgmt.h      |  6 ++++++
 include/drm/drm_plane.h           | 14 ++++++++++++++
 4 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index ea95c1224253..b3b6de7b74aa 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -597,6 +597,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->color_range = val;
 	} else if (property == plane->color_tf_property) {
 		state->color_tf = val;
+	} else if (property == plane->sdr_white_level_property) {
+		state->sdr_white_level = val;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -665,6 +667,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
 		*val = state->color_range;
 	} else if (property == plane->color_tf_property) {
 		*val = state->color_tf;
+	} else if (property == plane->sdr_white_level_property) {
+		*val = state->sdr_white_level;
 	} else if (property == config->prop_fb_damage_clips) {
 		*val = (state->fb_damage_clips) ?
 			state->fb_damage_clips->base.id : 0;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 2404b07046c5..a0b77d7d0565 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -519,6 +519,23 @@ const char *drm_get_color_range_name(enum drm_color_range range)
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
  * drm_get_color_transfer_function - return a string for color transfer function
  * @tf: transfer function to compute name of
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index f59806366855..a020346b1747 100644
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
index c85c59501a7a..fad8b7dd430c 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -187,6 +187,11 @@ struct drm_plane_state {
 	 * format for a proper HDR color/luminance output.
 	 */
 	enum drm_color_transfer_function color_tf;
+	/**
+	 * @sdr_white_level:
+	 * SDR white level boost for HDR+SDR multi plane usecases. max white level in nits
+	 */
+	unsigned int sdr_white_level;
 	/**
 	 * @fb_damage_clips:
 	 *
@@ -757,6 +762,15 @@ struct drm_plane {
 	 * See drm_plane_create_color_properties().
 	 */
 	struct drm_property *color_tf_property;
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
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
