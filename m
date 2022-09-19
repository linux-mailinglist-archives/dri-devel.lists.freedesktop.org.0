Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C4C5BC2E6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 08:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC7D10E3B2;
	Mon, 19 Sep 2022 06:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C7110E3B2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 06:36:43 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28J0x4pN006295;
 Mon, 19 Sep 2022 06:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=wXl0KyVbiovoN1gjKR5y40VDRWlH23efGCQUT3/KFVo=;
 b=wGFC0EtJPWkxtV6/GSyYwu0+H8Y/ZYbT3Fry35YT4J3v8QvOXEfVv44gNFjPfa8wmVLo
 h+eiFtmxUSbi/YsNoZG9YiB/Bdf6pSHa/ekbdiTiZmORBVVOjM7zVdchHbk3jrjcQ6zu
 IeYkitYKOy0YhGHp4eoXeq9R9L/p6HSkeruyaxEZpeqneQTf93xvZyNB0BxgpSEtbNl7
 oI+jmU+Tm2Y6vaP/WJ0q2iWCCqSw3UWET1A+uDyyS9HY5Yxgp8+N8dW+Y/avuN+D3Cyp
 8+gNPiH0tYsZTHHW/oM9i3KZbyqspbIKSobhXt46+m5Sr4abWammtgwagh3jQpAR4Jqa 7g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3jn69kjtmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Sep 2022 06:36:41 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 28J4YRGI019019; Mon, 19 Sep 2022 06:36:40 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3jp3d0f6pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Sep 2022 06:36:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khAalU2L9VLGsuuUulD9qsgrzM4bKjM4KDskhRvXKexYw8XlUm1iGkVpOfYuq5+5pWN75HbTPgBx1fU+j8xRojUYJNGUogUjKYUygOUwNwFf+g6z7erdFtw2MKphjggO54Dm7vU5pBMkUcNQFMtDgTOK06YmQfx0BCJ8BUnzQlRTBOrhjq/zY78koiHHSJtEBebKlrcnG7ZXku9XWRnEi5He3GNIDBHK+88yeatpCiKzzV34Jh3DRAdHtZNkuvADiDHvxhYmPqaIz+z5FLChp0QsjKiAaSJWzgVlGqLrJJpLC4T+Zq5NzXl1y6yqX4SFyH9BJQ388Hgz8PqvUQixlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXl0KyVbiovoN1gjKR5y40VDRWlH23efGCQUT3/KFVo=;
 b=gP1x5muwGHhfDG2WuunnagFs7UrQdRYSXnKtZafMG7E3TqZEawI0iapaetT0pVaRj39DjJztFOGuE3jCtH8/vQOlUe00IoNJ99kEZO9925YMjBty9Yzl0NFCi9qQtaC34gIFsw9AB+sJnWxA8UzUjcOSH3K9ntubu12nPGV4KOhmChieIeMn6x4/3SAWBNq5z19syepGgPizItT2wRmNbqjrX/uEL00MaNV1Yky9lyPmcdczaYIEq40f+27exFkuaugPIb0VoBNAM2d38gbM5ePVAGYg9zVGpfOSggX9WM1i3ry0q5ne1m/1O+9slXHEw+diH7aphNVnAt1i1J8idQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXl0KyVbiovoN1gjKR5y40VDRWlH23efGCQUT3/KFVo=;
 b=W00Mb6CICnnq/zIlheIUQtbRd/YKj09yRCOUgROBia6HKw9IcDuWmMqaL6ogVn1wcw7PdHGEmoGv8e5FunSk2HaLDE/cA3mla2rd3WnFyK28UoIwgdgUqqaedUEwo+hzB5SxYF0vQi10JKtQmq5ZWxeTB+8cO3imrN3oYRYsL8Q=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB4935.namprd10.prod.outlook.com
 (2603:10b6:408:128::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 06:36:38 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::a493:38d9:86ee:73d6%6]) with mapi id 15.20.5632.016; Mon, 19 Sep 2022
 06:36:38 +0000
Date: Mon, 19 Sep 2022 09:36:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Airlie <airlied@linux.ie>
Subject: [PATCH v2] virtio-gpu: fix shift wrapping bug in
 virtio_gpu_fence_event_create()
