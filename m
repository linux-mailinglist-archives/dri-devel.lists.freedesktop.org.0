Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDE2A24298
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 19:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6307F10E417;
	Fri, 31 Jan 2025 18:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="hahjzEm/";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HVe9LGj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0283E10E417
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 18:30:24 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VIJfuA008394;
 Fri, 31 Jan 2025 18:30:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=RcB7LwTuP+jiSSGiex70kDWysccFmogi0nMMMReg+CY=; b=
 hahjzEm/epDCWh3zvMGNKLk2HxeaC/X+oZIpf8AqHKqY6o4IRDDZ6ffn50h9Aoy2
 cwlG9XHQ9/o89oLoBuFqU4J8GKCmRWTx9LhevqdRr37MuukHudN3BGfrFWEoTp9V
 uoqcrDzJAcmikGnOjAbTj3ZNaFqphHPnUYYi+smhswVCVgt2bR66Wfs4yFptupzF
 WXu4AIS3MNcdFNBbo0azucKlkpwVTA+R31yXzv97+ukct8aDroNpJyKOTMZ3E3HZ
 7NFYeVURu7PnVZ0NAJJi9pkWRWp4tU6KZDkvvJSlsjp9Rbcaji7SdHDB663ZGLbE
 STAV1GeMpiyJTO5ZC3DtDA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h3pwg0s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2025 18:30:02 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50VHQeJF008949; Fri, 31 Jan 2025 18:30:01 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44gg1gqkm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2025 18:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIhDb8XGPPGrRxE/vjzB7dJsSqC7sxIgk3Kc4YDtY1geZdRwwzuvOgtuS5AucB8Aw/GvEJ7C+4KE70CYkhifX6S3nvBcuMYCOjx1wva/0bFwJPnPM0YneFVM3bv5Apy3wVd3npjlIvxhs7HtKSSG3F8F5xb4o3lG4UPFpFD0R16cugp1uLbhSMheAfiEuTsbH+jgSKDVsZVYF29BUJaHRsA7F+qXeUiQzEgcTiB56v5MhAJpe9FeTaKUz/Vst5xJjnlaaQUmSVMJeXMaFaV2vItt18XSaqM3GExdKGtm2D6olpNgmTDOBE1ut5Q+ORx6ImvgJ96SpKxNsccJqAMqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcB7LwTuP+jiSSGiex70kDWysccFmogi0nMMMReg+CY=;
 b=jkJk/GMq/3Fg4CN1yV8B2orB8ivxzdX2rwGQ1px3v8V/YX9000EOIf1WHOW+hSes4LvMK6Iv++1iJKA/vJ30Y0LxFSYZ7/rdy/IbHs5o1c0UhMm8k253Y3jo8kgO5klSvvJcsvWhv1bv7+dE8xelD/B6nKZxb1XVwEPV3pih8HWbzfshFqozt3YU8Lgd4fOpAyM8iOf/mBXhvFWDKNr0DaEHjnmegSb2o38RvJByhyokj/RVWDiyPHGDpsvSjVsFHOWE8iD4r1rUuORFePDPiJtoavlr09soCHc8KksF5kErUM7IlT04aCrFU7VeOWjNpDL3MGWCPUFhDFrVsuyQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcB7LwTuP+jiSSGiex70kDWysccFmogi0nMMMReg+CY=;
 b=HVe9LGj9vHv83Hc7pJNg72j81ZZITovrtot8nhGCC6ojEm7FhMFs4KbArdnFB4tC+TKt6/sOHpjvoANeYKep8+cHV6Edx8Pd3KlXRijgCr0oHKz0p5JBF7xOGAnEy+vkr7QIfn4QAkyJJ8h8fJgzXKTBoSCrDXY7VIUIWKbWJuQ=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB4407.namprd10.prod.outlook.com (2603:10b6:510:31::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 18:29:59 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 18:29:59 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>
Subject: [PATCH 1/3] mm: refactor rmap_walk_file() to separate out traversal
 logic
Date: Fri, 31 Jan 2025 18:28:56 +0000
Message-ID: <dde4483cc516caf2a6834d70123af6dd247e1d45.1738347308.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
References: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0245.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::16) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ccb904-197c-444f-88ec-08dd42254491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?e38rIdzb+DmloN2yGQvwVQQBVhvk+rJoPPo7nLIqtJNQ1eSYnwTwnmLB/ekl?=
 =?us-ascii?Q?uQoW5ir2ZQ87Z3aBsXFa/RsIqfN72OX1R7Gww/Dcd8pqOKfER7PvEWaKZKWz?=
 =?us-ascii?Q?eY/MqqxxsJiqDevZ6LOwcERiGw3idblWBQs3VRcNLLyyIWe1ZCldwOXLjPsc?=
 =?us-ascii?Q?v2MLlISHUDgdoyVvFz97Gj/uQTbjGhnv7kEe7MWasJCTYNrQ4Yubte4wbb6k?=
 =?us-ascii?Q?hYIcD0fdWP6fVvCfTaV7F01IMYIDZnEcbLN7jmq7JrIPQDaYP5clG5XdGv0I?=
 =?us-ascii?Q?tbk1NSlhMewVBlA7/Gqpd1WA02uPCeNoEOYzvaiHCHXGaSTMkxl0QEcGEFnB?=
 =?us-ascii?Q?NuU5hxml+W4W0FR9Z5zO6MroMkn4WVWfoAf7WA8cqGLcCYlAOxyKvxjerfDH?=
 =?us-ascii?Q?w4eGl6pQVg6lm+9MUOudHWoPZZ0V52Irt7QHxI6iQO2mA7eRJx2vVYa40dmQ?=
 =?us-ascii?Q?xdXV9FeYxOuUUJtDgR3pVjqQszs2oyHvKM+c1oulvmKgqTsT54A+RViWUt+Z?=
 =?us-ascii?Q?MvqXyOZfRpMQv3hVpDbvgthCf01RS9UB1a9jV/0S3JUtXBb7xow1NFE2I2oJ?=
 =?us-ascii?Q?tnuoTaQD3Ks8igy5xqSBm3COSnIu0/tE1mTTAIUd2sV4w1nJkflBCrGLkz/F?=
 =?us-ascii?Q?AGLuqSMRp5grYS05kJBXaFcthE2e5rMMGJ5YtS6l1EnFVhvCjebhmWyVycjc?=
 =?us-ascii?Q?u9LJDn0x56U2+Cfs8NZIKk5V78VqR+LjMbcBCjLql4PlMl4KdzsUJv9BYj5C?=
 =?us-ascii?Q?azpJ1uJ/X6P6lVanH313SS2nAfDrx3c2wm3H1TanRMW3REkARyn0/FDACHsn?=
 =?us-ascii?Q?ZawlKvqNAyuPSgoCKnDq/WYogrJ8Xis3nHQug03l3H9w8g4ng0w87dWndOrv?=
 =?us-ascii?Q?c0FUdo44uN7M9T/nS7w1/ZwP6IsvtCjGeGD7vbdBLKIVKHc3IcdP+cHLyAit?=
 =?us-ascii?Q?UcO3Ij9+IacfSGPrSAc/ZqGkaWZROQMdeyatcZvGMKsg0n/lryXIO21k+amJ?=
 =?us-ascii?Q?AKCKLhXo10EC5kfM4q9VlyV8jkqIHe6aeAhtdtPse7OTzNwwjbosYhbqd4Ok?=
 =?us-ascii?Q?v096umrugO28IpswdZuyC9Ba9epEAWxSjQFnF//KAHpHKPrbYSZPtyzVObnx?=
 =?us-ascii?Q?coi1c4rGcddw5pvLiRSivzgYBfDSqfoKAaqxP7xzQfLd3KksWDntoe6stcFY?=
 =?us-ascii?Q?ZWNOXgi6V9l5A/4+g3BZNd6r9n3XaDmdy96cz4mw4BSLma0dI5rFiMoDDJe5?=
 =?us-ascii?Q?bO0krSaC/9B5+PfPVEKCSfDFPpxBh3DOn2jdVfJde6x/zCqDwDRlZ+t1mSv8?=
 =?us-ascii?Q?WzWiin7W/ma/AB38S5WgxdZbDpOlJucEak2yoXr7qVI33ye6KeQwzohAfE8n?=
 =?us-ascii?Q?137/WpQZqU8mNxUqOn4dxvnKCodI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oo2kvIJ1LMg9hYNBzmn9/ouM/X0D34/FtPMXdtA6JdA6eOw6R/TvcMwCuQQO?=
 =?us-ascii?Q?D9fKgzdNPU+aw4jkUTSDn1hDw66HYNOsi5qHmyMlgSwZz4q3Oz7oIr90imwi?=
 =?us-ascii?Q?1dehhYCtPrNRqVJ+mmdJ2WPf1pHAO4THnltFlGHGv8JBIumaMJSC2vzj13dt?=
 =?us-ascii?Q?LaVLep1+45uUiS/l6LEGCPQCz3QQ3Ke7lUKWYnRiKm9loKgIvDe3FCl/1Deb?=
 =?us-ascii?Q?v64BIjBV92zYdY/WDdgHh1OuBuGY21yWVnT0Cr/AD0l4XXISvpZjv9Wgzv0u?=
 =?us-ascii?Q?7wq9ChArXaNOPdVmXe35MKHn1fcDgp2N0ap29/MHR66rFvKQIaI98OPg5uCm?=
 =?us-ascii?Q?0hbvO4+7XMah6ImrS9c/m900YQn64ZeDiU4CioE6pFqzlQZt/MtuIc7OdzJH?=
 =?us-ascii?Q?JOeShhflyFJhfeJvB36V6xB4KOgRWFDqfHJJq7sYvqOtSQp/X47i3j/g7AaI?=
 =?us-ascii?Q?QPMUtbFF99+iY2VtIAHMq1So1hqcXz7ArYmRx8tVeOI8fZfb9yitYt7+zKu/?=
 =?us-ascii?Q?zvlwxq9bXCdAwSpGJzXHlUgcNYjjYkzIOTPGUOVA0/gjcV0/XxVsSEF+ozc9?=
 =?us-ascii?Q?RrlQXQBaFbUHoIv7KDutX6KQcBzxkPMhI78He3dgrUyLlEIvM7oDBXITw7aE?=
 =?us-ascii?Q?Knq+nVkf+ho36jAZ/A2VyMUYD+u0hXE7v807um9vaW2Cz6gA7fLbZbkJodVj?=
 =?us-ascii?Q?JhFxt+HliNy/HQ7BdPc3r6wyBJ5/CTY/wP4M7jp1sHz3YHpws0V5WtRKXupr?=
 =?us-ascii?Q?hI2dMXRncms5LeRxA5HcREoyue0BUFEc2Yg5+J3jShowhNWxD/i4nZ+7r1+w?=
 =?us-ascii?Q?O1hhF0pTx6yUhGlWybguX2aKuP9b9MwOdTLAGi85iO+0hw0fMW85cUdYQuDC?=
 =?us-ascii?Q?JCUh2wTfJTOW8Z3/zmtpWDm+OBtsgDzXhkNu8n91ysoFXnQfeEWbtbdF9RMv?=
 =?us-ascii?Q?/EaMNOfXDC50Wdxm7qC099vaNjaBjYjlAQBLfcHHOLKWq1vAaruBMv+iX+ab?=
 =?us-ascii?Q?iD346zlAtN0btXCs3YATipXeBtO6GVhTPxWp8bCpIiY89D/WmdesY7xFs3Ym?=
 =?us-ascii?Q?EF7cL5/H9AO0xPuopomy1GjgvqLC6jHWGkDRxEOrqAf4c1cYzL05HO8kqNFs?=
 =?us-ascii?Q?YDyWAzEXCowWnpZowNyYTKId471bwMZdaTe89n+yLnhXKJoNvc335K0f5dEC?=
 =?us-ascii?Q?PaQ14QJFsd2KI16mPgO20tj+91eopPSdiw+tT3Gs3JwWcf/GIZNgNpSk/sZI?=
 =?us-ascii?Q?hcPgZ6c/lJ23fcqpVEyXua504SbRKH+ITOV5qU2LAiQ1TCiHPhp4kQWdqxp2?=
 =?us-ascii?Q?ELgjMFOOZ5g9NXl3GfNo5SmmuUk0A4MTHb0Flg7TRp9E+CdyAlYJG3CKf3XM?=
 =?us-ascii?Q?Q6sc4l449N5L/HOXInhZ5XdgEBXbq8HxzX0arz3obBVQ6zT+98Ru50au9BK2?=
 =?us-ascii?Q?CcxIz+PJgn/4qeUuWdD5dlU0GJoPX8uSiem387hXVVaPLkMNxdvEup9e5ykA?=
 =?us-ascii?Q?4yS4qFBHx1JxJd1YcShiJp3BviDaIJBXx68EAfU+FYC8k2b+4HCau0xi5NJr?=
 =?us-ascii?Q?POelzJxjf9beKSPK/MPfGUsTF6Q+dCnlKjKbPih6YP93ryBrvi3mC1yCUjZ3?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: agSzGupkqCGk0voEuKuOODbchiGb3HYil10Y6T5xxBW5qeCjRnuxMwPaktNgbNQJmw+WsE88WS6oQa/YKZce31RPKphxvg0+C6MRAo+L7acNrVNZLV6gKXt+4TLtSSGjUO8Q8t04/7w8anVYXH2RZqZVOgUE+t2re+ZJjAw773q4sGCIVErbcG0g7j0A4Q18w0y6iI8xIAdGhrdhhv7RHWE/1Mto1E8UELS7E8WcwoYOs85qWXOd/TsZoDTl8mF7pyNNJhJZTwoDHz9km0N1EsaGUJoxNwJMdcAMVmo2OyElRFCi/fgLwXkbCgoRbNgb1nt/+U8eol1kPvZGqqs1MMxdTxBCN04Kyszw3NTnCdBT20KUsvpEMaJk14qMv+PLcNxOs77Tt35NxJHLQmKXWrcl+tPnUDay6AR0EF1lG/nNVBISar9Zegj0VPJICW9hLmNSFTY/ClJpGDir+HIv0ibfLR2HZT5BvZ0T14HV7OJ+lL10XAujqe/i57ZfkBfQc/AiwxKDDlDIHro/7U2pTF/dMFX09YeVKslRdkuKuMAWSNDP0KWEbjnYAMhNzcy4m+FZHjCIlFW3DRT1PT7DyFNmu7Fp2Gw/XVP2BKHel/M=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ccb904-197c-444f-88ec-08dd42254491
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 18:29:58.9310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZKOWuGmybWRfqT+SlFsMn/6fHWLrpEVp4+ldJ9AeshX/goVqjutePqF0+Ugq2QTE5y2Csw9kgf3CA+/aV3Gf5U6eiiOaNzR+mJJN/PAfgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4407
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310139
X-Proofpoint-GUID: cOFu9VZt_LZVgTnQMYeONU3u5gCRdcoi
X-Proofpoint-ORIG-GUID: cOFu9VZt_LZVgTnQMYeONU3u5gCRdcoi
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

