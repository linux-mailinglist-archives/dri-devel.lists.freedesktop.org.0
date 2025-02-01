Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E852A24AE4
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2025 18:01:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA6F10E0C6;
	Sat,  1 Feb 2025 17:01:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="aVsXPIZ5";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rxryl085";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F3910E0C6
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2025 17:01:40 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5119fkXd012598;
 Sat, 1 Feb 2025 17:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=1TTvDhKbG4kjhUTM56
 B6X4sTwpPVWV0SQ6oq69Ok3is=; b=aVsXPIZ5E5/24K0Mxm0H3mD2+Rg00qdAvx
 vI6K0K4TMCLUGhxGZaLrhZaOse6lcnCWNsvQu//DvNvYGarDtAx73eE+QzvphjtC
 1vBnKATMKcgJpPu91b8UogzOfkSseYnRf8z9fpK42oSQhfNoqg9PLFV/wQe+vvl+
 R0TF0Gv+54zhEDKmoVehMWx17tIKx2h9NGyMDz+3bpqh/QN1Rl8skCeuIeeaCXvI
 13gBv7mFe0JW2sOa53kNCABL3Vw3vKKJ+ASxCuBR4U6QAJ0fm/FjxV6jPckjsjS1
 eWT0a93OrsHimMsTBpxyMV1y/v8Xz4hvGW3xAN8+T4DNN6uv+dzQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44hh73g6ys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 01 Feb 2025 17:01:27 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 511CcX9T027888; Sat, 1 Feb 2025 17:01:22 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44ha25w42n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 01 Feb 2025 17:01:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZNIuucCOiuNG5f4n5l86K+X/XlBr8YTmhUMoDaa0kp4fpNPK4UkXxA8C1NM+KI6FobGLj9Fw6/1qQIs53V9bGWu0VP7eDtNX+IZkneLvkxbm2gUCWXrUAUvCGLMI/A+ZLCKPtkv2Kud05Fvz8KUgKQkDa1HCbVroPbK7qw6dJUxTsyz0QjXhp2aU+9B0ARfiZhyfJc6aSPMDUsdjWSif5fYr0NUY8kKZ3+ynfEhmBsEx2wkycRH0ceiPlHfaLVwfGpNVt949YNOr4x7cg18/hX+5tBTE33z2WffaPiGvmaQUE1+EMBTsU3UJXRzfsQtYPGW7bJBvuv1md5AwuNxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TTvDhKbG4kjhUTM56B6X4sTwpPVWV0SQ6oq69Ok3is=;
 b=SmNXeyAK84N0F8RIGx0s1T4CKc3hB4Rq448I70iug+V2CeWVsjjLSLmFGpIs7Jj+Oyg+4WBeq3jU9AhEKTbdTa+4i5PILk8IGIgBNTzP5ZizVeEHjWusg5MDI92q5rUs0hfnfaNfJUlVpwZwRd8hvNUBDkd56AMacUv8qyV9ChranYJh5qY8yfGvDvbwPiQ7yHlmZK1VP4XJ9/1PDceWccQMxO6rbxjuluiSbE1Qe4VxNRJLB1fcjNlJW4YfAdnf6eQANQ+EMROOql5UUYFBP9G0qCCDxGO4x6y+BZpm8lAEw9/Pm24BaY+wG4fpvyFaiDaRVjYAl8KUmAbcSrSP7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TTvDhKbG4kjhUTM56B6X4sTwpPVWV0SQ6oq69Ok3is=;
 b=rxryl085bYA2HDhHiu/lshL3lZaOHAgz7lDQi/eNoWSotuyz/TLB3ihC4mF/KOwBWpNsSbAVpfqu8BhGUHjcaN17snezm2Yf5/ObEe2BTbFl7r4aimoEUItyBn/KTq1CaHwbyyj6fMBoTeOvdazdTewFOKIT/Y+/7voKGxg2wcA=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB7245.namprd10.prod.outlook.com (2603:10b6:8:fd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.18; Sat, 1 Feb 2025 17:01:19 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Sat, 1 Feb 2025
 17:01:19 +0000
Date: Sat, 1 Feb 2025 17:01:15 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v2 3/3] fb_defio: do not use deprecated
 page->mapping, index fields
