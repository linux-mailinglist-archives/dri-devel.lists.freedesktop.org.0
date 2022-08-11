Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0854058FA49
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 11:56:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D31F31126EC;
	Thu, 11 Aug 2022 09:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276FC11A73D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 09:55:42 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27B95XGW018353;
 Thu, 11 Aug 2022 09:55:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=sru0Pdl7vKjbGOuFp/xgfN45UliZWTWOhOvBnzMSkgo=;
 b=qYMQUiOwSnR8i+QUXB1LHZ/T0SoeGiOiCCq7FBhVkhE2pkNTYnY1vEwowRXIuctwXyrC
 gnpOeH06it6bI9mNXgAQK7W7R50dvUIPTH2VLao+quJuSJxh/ypIySLBJVA0gb/MMX9u
 tCoBW8BtjO6mz2meyPhf08K69eWj/lTnAX4UZ6Jv2qER3Pb/tAklFgtTp2Xl8utpDI+v
 jL7KYPKUw1rlboUvgxSMbjwr96UgqxKr6PMgcRs+9sjpNjB0eUmgf9yfqlg9eZjrgTGf
 TxsKyJkgva8GcWBana6TdOJsMAxlwXLHCJ7A1Obapjo6FacE9+Mb5wFp2D9iDPxuHaxm ew== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3huwqgm6fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 09:55:41 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 27B8tJkB004899; Thu, 11 Aug 2022 09:55:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3huwqjfyrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 11 Aug 2022 09:55:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wx3Snwcw80J+D8GTTdWsvqshX3/77pllevGUE/7vT8OcUk1EHTM7rBMjXjXQX6fZzBKP0ZvUlegj59jHDhFs7GBgd8QKbwAMlieVH1qoa3g6E69DwmisuB57dsQywG0GgQXFyDuaQNsYNZN2aiaXo7snkpleANuBzrPWGRdYzQfAWoSo0xPAimnJq8LUlSLJQuBhKhO4CjS/eNi1rDUsP9z0o7N40dg91FvElWluP+HyxRozTr0mJda95u1NqglTlSm56gI0pYkSrvTnnTrO0tyWISU4EericVcsyqXK8uBxrZrh1L53a7oT8bdGsIRUQRs84qtuObA5tDpVm3qAGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sru0Pdl7vKjbGOuFp/xgfN45UliZWTWOhOvBnzMSkgo=;
 b=eb0T1X05yGIrKF2kdZYOdCoF2VEl+ePOXRUltCHNKKP5/Ylku+ffNBpBySwXtrdwFr+j7tNwcZXY/plWebVoJLquNUgOtrgh9RPhlsOUTeGpM2tXm5qqRa0GPiVvY90GHrq8hyF29gu0EmGTkyY9gc5hI6aFGl/h7deRAm+Y8CR1y9LiTp8ISFcNe2kLeQfQsX+LJgUh7HY/ZcHlO3AV5nEBbnS7T5N7hopCIkPr9ehqBQIeUI44bO5xP4eK1iCFlo4zTIwYPh4knEUPA9XOZ1lGho4BhixAJ09fCMSJL0ttNJQQBLu7eg3Ghm21ecZk077rqVZlzJfdfIw27uAIHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sru0Pdl7vKjbGOuFp/xgfN45UliZWTWOhOvBnzMSkgo=;
 b=BjrCoAy0jVplpeC0+o/bpuAuDRV0uoh/gatgatSqCV5HNOGNrgfa6Mj2GLBBR0Uf98bnr0we6qUb8uUXaaQCQuNu5LHU/T0GBaRoxxQSD1ZzgLgq+9YTT3vlM0eTtuLJ/LFmu8zK8YyY6XzKKZEJdSzZqzRLiNl0eLCunfvjtp8=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3898.namprd10.prod.outlook.com
 (2603:10b6:5:1ff::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 09:55:37 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.024; Thu, 11 Aug 2022
 09:55:36 +0000
Date: Thu, 11 Aug 2022 12:55:27 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Arunpravin.PaneerSelvam@amd.com
Subject: [bug report] drm/ttm: Fix dummy res NULL ptr deref bug
Message-ID: <YvTSD44z0csJ8YsP@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0055.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06722c44-0d32-404e-55f0-08da7b7fa3d8
X-MS-TrafficTypeDiagnostic: DM6PR10MB3898:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xcnl/Zg3N/oriQquSZVxH1MiLocwa1SD2/RzZbdXFennRUtRI4mtCqFlpE4YCHag3S/pREnttTr+YdKRN44v21o59HuV8VUUGJkhmIsPXWC17hMCCoccQwalOuYpp8102HQA73JbxnkmorcACbGKfr87uNFDmLffhBpt7QvCqcTHPHm8OHINj6E9n6dxc0ADEs8VjVXEBDK8eRLMXcUtj4vsWE2fHFumB4LzzDwz+9Rw5H23nFqhePAFETEPFyJabLiDY3AhmqX9ulbWS/EuO2tWscUU9APDRb8jnK+jDgS5AgzdkSCSzVnJiV/2X5RbYcoLBHeSRtTq8SvRPwJUuwWa7BqQKRq+BGnS/aO8qRUQgUUQUdA7t8/SUhkfLW5CnREbwfZiCMOp5m9LRbKYyOosrU9XC68Xb7z2e7OcQFyrFA3Mfk5LmcohsDGFBYhzr+QiFlUijKJlSInfgTIos7TMMVhEZ8PUaN1N9qnjBWk0j+xUC1R/mX2xQBNF3yBY3y5GxyilBa503W31YmpcAE0qUgWuo18IWirAqKgSReDO+MMwYtfjBtxSKNwXw6iq6uhPupxUWwW2ufAF2wG4R/DBDrO8vdPdg0VzjsX5Zmz7bzrLZUWDUZc08j6p1mMqZVbYmXMcTgmKTvxrQBN3F70LK4KjWPM3ATGwxuhuOIQfGLaQTqNLvBIU4rnhIDcJio3rhwe+YFMI9uYunlCNEtnTl3vj9P+QT+d3AOrbrLtmuaAlLAIWJhK2cDHY8GgOc1q+hHu84zuSWcS/OHRbguHf6ucg/J53Emw1Q0VWesQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(346002)(136003)(366004)(39860400002)(376002)(2906002)(8936002)(5660300002)(44832011)(86362001)(33716001)(26005)(66476007)(186003)(52116002)(9686003)(41300700001)(6506007)(6512007)(6666004)(83380400001)(478600001)(38350700002)(316002)(6916009)(4326008)(66556008)(8676002)(38100700002)(66946007)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qB7n6QC7wbwfQKeg2QL3gUdxIZARKhsMQyMNb+IeEiTr2VI0Go1M78t3aCrb?=
 =?us-ascii?Q?FCWYuIZi0fNXVLXzpmOPdZlLSVMTC3QgKRhqjiwncDDKELgApmAKsN3X9YfE?=
 =?us-ascii?Q?N1xEkCDeGH1pw+Nln4WII7m0IKYBJNKKJ0ih31Fda8Kd7gwBx82mpyoqiPlV?=
 =?us-ascii?Q?NymAz5F6mSXN5d2Sz/YQqRQ7wfmXYPM43YwUcM+sFbKz5BJKRz90+uWR8cxO?=
 =?us-ascii?Q?7wzbxk83eyEFQk6sEIv76E98kZiFM9mgj1C8wxTil2pv+I1Wn7sX7xfugP/p?=
 =?us-ascii?Q?s0uSRLRNu4KE1C0Y+m1FszgiNpjSgwsl8LSfYhPSmRE4aWubsI9CZ1gLGWh4?=
 =?us-ascii?Q?WWcXjAXSUMWgtEv7xnw6rx9ie0fNyVJPFWpLPLfpTy9yBtzfwCHDvqNkuCRj?=
 =?us-ascii?Q?9Uslrqcm5Zh1byM1q8tD+xgVYAceMMD7phpxxzL60HXpJmqQRr4a3gVEJYjv?=
 =?us-ascii?Q?BaHV1jxZQ1SZ44t3GhRPfZjI6njFP4dzeV7ndmUcs2793u+2xCmWS8esgNku?=
 =?us-ascii?Q?KTbywZgustOYgHnUkOxXhPYinwDnJnlTRCkhrLPo59H573BzmZfPBSJJzbo0?=
 =?us-ascii?Q?Fb9TaBt29qxhuoY5uqg2JwqKatcqUeGAUe6zivLw3JwIfh+epT8aQ1Y5UeHS?=
 =?us-ascii?Q?SrUs7U+pbbhjlfKdbCida/cJQLblwDtBmVhDlNOwD/iBzDiTaaFPq26KQw6W?=
 =?us-ascii?Q?khKED3/UNVsGTq3cAvjpd5ZYvYSW0NpyJEXDPQt0GHGcqzwo6d0+HAS8vXUI?=
 =?us-ascii?Q?pxz/+LlQhzjJwzxek7HPR92gd065TJviMaMd7ENMKiT5siZGXV5F9iJn8aZG?=
 =?us-ascii?Q?CoGbcdpFIIbo0J+aX0lVXqbJaKeVcq5bmcZPeaQrWZdTd6qdWO7uJL8FKDEg?=
 =?us-ascii?Q?QpRhsc2tczkt7LRWJvOpyc1Hn8Amqg0biU8c4ChlaLXEG/woIiqzSUSvEY7K?=
 =?us-ascii?Q?svuJX5oKP6W9NRKbNZHL5QLqDG9Vh+sI2sD0OnKUe4DyjviG9sAxxNTgQMDA?=
 =?us-ascii?Q?j1zB6VeCIZsmhtDaZE31I0eGuq5dwlFDwOjmKRutuf8muIuYgxroDfrqnOhJ?=
 =?us-ascii?Q?FvTyZxVo7gHtLBZgVgNv+i8axBZijB8erL8RWJsyANeB85GYLRGn6YGQlg9n?=
 =?us-ascii?Q?3Wwzy+45NyfiAQNAHztkEXhjPvjZaX77YJHd172sPbtzknDssT3nXWoPEGiW?=
 =?us-ascii?Q?FIJ9DpvjZsxA5UZd9Gcet8nFD7238qCWN/3r4ohOuJkEJ1bL7WODKTBCeeqX?=
 =?us-ascii?Q?hFATJWn7OxiG8k+7dUruj2jg2YYTISESQ4iLb7LurxqScsoOVnZFG2EWJk93?=
 =?us-ascii?Q?GEWhvS+hqNK6vSliHnepMMUkv9eDDdmTOe8QFvLcARE4RpLd0+WrBhY2gpVF?=
 =?us-ascii?Q?cRs513ewgBP0FcalDAn8cTb5zoVIUoCbFdSGmeo3lM0B0k7+UInDVZKlKLMr?=
 =?us-ascii?Q?x/4iHM7yp6RmVqyc1sbMlfPtZ+8hNoDCD+0J9IBz5f8F5y9VF1+QeCjRKYoP?=
 =?us-ascii?Q?wcBHgmwnyIP96OC0ZjIKn0zngXCij5CffFEcizK+Sx7sMm1P/FUCDkwmGbbJ?=
 =?us-ascii?Q?jTILdMczQetITlG1g5TC19PovxvOVAnE2ejO4oR56YhWumn2uTFZGpqE5WV3?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: /5VOToay9yqxb0eudunbaRdlORqpDN4iiWvu+r9yW1bRmQJqk9ILRJVnIubiDwzhjOX7llT0OXClNsHi1EK27UNukYuoWtb+zDS+vQjboYCDCOn9PRiiTHItmaFrvEYi1NOJYJaU0sXewJslvvITZlYrnwNU8ZbWQoPd1lUv1uUacPhUBBGB/1KnLCdRpfXwjqaaPAaHGeHif3Ty8QZzpr9XKcIRG1gS7yvLUP0TXuCaF+VK4IBwT214O3j+Zz8upAW09xDuFMWBwo4Z7kdDrg1+LNfcB8Yer209dJ5YD368R0hf1pWNXzVLunabgrjJmGFyrgh/kfusQNKfoD3v2uR6SDjSHcGX0dKhtPJUXdhdOk6YcY2YqZb5PzZr6Wz9N+mwvGOTROPvSHDnSrq9vask8Fyz5bOHsT2t/t1+Kgf2UZTP3gIccXYFjYBxGvXa410FPbFcRNn922VFehARJit+VNvQ/VafgZ00hSfAolz9GKoTbB8ab41vbNWepzp45IIjkOge96CFpTgPNL9Tf/aQQkAMyuxu+uKMYo/aXz2DjmhZKGzBV7PGVjNyHzSmDy+F+cOivfn8bOn8/qGzrw2Umsa7nC0U/NT7XeDqSkdxoxr9B5Ztxd7h+gsLTAMZNIUDwdVaWw+s/acgdIE4WthumPUG1p2qafizxl4w0JIgoOP5+3i/YQCQduPjVc0l4Kc8gsgBFx5goKDDPFE0of/q1xoMoHriAiJ8OXgHEUR3lH3KHBMuPttpkcDUABQx2L+NBiIyjfQUBs2GU1OLTVdBkx2gqXVBwRNfIEqF4OPNJnDqWzSIvwaVj7aULDTk
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06722c44-0d32-404e-55f0-08da7b7fa3d8
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 09:55:36.7835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nALG25N1O+OL9Sur0w+VF0MjiaFHd3y1QRUI66Hxfkjc82UQltxB3dsm0DfrO3rOf3wyd1zZpkR+SxtkTQnqVDmReUHAhinfUef+Ntpub68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3898
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_05,2022-08-10_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=930
 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110028
X-Proofpoint-GUID: 2jNBILpf1R8e75f0FGuhjx_PAqezs-SU
X-Proofpoint-ORIG-GUID: 2jNBILpf1R8e75f0FGuhjx_PAqezs-SU
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

Hello Arunpravin Paneer Selvam,

This is a semi-automatic email about new static checker warnings.

The patch cf4b7387c0a8: "drm/ttm: Fix dummy res NULL ptr deref bug"
from Aug 9, 2022, leads to the following Smatch complaint:

    drivers/gpu/drm/ttm/ttm_bo.c:915 ttm_bo_validate()
    warn: variable dereferenced before check 'bo->resource' (see line 907)

drivers/gpu/drm/ttm/ttm_bo.c
   906		 */
   907		if (!ttm_resource_compat(bo->resource, placement)) {
                                         ^^^^^^^^^^^^
Unchecked dereference here inside the function.

   908			ret = ttm_bo_move_buffer(bo, placement, ctx);
   909			if (ret)
   910				return ret;
   911		}
   912		/*
   913		 * We might need to add a TTM.
   914		 */
   915		if (!bo->resource || bo->resource->mem_type == TTM_PL_SYSTEM) {
                     ^^^^^^^^^^^^
Checked too late.

This NULL check was added deliberately based on a report from the kbuild
bot, but it's not clear why bo->resource is NULL at this point.  Was the
patch tested?  There is a stable@vger.kernel.org but there is no Fixes
tag.

   916			ret = ttm_tt_create(bo, true);
   917			if (ret)

regards,
dan carpenter
