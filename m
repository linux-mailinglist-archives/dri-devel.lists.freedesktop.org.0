Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3012A963713
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 02:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D202510E162;
	Thu, 29 Aug 2024 00:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="MJlkjYjr";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fLcmNYld";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EEE10E162
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 00:57:24 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SKiNqp003285;
 Thu, 29 Aug 2024 00:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to
 :cc:subject:from:in-reply-to:message-id:references:date
 :content-type:mime-version; s=corp-2023-11-20; bh=C1uVFJaaGw0bVN
 8nBb1owwN5pOu+mU/IFql0yDiAbs0=; b=MJlkjYjrNe/49fiwPmm46Q0SF4QWJJ
 g28B+yTelvum1G14FwicuHyvBFFNMY2+aPxXZEIrCs4SnGJHvH/daAWMWCnRaoIq
 GnROFUbd4m79IBNBS1rps7gnvUICDT7Twj/YKxE/G2I0BZKQyaPuc4qZuhDm7Hlr
 3QobFEGNn8dRsYFbrdu/1fh2ovJ9ehXAS5MOd6XyhcOdXUgMAVnMOEY/qjraBrmK
 2okRh3ohEkodgIUtxKlYjVin4liFeS2/vzZ96bkpjJlVCR63gxE2LnsbkQzdd/n8
 DaBxdSYfZR0KzV+lmpn52NbWoghpP+9Nf5F9D+8WYeOgmPEpcq+I9QXA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 419pukjy5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2024 00:57:19 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 47SMd2TT020166; Thu, 29 Aug 2024 00:57:17 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 418j8pswa0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2024 00:57:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIjH1O14fiZx6tBUs+2grW/AUQ3m70kVoTF2rUWeYcAWfNeJI/JYiDJLp9UAIoY3Y6bGKdmluQWRuZoc15DhHF5QXe/4d8PPu93qwJsKqAFSlMLlr2PNdYAJ+2XOitbUCHkC0S1ZBh57dECNCUIQYwA5iOZf4x5w20leyJhxzFJql4wdyPUul/BMsFadRnsFdMxyKaH787W5AVVAQBc5TZwGooF8c0A7Phid3lFTg43o7upDzhd+Gz8/5Ckh809uoJ5Xmjd16seaaFgmGoQ+IUS5ZbZL8B37D6gYppnuz48Swy/3RUk78aVZq+tH4KIsisJ6XuIyKxKNFaApCW99sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1uVFJaaGw0bVN8nBb1owwN5pOu+mU/IFql0yDiAbs0=;
 b=mWRpfm2yAhsLnHbnC2lRRpL9RXzYgUW/g0YXoFE0ZyMi8fIHXNHFVzMJC02ZBGhHRTEJC8cgSjWMXotnUkhRjQCNM9cIvysw6oTzVDjuTtjoCmCvH3Yo5BtfVrf5jYpgsrIDzMOD65hsmmXgMT4o61WlruBIm277KCzRfWOZcJgi01ZVjQ/NO2KDZzDIjGpJKTb4cE6LIZgEIeEw50oVAYdw1MNdL4FJoWpkh7HhwDm3O29m8FSGmdTkdUGizSmx0n3vDj7GBlYtgQo1QHD7vwOm5h3MHZyZDo7KlT8DDfGKggIFueMCVSUmk9946cA8z5FvYxSOfVwmFDjxjJBbcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1uVFJaaGw0bVN8nBb1owwN5pOu+mU/IFql0yDiAbs0=;
 b=fLcmNYldKnMIaWfjMgIQKD0/ZsFdPyLv9eJCg6CJpKJC8yjQ3/dAWOLUNoi6JOPUOUtnB7bXcsfaY27WARzHD2zaJRKXz60YbzH3PtJX5vqa9OxhtyQoa6KHrdT9KiYPpnsu3hov7+pUBlDl2NnGJ67cvT0l0ty5/pKdJZCMR54=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SJ0PR10MB4447.namprd10.prod.outlook.com (2603:10b6:a03:2dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.19; Thu, 29 Aug
 2024 00:57:15 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::5c74:6a24:843e:e8f7%6]) with mapi id 15.20.7918.017; Thu, 29 Aug 2024
 00:57:14 +0000
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-hyperv@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: remove the dma_set_{max_seg_size,seg_boundary,min_align_mask}
 return value v2
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240824034925.1163244-1-hch@lst.de> (Christoph Hellwig's
 message of "Sat, 24 Aug 2024 05:49:11 +0200")
