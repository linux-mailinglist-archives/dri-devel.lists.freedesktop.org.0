Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9C7133B58
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 06:44:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F6C6E162;
	Wed,  8 Jan 2020 05:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3961D6E162
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 05:44:30 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0085fBew080372;
 Wed, 8 Jan 2020 05:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=fQvaSbxjv3B4Uu+gf4vi37edoryqtn45+PvaJx7aqlo=;
 b=poBe3DQqE/5V+skpc+pXrbiQl/cOdKo6GM9f18X6H41nuX14cG+JsSPVhkLGc0Qj0wVd
 nAit4L2UZdj/VdOaS4nR07VqyaFNc9GfhF1K4rtCAxTUiFKRERHql/2H8XLfMTyqA+xE
 9h8mhlJd7OVaphPfeyAPODuwb35boJnwgmBkuXRQf+J/xO1e/G83XQ0PsyNaRq9Q0Ja0
 +Uxp0AjJQtoDfw4HqTcQeo+0YuxY8fwRYeEcccWeGbVxmyofoMeCNIIjJ08Yr6WXM0nV
 PfV5fC6VCdlEKEyInccgJlYZN6YZk7zAdYwRMpmJzC61Q1dp5FbqjFtmByeP5j3N/xyR /A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2xajnq1nmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2020 05:43:25 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0085f0Ln005750;
 Wed, 8 Jan 2020 05:43:25 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2xcqbk9udw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2020 05:43:25 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0085hLXi019464;
 Wed, 8 Jan 2020 05:43:21 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 07 Jan 2020 21:43:20 -0800
Date: Wed, 8 Jan 2020 08:43:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH] gpu/drm: clean up white space in
 drm_legacy_lock_master_cleanup()
Message-ID: <20200108054312.yzlj5wmbdktejgob@kili.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001080049
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9493
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001080049
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
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We moved this code to a different file and accidentally deleted a
newline.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/drm_lock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_lock.c b/drivers/gpu/drm/drm_lock.c
index 2e8ce99d0baa..2c79e8199e3c 100644
--- a/drivers/gpu/drm/drm_lock.c
+++ b/drivers/gpu/drm/drm_lock.c
@@ -360,7 +360,8 @@ void drm_legacy_lock_master_cleanup(struct drm_device *dev, struct drm_master *m
 	/*
 	 * Since the master is disappearing, so is the
 	 * possibility to lock.
-	 */	mutex_lock(&dev->struct_mutex);
+	 */
+	mutex_lock(&dev->struct_mutex);
 	if (master->lock.hw_lock) {
 		if (dev->sigdata.lock == master->lock.hw_lock)
 			dev->sigdata.lock = NULL;
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
