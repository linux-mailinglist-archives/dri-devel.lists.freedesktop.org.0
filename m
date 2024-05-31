Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BBA8D59F9
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 07:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D9610E09C;
	Fri, 31 May 2024 05:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BN9U2YQO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6130E10E09C;
 Fri, 31 May 2024 05:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717134300; x=1748670300;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QvZ1AAMLVFnY6MjebiKhiFYplEwNKQ6r0Nb0x06YU5w=;
 b=BN9U2YQOCGmMvbPd9bOIbj69noigJB75wQHGwxRENhItJ6pC7MrhYbbY
 1kZgUGAW8t52XHlPgzCuP4qfB8gcB7O9iFsJCCAXwEOHxXhl0um3Vsqhd
 beaXqmH9f2r9DfaMqQPa0l/6Cyyo5s+oujRJEBZgDeK4uhMBOWpF61GwP
 5yHf5uClkBAj2D43qTETOp6EBCsnT2jbT+cV2TtD621aPAgAHwNY/OWcD
 bp2Z5zoKfDtcqfDvUNXoDmZGwzztQY5RB+E749TZWzd2y6j12fADcO6ma
 bY4+1ryZbi5wFw3UJyY8iQOlRt0Taj+0kuSJOmOvc3p710vtXIT0CFHYb Q==;
X-CSE-ConnectionGUID: mdc93e/7RGuYTLRX4ae8SQ==
X-CSE-MsgGUID: 91zzy1GQTtaWKKVZH0zbKA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="16610725"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="16610725"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 22:44:59 -0700
X-CSE-ConnectionGUID: 6cJdGvmqSpmJFSzEywO7/A==
X-CSE-MsgGUID: RlXf8a0LROOIiu2N/EdQiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; d="scan'208";a="36091341"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 22:44:58 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 22:44:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 22:44:57 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 22:44:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQl2oGuszE/3XHzJF14PX0gvX4bq/qQIK5sPa0YiThdnb/mb4KGfE5jYnp+ptIa6ukKLb76cUkhUyHWAeHNKPbX4jgmtamsYIwNQxt7vLGG4MJHAvLpNSo/0BopH9YNQ8yPiVxn1KfU5gpb2En/CerpjizRkcBzmMbRyBC/1s9sFVqnx0oBL04ez8hCrb79Mo+fTnjdEdys1XUW7+26jBcTLmZO+DBrFRy8ZOrZwB1Uy2FsrlHuWTzsEr//b/dWP2nE0cJ4nkLlm+btVuKOq/ZX+agEODX4pltbLeAA+32sWUc/ijurLBScdNLLGuDYbOIQ3LwahyvFsAoIrS1lGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jOJ3XFtFx03ir221art8rcoplzPtsTujdL1DgWg6fwA=;
 b=nfi7bjSpQ1LQkMKqzk1qGUK1mCf5/8j47hR6+ZdYydccJ7W8fUiZgCvcuu3ZXBwB0JxFOMpxFN06JSwQIkeq+eoaFPZY80tInH7PecXKd3vrTxfzpqABl5ujHyLJf4Xhs9xEF49BKjwNRipWE2cj5z67dkO7XVEZezHTwek+GoHXV6LV7YbePDiZIB3ptQU58M3U5DNIqLltLnAtO/+fu7NRfo90GxPU1HLmGsNr4YGa5JVoUkGcrYv4Zp3etjgPy5okAvO6L1iwgBSC6Ov+Wgw94lGIkb7zUMTSH5sBG74YSgrg3BS/CamZYBNVfe8luWhcgLuKcfhE+6yZaU9j3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Fri, 31 May
 2024 05:44:55 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%6]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 05:44:55 +0000