Organization: Oracle Corporation
Message-ID: <yq1v7zkdu3s.fsf@ca-mkp.ca.oracle.com>
References: <20240824034925.1163244-1-hch@lst.de>
Date: Wed, 28 Aug 2024 20:57:13 -0400
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:208:32d::14) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|SJ0PR10MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: 76beca9f-ed74-49d4-e6a8-08dcc7c585d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iDqlXxe6wYmRwRiKZnDyyoNtXC8SRvYSwhcytIkW2CMqfwx9uACP5IlMZIr0?=
 =?us-ascii?Q?Zj8xL0V3d8knLrzu5fvW6Cr8zgBF0iR29XD7fl9Eh32qq0+MWeyGrYnR7fx6?=
 =?us-ascii?Q?7NTYKvoBltzP4iBg+LxP5ezBpfLpCv5T3GSCe9/A5edL6O0m3+Cd1E7/H7Q1?=
 =?us-ascii?Q?qMwiU6GFvkJXe7jnhIvvKwSYM37k06LO+9/9/LswfCbBanEO4eDsk7YPk/0i?=
 =?us-ascii?Q?mBxqalg1MjNWNgDzCYeEp5eayox4K5GcsfnSBLwPypzNPUkzvGebmesNxemq?=
 =?us-ascii?Q?Mg/5rb+Cojq5vbw+ciTfhb1VZA79Pa47ZWlCsiuspqXQLqXZ4Sj3BhZBSsTc?=
 =?us-ascii?Q?LFLUDBYDuB6XH681IftwfKkT3B4u5PD6VG0vVF7h8gAMpaClH0mYlsQHaV/z?=
 =?us-ascii?Q?ytdbcnhAxcifZFMKjHn2e6YmtCM3JfTGB4dVT0cNIKU866V/tGKu8cTsfLRX?=
 =?us-ascii?Q?u3UCx6B9reqaMx1mKua/OsvuHZtFFqyqFH9REcjR0FQMEHbPt31xgcV83J3u?=
 =?us-ascii?Q?dwJarmPcnukZErftDq4aTMtcCWNj4dvemW1nNKWzbOmcxpcM6Iz7EDrsYXtA?=
 =?us-ascii?Q?dDJU48WgLv1I9awzvEgr6ZmqQCCGto+4WUocS8T/hjXfF8PJhLCipf5rMENB?=
 =?us-ascii?Q?MH1hV84YwzyKXSqz1iEtlJWoCbzX1PsW/vE+2RUB8zlEaapUGCPIz9aMuzkY?=
 =?us-ascii?Q?EKBmhOf3ytEyx15TS7bIaB6DOfKfhRFp/2JUu6tHvo6BWkiTZLfQXM+BepnP?=
 =?us-ascii?Q?q+vTCKjMwmzfqDST2VthUcd1cPErh31t8B1tLQggFClsRGXwjHrJ88WRAIsd?=
 =?us-ascii?Q?EA5DVyY1d+nV37NNJyj0/IsSuxMI/Xab9Ei4u0T28HbI9RyEQi5y0t1hckPd?=
 =?us-ascii?Q?xMS2fkyZNXEioasMxlR0vIIRfiHdqJDWyq9hbg3d0KCb8Jdvxo18LnMqqkkm?=
 =?us-ascii?Q?VXV23JaWpYVK72RrJMLdua106WqsFGJMVdwWj9Ecar7nExmIiBqDIwhdvo7P?=
 =?us-ascii?Q?/OAP5wWPhS1IFsTvWGZRFw1kP1nyu7AkAHWTCO75oEmvkMXqe0Hqfd2zVwuG?=
 =?us-ascii?Q?VucBKPz21soTbLy5sym6wx1eZSdDqdNxwqqc0ipxbGamPinoIxhJfaDB8hfk?=
 =?us-ascii?Q?ep+QebQM9iSk3WzpaA0kPiNQgpzSOXj2wTX62fzH+WCeZNIzZpSIQlWlrp9V?=
 =?us-ascii?Q?17QArqXfeb2xpFbDbW2oMsYQVgcrfKcwC4ksKZPvYJaDWRuKLueDj5HxQJ11?=
 =?us-ascii?Q?neQOC+ObTeASE6EFzKo7qOICRvAGMz4YXEASedaaD/NogMZwebUFHibGqLKr?=
 =?us-ascii?Q?QfNIzk6TW2Hx/jSNff6BsHqlVe8ArJA/bO5x3I3dtOh9Cw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4759.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EvuRtiFDgtw+EZnEu3qsDaSDDxTm7NGFOzgFHij1B5MXvI51VFgvud2k+WUe?=
 =?us-ascii?Q?qwD1IuMXyN08ZaDg3sscz50RfWAIj5BXu6vV+WoACO5kQ1e763z5KqX4ghcb?=
 =?us-ascii?Q?vKpis9XJmB/6Isztg1tfW+kRZ2kz+QxjD0UsWiL49xvq6Bx6p9KSMGBACApU?=
 =?us-ascii?Q?QZh/HSZwLYGYN76gXgZUWY8QQnHnpa67z79wrQUCXWu9lijl9nfe+TwHNZbk?=
 =?us-ascii?Q?WU5EW5KO+T3VXgr1ILuv7h+39PL7GxlKr0bD+FeYzbN4MYs72bwq8pPWIoz1?=
 =?us-ascii?Q?xN5S2+E2RG19PFV+vCaRnkk/QpTetneMzhNoaNbHqAOkjhHrboddOGC+UBIQ?=
 =?us-ascii?Q?sm7/Z3VZWmL5YlRybLdjov5SW6VTUbGp/rmW1aBWZTNyV0GW1ADzaW5FFUSS?=
 =?us-ascii?Q?E7jB0dzE4tGWwfV1fdjdHS6YW6P1GqTqxAZYxvpKgVP6Qw6yLYGe25eIP/SH?=
 =?us-ascii?Q?a0Er5N4VjCPyc1CB+rDRFdlR5Ez6RhkCcYhC7Eek5lbRr0zxzji6zgf+1L1c?=
 =?us-ascii?Q?u0q3oMIzbrWWopgnF0VUxZOZFf0ynEWospDXNuLbZewlIHgEHF9vorYcqyZc?=
 =?us-ascii?Q?TGsJCeDST+nNc4YrQjncEH6sN1hRGbAvAloCnba9T5RT4KNll+dm06q6b++4?=
 =?us-ascii?Q?QmbfsGeTzc7XABXi4qroGEGK2CSk1eTVtZnvun70a+LPlHICXzArywv/WlwR?=
 =?us-ascii?Q?RBLY8vj0Y0qVeUYKjjy4oyBZfOJLOfuaP3ELf16TIZ99FT/bRzpiYcgHOqnA?=
 =?us-ascii?Q?aQa+z9qatTkzH29PX4ZMs5J0vwiCWdWWAQoDaLmRUk3o+6gedGVDMv9IFq76?=
 =?us-ascii?Q?v1UuzxDoTwrpNJEPS4cZlox1omTNLWdnC9pBsCvnbhRdBgCWbcOhVI5A5/Ys?=
 =?us-ascii?Q?VEC+ZjAGsvF/V7zJuRi9bs15dYZnltYi4eRzT+Y19FQ1CjaqH9NykDhMhkAx?=
 =?us-ascii?Q?ACcwM40kWhFxMul2+H5pWNnAzAPSibpMf0q6nXmCJit9rjkINVK8j518H6qe?=
 =?us-ascii?Q?sTpAavKORDpsN2rKRZzKoTI20KY1m0I7xt8jCVkFn9PvCkRBp3qGuhrsWtb3?=
 =?us-ascii?Q?OZrz7wauE56/8Y5E+amGs48rjoslGi7h2f3DBxmTWcIA8u6BqKlgDqs5p4nI?=
 =?us-ascii?Q?gSU+X2ffjsveOSARIhr8haf+mPGR7h9AqF98LYC5LgCXpC15wTddKHSpT89H?=
 =?us-ascii?Q?W6ohLHShWipJOpExoliS/c1KnIb5AIc7R0xDwZFIk+IOh8+NqOYDfPt4U2my?=
 =?us-ascii?Q?AR804sP1vf5kiDSHaPWcLQRO25yTE0cL+3Mg0yT7qMa1V0OG017nM2JmEJMh?=
 =?us-ascii?Q?+lrEAczkBwprE5J/rKkqyO/KfFGnOA+CQZB5MmaxlqGJ8NmRaIXBA105VAmH?=
 =?us-ascii?Q?4Y9vjac2zYwSiVC++Pw1/xtS6Hd36LMux8/zjK0qrOQibKczWAeh6LwvWL9I?=
 =?us-ascii?Q?aWm9b1U7D8NjFHY/Ub/g3B60am4SOVWjkp3dwEWB3L00NZT2G2t7BMauHzB4?=
 =?us-ascii?Q?mvvTJhno4U7oEZl2TVQuwxV2vlFoGj4C187EbV4QbHMvlRDA1u/lejf4t1HH?=
 =?us-ascii?Q?HnuVS5El7Usz7LGRsw1HDpMmzcxf9o9sdKHZQUBrgry0ECR+UtPDyQO5336j?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: PvaQdh5BitvDaier5HsmhAicmJoLgMOeYN1IAp/TdmjRdXc1SAZ9yyLWgM+vt47Tkty63JB2R5DYDnygpnED+04qDME0m77CezAFU3hA47ygS2ULvplZse1EHy39JzsbQq75LCoFwux3Dh3jd/XENYRm31UCbjBxX8EBymIhdnwrgJ+ROOSNUie3ZKHORkYacZZa5dwpkPfj9voLOLbwMbPNIVPFrxmOXhTdqAqbfjKH58JvoPfZvBVJZa6AHd7ymjRXgdLKAJKMFDAlJbzAuLdohD6HcbhmeqG5DmjwESdqx4f3llYYev8Td3XkaBfEkTxJ00WgbxuNz/ZJD7rCVRIwLmVLnvg56XaLEfPRj7NCqc2um0FyoDol1QpV/YUP4lYNXO/QlmRNZr3Pzy9IaWWQtckSWlEKAX1mx3ivG4XiB7L6wDleUXh8H4l1pM9+c3DLPPiKe/sJoDQXovsROAtlGHX2P/YdO7XEgNzd6/JO+K1yOurMUrHGm+H4YWaVf6PmjAPDdxBwAtownAh1LXfveYABrya7Fp3H1slFeFtf8XVg03cWJx7fVP4RhknyeUBBf+4YLoUU2HL4agFfsvGdfT9vQYH7u5Lwob7QKAQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76beca9f-ed74-49d4-e6a8-08dcc7c585d7
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 00:57:14.8856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sknl6sTTi3GglHlxYKx323m5rpbKg/70pbt+9vrK1CIOQ7xcaWtvFNRYVME6JsuZzzy92TQzJRbEeRDtL9YXF9B1IDEnMgj7lPN1mDU+ZxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4447
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_10,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 adultscore=0 mlxscore=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408290005
X-Proofpoint-GUID: Yx23GV4pwY38ymcssZ1My6Hft5sNtRHP
X-Proofpoint-ORIG-GUID: Yx23GV4pwY38ymcssZ1My6Hft5sNtRHP
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


Christoph,

> the above three functions can only return errors if the bus code
> failed to allocate the dma_parms structure, which is a grave error
> that won't get us far. Thus remove the pointless return values, that
> so far have fortunately been mostly ignored, but which the cleanup
> brigade now wants to check for for no good reason.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering
