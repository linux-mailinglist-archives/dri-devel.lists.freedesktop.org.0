Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E7351F489
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 08:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3117410E048;
	Mon,  9 May 2022 06:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B92C10E9F8
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 06:28:23 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2493H38c023694;
 Mon, 9 May 2022 06:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=QaFoFmx9iK8KA2bAzMa6rH4Cewxc1G25hrF4fywXGWo=;
 b=kAmX7YpdFgbS5VutfWayriggHKZ/Bpy7WxMFrm701BX9ehnPvFPh1RE8mW5DJXVLcLwr
 UQ2Mz/MlnfgB0MWAprJ/gmmzMLU99CXq3HnM33zpHILRa3OuyO5PomyRDz6neDbGuFLR
 +DfdA9TEzAVllsQZe1epp/BIvlY7uCeSlK4bmJM/39cadpzOfUrD3S7b5MHzarrR/5Mb
 R33FklMxZI1AJupd2HfqpjSCTswSQVu9k8/9KqS1IhMMpF4QqrNol9OB2PbZ8uSVkjSw
 kgYpCQixGmLFyGsjZjnLrF8QHA+LUBu+x9LcrQxkvNHOyGYevETCsoUXIZX6Y92+tqxQ dA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwhataaej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 May 2022 06:28:22 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2496KAG1017223; Mon, 9 May 2022 06:28:20 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3fwf715s9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 09 May 2022 06:28:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lkj8UaI8EM8/ukBySmHLMpXHgS3HYdWTjJn5KUxnZYRzdLf34hsCGKVkkAI2elP8C5ta1p9vBlRmPwFH6rDyVd4v6dVk7PoYogQQlCm2FzlvpyXzmYOqpDowTCycl+S+yMZwbcQFs1uI94IufRrXv7G1r3VUKbNu7nMR0WyFR43M+jND2ba3ITyvN9HffGDikNjO5SxGG/AGGfovKbEM3L4cB/SkAYXHnPh5xZFP06x7XH5B9RWFPvH+naz8JYElu+LUeZAFd6Xx22FOB08Ot0iUbgSxi/7tswuErqGZUtwhRGjZCrU/pkg69DmI7sgJ0v4yWeIuvYt8e7WtNdXPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaFoFmx9iK8KA2bAzMa6rH4Cewxc1G25hrF4fywXGWo=;
 b=DnwrnMoZXzguzxGlBTyQmp8sfgih6TTKcrhqrpd1UzLKDDF+AHuNpBYm4njuuZPIdyLqvzlQvNuZLYHieYwqfGhHysCcJ5GuQv0ze0unTski9d3duze5NZM3vm9iJUD/pZblY97G8XFpge11mZdxGOYiwiD1+ghvwqF4EJii9Ws9Az8hV5I34eTMZFkayTL4KbnQMbLHiVZsot+aJCGWlRqMq24VNVljL6NzG24eEGLChnwPy1yO2g0QZpZhYUZnWcbCI8D8TixSjK1TBdy7JGK+wwcy9umOhJADrOtU5p0GbmBx0lKfmWV8kfZO45xDAHRqoXXdLkeaKIpBz07wBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaFoFmx9iK8KA2bAzMa6rH4Cewxc1G25hrF4fywXGWo=;
 b=C4kUqlgaNsjbGVwNspUy2LR9EDLh1CGQCFA6+4DXOhYTpG2nZRPeJM4AmLynu764sT4qQDCR+rmryUSyNBHjzixKJN1NeI08kdYwmj8OvMb65heFI3yTELUIUBqN02e8cXqscPrlKTjRIEYYRP2vjBqAWieVzgB2WmgzbWidqgE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SN6PR10MB2879.namprd10.prod.outlook.com
 (2603:10b6:805:d2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Mon, 9 May
 2022 06:28:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5227.020; Mon, 9 May 2022
 06:28:18 +0000
Date: Mon, 9 May 2022 09:28:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: robdclark@chromium.org
Subject: [bug report] drm/msm: devcoredump iommu fault support
Message-ID: <Yni0d5Ve2+mJZzDO@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0034.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 832f5dca-67e9-4212-4bb2-08da31851b0a
X-MS-TrafficTypeDiagnostic: SN6PR10MB2879:EE_
X-Microsoft-Antispam-PRVS: <SN6PR10MB2879162367D59788AEBCBCCC8EC69@SN6PR10MB2879.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WUd5gPa02yhPRqZFfIyisPCTazOiCVLLL15Wu3yHetfhaaVskFqqhW5wKwfRhReP2i1GsKZrSb6+o+z2zoCR6/Qn9yL7hFZKvp8pQjgCCmwsFpZttKhAne7Wk64b7yXrM68Z9QdiO3IM34A306qdmIg1n9ElB6olGitGVenrL3QpCRVNULprx+9C1uDT5SFG5xrQ6XsaHCxtSw0yKnyMBWRP37zs5QP29qYmeVXC2WX+/d91Sce5oh5mvTlpFLprFVy22qfYwck6SvxB/dh7AFAUMGxUGF89BkWh5MLzr31Gnf8EZ6FrlS6hhNannbr+wY9u9sySdY3bWcxKUvhtPMCuWN93eIWeNqtKbK836f0EdY5MZCOX3h3cWf/nAXulM2hVMiCogBSZ35goOy/Yf/r/zLAIq444yvRoo2WYA3huGBGaidGwSSDPHOQpwiBMG8JUIrLhgvlQcWr5vPSpTyO/DlwfGL+TyQ7wUeYYRUAFsUfdHOtSdNm0KHtLJevLE8z0D/OD66XshWBvKGrL8trQBtfuP7GzRVLzLrkgYYMj8Kowpttd1Zaj9LTfOMKmMZlGohBD6cjklRJZ+IXMUXigINCYjlb9mPfuXQyewhRS+10j37NUdShtlGGnUJIRQXtygAksEaYbDoEpnWSErqPsTIdU49W7V3Pgcrb/OvX4042E1bHnlV1i6FyaQL9f+hY7sQsJn9PHFIdoOJTNwFtCt/7rPCzArQckctMcL0g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(83380400001)(186003)(26005)(44832011)(6666004)(2906002)(6512007)(33716001)(6486002)(9686003)(508600001)(5660300002)(86362001)(38350700002)(38100700002)(8936002)(66476007)(6916009)(66946007)(66556008)(4326008)(52116002)(8676002)(6506007)(316002)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZRkX0Hq3klkSGPEhjtQepZ/vVQumeaIGK7orBJCjqrg0KarkVhyKQxL/eLM7?=
 =?us-ascii?Q?Pu1b6Vq4WIksKoMct9PsantnpwksFCBFx+He8vo7nLVAoRq45FtcCc4gukrm?=
 =?us-ascii?Q?HO8SBJGYJ8SuwO9dohnf0Mulk90sGBmCowBAxQydQpTKiR5mjXt1NCABZezz?=
 =?us-ascii?Q?XODep0KW5ynKUTsyDaADkA/kDFQPB35+INYp3hrjiqdM4RlF+jU41LTIOCX5?=
 =?us-ascii?Q?6JhQdUJ18MWGwfuFTXnTB6Ze7OVstftQJPkDFgZPlSBExZop8PMPbbGfBPZl?=
 =?us-ascii?Q?eb6t8oOG5FSmph3Vwzq899mmKRVuYYz+h9aDiPRUvhJVmRbKx6VxGmivRkMz?=
 =?us-ascii?Q?wk4zMAIO0MhmC2KWqYaxWvqS+jFKwYFWIX2tUkU4vItPTG6Ij/pzs9/zXPaM?=
 =?us-ascii?Q?T4Um9ywXi5lYwhTt0RV+pStPfp0eyY0IhykNUx5au4rqJ5lI7t5mZLXhVHOf?=
 =?us-ascii?Q?JLqot7EsTBFvzOgM71EH5R72m3scTyygeKcu10gjfTfCyG10/O+bRXLtoJr7?=
 =?us-ascii?Q?pyuYW7k0+2NwEL6QZyDPR/z3A8zqhpVBTDPldZz96OpVBzcFizKRGUZU28tU?=
 =?us-ascii?Q?LU/jhK5VN/s5fkFDFzVtbTNmmzrLFKKqVz/2LD9rrEzaJzaHB8vAHrrhuqv0?=
 =?us-ascii?Q?QOMOVy5ZabLc2bPPqKuuYFFle0CXtN347E95xkTed2abgNBVFWuXaVCR/ZBQ?=
 =?us-ascii?Q?JajxDdtIxiStlB4I/MN3+B25iu5krlJ8KZUr74KxqE+/BaGsRKvOksOLri3Y?=
 =?us-ascii?Q?lFsrbnAo/NU3bNUAC5jbH4rFEFj9TLAqV9yrUMXwToSGsuhjE08go6cZJN2i?=
 =?us-ascii?Q?aPw4Zw9MKLNXSlJ+t7ZcagzzEPXt0c0dxd2BByxVKkko9fxwmMXFbic+cMwC?=
 =?us-ascii?Q?mWV6//iQOJr1svNw1Yx90fE9z7JPtigSd/ZqQXfBQoZR0ZndVTi/5WdKRt7+?=
 =?us-ascii?Q?c8F4TZlRcTFbVRhn+dFNSVMWRVDkZAzXyjSUTUz3PwuVIQ9fOE7Go5uQO7Sq?=
 =?us-ascii?Q?m6m9ri81UwAItHm3l5APcbvUhIz8GPNB+cKjCviXVeILiE325iXFZqqzojpP?=
 =?us-ascii?Q?RvOJy1XsYKNf2YSidz6EvlRUJp+b7iZ8zGMrODTaaVZI6pYv5yLNQiSHwnUX?=
 =?us-ascii?Q?1YmJUsMWxZ1PB1Qna9ijP/8WI/Ld21sL7hlIltLgynmLWePpW5roO3hYfEdO?=
 =?us-ascii?Q?egYTnryIH1A9hGQlqvXi1RyLZ0l0zAF/sqqemV44+LWJ2WgGV8RFV4+oa96N?=
 =?us-ascii?Q?MKNSO0tkbQiyv9BpSFXFme5UFpFKZPCu/h1SQE8r/BUXMxHbh/Kao2eZsW9k?=
 =?us-ascii?Q?iOQi9kW5RDlSCYuAm8KNEnsEWToDJcPW3rQD7Cncllqhhr2RAW3CJwTXNpbP?=
 =?us-ascii?Q?Nwn7iR35bx43DNMUmzHqvJQ3Fusvtnyfirt7CaTqBtA5YsoSf0f97lN5cnmv?=
 =?us-ascii?Q?xrIWZ0iZxC0cDEQvEasuEEmVa576DqC7UV3zXqDvVVXSIq4Da69l5K+myOtu?=
 =?us-ascii?Q?wH6ZZNccwfMxx/HaGFrbHwQ3NE0SHpanaSyKmEhdrFlrTX+ksW72DkCvak8J?=
 =?us-ascii?Q?2Mcow4+e6/x9x8HMtrP1T/zl/igHs5NlKt+jnPQ7bHdUNgmhMLlsDhrEO3dA?=
 =?us-ascii?Q?BIY9mLsA9NN8tIskOdc5Mpn6huKe38LtLuj9dV+JhxepDCBN2Hng28BQarEI?=
 =?us-ascii?Q?G3k9H1Xu6szJhSrLNJn34eYfJfdwMctbLtmiuj8fMTWYQQH0wkEJAAG0Egho?=
 =?us-ascii?Q?tdn85Ph/Wj0buKkoXIyvuvayjhKbAWA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 832f5dca-67e9-4212-4bb2-08da31851b0a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 06:28:18.1667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyJo6zmbxviX9fBCiqgEfQaFcimTTFfPq1It0gbv1Yr1TI1vR0zSs6QwagBpWW1Zyh08Fha/60PAcPxM9h6uWX5n7CfPr514PDlVlHw9VTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2879
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-09_01:2022-05-05,
 2022-05-09 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 spamscore=0 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205090036
X-Proofpoint-GUID: 8TARp0x3wiJRhLbMUa7weJabUwUuLjb2
X-Proofpoint-ORIG-GUID: 8TARp0x3wiJRhLbMUa7weJabUwUuLjb2
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Rob Clark,

The patch e25e92e08e32: "drm/msm: devcoredump iommu fault support"
from Jun 10, 2021, leads to the following Smatch static checker
warning:

drivers/gpu/drm/msm/msm_gpu.c:418 recover_worker() error: dereferencing freed memory 'gpu'
drivers/gpu/drm/msm/msm_gpu.c:497 fault_worker() error: dereferencing freed memory 'gpu'

drivers/gpu/drm/msm/msm_gpu.c
    376 static void recover_worker(struct kthread_work *work)
    377 {
    378         struct msm_gpu *gpu = container_of(work, struct msm_gpu, recover_work);
    379         struct drm_device *dev = gpu->dev;
    380         struct msm_drm_private *priv = dev->dev_private;
    381         struct msm_gem_submit *submit;
    382         struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
    383         char *comm = NULL, *cmd = NULL;
    384         int i;
    385 
    386         mutex_lock(&gpu->lock);
    387 
    388         DRM_DEV_ERROR(dev->dev, "%s: hangcheck recover!\n", gpu->name);
    389 
    390         submit = find_submit(cur_ring, cur_ring->memptrs->fence + 1);
    391         if (submit) {
    392                 /* Increment the fault counts */
    393                 submit->queue->faults++;
    394                 submit->aspace->faults++;
    395 
    396                 get_comm_cmdline(submit, &comm, &cmd);
    397 
    398                 if (comm && cmd) {
    399                         DRM_DEV_ERROR(dev->dev, "%s: offending task: %s (%s)\n",
    400                                 gpu->name, comm, cmd);
    401 
    402                         msm_rd_dump_submit(priv->hangrd, submit,
    403                                 "offending task: %s (%s)", comm, cmd);
    404                 } else {
    405                         msm_rd_dump_submit(priv->hangrd, submit, NULL);
    406                 }
    407         } else {
    408                 /*
    409                  * We couldn't attribute this fault to any particular context,
    410                  * so increment the global fault count instead.
    411                  */
    412                 gpu->global_faults++;
    413         }
    414 
    415         /* Record the crash state */
    416         pm_runtime_get_sync(&gpu->pdev->dev);
    417         msm_gpu_crashstate_capture(gpu, submit, comm, cmd);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^
This function calls:

	dev_coredumpm(gpu->dev->dev, THIS_MODULE, gpu, 0, GFP_KERNEL,
                                                  ^^^
Which kfrees gpu.

--> 418         pm_runtime_put_sync(&gpu->pdev->dev);
                                     ^^^^^
The gpu wasn't supposed to be free so a lot of things go wrong from
this point.

    419 
    420         kfree(cmd);
    421         kfree(comm);
    422 
    423         /*
    424          * Update all the rings with the latest and greatest fence.. this
    425          * needs to happen after msm_rd_dump_submit() to ensure that the
    426          * bo's referenced by the offending submit are still around.
    427          */

regards,
dan carpenter
