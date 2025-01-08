Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9351A06190
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 17:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA55C10EBF6;
	Wed,  8 Jan 2025 16:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="RWnyotQE";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Eq23ICEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB15410EBFA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 16:19:11 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508FNI5V017695;
 Wed, 8 Jan 2025 16:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=TeW/+yJcrglGhUjMtcHmixJQKg4v6rstkAUVUeseIlM=; b=
 RWnyotQEMtOTg1BGQnAEk/X+3ocXuzxIT1Vys/Gx/Fn5HjbrxWHpx7k7LyieuhZC
 X2P/VQsxK7cYYdE4aGAPEmtnd6Bm7IXOLNINtfJO3syjUQZBlR4S30sAwyvrkwyW
 4xmj6NyKJO4ldMUzrV/vHtt7dcEZMF0wWRglU9+ApceqRxqRqAgsIMgeggZrD00s
 UhfTGwgYN2hw3pAmOXSN5NZV91vCBgrqyY8IqLqSfzscVI9f5wM9kBP3JhKERiBp
 7uEs1RV+cNnrprM8dDBPxqKGdhXNBKq1D1iyhVhloKbRJfwL5AfeRnxW//QMvb7s
 nrQDc3iisEmc/gbJ9SX2gA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 43xus2f7td-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 16:19:02 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 508F5tOj011115; Wed, 8 Jan 2025 16:19:01 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 43xue9s9ps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Jan 2025 16:19:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W4gdT+7hwaGcSn/vCeI6geDWnpxrlmiQJeVaVUFccnEOtI86i2J82RY8lzCZZJtFhGZxLys09m5fLb+rBPgIIdjdDUSgVU21yIE5Sr0SWWuHIMHVJodUm1ivzcRvyCUvsWa5Osa8rVocffUfoSGmYzQbf/IcJp1LxQKjy7tGNKX0ZoeMHqFheFJjsMtu/qNe6HfLvLzSx/Xgy1/5BOqCtuBtcnSMRBnIq7k/ylMy4mnzMTG9BTCP7T1a6QUADvKPRHbFe9gS6DkMydxvyUqrntPDbAMiPiE2faixdlg002mVP/oOvxVWeFowJoV64hfPh2BFGVv12rUS8sgfLPeyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeW/+yJcrglGhUjMtcHmixJQKg4v6rstkAUVUeseIlM=;
 b=WOv/8cTdQTCMh9/qyQJcjNy2e5HqNBnIO3pHxq3qMDMhhuhR7d+PuzeS7S6PZD+VHfoqrNmVXtu8OFwryGwrNh2byOzu4IdVmmQFO+YNiEzklj+VCUr+4piWDVD2IKIJ8tqf2+WIM5nR5EO++2drNHtwXTlra47nXQviXYxk5rjjjg7bOB1PcrlErn10gT2HRkRDfS8GZrhIL854EO/g6IAPb7guGusE+x55cDnYFylJq0sUGwwF2SD8eju6wOxylf6oKCHGNzDeT84iEcBwpTrtxfA8L8+WvOLuLPSI7XNY5WGSorqK2BNU6NcD/s9zJn/3hJW7gSb5hZYOspcg8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeW/+yJcrglGhUjMtcHmixJQKg4v6rstkAUVUeseIlM=;
 b=Eq23ICEQuhM7omv1xTKjHAdBW3ZSAKOti/bdCVNa2tZDXhi6agPlUOx61hxzJV/F3OqHXSxvd3mlAopf7Et0uA8qWudNU6Ce/V2oK3SrBWuGKRpwm9TTn7iQJuC6G6oT+x7KRO04CMuQJuUxKGaWvW2m+L9BgT6dcMKkFg7n3Ms=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CY5PR10MB6046.namprd10.prod.outlook.com (2603:10b6:930:3d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 16:18:59 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8335.010; Wed, 8 Jan 2025
 16:18:59 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH 1/3] mm: refactor rmap_walk_file() to separate out
 traversal logic
