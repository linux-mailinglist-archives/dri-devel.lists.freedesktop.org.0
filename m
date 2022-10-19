Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 789AE604D43
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDD310EB19;
	Wed, 19 Oct 2022 16:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E4410E9DC;
 Wed, 19 Oct 2022 16:21:52 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JGC6HC014621;
 Wed, 19 Oct 2022 16:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TXLZAQtJsJggPkIDpdYGEE9we8Oz6PH+Z15itzJhP00=;
 b=VlR7JLXAYey+AuQEQso4SYmoKZ+WM8FPU62L3wSyzHy7TdRO5brvwtOv0C14sdvCy/OE
 vlVTXVnFWi/+Ro5aHU6hZaK5Hig1CwzsQixCYItuHEK6gpn4uTHcPCOBdpytJGg9NPnM
 qHbq0HjV3YaRBXkWbXMhg/bHC8JRJWNQS8kt+GdIsQxvhIYhZ7rXY+o54SPYHyUslYjh
 4W1R8ZMWpcYSjSwMR7bbXTKTkz2r9RHxKvQRTYqEnFQJuYwfFHTiBmJc7qksg9USak26
 rNgi3oKbK7YKYVKV90qpjWoYrliP8/5oFQiqBWh133EJknX9zt4gWemVAKTiw/dd5vhI Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kamhx0bar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:49 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JGCDx2016440;
 Wed, 19 Oct 2022 16:21:48 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kamhx0b6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:48 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JGKLQJ016286;
 Wed, 19 Oct 2022 16:21:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3k7mg9dk0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29JGLc7b918040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Oct 2022 16:21:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41E794C058;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 199164C04A;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id CE6D5E14BB; Wed, 19 Oct 2022 18:21:37 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v1 3/7] vfio/ccw: move private initialization to callback
Date: Wed, 19 Oct 2022 18:21:31 +0200
Message-Id: <20221019162135.798901-4-farman@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162135.798901-1-farman@linux.ibm.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OH12thvtw1vhpW2BSLrClRqJ6DsMFAxz
X-Proofpoint-GUID: diAw04pVHcYXDJoTM_Os6kNe0eVcds5s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_09,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210190091
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
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's already a device initialization callback that is
used to initialize the release completion workaround.

Move the other elements of the vfio_ccw_private struct that
require distinct initialization over to that routine.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 drivers/s390/cio/vfio_ccw_drv.c     | 57 +++--------------------------
 drivers/s390/cio/vfio_ccw_ops.c     | 43 ++++++++++++++++++++++
 drivers/s390/cio/vfio_ccw_private.h |  7 +++-
 3 files changed, 55 insertions(+), 52 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 4ee953c8ae39..cc9ed2fd970f 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -24,10 +24,10 @@
 #include "vfio_ccw_private.h"
 
 struct workqueue_struct *vfio_ccw_work_q;
-static struct kmem_cache *vfio_ccw_io_region;
-static struct kmem_cache *vfio_ccw_cmd_region;
-static struct kmem_cache *vfio_ccw_schib_region;
-static struct kmem_cache *vfio_ccw_crw_region;
+struct kmem_cache *vfio_ccw_io_region;
+struct kmem_cache *vfio_ccw_cmd_region;
+struct kmem_cache *vfio_ccw_schib_region;
+struct kmem_cache *vfio_ccw_crw_region;
 
 debug_info_t *vfio_ccw_debug_msg_id;
 debug_info_t *vfio_ccw_debug_trace_id;
@@ -74,7 +74,7 @@ int vfio_ccw_sch_quiesce(struct subchannel *sch)
 	return ret;
 }
 
-static void vfio_ccw_sch_io_todo(struct work_struct *work)
+void vfio_ccw_sch_io_todo(struct work_struct *work)
 {
 	struct vfio_ccw_private *private;
 	struct irb *irb;
@@ -110,7 +110,7 @@ static void vfio_ccw_sch_io_todo(struct work_struct *work)
 		eventfd_signal(private->io_trigger, 1);
 }
 
