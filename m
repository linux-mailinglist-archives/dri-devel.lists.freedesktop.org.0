Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001E4A1DC33
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 19:45:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4396B10E19B;
	Mon, 27 Jan 2025 18:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="OyhxKZff";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hC7SEL5O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D178A10E19B
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 18:45:45 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RIXiq8014733;
 Mon, 27 Jan 2025 18:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=7hdUsb6V891twlCDg8
 XK6j0/dAhTvVvrS2tFPzgVqoc=; b=OyhxKZfff1i7V0RjpkxzeY+0jImI+LjG2c
 G3HE0hmFMYHBNZ/uvrWq2HN42WJl7alZsMnxkW/lijZrl1KFYW6eVmMk7ik2obA6
 9fe+iQw7tF18jm1ltBZT7mrnnUN6qIVrRfy3fybsPbLRGer3Hm2DRBbciI3k9KTy
 1GXQiqh4nZxDgt+XyMCMMXmQWHjZJIfBLu6geLieNzlOEHyvTI+RUpYcobkvZqUq
 J26t2b7Sqnj+Q427XKc3gQCq+QBWz8Eq8LwEszn6usfnxp/VQ3iLOjW8KBPkS8p8
 06bZQ4HOrCE17AlyiiQSvXljI4T5lZCKop0PHVPUY88eykA3rgLQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44ef9hg1s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2025 18:45:34 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50RHNdAZ011680; Mon, 27 Jan 2025 18:45:33 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44cpd73rya-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jan 2025 18:45:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kURmBQJSbNSpHZGAvsnzu99GhBaIgKpJWhslZdjP8ULnR671VhYMLq0DV501nWvuKFaWQX1FQI7rL3YcCzwsBRXSaiZFqikff8uVELSgzz7XGaWvljFvYoBUabpVfiOQraf2xeO/BqJBaON9+GmyH4vGrsYait+1xwesv1t+A45yrXyU/HIfvLDO46NiSt3IPtSuHv+dJ50as5ty2PphKB5Bgd3gXN0vvaRfZ7xBj8DrctJsLCKTO56lsvUcfAd7Zj3eDXlvBWFgIMVKLgA9MKr8jmwZfuI3BtYN0xgFMC/8vhiVQizkKjLmD682d4ip9BDnd9lTqX81NcpOPF1oew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hdUsb6V891twlCDg8XK6j0/dAhTvVvrS2tFPzgVqoc=;
 b=JJnDzux6c25xZvh913a198RdIo0p1BE0cN0iwSJeAbRjj7FJUVkuI1vbwAkuooyENtx7v4A4DjmKt9bcCO/2tRq2LAoMcvUztDC7VD6cJj3zxZxX0G/+PKdzhNNZnCX+TDcToJ0sbbuuL3P3Q+oDrb7PPom2rSzX9w40nmPhPAFY0C+fRQXG+9Cxdj05nOe6h6DvPi81an8aq/Ivr1NQr4unBPqyWEMcv1NBMmtkh89OhANN3y+l5a9U4qzZop1lN519zxLQD8GWQhAsURNOfzy++gk02lKH+wSBbDW4swwY9DMvpRXz8OtCub7AazLMov2SdvVf+L3q5nTjNs8vhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hdUsb6V891twlCDg8XK6j0/dAhTvVvrS2tFPzgVqoc=;
 b=hC7SEL5OO64oTkIPVml9wMITJr0p+JpfOw6jt0FXgHvAecLPpJ2z76s6eDV0rI+ImoYWM7YDYNb1DYbBNoLB43kk80BCGYleRXGqpBLH3B3HLpjxZC65nZ+xArwinlv2FH8hSq2FSgRe3RSKhXggfSrXFCNaTRBPHMQ9sfWBCHE=
