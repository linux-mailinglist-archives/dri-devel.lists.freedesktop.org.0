Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E42C35A1F
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BA4710E737;
	Wed,  5 Nov 2025 12:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QqN/4XjP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE3610E730;
 Wed,  5 Nov 2025 12:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345505; x=1793881505;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=anBKIk917FmHpXcKuS8Wbl+tnqzTh0p1DMv3xjpZjHw=;
 b=QqN/4XjPoOppO2s1uEKiGItAR3HgTi3Iaap/89hI/xwk1bsh6dmezX/J
 mfLErSpM2Sh6FuVJjfcyyf9dk6q8NzmKGXVMqHGSLTAKdi3EvHmThbWcg
 TQfVBY5XEVyi0AAaQzSQChZYrenN/gDkHLl4/1FI6enkHGDj+qeLDhni8
 FdLsEDP7Wf2BOhfZJHyQylCOpE+KfKtOrKvEudSvWX1Gsc9+NxJEc0gpV
 Zb7uQizJz8I+KNXEoqYQep2rO0j1xMl8t+VjZkzEtZGfQgvbMnx/DzlQd
 MlPgMiSH1pKJvcv/fg05T440PDWq5pkPkpzOVJm5QIpiitflOJDxRs52E Q==;
X-CSE-ConnectionGUID: PK+ryvxgRiC59jtYmb+ybA==
X-CSE-MsgGUID: 4pFTKS7fRDi94J9mlD/EMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68317631"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="68317631"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:25:04 -0800
X-CSE-ConnectionGUID: hPzrJ7KtRIKWmRH1GvSnBQ==
X-CSE-MsgGUID: +nBvsWRUTQytds2kl1imtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="210924472"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:25:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 04:25:03 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 04:25:03 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.53) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 04:25:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yI+J1KNVcBBeoFmbBQkUUC5RGRYhK8ZMamJRxecUJToHjokHE8t0imxfOB1SHmdaB5DHsE/l3ESeYY/wo51Amx245CkpOK8viGhRy5KulUerYIeLO+dqSREkalJuEYZAroJ/CnXUAn2EdnOy0iRRDkkpqkppaPbAyNZ3GiSx+Z9q37RjcGqDewEv/cZAIm2sWsquUbMT+0V776WnrXZa9FlY966VtZ03qdukLpVgJUXXj6ojZ29gAyqGjDqxGti5YUQbStS0Ra/VFtVa8Pf9dXHOJ1SA4ps9uYDDhKsFernDldjPgkxjK5lodDCey6QAeCSYdoFfcq59lWJuWGwkdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6u6kc1CdwtPnjTvg1NWaWO3d718JUprcLsAsrOhHyQ=;
 b=EOVzR2ON+6UPgl/fXLifv8erq+58VzvZEm82dC2lB6mpKVUwcz5+FVurLa3ezRLUZYANRfuTHyy7n4haF+iaFxvViXrPaI3JCKlfBjSVo+dwniV4bS/yT4jBYljut/Fb52e3I1ZTFIFK1ewyJVX1YpB1VO76cWasGFugt0/CHtKNrrMezuStDEB9ADbPK501FCpEWT+f25OuYB9jxjmuSXmkqELp+v+duWGCklcofu2hyf/GXC1DEiJTeD26wPVjVSOdymBz10k77LdtgbcKjaf9DMu5X5ebC6PfTPnZ6QSSuqfc2OUE1unzWKX1A3MTA9rCNDK6qDSMh+Kehxoz+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 12:25:00 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9275.013; Wed, 5 Nov 2025
 12:25:00 +0000