Message-ID: <eb700763-eeee-4319-b6ac-904b8633b2b3@lucifer.local>
References: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
 <b5c053f1d85efa31028e50476333a9efed8a069a.1736809898.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5c053f1d85efa31028e50476333a9efed8a069a.1736809898.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0576.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::23) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc23237-4c16-4260-e4da-08dd42e20c76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2oHuXgcC0YHkJLVVIxy482Jpyv/IX3lDa0aXfDz8N0mtz2B/a9Ftbi6uNMmK?=
 =?us-ascii?Q?51ckWadF1ugPawwGMhl8wFPNHS9p3O57Iy65HhZnKNny7OcSx2AN/gl03vNE?=
 =?us-ascii?Q?Xzu2mO6P5AAXEl35exLGEO5aJyi2V+q+QB0uhYAGOMjMCL2dI50zpvppHhbB?=
 =?us-ascii?Q?fzyty66dHOLdR24OBibyWCmaNwnEP+WzPHgnLSgr7HEMeBEM/ZSYaaSqWKok?=
 =?us-ascii?Q?d6W3XSio+zYsc/S2NNPuGkHk73duOBzWU6vZhYlPQ+tXMSsfiDAHxXJeMnpW?=
 =?us-ascii?Q?++t94ZuZsAZgfMDbFxS1DckWSiXLEnQVoG+teHgeRNUuWBgsCc5NDFmWQ/WR?=
 =?us-ascii?Q?l2390/2OBiVJNiGPg+taxNz4XkBkf92ikw0qYtInaGkeJU3PfxpG2zUCXegs?=
 =?us-ascii?Q?gql14tJJcvftB3dKKnRMEoMYY5+Ruw/Rf7Cctu3wqtArLP74ebca1qqd8OyQ?=
 =?us-ascii?Q?Hx0pjnVo9t7/mYE894uo/GZ+s+v79xeqthYTd5jd+706LsZpSPAO1kt3oz0s?=
 =?us-ascii?Q?RVshE185MDQXlSvgaS3zQ7t2tHEHSn2HM8hVJvQB1a1rb7Ou6DjOVMdSeyG/?=
 =?us-ascii?Q?X4jLsZMrMoJaDbt5eUC5yUVvi+pradetlwEJhctzEbB2jM1xYOprZxmGNMV2?=
 =?us-ascii?Q?c/sbVbavq+9JM01mbxaF9RSYHau6f2G3b5uzYsFGtScA7oj3pMaUcveGMzC/?=
 =?us-ascii?Q?uVxISFemwsYlHvgQ28QHcRVGMW+yVT4q/axcUk+hsZGMwLIcUBSxzQ4GCRWd?=
 =?us-ascii?Q?YXZUx/CoH/0BwxogXzQcN7cMPZdUA3g9BnfdqPUg7ExxUOZtopXXl5DCnRKO?=
 =?us-ascii?Q?gZG+6r/P6lwHtQ/c0sxi47NBkj7+LNnEmOlnPJzbPfRvQ+W0mQS28nAjo+he?=
 =?us-ascii?Q?rtObwTUpeGVctRL18hvFQg0uvEua48pMgNBH8qVoP3AeISjMhRnPJc1/U6qe?=
 =?us-ascii?Q?KlSMhvdn6ivl6LbVAjhFH/X9Vp8EW7oHS43A/y4gcNTYkI1BvG7VCtmuuHVM?=
 =?us-ascii?Q?4L6KyVRVjvaaaCyTCnrnDk6cAzKcol1HJTR39KLihLEHrdUMX2n7pY7w08LY?=
 =?us-ascii?Q?KfG4IL+0OFQ2NDdwG08/kZOx+X8uyVNsES3u+PbUaCZJb0Rqr2PVVE/Fp/8e?=
 =?us-ascii?Q?O1YCb+XupdYPavh91oaKyzvcmiOU2AFjOCZ52Hzlm98Q1saiGhqGvuuA8dkq?=
 =?us-ascii?Q?vdYBLhVv+0ZXPKrmCkF5j9z7ZpPOfNbLX2QbmFwJAT4BxVtFLTdQsQ5b8pQF?=
 =?us-ascii?Q?7je1eUX9EOfZUUEu3X3yuOoQZ8ug/bG/WHAbyxrNTXLqTT+3KRv2bGTgZVdV?=
 =?us-ascii?Q?z2D/aB1ar2G+uci7li8LelPEoMiLC4mdwWBto/MurzRgejaB8gQUMyLZ2WsU?=
 =?us-ascii?Q?nVNyJcA8eb1uE2KKMkUau6K9H55T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?94xP98ZJzp+xMGrNRi+evZQICP9QND66code03R/jXqPuOC0ezdgApo4xHAx?=
 =?us-ascii?Q?AqUaFxErofKoLp50TT8o1SfWzXUiXvznoRjvfhWKd5uS1bGy5QsgFodHn85b?=
 =?us-ascii?Q?hnKAi+gnoYROXensfuw271S5j/gnof1JDTptj7KJUU5U3O56d8GoM/0/8iNa?=
 =?us-ascii?Q?rj7PLjbeG4E7VOfirVLwpyDQ+AuqczLU+aDp7yLQx33hdfWGUlT+BcmiInOB?=
 =?us-ascii?Q?QmZTfN2s2PNhN49Qy8z1/sLrWghuk7OYa7RQ5sbnqrN5D8ErQHoexfpP2cqt?=
 =?us-ascii?Q?1N6Uk/uRv1k7XBB87wl16Gf5295X0nHCnfV2ZfD79hXf9VwttSZ8szQtPO+P?=
 =?us-ascii?Q?AE02fpM+Tpkb4wHRr5xULAdUTyUA+aZXHUKXilXN2SJhu4DmR2PRIvHn5rZI?=
 =?us-ascii?Q?36loMABgkl66e3OGx+Lgapi5WSzsh+ZOLtjIeAch++FS5XUkoP3kQPTra/vA?=
 =?us-ascii?Q?Ob+xJlXAxdTDBHttFfoKdWhKuKwptUlqk56JncixPmhbISA2oeZpoRpVRKTE?=
 =?us-ascii?Q?GcEvq1BNNPJFDWpy+fNmEEJ+6Onz2igr1H1JiNBMesEnBZOgN9HskTxiRlFX?=
 =?us-ascii?Q?zzeOhqrgR99zcmgVGib/exlaRyy38Zfy5k6CADJSU7k4EQS2H2cD4N/rNvdy?=
 =?us-ascii?Q?FAJKo1pbP7xiOdwchKmk7Go4W1gVbFHZkgbXaeYftFUix0MQzxlTILH4awHY?=
 =?us-ascii?Q?0lGJODAIS0XQSbSX1Jkt4cTLPsMM3Dd3dgBZmTYHFYhgXAXmleyp8BRg3QYm?=
 =?us-ascii?Q?Hugyb4xT5D9Ud6cOy9/YMQJ9F50lIldpud4n5PoLfupeY8KXSdWWumgxcZJ2?=
 =?us-ascii?Q?TAcrmZLgFb6I7c9iKiLUQiaZkn/yMwWBXbDvlhNqKlpDLSqWwiATHJCZHQsz?=
 =?us-ascii?Q?iBjPDVaEKnhVoF6DYJN01zc+JQZE9Y3u6UVXLqhQx/NX+wmmlKmyMSNRQvZd?=
 =?us-ascii?Q?Aj+TMBNdVSZWrg50nhdSxEMIQ+p1DLdNinQqeBRt+L8T+d/mEro8qbBlR4Af?=
 =?us-ascii?Q?XVo4Sa2v9539QOXACwBZRbmx4FtWahdPghZryr6Y2q1bLnjFrpUNabMaBRbw?=
 =?us-ascii?Q?yeBBSpLR46l2z0Opjxtxccjn1vRpYE/LEwrXuBHCBIDc8JvmnlqEtt3/uMaW?=
 =?us-ascii?Q?RFTCN+FDkb3MlBLHMFtvHgmNcuq1gszlhKJFs1vQnspa/qysSoo8OanN+1H4?=
 =?us-ascii?Q?JA3Giqcyq1f0615Zbf9ia5KVhxLzFHv7jsZDPzbiChwU8oT6aWe3GmfTwkC/?=
 =?us-ascii?Q?v9coEa4/h9ifaT9vPhQG+4XYvrJkV5U9YSE882VTobZqbynjniBVnXUZsb+n?=
 =?us-ascii?Q?jTar2J1vcpiEVFnd+Bf5lE0Lg/LwgNTYuiVCo8sidnvzaPnds0UwTv+321Dd?=
 =?us-ascii?Q?umFjWfxAlPfOZatBVF6cSysQLPlptQonHbF+d5VDNJsXrUCya6xWZT0yVPtQ?=
 =?us-ascii?Q?e0V9I+PShyYxQU/1WwMCBTp0axl0nTTpusKnh7mAlPlVEZEiJX9rsr5GO6B5?=
 =?us-ascii?Q?xfCKdSmNVSPF6QWaM0VLKJ4HVad+/MomekLmY9OqDkE6DcB74WiEtTh821G7?=
 =?us-ascii?Q?UPR+lXBFB3l233DkHmCrZg/Nx1OQMXhpDE60aZLmql0lm+dbDWeVufQjOclo?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fMV538VLcKQ2tTDuh0odJYPx8BP1IjWc3cPvD7XTiaFIxCYHL36DIZNPpEpZMH4d7RX+u4+8jZ8aOuHeGHZ/TJgyVJ9NR8Kyl+5WkSeIJuXJZH2x5FhdJS+7kmNe7r236RZRY/P/Xu1U/WWL2HR/n7BaFqy+o5i9/u0VQQCS9bQPbcH7q4k3xYOjQePdsjBVf3ilrqUAKnrgA3zaN+Itvw1ZAbmdBB4fkYuAxYz1GRXMG8xs4lzXx+JFalvidhe9PLOJmuAVjfFC1EE6qmM3xShJTjXC8/OBcwa5TQj1d/FRiKmLLW7j2NwQZrNnngtGXAR06m89WLHHPE7Xi5s1Jo4w00wIY2xLqvJ+btt1XhsWwW24NoVXb711Ld+4jZI0U8UQHZvNrnqBmdu2HNeapA+yTpQxIDnFkVE9VzMSGUisH7hPO13aiyTCjbMAnUQ0FWMeRD4kmigalNdes0XT14h5SKZtudZJJvGb2TD4/Ti6AnFATjPkCBIfLOJC9RRuGl/RDKd7V0D1cLgfGVjJn36DU47bPX+ZXG37HB02rv1AYLorPjsSwWLDJtsqxu/nw06feVWlXxod/MY0GQrj36dHjiQuxNn+8Yu+2DQUCwQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc23237-4c16-4260-e4da-08dd42e20c76
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 17:01:19.7030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+8PrEAYxJlQWFNEVnO7GtmI4KtgnPFmwVoIxJIQkqb7NAZfl89eRJU6200Yb7QYNkGqY1K0ksD3I+V0dZgGfT3D7ihds4mELfvXIaggomY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7245
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_07,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502010147
X-Proofpoint-ORIG-GUID: G4QpRh5twGypwrQFy5PenXjQVAmXq03D
X-Proofpoint-GUID: G4QpRh5twGypwrQFy5PenXjQVAmXq03D
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 13, 2025 at 11:15:48PM +0000, Lorenzo Stoakes wrote:
> With the introduction of mapping_wrprotect_page() there is no need to use
> folio_mkclean() in order to write-protect mappings of frame buffer pages,
> and therefore no need to inappropriately set kernel-allocated page->index,
> mapping fields to permit this operation.
>
> Instead, store the pointer to the page cache object for the mapped driver
> in the fb_deferred_io object, and use the already stored page offset from
> the pageref object to look up mappings in order to write-protect them.
>
> This is justified, as for the page objects to store a mapping pointer at
> the point of assignment of pages, they must all reference the same
> underlying address_space object. Since the life time of the pagerefs is
> also the lifetime of the fb_deferred_io object, storing the pointer here
> makes snese.
>
> This eliminates the need for all of the logic around setting and
> maintaining page->index,mapping which we remove.
>
> This eliminates the use of folio_mkclean() entirely but otherwise should
> have no functional change.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Andrew -

