Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC2B57FE85
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 13:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28AAD99CB2;
	Mon, 25 Jul 2022 11:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 432F599CB2;
 Mon, 25 Jul 2022 11:43:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2sVA4vmkjiBzxuCjntWkB/dRIyDUqhcVKdEZ30qRziO24zNJvZJLjcDnlDlBwYzWiwH/eMtnPmOnw/bW8WhlPBfqWbcV4JFHpE79xF0M4pnp0QAuSNQLxlRnm6e0DhH0cwKz5KSqbvX7ybE0t60TQ/1VE5gKrH/jk7SY2reeNaxrSisbNZxYPRoN5kvR/Y2XPGfu4HQlWltYfl/B2Nk+O8XsFrmoj6JWSOakQ+G8/wi9gdCkh1MjpUdDV6DdKDOWx0jIv1Bf87/ylCRDUqq6c6Q4axS4zCBd+vj8+agQz9bzesOSQB4Wye8FtNmN+FizT4XE1Px5ywDDehBWPWLcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Oy4/ciJAL7Hjhfb3kaoTaClOx5uU4W2OAtkai13UdA=;
 b=C0hs9I1P5zyjU/vvo75j8PqLyyIeACbd5zw+y3+NPMI3zx/xp7AKdfZDgIyaO8gv+7mPxibx4OPEpJ0JGvLMh0/QynudijJzI5+O5/UidQ+jpGNmhGotKpdP7f0oKF50v6aVWozTzMbILrzJwDUhBcO5PAMRoY8YB7mL1b8q9j0hb+AVCzTj+3ygoOZfFm/ajpB13OFcNGuIuFxe8RCnzIqb+vVNFX7KLa9kq/n7lVKVcYhcO/4MHRtX/j0WYZVamqEaQRHWOP4N7hm9M8XKIOQvLE3bXATLhRj6Tq6/F4rmAXtMX5tffq9jbH2szHx1WRB6iRWpeWhR7Wuk7Y8A3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Oy4/ciJAL7Hjhfb3kaoTaClOx5uU4W2OAtkai13UdA=;
 b=f9R6sGZwxE5MdpjdJW/nPHgNnr88H7CA4zgnH7JQ+jsCYSVdhkKYj6i1Uw92ZBOCcLmMiWaRyDPy9CZFivAbB2M3tQZgRcKEEM6uclkj7zBMamwV5gGfLHzxIBQTgQr52j/RBmE1jjms/8lBiy5glrzgu1m1ptSC2cfhW74ICSw=
