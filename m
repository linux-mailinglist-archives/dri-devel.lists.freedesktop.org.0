Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE40642C8CA
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 20:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B2E6E0FB;
	Wed, 13 Oct 2021 18:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0EF6E0FB;
 Wed, 13 Oct 2021 18:36:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f23LQTfpBbzBHupLxdMPoBGay1akJ0GVfY+2s0l1sEePfFkjx/Y0jmjjKjlWn0cjoR1YueVfc0yfPHKyGHRK5Ky+X4ErGGWgG2qxsc/0gAPC1cQYOeVCMQPyaHbJ1fNSpSIy6ZK5Fo6JSpTymqnx7qjjG3/BAhnfisUC0+b2V/5n8Uw5vXM0fcVsOJPxvz+jATt/BwMdC5yUYA7oxBDqH3GGZaN9mfRbOGHvwS83lIwABoh6iVtlGk4UUf2Aa95SQQS1f8+2GpudSBhgR8/3/cBQiZz0ifvECOtMr/E7lwLAEqYSejVBLd8aVre900Lr5SLo3TdgoKhMhULYeDvfzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wh335hn16jS+pIuCfapAk8ZuR4DgGjARl9vabxRbf0=;
 b=eKGzfiYtwuCBnClP6yyyjfcEeoOhzgXE9XRwN93l1+WtEw+aG6t95moXs8dnEZv718Jn+z3A+r8TR4AMEhqrwUVhFGXiLJIgjrXCiMKljU0NxzBcvjpSOFJcNFUzGazuUedcpBcMW1WNGr0LbfYrhv8vZJIx5/31bHpEeBqvhPVHyiZaROmf9e1y4N0gjYSjUQ9Qo9D5z93vCa1MZkIGFIu/pC3DhLL99Aj/Tx9kKvEUDj1HMsqPhYiyZqwmZwhphBmEv+qyKEIabH6pEEljxhyoT9LNN0SCUmPFloOHSTIKtpWPrX8z+H3BHspzQkyTVxyt0tPA1oJCsPY26Vvn/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wh335hn16jS+pIuCfapAk8ZuR4DgGjARl9vabxRbf0=;
 b=MCyryF7eE2MYA5E6g+fVdh62MxNOVvoQJRwzNALruqaaKi4xBkJaVvrizHO2yzPxEA9f1ZBm11+tFbszIvJ58pdNbQ2//99cBbvKnQdrer/+zqljiACk8+fWMgbe+SDcjkkM7v17w+9XCU6ibUqi3if6aJmvvZseW8m94rQifsY=
Received: from DM5PR20CA0031.namprd20.prod.outlook.com (2603:10b6:3:13d::17)
 by DM6PR12MB2988.namprd12.prod.outlook.com (2603:10b6:5:3d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.22; Wed, 13 Oct
 2021 18:36:15 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13d:cafe::69) by DM5PR20CA0031.outlook.office365.com
 (2603:10b6:3:13d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15 via Frontend
 Transport; Wed, 13 Oct 2021 18:36:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 18:36:14 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 13 Oct
 2021 13:36:12 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/4] dri: do not check for NULL debugfs dentry
Date: Wed, 13 Oct 2021 20:35:58 +0200
Message-ID: <20211013183601.16514-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77aea556-b540-4ad6-5ab4-08d98e78566e
X-MS-TrafficTypeDiagnostic: DM6PR12MB2988:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2988CB90EC7EA854E6A8DF4C8BB79@DM6PR12MB2988.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iUqySQ2WvaJ9B3PcykWMF6Ao1o1z/QlU0GoN/yCM5URSSPMKQc2Dd5OPM19EAfNVkQr9wNLZFUABFAzKpbIpOOQnlNm/UmqRdMiulGm5TXl3P3o/wkZklgXMxmxT0jZQwKXHRz7PxB76HzRtHknjg2HkJzd2CnMgL7lPbtPuEho4cdfPzfZnXSf/kbSQPvk+e1JSegfV5QXnviG6ihWoI179sF+Pd9okwObJaTsKllb9eTLnRuDKUzPMZX4yYwVfU7gSYHWwraO1nxB1Z5CV3slV172F+T0rUaEKZHa0QnkqomSezljORh3rvNHbiGWJB1Z4Mrs3A1BzxQqsYnlyhSPdI7K03BquHi/GU/hfhIV6Ot4IMj2vpqHz+eGaI67mcZpPz60LO36Spf5gcSfequxBkEFEw5dc1Y3QjZ5IiF68wIMbef7vMefDINlCAgq/AbgQMryjC4W2kWV9xR62RD2j5VYC9Vq0qxb7ZYYtTjOgBSKqC9Fp3wKOZbU69u36kYU8K+pw1gqoF9/zMtjtxMY/12/rgrgLzrQRl8iI+tEAzmN/Ah8a0UVBvWlu6ohEBsvKOtO+ZldwVSimojadXM3HGKG94Z/QgNICRzRH1SEe0r/0BPAdQ5QWLjKfjBVEs0F09uXbz6nRvAAVdOnmyDuCbMER22pYHzpnFmg3lZsDKoDG10sOZrS2ttkcBVvOOcz6xLP7B4jAQ4UdSTupbvQfalheDlfPjC+8hSQvELo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(70586007)(47076005)(44832011)(7696005)(5660300002)(6666004)(1076003)(8676002)(186003)(86362001)(356005)(508600001)(336012)(83380400001)(4326008)(16526019)(82310400003)(36756003)(2616005)(8936002)(70206006)(36860700001)(6916009)(26005)(54906003)(2906002)(316002)(426003)(81166007)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 18:36:14.6168 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77aea556-b540-4ad6-5ab4-08d98e78566e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2988
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

