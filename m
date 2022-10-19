Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDA7604D2D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B63D10EB16;
	Wed, 19 Oct 2022 16:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E50710E810;
 Wed, 19 Oct 2022 16:21:48 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JGC8VJ014957;
 Wed, 19 Oct 2022 16:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eMozdXaZXYQ37LuqRoXbJc5/QDGJq45946BtdJ8p0cY=;
 b=bCrWj8flsRQnA45Hglt1uY37pNa4fgeeDYoITglQPXfP6JT3CCXja9LqJZRLgc+LWdxj
 GGw0qW+bfqrOyf6HwVLHYeQr/f8ohaF6z3SlViOr9aR7hnDYCf1q/Da0Y3FCKlqmt9fJ
 IugR+76Q4IANLKn9JGhk+mR8ehIO/6VMzhwa04AzBAYN8uJuqg19WyBotfzAMkFw0msc
 c6NHivwLgnOa4oUrR5Gmj1SIjIntXKirb9giyvrdGbwkf56sjbg+WrexYFnzUpjqghuv
 a4Vz4a+lvMrbEuLmUhwE5SzctVipKsaOYF3k7RiEu4U5JT2BWUbAYLR/bvhLbTaQrNyD Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kamhx0b81-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:45 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JGCFL5016709;
 Wed, 19 Oct 2022 16:21:44 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kamhx0b6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:44 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JGKLot010026;
 Wed, 19 Oct 2022 16:21:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3k99fn33u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29JGLcGs31982240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Oct 2022 16:21:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3835D4C050;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 142D04C046;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id C60DAE1428; Wed, 19 Oct 2022 18:21:37 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v1 1/7] vfio/ccw: create a parent struct
Date: Wed, 19 Oct 2022 18:21:29 +0200
Message-Id: <20221019162135.798901-2-farman@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162135.798901-1-farman@linux.ibm.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xdUVnKlaSZKDPBgZKZOKF8S5108RcOnD
X-Proofpoint-GUID: w8Trvg-ZShCuD7vL0VvUowAacLNVe1HS
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

Move the stuff associated with the mdev parent (and thus the
subchannel struct) into its own struct, and leave the rest in
the existing private structure.

The subchannel will point to the parent, and the parent will point
to the private, for the areas where one or both are needed. Further
separation of these structs will follow.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 drivers/s390/cio/vfio_ccw_drv.c     | 104 ++++++++++++++++++++--------
 drivers/s390/cio/vfio_ccw_ops.c     |   9 ++-
 drivers/s390/cio/vfio_ccw_parent.h  |  28 ++++++++
 drivers/s390/cio/vfio_ccw_private.h |   5 --
 4 files changed, 112 insertions(+), 34 deletions(-)
 create mode 100644 drivers/s390/cio/vfio_ccw_parent.h

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 7f5402fe857a..634760ca0dea 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -20,6 +20,7 @@
 #include "chp.h"
 #include "ioasm.h"
 #include "css.h"
+#include "vfio_ccw_parent.h"
 #include "vfio_ccw_private.h"
 
 struct workqueue_struct *vfio_ccw_work_q;
@@ -36,7 +37,8 @@ debug_info_t *vfio_ccw_debug_trace_id;
  */
 int vfio_ccw_sch_quiesce(struct subchannel *sch)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
 	DECLARE_COMPLETION_ONSTACK(completion);
 	int iretry, ret = 0;
 
@@ -51,19 +53,21 @@ int vfio_ccw_sch_quiesce(struct subchannel *sch)
 			break;
 		}
 
-		/*
-		 * Flush all I/O and wait for
-		 * cancel/halt/clear completion.
-		 */
-		private->completion = &completion;
-		spin_unlock_irq(sch->lock);
+		if (private) {
+			/*
+			 * Flush all I/O and wait for
+			 * cancel/halt/clear completion.
+			 */
+			private->completion = &completion;
+			spin_unlock_irq(sch->lock);
 
-		if (ret == -EBUSY)
-			wait_for_completion_timeout(&completion, 3*HZ);
+			if (ret == -EBUSY)
+				wait_for_completion_timeout(&completion, 3*HZ);
 
-		private->completion = NULL;
-		flush_workqueue(vfio_ccw_work_q);
-		spin_lock_irq(sch->lock);
+			private->completion = NULL;
+			flush_workqueue(vfio_ccw_work_q);
+			spin_lock_irq(sch->lock);
+		}
 		ret = cio_disable_subchannel(sch);
 	} while (ret == -EBUSY);
 
