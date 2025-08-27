Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB46BB386E6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 17:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD5B10E11B;
	Wed, 27 Aug 2025 15:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icSTNTtB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB6510E11B;
 Wed, 27 Aug 2025 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756309619; x=1787845619;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=ilK7h4iSgCE2hoD2s11nobyszN/2ql0RmOoflia9DhQ=;
 b=icSTNTtBE1wQqB9FNL0lZcvRvVxK+LByC5aVHIQBvRYEluHVc/Z+H4GP
 De2kUCLB2TaQNAj8LTLWJ36a7jOt4samVQebiMqEsE8uoBEfDmFsu2q6o
 k96hfB3pbmNAs0giv3K6xEppCELOIH17dk3UXvCSeishTk2RzoVlj4pIA
 hZY4LtNrASkijf7by6q3UoxmtVaLuiVt3LDYGJ9gcPDSh7ZZ7Tqer47tM
 72ofQx8wrGt2GLEAVALCwSm9TFIQdCQiMkoZBRzo/YlZPvoRL35vfi6KR
 jVkDWuFgrhpyUIbJrUts8YA2CLBaIk14HtKhhzfz0ebWXZ+pFhjex6pxv A==;
X-CSE-ConnectionGUID: hrmov3RjTpiQjF4mOTfUkA==
X-CSE-MsgGUID: tvJzCzDiQ26BTNzAd3X9MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69158687"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="69158687"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 08:46:58 -0700
X-CSE-ConnectionGUID: H2d/z5dLSN6ioRjy5L/G2A==
X-CSE-MsgGUID: FLhS1ACGS6G0l4k3d504VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170698371"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 08:46:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 08:46:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 08:46:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.58)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 08:46:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3i7QFKXUyNbAMMcnVGWHyOQ8K2TG8sT8bFaqIgMrMwfmaDVdRLhIkkYY65R9cN/faeW1/COLKZCCNTcWJMI+yyrZV+3HqWkuDNGGjhuIjJn1ZpjR6QWgAkBUIx1M0KS5E18o+DU2+bZF3bZMwzZ9NLDc3X6cJFJl1/NirZXY/+CCJ0DeKOIxs9vooMq4CpxM1Me8lmbYWHWr8q+0287rOnwi2+zKYPbE9CuLAi6MrQ2gsdVuOv3RTdI9uGOnxl7R/yEU4dxwftO+zaGrCyWeTpjJAgQMpmc1xoSr42BP9GeKML47UpUh4uLG9ju3tXQEcPQXWtP26cdCdzSEDk7Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsiLhsExqK6kqTJsV5FNTSJJJimfcp8pZ7nz2t9nFdE=;
 b=GSUgV5gJwWPLMomz68yFTSIfEKsoaGST2GWdUEkCbq1RvxQoxAe+6E0Pihcn5C6M82xx+/ojAoBpUqa1qfY3PqfW5lV0IstzWU9fSudGQ/MHPMZngwADK7MbyEvuVO6qc7SjPpr/clYHBaUg450p/aklHEEn8w6smvQVHZY/QARQ66YakYddedrtAGtzQG51jOnt047Wx/8Agou1ZvDvbXAvAfEbQyspdOhl3dWInF/McSQRyVo+uqu7Yx7g1aZMeBAHFUzZOvKEDnUNFVF57bNLrewlx7k3RNP2KQ6KYi6Etvhf6BDCu6zHB0jrJ54aPwdedcwpa5zbiR55B+aGsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB5909.namprd11.prod.outlook.com (2603:10b6:303:168::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Wed, 27 Aug
 2025 15:46:56 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9052.013; Wed, 27 Aug 2025
 15:46:56 +0000
Date: Wed, 27 Aug 2025 11:46:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-fixes
Message-ID: <aK8oalcIU-zQOfws@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::19) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB5909:EE_
X-MS-Office365-Filtering-Correlation-Id: d38a24b0-1714-4043-d8a8-08dde580f353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmVTRWlPWVpiVWcyQlJ5dzJBV2Evb2gzTHdveVpWSFZSYmtkeTh4b2dWYXpi?=
 =?utf-8?B?RVBjc1dCS1pYdTh2SHBScXJqU1dpRVFxZFNlUVROck9NK0hybExPNHNwRG5L?=
 =?utf-8?B?WkJtcDlxeCt4Vzd5MmRxRzV6OEVvanlYV0pMLzZsTGRKU2FIWWhIRU1xL3NN?=
 =?utf-8?B?QlcvWXVjYlBMbVBmb2NTWGVxWmZiSjRkVHhOWW80SXRPZTdLcVc5elIxR2Er?=
 =?utf-8?B?TjYwbVZZaWh5RE9iSXJVNzlZTTM3QlJGeVBLd0t0Rld6WVlMeCtOOW9MaXJL?=
 =?utf-8?B?eEprTktkbGU1TGZ1eERWNkhYMHhTRlluOWxRNnorSkV6K0ROZE1hbE5lSENl?=
 =?utf-8?B?Vk9KakFueTBMV1VKeURhakI5SjNSa2xSakRiRlRQSE5BTVBXdnBYYk1BZ0Zx?=
 =?utf-8?B?UW9TeFN5TURqYUx6bDRMMjhkUW9xblpoTTlqTlRCNVJZc0FwWW5xTmZvL3VP?=
 =?utf-8?B?K2N2UnVWU1BFVy9UQ0M3QXFmK3c4UTVIOGhRTy96aCtBcG9UdGNIcHR5Umph?=
 =?utf-8?B?cm03ZTFJYk4zdERLcGRGRDR0VFN1L2ltYlpFcXpCWUZsazRmSFZMVUNCRndR?=
 =?utf-8?B?eFJKaTJUY29tWlZSelpsTFFMY1FFb2ZxNWt1bzlWVFoxTU9pSDk2Q2h2UWdu?=
 =?utf-8?B?b2xlblF1RWs2RDk0OEQ3YkNMbmpTaE1QRmNMTTM2Z01kQmtlc2pNcENCNm9n?=
 =?utf-8?B?TGtMZlFRVGJqdzZUZko2cmpTSWc1QVZYZ3dpVmxCQXc5M09vaml6UklQNFls?=
 =?utf-8?B?QkJFSUh0WVZEN0E1eEs5dzN2dDJXMEo1ZTFiZkdmSENSSE1OQUozN3BzNGR2?=
 =?utf-8?B?ekdJbDZReHRFSWFEWjNtbXVzZUp3djZSdk54RXJXT0Q1dXdkQWNMYXNHVWp5?=
 =?utf-8?B?dFpyNjFvVGFFOTZGQkI4dnM1VlUrYm5TUFdGSWRvRm83M2VFektvSTZ2VytK?=
 =?utf-8?B?bzdoQitpNzNNV3VaZmlyQXBoS3VPQUZNNWVuTlpYckkybGkyZWpzd2Q4NHg3?=
 =?utf-8?B?QldSMUttbmpTeFVIYzEvdVdCM3doOTZXaFZWdmxSb0VWMWdzTExjeC9FNHpH?=
 =?utf-8?B?V3lFSURVdjdQN2QzK2lGTGtaVEZYRk85Z2dRa2ozMkZOV201NFYrZWhucERY?=
 =?utf-8?B?RmVLZnF0U0VGMmM1LzZ3M1ZlMzRJK3ZQTGw2YXFmRlNzaEFNd3haSW1tOEVD?=
 =?utf-8?B?dk9Db1dnS3JwOUU5N1lodU9xTWYrL2JCcEVISSt3N1JoZzVUaVpsVVlFbGpU?=
 =?utf-8?B?eXNWMFJTeER5a3Q2MWR2dkVnQ3gvS2hYenh5TzkxOE5ZMUsySFgyVUdnUWpT?=
 =?utf-8?B?ZGpFMmh4cURjYmIvbzBHSWQ0bnppbW5PYTlVSDJWRVdHRHUwZjJmeTZTdFUw?=
 =?utf-8?B?WVNDRFhzcnlSM3JpeFJpdHRRTzZFVnQ1SUMxVi9YWjFOV0djRk9ZNlkzU0Q0?=
 =?utf-8?B?QjdPOERiYzhVa2RiQi83c1E5cDNDOFdBcnczYTgrMjFOME1TMkUzV3hMbWFE?=
 =?utf-8?B?NkRScWVPMFEyT1d5aWtDdG0wbk5haFRsV21DSmtMWWlVUFZRN3lDUFVUMGlI?=
 =?utf-8?B?N3lrbStWeXkvQlBMaHZTK0N5SmxXUEF5ZVdycXBIakRpTmI3UmZ1YXh6bjNk?=
 =?utf-8?B?clJ6R01MUHlLY1M1TFZmM0N2VGJNS1ZBMzM5UExWeHU2V05VOVVuVTAzR2FY?=
 =?utf-8?B?NGNnMHlncURsbGh3NG1WcTMweHd1Z0dUV1FmSENuSFQrc0hGbXZJWkpKUTZN?=
 =?utf-8?B?SWVPM2NFQXBMa3gvRGVvNGVJOGsvaVZQT1cza1c1ODRxYVVzU3lUdDBqU1p4?=
 =?utf-8?Q?pvrjj6j4sD2g5EnpYT/2F4z+3rlt8HN+8Qzfo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkZES1dPRHlIOXlIVG5ESGVUUjB3WXY0MThIWHlpQUxmNmZEaVRua0M1NXRW?=
 =?utf-8?B?NVVUTGlUN2RqVDVzZDl2RDJWaUZHNGpweUV1ZjFRL1dKZGV6VytHZXJyblJz?=
 =?utf-8?B?MFJLUkxDcTFwRFoxTlhZNitncWY2Z0FraytVdGZ2d1VSclRaOHRTRUdHZHpp?=
 =?utf-8?B?K3p2R2F4d2tDaHVRYldTb0VkdzZPM2tGTHJqdmlmOUhaMjZWZWcrSnhRSm9v?=
 =?utf-8?B?RU42L3pMSXlmaXYrYU1MYmlPV0ttTkpPTVdad0NmSE1NMEtxWHJuZC9TYThM?=
 =?utf-8?B?Y09kTnJLa1I3ZXRVeWZzYzhVd3RiOWNWTmUxY2hlYjdPeTlFQnVvMWhFWVdl?=
 =?utf-8?B?b1FsS1ZjbHUxRGdZaW00cjZqV2VpVVVnTlhZNHRUVkNRRVQ5YmtWR1gvRGYw?=
 =?utf-8?B?S3R0ejZ5YnhsQk1ONFlhTnM5L2JpNVQ1Q2Y1WmdCaFc1UnJya2dOOXNmR2wy?=
 =?utf-8?B?YnJEVmpqWVhNZDRTTU9xaU5QNXV0Y1UxbnZDVElIYjM5WmlaOHBGY2Q3d20x?=
 =?utf-8?B?Vmk0NTk2eFg0ZEl5UG1HQStIQmFGazVqYTkvWTNscHVFRUVwVHpPOXFuTE14?=
 =?utf-8?B?MWsrS0hQUUE0Z2lZcVE5K1pST2NYSWNlRWpwQTZBUzJqZ1RSd1RwN00rVFBN?=
 =?utf-8?B?QXo2ZnlVOENIbUIrOVp5RUdxZFpzMFVQYzhmOWd1cWpGQ3p6WFNnSzRtOXFx?=
 =?utf-8?B?UDdNcHhpY2Nwb0dQK1dlMy81U2FjSVlpSVV0L21CZEZFZVBSalBkaHZKNFNE?=
 =?utf-8?B?cXBlM1hNRDZLTmRHNzNqVEVkcjh3SEVqcTBBNUV4a01sZ3JVT2lOT1pDYTls?=
 =?utf-8?B?TThPemFxZFhYemR3L1d2UXd4REFSKzJyTWdwTTFUZC9EckdFTXYxUWduYlJn?=
 =?utf-8?B?MmZDWWg0czBKMjJCbmNmTjJYelZsQisva0RpL3I5NDVZb1hlSGhRVEp1Nzk0?=
 =?utf-8?B?MU9jeUN3bHY2N3o0dVFGYjVROTBUTXU2Q0cyRlQ5bzM3c1JVRkEwckdOL1Ji?=
 =?utf-8?B?QzYwMmY5RUNUYUVqMVBTOFlEUndkdm1IRXpnbnUvL3lKekozb0JPVDM0ZWF2?=
 =?utf-8?B?dkZnZWJ3b3dFdUtnS1FvM1FJVUZKZFBDUnNNbVRyNFE3L0tOQ0xuYmdBclYr?=
 =?utf-8?B?dlluKzgrWGh1Tis3T1VjWjNHWmVuMkFaNHVKNjZDTkJpVUR2UFBRc0poVW1Z?=
 =?utf-8?B?ZnhJT1JUTFZUMzc2QVhRNUZLTjVZc3NNUUNJVEZOWWVjKzM4RkRHdVoyY3lj?=
 =?utf-8?B?N1FnVGhyQkFvdVVueGIwc1hnRHlvaU1YZERvUUtFd0tkUG5XempramRVS3Uy?=
 =?utf-8?B?a2dSWnRwZFpVTlNsMDR0RmFJdGxoRkF2eGNqczMySXhiOFc3TkxqbjUwTW96?=
 =?utf-8?B?ZjV6Q0tkcE55dEY1Wkd6bVBHWCt5SUVTeHNYYVpHNk1rc1g0UHRDcC9HK2tm?=
 =?utf-8?B?OFB0UEMxL1VLcHZaeDhyRi9kS3JrNWs0L3Zlc3ZWeVhxQUFXbGRFOURvejJE?=
 =?utf-8?B?N3AxdXZTcTJ3a0pXd3czWXBqU1hDSWs5VUtEa2I3bzRZcEpwRHZNejNuc3Qy?=
 =?utf-8?B?ZUJIYVEvSE41SjFqNXhqbHJVUUthUWNvaWMrd21vZm5ZQTNrVGhYTWR4TVBI?=
 =?utf-8?B?VkFyZmUrLzFSV1dHaXl5RE9ILzhjL05SZ0RQL2dZYm92bUFZYVVlMHVoRFBB?=
 =?utf-8?B?SkI1TzJEc0hRcnRQY25IbWIxaG1teHo4cWJzYU1UdUVSdGJ1ak5UUEpqaWxJ?=
 =?utf-8?B?dFB2YmpTcFFLU1J5OExaemJBdExBMm5DaTlIWW5pVDJZUU5wMVYzQmJtRVYy?=
 =?utf-8?B?VThGSzFIY1VSNGdEVEtRcTdzSmp3T1JneUlBREZjajB6cW9BWmhXb0VXUUJr?=
 =?utf-8?B?dWZhcngzR1NWam9Scy9Xa25mTmFBUEZFalVnbndZeThpSUd0N09Uc1pDaXZK?=
 =?utf-8?B?UkhOOHd5QTR6eldyRmtaR1RGOE1pNzI5bWFmV2QyalpUSStKdTdJVWJTb250?=
 =?utf-8?B?RmxPWnRQaGFSSU1uZHpZTVNaNWZHeEtzTUVCUGZaTWFUOVdHcGlzOVdWWCt1?=
 =?utf-8?B?cC9IMWpZUUJSL3hESlNNYm5FeGp0MUlqTW42SkRDZ1ZHRFExdU0zMHdnQTFO?=
 =?utf-8?Q?k/uXOPPHCuRd+DRgLb9TIyweB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d38a24b0-1714-4043-d8a8-08dde580f353
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 15:46:55.9965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tmJd4XwGuCyN7JitRNH0acRnME2WhpIsCCJerBKhLg3TzNO3X/oXDFZ1p+mdckc+iHZcAGLCS6ypwAyDlWUAcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5909
X-OriginatorOrg: intel.com
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

