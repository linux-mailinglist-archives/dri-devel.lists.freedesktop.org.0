Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B11C260FC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 17:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A9510EBEE;
	Fri, 31 Oct 2025 16:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfK3QMqL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C5C10EBEE;
 Fri, 31 Oct 2025 16:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761927456; x=1793463456;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=igZ2a0HkxK/lS6LsBp3shd+XBApf7tAU/crauz0ys0g=;
 b=GfK3QMqLykf9+o+0+wTD3B8aFfvy0MIRQEfigs9Rp1Z6r8WlnuUbB8XB
 FOdePCCoK3JauDZ1JXfmENdX1VQKZN3jypk3idQ7d261EHN28D6Btm2l8
 2NsmkfhTDx0DiMkg49yDpflufgWZNRpQ2UF2ndZc3KtCrMfpRDCZmuIUX
 OpSxynMTnscDJ7lD21HTuRitx2QDNMVU8NQm7trvCztMVu781WHoInuju
 zj2rAaIbZUit+Hrr4Mp4azfvQ7pVB72nHe/x247b5XefcMcsoe55raHEW
 v2S84SbNQVAGvOYqW6slRZ4sOmfDSzBKOQA7hcfeWr817Cy4qAkuXlmr/ w==;
X-CSE-ConnectionGUID: QUuBMgOnQcatPqHsfeKzQA==
X-CSE-MsgGUID: b4Cx2HMLQLyJJ38/Eaa+Sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="63978802"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="63978802"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:17:36 -0700
X-CSE-ConnectionGUID: 0HAYGqebQKWr1OJeERlaiw==
X-CSE-MsgGUID: GcU3fPpqRPS4n0dSGAhKAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="185935286"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 09:17:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:17:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 09:17:35 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 09:17:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIxEC0hQV9k4OibsFnnr2gPDbmxUkJtchVBO9SRSyv3GxZhaAnX2zznQE0yO47lLEAWG09VMePdQ4DxqSTR8JxRgesDUJKKS/CzZ9LntQm006/Qfqzl/ZH0bBxmbyllaRVgI32Q4f0c/FWcRaDK9Tpt/sYFsu3wa9SIUTr29zjiZupQRE5OHlLDDtJCo+qwHX96QQJu0BFV8neGWaSKSVNQ0vXZpVKn5M4ilBc4KdNOJPKzdhDgmpCyhkQDkDSuPfpyQwJ/yI5JV9I7IbxpOtmUDh5rR8RgfEJsgxEtb19MsxRSwwUMmTePUu2bs0Nty1Y+EnLeDYLhjx2IBUaWfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5iHXjiqYWnTLK9hA1zMHDaGIymrvmSI995zQkZRp/rM=;
 b=Khm5CW42di/nu4dkktsDqQuCOOgHcl24HceyMVdAHjaeQj1pviEfHZZcII2bKR+iV1ySFzn9ABnZ9tf7pDSnlUFhGWYkmjNCq6ubLuJCQD5LGLPFSNok3bRIiUrRFG/pZsb4M55MIsTBk7y24TG3SR/73bA5kFrWO3uCSmVZQ6ag1sEajxlPx0N75DKxkIPJmJFo1v7bYVPBWJhdbkt67+e+xsSLQjdgXpZ7/SN1x/tCta3cH/1z9lwGoH7q4wbS2c72v16AkTWKw9+wY86UvQ4JxOTtHXDOzQItEZC2xoJDplVtStnj08xwIpKs3CuPjOAfdzL4o5Oil+fLQgt35A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPF5DFCDEDFC.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 16:17:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 16:17:32 +0000
Message-ID: <b6ee8ac8-f34a-476e-a62a-4666e590366c@intel.com>
Date: Fri, 31 Oct 2025 17:17:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/28] drm/xe/pf: Add data structures and handlers for
 migration rings
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex@shazbot.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer
 Kolothum <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
References: <20251030203135.337696-1-michal.winiarski@intel.com>
 <20251030203135.337696-6-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251030203135.337696-6-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPF5DFCDEDFC:EE_
