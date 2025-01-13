Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6A8A0C574
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 00:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BB910E443;
	Mon, 13 Jan 2025 23:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="MihEW+mt";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="RVp2zc9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19A710E443
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 23:16:46 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DMB5xH014402;
 Mon, 13 Jan 2025 23:16:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=YRhGkW/RMOMZr3nKHZ1tr1jk5DUOwJF185zsr/vzBac=; b=
 MihEW+mtd/DHxo/cdvSvL1rsNZSUosWXjmQHFaciu3Qpd9GuopgphhyJH/Tj10BV
 bAzZPvpNfXxMwK7AQnpVzryNHqlVvT2MOCjNvDSwHvNvDA4JBsiTtWlfKCOfs8vl
 QrH6AkVl9wSWJdcKyYIgThckdN5c13xbtGRHyKt5niz7FB9b/CJG60I9mP0075R6
 2i4kaVEjJq0eE7I2fNEndAiLht6VqF8R1x7Z4mCMErJvusl06W+TmkyKNQWeMgnq
 +KPgGZMRe6AICBcls6qTRg/WblNuSkvbMxwzZPHsLx7w34OBRxNdELL7BzsmqCjT
 g3EgIOt0P3b/v7ela/sQAg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443h6svp29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:16:36 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50DLHuAR020352; Mon, 13 Jan 2025 23:16:35 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 443f3dvhum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:16:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zLCFkN5iL8+5sncEjnX9pXjeZA6HmKHpeFVcdmYqE9e9DtAvZudVm1leq1oW8BHGncQBs3K7jGEpnkQoibCqTpKukHEN/mBFtbkiba6fCfR9ZA7W4oHx3BVjJwPebLkcOl2SMv+MrdyvUD2JS+P4kc+0AY9HTvolL+pllxltYMlKfDRTPkw9Ux+MPg5ESJ1Gw4eWUIDVqyBuz/wqKeoPP1+ORZjj4ytkUzURZliUxzsZVmmLfm1gZQ5yB0+DhNwzWs0ZKtUHGvXANHnc/m1lJRRYzwrexgkscd0I3SRgHdOO6uEq7DS3fTDkbpuFU8fjjqCvJStxsdomGCG7zeo1nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YRhGkW/RMOMZr3nKHZ1tr1jk5DUOwJF185zsr/vzBac=;
 b=xawtR/P4znMQcmkwMATEtyjaGJ1T66zTeFiCmHU5+/Hs9zwB9O22GHbDosxQxcDvVA7eLjmBEoLOoewrDrtjp74zAV5tiuWtRGRPwgMz9lSWvYa2yntM/OPhjuO1ZIztc09i3nhj8VWBrmfrM6F6juZ6Ty5ePBKwWRJHm/2ZudvRxAv5KQi9PCV4SzPlsT+H0QSxrkcjWVWSBTwo2Ord9WrBRElYK3pXnsjZbde9otoRoAiOsAz8MEPiWWVc3FJ9TzWYdVtGp5NLnbnX1Y6c9xp1nELB5xdcapLs4yX1mGvz4k3PwzcQlCAoz3d0m4VH79y0gCnc8LPPU6cTNC+MDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YRhGkW/RMOMZr3nKHZ1tr1jk5DUOwJF185zsr/vzBac=;
 b=RVp2zc9QGPc5nPmsAEChM7NWb3idj3nMJVfU3ttXlNC1E1OzKodcP6nGUrxKVKBDNIw0xLnuTqIg4JX+8/fT/rkVxC4Z37pp8tCFN9t95ct9OzD3fIi+V8We1CdgNBZcBIIvpxuj/YzthFp/HJWFcLQ9oenKNP7HeARUxnhNzPg=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB6848.namprd10.prod.outlook.com (2603:10b6:8:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 23:16:32 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 23:16:32 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH v2 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Date: Mon, 13 Jan 2025 23:15:48 +0000
Message-ID: <b5c053f1d85efa31028e50476333a9efed8a069a.1736809898.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
References: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0174.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::17) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: f6353302-fe9a-487f-dd37-08dd3428515d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7VBgbXd5AhUA1rkqOptH6NETl8cZzytWkfPvWFZsHTXGJy14QvCS6cjOSLXY?=
 =?us-ascii?Q?ZYQ0HIYWd/QXDNLT3mgRIRsnniQMInK4WXQKNWldIq+msJa3ym4ir50JRl8o?=
 =?us-ascii?Q?/TxKg1ODnOq1N0PtwP9BP1Plw8CLne5EJVtxV6z7dDrT38Hx4bCKLUIXD8o+?=
 =?us-ascii?Q?N7pJuq5Z7H6/LE91Rta2Kt5S/3QpI12UhZv013Qhm2R0uGVpZ6aF0ZvTaJ3C?=
 =?us-ascii?Q?4Vdcv384za9GNoCMW6T30gNjamzFUzgf5QNp6d2+eGL/5ArRnVJ9TCGboWhk?=
 =?us-ascii?Q?RtPBy9ClOkE101fZAMRfGjDIy9GKpSrsvoXeQPoXO/3BK99mq0YYmSkv/qNc?=
 =?us-ascii?Q?aQwQROXJylVtPo6I5vig7VgzXohyzc8mXGr5hadohUlnwmJFIk/DshQhHScA?=
 =?us-ascii?Q?MaQhjCjfJ5AAcCXgIUezZI3nR6lZfOBbmPnkoPKC93i6eqOmPKrECDEQFEUb?=
 =?us-ascii?Q?KdJbIoJpl31DkeDcFNr7Pa91KrtmEGbugvRoFyei6euEvyTwiTqVhKsZmoOp?=
 =?us-ascii?Q?xkBlcIZX5pEMhvMhVPUnYjnfSBkS/M42V+MBmEyuHpHsjnOf927UAUMHLdXe?=
 =?us-ascii?Q?X4MOuPMBFN+T22FaXSzLMkO+1DNBI1R1+purulJqH+Mw7dK+8KQ5UAE20o7i?=
 =?us-ascii?Q?oGnjb1YFl4+C9VCcKlhFZCb9UF5LVy8cxcNmAaAp8AB1vTxE8co8pBfA8ajN?=
 =?us-ascii?Q?85Hdn+SDfihX4Jkq2ou4iiCHNuLhLNMOmIVwfmUgz3zf+fX4oLl6/F0NZTgR?=
 =?us-ascii?Q?w5CO6JRYHlBRToGUDID6eZZlXRNS5mYL+s/anajeFdmeKyNFgh5qjetsYVk9?=
 =?us-ascii?Q?THDRAAYuaOlBLN9gvjamqb87X3qaq9d+N3CaWz9fymxyvH2E3Y017S3arE1o?=
 =?us-ascii?Q?y+oiBKaNRNTX4jWVauCsU1CCDQkHuBOe0fZHmxUKhaIlA8GzbUtO80WA7jsw?=
 =?us-ascii?Q?yrddnhyB0VztAfkj0CWiYBQLJz3C3lmcXYjHG7uOXFJsA6IbHqBhWgdJe5z3?=
 =?us-ascii?Q?EH1vdRplFxW7OXhbV9yd6QK8uvjocJ4lK3S5VUJZdgE5Tn47Vf4yMjh8fBMJ?=
 =?us-ascii?Q?QsIu82rVj+kH1flFkbTgyqkId7sUDVvubO8qnO6mludJ90IOuFsjrd/9yCtw?=
 =?us-ascii?Q?gXeZAefxqn+QmCJpKgpC5l0mc8gOrgri76fIDZ6c3dV6Pw/ffkbDc9E7imG0?=
 =?us-ascii?Q?tsZqjLpJu6A5S5gOZFPzmUgSOV9LlatnuvIM9HKwAac5JOMegZ1Tr494rZnq?=
 =?us-ascii?Q?VsQkrsbw58eo7nOhLW33xY8mK59Ewa5ksUM0ELOfTGxGC0i53gUphBAzfVv4?=
 =?us-ascii?Q?W+t5Z7H3k0lcmKRujIqIEV20Aqp3tycx2H+IWfJcZYK4Kla4K4OH9mYsxVMW?=
 =?us-ascii?Q?LMvD91hETVGGAlwGQDl9LcV6dMhH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JKTGSRsX0Lsu99XkbZZaoSu/z7UAwRY7FgHggYAr0lxPdZ5yGUG7jbm1Dnka?=
 =?us-ascii?Q?W8IOSlpUSBNAg3XBd2PXx3dB5Q1MN7sVyHOX0a/jrXyjNCwZad7jhrTsSXhQ?=
 =?us-ascii?Q?0agkXpJfoBGj2uljPf+ZGAgBlaFkpMEHQRklMSYqgIjQgGyDWmzWcTk5jZCZ?=
 =?us-ascii?Q?kpg61YZ19GgwM42g2SwJuxFg6xK8cFe8hs8Uo0+zhusY7+9Q7ggeL3FaCwVV?=
 =?us-ascii?Q?E0QAd4/bySbZ7jG8Y/k54wIe5EuNho0SwmAFA8Xnxc0KpPxoN3uF17i8gO3W?=
 =?us-ascii?Q?Nbds3l7MespgnHnyRwhholgeXZn+8xpe0wjJ8lU2hIomRADJmqBlnBCKQpdv?=
 =?us-ascii?Q?uY01n9vP0WhoJLP8aR3+cUeg4hdNRPC/pUuTDK7L9SI5Lkd/uycos2LhEqkN?=
 =?us-ascii?Q?RGoGgvBY440HMG/Cu5blYu3ZqMI8qz6aVHVwtffohPHBj478tDzQM6jb/sZk?=
 =?us-ascii?Q?KStjgZ16ppR8qUEMyB+IiofmJwt/qaKAaJzpA41HJLARWL9/eSMU9MJIb2Ug?=
 =?us-ascii?Q?TBQ/7Qu/KOTSjmbqjqTiUbN9Kti5F/gopCh2DMLa/0yFB3je5PaJD+k+WXxX?=
 =?us-ascii?Q?L22NsO9JjAk9bRlb9MCefdQ389VedLxqjff9f0Jp4tjdkuQTHUqU3v9panTV?=
 =?us-ascii?Q?bkQK33lwxeMXfFZnFpqSKCLu3dAvK+Drd1A733gb8IOLkkwAxS0sasvW+HWE?=
 =?us-ascii?Q?gg6PsmFL+i1VGj6v5Mvv/0gc0dRT1Jpd80LX2pugi+M+24kylK46CAMwWiXs?=
 =?us-ascii?Q?7+ejyz07LXv/RJwli4F6YfPw3Z3SzIzzTxbmZgBbO9HEMh8nQkjtgnoM5mOi?=
 =?us-ascii?Q?PYa4sCM4KdsRfVFKT9yRWzJbclmraEstlr254hRbo3jZ79d78bN6ScvFA0Zo?=
 =?us-ascii?Q?XQdVOLD1D8aNVuYmuLLx4f9hBmwVgHtCzj5Yop1MuZAbxrtpPHN+ZYIrAUjC?=
 =?us-ascii?Q?EVGaoM0Q6ihMm27STws1PV5SqkXOTkqhXIoTF0/6XoUEU2Wsfzo1QvHR7Rq7?=
 =?us-ascii?Q?0NruIwPMim/xQSXetwAUTp7PgGZM8VLN/PDot3OfI9jJzsy0PwdgnIpDk+px?=
 =?us-ascii?Q?exQDEQScaAQYZ7+r8uHvHIcGaZaursZjmWmyRjiEX4PSLbc+FFkBs4gqgDW3?=
 =?us-ascii?Q?zZG5iJr55StAs2PXiPQrSZ3+zl7lxaICliRc909j5SBVcCPB4jH2FpOFiShW?=
 =?us-ascii?Q?9hxPvCLAoZ0sOLBhtzXwlalDJcvTQwm8gOJkkwdyr7t6v0oB/M5eBMKjvmCm?=
 =?us-ascii?Q?W7221RT89pJlUrUW2lTtDFvZ2xyBo8u8x3bI6+Wkp5D9FTL3ZuEwybfHzyW1?=
 =?us-ascii?Q?xMQSfrPK9j7QyB+QQgfE67Tw4I/TA2MOboS0oZ6rxwK2tcJNqaS5HZri0C5m?=
 =?us-ascii?Q?/m0RpE09UG6c2oAFxtnauFPJdGrXZL68wA+AvuXzcHBaUMcdlcp4+XXiSaIS?=
 =?us-ascii?Q?WshjBfo9T1zLlZJlSc0KP3sD5jLgTK80zbJFJOtbOD3XBx18PYcOnZIgIU9k?=
 =?us-ascii?Q?h1mQos/Enhdbkxj6NxY3yJijjgN1O20r18r2v1+XV7GfoqaQox81YlUxZeAp?=
 =?us-ascii?Q?8N8E6aeA+BSnmzyyQxHYIticP188R/tePZvG/jvAZZljBV2l75qn0ceedr3m?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: bv1MID7OAeCdBEyJduPRLPDz6i72yA237Gs7aaKz0qQyHv7I1lv3aqUQ/iRwc22c04tyr7AcbKoeki09BM6aG2Bm+CN9+O/V/SKJzt9ZXEnHqeJNErsMNTzH6NyI+IH1nT6g0710rAza//Y6mvRLrd8g8g39RS+Zn4uE9PlJMa6wv/us/4vh+y/EUBuhGtNoREfmtM+zOkbypIf5cG2KKk1n1Uj4kyYYqCzVSonhR3e4ELZufcQzILFyegXOCSP4h3+OtTxzQwRD50y8Ybu3KU3ju4aSOZbWT66ZoOzcOmeunzR0vqV8hVn1SSE2AaHYAe5UvUQhc4+6VvYWm1dOCogFz6iPLxMqLAEITvY8QjYyYPIA78giWZiJXCgdxlRLzkR3OV0K+gGJN394O7Zut9QJWxUFdQ7DbiBnyX7+8K0o+MYgtUPoMwBNYIm9o3ND7AzSsuCay35yCHCY3dI0cEwLlgFVkoQN7zfJs1EIYlTmfyRsuqSEPQt/TtL+NC02kr92lNZUMcAHmI3+eSZ38v69xhWk/f4USjk66DvSUy+Yl+5Z12lr3V3zPRU4RZcXfSIzOzInr4HlccmozlTdJANAwXiW7UVhoR4drKpLWSU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6353302-fe9a-487f-dd37-08dd3428515d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 23:16:32.7171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNEzdE14QLiDuB5/vAaE69E0PlGkRUZySlyfR5T0CIObaiViFSw/q8Tmibd50c2xeycVju640vKH28L/T7tLTODpgUOKJbl47NJARzl5tWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6848
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_09,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130183
X-Proofpoint-GUID: VeH9-9-P1IzmfA-d7n0lhtUQZ-j38-0J
X-Proofpoint-ORIG-GUID: VeH9-9-P1IzmfA-d7n0lhtUQZ-j38-0J
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