Message-ID: <429ef8c5-541b-4ffd-bf04-d47c74ef4f66@intel.com>
Date: Wed, 5 Nov 2025 17:54:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 08/24] drm/i915: Add intel_color_op
To: Jani Nikula <jani.nikula@linux.intel.com>, Uma Shankar
 <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <ville.syrjala@linux.intel.com>, <pekka.paalanen@collabora.com>,
 <contact@emersion.fr>, <harry.wentland@amd.com>, <mwen@igalia.com>,
 <jadahl@redhat.com>, <sebastian.wick@redhat.com>, <shashank.sharma@amd.com>,
 <swati2.sharma@intel.com>, <alex.hung@amd.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-9-uma.shankar@intel.com>
 <a1041449fc842bbda7760833b45bc96d15c641d6@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <a1041449fc842bbda7760833b45bc96d15c641d6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0216.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::12) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SN7PR11MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 29693cee-0abc-4506-1e4f-08de1c665688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUVCRDZaN0Z1dVQ0T3hvNWVjN3MrdVFNL3hvc0pRSkNJOWZEd01hSU1XbkRl?=
 =?utf-8?B?MUpwZ1gyS1l4OFhONjlqcWsvQlhwSjlLaUM5a2FzUDZheHMrMFl1dzNxeFRO?=
 =?utf-8?B?eEh0TTlCQmgxSmZYSkRLYUZ6MUVVazFuclE1RzlpZldKSWF6WStpcmhUWUlw?=
 =?utf-8?B?UmpVSGpXWGtkVEtnUUJDTkVSMnk3bFJGKzRzSDRSekRUeE5rYXpvaDJXMm5E?=
 =?utf-8?B?cFdXZDBrdEZGbndwUGh5bmNnVCswLzlUc251RTF4Ty9VY1J4NFg0SGpRSU1R?=
 =?utf-8?B?cUl5QUcwM3BMUitvbm9IMERqQ1pCd3pQSCtmRUZtUlcxR3lteFE4VUNOcHpL?=
 =?utf-8?B?NGhERmhBNnY4NkpwT3hVSkdiWDBGL01mb1NEWjJCSDdqUHlvNFpFeTVqaHhr?=
 =?utf-8?B?LzR1K054ZVhnSFQwdnJTZU81WTdVQjYzeFF0M1YzdjRZUkw3ZUdNbWhuaHB3?=
 =?utf-8?B?N09ONkxmZUtYdy9wWEJ0K0kzSUQwdjYzdjJPcXljcCtLOFRWcnZqOFN2bTRu?=
 =?utf-8?B?RkV6c3VjY1JENTU2V0ZTQVgzMy90MTBMQ25hNWk0T1FJRzdyWk9kNmF6NXBl?=
 =?utf-8?B?MU5aaEhTa2IyaXN4R05tOGtJZjBTendhdFBVbGpvOXZWc2M5cEhRYnIyZEMw?=
 =?utf-8?B?V2YvWVdSRWRZNzFYVlh5WlQ1MVI5OFhBOTlDVjNuWTRYWWNPTzBsS2UrSGU1?=
 =?utf-8?B?NDl6d1lvNk9ibkV5bTg0T3FUQ0RGWTRLUGN3R3BLNjNkVDRKdkg5eUlZOW0z?=
 =?utf-8?B?RlJNblduVjJmekhUVHRyWGMzQnNZSU1abnQzSERNUEJtdlBJbEF4YkdqS3JV?=
 =?utf-8?B?WUVGS3pwT0d0M3hqMDJpTy9RNW9rcXM2VEpEc2gyVm5WYkNkUHpHaDJmNDYx?=
 =?utf-8?B?dHVXb1Q0RlVxSUl5UytaVkx6YXVjZzNJQWJZcjFiVlNYaDNsZWVib0FoNVRl?=
 =?utf-8?B?TjBFcVFqTm9ka3VlTVFJZmxWODV5U2RocVlHQUU1U3FEaHlmamE0ZHhITExh?=
 =?utf-8?B?V0JUWU1leG8yNGRTWEZQQTQ3dFBKeEQzVVgwTk90eDVva3p5ZVJPYkttd3or?=
 =?utf-8?B?Sm9seUcraW9VNWxNc1dWbWZNb3czbktXNEkvVGpkSVgxb3VidDYvL1NhNzZz?=
 =?utf-8?B?b3NSUmxIZTN4Um4yQ3Z4UFhaRWlJK0pVTGIzL0x4QWduRjFLTU80RVRtUmdJ?=
 =?utf-8?B?N2U2VUdNa3RWZVV5eGN0NENmQ0FIeUl6UXFlTTZYckZhWEJ0Y1V6SnhBU09F?=
 =?utf-8?B?UFpPMldWQUU2akxsRnY5bG9UK0QxdHU1dnF0ZmIxMDl0L3RFR3ByMFc5S1RC?=
 =?utf-8?B?c1dIQ1Y2b2lJQTNDYTVQeDFYb0JkN0gydm8yZ0R2eWtZNHNDVy9qVmlMSk96?=
 =?utf-8?B?c29rUURIaEtha2hhc1RoLzFhY3BhYVpSVmlIaXI3ejVQRVpobTZpLzc0YXY3?=
 =?utf-8?B?bXI1c3JSQVd5SDN2enNwcDhjdTVHWWNEd1FDeW5Qa01wSzdrRE42WUtuazhh?=
 =?utf-8?B?ZDhOVk5CVUZNS29sc2g2SFFHVCtzSy9rT0tMSVM0OFJOclZNWnVlOVExTkpw?=
 =?utf-8?B?UGNmWnZsQk5EaDRXZkt2b29FYUIyNlFQS1o0emNXNkRBaUFMckdLVU9LYlRI?=
 =?utf-8?B?QmJLRWlvVTYvdTBjclkrNjVlL3RkcjRveDNmWXRGTHk3QWdSWG1zQVJhaW11?=
 =?utf-8?B?b2EwUWQrcmd4RnpzQ2tBZmVvNDRjckNsR1A5WnJYM0RISWgxbzM4NlZsZkRL?=
 =?utf-8?B?VmJVdGVJL3Bkc2xWYUZQa3Z3eFFINk5VMlVHUFZFNW5md2gyVW12U0x3Y1RN?=
 =?utf-8?B?RWZScStpUHFhNHpJZ0FCakVnYVJKT3BBbXFoOEVSUHUxOWpQMTc1Mjd6Sk0z?=
 =?utf-8?B?Z3FFejFmNlBQSTNPOExkODdMRnM2ek9PU2FvMUk3eitlTnRPS2dCRGdiMzlM?=
 =?utf-8?Q?wiPMqOVDyPBRoXulNP1cm8jO8xaxXPki?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFg0dnFMS2dKV1BXdURWWE9LSTFFY1hVTVpVMVhjOWJBRURwSU1jSWloQk81?=
 =?utf-8?B?aHRFeTZCMW42TWI2a01qQkp3MVplNS95Smx1dURycVkxdjRBSjB5V016cnZq?=
 =?utf-8?B?dlZnSUpWSEpoYmlpWElnVGl3bHA1aFZsT251WTFzZmNHZTJmL2JFQ0VFWFFC?=
 =?utf-8?B?bUIwMC9nWFVLSnprNGNLaG9BaDdWYjEwYUFkam5uTS9wVUNqeWQ2WnNZU3lj?=
 =?utf-8?B?a1pSZXZBNVVKMlE2cHEvcEdYclVMWVJQYjFSK2dHOTY3M0dwREVLbFo2SW9Q?=
 =?utf-8?B?R3F5V0NwR3NaQVZwM0NsR2l6TUFEWmV0QzEraEFNRUhCMnRPUWZpM25VZCt3?=
 =?utf-8?B?YWI5cW9OaDZNV1JUNmQrTU9uekZRdlVwSjRjRDlxek1rWHhJMVNPQTNkNEYv?=
 =?utf-8?B?SStMbFFsbHk5djh6OVd2VFFhNThvNFA4NDVSRm5EOThaWUhodGhwZVowbDRC?=
 =?utf-8?B?NDZyNDI2QjdsOFluZklHdm9YN2ExMzdPWWdhYnBWZlRFUDhCUENBUUZrOFds?=
 =?utf-8?B?YUxXRThYSk1MMnFmUGVVR0RLaFlRRlJoUUtJcUtSRWtJU0VmaFpQUDBSekRQ?=
 =?utf-8?B?THVHVFQzUWNZWlh0WEk2Q1RLaHFWcVRHUkJES0dpY05JYWtaaDlRell3bjd1?=
 =?utf-8?B?RFA3eXcrY0k3N0JrakMvajdkZnk5Nzd3MHV1aEp6eE5id0dZRk9nQm10SFE3?=
 =?utf-8?B?STJsUElrUElaUE5hWW92OUtPZVFIdjRxUkphMjgxUC9Wckk3ek55ZnVhMGd4?=
 =?utf-8?B?eDAvQytJd2k4bDJkbXhqZm9pU2luNXI3Q2dNL2tsSVF2bHR1eWtOYXAwdG4z?=
 =?utf-8?B?SlBhdG1qQyt1TzZydjdmNHIreUkvWVJUMmYvS1ZNM2tpcWRwNmZKY1crWVB4?=
 =?utf-8?B?SmdxM2pydEJZTHcvNyt4NEg3bjR1aFUremZBSGNYRkFZR2N0Q2EwMTFQMWRH?=
 =?utf-8?B?ZVlLNkpMUE1oMFpubkx5NnZ2cjk3MnFwcm9lVysxWDcvWEtGdlFZSXJHRkM5?=
 =?utf-8?B?ZU1LN2k1UHQxV3ZBdE9PcjFaL2JZTzVKR0NTK2dieExGMkN4NTcxMmtpa3Ny?=
 =?utf-8?B?K2NQOTJPdlI5ZzJnMWpqWWpiM1NnQTZ6RVFTOVlJTldsTEF0b1dlVWJnV1Bn?=
 =?utf-8?B?UE01cXBoU0x4L2IvcXZVYy90citBQzdQZ3F6UXN6U1U4ZUJaVHArL3QxajJy?=
 =?utf-8?B?SFkwbUVGM3ZJdmk4NWZEQUVZZkQzWHpVN0RWZXk1dmpERHdEdzBqVFM3Sldu?=
 =?utf-8?B?ckVXUVUrd0RMN0laWGQyVWI2OVlzQS9OdkVIUWQySnhZVlRhL1luYzVZNVZj?=
 =?utf-8?B?NW0vUWxaRFpQTUdKcGI0Y0RvQ3BJYkpYZkFRVlcwVk5vODhONFBJZUQyZnNz?=
 =?utf-8?B?aU9iNXplT1ZXU3AraDJ1SHhoOFp6S3ZpYmZPdVkyZUNMczc1ZVJ2TkFOVFFY?=
 =?utf-8?B?cm5MSlhTTy9KUHdIUE5wc1lFYzNlVStCbFgrUFRRTXFDa1hkaWxiME95SjlD?=
 =?utf-8?B?eFI3L093YUZaWWU1dWNpZ2I1blRPM0ZreHRhUkFiR1FTU3ZmNHBTUCtBQ0xQ?=
 =?utf-8?B?QTViSUJJcHp6ZkZTZWd0NUh0NWtzdlBheU1HbWhGWExIdkFncUZtSkVLWENN?=
 =?utf-8?B?blBhLzlUa3Jkdll6RHZPeUxvQUx5ZlcyTTB3dDJVU2RBcFpPWmZkZGtlMmJy?=
 =?utf-8?B?TDlDRFptc1lXK1lYN1ZkNG1BeklCZGM5NmFCYUU2K0cvVlhqYjAyMUtBRU4x?=
 =?utf-8?B?UTAwQ0VVKzRidGNXVVFEZVVjYnM4ZENDWDNFQ3lQSnBEYitGVjV0eEN4VlRO?=
 =?utf-8?B?MEU4RHU4RlRWVzUrUG1MYXlCeHo3eUJ3Y1UyMnVJRVIxZC9hd0N1QjR3ODBh?=
 =?utf-8?B?R0NXZENmSSswQXhlNml0L0hSa3pqdjRxTmF6eTBtMk1jekdEcTlnWW5UcC9Y?=
 =?utf-8?B?ZTZzb3ZhUUZMR1lJS25sUlk3b1J5UHRJdExhMHYzUGo3OXJNMmxzempKSmNZ?=
 =?utf-8?B?UStTdzY5ZCt3eXNkRkJyR1A0WHk0Q1FtM05IeEQ0RE42WDQ2ZldLbXk3d05I?=
 =?utf-8?B?ZElGdW95aUwwVW9hS2NCZ2ZFQTQ0MXprSzhMQmV0Nk5JbWxaa0xGajIrYW81?=
 =?utf-8?B?QVZEOC9iNFlWQzJ3Njl2THJwSnNaT2htMlpIMkpObTAzUXJ2WTdvWDNxdVkv?=
 =?utf-8?Q?ZWLsfQyC94wfw4XeMm+6JbQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29693cee-0abc-4506-1e4f-08de1c665688
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 12:25:00.0452 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z3Vvk3ZlhdC7J/Zp/Z8YPgbw1R2WIVkFi8Yn37rq6Q6AY+FObRZUwjDUoY+AeIVs5o24Osx2Pk1wayU+xJiX5iPqcgFv/MnTmkdKXBAEA8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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

