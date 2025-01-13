Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5520FA0C573
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 00:16:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A580D10E441;
	Mon, 13 Jan 2025 23:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="hALdWMGR";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="hqe6Jz/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBF110E443
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 23:16:42 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DMB67R003306;
 Mon, 13 Jan 2025 23:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=9cVkdFbW0ldWkTYMrnicBgqjz5m0gvOcJPGn45IZ5Eg=; b=
 hALdWMGRKdjBcHXQYpjMkIyA5R33MW9+sgOwix2jf3azumcYowahHkxETfkKWMJ5
 9O2iT6PMJ7OWggFppSleW5iFvEe0PuCMnm0eu5/aBcNyPp6GU+29X6GnzvlyGkYu
 17cOThRfiGF46hoFORndIfKPQGVrybk7RYMSal7vfkaOSG/gIbGpCRqEida3f/pO
 owNDlJR4UYIw+oNtMRRJDmFDWp4HFIwCp98V+6Nsm2AW4L+P37CDWH8rf+53/Csn
 PBpe6kHGCbUkvyX+RhXOrrmbXeqmhwCRs/1G8HCKz1wCJ0k1x2SeHqXnDsZ/8t6I
 DlfrONBEqsrS9oETEv3AxQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443fjamr65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:16:32 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 50DMoBWR020422; Mon, 13 Jan 2025 23:16:31 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 443f3dvht8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2025 23:16:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xijWW6Dq0Y99raPPOQfj8dO5vNTm/DVv7rwVFKv5Xhfg2d4eZOcspZhSpxiojL6Zczwpf/eWSC0t2Aqqy7HbUQmnzmLF747E1tXhba4GukkLYl+3Yev1wqHDWIh0OfRZCkP6Z3ZW1GzCJOEwLYPBFJouQTrWdjeiygCSnMvvZXdS4Ub+IDMBczbAnf1UWq568x5lK67S3jGOjpWcGR2D/9zYurSX21PFMnYfTVZB5x+ArPCRyptp3TEDm3Ovt5hPkaQ4dRpH3RpwxzYJ+eNHACFxFY/cyj78xZi8Vuv3f2ewuCl2VHgO2+3xljBOsENX/wvUVSvGry9OqGecMUS1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cVkdFbW0ldWkTYMrnicBgqjz5m0gvOcJPGn45IZ5Eg=;
 b=vSWseVqQPZwyhq2kiqcUoXwGwlJiMZvBLEvv8muXhynZ3SHhcWFyMcwOYuU4A979mGjanrIaGEHSCrr0bjV6mRKe/464MafG6y1fLcWJkfxkrHyII1b4ULB5tQW7l3xCUZ6vJhqdXLtBmBc1ytxvM3Mz01R+fPvxU11EJBXBSN2AP+2nkAcWQB1sS3f9+ciIkTd8ULO57x4zTQhA0sni7kKz/EshI52eIBtqSubROU9HE7hKCO4iEANNGFi8iZZbgkRn6qRjst63DuGzsbyj9mr8KpuGE1HlEylcNWxi1aE6B3z6/yY4zxK78U5Qmsqw0Zm8WrGgYgAzTqoA4l/bdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cVkdFbW0ldWkTYMrnicBgqjz5m0gvOcJPGn45IZ5Eg=;
 b=hqe6Jz/fGXH+kFbrTv7M+xwkk7VOVHvZXgUdv/GOYiDWlsDmv5d2x7Y52lOsA7MkDE5eFSTakrwJ2d36iBt+Nbs9/KU7Vxrz9VNAdXwkhGlGvfIBl1lV/IsfpFkxcYhOQey+jc43XlQQN4EtHoD4Gr+gwpY/E7pGx+0c1/uNHbs=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by DS0PR10MB6848.namprd10.prod.outlook.com (2603:10b6:8:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 23:16:27 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 23:16:27 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayakumar.lkml@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH v2 2/3] mm: provide mapping_wrprotect_page() function
