Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01D1A67344
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 12:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B0610E467;
	Tue, 18 Mar 2025 11:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiBYYc0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED84B10E211;
 Tue, 18 Mar 2025 11:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742299095; x=1773835095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NVvFQmrayYwK1mFgJ6EYqQx0k4f0i7blM7sCQStdrcM=;
 b=SiBYYc0djXntZVZANXt/TfmUvPYa/KldksEUuf+PAthrtpTU/JlvDTKz
 i30U8Q1tuS6Fuz3pNWWOA3PyJLiUJId8KHCfxhoBn/oEcymD/3sP+Wn7Y
 zQnqiPTqs9mcrxE3/K0Z3Mq8T/k6twYOcILtI8jXF7+EFze9Iqkqnj+jD
 2uH1FkO46Q8rIEx8MNlyVktpon00rE3AVo7uNgkBX64QJduoFy/OaDlSV
 zzynILfMvSTlWgRwghNpCBjNNwS49pTzcx3fcGm7yXqNs29DhXRKpXKJ8
 kw+OJDPtX17/jR+RTd4e/8Zl8I1kHJe1LJl8ByDZU6Cz1NDaBJnLkkL49 Q==;
X-CSE-ConnectionGUID: Sc66D3dpQP2yKj46r6/DFg==
X-CSE-MsgGUID: ds/f+EgTQd22VOlJddvyhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="42684200"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="42684200"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 04:58:13 -0700
X-CSE-ConnectionGUID: U/eURhcdSw6TcKqUT2SPZQ==
X-CSE-MsgGUID: bXsJoaRUQfei0niWZ7sxpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="122066540"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2025 04:58:13 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Mar 2025 04:58:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 18 Mar 2025 04:58:12 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 04:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ub2qDBI4ygrsBdabDjZ5BmDddpMmcpWSgAcjkYspjkffcphx8Ose4aaLOAFThgqSAzpVgD6ENH5TUm0k+ujMTH1vndcwALdOgObZ9Z7x9o8fZEJQIofykr5MXEjs8DK9lVLYgWXIRInozfZyKEMFBvpJ/c9f2J64H6PYrawyAv/JLld29LGp9oGa+gp0QOtZJjnqraTEKoFg6c/zUHxEIkSCHDrLim5J59BHsch11oyn6PoPkScdXg5IJHgE5sgY8jPe5OYNi/ovhzECEOZSe8PKT7PJcI5RrmIl4McV4pfHABgMbncU/Lr5DANriggbb6UGswdAJOfwRRsAb1tQ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJAvLEx9f8vANetb8wWGENsSS995T8dpoQCz0SMPsAQ=;
 b=cay2xQTReykH5DMwe2w0brk8FHRYwJN0yd+YQTXg0ErRcNNvdJyKAdn/caAxjv0qX4xMFiibbaRjmMDT9NN8pxTcS1EGjfjAMaDDicsfElfXOu9/6tIUGqjnuNbRG8IUDB54D5SeOVXhiOf5H6jwmlq/cikDSWNxEiV7FZMjZCI9vfVJrX4f1LM6UR7HLfPdjLpvUd4vqVmvFDEQ9WQLmnpCoy2AeinLi+udFNV6eeIB3Q+TVmc62Zlgdk5LtJVHdJGX32AN+H1U6RkbanjA/2sOvBbiWAA2uui/q+N8IRgZwMYNO10jEhGfmoeFBRgJlBH6impKM/tDqNh+aKHCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS7PR11MB8826.namprd11.prod.outlook.com (2603:10b6:8:256::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 11:58:09 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 11:58:09 +0000
Message-ID: <4203f450-4b49-401d-81a8-cdcca02035f9@intel.com>
Date: Tue, 18 Mar 2025 17:28:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 13/29] drm/gpuvm: Introduce MADVISE Operations
To: Danilo Krummrich <dakr@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <oak.zeng@intel.com>,
 <dri-devel@lists.freedesktop.org>, <bbrezillon@kernel.org>
