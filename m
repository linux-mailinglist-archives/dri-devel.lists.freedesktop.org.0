Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF43604D39
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 18:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C67710EB1B;
	Wed, 19 Oct 2022 16:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA3410EB13;
 Wed, 19 Oct 2022 16:21:49 +0000 (UTC)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29JFoqGP009277;
 Wed, 19 Oct 2022 16:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lZ+RSztjM1rjYPMrv3lUJiocL8f5xgPLl5B7XZG9OZk=;
 b=PzO1mqw6hxzih0c4UyjwNcBq+5h3mx/g1I3O+MrXyig+YMrIcrzoS57NlW5/AMZtlhrn
 9HZ1i1TvEBWWQt0+JT4aArC7eETNy7L7rGiGBiqfG+L19QLlVS9a9wrvxKp5l+AHrvBr
 tdaNMRtImZcUWwRzImTZRsNzICYN+Q3slq8LYgnj5QnEAEdzW2GId7spx75jymiFTH3C
 Ttu06G0LGS5tRINdyde5gz5kizjcuubvgRVJw1KERT10VAh/ZEghZu8gvEwHIUUubHo9
 SUBK1/epHB1YR8JizbiWtSkCHTdbjg1cf2lCdwAFtib6F5ilSAsLPY+MXd9/r+S48k53 qA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kam7ws4ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:44 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29JFqK1B013925;
 Wed, 19 Oct 2022 16:21:44 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kam7ws4f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:43 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29JGLbbf030184;
 Wed, 19 Oct 2022 16:21:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 3k7mg8wkbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Oct 2022 16:21:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29JGLc0D58327478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Oct 2022 16:21:38 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A09C11C04C;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C5D211C052;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 19 Oct 2022 16:21:38 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id D3505E15FF; Wed, 19 Oct 2022 18:21:37 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Yi Liu <yi.l.liu@intel.com>
Subject: [PATCH v1 4/7] vfio/ccw: move private to mdev lifecycle
Date: Wed, 19 Oct 2022 18:21:32 +0200
Message-Id: <20221019162135.798901-5-farman@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221019162135.798901-1-farman@linux.ibm.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fV4j5174AN0KVF883tpXnbASYVoEHA2U
X-Proofpoint-GUID: 7J8XY2KG46g2BgbaEURCvBiKJpeqJtzi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-19_09,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210190091
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

Now that the mdev parent data is split out into its own struct,
it is safe to move the remaining private data to follow the
mdev probe/remove lifecycle. The mdev parent data will remain
where it is, and follow the subchannel and the css driver
interfaces.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 drivers/s390/cio/vfio_ccw_drv.c     | 17 ++---------------
 drivers/s390/cio/vfio_ccw_ops.c     | 26 +++++++++++++-------------
 drivers/s390/cio/vfio_ccw_private.h |  3 +++
 3 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_drv.c b/drivers/s390/cio/vfio_ccw_drv.c
index cc9ed2fd970f..686a9b9f6731 100644
--- a/drivers/s390/cio/vfio_ccw_drv.c
+++ b/drivers/s390/cio/vfio_ccw_drv.c
@@ -146,7 +146,7 @@ static void vfio_ccw_sch_irq(struct subchannel *sch)
 	vfio_ccw_fsm_event(private, VFIO_CCW_EVENT_INTERRUPT);
 }
 
-static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
+struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 {
 	struct vfio_ccw_private *private;
 
@@ -157,7 +157,7 @@ static struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch)
 	return private;
 }
 
