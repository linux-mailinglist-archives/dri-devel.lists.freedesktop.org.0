Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 038F811EB9B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 21:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977B96ED1F;
	Fri, 13 Dec 2019 20:09:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669596ED01;
 Fri, 13 Dec 2019 20:09:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6IS41V4BYlF3HGAc1hLdsSlEFw5Nm5nQ28QCrdNBGdFFVFylHXtmF2ovjepW4qOMQDOwZvlzD2incxR6Xzb1vGAmEBEBQn3wPgvPsZRHRbi1+JYCpVCqn3/ez6a5f2evCfcBrPBQZONcc11cJh/dxApR2kLt9d4TqR6IjRmR6LsPaP9Y5NOS2Pc0TE62klHdlexW4QJRvD04uWAoubB9s7MAAsFoMbiaObCFbC0MxYYOT5+IadBYP5EbSZPqhIdasT717dbhRo7ox/aEIV5NEvG5Z/SXe8CHeI9jJQ3dSSSR4piquxHXPXb0pywS5fOUM8gyujIvGt40neORD9Ycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkXIeU5cUmVLADhdjOnrIFma4xF0glStBcMFDZqZfY4=;
 b=MAjqiI+tCIb3h1+2QiKt3+IJA+w6sbYDHHuWoA0SQ6n3Py/vpMAExxxRPYnAFV5MtvYExT0NDSOidrpBGxHPaPsxBoKfC7r0Z2TMwmLYprbWapNkKjSJdjCUQ99ly6N0KbgnafGoALznJQOMesvwetldvE+tsATH7SomD3rIHK7I540eKJpaTQts2U3mMPIZWVICX4FrfZ9O2holf0tTHIi4ekl5wksxOMNzzxLaNsL3LRCeZCwdHL2/or72LBKvKRD1g4xbdKYPPo1L/9LiSL8cUmUuIPk1+xx9sXIF0dcGykL8aMidwz+Ac0WjpaP1rCezHpM/aMOvGG6Ldpe6yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkXIeU5cUmVLADhdjOnrIFma4xF0glStBcMFDZqZfY4=;
 b=xIwVV7MOZ5GYSUr0M4zkOo3mTr5RexBXn5Ra/Wxi0WJZxsSIS05e2mvJnW35wbOt7KFJLiApDuYqoy4AQQot3LgPxhmb5eB0BwyriTPRYDpyRJVil9H4pwlDWuwet7GB00YcjqwHXKd/qx17AdqFAllYfcuinmMH2FyNPgXBFlU=
Received: from SN1PR12CA0093.namprd12.prod.outlook.com (2603:10b6:802:21::28)
 by CY4PR1201MB0056.namprd12.prod.outlook.com (2603:10b6:910:1c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.16; Fri, 13 Dec
 2019 20:09:00 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eae::208) by SN1PR12CA0093.outlook.office365.com
 (2603:10b6:802:21::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17 via Frontend
 Transport; Fri, 13 Dec 2019 20:09:00 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2538.14 via Frontend Transport; Fri, 13 Dec 2019 20:09:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:08:59 -0600
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 13 Dec
 2019 14:08:59 -0600
Received: from mlipski-pc.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 13 Dec 2019 14:08:59 -0600
From: <mikita.lipski@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v9 03/18] drm/dp_mst: Add MST support to DP DPCD R/W functions
Date: Fri, 13 Dec 2019 15:08:39 -0500
Message-ID: <20191213200854.31545-4-mikita.lipski@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191213200854.31545-1-mikita.lipski@amd.com>
References: <20191213200854.31545-1-mikita.lipski@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(136003)(428003)(199004)(189003)(2906002)(478600001)(2616005)(450100002)(2876002)(1076003)(54906003)(8936002)(81166006)(8676002)(356004)(6916009)(186003)(26005)(4326008)(6666004)(5660300002)(7696005)(426003)(86362001)(70586007)(70206006)(81156014)(36756003)(316002)(336012)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0056; H:SATLEXMB01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deaa50a4-e9c9-44e2-176d-08d780084af8
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0056:
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00566B57F35639F01E11E4DBE4540@CY4PR1201MB0056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0250B840C1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ulLRnuEp69HdH6GLH3EGBdQwlLRoiogH1732ihL4nNgAEG8jU7PsDq7UVUTOMCr3BEzcduENJpnd7WVu2uYPrJRvTg8Rz+odcnG/TAks1mticeiJyzdioqYbGNXH6/S2qc3/4Tl72hRjPyr/uAMNV37p3nldDcwuB2+/OR1NFId1eusuBW4Aoh6NzRG1m6vw6qF+t99CzV0sdqDDetLJ0OCiIBHZNtJhUPzz2Q8t4QdRapg/AlSLVQXzq326ayy+r+Tw73KKYzzD3GdQpor+qnWD5x0EeTJiT+oehy07Qwiz5WFgFEHoSl1IIiKDFPF8ZlIo+cHkErdh9O8uU0JydPcHUjUOBkuaRP26Ow+ScqlF27JnxEeB2+RvpQRSCzXM8NGe2Bj8jr7tRPrJGBLh2zJ+INpXbNMwNtunCWwS8dfhnaML/MQsqAWUWHL9GIyTelsL2l6vPqvncRMgl4+Sh6paU1DJBBhQ0RUFfR8VimvgI48rfchluPzX/P9MC/rR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2019 20:09:00.1650 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deaa50a4-e9c9-44e2-176d-08d780084af8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0056
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

