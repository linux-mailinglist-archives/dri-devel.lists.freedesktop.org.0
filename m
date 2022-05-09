Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA6A51F767
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 11:05:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F3510E38D;
	Mon,  9 May 2022 09:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B3710E38D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 09:05:29 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2497Fvc7023549;
 Mon, 9 May 2022 09:05:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=5SSwTdTLuJBqL28bW9KaxhtSZdL6NO0EMvJVmUNHpZA=;
 b=NS6s8A7UcY9U8+x9QbFwfgGAg3K/g6Rtv2gGYLcWKFcaYiOuQfGLNKh9wmdugyk0DJsj
 jhvJxJNJW1KzLzCt+NW6gZ93+/4kMijjL44WHxqLmt4ZcPrGDOXkZq8S2OMkvrfLbdhG
 rryk0ApihRi5wgzUTw3k1RZBpIwRq3COv8ApfrAj2sFIadVN2tlP7gZbBWD6T4fnA9Zd
 lst6BfYbfjcrluU4ogFE0NnTrEqne0wdAY7dcKooS65jHv+WOtJeVNOY5xHSnfD96ZXa
 QVC6qytBzL/Jx5B6ciwTwUtPqbe2PJQkVOBv6YlKCQHHbfgUqCDCMdtPm9g5nD3lC0ru xA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwgcsjtt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 May 2022 09:05:19 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2498tX9r003914; Mon, 9 May 2022 09:05:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fwf77twjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 May 2022 09:05:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmEfDkacwKcH322CWd9C/Goeoz7foZxYdEmOn+A8kx5CwaatLAeSXrvvrvl3jwHR2mFXQ6Z6iBWHSj86ACGubjAveY7qw38GYG3eC0InnV5D5XtqtK/72hNEkRd2WPSK0z0F5cQ6hODKMk1uMpnG06n+8l6vhSoBrzg3sLZnZ6LnCFn3z4vmyQDSOVHKd6M2qawhDoPWVeRTXta8sMbYURERmjNDgDgJgJqOFEkIK/lbCf/ZtAzqanUAYiTYvpDhPof3fKRi2FAzh6zQqTVDGgA6djRSYddZflNcLFSFyJzpIFirEEdBdZIUbaGwy1L8zoNVycziupkMeK7nxsLD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SSwTdTLuJBqL28bW9KaxhtSZdL6NO0EMvJVmUNHpZA=;
 b=F2sFmFZL1Ar2c82Ls4odTDhALbQ6YKNx9XuqfhAif3EC7m/8wjnbVSy0nbCp/Ct79MuiQBCGi8wOcXN4k1vgvxWYGNEBr9KnQ4faP4j4HRZ8anFfQD/b4c4sXzEbpcsTQi70ZVqsrsdmwrxbP9BHp6LpBcMLaSVTeN3Kz7tFaQb6d2n0a0xmY90szcPCaqEMaVB+xPzlW7mYVOeIm7wJtt4EmwjDrfmzh+q5a2CvzVU/cB0jN9I6GkVsLbSc4JqeYM7OVCpXSJRKd20X3832kmfLe/B5jNd+LId7UlOY2Jb8maW2C26dZeyRYVXWmvAzzvO9gYYfMWF1E9vTn8gGlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SSwTdTLuJBqL28bW9KaxhtSZdL6NO0EMvJVmUNHpZA=;
 b=SsinmHjflwWiYV1lYIaCvpTmkGSbNWPqmShdOtimtdJQ2KTVF7PgI9YnN8Yp3+y6uK97I7BmvbdKOs/N2p96XH/d7s4S1ugvrT+Awpg3xoKwOBoOzAaC7d9GYHHagsWHfH7H+rEqpqAEqDYxrR/V6XtCx1kZYaWt84i0zhcyUR0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4542.namprd10.prod.outlook.com
 (2603:10b6:a03:2da::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Mon, 9 May
 2022 09:05:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5227.020; Mon, 9 May 2022
 09:05:16 +0000
Date: Mon, 9 May 2022 12:05:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sandy Huang <hjc@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: unlock on error path in
 vop2_crtc_atomic_enable()
Message-ID: <YnjZQRV9lpub2ET8@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0033.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a828c4b3-49e0-442f-63e1-08da319b08be
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4542:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB454259BC1D3958C2301942F78EC69@SJ0PR10MB4542.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0cyATGFonWxSOqvgBS6kEjj4aBB+85JBqqvW7ZS4oTacD6F2M+I4VW5C3kunxt8NL8Im1BvbuWjlXQvhD9fX/5WYZmKLQRPs96p/Yq+sarr8sDEW3bgo8E6f9ThP+yJubuQXiW8UDC9XaHY5Jobh3CDaS4mCG59wUq4uJFz/e90K+ZWEwM/+w6HS9S7wvZ2g5aWIoByGZPztJrq6kzowtYGaTAKDqPP1cRcfSVWKE7CShSS5lf/jdCW+Kiy7Xz8CaHaTpvmTAtG3C9D75TRV6aAs1FR5/M4QG+oru4ceVH1WQobhgGSSTK1R6iKL5YTIXEdbsx+EPufb9R5DZUPaomCb4hneO4F7kQ464pOVk5buCsXfCElJz8+rLXn568V/KxoCCgfnYr4aWu1uet/LsbZowV5ec9VATJjAacpz4h2cyBDPu4tLkMKXWvH4bwLPIL5NmMqAvmzULp9siz+3l8DogAGGzVPod3lO9N1MpgF6mDerV1Ye+kDCrrEzVziGFZgdR8OnYU3qRK6hRljY6cwF7+ts6h13hIWdqd3hxwinb1FyQwe6tG8/a0O/7DnWVytVtOhkoJOkogK7TSJ7EjFIBA4cKpci8KS3hSh8Zy5GSozSwl3LbEituaVgfUDPS2PipgSberF53SzfFIfoQeZVrnaRYf++I4J+C/95JtN/dPu2x2KmiocKPF5/8UghWCKXgboYv4hzfXxjUK6rhQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(33716001)(38350700002)(38100700002)(5660300002)(83380400001)(8936002)(6506007)(7416002)(86362001)(66556008)(44832011)(9686003)(508600001)(4744005)(6512007)(6666004)(26005)(66946007)(6486002)(316002)(66476007)(4326008)(54906003)(8676002)(6916009)(186003)(52116002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i04hvylEO0w1cQFGFzJl6ED7y9hhUBiz+cY0lmt9KXMZPNMvZ/Dpwr9WY5wM?=
 =?us-ascii?Q?y6xwdvLeNMz0wVuj7r5Jql1Br99ekL0Jz7KENdwalCLIjFBLE99VCZIgYUrO?=
 =?us-ascii?Q?s3Pv34zmAXlj68JMYmLq2uE7m/TA+m9LzrAbQRY6VTwSxA3c/cTaOxD5JVwo?=
 =?us-ascii?Q?zJzq1F10IPedDOoiy//yMvHeKfsIJZblWd+H1lwulhDEjXgir8rpMbhSvbIb?=
 =?us-ascii?Q?tmFnZH8ebtMDROE3ElMHWZPLpbJdiIcuwseC3XeBuTSrekgWvxq+Gt1fOCIL?=
 =?us-ascii?Q?Xc6WMsR+JrXQoNWQxVzi4o3x7Hvk0eUfikVfkRswfElxd85phf1JdB3WRRqr?=
 =?us-ascii?Q?8ao2bINJgErHJJj0GGlnqxLA0OA5Bh+vZIdpYXglsoGio0VSZTc+kFnby+aJ?=
 =?us-ascii?Q?S3hZunyJop27AW6hfXNMzUrG4vJm/DxMUSRlLbXw6/2M5IhLHOE7zRuZSRvZ?=
 =?us-ascii?Q?U59uYyqwV7hgVqWOhCUx44vjM1GfqbRs2U+JF0TTWCmnqA/gMWMaIBUHs7fr?=
 =?us-ascii?Q?Slo16nCd556XgPyS36lFMtIO051xko5lCeLlVVBO7/oJpqDXIVdH6b+RWsKD?=
 =?us-ascii?Q?T8GkytayVKu1RO+ErCE16L8cjlWdMTh5M37ctZd/UYFWuIxuPirPcYf7AaHX?=
 =?us-ascii?Q?5d91Hjoeo0bssMsC3OgQahyuBZl0p9g55mVH8Wj0uOY0eUaGanzPblV93mov?=
 =?us-ascii?Q?fugYrdMxsngWWhl9I+5eTQRziv3dfNnpJO4mK4tUTnE+S0uFyozsS2OrPqwt?=
 =?us-ascii?Q?bDJK0ql6QoGFg5V4vaATZNEeel1J+5Ra69AOeRHwajDxGpT1Rtieuv55lcgJ?=
 =?us-ascii?Q?xK21ylCE83+NOqC7HGJ7FVQ5yHozUdVu4cHMl6ASn0iy+C55Ge1Oq8YmSwv2?=
 =?us-ascii?Q?FarHqfePJWjCNVGbu3+uwDh6HqbcWFoCz9ZtwZXXBoS369BpD5sASRXEB9MU?=
 =?us-ascii?Q?UkwkaAy/5TjV5auY/+p6CdSAA2DU/A5jX0Ua3jn8E9uZBGu9wFz/CTvg/0IJ?=
 =?us-ascii?Q?GxuarWWhOC+qnKkzGZKQlPtx4i5FhruxAoTBF2lX/+ytGo6ub/C6HzElkoyR?=
 =?us-ascii?Q?XOPxZxZRBt4Nu4LjMicIppdc/ezS1H8SJARdx3Mli0hQuHlYGxJ8trjyJG10?=
 =?us-ascii?Q?antvpAtCclypA0nUd4Hur6gVqV+1VlAaRAZ1FaetlMJ2lKOtA+AyMfd94aY2?=
 =?us-ascii?Q?UV09d/0z0PUWEvnpTyy0WvRjr6MTBaV304H3fzcgxcNzgItX0mQb9Hgf+w4K?=
 =?us-ascii?Q?3ACN8smlU/smbaSY9sWt8IRWL9Dj1vkXI2IQfThjmNz5zvr66D0krhccV74g?=
 =?us-ascii?Q?Pl2BNdXXuVa9+j/lwN4gVaUrNGMh22RXNe04a0KeJzC7C4ZwvDNKOesueHv7?=
 =?us-ascii?Q?BResyolMho/WKDYa7BRZtxeCc/7vRjKm7CncXopOKTuT9SWp8F5Vu7D7XTLg?=
 =?us-ascii?Q?MAGTrRskS4PlgtNTCIfXNZUGvkEoLOvtFnw12oXrWNWxgYeU+5jziq8QJiQl?=
 =?us-ascii?Q?EnUxcRj1G50ECFtVdkjBQTLVBsTCBTg5bZHST3HK1OdvS7OQdVxJ6OK8VETn?=
 =?us-ascii?Q?3jlayF7dtRDoyTmGMr942Kj9ptECUVmK30zrlcDNw4ewb6VQYbR2BrpfIJ56?=
 =?us-ascii?Q?2Ov731uy5I3FXM56Zf5NpHqxWUtzIprCF97TtxDGOd1s0MRW3WqLB5mcfdbz?=
 =?us-ascii?Q?b5m+L4COeCUzV6sZVvQF22GN7/FvUM5b3h0ezDD5F/zOvG/6YIcJp/mIeW5/?=
 =?us-ascii?Q?TpwWfos+DMvlWDx6vU28BFfTE6PoYEA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a828c4b3-49e0-442f-63e1-08da319b08be
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 09:05:16.4764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DPT3XljoJfzvc8A8VMBa6tY4XpoePsDBwHQtwN/s/q1gE+iGfhwUeWZweXucERkvYAPw86/3Hxzxn1iVDMZJL1548gTRDfUKUarlZF96X5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4542
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-09_02:2022-05-09,
 2022-05-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090051
X-Proofpoint-GUID: 7oBZw99b3myKqHWRvVsJ_vB6cUy5G029
X-Proofpoint-ORIG-GUID: 7oBZw99b3myKqHWRvVsJ_vB6cUy5G029
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This error path needs an unlock before returning.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 0b49fed16535..b68922943825 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1524,6 +1524,7 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (ret < 0) {
 		drm_err(vop2->drm, "failed to enable dclk for video port%d - %d\n",
 			vp->id, ret);
+		vop2_unlock(vop2);
 		return;
 	}
 
-- 
2.35.1

