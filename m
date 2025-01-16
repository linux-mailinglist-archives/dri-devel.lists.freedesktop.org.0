Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 527B5A1397E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 12:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F5E10E94D;
	Thu, 16 Jan 2025 11:52:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdmsqnuX";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FF710E94C;
 Thu, 16 Jan 2025 11:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737028376; x=1768564376;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7kyY8omKtvawYQnO7Eu4iV+b0JKPNLJzaboTN3yeg3M=;
 b=FdmsqnuXNFU2EZpIep2otOo7YM0qhSadE93qmZpWkHXfd22oGlTFST5T
 AgygndV3/py6ukt6ehoMNOHeA1SimBBf/hmvbWR7djSeADvCp49zYDA5u
 r+9GSIYHPWRHgj/lOGkONoav5igmvvsTU9p1oN7qfQIbKzkhwe+BfVeoq
 MvV6AdvBMntokemi+x9d1u3+3pnkfVHefGXdncbF5eEHfB4ygkACeEtFJ
 yStSyOWMXS6Ptm5v9sigbCsoEofH5gbkLLA02iiKrktffLNeOPdBh2Gh7
 cZ5k2qWOd7PxspvAFcKZsCe+nUjwyvRneis42Z2FfaKU4Ws+qfhn+nA9r w==;
