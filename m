Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA57EA24296
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 19:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A55010E414;
	Fri, 31 Jan 2025 18:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="c84njLdP";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="txBMt6aH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0276710E414
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 18:30:24 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VHtrKm024912;
 Fri, 31 Jan 2025 18:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=corp-2023-11-20; bh=cNISslhl/uVsK285
 RIoDDPOW+4Y3RscaWcjXHmPrdL8=; b=c84njLdPMRRNas/FVWlPX6X+A5amUI2E
 SWWb/Wtq0BP46wds5+G0tiP+sInt5CWpGJULWbtgYrUZsZW6vSHkDfPNSu/FqK+s
 VZnO4uE3NJh2T7ApR9vOwcdC1On9F4o4yfUtA7wYYJj30fUEh8ChGDDwekiMLsL/
 eHyz5u3EfGcSMxcHAuc1uCmBwp2aHRSa/bVlHMzhRjq6YcMBdqReyHtZDsrzmrJX
 6B0B3IQPmEJ/iWhVh8vGr1+iURtWdaY85/0ELmKzGCkRnjKTvYCu14BpVbqyU+tP
 R1C5ov5NPFK7NOlxiTh+2p3ECJggU26G+NgikscB/HanKicIuCnbIw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44h1yj89fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2025 18:29:59 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50VGritc009176; Fri, 31 Jan 2025 18:29:58 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44gg1gqkjk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jan 2025 18:29:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5nJkgzGvnJ9CDg8U3/ciD3PpTn8yURvORASvSpOgVnxO/P4fGKH4B8NmtGywguOLMUSHjV+7L+fKkDB2U/G/P5XmdOeeUaVJB7S2fCJCAPJtnTVv3taPfzi9n0+7+8QLwloks3NOhgpCMdfVAUxXeqfbOFUlFCV2cAVSLHTyFIPJ5TACiTmvdM0CsPjbeUQt2OODp5ecy0gd6e4K6MKkfyQ0BCf/vohUO10nLSRF7Bz3GOSLEyUiFssk1AIGrIQLTR3fQdrwO1HSKpKXL8yiAjdsYf3IEeRJUJ/1ZmrPG/qgzrzdibLPsH3vbiidNzZ18vtd5+ZM75t1y0iiZb6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNISslhl/uVsK285RIoDDPOW+4Y3RscaWcjXHmPrdL8=;
 b=ZycPHlB/el9EDFQKYxqWVh0C4ByI4U/L8AsRlWqfhmeg4LuvGdpg4dnlJxwDCP+GNYVK3uRPsxWzJQAUE7rCt9VJFipKqEyj/OKPJJehQEUucf/hl4idaxM3eiVtFxVbcpz68PHIAWUTJWEynWT9Jg4QkMUG/ByKr6B82uS1vtYoISOmJbKqHBn7QPH4iZua0dXM7ccxb4PxIEslYkDlQW25WGig+Hv49s5HIFU141siV/p77LZ+gEpqb71wqcLD3ED5RhAPvwYQs4FP5Zk7h2ketAL+9SNwtas5NncZ4Pv+LhtkN/pmSa9DH27Z3iuD4jfQv/YGJaWQALFKpPehJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNISslhl/uVsK285RIoDDPOW+4Y3RscaWcjXHmPrdL8=;
 b=txBMt6aHy6jksj3d0nDqpwRGDIqcX/D++R4z3FpuCZVGUXuV5QaI32TVvguSFw33/jjHRPa/gvqNn1UC8XV14CJznCN5GfiALM5iNu9Xe80wGGhJxfIwXxL4Djm+++PDMI8kf0MZr1SlaYTfSSeb8ZA80FXXH/LA+4jpYLj94bo=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB4407.namprd10.prod.outlook.com (2603:10b6:510:31::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 18:29:56 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 18:29:56 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>,
 Kajtar Zsolt <soci@c64.rulez.org>, Maira Canal <mcanal@igalia.com>
Subject: [PATCH 0/3] expose mapping wrprotect, fix fb_defio use
Date: Fri, 31 Jan 2025 18:28:55 +0000
Message-ID: <cover.1738347308.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0066.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::17) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB4407:EE_
X-MS-Office365-Filtering-Correlation-Id: 9151ec32-2c01-45af-f496-08dd422542ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GhgpJ9yl2HZJ3Uh0SJe+JFdKMCmqA8h80QLkZNjvKIQhLfyWYUDFCVGW3VA8?=
 =?us-ascii?Q?7MHzvcmoyvEVuof9cTotB1g8mYO1hh/YxPtp4e9HgUJcSc82pYivYFZFHFZP?=
 =?us-ascii?Q?YsWZxYrzq0N/Fqj3hZzGLY7QwB6f4Ln/cZsZiTM+epiAn2W4PR2btftmz25q?=
 =?us-ascii?Q?CulXKzof94xo47nFrjCkeUAoolAmyTzz8vePhy1px/m7XqhVrYPkjn3xa49S?=
 =?us-ascii?Q?hx5SMvurEMbw2/IPNwxiy5ENJC7OvSViuTUezXib4YIPSsL3ZYIp3iznrw2M?=
 =?us-ascii?Q?0F36KKdKoNYlz8eXpp2j+ZFcXGzAsWLSLz1v85zoAU301KxC2/vMISoJLUZx?=
 =?us-ascii?Q?gS0lBHkV9XXgYd/kV+0WbJXd2L/9OswDDA2YHcRtu9f/iygv6NQrBR5Gn8sc?=
 =?us-ascii?Q?76IiZplTT07nJIpoGy2PaK6D5bu3E8XF9VirMnmfTZJOaGhaMiBhG5HTvfod?=
 =?us-ascii?Q?6OTFSaB3/B4YrNTJVIzHsx9sADRo5+mjnvwOaCfAUGyk4KVB9oauwa+800eO?=
 =?us-ascii?Q?fxMC7WrMhAlgEn0Mx2q4DDr1ufl51uI9X+zhc1wX0ua78wiFtC6O1X57vunK?=
 =?us-ascii?Q?jeCwofLD9lPjwsyq13OoY32pz+ceff9dudfHeRc87JDF3Ia4D8CNGc6dn6DB?=
 =?us-ascii?Q?4b9NUK1eNTMwnNt6f1pwcHJVeS2Vx8RY0iho6KSTcCVgS5quOeHf7P61zyZy?=
 =?us-ascii?Q?RcccRUFfTf8dQDBLkHAENCAQMUpj+PxcY6nKwp//XUf7KOPRCclSv+c9iXsT?=
 =?us-ascii?Q?xpK3bTrSVVSsRiVTMpTBjL6MSF+eiTZNqZKpa4yNF+hVPXRZ24HZkljGMsO4?=
 =?us-ascii?Q?DR9BIXzeiawDSTx3X2M3jx9IXgcyBh7awA5ocNlSMuuw0TUvfgk60G5+4ZwC?=
 =?us-ascii?Q?ykxDGpvSpF7c9RRxo2sojVgzSyFbsa/+9h8MgKP7dk+vy9quEYRf+eqyePiD?=
 =?us-ascii?Q?c5WwsgMWz0UZ7rMyns24NUzJ67hOVSsd5nhjzzsx0D/L4elCyEZvRC/jAtsx?=
 =?us-ascii?Q?2Trnr88es9GgvBoJa8SnfMjyfgBnfoKwjRNwwYRjkxVhQ6gLgj908lhhiIhs?=
 =?us-ascii?Q?jVpyuSu1mcEE/wYAniTGQuXfe+C8ugC+VlQ5jy1WsyM+HkyVMoCBhm4hkEaM?=
 =?us-ascii?Q?jQ0U7hXqhxdGpNIjjXn4UtqMoJdHBU40XIGvAPGwuDfOVOQ53IEYt3xdvfYp?=
 =?us-ascii?Q?HdAcKNOh8cwTjFFk/CurzZim1CDObqoYW4moa8eZrmUVPJWJivPHl8s9YOvF?=
 =?us-ascii?Q?Qcv5gKOyMBUHJePLncxq1wlztIbtFWEH5VcSEc6o1tDGQbcHQ1VpEMkbZFzv?=
 =?us-ascii?Q?FqRBAQ4DNV43FePkzskKAFSmvW4TAl3BKcJmycAU9hqndbLGpvtSPRlJ1oyo?=
 =?us-ascii?Q?CnU2TaWIDDUuQyH8nS2cQdKnR/7G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0aGGqXQojgOjoeCJg2QOPBEzsdzJ9/NjuI19xyTNo0TS4X0M18uARIL6w8EM?=
 =?us-ascii?Q?G+P5CiL5HJOLMUqKeFAE4yndNUQp6G0HpW4aSrInfTeueeVL/7IY3sm04QXa?=
 =?us-ascii?Q?pGmfavyfcJYIRVTb4ftUt6DiI0P8IMDZOwThcs52UeJ4Jvhs+/m05Mm97HQg?=
 =?us-ascii?Q?CM91K+gaw4ZfvN6Dv1SezvRKU0MbgvXV/h+BnsBVxOpxY3N3bBvLuLq3Q3nq?=
 =?us-ascii?Q?MdXmbtPZUJUNnKcXogK40SG+4I85Sq9SOJcfB8or6fga4rawZOgm7BA/psui?=
 =?us-ascii?Q?1GEz4OVIfgf/isPt9ZyLnb8pYshVliE287px1SPwEDhc7IArG95/IHSGPCGT?=
 =?us-ascii?Q?UlWBv+J8nsr3lVkIcmpUC4P7ECkZ40k+2PFTncAEvU6V4kG9Qy1Ie2FVV+L4?=
 =?us-ascii?Q?8vOf4lAL/tkhChSvUOPZ6h1I5LORRULfnkfK82bJNna02pDxm9anFLS/wBzl?=
 =?us-ascii?Q?qry3wDLB04pzvNGRZym222uL9Q8jCBoUGPl3TniAVAI0HZ8yM/GyLjkl5oEa?=
 =?us-ascii?Q?kwlEt7lV99FOIq6QVmPH7+m0CP47fWy2QiwRGgNfy1dEHWSDPHSQfblAxO/o?=
 =?us-ascii?Q?I2gxhVNAxllbk4+Uofh1g1+pGTnrSE8uWP22Oxtajkn5yTUGUrW3hBkoICuw?=
 =?us-ascii?Q?hezCwrTfCXYwW3x8cZ7Z2ksNztmgPknEk3NOQQU4yl6ksxtjncsXwIYdNdCK?=
 =?us-ascii?Q?CIMYNrfuKBEVLFVlM+dcJfFLrdUSSFeJP3tsP9hiIJNYS3iNovLpafTafRIi?=
 =?us-ascii?Q?wwGxc+2YpmdIuZvyEk+TFkMKEIF8kglKFy6WReIThxJwqGvpoyKpvVrFJ/7v?=
 =?us-ascii?Q?ju85cX+2wUZqLaaqpPyO+GdjzWWquYfd+cIAj+V8+ezFMU31STMyTlgbQuFT?=
 =?us-ascii?Q?iwtVST7yy9qT57ug26dceG/F5gAJTl2fQY4Ru1jF9CJ7wb5+bkTAI5PsAo+d?=
 =?us-ascii?Q?olWEvN9eD6RIJVkPnrDQ1wxaRbig34ANS83DXTXHrsmzAf9G2MZHpMIw/DRV?=
 =?us-ascii?Q?P6Yt50M1RVoVaptxBaxSV1ZDbbgOvyhlqcglzrAQRM+3YruHqnGbNSQEdQpM?=
 =?us-ascii?Q?7euHsVjo1PNhKmaJvXI849S7TzEwIcSs6WUZqVQB1XnHnfaEJic8U3x+TNGu?=
 =?us-ascii?Q?xQqannteLl7xA2ZiPdytvuDP9k7TdpnAIG7cCD8e6iw0cNRA2n4h4DDIcbd6?=
 =?us-ascii?Q?9q5AM7PgcmmZmXmaEtfW6vfdQ5yVi/X6FvIXv4gmnoXXMzCHFYpKEqh66IrR?=
 =?us-ascii?Q?8MDncCEmThYrU2BSqJ8aHcRolmmdMCYG14FK1WRVyCcE7u+N9N28m89B5tUM?=
 =?us-ascii?Q?YycwCEMDO3/qzNnP0/74bm/cHhuquDeF+2kzLPKCOOkt27S2PCt5wfoTl7CB?=
 =?us-ascii?Q?wVSXpADB6rs58qzJtGNe7DyLlCFURAB+30p0ya1KiJMEIRUrgAEgK4hhWjf6?=
 =?us-ascii?Q?F81ujZ+hfjxf8WmVpNJO0iHDe8HVkFJj+4p2R3Y+8EDjTu08luANvYVVbaJ9?=
 =?us-ascii?Q?tmiRMZsFsnUNOlctPtm7Mgl1coPnD6IfXCEKwuRaB/yOoND+kP5lxv64bHpE?=
 =?us-ascii?Q?gVd3xq0Im31SBLgP9Fu3MbEg8Cm6PbefRVo9SSflrhHf9Un6qRat1zn3lP+e?=
 =?us-ascii?Q?Qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5glXMFBpPJFXZpQ/ZhfgSHrw2HWhRR0J1xcd4TLY6IiN5CYpzV2w+P7NKRHaVPS+6el9pdA+I3UGDxZ0WoPWc9Zx5p7Y+n7JL+74Mqe0u/MFspasUuHokPsy5Pnio4yV8jw+4CnvmIGQ0LVbhxF9JhLBzltTNp3I35Jc6MscCzkvlm9Kqwvw9aJFb5YVbbSCxkl7HsQwpPb8fo7zlkvGpN8lihktltftU4naVV8JEJjzRgotJfvJ9CTTn4Nuoc902UG99MEl5J09ZgRS0d/eE0VJJ4OXxag8oWOXmLCc4FGIPReXd6fBD5bANEC4GHmW0NpP+RO9pmkacN7ZU+F0yhCDHWzxPg0f1Lvykv8suCdKF1hJniY9nuVjqcM14j06rWVJVdzgl9cnijES/8VPJBggjxmocVkc2EkYgGsvFxNeYPuCEKuvOKP3eqpYusO54qiqxVaflzfskqfSzt+65CWQuN3mJqUwZnCrnsOJxudk90bmc4FVpSbjcva0B4sFCJroLD0494qR2Gew20pqj88zzz4hHGl1a19vRL5nu/E9xKM8CMsHeNVm1RLU31HfqIfPJ6dF4/WKGt39ydV8LYKa39j4o+TWk+Jw/KaiKts=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9151ec32-2c01-45af-f496-08dd422542ec
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 18:29:56.1487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OSc3aXt8tsqzkajV30dXZEb6zdhy9VEVnZpGjr9fkbOiLuj6H1sLEm2vYIzFZrdI7YfzgploblPT2T+TaTSTH4K0yT/JHco5Ig5hdLInUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4407
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310139
X-Proofpoint-ORIG-GUID: 7tt1G2Y8KymculOslOF71qcZQPf-9iDe
X-Proofpoint-GUID: 7tt1G2Y8KymculOslOF71qcZQPf-9iDe
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

