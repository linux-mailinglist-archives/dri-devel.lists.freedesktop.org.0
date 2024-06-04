Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4120A8FAABE
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 08:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203BB10E426;
	Tue,  4 Jun 2024 06:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/bjta9B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5948310E426;
 Tue,  4 Jun 2024 06:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717482516; x=1749018516;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Us1Wmny8sujndOkKw11PHieUzzGFmjOxj9ct4B6GSPQ=;
 b=m/bjta9BdZLeMWfANODo6CAHPHcz0io76PfJCnyWyO3lIsYErHbfXRsQ
 OGnAVd+kSuX3ipI4Yuy+UdG2rPwUxw6y5qki/GJL6bq7a81ljKmkwTynB
 AskHRWOrShfvQnwL0y2LfbHy64OkXvH9DjL5e53TZFyCNNLphm6+6lwwS
 YXjY49jVpS1eKkaAsxjiv9BoIFmpGOedNq8JHgD5P0eEi4DXjS3Q4roj4
 +a1n6TX6Qk2MNtTLiFgSHj+Ldjri+e49FbiSfoXYdwuipRW8wOL8Ah2Bz
 A2xOlI6c8/pogKZq+OHPzxDM6mTtpScBN5uDz6W/rZboMifPLqO7CeNvp Q==;