Instead of having drm_dp_dpcd_read/write and
drm_dp_mst_dpcd_read/write as entry points into the
aux code, have drm_dp_dpcd_read/write handle both.

This means that DRM drivers can make MST DPCD read/writes.

v2: Fix spacing
v3: Dump dpcd access on MST read/writes
v4: Fix calling wrong function on DPCD write
v5: delete deprecated include of drmP.h

Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: David Francis <David.Francis@amd.com>
Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
---
 drivers/gpu/drm/drm_dp_aux_dev.c | 12 ++----------
 drivers/gpu/drm/drm_dp_helper.c  | 30 ++++++++++++++++++++----------
 2 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_dp_aux_dev.c b/drivers/gpu/drm/drm_dp_aux_dev.c
index 0cfb386754c3..2510717d5a08 100644
--- a/drivers/gpu/drm/drm_dp_aux_dev.c
+++ b/drivers/gpu/drm/drm_dp_aux_dev.c
@@ -163,11 +163,7 @@ static ssize_t auxdev_read_iter(struct kiocb *iocb, struct iov_iter *to)
 			break;
 		}
 
-		if (aux_dev->aux->is_remote)
-			res = drm_dp_mst_dpcd_read(aux_dev->aux, pos, buf,
-						   todo);
-		else
-			res = drm_dp_dpcd_read(aux_dev->aux, pos, buf, todo);
+		res = drm_dp_dpcd_read(aux_dev->aux, pos, buf, todo);
 
 		if (res <= 0)
 			break;
@@ -215,11 +211,7 @@ static ssize_t auxdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			break;
 		}
 
-		if (aux_dev->aux->is_remote)
-			res = drm_dp_mst_dpcd_write(aux_dev->aux, pos, buf,
-						    todo);
-		else
-			res = drm_dp_dpcd_write(aux_dev->aux, pos, buf, todo);
+		res = drm_dp_dpcd_write(aux_dev->aux, pos, buf, todo);
 
 		if (res <= 0)
 			break;
diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 2c7870aef469..2faef8bd911f 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -32,6 +32,7 @@
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
+#include <drm/drm_dp_mst_helper.h>
 
 #include "drm_crtc_helper_internal.h"
 
@@ -266,7 +267,7 @@ static int drm_dp_dpcd_access(struct drm_dp_aux *aux, u8 request,
 
 /**
  * drm_dp_dpcd_read() - read a series of bytes from the DPCD
- * @aux: DisplayPort AUX channel
+ * @aux: DisplayPort AUX channel (SST or MST)
  * @offset: address of the (first) register to read
  * @buffer: buffer to store the register values
  * @size: number of bytes in @buffer
@@ -295,13 +296,18 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 	 * We just have to do it before any DPCD access and hope that the
 	 * monitor doesn't power down exactly after the throw away read.
 	 */
-	ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, DP_DPCD_REV, buffer,
-				 1);
-	if (ret != 1)
-		goto out;
+	if (!aux->is_remote) {
+		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, DP_DPCD_REV,
+					 buffer, 1);
+		if (ret != 1)
+			goto out;
+	}
 
-	ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset, buffer,
-				 size);
+	if (aux->is_remote)
+		ret = drm_dp_mst_dpcd_read(aux, offset, buffer, size);
+	else
+		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_READ, offset,
+					 buffer, size);
 
 out:
 	drm_dp_dump_access(aux, DP_AUX_NATIVE_READ, offset, buffer, ret);
@@ -311,7 +317,7 @@ EXPORT_SYMBOL(drm_dp_dpcd_read);
 
 /**
  * drm_dp_dpcd_write() - write a series of bytes to the DPCD
- * @aux: DisplayPort AUX channel
+ * @aux: DisplayPort AUX channel (SST or MST)
  * @offset: address of the (first) register to write
  * @buffer: buffer containing the values to write
  * @size: number of bytes in @buffer
@@ -328,8 +334,12 @@ ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
 {
 	int ret;
 
-	ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_WRITE, offset, buffer,
-				 size);
+	if (aux->is_remote)
+		ret = drm_dp_mst_dpcd_write(aux, offset, buffer, size);
+	else
+		ret = drm_dp_dpcd_access(aux, DP_AUX_NATIVE_WRITE, offset,
+					 buffer, size);
+
 	drm_dp_dump_access(aux, DP_AUX_NATIVE_WRITE, offset, buffer, ret);
 	return ret;
 }
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
