Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9C360CB13
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 13:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77BB110E31D;
	Tue, 25 Oct 2022 11:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A1810E31D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 11:42:03 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29P9joDE032280;
 Tue, 25 Oct 2022 11:42:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=3GpSHHcqIpSm8dsdAOgmpWjLm35cy+Mv8SN5vvWg0QI=;
 b=JtJW9MWzTKVmxqkHBNCu7swJMpsWT03awxVHmQ4uF+2SvPk8wPEVEgexWahqmKrcQNGF
 GNzkf0vT9e5Gte0gFsYagPU26vfFgw+OrytrXEQgIZtN90DJ73sunTELsw+c0vRw6CKt
 PHg59zQ0NfKV0RRtTOXQT8zoO7hCWocil1I6jrlMNZT2YntVDPHAG82yKyDLFOBmb8xs
 8YP16CbtdQojytu/AmqOIft8ivnFL60GrXfkA2fmeKlCtFuSgrsEjIaDvvpse1UQ/xYl
 EvBds1aNnCfzHSXdkSFjjJyoGID8xdktquVM5sr0OyB3aEg4U6154OvvwnN54bXP+DRN 5A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kc84t300f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Oct 2022 11:42:00 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29PBE3ln039761; Tue, 25 Oct 2022 11:42:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kc6yajvvt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Oct 2022 11:42:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyy0+PO5FA/DlevCjF6JYJMiVGch4kuu9s8COtnconbW7qIJwL1ct3OHe8OGoMLmnXTS59h6aMrocjqsQozqKzX28UrtewYyi197DMwGQicrQdEsBRpvX2ilr8aObmMh7yR7XiOapPv+3WSQYZYfjcaAwKKZrgUSz0CmbiAC9RXQCUAbS8StdK+dfAqaGNakMi3n9r/huR3x2yxob1LTvUl5KvwkHVntM0WdaZRupj6Lm1wvaxALUKx/vgXxFDdx7I3VC+cNu2VITRZfx086amUGKi+FFTASEb9E4a08xRxR5jcC/voNboJ7YEJJT6I72Wn/f3rMXSbr2c9zx1uCqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GpSHHcqIpSm8dsdAOgmpWjLm35cy+Mv8SN5vvWg0QI=;
 b=EPMbVpJQqRNBgeNp4HdIrHG0Gkbj+p5OH2+hRAFBNQHSe3JmWOP8cZs29asY4w6HbZCvbyAXUZXLbzgecTSMD2nvLUaOsrIVm2dziCYB9fyUCvCPwaSTH58FXFWJcwLdsxjaN9mKArw06hnwPyNQS+oQSR92cyFnaB+Ji7fDzpFihgYiCQeZEDWEjunvrHKnPf0DTBSV4XqxXwy6Rau4qqtJFau/d3wlCn7QQCOr2gPMQaYhPQgb+3lAGoirg7Cas5NapFkPLYblP4jizJKm1fDiIhpQrCQAEm0r1jMHpM6+ZMuqT7CpmoGJKZ3YKcchxPUpEDy5x78CTYmIzGzFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GpSHHcqIpSm8dsdAOgmpWjLm35cy+Mv8SN5vvWg0QI=;
 b=KlEzcKqlyVq0DsZqoIlLcS/Muex2+k6+htV3UG7whPDow04L+BzavPJzwT7Lb5em7rnFgWrV09cH4nde2iFyEXV536XpqGIM1NDNx1lpOLqvoeS5XqQWOpRilodN9gHbOWqP8v8cc1zDAlGgbqPBoFJiQ0sX2F37PipDfpoUacg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by PH7PR10MB6532.namprd10.prod.outlook.com
 (2603:10b6:510:203::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 11:41:58 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::1b8e:540e:10f0:9aec%4]) with mapi id 15.20.5676.031; Tue, 25 Oct 2022
 11:41:58 +0000
Date: Tue, 25 Oct 2022 14:41:50 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: dmitry.osipenko@collabora.com
Subject: [bug report] dma-buf: Move dma_buf_attach() to dynamic locking
 specification
