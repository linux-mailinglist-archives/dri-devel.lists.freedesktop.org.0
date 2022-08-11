Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AA058FBB7
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 13:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB0CAADF0B;
	Thu, 11 Aug 2022 11:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0A5ADED0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 11:57:06 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B94Yru021782;
 Thu, 11 Aug 2022 11:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=5pbms0m9SjHKH482Tb+m49uZczjZUTiswEI0qXZvWN0=;
 b=vBIy5cveby+Tc+oGy6yzoySEHvsBgs1wFIYN9rl1hGMvQTnCkAg4KzjTd1bB3WLtJdAH
 0aQcG+xlvfLVYJjx9O0r/MZTot0HrEuARMsswIZQgqluZYj83KYQzuIgcUxyDQEFkNsr
 1nIOoq16P6oSbg9Q94wGuFeSXWASv4SITuhSrZDOjX4wXZNrwo6CDZjR6O3+CdbY6/hR
 npCKC8oECUPWicVhzNjSS/pBHM85bX15a8bUgmg1lWvTBrCqTBBuK8ibD+z4mPWaIJzm
 hU0BxR2gzPISPd7SBW8qZYTvXMAqYTLjlzQube8YVWVeWqqKtaYVFQ7cjIWjhTPyuJvt hQ== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqbmkxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 11:57:03 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27B9BWEk040716; Thu, 11 Aug 2022 11:57:02 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqgsp35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 11:57:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0homgIvrg6bH+hqg0yc5gb2wipI2FOh5ah6NRjInC/7W7yolbfhr5VZWeoUyZ5Cr3w9VOV9hP039ryVT9JLmliF7QSbAEl9vklhUTOnTNpJe8Pyh1y0nrP0jYADwFjSpWRJwAhictxCsim8NMXheDgioPvK7V95roLyeA7GO4D4Q5HKJ2ibiq/3FWtf8/+QmWB+KzZMHLd+aXf0YUZXdRZvsHpj5VMFpPrtPc7Tycf3lyxADkGiZWjvMVY4vO7k/813kiMOp9FhBHiIQgIbAZcB8V7/iO2QAuANvuont4fIbSbv4did91VJwTCwLwLtGtuIIEH91yO7/EclPaivng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pbms0m9SjHKH482Tb+m49uZczjZUTiswEI0qXZvWN0=;
 b=LmPjLo0Fgc3sqMe8KHrm3n0DsGdcSX5qMvJlqSY3ABq/y2ByROEH/R1TM6TZbtBRCEcPwJkoQRmBGOZsJICJtPfZRCjJoEwtBdkikMFO11L1YukYNCRP6H9EBrmh1yIbHA9Xl0RPLHtnZ4wphZlnDeEGUHXiXKPafaJ016gVtFAlauP9qfRzljqL9hkFN4bZXF+jca8C8NvKzNprOvP71BVxxKnDc2+QrhYPDnv0a12fN1lWuM+pLmkV5HA4dOKuovLYqM3VL42HMuwF6Z/MLvTbeeVU21pt7W8NvZ78Sz4p12Z5OKVx4njYaNobsLeiYGVLHBpAYJVotXOpowK7Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pbms0m9SjHKH482Tb+m49uZczjZUTiswEI0qXZvWN0=;
 b=lnaJasHMeGa4B3h2j6UZzbQrHNGU2jBmwS3FJ9ayPA6X79yAr8OxJpGEbRyodEQ3fHIeINAMKGmIOO6a3hPEGY3lEHNW2nP0tCaQpr/RXGuJ3jq+u0itVkdPt77v/6NjVWWMG596Ra2CpcFlzdwsJKgfIzl1W9sxJGyTM52MrgA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB4361.namprd10.prod.outlook.com
 (2603:10b6:5:211::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 11:57:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.024; Thu, 11 Aug 2022
 11:57:00 +0000
Date: Thu, 11 Aug 2022 14:56:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
Subject: Re: [bug report] drm/ttm: Fix dummy res NULL ptr deref bug
Message-ID: <20220811115636.GV3460@kadam>
References: <YvTSD44z0csJ8YsP@kili>
 <28f5d71e-34ca-214a-f8a8-14e227bb42cf@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28f5d71e-34ca-214a-f8a8-14e227bb42cf@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0015.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::20)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d910620f-1f02-4aff-68bf-08da7b909898
