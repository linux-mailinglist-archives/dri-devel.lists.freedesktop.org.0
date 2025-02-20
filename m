Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97293A3DB50
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 14:30:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0646E10E959;
	Thu, 20 Feb 2025 13:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQGWFtxt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF32D10E19F;
 Thu, 20 Feb 2025 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740058205; x=1771594205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p0LrCMUSQneLvEzvZqIjCPUv1Y1wUydsS88YugYn+8A=;
 b=kQGWFtxth0OpGpRv9qB3P0lbEcvIcbwHfVhUs02dLpH3C2NB//WzHbfG
 prSR7ijvm+ke4iPiiCYGvmiEAGb4IkidSZjmH/N/ggZak7lKKRoGHWlHw
 +J1eBcOwGxD9Ot307NoRgzXmXzbKpyBPcDWkkq4SHvFMp62XMYYUkU3F1
 vx7mkf34jE3RcHjWg43lQnCrZT1oQBRzQJEwF7JCtGFZpcxgoqNh+eVkl
 pPoMshAC2ssT9p7QMry6CqA80zWUEOLZEBGKcbt7WYmJENISYaOtdELj/
 WwAe2GYZRrVA4WRug5U7wH9tYM324hf2/SP77BqlFIBu1IRXek0sPnzCB g==;
X-CSE-ConnectionGUID: H5v5GApeSmKwvIO3KoSxLA==
X-CSE-MsgGUID: x8LBDNxcRTyrHRTIi75sDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="66194996"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="66194996"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 05:30:04 -0800
X-CSE-ConnectionGUID: n/2tfPovT9+4vqHDXJ046w==
X-CSE-MsgGUID: qvRSN952SBG5XwD+pFW4Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="119980473"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2025 05:30:04 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 20 Feb 2025 05:30:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 20 Feb 2025 05:30:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 20 Feb 2025 05:30:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcaTeUXO9q73zJlZqi6IV5e9jluBxjeyvt6E1BrBE5xBAggI9XRGMtFOIfBqTaB98Cj1dxlTkwEfxOwIv0I2e79NUNktIkiKn2u1slOaZrhD+oO3oRdAeT1zGsUdCoNZtuCKXxSwKGhmueWJ5STambYh0rwC8mDilUmyRY04m2o2l5DxHVCBIRPOcK5dmA/86BXQ75DtEFyDWqk4Wwixh1v98ThfEOB9i3iZfodF9ePHqUNn9i/Yq3/3ArY0lUANGXqFXvMs1QMIFpLTqIQok45OLOjvz/5f7hmBMHvaYmDElnCy+flQcMOT1ql5pufpqU+09WvqZMfR+sRD8Xf1CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N9gxEFQtZGWWAE4rySRrErzdN0sKn+35xrxkKvoWhcU=;
 b=fJdwuknLzxYomimU77vyobUHYgjwKkQVc6uRY43d1SFmUV+cDnA4tW1Ap7uyjkTo+hRKYbK1vPZXd3okCTw8csqlkZo+eG5euCHw+YoDQ4ruJPJG4Mn4PN1pexwb4FY8zfo7FmEd95bLXv1GWZjj/yZKVO2zse/jEYTNERwih9iHBmeRtPlWG84moTb2AvSsxz5zPlzQnvKuOM6TdN9rJ7NwVwhnZWAn3+qjV0z0ckKUCTiaeUhzZwNfimesZiJMUJXJAIsaxkdS/Obnf0NHR2CufvjBYy3fDfgwSQou7cCP1wbmM27pfu5DQZ3CkkFk3z5F1zmUl4OKg0oFTm++yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 DS0PR11MB6472.namprd11.prod.outlook.com (2603:10b6:8:c0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.16; Thu, 20 Feb 2025 13:29:32 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%2]) with mapi id 15.20.8445.017; Thu, 20 Feb 2025
 13:29:32 +0000