X-CSE-ConnectionGUID: 0PLZBG9xRq243hviGnSfng==
X-CSE-MsgGUID: xNwhutw2QgyR/FPgz042JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="36687460"
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="36687460"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 03:52:55 -0800
X-CSE-ConnectionGUID: X7SUhyyxRj2+Jcq/OH2ChQ==
X-CSE-MsgGUID: 4YRteIe3Rm+s16F1OdmcfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,209,1732608000"; d="scan'208";a="136315110"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 03:52:56 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 03:52:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 03:52:55 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 03:52:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHvpV5BYHwbFV4uChDqmXCQVxW2me9Nl0DjkUnu4ztW35eJeU8rsYbqe8igMj3mWNMM5HAvLRbWReu0TrYaxlPWjGWYVq+lYJXQuXNHcVmfrJCXwsXCuFFKN2zO8X0YbNeZ9rKrBXE8/S90sFdQknoq0mE9GXUzK4iNb5kz2Oete98sKSOToMLT9Ageetc73g4fEVxOn6jBLbh+hUuBRKcI8rDgvKTh9UD5sfNjtck4PVohdarSup0h5wYdPeNBIPUR+Sk31whWmudOmnFfnM17lAZPKsFT5Bp94FChr1QSOgZ1WPr+AhvfUaRCHsPCK9xk2DJwORFvAXbSq+6Vpkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NsTfDrX83hxkY7bh+CH06kmhL9tw/TjNS/7c21hvkLE=;
 b=k+awKVJwOCFW3lPLA4ZILK7ozuLyGM/0LNGhT99+u0PCKdw+lO9sWleqMjhJi9x2SCbwfnzYxFG4hmTgUMa/H68fEuTe/RGB26xWOxjjD9Rrx0G7BybuHXzxQZ7NDySuk4ELaN3pp62LYyk4ZsrUICMCLN1riu9CA0l8ftEwdVcfaqf3KezTeFsGwDSl34tHrEly4U5rxn0Jqe94QvTANA+w1i8XffG6/CmTn67jiXNzFyZXJzQaFko7zwZVJFN1XGdpMAzD2OoQNwm9jf0myrB/6LCFdm2V19aZvKORPKQy5nx+eNYeBW7CjFCC+0voXz75Yl4Otz2BfejJD+L8HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CH0PR11MB5220.namprd11.prod.outlook.com (2603:10b6:610:e3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 11:52:47 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 11:52:47 +0000
Date: Thu, 16 Jan 2025 11:52:39 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-GFX@lists.freedesktop.org>, <DRI-Devel@lists.freedesktop.org>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/i915/uc: Include requested frequency in slow
 firmware load messages
Message-ID: <2qmdebuh4r5lkrq2ygbmbyjqtxcbinjocnb75acyjtt3jfgzkx@o3vbgzyi2kyf>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20241221014329.4048408-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20241221014329.4048408-1-John.C.Harrison@Intel.com>
X-ClientProxiedBy: ZR2P278CA0039.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::16) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CH0PR11MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: 506a3022-6d5c-443b-17e3-08dd36244bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ek50WW9vTks2cU5JNWxGTmN6a0ZjUXRWN1lRdnZlWFRUTjRyS2o2enZQQ1M4?=
 =?utf-8?B?ckJhL0NNTWZJN25sVUM0bEF6TDVlejdYbDkxSFlCM3cvSWNla0d3eDk1Vnpr?=
 =?utf-8?B?VDNBZ0hRSC9ZTzZiUGRRRHQ4ZUlaaHhHUEY0SzZGeWczYzNsYmJlUzc1b3d4?=
 =?utf-8?B?ckduRjI4a2NQTi9hWHd5dmxwS3g3anZ3N2o4a1FSMHBMWG0rNlNLcWdQQkcx?=
 =?utf-8?B?K2VjWlpjTzNQWEhROUNZZjJ0V3BXcTM1RSs5SlRJWFFoK0hnVjF3UitsLzIr?=
 =?utf-8?B?c1VjR3V2ekJDTkdacExkUndoekJEcW9INjh0OXJQdE1GWHliKzhQcm1YMVNM?=
 =?utf-8?B?REUzM29PamhBc0MzRWNzM1pzMVB6MnBwSFBtZjFaRWF4aUsyS1RBcUR2dTRk?=
 =?utf-8?B?WVpzdkV0dVN6anJxKzdUbVN5Y2duOWJ2bmd6Y3h5eEhRRWp0K013Q2MzSXFO?=
 =?utf-8?B?VXpPY0pocUJHM0o5MDNqajh2Vlp5cndsdHpISi96NlkrRlFqZ2p3T2pVRVlG?=
 =?utf-8?B?eTVtNUNCWEZ3NVRjNFV1YTlOc2luSlV5NDhjMWl5Zi84Nlphb1BGQ2RJYlpn?=
 =?utf-8?B?SVRlMUkzZktzNFFkcmlQeWZRWFNtVjBkK0Q0OU9vRkJXS25lbkdzQ0hoQjdX?=
 =?utf-8?B?NHhzZjh0MGpUMGp6WENTZGFaQkNqTWQ3b1AvTmZocmUvclgwWGYyTW9ibUFh?=
 =?utf-8?B?aDVkNUdxWXJ1bndQa0k3eHk5R1hkMzI3c20vYitDTGh2OHVVS0NEdFVjM2Vx?=
 =?utf-8?B?S1orRVJuWGxNcXE4aUxBNnlRcU9IaFRqakI2aStrdFhFR0g0eFlZSzZoamtz?=
 =?utf-8?B?SG4yY3IrRFhqRzEzMXJMSXFSWEZLV21FWGpRaEJNaHk1OVB5VGJGRWo5Ym1p?=
 =?utf-8?B?Q1lJVTVVOVZ6SFJDOTU2dEJENW5nV0dwYzRFcmNZUXRjQU8xa1M3aytRSE41?=
 =?utf-8?B?cGdvVUhrb3VRUWhGQ3VUTXZuR0pNZlM3MjU1WGpMcnUrUVhkQklJYlBWVFpq?=
 =?utf-8?B?bjBNK2dVcHFOWUlDNlVZaUd2Y1F6QmNHYkNPUWRLSnkzazhrdU5RaS9mdVkw?=
 =?utf-8?B?cWxZbXFsNE51Z1pvYm5LdTNwejJNSXZnWEtyKzQxcFlaQjBSQm9Ud29jRXNG?=
 =?utf-8?B?WGdIeGM3VVBLbmI1TDBlbm5nS0lLQ0JYMUJVM2gvYmtuSE5HLzZZd2lGdmtM?=
 =?utf-8?B?MkR0bUFBbzcrRzNEMVo5Rml4MWk0LzZjVUZUMG0zYTlsVGtyOUdrcUJST3h4?=
 =?utf-8?B?K1QydGF0NEowT0QxMWJtamZGbmdEVFlKWHpzREwvbUo2ZFdrMjlDVHpmbSt3?=
 =?utf-8?B?a1dINUxIcFpWTDh3dTR1UGlJY3BpNjBCd2JCRkgvb3Bab1dGeXQ4RzVpWEk1?=
 =?utf-8?B?N3JMYWd3dGJ5YkNHNmlsUmo3U1Q4ZkNoNHdCSUdlVUtIQVVCSEhDQm9Rb21G?=
 =?utf-8?B?ZWJUbkdwdEV1alo5SGtuQVE3VFBMMXBnRDFXYWpHMU9tamNabG5sMkJFOU45?=
 =?utf-8?B?N2lhRmZrbU51Q2MwVXFSMFlKSXFQVGlBSy9CTytUMHhEck9GZmR4ZnZsQ3Nq?=
 =?utf-8?B?Wm0wMm1abHBTVElqR1RQc3ozK01QV3NaZ2VXc2pXQW44VnBQbXBabDNtSU82?=
 =?utf-8?B?YjhXc2xENzJ5MVdjd0MybllaMFpESTIzQktRZjVPUmllcnZ5UFZidlFuN2hx?=
 =?utf-8?B?aGxNYzBzanRqbUxaSHZ1RkdOdnN4REpZK0U5a2tvYlVrZmpaaFltSERiUTlk?=
 =?utf-8?B?a1hYWUJ3UFFBdjJxNVVaaFEyc3hDeDVzTlhoUmtrNUJkdkFRY2ZRUDZxa2Jx?=
 =?utf-8?B?VFRSb2ZBZjFBd25sOU5BK1VheHhxT2ZGMEVuZWt3MXk1SHZjZUNyb25NL092?=
 =?utf-8?Q?uBx/h8DQBLCjW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUdrMXJBRzFid3dmVjRybytjaWRSRGZJd3Q1RW1ZV3RFUTJ3QlNjT0ZJK3pt?=
 =?utf-8?B?YnVHeTRxZXZ2Yzh3VDdqd1pHdDBnWjJMS1Zsc1VDYUJmNm5ibWxUcTZFOG5H?=
 =?utf-8?B?aHMxbVBwaGZiN0ljUzBLWU1Ua3c2U09WV3A5cTZDWXJCMWxlZkU0Zk1ra2Ju?=
 =?utf-8?B?MnErOGNxTUR3YUJVSllNWGRvemZZL0Y2bjh3RlR6QkZGN29VdjM5U2lLM1NY?=
 =?utf-8?B?NEt3TGJXUGdlekZudytER3VscDd6NnZLSUNlS0lWSktpZUU5WGk3b1F1dzZP?=
 =?utf-8?B?WmFFRGhsMzM5NmdaQ0ZrckdrMU9JckgvTGpIUEdNTWl6WXFDRXo4V0FJa3Zr?=
 =?utf-8?B?MHU3V2RFcXYrV3NtUGtNRC9tSGdMbzNmWDFKdkJGdW95L3VwVTZ4UE9hRlpk?=
 =?utf-8?B?b0RuMTNSNklNc3ZGRjZhekNsNkRtRzhBU0dDRUFHMmNWMGg1UHZXOGNVRGVE?=
 =?utf-8?B?YnYzaEl3enk3YmlpeDQxWlU3WExpVGZVd0ZRcUZpMUgvR2lWOGxJMFVWRU9z?=
 =?utf-8?B?WXdtdUpBMVVsYWdrc2tLWjNkS0t3WTRUUS9VTVJ1ZU9Da0NsS0pieGlVaUlQ?=
 =?utf-8?B?c2x2UUNDZW9RUmJQSXFXR20xSnZOTWFxVTZ3SVFMVUQ5TmJISlZoUXorc3Zu?=
 =?utf-8?B?NFA0c002a2FlaERtMFd6RlRwWGNJdloyQ2F6bWxETUkzWkxmTC8rWmk3YzMz?=
 =?utf-8?B?NEl3MFpkaWtTS244S1Y5QVRBSEFLYytWY1gvZko5elBPVzU5cmg5Q1Era0sr?=
 =?utf-8?B?NlJYN0c1TGh2Z295OTBPWE00RktJRDZuQVdzM2U3b2FpaEI1UStJU1pxQXNo?=
 =?utf-8?B?Mm5ZaWJHQnlkeHdMK2RMaTB4a2lRN004cFN1QndqUHQwYlRucFNzS3V1c1dX?=
 =?utf-8?B?TGRkc2U5MGJGRWp6WmFRNGlJb0FDSlhCSUc5ZFRnZi8xSzN4MXFqSFBHS2dC?=
 =?utf-8?B?WHNLWTBVdENmRHU1NlhNQ2dTT0FKaEdFUXEvVzd4cFFvdE5MYTNZcjBldXFM?=
 =?utf-8?B?dzdsbng1Y29CVjIzVis0YUswaGx1S3B2QzVodG1ZckI2bmdqTmdXdTFSd1Zv?=
 =?utf-8?B?b3BiQzRZdjBRZzJHd1p1NHFNWGlBT003a2FrK0hsaDFOUTRNY1hmdCt2a3NW?=
 =?utf-8?B?Y3dOa3NKSVZWTkxjUWNVZ1dkbFkyZG5JL2llc2hQOEd3bGpQUUt2MVE2MmdT?=
 =?utf-8?B?cmU2UU1JekpIUTdwNDdKUTV4NWJ1cWc2czBGTkFXSzhLQUdpYWcvc3l4ZDZR?=
 =?utf-8?B?UzhaYUhNNjRHRWxDZ2g5dVgwMFpLNmVScVRZc3g0aXBKckZmbU9iVXI4L2Jx?=
 =?utf-8?B?a1MxWFk5cHV0Rmx5VFM5aUJxWitoTXk5dlc3U1B2eXhlbjFpNGlRSFgzTlc2?=
 =?utf-8?B?MTJkcko4ZWNEN25vQjBnVmExM3FYNXJTZ2hjSEh6NlVWcmZaamc2NnM1ZXlL?=
 =?utf-8?B?L05vV0NFVFVqa0Q2YldJZnJPWmZsS0xtb2dBNy9IUzBVMldhT3Nqb000T0pu?=
 =?utf-8?B?b3VOZXhDS2lBNGRsSmNoNUdCZVZ4a0dzekd0UXVGZm9uYmc1S0FweFhxTnBx?=
 =?utf-8?B?Q3hiaUp1ZEY3bjI2aFZISWN4RWZoZ2tyOXZuRlpKY0pKNnMrdVdMRWRJR0xD?=
 =?utf-8?B?Q2hEVFdJQXgyU2szZHRlbGhnZWVEbVRVU0Q1UFh5MThGNW8xWWRsM2xuN3RI?=
 =?utf-8?B?TytVV3F4NjZoREU4Kzg0UldhblRta1o3a2VZSy9BK1I3K0lVNTluWVhqem5y?=
 =?utf-8?B?ak5ZU2ozMDJqeEplamNrVURrdS9JM3ErYU9XVEQvR2FGOWgvcEFlSi9vcmho?=
 =?utf-8?B?a1lac2pvclpaelpaMVo2TmUzTEM2VEE4UzZYL0wyTVpDUDRlcmpxT1VHWm44?=
 =?utf-8?B?NVEyUE8rbVVjazhmMHJBeDBZL2hiTnlVRURkQmt0K0xLVnhaQXFPZFZqRFBW?=
 =?utf-8?B?bzR1SFJvL2g3dHpueFlqcWgxOWhFekhMOWVaWEx3VVNtWVpqamU0U1cya2Za?=
 =?utf-8?B?RjRYMk1RUGdJVExHV1FkU2YrSlJBak9yTTJ5Y0l2dnZJSXA0RFBqdDVaZEI3?=
 =?utf-8?B?Q0lXUEg1S0JieUZXR1FzZ1VJbjFWVmRwczVtUEs5OUhzN1RJeS9YTnB1QVU1?=
 =?utf-8?B?OTNWaFVYTWgxQ3BTalc0WkdBQUkvTjZpalZGd1BjN0RsYUtYbWRvdDZWYTFG?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 506a3022-6d5c-443b-17e3-08dd36244bb0
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 11:52:47.6131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mI/RBeWmjEFEKm1ZOlUhsCEacnL63GtoRDHqhvuywINitHQV5KvfRVrUvbtK9GImrC0us2yJ5XBbxnOD+hfTn9zjK990HsEeELfMr3KpX04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5220
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

