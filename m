Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFFC202902
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 08:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27286E428;
	Sun, 21 Jun 2020 06:05:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E556E417;
 Sun, 21 Jun 2020 06:05:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0HkDzDH4SQe5k/DVfJCPJQK117eI66g87/gL7Cf6gbUw8ovGqU7DKOSVGH0IAzbcQTTr7wlJU8GJ7T3hfMSuvYiIeF1XbvMP0GMYClXENckZilgcXlinq2xkrPFuLqFh9taPjh62vAF4IK4WEjr0ebRyr9McwHINEBvXUcEfUvcF0JBRa5KBh4vxsz36O+ehjdOtUkyxq1nwM6uY231Uf6vslX9zS30L9BBCgS05c1uBi+iaHIEUUMCRajtt2NVlSQ83DlwFGgs1hrRJqcTDUi2ZN4jt3XiDc5JfarGEcpxbSkzKA/mhI/x9yfH3NXLdLSJ9/lnBr5f3MjX6CFFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YLC4RzlLpAxXt+DPVp5IAwn3rTH/8N03QpL/JBrekk=;
 b=VT/LWtuXkIVw8zx0/9v7Ge41pYL3mj99Psm4fhFnYFtcy2ow+l6n36Bi7GZmBHJNEZ44sgVKCzamlHtymvos0qTW8tZm41P3rVZV3iY1RIsFbEqQqp9BZKNej6P4IpeZFsVQymJ1G1t+bh8WFaqvjd7doR1A3h2smLaw6RrKGJvUBZ8USMlN/3VohBx6bcZLNTg8rX8FacS3QawmfxPe+3nVMCU+JKjSEQSljEFNalaQqDqTjD6VsHhlge8kjp+fM0Q5TskM2v2bS9HsS1Sr0qpCpSEUjSVusaHoZN+113Zvd7KSahDvE3TzkAputLLI78dMvAGnCBbU/GZtZyL8TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YLC4RzlLpAxXt+DPVp5IAwn3rTH/8N03QpL/JBrekk=;
 b=0xSRYkJB/NeOrb2qQIjiNA+AmUXUaG0OQqrLuT7LFj5ndsrMuIKCNTCTWwsT3ptNIhlSbS4cR4r3pOCmdpt+Ls8kqNnJsX9fFeZb8c0jzfCv2qplUOdZJbjthzMS3vrN2rBFxRPh4YU3Zh+pCJpKXVzyjmKmmtwBYQe/EI5UZRA=
Received: from BN6PR17CA0035.namprd17.prod.outlook.com (2603:10b6:405:75::24)
 by BN6PR1201MB0116.namprd12.prod.outlook.com (2603:10b6:405:56::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Sun, 21 Jun
 2020 06:05:40 +0000
Received: from BN8NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::b4) by BN6PR17CA0035.outlook.office365.com
 (2603:10b6:405:75::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Sun, 21 Jun 2020 06:05:40 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 BN8NAM11FT038.mail.protection.outlook.com (10.13.176.246) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3109.22 via Frontend Transport; Sun, 21 Jun 2020 06:05:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:38 -0500
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 21 Jun
 2020 01:05:37 -0500
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Sun, 21 Jun 2020 01:05:37 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
Date: Sun, 21 Jun 2020 02:03:01 -0400
Message-ID: <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(396003)(39850400004)(46966005)(8676002)(186003)(26005)(86362001)(426003)(336012)(2616005)(44832011)(2906002)(36756003)(70586007)(5660300002)(83380400001)(70206006)(6666004)(81166007)(82310400002)(478600001)(8936002)(4326008)(7696005)(47076004)(110136005)(316002)(82740400003)(356005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0d57a965-9a68-4983-8d0a-08d815a91f37
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0116:
X-Microsoft-Antispam-PRVS: <BN6PR1201MB01162C1DD4C9FBC7710EBAEFEA960@BN6PR1201MB0116.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:316;
X-Forefront-PRVS: 04410E544A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JscTEEYSZloLTR4/PZHHOrv4uRPlOM0qUa08O7+E/Necf9gLURuP9tzZsY7emAusj/l6/1lYsCaCNlcqL6JD+PDJoste42P45vfWCnvamQwXyEKR3ZU+gFv62ev+jgYZuIyKSU+nd1MdlGIRja3zub+iNYBH+8cqBl9cgRv1QfIQXupIvLdRehgY/B6ixIpypvC0Jh3MLA/knIsjD1DXudlnI1lGtOln8x6DjFFwQSz6Qaa+2A92o+fxdk5gskaB6SorTbG8DgtLdwUZyW3ysPgtxW3+1rIpS82kVag/tYCR7e8vy/633KStC6PWh+SB9okK10n5fCySm2VKvk5atHWEwcZkWDOFpnx4Y/fAvqUUaB2Cr/2UdSMCap0DTqaqD5RkfdiUaLY2E5uTsRDYgw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2020 06:05:38.9886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d57a965-9a68-4983-8d0a-08d815a91f37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0116
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net,
 ckoenig.leichtzumerken@gmail.com
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
index c4c704e..67c0770 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -188,6 +188,12 @@ struct drm_file *drm_file_alloc(struct drm_minor *minor)
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
@@ -284,6 +290,8 @@ void drm_file_free(struct drm_file *file)
 	if (dev->driver->postclose)
 		dev->driver->postclose(dev, file);
 
+	__free_page(file->dummy_page);
+
 	drm_prime_destroy_file_private(&file->prime);
 
 	WARN_ON(!list_empty(&file->event_list));
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 1de2cde..c482e9c 100644
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
@@ -1006,6 +1013,9 @@ void drm_prime_gem_destroy(struct drm_gem_object *obj, struct sg_table *sg)
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
index 19df802..349a658 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -335,6 +335,8 @@ struct drm_file {
 	 */
 	struct drm_prime_file_private prime;
 
+	struct page *dummy_page;
+
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
 	unsigned long lock_count; /* DRI1 legacy lock count */
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 0b37506..47460d1 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -310,6 +310,8 @@ struct drm_gem_object {
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
