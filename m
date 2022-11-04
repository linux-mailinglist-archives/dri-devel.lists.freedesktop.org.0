Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EA8619966
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF5E310E819;
	Fri,  4 Nov 2022 14:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 215C210E805;
 Fri,  4 Nov 2022 14:20:20 +0000 (UTC)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4CaCNe006683;
 Fri, 4 Nov 2022 14:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ulrsYxYJ62Hx63SnXB24yyjgpmWpnFIPDdKJM44I2xU=;
 b=Sv082weOl/ZTae1Ypl5wQPmFhKrzVjT8nj5LRww5OpcpWKf5abdQsmU9Adx4yjwZ1S7H
 ITV4+qUisbJy4HsG8yfc+YiwmE8ab+WOOMYeaJ61jm0OrddhSe2o0TmD5XsnONIftLia
 KXHDdOPdqxxuMndGR0MQjQbYl1jJKNH7Rsoz2FrqGOcdNpGb18UhU1qnvxAGQaWE2RyF
 5XI8TZjYtX95DzDAT7BzEYtfr4N//NeghxGpbrk9Pj8I7MGORld7bJqLJZVmXuvy+Kmg
 5nDk0YxbkRmA4QuO+IkKWxa1Lp0uF3980v2zEHr6o9cnRJLkd5Bldh1cSh3yt1059Cp0 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmphfs6ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:16 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4ChrcD039562;
 Fri, 4 Nov 2022 14:20:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmphfs6wp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4E6kCp012150;
 Fri, 4 Nov 2022 14:20:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3kgut9aft5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2A4EK9Ka32047610
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Nov 2022 14:20:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 447BB4C046;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B8384C040;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id C66F1E0819; Fri,  4 Nov 2022 15:20:08 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v3 2/7] vfio/ccw: remove private->sch
Date: Fri,  4 Nov 2022 15:20:02 +0100
Message-Id: <20221104142007.1314999-3-farman@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104142007.1314999-1-farman@linux.ibm.com>
References: <20221104142007.1314999-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0Lqr_2SDXIrnQ3DeGEdkzvP4Tsn9pNSe
X-Proofpoint-ORIG-GUID: KzC5sG-oUhop_AhFUB0OILNMugRZM7Kt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_09,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040093
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

These places all rely on the ability to jump from a private
struct back to the subchannel struct. Rather than keeping a
copy in our back pocket, let's use the relationship provided
by the vfio_device embedded within the private.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 drivers/s390/cio/vfio_ccw_chp.c     |  5 +++--
 drivers/s390/cio/vfio_ccw_drv.c     |  3 +--
 drivers/s390/cio/vfio_ccw_fsm.c     | 27 ++++++++++++---------------
 drivers/s390/cio/vfio_ccw_ops.c     | 12 ++++++------
 drivers/s390/cio/vfio_ccw_private.h |  7 ++++---
 5 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_chp.c b/drivers/s390/cio/vfio_ccw_chp.c
