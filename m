Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4O3jAnlLcmnuiQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 17:08:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F09699B9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 17:08:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D1610EA16;
	Thu, 22 Jan 2026 16:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="M2pgTpGr";
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="dwCeDlFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E7110EA26;
 Thu, 22 Jan 2026 16:08:18 +0000 (UTC)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60MDgK2R460462; Thu, 22 Jan 2026 16:06:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=AqWdNqe6ZKMwUptrEDhlZN4DrFDotmEh5bIisbxVldg=; b=
 M2pgTpGrg+qR+5eHoStPTJ+01zGn22i9TaU74Gfv47KIHMUaj+oov8RLgQiMxkSE
 FOfhfZEqePnjYJRqbJWX++pAK7okjoaoDkQHyqqql78WYaNW+6AhMQQpT3K+wGwp
 +QIdVWRFIHl1UzlJAPULxlpHc3/OuX6PyLEnwUSyveyBg/M9rW8C2H5BpmPdmsGv
 o8WNW9CVJa7ev2QNlz+vJOG0x86g5qE/NC13mhk5ieUFf4Zp8daMHiCzLNFtk2o9
 QDQCtH48GjgiqFw8j34X1iOTnB9lfcmEx+vhERLHMchKDPCfKXRrE4F6lsUNFG67
 GrGaLTI+OsNFr/Sm8d6Yng==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4br1b8g0bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jan 2026 16:06:46 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 60MEgcCJ032257; Thu, 22 Jan 2026 16:06:45 GMT
Received: from bl0pr03cu003.outbound.protection.outlook.com
 (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4br0vgusre-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jan 2026 16:06:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgHiKYp1e590G7yTGSIzCciUIGP8cUK2yveGCGC5fmSwc6TefeKm4taV7D7er/3S/VV2sgKgKLyvA1kVawlRkq6TQnz4ECXjzSwjpS/eXgJ1FFgutDi6t+wJM6ZhCP6AWRSBE5l1pqgKNZjv2jIEfjKifAFeXQjQY6CDO5DgajCljPfdsd8B8/AlIZNfhJAH+W8egpuho6ptA4uoQHvbY+J7DOTFHqbtNJ5o9hllrVVW2ELsru2Z5uAuJz5xXxlSVN1oiqsMgnm2lRV53ytZ2W29M2gNlqmpSYHOMjxMWfnMmIO4R/+v1iuhy/Zq4IfrAdEzesrZl4txPDvzagvhMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqWdNqe6ZKMwUptrEDhlZN4DrFDotmEh5bIisbxVldg=;
 b=qwNsCw79FIdhAbjnRrL1Nu7mt55VZwzV19NMbhZrqVfZQLu26iiQ381XMS8C6AqUSdz3Dp1umY7mfn6WU/SyIHlSsTGor+WOu0DWAemxb7bR1bpPASUsjY6lFNQBeDcVCFQ3pIPnEU90wx6XEQGWmlS5H2n0eJHXjRwmUKTOo5rGtdtBDeciGn/x4O5SDOhkDu+Cbs2lnQ/Oajfk6K8fww80NveHfbKZ011xELg7onOUT3n4/Th29QaEFWTZKWYhm3FwNaoC08N+IUDxKbhhaA2MHqkaX0n7IfXSENSrUg/l5pYZGD0VlOxCLoCGf+MiwWPmHAVVXFHsyh99jdFwZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqWdNqe6ZKMwUptrEDhlZN4DrFDotmEh5bIisbxVldg=;
 b=dwCeDlFL6Wed7zJ07Z3J1xFsqNJ2PSglKgD3OQu59ml4wyFZMmu9LjbC3gGcJRe1v8EMuZDISqTxhwvDddmspp/eWwMJPZZ9MxrG5N7vR0UOWA/vTniIyKJwmIY0jgtSqmuOGdl77qCniNtHm4yDOI3kxeznrinI89cbgm7wjFg=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by BL3PR10MB6065.namprd10.prod.outlook.com (2603:10b6:208:3b4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 16:06:27 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%6]) with mapi id 15.20.9520.005; Thu, 22 Jan 2026
 16:06:27 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Benjamin LaHaise <bcrl@kvack.org>, Gao Xiang <xiang@kernel.org>,
 Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Sandeep Dhavale <dhavale@google.com>,
 Hongbo Li <lihongbo22@huawei.com>, Chunhai Guo <guochunhai@vivo.com>,
 Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>, Tony Luck <tony.luck@intel.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
 Babu Moger <babu.moger@amd.com>, Carlos Maiolino <cem@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Hugh Dickins <hughd@google.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, David Howells <dhowells@redhat.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E . Hallyn" <serge@hallyn.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-sgx@vger.kernel.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-fsdevel@vger.kernel.org,
 linux-aio@kvack.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-mm@kvack.org, ntfs3@lists.linux.dev,
 devel@lists.orangefs.org, linux-xfs@vger.kernel.org,
 keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH v2 02/13] mm: rename vma_flag_test/set_atomic() to
 vma_test/set_atomic_flag()
