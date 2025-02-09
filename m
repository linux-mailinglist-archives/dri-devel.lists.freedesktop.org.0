Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C2CA2DB59
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 07:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC7510E200;
	Sun,  9 Feb 2025 06:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="dk+2VGG6";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="p0bwrv0H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D8C10E200
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 06:36:37 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5193MlYu020744;
 Sun, 9 Feb 2025 06:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2023-11-20; bh=+lvZZuaT+Oy7Chacdy
 /Uv5rPNYu2lPojMKKqhYXdW4I=; b=dk+2VGG6EnntO3L29dxtL7m2Qv3slreH7e
 o3EZjq76OJI5NdRAhoHqTjRPMfntVLemaMrEgzTGJHIbqOwrHrJx14ESTmCqT+OE
 /5bpDD3u44P8lGHTCL3zWo/OUec+ZU6np6K9gTWs/X50j4LtLYbMnpdEMsKtmH6P
 imdxSYCOlskBXgsm8n8A1NClUqQLxf9AYERdjJMz23GAaUl5tgnl5hCGjpSnXD3M
 8BwH5F7DRt+QEQw7uQSOqyeltEZJX2tUFRLI+ZiKziX6p7Lj2TgaarpuVMj3Z+FH
 X43117iVK7MvA87KLcSe3E90C28UwwtOlAs79JKRpb/dN8h3wKAw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44p0tn12bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 09 Feb 2025 06:36:10 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 51935bG1038659; Sun, 9 Feb 2025 06:36:09 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44p62vrp72-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 09 Feb 2025 06:36:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjXXUJEFGl5x/WZT9N8gRt3Ky5PAcpfgATORNwk789Ei4TdqsDAJRk+HRvIauOVvUCa3ZECalpude5QJ18vQ9rVPdHk8hs9Y4/g90ywW/HCKHikoVQDJjmUHb7In3algpj/DjFk5c+utRYPbYJyKZQbi0XNNM0R1skDFSmul2zXOJNdsSluse/OD+haM4YCuCmiYlgzq27arclPTggBrSs5E7kun79rfRFTQofjf6LVkaO43iVyadH8Bz5IqcYqD5Mmo28nVDM+KNolF3sLJrcmG3WhtyTYnc83EKRp/rbPuBqEsNp6orbg5fKnk1NEmjegftGBEOWlDLk2eOijTxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lvZZuaT+Oy7Chacdy/Uv5rPNYu2lPojMKKqhYXdW4I=;
 b=PtrTOEEMljkmZpQ2NVSdgvo9+ZAAk5y1r/4hmXUE+5/P2o1k9KEoi++UgZdYSVJh1f6bJPWyvSMicclpYUk+aFX3HKRHwtVijqMYvIqU5euTuLc7zHqilYIlogUMLExA/b9t46HuZdZHqeE/c4mo1ZOzjxWqHjjcPcBJMZCdUr6HnOKh29cDiZxciCSZIXmmZAHc6lWg4ESbiUjN0mGV2lNIl46+pwma83C0bMomTi7ifr2WFIpmpE+pfolhSNRjdGpzGWpRz+SsMKoL0NlWU8Xg92QCnTGyg7aRFiit7SLTmXQsSH1uSF7Yg7k+YX3usCcfRzbO2D2XHojeqpRZ7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lvZZuaT+Oy7Chacdy/Uv5rPNYu2lPojMKKqhYXdW4I=;
 b=p0bwrv0HkaL+xIxTmsEtdVdzhEa+Y9qXVnj7BY5r/u1Bap84+E1C2/Zk/wIlHyYENQBPpWz5b2OWdhYOYsT0u0YZUMXLos+RG0Ae/KZ78nZvZ6u236J2gP9hH5kJ+URQfZb2klvx01UZ2j8HdJaHjDzzQv1sceAJCzSumBxT1yg=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SJ0PR10MB5741.namprd10.prod.outlook.com (2603:10b6:a03:3ec::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Sun, 9 Feb
 2025 06:36:05 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Sun, 9 Feb 2025
 06:36:05 +0000
Date: Sun, 9 Feb 2025 06:36:02 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Message-ID: <d4018405-2762-4385-a816-e54cc23839ac@lucifer.local>
References: <cover.1739029358.git.lorenzo.stoakes@oracle.com>
 <81171ab16c14e3df28f6de9d14982cee528d8519.1739029358.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81171ab16c14e3df28f6de9d14982cee528d8519.1739029358.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO2P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::25) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SJ0PR10MB5741:EE_
X-MS-Office365-Filtering-Correlation-Id: 698fc7c4-3985-4ba9-cb3c-08dd48d40780
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nJBR+9ZSNPbz7pVahdYFgQQGJg0z3c8VrQ3FhF1RNv4iLbBs//ntB9CptJJr?=
 =?us-ascii?Q?WlSGHcIOzUOm+bF8Wfsx6qWUrGPwVyofveKLlnY/yR7LPaSp6NJclak8KkLL?=
 =?us-ascii?Q?NfO64MXqBVF8Uef01CgIGgxVJ1hq+Kk9BQfymtySZAZxbcdUItQfsqbBvplo?=
 =?us-ascii?Q?yGBN4V4eDg/YkbGhTgo7bqdyh6FjQNEHXFqnnTusY4DazkJqVMVJmYDfdS58?=
 =?us-ascii?Q?5mwU/nKL65g7+ycfi9n9HRSHCeIvB43ILVxoVXsdXgWHV8jV4VWXrsm96apg?=
 =?us-ascii?Q?MpWzowLDjLf/jcc39GpYZaq5ij7xpNo/Vhx3ej9cADXx/eGFuT+qh+8KSVtp?=
 =?us-ascii?Q?aZvwAwChWM0ZQAWRTFSOEyFF4gTPdZlCewHXPIRUpL9iyxSRseJ4sd2uqnfm?=
 =?us-ascii?Q?muky+YOVj1muGv0ZbIf2HFH5dLq8B1Kx5/jWbavxbhpY9E+soTuBBg2rjNoI?=
 =?us-ascii?Q?gALr3wQeOalgFriHbYelhBIeDSn0nwHhacGrO4GzdusTl4r9cwXv3Nf/g/0n?=
 =?us-ascii?Q?GwIUKoXEnFwGQTx8edlArLyj0RFOvo5w+RbHEG0Rrf87h0IboCYHtddyqehy?=
 =?us-ascii?Q?51c34bWosPzf0WbJKhakPet8P0bIjmwoZ/L+UFIm6PsO86WjtvHEPYVNpVSh?=
 =?us-ascii?Q?ofNTwfitKVCeoZZiSm+2GU/bRUEKs5jhZ17EvB8iwM6ljHkbO5kI+ONec7MA?=
 =?us-ascii?Q?fjLqupTFh6YCcVkOMwAtPVemjFrLkHFT00X9urGBOuVj6MXGIlvkU1NVwgCo?=
 =?us-ascii?Q?H8odNcgWyx3r/qnHnIe04McyLDTL6uVAoj+gYBjLdAFcGPFzXBwQag9zPOys?=
 =?us-ascii?Q?dVcIwkurlpS3wjaPSxgQBgt3jJqJdgwVq+aUgz61fNMwAnE31AlslNl5vi3k?=
 =?us-ascii?Q?/lR5Bw0oTcIh7sobEmREbDBdnBrWCXxP05bKgOn40OK+pV04ayzk/ENk3nEV?=
 =?us-ascii?Q?D6hXlazstjJFyipYmIxKE+lt+i3G8TVld3WGHfEj4g3slqyJQOqoe8rD9Vjz?=
 =?us-ascii?Q?j9NtUKs8kSHSEvZDpisUrZ9TFSqQdwGAJf1RQqyWP0mvjznn6Xwu0IpvidJe?=
 =?us-ascii?Q?2PAIZgnQHzTaYG+X3tHH4MmEWAIRfYKEZ2kbgPs+1gkE9CzPifnkug84cqb8?=
 =?us-ascii?Q?A1UjzMXNMkbsAKd+NZG7mvSqKH18mH7YR0TBoIQEaT9MZehtvqjh316OX80Y?=
 =?us-ascii?Q?KmW8HXKF+DB3QsipuYmzd05ucD3h76LAwCAx9y6PDpOUHqXBZyW6YcZLHQZQ?=
 =?us-ascii?Q?c07zhiODjjyZGfbi7LEWqj9POEAp4tyKskgtJsEibfFwzbSh7I1OX03Hes1u?=
 =?us-ascii?Q?TA69z68oN7z0TuikKMt/w5e6s5l5FDGI21jXq2lDQF+UmTzc2xUh9QC5ulAF?=
 =?us-ascii?Q?73QziIGo+O+beYFGoh0e2WfuytIu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DIB4OTq8aDXSvDphOazqY3zwxJsF3K5Ue8M4oQk2/zHpjEXewXxix2vB6SoR?=
 =?us-ascii?Q?svXnDdk8CNVHGjtJCX+s6eP1fSo6/5utOK2SD6AKIo0+jmvNDbl1HS1pBMUM?=
 =?us-ascii?Q?kHPcoaRGft5ZAgk7w0BNu+CnpKqBgqzVahDxW7eKj+X6vqTD3ufZdnd7YjBZ?=
 =?us-ascii?Q?usDzaIo8UODFQI5jQso9CQr5JJJUz9KPqV19VgoasesSMsewnP+JMqyxqqNI?=
 =?us-ascii?Q?ZYxlnfrScYZ5iJnswhdrFzjfj+hM7aSmNY6inXDXID/vLuM9Wk4CV7QbYK5K?=
 =?us-ascii?Q?gdiV9g/O+XJp07qzdXmAIfTiFSdUcUXkPqyHsc8WGkIYvy+GYDgBwMQmvE+h?=
 =?us-ascii?Q?gCtUEV9BcTt7OYs4cGggae3L2sNbBFTWJC4h2zj/e6Wo7G6GYNu9Z7mouBc5?=
 =?us-ascii?Q?wE+gqLv3WHzxt7lFDc+JRQQyDM06c+9VIs1poeOkxYZQPzDE2caVeFW3YbFi?=
 =?us-ascii?Q?Nfe8mMSQofrMjTvhTDft+F5lKLSMupVhiljHlsRWC+GaI+JTseEnFe0oNWj1?=
 =?us-ascii?Q?J5BDbb9QPXnRIWvaAo6IAMV3c/5tIvVa7KqKsNzyhiEBp3f2I7wUuFJpjmpn?=
 =?us-ascii?Q?/V/yeCYE7yGu8AKAjFDDSqQgJdfYJB4I8aJTQN2XtdHgjFg2WnKlLbyIKf2/?=
 =?us-ascii?Q?63mK9wq46Hn59CGPvuVIbjbbVv9sPo8fjm0hQGYqkGeEHoeH16Ue7T+s0KmY?=
 =?us-ascii?Q?Vz9mZaIdEPyIFOhFjX9AbgscJJcLIHrf8MzJD3VIEbwwzjCL5svSHkOr7bTp?=
 =?us-ascii?Q?Us3QMXxdaK3FI2xLWYg0SA7WDzJPzpPgMglgl4xx1PqzpZ4RHBsdEZY/ArsI?=
 =?us-ascii?Q?y8NoxMEKrQWhhgmW0uXQQ06ihiieCSNe3lNXb9fsT/cTvfIH9ctF/2jOnSe5?=
 =?us-ascii?Q?aocYp4SOeBHobvLKlNV0BxkbC1A8QaEvJdzsz8oDhVQARMddsgPrBrqTw/IZ?=
 =?us-ascii?Q?3eu2McuxmZclBJ/bSRw4Mu5N5b3DeeDy3jSTZlRVqToBoZHs048ATEs2akyk?=
 =?us-ascii?Q?yRqBeGLMoaEFxQHKAoDiDBHEV5EN/X2UqSsvE6xHH+arbmVKbTduuZaPJV5Q?=
 =?us-ascii?Q?OADQu8bA/kd1tZtOo7XvxJRDE3ywVzI/+BADQmehAzkD73KBM81FKqijt2L1?=
 =?us-ascii?Q?omE+8VrpWdEtTWiPuid/tn6mi4nJm3arhamVF4TR1VSGHnI2F1hyq+cBHn9K?=
 =?us-ascii?Q?mA+NyL5otpMAZMwpkw3ro+DEALsDS5ZqMMwmx03NMrw4EKyfh/xafQRuVG9B?=
 =?us-ascii?Q?inqP11UvA8SGtN5Y2br6UXTq/EiHnDL1jofaHlLBQI5QBnt0uBQssVoMXrtK?=
 =?us-ascii?Q?ELN++oWZnok8WHu2vwacHY7vnGe7nSts7o+zbcTMwW/I74WNRgLggBEVItEB?=
 =?us-ascii?Q?Zamn9kvobKP6alEqlDfMVpzucEuyR+4LQ2RvB4GTrpw473NBYQVsrr2jgebJ?=
 =?us-ascii?Q?fF5ABcL5ppgMfokFJZ5zIFU/uFq1zqJRTDbcIQ5FNHOin0CiwYfu975VHe7c?=
 =?us-ascii?Q?Itu7gRAXJgI43jL8MQEfqlOqrk4LtuN89NnlN595VJEcfSWU9kwA5/Eaeyiu?=
 =?us-ascii?Q?iXnOZEkXgFikvztw7jYQFjRT9AJMiI69Ruko3ZdoFS6goc2M3+mu6UKMjiJv?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rp8R91AAWcrIXCAH5t1Ed8n6XbuPxk4AQfkaW4D2g88VnTXyJRQYzwDzX58jnDJ4/gvtP4YAXCi4OpK8KGjIqO3iT/hNt7hA7fxfW5qqMoPJrI9c9GNY1u2Ph9bz/LnrSvMzWQRJ4fa7fiZ67byu6PCXqqNcx16B4Hh6eBEU4c+OMegTYKUW7JpnKq92338PgK+1IJJpYmW4xvLsF2owRtgnploEwqGYp/uePSDD8kTDpZkgfpk8ItOubiIopZ2M/+KqC0u9EcQfmmsw0RpJJnmEwrRK9dYbYWhqX89WrNGHo8oyW0agoZtu8GZaRsD2kxIe+GtZY4ZXZ/ZGnja9xCdaFWDGYfQQdTL9+7FGcwDgH8PjM9iEsd8WkjgbIvaP5M/HCJgSoRyo/BX2IbHPsJEY1nPuYN2iaKKUbzdvU18kEJsta5VtwP0BOtPovCAgHM1We+BjpQiJWSEMCCJS6aLSWtx/iSGHJ6ilk1xwGHkucejGOfT7NLs2zwYFJ1CenA5UBlBMmLg8ApDV8Uimhw2YJAOpf/LJ9YJAACAn3LOA758TLWd0xAKPm6VrDJ6bBvwC1womblb3nRODJjITD4+BWSjPmpwu/BoTSLyVIl4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 698fc7c4-3985-4ba9-cb3c-08dd48d40780
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 06:36:05.4023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: anq5YaxJdFhyxD5aEYMVBVM+xDAOCwMyAL/nUHNkDEDpv+8GMzsoiaSfWps6kbCJxMAZvqmhWukEVrAfzAoqvHoXy78tS64phTErPflyfcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-09_02,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502090056
X-Proofpoint-GUID: PLHVsN8lo-mPom2BuaEl4gM1l5o5vk0-
X-Proofpoint-ORIG-GUID: PLHVsN8lo-mPom2BuaEl4gM1l5o5vk0-
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