References: <Z9gxV0RZLopxf8et@pollux>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <Z9gxV0RZLopxf8et@pollux>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0169.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::21) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS7PR11MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: c7a5bb92-6e0c-41cd-92d8-08dd661426a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0tZUHUzT1h0QWpZZlM0QmZ1L1RYZENuRUttRk95ZHlWcWVPOXFxYWhWbko0?=
 =?utf-8?B?b0sxSnU3SG53VGZyUmtpSGIvaDNRUkxuSitNcHR2cjhubzUzNi9CMVUxemNQ?=
 =?utf-8?B?WDlJcGxjMGk4YnJuaXdIZVp0YzB5WG43bHJrNFNuZkdsZ0s0aVlkWEVXNzNi?=
 =?utf-8?B?djNmbHk2d3BFN0FVd04razBLU21Za2tQTXNWend3YXF0RGwrWDZIRjdvSmdv?=
 =?utf-8?B?VWwySkpWdTErcklSRzRNVCswaldKOW0wNE9nV3JCTm5oNU1zL1NncVhwSUIz?=
 =?utf-8?B?aWtFcWwybWprS2tudERyaGxuL3BqcWJhQXFaVS9qM21ISUxFR3loZXBZZXRV?=
 =?utf-8?B?ZWZVd2laTGhoem56RkNRWm10c0Jtb1JoSTNxWXlEYU1MTzZKeXpIU2R4ZXlq?=
 =?utf-8?B?SU5OWUhjVk5RRzk2clZVTDAzWGo4KzR6UmkwdE9SZkVyQXVaQmhaK2JJQ1RZ?=
 =?utf-8?B?Rk9JdnpBb242cDRHTTFYWlJWNlQxUDNQb05iREhhU1dBT2FVblZoc0tmdjVr?=
 =?utf-8?B?SzZMUnlvbG9UNmhCWVFxaSs4S3RCQXo0SGU2TUhrdUJsRW9XMUhoNW1ZSWhU?=
 =?utf-8?B?bVZFWW41RCtoNlN3cEp4SFQ0SXFJbXg2cjFqRjB3eUkyZ3RxcmIzYVpGdzQy?=
 =?utf-8?B?MCtiSzJITXRHeU40bEp6WHZPRTdZaWxsb0ZzMk1sQjlmK0R0VDZVZHhMdWZ4?=
 =?utf-8?B?YUM5MnlGU3F2cWFnRGdnVXYvdmJpN2krSkJHNjdyTW5VbE5Da2loOVl0TjFZ?=
 =?utf-8?B?VlRQcy9xamh5QlZMK3ZqTURkMDZDczRJeWZvRlVvRXpNallNcDZ5d3lHQVJz?=
 =?utf-8?B?OFFGZzhBOVIxaDBpTmk4eDNtemVoU3VMaElMOHhjUlhHR2pFWFFPcXhoRHEz?=
 =?utf-8?B?QnFPeU9aUlV3eXZTWVBEQU1DNWVNSUZ2aU5zU0h0Vit6Um52RTl1ZUQ2TlJi?=
 =?utf-8?B?aEV6aVZGbzJGUExjY2VuUnp0SHNHeTE0aUVBVzloMEwyU3pOYlBNcE5uMW13?=
 =?utf-8?B?T25rWDlET0NVazd4MUR6dGplekxiOFV1eDZXcEd4dHRPQnM2U3NsQTRqVEh3?=
 =?utf-8?B?amVDNVJ6NUVxOEhkaStQMWgxNHplUitsWnJkM3o3MmJGblRHaFVGczMyMURm?=
 =?utf-8?B?SXpvWE9ySXhwY3NGYzVoUmJaME5NV1RSa08xclBoMkJ0b2FZVDliQlZEdGdk?=
 =?utf-8?B?bm5YV3JVTW5tZCtCWGpQRFpsamdtOXpRZzNlWS81Zy9qeUQrQ210cGJrSjN0?=
 =?utf-8?B?bG9kREFla2ZRYzMxSEtsQi9udCtaQUkyOVIzUmFKU0djUlhuUGlqVmdpWnho?=
 =?utf-8?B?S1FtU1JkRjVVYnlrbHJ3MGxwSnE3SXYvdXl4MlNINUtvcncwR1J3eHBBVVpV?=
 =?utf-8?B?VjdnQW4xVHQvQWFMRTBFUUhuUSs4Z3VvUXhRRjdYdlRMbHBzS0Z4cCtFd2Mx?=
 =?utf-8?B?dFg5cDF2WWJwVWY0Zm9Bdk5pN0ROM3hyQTNFZlBkK3luNWUwQjdYNkl2YlA2?=
 =?utf-8?B?dnZSV3ZtVVpGeW5DTTk0WHZGN2pYS0Y0d1p0amtocFFGQlN1eER5bmFNUzNY?=
 =?utf-8?B?czE4cG80OUQ4bVFTMWt2T3IyR3pPaHJ3dFVvZ2ZFdW1zTXJZekFSakxzbjhm?=
 =?utf-8?B?YU5tTlltcVp4Q1NHR2w0Q3Zhd1JGS25kbHZrREFzRkhQeWlhc2R4YkoyZFhF?=
 =?utf-8?B?VWV3cHpTMUtqL3FVdDNNUUcwWTkyY1BIbjhFL05sOVJKS0Y0WVBDU2hhdU1S?=
 =?utf-8?B?TEU5N3U4bmlLZk5HOEp0YUlSQ1RzOElpOFdVUUp6RnBRZEJUeXlmanhIeWg0?=
 =?utf-8?B?YndXczBHbmFYUE14VE92QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEZPQlRadVpGcW5zK2dVNkgxRE1oNVdhS1M1R1hMTlJqTFYwYmZ3MDNadDlD?=
 =?utf-8?B?Q3I2TlBrMlhpZDJGcStMWE5sQWRRc2orWnBEbS94V0FwRm1WODZWUkJrd3BO?=
 =?utf-8?B?ZzdKRVhYL2dOVmwvS05iVnlLYTZqcURKWUZTTVI4dHZMcm85bytoV3FXRWY0?=
 =?utf-8?B?OEVvK25meUdreWRLbFgveDZvSitTK2NKME5WUFM2THBwbmdHSnJON29IVVND?=
 =?utf-8?B?VjhPM0N6V2lxNVRQVVJ6UzV3Zno4bUZQbk5KOGpqcGc0QlJwb2tSdjQ5WDRt?=
 =?utf-8?B?UkVmQWFJaDNITDJORVhKMGRqQ3h3V1JkNDRWK3ZQSFBwRVU3Yzdvb3Q2bEtL?=
 =?utf-8?B?ZlZjNTNBMVR3cHhRbGhIdWR6UlRtVTZaemlsaE41aWdDajMyRXQ2UEhILzRZ?=
 =?utf-8?B?eHFzemROUW1YbTFOZjE4OVQ0ZjJaOUlkVlg5dTh3NHh3M3Y0TS9QUk5BVGND?=
 =?utf-8?B?UTA4WC9CRG5GblcwcTB5OGlocW1HSDhEYVVJZERZT0lwQlJIL2FvSlVRRmZv?=
 =?utf-8?B?QTZIamExdkZ1bTMyWTlYK2hISnRxOXJEdUwxYnFFdXRDSVZEamErR2FIS01v?=
 =?utf-8?B?bzZlQzIxb0p6Ym42M3V5eGk2NDdQMm9JMGJWM0tjOXpKZGF4bXJhY2xNdWxH?=
 =?utf-8?B?ejVLeTdWejloSUZlTHdkUTY3ZHRVRytnaWl3bnBueU9MNHE4dU96Tkp2S2Rn?=
 =?utf-8?B?eVpNYmhBWVBZL1hwaWtoYThqWEZhM29QQlRiU2hGTmxQL1EyVzVaZkN5b05P?=
 =?utf-8?B?WGtGVUZ4MmQzYmZtTFc4RHZGRFZIc2JXME81U1hFUlN6YjdXdFVjQk4yQkFw?=
 =?utf-8?B?Mkh5d0RTYjhvOVpsRVNXZm4wWDAzbU9OUzhKQU9tcFQyNmljTHVoWVpqc0Fk?=
 =?utf-8?B?d1FrcEJsc0xyVHhuazVzKzBvNHFzdkwwUlMzOEJ1bmY3b3N5MmJDa2FiU0Ju?=
 =?utf-8?B?MllUamxpS01lbmxHK3FheWkrUjc1ZFhvZmkxeFBpMTIwVDJEdFJPSUJjekIx?=
 =?utf-8?B?SHoySS9mS29YQnNPZ1UzaXhRd1cxbjA1bU4zZHhjMU9UVm9lU24xcjZQWTI3?=
 =?utf-8?B?U0gwUzJLVHhRbDlZV0lEYVdqOUtJVmV6Y3hrT1ovVmZXWGFvVXBRTzBtenk5?=
 =?utf-8?B?TWhRUnJRUzVEbkhMRGJMNEdvVHllMGRqNEc1YU56eW5RRUpIRUFOakw4TG9x?=
 =?utf-8?B?ejNaYml3UEN2NDh6eUZzSFJheCtwR0M1eVdyeVgrMG1WaDdjR3pFcmJ3MHdR?=
 =?utf-8?B?aGYzWWJVYzZnRHo4VGtCMXp6MnVDU2ZNckxkeHhPdkkxUUVpeGNTNGYrUnl6?=
 =?utf-8?B?bHNUcjE3c3lMTGU5bjFZeFZWRU1yWGZxeUI1dlJTajRIQm5MTVpLT1JrS2Qr?=
 =?utf-8?B?ekJrWnJpRm50NCtvRDIyQmVlbzdQTjFmMks0aFR0cXlxTlBRM09CZk1aVVRV?=
 =?utf-8?B?aTBnNGpvK1M3dEFUdTIreU5WYlkvNml6Mkw4bTFJeENLUHBpUVV2eTQ4d0gw?=
 =?utf-8?B?OU9OUUdvdFZ0UmptTGpkMFRkZkJuY3NIYjhydXpKNmFtVlNxSk4zSi9wekJq?=
 =?utf-8?B?MUtPbGNHcyttVUtsaHMvcHRWcEVxQnIxWXVubHlhL08za2J5bnBzUEk3am1L?=
 =?utf-8?B?QVhZd2Z3TzRNMFNSa3FjVUMzV2ZJQlV4SXIzM2F5Y1lKeUhRd2hPbFhsYVIr?=
 =?utf-8?B?OUpKd2RXY0czSlNyNVVjQXRuR0FyQ1hoN0JCd2I2dzUyRVNHTEZNU1FaSHZL?=
 =?utf-8?B?RE1RTW41VlBkcWhjTmU4S3hUTi9YMVZyeXAyTmVvbUZOSnVXM2tQY0lKL0Ri?=
 =?utf-8?B?VnpqR3ZNdHduQTZWYXp0TjJLQzhqZG1FaFdqMXlWbnQrVVJoeEpwQ1N1VjdX?=
 =?utf-8?B?VnpwUVpoTEJROEdrNU9CaTZvNDBIQ3dvS2UvSEZ1NUkvSmZUTG85UzgxU0hs?=
 =?utf-8?B?SUdndmRHY3ZCZSsrRlExYmhoQ1Y1dXF0OEMxTmVnWkptMk1EdU5Nb1JjTjJQ?=
 =?utf-8?B?eG9neVQ4QkNkbzVhNERrZGd0Vit3UzZ0TFVkK21yaXQ3Q3pDR2xRQWJ4eXI4?=
 =?utf-8?B?YWRqZERBQ2JmMTRtczA0SzhkZGVCaXFLMlo3NE1MOS9JUEovSUhkTVlDVmRj?=
 =?utf-8?B?VFlhM2tEQi9VNU00dGJKYjVkS1ZZRHNKTlZlczRCWWRiWFBXY2lzaVdVcU9j?=
 =?utf-8?Q?IoUostTtcz5wrsHElHoBo70=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7a5bb92-6e0c-41cd-92d8-08dd661426a8
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 11:58:09.3750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCdg3Dz/jWvZGbXwHPA3HdLK4m5HQ9UL/NUxLfC3vX77JTuXwFPJA/ea9K3OcPJWQLFIOQyS63sXddoVzVxWF4IWoIF4Z7NmwTU8wAMd38k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8826
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