Received: from BN9PR03CA0481.namprd03.prod.outlook.com (2603:10b6:408:130::6)
 by DM6PR12MB3529.namprd12.prod.outlook.com (2603:10b6:5:15d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.23; Mon, 25 Jul
 2022 11:43:26 +0000
Received: from BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:130:cafe::14) by BN9PR03CA0481.outlook.office365.com
 (2603:10b6:408:130::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23 via Frontend
 Transport; Mon, 25 Jul 2022 11:43:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT035.mail.protection.outlook.com (10.13.177.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5458.17 via Frontend Transport; Mon, 25 Jul 2022 11:43:26 +0000
Received: from amd-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 06:43:23 -0500
From: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH v2 1/6] drm/ttm: Add new callbacks to ttm res mgr
Date: Mon, 25 Jul 2022 04:42:35 -0700
Message-ID: <20220725114240.4844-1-Arunpravin.PaneerSelvam@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8e6d598-cdac-4979-7a6c-08da6e32e2ef
X-MS-TrafficTypeDiagnostic: DM6PR12MB3529:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h7RlFae/q+hMOl1MeHfI6HBuMzrCt/n+3+HLPbYSK5sTgGB4vucVvMH1UXAsne7c/Pp6J0riH8kaEeKBItYKMPk35EM0t1Um6N8HIS0Gf6W86r/9uOxycZWBFwNXDNkAkD/+xaXb7btYk4zkNL7pzxr55bAGi1nUOIGlgPZsbHHap9EIWrTYr5SCgBJYCLBWCRrCtzxHXbBwfLNQhmW3opS3cdeMFnjPnYvqlBDslH5z2T25zOopV1f0TaAHB4/JIvCrzZTd0aLfyHkprLuCkvEPKC1JJNrS2mQyoIzeiaQDhQ5Ridu7dgaegDD73L5FvFcraO0MkKviOcgJHhKpm1SNr1FRP6a344B1cqdwfKf4FHllL+DpaKXyBghn6jeiHp4VVRlWbuJTU3Ss6+auYLnI8KBA29vkdi/kZXGdEsyz/U+Luyf3AcACmI+PU1e8YGX47pM8HDJcrIQCjCF7UnLBbq2Wm/VHHkWimDBQqh44sgZipZFKpIJy+tFUxVoRu2AvlXkfeBg1Xw+Peq8Wks9QTuWvSfiCJXSBRGJxaDp4VwNFB494clDRPz5MxstRlo/PT7Buxk2Z75s8rc7qhpvBAA/VIIRWBBASnPfS3n6q0EiIil4e8RwUC4zJNKB6+keg8PjgsThEZRWGQLe2SWF0wkaQtLEg6B6SPOJAeNU1eVoBdwLH5DAtqzq5oawYC0bMgIbFljuQizPa30sfpiZd6WUeewjh9tazp2SSVw/7qRCaE5eDEII4swRRa0g1NtiF+3sfS8GAHA3WfR5bPKK61iYwBRAa5OhFwDjgP4U8qQ+g1ftP6qRy58VN/AW7qXxkifTjW8twiE/jQvLjuA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(346002)(376002)(136003)(40470700004)(36840700001)(46966006)(8676002)(41300700001)(40480700001)(5660300002)(356005)(36756003)(82740400003)(70206006)(81166007)(6666004)(8936002)(478600001)(26005)(1076003)(47076005)(336012)(7696005)(186003)(16526019)(36860700001)(316002)(54906003)(110136005)(40460700003)(2616005)(82310400005)(4326008)(2906002)(70586007)(86362001)(426003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 11:43:26.0330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8e6d598-cdac-4979-7a6c-08da6e32e2ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3529
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
Cc: alexander.deucher@amd.com,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 luben.tuikov@amd.com, christian.koenig@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are adding two new callbacks to ttm resource manager
function to handle intersection and compatibility of
placement and resources.

v2: move the amdgpu and ttm_range_manager changes to
    separate patches (Christian)

Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 59 ++++++++++++++++++++++++++++++
 include/drm/ttm/ttm_resource.h     | 39 ++++++++++++++++++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 20f9adcc3235..4cd31d24c3e7 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -253,6 +253,65 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
 }
 EXPORT_SYMBOL(ttm_resource_free);
 
+/**
+ * ttm_resource_intersect - test for intersection
+ *
+ * @bdev: TTM device structure
+ * @res: The resource to test
+ * @place: The placement to test
+ * @size: How many bytes the new allocation needs.
+ *
+ * Test if @res intersects with @place and @size. Used for testing if evictions
+ * are valueable or not.
+ *
+ * Returns true if the res placement intersects with @place and @size.
+ */
+bool ttm_resource_intersect(struct ttm_device *bdev,
+			    struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size)
+{
+	struct ttm_resource_manager *man;
+
+	if (!res)
+		return false;
+
+	man = ttm_manager_type(bdev, res->mem_type);
+	if (!place || !man->func->intersect)
+		return true;
+
+	return man->func->intersect(man, res, place, size);
+}
+
+/**
+ * ttm_resource_compatible - test for compatibility
+ *
+ * @bdev: TTM device structure
+ * @res: The resource to test
+ * @place: The placement to test
+ * @size: How many bytes the new allocation needs.
+ *
+ * Test if @res compatible with @place and @size.
+ *
+ * Returns true if the res placement compatible with @place and @size.
+ */
+bool ttm_resource_compatible(struct ttm_device *bdev,
+			     struct ttm_resource *res,
+			     const struct ttm_place *place,
+			     size_t size)
+{
+	struct ttm_resource_manager *man;
+
+	if (!res)
+		return false;
+
+	man = ttm_manager_type(bdev, res->mem_type);
+	if (!place || !man->func->compatible)
+		return true;
+
+	return man->func->compatible(man, res, place, size);
+}
+
 static bool ttm_resource_places_compat(struct ttm_resource *res,
 				       const struct ttm_place *places,
 				       unsigned num_placement)
diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
index ca89a48c2460..68042e165c40 100644
--- a/include/drm/ttm/ttm_resource.h
+++ b/include/drm/ttm/ttm_resource.h
@@ -88,6 +88,37 @@ struct ttm_resource_manager_func {
 	void (*free)(struct ttm_resource_manager *man,
 		     struct ttm_resource *res);
 
+	/**
+	 * struct ttm_resource_manager_func member intersect
+	 *
+	 * @man: Pointer to a memory type manager.
+	 * @res: Pointer to a struct ttm_resource to be checked.
+	 * @place: Placement to check against.
+	 * @size: Size of the check.
+	 *
+	 * Test if @res intersects with @place + @size. Used to judge if
+	 * evictions are valueable or not.
+	 */
+	bool (*intersect)(struct ttm_resource_manager *man,
+			  struct ttm_resource *res,
+			  const struct ttm_place *place,
+			  size_t size);
+
+	/**
+	 * struct ttm_resource_manager_func member compatible
+	 *
+	 * @man: Pointer to a memory type manager.
+	 * @res: Pointer to a struct ttm_resource to be checked.
+	 * @place: Placement to check against.
+	 * @size: Size of the check.
+	 *
+	 * Test if @res compatible with @place + @size.
+	 */
+	bool (*compatible)(struct ttm_resource_manager *man,
+			   struct ttm_resource *res,
+			   const struct ttm_place *place,
+			   size_t size);
+
 	/**
 	 * struct ttm_resource_manager_func member debug
 	 *
@@ -329,6 +360,14 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
 		       const struct ttm_place *place,
 		       struct ttm_resource **res);
 void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
+bool ttm_resource_intersect(struct ttm_device *bdev,
+			    struct ttm_resource *res,
+			    const struct ttm_place *place,
+			    size_t size);
+bool ttm_resource_compatible(struct ttm_device *bdev,
+			     struct ttm_resource *res,
+			     const struct ttm_place *place,
+			     size_t size);
 bool ttm_resource_compat(struct ttm_resource *res,
 			 struct ttm_placement *placement);
 void ttm_resource_set_bo(struct ttm_resource *res,
-- 
2.25.1