Right now the only means by which we can write-protect a range using the
reverse mapping is via folio_mkclean().

However this is not always the appropriate means of doing so, specifically
in the case of the framebuffer deferred I/O logic (fb_defio enabled by
CONFIG_FB_DEFERRED_IO). There, kernel pages are mapped read-only and
write-protect faults used to batch up I/O operations.

Each time the deferred work is done, folio_mkclean() is used to mark the
framebuffer page as having had I/O performed on it. However doing so
requires the kernel page (perhaps allocated via vmalloc()) to have its
page->mapping, index fields set so the rmap can find everything that maps
it in order to write-protect.

This is problematic as firstly, these fields should not be set for
kernel-allocated memory, and secondly these are not folios (it's not user
memory) and page->index, mapping fields are now deprecated and soon to be
removed.

The removal of these fields is imminent, rendering this series more urgent
than it might first appear.

The implementers cannot be blamed for having used this however, as there is
simply no other way of performing this operation correctly.

This series fixes this - we provide the mapping_wrprotect_page() function
to allow the reverse mapping to be used to look up mappings from the page
cache object (i.e. its address_space pointer) at a specific offset.

The fb_defio logic already stores this offset, and can simply be expanded
to keep track of the page cache object, so the change then becomes
straight-forward.

This series should have no functional change.

