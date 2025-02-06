Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13445A2AC82
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 16:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12C810E88B;
	Thu,  6 Feb 2025 15:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="Vbem2NFV";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mXcgrrx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BDF10E894
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 15:34:24 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516EP7Y8007509;
 Thu, 6 Feb 2025 15:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2023-11-20; bh=nBYx7Eh/KR0BtSDRBC2OZUEKMdiIHhWMKyghUPiHSDA=; b=
 Vbem2NFV/xYK/S6HU0LTWT1awZxGgpiG1c8m/Jfig4WVFDjpOq6fvBjslp+ho5cK
 X0y6aMKURF2iS2R6G1oKXjKvWWrtVRvE6BDyCIBRq0o+02ewLpp79AZVw5I/aJRR
 I+ARQCHFy3S94UgakWLIxPCZ+iae3JlnOJxHaRRcufBK8g8C3+CY+LiQHexWWdqQ
 MrHcJBaAFfiWTX0jPrVYhiXgmGwolxvVs0HEdDHe0vOKVhsgkQD21IkKQLrmdWFT
 W5OVaMulX+MuPx0QeSwmCvurV55JZuLDjIW+wRuHJ3VwDwUQ0/J79B/1kHzITWjq
 tdM6rYPDGR6XIz+guv6AVw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44m50uavdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Feb 2025 15:33:54 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 516EXmd2020673; Thu, 6 Feb 2025 15:33:53 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2049.outbound.protection.outlook.com [104.47.55.49])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 44j8fs04eu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 06 Feb 2025 15:33:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyOZAe/U7OnylGS9lu2qE1cXaKzDn6H9uDVN6vRxe9zqFR5ObarRlxCJXnA5yLdmCfVggC1ptXd4Vbc6lSTekpFe9s+Q93TTwLZMdlbTfiM+bnRGHOWMBAYid7jXyJ/261G5NLDEQUs8ci2jF9Lq8c2a1xZjuGV2oxPAfzFpqkyEOBqgXEd2Hi2xb0b3XXIZnmvEShhREmT7s1SDgHLWhBP9TVkMJUFfxBIc2UBrqWrzMVwaD8WKIg7dfo7gCM2QEv7fVNSl4llVrqMbS5Wmd1tejxtyhnxlibeY/t/FkMZZNo8hRZXu8JL/qa3Aws3Ch9UBKkNx0X/HNs5tprCC7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBYx7Eh/KR0BtSDRBC2OZUEKMdiIHhWMKyghUPiHSDA=;
 b=T55vHcrdTZ651PN7lN+uxaHhyDVwI8+6ksWQpl2KxjZDAh8k0Cp3Zq6xIrHeSgUv3P0OfkDevi9kgAHN950kdl60KXP6EF5Me6IpdCkg4whGOEQcVe/L9ox9auJlBi4fXH3iSBZvyzdzfrbpUpgvZJy5UY+mKKBFpJ+B7NnAVA8vb5jRnzPLCZS8tCdJ0XN6jwY1zWm517Cyy67mXPtYWhD5iecdxhNTGtcSXPsDpuEd6WS7m/K/v/gJ1XVKFpS2fA2toJYwWdNVKdUc77kC28cWTk23NS/1RpnlGFUHGsrnIlhwVoYE1GhLsB6UP5JSqzBQVPZ2F83cRQ1CzQysyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nBYx7Eh/KR0BtSDRBC2OZUEKMdiIHhWMKyghUPiHSDA=;
 b=mXcgrrx73Vr6CMXSgN2v4VH2w8klbV3BkP7FQ9DtcY9+TSwLPSOlAsgYhq+kMhelex2mfBNFUV74U8aqFaK+gZZMsLDqyEb/+85RBE4oDSlKEvl1NWaEUpOA8CHE/Sjm4WC9nxxlhdwUcPZmDrfYpo0c9t+063+f/jnRdXqLh+o=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by IA1PR10MB7417.namprd10.prod.outlook.com (2603:10b6:208:448::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Thu, 6 Feb
 2025 15:33:50 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%4]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 15:33:50 +0000
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
Subject: [PATCH v2 1/3] mm: refactor rmap_walk_file() to separate out
 traversal logic
Date: Thu,  6 Feb 2025 15:33:19 +0000
Message-ID: <29d7038ab608eec8a1fae36ff4b64bd9c8658dd9.1738855154.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738855154.git.lorenzo.stoakes@oracle.com>
References: <cover.1738855154.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0379.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::6) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|IA1PR10MB7417:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ffcee3-8cc1-4a22-7366-08dd46c3a7a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ios2Sd1DEuRPpr39QsBUreAmFGNq5VngAvhrIvAHDJum95tiQSFt2l7ElS9F?=
 =?us-ascii?Q?RgiCC00kQ6JdhEbL3HnapGZdxWnjY2o102yr435BAUYs0Y0N6uL+n92tltUY?=
 =?us-ascii?Q?OIHU9LgFMAJpFcpKV6fy4j3kpEHJPSjgT5syN1p/Z4jgp49PuE6hkTv/Hdi/?=
 =?us-ascii?Q?/Y5FXV6O5FYM7hJ+L3pjFlesyJ5CFobwzq17ZT8vkKVMriI6kPhK6UqNhIy+?=
 =?us-ascii?Q?rMP7vH6a9b3k8KgQAC30OTRxWktftopctYpSHt3fQLK8oIi+ha3gnWfmkZbD?=
 =?us-ascii?Q?0/+PwFGT4626pr0PNyf9HHejkYxMOmHNYmPQZonwvBrjASTE3DSa1pUs0p/3?=
 =?us-ascii?Q?Wad96cw2t0fDff7Sd/LRrTCUn6Fiywijis8wexZM68l0xz+8q8h59y4G+kTF?=
 =?us-ascii?Q?EJX7dlJX2YNTnRocz1B72g2xy4hIpHD/1M/OItVFh+tEb7+InA+vDTVNajaF?=
 =?us-ascii?Q?jBXgrYpf08pzrNYOQp2sGYB6cVQZSc6xC+Bzzxm+a7zz9eJtToFB1K8EZJVx?=
 =?us-ascii?Q?ERJnzSdv6cXorKGilHwYmV8wrdd323Rkt6DaHE8604afUTmqPGzPSPFXytGd?=
 =?us-ascii?Q?q4QIUYtI9vVfTtnkQ1put7eUEG4SaUyTTV8oAQ8wt9Klw3x9iAvzzY7uX+57?=
 =?us-ascii?Q?MlTYmjoZl1DugXiBiEoyol0XJSr+9XL4JvRl9f3D1qc6vIOOWo0CAX0Jdvqe?=
 =?us-ascii?Q?ueE25EVKKXkddbks4fflrWrqyt2sAzHijYzMHiR8umtGn3oiEAa/8tto62eg?=
 =?us-ascii?Q?VGC9+3BMNxUtmMZJARi5E7tyhsH1oKeTkcL7Ct8FclrVGibJpto34Zsd97md?=
 =?us-ascii?Q?gidicD4HO0zek5WcFLLsNJqcskWDaewH2k/ImQ5JG0phKyNnigTA7QIvg95i?=
 =?us-ascii?Q?D05MWlok1asWlYukqxynfC4E38Lm57a0XTrfm3G+fFtonULHhwz0EspQqDNI?=
 =?us-ascii?Q?+1+/WrLvFl2vripBbc76jX/Mrqp0GvlFpZSuP2vZJ4Rye/nqGlAc11x8HRlg?=
 =?us-ascii?Q?w0pxyrwdJFgJjKLcRGWeeSUQ0700lw8rhcRHv7S4/uOxb5iRKbhhF2/6ZDEe?=
 =?us-ascii?Q?9LeaN043irWLRhTf9P4q1+oScxN1D4NMFfdBZyIJO6lXP7DBF6s09OZLIQmg?=
 =?us-ascii?Q?bWAFdxoxmcyGjZ08DFwMIvzTLn/aiI9gx8xKzKWElIcZaGz5dWoLFDnFEyij?=
 =?us-ascii?Q?w7Wd/ZMsHLy01W5B1rWRHvY1P70j94VPKIQfC3MKidVGjV3/8eSOsK6iKYtD?=
 =?us-ascii?Q?pWjr3loD8ITjd+CDaFHQR/CwuCsjpYrQgOSfDKVilxK6BFwY6C78vltV7oin?=
 =?us-ascii?Q?rbvWQwTGGp85WNNA8sbtyAsp5wUZnFlppdsMc/UM6A2e5z8GXRn9x0rOShVu?=
 =?us-ascii?Q?x9IZ71LqUrGnUytpyw//hRKf60it?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3366.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3CLJPf8nvoqut7GCO31sRSPKZ3/IZ7W7Gs4w8VV5iInbH9IBwwyUHe122S6X?=
 =?us-ascii?Q?TjLdRfj7CCt0mXmc22GX/sI6jHpl0wRb2hy9780EKM/5Jr/sSSTMFjAc7haW?=
 =?us-ascii?Q?P6/AnTVgsrancaTL9MvEe1cb3VCJ1PEpbrbx6xd/VjYGzdGtYl1QsipUQ4I1?=
 =?us-ascii?Q?3jF2ZHe4tFRef3vLmfFBwdHN+Ej9zpxTN200pjeMJ+hA68H0eYQ47EKV8ZdL?=
 =?us-ascii?Q?GO8+Do359g8iST4GgzkKZEQKwS2BgfMI5quzPxWwURHL6O75j31TFc/CC7uO?=
 =?us-ascii?Q?6++2MkQT4uliLWSI+rLz1TxCavrf1ba/uXzm2acTSII2j9p1eUwOYhJMkE4f?=
 =?us-ascii?Q?IGdjtCavslf48ABMDuxZCF7QLGv/KM0nsF4lKykdq40g0HVbS8AFQQdwRzEC?=
 =?us-ascii?Q?WDrd/1xXSuDOjYhCk800QDo637eCYGWpFe4uOdywQpk9JTn6UI3+5zBeJVCt?=
 =?us-ascii?Q?5XIMJWY0Jn2uA4KSE7cLBxQ11IYa9lKykZbp/s5A0frs7JPzT/u13WDNRSMs?=
 =?us-ascii?Q?z8BnB2ChzegtaGWgEZAwsxkwP6CcQRZwvA9hnTWJlO3sn6/7EwjIDaWl4oes?=
 =?us-ascii?Q?PXoV3Ovpyyt/dqEw+wrXvVV73KXD2WQBhKc2+D1EZRX9Ihv7ADsLVTvhkHvB?=
 =?us-ascii?Q?9bqgPaLx4/RyYuz0xdjS50XI6kQaO2Kv+3O0tTgp7WceEHuwQ2gUsilo7Wkv?=
 =?us-ascii?Q?sCttFTDHhwWUjj+zTIQqSY8ApRJjhpkFr9NDMQyyNuVdGqXtHtmN9gl8ajDe?=
 =?us-ascii?Q?3yl3kYGG/u6ops2UnPDwXfX1U9QobHrF2WWUjtu3cN2yyo6xaYR4CokQA69a?=
 =?us-ascii?Q?JHpakP69zrlpAXz1FBCkGM2vfmayJ5pfJfZqui0xzbRboMnXGnYh0nXIBMaT?=
 =?us-ascii?Q?2b2ZVcPB8aUQUDKhFuUZARSAG6pR/nH0V491TuqYa4fSHv4hJyJvTOgg4IG3?=
 =?us-ascii?Q?bmRMxCiREGFL4rthcvYzE0eX3egufInGOKXDUrLk659l5i08i0QQQvVXiV2z?=
 =?us-ascii?Q?JVbj+zG/soiuEPQXkEcZu/va9C5ZlH5JouNVVMzF2TRPTiUGK/1qXipd5+RZ?=
 =?us-ascii?Q?ZIs/gUqDRmWRr2qeSUZHY+xty6f102Om/KTO+8PGX3bn8GNn1N/QuUqitbDO?=
 =?us-ascii?Q?roV3FvgGXk3YtLTrA1pmHaiNs4GZWtqmfuX5/lHWbVaPSI6gT81ed4Ad+Mff?=
 =?us-ascii?Q?2TxC/59CczClzJ3vX8IODdg5hNYnMERrgfguOFO20byIEqcgF7s9RgMsm+cl?=
 =?us-ascii?Q?6BHMcJfxi/y4gYF58pPIQILWmAg3bDeZNW5Vpaa0L9oIiAQW8ZqCBd9zEF4D?=
 =?us-ascii?Q?CYN+ufXcOhL8FxIt9dVKAqTnzQq96/XpRMkLHM0pu5Kv6o/2vKb1icgOCOH9?=
 =?us-ascii?Q?ySPwUyPD2AMwrrNlt6sjpu66bLSjS/9CitrwXAG2+0qXw0hW71QXcKWr+gn/?=
 =?us-ascii?Q?QFh+Pz/abZynYKxCgdDVl18cWaIBFpa6Oi6ItLGOfbqvyNM0i7+8QOJkon+Z?=
 =?us-ascii?Q?NmrNF0eBRCXcPj8/tJSjJvYshJgE7eXf2Cb/zMdMhIOcczBGYKW7RZ5/qSW1?=
 =?us-ascii?Q?Ead0hOB9LWF//njxwWC2rhyy6+K5qOcPJ8OTQFLqreJae3tNj7gp+kDVEMbP?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: cOZl24lr5aUAo2zVg0aUVESycthes6Mu9Aqv8iJoj1qhUEk23kweYoT2PDyRFO/u0qpShg/JvKj6/+yw30eJ4kKZzHeZJfKmjdpnfrAX5HdM02aviNX8HOoy+sM2E0o65h2tNM3Wphzh4naPTLK3wN0kh3phpAfcltMKWN6TCotG84qpPX+xcwlNtq0kgW+G4hbtazhE+IXa9Hyg1QiWdEV/AKPwtlj5AdEKNFBDd0LVBb2LPHV/Q/2AInoTw25uu3IoBh0oI3i6l1XMbtdKjKv4DYatVpJDTtAcosePi/husnGhFvX6gOnN0/sk69hdUuzULcRFiqvUGuO3Bk/ZTmT42l4qX6DpT+BbqU55DjuglWjGvqjfepmipu/pr1tatTpFuFSr99qWiOmi1ReQzRyuqUYI93D3Z1MlFn1G5HXaFAonQsh9gasdEttvTG6wCaBtF7c2uITdB1WQDMtFz6epVSYLAUk9VQb76IVqO1nMuQof23DsSuvVRt0ARY2/S+HJrnu2gHl6swFYoeqKoRYRM/3/yPTTIdB1ukZIHmwZgeq5MWCaCfIykEkUghyZlhRxWNegeFH1H3l51Z7G6mCa3UelDrU6IRvAByq+TNE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ffcee3-8cc1-4a22-7366-08dd46c3a7a3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:33:50.3409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/Nt7FNzYwcxDUMgUVBrMbeY4B2RocJRWEcFoMBPF7LjAYhQ+ppDsMaCB2LQqZTCj4hunCjsDqls8sETmg8CnevtihtyftlxV7vCxcUzUh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7417
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2502060127
X-Proofpoint-GUID: ng1nTYkb2Sar771RwoLtdz1P6ELpkTYc
X-Proofpoint-ORIG-GUID: ng1nTYkb2Sar771RwoLtdz1P6ELpkTYc
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
index 7825707929d8..52f98f6ccb56 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2751,35 +2751,37 @@ static void rmap_walk_anon(struct folio *folio,
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
@@ -2794,8 +2796,7 @@ static void rmap_walk_file(struct folio *folio,
 lookup:
 	vma_interval_tree_foreach(vma, &mapping->i_mmap,
 			pgoff_start, pgoff_end) {
-		unsigned long address = vma_address(vma, pgoff_start,
-			       folio_nr_pages(folio));
+		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
 
 		VM_BUG_ON_VMA(address == -EFAULT, vma);
 		cond_resched();
@@ -2808,12 +2809,38 @@ static void rmap_walk_file(struct folio *folio,
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

