Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4382BBD2A
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:21:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5626E96C;
	Sat, 21 Nov 2020 05:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750081.outbound.protection.outlook.com [40.107.75.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B40F6E96A;
 Sat, 21 Nov 2020 05:21:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8XNz8iCErpODKRFJIbcAAjQSuntwiSPkmvGzFdXHE53h0jcwvmi/cFB5iyBR5v9M9zp0Ovp+J2Z0ZBAbP5P7vflS8ZgUfEBOdRPlIjAHHIbyq7QG+4Jz5jnRFanZY8FLmOvlNBSgkaPl/uL/x9EvZE9oCz+WApIbtU94+LrsswQtRsj0ih8XAeVz83gSB5vavik2c9aT/ueYlAB6uPBGqmzVOULYlC7C9oec4yINlIjnSoqfws1Bsa2xc2/0JCatZv6AF9IoWMJDuQuBAk2ZlTZQbJWLdHgi0pcxgKkoMsX9GSbHJEJVpGS1K4rw5f/9z0NQalB58DHWVh+93W1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQzCdtQ2K48KVtT9H/eLOa2oIZsx1AnvbxAv+rzHrsk=;
 b=OdEalaq7TqyjErM1O+pZyyfPRWOTXTMoZq5sJgKR8khEawmM/A73scBvgtJo44cK31XkAmdI+aUpb7v2fFbz63KhvQL13YbtMZRhGR5rcISC1NLMv1+GPeQkRlIeHv7msuDqafnGA/h0J3RAsX7Iw5K28txxtwJlt36hkNbSbI6Y15ulSU+06u57lCdCNS0Ng4zWqZWTo6nUVbVnAg3QU6OH8b+MMvUAIPHuspyra8Tv/pWXDnKrpGH335VFqx0f8ni2sd8/2MvUndcVRUJYeInAHPa3PGEVCFW2jBJcG4WMvc2QwaqyX1f2rCWClfDGaEbRmtWkMy/LPGtkX8UuCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQzCdtQ2K48KVtT9H/eLOa2oIZsx1AnvbxAv+rzHrsk=;
 b=tO10wIF1P7i49BWlfV4hIZiQ5jfYJKIm93hJyextzk3NLit9ngMnn4MTyqB+W5MDVvrNyCcpeyTh1wyzCL2UfKn+HHJRBXOWsRda3SJHovgLX/ETt3LnJzx/O4vUvQVSQIJtKiTa8WlAMNq1ZcJpu4WSQJUjceattGO3aXgr+NE=
Received: from DM5PR06CA0077.namprd06.prod.outlook.com (2603:10b6:3:4::15) by
 CH2PR12MB3861.namprd12.prod.outlook.com (2603:10b6:610:2a::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20; Sat, 21 Nov 2020 05:21:32 +0000
Received: from DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:4:cafe::6c) by DM5PR06CA0077.outlook.office365.com
 (2603:10b6:3:4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Sat, 21 Nov 2020 05:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT040.mail.protection.outlook.com (10.13.173.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:21:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:30 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:30 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:21:29 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
Date: Sat, 21 Nov 2020 00:21:11 -0500
Message-ID: <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5f6f6e7b-0080-4ac8-a69e-08d88ddd4e56
X-MS-TrafficTypeDiagnostic: CH2PR12MB3861:
X-Microsoft-Antispam-PRVS: <CH2PR12MB38612B8572A1475D0A4C2ABFEAFE0@CH2PR12MB3861.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:316;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 94T2/u/IGSs574gFN6jlj2cuucGCuP7d5kP7hrtO4pmkhNee3/93NPQMFjKqVgrL0K3/qZUaPxjx96AQGPSk7TNchT8x3V/sxBA0bckFCza2SE63XbMZLTj/tZU+RYRQA3QuVAVGkayeETZLHU8c/6N5TNy08dsvPMqkDFN64QWf1g723heIhLRN9jiSHgSRB82bP5K5zpnOAeED9gZMV2hrHgRfYB7aVlBh+orGENzeDYMWLwGG+/umvmRfYeIZgWb4E+QgWKNVqp7uxuCajniRneX4BsMa/KbA/9dd5fKMz6yYsNhqk2NdTNkIV0MGrrFtqvtXM4DHDLAKy1S3ilDvHrLC4RBtggpUP/eQpIQgJMg1bYcqOroDRRdHRt21WCP8yPEPyWwGHr8vBllh2Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(46966005)(4326008)(82310400003)(356005)(54906003)(110136005)(478600001)(36756003)(2906002)(6666004)(336012)(5660300002)(86362001)(2616005)(81166007)(47076004)(186003)(7696005)(83380400001)(70586007)(426003)(70206006)(44832011)(26005)(8676002)(8936002)(7416002)(316002)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:21:31.3516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f6f6e7b-0080-4ac8-a69e-08d88ddd4e56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT040.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3861
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Will be used to reroute CPU mapped BO's page faults once
device is removed.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/drm_file.c  |  8 ++++++++
 drivers/gpu/drm/drm_prime.c | 10 ++++++++++
 include/drm/drm_file.h      |  2 ++
 include/drm/drm_gem.h       |  2 ++
 4 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 0ac4566..ff3d39f 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -193,6 +193,12 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
 			goto out_prime_destroy;
 	}
 
+	file->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+	if (!file->dummy_page) {
+		ret = -ENOMEM;
+		goto out_prime_destroy;
+	}
+
 	return file;
 
 out_prime_destroy:
@@ -289,6 +295,8 @@ void drm_file_free(struct drm_file *file)
 	if (dev->driver->postclose)
 		dev->driver->postclose(dev, file);
 
+	__free_page(file->dummy_page);
+
 	drm_prime_destroy_file_private(&file->prime);
 
 	WARN_ON(!list_empty(&file->event_list));
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 1693aa7..987b45c 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -335,6 +335,13 @@ int drm_gem_prime_fd_to_handle(struct drm_device *dev,
 
 	ret = drm_prime_add_buf_handle(&file_priv->prime,
 			dma_buf, *handle);
+
+	if (!ret) {
+		obj->dummy_page = alloc_page(GFP_KERNEL | __GFP_ZERO);
+		if (!obj->dummy_page)
+			ret = -ENOMEM;
+	}
+
 	mutex_unlock(&file_priv->prime.lock);
 	if (ret)
 		goto fail;
@@ -1020,6 +1027,9 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
 		dma_buf_unmap_attachment(attach, sg, DMA_BIDIRECTIONAL);
 	dma_buf = attach->dmabuf;
 	dma_buf_detach(attach->dmabuf, attach);
+
+	__free_page(obj->dummy_page);
+
 	/* remove the reference */
 	dma_buf_put(dma_buf);
 }
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 716990b..2a011fc 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -346,6 +346,8 @@ struct drm_file {
 	 */
 	struct drm_prime_file_private prime;
 
+	struct page *dummy_page;
+
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 	unsigned long lock_count; /* DRI1 legacy lock count */
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 337a483..76a97a3 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -311,6 +311,8 @@ struct drm_gem_object {
 	 *
 	 */
 	const struct drm_gem_object_funcs *funcs;
+
+	struct page *dummy_page;
 };
 
 /**
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
