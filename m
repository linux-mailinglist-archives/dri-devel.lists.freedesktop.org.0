Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0698A231B3
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2025 17:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B7310E05B;
	Thu, 30 Jan 2025 16:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJDyuszb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF7F10E05B;
 Thu, 30 Jan 2025 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738254231; x=1769790231;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=k4y/XMAx1L7vtK85n02r+CUlGQxpPgookHo13FwVWnI=;
 b=CJDyuszb5apPFGWLYOhXp18LogHJ9I5jI2GuIR/NHE4dEsHifLHDcmiK
 r+nO5f9x2I/q05NFAymLVfBxuh/jmwyTWYxJsBBARQoPdHSMh3/oeRpGl
 P4gPkk4nBjndhG5GjOxYRLnEYYDTYxcN8ZzrMejNPjKGL9+kKl+hMOcNl
 zHIT9hHvC16vro6/Q1cmNgQWMzbUnwiyDauRXE+EZCdhdlxYwjPYF0VNa
 EGpI9KiTspuVV1yjL1NEnyXHHO23d25f5VvECx+OQkZC1qjLeL/HHuYiU
 ZAtt0bZTy0xWW6eIFmnETJTJj6vckeKsX29oQeu1OyvVQUvKP1XngholW g==;
X-CSE-ConnectionGUID: O1pJknZ3Tzazr5ydH7+euA==
X-CSE-MsgGUID: ij+Af5wnRCON+XdGulhIEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50229009"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="50229009"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 08:23:47 -0800
X-CSE-ConnectionGUID: Xfl0EyEcSNan3NjDticmpw==
X-CSE-MsgGUID: xRKwl5dQQGelMQdcpyihvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109221438"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 08:23:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 08:23:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 08:23:46 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 08:23:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENDQowqr/gxdHvDPtATnrgR6qz3BJKbZErY0MsGKsca0i/sF1OZwBAO64EZrXOi91UUsh+KwfPv69yvpm+cmR0fTFfgdypc4RQxk2Fg2TCkhw7gBozTXiXdQakd3EdFi1QxOaC6B82x5wlY6w1Kd1fr6eDTyWgdMRok4C9DMtRlnXk8ShvWq/JkPiBpzL4TgtgLPE3oBI/xpMn1BVibfJblojf4wYot98dswMA6OsyU9Jg/Ihnu06tv+bYj5YBdA67NkiREYcOWap1FKXVLaf59bglPhLg4K6f8RcoOLhB4+augDv/fbvPsfZKhz5pfz7xYi+EmT73imsIwIyh9OEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fw6VvWpKP59Vws/DLzRg2mJpSqA1+xKQPRSfUs2l7mA=;
 b=QzsMenvGwQ1SJkLNBb3StbPZ4u2I2rKz9srtaQ9JvL90l91dR3floS3gf/266JzRPbY5JBQoqmhNM4g+Cf4P40Fg9UFGCEu/JYv23UP7Dk3/boTdfq5T0STSAGU4ft6l3CDDAt5job83VFqVluoUHCvkUC2fpJieRW9dH6IA5zfb75MflaXOA4t/RB+Md/pqHUaXjXxXIBzB0f3mK7YJEd6ffFPpsIYeW7JEVLctx5l9n+RESLaMtcsc8lSS7s9UxqD2mLQB3r4l5QvdG0+GoJUGvwliLeAg6NxTX+wy1aJwiiERrBtmnLvJnzgFzzKOYo3KKNO1qUKiQiF1QZzFiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6475.namprd11.prod.outlook.com (2603:10b6:510:1f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 16:23:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:23:16 +0000
Date: Thu, 30 Jan 2025 08:24:11 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
Subject: Re: [PATCH v4 23/33] drm/xe: Add drm_pagemap ops to SVM
Message-ID: <Z5unq405AHZWGre0@lstrano-desk.jf.intel.com>
References: <20250129195212.745731-1-matthew.brost@intel.com>
 <20250129195212.745731-24-matthew.brost@intel.com>
 <9851fe89-e2f6-4153-bbc0-7e1358155e9d@intel.com>
 <0e325482-ab21-4fac-a916-5809bcc39b40@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e325482-ab21-4fac-a916-5809bcc39b40@intel.com>
X-ClientProxiedBy: MW4PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:303:16d::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6475:EE_
X-MS-Office365-Filtering-Correlation-Id: 439ffc25-3353-4091-b2f1-08dd414a6668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZS9YSFJTNGpDcVB2eE45OUFaUE50cnN6UlhQbjhEWXVyckIxdVJZMU00cjh4?=
 =?utf-8?B?M0lFcFhpMVNmdTdJTTl2dEtUV08rMDdBV0lQcTRlSVRsZWZ3dFQ4dE9kTnQ0?=
 =?utf-8?B?QzU4eWl1aW91KzZOZ1pTVVJNQkF6REoySEJ3QVdKa0FvNnVtTlR2bUZJVFNS?=
 =?utf-8?B?RzhrcWFORDFWdTU1bk0reDhxOG5INk5BOGxZQ01EMVU4UVhIRUpsN2xib1Mz?=
 =?utf-8?B?bUMyaTJHc3NYVGEycjBiTmd5emtJU1hhSUpNSkxRYkNNT0s1L1dDNWNPMDl1?=
 =?utf-8?B?dTRuajk0L0F4WVRqNjd0UmxFeGRUMDFCNnRSMTU2YS9LTStjU1U5NjI4K3RX?=
 =?utf-8?B?NWNLNC9qQlFEdGtsK0tiK24yK1MrVGFIY2VvMHk3b2EvNzE0ZUN4ckU2Y0pX?=
 =?utf-8?B?WkIvVEhPZ0R4TVQyWm5ZNDlYZ0RiMVhLYnJrdFJRV1pxY0RHdDg3a0FBYTdy?=
 =?utf-8?B?RTBreG1QUjBWQkp4ek4yQlA1UjMxMnhWT094Mzk5TnJpaEFYKzRNT0Y2M2t0?=
 =?utf-8?B?TUplK1BvWTlxbldHTDRkSVJ4Ky8zOGRnT3JhdWZvZ0tHeWRPMGJSMjB4MCtv?=
 =?utf-8?B?WHBqVDVDU2NMajkrVDRpWm00OFArRDg1RmttOTVRdi9Xcyt1b3NjUUlHTGxL?=
 =?utf-8?B?Y2hocHh0SXhzZ0xndTlNdHFFQzZyUEZZVDlFQ3VFQlREUE1DVU1GdE42RTBS?=
 =?utf-8?B?NDc5OElPdTNqKytSRzhldFVqNE81MjVEYTFGOFYrL1NJMGllaVBTNmlmY2hD?=
 =?utf-8?B?aGV1eXBTS2lrVm13REF0ZVQzZ0hxSkYvc25qclQrNktkNTJHc29OVy95ckFI?=
 =?utf-8?B?NFhObW1sbXN3N1JwbUlSc3BHR0FFWnpQZHdsaTBRcTBBaU9nRmo3YjdXeHNi?=
 =?utf-8?B?dnVkOG9CSVdDTDRFay9uaVlWbGJVc0NkV0xaZmI0TnJaNFphK1BzZ3Fnc2l3?=
 =?utf-8?B?MUJSYlY0Q3ZHRkJoSkh4T2QrOExscGdUUVR3RlkxRk05aFlWd3lWeVl5OEZI?=
 =?utf-8?B?M3BlK0lTUERCWk9HdkpKU0JZcVNSVHZFUGl2dm1aZlg3TzRLSnppT3dFRThZ?=
 =?utf-8?B?MDBmcUNSRjM0Tlh5SWcxZXA2TTZ5YTdqVjJzS2g1Smc5Mm1ML1dmUHN4Z093?=
 =?utf-8?B?ZWRLSVZ2STBoV1dPQVRwbWJLcGkvRVhSWlhKRFNoRVhsaHMzUE1ZOFhYQUFm?=
 =?utf-8?B?SW85UU53eDJkUjhnUmc1b2VsK2N5bXBuZjEyQnh1M2VHZXFWalV4VDhpOTBs?=
 =?utf-8?B?OGNPUDNRNDhRZkZWaUw4eEkyck4vWTgyVVNDS2M4SDFGb2JBWGsxdGJRNDBp?=
 =?utf-8?B?dGNGeDlTZU9HM2lrckVOcDJuWThtWklYNE05UXdOVkhCWE00YnpHVHd3RlBU?=
 =?utf-8?B?NjFNd1o2MG0wc2JhR1M0aUhONy9xcXdVS1lubzBOYmgwZ2w2UmYyWmV0dXlS?=
 =?utf-8?B?akM0QlZTeVBEcG9QenlkYUdMczBRVHZBZE43dU16dTdyV3hDL0FYUURuNnRq?=
 =?utf-8?B?cFpYT1FWZlBRNzdRUXBxcnQvbzVneXBRZUtMUU1kQlR2NEFjcXNkK2NuVWdL?=
 =?utf-8?B?c05tV00vSmd5VWZ2bGRNeEcyQlFPNnpGNHFtVE0ybjUvUTJkS21NZndkakJR?=
 =?utf-8?B?NU9aRjBtK3hETXRKZWcvcS9QSHZiQkNLWG0wUXliWkhCNG8ybWFRVnJQN2dU?=
 =?utf-8?B?WWJsODV5a0JzeWNSR211QlN5RHdNVlBZR1JBZEU2eE9ta3BLMjVScnpMc2RO?=
 =?utf-8?B?TVM1Mm5uVzAyQ2ZjRmNiSFBia0hRWDFyTnlodlA1Q25ZNEdjTE52bjlaODFG?=
 =?utf-8?B?SjBFWDh5V3ZFUXpXWjJrMkRKaFZYM1FDWjRkdWVDZXZPL3MxbW5rR0ZUYVZp?=
 =?utf-8?Q?TykyyFq6KZK7i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUtRY0tRZE9CY1lLeW5qUDJoMmc0UmNQdGZpbG9tOTgzdTVNcDBvanZ2M1BW?=
 =?utf-8?B?bEhORnVyOVZOeFpwQlFidEVyQk1Cd2NZc1g5azc4dkRFRHJMTDFpWjlFcnJk?=
 =?utf-8?B?ZmdaSzF4aG9tMVhZbzBQK3AycU5tRGhVaTJQd1laSkIyRTdyTktKa1BhSjBL?=
 =?utf-8?B?S2J5WmVJNTB0UVErYWQ2T2RYMWtsQkxIc2M4UENqVVlQZWh0N0Mxb1ZKdjJy?=
 =?utf-8?B?R0ovWDdMSjlIYW1XdUUyZGtCR0RYbDVERDBwSWtHaWFTUXdSVVU3WjJmZmJs?=
 =?utf-8?B?ZllKejhGY1Ruck5HV2pXTEZuem11cEJNZkQydVpESWIyb3FUWFM3Mit2TDJl?=
 =?utf-8?B?R2NPL0dxOGNQcHZGYmVtUExQSkRQWFBxNlQ1dHE4eXFQNWs3V25wZ2lFQmZi?=
 =?utf-8?B?L0FTQmpnVExHS3d1d3kvcU16WHFydzRwVW9HUHUvRnFidjBkaUtXd2Z4c01D?=
 =?utf-8?B?cXRoMVd1VmRmRFBvZmlKMHpyb2dySzdTQ1laeUJRZWpGTEpyYW1WRm1udkZk?=
 =?utf-8?B?bXZBYWdKQUNNbThQZVdBK3NWRnpaa2NHVU9mZmRDSjZhcGErYk40dklFY1k0?=
 =?utf-8?B?cTZHWnBrczhlT2VhVjF4cnhLM0xuWHNyQ0l0cFBhN0hJVFpyaWpqL29KMjk3?=
 =?utf-8?B?Si9ab2xaM2lFRmFPNHd4ek55WU5NbURDaG5WMkhoNDM3Y2Jra0FuRXVYcDBY?=
 =?utf-8?B?Y29pQm1STVZxWnBBY1c3YnZkSVdHdkZoUHdSYkdEeEN5UnNLUTN0MkFmVDFi?=
 =?utf-8?B?QjZnbDkyczNRdmNuanVnYWVyeGdoOVlMZkVyOUcrZUFQNHlSYzU3RThOaG13?=
 =?utf-8?B?bnc2NmQzMC9sQmNZWTFwQWhZeUdteEhRUytSa3NwbEJYVXgrM2ZEUnZBcnBz?=
 =?utf-8?B?REdNZldkTnhZZm1YZG1SaFdpQ243NFZWUTdDMkNIamR4UmhoTzJ1MEZWWjQ3?=
 =?utf-8?B?cVpnT1lKRjNqKzlydmtmQ1oxOTZiQTFlYWJ1TTdaaXFMOXFENW9kSkZJZDNx?=
 =?utf-8?B?a3Z5S3gzajI4S2s0YmZjWFFyc2JqcjZxeHhOOTM1RFFhNUhxaVljRGhUS0Zs?=
 =?utf-8?B?WXRZOVNtK2QvSzJlQmdzWngxQ3hrME5wSEFBV1JDajNjOTNWcXRteEhvVmxL?=
 =?utf-8?B?QmVVaDF2Nk5Gdm0rSHNGUWwvUDhCbGV2WVZkdk1NTjhBRTVwNFR2cG1Objg1?=
 =?utf-8?B?THF2bDB4dTIyQ2dZNXkrRFFjUXdUYmtWUzhERWphdFdlSTMyNU1JaWh0UGtM?=
 =?utf-8?B?UlFKVHNpWUJDc3JWdFh2UWpiM1JPblAyQ05qMGhTZ2xvTEVvYVhCSkVwa3Fp?=
 =?utf-8?B?NnRJUFVSSkpjdWxoNVM2NzdtQm81N05QSzI2NUpYZ1QxRmhyenVtYzVRdi9a?=
 =?utf-8?B?N1h6R2JZdGhpcUF5eVRoMEUvcUZJTjJKbmI2dHJ4ejFwZXlWdUNHZDhUNWJh?=
 =?utf-8?B?WjdLcTJuSkVONnArWFdiZzU5SitWVUFpblJJSGpjdEZPRUlMY3VROWk0YUVV?=
 =?utf-8?B?ZjgxQjBiVlVtR3BDZTJtR20vV2hNVGpqZE1iK0xRSkxUSEtNK20xcFR4Z3hZ?=
 =?utf-8?B?YWRETWFhMU84cXJyWEpJK3JsNnBTcUlXS0cxeHdqUDdteU1Wa2hMdkpmeTZY?=
 =?utf-8?B?R3NkVzczTk1sMkpLMkIrdjVBWEx0aDROL2hPS0FGMGZyRjVFYjB1a2UvM0hF?=
 =?utf-8?B?WWN3Skd1T3JrNy9mREVITU5FL1JZUFplTkZsbUo0MktIdDhCWjZUai9MdWpK?=
 =?utf-8?B?ZXFscW1wWXpGUUwxS1RGWXFoQVpMbVIzU0FpcnNvZWRrUzN1WEs4SU9kMk15?=
 =?utf-8?B?VndQRENXMGVnWndvTWhMNlhxVk03d29IbERqMDhuV1VIL3NITXFFNFdVbmVK?=
 =?utf-8?B?NTY2SzlXRTdCZXRDK2grcjIvcVpvNUp5eDExTkR3RUZDUWlRYWxpUE5HWmJC?=
 =?utf-8?B?UE56UzM3TG12bHRZOHh5V0lLZnh3WXdGQjJEZ3JubmFyZ1BQcDRsck52WWgw?=
 =?utf-8?B?Vk1uN2czQUVXZVBZV0hlN1MyTkJ4TjFjZWVwUUVQN3BiaUdkTFdsSy95NklO?=
 =?utf-8?B?NDViMERJWm5GS3dSUEtITDVFbnI3ZUN5U08zWWZDT2NXVnlNS0JoZWQ5L1ll?=
 =?utf-8?B?WGhhU0FNQ3pydGRwbFVxK1NzVmM3VWFZSHp2V0g4am5DN085d3dxU1k0clE1?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 439ffc25-3353-4091-b2f1-08dd414a6668
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:23:15.9848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kXOecWt79y3uXmyzKfntqy9wyBGQlVgNq9UN9ktgftO5aWbQeu/ustH/VSakhxksJ0RZd2jMGWA04mFR6qpAzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6475
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

On Thu, Jan 30, 2025 at 03:24:13PM +0200, Gwan-gyeong Mun wrote:
> 
> 
> On 1/30/25 12:54 PM, Matthew Auld wrote:
> > On 29/01/2025 19:52, Matthew Brost wrote:
> > > From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > 
> > > Add support for mapping device pages to Xe SVM by attaching drm_pagemap
> > > to a memory region, which is then linked to a GPU SVM devmem allocation.
> > > This enables GPU SVM to derive the device page address.
> > > 
> > > v3:
> > >   - Better commit message (Thomas)
> > >   - New drm_pagemap.h location
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_device_types.h |  6 ++++++
> > >   drivers/gpu/drm/xe/xe_svm.c          | 31 ++++++++++++++++++++++++++++
> > >   2 files changed, 37 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/
> > > xe/xe_device_types.h
> > > index da5bf145324b..eb3702db5c17 100644
> > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > @@ -10,6 +10,7 @@
> > >   #include <drm/drm_device.h>
> > >   #include <drm/drm_file.h>
> > > +#include <drm/drm_pagemap.h>
> > >   #include <drm/ttm/ttm_device.h>
> > >   #include "xe_devcoredump_types.h"
> > > @@ -106,6 +107,11 @@ struct xe_mem_region {
> > >       void __iomem *mapping;
> > >       /** @pagemap: Used to remap device memory as ZONE_DEVICE */
> > >       struct dev_pagemap pagemap;
> > > +    /**
> > > +     * @dpagemap: The struct drm_pagemap of the ZONE_DEVICE memory
> > > +     * pages of this tile.
> > > +     */
> > > +    struct drm_pagemap dpagemap;
> > >       /**
> > >        * @hpa_base: base host physical address
> > >        *
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index 985ac20c5b07..869a155fc9f7 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -450,6 +450,33 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64
> > > start, u64 end)
> > >   }
> > >   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> > > +static struct drm_pagemap_dma_addr
> > > +xe_drm_pagemap_map_dma(struct drm_pagemap *dpagemap,
> > > +               struct device *dev,
> > > +               struct page *page,
> > > +               unsigned int order,
> > > +               enum dma_data_direction dir)
> > > +{
> > > +    struct device *pgmap_dev = dpagemap->dev;
> > > +    enum drm_interconnect_protocol prot;
> > > +    dma_addr_t addr;
> > > +
> > > +    if (pgmap_dev == dev) {
> > > +        addr = xe_mem_region_page_to_dpa(page_to_mr(page), page);
> > > +        prot = XE_INTERCONNECT_VRAM;
> > > +    } else {
> > > +        addr = DMA_MAPPING_ERROR;
> > > +        prot = 0;
> > > +    }
> > > +
> > > +    return drm_pagemap_dma_addr_encode(addr, prot, order, dir);
> > > +}
> > > +
> > > +static const struct drm_pagemap_ops xe_drm_pagemap_ops = {
> > > +    .map_dma = xe_drm_pagemap_map_dma,
> > > +};
> > > +
> > > +>>>>>>> 133db8ade5f0 (drm/xe: Add drm_pagemap ops to SVM)
> > 
> > Some leftover rebase damage here?
> > 

Yep.

> FYI, when applying this series to the latest drm-tip for testing, the line
> did not cause problems for auto-merging on my side. I applied the patch with
> “git am -3 ”.

Patch 29 deletes this line so the series as whole compiles and runs.

Will fixup this patch.

Matt

> > >   /**
> > >    * xe_devm_add: Remap and provide memmap backing for device memory
> > >    * @tile: tile that the memory region belongs to
> > > @@ -482,6 +509,10 @@ int xe_devm_add(struct xe_tile *tile, struct
> > > xe_mem_region *mr)
> > >       mr->pagemap.ops = drm_gpusvm_pagemap_ops_get();
> > >       mr->pagemap.owner = xe_svm_devm_owner(xe);
> > >       addr = devm_memremap_pages(dev, &mr->pagemap);
> > > +
> > > +    mr->dpagemap.dev = dev;
> > > +    mr->dpagemap.ops = &xe_drm_pagemap_ops;
> > > +
> > >       if (IS_ERR(addr)) {
> > >           devm_release_mem_region(dev, res->start, resource_size(res));
> > >           ret = PTR_ERR(addr);
> > 
> 
