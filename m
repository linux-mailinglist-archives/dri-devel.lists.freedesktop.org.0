Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4346BAD0548
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 17:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC26410EADD;
	Fri,  6 Jun 2025 15:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="vy/ub6sv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1875 seconds by postgrey-1.36 at gabe;
 Fri, 06 Jun 2025 15:36:16 UTC
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2104C10EADD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 15:36:15 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565hD2J006948;
 Fri, 6 Jun 2025 16:04:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=SMsHjoH5Q2nG0ifgBRmmw70
 aAn/K1FaIdIXnVF9bSm8=; b=vy/ub6svoGkvMYJU5GwFa81XZKREJGkiGofK+XL
 bmhRbtSlNBhyXA8Ch9gmOqGfuk22RjfZiqIXRjlbzh/p3rKp1qODLmRLrggA9FaR
 2bM4PNsnTlVL8NyFNnpQ81NVVlaQF3sGTdkCK+xB5/ETL+69u4rEPhWLYE4a203L
 /voI8GZQe2KrKsOqP0pGTu6Am7dITuArtM2jhS+HtzEt0kMN9juun9N2qLcDiYna
 qkOU0btTXWOkJ+TT0cBrEIodZgftA7/E8Ztm/yL0X/dN4mrvXm0eRMggdgRmVcMT
 6Q4i0jMkVIRB0UG9AfqWz5qJG23yNQg+KTMGkPtQtTvmXFw==
