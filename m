Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8EB8D59F7
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 07:42:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5507112BC2;
	Fri, 31 May 2024 05:42:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Go9pTp61";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4741112020;
 Fri, 31 May 2024 05:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717134168; x=1748670168;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nHTrQYNxMz/AUS5jbJMRAge4hWpfSWjIHW/QGop3pkQ=;
 b=Go9pTp61LaqdOK/M7W5WEXiqb+xglFZubAZmBgxSGt9aIdzbYJB7p6im
 GMgjmXIuFJHf0Fb3DEBJ1zPiz3y36wIN2JTrBHyw2BMzhWeH7TFtk84Rl
 kqV2cPzTrfhd7Vd2mqZRHLxq4m2xjrRTbFq2gLVdB3tzgljG1pMOx0FC0
 xrdDmUofhI+eI9mXSEXY58Gk9Yuiu3Gj5lMHtMuC4+AAVpwuHuWL8+8ox
 NKIgfh9c51QHju2G8LiqkkifDFh7zFaU91G6cstx+N6+0WEIGp0BANnjF
 bOzM8+ldo+fKygg2KgB0FSIZ8MOWvXrUk8vKsm8NkQHvf3vN9pm+zPqeo A==;
X-CSE-ConnectionGUID: l4UbXdGYQZ2723k6APEiDg==
X-CSE-MsgGUID: rW1w19FURD222ZRxN0rkSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17463779"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="17463779"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 22:42:48 -0700
X-CSE-ConnectionGUID: 22pCMZZ0T36DAup216YAUQ==
X-CSE-MsgGUID: 8u3uFsYGRmuQn+ZwiZ1x0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36132830"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 22:42:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:42:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 22:42:38 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 22:42:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dffCftcs3iETXPlrd3fjWqHKwKcZKM52pwBAzgaCBVp9B5MOdUYoZb2sySlr/PsTqxrAWP0T//4n7AyKeE4xtjEjIV+rrq6+ahfGhgi2U3yPnYxTDHMXkkli6H6+BPnEqs6g/8XgSODLkkcVV0xm0TnHtdDHGcCUe9Knu3E1x1u/HsH1SDEKNEI4CtW6oKWaIU//+btRUIPUQcp1oyG7ccKXPpnvHZVGO4pVUh9MCwcr+n6a6Narqbz5YLct+oZ4Vz6y23D8Ti7+pvojV+CC8r34gYKuuB/NsZ8gjxo4jDo/ez6M4GLGRqHrehwD1nawJx8TtEIUXMcc8BN8lpFHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjXSF0dMGa0UNn0fMCvO2pt1v0BZ7qOAH5DvdEeHQ9A=;
 b=PUYYL8QqGrAxGSaC5Dwfo5MBIdOPRa853gqVfHUz/T59wp+Xx1pH7GekB+nHQ5I21SaN2f60hM6tvek4B2JnlCaZWfD2TyEuPGnqOmesklOQtBcWuLFLChY0LVaJ9Q7nM9Dtkzq9AMV8ljFQpqyGBEe0JQY4sDWL327HoOVoTkJn01OcCL9t3W6V6Y5klH8bQmlVF3K1DfPVmYyj3SNmtOsNmjBQvUsZ6V8KeBUirUVuARNyT4Du+B+ktQvM9Qh5xI0RNFSdDxfnyZT+UO1YckdFRZg20bpPWQ7EWNGuADYqRPoFITdhc9r/9HgsFSnvq2IzUJgWqroD0ZuDqJt16Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DM6PR11MB4691.namprd11.prod.outlook.com (2603:10b6:5:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 05:42:32 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 05:42:32 +0000
Message-ID: <cc69aade-553e-42a2-84d3-c9eebdc8d461@intel.com>
Date: Fri, 31 May 2024 11:12:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/8] drm/i915: Compute CMRR and calculate vtotal
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240530060408.67027-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240530060408.67027-5-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DM6PR11MB4691:EE_
X-MS-Office365-Filtering-Correlation-Id: e2480fbc-890e-4bf1-5c65-08dc81347755
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T05Scm05d1VST1M3N283RmxzczBTOXB6YlVhaVFXbDd4RXZJNFJmNzhkUDhM?=
 =?utf-8?B?MWZZV3dFejJxUmRTSkpmeUJTR1RJK0F4SUtLcWdXWndPT1FpcFR4SXNIYnFm?=
 =?utf-8?B?SlBxVmZiV0dYaGlIdE5heHNmSnZJd0JlUWVaNnpoOVg4SnZKbmRyU1VNNkpm?=
 =?utf-8?B?NGtBc2Zib3ErWnBXZXZuWVJvOVZId0F4cFNmbE12UUhWVmxuN3hVMk8xZ1FY?=
 =?utf-8?B?SkJGZXloRG5SdzU1TkhxMFJiOUFsSmtpWEs4MEhlS0FwblhHVmd2M2tKNE1I?=
 =?utf-8?B?RFBxamkzVWFvQkg5eStvVFpiYVA5NVBGWENQRlB5RldjTm02OW9vVlVxekNO?=
 =?utf-8?B?bEZvQWgxekRhUHlKNjdSLzNTVUszUVhzZ0Q0RDIwM1RuakJlVzZjRWswcEQ4?=
 =?utf-8?B?NTRXZEVYcUNsaVh2MnFRYkRlTTlraFpod05LVGFzQmVWRFhCWHFvb1RTWW9u?=
 =?utf-8?B?QmVYNnc1QlpYamhtYjUxMm8zQnVVa3hrWE00Q0JUVFBpWHBEVkt3REZJZ0tj?=
 =?utf-8?B?R0o4Y296Z2Q5R2xVRmp0UTJNdHJmRmVocDhNVGREL09mYW5GZFRleUlmU09k?=
 =?utf-8?B?ZlRpUUpZRXI0YmRBdzFJenltaGFRV3BPZHNGNG91ZForUWJ6K05ibSs3VndF?=
 =?utf-8?B?SEZWWDBzckFiZ2orRG55dlFvTGQ5amVMWmJUa2JoN2dpdkxKTVFjcTJ5bDl6?=
 =?utf-8?B?dVd5WVpSLzZ6clcvS2M2UG41MkNMSTZUYkZLckw3WUJKVHNkUUZncE0yUEcx?=
 =?utf-8?B?dHA5VzlpRUV6eUk0NmRJdlBQN2QyWlpRczVWcitUNFcwUzlybWE2ajg5b1FG?=
 =?utf-8?B?VnZ4cDZBWWVMODA3alA0VnhGWmdyVy9lVDc5a3c2Slk2YVhTMEczb0lxOHRC?=
 =?utf-8?B?MytqYjB6MnNzTm9MRUNCdVdvNG1RQU9ucWY3Tk95SHZtdEhNb2p5WmhnMGhC?=
 =?utf-8?B?OVEvK1UwVUVEc0xrcGNjTFdrcXlzK1pnNW8xUXZlQTdCQVdJOUJBeW9vcFNU?=
 =?utf-8?B?RXdKTGFzNGxIMmNWcTlWc29VSS9DbWZzWVV1U3JqVDNKTER1ckMxa3hlZUJu?=
 =?utf-8?B?eFVrbFVseUZlSHV6U2dsb0tjQkFzem1ING9NcHRTejEyTHMyZlEvV1FDajFT?=
 =?utf-8?B?NTJjUk1EYlZWRHNOVkt1OFduTDAvUlJFSDVzMnVRdlBHSDZGZGZySmJHc0Rw?=
 =?utf-8?B?a3hIS08vZXdZWlMvY0wxQUxuNlp0SkVSMTJWNEgxRElNQWhhUGpwZHFTYzlt?=
 =?utf-8?B?VGJPNEMxaGsweW91Y0pmVk5sY0RvajRiZFhpRW9ITm1pY3NxcEI1eWZubTA0?=
 =?utf-8?B?bU45aTZkSnprSXpTaHYzL01Kc1F1Sm9nV2NhQ2Uxa2t1bmU3T1NqY1hvVm1L?=
 =?utf-8?B?Y3o3dHlHMXhHZFArb1gyZ3l4TS8wS3NGMTBIYVp0YUZrWVJGZEo3MUV4S3VP?=
 =?utf-8?B?eUNYdUxPU3ZjT3k2U0ZUV1BWTVJ2N3VLZ2xEeWNNY3JNWEJnTFhqZERvTkdy?=
 =?utf-8?B?ZUlwWUFKdXhCU1BxZXh2cmlTUEJTQzZDRDkrdUgvcUxyL0JFTGdVQTVlY2lK?=
 =?utf-8?B?dE93bURKeThwNXowOEp4TWNhYXdCT0trZE52VFprWllsUW0xZktwMmNjQm51?=
 =?utf-8?B?MGZGTDZkK0VCWFd5S1VlMDJvbVdobS85eEFIaXMxemQ3OVFoa21sTUE0Wmk1?=
 =?utf-8?B?OGpuUyt0c0N3aWhMTTdHemVIc01VTmtmeDNGT3M5LzZ1TDB0YmFOWEZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmxQTWRtK2VHZDhPeWdHTW5BaEs0dExsYW1leHhENXpNMXVaVC9mdHU3Q2FH?=
 =?utf-8?B?bGJwNU1zU0tFSDRBVmpuajkyWkZFcmxNNlhjLzcva0t3cENjSEhQQW5wUy8x?=
 =?utf-8?B?ZGdXMVVvaFVMRVlJTDhtS3FMbDloV24zd0NCUjQvWkNoeHdWcTBVMHg3RXJ0?=
 =?utf-8?B?VU4vYlJiY2hnNWYvT2tHaFlFU1NUM0thaG4xYTRVME94elA1aWNiNUpLY3di?=
 =?utf-8?B?RjM3bWlXQWZiaWZ2YXAxZHlGZ2FCVE01cityL2NQY3JVQkVYV25uQ3FheUkr?=
 =?utf-8?B?Rk10akE1ZC9GZjd1R3JNWEJHYnJ5RytncTFSOUxKS0psSGF5SFBrRWl2ZWY4?=
 =?utf-8?B?UFhVUXl6NUd4UDdvT3QrVzJlYWdpNmtRQyswdVVSMnFUclV3VkhZdEw3VXBL?=
 =?utf-8?B?RDA3eXhrOGlkZENSVkdPaXJVdzNUMmVKSlNoY3NsaGlVTDNWSDFKaVZJKy8w?=
 =?utf-8?B?VnpPdUtjTGdrSFpSWFg1dDZ1KzBOSUVjRFRlZ09SeXByRjZqek54NTRVVGgv?=
 =?utf-8?B?Z2N0VmcvWVdvd2grcnlveEF0VmM5S214NmhEMlcrUGorTWhPMEw1d1lrcUo1?=
 =?utf-8?B?T2VmS053djRJYVJwT3RKWlJxZ1lQQ2g3a05TWDIvQVo4S2MvaFBwenY2OE1s?=
 =?utf-8?B?T05qQTVaTFZ6UmhWOEFSa1lldlgvSmU5c201UHcwN0lUQlpEZEdHWFB2Mjh2?=
 =?utf-8?B?TUpIWUJKQXpzY1E5bVV0SWVIanBHTURHVXVnK2dRcEkvV1dDbllpNHZGK2p6?=
 =?utf-8?B?akUvRkpaaWphdThYQzJhdHNBVEorVUQyWWpQR0kxVFgrWTNwK25jakI5cElX?=
 =?utf-8?B?cHRDMk9RdnpjbTlNN2FwZ1Z5eU04QjFxMW5tYUNjMm1xUVlDamF5b0s5RFRa?=
 =?utf-8?B?b2dDUkRQUVlxUzRMUUs1VVhWc0dyVlhVMlhSL0E3ZFY4eXd3bW1sMmhNRnl5?=
 =?utf-8?B?cHRqamtEdGpwTk9wM2ZLT0h0VkUySzNwKzdrc3lhcUVMU2xabVFKS0tWV1NE?=
 =?utf-8?B?Q1ZjNzcvbzN1WDVZRHBtZVdMWDc4b3ErTGYxM0oyVGVxVG1WU0hTZjF1TVFm?=
 =?utf-8?B?Sjd6TjlzcGphZloyTS9JajZLc0J6cnVwSTFSdXVVL2o1cnVtR1FCaThJSTBo?=
 =?utf-8?B?OXc0T3AvVGI0NG0wWGg4QWpqWVAydllveUJ6VDR1cHVOaTAvdGF0cm9jNUcz?=
 =?utf-8?B?cjVQZlZ4QnV4QW1DbUg4Y0phZXA4ckc4MFIvRTlzK0VuTWZ0ZVNBcGpMSEI4?=
 =?utf-8?B?Vzk2T3R3WXV0bGdqUXZNSnhVWTJyS0RIUE5wcTV1Z1lLRm5zUnMwcm84WnBH?=
 =?utf-8?B?SVAyUHA5SzNVdDF5UTlWK1BMcEtySmZrcHpEeHJOV1NJRFZOY0JhL1hnSm12?=
 =?utf-8?B?dGo4Wkt3N28rbEticHdIS1djUXNhZnQvVUQxMzlqUzZVS2U4c0s4RGZLdTl3?=
 =?utf-8?B?SExIRHRka3RleVVjT2wwT2kyZ05TNTNFQ1NSSVRoNXQyL0RTdHJMalc3cHZq?=
 =?utf-8?B?VjR3ellGVHVZM1pFcTBCdzRsTGxqbFB6QWkwZm05djNoeUZvYTJHRFFsdnhn?=
 =?utf-8?B?WkNGV0VwR1FPUWU0dHREcEFLUktVa3N2cm9HMW0zNlhLM3Brd0w5ZjdvcWxB?=
 =?utf-8?B?cjFCVTRTckQzYXkybCtDWkRHN2w1OTVHQkdQaHBWYmhlbU5hZExEZTRWV0ZD?=
 =?utf-8?B?eWFVUzZ4WDV6aDVKZFAwTG43ZzlKZG4vZDNaejZtdGJFbWhmS3VCYThzK1c2?=
 =?utf-8?B?NXY5dC9JMzJtRFlNb1RXdTA5V0UxeHRiVmtqN3FoUXZsVzdUNWd4b2Y3cXJF?=
 =?utf-8?B?L2RRYWlJbk1ObW02YXcyVEhQZFh1SXovVnhnZ0Q0cnp0MStXN3lyd2x1TjdT?=
 =?utf-8?B?U2JIRVZxcTJDMUx1TWlBTGlNbkpGTnp6UjFFcXcwbWZoellsNTJmTkw5WW5O?=
 =?utf-8?B?Vzcrc2g3TzF6eFVpYjF0a3pBTVhLb2JadGtEWG9VRHpQMG5KZFBUcGcvUFdl?=
 =?utf-8?B?MmpLVWh6WE1kaWhJdXpYcHdYTkw5dXdqWDNLMUo1dUI0Rk5mSjIvQnJnTXgw?=
 =?utf-8?B?b1NHUmxlS1JGZ01yZXZMcmtDblc0NkloTWZ6b2dad0NpM3F3L0VrWkhJbVFE?=
 =?utf-8?B?dEZ6bGlFd1V3SytRa1BVRW5KZWNaWnhKWDI4QzJUcExaWG5pNk4xWEQrV25W?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2480fbc-890e-4bf1-5c65-08dc81347755
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 05:42:32.1023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRALFrI3/09WaPir/tBjiSjcyNMgdbIqDZth6diXzeUXtPjCp7JtEvAGDWa0J3ENqxtT+eJ+OSSxvnAW0YyQFS8pW2cAWUh7/Xf5TS7zmTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4691
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