Date: Thu, 22 Jan 2026 16:06:11 +0000
Message-ID: <033dcf12e819dee5064582bced9b12ea346d1607.1769097829.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769097829.git.lorenzo.stoakes@oracle.com>
References: <cover.1769097829.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::8) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|BL3PR10MB6065:EE_
X-MS-Office365-Filtering-Correlation-Id: 797048c0-4351-4ddd-df7e-08de59d03290
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OTB9D9XuTm8h6QsgNQnPU/zdnXE0z8QJW1Pd48D2Feq1T/tzo8yXpm1JQWW/?=
 =?us-ascii?Q?VkOpytOS2ZqJcnCsontgzAPvrlyGSMDBNUy6biHxKR+Wb+BbuHiw90DuZFnS?=
 =?us-ascii?Q?rWE8b9ZYyZnvlsOpSzZKL3CbQEHrTuHFB4flgxuIabuDgrr6xmikcTjHDaZc?=
 =?us-ascii?Q?nVFePf8m+iXJC5VY+mpbbh6Qd9hel/0XC+8jk65R+meyoX9zk1xE1tUpj8si?=
 =?us-ascii?Q?V7A9vj+EqN374nInmb6oppE4TNYb/GV6EhGcH6yKNHy/g68BKoEsyurNym/d?=
 =?us-ascii?Q?ntwQ/6iRQObZv5DsYfIoCP91tIAQv/24bGHMYjpGvGw9xgzwE0h7DlEhkHqW?=
 =?us-ascii?Q?1EUSQPOoIVcwQwuU6a8z0odSmpPOww9Z/IqDNABoo47nThKFP902TX26qEok?=
 =?us-ascii?Q?w4Z2A0iktzFnyZaHxrsckfap9I2pNRwZPQe03vu0V8c/ysn0gyzLPFzYDDQR?=
 =?us-ascii?Q?qyCH0sf4hQ0UJ6AyOeeJDJY7HSxNTOgADyDDqtt7yEHN8jBw1y+LVrtt61Sd?=
 =?us-ascii?Q?MZBE9qCwwQNAxzzatImTt/xTVaW74uwwN7L7E/QCeeacw9XTeyJNTKbY2/sj?=
 =?us-ascii?Q?zJjzt9+DgBka6ntR+cvdZ+3SN5PDycAosaz7hhnFnTNbAHsSyLHioQ92t9ai?=
 =?us-ascii?Q?YzD8dG/xmfxZ1SCVUMxp6kee/um40JSPsZkWbR90BKJP5BfO8pSnwgk1VV7H?=
 =?us-ascii?Q?LJhv5+jeJYKTINnBjw0C7FV1T8quZzp/sy1mSVa9Z/M0y3jRuMqqyCL/nEfk?=
 =?us-ascii?Q?Nmd+OlqdDwwYn7gELdtgxxcvwhrcDrdNyccOcz898Dp5cHVfu/9w/Dvby0XV?=
 =?us-ascii?Q?SNKqNzL3DfgS3FoTfnZXnkkC+BKJew/a/zORm0WJXeozWYTgZa2a2HHlmFiu?=
 =?us-ascii?Q?DsUGKulZW/xjOLjRrtWntmn/3QQnF8Xx3quvs+IUzrTXYCvFFPCDuNSVSwk4?=
 =?us-ascii?Q?ehu76PdO81sb6V9EhdQsJD2wBQeMyPK3eNIuxDYFXdDz/mD2VgAhRmL/UgCR?=
 =?us-ascii?Q?CSt9/RsWXqtrxnf72y70MM9lh2iJFbmay4vgq9ELIgmo1Bohxz4gxZQhkUIm?=
 =?us-ascii?Q?zzW7OpwNJVXRcI5oWKhCzbRMT+kki6qWZIRg2+pucqjpjNdToXmmwBbRsCx0?=
 =?us-ascii?Q?50qVI+fpfBI0otDhpZjgpvkLbsH0v/JqcbBvuJj2wFxfcJC3IRtj1Ckfehcz?=
 =?us-ascii?Q?4z/ualZIAq7aJIx9wgHW6Sp+NCEeWQV9nOtiqYzw4AslMz5yTTb0fwM7LeTb?=
 =?us-ascii?Q?RJyia/FPKj4JH3vyUKSj9v9Wa6y3nzdRzvm45Eu42g7y82MbKkcJ2Egvcqai?=
 =?us-ascii?Q?VLJs655Ckju/R63h2F1wC8ykTVf+97se255WHiF4NsEn+587Gte6zaajTHHN?=
 =?us-ascii?Q?ICyPif8IIRnbMFBae+dJ0gM+84cSFE/qGuPq29G40sPVaXO94e4USsC4WdXM?=
 =?us-ascii?Q?rOU4cwsv0t8ejsNiLmgzpguVmqExm1tmY+k7Q64GG06nUyVrFZyjXO3R2XGW?=
 =?us-ascii?Q?3LVkD0u3VSG3vVu0SMzzLNQEUDIgesS7OiqDgqoqA3pH5uj//S+EmTSUYqs5?=
 =?us-ascii?Q?nqXbKd4Rlfa8WJ3efr0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL4PR10MB8229.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IKaNBkHLs7hxug9muHuPLX0wNwAMCYm1GpLdmA6Jdj9TN9AfuiOA4b/e3sk9?=
 =?us-ascii?Q?kTbQcbBgxd73NWOiaBApeyDoxWri9dSBZCh/QLJ8w/hNakBuwNeL+Dk/IJBV?=
 =?us-ascii?Q?kgp5cGcoSza7VtNe2ZSdFKjgNXkVB32U7/KIPjxDkKhEIubGISyNbXqWH4AN?=
 =?us-ascii?Q?ctee6pgE/B7ynGxKq/9qaFVbk+uIkyxai8yEgf2nRmp44lciw3iTEIvZN8nf?=
 =?us-ascii?Q?7iXhy0yA2u6/JQzJy8p8r6yFd54C2dl/01TAoPFRXPaSJZpCo1R5igLy3YTs?=
 =?us-ascii?Q?NazHyprrg8m15NiFEFneKhySvg5UV2mFfspq5jHFTV2iwzX6p5qz2+xyf4R7?=
 =?us-ascii?Q?wYHLygy2E/enrv8oyPMBq7eYwAJKiX7dAz65DQ5eMBtoG5uiMcyCd+hBaiLp?=
 =?us-ascii?Q?dg1aX+y5mEze2AVLQZakgLnq8ETzH1pELtYfWkypQX2BSpeoclK4aC7Lqo1C?=
 =?us-ascii?Q?vLVfNJb/6JVtXWzcDLI1uUghyTxCliHmKv53YS9PklTPw1/Q7RA+NsIsYa1M?=
 =?us-ascii?Q?XN1W8ui+cIyvFeh3UDY1xdGPTS/mjxWk5RN7KsuaPAMdQScF1p1Tbl/Kxnr9?=
 =?us-ascii?Q?UkIR1d+BEC5yj2nixQYTxRtvgd09C0JplsWXJmYwW5SNCcpVge/pl9NnbxFj?=
 =?us-ascii?Q?eo2XAE+oUmuXbyaxFhfvCDzX/1yD+JlyZTFh1Pogio7PBYJ2UD0FX27H7Nf6?=
 =?us-ascii?Q?ySIZdTBUr9Sb28pWP874ApAAfJ+2763x6jVFp/DT2hyRzszricSCLRbsaxrm?=
 =?us-ascii?Q?+MUzyExfMn8vdad8gxzWw5uqsZAgcABn9OcBVnwqBbDmrz0A9vilo9RSkYF2?=
 =?us-ascii?Q?S3LI/S4HSURSoy8jl8v3dLG6M14nR+YprbWYWgl++E5eDZ+SfTAXOAFMJ2PA?=
 =?us-ascii?Q?r48ea3FW5N4ZK66KGh540So/GEnlpi6R77wIKA7M0KKtG3dnXfYczte3I20w?=
 =?us-ascii?Q?K3sOZrGpmC4zH5qD21IcVA5tg8M4xr0zft2Rm0JhMqCTKOPM1Q3Jjoyz5V3y?=
 =?us-ascii?Q?sJ/W0THtdaSZsrb29tTqnqbPkpfITeOUuA08/8rtCYDuGC9A5KsUPl3vKOZg?=
 =?us-ascii?Q?kZQmX1VYpPz/FCiHtkE+vzAD2kwUcS7nzWPwiHgzvhup6vWY6mqgLwAb9a+G?=
 =?us-ascii?Q?dbkA+BHWUqr3VB66pRx2zZAQtjviHNedvjQaRxIHgqOB5ATk6WFVqDD8pNWh?=
 =?us-ascii?Q?Nch6p0oK/BeExdPQ/Zbw3VR9ozsKw9YvDiJGtpUlU2oTdeOsG1+Ul0P+vDes?=
 =?us-ascii?Q?I4aqCz7mPZUblR+qxTSA7rgnmj0iUV87MKPJpfuRLb2r+Wh+GWUNi1oqbmqp?=
 =?us-ascii?Q?UY8byozXsW4SoySjMyM02gX+zSb7f+xL/ySWyA2ynW2nhKkm7lTBVm5qboBo?=
 =?us-ascii?Q?VG6Z6i4w9Kn1728Q8WK9SLQAez66Tjbg5PqhZHAw/IHXIxVs39X/9/By+w/L?=
 =?us-ascii?Q?BrtIet27KFbb9VjRqQdDhWdCRl0ldCSC5wzzb3IU0Wlp1dHCSvkiCEioopCM?=
 =?us-ascii?Q?lP2cKQDNjk8NkMwnPsA3DPHwaeJ6PtT9LTpwZ7flm4hq0Jmo0pf8hMhYsyqd?=
 =?us-ascii?Q?+lv9BODt8PDO/1hVTcDR1SVURhJ5h1cqdqb3iWX3bwyFsz+mVWaE8QNwfJFy?=
 =?us-ascii?Q?GJaWXX0fMsWHEPB+VETF7gikxc4hxGC+FmXDKMDUZ9ODtb4DO7XBfeVY5P7V?=
 =?us-ascii?Q?ZZmmVR96NHdt7/yecc9SktBPd1Y9z7fFBIesgBy+13TU6dt6yaqMV1N1sJN9?=
 =?us-ascii?Q?KqXzA/om/3dPNQ4tOX5TxpQ0UHCxelM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: fqXS4CZecFidNrC95/T4Q/GLKclpzhxUO7ndJ00O2I4A208xvo51wkqyfIdap70l3ZGJkRkpnwpnT261tSz+8C1cGotX1eb9NFutagiPsmJ0b5vhnkFZDdzX+S04PnBy73lsC0HVHAx20Oo9pbQzJw+82CHixkVXdL43hL9nTR63DQwdtRBNqP1Pn5N3VaM6/fnWIH2lb/GIMAJUNRYo6yCVzbbCDcWtPSlIzecvBSEh3pkfonajkEalky6dmeg31qVNShHEe85opyQZPKHtqUbTntBOqAsSoIfwE9QYgZC4pSFEGuNtAVlmTSMPTx+RFKFq5e4Pr3CCrbNm5foS81UUo9POhe3k21LuIx6fMjo8AMkAEgxS5nwKA6qYGIMkSuPHBWJSDd4fA6uwLAsQ+31xjtaTcXR0tjth9RZGPu2PqhfBt9GGTZzQFmNpptKh1RzA17UnvgQ0Z6gi0GkXdrQDtz+Vd+AHV8hka7OQyjoGGNil7IWxYME70opE1Mcs8sLKNN5pI5AHBsPz5BdvqTYG1eLcANCszx3+2dkvxk/SHXtzbD1R/O8lkCfnG2Hzq1gmRd9Rv0zVoRHUhQgCUmcozHrfrEq4xuXfGvKMGcA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 797048c0-4351-4ddd-df7e-08de59d03290
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:06:27.0370 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oi2/ooVBuKYn4W0Mgxn9CQmFXSSp12acwg9tI4j8MESnplfp01ARBjC5OC9hqGJHFxF3+QKIidem79jEPRyoqfr+W7kGN/QJ5y9K8G/m3gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6065
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2601220123
X-Authority-Analysis: v=2.4 cv=WbcBqkhX c=1 sm=1 tr=0 ts=69724b17 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=79C6M4AKyJxmQlF-J2AA:9 cc=ntf awl=host:13644
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyMyBTYWx0ZWRfX8ialYCYToqiO
 SBsPqHPwFdmas4mmG4s6msvYlFSpW4NBzDHEENAJXsZbYhKPnV6/T1eLKl1QL8N+zzMAibapq51
 PSRIiaOzC2NzwK4ARZMvRKkQyevtai4VmnbSJwKOmWPZPfBVM2S3woHvlV3F5Cjr2fWv4Js46Ui
 v1BD9ejLl9vQqea8zzSgFue4mGk8pf3BpOefQvi87aLCuDTKokZaflJMC0188HkcuUUsgMofOJ3
 1QoCMJNQRyaDua2zeZsVMP078gsYKk+J15vXpzU4xw8M9cKSiHEuSFodP7EKQaFFLZLNFRezGC+
 4j6C8SWnCZlb5RFb97xgrYNf4GZSYFbQnH7TLMGJq62t+eDZwCgfDFblaT9bDpPD85eodWZMO1b
 EAdbtFDgF8D7Qn0HJlioI4cnnyPMQhlcFIwMl42w8zUSsgjyNOm13+93Y78ncOKFUi7FwFFgN3w
 DOFi651HOHmD5tcVgUAQNeqvfgckuj7xwloDmrJ4=