Received: from hhmail05.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 46yr1s63k6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 06 Jun 2025 16:04:44 +0100 (BST)
Received: from [127.0.1.1] (10.100.108.37) by HHMAIL05.hh.imgtec.org
 (10.100.10.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 6 Jun
 2025 16:04:43 +0100
From: Alexandru Dadu <alexandru.dadu@imgtec.com>
Date: Fri, 6 Jun 2025 16:04:34 +0100
Subject: [PATCH] drm/imagination: Reasoning code comments for Sparse
 warnings/errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250606-sprase-reasoning-comments-v1-1-433c0ff11a09@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAIEDQ2gC/x3MywrCQAxG4VcpWRuIYzteXkVcDPW3ZtFMSYoIp
 e/u4PJbnLNRwBVBt24jx0dDqzUcDx2N72ITWJ/NlCQNkiVzLF4C7ChRTW3isc4zbA1Gf5HcD6d
 0liu1fnG89Pt/3x/7/gOOxCkpawAAAA==
X-Change-ID: 20250606-sprase-reasoning-comments-e48064532709
To: Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 Alexandru Dadu <alexandru.dadu@imgtec.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3309;
 i=alexandru.dadu@imgtec.com; h=from:subject:message-id;
 bh=X++z+hQYFYN3nw3M+I3vO+WuT+TKLemBGmnnjojb3mM=;
 b=owEB7QES/pANAwAKARW10uOFNYqiAcsmYgBoQwOKkbBZi/rxufPpXkC9fyJL/1bwCQRSpKVdS
 a+8gzrCL6mJAbMEAAEKAB0WIQS9+pJTOgt5GeXoStwVtdLjhTWKogUCaEMDigAKCRAVtdLjhTWK
 ol55C/48yg+Qgz4D9kRy6vfYEv/WDC8kbF01pPaGOOITCi8/0OFVbE/iZ1MZR8QE3ni+bRYXa1F
 hjW5+smCiN23unWDNI57tY0QpzAU+Q+UgGpDF+MEkuzzNEgNHtoZnxaLBCHvJmCFYqpROLoHDBN
 ynh43FHaqUl2TpyXDuOBprzX8cwBwD/QPgB6uYe3aZZfrSq7ickkzU7jXfxBK7WmkaSouBjTBll
 YDiwj9s2j9BrmUEJYLSbbIef0VIE3IB9pS/oTqfNqQeT5lduRvyLNg74k2lE+Q9H3cvBrvljJWy
 QxHenKbb8D+VpGvOU4CYMQxuLYldBGjDaQq8bQxmeNc4FmarTVRhj6K3saSKpw09ieMBNT/0mIP
 gR7nvp3KFZPJBmvKefnlL4oWHm7eG6r/G3MUGRIOUGLbuYJhxpiMimW1bHR5R+LpZs42Bbb8QG4
 JxKQ38PsA8dPWIexGqMStHC45R26keJ1AI8P/fgkT9hc2GuvQem042i8PyJXYsa2rJJGY=
X-Developer-Key: i=alexandru.dadu@imgtec.com; a=openpgp;
 fpr=BDFA92533A0B7919E5E84ADC15B5D2E385358AA2
X-Originating-IP: [10.100.108.37]
X-EXCLAIMER-MD-CONFIG: 15a78312-3e47-46eb-9010-2e54d84a9631
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDEzMyBTYWx0ZWRfX6wFwHCYW2OnI
 +bGai4RlOcjZxumrnGXQc+kh2O9+/qFI2Wfuzbt3KDViAvc/qb7IazvHLfWF7JMNHHh1fhCLssI
 LwfSU8zk3/xOqZM1l9hc427JySvJb0Dib4qKcbQDU8kw6oVvqp1MXEleyHTNybZjS7zrzGS/ijZ
 Fni7aYfZNFvpoik9MeM62aVzdxUnmWE7ALpeIqJ0f+2eNrg5qe7rHq193BBcOwG9HIim6RodaPi
 jDgW+rxNDlsdArdoxryYxM5tq/V4wOHRSEGrRxeV0D9cFlvrKI6isYB8LiE96RvYt/GY1WPIBEN
 Djdyc8lcRZTI69xXL2c/yivyXrFvx9EJ0uOM+2hEMKrPe+VikIoLSHunSVUj9y17Ch60Xat7vN8
 qNm3g2qRrjlYU16pj50JQI4WCV4KxLizfpFf9j4+nZT9V85q9TY31xXUzNrTI5OG3cfokdRl
X-Proofpoint-GUID: PsfeHOxNl8A2KxD9JuUdMlum11DxwHG8
X-Proofpoint-ORIG-GUID: PsfeHOxNl8A2KxD9JuUdMlum11DxwHG8
X-Authority-Analysis: v=2.4 cv=ENAG00ZC c=1 sm=1 tr=0 ts=6843038c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=WWlI6AgWcwAA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=r_1tXGB3AAAA:8
 a=s9JQ9v9PLfxFY4fmZf8A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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

Added code comments for the lines that might generate Sparse
warnings/errors.
The warnings/errors cannot be fixed with refactoring without masively
impacting the whole code implementation and/or they are incorrectly
generated by Sparse.

Signed-off-by: Alexandru Dadu <alexandru.dadu@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h b/drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
index 51dc37e78f41d7bdf45d1f434dd1aa5b9eca700a..96a423f34c639581a745a7c0498b82d601680ca6 100644
--- a/drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
+++ b/drivers/gpu/drm/imagination/pvr_rogue_fwif_check.h
@@ -157,6 +157,20 @@ OFFSET_CHECK(struct rogue_fwif_frag_ctx_state, frag_reg_pm_deallocated_mask_stat
 OFFSET_CHECK(struct rogue_fwif_frag_ctx_state, frag_reg_dm_pds_mtilefree_status, 4);
 OFFSET_CHECK(struct rogue_fwif_frag_ctx_state, ctx_state_flags, 8);
 OFFSET_CHECK(struct rogue_fwif_frag_ctx_state, frag_reg_isp_store, 12);
+
+/*
+ ******************************************************************************
+ * SPARSE warning reasoning: SIZE_CHECK(struct rogue_fwif_frag_ctx_state, 16)
+ ******************************************************************************
+ *
+ * The structure rogue_fwif_frag_ctx_state contains a flexible size field.
+ * The SIZE_CHECK will run a static_assert function over the structure and it
+ * will use 'sizeof' over a flexible structure.
+ * The implementation of the flexible size field is there by design and cannot
+ * be refactored in a way thet doesn't impact key features.
+ * To avoid having the sparse warning this argument can be used when triggering
+ * the sparse check from the build command "-Wno-sizeof-array-argument"
+ */
 SIZE_CHECK(struct rogue_fwif_frag_ctx_state, 16);
 
 OFFSET_CHECK(struct rogue_fwif_compute_ctx_state, ctx_state_flags, 0);
@@ -484,6 +498,20 @@ OFFSET_CHECK(struct rogue_fwif_hwrtdata, rtc_dev_addr, 264);
 OFFSET_CHECK(struct rogue_fwif_hwrtdata, owner_geom_not_used_by_host, 272);
 OFFSET_CHECK(struct rogue_fwif_hwrtdata, geom_caches_need_zeroing, 276);
 OFFSET_CHECK(struct rogue_fwif_hwrtdata, cleanup_state, 320);
+
+/*
+ ******************************************************************************
+ * SPARSE error reasoning: SIZE_CHECK(struct rogue_fwif_hwrtdata, 384)
+ ******************************************************************************
+ *
+ * The structure rogue_fwif_hwrtdata contains different memory alignment
+ * attributes for its fields.
+ * The SIZE_CHECK will run a static_assert function over the structure to check
+ * the size. The compilation will fail if the SIZE_CHECK fails.
+ * SPARSE seems to treat the alignment attributes in a different way than the
+ * compilation does since the compilation is not failing.
+ * This SPARSE error over this line should be ignored if it pops up.
+ */
 SIZE_CHECK(struct rogue_fwif_hwrtdata, 384);
 
 OFFSET_CHECK(struct rogue_fwif_sync_checkpoint, state, 0);

---
base-commit: 217f80acfcf126b7d7d7b818c9bfea3c96fa85ec
change-id: 20250606-sprase-reasoning-comments-e48064532709

Best regards,
-- 
Alexandru Dadu <alexandru.dadu@imgtec.com>