Message-ID: <2dcef9ea-f204-437c-bd28-c84a8ab5b2fa@intel.com>
Date: Thu, 20 Feb 2025 15:28:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/32] mm/migrate: Trylock device page in do_swap_page
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <apopple@nvidia.com>,
 <airlied@gmail.com>, <thomas.hellstrom@linux.intel.com>,
 <simona.vetter@ffwll.ch>, <felix.kuehling@amd.com>, <dakr@kernel.org>, "Harry
 (Hyeonggon) Yoo" <42.hyeyoo@gmail.com>, Byungchul Park <byungchul@sk.com>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-4-matthew.brost@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20250213021112.1228481-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0298.eurprd07.prod.outlook.com
 (2603:10a6:800:130::26) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: 88b62806-4814-4262-9578-08dd51b29c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SG5iQlNjMXFGSklTWURsTkJqS1NjUlVNd2d6elRFRVhYWjVQa1dLSTFZWEYx?=
 =?utf-8?B?SEd0VVJXMnZ2VDZubHpTM3loSWpnZW1HL3NXaDZUOWp3eVdmSFNzaEd3OVRN?=
 =?utf-8?B?RXVTaUxjYnlDQzlRWFhPR1pXeGxRcWZTZG96dHZnL0hBaWhFcnZQdFNOeHRX?=
 =?utf-8?B?R3dqWTJsSitMcGtZNFQyUDRSQXBoWDM1RERKbGlKUDVac094NitIeXdaRnpm?=
 =?utf-8?B?a1YxOWRJU1RQUmxQeVVmS3F5aWF0bGY0N1lrb3dVZXlHSnlMckZDQU52b29h?=
 =?utf-8?B?VDRpbkF6Zld5bzZNYnlTdkE0THU2blI4YnJxbkZ3NzJqR0ZFZ3JXdmU3aFdQ?=
 =?utf-8?B?QldjN1I1RkpUU01sZ2J4NWxhNDFEWC9ZOEx1M1RLM3M4T1J3WjZ3eG8wUEJS?=
 =?utf-8?B?T3UxTEFFZnhWYUJMS2tkWWNFajNVUTBFdDN1RHpxVTFWZXhMcUIwMWVDaGRL?=
 =?utf-8?B?dWJtOS9ZemJCT3hrOGVvQklNaC9iYUdNMGpBZ1YxUjZHV1IvRUd3QldIUFU4?=
 =?utf-8?B?MzFBbjYzcFpvQVVxQWxtTUJmUnRocnc3U0IvR2JiS3VkTE5NZXFwNzdxS1hn?=
 =?utf-8?B?bkEwdHRGeVhMSldDTWN5RHNKNktEWjduWEwwa3gzYnlCUldncWc5bi9ndTRL?=
 =?utf-8?B?ckIvYTkzenhsRzl0VzVRYnpuUXB1SnFULytEbnNuRFJ5cWI2Tk9YRnRhWnhP?=
 =?utf-8?B?cEpXUVVWMXdxZldXWnBRTkhmMTgxMEJDZ3FYUENTemFLbk80bjc2OElZQjcw?=
 =?utf-8?B?Vy95cnRva1pRdnNwV3ZNRW9qdHJDYmZXR1g2U2IrVDhOMldoWitmYUJzT0VJ?=
 =?utf-8?B?bitIMnBrWE1nbW9Rd1VYOUdKVnlwRDEwRXB6ZmJ6N1hxdXRCZXlibmpFczJP?=
 =?utf-8?B?VWlpSEFBdmtNdjkrWERHTEhnUXJybkc3NFo0aEc0d241dHdFeU9nQnpENWlh?=
 =?utf-8?B?eGlNMk1BeHpYeWxCdnhucGZFaHlGNlIxd0t5K055NzRiYk8rRGZhdzhFdHM2?=
 =?utf-8?B?clZUcksvb2hRT2M2VDlTaFFoWmhNNVRlR3BUNEtHMzFXVXhaREJYS3FKc09G?=
 =?utf-8?B?T1dXcy9Nenl4dGpOMnA1dlpMc3VPMGdkdDFwQU83Mjd5MEVYMXFHZlg2cEJm?=
 =?utf-8?B?K1haNkxQYklVVmI1QTUrOFhkdFJjSHBLNUlzdHFiY1hvU2ZPUjFHSDRoaVBI?=
 =?utf-8?B?dkVpb3NtdnFEVVhpYzdDSlNlQ3p2Yk9ROVBiZDk0RXFENTh6bmw4dHA3OWtC?=
 =?utf-8?B?MmMvemRqR2hORjRNV1VoSVVLcGJkWjM3UEo4OHo3SmNaZEU4Yjd3Qmhmcmlh?=
 =?utf-8?B?OVlLS3B1MmVSbThNMElIM0VFL3pac2N2K29tNXV4VjNoaCtoNU50d3J4ektr?=
 =?utf-8?B?Mzh3c1RIcGRERjhVWGs1UGcyUy8yZlhqTzN4SmJ1MzI4ODRlTm9ld2xxK256?=
 =?utf-8?B?dGxpR2x6OTVpMzMwWEFoKzQyUEJHemVxbDNEMVNTK2NvdHVMVDNWdDRpRXZS?=
 =?utf-8?B?VEd1cW1XeHNOYWgwSC9LR29UdFhId3lnSElYNGFxNmVYVWpFcnlWN0JQMVNn?=
 =?utf-8?B?R1BnU3dXNWxmNVgrWll2YnpMYUJVdWNvRWdXK0RlS3IzZ2UvejhBdEdJUTVK?=
 =?utf-8?B?Vi9qbGlBYWVwUll0cEx2VHB0NFM0aGYrY21FWEJoUDJ2elBYaDBVZW1EUUxT?=
 =?utf-8?B?UmdtanRoQkdNT1BJMytiOG1lb1hGSlBDVlJMV2h5RVd1V0JKbENZb0taNjdK?=
 =?utf-8?B?Ty9ESWdjQk9nTDRPQWhmRyszeHJTN2NCTDlERWhjeUlMYzVIMTJhZ2t0aUpa?=
 =?utf-8?B?bWdRTmYvSWJoR3lDNm9JZFIwYWdTWDF0RGw5YWhYbEFBL3p3TDBVOGlGekVa?=
 =?utf-8?Q?deWV24u6y7gC9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkNDZVh1OXRGa0lVR2IvSDhFMnBpMFJ3Z1E5NzNVcFZnWG8yLzdMcGh0VU1Z?=
 =?utf-8?B?Rzh5YmdLV3UvRExQSjBPNlFRd0NKK2N2NTFTL0VuUnFvWE4wMFJXMmN4a1hY?=
 =?utf-8?B?R0lQb3ZjWEhERWgzKy81T2VXMUduVmhTV3MwR2p6RWZWTnR5Wmw2UzI4Vjdh?=
 =?utf-8?B?VEN5bExaZm40bmI2QVpRSkp3KzMwVzlENXNkL1R6d0ZkVHVwRnhlOGd5Q2c4?=
 =?utf-8?B?b050KzFjS1d1RmlCLzZ1NDd3bzQydEVjZGlmSDIrNEV4dmZFK3VJdDcxWGVm?=
 =?utf-8?B?STJTdVpmWURoMUlaTTQ3dWt0aXVEemRrbzduK0dVSnVlYVJNcFduQzV2aXNp?=
 =?utf-8?B?cWs3L1VqQ2VUeG5jOWxvNkdKMTd4T3Z3UnJqamNUSjY4RUZUTnpvRHhmd2dr?=
 =?utf-8?B?cmxKRmJvYUJBMVRmREd6aUlicHhrUTVZdWJnNlZqVVI2blFuUU0rc08vYkpn?=
 =?utf-8?B?MFZRcVA5eVIxUTU4ejdLeEZ1UWFyZUNuQ3lGeVlEQmxWOTJPQkdaQUJETFFo?=
 =?utf-8?B?MitmR1o0eDVOL2haMFNTVUlDVlR3ZTNmTlZqWHBNTVR3b3BxY21zWm9Qdm1O?=
 =?utf-8?B?TVJ4bURNR3d6Y0haejBvR1RXNkM5VGhkekkyTk1ieVdDQVNPajE5NGQ5eE5t?=
 =?utf-8?B?RU1ZTUd1NnlZUEpULzlwLy9qQ05qeUJLZ0xneUREQ3BOT0NnVms1THJQeWxH?=
 =?utf-8?B?S0hzNnNLWnlGNkFRdXp1ZlIvL1RNa1ptNjY2WFVndXBTd1dVbGZvZ3VERWJO?=
 =?utf-8?B?ckQxdTM0L1pHcUtDRVlGWFVLWFdyS2FCZ0hhd1FyUHdEOHR4QVFWdDBXcHFs?=
 =?utf-8?B?MGxWY1pGcHlpN0V2aXdLRFhBQlllUjhnWExiSCsyckNQMlh6MjVUVFlZNE9u?=
 =?utf-8?B?bDBxY1NKYzBrQmVTRlpFazBwdkRNV2hPbWdNdFFSL1FCLzluaXZVS1VkRGhu?=
 =?utf-8?B?ZVd3blBYY21LNEgzdVNoYllxeHR4Sm0rRllpeC9TQ0FrTnFxRURXLzNVNWw4?=
 =?utf-8?B?ZW9JZEhXQWJ1YTVMajBiOEpYRC9DT2YzTjJtNGtmQ2VCRmdKUnBGQURUTkdx?=
 =?utf-8?B?MlYzcnorRTc3cDFWY3dLUGYreGkvY0tlYkhkQWYyUHlIZC95YVQyQkl3d0JR?=
 =?utf-8?B?c25DcUw3MUF2Y2J6RVYyOENEeEJsSjJVclNmMVp2V0cvNWxWQWFXNDY1MzQ1?=
 =?utf-8?B?b1FiZmcyd2I4bVBVN2RtanNGWWVmNWtBZTB5MDZPQ05SRFo4YmlTQ3crcHV2?=
 =?utf-8?B?UFQxbmc5Zzh3eFdLMzNCbERVYkRNSFNGamtaNlVLaVo2RjlWOXhOS01TODhI?=
 =?utf-8?B?c20rVTFJY0hXOWRzSUFnTis5dEpkRGZhQjh2eHNFaEJ1ZTFiVkVPWGREM0dZ?=
 =?utf-8?B?ZFZpUWFMWDJzOTJOU09NcnRsZ3hZTEZFdUI0QmFzQmorc0FGNnAzRFZ3QmxQ?=
 =?utf-8?B?a1d6WXJDZTJHWnlYcXBxYURrWmZ0b0pNc2VHNy9oSXB6ekZuVGp4VFdTdkJk?=
 =?utf-8?B?bVl5SlV5WXV0UVExYWw2a2t5WmNGajd5MXkrR3U1Z3pubDJJdi80WmttWU5Y?=
 =?utf-8?B?ODFoS2RHdmZnUENEZlg2bC9HMWlHTVV3OTRGZ3NLMkQ1ZU5yUWkvWEVidjA0?=
 =?utf-8?B?Zzk4bGN5ZFg3VkNXYW5zUXZXZ2dNd1NaOGZNbkMzRExka211WnhMUU93QWx6?=
 =?utf-8?B?Q1BkeWtCaTAxZXpRelhZclpzMUNKMUFWQkxVc3cwck45bWNuUHNXa280bFY5?=
 =?utf-8?B?TXVNN3FMVmNVSStyOWhHNkF4Qkp0MjM2S25uUklCTjV0NWdmdGd2Q3c1Qm9E?=
 =?utf-8?B?TjIycE1xVVd3Z2Y1dUgyODR1eG1YMWFnSEVsb1dvUStEb0JueTBudlhrS2dT?=
 =?utf-8?B?UEtiQnlHM09PcUNsVHdFK0pTRy9iOHRoQlhzdGkydlR1UExnUjdSTFQzWlBK?=
 =?utf-8?B?TU8vZ1l3dUlSZHU5b2hNMlU1b0N2NmNCTmc4cUpaalFWbnBaNTN0ODEwU2Rr?=
 =?utf-8?B?UkZvQjhwM2UzWXhRVjcySk9oL2hYYWoyTUhwRkErQm1yWkc1U3oxb1Bzc0hM?=
 =?utf-8?B?TVYwMEF2NjArcHZnY2lIckdueHE0M0NwemdibEZIYzlBbWNQcmlDUVpRWkZR?=
 =?utf-8?B?UjNkNHJHU1Iyd3RWeExGSjF4eG5VaXpCYUxMM1NPTzFPQzk0R0dLSjl6OGdN?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b62806-4814-4262-9578-08dd51b29c16
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 13:29:32.5674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVOc2U/3HXyHDgqKE92w/2R1/23x9SHaoGo79uFRLvmej4qKqINPefhR7RaAMd0yUXljKPZYVJaLOG8zDSG1TUw99TVUEbzGka6nYqu8XQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
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