Message-ID: <Y1fLfsccW3AS/o+/@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0038.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::7) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2365:EE_|PH7PR10MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e808d31-5205-4208-beeb-08dab67dec6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jG8LIk8ClS6hFGW4BbOqsUTC7fqYag4qCUo8mnX5ArmhJo+7JJ6IhOmM/JFDL7YmWEUuQmYNb5PVu6LoIb8363F+fRUeidqfrsLNxAGG0OeGzIhAd8fkkggGAxdrZKksc2IcgP/EwJl37dY4gGXe30/P4s/cC4H0ZUxISS2I5DvRF7+2JnyjTo8B24QuCajw4XNjagy6g+pwMmFh9iVpgymYAPhcobEJ1QRJnNSpZseWKDKxwsZiRAvWRX9wvEEoh46AoAkVrlN+itQ/DP0i4yy3d7qLTJ7WBklTwGg4GZAAXciS3S6LT9+PeyA/rbVmbhcTrK3to4P1Q/o7vfBW/tZkeAmOz7GT0yD4vhgT6xiXT3oMu4edK4R+ckRwP9bOgxvXp5w4oFiO6NrsbwNJiOYlX3/q1FayfSt/DwsU8hlP46wGt5JH/BDjYNWcn9vzQ1Ii/XlDljtWyDNpVtTDrxlbW6McjNfa9g9N2ysA5R5ZAalhYWQJTrGHcCiEKrYZHLl++imAYPWj70yskm/r330CrI5q3mRKfBVwhSuojtFmEdt5gT0t9dz3qcedJpNGv/JusUj3buFnCndgu1ggbv8q+uOy3xdmQrv4U6n9f1v12lIUfOmW5/842ejLjOlKBt99iKNknkoRJP3LiseUXgjaMXkQyr8rYzPR0El1rBTsUkMAv4JG2cyKJmBSFZeRhG4hXyqVP+8q8jHe++3KNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199015)(66946007)(8676002)(38100700002)(5660300002)(2906002)(44832011)(66476007)(86362001)(66556008)(4326008)(6916009)(8936002)(316002)(41300700001)(9686003)(6512007)(26005)(186003)(33716001)(6666004)(6486002)(83380400001)(478600001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I9aJjkfMvO8UB7iajGfJMNOXmPvrhSRmpxcsVoE+oGx8PrXXyJ6th6Cyy/by?=
 =?us-ascii?Q?h9UuG9oPL8P70Ixd3IZzs+nxvQZbt+AqJsqy2FVlTScjbNpzr6ArK6a7gfru?=
 =?us-ascii?Q?yYvs3iSi9bQFQ7+QIdXR0qXzrER0J6vkjfJ/qkObdMxRBbELyMZwm2rQiCeF?=
 =?us-ascii?Q?k2yFGMHAgjsrHa1NiAHC1NbPIisEJ/3IbSaXRbcQQwJJmRO3TnMJZu1Ls/na?=
 =?us-ascii?Q?yQBDhaaA3jJeYpOyPOacHtUmQD5s2xoSaehp1cQi8H4UGuOt6YwnEJJRUPHY?=
 =?us-ascii?Q?H6yKgRLeeE9PzJz/8hjsFFu7TI4qIDPzypImE/JcWE83805ipZwAYxubeFYG?=
 =?us-ascii?Q?L2HYH2G4hYwGSjVP+NSnWBXNJntMnhbnc2iftK9yHpj5WSlUcAbUUkjaXgi3?=
 =?us-ascii?Q?Xl3ADlh9bCa83IFcrhjugw7tH26zhWJGzfCYVfqd4NGBwGDTX/5AG2PUK4gd?=
 =?us-ascii?Q?T3AE1zMc+iUCYgCVl17mSND4lMb0VH2pGmKxEn0uKJOqM+Rt49UvDnpQ39SN?=
 =?us-ascii?Q?KaddM5FlsdVPVjP1UGtuNtHgppVdFnt3CGIwFusHrLg5NFO0rvTJpc7+ex3t?=
 =?us-ascii?Q?Qc2npDMfwtgJQiA17woPq0x3FA0dAU+9BUT1qxXX8CwP6inzOrnZxY2juaoh?=
 =?us-ascii?Q?f6la4zqBmFzH+GoJfR74PmhYUSH98HSVvaEKz9gwKF08czYXbbLl7gp7xOM1?=
 =?us-ascii?Q?SravQEaPvGTp4X+5skdLV/fWN/NTGnEm0fnPm89NiCJR7sAESoXFVk47qXpj?=
 =?us-ascii?Q?jEj6ZHw0QPgF+3RG5Xhd7yMeTEJ/HdeVXdU0jUstDRHdefKgFIVymt69mkYT?=
 =?us-ascii?Q?q6J5R2Vvh+cxX//wfhJn+pGk5WiK6VYKuJKxKxXWjc7LIHgQ08jtZP3cVxr+?=
 =?us-ascii?Q?KNuACAMhIFmrpsr+fOe9YuTnbgzWIObUFk6L+p80vrDw9sA5Vt/gdhvmFWp/?=
 =?us-ascii?Q?GNw99ExRzNPZLXqsUWX4Um9KZvm20pjgB0NHAr9jpmf4iQnQC8v6a3v8B/ku?=
 =?us-ascii?Q?PVIWkJgsqcqCLGPYxFdhhnHIU0Z3j6YH1VcX9u0NbqXVmKlXj8BPQn/sbFcn?=
 =?us-ascii?Q?42Ga51HgVkb/7nwDJBnULWHv02s3Dz2IemNLki2tkCoXje6Y98QjVoRZ9Kh4?=
 =?us-ascii?Q?SeQrOPy2qHLCiGZ7RDY4D70tEnKzvB8QVt7WKdYbElW1O9wzS3M4fwuUFLdo?=
 =?us-ascii?Q?kQPZqP4+sWRnSAq8a1ax/yNHGBpUlnPigqRQvLCtNBN0FuQMdlpjDB0uMNIB?=
 =?us-ascii?Q?PHONJMt9Q1Xg7xOJ+Oy6JxqsAnZLvbMVIiSczmmZk5rysr0IfIHf1Fm6RZua?=
 =?us-ascii?Q?jVg/MyUtkKlnjb29d1ekNQ7RmHtkPohf5DAGFarpAJ6t+J6QeKe+6xtL9yjy?=
 =?us-ascii?Q?WBLJkI16F6FLQFkGpvhvTEfoKwnDZLC2LRzG2f+gDAik4+J3ezWK9KHhGrOA?=
 =?us-ascii?Q?LLXAqDsZ9kkCPfvsQuOOvs+0m/rr+LD3cWGytl8M2xNNT4EN4WNlhUw8QL8W?=
 =?us-ascii?Q?nZSGSf8jRJ+IlZRo+6tYeXnhNFRS8H6zVa2Bu8udX6SOdknGAQ47Z7hsl3++?=
 =?us-ascii?Q?fYHc+hZwBhxeg4TqC7DpHnRbRobTGhD5p/5XerB4iT0CsgknxlMrBsZqLzqw?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e808d31-5205-4208-beeb-08dab67dec6c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 11:41:58.2719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIfrovxJfxF+bIWqmympDilhcWwYA9N8eBR4uWPhzutk+hBevzf5othuRv4pAXpP4kQX11Lx5uuZ2Uz1mWRxf6g8/GfCwvDMQwv/+ZfokdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6532
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_05,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 suspectscore=0
 mlxlogscore=718 malwarescore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250067
X-Proofpoint-ORIG-GUID: QBAr7FHPnSTV9R865RPvpvPQ3CcGLROT
X-Proofpoint-GUID: QBAr7FHPnSTV9R865RPvpvPQ3CcGLROT
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

Hello Dmitry Osipenko,

The patch 809d9c72c2f8: "dma-buf: Move dma_buf_attach() to dynamic
locking specification" from Oct 17, 2022, leads to the following
Smatch static checker warning:

	drivers/dma-buf/dma-buf.c:957 dma_buf_dynamic_attach()
	error: double unlocked 'dmabuf->resv' (orig line 915)

drivers/dma-buf/dma-buf.c
   987  /**
   988   * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
   989   * @dmabuf:     [in]    buffer to detach from.
   990   * @attach:     [in]    attachment to be detached; is free'd after this call.
   991   *
   992   * Clean up a device attachment obtained by calling dma_buf_attach().
   993   *
   994   * Optionally this calls &dma_buf_ops.detach for device-specific detach.
   995   */
   996  void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
   997  {
   998          if (WARN_ON(!dmabuf || !attach))
   999                  return;
  1000  
  1001          dma_resv_lock(attach->dmabuf->resv, NULL);

In the original code used to take this both the "attach->dmabuf->resv"
and "dmabuf->resv" locks and unlock them both.  But now it takes one
lock and unlocks the other.  Seems sus.

  1002  
  1003          if (attach->sgt) {
  1004  
  1005                  __unmap_dma_buf(attach, attach->sgt, attach->dir);
  1006  
  1007                  if (dma_buf_is_dynamic(attach->dmabuf))
  1008                          dmabuf->ops->unpin(attach);
  1009          }
  1010          list_del(&attach->node);
  1011  
  1012          dma_resv_unlock(dmabuf->resv);
  1013  
  1014          if (dmabuf->ops->detach)
  1015                  dmabuf->ops->detach(dmabuf, attach);
  1016  
  1017          kfree(attach);
  1018  }

regards,
dan carpenter