X-MS-Office365-Filtering-Correlation-Id: 6884f7d9-b66c-454f-a48e-08de1898fed8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1R4N2ZEcDFmT01UWlQ2Y1Y4VkhDTldjZlZaK1hiUEl4VWw0UzZ5TW5lT2E5?=
 =?utf-8?B?bTFnSHdKYWlwV1VubU9VTlc0RDhzb015TmlsRmNuK1R1ZUE4cndrY05pV3oz?=
 =?utf-8?B?QWxTQUtCVS9jT3dHa3gxTldzdjEyOExVNVFVWm9Bb3ZnYWYxc3BiUTByNWwz?=
 =?utf-8?B?cHNrbkRxRUY3RmNVSEtnbzJzampyS1IzVGpiVUZhRVFHSzV2ZVVzUHJDaFF2?=
 =?utf-8?B?MEZLcXlDUDR6MEtLRDZJbUxITERLMlZhWDArakVtLzU5ZDZ6MXN4Sm0va1NB?=
 =?utf-8?B?VG5VT1k3aHpEdU5RQit0ZUxLYzRNSFNNQlprVERpTnRYUFo4THdVS0twajdo?=
 =?utf-8?B?ckVDdDFGRWJhNGk1ek5oU3BHWkNRL21ST0lnZmNmVGFycE5jaitIZlJDbXRZ?=
 =?utf-8?B?Y0kyRGRJNStPeDFaRzdHZnNKZ2tGNEFMbmJ6Tk5LRElxQ0x0TnpZT1ZpSnNU?=
 =?utf-8?B?UDExNWFGeGtlZlRSZmJ2eEg5dFVUVXVKR1YyYS9HSmNBcEpEcjJmdXM1aEIv?=
 =?utf-8?B?b0R3alFzOEoyM0tweHpscDFBUnkyU3k4WER2MmpodS9Rc0F4YS9mZ3FzMi9a?=
 =?utf-8?B?Tjh5c1ZFbVh1L0JTcjRhbHZIbjRMTW1zdzdYY0JkU0srQXhhYjRJVDZaT3VO?=
 =?utf-8?B?OUxSblVaSHl6bmxTUitPYXJDc2NQMWlBRnpwbFpBSkRLS0JlcVRWVzByRDlQ?=
 =?utf-8?B?OWw0djA4K1F2ZllEOGtMRWpGRkJSazEwaU9hZmkwazE4RVlGaWFubzV6T2VF?=
 =?utf-8?B?dGt4VzQ4VGpSZXR1MHJ4eEN0L3dqZ0xtM2FJMUtaUDhzUFJ3UUVYUXlnMEow?=
 =?utf-8?B?dG1kRHIzVGNtR1h3ZWZhMXljUFF0dUJHcU5ibDMvY0JzOGtwZVlTQm1NUnJk?=
 =?utf-8?B?dmt2NnJOOUpnWkJZMTVaSGd0cE9ianQ2NzlWd2NqTUxPc0NoTkswa1BSTU1I?=
 =?utf-8?B?TmxMZzdsODcvKzlsTmplaDk4Z3hhK1pSMzBReStKdXBaUWhaSGh5YXU1T2Zq?=
 =?utf-8?B?WTVqdytmdEFzOHhlQWZxZEhxa0tCZHVWUzd5RlRHYjk1MGRqZmxCSWY2TnlZ?=
 =?utf-8?B?dG9aVVE1M1NMOS9oRkNNZXF2QWVuZC9TV1pWcXpGTGtJdmJBQXB0VU5QV0wr?=
 =?utf-8?B?V3hFZHZrWWw0TVlyUDBQZEdRd1htT2dvNzA2VkZNRVY2ejBsQzBVWkRZdzQy?=
 =?utf-8?B?OERHdyttWGhxQ24zMlJMUURLWTF2K3I5RUFGSTdqNFhtSjB4eWphMDRDTVZ6?=
 =?utf-8?B?V2xIQXBVLzVqczM3eFlrajVCc20zUFhNZ05BYitrelFkUkJ5NWhSRS8rSFdZ?=
 =?utf-8?B?ZVZVdHAyYStZTmtlQU9SSnpCMXBjNDhCbSs3M2NsWmRHVGs1eHIwL2xaeVBw?=
 =?utf-8?B?ckF4MCtHVll6RFFzMHN3RGdtOHVUekxJK2NkL0crRGc0RGtUTUdFOEZ2Qmgx?=
 =?utf-8?B?UVVhSS9CRVNOZzRZOEI4ZFM0WGt5S3BpS1dSaDY1Q2EyQWJPNWRzenR5OVVM?=
 =?utf-8?B?VWFOWWtMRnRaS2FSOXR5aDNvSDdwdGplU0pvbTNnM3pUei9EMTZPaFZieXV0?=
 =?utf-8?B?QktXejRhaEgxbXF4L09Wc05VcmROckYxU3Z6T0NwY3l5YjJSMS9SNzNieHNn?=
 =?utf-8?B?M2I1UFRNa21YSDBiOWc1eTBMRTRzczlwVGRwUHhKS2hEQURMdWtLald2TEdS?=
 =?utf-8?B?NWZzeHpkZnFOd1Q3c3FaeUg0VWNlOXFRYUpPRGZlNXRRcVBCT21BNEw0UnMx?=
 =?utf-8?B?SFdza2x6NEVxL2dDcnM5S3Avb0VSa0JUNlFadjliR2hOSUhQNVF6bmpxUXA2?=
 =?utf-8?B?QTR4dE9qY2luZ3RueURhWUpmcnVFU2lzenArMzVGMi9NY2VKNG1PNU9zak5n?=
 =?utf-8?B?R0NDdzZUN0dTK0x4YURCa3ZUZlB0WmlWOVJ6cjB5anFiaGpDV0xhQ1hjWWww?=
 =?utf-8?B?Zy9kam5aSnMreVhMQ0ZuSUxPTHJ0bUxienQ4UXk3Ym5uOWVlYjhYaUg5ZUdE?=
 =?utf-8?Q?pPbYSLRMzdvUeEPJH35/EgLPjHCHkQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm82aGR4cHVMaCt4SnFtQnpBTGMzejhBS1NyVmNRQnB6N2VSOEhFZHJRaXFY?=
 =?utf-8?B?SERFSG1jR3REQVoxTW5TNloxZ2Ftbll6c05OZVByTHE4T2NVa0Z4NmRoenhv?=
 =?utf-8?B?MkxHRzJpQWpFSGI3RE43dnBadFhHVGZHRlc4cTJGQXczSkVVaDRsU01vZytW?=
 =?utf-8?B?QUxxSkV3Kzl6T2VsNFVpUUs3bUtYcHBjcHVmYVBSK3hLbTB5Z01ZL29yMCtl?=
 =?utf-8?B?MFg2cStFc2cvWFpaait6SHd5VmFkSHZ2S3JCU1NicXZVVTFmbHpEanovcDhm?=
 =?utf-8?B?VG4rZXpCd01CMDlGOHlwb25NR2h3R09IdTYvcjZqN1FsSnpXV0FVS1ZhQS94?=
 =?utf-8?B?cUF0RnczMFpyS1gybHlqRDRvU1grWDBOT21NQlFhR0Rrc05heHNTSVhMeng2?=
 =?utf-8?B?eEZDYXJzVHczaFNvVnVEcEJnMEFzSFBab0YvajV6cGZmVG5tdStRdSs5UXlZ?=
 =?utf-8?B?M1pzTGt5ZlJtZTlsSnJtSlFiRnNxNVRlNVpHeHViWld3THA1cDBNcUZEWDdZ?=
 =?utf-8?B?dVVjdTRMdVRlS0x0Z1VWNUl1ZHY5bjdIdWlXUTJoVm41bkFlc1VqL3dGUldz?=
 =?utf-8?B?Z0pKbVQrWW5pRzBndjhoa3JtbDlYVFNvYjlPaDNHUER0NmZsdGZBYUNNdWdT?=
 =?utf-8?B?SWczbkx5RXhGVVhWOUttODNqNXJCK1lVdWZZRDhFbnFSOCtUWE9KQXJmekNP?=
 =?utf-8?B?K3pabkR6WVA5N3BTUzFzSjVETk9scENOZy9MNDJ6Z0loY0Z0R0VZdkRNMXN3?=
 =?utf-8?B?SkdWVGo0aUVpL05qTGdGQTY2YW1tNFJ1VWtFdzRIdWIvU1J1UFQvZVJ5NmR6?=
 =?utf-8?B?c3ovQ1F2QlMwM1hER2hXWURRNXlJeU15QVh2U3FFS3dGTDdMQWN3d0VyaTJa?=
 =?utf-8?B?UDBIZjlPbmJ6dElrdTRGRlZYMXg3QVc4QnpiRUx0d0NqR3dWUEU0eXZkakNY?=
 =?utf-8?B?akU1RjZCOWFJYkNnUkl5VGVaN3Q2YittNG9qWXgyMjdBUHBBNWtKYTQ1d0Vx?=
 =?utf-8?B?RkxKdjZRVDFLeWw3Vy80ZmF6SHg0amZoRjUxVnI0cmJmQ0ZJeUFOVWZ6RFVY?=
 =?utf-8?B?bVdSWUdCcjhRSGs4QU4wN2FwS3ptMFUzWnZwM0RJeEhUcC93UTFqVzB3TmJy?=
 =?utf-8?B?VFdBWlVpS1doOGhiMHBFK2NUM2NLWi81eStGeTFKN2N4aDZEVTUzaXJrREd5?=
 =?utf-8?B?ZzVhUTcvNk8vVGcrT2RBY2ZQMzUrUlo5N2JOR0RNdllzR0NudDc1Y3cwUmRJ?=
 =?utf-8?B?enZLOUUyYXZLOWsxUjFSRi9pa2t3RTdpMmhGaTZsZzFJNkVkc2tDc1huOFZ5?=
 =?utf-8?B?VGZaWE04OGVzcEFJRERRYVF2NUI0MTRGeFNUMGNEancyZ1A4SDNOSEtsZDVK?=
 =?utf-8?B?ZFZ3NEo4cjNMTlFmRGJhMkdwUW9vNlZ1TnlOOFRobkE4WFpQWjFYYlNoMGFi?=
 =?utf-8?B?eFNLblByc1pweUptckRtYjRvMmMybER0ZVFrczl3L2FYNWZJSmlmT0pHTmxP?=
 =?utf-8?B?eVUwWEpKQjRUUzBtZHNtREJMcktHRzBsTXl2YWZ2YnUwdFNCZWV1UGtkSFJo?=
 =?utf-8?B?QWsxRlNGeFNwaVRneWV2RWIxRldDSk9XWjQzeWRDSDJzU3NUdlgvNG9COTRL?=
 =?utf-8?B?SmFVMkk0RnFYUFY0eHVoRkpIcEpiZUpNNElNUkw2ci8xMjVEa3F0MEsvSGY0?=
 =?utf-8?B?VHl2OHZJTjlGcWNxOURVRWZEQXc4WXZRaXBEaGorT1o3OXQ3eVdaZjZqQ0N6?=
 =?utf-8?B?bi9JSndIczBLbWt1L0kzRkcyNWV4d0Z3Si9idWdlSFc0OEJzc2hJUVlvNGJI?=
 =?utf-8?B?anExZmc1QmFSQmtJMmE1d0JmdS9sbGtKaFpQeTB0T3NsT25uU1NQbC9kM1BE?=
 =?utf-8?B?UkhCZTRtZ2tPbkZNaHRmOHFuaXNEbGFZb2t1d1NUckZ5OUN4OEhiNjBsaVda?=
 =?utf-8?B?WG5yQ05Vdjl4MWNIMEF4aitzMEFLNXlMSDliT3huRjljQmhhNDNhK2F0emVj?=
 =?utf-8?B?UXJqY3J3QTMxS1pSTFRMV3pxU0xMMldjcEJBV29lSXZWeVMxTUJlNW9MTGcv?=
 =?utf-8?B?eVZBeFc5ZnkyaHR6OTQ4bXFRWEZJSXkwWWZKM2QzSnhST0dQcXZXc2E0cDFP?=
 =?utf-8?B?T2dYZXFHSVIyaE95TkVLQ1NwQnZRL25QMjdVdlBiNVZ3c0dhQjY4WEZCZlV0?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6884f7d9-b66c-454f-a48e-08de1898fed8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 16:17:32.7092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQkXojStEY2SnsHWUNx5nV1lH204mNRzjne2XkQUkqC6cK5Z0sGweDjbuNeC0/og+dL6sVjD2tOGVh9K1rODhrgbOiZiKu1eb2Emg0R2n3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF5DFCDEDFC
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