In order to permit the traversal of the reverse mapping at a specified
mapping and offset rather than those specified by an input folio, we need
to separate out the portion of the rmap file logic which deals with this
traversal from those parts of the logic which interact with the folio.

This patch achieves this by adding a new static __rmap_walk_file() function
which rmap_walk_file() invokes.

This function permits the ability to pass NULL folio, on the assumption
that the caller has provided for this correctly in the callbacks specified
in the rmap_walk_control object.

Though it provides for this, and adds debug asserts to ensure that, should
a folio be specified, these are equal to the mapping and offset specified
in the folio, there should be no functional change as a result of this
patch.

The reason for adding this is to enable for future changes to permit users
to be able to traverse mappings of userland-mapped kernel memory,
write-protecting those mappings to enable page_mkwrite() or pfn_mkwrite()
fault handlers to be retriggered on subsequent dirty.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/rmap.c | 79 +++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 26 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index c6c4d4ea29a7..a2ff20c2eccd 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2653,35 +2653,37 @@ static void rmap_walk_anon(struct folio *folio,
 		anon_vma_unlock_read(anon_vma);
 }
 
-/*
- * rmap_walk_file - do something to file page using the object-based rmap method
- * @folio: the folio to be handled
- * @rwc: control variable according to each walk type
- * @locked: caller holds relevant rmap lock
+/**
+ * __rmap_walk_file() - Traverse the reverse mapping for a file-backed mapping
+ * of a page mapped within a specified page cache object at a specified offset.
  *
- * Find all the mappings of a folio using the mapping pointer and the vma chains
- * contained in the address_space struct it points to.
+ * @folio: 		Either the folio whose mappings to traverse, or if NULL,
+ * 			the callbacks specified in @rwc will be configured such
+ * 			as to be able to look up mappings correctly.
+ * @mapping: 		The page cache object whose mapping VMAs we intend to
+ * 			traverse. If @folio is non-NULL, this should be equal to
+ *			folio_mapping(folio).
+ * @pgoff_start:	The offset within @mapping of the page which we are
+ * 			looking up. If @folio is non-NULL, this should be equal
+ * 			to folio_pgoff(folio).
+ * @nr_pages:		The number of pages mapped by the mapping. If @folio is
+ *			non-NULL, this should be equal to folio_nr_pages(folio).
+ * @rwc:		The reverse mapping walk control object describing how
+ *			the traversal should proceed.
+ * @locked:		Is the @mapping already locked? If not, we acquire the
+ *			lock.
  */
