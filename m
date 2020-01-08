Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3440133B5D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 06:46:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56546E174;
	Wed,  8 Jan 2020 05:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD646E174
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2020 05:46:14 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0085fWK6080687;
 Wed, 8 Jan 2020 05:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=aQRbVUyJHocBW8KCphKH2dI17mFUo+d0ok0/MvtJ5kk=;
 b=E1QP2w1RGWo95dP7F3a6XHbil/PCaQO8nFFUOReHYUEnEl6bmVyMeG+ri+a4yY6yUbkm
 12ov18ogZDbiFHT5eCQ02yYtc26UaOMRe4HUX9XYXqioRpS8cCxrodJG9mLvOZoGWUFE
 tUBCDGILHD6nD/RQjEyvTqw/tv2Mwz53hwNfKT/9Qt4opcQiEYrA/pUsMz9Brj46hJ4i
 xoauRWu1qFsui0AwRQ9Uh8OB47rWb5m5ImA/JSMP5RPI6ouilEmQ2WHR0CmCIoulVGaq
 mD4sfeqDOO1sUF2FeVtpCqAWG+EgkxvTSVlb1yUfr49wfNzDVD0r5SIYWMfFkHIoO9s7 Og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2xajnq1ntw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2020 05:46:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0085flkm028345;
 Wed, 8 Jan 2020 05:46:10 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2xcpcrw745-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2020 05:46:10 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0085k8cf020709;
 Wed, 8 Jan 2020 05:46:08 GMT
Received: from kili.mountain (/129.205.23.165)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 07 Jan 2020 21:46:08 -0800
Date: Wed, 8 Jan 2020 08:46:01 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH] nouveau/secboot/gm20b: initialize pointer in
 gm20b_secboot_new()
Message-ID: <20200108054601.mdwwtcqqpge2iwca@kili.mountain>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We accidentally set "psb" which is a no-op instead of "*psb" so it
generates a static checker warning.  We should probably set it before
the first error return so that it's always initialized.

Fixes: 923f1bd27bf1 ("drm/nouveau/secboot/gm20b: add secure boot support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static analysis.  I'm not sure how this is called.

 drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
index df8b919dcf09..ace6fefba428 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/secboot/gm20b.c
@@ -108,6 +108,7 @@ gm20b_secboot_new(struct nvkm_device *device, int index,
 	struct gm200_secboot *gsb;
 	struct nvkm_acr *acr;
 
+	*psb = NULL;
 	acr = acr_r352_new(BIT(NVKM_SECBOOT_FALCON_FECS) |
 			   BIT(NVKM_SECBOOT_FALCON_PMU));
 	if (IS_ERR(acr))
@@ -116,10 +117,8 @@ gm20b_secboot_new(struct nvkm_device *device, int index,
 	acr->optional_falcons = BIT(NVKM_SECBOOT_FALCON_PMU);
 
 	gsb = kzalloc(sizeof(*gsb), GFP_KERNEL);
-	if (!gsb) {
-		psb = NULL;
+	if (!gsb)
 		return -ENOMEM;
-	}
 	*psb = &gsb->base;
 
 	ret = nvkm_secboot_ctor(&gm20b_secboot, acr, device, index, &gsb->base);
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
