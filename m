Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F835B5CF1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 17:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C6CE10E59F;
	Mon, 12 Sep 2022 15:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B5BF10E597
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 15:09:49 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28CF4veC015107;
 Mon, 12 Sep 2022 15:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=/eC8m1pGwju6GqnNDKb9iVV3KOtOltX4e2NhP66yZGs=;
 b=2FxnUCHYImaFVAwMLyNZNd/l8qnZ+BPV8OUPKHrsWuHPPcMp/Rs46jbrxG9rgyhLLGys
 O8M7tGtXPMiEMEyX84g54qWJ3vd1r7n8obpEm9pXy4JljqY6wOL+DUR9OYxVCWRgPsQF
 v2LClSB2o96oXfkp9yfCu/ec00FJHCADqrh6o9CrExfN45huczgm69Cz+GRnhc++YiPQ
 mbDQRH2Y69/ZuXhzhoUSEBybDnbZY4sV7PkL+NiBogLxj8XPXjiOt3QWNvzJHXA3J0dZ
 lcjvZYGx/xWl9yBDNGL4U3sWUVq8EsVtrpKdkp9Hjqhxjj0WgOzRG/mk4gKP539AOC9P qw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jgh61kut9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Sep 2022 15:09:40 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28CEukr2014574; Mon, 12 Sep 2022 15:09:39 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2170.outbound.protection.outlook.com [104.47.59.170])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jgk8nbcrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Sep 2022 15:09:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhCNuKGBKpf4EigrkdnjrmuMxT04OXT2Ckj3NcCL634+e2DV3ruJ2I/l6eQm9r0WIGlJ9StH+6yrENFKwyrips2raBqHBB7OV6wLqbPikY805hxKe85aMOE+vvwTOD0aKbD9u6o7hJb1x0+IF5d6t4ePcCbVvRHMLvh7jgX/Hr+D8IOV0k/2K8Kq1CMGxdH7Igc6mDYK98HxCWnNuvo4+Id68zBVdIyu8t5pm5GEPkUDctqbSiwQvY6l3uwsoJY1DEZhrCOXKWRFwWZTbnj/EssnxvzzGMJ6aik4cJvjM0dQQ/9KBvgTZ9UOXllRUC2H9RXdONNHwDsQV7lgynTtTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/eC8m1pGwju6GqnNDKb9iVV3KOtOltX4e2NhP66yZGs=;
 b=DrS4YnpJ2UYg8DQVvE4uNRGC/jg6zW6OQLtuKE4wOcmG04snR+1johEQybLpry5Iqvs8dY2xth3qEEAFnSMsCG0vegsE1lJIWgUnHqBkFmTwyoivqmk8FllGndbzgPTcJZri/JRchM1dXZjudbK66VvMNE4rUw8z3xbUElS88e8mur1bq9KvFoVOIPxxHKe++dVpqk5xJYWNnVEqmLdNDZ87F3IobYTTGhGB4/YsSLwecfD7z8PEVuP7HZRXpWboIy4Wrkl1OWQYIZQrj7LjfGobHInd4GCPoFahV8M729AkH5Exs086moYAacHW7fG/PXcmSHgtkSyT+O3nxGaALQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/eC8m1pGwju6GqnNDKb9iVV3KOtOltX4e2NhP66yZGs=;
 b=KjRtci0CElkuO2C48hyFVHheE3m7RX7kntaij266QDS4ASAm40AikizD7Mq+7A+fr69hNmVsK+u5amoiCf3jYdde2fgSr1tC9atzuuudNaFKh60yCs3qKOTQ61KF0u/renrIccKl6V0m0qX9/4vXEx8qU3Qbqsh6K5uBYBvU/zc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB4589.namprd10.prod.outlook.com
 (2603:10b6:a03:2d0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Mon, 12 Sep
 2022 15:09:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 15:09:36 +0000
Date: Mon, 12 Sep 2022 18:09:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Airlie <airlied@linux.ie>
Subject: [PATCH] drm/sprd: remove pointless assignment
Message-ID: <Yx9LqimHvKwLIr/G@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0198.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|SJ0PR10MB4589:EE_
X-MS-Office365-Filtering-Correlation-Id: f035e9e3-c210-4663-8e26-08da94d0ce35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5rCEeBPGKXmhQWnjMI4ESc+p8r7GAfDt9yT3rLxl0JQV/T8yp8IYaoIMMfHF5k8d4OVtDTITDxo+Ycd3rSnTMiXWavFdyqlQdt+GRfdMeGb+rRh9fFYD3TKAyr2Qp3LJzwS9pLMmYHnysQ24A8cKLbk+OboIUE5av5dN1FvwbvSo6T1w+oqfUqg/XUb/QSQda317J94m9bpbfX0E/M9sr63jwueDMJ16dS+fOvioHRu7JstzOj3USh9o46L4gzUw/D3GU+Illq7D4pBodLXI9lD7SAnd0cehbBdqI/CAsjoLi90Xb1TwdcwAXomUf4rkOTmPn3nmfWVs+DEj9kgPfxc3txV77GIwWe+CWGGdEzzArmy0QhCjgZit0AeDiIORxsDLrlIW0IglPUpEHOoeDGwksZzIIs3B26JpZZf65wPyS0AO5Jc/tXdVhDA9HH4hCnXoiVQ9H9ruY0Z0mcQvUHPfPx6gmy/gypJLCX2QlHuJ3yfZ4ip4dvfEzzyOACwbvqr9YJ8bvuAiG9FYKZAcSFTqn5B5oNmjKUQ/PDjDFh5RLYj2EaQZdxNGkCM51j5FdjDxzJsP6P6tQDOCkbV6kd9Vhppc8e8+lCJJsbvAjOQhrM9pZRkUhyg3xJkbzUV/FK/0LH4aYJBJesukOyibYXTr8Wqnte4c2vVLWES7+CeOBFxiKsW7tj/IVVTgIGYRh77TyZr3E2OqM6kYXQPYxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(396003)(39860400002)(346002)(366004)(136003)(186003)(26005)(2906002)(83380400001)(54906003)(478600001)(316002)(9686003)(6916009)(7416002)(6486002)(6512007)(44832011)(6506007)(38100700002)(86362001)(33716001)(8936002)(5660300002)(6666004)(66946007)(41300700001)(8676002)(66556008)(4326008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UNU92LKFdxt42l7QAmQGtZAhyGeuCZvGoC9PZhR7Fbmg4+H4i2OP/Kx+jqy7?=
 =?us-ascii?Q?xz2MhxZcSWgFmzOVPL3jqy10BBVgdUgV+Cj7AUoFvdtt5gkVK4v8fb3zAjl4?=
 =?us-ascii?Q?sGBmj1AZK4xrgYwcvTzIS/YXP7iREym7ONYN03SGfrrbDEExnbaKv9q+DzLf?=
 =?us-ascii?Q?D+idBnhhIC6/GK0Nm/f78NTnBe+AaMpv3lKfw+NtstZHl2qdPJ2zOWUiY2Wd?=
 =?us-ascii?Q?HTqV0nreEws0oqNIi7Xpe9t4N0gxo2/OHtDcpAVNpTWiSFcu7YZV21911NSo?=
 =?us-ascii?Q?n8uA6JH4Kld/QoAlsv1J4eJrByrcZZuqc12PdvhvhXHvll+UF9TdCH54sAi8?=
 =?us-ascii?Q?UoQbK+xhEd6NyTXVkntwpqWIiIxEIkY1mpO6WikPCN8CH/CQkx+jGP264LXT?=
 =?us-ascii?Q?yBQtRiCfSnoxnaPC61S7IgZu6G0xZV4/vT56tRoUzKVE134GcwIlp2n5BlOq?=
 =?us-ascii?Q?7P4W8ifgqFCocWLzF+5Hi/cG+elDSfedvlUQCiAw6MdjO9dIlCueLot2qFop?=
 =?us-ascii?Q?fyHzvXtiat20sswjaY+eiOzLxUQjsrOBuZ8KtA423i69c3PDMjt7qJq/iY69?=
 =?us-ascii?Q?0WIzb3nZpZP1oHnzQcDR526yM9vWUgty1GuU907A488yXNauvdS+C7Fr/shQ?=
 =?us-ascii?Q?h+VBvhUYcEztuje4OLNJLEcvWu5uf1d4O7j8Dof3YGAFApJDOe8CsLU82EMA?=
 =?us-ascii?Q?0Z6PCkrPGdGy1fcXVvACBM6fBP6zIPbTr8ePpJTKgQ4/HbwiBAeWazfXL2RK?=
 =?us-ascii?Q?kXFSx4J1B/0nSzaxe4j1M9Zuz2Vrmh5usSEbZOyQL5YFhurPJwOTlngQu8Ot?=
 =?us-ascii?Q?vMrySy/7pd7kuzY5p27xJhOa9/NGZsI8xWq1UpZjxqz5FBdp6lWdaMp/H8oF?=
 =?us-ascii?Q?coCYRfN1inSZ/KDPWZOH4C+gNtmiZy0CWyzo3ImbIawFNOZPJDfAFntVKWud?=
 =?us-ascii?Q?pT83rUJX/nOEZlC2f2e+QTMqWSTUdPQzLONZR5mdhIM4POX4GEQ/SRJsEGX6?=
 =?us-ascii?Q?+ycaV7JGG1ZQ0cYuHSKPXiJ/EUa8CZDP0xI8t6/hNSR7lPvT86KjLyk2SRG8?=
 =?us-ascii?Q?iZqO6De0V/akz+oC8Sp4d1GO6r+2L7c9Hgu7I79qT4L2G47IOdvKt6WhA+p/?=
 =?us-ascii?Q?jzkwe6H8M4V8/g33dpXHYVpDAedqOcs6vxZHQV1KrcS2Nc/H1oM2xeG1EFr0?=
 =?us-ascii?Q?F9oTQPgHgXV784fc3TPVDmVB1mJWXySKjlk9GVbf3a4IJ5JmQTNNZGwcM/xF?=
 =?us-ascii?Q?GfeFDN32XIEZk1LfDjPSPAZQSvUXfrM6xkoC/k8ZsAbZI9kH86j2sg/CYkd+?=
 =?us-ascii?Q?UdYVk73AhJInVz9zIJGsdBdwuB8eGrYQ7zKKewfhQ2GB4OS7LtAwYRl9fOMw?=
 =?us-ascii?Q?bCmfD/EgxLwE330fSrlV2CSTmC2gRfaYhOg2hEvZ9gsI9Ff5G3A7BecrBqzF?=
 =?us-ascii?Q?LhQwIV7/AlQnxCoZs7+SjHYa24A9OAeWsCHBaIrkU6ha4iUd3T57Xizeou0v?=
 =?us-ascii?Q?rO6BhLNe7mCDI1AFk0ppkjgYNGHN9xIKJZ9hH9H9EN2EJMfxqKQ32BxWN8QS?=
 =?us-ascii?Q?BMZhdLxuTIDicWDbCu7t9Fai/z5qMYBM6H/16nAagnC+zJU4OgOVuNsBtdmV?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f035e9e3-c210-4663-8e26-08da94d0ce35
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 15:09:36.3039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AzKc4/fqG35jwThyFrx/JwTpQnobiYCXZT0nz6RIe8PYhfrPAiyIUTlcW+aR+jx8bHbh7SAsq6aiw1QgKtJFuuFz/Q9Y2DETDxrWQNxAceI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4589
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_10,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209120051
X-Proofpoint-ORIG-GUID: 3JHSjfm-svQdS-ruHm7OnZ7ShXnaEEdn
X-Proofpoint-GUID: 3JHSjfm-svQdS-ruHm7OnZ7ShXnaEEdn
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
Cc: kernel-janitors@vger.kernel.org, Kevin Tang <kevin3.tang@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need for the "video_size_step" variable.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/sprd/sprd_dsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 12b67a5d5923..c8af4b5516a2 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -325,8 +325,6 @@ static u16 calc_bytes_per_pixel_x100(int coding)
 
 static u8 calc_video_size_step(int coding)
 {
-	u8 video_size_step;
-
 	switch (coding) {
 	case COLOR_CODE_16BIT_CONFIG1:
 	case COLOR_CODE_16BIT_CONFIG2:
@@ -335,14 +333,14 @@ static u8 calc_video_size_step(int coding)
 	case COLOR_CODE_18BIT_CONFIG2:
 	case COLOR_CODE_24BIT:
 	case COLOR_CODE_COMPRESSTION:
-		return video_size_step = 1;
+		return 1;
 	case COLOR_CODE_20BIT_YCC422_LOOSELY:
 	case COLOR_CODE_24BIT_YCC422:
 	case COLOR_CODE_16BIT_YCC422:
 	case COLOR_CODE_30BIT:
 	case COLOR_CODE_36BIT:
 	case COLOR_CODE_12BIT_YCC420:
-		return video_size_step = 2;
+		return 2;
 	default:
 		DRM_ERROR("invalid color coding");
 		return 0;
-- 
2.35.1