Hi Jani,

Thank you for the reviews.
Apologies on late replies, took some time to get back to it.

On 7/4/2025 6:06 PM, Jani Nikula wrote:
> On Wed, 02 Jul 2025, Uma Shankar <uma.shankar@intel.com> wrote:
>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Add data structure to store intel specific details of colorop
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> ---
>>   .../drm/i915/display/intel_display_types.h    | 19 +++++++++++++++++++
>>   1 file changed, 19 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index ce45261c4a8f..4b5124a08cc9 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1560,6 +1560,10 @@ struct intel_plane {
>>   #define to_intel_framebuffer(fb) \
>>   	container_of_const((fb), struct intel_framebuffer, base)
>>   
>> +#define intel_fb_obj(x) ((x) ? to_intel_bo((x)->obj[0]) : NULL)
>> +#define to_intel_plane_colorop(x) container_of(x, struct intel_plane_colorop, base)
>> +#define to_intel_colorop_state(x) container_of(x, struct intel_plane_colorop_state, uapi)
> 
> I think this makes further refactoring harder. Please make them proper
> functions instead, not even static inlines.
> 
> See what I've done for intel_global_state stuff.

I had to create new files to achieve this. Let me know if it is the 
right way to go about it.

==
Chaitanya

> 
>> +
>>   struct intel_hdmi {
>>   	i915_reg_t hdmi_reg;
>>   	struct {
>> @@ -1932,6 +1936,21 @@ struct intel_dp_mst_encoder {
>>   	struct intel_connector *connector;
>>   };
>>   
>> +struct intel_plane_colorop {
>> +	struct drm_colorop base;
>> +	enum intel_color_block id;
>> +};
>> +
>> +struct intel_plane_colorop_state {
>> +	struct drm_colorop_state uapi;
>> +
>> +	/* TODO: Add hw implementation */
>> +	struct {
>> +		bool active, enable;
>> +		struct drm_property_blob *data;
>> +	} hw;
>> +};
>> +
>>   static inline struct intel_encoder *
>>   intel_attached_encoder(struct intel_connector *connector)
>>   {
> 