Date: Mon, 13 Jan 2025 23:15:47 +0000
Message-ID: <f03f003543f6a93d90f5a0e678a662f5108b4a15.1736809898.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
References: <cover.1736809898.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0616.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::16) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|DS0PR10MB6848:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ab98c6-5bea-49d0-a4d8-08dd34284e4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FNTeDJiUYFdPyneQVc69aONxNtyEV/Y+omCfQqpNmwBYUTv7Npzg2zW2zNBz?=
 =?us-ascii?Q?6Dq6eYXuEfurRlnkd8aDCnx6t6+kFcNnna6lJakEVkTHcCh2L1Ksut3KnuWJ?=
 =?us-ascii?Q?joj+eIFfatXNs7m+Esad14b5DSDiZWC9P/6884viXTm4oUJpaCruqSZ3yNkT?=
 =?us-ascii?Q?T/IVH6TisS2ZEbT8SwdP2oZAK+yaRol676ZRBL1IgRx/zgyZz77kdvoTi++V?=
 =?us-ascii?Q?aZK2nkur6I5HuTWJcimJa5nSUM9wP5+7cnEiVxik1/kNG24Gz9B/rzU3XFOc?=
 =?us-ascii?Q?42w+wJQSPq/4823AOrT3CdnUQ29J0ilKcxj1UOcCgOIYdxyIKkVSMGCsLMBv?=
 =?us-ascii?Q?jxSWHilQey5YG9sWP9aZjBdpDQy9j84mWk2lFxH+HWEFie33xzEYqg2ywZZI?=
 =?us-ascii?Q?wbmWjQCbUjq20OotIDiYYBhAfSyJ/TY0TtbZjCSmz9yCqrg5J4xYqcEYkkRC?=
 =?us-ascii?Q?agcmziuhB7Sen+OF77VIZxAzrzx/mq9kl0BSo2xuFEofygHwwEuIWq4uG2J/?=
 =?us-ascii?Q?vr4NVpT279nCAOtS9K4pguJPTPl0BvwsDl50xrjJ/aJGHMzye/FQL4+BtP04?=
 =?us-ascii?Q?oLRWPPwg7tYvftextw4+99vLfPoDDRCJyusP27Z/AdQHYbNIGRkOrXtlg+FL?=
 =?us-ascii?Q?nvYXyUUf/dxc5ZgdGQgLyK4Vc5+hthpk5J2DKI58MTliLcqQULpatdQtz1bi?=
 =?us-ascii?Q?Z5eGzvIIExdPFwUl13pERXJYVdDaA2f6xRwB9wiOpdVnm4NH1tXehkF2zQeJ?=
 =?us-ascii?Q?sKHO2zwg2jP0rdutGiMdCLSBExd91C6/fIp/kgTG2So9YjB3btKJt2PEM0K3?=
 =?us-ascii?Q?+NKyynQeKCaO+wKb/H/88hiAmrlfPo173rgOfUkmml9Q73S0d4wUDQe3wWHp?=
 =?us-ascii?Q?mrCK0pnFPZytz+MQhNVnVRF8s+XD6qzMridZ0LpBvDseO251AjnfcTk9z+f9?=
 =?us-ascii?Q?t+WjLJWsN+j90b8HIeK0P0+kngHf8FnP7cmWX+s64R08TdHYFJ+sEOof9WdL?=
 =?us-ascii?Q?i/D6uSBNDgqIVYXcYJxfX8Tm878ErsjnCkl3kxsNLt6uaP4Is6bnq8goZ0OV?=
 =?us-ascii?Q?7LTBKB95qE28CZJ+e60ZO2WoK0Wwug6PDgBlb2NtdJxNeZHfJqoatTNOFz1U?=
 =?us-ascii?Q?SJ0goAkj4NdRwM3oFB6tkOvktA6bxSEiaphAOsaQufXLwQYC06t7TsIO6YKi?=
 =?us-ascii?Q?Ev/ailq1VVndxACFsi/6nXUsWgoEsBTKCzArVxls7p6P1ptD6jEGIIENaWv9?=
 =?us-ascii?Q?04f0Gf8+O/4dc9eubZSXx+KwzgRgonk51+6PBUyIkYPoYMw2lxsVQcPVudoG?=
 =?us-ascii?Q?PrzqqSVSTyH51eNTmr6BzUxHnjWuFWlp4Kt1AFk56vRNM6b21TdPWt1I5/nN?=
 =?us-ascii?Q?S/i8HYxMApwBu1VRvSZMgl18e1xx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8+IIzqWdTwMG82gubErpcQH5CY9z3veehdqajSCL4BFFHN+Q1npVx96Ugzrg?=
 =?us-ascii?Q?RcnLS4v1p5RhSF6VuJyPRGzQovxACoUXBjs2CwTzeZgS89yvjIteZHgJ2PsL?=
 =?us-ascii?Q?/Rs2Gfv6ci3I7VSMo2WxVxgakKXfja+kX+4edIU7xNTkk0oZ6BsaRGPqGRQm?=
 =?us-ascii?Q?TQrDHGIIsUc9+U41b4t/fmrgolg2qp0leNfYsB3C9KJEoEPciOjSqZ5vqXf4?=
 =?us-ascii?Q?qgmzUZc/CUvLJoA609HqwLjR9V8NozuTgFRYooI98uDmMp+TDnFfR/H1RRII?=
 =?us-ascii?Q?d9Su7b36+5nx1HHFynoWiVrb9wtCGpoIx2+qRyrDYpjcLHvpHpNFv6HImEJS?=
 =?us-ascii?Q?S9VKsBj3TxljfFkfKUaJwSWF1r+qauUDb/vWMi+orL3Q2ddVbbfJY4UxSvA4?=
 =?us-ascii?Q?cxFfzRT2ejPG25x/qNUEtGh+Kh8fVzfZvktBb73QaCY1Qmp78XT40boHYrBr?=
 =?us-ascii?Q?Qeel3Om47C+9PGsdg+0EBtTdYfupMYXFXa/Mp0DxrJrVNCVV5VmFnnNtUn3X?=
 =?us-ascii?Q?KQAZn46cZGSM/YKK8ylMSWM10VhWKBhEkbuubYUQTVBS8dyc8rvDGEJyISZB?=
 =?us-ascii?Q?UJ/kXuNWavJOrmO5H6298X1XCFfcUqoNv4OutL3xK6K/34oE8O3xuFYcjjkF?=
 =?us-ascii?Q?1B2hjXRuq5mgGhPwthZI3+tvgjNyIGBqoaze3HwCycnIFa6zOBPzoJ4rJXdY?=
 =?us-ascii?Q?NbUXbaHonnAYm/ZQVO2FhbXMjgyLr8IXauJhJZzL3zUM3TboBF9a9xtN4IiJ?=
 =?us-ascii?Q?WjpG5nawRzCZmbnNgLhAW+J2+Q1XJRdofSUGdR7G0xCYhSUBYl9/ixTLUgLK?=
 =?us-ascii?Q?thXOq0ZbbZXsal6iBepGw369QQPcoAs87fhMFotGXwTTlB1PRgvJ6zSB9mIj?=
 =?us-ascii?Q?rmB4NwTYxfb9+4eSj86d9onWdocwZ+eUz8UkzC5Zg0Cpr1/UFR7z+exFN+Th?=
 =?us-ascii?Q?IJLHMgUvut3ElbnOT4/KwOjHnmULgNPrQDW4FPg055LdT36C1Aahi9kEl81l?=
 =?us-ascii?Q?jfbjl2XBMLQH+esKj/md6iIRx3ax/jVNQVRozThZWJwL75RQi//uOpTvqEUP?=
 =?us-ascii?Q?v/lsFxHJg5+8GRk5IIi//qThvaGUvSh9fMh5Tsn0QXxAcFN9DQr8GN57Ibyd?=
 =?us-ascii?Q?jlhXV8uk/EKNHbo031UPUHGo5gd/L7jHA3eyVKtM/IyJcTWBPCGFXFpYl477?=
 =?us-ascii?Q?hwgwbaElMAcnmiU6QEyEirTdeRiSI00jhNin5XGvv7JsciX2YumLfqDUA0X+?=
 =?us-ascii?Q?huOFpDXDfvd6Z3h5RqJ2VmhBclviVuXjZZeVCpnmzvp6XSe9QvNQKnMOCEY1?=
 =?us-ascii?Q?Ocl70PvjlNt8dqEmt+tTWOT8B+/81UHECtRE+wty71hcHOUb8gDyGNjsSr6+?=
 =?us-ascii?Q?nvDC/6iCUeTBcNOW+lgLHCCEtL+fi9BFx7Yog2Nk0oCLuIdtytHigsZmnTFv?=
 =?us-ascii?Q?cDdqBH0n+h3wVvlWe7dmhfJ8RS+51S+4wKW//gb7Mq+05GZingSyM7F0D5hc?=
 =?us-ascii?Q?vVkeVXW/nuTlfO9ItMLOssnJDgp86CPq7sMU94U7Sh2tWHsprx+T0Qz/gt3A?=
 =?us-ascii?Q?JkGJUN7T275sRWwo0vMCG8cIyMIHKH7gXvkkhDzqxInrf1l0D/vmKnoNc89s?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 35iifpHSGRcwT6cgAnJuCJk8kAoJkgt5HdGySCLw31cSeZPYaxoSPUBFPdxuvgC/elGw8JwAnpoNEpt4R6kSCA5iEZtfEQwpVdyHblM+Pqh0zpZpdni3YmJtbh76xik3FijwbC63JLnAuAu1lFs0rnmFSYu5bknxT1kmPWpyzX2Glh46z6zCRo1NG42TRHhdTvH604dDiOvwqQGbF4rI2H0GFkZE7y4/+u/F11GqFox/vSlr7lJCLNJnx4JqG4KELTNzpKojMJ04NQCR64XfngP338RYrONzDIN7mi5AfA1ReYPM7tyKf42ALGmXjEujR+DE/aVujcjJ+McgDxlDRqAIRBoWsqukQYe8cHXbvww16DS2dfhatsLBMtI45RaCi5K4u7oP35bQLMDm1CHGpVeBARwQlZ/U469wMaR2ZZkIgy/WgUIGjiducPGA8X4lvh5hzKL7VZyoPFxAUg4JkbPMiKqh2HNJqUkE7SfNOCvIcKvtfF0hhZZsmXotX78cFsEOE3Wq/BwWEY7I0uLtxis95lxiSzjmVLPUqn6UH1eGrbyJkyyYj2u5L1hKjih8ordBuxXswF4aCqy74oMS8xptDVtbb4yV8T8OkZ4APkg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ab98c6-5bea-49d0-a4d8-08dd34284e4d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 23:16:27.5789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZJh1ZmzKzhVTkjySLuo486HHoBXGLQ6ztClb29/gPQjGD9iDvvX5NZenfpHLbNeG9mvqkcQNF1sRxBkyeixf16vooaq8rV/zJCJEYiEHOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6848
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_09,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501130183
X-Proofpoint-GUID: _vvhkrjxFXlqNdPBF0Tp0ZmkLXC2f1gV
X-Proofpoint-ORIG-GUID: _vvhkrjxFXlqNdPBF0Tp0ZmkLXC2f1gV
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