@@ -121,7 +125,22 @@ static void vfio_ccw_crw_todo(struct work_struct *work)
  */
 static void vfio_ccw_sch_irq(struct subchannel *sch)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
+
+	/*
+	 * The subchannel should still be disabled at this point,
+	 * so an interrupt would be quite surprising. As with an
+	 * interrupt while the FSM is closed, let's attempt to
+	 * disable the subchannel again.
+	 */
+	if (!private) {
+		VFIO_CCW_MSG_EVENT(2, "sch %x.%x.%04x: unexpected interrupt\n",
+			sch->schid.cssid, sch->schid.ssid, sch->schid.sch_no);
+
+		cio_disable_subchannel(sch);
+		return;
+	}
 
 	inc_irq_stat(IRQIO_CIO);
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
@@ -201,10 +220,19 @@ static void vfio_ccw_free_private(struct vfio_ccw_private *private)
 	mutex_destroy(&private->io_mutex);
 	kfree(private);
 }
+
+static void vfio_ccw_free_parent(struct device *dev)
+{
+	struct vfio_ccw_parent *parent = container_of(dev, struct vfio_ccw_parent, dev);
+
+	kfree(parent);
+}
+
 static int vfio_ccw_sch_probe(struct subchannel *sch)
 {
 	struct pmcw *pmcw = &sch->schib.pmcw;
 	struct vfio_ccw_private *private;
+	struct vfio_ccw_parent *parent;
 	int ret = -ENOMEM;
 
 	if (pmcw->qf) {
@@ -213,18 +241,28 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 		return -ENODEV;
 	}
 
+	parent = kzalloc(sizeof(*parent), GFP_KERNEL);
+	if (IS_ERR(parent))
+		return PTR_ERR(parent);
+
+	parent->dev.release = &vfio_ccw_free_parent;
+	device_initialize(&parent->dev);
+
 	private = vfio_ccw_alloc_private(sch);
-	if (IS_ERR(private))
+	if (IS_ERR(private)) {
+		put_device(&parent->dev);
 		return PTR_ERR(private);
+	}
 
-	dev_set_drvdata(&sch->dev, private);
+	dev_set_drvdata(&sch->dev, parent);
+	dev_set_drvdata(&parent->dev, private);
 
-	private->mdev_type.sysfs_name = "io";
-	private->mdev_type.pretty_name = "I/O subchannel (Non-QDIO)";
-	private->mdev_types[0] = &private->mdev_type;
-	ret = mdev_register_parent(&private->parent, &sch->dev,
+	parent->mdev_type.sysfs_name = "io";
+	parent->mdev_type.pretty_name = "I/O subchannel (Non-QDIO)";
+	parent->mdev_types[0] = &parent->mdev_type;
+	ret = mdev_register_parent(&parent->parent, &sch->dev,
 				   &vfio_ccw_mdev_driver,
-				   private->mdev_types, 1);
+				   parent->mdev_types, 1);
 	if (ret)
 		goto out_free;
 
@@ -234,20 +272,24 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 	return 0;
 
 out_free:
+	dev_set_drvdata(&parent->dev, NULL);
 	dev_set_drvdata(&sch->dev, NULL);
 	vfio_ccw_free_private(private);
+	put_device(&parent->dev);
 	return ret;
 }
 
 static void vfio_ccw_sch_remove(struct subchannel *sch)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
 
-	mdev_unregister_parent(&private->parent);
+	mdev_unregister_parent(&parent->parent);
 
 	dev_set_drvdata(&sch->dev, NULL);
 
 	vfio_ccw_free_private(private);
