Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E75FF35ECA6
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 07:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB6BA6E43A;
	Wed, 14 Apr 2021 05:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE676E218;
 Wed, 14 Apr 2021 05:59:13 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13E5sZO3183693;
 Wed, 14 Apr 2021 05:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=nragDxkL+n3arrnBcqMCcgezVhn22p05/qXSY+dDHAc=;
 b=MBjdrVMpZEUvCOB+anC7A4qBlHIydqEtWdTkr66BpmepbX2SqcGdq6A21tD7QysjAm3f
 kx4Hg9Gvki6VE6JaobGb4UdsLBi1osBaq9lj89ToWjH6tbGMIzViGK1Dr08bQVrbSRL0
 q611GbvJgJ6gZ+piqdqSnV/sCekx29Ab9oBQvByv8CLVQ0NvkL1zkDdnCHTDe8PPYyIn
 MGg57OZY1A5qxyl/6AXqmRv33FSdh+DeK9O4XIyWSW2mdCgDRaoSKE1BEaUs+XnuWYvS
 sipyhwi0/bEfvsS+XuiVvxOaMbdNld4Z4X2bfWYHpS234DEIzNPCOHNh7xYFVa1h/fTD zQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 37u3erh638-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 05:59:08 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13E5uVMH077626;
 Wed, 14 Apr 2021 05:59:06 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 37unkqj7tc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 05:59:06 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13E5x2rD014804;
 Wed, 14 Apr 2021 05:59:02 GMT
Received: from mwanda (/10.175.166.128)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 13 Apr 2021 22:59:02 -0700
Date: Wed, 14 Apr 2021 08:58:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v2] drm/amdgpu: fix an error code in
 init_pmu_entry_by_type_and_add()
Message-ID: <YHaEn8h5JP9CGMee@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 adultscore=0 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140041
X-Proofpoint-ORIG-GUID: yGt6P0BWxuC-YKI_dr6vTyPv7MwbZ-MX
X-Proofpoint-GUID: yGt6P0BWxuC-YKI_dr6vTyPv7MwbZ-MX
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 clxscore=1011
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140041
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
Cc: Jonathan Kim <jonathan.kim@amd.com>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org,
 Harish Kasiviswanathan <harish.kasiviswanathan@amd.com>,
 amd-gfx@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the kmemdup() fails then this should return a negative error code
but it currently returns success

Fixes: b4a7db71ea06 ("drm/amdgpu: add per device user friendly xgmi events for vega20")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: I sent this patch in Feb but I accidentally added an unrelated
hunk from nouveau to the commit.  Now both hunks are have been sent to
the correct lists.

 drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
index 19c0a3655228..82e9ecf84352 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c
@@ -519,8 +519,10 @@ static int init_pmu_entry_by_type_and_add(struct amdgpu_pmu_entry *pmu_entry,
 	pmu_entry->pmu.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
 								GFP_KERNEL);
 
-	if (!pmu_entry->pmu.attr_groups)
+	if (!pmu_entry->pmu.attr_groups) {
+		ret = -ENOMEM;
 		goto err_attr_group;
+	}
 
 	snprintf(pmu_name, PMU_NAME_SIZE, "%s_%d", pmu_entry->pmu_file_prefix,
 				adev_to_drm(pmu_entry->adev)->primary->index);
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