in the fb_defio video driver, page dirty state is used to determine when
frame buffer pages have been changed, allowing for batched, deferred I/O to
be performed for efficiency.

This implementation had only one means of doing so effectively - the use of
the folio_mkclean() function.

However, this use of the function is inappropriate, as the fb_defio
implementation allocates kernel memory to back the framebuffer, and then is
forced to specified page->index, mapping fields in order to permit the
folio_mkclean() rmap traversal to proceed correctly.

It is not correct to specify these fields on kernel-allocated memory, and
moreover since these are not folios, page->index, mapping are deprecated
fields, soon to be removed.

We therefore need to provide a means by which we can correctly traverse the
reverse mapping and write-protect mappings for a page backing an
address_space page cache object at a given offset.

This patch provides this - mapping_wrprotect_page() allows for this
operation to be performed for a specified address_space, offset and page,
without requiring a folio nor, of course, an inappropriate use of
page->index, mapping.

With this provided, we can subequently adjust the fb_defio implementation
to make use of this function and avoid incorrect invocation of
folio_mkclean() and more importantly, incorrect manipulation of
page->index, mapping fields.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/rmap.h |  3 ++
 mm/rmap.c            | 73 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 683a04088f3f..0bf5f64884df 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -739,6 +739,9 @@ unsigned long page_address_in_vma(const struct folio *folio,
  */
 int folio_mkclean(struct folio *);
 
+int mapping_wrprotect_page(struct address_space *mapping, pgoff_t pgoff,
+		unsigned long nr_pages, struct page *page);
+
 int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
 		      struct vm_area_struct *vma);
 