X-MS-TrafficTypeDiagnostic: DM6PR10MB4361:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PiY3ggEfGo9XBY6p7iyWkGAH/HGFQ+Do9w3bvKrDU2J3eopuhFWGoSFancu1QjmVGN1klZLY55la3WqBGZUFMajITwDUMDS+nmiaifMKuYis83HwfVbdmz12nre3/WPpSr/x+pwQCKGxno0IkGnn9GWo4Lc2rOTtFO+Gt3tFhmNOhoVwYVeeLgGIOrzxn4Y3f3DdUN5CFlKXqWiwTsHFOeC7GCHkKHdy4FtPNujnbKYZ+vEafAlO+vF8OmkBUKujSXYV7eN1bkMWhWpXsj+VjnoWjqeK5PtYUggLP3g/y9MPksATUTlL+B+1UWrvkuyF5vVyQQhPCluklEjr/WSb8RVYxnUwOZBEvoR9m2n9YmnFBnCU0lG6WvHYSy2wNBpVPaItM+dvEsTn0QHb79gic8nJRhP5P2ARdjHuDCEnmKJGXFU1T3aKU8LN46nIs/ngEuxg0LI/pegA/AmkwkrpXZos31GCO93uU7jY0FPCMkBpX0weEG5ZThlXQmfBA+kv6HnTMDd4xMvRMoIsVNTNIanpLrt7kdizsS1QFaEThedUdqQNg0Jl7cz6qYAmjjl+ZlpEgy8/hyigXmrP4Zc0Wn8IFgUcMVJ7EAr2mcFCMA9Tw1Zprt0iJk4ViM2wkNnI11gfjuIWJCb868K7vt2L1K2PpmvlDA8X0BywLQb8awiw3RkYFUYzB8LK0G9VKj24mcfIJIaXP3/tHdB3rEDD+33VIl5r2RKc2r80ITKdf/V9KEf5NKD6NmeBwFBB8pIG6ENzjF4VgmGtYKEQBq3ymMe+r0DUemV0h0ypjjooBdxEO0VnEkYSc49k6CjrTNEj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(366004)(346002)(396003)(39860400002)(376002)(136003)(2906002)(33656002)(8936002)(5660300002)(44832011)(26005)(86362001)(33716001)(66476007)(1076003)(52116002)(53546011)(186003)(9686003)(41300700001)(6506007)(6512007)(6666004)(83380400001)(478600001)(316002)(38350700002)(6916009)(4326008)(66556008)(8676002)(38100700002)(6486002)(66946007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ki1RVY/buxWLLEfPPt6DMl0mh6PwRIkCwaTAKQv3tjQWUqQR60O1PF+/nmoq?=
 =?us-ascii?Q?4UyiMl56WjW3J7oPIO9BhajilYZaBEeCzr6IQx4XzmIWKV7a8oSmqeqYcy6X?=
 =?us-ascii?Q?jCaLINMordDwZmPVEvPjTa8IgE9wfaJoeyECXtfPOcZofdOS5Aw5Yc14ifTm?=
 =?us-ascii?Q?MreRI32KVGiXWAEXdqAFjlPOO3J0Xm/DAB+CIDt0FxLgeAp5GKaGNWxP+AMn?=
 =?us-ascii?Q?BoP+SfyFbC9L5/Vv34jLPNa8CrMmVCbe3TLXTck6YXLSwQlBml6kRNOtXH6v?=
 =?us-ascii?Q?6wpJVs2x5NV9GU6mwJiTEWEF+tUO3kSGsdJKiBNN1qh30TAGE6+an4tu2noN?=
 =?us-ascii?Q?RoDW5cQ9aA+86YtcUk3mpbETQWfTIzSz0WX4ZnzMQXvl7PkVnvLhu63FeT0M?=
 =?us-ascii?Q?nWw6gSOhTDv/g3NEvOdyh91K4WS23L4XQzDtjz/TU1xUtjS+W+wnAt8VhF3/?=
 =?us-ascii?Q?UCRIwkZ7Z/JpqhL0c+Gd0XRKLUGdH6cGNNrZvkCd4PZsxXLLYoNwYZNfm3aE?=
 =?us-ascii?Q?Z8TYdN1SQqfT/zhQbh4TwusZiUfDWEtqjYuxe4/gn8esJ8ice/kzOsrCRSzH?=
 =?us-ascii?Q?3fp+Lhuj0utrpbIVovBF7K+cyE6ASnZSNGrPEaRURNemMQ8XCWc2Tf3i3DSU?=
 =?us-ascii?Q?pxuXomhbjDhrNOK1SUzeRgpcvVz20gsRCmY4rns69pWVgCQKZA1VxJ5n+RPo?=
 =?us-ascii?Q?caC+0PbdsIte63729+pIJrmQ6J2IXc2NMNH4sgCuUmRbqK+Cwg53QBJdbndZ?=
 =?us-ascii?Q?ezMiQwNoxfetQLt+vmQ7ONLLRjQ4INzaoczu04Wz+g+pNWjt7s1MHvSI4T07?=
 =?us-ascii?Q?7CA5wt+DSYoxmSdo6UG4L2IYK38LPgmRtml2zM6crr0ErnccY3ixnp9ldDE5?=
 =?us-ascii?Q?5NzzyqbwuQn9xPJTTGzxUiLJQ8nbfCT3U2Q/6mMM3csXVpU2Y53dOgw1iBo/?=
 =?us-ascii?Q?MYI1k7vH5S6uxCWUe5Fcbz6lPbVeuiqmJ4q6Hs5CEiXtJNIan3CnFxxPeQGo?=
 =?us-ascii?Q?QFGSQ83pCSGd8t1as7DA3eQNEzKNciwmhQtktl4tW6OYhAAFHvn1x1+NmVoq?=
 =?us-ascii?Q?0rSMYZ9PZVj/9cPYWDf20M8vKxZx85oYlx42sYxoggTD9ThwludjpjEq91sm?=
 =?us-ascii?Q?3PnZ8tGTInpjFkXeDffgQdWiKPJs5AxKgN2z2VcdWPUbdK6SY9C9hQDKQmlH?=
 =?us-ascii?Q?/cEEEXS5HW833ZsTQEfpuU0p2j2ddQknRqAnG+BTWo1ZJGZm0t4WNCOQGkAa?=
 =?us-ascii?Q?fy8+tFFuKRtTLM6B7AQfmD9uLQgz0NnuHCcHM23zeVVqcSlkY+WH7xRR2Wkf?=
 =?us-ascii?Q?88Hd2wdhdq55pH1SK6hapZUaGz/X1D+JmLsanS1u73I8l+D2Q7dBa/m0ixFG?=
 =?us-ascii?Q?oIAY1CLw4RfRPtqn3Gz6c89YRwCJIbOgfwPFL164GyuWIiGbGhRYg2oYVrR+?=
 =?us-ascii?Q?RVFkdLRGziNzmY5Jey5mRAHQ16c9m4vFjcwHlOS9hndAZo6++U+ndXT+rK34?=
 =?us-ascii?Q?wE0R7XzU4hBjrIoBP2F/0nZWvenKRe1sZFcHHAsznXB3BvnKcgv5awa7TKTc?=
 =?us-ascii?Q?pgDxQjlmCI9doccVduAWsLTBzsAD0RDVMgDznghLwA9Pb/97XiWuQWn2nJRi?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: M39XUSC4IpeqTMdiUIXdjcLl7lHQtZl6pYoCMo+1J1lqomhfw7Dg2p5ozzHY6UtWfO84nTTUbT1PRpwADKHp6GkT+WGnGqL0ZF6/cj4+Ouf1iEqNbUjXN1x5jyykBMtgHQA96l5n23CcOPyegJGlsTPhcCcMa0GlJef2ksm/UuikVfwdxrEymC0wDPYbmBGp63cG2R7yZMWAzqO+wOdlHL/+Xp7JsqOkSloyHV/jnpyqO0SRWMHMEAeigXAsqFIKXB3aOYqnUJ2DY3GUGMegTNvIi2eEgx3GcsgXna1PppP8dHD9j/LGSom11qz6PMEA3URkCkyi4g70AzoPPab5P1XATd1OLxU0e2Y97zbzlXqxADn3y6PS4fKSz+gcvDX6/dFzCru06cdgGEVARQ6KpL6VO3JtI8JMutgzZGimbgoHspNyoDn7PlUZvOnWqDbw6i08WaeihfDZynrtGLNcz0akbkZTH8UrzXc9gnFGLRXYzmwpZfg4GLkRxGjfY4/RISsGVgZn/1F0lBAFSRnh+RwLxFe0vQk0nvlA2NIKafS8byXE41HEvs0pdPEvX8Kc/nkIJrrRj/DjzNCJFxOijliOtk6ZVif5fwSJgilROSBdNYTsOY77hxuEbvO8rDehvMkaW3bnM2uiP4FP8Hdyc74Lqgv7hJOA92OEWl/J7sI77rDisaMA27yMZXZEwKUjBbMxUT1Lfbanob22S6m/6udpmUED63sjqSB8MTOCmcNIZ13GeQo2wSdRsVdhnE1OmxRenzhG3QLiyQKkkvJgFJDHt95yUUNcH75p0qyg4mkpVm8qSUfODoc9ZibMPBJN
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d910620f-1f02-4aff-68bf-08da7b909898
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 11:56:59.9634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RnOSdZBqUQiv0aj1O/44/oB/t7+Nzfhour0oHdJzHV+whdgjV6bMeRJUKVdrKE9es4gUeu0R/a4mAZxTUatDms5TAxylyW83FJwywmQeGo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4361
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208110036
X-Proofpoint-GUID: DD0R801ubUj7-LJZ3bz9klZESvPhVNqn
X-Proofpoint-ORIG-GUID: DD0R801ubUj7-LJZ3bz9klZESvPhVNqn
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

On Thu, Aug 11, 2022 at 04:36:33PM +0530, Arunpravin Paneer Selvam wrote:
> Hi Dan,
> 
> drm-misc-fixes doesn't have the updated ttm_bo.c file, we have the updated
> ttm_bo.c version in
> drm-misc-next branch. Please find below for the line number 907.
> 
> On 8/11/2022 3:25 PM, Dan Carpenter wrote:
> > Hello Arunpravin Paneer Selvam,
> > 
> > This is a semi-automatic email about new static checker warnings.
> > 
> > The patch cf4b7387c0a8: "drm/ttm: Fix dummy res NULL ptr deref bug"
> > from Aug 9, 2022, leads to the following Smatch complaint:
> > 
> >      drivers/gpu/drm/ttm/ttm_bo.c:915 ttm_bo_validate()
> >      warn: variable dereferenced before check 'bo->resource' (see line 907)
> > 
> > drivers/gpu/drm/ttm/ttm_bo.c
> >     906		 */
> >     907		if (!ttm_resource_compat(bo->resource, placement)) {
> >                                           ^^^^^^^^^^^^
> > Unchecked dereference here inside the function.
> 
> |if (!bo->resource || !ttm_resource_compat(bo->resource, placement)) { we
> have this version in drm-misc-next Regards, Arun |
> 

Huh...  That's very interesting.  It appears there was a bug in
drm-misc-next, we applied the fix to the wrong tree, and now both trees
are wrong.  The drm-misc-next tree still has the bug and the other tree
has a static checker warning about nonsensical NULL checks.

Eventually drm-misc-next will get merged and everything will work.  Is
it too late to remove the bogus "CC: stable@vger.kernel.org"?

This could have been avoided if the NULL dereference fix had a Fixes tag.

regards,
dan carpenter