On 10/30/2025 9:31 PM, Michał Winiarski wrote:
> Migration data is queued in a per-GT ptr_ring to decouple the worker
> responsible for handling the data transfer from the .read() and .write()
> syscalls.
> Add the data structures and handlers that will be used in future
> commits.
> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   | 271 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h   |   6 +-
>  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |  12 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 183 ++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |  14 +
>  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  11 +
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 142 +++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    |   7 +
>  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  58 ++++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |   3 +
>  11 files changed, 695 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index a571e1c02a3b4..ad9dcd3f56453 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -19,6 +19,7 @@
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_control.h"
> +#include "xe_sriov_pf_migration.h"
>  #include "xe_sriov_pf_service.h"
>  #include "xe_tile.h"
>  
> @@ -185,9 +186,15 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  	CASE2STR(PAUSE_FAILED);
>  	CASE2STR(PAUSED);
>  	CASE2STR(SAVE_WIP);
> +	CASE2STR(SAVE_PROCESS_DATA);
> +	CASE2STR(SAVE_WAIT_DATA);
> +	CASE2STR(SAVE_DATA_DONE);
>  	CASE2STR(SAVE_FAILED);
>  	CASE2STR(SAVED);
>  	CASE2STR(RESTORE_WIP);
> +	CASE2STR(RESTORE_PROCESS_DATA);
> +	CASE2STR(RESTORE_WAIT_DATA);
> +	CASE2STR(RESTORE_DATA_DONE);
>  	CASE2STR(RESTORE_FAILED);
>  	CASE2STR(RESTORED);
>  	CASE2STR(RESUME_WIP);
> @@ -804,9 +811,50 @@ int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid)
>  	return -ECANCELED;
>  }
>  
> +/**
> + * DOC: The VF SAVE state machine
> + *
> + * SAVE extends the PAUSED state.
> + *
> + * The VF SAVE state machine looks like::
> + *
> + *  ....PAUSED....................................................
> + *  :                                                            :
> + *  :     (O)<---------o                                         :
> + *  :      |            \                                        :
> + *  :    save          (SAVED)    (SAVE_FAILED)                  :
> + *  :      |               ^           ^                         :
> + *  :      |               |           |                         :
> + *  :  ....V...............o...........o......SAVE_WIP.........  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |             empty         |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |           DATA_DONE       |                      :  :
> + *  :  :   |               ^           |                      :  :
> + *  :  :   |               |        error                     :  :
> + *  :  :   |            no_data       /                       :  :
> + *  :  :   |              /          /                        :  :
> + *  :  :   |             /          /                         :  :
> + *  :  :   |            /          /                          :  :
> + *  :  :   o---------->PROCESS_DATA<----consume               :  :
> + *  :  :                \                      \              :  :
> + *  :  :                 \                      \             :  :
> + *  :  :                  \                      \            :  :
> + *  :  :                   ring_full----->WAIT_DATA           :  :
> + *  :  :                                                      :  :
> + *  :  :......................................................:  :
> + *  :............................................................:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */

nit: since above doc is not strictly for the function below,
add separation line here


>  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +	}
>  }
>  
>  static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> @@ -821,19 +869,54 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_wip(gt, vfid);
>  }
>  
> +static void pf_enter_vf_save_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_FAILED);

nit: is it ok to do not test if we are already in the FAILED state ?

> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static int pf_handle_vf_save_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return 0;
> +}
> +
>  static bool pf_handle_vf_save(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP))
> +	int ret;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA))
>  		return false;
>  
> -	pf_enter_vf_saved(gt, vfid);
> +	if (xe_gt_sriov_pf_migration_ring_full(gt, vfid)) {
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA);
> +

nit: can remove this sep line

> +		return true;
> +	}
> +
> +	ret = pf_handle_vf_save_data(gt, vfid);
> +	if (ret == -EAGAIN)
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +	else if (ret)
> +		pf_enter_vf_save_failed(gt, vfid);
> +	else
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
>  
>  	return true;
>  }
>  
> +static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA))
> +		return;
> +
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> +	pf_queue_vf(gt, vfid);
> +}
> +
>  static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
>  		pf_enter_vf_wip(gt, vfid);
>  		pf_queue_vf(gt, vfid);
>  		return true;
> @@ -842,6 +925,32 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
>  	return false;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_check_save_data_done() - Check if all save migration data was produced.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.

but it's defined as a bool below

> + */
> +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_process_save_data() - Queue VF save migration data processing.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + */
> +void xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_exit_vf_save_wait_data(gt, vfid);

ok to have no check against unexpected state ?

> +}
> +
>  /**
>   * xe_gt_sriov_pf_control_trigger_save_vf() - Start an SR-IOV VF migration data save sequence.
>   * @gt: the &xe_gt
> @@ -887,19 +996,62 @@ int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid)
>   */
>  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVED)) {
> -		pf_enter_vf_mismatch(gt, vfid);
> +	if (!pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE)) {
> +		xe_gt_sriov_err(gt, "VF%u save is still in progress!\n", vfid);
>  		return -EIO;
>  	}
>  
>  	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> +	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_DONE);
> +	pf_enter_vf_saved(gt, vfid);
>  
>  	return 0;
>  }
>  
> +/**
> + * DOC: The VF RESTORE state machine
> + *
> + * RESTORE extends the PAUSED state.
> + *
> + * The VF RESTORE state machine looks like::
> + *
> + *  ....PAUSED....................................................
> + *  :                                                            :
> + *  :     (O)<---------o                                         :
> + *  :      |            \                                        :
> + *  :    restore      (RESTORED)  (RESTORE_FAILED)               :
> + *  :      |               ^           ^                         :
> + *  :      |               |           |                         :
> + *  :  ....V...............o...........o......RESTORE_WIP......  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |             empty         |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |               |           |                      :  :
> + *  :  :   |           DATA_DONE       |                      :  :
> + *  :  :   |               ^           |                      :  :
> + *  :  :   |               |        error                     :  :
> + *  :  :   |           trailer        /                       :  :
> + *  :  :   |              /          /                        :  :
> + *  :  :   |             /          /                         :  :
> + *  :  :   |            /          /                          :  :
> + *  :  :   o---------->PROCESS_DATA<----produce               :  :
> + *  :  :                \                      \              :  :
> + *  :  :                 \                      \             :  :
> + *  :  :                  \                      \            :  :
> + *  :  :                   ring_empty---->WAIT_DATA           :  :
> + *  :  :                                                      :  :
> + *  :  :......................................................:  :
> + *  :............................................................:
> + *
> + * For the full state machine view, see `The VF state machine`_.
> + */

