Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46555C363BD
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 16:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B7810E76B;
	Wed,  5 Nov 2025 15:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHMHCvYa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50BEC10E06F;
 Wed,  5 Nov 2025 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762355455; x=1793891455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+NhxtylLy7TfnzanuboPshugMKe4FqSCsalNbdreIz0=;
 b=GHMHCvYaTYn6YHI3dIp5tAaergq8UI3NhyfICkCc4ObTKhIgDTk8coCi
 RCfsCm+uS6d9cUWCKfARfxrD82EuJCkfvE0NOyamZyx20S727H3licoJy
 tBh5pbIpyWIxQMmXxd6RKLxNbVbPmNrrEXPiFYUP1jlY0twx8ynokWICm
 +nBJBHbTp2d9f43EA/3ra8kiR4vbHus0BkW0Vm/N8C4pJPxVQIFEkf6tJ
 PWXYo4rf0YX4hKmcnVVwlEAcs+QDAq2IZNj69lHH/OXOtm5tSsadonYId
 LXk43epoLnnye1NBj82Ng02rccLRJQEDVNXffifFXSvYGYnODGRxIZhWk g==;
X-CSE-ConnectionGUID: jyjiu4nzTjKuJY8WpT57YA==
X-CSE-MsgGUID: mGRfz2z2Qqa2lapylTh7ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="63482474"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="63482474"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:10:55 -0800
X-CSE-ConnectionGUID: BRUm7Y5WRe+J8ODgnwcHmg==
X-CSE-MsgGUID: 9pJNtuo/SCmuy7IwyKUTNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; d="scan'208";a="187173847"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 07:10:55 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:10:54 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 07:10:54 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.11) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 07:10:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=da0l64CUyGzET704lzNLCoJkxSHS8R0RFdf6rtumF8URSSRJpoaKhblUWKPpipLr/5BB6Gb1IwQgTOtTRnXXoy1QU9WQ8CCM7tuhZy88dlbuAI0IcDxO4ogJI3ylYJ6Wh9/m/H5JOAPPThLu0q+dVgRF7db8qGlbjeLY/i54aS9zEqggRmteE6r/IktbkN0xhvXt7tgvD+BK8AMiHXy4gjswAH6psqrR9nL3poMco/MJufT58AQ9pGdSoWeQUos4yDy+geZvJHl5tMxku/anZ35lUWiMDL+YfGSC532Xd2ZWJUxDb9yXW5wWsdi5WrVzqmufxeNCccswnBWIfYL1NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzzpPRQf/iX0LpgzKSCs2ND/kJqSwgnGmsHsdoLypYY=;
 b=QmZ3zNSktdDYBJ4ipW+NnhcvLki0F+NrAexVvG1txRtFvHsisOynfNfL0uQoieySHen4U4Rl7pd0oKTMpAs3WadHGQ6JhMtPkDOgnNSmukAw3pMaTYIvpDekYo4gZNzdQC36L/qRMWjjlnwIYCV+Rp3I5yRJpQkynMqug6QprMmrLuOJiBRHOyBO99e7fhc+1oj6k20SaXqG9sSMeh73NPbLR/RotYRy3ecKWvlYY/ytl/4q02fjl03ZIQggZQ7RiPtuiK8+MbzHn06yrM4ytSq/E8aGxJbx92bZnvamINhjPky1WbnOqa7R2bCKczK6cdfOhvzn7o1hzHEI8DUwiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.8; Wed, 5 Nov 2025 15:10:49 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9298.007; Wed, 5 Nov 2025
 15:10:49 +0000
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
Subject: [PATCH v4 01/28] drm/xe/pf: Remove GuC version check for migration
 support
