Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A92555BEE7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 09:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87983113EC6;
	Tue, 28 Jun 2022 07:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EBDE113EC6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 07:00:21 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25S0c8ff012964;
 Tue, 28 Jun 2022 07:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=YrJgsxZ9gruJ2+2vNff3ugRlc6esqrnpsSrX9fIkT/Q=;
 b=S+ePugYfb5NiZisowefpQcNrh2jfANIxMiPWHvIfh8vspGp+xhLJeeEyFuMJt1TuEuwq
 r0LCOvRdzZ6mOHaqhYkj61PZR8fjuL7pjpZIdUNNoNPuxaZl/sdhdQuzFLkm1ROIMD92
 gb7gaOHF4DgRlNBv4GQFigJXqv/Mp1oxV95f6krLkhsHyo/m6C1xktO4QxyQzIChrYjU
 iHKw5beL2ICWpEvmZTPoMMGWdGw0DOOGlmW37M73290hpt95Kbndmod0jA5sUShmRuXY
 SPtSBbkTXdDGckzaBJ6xeq6eSGEy2L0pGrH2bWzzCqEnWY9hFkt5wJHTsrXLrG+nYHKi Pw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gwtwu56uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jun 2022 07:00:11 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25S6v3Hn004679; Tue, 28 Jun 2022 07:00:10 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2043.outbound.protection.outlook.com [104.47.51.43])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gwrt7pkjj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jun 2022 07:00:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P+OSeQH9JRo819TqCgzt423HLuJ1/UrgD/3Ho1Qxi+VFSBrQYGwCdL4wO/mIeVg9z1qKQZgvR8ehVAfMVfItCgkMRZxn8MOmEwGxbaGZU06OJKBTLMACV5tgnqnC2y6JDyJ/XQOn+kTgcZq6RsGGRjOynTTu1JP1oUcBa5ZmwdLv5CuA56az+Z7FvJxPplagTQzvY7mx9nzfDfA+0eSLiRAg1NcFUmslRF3zW0pkqtWGs3AQbdIyW5gkVFeDZgJqLDXSaVixu3Ypw0r6yB7TCm5mzgRGPTdejGa0qOhB0V9NixNX7ksQuYgW9qz2U4g5oUu6wDQ+aehJBuOW7g8Ovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrJgsxZ9gruJ2+2vNff3ugRlc6esqrnpsSrX9fIkT/Q=;
 b=YikYiSdcqJlccQOYDKswIvx/JihgoQ6TSc/llPcWX9HsBkCKHMaEpH5REjr53RF+qX8nZPT7ZPU+wvv0VJPKwYyhiGYgRbNyz42aMZvyaujhHITRI/dXAwsb712fzQ6jA74K38sTvVMN3A1Q/aYVamEoE7MCtqz4Q61Xhnuw1XkBreZrCYrH2i94FasDZYW9etoZlcq0cYbLPCeWlajp5jjSJ6R9sjqalvaXsUuPDCi4R09B0LvjiqfgyD8yg9j+bHBb3TAmQmVXyl251PBv0ppIbZuiSU/JHtl9Jsfveb6gynpmV7/HSPrs7DvgPLlmFMCwqnVfHt8uc9VDW/9HmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrJgsxZ9gruJ2+2vNff3ugRlc6esqrnpsSrX9fIkT/Q=;
 b=UwfXHlNuZ1GGCjI24c+1gqYfOaE058+GB8CW3RJRatmQxomxsoJK445o1acAY38DdwWvryGAkwrFcKk2KeZ/b/71lcu9yEGiUzHwkVlRDRMNJDP/N8G7JMNTspUhacFJV/zfnW5ge8njiYGrgMT+tJMh2fh3cXh/ln08hJL8DPw=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH0PR10MB5643.namprd10.prod.outlook.com
 (2603:10b6:510:fa::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 07:00:08 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5373.015; Tue, 28 Jun 2022
 07:00:08 +0000
Date: Tue, 28 Jun 2022 09:59:51 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH] drm/bridge: Avoid uninitialized variable warning
Message-ID: <Yrqm5yYVa6xMY2vq@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: LO2P265CA0462.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a8b27d72-e3c8-4efd-2bf1-08da58d3d656
X-MS-TrafficTypeDiagnostic: PH0PR10MB5643:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xMj2+uxTcCDHi7UsjCke2nFKry6rXKahJzwasNKp5vHInpevaOFAgMXTKUZegA8J+uJ6qOp2Q5fxa2EOZ5jn10UzZ4K6YdZ4vK4XEIrOSKG6bg8PxTPSxiWVEk+rVYsvLJIycCeX/QNxMkmOckRtxZ0Y4LY8oF/XVy/lQu49fKi/C4N2M0dFd/UxTTGfdBWlWBag//4APP8TuVKmKYQYWcczT+kPnrEkFehuAw2cHmpwXXvI0rIV1AsAu6Fl6MLNvz5hvfB4wq6SkvJ8mAO4QY3rOJZYXa7DqdmskWqab2SchBEdBHFmaeCJA1lL17C+Yg52QPYY6a9Ecb07PeXfbXE8ok2gepF9YQOHbj1LE0fTVAoqL29gxIElmEzE13R925eEAT3dTT7tl1YN9ubgkZ1qFb4y0SK5qWl1kfqC+AE+B6Hi7cl61u5GbfK62w1wZ8aL61MNmSUHJaOIMLWZJkGUNEVa21+7MdeZvsiBnn9QnB0ycxXMv60tv0qbWABNdPEJgWYzKWWzAqRcRvbQ9Qp72dBQctqI6fc7WLmqh8JBG6p6O0isi7JewoGqCBTrhWwUC2AQ+8KXIng+VgsukqdmEoB1RQTTyetmrEXA0xFe4OvddeGUc+/S8sP/4Q/dv8UrQiCeWEvf2o4MER7ymKggW80SJEXPYA2ju0hSz+S0epfbeJk6V1mnvAXGAh6kNPys1JPgRCWo9kMYwYoBovMHn3ujDUeS1a78JBsJ2BormIG4R4uAB/nF8aES3uBp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(136003)(39860400002)(366004)(376002)(346002)(66476007)(2906002)(83380400001)(4326008)(54906003)(316002)(38100700002)(66556008)(66946007)(33716001)(8936002)(6486002)(5660300002)(110136005)(7416002)(8676002)(6506007)(52116002)(6666004)(44832011)(41300700001)(6512007)(186003)(478600001)(86362001)(9686003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dbaM88B/y2/OwN2Y6tZe4BTzmPIjCfBE44ScYStkzx52quWYVjfesFBNZrRj?=
 =?us-ascii?Q?TKWPLDJiyEnkNdnavlprPWlq6Uk7yE6rw0uw3BhH5eeBFyiUMLFfiQ+sJmwn?=
 =?us-ascii?Q?lyQ2S857fwE6ZKTHsrPmvZ1aexOxFNRkEq7XDIidA3SSNZjz3wbBV+YQECaX?=
 =?us-ascii?Q?rGRIijIuLMAJ/Q/KLJA/BZ/wdVBouvWdAV4zlpSlG1/3dYvNxFF5qgIFs0Ol?=
 =?us-ascii?Q?0FxniX8bY40WVw84sPXpdh3+OpA0SWBCsInxvKIMxaMQYcrhM5zYSEO7a4V8?=
 =?us-ascii?Q?zC0ahEWTGp9b/Wi2MKdbT1AKStx7mw+DKpfmOxG0pqHYz0A4I6Loq/K/hjBr?=
 =?us-ascii?Q?4SPcIauTAGCZeWXAwYMAn5R6/Tp4y4uzoaYpUH+mfVHbY/g8D5v3l12lAxEb?=
 =?us-ascii?Q?0eEhGxH7Sz+BLUkZeisUkhKnIPculcl549gdp/h4LJUon1D7a+zOxzXjYWT6?=
 =?us-ascii?Q?qALjxfW9Kn7GVX2CDuYP2QPSsHa7CZJffVezarwMJVud3DmUMn0FRGbB+Vw8?=
 =?us-ascii?Q?WMaAtgXTRNFsurtEmIJJcw7CNC/OGb7BNkNXRCG8LG8i2mo+ztmElabFU21S?=
 =?us-ascii?Q?ZmpkwN8BwICuHtsX7J2B35XJPy7G5HEb8MZcsv8oCY+dX+jIytS0A5ohVXjM?=
 =?us-ascii?Q?pQAIgpI2Ypz3wIzkQi/KdVutPEA4/vbxBTUkYEpD1NPM937Dy+SOzWDGP+jn?=
 =?us-ascii?Q?oVkhNTdRpvAwJ7uzZgXVkzHyS870zR93YiBjKmblQky25flfnW3zaI7i+lMF?=
 =?us-ascii?Q?0iCi3pA3xaWvQoGK7oE44sGimyOpp16rVctwgbLI/8XgmSAubDAQmpwMKOtO?=
 =?us-ascii?Q?6GzX/vnh1pjpH0cqRxqtotgMB0Ro2Go1Ui4K8Aag/TRw3oEPxhPt8L9beBL3?=
 =?us-ascii?Q?oVNKOXPWaZk1JSYq4+otDUs7Sg+/hGC7NEk2tFyILyXS+ozOMKOIplhm46GY?=
 =?us-ascii?Q?LDz8FBajcJMDvAxxA5kkueU+dcERHuCGJmCXPnGyvDhfuMJzod3ZOKJAjrjY?=
 =?us-ascii?Q?8xGLBZiuMXXFPNZkVfbO3Zt9MfgzOXtgIR3eTOfWi+3NqDGOAnTW0u2sV/Hg?=
 =?us-ascii?Q?24wErD9gWAcmasXXpVRZyQ81jCG3/yPhMAP/6xXZp4T/CFbNgWDef5/GnbAE?=
 =?us-ascii?Q?X5b1s3en+8GN4d/PZ7GSKnc+6GEi1TgENiUWtITBl7O+xrgnopZU5695v5ba?=
 =?us-ascii?Q?JKDfCcWF6AkpxOjqDHw7JIvGzJmdmCVCpwlOfCyGH5TUfvDIxrl2Ld+3dBFX?=
 =?us-ascii?Q?II6c/ysuorT+5JWxHvqw/BpXNN00R8dZEqYetwE0HF8XDyOBt8J6k4gpectT?=
 =?us-ascii?Q?wqp0lv+e+qVnSmUMzjBJlTbOIqp7Y7Z8c2Cv63duWI//rv0BhwlXx1wRasqn?=
 =?us-ascii?Q?LDiNy+JWZ4SEUxzWACw5Swn1l/4XJ8zcehkcMpTlVOaLP3wTeVOl0ARQ3Jej?=
 =?us-ascii?Q?Ncdx+mahL5HK777e5utw37EfIZ0FzchaHidrZ6APsxioAD8joR80jxz4gEBC?=
 =?us-ascii?Q?dVWhg1S6MI/Q7aBnZ65zIzo2+gyw6obaGp87kZAKDFg6pzyLPoZPVLUfbNk9?=
 =?us-ascii?Q?xD20LcFGymjbv/YFYjle062tJF+W7hqmDlfuJ6dYfdVsNSzBcPMVt4s3A4G/?=
 =?us-ascii?Q?GSmg2zWlflujlyG1Pa4V1dc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b27d72-e3c8-4efd-2bf1-08da58d3d656
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 07:00:08.6942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcxNYWoylnYyWd/zgLOVnhjAxSKM7qC3B8rVijVEdYD41bc0EEUc/07W1iYnnvCJlZJGH5abG/6Ouf+fQvkYqYjtqSH8+7b1SW/O1V42Ip0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5643
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-27_09:2022-06-24,
 2022-06-27 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280028