Received: from MN2PR10MB3374.namprd10.prod.outlook.com (2603:10b6:208:12b::29)
 by PH0PR10MB5706.namprd10.prod.outlook.com (2603:10b6:510:148::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 18:45:30 +0000
Received: from MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348]) by MN2PR10MB3374.namprd10.prod.outlook.com
 ([fe80::eab5:3c8c:1b35:4348%3]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 18:45:30 +0000
Date: Mon, 27 Jan 2025 18:45:27 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v2 0/3] expose mapping wrprotect, fix fb_defio use
Message-ID: <936a79ef-3328-490c-8a98-e1f99232cef3@lucifer.local>
References: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0092.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::7) To MN2PR10MB3374.namprd10.prod.outlook.com
 (2603:10b6:208:12b::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR10MB3374:EE_|PH0PR10MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4bf9e7-efc0-41dc-a429-08dd3f02c627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?erp+MF3jj7UzfMSOaAiGzAcuVpv8vrFcBSAY4CtsbLq7DzUFLHUO2XKnH7wR?=
 =?us-ascii?Q?JhMeA83CrGE8p/gldUER+r1nKaugPcdmQHKnWWpVZfc1YVCu3Bi6I+4gx+tA?=
 =?us-ascii?Q?G8mSlTr25DBQFqvZPdDhRR0+OMoKcCgkQd4rn/BIOdJaMYpHKAdzLmxrrLhz?=
 =?us-ascii?Q?1ox86MsR44IkqH/y3Q47T7e4Vg7gt6V3chPWquEFasRf44E6krQUai+uXuIN?=
 =?us-ascii?Q?h57mUhVgdIP9nooFPobUx9irbHN1ky9CeLYUB5YbUz3fPxFTOwmosyod5+LR?=
 =?us-ascii?Q?dBDVpxaxi4ZeQZwPpxmZC8qF1zntbv1uJ/v/gypCFJnB5B/BBHZt5W31pybT?=
 =?us-ascii?Q?sJq2qKHOmCodN+sb6OuOkAseKDZJgLQLdxgyPrcUmeOpJXL1J+PTcwOTVi32?=
 =?us-ascii?Q?Uy8X54WZVJ1zABWYhH4Jtrt74zLGTCW0/2EM8MqJjOoe74e4hlBOrMGZZVel?=
 =?us-ascii?Q?jsx6CEqjQYC3Vh4PRhH1Nk7yIzA84pWhF0FKvTRf4nANiAf4BEdJ5riKPZgJ?=
 =?us-ascii?Q?D03hGtsU23qayXkGmNu+4UzL76HP8G3PE7m8SSQUPFr44u8swMzfzOfMbfq9?=
 =?us-ascii?Q?M8KfxIMA3BXkvXasOwrgjm9lu3B590kkT8lBzPF+AH1lVykc6nxQgEnnomgA?=
 =?us-ascii?Q?DN/6zwhn8L4IEjveP1moEh6Lm31HHcRc9Gxc/0PLPRqCHDVzjd6olOBNO2Ex?=
 =?us-ascii?Q?Vft+1Tqw/rXxv8q6muIvwZmd3g2AvQUz9Yq94N7Uo0ibUisvXnMZpbaJRSfY?=
 =?us-ascii?Q?4m3yeeZmpOtfFwn5SkUyNc8e6FF7KHEu4YwNi534w+h6HEpko0sG20wjozNx?=
 =?us-ascii?Q?tldMI0uYpgHySY1O+1oGyH4dWmlyuE9af+gZSDIQfUMEp413wbTtiq8efu2B?=
 =?us-ascii?Q?FecqpFoV1GuAUBp5fXhhToj1Sz8yGulATdHeEibxf6m/xJQa5JRdGaLZi+7Z?=
 =?us-ascii?Q?8iDxjz9MuzmDdccEWwBWhgVZd7AB+K6mrAo4+QrCkPuqxe/wKtI8F3COC9vt?=
 =?us-ascii?Q?QnLi2nwVHwQJayLOmMv3m5M05Hfrk6IoK45evP/I7mgLUUrM/dX0+44aFHPS?=
 =?us-ascii?Q?PicN/3XZCrkf5yjJk7DuTiTdyRjerQfD4w/i98gr07hh76Y/kUrO256U3z2t?=
 =?us-ascii?Q?5klgQH/FHCvoXHGwhR617MQLj7Jup0lb5yXep57zh+4P7ELO5IYA6J2Nwcm5?=
 =?us-ascii?Q?MlEuiQoJGdg+oP5FYlvhtiJOylaQzOwOSRLy3vNev/2i4piMbqvfIFOGpujs?=
 =?us-ascii?Q?3z4CS4gTY0QEe3fRVGH0b/yK//ehjjoR4/Us/0231hKmuYVE8CIMhhByBfZc?=
 =?us-ascii?Q?Seco9LkbsxHRIjO+nOZmfvvU2xwrCniy5GjRWpfH2Jc3srFgMxzAC5R3eTdg?=
 =?us-ascii?Q?CbhjK7nQ81R6B/nvRoR5uf0emIRdpTX8jz6GqOQbZ071xvVqjg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB3374.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SJeZYnNnoj6R4UyeahYLWZ/WlIQhY9lkK1VjGsKxwrNkLyE2c+kHGNQiJ3Ew?=
 =?us-ascii?Q?p9+QE+s7QM4JP/G0g3elB80KJjdMwrRhGEJBgRzqrkvF44H92kWU3wfPQNSN?=
 =?us-ascii?Q?VhovB1HXRAJdjyiE/GrQtx2gFo3AsITL1Vq46+Q7C/xPYcvCuqR5i0or85r+?=
 =?us-ascii?Q?euROa/1rJtg0RTqkSD3X5uApKh2RaTEBMV2g6QLDqBlVDt6M1as65VGjxWHO?=
 =?us-ascii?Q?iRdGhnTm7ZKuprm2Q73UohdPD0DnI+iIEZRX5FORTAcABFDChkT/uCaNUbbL?=
 =?us-ascii?Q?XVVAWKZk8SPIBa/f+FZSc9IV0p6TU4Zw8qLLqGWaCk0qP3gcYWfFQsCMW7jc?=
 =?us-ascii?Q?8MyXErVQqLXsrxMAhkUT+rBywEDrirePZ3X+90ccRpt16gcJeDi9YveycXmg?=
 =?us-ascii?Q?sIBIf3imIqcK4Afnz70FX+1zHt3rMELu3jtZUgXvgLwxv/WDGQfA7Kjt0GvV?=
 =?us-ascii?Q?ubsER8YEXtzxaCuwZ7SLjybWa6Y8NfwAGZ37Zji5ZmsjDakma6AtKIbKtJAA?=
 =?us-ascii?Q?RXBygurXtWqFRINUKH73Xa4WjUB1a6JKSuDfaVEFZF3dzk2ZRbRRQfbgrvva?=
 =?us-ascii?Q?95OEu5N4BJHpbGT1+3CyuI8mlcWc27Y0XX+R32heizEwTp8P+55vmeGw1HZb?=
 =?us-ascii?Q?tA7aZEVXdq+ccIWcpAYtBhtMAzSXjtjpR+v4UVAGrzsq/7/ETGNmjfVwj286?=
 =?us-ascii?Q?uj92lHv69hpdnWf+N+Nej0xDQ/hY7sSvGRu7NoOj7Wq1vNVddExh60/ChVJP?=
 =?us-ascii?Q?S8KFr1siWGgkCcDc6GxRk4qu0sQy7qZWSOfdoDHVbmoSq1eMLGCshqdrYjGf?=
 =?us-ascii?Q?wbf0XJmi5kml3yWyjZZgPMJiBduPygvtyiH3t4uN2ElC9VzUnjvbMzCGUbox?=
 =?us-ascii?Q?jWIpjfZmAHWyIxAOuUqcQawwfj4UjXGA1ulxP2r2uPGAz20DjY5d40NaL/+U?=
 =?us-ascii?Q?zQlawvqMUHgfE9/psW54Yx4GhN3S3ufjF6wEPg8FYInKZl9GFeC3FdBH5c2Q?=
 =?us-ascii?Q?HfDQQ8DNDf9rYsmxRtpizENDmKJVpl5ONDtpB2vMaUdzINOJ5h6BtjjWAf20?=
 =?us-ascii?Q?9vJrQPoquq+Rbz+OWdowPGYbSBsPOY/YjWkFSqrgknEXf23MPG4MCbGlO/Y4?=
 =?us-ascii?Q?DlMMww+6xGTjHWJmVfYHrTFEmWlG93Dsnexv9dauFEbtN73Nydh3QUy8ltKh?=
 =?us-ascii?Q?dVKNnZATSoAZTZtftftwHT9060KKdOT2mpnBSFa/7LTKt2k6SihL9LFCiDq7?=
 =?us-ascii?Q?V304NM5zjW6qjP8pMTXmmRI7HSbSXvVJCENq7WRU5haMTb9DfKZ5CBFWm/HF?=
 =?us-ascii?Q?tqpprTrR2fYymS4mBWYO/Tsww/zk1OBBo1oRV74MF9uBL5Kr0cU1AT/Lec87?=
 =?us-ascii?Q?Uo9LuP1pyB54dP6z1L6LnddfutkcgVcbYNcXEv2mcU7Qol2M+gc1rMoMIL4u?=
 =?us-ascii?Q?/jLMl3JVlhUOcD+h0hMLiemUug3eorW5edFwiK/JhUm3M/CrSD/4hWhdDHKB?=
 =?us-ascii?Q?0uH0+Eb4QAj6DR236qzYlYt7gEDwAKQzw+MgWUJmps+jR95jP0NVxeIutomK?=
 =?us-ascii?Q?YDlyWBsspAZQ7lwOumCQ+gKF5GveHaVbHELxI+5HFpYfEcasHUDOV65dHoHZ?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9XfflM7L23xb4qNuO9RtqNuwj6avjx/uPuaOj/HfiflF+Vk2MXiB2JycoS7xfgKD1ffHIXoIEozeZAyujdB9l1opn+8nA8FgFmZvktwhMekzMh4zkPBber1Xxn7ncRatp2jy1ZtUoyZ0Pu2wcMY0i6ejArN1pgAYkpv/6XRMHm01l/IvRSyAHmaOdJGqhlz5vn8v9Cspj6YGldgKhmk4B0WUDlh+au/+xefeSs6PoS3HYZeI39mO6Yq98JaEfPRwupPkQMgyjZJ3EnJF4lJqeXnjyfALdm62CpX9aeHU95D2TSllzPhnEXmsjnKumWfIWrmut1OZRQvvMyLBcXk31tMHiNGTW0LLNvX6UJP5sQaYbD4ILWIle/PugcG5codIqgw/sOBwgaMB6gaSjclsFHUCahMFwAt6UrWh9XPrALFLs6YfMEgVJP2k6rHuyvAID6etmMJBx8ZnRSFyQ2AToSyQ7nByYT6mJuJB7MMVj9s4F0uhSgjKQUafLCwlH3RDh7T615nEfsa2SE+jH1MyHTsPBL8SwVxy2cgyVODjjVmQa7OobelyhYt0gpdp2nj4j7IfESeY87d53S8OOncIWb8Agp+xHfTrMoDkr531AIM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4bf9e7-efc0-41dc-a429-08dd3f02c627
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB3374.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 18:45:30.7014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5CKNus0r1jB6nfZIkrIBZ7aTgI2dITuyfaAMmHA1WDdcc4DAqHzuPoE6eXKr2MyHuplTisaQEGKw/NOjFrMBkcXmzfPHHFnT0oU+6EeJP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5706
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_09,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 phishscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501270148
X-Proofpoint-ORIG-GUID: 1ST6VQHmifSYSeKRKvbBE58IMKPXJOJS
X-Proofpoint-GUID: 1ST6VQHmifSYSeKRKvbBE58IMKPXJOJS
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

Hi guys,

It'd be good if somebody from the drm side could look at this as you are
using fields that are deprecated and will be made unavailable (in a
non-optional fashion), and relatively soon :)