Debugfs APIs returns encoded error on failure instead of NULL
and for drm primary/minor debugfs directories, we save the
returned value in the dentry pointer and pass it on to drm
drivers to further create debugfs files/directories. Error
conditions are handled by debugfs APIs, so no need to check
for NULL, as saved dentry pointers will either contain a
valid pointer or an error code.

Also document this for future reference.

CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@linux.ie>
CC: Daniel Vetter <daniel@ffwll.ch>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/drm_debugfs.c |  9 ---------
 drivers/gpu/drm/drm_drv.c     |  1 +
 include/drm/drm_file.h        | 28 ++++++++++++++++++++++++----
 3 files changed, 25 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index b0a826489488..0073854a4383 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -272,9 +272,6 @@ static void drm_debugfs_remove_all_files(struct drm_minor *minor)

 void drm_debugfs_cleanup(struct drm_minor *minor)
 {
-	if (!minor->debugfs_root)
-		return;
-
 	drm_debugfs_remove_all_files(minor);

 	debugfs_remove_recursive(minor->debugfs_root);
@@ -419,9 +416,6 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
 	struct drm_minor *minor = connector->dev->primary;
 	struct dentry *root;

-	if (!minor->debugfs_root)
-		return;
-
 	root = debugfs_create_dir(connector->name, minor->debugfs_root);
 	connector->debugfs_entry = root;

@@ -440,9 +434,6 @@ void drm_debugfs_connector_add(struct drm_connector *connector)

 void drm_debugfs_connector_remove(struct drm_connector *connector)
 {
-	if (!connector->debugfs_entry)
-		return;
-
 	debugfs_remove_recursive(connector->debugfs_entry);

 	connector->debugfs_entry = NULL;
diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 7a5097467ba5..918f302d9c43 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -64,6 +64,7 @@ static struct idr drm_minors_idr;
  */
 static bool drm_core_init_complete;

+/* Do not deference this pointer as it will contain ERR_PTR on error. */
 static struct dentry *drm_debugfs_root;

 DEFINE_STATIC_SRCU(drm_unplug_srcu);
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index a3acb7ac3550..3a30fc4d8905 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -69,15 +69,35 @@ enum drm_minor_type {
  */
 struct drm_minor {
 	/* private: */
-	int index;			/* Minor device number */
-	int type;                       /* Control or render */
-	struct device *kdev;		/* Linux device */
+	/** @index: minor device number. */
+	int index;
+
+	/** @type: minor device type: primary, control, render. */
+	int type;
+
+	/** @kdev: Linux device pointer. */
+	struct device *kdev;
+
+	/** @dev: drm device pointer. */
 	struct drm_device *dev;

+
+	/** @debugfs_root:
+	 *
+	 * Dentry for /sys/kernel/debug/dri/@index debugfs dir. Do not
+	 * deference this pointer as it will contain ERR_PTR on error.
+	 */
 	struct dentry *debugfs_root;

+	/** @debugfs_list:
+	 *
+	 * A list to keep track of debugfs dentries created using
+	 * drm_debugfs_create_files() by drm drivers.
+	 */
 	struct list_head debugfs_list;
-	struct mutex debugfs_lock; /* Protects debugfs_list. */
+
+	/** @debugfs_lock: Protects debugfs_list. */
+	struct mutex debugfs_lock;
 };

 /**
--
2.32.0