Message-ID: <YygN7jY0GdUSQSy0@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-ClientProxiedBy: ZR0P278CA0176.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|BN0PR10MB4935:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b280a7-b2fb-494b-adf8-08da9a094e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMHjGAcrgjfcbkPk7pM8zGFIhhSVmkNlRVNU3yOYdYGAwGV5shLy38gPPzdBGBQ/bONa0fSayVF3L94OJe3m0pDJEsqMc5TAT7iR2AJlBVRO+e4Rb0JLg6Y5nOATeLxZfBpqias5mNosydj48PkzBt3hRredUHLd5HEFq0f5ymbSsnclf2C6djttYpupw9BS56s/Yjuw5rOiPWYaW0Q11LYGRiaPYMVa7WqGB/v0Be1pzYDCoplrLc46EtqTbY0ZdTvo3I+y9db19SzS4KCkHGqJb4RTVQmiHyuPhjJtBOe3yGC9AleAnwffR1xvucHvdZhd14TcK5RQE9/pRaCgcB6scV8UA9myML1yU2+/8Rvc+IfWZ+WErBFt/1+jj0hFPcgfkOJII1Uqdovsl5J39b5FtMZN41O25TmOvLeoxes/E4eCjfmDohTfB5I6u0SBj5ZEyzlJFgkuq/neS2+XyXg+o2VLa8cQrYqvRpW7lIWRtWtIagPhQe9nu+VdeNc9L6F59lsDgCWChdrYcFRHstpZWHnIuVJqsbMvfxH+4EaUOmS+JB7MqqQIUEpQhU6B/l7Jma02eECzSNocHvV7LCCpM+0WBdWOBEaHrwJwmYFThahFSAdAMQnY4dmsvywW5KXIQUyoQvMCCZ+JxbusppyY1gbumLu7Sn9hZXKvlHviaj7zGIriK7joXlPfrO5CKZuyYoLHc6gybT+PQtfHtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(396003)(39860400002)(346002)(366004)(376002)(451199015)(66946007)(5660300002)(8676002)(4326008)(66556008)(66476007)(8936002)(54906003)(6916009)(86362001)(316002)(38100700002)(83380400001)(6666004)(41300700001)(6486002)(6506007)(478600001)(186003)(9686003)(6512007)(26005)(33716001)(2906002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RKdI37ffd22EM8Zzm+dckaoQpr9R06bAYvJm5M3JrxNatlsH+mt+E0i/p9AX?=
 =?us-ascii?Q?L8PSiu7tGAe51UixGgtRFHVHICEfEpv+CaCd7nX24DToIhDmWhjs+xElb6vS?=
 =?us-ascii?Q?q0f0ycOa9AsX/L3QMigNfO6GUhtmu3RcVWY4jUyn5aCMaLmuFIG1J1PYW3MM?=
 =?us-ascii?Q?EHWVNDXkFRJ+zQjESxuGI7LAd2mByyXWeZV8AjOLdfe8qHqZiWjJh1DMQT0L?=
 =?us-ascii?Q?tSuwI4bOcqv+0FzWCEOVPe3M7lNZhW5Lj5jPjCwvd0ZqLQ3KJhzXygATYwBI?=
 =?us-ascii?Q?F9D7toxawCSUWI/qgnZUVlM5N4zktrXmlMGdKVdYdEII++EV+MmCD0KQ+ji2?=
 =?us-ascii?Q?X43UU1UtiT3Eds/P2ScCx4506uksytQTmgDaVaiN8e3rhDyl1FzrbRlAP3z4?=
 =?us-ascii?Q?lqNLxie6ry+uvw/ItC+CnMAD6ll49+yzhD43oSBGRRynHLBcr5TWtAdd4f6c?=
 =?us-ascii?Q?aShLHZLwLS+IJmc0RvIP5Ij+qIX32zrHGez29dAunRLoJqsN5zRyekXxjRRV?=
 =?us-ascii?Q?lg0WZjVpwwlNKzaAHJlXFBOCFg5Y4RQNZBuZH9GngBzNQ63eocgzXTmO2FsB?=
 =?us-ascii?Q?DylqXrNOpT8bV75PiC13uv0cQjis2rgsDFowK5b+0g/t5SWw0kX8ucvDpHA7?=
 =?us-ascii?Q?jdgkJEisNCWhxaPpwy/VKVP3GyWBXgkEX6bAID0bMgUHk4S1eCz68vYRfjkv?=
 =?us-ascii?Q?i8QT9oQ1EuTtLUqH7Daymp5AcW3ocFe1US8o1FuBDszJi0KUtzFYzebmNjKN?=
 =?us-ascii?Q?vfu9ObOMfzyTLPtiF6XuV3fw2f0aI5q7BhWHjLwfki1fA/zqSmq1HZY+hvHj?=
 =?us-ascii?Q?OxgNCSg+7uSvn/d9Qpx0Jsxq9v5hBCMasHWj1FkTDwYmodN7vPH5f9VQSIBb?=
 =?us-ascii?Q?xG4qjMTX97nBu9rneDpOU3YvwlaJhDZ8i8i2YJ6pwb3Dkub+ohVGn0vkKs81?=
 =?us-ascii?Q?rv/kF/2uf8un64giAivkeEB8mXAnDjxKL7FyV1E5Et56T06dyxYI/2UXN2w/?=
 =?us-ascii?Q?I1UCoG0FUpvbBdSNK3JYAzZNL3V5yQTXja3Mst4DxNqO9yJgmiYT9IGRQBi5?=
 =?us-ascii?Q?TQUPd72H8tzUn/8Matv++wIeKU/nd3IZkGMKm9wOUqd8T841JnyNGyrD4Yfx?=
 =?us-ascii?Q?ZB2wFX0CdvVM7OAhfokB9EztXt728wPV1s/I4KMps9erlFOitlXPRS8ocD8B?=
 =?us-ascii?Q?U0b682md7tX3N6aKYcXneA7v6TODan3aIjL/pS00G8zkC4JmHEH7uTPI5FZK?=
 =?us-ascii?Q?hCwl4jeRd8Xo/cSK8X/R47H2UEjTfAyNP2Zxc20PGW9cBEle5tOCFnZ2FNip?=
 =?us-ascii?Q?BzyM/1UWvdBpCQ1m7f7sBWdrDTZ7Do8TJ6Feacxoz3WYWTeAdwUKOnzqqPYF?=
 =?us-ascii?Q?wAr0eJMbZN2zsiQ5phyvgyKHsWUpLwkMbOrpw8JKzHMUTj/l9GLLjzZx8xsc?=
 =?us-ascii?Q?qSIOiygYMbG4FE0IWczmKygkTSMy64VWcvH80Vg7PRjjOqeweMImS5zzF6XM?=
 =?us-ascii?Q?UlXo7LQ2BscLZWGtOE4klAWZ3dCOijOyGEKZ+8IFu1zmjaeAFiimgURakGfb?=
 =?us-ascii?Q?ldVQJ6t4UwPDBYHmbiSkN4S057CVYSSQobCYG6Pq3z/IY3D6R9Gpk7CzEDsF?=
 =?us-ascii?Q?4Q=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b280a7-b2fb-494b-adf8-08da9a094e44
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 06:36:38.7509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FLe79H/1fT5yEZKBDb8XPUmLX2I7BEL29I1ebTU1pYuMKuBSoP4/IOsovLf5XvWAAFZnL1EzhmRx+BsrvOq9MPEOX9wMr8oKI7mSEqswe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB4935
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_03,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 malwarescore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209190043
X-Proofpoint-ORIG-GUID: zoor33SmyTxLSNvlrP2_hii94-ZwXNj-
X-Proofpoint-GUID: zoor33SmyTxLSNvlrP2_hii94-ZwXNj-
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
Cc: kernel-janitors@vger.kernel.org, Nicholas Verne <nverne@chromium.org>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ->ring_idx_mask variable is a u64 so static checkers, Smatch in
this case, complain if the BIT() is not also a u64.

drivers/gpu/drm/virtio/virtgpu_ioctl.c:50 virtio_gpu_fence_event_create()
warn: should '(1 << ring_idx)' be a 64 bit type?

Fixes: cd7f5ca33585 ("drm/virtio: implement context init: add virtio_gpu_fence_event")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: Style change.  Use BIT_ULL().

 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 3b1701607aae..5d05093014ac 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -47,7 +47,7 @@ static int virtio_gpu_fence_event_create(struct drm_device *dev,
 	struct virtio_gpu_fence_event *e = NULL;
 	int ret;
 
-	if (!(vfpriv->ring_idx_mask & (1 << ring_idx)))
+	if (!(vfpriv->ring_idx_mask & BIT_ULL(ring_idx)))
 		return 0;
 
 	e = kzalloc(sizeof(*e), GFP_KERNEL);
-- 
2.35.1