X-Proofpoint-ORIG-GUID: ZfBmiPMW8m1uLVt5oXOx51TITVU2mshf
X-Proofpoint-GUID: ZfBmiPMW8m1uLVt5oXOx51TITVU2mshf
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This works, but technically it uses "num_in_bus_fmts" before it has been
initialized so it leads to static checker warnings and probably KMEMsan
warnings at run time.  Reverse the checks so it checks for failure first
and then check for unsupported formats next.

Fixes: f32df58acc68 ("drm/bridge: Add the necessary bits to support bus format negotiation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e275b4ca344b..00cbde654472 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -897,10 +897,10 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 							conn_state,
 							out_bus_fmt,
 							&num_in_bus_fmts);
-	if (!num_in_bus_fmts)
-		return -ENOTSUPP;
-	else if (!in_bus_fmts)
+	if (!in_bus_fmts)
 		return -ENOMEM;
+	else if (!num_in_bus_fmts)
+		return -ENOTSUPP;
 
 	if (first_bridge == cur_bridge) {
 		cur_state->input_bus_cfg.format = in_bus_fmts[0];
@@ -993,10 +993,10 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 							crtc_state,
 							conn_state,
 							&num_out_bus_fmts);
-		if (!num_out_bus_fmts)
-			return -ENOTSUPP;
-		else if (!out_bus_fmts)
+		if (!out_bus_fmts)
 			return -ENOMEM;
+		else if (!num_out_bus_fmts)
+			return -ENOTSUPP;
 	} else {
 		num_out_bus_fmts = 1;
 		out_bus_fmts = kmalloc(sizeof(*out_bus_fmts), GFP_KERNEL);
-- 
2.35.1