Date: Wed, 5 Nov 2025 16:09:59 +0100
Message-ID: <20251105151027.540712-2-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105151027.540712-1-michal.winiarski@intel.com>
References: <20251105151027.540712-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::8) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB8123:EE_
X-MS-Office365-Filtering-Correlation-Id: 081c1065-1a1d-4d25-b1e4-08de1c7d809d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkFqaVY0Z1IwUE5uUVBVN0lwU3JvSENQUHhTT3BCa3NuNTVmektwczFKTXhk?=
 =?utf-8?B?aDlhVldFUU43a3BKOXJWM2lXYVlld25BeGhLWUo0eTRuQkxQYVc5MisvQmxQ?=
 =?utf-8?B?MFNoRnRKVFMvRVBvaDRFbWpDeFN4aHdhRmJ0cVRXT2NpY3lUb2tzSmJwa2J0?=
 =?utf-8?B?dkdQd3VPNmJuOFk1RSs3OHJUR3FTenZ4Y3FibEtlTVRVZ0orVzJzVGRGRjQ3?=
 =?utf-8?B?bzJOMG45dlpDUVR0YVROcTFCNzlOWlFZK0FpVklNUlpnN2g2S0N6OWdpTitz?=
 =?utf-8?B?Smp6MzRuaVVwUFJSQVdLRjIzcjM2d2JxbjdTWFY5dmsrNUZyMFg4Y1Z5Ykxv?=
 =?utf-8?B?K2pEdndwZURRUVNQQnZ5NXVUcy9oRzM2WnlsZ3d3SzU0WDRIaEl0bUsyRExF?=
 =?utf-8?B?eUhSa29ZVHlGLzF2RlpWVm4wVlIzcDVPdzkrUm84a203dTNvTzZKUmhkQ01O?=
 =?utf-8?B?WGV1L1hhVmdJWmlxNUM5eUFkNGpCUzF4K01VV1NjbXlra0VGSnNwOGV2c25v?=
 =?utf-8?B?b2FBdHUvUTF0OUpVMTFoVGJjOW9oSW5QUWczckRvTmMxVG9BYlR2b2pSaDlM?=
 =?utf-8?B?TlhlUTFHOGlPbU16U2Vwc21yc29HN1pVa0ZaTVRUT1RQckFrY3FVWnIwVXlo?=
 =?utf-8?B?Q1B5Q2xYZUV2ZmxlTTBOUDFMTmc5WEQ3NUR4N1NFS2pTZ1dLeHQ2Ym5LMTFW?=
 =?utf-8?B?RU5zZ3BaY1RHM0FFL1VIM1UzdlVidk5lYWJaNlYrR2FYNVQ5MnhYUkdDTE5K?=
 =?utf-8?B?b3E3R0JsVG1HYmx3VyszemNab1Yrd0ZieFF1WThEaTU0TVRHdWx0Q1k4ZWpu?=
 =?utf-8?B?b1RFR0JWNlF4bVVHQmdnVkhCRmVrZGZUNFBCKy9vdFRsVnpOUVE1VjR3bHZa?=
 =?utf-8?B?bEdUNDV2RjZVVUVKemxYdmhZZk40dVFHNmp5b2pFUGZoL2lJVEg3U2grSUNX?=
 =?utf-8?B?VXhNcXQrSy9Jc0h2VEVLbUVRVElGR1NGMDE1bElrRHpxbkN3REVSWkNBeGRp?=
 =?utf-8?B?NUZpOTJVSnZLMXRrMVkzRllybTlVR3R1NURMUVVRYWdrcjJrb3JaK0dIK05Y?=
 =?utf-8?B?ZjVxdkg0MzB0WnEyOHBBUXVldFpXeGRVSXIvSEFBYzVjaUIrUmU5S2xjOGpz?=
 =?utf-8?B?ZmJsTE81MHVnanRjMlNNRkhpMTN4SmhZbVk5N05XYks1eG1zMWczNFBVdXpV?=
 =?utf-8?B?UWR1REVUN1RJVDY0N3plNUdwRXAzNzFKVmlqSVIxRTJaNzJqWXc2dkc1SUIx?=
 =?utf-8?B?ODB6R1lPZXIwbTVtdFJ4VlJidjFNK1MwckN1WUE1VENmQXBxUXlFdk9DRE9E?=
 =?utf-8?B?TmRyeExWaWV5a05UWFZMVDkzUFN2UmpaTThhZDFSaDZyZEt2VHFMVG41WUFm?=
 =?utf-8?B?M2tyT3NlT1lxa3FGbUdqS1VGdTdWWEt4V2JZYmlWdzM3TDE1MzJKNFkzZS9k?=
 =?utf-8?B?cXV2Q0JDRk81cWdlMDIzM3NncVNMZ1N2d3pINis4aVMzRE94aUd4ZXgrS2hs?=
 =?utf-8?B?eCtIZUhnYXRma3kycDVhbjQ5djdFb0VGTk1PdzNXeWFiaUVacjhDUEJ4NWF3?=
 =?utf-8?B?TnNrUVNja21KSmFvWkJ2T3NSQUsvMzdzR1RHSUxQZVljNzZvUTl5bGRKbTQ3?=
 =?utf-8?B?K0UxdHdnQVc2YlFiTkErQ1lwc0JQcUh2aGJZMGhrS0VwdWFxU0JUMzdtZ1dQ?=
 =?utf-8?B?c0lBdmRqMklsODFVUFhxTTNMemxCaWlESWl1QnUwLzB5SGRkVDVac2NSMncy?=
 =?utf-8?B?MTV6TlFDUGhTeVliTndyWEUySXhJUDE2aXBxdnBkM1AvbG1rRWp0QTVMVmtG?=
 =?utf-8?B?dkRnUm5aeDIzNDU5RHZrVi9ObXo4OUJqcHNMZnc0K3hqYTh1YmNuVEtnZXJK?=
 =?utf-8?B?WkxrVm91dHRkczhEWjRtNHVxd21GZXNhOTd2dVpESXRLb2dhOWdoeHlWQTVv?=
 =?utf-8?B?aVE1bDVkWU80TXlrWFZEL3dIYWhvRXA3QkwvaVhxM3QwR1NrakYrbTRRQ3M2?=
 =?utf-8?Q?BP3VS1oGzyHpknc/OiEfbwix4sx2gE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZncrTWRxZmpsWE5wamRyam85NkRPTGh0bDVtTVIzMFN5TWxXMlVnaTNJbndT?=
 =?utf-8?B?RzQwZkVvYjNlOWJiNFcwL25yUTFiazAyQ2lPTEVEY3V6UDV2Yng2Y3lHSmU0?=
 =?utf-8?B?NW1IQU5iMWdhemZJcFlTeUxSM1JJNDBLaWN6UUVzOGlXNGxZckoyRTFOck5h?=
 =?utf-8?B?TnhIL1FKTXBoQlg5emVYSDV6eXk1Sk4zM1FEMFl3QjBIcHhWWjVBWHcxQ242?=
 =?utf-8?B?Q2EwVWwwdHEvdWlobzJ3VjNNdlFkWVNGQU5WUndrbldlai9zUXN5ZlJLZzB6?=
 =?utf-8?B?TEtVYmd6L0JYb1l6R2ZpSG9KWEpIeFl1TkxkSHQ4dUJDVmdZVzNxcURSUE00?=
 =?utf-8?B?NXVVUytUM2RnUnV2aWY5OElWTGdaenRjVUJHVEZXTkYxVE9qUFFJWElPTHpJ?=
 =?utf-8?B?Y2R4Y0d6ZWt6a0ZBVCtCOW1zek1vYXhFT3h1WFJvQldNSmx1RFFkL3JZWXlE?=
 =?utf-8?B?Kzk1N1V4ZHNYMWxyYjBFSGNjaEhtdzNUMHlqM0djVnM3VVVSTkpGMzdzT0RN?=
 =?utf-8?B?M2lrK2NMbDg0c0V6V2tVWEVCRm40NUdRZGkwRE02ZERFMUd1c0RZVHlUQWdN?=
 =?utf-8?B?VTNkQUMrVFFjMlQ1RE5ZY2JmVjZFZHJtZlNYUjJHVEtmbzdTZnBwWG1WZkFX?=
 =?utf-8?B?TXhIa3d0L3lLMExIRGJVL0hEYitQd2RsaUdETXRkSllmOUZJTUJjUjBYMFJL?=
 =?utf-8?B?dzVUZ1d3a2I2WXNJZENHOEg5blUzWjVWYkptU0tFQTZsK2hXYmRWSjd5MkUw?=
 =?utf-8?B?cElMZjI1YTBEV1B4NGllSXpxOXEyUTYrR1hXSnArdmxHOHhTa1QxbmkvTjZU?=
 =?utf-8?B?SVNNR2dGK0ZOVnhnRzBVYTlpcko0WlluUVNLZWR6Q01FS1RYNW9CNFRUWE5W?=
 =?utf-8?B?dHdFNTJ6MUhQdzNlZWhYaTFuZTYzeVFuQ1NaV1dEQk5RSFhqZjlyVmpEYXpR?=
 =?utf-8?B?TDhKRzlyd3VxTnRtTjdZQThMMXl0WkJVTFRwaDJTUGNqR0FBMlh1M05seXhp?=
 =?utf-8?B?M3AvMGd2eXhoMkVpeEdLT0FHRjRBTE9IbExtczBrUHljOWNCR2RYeGtPbFpU?=
 =?utf-8?B?VXNwM2dZRmI1Q2huTTdUMDMxa1MzT01Ib3lWcDlSK0t5dFRYaFZodm92VDIr?=
 =?utf-8?B?ckdZL1FzOHp4MXRpdFZMS3h4c1luV0xFcTdVOXZRaWF5R0k1QjVBUlBpZWI2?=
 =?utf-8?B?SXkxV3kvbGRPa0JsK0ZGZzluRWhMK2xSL1FtQkl4U2w1em14L0x1MnpsdDZS?=
 =?utf-8?B?c0dJNlc2cjJYOW1iTjFQS2N4VG01WTVCUGFlbnZzejBDenlZMDVSR2Nlbys0?=
 =?utf-8?B?R3M5YUlKbXB0OHVkUm1EeFppYkdJQTlOdnFPVjZ4UThqRkRSdUxVLzBlNllq?=
 =?utf-8?B?NWJmamFIc1VlNG5xazJwVjYyd3FxM0xkVDFDSklGY2NyaVBITTFvRUNPM29u?=
 =?utf-8?B?UzVLZVMwQXBhTXZMMGY4WTFwcFdhT0NHRUFWbWYxOG00TjJZTlBhcmFiTnNT?=
 =?utf-8?B?bmh6aUI4YkdYK1ZvU0dodFQrZlRKZlhoSFdpL3dwSTZNM1hOZkFZVEdjYWlS?=
 =?utf-8?B?RGlMZWErb09iL01raHRKMmU4eDRBZW5OMjIvSjk0bXh1UThlTGRMaVczK3pl?=
 =?utf-8?B?MkxudWhVWkNzVjNadkpkbk9qQnF5Q3NBYk4yN2d2M2MwUkQ0OER4d1NEbkhB?=
 =?utf-8?B?RnE4ZFBzbDhXN1NRTjkzVkxqQ2Fmc090L2U0MG1lTUR1QnhzZTNkc0lhaXNu?=
 =?utf-8?B?ZVZaZVBVOTR6WjFsS1FyVkVtQmJRT2YzZFhKRU1ScS9yNGdxSDlTTmZ6clVt?=
 =?utf-8?B?MVJsZUk0U1lXZlo3Z1UzL015NTFndC8vWWJHVHAyWWNWc29lZmpSUjlXbzl0?=
 =?utf-8?B?VFBoNTdBbzFVZnBobjE5T0FUNVJkbStlcVR3SENuK0l6VXQ0dVFLaTlEcCtY?=
 =?utf-8?B?UkwwbnJzelRCMnNLVlI3cFBOUzJwVUNxWks2bEJHRUxiWnR5T29BT1pVa1g2?=
 =?utf-8?B?WE16eUMrdmVoT3E5bDAxaHpZUFVod1pKSHN0aG9qNkI2UFY0U2Z2eENWWGR1?=
 =?utf-8?B?aXNFN3NWTy9QeHlNbmlCbzZwSktxcUNYQzBZQWFkdG4yMmZsKzYrdElXVFNl?=
 =?utf-8?B?ZVJ2cC9Bc1UzOXFlWkFkNjBObk9Rb293Rlp6VERJNHRWdW9vVXUvOXhxL3Vu?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 081c1065-1a1d-4d25-b1e4-08de1c7d809d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:10:49.0905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LiObCwQuAA3fqpmbYHNE8Ab2X4+NQ34dYwV9mdZ4lOMUWo2v2NmbAKLgzvlk1JHuWUluXPisqs11NFPcQ4WsQl+DcQ6TCRClf/j8CEna40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
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

Since commit 4eb0aab6e4434 ("drm/xe/guc: Bump minimum required GuC
version to v70.29.2"), the minimum GuC version required by the driver
is v70.29.2, which should already include everything that we need for
migration.
Remove the version check.

Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
index 44cc612b0a752..a5bf327ef8889 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
@@ -384,9 +384,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
 
 static bool pf_check_migration_support(struct xe_gt *gt)
 {
-	/* GuC 70.25 with save/restore v2 is required */
-	xe_gt_assert(gt, GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 25, 0));
-
 	/* XXX: for now this is for feature enabling only */
 	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
 }
-- 
2.51.2

