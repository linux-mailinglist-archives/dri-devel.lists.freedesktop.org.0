Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A04181DEB4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Dec 2023 07:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA40810E0AD;
	Mon, 25 Dec 2023 06:52:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC5B10E0AD;
 Mon, 25 Dec 2023 06:52:32 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3BONlFCB031298; Mon, 25 Dec 2023 06:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=FQZNYX+urMxp/YMleW1fr576KolT4Mh4EiS0z2ulfVc=;
 b=Cjx4i/O3Ifu/YhhHIs/Y3taoSSIJD4ip9DOHCwQDIxUQ6dxooyGG4cipqpTJitS5SJbw
 btbEw34v56LhbvJRHBWGF7FHmJPHlpw2IhUqVCbVzeWR1VWB0Clo50Kv7fiXYCKb8URx
 T3/o8jhQp0Ti96Iz4o59DxpWRMxUhFniNjGuKT45MOJFFp2SBEWYeIUQxRlzKzpLZP6u
 uP5ffjbLnL6OPcQLQJYbgjUafsQqpbSSgrHIS44AtdWiZMeGKORkazb7nMesLSmmBiZX
 mxaNvcsev8meNV1fi9YjtVNYxSa1E/L8aFuqCrZ7YZKPRxK8eIRiocNb7tgcN44zjFyN Bw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3v5qeb22qx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Dec 2023 06:52:05 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 3BP6n5xY005487; Mon, 25 Dec 2023 06:52:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3v73a6m1bk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 25 Dec 2023 06:52:05 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BP6q4Md015576;
 Mon, 25 Dec 2023 06:52:04 GMT
Received: from localhost.localdomain (dhcp-10-175-53-209.vpn.oracle.com
 [10.175.53.209])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3v73a6m172-1; Mon, 25 Dec 2023 06:52:04 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH -next] drm/nouveau: uapi: fix kerneldoc warnings
Date: Mon, 25 Dec 2023 07:51:45 +0100
Message-Id: <20231225065145.3060754-1-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-25_03,2023-12-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312250049
X-Proofpoint-GUID: 8Qnq6aKAqnTJiQcG022k2VjpaDP0PE9u
X-Proofpoint-ORIG-GUID: 8Qnq6aKAqnTJiQcG022k2VjpaDP0PE9u
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
Cc: Jonathan Corbet <corbet@lwn.net>, Vegard Nossum <vegard.nossum@oracle.com>,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As of commit b77fdd6a48e6 ("scripts/kernel-doc: restore warning for
Excess struct/union"), we see the following warnings when running 'make
htmldocs':

  ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_OP_MAP' description in 'drm_nouveau_vm_bind_op'
  ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_OP_UNMAP' description in 'drm_nouveau_vm_bind_op'
  ./include/uapi/drm/nouveau_drm.h:292: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_SPARSE' description in 'drm_nouveau_vm_bind_op'
  ./include/uapi/drm/nouveau_drm.h:336: warning: Excess struct member 'DRM_NOUVEAU_VM_BIND_RUN_ASYNC' description in 'drm_nouveau_vm_bind'

The problem is that these values are #define constants, but had kerneldoc
comments attached to them as if they were actual struct members.

There are a number of ways we could fix this, but I chose to draw
inspiration from include/uapi/drm/i915_drm.h, which pulls them into the
corresponding kerneldoc comment for the struct member that they are
intended to be used with.

To keep the diff readable, there are a number of things I _didn't_ do in
this patch, but which we should also consider:

- This is pretty good documentation, but it ends up in gpu/driver-uapi,
  which is part of subsystem-apis/ when it really ought to display under
  userspace-api/ (the "Linux kernel user-space API guide" book of the
  documentation).

- More generally, we might want a warning if include/uapi/ files are
  kerneldoc'd outside userspace-api/.

- I'd consider it cleaner if the #defines appeared between the kerneldoc
  for the member and the member itself (which is something other DRM-
  related UAPI docs do).

- The %IDENTIFIER kerneldoc syntax is intended for "constants", and is
  more appropriate in this context than ``IDENTIFIER`` or &IDENTIFIER.
  The DRM docs aren't very consistent on this.

Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 include/uapi/drm/nouveau_drm.h | 56 ++++++++++++++++------------------
 1 file changed, 27 insertions(+), 29 deletions(-)

diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 0bade1592f34..c95ef8a4d94a 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -238,34 +238,32 @@ struct drm_nouveau_vm_init {
 struct drm_nouveau_vm_bind_op {
 	/**
 	 * @op: the operation type
+	 *
+	 * Supported values:
+	 *
+	 * %DRM_NOUVEAU_VM_BIND_OP_MAP - Map a GEM object to the GPU's VA
+	 * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be
+	 * passed to instruct the kernel to create sparse mappings for the
+	 * given range.
+	 *
+	 * %DRM_NOUVEAU_VM_BIND_OP_UNMAP - Unmap an existing mapping in the
+	 * GPU's VA space. If the region the mapping is located in is a
+	 * sparse region, new sparse mappings are created where the unmapped
+	 * (memory backed) mapping was mapped previously. To remove a sparse
+	 * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
 	 */
 	__u32 op;
-/**
- * @DRM_NOUVEAU_VM_BIND_OP_MAP:
- *
- * Map a GEM object to the GPU's VA space. Optionally, the
- * &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to instruct the kernel to
- * create sparse mappings for the given range.
- */
 #define DRM_NOUVEAU_VM_BIND_OP_MAP 0x0
-/**
- * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
- *
- * Unmap an existing mapping in the GPU's VA space. If the region the mapping
- * is located in is a sparse region, new sparse mappings are created where the
- * unmapped (memory backed) mapping was mapped previously. To remove a sparse
- * region the &DRM_NOUVEAU_VM_BIND_SPARSE must be set.
- */
 #define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x1
 	/**
 	 * @flags: the flags for a &drm_nouveau_vm_bind_op
+	 *
+	 * Supported values:
+	 *
+	 * %DRM_NOUVEAU_VM_BIND_SPARSE - Indicates that an allocated VA
+	 * space region should be sparse.
 	 */
 	__u32 flags;
-/**
- * @DRM_NOUVEAU_VM_BIND_SPARSE:
- *
- * Indicates that an allocated VA space region should be sparse.
- */
 #define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
 	/**
 	 * @handle: the handle of the DRM GEM object to map
@@ -301,17 +299,17 @@ struct drm_nouveau_vm_bind {
 	__u32 op_count;
 	/**
 	 * @flags: the flags for a &drm_nouveau_vm_bind ioctl
+	 *
+	 * Supported values:
+	 *
+	 * %DRM_NOUVEAU_VM_BIND_RUN_ASYNC - Indicates that the given VM_BIND
+	 * operation should be executed asynchronously by the kernel.
+	 *
+	 * If this flag is not supplied the kernel executes the associated
+	 * operations synchronously and doesn't accept any &drm_nouveau_sync
+	 * objects.
 	 */
 	__u32 flags;
-/**
- * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
- *
- * Indicates that the given VM_BIND operation should be executed asynchronously
- * by the kernel.
- *
- * If this flag is not supplied the kernel executes the associated operations
- * synchronously and doesn't accept any &drm_nouveau_sync objects.
- */
 #define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
 	/**
 	 * @wait_count: the number of wait &drm_nouveau_syncs
-- 
2.34.1

