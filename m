Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A956FC3642C
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D6910E76F;
	Wed,  5 Nov 2025 15:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5i72wDe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B5F10E76F;
 Wed,  5 Nov 2025 15:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355601; x=1793891601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=aYRB8q9cDvkTpx3HEHi7osef/GTyXrOsLah1jLPjpE0=;
 b=l5i72wDeV7+3v0s+miiNin6d9IPH7Ycp1NCv9GXiK4YBFt45o0oB3+xn
 rSfLUm0rxRuBXE0ewf70RRmu6EjiyHOAniYHlgWFdIki5OF6HzboeQmsv
 VssR612QQg/8A330QZokUoRcvB6bgP2znaUYJD1jmQVZxfB1fYCROUMUA
 N2ij9bdfSmaXCzr/RS43HqGrld9KB30aEVfK2yQWr5tSi2FG3jupuR+fs
 saWPFwylgWIOO4SFp03tJiV6AQE9VMaXuP9Q8kATkpn/97glPYV56NX0g
 yJ8QKA9mIzobvPBPvLWo1wwn91diTJXXjl2FcWTJiCeG5FtVI8ZGK+dGz w==;
X-CSE-ConnectionGUID: 6UC4eFamSNukiCFFhljdDQ==
X-CSE-MsgGUID: MO3aZlJZTiWWEMyPcXCAnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75824258"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="75824258"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:13:21 -0800
X-CSE-ConnectionGUID: UW9ZVFjGStuiI8IkOzz4kw==
X-CSE-MsgGUID: mC01DHJuSFydvPTxgrZh4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="210957474"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:13:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:13:17 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:13:17 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:13:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GPMSOl6S5MWQFVEj1MiNgAq4OW0t+lxyc/pncVPU38sIYGmF+yRAoRlOltN+kVYQskoX97JvdSNnaZqL07Zf03U2S2fRXVIMAoD8pej8ptzBBKUHUrhuA8VGT2P3x7m/NMtux54bngOp3uE9WZ/6pDXeLp0apKhADrKYqOJscE7SQaj8sAfY9Rle7zw6pER8eqzyizABxQJJfRASW8CTZ9ypv228fMpQUpnGgSlRwOnOG/zoaNMSOy+V5Q4z2G6e6R4lUMf+JA8i/kJbcNXcYImGkQXb1LvJWEgzK8AaGLgyYmXQiv7jd0eOy02XN7zrl7iwD9wD5Rl2eoLxGUs2OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hD4orHszqknZlmgZMJB6uq21LicRPMAMO+CE1Toh4cI=;
 b=DelFyJ0NI4dZo82EpkR+MupTPH5d8OfgPhB7zgqwlyIF/YvKXS8p+MkctV0Ol3xWTfiboJEJaDrCnPG7pF4D/1x1qGA6wUpTyeN9144K7GI1QvySWQOOnCC39Ef+jMYEUbyHz7TYPPRvmOfroRB1m7QwHelt3J2OKSNEagk7eFP+csTukY2svlSELo0CKshDG3RgMp5GgssqbBet02v2cSsEK1ofP8sZEaMNm5JwIb94NmxDx22jZc9JPTUrOFb6h+VTRbvW1rH/as2ITh2HLc6wpOuz1xJLRs97ApkWpYSANfZpukjf9tMiu7VL7Y7iTbKxrBAsTqBnWkkbYOQQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB8038.namprd11.prod.outlook.com (2603:10b6:510:25e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 15:13:09 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:13:09 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: Alex Williamson <alex@shazbot.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum <skolothumtho@nvidia.com>,
 <intel-xe@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Subject: [PATCH v4 27/28] drm/intel/bmg: Allow device ID usage with
 single-argument macros
Date: Wed, 5 Nov 2025 16:10:25 +0100
Message-ID: <20251105151027.540712-28-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f40a45-4f51-4b95-08a0-08de1c7dd46d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVRuRXIwRUdxMkxHRVRpRW5yazcxQzdNS1lyYldlQTdmZkxkNlBRamZLZU1W?=
 =?utf-8?B?aHFRdkE5WjAzQmpSQU5DU2duSFZCcG5FZzhLeGk2bG9hL1pXNWdiRkJBQjUy?=
 =?utf-8?B?aWpvM2I0WlhDVkNWa3VXTHU3dmJPczFJempkemxDclhkeFM0ci9MVFRSbWhH?=
 =?utf-8?B?Y0xrdHJRcHExZzZaVTNoZS9Fc3crTDRCNEZML1ozdDd6aERtRkcwd3d6VWRz?=
 =?utf-8?B?Smwycjc5K2IyUnA3SHJhY2UyYkwzeCtZMHkvOWtvRFRTWmxWZUFWOUNEc2hr?=
 =?utf-8?B?VHZ1Qnh0dTh6dWtMZzFVTi9SaEV2SVY2V2pkMVYyaXM3a29yOTBSTjJqNFpZ?=
 =?utf-8?B?WVU2RkVHUElWTUorSFRmcDhmS1FSK1p4YXZzWnNhWGdodGdUc3dlYkdBeTBY?=
 =?utf-8?B?NVMwczJuYTdMTS9TUnhzZkIvV0NXZ1p0NFFCUFVYTldpLy9DdkVaK21WYjR6?=
 =?utf-8?B?UXRzZDlZa2QvQmlrTWx5ejBvYmFtazFpRUZWSzh5dHg2MjJKbTMzSkpKZ2Vw?=
 =?utf-8?B?UHNxeXpyU2FPNlZtYXdiVmpGeHkrbVZOVlJrQVl1aEowRWIzMThQSlNQWGw4?=
 =?utf-8?B?d1VlaUNhbVZuSE4wNWUxTEFuMWVLcEhjMFB5SUlmekpsL0NmY0lLYkR5SERY?=
 =?utf-8?B?OTRlTzllWmtaNldtYjZKbTFjSjdObW53QjloOVdlWG5CcVpaSE1OczZtZHZS?=
 =?utf-8?B?U0VUV1BCY1RiODErcjVkRDNpWm1aMmFsN24veGkrZmR4ckR5eWtwQmNhT3Nz?=
 =?utf-8?B?R0EyT05lbW0ybkRUT2hsbHA0SFdaNG9hQ2RzeWQ2RXdUOHdYVjZsSlZFQkRZ?=
 =?utf-8?B?S1pSWndSZFFyZEdwbjJvNTVud2lEc2VxamNMM1pSMExPQVVKSkg5dTJubXB5?=
 =?utf-8?B?QnBZa2FTOHB5ZDV3TXdlYy9GeC9Qcm56WWdjRlhzNG1TRkFLM2M2UUtlTG9N?=
 =?utf-8?B?aVRoeGRac3FzVGlPT2tWNUt2ZU9LbFZXaGNaVUxldFhVTmRNRXh5SU5LWmZI?=
 =?utf-8?B?Nk0vVUg2NmZCbXhFbENzYVZqbXdZUkEyN25hNXlQTkVFQnF1MlBEVytYeWdm?=
 =?utf-8?B?eDNiMUdkS3VpMS9Rb3dEWCtZc0ZSbmFxMjRxRDNaa3hiNW9xam1pTE9DOFdm?=
 =?utf-8?B?dXIrUVNkaTkzRm5xYlNpa1dUWXMyOWVrT3N6STRranZleHdTNmFUWVFDb1NR?=
 =?utf-8?B?KzdFZ3RJWnBweXhIQWoyd1lIUDRsMGwxa0RZcjBra3p4bjAwM2pCVXo2S0xR?=
 =?utf-8?B?cEZ5NktuN0ZBc0JWWlR1Unk1OGU1ZUYwK2tkMll5dC9vbGkzeHd5OU5kaHVm?=
 =?utf-8?B?bU15SGRGTGFhOWpscWJEQlJLNlJ1eHMwY0F3NnkybEROMmw1V3h1b1VvYVAx?=
 =?utf-8?B?d0pDdDc4MUxHQlcyTkNiQTdWaUFxNkxKTmFHa3NzekNIbUJPNlVZVitvTlhF?=
 =?utf-8?B?MkI3dGxsZVVNblQ4UW5wSEFoblluV2JIVW9HcEdGMHJ6TytZVnIyNEtEYytE?=
 =?utf-8?B?MS96aHpLUk56Ky9LRU5MNXN0cnd1YjI1S2pldGVuK0J5ZTlBbkg0WHhjM2pl?=
 =?utf-8?B?ZWtDT0VXV2xKMFlkRVo5dG4zQVV5YTdkQmxYcjN5dDNkU0NhWThCdjhnY0tQ?=
 =?utf-8?B?cVptVWZhN1R3ZERCZ2w2cmpraHE2aEsvNEE0cVFBL3JSMEo4YlJhbWpjcnVL?=
 =?utf-8?B?NERsV2xaMGdNdlV1b0ptUHNTTkgvTDJoaGtJRDF2ekhleWo3OCtzNjBub0g1?=
 =?utf-8?B?Q1JnbjRyK1o3WUo0bW95eWgza1BYVGgvMG5ZbG9WVTZiQUhsRngvdGtxOHNq?=
 =?utf-8?B?NUxaY2l0c20rU0NuZzFadkwwVUk5QkhsSS9GOUFDcm5NbzlxaFpYcWlKdnlJ?=
 =?utf-8?B?azhFbzRNRzFObHpKcEJ2Z3NMbzVKNjFIcS91Y3h5dHhncWdhQTZSVmliYzhi?=
 =?utf-8?B?V2JuYUtQeVJ6MFlITCtCamszM3BqanBvRFE1T0VYK0ZTTXBRMmg4dzZhN2kz?=
 =?utf-8?Q?IHHZlyv9piY0coqjg56Cd+3wQq8w/s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEhtNEpJZXFBNkVXYTZNNExrRCtkUWRVRlhRTzhvNEVFeWlta0diUGlQK2xD?=
 =?utf-8?B?eXlRWk42M0RhdzYrK0NXa0t4UGI0eHVNcThUUXc3MmNLK0pCUE5wSGtVNUxV?=
 =?utf-8?B?eEZoZktKRTM4OW8xcUxaaFRqdm9wdjcwajl6VWRHZG5HemZwVi95eXJyTHJp?=
 =?utf-8?B?N2Fpa1NEUGtjeVVnS2x0dktuc0djSjM4VlNMYno5VXpUdmdIZXFOR3kyUi9C?=
 =?utf-8?B?RWdzNVhGcElWczdVOEJiQTV4RTJreDU1MzcvbklEdjhZSXNyZkc4UWphOVRw?=
 =?utf-8?B?VGI0bXdEZXhsVTZ3d1RUQkF4MC9Uek1yTW9sRmc5NEpJd2I1djA4RmJWNHgr?=
 =?utf-8?B?ZkdSS2N0QUlXVHhDbnAraXZudXUwT3h3dUtYNis3TWk3THpXaHVhSTM3OFpQ?=
 =?utf-8?B?NlJXLy95aUIxcThQL3ZicE9ocVFvYzk3VEp2MXBWKzBmTGJidTltWE1aSmM3?=
 =?utf-8?B?eUNDMlMwRzB0dXJXMXhHMFFJODA2MkJwc1pTa2ZhL21vSGJ2MytTb1lXQ2xJ?=
 =?utf-8?B?U0ZTOC9rZlJVSklSSzhrWVBmQW5wcXFPdkxuVTczOGJEeitWTUJtUXlzcjBT?=
 =?utf-8?B?R24yUlRNT091QU5YRldDM1FIR1QvUXZBb1lDdzE5UmkzOGFveUp2cERqZWhF?=
 =?utf-8?B?Qkc1MjU5N3RnUi9VSjJLUWMvcjFKcUJnWUxNdUQ4SithYmI3b0U4YkJUK1d5?=
 =?utf-8?B?OVppSitVeGhjMUtySU52dzBQOUVBY25yMUczZUxmMi9QR3pTRmFDcm9KeUxJ?=
 =?utf-8?B?VzNCT25wc1l1VDhacmYvWWVIY3VCRTJnUW8zSERUMUQzb0FLMVhCTDl2NWpm?=
 =?utf-8?B?dTM0SEQ4eWxucm9JN01JZlZyV1l6SmMxc1NpanlUMjFKeVNLdEZNRllOcmFL?=
 =?utf-8?B?SDBiUmdleGF2alIycXEvaUU3bk1ISGo3aEE4MWRTOGgxNGVBb3lSenJ0aWd0?=
 =?utf-8?B?ZkUxM1FKS1dwSGdYb3g2c1A4ZCt3UlYySzMrQU52ZjRJZnpnTHdEWWYyVmtQ?=
 =?utf-8?B?VitKaGEwc1dGUkM2RHFuQVFoTDQ0bXJhVVE3ai80angxOWIzcUxqQVZCVUZa?=
 =?utf-8?B?UXJmWVVNS0haRHYrNkhCWjhsSnpIZC9rZGUwd290OEdwaG9jMDBPUWw5R0pi?=
 =?utf-8?B?WUxFUkY5cjRjbnVLRmlQalE3UEJCWkwyTFhyeXRhQVZnUTFURjdvNk1iU1pN?=
 =?utf-8?B?Tm8wRFl5c3VjN2ZUQ2hHR29nc2JvYjFMY2Mwc0FPdk1GV2hzS0xqalVzT1Rs?=
 =?utf-8?B?Z3l2dzU2aGdhT1U4RzVORFE2YkdmSHYzRjkxU1BCRTdQUHBoL0FRczR1YndR?=
 =?utf-8?B?ZllPSkRyTVdiQXBocUEwV1BubTJVWHN4SDJsTGpGK3QzU2pCbDhDODQyUWJn?=
 =?utf-8?B?dmtRL1RrbzBsVUd6UmZLNGhmdXNqVm51dnc0V2hsSG0zWU9NKzFaVkRveU5X?=
 =?utf-8?B?QnJPcEJia2N1cjlQKy8rNHZBRk1LZ2FORVh1cVNLaHNNVFo2WXVKYWZMRFFj?=
 =?utf-8?B?Tmo3WGdOcGRlZWwzUEFqU25MZ0JscGx6VGo3ZThDN1hoNXdGeHdvWW56OVJr?=
 =?utf-8?B?dzJlVnhRblNZK3YwdXd6OTFwWEpnS0N3MUpBa1I4Z3pwbE8vUTZjMGppZHRQ?=
 =?utf-8?B?QjJFZnJqOFVhZGxwd2xPbXBic1hDWjdHdU0wcEVkZU11VXpJSUF0Z29oc2FV?=
 =?utf-8?B?RlM5V0ZjbWVPYlRQaE83d1NwdVZmdmhmaWJYNWNSVFE3elNuVVBuUnlrWWpV?=
 =?utf-8?B?L2FoVEVFZjRoSnZXSG9tenZWZ0VVcGhKMFRuWmZlcVZsMWVwbjZTQlUzOTRw?=
 =?utf-8?B?Z2Fpd0htcUhwY0x6UDRlYUVSV0IrYStueVBISFFaRDVOdVhFdzMyTXBxNjc0?=
 =?utf-8?B?c0wrMytaQUZvT3ZIVXoyOXZQSXpwaSt4bTM4ZEJSS2MvZTFMd2Jkb293N3VR?=
 =?utf-8?B?OHgxODVZczJEZU56V2V5YTZTbEtzVkg0dVJzMDFNOVNUNnl3UFN4bFh3LzhI?=
 =?utf-8?B?QXZQTE9YaU5qanVBbXJTckFiV0xvMUtJK3NTcEdXcDdrZU9FaDRqM2hzc2Fx?=
 =?utf-8?B?ZWxUZVNsOXlQbVJpZkwxajFWamdVQVBwdnAxR2RlQy94ZTdFakplU01FU1Az?=
 =?utf-8?B?SWU5bTZiTDR5L3pmS0FoYlRGT0RYSm1OREtGTnA2T0ltU1FTd3B4bmFld3pN?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f40a45-4f51-4b95-08a0-08de1c7dd46d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:13:09.6154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oXl1KmgjiCNVrRgBf6kak1VSE8xeIpk0sy0cB4JTf6K7TtIXB8PH1NvNLyMDtMec2AuLAD8l6nYLZUiRyS5SV+sqepO9eXiZMmp4hrJYXlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8038
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

When INTEL_BMG_G21_IDS were added as a subplatform, token concatenation
operator usage was omitted, making INTEL_BMG_IDS not usable with
single-argument macros.
Fix that by adding the missing operator.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 include/drm/intel/pciids.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index b258e79b437ac..52520e684ab19 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -861,7 +861,7 @@
 	MACRO__(0xE216, ## __VA_ARGS__)
 
 #define INTEL_BMG_IDS(MACRO__, ...) \
-	INTEL_BMG_G21_IDS(MACRO__, __VA_ARGS__), \
+	INTEL_BMG_G21_IDS(MACRO__, ## __VA_ARGS__), \
 	MACRO__(0xE220, ## __VA_ARGS__), \
 	MACRO__(0xE221, ## __VA_ARGS__), \
 	MACRO__(0xE222, ## __VA_ARGS__), \
-- 
2.51.2