Sorry to be a pain but could you please apply the attached fix-patch to
avoid build bot failures when randconfig generates invalid
configurations. The defio mechanism entirely relies upon the page faulting
mechanism, and thus an MMU to function.

This was previously masked, because folio_mkclean() happens to have a
!CONFIG_MMU stub. It really doesn't make sense to apply such a stub for
mapping_wrprotect_page() for architectures without an MMU.

Instead, correctly express the actual dependency in Kconfig, which should
prevent randconfig from doing the wrong thing and also helps document this
fact about defio.

Thanks!

----8<----
From 32abcfbb8dea92d9a8a99e6a86f45a1823a75c59 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Sat, 1 Feb 2025 16:56:02 +0000
Subject: [PATCH] fbdev: have CONFIG_FB_DEFERRED_IO depend on CONFIG_MMU

Frame buffer deferred I/O is entirely reliant on the page faulting
mechanism (and thus, an MMU) to function.

Express this dependency in the Kconfig, as otherwise randconfig could
generate invalid configurations resulting in build errors.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502020030.MnEJ847Z-lkp@intel.com/
---
 drivers/video/fbdev/core/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index d554d8c543d4..154804914680 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -135,6 +135,7 @@ config FB_SYSMEM_FOPS
 config FB_DEFERRED_IO
 	bool
 	depends on FB_CORE
+	depends on MMU

 config FB_DMAMEM_HELPERS
 	bool
--
2.48.1