Andrew - apologies for this, I managed to miss some unusued variable warnings in
this nommu workaround, once you take the v3 could you apply this trivial
fix-patch on top to resolve that?

I tested this locally to confirm it resolves the problem. Thanks!

----8<----
From f428a950a5a932c0e4404a89f2a34b0683728016 Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Sun, 9 Feb 2025 06:29:25 +0000
Subject: [PATCH] mm: fixup unused variable warnings

Unfortunately fb_defio being enabled by nommu devices seems enormously
ingrained in the kernel to the point that it's not feasible to address that
in this series, so we use an ifdef to workaround.

However this workaround unfortunately missed some unused variables -
correct this.

This has been tested locally with W=1 and confirmed to resolve the issue.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 drivers/video/fbdev/core/fb_defio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index acf7bc7ac45f..4fc93f253e06 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -265,15 +265,15 @@ static void fb_deferred_io_work(struct work_struct *work)

 	/* here we wrprotect the page's mappings, then do all deferred IO. */
 	mutex_lock(&fbdefio->lock);
+#ifdef CONFIG_MMU
 	list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
 		struct page *page = pageref->page;
 		pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;

-#ifdef CONFIG_MMU
 		mapping_wrprotect_range(fbdefio->mapping, pgoff,
 					page_to_pfn(page), 1);
-#endif
 	}
+#endif

 	/* driver's callback with pagereflist */
 	fbdefio->deferred_io(info, &fbdefio->pagereflist);
--
2.48.1
