Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89280619967
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3A810E80C;
	Fri,  4 Nov 2022 14:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A95E10E804;
 Fri,  4 Nov 2022 14:20:22 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4E4XWO005516;
 Fri, 4 Nov 2022 14:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=u2qa6ERpZEYGvcViUXBFQA5KzlLAnzNQ2UYyKzSxAmM=;
 b=LGmjJtceremLPyvFBfnSuS83aIGF8xLYtWobqPqVDsV+zszUZPMYlUCdUu/TKALrQsXq
 IOCJs5MOQTvOIBjJIYAtnUbLkCxzdKzLzbImSu16AOav9PWsCKKJRbwlD22Pq13ngaSJ
 F+e1W5T+ipUheTIINv/wrL9ORRjS/hXVOXIrxc/SvIRQvEy5vqMpRbEjekwiJdPPwsAM
 /8BYWY0vMCyvKfENYEIVIM9EYtB5i/BSt+oLKgccEPRk6IUTCFFuvFNGaJhA1E82ks0s
 wtnLLb9vhUjEBkMl0zyw48AGsUm3mZF4Um7iGFAgDORhMuvoK74oewHSMGAjvnryrAKr rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpjfgvms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:16 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2A4EDrGe013906;
 Fri, 4 Nov 2022 14:20:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpjfgvjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4E6ip1012139;
 Fri, 4 Nov 2022 14:20:12 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3kgut9aft6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Nov 2022 14:20:12 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2A4EKk2F38535428
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Nov 2022 14:20:46 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CC2611C04C;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70BD411C050;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Nov 2022 14:20:09 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id D8564E20F8; Fri,  4 Nov 2022 15:20:08 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v3 6/7] vfio/ccw: replace vfio_init_device with _alloc_
Date: Fri,  4 Nov 2022 15:20:06 +0100
Message-Id: <20221104142007.1314999-7-farman@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104142007.1314999-1-farman@linux.ibm.com>
References: <20221104142007.1314999-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gB75UaYicdL8zraN-qzIe1lisdC4Ou_z
X-Proofpoint-ORIG-GUID: ow7W-l35Yy4FAAoiUYL83e0J0MRoYVZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_09,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Now that we have a reasonable separation of structs that follow
the subchannel and mdev lifecycles, there's no reason we can't
call the official vfio_alloc_device routine for our private data,
and behave like everyone else.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 drivers/s390/cio/vfio_ccw_drv.c     | 18 ------------------
 drivers/s390/cio/vfio_ccw_ops.c     | 28 ++++++++++++++++++----------
 drivers/s390/cio/vfio_ccw_private.h |  2 --
 drivers/vfio/vfio_main.c            | 10 +++++-----
 include/linux/vfio.h                |  2 --
 5 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index 9fbd1b27a1ac..c2a65808605a 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -152,24 +152,6 @@ static void vfio_ccw_sch_irq(struct subchannel *sch)
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
 }
 
-void vfio_ccw_free_private(struct vfio_ccw_private *private)
-{
-	struct vfio_ccw_crw *crw, *temp;
-
-	list_for_each_entry_safe(crw, temp, &private->crw, next) {
-		list_del(&crw->next);
-		kfree(crw);
-	}
-
-	kmem_cache_free(vfio_ccw_crw_region, private->crw_region);
-	kmem_cache_free(vfio_ccw_schib_region, private->schib_region);
-	kmem_cache_free(vfio_ccw_cmd_region, private->cmd_region);
-	kmem_cache_free(vfio_ccw_io_region, private->io_region);
-	kfree(private->cp.guest_cp);
-	mutex_destroy(&private->io_mutex);
-	kfree(private);
-}
-
 static void vfio_ccw_free_parent(struct device *dev)
 {
 	struct vfio_ccw_parent *parent = container_of(dev, struct vfio_ccw_parent, dev);
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 8a929a9cf3c6..1155f8bcedd9 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -102,15 +102,10 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 	struct vfio_ccw_private *private;
 	int ret;
 
-	private = kzalloc(sizeof(*private), GFP_KERNEL);
-	if (!private)
-		return -ENOMEM;
-
-	ret = vfio_init_device(&private->vdev, &mdev->dev, &vfio_ccw_dev_ops);
-	if (ret) {
-		kfree(private);
-		return ret;
-	}
+	private = vfio_alloc_device(vfio_ccw_private, vdev, &mdev->dev,
+				    &vfio_ccw_dev_ops);
+	if (IS_ERR(private))
+		return PTR_ERR(private);
 
 	dev_set_drvdata(&parent->dev, private);
 
@@ -135,8 +130,21 @@ static void vfio_ccw_mdev_release_dev(struct vfio_device *vdev)
 {
 	struct vfio_ccw_private *private =
 		container_of(vdev, struct vfio_ccw_private, vdev);
+	struct vfio_ccw_crw *crw, *temp;
+
+	list_for_each_entry_safe(crw, temp, &private->crw, next) {
+		list_del(&crw->next);
+		kfree(crw);
+	}
+
+	kmem_cache_free(vfio_ccw_crw_region, private->crw_region);
+	kmem_cache_free(vfio_ccw_schib_region, private->schib_region);
+	kmem_cache_free(vfio_ccw_cmd_region, private->cmd_region);
+	kmem_cache_free(vfio_ccw_io_region, private->io_region);
+	kfree(private->cp.guest_cp);
+	mutex_destroy(&private->io_mutex);
 
-	vfio_ccw_free_private(private);
+	vfio_free_device(vdev);
 }
 
 static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index 2278fd38d34e..b441ae6700fd 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -131,8 +131,6 @@ int vfio_ccw_sch_quiesce(struct subchannel *sch);
 void vfio_ccw_sch_io_todo(struct work_struct *work);
 void vfio_ccw_crw_todo(struct work_struct *work);
 
-void vfio_ccw_free_private(struct vfio_ccw_private *private);
-
 extern struct mdev_driver vfio_ccw_mdev_driver;
 
 /*
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 2d168793d4e1..2901b8ad5be9 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -348,6 +348,9 @@ static void vfio_device_release(struct device *dev)
 	device->ops->release(device);
 }
 
+static int vfio_init_device(struct vfio_device *device, struct device *dev,
+			    const struct vfio_device_ops *ops);
+
 /*
  * Allocate and initialize vfio_device so it can be registered to vfio
  * core.
@@ -386,11 +389,9 @@ EXPORT_SYMBOL_GPL(_vfio_alloc_device);
 
 /*
  * Initialize a vfio_device so it can be registered to vfio core.
- *
- * Only vfio-ccw driver should call this interface.
  */
-int vfio_init_device(struct vfio_device *device, struct device *dev,
-		     const struct vfio_device_ops *ops)
+static int vfio_init_device(struct vfio_device *device, struct device *dev,
+			    const struct vfio_device_ops *ops)
 {
 	int ret;
 
@@ -422,7 +423,6 @@ int vfio_init_device(struct vfio_device *device, struct device *dev,
 	ida_free(&vfio.device_ida, device->index);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(vfio_init_device);
 
 /*
  * The helper called by driver @release callback to free the device
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index e7cebeb875dd..ba809268a48e 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -176,8 +176,6 @@ struct vfio_device *_vfio_alloc_device(size_t size, struct device *dev,
 					dev, ops),				\
 		     struct dev_struct, member)
 
-int vfio_init_device(struct vfio_device *device, struct device *dev,
-		     const struct vfio_device_ops *ops);
 void vfio_free_device(struct vfio_device *device);
 static inline void vfio_put_device(struct vfio_device *device)
 {
-- 
2.34.1