Message-ID: <a909217c-9dad-4b60-8ee1-acd4cdbc8ca7@intel.com>
Date: Fri, 31 May 2024 11:14:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/8] drm/i915/display: Add support for pack and unpack
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, <jani.nikula@intel.com>
References: <20240530060408.67027-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240530060408.67027-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240530060408.67027-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::28) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: c56c96fc-5172-4e44-61ed-08dc8134ccda
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3VaYnlJcGZnSjZyaDM2UlgwZkcyWlJENEg2aUM5L3lRVWl3UHhYMVVKckVk?=
 =?utf-8?B?V3VCUHhKaDdFeklaRzlmSFBuVmhpclc3VktRYkZlNHlSSll0OTFrZVlQZ0py?=
 =?utf-8?B?V1FzOGtCMFExbUpGcjJ5SkE2M0NJdm9MUEZwSWN4K0F4Ym0xV2ZkUzBrR3Fq?=
 =?utf-8?B?UWVFSDczVlFueHdCSkFaZ0piUTE4b1BvR3R3VWs3dU1BYWJFd0ZVUk85RUs4?=
 =?utf-8?B?QmMyMGlvaldYNE5oWFo0TkszYU5wdWVhU2taSlR1aHMzdHF5SjhJVEZEY2Ix?=
 =?utf-8?B?Uk9rcXpGS2ZZSmJoRStONjNycGp1dTk4anhDQnM2VThDYkUzeW5iTWFSUmp0?=
 =?utf-8?B?VXZ4bmZ3M0pRTUgzOTV5WXpDdXNsQkRnT0Z3dkxGMnM1eUkySWRwOXR2dGFp?=
 =?utf-8?B?Z0ZOWlVKV2xGcWtZUkczV091S2RCakx4QmFvNUpQSEZ1TWliTkZLd21NdkJS?=
 =?utf-8?B?T2VXWDg3Sm1yb1hFTU0wYkhOZldubnNHZmw0TFZXZS9jY2F6WHZDeHpBY2gx?=
 =?utf-8?B?ODhGemJ1amthZk1HOC9CYlQzYW9aV1N1Y0JHV0xON2I0ZVRHR3R0Y1ZENjU5?=
 =?utf-8?B?Q3gvR2dHc21NTjI1MDVDZ1hoZ3NoN0tDdmJ2QktJQ095Y04zcmphM0poY1Z4?=
 =?utf-8?B?cmhKYjhHUXFQSWw4blV4d0IzWGJrb1k1anU4UHRaaTM3VnlrNVVKYy9tRVor?=
 =?utf-8?B?c2gwa3o0NUdGY0tFVjFZS2dGNytXaTNrZEdMVk5iVC9KK2QxRk9SSnNONHJT?=
 =?utf-8?B?aFV5VGh2cHBBK2N1bzgySzhtMXlKdC9MdlAvcG9FOVNSR3NzR09lU2xIQjBZ?=
 =?utf-8?B?cUdROTZCbUFaamVmN00vU09OSDZ1UEc0L2hOVmY1aGhGQUl0dlh2c2pXTEtY?=
 =?utf-8?B?ZTZtUVN0WDlmL0Y4NWdtOXpDc05GM1ptOUpFT3pWcTA3UkxDamZINWpWMlJQ?=
 =?utf-8?B?K1ZCMHJjM2dnK3UrN0RORGI5Y3p6MXNwNnRjNkwxWmhhM0czbmFYT0U3WmtF?=
 =?utf-8?B?TmszeEtvQ20zd0pnRFd0WHZ6My9FeksyWUNWNjhaaGRrT1pXSU8wL1NIWW04?=
 =?utf-8?B?WXVYeUVaSjYvbjg4K1NISjNDQ3F2Q2VLODZWQ0JudnpvY3lzMWpTRi9OanFm?=
 =?utf-8?B?cDIwNU9vUE9CN1FyZXdVckx5anhUTkZOcjc2UG5SMXNGSys3SDkxTU9ncHUx?=
 =?utf-8?B?Kyt5cFZIdlRTejlwMmFZb0V5dld6VmdxTTVUcmpsY3RNU3Q1UFE2TWR1Uk9z?=
 =?utf-8?B?VHB3K293YlNlRW1RY2JBR1RBR3RrSlRtaDlmRENqc1JoSFhvOHcyb0VURS85?=
 =?utf-8?B?SnM4TFNQTGNBVU5YdzhmSDRmSjJxeXBlTDhNWm1TcGE5bjU0T3hJVTB6b3Qv?=
 =?utf-8?B?Ti9zREE5K1BGVFcrY3U2eHNvaTB4MkZGWUx6b1dPU0hlUnozMk5Fd2x4Q3FW?=
 =?utf-8?B?U0NwOGdNbGdMSndibmpoOXo5d0pRbHBHUEI4dHRKSldPSllKb2RBSVNTMmM5?=
 =?utf-8?B?YXJwT0J4VXhXeFNZOXhsRmpKT0RmZjNzemVuM2VtUVEwZ2xCeXd2RXdoK0Vw?=
 =?utf-8?B?SjRCUEpTRjl5c1FpaDNZZ0FKM1oyS0pvMm01WlZxRXVFbU5yTjlOR1hiWGly?=
 =?utf-8?B?WVFLL0g2MlRFSzRGUmM2bEpsYkhpbXlCdnd3ajBNV2owZWlLTEJzWEJGRHk5?=
 =?utf-8?B?STEwdkU4TnVtMVRwTnY2RzRHREwvc2VaWDFZaU5QNW5ING9tQzY5L0FRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enBJY3lkV1lldWQvbWh6dGxrajZ0TXR4clVFVWp3K09JUUpNSkh4YXFhZDRl?=
 =?utf-8?B?QnI0MS9PSk1YTG9EMUFzUEtmMXNva1JIQ0ZmTEE4L2xTcjhlWGVmQjJhMWRZ?=
 =?utf-8?B?elplUGpDUVdybUVRaDcrN2RTVXhVOXJadFZJcFFsUE8xaXNNQkNQdnBINlY4?=
 =?utf-8?B?a1dLS3ZubStmZ0JZVWdySnNIMUg3a3ZZbGIyNy9GektEL3NMWEtScUo5d29S?=
 =?utf-8?B?SmE4dVlZRElQNmsxQmw3R2tjVlk5dHhRN1FxVFR0Y0xjalY2MUVBQ1FLRnZx?=
 =?utf-8?B?V3hTa2dkWXNzM3lMU3NoUmsrU2lDTTlIZHhvbGF5WmpIczZ5UThkdmVDSUxQ?=
 =?utf-8?B?K0JvUTFHODA1a0hNdjljT0NWdUdBWWQ1NndhSXhDSm5sVk1aV3hYbS9LcHpG?=
 =?utf-8?B?V2M3QW44WVRTZ1FmQmVxbW9nL3Q1L2c5a0ZVZFFsTVB3L2F4c2JQTkppTEtI?=
 =?utf-8?B?OVlsUnI4SmR0cnllTk94SW1CSjArVk9NZElDc3dUTEpVYkNiUThuMlRGT3Fh?=
 =?utf-8?B?aldsa1pOc0EvdHJFMllUSEdUM1BTdHBaeXlUNU5MZVNjUElDVGxoT05mMlNU?=
 =?utf-8?B?NzVtTEJKZUVNQ3ZqazNNbkJ2WjBlYzRIZXdJQVRVM1RPY2dBM1VsRmZXcHJY?=
 =?utf-8?B?aTBoUnh2cFdjcCtud2ZDdEY4YmZpVVgvT1k4Qmk0ZnJoWGc0cmNPdW83YWl6?=
 =?utf-8?B?bEVKTW5aZlNZSWlOZWZDdDBYK1QwY0JRUE10SmtGS2t0NnVXMFUwM2pXNHZW?=
 =?utf-8?B?b1JyRVd5MzloMmcxSndkQzlmNENzOHMvb2RObDl4VGN3MGtNQTJXSXBpMkww?=
 =?utf-8?B?V3E1S3hMQlBqL3VXYVpKbis2UkthZU0wN1EvTUtOMWNnMU9zendiRXFldE5i?=
 =?utf-8?B?TEpVUGR2dG1Xa3hJZXJSSTdQY1VHMDc2NzhkWlJqWCt6dkR4NGJEcmRpRXZG?=
 =?utf-8?B?U1Iza0Vuc1hJVHdQOHJ0bndmczQ4eFhhZDB0UW1jcGhFclkwcmpjMHVkUy8y?=
 =?utf-8?B?d0hvMzNkem1PL1BodTRPamJIWHlPMlFNTHAxcUl1TjVDRnZxK1BiL2lqcUl3?=
 =?utf-8?B?SzNnVzZoamtURVp2YjVPWDlvWVg4RWJNdHZSVjNLWFdmRW5HbUljUnpNQ04y?=
 =?utf-8?B?Q1J6YjJ2SFp2MnBvd2YrTTk1VkZNNTR2K0Rpb2ZnSEdvYWlFS3k0Qm5JUHMr?=
 =?utf-8?B?N1pmOXdmSWRLUXJ5VThwT20xYk5pbXoyQTE3NnVyaGpDZ0lScEJ0aFJDOTBj?=
 =?utf-8?B?d2hxUGtUZmhjRWNkek91RFF2dFRvcDJmV3BLU0hqOWovWHpPK2VoVTVWZkJ1?=
 =?utf-8?B?dnRkUmdFN1A4K0UyU052ZjhFN3NnTmFlYXc3WlpadG8wV2o1aWliWnVObGI0?=
 =?utf-8?B?WjBXZCtKWFlucmNqV3F2cm9wYW9aRjV4Y0ZCRkRwelVQWktHWlBIUU9INDdX?=
 =?utf-8?B?ZXdHcitRTERxaDROR1dMN1dCYlpSQ0ZEcnYwWE1tWGVxQ2NMeUJ5TGFySlpU?=
 =?utf-8?B?UzFiTEE4QjMwZFgvYXloVlhBSnJVL0s4WFdJR2g3Q05VTWJvK2hONk9EZWUx?=
 =?utf-8?B?d0t5YU1TTkRVRjVaelEwMEt5WWxRTVhBVmszeVJMNEduSG0rdnJUYU5SbTQv?=
 =?utf-8?B?bUoydzNGYnNFbWVPeExMaFErbXdCRHVjVm1jUVI1NmUxSndxdGVjZG81akQ4?=
 =?utf-8?B?V3J6SzJ2MHBUODB3MElmVXBLWVh5b292WFk5ZmMvcWtFSlBpOEpUVjE2Y0RB?=
 =?utf-8?B?L2x5ejVpeS8vLzdOMVVGeFNkVGZDbis5Rzh6bVFWVVphNTF0TktLQVhtRzc0?=
 =?utf-8?B?eW12eXhhL2E2L1hTSUxoZmsxNXdsK1ZMcy9rOEJkeUE3R1p1TTV2c2ltNFF6?=
 =?utf-8?B?eXc0SmZsU3p4cFhZUVZrejg4RjNKUDN3bFpOdXI3RU1ZVnBvKzhqNEJkaml4?=
 =?utf-8?B?U2RtQnI5REorK3NoMk9iTTRFeVdSQzJza0NlUng1Q2hHbE5abUpDTHR2OTRJ?=
 =?utf-8?B?MXllUERHUDJLck1TSHFNMWhvK3FhMlVndS9MVzdPMWpGRmhFQWxDWkxNVEFU?=
 =?utf-8?B?dngxK3NJUm1kRHZJQWVDTDFQcXAyL1dwNGFOUEVmSGJ3S3g4aEl2ZDVSUkhp?=
 =?utf-8?B?eE5JZnBvbmhBL0laOEQvVkNsbU9IYW5XOGpBcW94WmhLSVJLSzF5U0FQVXpF?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c56c96fc-5172-4e44-61ed-08dc8134ccda
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 05:44:55.5924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hr/sRIjw2dDyn8828g3SbaTNr7nTNQgNbxxCBXV8GiCFu2sGOmB7LL4771Lww3Kw7Eq745GM2tUNL71Kl9plVDXNuknKbprD6scGNFGxENs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
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
> Add support of pack and unpack for target_rr_divider.
>
> --v2:
> - Set Target Refresh Rate Divider bit when related
> AS SDP bit is set (Ankit).
>
> --v3:
> - target_rr_divider is bools so set accordingly (Ankit).
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   drivers/gpu/drm/i915/display/intel_dp.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index 4fa977f1e6c4..95cf586f3bed 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4230,6 +4230,9 @@ static ssize_t intel_dp_as_sdp_pack(const struct drm_dp_as_sdp *as_sdp,
>   	sdp->db[3] = as_sdp->target_rr & 0xFF;
>   	sdp->db[4] = (as_sdp->target_rr >> 8) & 0x3;
>   
> +	if (as_sdp->target_rr_divider)
> +		sdp->db[4] |= 0x20;
> +
>   	return length;
>   }
>   
> @@ -4411,6 +4414,7 @@ int intel_dp_as_sdp_unpack(struct drm_dp_as_sdp *as_sdp,
>   	as_sdp->mode = sdp->db[0] & DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE;
>   	as_sdp->vtotal = (sdp->db[2] << 8) | sdp->db[1];
>   	as_sdp->target_rr = (u64)sdp->db[3] | ((u64)sdp->db[4] & 0x3);
> +	as_sdp->target_rr_divider = sdp->db[4] & 0x20 ? true : false;
>   
>   	return 0;
>   }
