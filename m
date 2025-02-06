Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3715DA2AC83
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5261510E894;
	Thu,  6 Feb 2025 15:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="YoS+CKXc";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="tTIqvw4j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B61110E88B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:34:25 +0000 (UTC)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516DvV7f003813;
 Thu, 6 Feb 2025 15:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=QVRt+Tj4cDa3lUDLGCXG2m2UsCEycoAwK0zBGu7keNk=; b=
 YoS+CKXcNDsNYUz5jE8dJEIVTRWC8vNgozeU0mMnRJvkZy8lu/PXWt/6ToIMqL2l
 2mlEnDqQK+uPvzFlGFsRGlMe0KVoKoxN22IXSpPKt8aRumgQxEnOmRTXjX41O+7m
 7KoufIt7DI+kMBp5EpDvUPoPQ8skM16CwX06qjnd6QImTU31TMrQf+tOFlOTNGef
 50a8F3xMrpD8bCgudgi3V8+V2ChynHEo+XbGIuNrthFVUe+jmFufJ2EFCJHquqZE
 5cHxxPDM/L45oN51sjoKw0qY6brKKCtfOhiIiqa5UGc5UWrjyzELBXdMBMgEye9L
 cILyDNr7YICLQYaqdtQS/A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44kckxnghy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Feb 2025 15:34:00 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 516ELTFN022545; Thu, 6 Feb 2025 15:33:59 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 44j8ean14g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Feb 2025 15:33:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNBFPCY2UKI2N4o9f+z2+nuf7M3koYEeOGHKwmcVQ75YZkeRQDVtC7lXlh0x3NvbAzReFo9CehfUvrH7ljryAS5YKWj7By7XQPEaBjFP1CHJgc019jeKNL/wZLEgrt7oxv/Ob+9HG63SgPJr5J+ERe5s+s0yjt/UJ1i+H+74T2bQu+kuZOzSh2VGamrxLY79WKOGO7Sj5omeMLOTkDfEdqoHKOqZ6PpNR4uKE8uzaUdCfoWoa7koVgme+815z4FF9VO5nB28jl5jprX1y6/olob9HdNXyxxqBRY6G9n7PabbiCb9oVsy/o1ZVcFEtg2GW1S+6N7xCUmX/nP4FtRjvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVRt+Tj4cDa3lUDLGCXG2m2UsCEycoAwK0zBGu7keNk=;
 b=IizxHLVRL3gXLekRHPcWouQKzdUBxYqJ9b2nDaVnNO13g77Ict6rr7SYKEaUjZpjINLlkkMiKpahwibvdPEdbFu8D7yHNqWllkYF1UvvLcZxIpJDQY+RfG362Q/BR469Awtc+x4Z7qCF2vKsSEFAwsGBI5YE0fnDD3ZtKoHYJGJDr2FNN8s+Pn26xszeO0YezFPDTHEVdewTR6u4SGqm18uqLS8B5gkmcauRZgTdLzElPpvc20qqbQ1mIeznBbu4wzSCrLXJadUbmVz6QSJuq1ajqu+f0QYh+CLl2oujy+O/Jb2h/QcOwcTnktEFjLSoWCUFBSw9//g8knO9o0/qKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVRt+Tj4cDa3lUDLGCXG2m2UsCEycoAwK0zBGu7keNk=;
 b=tTIqvw4jXEl/5SAGZ2Iwa348VCqlwKc9Gjp+osuWCnrMoUsN/St41SMetr61pkDfNx8v37h6hI1Rqn8+Ym2ervd4tOAHamROvtRwK0aXXgKXXOoJFriTEmGERVHpPwG0Pei2WZ3XRxfn64MtFdqXTHxhWSQrregu1n2zdrlYWkk=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by PH0PR10MB4808.namprd10.prod.outlook.com (2603:10b6:510:35::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Thu, 6 Feb
 2025 15:33:56 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 15:33:56 +0000
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
Subject: [PATCH v2 3/3] fb_defio: do not use deprecated page->mapping,
 index fields
Date: Thu,  6 Feb 2025 15:33:21 +0000
Message-ID: <d6be40640e9f48fc5c3dcce01d5948ffa7add797.1738855154.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738855154.git.lorenzo.stoakes@oracle.com>
References: <cover.1738855154.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::15) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|PH0PR10MB4808:EE_
X-MS-Office365-Filtering-Correlation-Id: eafa90cf-37a7-4953-b790-08dd46c3ab51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XUer43caJljKFsrqAgxvnCK2wKmKUybv7FzjuPTwEcqn35MSy6678Epexp1H?=
 =?us-ascii?Q?1hDusJ0OFsahNLa/jzqSBmabiI/FxyVQWkTj4rEmEBimxrWvMIoZ4D0dnjvl?=
 =?us-ascii?Q?inKdWlYfmrr43lNOoE2BecAyz4VmrV+x58RN6yqh+n/vKEnXjBOtfCE3/Xe/?=
 =?us-ascii?Q?t3P3qSKijfGoxhyCxo6DJ5M3QWMC6/IzzapBvTuiPIdhQWraFl98DGP4oNRb?=
 =?us-ascii?Q?qbwkIKrHlRXrDiuO5qOZ0TfWmCdd1O/GajIzUA7oouD6k7nquS9uxls5Q1/p?=
 =?us-ascii?Q?PpPE9yugUp706nmbBCDqjYlNR9AIeF1Dwr6gSv9PvYbQiTWstGbGVaBx7j1V?=
 =?us-ascii?Q?LMSvzSFZOs5aBgX0/rXNHG3IIpfwipGu3poJIFirIc/yOBpcNnBMQr0VXkpk?=
 =?us-ascii?Q?kJyMZE5Qmsvvck4H/uW+X+gUPIeTDYStZioQU4XzbkqNFQeOeNdHTZ++4EDe?=
 =?us-ascii?Q?wZNzJlBhc6PJ584GqW00CDvdjJogNmZI4o4T+p9djkxAEZLDV76OmFaMf8yG?=
 =?us-ascii?Q?Nuj9h6MoU+zAKPEoGb3VYKJ5g3hSHx/2LtEshpU7Zb8THhU78aEKVfOZG13Q?=
 =?us-ascii?Q?k7B34C0CCWIDXnoxbRTSTG97LCNHX9Q65H0UNl5kCTjK71WzBX7ZpoPFKa0P?=
 =?us-ascii?Q?EbPg6NAeDVnvtK3syMG30i2WZLwBxb+Ay02w2IjrHxzfhWFMX5/1pfHS//OT?=
 =?us-ascii?Q?gLZTosKsCJT0RE84852It/mMFMX/UKtdq8cieSKetw38awgcySjZ2BlPsj/z?=
 =?us-ascii?Q?RXyzzBmDxwQBZaxAC/hjZBtr4ofrZ/xAhYOYopUDTW0n6HV6jSb4pLjAPzzl?=
 =?us-ascii?Q?fg6KL23KaIitdCGz6gESe/Se8Zeo+g9vwlFIIslWsPhnJ+nzpSfHr0WAJspX?=
 =?us-ascii?Q?aBDUE/KSkMgkb5QwawbfobaI+gfBlJ4gl7keHfATfgcOzmNr5Zq3f0j0ndYG?=
 =?us-ascii?Q?0onJOts/kc4JFtEDFIrAId10Ck6NDCrmPrMwMNiZH7dQlwZ6TVg1eQ9fNji0?=
 =?us-ascii?Q?sboqwCERJZ+BpnIjVUzrIkf9ul2jUqOv/PHoFUCeGP5fOE58/3ZgpQLr6WZ5?=
 =?us-ascii?Q?/NHwC947HrrfXh4RPFVbPtqkfsE9OW3RVc6RquSihcGKah0rproiTtFg5r8T?=
 =?us-ascii?Q?pR56Y5pDd6Qj0RD2Qr7dbU3FxB+Jm5FrWSulMYH3KM4NKQKo/KwdxxuyP4Qr?=
 =?us-ascii?Q?ShgOMVPrzoFQUQq0l9EsvHGMQ8zJItOahyukS3r9c1WCyIJO9TpOtHceRdxj?=
 =?us-ascii?Q?MueZUu3YMk6sEdJL0GS2keGJ+hRAVhrWi5wYOTqahbcSJcVh0Z/bycUu6Tgm?=
 =?us-ascii?Q?J5ShRrn83DdjY9PvX+rL65onVu6ixCCM4tS1DEsjV722A2U7m47LMiQbTTOw?=
 =?us-ascii?Q?SRinyhpVvkPNCspX++lYYy4o+OFN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o7lgO8Q4BPyBBVqvhLdiot7b8v1cdwtbbXjlm4nYwpoQaBvNvMjGgfOZETZr?=
 =?us-ascii?Q?Oue6u+dCNlCDGYGKRdaLqsJtZWRhuOrvtaZYgoYcKZUUr9gJCi9wJQbmuC/R?=
 =?us-ascii?Q?eN0c0BFzT5a5rvzALyCrbnnlyLb8+aXbiORvIodqexyGL7YPwItqU8iVv2z8?=
 =?us-ascii?Q?g9LVaVfFWcHN0aWMzKnG0hzTvdIqRabdgdXvUSqt3Dfu6r9X6IFy0OccpqgW?=
 =?us-ascii?Q?6JtVhYuj6vl/Ol6BQ4sLEUJBtU2VuwbbcMG/4DCwSij8l/muoMxMs/+KSOdd?=
 =?us-ascii?Q?RBNTmPVqcgKcUx+wZ1gkNurA42O8BTLByqMURpChZyTzIsk1iCZxXg95IFAY?=
 =?us-ascii?Q?TyhRJtI4mU7zQWAs+It5r7urYbJz1J25f1b7AfZJF4m7ooCXoQBW5/eOcdFY?=
 =?us-ascii?Q?NpUloaYbn4uSfJEqG5XT/PDbp5pByhnAWRIN0Rm2W0JpItEEWep9m2EnyTs6?=
 =?us-ascii?Q?YBpXN86YFWlsncodo7x4G6YltOqvAwzIEs/k3dVO+l+2ed94lu1BqPBU51+P?=
 =?us-ascii?Q?1T5jvK/+716yqoi9yoNj9/rig6kbH3IMtjx1/grDizLxRlDDque6177/eova?=
 =?us-ascii?Q?jhrIHfBTDjoQtsoJuMttKQuDqTuZdeCQQg3L5MbBRrVFvBWFjd/3h5vE2H8j?=
 =?us-ascii?Q?4XfqGK7ErdwCyNACp2UsHXe0Dej1PT568dt/6G1zNq/C+SeYqSILGCmKj03T?=
 =?us-ascii?Q?5pV6yxck4wyYHkkf+CKQPk8dn6nQuTFLgi/bgyP/UdheohpXWefzn3EBkCNW?=
 =?us-ascii?Q?nMixWu7jcBxoA+qyi8gQa1h+fsOt4nx1sKyTyKz8S3kyHXR2nN+ghrjDfRzN?=
 =?us-ascii?Q?I9aMIFUfh+j32BCLBt48yzJWUpUkmwiAG1z3iDj8zfRcVPhbqy74jAwryXXc?=
 =?us-ascii?Q?ss7whUZiUcYvG4TnCo2zIy1m6esAw7pBjZgJqTrjYlJbZwzWbt61L37S4Leo?=
 =?us-ascii?Q?yiwVfW3Rqij+BSUbAALGVk+eMtUrgeobltpVNBFyYGyVr2vnlaEXbDqrzgLY?=
 =?us-ascii?Q?hd6D451ABkm5L3Reql7Ii12htYxaYem97l3xK8DP7LMYcrh6hTMRS+L24uap?=
 =?us-ascii?Q?zHsrUKjybLU8ZagnOhUUdIDAVZf0h/Lf7IpnqZpQ92uwZRs9NVn3qYJvTgUB?=
 =?us-ascii?Q?O/Jg1UQQFUbYzbNz2J2Z6kRyUTS3E50rJrJc8FK+jxCXxLwid0cNFwcOyHWC?=
 =?us-ascii?Q?wDLTQnfjCkh4JodpUHjEpxkGCqrtTEpzPS9QPKEOzJrSR3Nq+JBSh8p5dFIO?=
 =?us-ascii?Q?O10bBgrJK9pbTM/ONQHVTKpYSP8m2HfWjtzaPBiJNVViQhPcX/pEY6Gc79h7?=
 =?us-ascii?Q?vCmLK32SGEvlDhJ+Wif8W5hPAeFoS0CrVml+TaKW+l2EQTtTR0XhJA7Bsbkq?=
 =?us-ascii?Q?M0xH18tMW3HVULmnKAbasrRl4QAU5ixxrtzEJLuWRTHCYEZlh5sk/uiaWVrk?=
 =?us-ascii?Q?nbZSMdPPjHtQCau/FQTLgFj2aWbhee2XIswFKVpBCRMdgEMaNGc4yatQRxU0?=
 =?us-ascii?Q?8/lTKIstH4iX2SSPH4gYSWUUdk+3aPtTBGpvctFCzW94TvcU1r0xcuEjqY3n?=
 =?us-ascii?Q?L9wWdoHVJDGq4+zbEBwTrwZWl0SxghX932rm+namSnbwl0oNjDieqqcGHsOw?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: uFml1C01bzD61p96wShA03yzXP5rfO9A3Lhijm5Hqhjeu+MpPqTCbt7Gahx1hq17EU7CXtekpPDOmYsuPzsnHozNGNFiMhzYzPBQ0vYJ3Rn6+kVIjOgAJp01sFnpv9LNi2P/BkbA8+7DPeVPWjwVd2Lmbh/Rg62WVcr8/S2jRNYXGDOS88r7ed6YQq2818z35xsOMCSEJp1iK9ywOwBDBf3UBqMjQug7ii0YkbhLSbttd9xh6n4VdmHBGOotfrODNlxsOpfUFHO81k7waz8CA9cfEdR+yGEXSyVPWexv67hRVqE8yzCiEpBFde/+4GzUX0iAFMXgcbsWN6xyVs75TfZtTLJYecRsy14KsaU+VW+NNK7JPh5iVkvGDzwt4le5vytCRYBNZnLDe1qYDevEbEnd+8hBImcluAWfebGH9K6SMrWu9FZjOCX0+8sfBOGjUOIej3SEkwEHlo0qBLkk1br3DHG9TzWBag7ASwnUBVxAmzwZsfkeZb9RiOz/ZM7uVBm1w8uWMLB7+RHzSVYWkUIfCJDBKjWq5aqALneSN76Fy5SdlO20zS4RHe2X0r6S8BCNudspBQ6vja0O+yE/eXVC+S3+IOQ4mQF+jCOgQWQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eafa90cf-37a7-4953-b790-08dd46c3ab51
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:33:56.4644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZJ9ki/GeDq5/sMW2+xrKsy3vJrMKfNl65i7umIMXpgWBataEi6MYrPpszGaDjwhZGzelsU2stgEDtWqzFoQtc2Auwino02zGarnTCKatHY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4808
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2501170000 definitions=main-2502060127
X-Proofpoint-GUID: NMqA5v9O8dymllL1eCNGOkF6bRiRvmbJ
X-Proofpoint-ORIG-GUID: NMqA5v9O8dymllL1eCNGOkF6bRiRvmbJ
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