Hi Dave and Sima,

Here goes our drm-xe-fixes targeting v6.17-rc4.

Thanks,
Rodrigo.

drm-xe-fixes-2025-08-27:
- Fix user-fence race issue (Zbigniew)
- Couple xe_vm fixes (Thomas)
- Don't trigger rebind on initial dma-buf validation (Brost)
- Fix a build issue related to basename() posix vs gnu discrepancy (Carlos)
The following changes since commit 1b237f190eb3d36f52dffe07a40b5eb210280e00:

  Linux 6.17-rc3 (2025-08-24 12:04:12 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-fixes-2025-08-27

for you to fetch changes up to 75671d90fde8c78e940e15a1366a50ece56c6b69:

  drm/xe: switch to local xbasename() helper (2025-08-26 10:12:11 -0400)

----------------------------------------------------------------
- Fix user-fence race issue (Zbigniew)
- Couple xe_vm fixes (Thomas)
- Don't trigger rebind on initial dma-buf validation (Brost)
- Fix a build issue related to basename() posix vs gnu discrepancy (Carlos)

----------------------------------------------------------------
Carlos Llamas (1):
      drm/xe: switch to local xbasename() helper

Matthew Brost (1):
      drm/xe: Don't trigger rebind on initial dma-buf validation

Thomas Hellström (2):
      drm/xe/vm: Don't pin the vm_resv during validation
      drm/xe/vm: Clear the scratch_pt pointer on error

Zbigniew Kempczyński (1):
      drm/xe/xe_sync: avoid race during ufence signaling

 drivers/gpu/drm/xe/xe_bo.c         |  8 ++++----
 drivers/gpu/drm/xe/xe_gen_wa_oob.c | 10 +++++++++-
 drivers/gpu/drm/xe/xe_sync.c       |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         |  8 ++++++--
 drivers/gpu/drm/xe/xe_vm.h         | 15 ++-------------
 5 files changed, 22 insertions(+), 21 deletions(-)