index 13b26a1c7988..d3f3a611f95b 100644
--- a/drivers/s390/cio/vfio_ccw_chp.c
+++ b/drivers/s390/cio/vfio_ccw_chp.c
@@ -16,6 +16,7 @@ static ssize_t vfio_ccw_schib_region_read(struct vfio_ccw_private *private,
 					  char __user *buf, size_t count,
 					  loff_t *ppos)
 {
+	struct subchannel *sch = to_subchannel(private->vdev.dev->parent);
 	unsigned int i = VFIO_CCW_OFFSET_TO_INDEX(*ppos) - VFIO_CCW_NUM_REGIONS;
 	loff_t pos = *ppos & VFIO_CCW_OFFSET_MASK;
 	struct ccw_schib_region *region;
@@ -27,12 +28,12 @@ static ssize_t vfio_ccw_schib_region_read(struct vfio_ccw_private *private,
 	mutex_lock(&private->io_mutex);
 	region = private->region[i].data;
 
-	if (cio_update_schib(private->sch)) {
+	if (cio_update_schib(sch)) {
 		ret = -ENODEV;
 		goto out;
 	}
 
-	memcpy(region, &private->sch->schib, sizeof(*region));
+	memcpy(region, &sch->schib, sizeof(*region));
 
 	if (copy_to_user(buf, (void *)region + pos, count)) {
 		ret = -EFAULT;
diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 444b32047397..2c680a556383 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -160,7 +160,6 @@ static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 	if (!private)
 		return ERR_PTR(-ENOMEM);
 
-	private->sch = sch;
 	mutex_init(&private->io_mutex);
 	private->state = VFIO_CCW_STATE_STANDBY;
 	INIT_LIST_HEAD(&private->crw);
@@ -395,7 +394,7 @@ static int vfio_ccw_chp_event(struct subchannel *sch,
 	if (!private || !mask)
 		return 0;
 
-	trace_vfio_ccw_chp_event(private->sch->schid, mask, event);
+	trace_vfio_ccw_chp_event(sch->schid, mask, event);
 	VFIO_CCW_MSG_EVENT(2, "sch %x.%x.%04x: mask=0x%x event=%d\n",
 			   sch->schid.cssid,
 			   sch->schid.ssid, sch->schid.sch_no,
diff --git a/drivers/s390/cio/vfio_ccw_fsm.c b/drivers/s390/cio/vfio_ccw_fsm.c
index a59c758869f8..e67fad897af3 100644
--- a/drivers/s390/cio/vfio_ccw_fsm.c
+++ b/drivers/s390/cio/vfio_ccw_fsm.c
@@ -18,15 +18,13 @@
 
 static int fsm_io_helper(struct vfio_ccw_private *private)
 {
-	struct subchannel *sch;
+	struct subchannel *sch = to_subchannel(private->vdev.dev->parent);
 	union orb *orb;
 	int ccode;
 	__u8 lpm;
 	unsigned long flags;
 	int ret;
 
-	sch = private->sch;
-
 	spin_lock_irqsave(sch->lock, flags);
 
 	orb = cp_get_orb(&private->cp, (u32)(addr_t)sch, sch->lpm);
@@ -80,13 +78,11 @@ static int fsm_io_helper(struct vfio_ccw_private *private)
 
 static int fsm_do_halt(struct vfio_ccw_private *private)
 {
-	struct subchannel *sch;
+	struct subchannel *sch = to_subchannel(private->vdev.dev->parent);
 	unsigned long flags;
 	int ccode;
 	int ret;
 
-	sch = private->sch;
-
 	spin_lock_irqsave(sch->lock, flags);
 
 	VFIO_CCW_TRACE_EVENT(2, "haltIO");
@@ -121,13 +117,11 @@ static int fsm_do_halt(struct vfio_ccw_private *private)
 
 static int fsm_do_clear(struct vfio_ccw_private *private)
 {
-	struct subchannel *sch;
+	struct subchannel *sch = to_subchannel(private->vdev.dev->parent);
 	unsigned long flags;
 	int ccode;
 	int ret;
 
-	sch = private->sch;
-
 	spin_lock_irqsave(sch->lock, flags);
 
 	VFIO_CCW_TRACE_EVENT(2, "clearIO");
@@ -160,7 +154,7 @@ static int fsm_do_clear(struct vfio_ccw_private *private)
 static void fsm_notoper(struct vfio_ccw_private *private,
 			enum vfio_ccw_event event)
 {
-	struct subchannel *sch = private->sch;
+	struct subchannel *sch = to_subchannel(private->vdev.dev->parent);
 
 	VFIO_CCW_MSG_EVENT(2, "sch %x.%x.%04x: notoper event %x state %x\n",
 			   sch->schid.cssid,
@@ -228,7 +222,7 @@ static void fsm_async_retry(struct vfio_ccw_private *private,
 static void fsm_disabled_irq(struct vfio_ccw_private *private,
 			     enum vfio_ccw_event event)
 {
-	struct subchannel *sch = private->sch;
+	struct subchannel *sch = to_subchannel(private->vdev.dev->parent);
 
 	/*
 	 * An interrupt in a disabled state means a previous disable was not
@@ -238,7 +232,9 @@ static void fsm_disabled_irq(struct vfio_ccw_private *private,
 }
 inline struct subchannel_id get_schid(struct vfio_ccw_private *p)
 {
-	return p->sch->schid;
+	struct subchannel *sch = to_subchannel(p->vdev.dev->parent);
+
+	return sch->schid;
 }
 
 /*
@@ -360,10 +356,11 @@ static void fsm_async_request(struct vfio_ccw_private *private,
 static void fsm_irq(struct vfio_ccw_private *private,
 		    enum vfio_ccw_event event)
 {
+	struct subchannel *sch = to_subchannel(private->vdev.dev->parent);
 	struct irb *irb = this_cpu_ptr(&cio_irb);
 
 	VFIO_CCW_TRACE_EVENT(6, "IRQ");
-	VFIO_CCW_TRACE_EVENT(6, dev_name(&private->sch->dev));
+	VFIO_CCW_TRACE_EVENT(6, dev_name(&sch->dev));
 
 	memcpy(&private->irb, irb, sizeof(*irb));
 
@@ -376,7 +373,7 @@ static void fsm_irq(struct vfio_ccw_private *private,
 static void fsm_open(struct vfio_ccw_private *private,
 		     enum vfio_ccw_event event)
 {
-	struct subchannel *sch = private->sch;
+	struct subchannel *sch = to_subchannel(private->vdev.dev->parent);
 	int ret;
 
 	spin_lock_irq(sch->lock);
@@ -397,7 +394,7 @@ static void fsm_open(struct vfio_ccw_private *private,
 static void fsm_close(struct vfio_ccw_private *private,
 		      enum vfio_ccw_event event)
 {
-	struct subchannel *sch = private->sch;
+	struct subchannel *sch = to_subchannel(private->vdev.dev->parent);
 	int ret;
 
 	spin_lock_irq(sch->lock);
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index dc084883d872..79c50cb7dcb8 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -68,9 +68,9 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 		return ret;
 
 	VFIO_CCW_MSG_EVENT(2, "sch %x.%x.%04x: create\n",
-			   private->sch->schid.cssid,
-			   private->sch->schid.ssid,
-			   private->sch->schid.sch_no);
+			   sch->schid.cssid,
+			   sch->schid.ssid,
+			   sch->schid.sch_no);
 
 	ret = vfio_register_emulated_iommu_dev(&private->vdev);
 	if (ret)
@@ -107,9 +107,9 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
 
 	VFIO_CCW_MSG_EVENT(2, "sch %x.%x.%04x: remove\n",
-			   private->sch->schid.cssid,
-			   private->sch->schid.ssid,
-			   private->sch->schid.sch_no);
+			   sch->schid.cssid,
+			   sch->schid.ssid,
+			   sch->schid.sch_no);
 
 	vfio_unregister_group_dev(&private->vdev);
 
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index 1f598d58d969..b28af2f63963 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -85,7 +85,6 @@ struct vfio_ccw_parent {
 /**
  * struct vfio_ccw_private
  * @vdev: Embedded VFIO device
- * @sch: pointer to the subchannel
  * @state: internal state of the device
  * @completion: synchronization helper of the I/O completion
  * @io_region: MMIO region to input/output I/O arguments/results
@@ -107,7 +106,6 @@ struct vfio_ccw_parent {
  */
 struct vfio_ccw_private {
 	struct vfio_device vdev;
-	struct subchannel	*sch;
 	int			state;
 	struct completion	*completion;
 	struct ccw_io_region	*io_region;
@@ -172,7 +170,10 @@ extern fsm_func_t *vfio_ccw_jumptable[NR_VFIO_CCW_STATES][NR_VFIO_CCW_EVENTS];
 static inline void vfio_ccw_fsm_event(struct vfio_ccw_private *private,
 				      enum vfio_ccw_event event)
 {
-	trace_vfio_ccw_fsm_event(private->sch->schid, private->state, event);
+	struct subchannel *sch = to_subchannel(private->vdev.dev->parent);
+
+	if (sch)
+		trace_vfio_ccw_fsm_event(sch->schid, private->state, event);
 	vfio_ccw_jumptable[private->state][event](private, event);
 }
 
-- 
2.34.1

