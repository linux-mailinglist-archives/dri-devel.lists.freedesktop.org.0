Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE62A06192
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E954B10E42E;
	Wed,  8 Jan 2025 16:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="IsaNJz5Z";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MwWIGJx8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F7410EC00
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:19:21 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508FMioG028814;
 Wed, 8 Jan 2025 16:19:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=SClICP+IPp8rcmeGP9luWaP5TU7uyj37cIwbWaQCxoM=; b=
 IsaNJz5ZE+su+/USzj2szuSFJBpoicYYJUz9k3/AG8+InCXQ0fX8wlER/w1okVec
 lZV9yWGRGZobuZVHpUptjmB8ugKBAR5s2EtAoAFcCNnol9YcyMH/Upjd5YSiG3Od
 m7z7WjjpEcD/orzc/naZaJHaZ2EC/nvtvUD0gyIiu5TCixTQs4/P62CRlNxZAsBS
 DLVbc+LxYpi98gGWzN68Q4hDpGHXlvfnUbC+yjFzBf4cy6RRfrNuYuJi5ey5oji7
 TYHBnvbR/rWsjb3YxiA0CtiZoe8/v4NZ1ywsQAcdoCODu1T+7FIpHSMQvmaZ1C0t
 tRm3trzWFkNql3Sk+uTVtQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xwhspy3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 16:19:10 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 508G9Ogj010953; Wed, 8 Jan 2025 16:19:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 43xue9sh23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 16:19:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttmO+GLK4lQHcf0Nxbw2JqcIws8Mors+imC1uHhZl2qx/4nKfGWYMD4r4OWs18T1If/7uMRyzOcaRv7NzDxHVXFgfW6XMnhisftZJRH5iD0rrGSy3x23B+hZ7mgUFrr/JW6f2ASvOg6nIEa0BoHUCVGiOQvjjJ/ogFzf/s52GawRV3O3Py36/E4CGOYWRh78TEf+GsQVpjjDEUBVJyFhj9b1+oWJ9dh9zqKDCB9n6KpVnvBNWIIXrydFJTTSdCEhLrUZyL827l6SQjVeaQu6qwdpE6//hzvlpnX8Kf2Azyv5bfy+46dsM+zTdG6o+tSmpIL1idocLIL/OqIZhsiyQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SClICP+IPp8rcmeGP9luWaP5TU7uyj37cIwbWaQCxoM=;
 b=ybEmdCoEaBnMURJxKWviYkg+2vxxl2uGswSWxorGUSRhE8Qw9n/xgHlUFrsbpxXsVn1gUfMBskZC0lshX+f9EcWw54+tEeslZjnKtVxU8dZuSgjyL9Lqcrptmu/0SjqWRhRuCKdLd7l6QEbEeHZDyWzHSCyZigxmK0FJ7vreDtB7ADy5aOyFzmOuABycYVCK6+aV503ZHQTY8rJDzD0L1qGSlFUsl1zB+XtnCj9a7wRqjkncTy/JivcAh0zqT7kEs7vZXYbo4umeZ8WWNvUYTqP5eT9jBIikxFuTiE8t1U9cDhwbneonp5hYjfakBc5NXXxWChYevWG0kPxDNxTFTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SClICP+IPp8rcmeGP9luWaP5TU7uyj37cIwbWaQCxoM=;
 b=MwWIGJx8LjM9egpssUdwVIEuiYoSxNRrKTnLWpW4aBb+Fhi2pWDxhSnNIDquPITCPREuQ3blkN29JL5APMD+zd9OnU0/wnYnk49oPZMOgUPQG7t6Hzk4GbMFwTdPyYq6tirS1fywE0ldjUAspzjAMTEsrumrUTX8Njv336LEtdg=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by SA6PR10MB8134.namprd10.prod.outlook.com (2603:10b6:806:443::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 16:19:02 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 16:19:02 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH 2/3] mm: provide rmap_wrprotect_file_page() function
