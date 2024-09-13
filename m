Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C839778C1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 08:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E98610E6F2;
	Fri, 13 Sep 2024 06:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjLm7hr/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1649310E556;
 Fri, 13 Sep 2024 06:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726208599; x=1757744599;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+LGWZ9jMwvvfU8AlWW3YyFfztAm1XV9MY7dFZC8THto=;
 b=NjLm7hr/w+B7/SfLuKKOYgBFjcnnEUe2ZGD+wuDgnoaeJBHAEFWGLfAN
 xNt8g86xBFXu1Aexu/hOmglj9o7kTe0TB8uUCGGXIf9OByK7a/jK+tS9i
 vxC4sXWthqqlH5/pogZkTuG5nNDed4vAAZ1bTmeKRcViam5VZ9mbq6fIA
 RJs3xoHd+e3ibBgMmcC+lZVd88OBnJaHfuIuIfnERuRn4e6/auYTJa8fY
 hveVmPicK0sn/8jj6/pFg4WRBo1zvimCas0fQXOharbiiKZfiDjxKSX9g
 7h3ivx0UwPCJN2pGrV7bBWrrnJVyfTSu8XMQb5V4Ar0Ut9A9zU8RYuUTN w==;
X-CSE-ConnectionGUID: OVw195phQra0d9IXtI9E7A==
X-CSE-MsgGUID: Ex6AqexhSuGc+JuuRD++5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25249364"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="25249364"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 23:23:18 -0700
X-CSE-ConnectionGUID: PjHX1+iqTJCw/XkIglNfiw==
X-CSE-MsgGUID: CZEI4zLkQgKOkWUQsfupsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="72549684"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 23:23:18 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 23:23:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 23:23:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 23:23:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u+TNs1DQtlko9i5IrR161hYJ9epEoGs3cFxpivOHASNXxErI/MAFygvF50w+jb0jDK8ONyNl0iVUAlWgc2Ai/hYybegCltqD49d/aVsuSyygrXa6ZlyI5n24bqwL1entQQR/fC0y7gwdYU/wQYOFp40P8TlWyFsdu8XCKA3GXsUeD1gR6eBoNrUnFt60Hl1DeWxMAP7mfRCXmPXAYu7hs09xL7eYk6JBJuxfsYSMLBUqRiH0SdOFwEevbvKGH5lP1f7BclDE0xyTKabvpF2xxb555IVgCQUS/PEgwQnKRAFNnqbU7IOGM3aI3tZhRRXZOBD8ZCn+lRiGmZVYK+19mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8067gsEFRP9ERod2u2e7T1QV/OYldWcilbJFEuVwmWQ=;
 b=CppAGgUUm2PpBP0pnPdjtc673W2L9IYFJo/IUOWwN7Q1swRqQBahIFnLR6lElKWab7TBqMKXF/n/+Qrfr6r19T1ejbgSVF/93FIieGLkK1tq2/i4NV7pUnyIU9r2Tn7SyyrC5yF7667LdmlMNAjpVl1jgbUdYNxvHOJRPo+F30Sd4d6Z2aKu8pGr5u9xqnpXU2glJChoZv5BW9Q319D8b/x7TN1vYXkCRlJOiKzVu9dPjUcCxkH3CDzAOH3ARjqqcch3ENP73I6F+hkFe98E6L43+sNY1DI6XHN1TkL11HA/qmnNvaiKvvw5wPXIHzhwAQKi+kpYEW/Sgr0bNxPYyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Fri, 13 Sep
 2024 06:23:13 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 06:23:13 +0000
