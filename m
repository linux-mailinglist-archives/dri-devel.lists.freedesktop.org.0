Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7402DA20AD9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 14:00:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D112810E355;
	Tue, 28 Jan 2025 13:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GescG4KG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4116D10E28B;
 Tue, 28 Jan 2025 13:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738069244; x=1769605244;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y5iV93sZ468Imywd3VZGPdooHdt1k1qLTDpMtfeNVR4=;
 b=GescG4KG2qmXU4SkahP8cKnlxUsGYMGzxBHsBl12Am2VRMcEp0l3Z5B4
 29e33tCyNp/hItMozqrUgVih+ln+ote2X6WBUSRwP4+9RxFzZmaMZncDg
 d/UzX2O7bS44gY+dX3CMZ/Y3laireFuREzyIbX3HKNQMG6FPN2I0vK/sE
 5kvD9KKp41fvwnwbgLS02IyS4mfqxY4Nt4rPs6NseH6vw6T27UuZ4x3ms
 2EJbq4fVjaFdzz2f0dhVR/edrDXmymZSe2+4o0zoe0IkQ3x29OmiaiJF9
 N/cJ28XwSHPHOqDlRDsDRnFkclgjvc5Txg3UX02Nu960UTNX5e9YNpDTW g==;
X-CSE-ConnectionGUID: diqJHRGGT8i3V93WIcOuFw==
X-CSE-MsgGUID: W/DCtK4PS0KuUd7ivo2WCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="56092436"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="56092436"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 05:00:44 -0800
X-CSE-ConnectionGUID: iXeX1gIzTEGfVCj1hTeNZw==
X-CSE-MsgGUID: wX1rPTp8QX+3WFrjsHJspw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="109256359"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 05:00:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 05:00:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 05:00:43 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 05:00:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frg+w9VAmkOL6/BZdonuC3c61A1qjosVsTd8IBLirfd5m1sXcacVVHkAByYwPya8b5ICfhIlJtXApP+Npub2upzAOh7kdhpT1obAd3mZ4QPfcPGs31gAbCDSO/EQxKzZNYb/i+Xti4B/8vkKIM6gvHbPopQMLtbtR8UDyLT6ZF5L8oQsYycbWPTH2n8WP0Rja8O6VZd0grEkHs22JBc4GT1QlrRJ0VKbbH6oEO1mjnLIZF2V1UbAhQ8kU9IR1JjxwvfKx/ZS9K6g1NghW5AHJI2IrY5IuYhjQm2/irdwYM07EDHj3UnonHkafh41+2kVTekV1eK5+ZEP8/OYCgozoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg/Fb9ME/8XS56zuvon8ovYBeM1aEBb2qgSFVSMKsVM=;
 b=yKdVnZjp3bhhRZ4DSjjWQv5V75mxJBAMLSvgW2gfkscIUNZJOfEG7f8oQfwb2wE3dLMruxmbZ6vw1B8VM6SO01OavtDBkps5EjIak+dAp4W38rSXuGiNAm0XVpAUmsHEeErDQ9QwNgHjtGwJkTmLnvPevCYI83R6Y5t764DTvAsq+wJGHxRZZRFI63/m6me0ijjV8TwaqQM7TmXAdC0y1bXf5Klwo8/SoTKLdEvPXRSmbrg+En8vjP9mM5udsx3eHpuwDQ2SeNkOre1Dchkkp+emgvG+fNjzjObNXlO261naYiaw86uyCdAwY8QXMblTyv6B+DVKsu0g0Zyi0aT2Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SJ0PR11MB5118.namprd11.prod.outlook.com (2603:10b6:a03:2dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Tue, 28 Jan
 2025 13:00:12 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8398.014; Tue, 28 Jan 2025
 13:00:12 +0000
Date: Tue, 28 Jan 2025 13:00:07 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Sebastian Brzezinka <sebastian.brzezinka@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/selftests: avoid using uninitialized context
Message-ID: <atit6no46n2udzxp6mgb2uxwpy2eh7uh32wm37rtigyulj2v4z@peamwjrxotad>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <seffzgr3ptmwyrk4rmq4hn5lx5lljm6zoan4w752dovrai4ajg@slooah72lixx>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <seffzgr3ptmwyrk4rmq4hn5lx5lljm6zoan4w752dovrai4ajg@slooah72lixx>
X-ClientProxiedBy: VI1P194CA0031.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::20) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SJ0PR11MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: e39bb7ff-4688-4acf-da66-08dd3f9bb38e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3N1T3lvd3BGUlRGcThoMEpvVUN4amIzSld3eVV5REM1ajdqY1ZabjJpdFJX?=
 =?utf-8?B?bVlYK3VaSHUzNDFiYytzMUdIMmxFVVl1ejhCcnBHaVArWjYwRGRMQi8rM1Vm?=
 =?utf-8?B?WmM4cFY4WiswQytYVFI0OXUybWt6cnBiRmVEUVE2QllTQlZVYjlYMWlBSzJ4?=
 =?utf-8?B?MFhrQitHREIxOHMzUDI1d1pFYUtUNllxY1hvZzg1d1E4ZHRBOTRXdWhNNFhR?=
 =?utf-8?B?RE1yUVRBVzY0eWZ1bXIveFRmSjJXeVBGNnNVRHhOVUNIazl6dGVsdTYzV3hR?=
 =?utf-8?B?enZGYjlmeTRVL2REUTI2QVhVMG1JeXpNVmt4WlJTZlNDeVBZbWx0cXNLaFRI?=
 =?utf-8?B?KzV2cm5oRXpUQk5oV0F4T3FpbVNZVlZMSEF0MUtydDVabU9Xd25VbUgraDVm?=
 =?utf-8?B?WHVlbEljUEhONi9LVnQ4WmR3QlBDSHRxQTBEb3pPU1lkWFppVXJsU2tXck5C?=
 =?utf-8?B?dUZEVDhJRUFqUTFwYTJKczlWd3hpdTBwVExuUlF2SUFzcWd0RW5nSmJwakho?=
 =?utf-8?B?UmJtWCtNNGx4WlBnQUlKem9wSFlsT0lUM0dPOW9rYmJhejdIeUs1aXFNVENj?=
 =?utf-8?B?Z0xING9QRzREOTlFeGdLYzFmR2U2ZzNiaUUzQXpxckRXT1hUUEYvSy9TZHlK?=
 =?utf-8?B?czlxWGtkdlNya3JBOE5ISFFjNTJiWkNWRkxBTXdyaTJ2ZVBiZGJPU1NjRHpV?=
 =?utf-8?B?Y3MrNStlUDd4Zlo5cHoxWmR4N0RRQk9CeEVmQVJpTzlaY3FnRThEaG9sSU9E?=
 =?utf-8?B?OEM5QVY5MXJKT05STWptNWF3ZXkrOTdSeWFmK25vK2NmYnczdENOU1RqcVc5?=
 =?utf-8?B?WGJWbDRXbTZEdnpiNXJJMm9rSTZaZ3lzcnlXM1FWbGpGZHBLNnZMMWwxNis1?=
 =?utf-8?B?V2gvT3hWUUJRdElqZzQzMVYrUFhlNGo2WEJWU3VwVEl6Tm1tK1FOUDBPdTRR?=
 =?utf-8?B?V05ua2dYMDdldTdqNFVkNVB5ZWQxREliQndkcVZIWWIrT1o0bERFM211YnBY?=
 =?utf-8?B?TEhLWTJGc0ZPd2QwbitJL0pkVkNOU2VoVnNtb253TnF5b1pleC9hUlgwazRR?=
 =?utf-8?B?bFFkR0ljQlBpVXE2VUhKYmVWeElDNUU1eVRSb3NFRG02eUV2VWc2TWZ6U2Y5?=
 =?utf-8?B?ZVRCQnFjb2FkMkRLdlhwSGpaUUlybHpnbldCL1pEZ1pVRERvTTVNYUl3cjNy?=
 =?utf-8?B?Yk8yeDZqWGw4bDZaSkx4Z3dKNUNUZmowSzlCUDBONkl3TkgxdnY0TksveVRS?=
 =?utf-8?B?alUzS3M1Mm80bDR3TUVVM0MrVDg2dGhvbHNBODZwVGRrdHJyaU9iUThlbDhl?=
 =?utf-8?B?L01CcGpCMzJsTjdIMkJyQW1wc2VDQ1hLYTdTZ2xTcTBDOEtidHpzUEFXT3M2?=
 =?utf-8?B?T0FjUDFUTXJ6aG9XKzEvdFdrQ2t2NGliZUFrZmNib2s0TVBra0FzRzJPbHJK?=
 =?utf-8?B?N0FmcEtsNG82eHJqeVNERmJDejJaQ0RESHhuSGxvQ1BYdU1jbkN3SXVhVlFl?=
 =?utf-8?B?TnZmSTRZSFE4NXI5VjNEV2F6NjB6RXM1TExZUnJQN2xNeHJxZzM3Q21JR2w1?=
 =?utf-8?B?YW4wV01PMk1PTUFGTzRpU0N0M0RDMGFGb2dmZzE4bWY1V2JwRmNTblBLNGhr?=
 =?utf-8?B?WVNWczNod3VDNDk0aGtTZHg2T1JicE1iUnZLQVVpQ1VGK0d4MW9wRjRuQ3dK?=
 =?utf-8?B?UUlRMFBuMWhFayswNTBnb2NabFNVS2EzQWpJS0dIemQxcDBTenNSdENNZ1Ju?=
 =?utf-8?B?T2dqUml6Qlh3eW5USnJKbVEwbDNUR3dwTnUzZWxhZUVxcE9ZQ2RndEVoUkFu?=
 =?utf-8?B?UUZnM1ZHY3lVUExqRnROYUVQWkl0T2lOTWU0eU50YkhNNTRxN1ZicWxncnJj?=
 =?utf-8?B?SU93UHlsYmJZelp0TW9YMlRWVzRrS0sxUjNtaHorMXdzMVJMVEhKcmJpeGpx?=
 =?utf-8?Q?f6ObhvHKllXpHV7lUMoemPuRGUODoI49?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXhObzNxczcrMTk1c1V2RVFUaDIzWm5OL0VLMU5zdVNYRlNOaVpHb09vNjJR?=
 =?utf-8?B?VXVJakZ0RTVMazYwMjNZUTcyWFU0QXE4NjBIVXZscFVYcUhzOEthblhibEVK?=
 =?utf-8?B?SzJHdjVmM0FIM2xjK0RiMGNoblh0ZmFmcFBOQUVHZVFMTTlKQUhvbXFYYmxl?=
 =?utf-8?B?eDhTSjI1UHlQNktlVEN0dEsydDNjejltei92TjVSM2pvTHFEMjdBa0UxUjZ6?=
 =?utf-8?B?UzJKbWdEVVNFUHhrTE5Tb3pMMlNLaHpxZ1NDTStlYnpRaDU2NVR5ek50ajdB?=
 =?utf-8?B?dGxSV2NXWDZTN0phOFVoZ1ZBTTNIcm8rOWY1bVIyRW9qZFBrYmpaSFhFN3ZO?=
 =?utf-8?B?SDlPYjRCT05xSVkzZnVLcDJnMWtheGVRcmhhRU1aYlJicFhLMEFYOUE0dDgr?=
 =?utf-8?B?U1BhYlNkVjVRNFFpVENDbVpTUlh0R20xbkJMelovY2JHSXRZVkZEcFFDUHRm?=
 =?utf-8?B?UWUrditmRjdVVmMzdmZqMU53c1ZGZEphaFFPRWlWeWxTVm54Nk12bW1vR1FI?=
 =?utf-8?B?QXM1dDR2RkRvMDl4YWJ2dktKRDBpTzQxeDcvQ3FqYzhOOXBINjhKNDhZWStt?=
 =?utf-8?B?NDFiTmhNS0pVajJKa1o1Ykl4WnFhUU1QOVlpOTZadGxKN3NMaVZ6ZkJSektw?=
 =?utf-8?B?UWx3NHZFOFpKM01nT1E3alJSb2s5SEMwTEZXaUhnZ0EvTEpzNFNYa0Rkb2pE?=
 =?utf-8?B?anhmQWl6RHhRcmFxWGgzKyt0OTVReGVETFBZbW5Dd2Y0emp4aDIvZE0rdnQy?=
 =?utf-8?B?WktwNlVldkVvVDM3TzBoblozWW1ZU3FKOWpyZ3hCTmtPQ3puSHk3aDI0UFl4?=
 =?utf-8?B?QUFHdGpMZGlUSUhHOEFHdDNBT2NEc1FldzNudXFjTkhBVDA1ZzNNVTRLWGRD?=
 =?utf-8?B?dlp2SWN0ZnpzaDRTL1o2eE9mTlNWUnJGbU5ZeWJwZGJTdlRPZHlCV2ZyWlln?=
 =?utf-8?B?MWZPWDRXekdaMENuRkhGRUJFc2UvdmFiMmlvdEljZWZUcTlpemR6M0tMYVdI?=
 =?utf-8?B?L1N5Vmh0eU8vUWRWSm5uTVFBZW1zS0pzaURLUTZwMFRzaG9EZmowc09QOHFq?=
 =?utf-8?B?a3JnazRKdDZwdFMwUmhSTFp6UkFLZ2h2QjFGaUZsb0lmM0FUOEtVb2xudUI1?=
 =?utf-8?B?R2s1Tjg5T0s2VkNWMzBXQW9WOE0vbFM4Ymp6SVhMWDN4bkwzZEl1U2pZWlAv?=
 =?utf-8?B?aXRUWkhjZzNEemlSV1FpNE9YUGFXa1VyN1Q5TDl2R0NiVjNFUTFzaGdHam5O?=
 =?utf-8?B?K3MzOFdTdVlFbUFjdlBlV1g1MmlCSkdqY243TTJGZ3lZU3hJVVlncTBJak1I?=
 =?utf-8?B?bUtYaUM5dlQ0L2t3bU5UOHFFVVB6SnlZaDM5WXpmTjFHR1diZ2hlQlh0WDJI?=
 =?utf-8?B?Q3VPUnpLWVRuU2daTG9zWmtnYThvOTFvSFdFeHM5NWFwVXNGUTJtQWRjSERl?=
 =?utf-8?B?N2lQaTJ1ZEdZeTU1b1VVcVRlaWw4QmtvcG05T0lJYTN2ZDlQdzZEeGhkckk4?=
 =?utf-8?B?emt2Ym9EUGtyY2s2UWNmeFJpTlM4UE5IT010WnlPSFh5QmoyS09VMS91Q1pM?=
 =?utf-8?B?Unh2R2F3Z0pxc0lMYStmbFQvWGZqdWJZRWNpenVPSFhMMlBVbGxjWWhrTEZV?=
 =?utf-8?B?akNydVNkd0xhYTlEMmlZVGtLbi9US01WR0hvRUdFMlZhOTN5SXlLUm42OCt4?=
 =?utf-8?B?eDRRUzFTSFZ4T1ZpUGVFUEliNHNYaUpSNVcxU2pIY3RUL3p0MHJ0WEhXM2ZR?=
 =?utf-8?B?ejBJY3lLUEE2SCswRzd3L0ZodzZKMFBkZG80eGx2dlYvMkc1UVpNSEF0ekNo?=
 =?utf-8?B?b1Q1RzFkVzdKT1B6MzBZVkwvSy95QUhqSTQ5OXpha1ZaTVdoV29wdy9hcmVv?=
 =?utf-8?B?ZC9jV1doRmgvdWdObWplWnBnV1RFVGFnZVBaS3g3cmhSMEFtTDJ6SFk3WmNy?=
 =?utf-8?B?aUtvWFMxN3NlVkQ3NG1rdVlTWkFaVXd4Z3VZZVZqRDgwRWRLNEw1MEJXRDM1?=
 =?utf-8?B?bE1peUphNTZ4OTlQMUtQNXNIa1hiWDFWU0FJV09DcHZDejlhYytHT1k2UVdv?=
 =?utf-8?B?N0E2YXBkWmUvdnFXUHA3Nk1MeXZEQ1RQVzhVdXMxb2tHKzdFSktNcGcraFov?=
 =?utf-8?B?UDRLRE91aERFdlUwWk5sdjI0ajEzNDBpRmhJUWFsSG5jcTFEWmVVaEhVWVhJ?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e39bb7ff-4688-4acf-da66-08dd3f9bb38e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 13:00:12.2563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSbsUt4jUTBTi45igjWpxtC4HGEDmsfLwYW8jUUruU5TBlF3qd28E2yNxbjTAP741hNSwRkmlfr/fNeC6SxhGmFc7UUAOrArQDj68pSD8QA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5118
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

I sent an earlier version of this patch by mistake (it includes
indentation errors) - I apologize for that, will fix this in v3
later. Sorry for the noise.

Krzysztof

On 2025-01-28 at 12:53:44 +0000, Krzysztof Karas wrote:
> There is an error path in igt_ppgtt_alloc(), which leads to ww
> object being passed down to i915_gem_ww_ctx_fini() without
> initialization. Correct that by putting ppgtt->vm and returning
> early.
> 
> Fixes: 480ae79537b2 ("drm/i915/selftests: Prepare gtt tests for obj->mm.lock removal")
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> 