diff --git a/mm/rmap.c b/mm/rmap.c
index a2ff20c2eccd..bb5a42d95c48 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1127,6 +1127,79 @@ int folio_mkclean(struct folio *folio)
 }
 EXPORT_SYMBOL_GPL(folio_mkclean);
 
+struct wrprotect_file_state {
+	int cleaned;
+	pgoff_t pgoff;
+	unsigned long pfn;
+	unsigned long nr_pages;
+};
+
+static bool mapping_wrprotect_page_one(struct folio *folio,
+		struct vm_area_struct *vma, unsigned long address, void *arg)
+{
+	struct wrprotect_file_state *state = (struct wrprotect_file_state *)arg;
+	struct page_vma_mapped_walk pvmw = {
+		.pfn		= state->pfn,
+		.nr_pages	= state->nr_pages,
+		.pgoff		= state->pgoff,
+		.vma		= vma,
+		.address	= address,
+		.flags		= PVMW_SYNC,
+	};
+
+	state->cleaned += page_vma_mkclean_one(&pvmw);
+
+	return true;
+}
+
+static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
+			     pgoff_t pgoff_start, unsigned long nr_pages,
+			     struct rmap_walk_control *rwc, bool locked);
+
+/**
+ * mapping_wrprotect_page() - Write protect all mappings of this page.
+ *
+ * @mapping:	The mapping whose reverse mapping should be traversed.
+ * @pgoff:	The page offset at which @page is mapped within @mapping.
+ * @nr_pages:	The number of physically contiguous base pages spanned.
+ * @page:	The page mapped in @mapping at @pgoff.
+ *
+ * Traverses the reverse mapping, finding all VMAs which contain a shared
+ * mapping of the single @page in @mapping at offset @pgoff and write-protecting
+ * the mappings.
+ *
+ * The page does not have to be a folio, but rather can be a kernel allocation
+ * that is mapped into userland. We therefore do not require that the page maps
+ * to a folio with a valid mapping or index field, rather these are specified in
+ * @mapping and @pgoff.
+ *
+ * Return: the number of write-protected PTEs, or an error.
+ */
+int mapping_wrprotect_page(struct address_space *mapping, pgoff_t pgoff,
+		unsigned long nr_pages, struct page *page)
+{
+	struct wrprotect_file_state state = {
+		.cleaned = 0,
+		.pgoff = pgoff,
+		.pfn = page_to_pfn(page),
+		.nr_pages = nr_pages,
+	};
+	struct rmap_walk_control rwc = {
+		.arg = (void *)&state,
+		.rmap_one = mapping_wrprotect_page_one,
+		.invalid_vma = invalid_mkclean_vma,
+	};
+
+	if (!mapping)
+		return 0;
+
+	__rmap_walk_file(/* folio = */NULL, mapping, pgoff, nr_pages, &rwc,
+			 /* locked = */false);
+
+	return state.cleaned;
+}
+EXPORT_SYMBOL_GPL(mapping_wrprotect_page);
+
 /**
  * pfn_mkclean_range - Cleans the PTEs (including PMDs) mapped with range of
  *                     [@pfn, @pfn + @nr_pages) at the specific offset (@pgoff)
-- 
2.48.0