With the introduction of mapping_wrprotect_page() there is no need to use
folio_mkclean() in order to write-protect mappings of frame buffer pages,
and therefore no need to inappropriately set kernel-allocated page->index,
mapping fields to permit this operation.

Instead, store the pointer to the page cache object for the mapped driver
in the fb_deferred_io object, and use the already stored page offset from
the pageref object to look up mappings in order to write-protect them.

This is justified, as for the page objects to store a mapping pointer at
the point of assignment of pages, they must all reference the same
underlying address_space object. Since the life time of the pagerefs is
also the lifetime of the fb_deferred_io object, storing the pointer here
makes snese.

This eliminates the need for all of the logic around setting and
maintaining page->index,mapping which we remove.

This eliminates the use of folio_mkclean() entirely but otherwise should
have no functional change.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 drivers/video/fbdev/core/fb_defio.c | 38 +++++++++--------------------
 include/linux/fb.h                  |  1 +
 2 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 65363df8e81b..b9bab27a8c0f 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -69,14 +69,6 @@ static struct fb_deferred_io_pageref *fb_deferred_io_pageref_lookup(struct fb_in
 	return pageref;
 }
 
-static void fb_deferred_io_pageref_clear(struct fb_deferred_io_pageref *pageref)
-{
-	struct page *page = pageref->page;
-
-	if (page)
-		page->mapping = NULL;
-}
-
 static struct fb_deferred_io_pageref *fb_deferred_io_pageref_get(struct fb_info *info,
 								 unsigned long offset,
 								 struct page *page)