Date: Wed,  8 Jan 2025 16:18:41 +0000
Message-ID: <701a67692d5bf9c8424cdbda103c988bbb278e38.1736352361.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::12) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|SA6PR10MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 516a9acd-fcf5-44b7-f98f-08dd30002a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NR7c02bK5HI2CTSD2rMxeCpwYCOZPtqg09IYGBBaC0KS/97ATZYKkfcBmBoG?=
 =?us-ascii?Q?wYaNBCEc+b8y4DyQxklUCL/etziDer4xIofHPQPnw/v7u8+OQctJppnkmzx9?=
 =?us-ascii?Q?An1OYZ7SZkv2B8yGcjGiHJ/fuR58KTjVx7iFX2ZHRaGv/b+7g5R4FBZ/zAlt?=
 =?us-ascii?Q?eZp5v3UOcSWeLN2pZvdqkd1OUA6t5d9AEAV8xpm5k/TbRnrW393mRv+E6QVw?=
 =?us-ascii?Q?/uAsGlF1s50zaTaalRZtY58ecM+TGCHULLDhNMcp4vomya8ybyJPD7pw3mXr?=
 =?us-ascii?Q?GI1EGteNuxrsx3FpQtpckYj1cjY4oJhGk6bDPZIBccBHCbX/rTGWLbJR4xax?=
 =?us-ascii?Q?UcMZBm2R0lvWD2Q29G4jmsNhcH35TnpwBLyb1swQfEWICgd1pBwfXU10y/pI?=
 =?us-ascii?Q?77Qyeo9/n6O8qnwsmorblpYBWte7n3NiiEY9uzCR0TGQ5rJ8HOS7AO32MjLd?=
 =?us-ascii?Q?4vClkhlOvRbH3Cjq49NzbGKVZ8jMPBBQcJhQq/m7Qq9EN/wXA8nNWYKtLWkn?=
 =?us-ascii?Q?gzpL1MtVQwOVVbbDq+437mu7xfyNl9B1a63mdVilZfAfdvv4xKgys6JfViin?=
 =?us-ascii?Q?zzHfjk5T3FAYkstVaipbTjJ0rD6uAPVrJz9bqsnMy+TSsaIqcdCNYXCa+g0g?=
 =?us-ascii?Q?NQXfsudBZdqqlthbr0JJUhXudCZTI9TNd4nFFcDXSsOmyX1GRyA3llunqoa9?=
 =?us-ascii?Q?vsnb8QBOw9xex78hxnTkO05xCJIM+nc+9U295dE3QFrIjxY5Z3OUrnQ368rr?=
 =?us-ascii?Q?cSctKHQe5Il6hcdzZymxh5Tk9V5dIcZ06a51pCZucXILV/V1luUsBASzFYuX?=
 =?us-ascii?Q?pJdJa2Wv3kJL25h4wBfaP2+Twb+4kNCQwWKWsDDpF059lDLSJmw6aZCnCxqo?=
 =?us-ascii?Q?4rAPFYHpSYmEY35D9K+EPN44rD21XSjyZ6aT4n6vFpL6z0E5CfxuYMHJ402t?=
 =?us-ascii?Q?qVzOrwwflmgNaHjlqHRYn2PFTczoIEU/+KbScBAp/a2z88HA5jvGVKD4LKIB?=
 =?us-ascii?Q?Dfgf0VG1vEtejNPqrf2K+L+mooFB0giR1mc+lzfWXcpZc13gUZagWfLH3BBG?=
 =?us-ascii?Q?aFTjhOOXwkXL+yCNdh8Jtc6fc9k4AuH5s/Y4UpJJTRswbXZdsmtvWAaHVyyI?=
 =?us-ascii?Q?kzKo1TZGsPMf07RnTPby3JoafAuG4wd9QBV4ed+9F2jdq7eTJ+K2Q996ttip?=
 =?us-ascii?Q?lxwsOmHOK7o6EEHzQf1hf48sP2JFLf0WAXJYqdX+MSQaGMuZPRJZDlHUpKbE?=
 =?us-ascii?Q?ON1qAJcmbn7YQif0/h1H2zw8ej0b3esHmntBHLR73PycPLQEXJ6xGuKNt+Oh?=
 =?us-ascii?Q?zWp2WdwVHdvdrwkmrDDmE9yDcM3RSkv2rPrSvrmdHYAlMKlfXTXeawEuiDMl?=
 =?us-ascii?Q?9sNGZXE4UvYNJetf7qVhqhpHLaMU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pPJh7cbMkqmAVJlsuZwd6jkwgpBo3+IdRgXdLNwy65laFgucIwILa9FNyZIq?=
 =?us-ascii?Q?MH4pp8ChfeQYV4uX9XSIgMhtHY0Cs5DLDXAJp9hZ1/g/WexN4DKQczhIKVkb?=
 =?us-ascii?Q?KRq+5hu1wr05C0jeVczykfA8XPqx5oEdKmg8lTic1Zf+2MLscF4Qs92R0JPS?=
 =?us-ascii?Q?TnfLI0XWqS43molxBOeJRD7/xW98lH2uVGB9hsgZDHnv0yT5F3s4oTJCpmMv?=
 =?us-ascii?Q?LwRgxGjUsR3UE0G4HdVdZcGosLDzFUy4gnHyju5Rmjs2vewJZpyOptsIZFun?=
 =?us-ascii?Q?r2HZgrCZZEbpYDz14mbSVaVkJS6eEnc5yBGMqWRC6ArN4YBTK+IVf+Qfl/de?=
 =?us-ascii?Q?cjrNjwkgyYeaTyAQW2JutiFGVTgohTvEAWqsQOJrBs+1cjS2WF1gJfe9bCN7?=
 =?us-ascii?Q?aJ/S/rzQPXOf7gZtS1/BqBjm1N/p6iEuqZ53x8nWHw6TRCE+8+KEnQWmJ8ls?=
 =?us-ascii?Q?j5/FmwUTG9Y9p3GPHEfs3V4KJ4erUkztFoYe/l5CP8XZs91RlI7lQV1okPHn?=
 =?us-ascii?Q?TdIl//XvEvinut+hLEhdeaL86h8uLUDQyQ1r3Upf1mnU0SzLtttEHFjACc2O?=
 =?us-ascii?Q?85TL09ll4oGFU7wClyp5PRcdKxdwa9ouMuLpxj1T9ERcXlFHPBdSnc4MKjcI?=
 =?us-ascii?Q?w17MQWJfQmyeIryfqwEUDgVp1kliTKfXwz9RBBlM3wKwvpCvDWUsVmbyzoyb?=
 =?us-ascii?Q?mG9D6sJS3Bh5tFycKEtW7CQxfDR3Lr2t7DCQS5F341d+Sv4z5RdQN1N1S7xt?=
 =?us-ascii?Q?a1Gs85EJtVaLw21gdLYc5pryua4vJql+0CV4asxRIHxt1X4qocWurLEi05/D?=
 =?us-ascii?Q?Dc0hhejBQP3UwNUndLe9ToeCA3PiwT8genmK3qEmSwJ7n5tpLeQWRszs/7fX?=
 =?us-ascii?Q?KH6mmyssKjngKEl/5ejrU9tiGb1AXQEDGMpwn4cZmhusgzIdt8yWaBxLEtUH?=
 =?us-ascii?Q?5c7AiwMqOxx2k0Yhel7JTw81V37NWSvs6wRb1kcMR+ekFT+B4sZ2xR90mAFy?=
 =?us-ascii?Q?NaOawWjcP+tHiNFAeiXUrftVo/CHgiYGHKMxp/sIPqFTWMsmirQ3KxpJPjce?=
 =?us-ascii?Q?KjnMqenQ9f2F1mM5JE/Kjv5Cq83BSokLm+GQ2KlpRfW7k1i/sNHM6gJQFLda?=
 =?us-ascii?Q?IjbnqKkTV8alZky8xC9uD3ObAiMw+CL44jHeQqm3GivonX7SCHDGLgDlreiu?=
 =?us-ascii?Q?78ZGWi+pVwnGUlQgLnedXz+q1hNFM7BnIcTEhbI5XwUyRU4Wz08urISwkdUn?=
 =?us-ascii?Q?+sn0OxLgPFE7mLBXYY0USMnlkRIP/Amf+2GUQmTJM8wZKm6dkDV7WdFZYNC9?=
 =?us-ascii?Q?mSiJYZ67E0y2z7FFvYMHe2ckRFgPl+2d2M1whl/pbg3MPhL7RklFSy6wqVMS?=
 =?us-ascii?Q?cQ+CZ+xxEy0Cqm9coQdndPhdJJfDsxunUIWjIad1W84n4i83QGnEq2MRR4Ly?=
 =?us-ascii?Q?yEB0JwIRVakNT7YoLQD50EXxw9RTO+JssdlR6PCodd73kMbv9oTS3HP4Z6xV?=
 =?us-ascii?Q?mzZ5k2j91WsLXUbjdnWoFrPxcUT12sZr8zJIW7/C2ocPfNHjy1i3Y9BwH0Sq?=
 =?us-ascii?Q?vtzD6h5aw+P633Hf8d0MQLYsfusNZv7lUT9TFYfm25V6JojuKgoQUVPWsY57?=
 =?us-ascii?Q?ng=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 23x4x++QEPWvvN+tyRRumKYe8vkIk6CvduIZKDv3A9J6fE5HCUQeqwPYnyRAR3+PAoXzs6GuevPk3VKP20OQ9L+9sC9s+O045Sw+ak5pRV+LLj8BAtyScMWdwygN5hiRlf9cZetB0M5ALBj/vSEi3ah+/CZbVROMYLgCHMt9/sChlDyqfswdY8s0KbMvSR9pnGuPb2TZlcVOPQSjVkLZaqdtPZdwCqe2cuBiavhR9ORR6Bz60ng6V8Bfz34IPHEa/2208P1u7GHnt+vCgXbtCt3K3nHxdMpfcgsCDhs6XrzH13m8BWQmMLfZgslUQWfcNqXChr0QNDZ2ZWE+G/ra6nvw6NVS94lOnIUlURxVFF4891XKmze4o961O0MJ26kMwW+l1KtS30H5f6o16h2Hauiyu2ljL5itM9H7mrCa1wHKSMJYNhMD2UqNTAtYKKLG54/HZkKvylPpPgmrwjtzdkCWozh4I1qO6SQpliYz4zsWhsC7WevNnnaaVJVPxJS1or9sndjmt8OIGMELkSsT4AK6+HfkNucMSREm1i6V1EqoIZM3+m32wOEwChX9MIlVYG5+o7HldNRPLoLJV/PMqUQDy1Ljim5v942glb7yD7I=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516a9acd-fcf5-44b7-f98f-08dd30002a21
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 16:19:02.3962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wj9+j7AMv6hQo0yMNjQ3L4KarQR6DJ2tJfy/qSXzieEBSDvN2GJswL5qcHv1OnxMAowa0lrCxXwne07AonFMTpmkUGAS5PynYGNSd0w0rz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8134
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501080135
X-Proofpoint-GUID: 02cpufoxGwLD41JEmM6zpB5ynB3c1xOL
X-Proofpoint-ORIG-GUID: 02cpufoxGwLD41JEmM6zpB5ynB3c1xOL
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

