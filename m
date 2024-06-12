Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA9905249
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 14:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BF210E850;
	Wed, 12 Jun 2024 12:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5HhmbBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E34610E848;
 Wed, 12 Jun 2024 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718194895; x=1749730895;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p74XfllLm/cCLcv+gS4iwyYK/l7Ac/wOZlyV4z913q8=;
 b=H5HhmbBkSaCuuu1xhjDz8scEAN4ToXSsf0smS/nWIbAHVxlwTiofRpVC
 M3rMKa/0UE73/k7/faOUqpZGaPw5NTGo8PYO4oSB3Srm5bLTtIxN1FAB6
 i4PhQAx6MnTn1x5NBBHcL4FhK39f0CSPTPm1s22LF3HWvp8HvvEYt2SpC
 hc0LVi6DFPKl99r08e97zmsDzqWknYcraowM1q6wgR3uN7D0QiHofuSOd
 XrwUTOaS9xlc28BN1SVzb+hDBZJczfyi6onzSuWOgyLDM0YfDCmEWmXJk
 RkvFjJEZKKC3qAS0MXo6gwZNndwrTpj+SuXHI0aQ+VH8ZUOCl1gzGtfKb Q==;
X-CSE-ConnectionGUID: tf2XQtMST+mZLohPGMa5pg==
X-CSE-MsgGUID: X/ATPrMCRWe4HW/hAP+QnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11100"; a="14915571"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="14915571"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 05:21:34 -0700
X-CSE-ConnectionGUID: C2pR6Sq9TL2LUP2f2s9igg==
X-CSE-MsgGUID: kczsRgUfSjq0b2N2kwpcxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="44165965"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 05:21:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 05:21:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 05:21:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 05:21:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfsLZ0oH+XMuHwOnx1XSk18imOrPbgfpsYBu+ZU5qC1omYl61gVxY0KA1N2cxi5OJu8OEPFfImomKYsKnJO+oibdnmmzNUdx2DOkWwv2t/ZDDZBiMincHFbvFkLOQClhEORCjYTnQRDO4GGJ8hbysidTJ6cVw2LZ+ApYEJJee/EdybrdgtkLU7iwHnXvDMVYvtg4Z+NZNh9DXzYFGUNAT4ZXeD9FMueAUliYDtN5sj3YXE4gfxHOczna0u6stw05CQDqoyM45ldU1dEqn3zGErSAxldd0Q2lrLfvlG8XfxqpZ96LWDgs2ZtYuDt90kuvqrqNdihPyoCXsapjxIKUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsTWL54pBow8jZmVxwM2IfELj3+kf3OFJQCPI5pEQWk=;
 b=eNALtOMpQFcfxbZk1FzQ49rrORDUsTHKwVa2OD1/btY+PIOOGN4fnUgppmwwYNyaWnE9hxedZT1hiNT39yJ2cfV9MLNdCRfpvYSHgp15rZ0pZFkPLfasIvOnvPo5ygJ95hEn0QFclW98tnWnLsAgGR2iatj33JcIJjI9H2/f03YX4ANNV1zVXP/TskO3RQJAy+TcKUmvNne+SGT7PDIe6RBkjjeWoLc1tn5eo7V8rJSaD+mlywSfk2if+gEYe6Rl+43nAjdCGdtCmUygjHWsltG6Kxxdc6qcS0bXaHSNKFj3xSZ27ndwlGD0uKnggw0LVQdPU40NMJabt1zwc2zEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB7245.namprd11.prod.outlook.com (2603:10b6:208:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 12:21:31 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 12:21:31 +0000
Message-ID: <6cc15182-2299-40c0-aa88-84664fc03750@intel.com>
Date: Wed, 12 Jun 2024 17:51:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/dp: Describe target_rr_divider in struct
 drm_dp_as_sdp
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
CC: <suraj.kandpal@intel.com>, <jani.nikula@linux.intel.com>,
 <rodrigo.vivi@intel.com>, <sfr@canb.auug.org.au>
References: <20240612095433.323342-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240612095433.323342-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240612095433.323342-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 853c9d0f-b521-495d-d74f-08dc8ada3106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|1800799016|366008|376006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tlk3RkMzRDZVRHMvOHU2OGZvN1FhTEZsWnVwWm5wb2NlMWNESlg2SjlrMTlO?=
 =?utf-8?B?MzBGRGFTYkFRWU5XYy9xOWcxd0R5NVJydUg2dVpYa1ZuaDRnOGYzSTVCZHVC?=
 =?utf-8?B?STRTeFZkbVlyWkVGMmdKa0R2dm1sVGxudVNVM2g1clF3OTYvUVF0MFQ4V1NX?=
 =?utf-8?B?bVBBUlBwOXpMYXZmNE5lbXdFOEVWWnJxT2FxMHVTU29hS0dyQU1OVSt1Q0JL?=
 =?utf-8?B?QUhpZ2ZwV2gvT05pK1dBcmNwVWtEQkVEYTVCTFFkWmtXTWxnMUtEb056bXBW?=
 =?utf-8?B?M05BZktaNGVJa2c0eEd6eUx3cHBZeHR3RkJIUXI1TUl3RkRhQjAxYU5kNFU5?=
 =?utf-8?B?OUxobVhBQ2htbXNXdVNrYythTTgzaTdlOGROQWZiRGpySG5zbkt4Q3FSK1pv?=
 =?utf-8?B?WlRVSVZ4SGlNVlMrN1FwbXd6TS8rektmUTF2NXJiVldVNUp0RENEay9BQXVO?=
 =?utf-8?B?aGNTMHh1bTU2M1JpdHJXUmZsbForTEw1Y3ZnMUxSTFQ1dUE2ZGJIZTRyKzI3?=
 =?utf-8?B?eTQ5ZjVuaTg2V2gyd3BkbVdvZCtMQkwzcEVpWWRsWEpscjdJd3JxeG42Z3JB?=
 =?utf-8?B?QkwwanBMTnpHV1E4QUUzTXVpSkhPVXlrZ1RFTE52K014SEVId3R4SWVJSkpY?=
 =?utf-8?B?MGRYekdYZTJ0WjF6OU90dXBKK25ibWU4MjF3NDNmcG5uZy9kV3JmR2lja2xu?=
 =?utf-8?B?N3VYblhKSklwODgzMnEyRXVUekhMWDh4YjI1RU9ESDNoeFdHVlErQVZYLy9K?=
 =?utf-8?B?ZHlaL081TmN0dVhoc1JVR2JuZytuL21CTlhjRjdGY3ZnanRCYU1KY3JoL08z?=
 =?utf-8?B?TlVsYnlhckhmTkEvN1h3dnJhV0dScjY4TzVrUCs2NGFhWmEwNDFIaEVwYWwv?=
 =?utf-8?B?RG1YN29oaXdkNVBLcFo2ckVlUzM3MUhKUzNzZjN5bHdsc0tnUGdOenlKN0Nu?=
 =?utf-8?B?c1BNRGNZRDNrTzlLQXduZnZMVlBjcWs0NjI3eDhlSnhGZ1pvMDIxZVI3a04w?=
 =?utf-8?B?aWdITktYNXltK1Z0UkVCTEswblV5RThyTEJWanpHYW1nemZUNnNldWZWYnkx?=
 =?utf-8?B?NHdVWUhIRXMvYjRDMVYzZ0o2UStvNFRJeitleE9XQkwzRVBaOUdVdE54eW80?=
 =?utf-8?B?clNFajU0U05TbDFpdUxZVXR5N1RIWWxYWUVPNlp3VXBZSmQvQXRMQ2x5eEE0?=
 =?utf-8?B?b3lUQ3loMTlOaDA4eGJBQytkYkEvMVVrVnNRWDM4NmZ3dkFzNkdRUWRwTW1U?=
 =?utf-8?B?TDBmbThDVjRvQmNhNjdFcEhLd2ZhWVBSeUxtc0d1ZzY4ODdxZmhKdEJmcUtq?=
 =?utf-8?B?T1lsbTRpK1ZydnBWY0FrZlV1ZE5lTW5EcDFUYjVrQ2dkYnp2dTJMbDAxbmZR?=
 =?utf-8?B?VGl3d3dNYVdOUkVDYkFXVFRMdE1Oa1owbzJKSDdEOGRzU2tKN2FJSG5ra0o4?=
 =?utf-8?B?UllQLzZweDRzMTJja3MvYWhhL2dqK1BJN1MxTjdmSm5LVW4vU0U3ZE9kckdJ?=
 =?utf-8?B?RnBUNk1UbnRVQWFsYUlTQlJmRmNWTXJtdHRpTVVxejl6TjVQWW1YSUNJOVVC?=
 =?utf-8?B?bVBzZlpCUmd3UWZoQmR2akxodzV6T05QS3BlVlg1UjVWZnhCMHZJWk84UklB?=
 =?utf-8?B?UWp5ZENuZ2FkaTFzOUZSSllLQ2Y0MGFGeVg5WTArRU1OV1dWeHJZYXd2NlFC?=
 =?utf-8?B?SHA4eEdWM1FBMVJJcWJBWXRZTWdnaXpYajBKV1N2NVhFaCtiNmRPaW9NRm9E?=
 =?utf-8?Q?ldih+NP+oVm7gNhoWOm4FDi6HT47z/0IvknJF/x?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnVLVHluSytON2trWmdYQ3RpdHpoUkFsYjdQYlFPVFJSS0kxaDFrMjh2Y1dV?=
 =?utf-8?B?SVZDRm9yZXJpZDhvTmQva001SEk1ejdPZnFjL3doWENzZEgxQ2lzS01rZmcw?=
 =?utf-8?B?SEp1RlByYy9MU1hvYnU0TGo1Vjdsazd1SENjMkMyUzFsZ0VCY1VOaHYyNmd3?=
 =?utf-8?B?N2VjZnJhRE8xbzEzQS84UEJDalYzT3VBNDFSRUg4NzlGcURBVTZQOG9mR2E3?=
 =?utf-8?B?MDF1SXg5c3o4K043SGtUdlR2dWhhMlExYVhNRW1Bd0o4YlA3ck9rdk9DbjJz?=
 =?utf-8?B?NStTcmdjZG5LMWhjUU5oRHc5V2YwMVFQV3BwNGMrdTNTY1crZDJlL1JxeVJn?=
 =?utf-8?B?b2hQQkxHOXZVYjlRMFRscSt5SWdsOGVSN2UySW1WQzVZNVJWZDdmQXArQnB0?=
 =?utf-8?B?ZnZ4SXMydElXQ2NFUDhjUEtyeERrSE5oQi9CaXdlOUtqWjA3cW0yYU5VbVVR?=
 =?utf-8?B?ZWpwM1hzWFE1Q3oxRlhjLzZOeTByTGh6VnllZnV1SWhLOHNjbk1PNTduNW8y?=
 =?utf-8?B?bFc5MnRXeVJuVW14RkNIQXFrZFZEVXVTVEd0L0FNeEp1S05QZHZLbTFkNWlh?=
 =?utf-8?B?SU90SWtZVnNqbUFtS01kZE1YYlRrcDhDamlPWjkrOFVZaTQrZDY5bjloSmU5?=
 =?utf-8?B?WUhaT0NlVDJtVjhVK3VWQ1lIRktTR0hNUmxjMnFnWE0ydmhPR2FFd1IzSnV1?=
 =?utf-8?B?QzNOYlNwTU9nYi9SSmw1KzgwQzZyUVFrZWQySDVucTZSTXdSRkpQQ3l0cUFx?=
 =?utf-8?B?UjhQREZtOG5VeUc1NEJNdWEwbytCMkZIQ0FUME02M1gyZlZsa3ZwZXVjNi9r?=
 =?utf-8?B?eFkrc1ltMXk5UDQxOW5zOXQzdmVIakhsQkwvNlpLaUI5STNjVHRXRmRnY2tL?=
 =?utf-8?B?dk9yZmpueTNPMlpzaklaZGs2SzFCTmVMMEdMcEhtMm9rNS9yNXU4RmpOUE05?=
 =?utf-8?B?dzhpT05jTmtYNWNJNmE0STg0VmlGSFdCdVUxTE4yRkpJWWoraFg4VkV4Uzgr?=
 =?utf-8?B?dXI4NFVaTG9SMEQrUUpYdTZ2RXkrZmJTTzJRU3ZWS0QrNW11TVZUNmRMQmdo?=
 =?utf-8?B?bitSTXIzVXQyR3grcGQ1YXJhSzNRK09uOTh4ZDRNTUxuU004SkJUSWdZRWNt?=
 =?utf-8?B?aitsRVZMbVIxNGRaNyt0VEJINWxnL0I0akcrQkdzbFY1a3NuWlJJaUd3SGJw?=
 =?utf-8?B?SEY4ekwxYnVRUXJZeEQzRjc5RWcyaVkycXFueGo3Um9ST2g5S1pReVN2MnBz?=
 =?utf-8?B?cjRKcS9UUDdjM1h6MjhwNzUxUjZDckFDRDZYcmxUUUExRG1MaW9YODhIbU9H?=
 =?utf-8?B?OHNWTHNTT21veGtvQjAzUFYraGUwOVBCUWlpaDMyVW5qOHlmQld4MTNwYWVz?=
 =?utf-8?B?ZktBZzhyOGhUZnd5anpHZVRBQlVRNGpEZjBsZElmSkgrdHQ5eG9qNUUxZ2Zx?=
 =?utf-8?B?WUJBWUpWeVdnMVhySHFHUU4zdXQ0YjY3WGNRK1ViODc0RVE1cGlpTnFCeVdK?=
 =?utf-8?B?ZGU3S240RHdMVHBJQ3RuczhiQUg3NVh1WGFJN2pBNUlaNlFDOHpzeURRTzZ2?=
 =?utf-8?B?R05EVE9BWHE3UGY1VlNtdDBBL0E0M1dTQ1BrZnI1R1pNWWwvZ2EwVkluRlVk?=
 =?utf-8?B?ejROMFprNkZGMHdOMGN0M1R0ZisrdkN4dnd4MUg5OFZUQUo5WFJpaHlocC9W?=
 =?utf-8?B?ZitmWHE3RkN6bUZHRjV0ZkRXL1RCMVNhUFZ5cllXMThiUDQ4WFkzS0VqVHJz?=
 =?utf-8?B?N2x5OUhjOExmSE1pa0VFOXZxeXdJRnFPRHJaS1NrQVhkZXdabSt4K2pDMlJZ?=
 =?utf-8?B?d1NiOXdkV0lITHh0dWZiMDBHM203bVpjdjhMSlFidzdoSnd3VXdja3hHRHkx?=
 =?utf-8?B?MjFZTVVnZUNiUFlXN3hZeHdVRWFGVTU5djlLWEU5Z3RlWlZrbmtHazV6ZnRV?=
 =?utf-8?B?UllORDNNTjh4NlM2cE9jZjFXVExlRkNyQ3doM0IrT2hqZVFqTG9Pc3ZqRHZX?=
 =?utf-8?B?V0ZDOExtMUFKVFVWVTVDVExmdWZKdVgwMVNiL2Z6d0lkYzYvYW1oZGtKVk1T?=
 =?utf-8?B?RFRkUHBvSVZ6WnM5Nm83bmhBZlNRclh3NU1kTlpMcnNuWkR0YytjeldqMUkx?=
 =?utf-8?B?L1NscnVzREdZTFIrdEdrWUc4Q3Jkc0JOelJQaTFnZDl5dTVUSXZ4S1puaUFK?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 853c9d0f-b521-495d-d74f-08dc8ada3106
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 12:21:31.0922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYfKsE68eRo3Fsy/+vq70HUvZSI9ctrHhLSYO7Li8wugA88hJ3rF8oJ0aN0jXkqSdLeRjA6Hs5LXRKZt1i9aLI/aN0ujTh4JeFV5aeEFkJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7245
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


On 6/12/2024 3:24 PM, Mitul Golani wrote:
> Describe newly added parameter target_rr_divider in struct
> drm_dp_as_sdp.
>
> Fixes: a20c6d954d75 ("drm/dp: Add refresh rate divider to struct representing AS SDP")
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   include/drm/display/drm_dp_helper.h | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index ea03e1dd26ba..7f2567fa230d 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -112,6 +112,7 @@ struct drm_dp_vsc_sdp {
>    * @target_rr: Target Refresh
>    * @duration_incr_ms: Successive frame duration increase
>    * @duration_decr_ms: Successive frame duration decrease
> + * @target_rr_divider: Target refresh rate divider
>    * @mode: Adaptive Sync Operation Mode
>    */
>   struct drm_dp_as_sdp {
