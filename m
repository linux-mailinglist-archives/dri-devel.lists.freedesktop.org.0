Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B722B5A38
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 08:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB606E101;
	Tue, 17 Nov 2020 07:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C966E101
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 07:21:50 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH7JtFn122385;
 Tue, 17 Nov 2020 07:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=VdrreP1Tmsm8yp+qLHDO7NU7/bdM/KEQy+sX8xl6K3M=;
 b=mpVOSMig3QiAfoRW+ppd2wxxlSjdAfQbal7Jtz2rvzpaJk/7nqIbfVMQ5Ul44z/xpsKd
 st9BDjb2gqGdNe3HmcrkTK3Z2OT9wZjppDPuh4tEcyq337jkaK5LVK9WRdLJ/KWvQ+zO
 FajfXyi4DgQdDwsaNBkDY102IKKKSADgUoCObKkw68EWeuQofaAu+upBXeoiiAlDAiPQ
 tNxBKGkgXbWaVUh98tH8yehn8wtSRnsl18k1tfEiCMsdXr+UEdE91KDhDVN1A4BOwA/K
 TlzZ/mykBydd53fPa02w/djDSwFtMN+4pu95xesICsztDCr7YzaJQ2fCWb/4cbT8q8Ev Tg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34t7vn0wrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Nov 2020 07:21:46 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH7FF5x164379;
 Tue, 17 Nov 2020 07:21:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 34umcxt635-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 07:21:45 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AH7LiQk012668;
 Tue, 17 Nov 2020 07:21:44 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 16 Nov 2020 23:21:43 -0800
Date: Tue, 17 Nov 2020 10:21:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Subject: [PATCH] drm/kmb: Remove an unnecessary NULL check
Message-ID: <20201117072137.GB1111239@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170051
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170051
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Edmund Dea <edmund.j.dea@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The NULL checking isn't done consistently in this function and it leads
to a static checker warning:

    drivers/gpu/drm/kmb/kmb_drv.c:561 kmb_pm_suspend()
    error: we previously assumed 'drm' could be null (see line 559)

Fortunately "drm" cannot be NULL at this point so the check can just be
removed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 8c43b136765c..5ff392644603 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -557,7 +557,7 @@ MODULE_DEVICE_TABLE(of, kmb_of_match);
 static int __maybe_unused kmb_pm_suspend(struct device *dev)
 {
 	struct drm_device *drm = dev_get_drvdata(dev);
-	struct kmb_drm_private *kmb = drm ? to_kmb(drm) : NULL;
+	struct kmb_drm_private *kmb = to_kmb(drm);
 
 	drm_kms_helper_poll_disable(drm);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
