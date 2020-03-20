Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D06A18CEC5
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 14:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531AB6EB3A;
	Fri, 20 Mar 2020 13:24:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3336EB35;
 Fri, 20 Mar 2020 13:24:30 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02KDCwZC105650;
 Fri, 20 Mar 2020 13:24:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=u0KZuf+9m0m/E60UGkL8aJbHcpHOlb9fS0Q1zxBIOWc=;
 b=X1ySJpddyykxgSZ8hd8zg7um8DUEXyV+aD1zThMG7+Pr00hGD+8KU5fmwoJ4bP3YKI+M
 XNHaCDBbMJSJTqsOcv5UQobkSXx7Xc2vzFOiYdKUhSgZn178rV40LPts3ZAKzlsDXp5c
 9Bq0Opi8rt/ZDDAOig/C6NuUU20NYSiiQdr/lsa6KKWgs3gSXnrFo6O+MBxovZEi+wgw
 zf+SBsWdGZN2EbWX6769wZUtZkNocPHDLMaR4nyOpcHbKgH/fLLSSDoAq9p9r+2s+iL0
 qzei2znYgzpXwaA9vasWt4XFUwU5KS/k2eWjAis53/WYuGEw7sy6h77bzmqXEKoTepRP mw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2yrpprnptu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 13:24:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02KDL1sg088210;
 Fri, 20 Mar 2020 13:24:24 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2ys8ty373j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 Mar 2020 13:24:24 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 02KDOMRP023535;
 Fri, 20 Mar 2020 13:24:22 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 20 Mar 2020 06:24:21 -0700
Date: Fri, 20 Mar 2020 16:24:11 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>, Monk Liu <Monk.Liu@amd.com>
Subject: [PATCH net-next] drm/amdgpu: Uninitialized variable in
 gfx_v9_0_rlcg_wreg()
Message-ID: <20200320132411.GD95012@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9565
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003200057
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9565
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003200057
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
Cc: Emily Deng <Emily.Deng@amd.com>, David Airlie <airlied@linux.ie>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Le Ma <le.ma@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Zhou pengju <pengju.zhou@amd.com>, James Zhu <James.Zhu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "shadow" variable was never set to false.

There is a quirk in current versions of GCC where it will sometimes set
it to false and not warn about the uninitiliazed variable.  That means
that this bug wouldn't have been discovered in normal testing.

Fixes: 2e0cc4d48b91 ("drm/amdgpu: revise RLCG access path")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 7bc2486167e7..affbff76758c 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -735,7 +735,7 @@ void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
 	static void *spare_int;
 	static uint32_t grbm_cntl;
 	static uint32_t grbm_idx;
-	bool shadow;
+	bool shadow = false;
 
 	scratch_reg0 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG0_BASE_IDX] + mmSCRATCH_REG0)*4;
 	scratch_reg1 = adev->rmmio + (adev->reg_offset[GC_HWIP][0][mmSCRATCH_REG1_BASE_IDX] + mmSCRATCH_REG1)*4;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