It'd be good to confirm this works on real hardware (none of mine supports
this sadly, I tried 3 separate machines...).

In effect I provide a whole new mechanism just so defio can do the right
thing and retain the exact same behaviour, so just need to confirm it does
what you need from our side.

Thanks, Lorenzo

On Mon, Jan 13, 2025 at 11:15:45PM +0000, Lorenzo Stoakes wrote:
> Right now the only means by which we can write-protect a range using the
> reverse mapping is via folio_mkclean().
>
> However this is not always the appropriate means of doing so, specifically
> in the case of the framebuffer deferred I/O logic (fb_defio enabled by
> CONFIG_FB_DEFERRED_IO). There, kernel pages are mapped read-only and
> write-protect faults used to batch up I/O operations.
>
> Each time the deferred work is done, folio_mkclean() is used to mark the
> framebuffer page as having had I/O performed on it. However doing so
> requires the kernel page (perhaps allocated via vmalloc()) to have its
> page->mapping, index fields set so the rmap can find everything that maps
> it in order to write-protect.
>
> This is problematic as firstly, these fields should not be set for
> kernel-allocated memory, and secondly these are not folios (it's not user
> memory) and page->index, mapping fields are now deprecated and soon to be
> removed.
>
> The implementers cannot be blamed for having used this however, as there is
> simply no other way of performing this operation correctly.
>
> This series fixes this - we provide the mapping_wrprotect_page() function
> to allow the reverse mapping to be used to look up mappings from the page
> cache object (i.e. its address_space pointer) at a specific offset.
>
> The fb_defio logic already stores this offset, and can simply be expanded
> to keep track of the page cache object, so the change then becomes
> straight-forward.
>
> This series should have no functional change.
>
> *** REVIEWERS NOTES: ***
>
> I do not have any hardware that uses fb_defio, so I'm asking for help with
> testing this series from those who do :) I have tested the mm side of this,
> and done a quick compile smoke test of the fb_defio side but this _very
> much_ requires testing on actual hardware to ensure everything behaves as
> expected.
>
> This is based on Andrew's tree [0] in the mm-unstable branch - I was
> thinking it'd be best to go through the mm tree (with fb_defio maintainer
> approval, of course!) as it relies upon the mm changes to work correctly.
>
> [0]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/
>
> RFC v2:
> * Updated Jaya Kumar's email on cc - the MAINTAINERS section is apparently incorrect.
> * Corrected rmap_walk_file() comment to refer to folios as per Matthew.
> * Reference folio->mapping rather than folio_mapping(folio) in rmap_walk_file()
>   as per Matthew.
> * Reference folio->index rather than folio_pgoff(folio) in rmap_walk_file() as
>   per Matthew.
> * Renamed rmap_wrprotect_file_page() to mapping_wrprotect_page() as per Matthew.
> * Fixed kerneldoc and moved to implementation as per Matthew.
> * Updated mapping_wrprotect_page() to take a struct page pointer as per David.
> * Removed folio lock when invoking mapping_wrprotect_page() in
>   fb_deferred_io_work() as per Matthew.
> * Removed compound_nr() in fb_deferred_io_work() as per Matthew.
>
> RFC v1:
> https://lore.kernel.org/all/1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com/
>
> Lorenzo Stoakes (3):
>   mm: refactor rmap_walk_file() to separate out traversal logic
>   mm: provide mapping_wrprotect_page() function
>   fb_defio: do not use deprecated page->mapping, index fields
>
>  drivers/video/fbdev/core/fb_defio.c |  38 ++-----
>  include/linux/fb.h                  |   1 +
>  include/linux/rmap.h                |   3 +
>  mm/rmap.c                           | 152 +++++++++++++++++++++++-----
>  4 files changed, 141 insertions(+), 53 deletions(-)
>
> --
> 2.48.0