Hi John,

> From: John Harrison <John.C.Harrison@Intel.com>
> 
> To aid debug of sporadic issues, include the requested frequency in
> the debug message as well as the actual frequency. That way we know
> for certain that the clamping is not because the driver forgot to ask.
> 
...
>  	} else if (delta_ms > 200) {
>  		guc_warn(guc, "excessive init time: %lldms! [status = 0x%08X, count = %d, ret = %d]\n",
>  			 delta_ms, status, count, ret);
> -		guc_warn(guc, "excessive init time: [freq = %dMHz, before = %dMHz, perf_limit_reasons = 0x%08X]\n",
> -			 intel_rps_read_actual_frequency(&gt->rps), before_freq,
> +		guc_warn(guc, "excessive init time: [freq = %dMHz -> %dMHz vs %dMHz, perf_limit_reasons = 0x%08X]\n",
> +			 before_freq, intel_rps_read_actual_frequency(&gt->rps),
> +			 intel_rps_get_requested_frequency(&gt->rps),
While, <value> -> <value> is clear to me if I were to encounter
this type of log, I wonder if it would be apparent what "vs"
means here without having to look into the code. Maybe it would
be worth to add "vs actual:" or ", actual:" instead?

Krzysztof

>  			 intel_uncore_read(uncore, intel_gt_perf_limit_reasons_reg(gt)));
>  	} else {
> -		guc_dbg(guc, "init took %lldms, freq = %dMHz, before = %dMHz, status = 0x%08X, count = %d, ret = %d\n",
> -			delta_ms, intel_rps_read_actual_frequency(&gt->rps),
> -			before_freq, status, count, ret);
> +		guc_dbg(guc, "init took %lldms, freq = %dMHz -> %dMHz vs %dMHz, status = 0x%08X, count = %d, ret = %d\n",
> +			delta_ms, before_freq, intel_rps_read_actual_frequency(&gt->rps),
> +			intel_rps_get_requested_frequency(&gt->rps), status, count, ret);
...