non-RFC:
* Kajtar kindly smoke-tested the defio side of this change and confirmed
  that it appears to work correctly. I am therefore stripping the RFC and
  putting forward as a non-RFC series.

RFC v2:
* Updated Jaya Kumar's email on cc - the MAINTAINERS section is apparently
  incorrect.
* Corrected rmap_walk_file() comment to refer to folios as per Matthew.
* Reference folio->mapping rather than folio_mapping(folio) in
  rmap_walk_file() as per Matthew.
* Reference folio->index rather than folio_pgoff(folio) in rmap_walk_file()
  as per Matthew.
* Renamed rmap_wrprotect_file_page() to mapping_wrprotect_page() as per
  Matthew.
* Fixed kerneldoc and moved to implementation as per Matthew.
* Updated mapping_wrprotect_page() to take a struct page pointer as per
  David.
* Removed folio lock when invoking mapping_wrprotect_page() in
  fb_deferred_io_work() as per Matthew.
* Removed compound_nr() in fb_deferred_io_work() as per Matthew.

RFC v1:
https://lore.kernel.org/all/1e452b5b65f15a9a5d0c2ed3f5f812fdd1367603.1736352361.git.lorenzo.stoakes@oracle.com/


*** BLURB HERE ***

Lorenzo Stoakes (3):
  mm: refactor rmap_walk_file() to separate out traversal logic
  mm: provide mapping_wrprotect_page() function
  fb_defio: do not use deprecated page->mapping, index fields

 drivers/video/fbdev/core/fb_defio.c |  38 ++-----
 include/linux/fb.h                  |   1 +
 include/linux/rmap.h                |   3 +
 mm/rmap.c                           | 152 +++++++++++++++++++++++-----
 4 files changed, 141 insertions(+), 53 deletions(-)

--
2.48.1
