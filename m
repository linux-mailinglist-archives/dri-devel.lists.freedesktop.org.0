Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A393638129D
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:07:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB346F46E;
	Fri, 14 May 2021 21:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40AC26F468;
 Fri, 14 May 2021 21:07:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mdsufMtzYjLJNevsppvqpkQyPtfwY1MU1FwIwpfTDN5go9jF0HvpDDZTA152SNlZ6zsdnNyamQEnSgteklVXzi6lQFyWLzV/JqY51VzIii0Xlo1qIBlauM71fR1q8GFtxjr4FygKgSWdySC4bpQvtikAetEXTVn6Lz9t2fpQqUKzKvVu70fWWQLZV5aB5rG/1Say68ADKEI0GOq1qhCQqPQyvOY70H1URFrzqpiZ5hlA7rcVZV9HV1oTIlmbjDxhUvtjizI+6oMj/XYWEQwl8qHDO3mOvjgiQFwZfEYhiMKZQb7hjPNLsxHDgB+M+a7AlRDdGVEQvGOD6dUSmc5gcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZSaC4BQHWYRF9K00qpxMozL9dRnLFu4NnLze2vEFhM=;
 b=nUYpeaRlZw/dyHBWqF+NW2y/IFIx+XIi9Q79lNl+LKKnxuSbGqD4c4vC1nBMvFQznHUyyVduVxCsWOJABigLVKuZn53z7XUso51B9cv9ejgY2EQFTITh/A5V9D6qrZzM50rLJbHTJRklnGdgAJi8Mm9+A2r64sVCdRXu1MRFrXghkBCCixQMY8FmQ4aZZFT/2Qfn5CTIkiNF2fsazymOJWRc98XRJTqHKvQw04WsnlXWw7oV2li1IyZstqkUq65vvUvhmMPDgWbPxdyMBs3y+tGWVqo5GFDRSOFKXBx8zrKat5iI/1XJ4+RMFGRuJGj6vwpiRsVWZucc3asfmuLvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZSaC4BQHWYRF9K00qpxMozL9dRnLFu4NnLze2vEFhM=;
 b=aKdpPCkPvo68ZKH+GuN99Gzzm9LpxiF6Mas9bVvYjNPzujTz917Yd6Ihvf4aY0w6uYVIvezGxJkySLSAd66fiipcBkMnh613YVPvDEJ65ve6urV8ZlUUVVGquV+HRgok4UnHXpLP4sDcCNMBpDt9zz/QJZ7LvDdKHOWh3wsTzMM=
Received: from BN6PR1401CA0012.namprd14.prod.outlook.com
 (2603:10b6:405:4b::22) by MWHPR1201MB0239.namprd12.prod.outlook.com
 (2603:10b6:301:50::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 14 May
 2021 21:07:35 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::72) by BN6PR1401CA0012.outlook.office365.com
 (2603:10b6:405:4b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 14 May 2021 21:07:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Fri, 14 May 2021 21:07:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 14 May
 2021 16:07:35 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 14 May 2021 16:07:34 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>
Subject: [RFC PATCH v2 4/6] drm/color: Add sdr boost property
Date: Fri, 14 May 2021 17:07:18 -0400
Message-ID: <20210514210720.157892-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514210720.157892-1-harry.wentland@amd.com>
References: <20210514210720.157892-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32dd18c7-9571-4015-7eb6-08d9171c4c42
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0239:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB02393CACF0F958C3EBBDF4E98C509@MWHPR1201MB0239.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j9nhgAIbobfOe+Yx4mqdxGRSPw2vtXaAkWDdpo1efqZeWifkq7cMZkCBC3nCMFsFKHr4ecK9QkLtYEfzNv3kH5VJdx6HhAJtI5Wo8NKWtr8/irBtEPbmUUBU9KkdP6whtkKH7i24PMnlmSGDHBqATZsEdkaeIbpA3k/taduQQWDXbD/mMCi8viecG2hUvWv+6AddV132KDUxuwIshcs985aYyqi8Uo/X2lz/GsZngDl9hc3kE+m3EXKwJat9sNnNWKnHpib0v2259ZfQFljgSgJmEf05RV7H+ysQywPz9901YqCPUp6kEgjfD5NRGwejJ5WOyIecqSSMBj51kHGG1NnSsD4MZGRSd+qjpNSN2nDnxc0Uf8gPUpxWvHqtvUiFMODOvaPTGU66C5sxVjA2Na5ZGsoW9XfWHlbOXNfb8+DaGTTk0eoXFpxuUvEuRvdTNbFkSp5XgDscLh0RAASgyvEf6hdHqdAfQzvIp92Spy/Rx4bruwB4I88/zF0ftcQMDvjqMW+f3k2O43Z+Hpw+aObazOzAtRx3aJtupfOKfzwud0vm9wAjW1jMrSL/SwL47G9JI9qHp4lWPIRMOdUaDhtuXPXTx+Ho36merEA73uBFSOo0GGUwC0GNSe09j/+oBqf/Rz3/ibX2XT+diAkrJXjc7uebBa+IR/OqblAhk6PKDWSAwjOfjW73QCV4q/VL
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(39860400002)(46966006)(36840700001)(8936002)(70206006)(86362001)(5660300002)(36860700001)(36756003)(83380400001)(356005)(7696005)(81166007)(336012)(47076005)(82310400003)(70586007)(6666004)(426003)(186003)(4326008)(44832011)(2906002)(478600001)(54906003)(316002)(8676002)(1076003)(110136005)(26005)(82740400003)(2616005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 21:07:35.5155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dd18c7-9571-4015-7eb6-08d9171c4c42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0239
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
index 42f8fd577d36..863d6ee3bd3d 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -597,6 +597,8 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		state->color_range = val;
 	} else if (property == plane->transfer_function_property) {
 		state->transfer_function = val;
+	} else if (property == plane->sdr_white_level_property) {
+		state->sdr_white_level = val;
 	} else if (property == config->prop_fb_damage_clips) {
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->fb_damage_clips,
@@ -665,6 +667,8 @@ drm_atomic_plane_get_property(struct drm_plane *plane,
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
2.31.1