X-CSE-ConnectionGUID: DJhVexILSzCeavji4a8Rpw==
X-CSE-MsgGUID: uzSJMBk+TkalzsZlB9rAtQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="31538869"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="31538869"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 23:28:35 -0700
X-CSE-ConnectionGUID: 8vR8/M3dR8+pr//p+hvrqA==
X-CSE-MsgGUID: lNQeK0oQS6abKSmdpwoi6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="68298977"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 23:28:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 23:28:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 23:28:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 23:28:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUG/MN4XXMuGPuemvPE8EKKInei7WJUW0OyNdBZbKT8VzZzVSY29Cvy1z4p6FbuuTqQGGsyocYz+ulIyjS7Aqs9JoFdJMF1qdq0Lere0h1KbT2DxqYdS5RdKfOWTIeZt1+1fte/hC8kp6CTy4dL+k2qS6tvIGNJNd3DJIz63MKYpahy4JrOU+BsAenf3PazcTS9jXlkEvdNgF9Mny/8NR/FMm0sC+IMnScyJ/q0FvMiIad6C0VsxY9TBbG3ZzGolCbuBsIelR/vnPmN7J3qnV/nR9DYg//rRM1h2eFkzsM0kGgjLcoClYR85ramqKh79XGZq6ref564/kpvba51Upw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KT4AqCfyp+ST2eGCkftRrd41IDxQes/BwdAV+kiS3y8=;
 b=bg+QMkdNPeGaKRKHWunqmG3cgymAXbUM4+7UvBbQoKBa3qkCNcfbzQ6lyEDesRx674vdLJTUE5sDzpJtcqx0ZYaC7UMUIa/9xVv8r0N6xecWlSn63QYn3GI+ARqV8tAUMfPPy+nuQ2/ayoSyWcctP2DDHb4RklqJEEMWd8HpWVQRIcZCuUjOX1C99E5S0aTCwyVWNWwckonjY/ga2z3OfuS6Z6JOqYtYKNOF9iluNYigWO06BVr7QMs1OMjONA/TvZd5hmRDPy6Me3q3dvDqj8yb4PDEAGpBJ6k1VdCpzDkh7dLeG9ofzE2DIqrlDqxoF0fUuRoGUcfyoNaZ0NeVfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH0PR11MB8168.namprd11.prod.outlook.com (2603:10b6:610:186::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 06:28:27 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 06:28:27 +0000
Message-ID: <af08940d-b82b-4d50-b495-7caf11869ada@intel.com>
Date: Tue, 4 Jun 2024 11:58:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/8] drm/i915: Define and compute Transcoder CMRR
 registers
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240603054904.222589-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240603054904.222589-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240603054904.222589-3-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH0PR11MB8168:EE_
X-MS-Office365-Filtering-Correlation-Id: a773bda7-9ffd-4105-eb31-08dc845f8b7d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZThGWnlEc3Z4MnVTQ3EvSGV4MFJ6UUlUUTl6WFBoTThReTk2VEpuc2pUL0xW?=
 =?utf-8?B?MzRGc0V0cmlWYVN2RXpXK2VVd0x5ZytCYWNZNFVaZk9GQjdWK2dZQ0pDMEhV?=
 =?utf-8?B?WWkyYWcwMVA3b3pSNysvTnR0TEJiMnQzVTRlWXFEYlZOUlU5M090REZhdUZh?=
 =?utf-8?B?SVN5c3FoWW5URER4L0RET001ekVCZGgzQnJqSU5Xb3o2MU9UM0dKWitpV2NC?=
 =?utf-8?B?RXhSOXZlS21mT0VWdEJhYkFnSGJONE1WakMyczNBblEyNHFaZEZhaGd0L0k3?=
 =?utf-8?B?N1dUQml1R2t3MGgza2JBWjczNnZUYmdDbVBFazRxOUNueEhibWRTVXZQRm1R?=
 =?utf-8?B?OW5FYVNJcW54TXI5UHRmZm1RVHY2b3dmR0YyeHN0RGU2QXFVQlFUdTh5ckpX?=
 =?utf-8?B?ZWZ0MXVkMlFJSm9YTXVxTEtpMEhZWmljRjYyc0FRQ0tEdGRjckVkeE1vYXRY?=
 =?utf-8?B?N2NwUjZUOFJKQzB0OHB4cnJiOWVJNlV6eXRHL2FmVldzSTcyRFR3MzlOT3V1?=
 =?utf-8?B?WFB2cDhMMjVTS2tkanNTaGp4YVpPL0w5Y2V4SE5XSlNmSkZLdFdlNnFOZDcr?=
 =?utf-8?B?bDIwa2huWnV3Mng2eFY5Sk43eTZJc05pMXRsdlQ5aUw0ZGhjd29mZGk5Sjda?=
 =?utf-8?B?TjBGdHNiNzY0bFIrRDJueXRWUGU4ZUhpUXZIVmlkTGdtZWRGRFJxbjFYMUNP?=
 =?utf-8?B?ZmhLYTAvd2VoSjdoR3N0MWdrQ2M4MW9TaUM1VUtadWpHYlNIQXA1cWNsVmxh?=
 =?utf-8?B?V2xOOHZIaUg3TGdsdzhCUlQwQnpxZzVrd2pNbEptQmNCQnozQVZieDFTWHky?=
 =?utf-8?B?WXcwMGtadzVBY1l1WGFhYkY5TWl4eCtIdzBCcmQxelhlKy9UTVpZVTcrb3do?=
 =?utf-8?B?SGd5elA5ZHU2S3ptZXFQTGdtTmJMZFdEa2hoWC80WTlBYzNQektMdWF1WTMv?=
 =?utf-8?B?eUhGVW0wS0Z4ZlMxYkpBUGJvWkEvMHdjUDZWMU1zclR1aHZQV0o3VzhvWlpG?=
 =?utf-8?B?RFRZMTNtd2lDbWdlNUtMcG5Fd0hDWlBXWDREUzdCVjFKbXlvMmtNQzZDSWFR?=
 =?utf-8?B?U2dMejUySkpaT1J3cVNqTGpsa0pMdkM5WG5LWUxZajVUTWcrOVNhbUljNldw?=
 =?utf-8?B?ZTR3d1FScTZFREJOQldUc2Rmb3laUDJaWlE1cTdKK3NZWk1ULy9KWEtEa1Zv?=
 =?utf-8?B?Rll4T2RPeWNRYzJzajE4bCtRR08zM24wRm1oeGNUWVFnWVNzeC9GSzJReitC?=
 =?utf-8?B?NjBnWGpHeTNCY3Z6RVN3czBKNkVwSVUxRjdyb21EQ3h3ekI4R1VDamZlYTU2?=
 =?utf-8?B?cE52bU5mVm94c1VQQUNoZnZvaHk3L0JlQWJ3V25saldCcnAwNG5VVDBPZ0d5?=
 =?utf-8?B?QkpVU2c2QTg3NXNobWpKYkRZWUEwNlQwUWNScGpsWjVCRUNjYUk0NThyUVRI?=
 =?utf-8?B?b1Z0S1h5TXhvTUMxVHdGR2tnLzVGTW91VVhoVEY4bGFIUVMveEVJaDFFZks2?=
 =?utf-8?B?YWdiQ05RdVMydUFXckdhQW1qSVRlcysrWjlXamNQSG45RGh3NndSVGN1L0xI?=
 =?utf-8?B?d2NpZHgwZlF2Y1JGRTk3b05WWHZGT2RiRE5BeWFPTEs1bEQ2RThrVEw3T3Ur?=
 =?utf-8?B?K0x4Zm04YWxRajl4R29pcHROWWo5Y3RQdkt4dW9oUWYwUWdYY1RocWhmb1h5?=
 =?utf-8?B?V1lHTGd4cyt2TWNJMk1URUpOTGRiSmhaZzZlM3BIZnVPT3VwVTQ5bld3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXlxQkZVUXp5VjNrYXU3WG5CMXZUK2R2ektNTFNrMDZZcFE0ZnZFcDYwL21I?=
 =?utf-8?B?K2w2ZEtOK1ZPQzV2MFdEY0cwNmkwRkxMaklpdHVsVHh0YTlPb3g3WjZ4N3hw?=
 =?utf-8?B?N2VTNzlCVWlWUkVCRTVXMzMyV1I4OFZzbkN6RVlaejlBWWpvYWhIakZEejhY?=
 =?utf-8?B?aG9YVU1HbXVSRk5naUxDVXZZVlJlUkN4SXdNSXduSkE0SG1yQlVpYzJqT1g5?=
 =?utf-8?B?YlpiLzAvK1NSVllyOEdHakEvVXFnaDJmOW1tb0FzMDJQWmFOdFVFdmN6WW1o?=
 =?utf-8?B?QjIrRklYOXVyWGdFazVjU0JXYXJqcTVLbithdEVONjFRaDR0ZU10RjV0N2M3?=
 =?utf-8?B?UzcwYWxyMCtuVXpQdlNtUk9BYUxpTVh5SStKMlBYUldxeG9ucXE1VUkveWdL?=
 =?utf-8?B?czBOdForMk85YmRJNFBSS0kybkhGU3JwWEttcVNVTTArQ0xXZHFlTlVhM2JB?=
 =?utf-8?B?VUxPT1RuR3JROXZIK3Mxa2xmUEVaT1VwWlJDS0F3cURZaHZHc29NRFdaUFow?=
 =?utf-8?B?Z0NlcGV0VGdQSytJUUs1Z281eGoxbDUxNW1NUDZac2tycVJabW1xYzNnUHVY?=
 =?utf-8?B?blhudzc2WDE5Tk1yRFh4UVZuQkNPV0t4U2FWUEphZmJKc2llMW0xOHBGUitk?=
 =?utf-8?B?cnNaZ1VkUmJZQWgydmxaa1NvUGlZeUF2VzlNZ3JzdXZEOEJ6b0liU240dXVk?=
 =?utf-8?B?Z0xKRjgzZnpydEZndk5ncVpOM2xqdEFHTmMza2M4eEJqcUZzbDAwVnZIQXVp?=
 =?utf-8?B?anBpRGFYZTNDKzlNOWFBT1owaFdJcEFlL3FrMXZZbXp1ZzI4dzIwd1FrUmN5?=
 =?utf-8?B?WDFaaXhFc3E2NVJWMFBoVEFiN1JTS0hkek5qZVdrWnk0bVA1RW5veEJUNEVV?=
 =?utf-8?B?eC9WY0tTRDE0WXcrbU1HeG9rOW16M0NKSkhGN3ZTSmdvM3VibzV2SVZOQU9N?=
 =?utf-8?B?b2V3ZVNhaTlRNk9hUEE0cmZyZnpnQ1FmTit3Ny9tdy9OYkJVZTY4RUxUMFNK?=
 =?utf-8?B?S3dJZGk1ajc5cHVIbTdqVEFGeWRyWGNoQWV0d0l0Z1pha2htS3g4b2FyaHNW?=
 =?utf-8?B?eUtZUGx1NGxZd2JmeE5GamNDelJCSHNqeE9NZzg1Q1RKdEVSZmFCa2hSdmZP?=
 =?utf-8?B?U0NEaXp6eTBmRmR6R0VFVzVjVDNhY041eE55VnNMa3IvS1ZxTWlWQjFVVXFM?=
 =?utf-8?B?MUhPMzhCMllMc1FwZC9FM3BRU1lYRzlQK1l6VnR3ZHlZVXI5NFVyTTB5Y0oy?=
 =?utf-8?B?ci8yMFBPYUpRemFBaUtmUFNZVXpXN05ObmZDazlFbG5IK0FUd3BhZitjazBI?=
 =?utf-8?B?aFp6UVF0REZ0SS84WU00UzlOcC83OEJvdHdzQ2d4Y1dJbHNraUdld3laekQv?=
 =?utf-8?B?ZmFLWWkxR1c2aWJWZWNkUGhhQmJHb0swNzkrLzVVaGYvU0E5M1FXTEtad01H?=
 =?utf-8?B?RDZNNXh2RTRmbzRLZUgwR0Zhd1NNRmU0eVhnWmZWU2FteWFJcG4vc3FDWnlI?=
 =?utf-8?B?czkwazkvcXR2N2lEOWZVSnkxZm50WDJPRFQ5TTN3VnJJNkhSRUpMNHJNYW92?=
 =?utf-8?B?QzViUjgzOUZ3WXJ6Q3RlSVdrR0xMZmtIaEtzdEJ2SmxXd3gyOG5DUUpiQ3ds?=
 =?utf-8?B?aTRWeGVwSG5vbWZNa1F1dzhFdlE5OEttSW1tZHE4YnpGZ0g2cEFxZGxhMkFZ?=
 =?utf-8?B?WC9HMm5tYlBXUXZrZEVWNG1jeVlnT0pRaWlDOTY4WDAxRjJkN0tYaTJ1Sk9i?=
 =?utf-8?B?M01kN1Z0R0NqWUZSUVIvdllPWmVwZi8zK2xNRlpaN3VJMFMwN0NyNVplUDVJ?=
 =?utf-8?B?RW4rQ2JHN01tS3ZMWWZ6RWVqbnJNamZING1vN2xvc1pQZ1JJZUkzOTFTejVh?=
 =?utf-8?B?WmRRbGFwZkdvaEwzUlorN0VPazBwUE5wN3FhVk9lYlBvaHU2MkNwbzNOZVJj?=
 =?utf-8?B?R3BUbHhQSkE0WkpDSWkzSkdyMnFmSXd2cGxQOVB0am1tOFVOZExNWHpqRG9N?=
 =?utf-8?B?a0oyKyswajB1cm1LU1RVRVhTZjgvQXdFOTRBMTdDcWxMalI2Uk0yZnNLZFJx?=
 =?utf-8?B?VGZDV3AyWEowT3ZKaWZwYzlkUGVKbmYzRzZRbzZxTWlRM0Jzbmc2SytSRjg2?=
 =?utf-8?B?RmVGbUx1MFBDbmJmT2pTbm9raWdGT0hQQ09iaDdFaTdBcGtwMEk1dkkyOUFW?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a773bda7-9ffd-4105-eb31-08dc845f8b7d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 06:28:27.8105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ns4aBpT7BpGudl5zK3ku9rnL2gMA6tJno3YmF8Y9RZKwEkP1x9M7fVYT0Z19x7S8rQVyZ4O2TPQH7RxviyGe9fjQKexsLpWYe4OKyaGvF+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8168
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