On 5/30/2024 11:34 AM, Mitul Golani wrote:
> Compute Fixed Average Vtotal/CMRR with resepect to
> userspace VRR enablement. Also calculate required
> parameters in case of CMRR is  enabled. During
> intel_vrr_compute_config, CMRR is getting enabled
> based on userspace has enabled Variable refresh mode
> with VRR timing generator or not. Make CMRR as small subset of
> FAVT mode, when Panel is running on Fixed refresh rate
> and on VRR framework then only enable CMRR to match with
> actual refresh rate.
>
> --v2:
> - Update is_cmrr_frac_required function return as bool, not int. [Jani]
> - Use signed int math instead of unsigned in cmrr_get_vtotal2. [Jani]
> - Fix typo and usage of camel case in cmrr_get_vtotal. [Jani]
> - Use do_div in cmrr_get_vtotalwhile calculating cmrr_m. [ Jani]
> - Simplify cmrr and vrr compute config in intel_vrr_compute_config. [Jani]
> - Correct valiable name usage in is_cmrr_frac_required. [Ville]
>
> --v3:
> - Removing RFC tag.
>
> --v4:
> - Added edp check to address edp usecase for now. (ville)
> - Updated is_cmrr_fraction_required to more simplified calculation.
> - on longterm goal to be worked upon uapi as suggestion from ville.
>
> --v5:
> - Correct vtotal paramas accuracy and add 2 digit precision.
> - Avoid using DIV_ROUND_UP and improve scanline precision.
>
> --v6:
> - Make CMRR a small subset of FAVT mode.
>
> --v7:
> - Update commit message to avoid confusion with Legacy VRR (Ankit).
> - Add cmrr.enable in last, so remove from this patch.
>
> --v8:
> - Set cmrr.enable in current patch instead of separate patch (Ankit).
> - Since vrr.enable and cmrr.enable are not mutually exclusive,
> handle accordingly (Ankit).
> - is_edp is not required inside is_cmrr_frac_required function (Ankit).
> - Add video_mode_required flag for future enhancement.
> - Correct cmrr_m/cmrr_n calculation.
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c  |  1 +
>   .../drm/i915/display/intel_display_device.h   |  1 +
>   drivers/gpu/drm/i915/display/intel_vrr.c      | 86 ++++++++++++++++---
>   3 files changed, 77 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 5cbec4b19c3d..926dc1e531ee 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -5417,6 +5417,7 @@ intel_pipe_config_compare(const struct intel_crtc_state *current_config,
>   		PIPE_CONF_CHECK_I(vrr.vsync_end);
>   		PIPE_CONF_CHECK_LLI(cmrr.cmrr_m);
>   		PIPE_CONF_CHECK_LLI(cmrr.cmrr_n);
> +		PIPE_CONF_CHECK_BOOL(cmrr.enable);
>   	}
>   
>   #undef PIPE_CONF_CHECK_X
> diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
> index 17ddf82f0b6e..b372b1acc19b 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_device.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_device.h
> @@ -71,6 +71,7 @@ struct drm_printer;
>   					  BIT(trans)) != 0)
>   #define HAS_VRR(i915)			(DISPLAY_VER(i915) >= 11)
>   #define HAS_AS_SDP(i915)		(DISPLAY_VER(i915) >= 13)
> +#define HAS_CMRR(i915)			(DISPLAY_VER(i915) >= 20)
>   #define INTEL_NUM_PIPES(i915)		(hweight8(DISPLAY_RUNTIME_INFO(i915)->pipe_mask))
>   #define I915_HAS_HOTPLUG(i915)		(DISPLAY_INFO(i915)->has_hotplug)
>   #define OVERLAY_NEEDS_PHYSICAL(i915)	(DISPLAY_INFO(i915)->overlay_needs_physical)
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index c2b5424f53db..1e4e2d8a0927 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -12,6 +12,9 @@
>   #include "intel_vrr_regs.h"
>   #include "intel_dp.h"
>   
> +#define FIXED_POINT_PRECISION		100
> +#define CMRR_PRECISION_TOLERANCE	10
> +
>   bool intel_vrr_is_capable(struct intel_connector *connector)
>   {
>   	const struct drm_display_info *info = &connector->base.display_info;
> @@ -107,6 +110,52 @@ int intel_vrr_vmax_vblank_start(const struct intel_crtc_state *crtc_state)
>   	return crtc_state->vrr.vmax - intel_vrr_vblank_exit_length(crtc_state);
>   }
>   
> +static bool
> +is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
> +{
> +	int calculated_refresh_k, actual_refresh_k, pixel_clock_per_line;
> +	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> +	struct drm_i915_private *i915 = to_i915(crtc_state->uapi.crtc->dev);
> +
> +	if (!HAS_CMRR(i915))
> +		return false;
> +
> +	actual_refresh_k =
> +		drm_mode_vrefresh(adjusted_mode) * FIXED_POINT_PRECISION;
> +	pixel_clock_per_line =
> +		adjusted_mode->crtc_clock * 1000 / adjusted_mode->crtc_htotal;
> +	calculated_refresh_k =
> +		pixel_clock_per_line * FIXED_POINT_PRECISION / adjusted_mode->crtc_vtotal;
> +
> +	if ((actual_refresh_k - calculated_refresh_k) < CMRR_PRECISION_TOLERANCE)
> +		return false;
> +
> +	return true;
> +}
> +
> +static unsigned int
> +cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
> +{
> +	int multiplier_m = 1, multiplier_n = 1, vtotal, desired_refresh_rate;
> +	long long adjusted_pixel_rate;
> +	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> +
> +	desired_refresh_rate = drm_mode_vrefresh(adjusted_mode);
> +
> +	if (video_mode_required) {
> +		multiplier_m = 1001;
> +		multiplier_n = 1000;
> +	}
> +
> +	crtc_state->cmrr.cmrr_n =
> +		desired_refresh_rate * adjusted_mode->crtc_htotal * multiplier_n;
> +	vtotal = (adjusted_mode->crtc_clock * 1000 * multiplier_n) / crtc_state->cmrr.cmrr_n;
> +	adjusted_pixel_rate = adjusted_mode->crtc_clock * 1000 * multiplier_m;
> +	crtc_state->cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->cmrr.cmrr_n);
> +
> +	return vtotal;
> +}
> +
>   void
>   intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   			 struct drm_connector_state *conn_state)
> @@ -116,6 +165,7 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   	struct intel_connector *connector =
>   		to_intel_connector(conn_state->connector);
>   	struct intel_dp *intel_dp = intel_attached_dp(connector);
> +	bool is_edp = intel_dp_is_edp(intel_dp);
>   	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>   	const struct drm_display_info *info = &connector->base.display_info;
>   	int vmin, vmax;
> @@ -160,18 +210,10 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   	crtc_state->vrr.flipline = crtc_state->vrr.vmin + 1;
>   
>   	/*
> -	 * For XE_LPD+, we use guardband and pipeline override
> -	 * is deprecated.
> +	 * When panel is VRR capable and userspace has
> +	 * not enabled adaptive sync mode then Fixed Average
> +	 * Vtotal mode should be enabled.

This need to be updated to mention condition/limitation while enabling CMRR.

Also this should be the last patch, as we are enabling CMRR in this, 
need to have other bits in place before enabling CMRR.

With the above changes:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com



>   	 */
> -	if (DISPLAY_VER(i915) >= 13) {
> -		crtc_state->vrr.guardband =
> -			crtc_state->vrr.vmin + 1 - adjusted_mode->crtc_vblank_start;
> -	} else {
> -		crtc_state->vrr.pipeline_full =
> -			min(255, crtc_state->vrr.vmin - adjusted_mode->crtc_vblank_start -
> -			    crtc_state->framestart_delay - 1);
> -	}
> -
>   	if (crtc_state->uapi.vrr_enabled) {
>   		crtc_state->vrr.enable = true;
>   		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
> @@ -183,6 +225,26 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   				(crtc_state->hw.adjusted_mode.crtc_vtotal -
>   					crtc_state->hw.adjusted_mode.vsync_end);
>   		}
> +	} else if (is_cmrr_frac_required(crtc_state) && is_edp) {
> +		crtc_state->vrr.enable = true;
> +		crtc_state->cmrr.enable = true;
> +		crtc_state->vrr.vmax = cmrr_get_vtotal(crtc_state, false);
> +		crtc_state->vrr.vmin = crtc_state->vrr.vmax;
> +		crtc_state->vrr.flipline = crtc_state->vrr.vmin;
> +		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
> +	}
> +
> +	/*
> +	 * For XE_LPD+, we use guardband and pipeline override
> +	 * is deprecated.
> +	 */
> +	if (DISPLAY_VER(i915) >= 13) {
> +		crtc_state->vrr.guardband =
> +			crtc_state->vrr.vmin + 1 - adjusted_mode->crtc_vblank_start;
> +	} else {
> +		crtc_state->vrr.pipeline_full =
> +			min(255, crtc_state->vrr.vmin - adjusted_mode->crtc_vblank_start -
> +			    crtc_state->framestart_delay - 1);
>   	}
>   }
>   
> @@ -325,6 +387,8 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   				      TRANS_VRR_CTL(dev_priv, cpu_transcoder));
>   
>   	crtc_state->vrr.enable = trans_vrr_ctl & VRR_CTL_VRR_ENABLE;
> +	if (HAS_CMRR(dev_priv))
> +		crtc_state->cmrr.enable = (trans_vrr_ctl & VRR_CTL_CMRR_ENABLE);
>   
>   	if (crtc_state->cmrr.enable) {
>   		crtc_state->cmrr.cmrr_n =