Hi Danilo,

On 17-03-2025 19:57, Danilo Krummrich wrote:
> (Cc: dri-devel@lists.freedesktop.org, Boris)
> 
> Hi Himal,
> 
> Please make sure to copy in dri-devel for such patches.

Thanks for taking time for this. Will make sure to do same in future.

> 
> On Fri, Mar 14, 2025 at 01:32:10PM +0530, Himal Prasad Ghimiray wrote:
>> Introduce MADVISE operations that do not unmap the GPU VMA. These
>> operations split VMAs if the start or end addresses fall within existing
>> VMAs. The operations can create up to 2 REMAPS and 2 MAPs.
> 
> Can you please add some more motivation details for this patch? What exactly is
> it used for?

We are working on defining the madvise ioctl within the Xe driver,
which sets or unsets attributes to control page placement and PTE
(Page Table Entry) encoding for GPUVMA's within a user-provided
range.

The goal of this patch is to introduce drm_gpuva_ops, which will
create a drm_gpuva_op to cover the user-defined input range.

Let's assume there are multiple gpuvma's within a to d:

         drm_gpuva1                        drm_gpuva2
         attr_1 = x                        attr_1 = x1
         attr_2 = y                        attr_2 = y1
         attr_3 = z                        attr_3 = z1
[a----------------------------b-1][b-------------------c-1]

         drm_gpuva3
         attr_1 = x2
         attr_2 = y2
         attr_3 = z2
[c-------------------d-1]

Case 1)
In this case, the start and end of the user-provided range
lie within drm_gpuva1 a and b-1. We need to update attr_1 to x'.

drm_gpuva1:pre      drm_gpuva:New map         drm_gpuva1:next
  attr_1 = x         attr_1 = x'               attr_1 = x
  attr_2 = y         attr_2 = y                attr_2 = y
  attr_3 = z         attr_3 = z                attr_3 = z
[a---------start-1][start------- end-1][end---------------b-1]

In this scenario, behavior for ops_create is same as
drm_gpuvm_sm_map_ops_create
  REMAP:UNMAP drm_gpuva1 a to b
  REMAP:PREV a to start -1
  REMAP:NEXT end to b-1
  MAP: start to end

Case 2)
User provided input range covers multiple drm_gpuva's.

Start is in between a and b (drm_gpuva1). End is in between c and
d-1 (drm_gpuva2). We need to update attr_2 to y'.

drm_gpuva1:pre         drm_gpuva:Map1          drm_gpuva2
attr_1 = x             attr_1 = x             attr_1 = x1
attr_2 = y             attr_2 = y'            attr_2 = y'
attr_3 = z             attr_3 = z             attr_3 = z1
[a----------start-1][start-------------b-1][b-------------c - 1]

drm_gpuva:Map2  drm_gpuva3:Next
attr_1 = x2     attr_1 = x2
attr_2 = y'     attr_2 = y2
attr_3 = z2     attr_3 = z2
[c------ end-1][end------------d-1]

In this scenario:
REMAP:UNMAP drm_gpuva1 a to b
REMAP:PREV a to start -1
MAP: start to b

REMAP:UNMAP drm_gpuva3 a to b
REMAP:NEXT end+1 to e
MAP: d+1 to end

Behavior is entirely different than drm_gpuvm_sm_map_ops_create.

Case 3) Either of start or end lies within gpuvma and will have one
REMAP and one MAP.

Case 4) Both start and end are lying on existing drm_gpuva's
start/end. No OPS.

The behavior is not same as drm_gpuvm_sm_map_ops_create. Here we
don't merge the drm_gpuva's and there are no unmaps.

Currently, we don't want split to happen on bo backed vma's,
therefore skip_gem_obj_va is added.
[1] and [2] are the patches within driver using the ops and defining the 
ioctl

[1] 
https://lore.kernel.org/intel-xe/20250314080226.2059819-1-himal.prasad.ghimiray@intel.com/T/#m77dd9ea3507ed15bfcd2a1c410f9df17f79c69e1

[2] 
https://lore.kernel.org/intel-xe/20250314080226.2059819-1-himal.prasad.ghimiray@intel.com/T/#m2c49bf11661dec9d52edb8bf1bf9a553a709682e


> 
>>
>> If the input range is within the existing range, it creates REMAP:UNMAP,
>> REMAP:PREV, REMAP:NEXT, and MAP operations for the input range.
>>    Example:
>>    Input Range: 0x00007f0a54000000 to 0x00007f0a54400000
>>    GPU VMA: 0x0000000000000000 to 0x0000800000000000
>>    Operations Result:
>>    - REMAP:UNMAP: addr=0x0000000000000000, range=0x0000800000000000
>>    - REMAP:PREV: addr=0x0000000000000000, range=0x00007f0a54000000
>>    - REMAP:NEXT: addr=0x00007f0a54400000, range=0x000000f5abc00000
>>    - MAP: addr=0x00007f0a54000000, range=0x0000000000400000
> 
> This would be much easier to read if you'd pick some more human readable
> numbers.

This was the output which I printed from within the driver. Should have 
ensured it to be more explanatory. Can you provide some input on how can 
I make it more readable ?

> 
>>
>> If the input range starts at the beginning of one GPU VMA and ends at
>> the end of another VMA, covering multiple VMAs, the operations do nothing.
>>    Example:
>>    Input Range: 0x00007fc898800000 to 0x00007fc899000000
>>    GPU VMAs:
>>    - 0x0000000000000000 to 0x00007fc898800000
>>    - 0x00007fc898800000 to 0x00007fc898a00000
>>    - 0x00007fc898a00000 to 0x00007fc898c00000
>>    - 0x00007fc898c00000 to 0x00007fc899000000
>>    - 0x00007fc899000000 to 0x00007fc899200000
>>    Operations Result: None
> 
> Same here.
> 
>>
>> Cc: Danilo Krummrich <dakr@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/drm_gpuvm.c | 175 +++++++++++++++++++++++++++++++++++-
>>   include/drm/drm_gpuvm.h     |   6 ++
>>   2 files changed, 180 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
>> index f9eb56f24bef..904a26641b21 100644
>> --- a/drivers/gpu/drm/drm_gpuvm.c
>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>> @@ -2230,7 +2230,7 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   				ret = op_remap_cb(ops, priv, NULL, &n, &u);
>>   				if (ret)
>>   					return ret;
>> -				break;
>> +				return 0;
>>   			}
>>   		}
>>   	}
>> @@ -2240,6 +2240,143 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>>   			 req_obj, req_offset);
>>   }
>>   
>> +static int
>> +__drm_gpuvm_skip_split_map(struct drm_gpuvm *gpuvm,
>> +			   const struct drm_gpuvm_ops *ops, void *priv,
>> +			   u64 req_addr, u64 req_range,
>> +			   bool skip_gem_obj_va, u64 req_offset)
> 
> This looks like a full copy of __drm_gpuvm_sm_map(). I think you should extend
> __drm_gpuvm_sm_map() instead and add an optional flags parameter, e.g.

Unlike __drm_gpuvm_sm_map() this wont have any unmaps and merging of 
drm_gpuva's, hence I thought keeping it as separate ops is better. If 
you are of the opinion modifying __drm_gpuvm_sm_map on the basis of flag 
is more cleaner and maintainable, will change to it.


> 
> 	enum drm_gpuvm_madvise_flags {
> 		DRM_GPUVM_SKIP_GEM_OBJ_VA = BIT(0),
> 	}
> 
> Not sure whether "SKIP_GEM_OBJ_VA" is a good name, but I haven't gone through
> this to such extend that I could propose something better.
> 
>> +struct drm_gpuva_ops *
>> +drm_gpuvm_madvise_ops_create(struct drm_gpuvm *gpuvm,
>> +			     u64 req_addr, u64 req_range,
>> +			     bool skip_gem_obj_va, u64 req_offset)
> 
> Same here, I don't think we need a new function for this, but just the
> corresponding flags argument to the existing one.

Same as above

> 
> Besides that, when adding new functionality, please extend the documentation of
> drm_gpuvm accordingly. It's fine you didn't do so for the RFC of course. :)

Thanks for reminding. I Will definitely add proper documentation with 
conclusion on further design, just wanted to have opinions on this with 
RFC.

- Himal

