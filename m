Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDEB4F92D4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9020510E174;
	Fri,  8 Apr 2022 10:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E8510E174
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:23:21 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 238910LL005378; 
 Fri, 8 Apr 2022 10:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=KYoUER8wVR5j6fUYzfvr8Hh5E+TNPuAvS0FUYnzJCeI=;
 b=ezLADFozsZuJCioJJyrYvgF1pqHrD7NKj8tNQalxHUYT4Z9MD5JU8mrvjeu1LLSRvIZp
 r+824+W2J18aq9NzwnErsfoGQYKAWfOJ1Xkr9sniH4xkVbC5h3ryea71/PmxclCEllQr
 J+V7mXk/Dbfa+FyKbYVDWXRDbWaV0BpYGFnEKmBdl4x9EyOPD86VASW+jiP/V1BEpA8D
 PG3iw6UHsTvmKOCzGIxsEocEVnjd3bXWp046Dg54LapipuTn4HAPaEeNXq7Q4sjcLmZQ
 0IxPEbGeahFDjLYer8awBY7V8lFyF0PSnXWHL5pXEiamMBSW/d33DSbU3V4ytD4Ae9nL 5Q== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6d936q01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Apr 2022 10:23:19 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2388GswH009572; Fri, 8 Apr 2022 10:21:51 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f97wsb0nr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Apr 2022 10:21:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DnTmfyDwlLsPe2c/DHcSMj+ovJPJzvA/0HkKUAQtQX4vE4oFZj1/Kksas3DFNR50JWvtog0vSO+EVR+GoA/yEKOj8P40KP6Gb3LEsXJKmZNLgIsouHffKKsfEgxuIZSjvvqRf8MFrgvZKgiV0I/hvW739JkNG2KUB4HsDIg2NfZTa63YAIH+zl4I+B73HIzhxrtCNIDjgDAEjnoi75PRz7FAXzWwUdn93/tvcptDuA6TkzGLy7AAT3uIiMMUPmn7WQLTHQd8i0WOH0LvYsnCHS47vmy5D8cE7DpX3F4PZugOw/kkyqt82KUCZPZTFbAw9Fec4KkOeWVEwRQcCFTVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYoUER8wVR5j6fUYzfvr8Hh5E+TNPuAvS0FUYnzJCeI=;
 b=Y8WjPZPCMgGXSEAyVp9O3Xli/VaA2QYEzNWq8t0/6uFq1PU8JZ1Rn/x/vgXuA7PT1O42X1kprJ0CdE4le8pNVO6TbeLKu3gzgqMIFi62FKXAjvEfAGk/dxiU7dcfDh1JMtzwaieLdAVvK1WLPPS2jL/QZatdVICPPZr0XMZLfxZpsEYuiT/CZdhfjUKBTf76QAlPceVlUeFq6T48hBU/qA+YGWK8JL8si6F0jwvSNDKBoCDKlPo7wxsgcwjjmBePIRpelE5RiASYOUzVffl1SR3DloBcHYn5ze0hWVCLW5q6H0BDvx+kquA+zAz23SQbUFKVUi/g0cZOeMPYYhEi9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYoUER8wVR5j6fUYzfvr8Hh5E+TNPuAvS0FUYnzJCeI=;
 b=hjdC47/tUAkoj90lO+vSSjDrqpsHJrCBBenjH5Sw0FDzJJHWzq4QWbyzITKRyQ8LQoAUgem2FOVV6G/vWSVHe/Hjiy10R7Mi4afCnZ9N/YTjZfw/h+HllvTcPQSL3ABvEfFYaPvcJhqfXD6M4R9kDpwP1rlQzbHhVaA2bhK0BFo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3061.namprd10.prod.outlook.com
 (2603:10b6:a03:83::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 10:21:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 10:21:49 +0000
Date: Fri, 8 Apr 2022 13:21:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH] drm/exynos: fix IS_ERR() vs NULL check in probe
Message-ID: <20220408102134.GA14120@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZRAP278CA0017.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::27) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e86583e-15d3-4c1c-98e2-08da1949978b
X-MS-TrafficTypeDiagnostic: BYAPR10MB3061:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB30618F16AC8AD8584021233F8EE99@BYAPR10MB3061.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: V4GfxsraiK7Z023hwA6oPpA5bBxTzXF1L1XqZWopbr0ezKC63+nBrxcvHn5sizxr1rOB8QZ7qDe2SH2sbPvVvvcO1otEGW4LxPFfefbAHnxXmy/0e6MQsersLCV7vjWZPhZOfbr+52qEyX37AoRPZu0ATvQLatgjVrfn7ohGa93m1op4qzA+0DM5Df5owaRY3yexmvzU0bGosowxO+kFPYWEvSK1TuJIGRpoIz2P7pud8zIFlgmwjYvAQouIcFL/g2fL3mKAoi6L5Qsiw8XzXxkwhUZvAqVtWP+7sRN4geyzGMeHIXTZV5EviyO2bB/7ZzLhlb9d1aZ18Bhh72epjmw01HHlKiG0/zYpNDmt/dMITheiN1GrsmIQRqPwOxWRejzWzYIrSfJtXUgLsKHGWEoQPELlKOYBqwW9AF7RXyKjcr7DpxEMZIbA1r3E4nBj0CxsoFZX4+VYlKcklBa24XfJq5IdZHtpQsmVbXnk/jUSRnSo18hRfhP/mL8J4TjuQhGRkBvioBUHx6CWm5MmQv1mBDp0snGLk53891b5g70g/cNNm30IZos0Nr9unbEtn0thSpzAb5eLCx3XXC2Scx+XV94m/dT5XMbBdQ2pfMIcIHh/tGVDUFDqcHVqD4oHxbH3liiA0XM48j978B/tbD8Sj8EUJXJ+QKRbdVS8y1zMDTswAPnIzia96tYQQWXoJFWCvdvfqIQl4b7eRaDLjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(1076003)(44832011)(54906003)(110136005)(52116002)(33656002)(6506007)(9686003)(6512007)(4326008)(86362001)(8676002)(26005)(316002)(83380400001)(186003)(66476007)(66556008)(66946007)(7416002)(38100700002)(8936002)(2906002)(6666004)(6486002)(38350700002)(5660300002)(33716001)(4744005)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xa5EeNWWr1sTuV/w+Uu1xHANvGy/i7IQ06V03hR0OvcPjy8gxWNMEmhdjU4H?=
 =?us-ascii?Q?vlIbbwfp8B+6dTnyuGaA+lfOnjmTE25khvIQIrcUyzVra4crW1hlUHTaGQ6T?=
 =?us-ascii?Q?UZtm+ELZJpByP40YAEFn0/JtpO/Awhgj3gJ4O5/f24C/ffDDDRioc4wHt+9h?=
 =?us-ascii?Q?9+0MjWA/E3HuwFD55mbcbrzdsB/tZVbWRDP4sGQ2InxLAmjnzrAqMq2g8ZfZ?=
 =?us-ascii?Q?V3O1TAQiNy7nCKS2qjp7gcV6bfqPvxuW5qJVGbLyx5eJZF9rRoacbPTMts7V?=
 =?us-ascii?Q?6JPL8ERg9ELTqmsAvpwM7xdErfEyPop7y70+Rzq10ZwcV5HMZH+1AhrtAkFY?=
 =?us-ascii?Q?BnlA50chpS4Ue0M6tELIMjjWCoxyUzppfK+rTbUbbk3gqz85OoHBNF8RodGL?=
 =?us-ascii?Q?xQMZd785MdUJjgu+u883yaPWoRVwat4wO7Cq7t3Qr//dKOoDH8K54ytlSJWH?=
 =?us-ascii?Q?r7Xt+tKqU/1WA0VUPMmC5lFTXE2Wl/aapCEVba6KYNikylxwP4JXHjkTd7kN?=
 =?us-ascii?Q?l+Jogh5HYgwrjaklGizjN8AajYSW+LWQE8NFxd/uRlEjPlN1bQQOyGPlCCq9?=
 =?us-ascii?Q?AE9QfihiFP+zM8T20eynZmCykDVvloQyllMQosw7G0GfCucVvohtemXT9kHf?=
 =?us-ascii?Q?NTfufhmknZRCdvTzSW7ukLl0FnBy5LGSa/ZsIOzLfnT4peLYELb5diP9nB/b?=
 =?us-ascii?Q?nMcZKaZFbhwXNpgk75KtXBkl6LI9ATYl5yvbhFWXPS03QclE64CWRKF1HKbp?=
 =?us-ascii?Q?lhD/rjrUCcJWjvwE2Yav2/GgjaRbQCawUxMMBR0f42rpBGEjWtenku1thamK?=
 =?us-ascii?Q?nOtRQo+DD0GDgiaHr7dDp6u+vQAheRUjo4YuJQXgNA0SA60QAa7UllAMTkbz?=
 =?us-ascii?Q?ZoanoqkBfGV98A8p7VIzvEpTxkjoKFuYwI3/VDX6ljDmRG7v7S8LbgF1o9Id?=
 =?us-ascii?Q?rniXrcrkDGTQidVGMUkcaC6qGl7SC1Q7U7nrIsdi3Dh9M4M07/Hph8JsRruG?=
 =?us-ascii?Q?cWopBh3G3UIKAKbFeO/uxLBbdHBeNraC2mknzn2Ddj3YdO9WjzeoM9IQq86v?=
 =?us-ascii?Q?I11QgA1fGFpVP9d2Dx0j9Qh/AItv+q4R9gxjgrdYql+9nCN1Dd71vbzcVBFY?=
 =?us-ascii?Q?XjQjFs0VMJRc0YRnWyKPvinIaf/h4P+QFlToXS+lD4i/j2LURvIQPwxdKPGw?=
 =?us-ascii?Q?IAJyuqIJtaWcf61jZtEBLLgmPMiB4Mm1yEyX9r2Lh8ewep/oIex8lvV+mg0G?=
 =?us-ascii?Q?GlBVkpQY8QsKgWAaYCg/5ALjkfhW9DOyXPqFB2U9HMq7jRQBptgNTdc9Iv1P?=
 =?us-ascii?Q?JxQbzz1pzidTvZjg6s+QibDWUZiT5iF4l8RRLMhmczGpsstuGOZmrUPk++uz?=
 =?us-ascii?Q?tMOo7hrRZw3bIZ83aXYaHxnCHQg4OVCSg0yRH8qM4TMSlZ/cBVkhcI1UIbNK?=
 =?us-ascii?Q?mZTKTr5PQxTxWBIe3VknXXnEo9oeiE8V3KHULGiAA43BA12/PwPLG94Ro8wF?=
 =?us-ascii?Q?GfX1yGwyD5/6o0R5LmnDlHArwTxP1YJINHRzzJlCXMLQEBpmqqE7ZntBok24?=
 =?us-ascii?Q?Zms7d06PBYM6Sk1DyYwvCcZgiXXXXYpJflrWrNCcPUc0LCMmDt7GWBFjIlsv?=
 =?us-ascii?Q?9QEEqBdafSIrLteQYL0Rp/qIdTdhD/qGT0Bo9SnxbRDq7Qtw5/kjCaXXf3Kk?=
 =?us-ascii?Q?1fRk9yclTch/+iSFL46tAIZl9yduawXz21UnP1pKkAlxG+vwKR5AAcFQqthW?=
 =?us-ascii?Q?EsttPpiADgoCr9gsw4EFq/wfOwv8L44=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e86583e-15d3-4c1c-98e2-08da1949978b
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:21:49.3724 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pALenrlMk5Vjx9Ws9TOTDGitpv8Aa/I4yt4h250okBp4eB69vZ4D1qurMRZHK7I+ENR322AcxCCL4L9qhXD7+XgxbisLlTREJAzvu4Hy2Lw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3061
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-07_01:2022-04-07,
 2022-04-07 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204070064
X-Proofpoint-ORIG-GUID: V9rON6zmAvlSkfXLPnbifMFb2MLJrvCd
X-Proofpoint-GUID: V9rON6zmAvlSkfXLPnbifMFb2MLJrvCd
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
Cc: linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Robert Foss <robert.foss@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The of_drm_find_bridge() does not return error pointers, it returns
NULL on error.

Fixes: dd8b6803bc49 ("exynos: drm: dsi: Attach in_bridge in MIC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
-EPROBE_DEFER is the correct return, right?

 drivers/gpu/drm/exynos/exynos_drm_mic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 9e06f8e2a863..07e04ceb2476 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -434,9 +434,9 @@ static int exynos_mic_probe(struct platform_device *pdev)
 
 	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
 	mic->next_bridge = of_drm_find_bridge(remote);
-	if (IS_ERR(mic->next_bridge)) {
+	if (!mic->next_bridge) {
 		DRM_DEV_ERROR(dev, "mic: Failed to find next bridge\n");
-		ret = PTR_ERR(mic->next_bridge);
+		ret = -EPROBE_DEFER;
 		goto err;
 	}
 
-- 
2.20.1