+	put_device(&parent->dev);
 
 	VFIO_CCW_MSG_EVENT(4, "unbound from subchannel %x.%x.%04x\n",
 			   sch->schid.cssid, sch->schid.ssid,
@@ -256,7 +298,11 @@ static void vfio_ccw_sch_remove(struct subchannel *sch)
 
 static void vfio_ccw_sch_shutdown(struct subchannel *sch)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
+
+	if (WARN_ON(!private))
+		return;
 
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_CLOSE);
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_NOT_OPER);
@@ -274,7 +320,8 @@ static void vfio_ccw_sch_shutdown(struct subchannel *sch)
  */
 static int vfio_ccw_sch_event(struct subchannel *sch, int process)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
 	unsigned long flags;
 	int rc = -EAGAIN;
 
@@ -287,8 +334,10 @@ static int vfio_ccw_sch_event(struct subchannel *sch, int process)
 
 	rc = 0;
 
-	if (cio_update_schib(sch))
-		vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_NOT_OPER);
+	if (cio_update_schib(sch)) {
+		if (private)
+			vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_NOT_OPER);
+	}
 
 out_unlock:
 	spin_unlock_irqrestore(sch->lock, flags);
@@ -326,7 +375,8 @@ static void vfio_ccw_queue_crw(struct vfio_ccw_private *private,
 static int vfio_ccw_chp_event(struct subchannel *sch,
 			      struct chp_link *link, int event)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
 	int mask = chp_ssd_get_mask(&sch->ssd_info, link);
 	int retry = 255;
 
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 6ae4d012d800..b1cd89d900ab 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -14,6 +14,7 @@
 #include <linux/nospec.h>
 #include <linux/slab.h>
 
+#include "vfio_ccw_parent.h"
 #include "vfio_ccw_private.h"
 
 static const struct vfio_device_ops vfio_ccw_dev_ops;
@@ -55,7 +56,9 @@ static int vfio_ccw_mdev_init_dev(struct vfio_device *vdev)
 
 static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(mdev->dev.parent);
+	struct subchannel *sch = to_subchannel(mdev->dev.parent);
+	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
 	int ret;
 
 	if (private->state == VFIO_CCW_STATE_NOT_OPER)
@@ -100,7 +103,9 @@ static void vfio_ccw_mdev_release_dev(struct vfio_device *vdev)
 
 static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 {
-	struct vfio_ccw_private *private = dev_get_drvdata(mdev->dev.parent);
+	struct subchannel *sch = to_subchannel(mdev->dev.parent);
+	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
+	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
 
 	VFIO_CCW_MSG_EVENT(2, "sch %x.%x.%04x: remove\n",
 			   private->sch->schid.cssid,
diff --git a/drivers/s390/cio/vfio_ccw_parent.h b/drivers/s390/cio/vfio_ccw_parent.h
new file mode 100644
index 000000000000..834c00077802
--- /dev/null
+++ b/drivers/s390/cio/vfio_ccw_parent.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * MDEV Parent contents for vfio_ccw driver
+ *
+ * Copyright IBM Corp. 2022
+ */
+
+#ifndef _VFIO_CCW_PARENT_H_
+#define _VFIO_CCW_PARENT_H_
+
+#include <linux/mdev.h>
+
+/**
+ * struct vfio_ccw_parent
+ *
+ * @dev: embedded device struct
+ * @parent: parent data structures for mdevs created
+ * @mdev_type(s): identifying information for mdevs created
+ */
+struct vfio_ccw_parent {
+	struct device		dev;
+
+	struct mdev_parent	parent;
+	struct mdev_type	mdev_type;
+	struct mdev_type	*mdev_types[1];
+};
+
+#endif
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index bd5fb81456af..673e9a81a172 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -89,7 +89,6 @@ struct vfio_ccw_crw {
  * @io_work: work for deferral process of I/O handling
  * @crw_work: work for deferral process of CRW handling
  * @release_comp: synchronization helper for vfio device release
- * @parent: parent data structures for mdevs created
  */
 struct vfio_ccw_private {
 	struct vfio_device vdev;
@@ -116,10 +115,6 @@ struct vfio_ccw_private {
 	struct work_struct	crw_work;
 
 	struct completion	release_comp;
-
-	struct mdev_parent	parent;
-	struct mdev_type	mdev_type;
-	struct mdev_type	*mdev_types[1];
 } __aligned(8);
 
 int vfio_ccw_sch_quiesce(struct subchannel *sch);
-- 
2.34.1