This patch provides this - rmap_wrprotect_file_page() allows for this
operation to be performed for a specified address_space, offset and PFN,
without requiring a folio nor, of course, an inappropriate use of
page->index, mapping.

With this provided, we can subequently adjust the fb_defio implementation
to make use of this function and avoid incorrect invocation of
folio_mkclean() and more importantly, incorrect manipulation of
page->index, mapping fields.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/rmap.h | 20 ++++++++++++++++
 mm/rmap.c            | 54 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 4509a43fe59f..9d80b09e58ae 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -754,6 +754,26 @@ unsigned long page_address_in_vma(const struct folio *folio,
  */
 int folio_mkclean(struct folio *);
 
+/**
+ * rmap_wrprotect_file_page() - Traverses the reverse mapping, finding all VMAs
+ * which contain a shared mapping of the single page at PFN @pfn in @mapping at
+ * offset @pgoff and write-protecting the mappings.
+ *
+ * The PFN mapped does not have to be a folio, but rather can be a kernel
+ * allocation that is mapped into userland. We therefore do not require that the
+ * PFN maps to a folio with a valid mapping or index field, rather these are
+ * specified in @mapping and @pgoff.
+ *
+ * @mapping:	The mapping whose reverse mapping should be traversed.
+ * @pgoff:	The page offset at which @pfn is mapped within @mapping.
+ * @nr_pages:	The number of physically contiguous base pages spanned.
+ * @pfn:	The PFN of the memory mapped in @mapping at @pgoff.
+ *
+ * Return the number of write-protected PTEs, or an error.
+ */
+int rmap_wrprotect_file_page(struct address_space *mapping, pgoff_t pgoff,
+			     unsigned long nr_pages, unsigned long pfn);
+
 int pfn_mkclean_range(unsigned long pfn, unsigned long nr_pages, pgoff_t pgoff,
 		      struct vm_area_struct *vma);
 
diff --git a/mm/rmap.c b/mm/rmap.c
index effafdb44365..46474343116c 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1127,6 +1127,60 @@ int folio_mkclean(struct folio *folio)
 }
 EXPORT_SYMBOL_GPL(folio_mkclean);
 
+struct wrprotect_file_state {
+	int cleaned;
+	pgoff_t pgoff;
+	unsigned long pfn;
+	unsigned long nr_pages;
+};
+
+static bool rmap_wrprotect_file_one(struct folio *folio, struct vm_area_struct *vma,
+		unsigned long address, void *arg)
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
+int rmap_wrprotect_file_page(struct address_space *mapping, pgoff_t pgoff,
+		unsigned long nr_pages, unsigned long pfn)
+{
+	struct wrprotect_file_state state = {
+		.cleaned = 0,
+		.pgoff = pgoff,
+		.pfn = pfn,
+		.nr_pages = nr_pages,
+	};
+	struct rmap_walk_control rwc = {
+		.arg = (void *)&state,
+		.rmap_one = rmap_wrprotect_file_one,
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
+EXPORT_SYMBOL_GPL(rmap_wrprotect_file_page);
+
 /**
  * pfn_mkclean_range - Cleans the PTEs (including PMDs) mapped with range of
  *                     [@pfn, @pfn + @nr_pages) at the specific offset (@pgoff)
-- 
2.47.1