Message-ID: <6bef5f38-5490-4cd0-8e8f-2b2271d20d44@intel.com>
Date: Fri, 13 Sep 2024 11:53:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 -next] drm/xe/irq: Remove unneeded semicolon
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, <lucas.demarchi@intel.com>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, Abaci Robot <abaci@linux.alibaba.com>
References: <20240913060254.26678-1-jiapeng.chong@linux.alibaba.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240913060254.26678-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::35) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cc434c-0559-4843-730b-08dcd3bc8bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czJmUU5nSVNpcGtoQVlxbTJZRGdNazVZTEFwQ3RGMGxZUmhIUThMelpuMHNj?=
 =?utf-8?B?UzQvM25NWGRVSGVYRU9aN1JVUFVXd1NaL3FoekVjbUIxbm5QUTREdTBjYndU?=
 =?utf-8?B?ZmxjL2dzY1puWE40WmdjTitoTTU2NFBEMWlxNlZyOHErRmozTTlyMGNpZjd1?=
 =?utf-8?B?bzByOVMzVWpmY2hDNlNOc3J0aVhwb3lVdU1Kb0NiK3ZJOFFTMk9ac3BmRFNL?=
 =?utf-8?B?Q1A4aksrcnJ2VVpPYi8rN2U2NlRBSEZxWnhkTVRkME1ac1VzYU9qV0owb05Q?=
 =?utf-8?B?RTByRTdvN2FvT2xBSGJpU1FoT2dsMjBkUS9ubXZrcEdlbm1kd3ZOZkJybnR0?=
 =?utf-8?B?OCtaYk5nVFh0MHpyc1lJOHIyRFFlY0d1L0RMWXFxWmdqS1h3OUR1Y0ZCVzBW?=
 =?utf-8?B?bWNUTE9oWlVjOUJTZ2tCWFVwM3Y5VXA5Rkk4bjY3MTRCYW5YYjJzYWx4NkdX?=
 =?utf-8?B?dGpnTys4M0ZJUFV3RDRxRXZVbzNGQ0trTDhXTEY2RHUvREl3UmtHR2VSVEVN?=
 =?utf-8?B?WnNpNkhOQXpkZVd5c2hVeXZEdUxKd1d3M3JHbnhIQmZpVytCckErR2U2dkpv?=
 =?utf-8?B?bkcxeDJveUlXZUxMRFdrK0l5OWwrZTkralhDSUJvV2o1RWpPSDhqWTJoOG0r?=
 =?utf-8?B?b0tWTlJOby9oMUVERXNPd2x3ZDZsT2dnOTVQb2Q0Rjh0S1hkVm53emNZbys5?=
 =?utf-8?B?b2lzS2dUNFltUHYvVDZnM1V2ZnNxdVQ2Z29RL0JEOUU5c0lkc2dyUWRvdEM3?=
 =?utf-8?B?Zkx1b1d6d1VQbmtEa2U5Q2RrMGVuWW1WcnA5elJjWDY2aEE1OGg2cndUV2Uz?=
 =?utf-8?B?QWNnZEx1MWFyOHA5bjd0bUszeVdBaFU0dEZENVNLcHljeTRReDczOW9mOUY4?=
 =?utf-8?B?bWY0V05jSjRxd0lFSU1kcGFFU21aR0tucE1Ydml1aS9lRW91ZDdjWTgwSDlo?=
 =?utf-8?B?TUlZeEhucmIwTHdja3g3V1VDRWkrUVlPZ01PaHZXZDlKUHhvR2dqZjdlL251?=
 =?utf-8?B?Z2srckhpZjdlc3hwZTdDZUhXR2NGM2hURTRWQWlLMWJnaHVVSkExaTlhS0I0?=
 =?utf-8?B?V21PVmN0UEhoN3RmY3dmRkh2aDgvM1k3eit2YS90VjNGc0wvMkFLemQwTm44?=
 =?utf-8?B?KzVaOFJ5ZzhwcmNBOG9RaC9obmtaMXYyblB0a2dpb1V5NHhUeDEwVjZ6YVRs?=
 =?utf-8?B?MklzaDd0RW1ydDhaTlNYOEJlWDFLQWJXOVl3Qm0rdWI5aEpmVGUwZXlqQzYr?=
 =?utf-8?B?cHlka2c3OHJFVlFHMnJxZmp0U1hxMTRqVm9NQ0hrQVd5akg5TUpsSGppNDdW?=
 =?utf-8?B?T0c0b0NiYWRueEd2M3p5SGcrQUZHZ3JLMmM0VThhS0tMaDRSMG9EZEgzOUFH?=
 =?utf-8?B?YnZPeFJRQzh0Z3Y0ekVLRFl5cWVGMkoxVUxRbTh5S3g0bjhFelNKWmswSDBi?=
 =?utf-8?B?bXN4aGVtZFVBQ2pjVDREYU44OFFXc2o2ck1ZN09RaWM5OEk0OThGVmVZWldL?=
 =?utf-8?B?a3IwV1FwWEgrVjJPcGJkb2g3dnNOdE5HeHVjSHhDWm11eVBKeFpEQWNHSmg5?=
 =?utf-8?B?MTNiS1pZSTdkQmNjeW5sNW1JVk83NTRZMENzUTZ1Rjh5MVVaL1dNSmxoVnN6?=
 =?utf-8?B?UEQzUFZCYUlBTFRjaHdjVkk2OWcwNDRJMm1RQis1SGNraXlJa1JZTWdIVnFz?=
 =?utf-8?B?MVN5V2xJeFQzVVljMjVwYzVGbDN3UEJTd3VuQ1FaOUxiT0NET2d1d21oZUt4?=
 =?utf-8?Q?UfwtvBU8nwviAFx8s0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sm4wT3ZhUWkzS05wdnlvejdrWGdLeHF2Ty9BZzREZXdHWlhmVnRVU2RrMFd2?=
 =?utf-8?B?alVHeW1iRENQN3NQQndhTUxpd1N4YUpjVWtFS1M3QVhoanhqY2wxNEcwZjhn?=
 =?utf-8?B?MmNnWllKV3BXU3FrNGFid2V0aWFJME9ZQm5WblpxTVBzcHJlVENEYnZNQmJP?=
 =?utf-8?B?R0hMdC8vZ2tVdHlNZ0pUaXNPMzRnWWFZdG9KVnBiMDZYdUF1S2tRanl0c3Qz?=
 =?utf-8?B?MER6MFhIWTRlY01xcVduT2wwSkZocVNlM2tLTXpFMkFmeVU0dmM0L2lsUk5T?=
 =?utf-8?B?U08rNFc4aG1RM0E1ZW1ZbTVYV1dIdFVZTm12OTl4aTlIbFJzVUJpZTFiaUdp?=
 =?utf-8?B?VWtNcGdWSVNxdGhWRkQ3Z0UwQllHV0hPUDg4czV1RFFvRmZFNGN3TnlKTlVh?=
 =?utf-8?B?anFPUjdEKzhrSnM1Q2JDR01wZ2ZVMlRQaDJKajkvdU9qNktPZGhCdWhvdEZq?=
 =?utf-8?B?cUlwTUYzczE3OVBiZFU3U0VJeU5sMVpMYVlOUVZDNXYrUHJvdG03cXNTRnps?=
 =?utf-8?B?UEtuRFk4SzVuaHdHTXp2YTUwUjE4NTAvNkwvaEJPRFRYN0twNnNvTzdJNk41?=
 =?utf-8?B?V2d4YnQwRW94b1hHR1dPOC8zOWJHalJQTDhRdDJ1NkkvZnRrWWZ6RHpkK3NM?=
 =?utf-8?B?T01oWVF0djFndzg2L3FYQXpQYStVOGJHeHdBdnE0cXJYdC90aGYzKzByWllt?=
 =?utf-8?B?TURFaVZXVjJYamVuUnkxVkdRMWlVK21HODlYQWpRLzMrcmVpZXo5cHJ0emJl?=
 =?utf-8?B?L25pcTBvWXBLSUY4eTRGRFYzeklUbWJjUGM4WWZ4bkMzcFMxSEV2cU9YV1ho?=
 =?utf-8?B?YnhOMS9NRmxDc1RxRWQ0a2k4T3lGZ3JrU3Jub0ZpT0dIR1lhZlZWRlRvdkpE?=
 =?utf-8?B?NjRqSG5JMGF3UFUzaWc5emhtVHVRN0FkY2VzdUV6a0hvaG8vbDQ2Kzd6MjZs?=
 =?utf-8?B?RmpZSEdWdjFQT0o4Q1BDaTQ5RTlkQ3ZwNnhzWXNqUTZtUFRaMnR1YWhzeVBY?=
 =?utf-8?B?UU1KM29aZDRMNTZyNlB0TU4zUXlPekY2VFk1Umxxc09hc1dBcjE4czArYTgv?=
 =?utf-8?B?WktZdFc1QnBFdFNjK1NmQTE3Y3B1emhMSFdNUlRCSFdQZGc1c205YlY4Yjh3?=
 =?utf-8?B?emVlSG5tL0hiaEpnaXNSNjdBMWZvMEJLekJDWmJ0dWFKN3NQSzkza0thblYr?=
 =?utf-8?B?YWxrM29RTGNGYkNxSlMyRndlQys1YWRXbFg2Q1QzaW9VcFFYV0p2T1A3bnN6?=
 =?utf-8?B?TGRUK3ZqSkw2Y080S2JOYjlJdE9sWG1HN1RVWkliK0VZWlNRQ0JJVXhRRDB6?=
 =?utf-8?B?WFA3NjN3OTU4ZWVLdFlZc0xWUmRqVk9HYWRuZlRmb09RR1dHMFFRRW0yVmpQ?=
 =?utf-8?B?bXk0ZjRES2hid0QvRnUvNTIzYkhmWEppK01OOTBVcDhzTk9oRDNoYkRXa2xE?=
 =?utf-8?B?aW9sNzgvQUVWZmJtQ2lOc2NrVkRMT0tUYkNmQmd6amVjMlRaNkVDUGt2KytD?=
 =?utf-8?B?NURzU1NQSEQ1YWNMeHMzNkorWm0wN1lRTWcxOWdzOFBFTDVuYzQyUWxmbnBK?=
 =?utf-8?B?UzFkTVpqSlJ5clBUaU1MaDVaZ1ZXYmR2SkxjNXAzcUFVbk11QVhxQXY5a3kr?=
 =?utf-8?B?TGhBY0E5eUFxUkYwL2lxZ0hGNHo2bXJydmNFVEZJT2dsS2hwQTVNSGFBMDRT?=
 =?utf-8?B?NHkxSVNXZWZmVzVkaFdrYXFrUTREQ3g4MkYxdXBBbWRIck9EM29WWnpkaHZ1?=
 =?utf-8?B?ZzU2b0kzZ3JmUjNoRk9jeXpIZkZoU2ZMWnhnVTVlMkkrSlJCT29CVFhCRFNr?=
 =?utf-8?B?a1B3Zm5FenV1UlhTUXJrc1pZVHpPU0NsbWV3TERvVHd0dUhQUVdyWWlQNzBV?=
 =?utf-8?B?NkpKQVZiR2xMMitPcFEvdmVEUkdNbFp0eExra1doUWVaTFBFZVIyU2VuWnBi?=
 =?utf-8?B?RjI0OHU5YmRpY0dqUjBCVXFPSEtOeC9MZWtPUEJicGtXcXphSGVBYUNabXNE?=
 =?utf-8?B?b2hRMEJQUFhET1hNeU1PTE9XTmgrRDN1VmNtQVIxQjV1Ukd5dmltL2pLeHNO?=
 =?utf-8?B?OStac0NmT3g1WmFuMkFTRGIwL3YyZkNjSzJmVTh2L25hUU1Pdy84aHllNlNL?=
 =?utf-8?B?Q1QrQjhqT3NUd3JZK0V3UHFWcHZpdk5nclFXMDdNR1RyZFAvSmJ0cFFiVnpS?=
 =?utf-8?Q?QI+TC8E6XU+HqMWsMVpfuZc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cc434c-0559-4843-730b-08dcd3bc8bcd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 06:23:13.5516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Miej63K3lu+PgQEW7Xkj0MTItfin4EV2afZZp4GtVjp/5CiuhP0peOY4MgLSFaZA+PU88AFV73mOgra1Ktj/574tujlegpdvMm8Egt9sqtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
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



On 13-09-2024 11:32, Jiapeng Chong wrote:
> Remove unnecessary semicolon in pick_engine_gt().
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=8757

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
> Changes in v3:
>    -Amend the submission information to "Remove unnecessary semicolon in pick_engine_gt()".
> 
>   drivers/gpu/drm/xe/xe_irq.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 07577b418205..e501002e8a04 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -280,7 +280,7 @@ static struct xe_gt *pick_engine_gt(struct xe_tile *tile,
>   			return tile->media_gt;
>   		default:
>   			break;
> -		};
> +		}
>   		fallthrough;
>   	default:
>   		return tile->primary_gt;