@@ -140,13 +132,10 @@ static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
 	if (!page)
 		return VM_FAULT_SIGBUS;
 
-	if (vmf->vma->vm_file)
-		page->mapping = vmf->vma->vm_file->f_mapping;
-	else
+	if (!vmf->vma->vm_file)
 		printk(KERN_ERR "no mapping available\n");
 
-	BUG_ON(!page->mapping);
-	page->index = vmf->pgoff; /* for folio_mkclean() */
+	BUG_ON(!info->fbdefio->mapping);
 
 	vmf->page = page;
 	return 0;
@@ -194,9 +183,9 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
 
 	/*
 	 * We want the page to remain locked from ->page_mkwrite until
-	 * the PTE is marked dirty to avoid folio_mkclean() being called
-	 * before the PTE is updated, which would leave the page ignored
-	 * by defio.
+	 * the PTE is marked dirty to avoid mapping_wrprotect_page()
+	 * being called before the PTE is updated, which would leave
+	 * the page ignored by defio.
 	 * Do this by locking the page here and informing the caller
 	 * about it with VM_FAULT_LOCKED.
 	 */
@@ -274,14 +263,13 @@ static void fb_deferred_io_work(struct work_struct *work)
 	struct fb_deferred_io_pageref *pageref, *next;
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 
-	/* here we mkclean the pages, then do all deferred IO */
+	/* here we wrprotect the page's mappings, then do all deferred IO. */
 	mutex_lock(&fbdefio->lock);
 	list_for_each_entry(pageref, &fbdefio->pagereflist, list) {
-		struct folio *folio = page_folio(pageref->page);
+		struct page *page = pageref->page;
+		pgoff_t pgoff = pageref->offset >> PAGE_SHIFT;
 
-		folio_lock(folio);
-		folio_mkclean(folio);
-		folio_unlock(folio);
+		mapping_wrprotect_page(fbdefio->mapping, pgoff, 1, page);
 	}
 
 	/* driver's callback with pagereflist */