-static void vfio_ccw_crw_todo(struct work_struct *work)
+void vfio_ccw_crw_todo(struct work_struct *work)
 {
 	struct vfio_ccw_private *private;
 
@@ -154,52 +154,7 @@ static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 	if (!private)
 		return ERR_PTR(-ENOMEM);
 
-	mutex_init(&private->io_mutex);
-	private->state = VFIO_CCW_STATE_STANDBY;
-	INIT_LIST_HEAD(&private->crw);
-	INIT_WORK(&private->io_work, vfio_ccw_sch_io_todo);
-	INIT_WORK(&private->crw_work, vfio_ccw_crw_todo);
-
-	private->cp.guest_cp = kcalloc(CCWCHAIN_LEN_MAX, sizeof(struct ccw1),
-				       GFP_KERNEL);
-	if (!private->cp.guest_cp)
-		goto out_free_private;
-
-	private->io_region = kmem_cache_zalloc(vfio_ccw_io_region,
-					       GFP_KERNEL | GFP_DMA);
-	if (!private->io_region)
-		goto out_free_cp;
-
-	private->cmd_region = kmem_cache_zalloc(vfio_ccw_cmd_region,
-						GFP_KERNEL | GFP_DMA);
-	if (!private->cmd_region)
-		goto out_free_io;
-
-	private->schib_region = kmem_cache_zalloc(vfio_ccw_schib_region,
-						  GFP_KERNEL | GFP_DMA);
-
-	if (!private->schib_region)
-		goto out_free_cmd;
-
-	private->crw_region = kmem_cache_zalloc(vfio_ccw_crw_region,
-						GFP_KERNEL | GFP_DMA);
-
-	if (!private->crw_region)
-		goto out_free_schib;
 	return private;
-
-out_free_schib:
-	kmem_cache_free(vfio_ccw_schib_region, private->schib_region);
-out_free_cmd:
-	kmem_cache_free(vfio_ccw_cmd_region, private->cmd_region);
-out_free_io:
-	kmem_cache_free(vfio_ccw_io_region, private->io_region);
-out_free_cp:
-	kfree(private->cp.guest_cp);
-out_free_private:
-	mutex_destroy(&private->io_mutex);
-	kfree(private);
-	return ERR_PTR(-ENOMEM);
 }
 
 static void vfio_ccw_free_private(struct vfio_ccw_private *private)
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index cf383c729d53..626b8eb3507b 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -50,8 +50,51 @@ static int vfio_ccw_mdev_init_dev(struct vfio_device *vdev)
 	struct vfio_ccw_private *private =
 		container_of(vdev, struct vfio_ccw_private, vdev);
 
+	mutex_init(&private->io_mutex);
+	private->state = VFIO_CCW_STATE_STANDBY;
+	INIT_LIST_HEAD(&private->crw);
+	INIT_WORK(&private->io_work, vfio_ccw_sch_io_todo);
+	INIT_WORK(&private->crw_work, vfio_ccw_crw_todo);
 	init_completion(&private->release_comp);
+
+	private->cp.guest_cp = kcalloc(CCWCHAIN_LEN_MAX, sizeof(struct ccw1),
+				       GFP_KERNEL);
+	if (!private->cp.guest_cp)
+		goto out_free_private;
+
+	private->io_region = kmem_cache_zalloc(vfio_ccw_io_region,
+					       GFP_KERNEL | GFP_DMA);
+	if (!private->io_region)
+		goto out_free_cp;
+
+	private->cmd_region = kmem_cache_zalloc(vfio_ccw_cmd_region,
+						GFP_KERNEL | GFP_DMA);
+	if (!private->cmd_region)
+		goto out_free_io;
+
+	private->schib_region = kmem_cache_zalloc(vfio_ccw_schib_region,
+						  GFP_KERNEL | GFP_DMA);
+	if (!private->schib_region)
+		goto out_free_cmd;
+
+	private->crw_region = kmem_cache_zalloc(vfio_ccw_crw_region,
+						GFP_KERNEL | GFP_DMA);
+	if (!private->crw_region)
+		goto out_free_schib;
+
 	return 0;
+
+out_free_schib:
+	kmem_cache_free(vfio_ccw_schib_region, private->schib_region);
+out_free_cmd:
+	kmem_cache_free(vfio_ccw_cmd_region, private->cmd_region);
+out_free_io:
+	kmem_cache_free(vfio_ccw_io_region, private->io_region);
+out_free_cp:
+	kfree(private->cp.guest_cp);
+out_free_private:
+	mutex_destroy(&private->io_mutex);
+	return -ENOMEM;
 }
 
 static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index 0fdff1435230..b35940057073 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -116,6 +116,8 @@ struct vfio_ccw_private {
 } __aligned(8);
 
 int vfio_ccw_sch_quiesce(struct subchannel *sch);
+void vfio_ccw_sch_io_todo(struct work_struct *work);
+void vfio_ccw_crw_todo(struct work_struct *work);
 
 extern struct mdev_driver vfio_ccw_mdev_driver;
 
@@ -163,7 +165,10 @@ static inline void vfio_ccw_fsm_event(struct vfio_ccw_private *private,
 }
 
 extern struct workqueue_struct *vfio_ccw_work_q;
-
+extern struct kmem_cache *vfio_ccw_io_region;
+extern struct kmem_cache *vfio_ccw_cmd_region;
+extern struct kmem_cache *vfio_ccw_schib_region;
+extern struct kmem_cache *vfio_ccw_crw_region;
 
 /* s390 debug feature, similar to base cio */
 extern debug_info_t *vfio_ccw_debug_msg_id;
-- 
2.34.1