Date: Wed,  8 Jan 2025 16:18:40 +0000
Message-ID: <0c53589f34a6195938eeb58c3a88594fa30cc90a.1736352361.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
References: <cover.1736352361.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0063.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::16) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CY5PR10MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: cfc8154b-c2a1-4298-b3ec-08dd300027fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3ahoROuAXolnvzPpI35353fLbrlSN6EOvisdQ91yODr3/NpPllsrpogegcfz?=
 =?us-ascii?Q?ef5FbXYufbUGX56shMt5mumNgBkjCpo494eRyadm+0MY9tQC8Lr76Gscl/rp?=
 =?us-ascii?Q?dpLjQviL8Lu+G3YpmO0Br5BCwW7eDQXEzotGKyW41wvQCUsBm91NOqQZuyr5?=
 =?us-ascii?Q?TROGz5Lk5jG4x5u2WrJja+z3As9wtcGLlIGK9MR+PamHxVmzfZsR23yh6EN9?=
 =?us-ascii?Q?TykFbHsEq4tWcfODRMj1fIONwWtuaP09gaoWG+eUgy4Gb1/UNgB1zQDMlP7J?=
 =?us-ascii?Q?knbjiX9ILltnBxu1sUOjUgH1NMAUmUK2f4nD5u8PWsa/XFTeJy5WguAnhFB4?=
 =?us-ascii?Q?fC5k7nQiPGs2qf3SyScozhkSPZr6PGHVjWLTEr6c3s1hmbE+B8qdLMgHimdi?=
 =?us-ascii?Q?8IhqP6ACGPsgjgGt1Ykx4Skqk2hde5fiKs5mCB2E/1qiiy1KQ7HiPjrs8znR?=
 =?us-ascii?Q?OLsC3eqEHEbDQ3TnLyaY9lobN236JxRO0f1D+Jc97clN8KGyn71bhUUVC2Hm?=
 =?us-ascii?Q?tn+8z/Y/4mfs+wflsbRe3cuOyHkWhqWO82voh1HjXTopPrt3xvNAtmOM+I6y?=
 =?us-ascii?Q?4JMFW/RdBNQgQnhcBUvUOFJciMzLPbz8k8EWy1HwkmdtB2x2pmNMqV5JY6PL?=
 =?us-ascii?Q?a609U2hFLt3w7S6lfYOfHlHjaQnmWKO7vwz9zypXr+lW9u0uAdT4MwwIn8/4?=
 =?us-ascii?Q?KV8thNis5SmGNcp4ZtyOk1LpU7k7DCohdtOUJhEIMLtdRrpFaGoIaoouD5jJ?=
 =?us-ascii?Q?JWgf0U1JpwIEY/0lUK1gU78JGzzey8RrTcs4wFVl9iDbxMED3P2SX9eKhLUp?=
 =?us-ascii?Q?VsDK61CHNu1wljDHtOL1nH+rsEbaoLwpJ1B9VcQVM/OKAUbv2nNk4dPafGNA?=
 =?us-ascii?Q?VS9DJz4mjvBSfPqVLRxfe8GstszvUr/1bZ5KUSkfzJ1X2BrlChLupc2D79A7?=
 =?us-ascii?Q?rTaH2+Lb4VkAR7mHjBtD69cyra2iF91RLWjtZ6rDsJPDhs8byrUTVsx/AHU5?=
 =?us-ascii?Q?M2i+N++10miWic1w4zOCMOgC/X2hKbepmHkO5h9AFrGuScSMCmbzi2ybeKs3?=
 =?us-ascii?Q?jZXPaJ94KLiP/PLDKDBOWMVprnd3tXNvf1wGgczJFSNpscP5SBSUiJH4utNX?=
 =?us-ascii?Q?DzWf/VSPk1NxB7DDw4qCrO/UrCfTSpHJJCLrY7smVRob7Vefpi9+iOo7EnYX?=
 =?us-ascii?Q?olVF+viA8i3fELr93pJhunzRmuQD9EzSIfDRfB0kJD39ViZESFylm1znsoo+?=
 =?us-ascii?Q?/XmKUSZAqekZubFs8uX/dAzLcmMw63IyJu1NwAqpy+GIadD7da3rP96kqUa1?=
 =?us-ascii?Q?metQ6DdgsGLNfA3BiNGdkTFP5OfsjEgfCVt2UkQZRxkryO0VIvpGLwKn8sEQ?=
 =?us-ascii?Q?VMZI2n645JSCgWWBFLwmbHfhDsQG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ucPBUDtYS6gcp0bQdME2RKnSpyz5JPYE+2hdOcVtN9qLiOJjU2URUvPE/x4C?=
 =?us-ascii?Q?NOlzsiezjdJ0Dgxc9W7UMzKtLUeAVlaZtx6FWWTGqYlOrTrWhyj/PpwL5JBF?=
 =?us-ascii?Q?Bosi1sbi5CKMSBg/MNDOxQvCv/za1pvovhwxHFU1XpADIkU2usSRGVu/cIT5?=
 =?us-ascii?Q?QOCA4flE9Y7qxe0o1nETpie9hJkdoMhjSY9mk3n5St4VQrNDDtK/2ejG/8v1?=
 =?us-ascii?Q?0zfXmela7AFt4JUBnIbUXGcQNAPVXRqA2QZ6z2ZUT08akr+715SgKJEuAaQT?=
 =?us-ascii?Q?jbpBf7OGPYSFYyODK/+Yt9+pKlLKxBcjrQ4lDTInd0YSxVNsyvw3hwls9GLb?=
 =?us-ascii?Q?gmMGnahXZ1vqqZ4OOpVCgGghsfvKPPqGPu+QSnWkHXklzrWrYSXFZ72Y9WXb?=
 =?us-ascii?Q?GbTwYRdX3kHIc2iTFq1AuiArW+dghD+u/lsifsHiDj5gY2rOhfB/jDj9g0br?=
 =?us-ascii?Q?bAZvXzpJMGuecm6IWFdoABrJuLNw45gjm9VbT29gYxfUoEQZ3AFe6K36YRcA?=
 =?us-ascii?Q?LEwcDiylsRLF6VUjyPlu8cOvtWRCypq729rb+uyJY2PwwRqS/jqLy005jb+p?=
 =?us-ascii?Q?PQGxWn/5RpzoCM6N7sjvtmdOwC1EvuJtu8QjAGZEKUtn0iZ3Wzvq2Q1SnC0E?=
 =?us-ascii?Q?7fLM2K6dBvWKrexv6p5FflKCBAJMB1p7gRbCAh5/MsGVgWePQpMJ0ifEzRWc?=
 =?us-ascii?Q?oD3QXsQZ4jN62eI+dZTLg6EsvjnpuzE/rW+8MnkWyBPRFhcUyEsk7NnvhYuv?=
 =?us-ascii?Q?i381dXKZFelvG2V/1useT+IMfDY6Xucez8ETWbl3+6y51pNlsmZ9dghf/E6v?=
 =?us-ascii?Q?ipTuLY3n9AKiLyLyyoappLLKVKjNP02U7bvV26OhA1bvlqVVZcEOzQdc1LXv?=
 =?us-ascii?Q?EWMf/k2rmhwKY7BO00ZLCguZDQhXh/P4kOGue3uVzkszJABRH4PthAp9xXmX?=
 =?us-ascii?Q?OQY8kWQ2SSqXrVSKVlKjXYCvEyiFIdiIZDKDOEVSYKG5MC4byy9W54NBRs6s?=
 =?us-ascii?Q?dW+L4vCZ5EzLEXDMK1V9BjDWUMoGMuOo4/r3uuCEiQ3ojICva23pCJtGwyS0?=
 =?us-ascii?Q?95/CwV/ikORLxsbiVmG48W8Qqww+7zvXJTkPp+HCqdHN47todvjAEAisiZLU?=
 =?us-ascii?Q?8i5WDwU5Ag/io0nmkRJz00E4ZRNj8LokQh1//JGKT2zPrXAUvgg9/5ukNU7a?=
 =?us-ascii?Q?Gk4R+2HB7TV909bQS/fj1l6MzFLmq02mUXBho4nTiUqYhGrM8tkP7E26kngc?=
 =?us-ascii?Q?9HY5KjDewOibx51VTgqaMutIK8S8bu2dhqGTchJuEzF1HQY6loSgejTDJh9b?=
 =?us-ascii?Q?tdsExLd7paM4g7QFNdLpTnfQ/vfS8EEpbAuB9Z7j1yratlxoCypZKov04CGa?=
 =?us-ascii?Q?16AOoVdH/uoPs8aJtm7LaHU7bVTEnPtv9DaOoE1hrOjTq3aMCnsxOdwxlTbB?=
 =?us-ascii?Q?lJ+rMFhWaCt8hPxnhi3Cs4URSSAtmIeaxVteTUhhTwZg/TK8PnQqN0HJQoDc?=
 =?us-ascii?Q?Cwhb+52fCQxk2wsRz4oM34JgjFSEPUpTDKOQrRChNp2BMWA5Uf1QFRem/fns?=
 =?us-ascii?Q?SVxnyIYPwsMtN4EVLyfYphUh5VcF19X2mHmxjeNxVS8AikeFWbHpEvdNaUEg?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: IJ/CAscFtguQFP2nBpc53aGHAdz1SldeIUsowPzXeisjamDPPbefK1/Ggq2D5Y71rP/7Ex5WX0ug78bwafdeh20n8XMZCXBW2Fd87LgMNtWCQH8CyIKGsjHfNGquiQuxwSOHbwhy8zUs6aY2m6XbMVujZAtpx9fsRa+bXmlwv7011m0sFQ3KRk4bmH4rGQt9S2P+EvQpdqPj8WAUEXIk9SUVD2a2g+t1TN4UV/DH6t3Yen7p/20nMMbGc7DQ8OEEKrjgCMyaEm6d+QiZAa5MXtqCcK5NSHYC6j+H7xEDlyZoOfel/6+caTXs0UmRGo3sYNqvcnnKqYYapnffmAVm8l9vX4CX9ctdH7QlLZoFV9gVGyyxdfEURdahebKnj6SPLCDv6+k3llsFyLPntsdvqmOMkZeeDTGVx4ZVZO5tuvn7Sla9yNohsRuKBDrqStywospuJFnOGX+521AtvRfll93GfjnRc68meyvDi6PYIx/kGKc8EkMYUGz+f3MRDfi9jthBVi9mc8L6KaQekyOTFh1erzVn4hYRIGdjEkcoSdS1a3Bq2Op9b2bwWuZ+KNVRIPp+HG1bHPzLe+mhUTta98gnhtl7K0gnN5Yr+hCbmr0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfc8154b-c2a1-4298-b3ec-08dd300027fe
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 16:18:59.1281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GP4RvtXxEuGeEXJhRK7KmiMRiYscA+4+/GLZv0JaHeKK9kgLVfmgimlQSqBG2/fJq21g59bVn40hTQIcEm6bJcE5OjJOJ+CTO6R0b4M6Cc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501080135
X-Proofpoint-ORIG-GUID: csesqimgMFh39tn_UcBcPEE2_sOHbexQ
X-Proofpoint-GUID: csesqimgMFh39tn_UcBcPEE2_sOHbexQ
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
 mm/rmap.c | 81 +++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 26 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 227c60e38261..effafdb44365 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2710,35 +2710,37 @@ static void rmap_walk_anon(struct folio *folio,
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
+	VM_WARN_ON_FOLIO(folio && mapping != folio_mapping(folio), folio);
+	VM_WARN_ON_FOLIO(folio && pgoff_start != folio_pgoff(folio), folio);
+	VM_WARN_ON_FOLIO(folio && nr_pages != folio_nr_pages(folio), folio);
 
-	if (!mapping)
-		return;
-
-	pgoff_start = folio_pgoff(folio);
-	pgoff_end = pgoff_start + folio_nr_pages(folio) - 1;
 	if (!locked) {
 		if (i_mmap_trylock_read(mapping))
 			goto lookup;
@@ -2753,8 +2755,7 @@ static void rmap_walk_file(struct folio *folio,
 lookup:
 	vma_interval_tree_foreach(vma, &mapping->i_mmap,
 			pgoff_start, pgoff_end) {
-		unsigned long address = vma_address(vma, pgoff_start,
-			       folio_nr_pages(folio));
+		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
 
 		VM_BUG_ON_VMA(address == -EFAULT, vma);
 		cond_resched();
@@ -2767,12 +2768,40 @@ static void rmap_walk_file(struct folio *folio,
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
+	struct address_space *mapping = folio_mapping(folio);
+
+	/*
+	 * The page lock not only makes sure that page->mapping cannot
+	 * suddenly be NULLified by truncation, it makes sure that the
+	 * structure at mapping cannot be freed and reused yet,
+	 * so we can safely take mapping->i_mmap_rwsem.
+	 */
+	VM_BUG_ON_FOLIO(!folio_test_locked(folio), folio);
+
+	if (!mapping)
+		return;
+
+	__rmap_walk_file(folio, mapping, folio_pgoff(folio),
+			 folio_nr_pages(folio), rwc, locked);
+}
+
 void rmap_walk(struct folio *folio, struct rmap_walk_control *rwc)
 {
 	if (unlikely(folio_test_ksm(folio)))
-- 
2.47.1