-static void vfio_ccw_free_private(struct vfio_ccw_private *private)
+void vfio_ccw_free_private(struct vfio_ccw_private *private)
 {
 	struct vfio_ccw_crw *crw, *temp;
 
@@ -185,7 +185,6 @@ static void vfio_ccw_free_parent(struct device *dev)
 static int vfio_ccw_sch_probe(struct subchannel *sch)
 {
 	struct pmcw *pmcw = &sch->schib.pmcw;
-	struct vfio_ccw_private *private;
 	struct vfio_ccw_parent *parent;
 	int ret = -ENOMEM;
 
@@ -202,14 +201,7 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 	parent->dev.release = &vfio_ccw_free_parent;
 	device_initialize(&parent->dev);
 
-	private = vfio_ccw_alloc_private(sch);
-	if (IS_ERR(private)) {
-		put_device(&parent->dev);
-		return PTR_ERR(private);
-	}
-
 	dev_set_drvdata(&sch->dev, parent);
-	dev_set_drvdata(&parent->dev, private);
 
 	parent->mdev_type.sysfs_name = "io";
 	parent->mdev_type.pretty_name = "I/O subchannel (Non-QDIO)";
@@ -226,9 +218,7 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 	return 0;
 
 out_free:
-	dev_set_drvdata(&parent->dev, NULL);
 	dev_set_drvdata(&sch->dev, NULL);
-	vfio_ccw_free_private(private);
 	put_device(&parent->dev);
 	return ret;
 }
@@ -236,13 +226,10 @@ static int vfio_ccw_sch_probe(struct subchannel *sch)
 static void vfio_ccw_sch_remove(struct subchannel *sch)
 {
 	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
-	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
 
 	mdev_unregister_parent(&parent->parent);
 
 	dev_set_drvdata(&sch->dev, NULL);
-
-	vfio_ccw_free_private(private);
 	put_device(&parent->dev);
 
 	VFIO_CCW_MSG_EVENT(4, "unbound from subchannel %x.%x.%04x\n",
diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 626b8eb3507b..3e627b236241 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -101,15 +101,20 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 {
 	struct subchannel *sch = to_subchannel(mdev->dev.parent);
 	struct vfio_ccw_parent *parent = dev_get_drvdata(&sch->dev);
-	struct vfio_ccw_private *private = dev_get_drvdata(&parent->dev);
+	struct vfio_ccw_private *private;
 	int ret;
 
-	if (private->state == VFIO_CCW_STATE_NOT_OPER)
-		return -ENODEV;
+	private = vfio_ccw_alloc_private(sch);
+	if (!private)
+		return -ENOMEM;
 
 	ret = vfio_init_device(&private->vdev, &mdev->dev, &vfio_ccw_dev_ops);
-	if (ret)
+	if (ret) {
+		kfree(private);
 		return ret;
+	}
+
+	dev_set_drvdata(&parent->dev, private);
 
 	VFIO_CCW_MSG_EVENT(2, "sch %x.%x.%04x: create\n",
 			   sch->schid.cssid,
@@ -123,6 +128,7 @@ static int vfio_ccw_mdev_probe(struct mdev_device *mdev)
 	return 0;
 
 err_put_vdev:
+	dev_set_drvdata(&parent->dev, NULL);
 	vfio_put_device(&private->vdev);
 	return ret;
 }
@@ -132,15 +138,6 @@ static void vfio_ccw_mdev_release_dev(struct vfio_device *vdev)
 	struct vfio_ccw_private *private =
 		container_of(vdev, struct vfio_ccw_private, vdev);
 
-	/*
-	 * We cannot free vfio_ccw_private here because it includes
-	 * parent info which must be free'ed by css driver.
-	 *
-	 * Use a workaround by memset'ing the core device part and
-	 * then notifying the remove path that all active references
-	 * to this device have been released.
-	 */
-	memset(vdev, 0, sizeof(*vdev));
 	complete(&private->release_comp);
 }
 
@@ -157,6 +154,7 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 
 	vfio_unregister_group_dev(&private->vdev);
 
+	dev_set_drvdata(&parent->dev, NULL);
 	vfio_put_device(&private->vdev);
 	/*
 	 * Wait for all active references on mdev are released so it
@@ -167,6 +165,8 @@ static void vfio_ccw_mdev_remove(struct mdev_device *mdev)
 	 * cycle.
 	 */
 	wait_for_completion(&private->release_comp);
+
+	vfio_ccw_free_private(private);
 }
 
 static int vfio_ccw_mdev_open_device(struct vfio_device *vdev)
diff --git a/drivers/s390/cio/vfio_ccw_private.h b/drivers/s390/cio/vfio_ccw_private.h
index b35940057073..c1959b8bfe86 100644
--- a/drivers/s390/cio/vfio_ccw_private.h
+++ b/drivers/s390/cio/vfio_ccw_private.h
@@ -119,6 +119,9 @@ int vfio_ccw_sch_quiesce(struct subchannel *sch);
 void vfio_ccw_sch_io_todo(struct work_struct *work);
 void vfio_ccw_crw_todo(struct work_struct *work);
 
+struct vfio_ccw_private *vfio_ccw_alloc_private(struct subchannel *sch);
+void vfio_ccw_free_private(struct vfio_ccw_private *private);
+
 extern struct mdev_driver vfio_ccw_mdev_driver;
 
 /*
-- 
2.34.1

