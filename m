Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C4A54AFF1
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 14:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E025410F1F9;
	Tue, 14 Jun 2022 12:10:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C6010F1F9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:10:23 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25EBYL41030308;
 Tue, 14 Jun 2022 12:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ttL1PAtoXVny6T+jsM30InMQMYWKFB9ZRa0RQcM/Jcw=;
 b=b1H+1j1zsvqonivW/S8vy9z3q6fEgesI7qqXPCwHAs2N2haIbCZDvX1BDBopLJIsRPE/
 VvO9l8RYlYL4VVaUCncDfFem7EgNcrcmTwL4SsuKrI+vMNzHI8fhR9yl04+F3rpFxJ7J
 BBtuC8wZ9slbg7RuSkV2EgPubipu2pyXZABaD26/Hc4Xj01twTvc8eTJs21TCnd2PQY7
 1NJZRn8pGmwINW4ZQQd7vVXXH5sjPuDxisGMg+fZlLV8fn7jVHMNdCp0NGs0D2dDG51j
 EG56x5sbUHkmmNRM439IWhyVRrw/bimiwOVOH14AsyTasf/+9qSBoOrNuE6z6zmK3Zpc 1g== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjx9dj3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 12:10:17 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25EC5aQ2032753; Tue, 14 Jun 2022 12:10:16 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpqw9uej1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jun 2022 12:10:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmm3ip75NRcLZbWVClGxx5Blg+UUGxkiDxcZ/boxLDFz9TuE0teGZZR2TVRP04rRbXvHjIRg099F96eBDvNxST1YeQu4VXM87z2JYg4vcmyLWuMqhL/2yULG7h+cwsidvmjYts2bJ1pND5w1dFATYNHHcUPtWliAA8meuBlraUfreeZGmZi+Hi1lVID25tgZr4Q81jbYNWpEQ7UpJO90tpY90JfEmnMAkhJO38RZJJaryz24TJsd2rWAM4FF6GstHPDppNhJEpKAA2DamN9jhywntVM4DSjkoTTRAwAKBdSzmNDmXvs9v30VZiEGd4+xNi7RdHBp1TTcIy9s+y5wdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttL1PAtoXVny6T+jsM30InMQMYWKFB9ZRa0RQcM/Jcw=;
 b=LKS2SOMKnmixH/NmPN0Caiszyv4MOkA4dwPdPvJNUxd4+5huPhWA7i3JCIaHnQHoRPmZ6Ra2DL0kqh9z5VhbbZrG6Gbyj8J9G0BBHQ5Bvrp/tmQgZeYb7V4LHtTkETOVis5mdLSZdLiiUnuTyveK9CZFPvjA4JoZjv2UhdzfidPPcQbLRSrzETorcO2DSF8QguXXBVs1bAxUbh2hLb33oVZq9xNMVX94k9VREC+SaJi7skPWgpsKkZhXYUZOcoKdkI28hmSY4pceID0Pno+hXJM2x7nh4nFBz9YPxTSH8vOy5JoaS8uSoYfSLzgAwDWSudJViss4/Bwo5HQKNe4iWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ttL1PAtoXVny6T+jsM30InMQMYWKFB9ZRa0RQcM/Jcw=;
 b=ww9j/0pfBZHMFWkQYT95KLfYZFDQdGexU+mPHQ5VHynEPOgGaweNNo4a/vcczfCHBOgCNstKwhCdxwHW4iGETW82llnk3V7o8lJt8M9UV++s9JAECtirGSCaW3TWlTj41bJarO7CljLJ9OA8A/OdHTOfFM2e03INaXW4yURb/8A=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM5PR10MB1482.namprd10.prod.outlook.com
 (2603:10b6:3:c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.15; Tue, 14 Jun
 2022 12:10:13 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 12:10:13 +0000
Date: Tue, 14 Jun 2022 15:10:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [PATCH] drm: fix an error code in drm_syncobj_transfer_to_timeline()
Message-ID: <YqhG3ozn3cSazbrO@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0050.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::19) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: decfa9e8-8935-4200-adfa-08da4dfed62e
X-MS-TrafficTypeDiagnostic: DM5PR10MB1482:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB14824BC086CA4A30017C0A818EAA9@DM5PR10MB1482.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dhuHSaFbF3ydG43akXQQh2Aa2d8DbqW2YKB5I+rzoe710iiDHwSp1gqxeokcj9wSbdRvlYeN+7kypiqZsBiIlOBZvlaMnG0YzT2eEVXfaq3jKN0/i6AGjHgUPDdNKLbH5lpNx+FkJ6vxWirish0NDL/tCgiNLQ0o0TcaDHG4vqXpHk8dBVYmEHnv+3O3F0roP79p6d4Xr+aduVsmiCAgIHPpCEw91wlgc4nskqUAgZ9K0HhPD2Mp2jCDp71p3XUHya60B0iZDtF+wyEyudG/NHumONyjve8UcLwaQoyJ2JsNWx1uNIEbdSZhWtRaALe2BzP0SzdYiFxhX3nC1Sy/VvK0p1t7NgOpdtuJ+9hlFGh5YIbjWbnG0J89cuKkoqDTqt6t3y0ibhUzggZSvhSBxAE3GwvbEbAVEqXVDPpM5z0T3ZujPznmIL2r3PT3lCmDlb78EDrCYQa4XPb/R/fpPbyxz9lSwpwCYPEOYsj9+Mb/N30iL2w0hU4jFSfffU2TPNqDwpi0juy62xx7dL2dyIxTwkY1ZrL7bgY0soODV1EKcdpg4kuBiiL43RzAOBZvwaQDM3gh9JrLxGynQvwdx4697hH7wYtbUBFrrfyIMvWsE2ndSHo4S500E6mzyfVNdRcTiw7X8IHP+B4Zx4J+uNL3IK//0FKqTwDggmqVKaUGxzDWcFAe6YCTW8RKX4nLGblyoXLscuHZb2vyhQCiXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(9686003)(6512007)(52116002)(6486002)(26005)(6506007)(54906003)(6666004)(508600001)(33716001)(110136005)(38350700002)(38100700002)(186003)(86362001)(83380400001)(5660300002)(4744005)(2906002)(66946007)(66556008)(8936002)(66476007)(316002)(8676002)(44832011)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OH3YGEjq1U4+u9fqprw2hxJ7dU3nZ8lwDW5OOwzuXhhoey1m04JqzRcZ4tK2?=
 =?us-ascii?Q?R+B7AvOeEnj5p0nDjERNBg1+QKkb6qV0AiCwEGqG7zsos80ndssNe4Y3q3ss?=
 =?us-ascii?Q?2Aatb8/nWqY5RfEeRcOdGqaHLeb2jD8Wy89IL4BpdlSkqMD/MDNUoU5OHWLL?=
 =?us-ascii?Q?b6yMIefYAmXuatwGYUEC4sRyILQp+MLmVcCi3Z0hJqawuYiUn5OEi9adj9Cy?=
 =?us-ascii?Q?A/x201B18amEMbuFrremYmsoN6faosuCtwLqGLmdZY3AfE1m4vqYYuoMICN0?=
 =?us-ascii?Q?wbAF4tWhXo4bK72oqvtoKwpFpyCMf7sU0S19GEN+6668S0iYsJZMtKTOJIRv?=
 =?us-ascii?Q?r4e54+FIFBnOFc6eGo0n+Dm3Xj1xJXgH9DHnjaRF0M+mqEERm1gs9Zyh4Cv+?=
 =?us-ascii?Q?jzB6ZGKj6yAbZ7onllWvQxF88pTW5KyyaiQvZN8s28eMNlKhV/sz3cYrNhLg?=
 =?us-ascii?Q?S5z4SFsDZFLbCUk1TS54NqZsIUlOQBwrvnDvdKBhpg4ldrrDraFctoya3rv6?=
 =?us-ascii?Q?DQlH7ZEjBZAYFrg2GeRgjPMWn4y4mYP6n7p3uU+qG98XeakFxJFJUYrif1dO?=
 =?us-ascii?Q?JUadTL806UWfm5icRcd2gVdN6IzzXkC1f+zGe+p5vpSrHcA5AjoAcm/Tv31y?=
 =?us-ascii?Q?edZibqlilQ/kS82+heP8jg5BnuhkyIOzHBQEN7j8m55Nczs+oe9nf12ZwLS9?=
 =?us-ascii?Q?d+W7a/EVzHn57zO/61ey3QDjNFOgOoiBm/u7DVJT/4F+DSQtiyL7HdE/1dV1?=
 =?us-ascii?Q?0VArbeoDYsbVdUEg6LyzmD/+Chr6syTT7G0imjz8cY+zqXUv1cGdKqVYN+4u?=
 =?us-ascii?Q?ENXeOWWG3os46pZ2atnrQLi4YQCBAw9RgwHVClJbk3bt/zJDBDdLjbqc2SH7?=
 =?us-ascii?Q?ZVR6H4t1TVljz838V2YVBbesZMAnd4Zwo8H31vGXUpNZ5EqJIU1cLGixhvM/?=
 =?us-ascii?Q?wHrzPyiKUEDeHIITHwgMZLCgd741ZCqdQGSAektYiYkiLNRMEHGL+6AwnUW0?=
 =?us-ascii?Q?IXe35i/No8vII9IR1u/RwInuk7BkmCop5NooQQuk7tqMoTx28vJoNDKVl/R7?=
 =?us-ascii?Q?lHwTlGF1y6bwx4lUx7riHrZcxP7U3hhK9QKH7M8V50EcAyhwuzhQ/b9QpB3I?=
 =?us-ascii?Q?gbTCBYX7QyaoXLGmZLiwM7PZFNsFPlMatRXZJhxFJHj901l9yqSk8glrUnLl?=
 =?us-ascii?Q?Y4dBE7B7+IxxIEkgW9B+RfdLg/wBbiknKCIjxCHsbwBsGHzPWLncKKuke72C?=
 =?us-ascii?Q?PHPvu2bQY5QHFmR7yhpOdrlp1vae1X9pb6Pwf3rv7ZFiSHdoLZhH+haij/Do?=
 =?us-ascii?Q?uOLmqLW4dncQp/MzTR/wPG7/+rOHJIMvslmcpJtb8zN89d1FwU9cexI0fiol?=
 =?us-ascii?Q?nhBm0r2Pc44CvMJmBWdkvc/Zs1wIIJKQti65ow5CH89CfzoUcgEMoyK+7CTz?=
 =?us-ascii?Q?cv+/86CR55+9z53F+k/tVi4xjBeWa3w0A2AZvCzHflaWHtuRmswSEvL4D75L?=
 =?us-ascii?Q?NBsHPzwBVt5S9Fqk2w17zQuwcA+x5vSUsGqO2Gw5+Gk+EihzrPOPUFUJbmIw?=
 =?us-ascii?Q?LIjqKVQr2MtII+hlKedSELFHKr4OVViOHHMMm/6wyytJnIIYOH9QAp0n5hMQ?=
 =?us-ascii?Q?u7++OZFfJoS1faMJZ7K4T3qf6Z7zrewuaj4I3pIii81ZcXCmDhohBg4lfmPQ?=
 =?us-ascii?Q?1TzpXIjcIAdbV+PSFzqHO58cZoNQvqHH0l8AfXRlDvgX5B6bzAfah7uqJ9Zf?=
 =?us-ascii?Q?F7KKP80ZrPEl7gsqOYTh/16q8KF2Ftg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: decfa9e8-8935-4200-adfa-08da4dfed62e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 12:10:13.8011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Dz1RviIf7K+EDMezsW2Stp8LYaKu+A5k2EajlMZvSAt5A6WzJjrll/QT5btOsGmH5884u6lfiAxBniJ/2lNSnZELt4noIygrcM5WMoSTSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1482
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-14_03:2022-06-13,
 2022-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140049
X-Proofpoint-ORIG-GUID: obNwVw970Jeoz0TUeqKeSWdpZX_C2pyp
X-Proofpoint-GUID: obNwVw970Jeoz0TUeqKeSWdpZX_C2pyp
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Return -ENOMEM instead of success if dma_fence_unwrap_merge() fails.

Fixes: ec8d985ff26f ("drm: use dma_fence_unwrap_merge() in drm_syncobj")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/drm_syncobj.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index bbad9e4696e7..0c2be8360525 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -874,8 +874,10 @@ static int drm_syncobj_transfer_to_timeline(struct drm_file *file_private,
 
 	fence = dma_fence_unwrap_merge(tmp);
 	dma_fence_put(tmp);
-	if (!fence)
+	if (!fence) {
+		ret = -ENOMEM;
 		goto err_put_timeline;
+	}
 
 	chain = dma_fence_chain_alloc();
 	if (!chain) {
-- 
2.35.1