-static void rmap_walk_file(struct folio *folio,
-		struct rmap_walk_control *rwc, bool locked)
+static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
+			     pgoff_t pgoff_start, unsigned long nr_pages,
+			     struct rmap_walk_control *rwc, bool locked)
 {
-	struct address_space *mapping = folio_mapping(folio);
-	pgoff_t pgoff_start, pgoff_end;
+	pgoff_t pgoff_end = pgoff_start + nr_pages - 1;
 	struct vm_area_struct *vma;
 
-	/*
-	 * The page lock not only makes sure that page->mapping cannot
-	 * suddenly be NULLified by truncation, it makes sure that the
-	 * structure at mapping cannot be freed and reused yet,
-	 * so we can safely take mapping->i_mmap_rwsem.
-	 */
-	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
-
-	if (!mapping)
-		return;
+	VM_WARN_ON_FOLIO(folio && mapping != folio_mapping(folio), folio);
+	VM_WARN_ON_FOLIO(folio && pgoff_start != folio_pgoff(folio), folio);
+	VM_WARN_ON_FOLIO(folio && nr_pages != folio_nr_pages(folio), folio);
 
-	pgoff_start = folio_pgoff(folio);
-	pgoff_end = pgoff_start + folio_nr_pages(folio) - 1;
 	if (!locked) {
 		if (i_mmap_trylock_read(mapping))
 			goto lookup;
@@ -2696,8 +2698,7 @@ static void rmap_walk_file(struct folio *folio,
 lookup:
 	vma_interval_tree_foreach(vma, &mapping->i_mmap,
 			pgoff_start, pgoff_end) {
-		unsigned long address = vma_address(vma, pgoff_start,
-			       folio_nr_pages(folio));
+		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
 
 		VM_BUG_ON_VMA(address == -EFAULT, vma);
 		cond_resched();
@@ -2710,12 +2711,38 @@ static void rmap_walk_file(struct folio *folio,
 		if (rwc->done && rwc->done(folio))
 			goto done;
 	}
-
 done:
 	if (!locked)
 		i_mmap_unlock_read(mapping);
 }
 
+/*
+ * rmap_walk_file - do something to file page using the object-based rmap method
+ * @folio: the folio to be handled
+ * @rwc: control variable according to each walk type
+ * @locked: caller holds relevant rmap lock
+ *
+ * Find all the mappings of a folio using the mapping pointer and the vma chains
+ * contained in the address_space struct it points to.
+ */
+static void rmap_walk_file(struct folio *folio,
+		struct rmap_walk_control *rwc, bool locked)
+{
+	/*
+	 * The folio lock not only makes sure that folio->mapping cannot
+	 * suddenly be NULLified by truncation, it makes sure that the structure
+	 * at mapping cannot be freed and reused yet, so we can safely take
+	 * mapping->i_mmap_rwsem.
+	 */
+	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
+
+	if (!folio->mapping)
+		return;
+
+	__rmap_walk_file(folio, folio->mapping, folio->index,
+			 folio_nr_pages(folio), rwc, locked);
+}
+
 void rmap_walk(struct folio *folio, struct rmap_walk_control *rwc)
 {
 	if (unlikely(folio_test_ksm(folio)))
-- 
2.48.1