nit: like above, add separation line here

>  static void pf_exit_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
> -	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP);
> +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> +		pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE);
> +	}
>  }
>  
>  static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> @@ -914,19 +1066,61 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
>  	pf_exit_vf_wip(gt, vfid);
>  }
>  
> +static void pf_enter_vf_restore_failed(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_FAILED);
> +	pf_exit_vf_wip(gt, vfid);
> +}
> +
> +static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data *data = xe_gt_sriov_pf_migration_restore_consume(gt, vfid);
> +
> +	xe_gt_assert(gt, data);

maybe assert is redundant here, as if data is null, we will get NPD crash call
stack from the below line anyway?

> +
> +	xe_gt_sriov_notice(gt, "Skipping VF%u unknown data type: %d\n", vfid, data->type);
> +
> +	return 0;
> +}
> +
>  static bool pf_handle_vf_restore(struct xe_gt *gt, unsigned int vfid)
>  {
> -	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> +	int ret;
> +
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA))
>  		return false;
>  
> -	pf_enter_vf_restored(gt, vfid);
> +	if (xe_gt_sriov_pf_migration_ring_empty(gt, vfid)) {
> +		if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE))
> +			pf_enter_vf_restored(gt, vfid);
> +		else
> +			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA);
> +
> +		return true;
> +	}
> +
> +	ret = pf_handle_vf_restore_data(gt, vfid);
> +	if (ret)
> +		pf_enter_vf_restore_failed(gt, vfid);
> +	else
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
>  
>  	return true;
>  }
>  
> +static void pf_exit_vf_restore_wait_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA))
> +		return;
> +
> +	pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> +	pf_queue_vf(gt, vfid);
> +}
> +
>  static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  {
>  	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
>  		pf_enter_vf_wip(gt, vfid);
>  		pf_queue_vf(gt, vfid);
>  		return true;
> @@ -935,6 +1129,47 @@ static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
>  	return false;
>  }
>  
> +/**
> + * xe_gt_sriov_pf_control_restore_data_done() - Indicate the end of VF migration data stream.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + *
> + * Return: 0 on success or a negative error code on failure.

save_data_done() is bool
and below you return only 0 or -EIO
maybe it could be bool too?

> + */
> +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +		return -EIO;
> +	}
> +
> +	if (!pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_DATA_DONE)) {
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +		return -EIO;
> +	}
> +
> +	xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_control_process_restore_data() - Queue VF restore migration data processing.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * This function is for PF only.
> + */
> +void xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid)
> +{
> +	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP))
> +		pf_enter_vf_state_machine_bug(gt, vfid);
> +
> +	pf_exit_vf_restore_wait_data(gt, vfid);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
>   * @gt: the &xe_gt
> @@ -1000,11 +1235,9 @@ int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid
>  {
>  	int ret;
>  
> -	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> -		ret = pf_wait_vf_restore_done(gt, vfid);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = pf_wait_vf_restore_done(gt, vfid);
> +	if (ret)
> +		return ret;
>  
>  	if (!pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORED)) {
>  		pf_enter_vf_mismatch(gt, vfid);
> @@ -1705,9 +1938,21 @@ static bool pf_process_vf_state_machine(struct xe_gt *gt, unsigned int vfid)
>  	if (pf_exit_vf_pause_save_guc(gt, vfid))
>  		return true;
>  
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WAIT_DATA)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_SAVE_WAIT_DATA));
> +		return false;
> +	}
> +
>  	if (pf_handle_vf_save(gt, vfid))
>  		return true;
>  
> +	if (pf_check_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA)) {
> +		xe_gt_sriov_dbg_verbose(gt, "VF%u in %s\n", vfid,
> +					control_bit_to_string(XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA));
> +		return false;
> +	}
> +
>  	if (pf_handle_vf_restore(gt, vfid))
>  		return true;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> index abc233f6302ed..6b1ab339e3b73 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.h
> @@ -14,12 +14,14 @@ struct xe_gt;
>  int xe_gt_sriov_pf_control_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_control_restart(struct xe_gt *gt);
>  
> -bool xe_gt_sriov_pf_control_check_vf_data_wip(struct xe_gt *gt, unsigned int vfid);
> -
>  int xe_gt_sriov_pf_control_pause_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_resume_vf(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_control_check_save_data_done(struct xe_gt *gt, unsigned int vfid);
> +void xe_gt_sriov_pf_control_process_save_data(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_trigger_save_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_finish_save_vf(struct xe_gt *gt, unsigned int vfid);
> +int xe_gt_sriov_pf_control_restore_data_done(struct xe_gt *gt, unsigned int vfid);
> +void xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_trigger_restore_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_finish_restore_vf(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_control_stop_vf(struct xe_gt *gt, unsigned int vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> index ea16ceb39dabb..a14c738581ae2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> @@ -32,9 +32,15 @@
>   * @XE_GT_SRIOV_STATE_PAUSE_FAILED: indicates that a VF pause operation has failed.
>   * @XE_GT_SRIOV_STATE_PAUSED: indicates that the VF is paused.
>   * @XE_GT_SRIOV_STATE_SAVE_WIP: indicates that VF save operation is in progress.
> + * @XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA: indicates that VF migration data is being produced.
> + * @XE_GT_SRIOV_STATE_SAVE_WAIT_DATA: indicates that PF awaits for space in migration data ring.
> + * @XE_GT_SRIOV_STATE_SAVE_DATA_DONE: indicates that all migration data was produced by Xe.
>   * @XE_GT_SRIOV_STATE_SAVE_FAILED: indicates that VF save operation has failed.
>   * @XE_GT_SRIOV_STATE_SAVED: indicates that VF data is saved.
>   * @XE_GT_SRIOV_STATE_RESTORE_WIP: indicates that VF restore operation is in progress.
> + * @XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA: indicates that VF migration data is being consumed.
> + * @XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA: indicates that PF awaits for data in migration data ring.
> + * @XE_GT_SRIOV_STATE_RESTORE_DATA_DONE: indicates that all migration data was produced by the user.
>   * @XE_GT_SRIOV_STATE_RESTORE_FAILED: indicates that VF restore operation has failed.
>   * @XE_GT_SRIOV_STATE_RESTORED: indicates that VF data is restored.
>   * @XE_GT_SRIOV_STATE_RESUME_WIP: indicates the a VF resume operation is in progress.
> @@ -70,10 +76,16 @@ enum xe_gt_sriov_control_bits {
>  	XE_GT_SRIOV_STATE_PAUSED,
>  
>  	XE_GT_SRIOV_STATE_SAVE_WIP,
> +	XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA,
> +	XE_GT_SRIOV_STATE_SAVE_WAIT_DATA,
> +	XE_GT_SRIOV_STATE_SAVE_DATA_DONE,
>  	XE_GT_SRIOV_STATE_SAVE_FAILED,
>  	XE_GT_SRIOV_STATE_SAVED,
>  
>  	XE_GT_SRIOV_STATE_RESTORE_WIP,
> +	XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA,
> +	XE_GT_SRIOV_STATE_RESTORE_WAIT_DATA,
> +	XE_GT_SRIOV_STATE_RESTORE_DATA_DONE,
>  	XE_GT_SRIOV_STATE_RESTORE_FAILED,
>  	XE_GT_SRIOV_STATE_RESTORED,
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index ca28f45aaf481..e61e6f4215864 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -7,6 +7,7 @@
>  
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "xe_bo.h"
> +#include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_printk.h"
> @@ -15,6 +16,17 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_migration.h"
>  
> +#define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> +
> +static struct xe_gt_sriov_migration_data *pf_pick_gt_migration(struct xe_gt *gt, unsigned int vfid)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, vfid != PFID);
> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> +
> +	return &gt->sriov.pf.vfs[vfid].migration;
> +}
> +
>  /* Return: number of dwords saved/restored/required or a negative error code on failure */
>  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
>  				      u64 addr, u32 ndwords)
> @@ -382,6 +394,162 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> +/**
> + * xe_gt_sriov_pf_migration_ring_empty() - Check if a migration ring is empty.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Return: true if the ring is empty, otherwise false.
> + */
> +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return ptr_ring_empty(&pf_pick_gt_migration(gt, vfid)->ring);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_ring_full() - Check if a migration ring is full.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Return: true if the ring is full, otherwise false.
> + */
> +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid)
> +{
> +	return ptr_ring_full(&pf_pick_gt_migration(gt, vfid)->ring);
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_produce() - Add VF save data packet to migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @data: &xe_sriov_migration_data packet
> + *
> + * Called by the save migration data producer (PF SR-IOV Control worker) when
> + * processing migration data.
> + * Wakes up the save migration data consumer (userspace), that is potentially
> + * waiting for data when the ring is empty.

... was empty ?

> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data)
> +{
> +	int ret;
> +
> +	ret = ptr_ring_produce(&pf_pick_gt_migration(gt, vfid)->ring, data);
> +	if (ret)
> +		return ret;
> +
> +	wake_up_all(xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid));
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_restore_consume() - Get VF restore data packet from migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Called by the restore migration data consumer (PF SR-IOV Control worker) when
> + * processing migration data.
> + * Wakes up the restore migration data producer (userspace), that is
> + * potentially waiting to add more data when the ring is full.
> + *
> + * Return: Pointer to &struct xe_sriov_migration_data on success,
> + *	   NULL if ring is empty.
> + */
> +struct xe_sriov_migration_data *
> +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> +	struct xe_sriov_migration_data *data;
> +
> +	data = ptr_ring_consume(&migration->ring);
> +	if (data)
> +		wake_up_all(wq);
> +
> +	return data;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_restore_produce() - Add VF restore data packet to migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + * @data: &xe_sriov_migration_data packet
> + *
> + * Called by the restore migration data producer (userspace) when processing
> + * migration data.
> + * If the ring is full, waits until there is space.
> + * Queues the restore migration data consumer (PF SR-IOV Control worker), that
> + * is potentially waiting for data when the ring is empty.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> +					     struct xe_sriov_migration_data *data)
> +{
> +	struct wait_queue_head *wq = xe_sriov_pf_migration_waitqueue(gt_to_xe(gt), vfid);
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	int ret;
> +
> +	xe_gt_assert(gt, data->tile == gt->tile->id);
> +	xe_gt_assert(gt, data->gt == gt->info.id);
> +
> +	for (;;) {
> +		ret = ptr_ring_produce(&migration->ring, data);
> +		if (!ret)
> +			break;
> +
> +		ret = wait_event_interruptible(*wq, !ptr_ring_full(&migration->ring));
> +		if (ret)
> +			return ret;
> +	}
> +
> +	xe_gt_sriov_pf_control_process_restore_data(gt, vfid);
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_gt_sriov_pf_migration_save_consume() - Get VF save data packet from migration ring.
> + * @gt: the &xe_gt
> + * @vfid: the VF identifier
> + *
> + * Called by the save migration data consumer (userspace) when
> + * processing migration data.
> + * Queues the save migration data producer (PF SR-IOV Control worker), that is
> + * potentially waiting to add more data when the ring is full.
> + *
> + * Return: Pointer to &struct xe_sriov_migration_data on success,
> + *	   NULL if ring is empty and there's no more data available,
> + *	   ERR_PTR(-EAGAIN) if the ring is empty, but data is still produced.
> + */
> +struct xe_sriov_migration_data *
> +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid)
> +{
> +	struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, vfid);
> +	struct xe_sriov_migration_data *data;
> +
> +	data = ptr_ring_consume(&migration->ring);
> +	if (data) {
> +		xe_gt_sriov_pf_control_process_save_data(gt, vfid);
> +		return data;
> +	}
> +
> +	if (xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> +		return NULL;
> +
> +	return ERR_PTR(-EAGAIN);
> +}
> +
> +static void action_ring_cleanup(void *arg)
> +{
> +	struct ptr_ring *r = arg;
> +
> +	ptr_ring_cleanup(r, NULL);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
>   * @gt: the &xe_gt
> @@ -393,6 +561,7 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> +	unsigned int n, totalvfs;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> @@ -404,5 +573,19 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 1; n <= totalvfs; n++) {
> +		struct xe_gt_sriov_migration_data *migration = pf_pick_gt_migration(gt, n);
> +
> +		err = ptr_ring_init(&migration->ring,
> +				    XE_GT_SRIOV_PF_MIGRATION_RING_SIZE, GFP_KERNEL);
> +		if (err)
> +			return err;
> +
> +		err = devm_add_action_or_reset(xe->drm.dev, action_ring_cleanup, &migration->ring);
> +		if (err)
> +			return err;
> +	}
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> index 09faeae00ddbb..9e67f18ded205 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> @@ -9,11 +9,25 @@
>  #include <linux/types.h>
>  
>  struct xe_gt;
> +struct xe_sriov_migration_data;
>  
>  int xe_gt_sriov_pf_migration_init(struct xe_gt *gt);
>  int xe_gt_sriov_pf_migration_save_guc_state(struct xe_gt *gt, unsigned int vfid);
>  int xe_gt_sriov_pf_migration_restore_guc_state(struct xe_gt *gt, unsigned int vfid);
>  
> +bool xe_gt_sriov_pf_migration_ring_empty(struct xe_gt *gt, unsigned int vfid);
> +bool xe_gt_sriov_pf_migration_ring_full(struct xe_gt *gt, unsigned int vfid);
> +
> +int xe_gt_sriov_pf_migration_save_produce(struct xe_gt *gt, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data);
> +struct xe_sriov_migration_data *
> +xe_gt_sriov_pf_migration_restore_consume(struct xe_gt *gt, unsigned int vfid);
> +
> +int xe_gt_sriov_pf_migration_restore_produce(struct xe_gt *gt, unsigned int vfid,
> +					     struct xe_sriov_migration_data *data);
> +struct xe_sriov_migration_data *
> +xe_gt_sriov_pf_migration_save_consume(struct xe_gt *gt, unsigned int vfid);
> +
>  #ifdef CONFIG_DEBUG_FS
>  ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int vfid,
>  						char __user *buf, size_t count, loff_t *pos);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> index 9d672feac5f04..84be6fac16c8b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> @@ -7,6 +7,7 @@
>  #define _XE_GT_SRIOV_PF_MIGRATION_TYPES_H_
>  
>  #include <linux/mutex.h>
> +#include <linux/ptr_ring.h>
>  #include <linux/types.h>
>  
>  /**
> @@ -24,6 +25,16 @@ struct xe_gt_sriov_state_snapshot {
>  	} guc;
>  };
>  
> +/**
> + * struct xe_gt_sriov_migration_data - GT-level per-VF migration data.
> + *
> + * Used by the PF driver to maintain per-VF migration data.
> + */
> +struct xe_gt_sriov_migration_data {
> +	/** @ring: queue containing VF save / restore migration data */
> +	struct ptr_ring ring;
> +};
> +
>  /**
>   * struct xe_gt_sriov_pf_migration - GT-level data.
>   *
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> index a64a6835ad656..812e74d3f8f80 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_types.h
> @@ -33,6 +33,9 @@ struct xe_gt_sriov_metadata {
>  
>  	/** @snapshot: snapshot of the VF state data */
>  	struct xe_gt_sriov_state_snapshot snapshot;
> +
> +	/** @migration: per-VF migration data. */
> +	struct xe_gt_sriov_migration_data migration;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> index 8c523c392f98b..7be9f026d80e8 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> @@ -3,8 +3,36 @@
>   * Copyright © 2025 Intel Corporation
>   */
>  
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt_sriov_pf_control.h"
> +#include "xe_gt_sriov_pf_migration.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_pf_migration.h"
> +#include "xe_sriov_printk.h"
> +
> +static struct xe_sriov_pf_migration *pf_pick_migration(struct xe_device *xe, unsigned int vfid)
> +{
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +	xe_assert(xe, vfid <= xe_sriov_pf_get_totalvfs(xe));
> +
> +	return &xe->sriov.pf.vfs[vfid].migration;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_waitqueue - Get waitqueue for migration.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * Return: pointer to the migration waitqueue.
> + */
> +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid)
> +{
> +	return &pf_pick_migration(xe, vfid)->wq;
> +}
>  
>  /**
>   * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
> @@ -33,9 +61,123 @@ static bool pf_check_migration_support(struct xe_device *xe)
>   */
>  int xe_sriov_pf_migration_init(struct xe_device *xe)
>  {
> +	unsigned int n, totalvfs;
> +
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
>  	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> +	if (!xe_sriov_pf_migration_supported(xe))
> +		return 0;
> +
> +	totalvfs = xe_sriov_pf_get_totalvfs(xe);
> +	for (n = 1; n <= totalvfs; n++) {
> +		struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, n);
> +
> +		init_waitqueue_head(&migration->wq);
> +	}
>  
>  	return 0;
>  }
> +
> +static bool pf_migration_data_ready(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		if (!xe_gt_sriov_pf_migration_ring_empty(gt, vfid) ||
> +		    xe_gt_sriov_pf_control_check_save_data_done(gt, vfid))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static struct xe_sriov_migration_data *
> +pf_migration_consume(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_migration_data *data;
> +	struct xe_gt *gt;
> +	u8 gt_id;
> +	bool more_data = false;

nit: vars in rev xmas tree order?

> +
> +	for_each_gt(gt, xe, gt_id) {
> +		data = xe_gt_sriov_pf_migration_save_consume(gt, vfid);
> +		if (data && PTR_ERR(data) != EAGAIN)
> +			return data;
> +		if (PTR_ERR(data) == -EAGAIN)
> +			more_data = true;
> +	}
> +
> +	if (!more_data)
> +		return NULL;
> +
> +	return ERR_PTR(-EAGAIN);
> +}
> +
> +/**
> + * xe_sriov_pf_migration_save_consume() - Consume a VF migration data packet from the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * Called by the save migration data consumer (userspace) when
> + * processing migration data.
> + * If there is no migration data to process, wait until more data is available.
> + *
> + * Return: Pointer to &xe_sriov_migration_data on success,
> + *	   NULL if ring is empty and no more migration data is expected,
> + *	   ERR_PTR value in case of error.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +struct xe_sriov_migration_data *
> +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid)
> +{
> +	struct xe_sriov_pf_migration *migration = pf_pick_migration(xe, vfid);
> +	struct xe_sriov_migration_data *data;
> +	int ret;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	for (;;) {
> +		data = pf_migration_consume(xe, vfid);
> +		if (PTR_ERR(data) != -EAGAIN)
> +			break;
> +
> +		ret = wait_event_interruptible(migration->wq,
> +					       pf_migration_data_ready(xe, vfid));
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +	return data;
> +}
> +
> +/**
> + * xe_sriov_pf_migration_restore_produce() - Produce a VF migration data packet to the device.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @data: Pointer to &xe_sriov_migration_data
> + *
> + * Called by the restore migration data producer (userspace) when processing
> + * migration data.
> + * If the underlying data structure is full, wait until there is space.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data)
> +{
> +	struct xe_gt *gt;
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	gt = xe_device_get_gt(xe, data->gt);
> +	if (!gt || data->tile != gt->tile->id) {
> +		xe_sriov_err_ratelimited(xe, "VF%d Invalid GT - tile:%u, GT:%u\n",
> +					 vfid, data->tile, data->gt);
> +		return -EINVAL;
> +	}
> +
> +	return xe_gt_sriov_pf_migration_restore_produce(gt, vfid, data);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> index d2b4a24165438..df81a540c246a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> @@ -7,10 +7,17 @@
>  #define _XE_SRIOV_PF_MIGRATION_H_
>  
>  #include <linux/types.h>
> +#include <linux/wait.h>
>  
>  struct xe_device;
> +struct xe_sriov_migration_data;
>  
>  int xe_sriov_pf_migration_init(struct xe_device *xe);
>  bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> +int xe_sriov_pf_migration_restore_produce(struct xe_device *xe, unsigned int vfid,
> +					  struct xe_sriov_migration_data *data);
> +struct xe_sriov_migration_data *
> +xe_sriov_pf_migration_save_consume(struct xe_device *xe, unsigned int vfid);
> +wait_queue_head_t *xe_sriov_pf_migration_waitqueue(struct xe_device *xe, unsigned int vfid);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> index e69de29bb2d1d..2a45ee4e3ece8 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> @@ -0,0 +1,58 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_MIGRATION_TYPES_H_
> +#define _XE_SRIOV_PF_MIGRATION_TYPES_H_
> +
> +#include <linux/types.h>
> +#include <linux/wait.h>
> +
> +/**
> + * struct xe_sriov_migration_data - Xe SR-IOV VF migration data packet
> + */
> +struct xe_sriov_migration_data {
> +	/** @xe: Xe device */
> +	struct xe_device *xe;
> +	/** @vaddr: CPU pointer to payload data */
> +	void *vaddr;
> +	/** @remaining: payload data remaining */
> +	size_t remaining;
> +	/** @hdr_remaining: header data remaining */
> +	size_t hdr_remaining;
> +	union {
> +		/** @bo: Buffer object with migration data */
> +		struct xe_bo *bo;
> +		/** @buff: Buffer with migration data */
> +		void *buff;
> +	};
> +	__struct_group(xe_sriov_pf_migration_hdr, hdr, __packed,
> +		/** @hdr.version: migration data protocol version */
> +		u8 version;
> +		/** @hdr.type: migration data type */
> +		u8 type;
> +		/** @hdr.tile: migration data tile id */
> +		u8 tile;
> +		/** @hdr.gt: migration data gt id */
> +		u8 gt;
> +		/** @hdr.flags: migration data flags */
> +		u32 flags;
> +		/** @hdr.offset: offset into the resource;
> +		 * used when multiple packets of given type are used for migration
> +		 */
> +		u64 offset;
> +		/** @hdr.size: migration data size  */
> +		u64 size;
> +	);
> +};
> +
> +/**
> + * struct xe_sriov_pf_migration - Per VF device-level migration related data
> + */
> +struct xe_sriov_pf_migration {
> +	/** @wq: waitqueue used to avoid busy-waiting for snapshot production/consumption */
> +	wait_queue_head_t wq;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index 24d22afeececa..c92baaa1694ca 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -9,6 +9,7 @@
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> +#include "xe_sriov_pf_migration_types.h"
>  #include "xe_sriov_pf_provision_types.h"
>  #include "xe_sriov_pf_service_types.h"
>  
> @@ -18,6 +19,8 @@
>  struct xe_sriov_metadata {
>  	/** @version: negotiated VF/PF ABI version */
>  	struct xe_sriov_pf_service_version version;
> +	/** @migration: migration data */
> +	struct xe_sriov_pf_migration migration;
>  };
>  
>  /**

otherwise LGTM