With the introduction of mapping_wrprotect_range() there is no need to use
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
makes sense.

This eliminates the need for all of the logic around setting and
maintaining page->index,mapping which we remove.

This eliminates the use of folio_mkclean() entirely but otherwise should
have no functional change.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Tested-by: Kajtar Zsolt <soci@c64.rulez.org>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/Kconfig    |  1 +
 drivers/video/fbdev/core/fb_defio.c | 41 +++++++++--------------------
 include/linux/fb.h                  |  1 +
 3 files changed, 15 insertions(+), 28 deletions(-)

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
diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index 65363df8e81b..60f9ba80b296 100644
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
-		printk(KERN_ERR "no mapping available\n");
+	if (!vmf->vma->vm_file)
+		fb_err("no mapping available\n");
 
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
+	 * the PTE is marked dirty to avoid mapping_wrprotect_range()
+	 * being called before the PTE is updated, which would leave
+	 * the page ignored by defio.
 	 * Do this by locking the page here and informing the caller
 	 * about it with VM_FAULT_LOCKED.
 	 */
@@ -274,14 +263,14 @@ static void fb_deferred_io_work(struct work_struct *work)
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
+		mapping_wrprotect_range(fbdefio->mapping, pgoff,
+					page_to_pfn(page), 1);
 	}
 
 	/* driver's callback with pagereflist */
@@ -337,6 +326,7 @@ void fb_deferred_io_open(struct fb_info *info,
 {
 	struct fb_deferred_io *fbdefio = info->fbdefio;
 
+	fbdefio->mapping = file->f_mapping;
 	file->f_mapping->a_ops = &fb_deferred_io_aops;
 	fbdefio->open_count++;
 }
@@ -344,13 +334,7 @@ EXPORT_SYMBOL_GPL(fb_deferred_io_open);
 
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
@@ -370,5 +354,6 @@ void fb_deferred_io_cleanup(struct fb_info *info)
 
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
2.48.1