On 6/3/2024 11:18 AM, Mitul Golani wrote:
> Add register definitions for Transcoder Fixed Average
> Vtotal mode/CMRR function, with the necessary bitfields.
> Compute these registers when CMRR is enabled, extending
> Adaptive refresh rate capabilities.
>
> --v2:
> - Use intel_de_read64_2x32 in intel_vrr_get_config. [Jani]
> - Fix indent and order based on register offset. [Jani]
>
> --v3:
> - Removing RFC tag.
>
> --v4:
> - Update place holder for CMRR register definition. (Jani)
>
> --v5:
> - Add CMRR register definitions to a separate file intel_vrr_reg.h.
>
> --v6:
> - Fixed indentation. (Jani)
> - Add dependency header intel_display_reg_defs.h. (Jani)
> - Rename file name to intel_vrr_regs.h instead of reg.h (Jani)
>
> --v7:
> - Remove adding CMRR flag to vrr_ctl register during set_transcoder_timing,
> as it is already being done during intel_vrr_enable. (Ankit)
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_display.c  | 23 ++++++++++++++++++-
>   .../drm/i915/display/intel_display_types.h    |  6 +++++
>   drivers/gpu/drm/i915/display/intel_vrr.c      | 20 ++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_vrr_regs.h | 14 +++++++++++
>   4 files changed, 62 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 7370acdd6b8b..29d750d2e6f7 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -1005,6 +1005,13 @@ static bool vrr_params_changed(const struct intel_crtc_state *old_crtc_state,
>   		old_crtc_state->vrr.pipeline_full != new_crtc_state->vrr.pipeline_full;
>   }
>   
> +static bool cmrr_params_changed(const struct intel_crtc_state *old_crtc_state,
> +				const struct intel_crtc_state *new_crtc_state)
> +{
> +	return old_crtc_state->cmrr.cmrr_m != new_crtc_state->cmrr.cmrr_m ||
> +		old_crtc_state->cmrr.cmrr_n != new_crtc_state->cmrr.cmrr_n;
> +}
> +
>   static bool vrr_enabling(const struct intel_crtc_state *old_crtc_state,
>   			 const struct intel_crtc_state *new_crtc_state)
>   {
> @@ -5054,6 +5061,16 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   	} \
>   } while (0)
>   
> +#define PIPE_CONF_CHECK_LLI(name) do { \
> +	if (current_config->name != pipe_config->name) { \
> +		pipe_config_mismatch(&p, fastset, crtc, __stringify(name), \
> +				     "(expected %lli, found %lli)", \
> +				     current_config->name, \
> +				     pipe_config->name); \
> +		ret = false; \
> +	} \
> +} while (0)
> +
>   #define PIPE_CONF_CHECK_BOOL(name) do { \
>   	if (current_config->name != pipe_config->name) { \
>   		BUILD_BUG_ON_MSG(!__same_type(current_config->name, bool), \
> @@ -5432,10 +5449,13 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   		PIPE_CONF_CHECK_I(vrr.guardband);
>   		PIPE_CONF_CHECK_I(vrr.vsync_start);
>   		PIPE_CONF_CHECK_I(vrr.vsync_end);
> +		PIPE_CONF_CHECK_LLI(cmrr.cmrr_m);
> +		PIPE_CONF_CHECK_LLI(cmrr.cmrr_n);
>   	}
>   
>   #undef PIPE_CONF_CHECK_X
>   #undef PIPE_CONF_CHECK_I
> +#undef PIPE_CONF_CHECK_LLI
>   #undef PIPE_CONF_CHECK_BOOL
>   #undef PIPE_CONF_CHECK_P
>   #undef PIPE_CONF_CHECK_FLAGS
> @@ -6824,7 +6844,8 @@ static void intel_pre_update_crtc(struct intel_atomic_state *state,
>   		    intel_crtc_needs_fastset(new_crtc_state))
>   			icl_set_pipe_chicken(new_crtc_state);
>   
> -		if (vrr_params_changed(old_crtc_state, new_crtc_state))
> +		if (vrr_params_changed(old_crtc_state, new_crtc_state) ||
> +		    cmrr_params_changed(old_crtc_state, new_crtc_state))
>   			intel_vrr_set_transcoder_timings(new_crtc_state);
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 52d0fd2bdc82..d1a135eb6408 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -1401,6 +1401,12 @@ struct intel_crtc_state {
>   		u32 vsync_end, vsync_start;
>   	} vrr;
>   
> +	/* Content Match Refresh Rate state */
> +	struct {
> +		bool enable;
> +		u64 cmrr_n, cmrr_m;
> +	} cmrr;
> +
>   	/* Stream Splitter for eDP MSO */
>   	struct {
>   		bool enable;
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 871e6e6a184a..d2f854d9d18b 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -219,6 +219,17 @@ void intel_vrr_set_transcoder_timings(const struct intel_crtc_state *crtc_state)
>   		return;
>   	}
>   
> +	if (crtc_state->cmrr.enable) {
> +		intel_de_write(dev_priv, TRANS_CMRR_M_HI(dev_priv, cpu_transcoder),
> +			       upper_32_bits(crtc_state->cmrr.cmrr_m));
> +		intel_de_write(dev_priv, TRANS_CMRR_M_LO(dev_priv, cpu_transcoder),
> +			       lower_32_bits(crtc_state->cmrr.cmrr_m));
> +		intel_de_write(dev_priv, TRANS_CMRR_N_HI(dev_priv, cpu_transcoder),
> +			       upper_32_bits(crtc_state->cmrr.cmrr_n));
> +		intel_de_write(dev_priv, TRANS_CMRR_N_LO(dev_priv, cpu_transcoder),
> +			       lower_32_bits(crtc_state->cmrr.cmrr_n));
> +	}
> +
>   	intel_de_write(dev_priv, TRANS_VRR_VMIN(dev_priv, cpu_transcoder),
>   		       crtc_state->vrr.vmin - 1);
>   	intel_de_write(dev_priv, TRANS_VRR_VMAX(dev_priv, cpu_transcoder),
> @@ -307,6 +318,15 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   
>   	crtc_state->vrr.enable = trans_vrr_ctl & VRR_CTL_VRR_ENABLE;
>   
> +	if (crtc_state->cmrr.enable) {
> +		crtc_state->cmrr.cmrr_n =
> +			intel_de_read64_2x32(dev_priv, TRANS_CMRR_N_LO(dev_priv, cpu_transcoder),
> +					     TRANS_CMRR_N_HI(dev_priv, cpu_transcoder));
> +		crtc_state->cmrr.cmrr_m =
> +			intel_de_read64_2x32(dev_priv, TRANS_CMRR_M_LO(dev_priv, cpu_transcoder),
> +					     TRANS_CMRR_M_HI(dev_priv, cpu_transcoder));
> +	}
> +
>   	if (DISPLAY_VER(dev_priv) >= 13)
>   		crtc_state->vrr.guardband =
>   			REG_FIELD_GET(XELPD_VRR_CTL_VRR_GUARDBAND_MASK, trans_vrr_ctl);
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr_regs.h b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
> index b5695a95dd4a..532ca5040a2e 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_vrr_regs.h
> @@ -109,5 +109,19 @@
>   #define VRR_VSYNC_START_MASK		REG_GENMASK(12, 0)
>   #define VRR_VSYNC_START(vsync_start)	REG_FIELD_PREP(VRR_VSYNC_START_MASK, (vsync_start))
>   
> +/*CMRR Registers*/
> +
> +#define _TRANS_CMRR_M_LO_A			0x604F0
> +#define TRANS_CMRR_M_LO(dev_priv, trans)        _MMIO_TRANS2(dev_priv, trans, _TRANS_CMRR_M_LO_A)
> +
> +#define _TRANS_CMRR_M_HI_A			0x604F4
> +#define TRANS_CMRR_M_HI(dev_priv, trans)        _MMIO_TRANS2(dev_priv, trans, _TRANS_CMRR_M_HI_A)
> +
> +#define _TRANS_CMRR_N_LO_A			0x604F8
> +#define TRANS_CMRR_N_LO(dev_priv, trans)        _MMIO_TRANS2(dev_priv, trans, _TRANS_CMRR_N_LO_A)
> +
> +#define _TRANS_CMRR_N_HI_A			0x604FC
> +#define TRANS_CMRR_N_HI(dev_priv, trans)        _MMIO_TRANS2(dev_priv, trans, _TRANS_CMRR_N_HI_A)
> +
>   #endif /* __INTEL_VRR_REGS__ */
>   