@@ -337,6 +325,7 @@ void fb_deferred_io_open(struct fb_info *info,
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 
+	fbdefio->mapping = file->f_mapping;
 	file->f_mapping->a_ops = &fb_deferred_io_aops;
 	fbdefio->open_count++;
 }
@@ -344,13 +333,7 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_open);
 
 static void fb_deferred_io_lastclose(struct fb_info *info)
 {
-	unsigned long i;
-
 	flush_delayed_work(&info->deferred_work);
-
-	/* clear out the mapping that we setup */
-	for (i = 0; i < info->npagerefs; ++i)
-		fb_deferred_io_pageref_clear(&info->pagerefs[i]);
 }
 
 void fb_deferred_io_release(struct fb_info *info)
@@ -370,5 +353,6 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 
 	kvfree(info->pagerefs);
 	mutex_destroy(&fbdefio->lock);
+	fbdefio->mapping = NULL;
 }
 EXPORT_SYMBOL_GPL(fb_deferred_io_cleanup);
diff --git a/include/linux/fb.h b/include/linux/fb.h
index 5ba187e08cf7..cd653862ab99 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -225,6 +225,7 @@ struct fb_deferred_io {
 	int open_count; /* number of opened files; protected by fb_info lock */
 	struct mutex lock; /* mutex that protects the pageref list */
 	struct list_head pagereflist; /* list of pagerefs for touched pages */
+	struct address_space *mapping; /* page cache object for fb device */
 	/* callback */
 	struct page *(*get_page)(struct fb_info *info, unsigned long offset);
 	void (*deferred_io)(struct fb_info *info, struct list_head *pagelist);
-- 
2.48.0