X-Proofpoint-ORIG-GUID: 04KnarC-JKFxzHdGBSTxHhbBHKXVYIUs
X-Proofpoint-GUID: 04KnarC-JKFxzHdGBSTxHhbBHKXVYIUs
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[oracle.com,reject];
	R_DKIM_ALLOW(-0.20)[oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,redhat.com,alien8.de,zytor.com,arndb.de,linuxfoundation.org,intel.com,suse.de,gmail.com,ffwll.ch,ursulin.net,amd.com,zeniv.linux.org.uk,suse.cz,kvack.org,linux.alibaba.com,google.com,huawei.com,vivo.com,mit.edu,dilger.ca,linux.dev,paragon-software.com,omnibond.com,arm.com,wdc.com,infradead.org,oracle.com,suse.com,nvidia.com,paul-moore.com,namei.org,hallyn.com,rasmusvillemoes.dk,vger.kernel.org,lists.linux.dev,lists.freedesktop.org,lists.ozlabs.org,lists.orangefs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lorenzo.stoakes@oracle.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[oracle.com:+,oracle.onmicrosoft.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oracle.com:email,oracle.com:dkim,oracle.com:mid,oracle.onmicrosoft.com:dkim];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_GT_50(0.00)[93];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 99F09699B9
X-Rspamd-Action: no action

In order to stay consistent between functions which manipulate a vm_flags_t
argument of the form of vma_flags_...() and those which manipulate a
VMA (in this case the flags field of a VMA), rename
vma_flag_[test/set]_atomic() to vma_[test/set]_atomic_flag().

This lays the groundwork for adding VMA flag manipulation functions in a
subsequent commit.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/mm.h | 13 +++++--------
 mm/khugepaged.c    |  2 +-
 mm/madvise.c       |  2 +-
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 776a7e03f88b..e0d31238097c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -987,8 +987,7 @@ static inline void vm_flags_mod(struct vm_area_struct *vma,
 	__vm_flags_mod(vma, set, clear);
 }
 
-static inline bool __vma_flag_atomic_valid(struct vm_area_struct *vma,
-					   vma_flag_t bit)
+static inline bool __vma_atomic_valid_flag(struct vm_area_struct *vma, vma_flag_t bit)
 {
 	const vm_flags_t mask = BIT((__force int)bit);
 
@@ -1003,13 +1002,12 @@ static inline bool __vma_flag_atomic_valid(struct vm_area_struct *vma,
  * Set VMA flag atomically. Requires only VMA/mmap read lock. Only specific
  * valid flags are allowed to do this.
  */
-static inline void vma_flag_set_atomic(struct vm_area_struct *vma,
-				       vma_flag_t bit)
+static inline void vma_set_atomic_flag(struct vm_area_struct *vma, vma_flag_t bit)
 {
 	unsigned long *bitmap = vma->flags.__vma_flags;
 
 	vma_assert_stabilised(vma);
-	if (__vma_flag_atomic_valid(vma, bit))
+	if (__vma_atomic_valid_flag(vma, bit))
 		set_bit((__force int)bit, bitmap);
 }
 
@@ -1020,10 +1018,9 @@ static inline void vma_flag_set_atomic(struct vm_area_struct *vma,
  * This is necessarily racey, so callers must ensure that serialisation is
  * achieved through some other means, or that races are permissible.
  */
-static inline bool vma_flag_test_atomic(struct vm_area_struct *vma,
-					vma_flag_t bit)
+static inline bool vma_test_atomic_flag(struct vm_area_struct *vma, vma_flag_t bit)
 {
-	if (__vma_flag_atomic_valid(vma, bit))
+	if (__vma_atomic_valid_flag(vma, bit))
 		return test_bit((__force int)bit, &vma->vm_flags);
 
 	return false;
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index fba6aea5bea6..e76f42243534 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1741,7 +1741,7 @@ static bool file_backed_vma_is_retractable(struct vm_area_struct *vma)
 	 * obtained on guard region installation after the flag is set, so this
 	 * check being performed under this lock excludes races.
 	 */
-	if (vma_flag_test_atomic(vma, VMA_MAYBE_GUARD_BIT))
+	if (vma_test_atomic_flag(vma, VMA_MAYBE_GUARD_BIT))
 		return false;
 
 	return true;
diff --git a/mm/madvise.c b/mm/madvise.c
index 1f3040688f04..8debb2d434aa 100644
--- a/mm/madvise.c
+++ b/mm/madvise.c
@@ -1140,7 +1140,7 @@ static long madvise_guard_install(struct madvise_behavior *madv_behavior)
 	 * acquire an mmap/VMA write lock to read it. All remaining readers may
 	 * or may not see the flag set, but we don't care.
 	 */
-	vma_flag_set_atomic(vma, VMA_MAYBE_GUARD_BIT);
+	vma_set_atomic_flag(vma, VMA_MAYBE_GUARD_BIT);
 
 	/*
 	 * If anonymous and we are establishing page tables the VMA ought to
-- 
2.52.0