On 2/13/25 4:10 AM, Matthew Brost wrote:
> Avoid multiple CPU page faults to the same device page racing by trying
> to lock the page in do_swap_page before taking an extra reference to the
> page. This prevents scenarios where multiple CPU page faults each take
> an extra reference to a device page, which could abort migration in
> folio_migrate_mapping. With the device page being locked in
> do_swap_page, the migrate_vma_* functions need to be updated to avoid
> locking the fault_page argument.
> 
> Prior to this change, a livelock scenario could occur in Xe's (Intel GPU
> DRM driver) SVM implementation if enough threads faulted the same device
> page.
> 
> v3:
>   - Put page after unlocking page (Alistair)
>   - Warn on spliting a TPH which is fault page (Alistair)
>   - Warn on dst page == fault page (Alistair)
> 
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Philip Yang <Philip.Yang@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   mm/memory.c         | 13 ++++++---
>   mm/migrate_device.c | 64 ++++++++++++++++++++++++++++++++-------------
>   2 files changed, 55 insertions(+), 22 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index 539c0f7c6d54..1e010c5d67bc 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4337,10 +4337,15 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>   			 * Get a page reference while we know the page can't be
>   			 * freed.
>   			 */
> -			get_page(vmf->page);
> -			pte_unmap_unlock(vmf->pte, vmf->ptl);
> -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> -			put_page(vmf->page);
> +			if (trylock_page(vmf->page)) {
As a minor point, mm core suggests using folio rather than page and 
folio_trylock() rather than trylock_page(). Is there a reason why page 
is preferred over folio here?
> +				get_page(vmf->page);
> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +				ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
This makes the internal locks that migrate_to_ram() can hold depend on 
page lock. Would it be better to do fine-grained page lock when 
necessary to prepare for locking issues that may arise later?
What are the advantages of using a holding large-scale lock  here rather 
than worrying about lock dependencies?

Br,

G.G.
> +				unlock_page(vmf->page);
> +				put_page(vmf->page);
> +			} else {
> +				pte_unmap_unlock(vmf->pte, vmf->ptl);
> +			}
>   		} else if (is_hwpoison_entry(entry)) {
>   			ret = VM_FAULT_HWPOISON;
>   		} else if (is_pte_marker_entry(entry)) {
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 19960743f927..3470357d9bae 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -60,6 +60,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   				   struct mm_walk *walk)
>   {
>   	struct migrate_vma *migrate = walk->private;
> +	struct folio *fault_folio = migrate->fault_page ?
> +		page_folio(migrate->fault_page) : NULL;
>   	struct vm_area_struct *vma = walk->vma;
>   	struct mm_struct *mm = vma->vm_mm;
>   	unsigned long addr = start, unmapped = 0;
> @@ -88,11 +90,16 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   
>   			folio_get(folio);
>   			spin_unlock(ptl);
> +			/* FIXME support THP */
> +			if (WARN_ON_ONCE(fault_folio == folio))
> +				return migrate_vma_collect_skip(start, end,
> +								walk);
>   			if (unlikely(!folio_trylock(folio)))
>   				return migrate_vma_collect_skip(start, end,
>   								walk);
>   			ret = split_folio(folio);
> -			folio_unlock(folio);
> +			if (fault_folio != folio)
> +				folio_unlock(folio);
>   			folio_put(folio);
>   			if (ret)
>   				return migrate_vma_collect_skip(start, end,
> @@ -192,7 +199,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   		 * optimisation to avoid walking the rmap later with
>   		 * try_to_migrate().
>   		 */
> -		if (folio_trylock(folio)) {
> +		if (fault_folio == folio || folio_trylock(folio)) {
>   			bool anon_exclusive;
>   			pte_t swp_pte;
>   
> @@ -204,7 +211,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   
>   				if (folio_try_share_anon_rmap_pte(folio, page)) {
>   					set_pte_at(mm, addr, ptep, pte);
> -					folio_unlock(folio);
> +					if (fault_folio != folio)
> +						folio_unlock(folio);
>   					folio_put(folio);
>   					mpfn = 0;
>   					goto next;
> @@ -363,6 +371,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
>   					  unsigned long npages,
>   					  struct page *fault_page)
>   {
> +	struct folio *fault_folio = fault_page ?
> +		page_folio(fault_page) : NULL;
>   	unsigned long i, restore = 0;
>   	bool allow_drain = true;
>   	unsigned long unmapped = 0;
> @@ -427,7 +437,8 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
>   		remove_migration_ptes(folio, folio, 0);
>   
>   		src_pfns[i] = 0;
> -		folio_unlock(folio);
> +		if (fault_folio != folio)
> +			folio_unlock(folio);
>   		folio_put(folio);
>   		restore--;
>   	}
> @@ -536,6 +547,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>   		return -EINVAL;
>   	if (args->fault_page && !is_device_private_page(args->fault_page))
>   		return -EINVAL;
> +	if (args->fault_page && !PageLocked(args->fault_page))
> +		return -EINVAL;
>   
>   	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>   	args->cpages = 0;
> @@ -799,19 +812,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>   }
>   EXPORT_SYMBOL(migrate_vma_pages);
>   
> -/*
> - * migrate_device_finalize() - complete page migration
> - * @src_pfns: src_pfns returned from migrate_device_range()
> - * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> - * @npages: number of pages in the range
> - *
> - * Completes migration of the page by removing special migration entries.
> - * Drivers must ensure copying of page data is complete and visible to the CPU
> - * before calling this.
> - */
> -void migrate_device_finalize(unsigned long *src_pfns,
> -			unsigned long *dst_pfns, unsigned long npages)
> +static void __migrate_device_finalize(unsigned long *src_pfns,
> +				      unsigned long *dst_pfns,
> +				      unsigned long npages,
> +				      struct page *fault_page)
>   {
> +	struct folio *fault_folio = fault_page ?
> +		page_folio(fault_page) : NULL;
>   	unsigned long i;
>   
>   	for (i = 0; i < npages; i++) {
> @@ -824,6 +831,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
>   
>   		if (!page) {
>   			if (dst) {
> +				WARN_ON_ONCE(fault_folio == dst);
>   				folio_unlock(dst);
>   				folio_put(dst);
>   			}
> @@ -834,6 +842,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
>   
>   		if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE) || !dst) {
>   			if (dst) {
> +				WARN_ON_ONCE(fault_folio == dst);
>   				folio_unlock(dst);
>   				folio_put(dst);
>   			}
> @@ -841,7 +850,8 @@ void migrate_device_finalize(unsigned long *src_pfns,
>   		}
>   
>   		remove_migration_ptes(src, dst, 0);
> -		folio_unlock(src);
> +		if (fault_folio != src)
> +			folio_unlock(src);
>   
>   		if (folio_is_zone_device(src))
>   			folio_put(src);
> @@ -849,6 +859,7 @@ void migrate_device_finalize(unsigned long *src_pfns,
>   			folio_putback_lru(src);
>   
>   		if (dst != src) {
> +			WARN_ON_ONCE(fault_folio == dst);
>   			folio_unlock(dst);
>   			if (folio_is_zone_device(dst))
>   				folio_put(dst);
> @@ -857,6 +868,22 @@ void migrate_device_finalize(unsigned long *src_pfns,
>   		}
>   	}
>   }
> +
> +/*
> + * migrate_device_finalize() - complete page migration
> + * @src_pfns: src_pfns returned from migrate_device_range()
> + * @dst_pfns: array of pfns allocated by the driver to migrate memory to
> + * @npages: number of pages in the range
> + *
> + * Completes migration of the page by removing special migration entries.
> + * Drivers must ensure copying of page data is complete and visible to the CPU
> + * before calling this.
> + */
> +void migrate_device_finalize(unsigned long *src_pfns,
> +			unsigned long *dst_pfns, unsigned long npages)
> +{
> +	return __migrate_device_finalize(src_pfns, dst_pfns, npages, NULL);
> +}
>   EXPORT_SYMBOL(migrate_device_finalize);
>   
>   /**
> @@ -872,7 +899,8 @@ EXPORT_SYMBOL(migrate_device_finalize);
>    */
>   void migrate_vma_finalize(struct migrate_vma *migrate)
>   {
> -	migrate_device_finalize(migrate->src, migrate->dst, migrate->npages);
> +	__migrate_device_finalize(migrate->src, migrate->dst, migrate->npages,
> +				  migrate->fault_page);
>   }
>   EXPORT_SYMBOL(migrate_vma_finalize);
>   

