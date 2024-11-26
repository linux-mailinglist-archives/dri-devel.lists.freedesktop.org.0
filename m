Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81F09D9C1B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 18:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAB510E964;
	Tue, 26 Nov 2024 17:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ujzqjs/c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4C8310E961;
 Tue, 26 Nov 2024 17:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732641000; x=1764177000;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0I24pwnAI7SoihYeiGjDX74v+DEK/qIgsujGgsBEk64=;
 b=Ujzqjs/cujhkpabv8JWvPllOMmnqShjTiM1EWx8lo6DudA99K74EH2Ny
 Btq6qaX5vjxGdUQtmKkSwP6+UUG+sUZmo3DS71SKnmDAaKdqXN73oB1tQ
 WRPzTgXs0wff7VVKfizssC7UeIVRv2t+HkN2bINrppMXUQH/T0K/Tnf4P
 KVq7uqWVb+IvxbzZKNbbSI29JCSCc9oJwjPi/YsrZhcpINzVw4uix7JcM
 XMelJKlAfG4xfRvLgygaCRnGTGmeWw+A87taAA5NeHmRkuKFhN1VUpo0d
 rUduTwDuyv4mSeHdNwhLnEvXFsP/T51j8+K54ilUywPPhdCAxSr6TJGBw g==;
X-CSE-ConnectionGUID: uG3M76sdQkyZqkyrtTrVhA==
X-CSE-MsgGUID: iuo670MCSZ+1olK2RHv4Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44198808"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44198808"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 09:09:57 -0800
X-CSE-ConnectionGUID: eKQdkv+6TTq5vMXppKaG+A==
X-CSE-MsgGUID: lsOJ/4fbRneZFst6alEzAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="129192658"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 09:09:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 09:09:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 09:09:56 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 09:09:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/dmZ+6AZmaiJ95kVJpbQWln8w2MditIsdmcfxhX5s1vFdFGXjo/6EdnME/umVxt/NjhivAmoWFQEG6h4nmZGtZoVaf0t9730vBNl+UQWqScqDXPi0gN/zqg5I/Ao96RGj2zSn9i+Fk8kLr0knvLotfkqx/RPWSNQpt9m31UuQ5ZpQ1PHWiih8x7xMpW4pSmoccfUH20X3KpplaqLamFilaTDp2UlkUe3BcHkZE5O+tQvlPoyw/Q6Pl05vnd+RTVJA2mpblHnaIuORQX040bfYxkYjaW4BNqT3CcnZioGoM0STkSDaTZrWXIRTG/a9dI2mKBneYHWAnNAcZCMeiY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcXxRsjqk8SlvMjhYXbFr8iNCMtRjb/TZI1ozNC2t9w=;
 b=I64HLfm0NRrXqS1qPW1Bo2Xj5pCPcs/tXV4NULXo6csBKczE9eu+EP0JEgb8MzNTPZ4yRgjb4EC5WRnge4hmRifN0FXr1Npx3taidTPp0khEZajPwsAJb/RHGAatWc+l+XJl3DgSO7D8BBvbNf3yyEtmeAWCq9vvYgu0laM/smFBCGjc7GwLOQQet/S9eytSd0HAozbjiDfmz8f9f5GPisMyWoW0N6WHB7QesCWAoq4stYXd6rMHDatvuvtPXoPKBtUhBBvVxqfV3r20f2u3tRKTy4WQPifa6lLJCSEs9YqmUhQKVkA1XORAnFYdbpoEQ9R8HLLokiSnbhw2pVrMjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB7683.namprd11.prod.outlook.com (2603:10b6:8:df::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 17:09:52 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8207.010; Tue, 26 Nov 2024
 17:09:52 +0000
Message-ID: <37f9ae87-b0a0-4aae-b3bf-03624c288fd3@intel.com>
Date: Tue, 26 Nov 2024 12:09:49 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm/xe/guc/capture: Maintenence of devcoredump <->
 GuC-Err-Capture plumbing
To: Alan Previn <alan.previn.teres.alexis@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, John Harrison <john.c.harrison@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
References: <20241117184400.2206120-1-alan.previn.teres.alexis@intel.com>
 <20241117184400.2206120-2-alan.previn.teres.alexis@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20241117184400.2206120-2-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:332::26) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS0PR11MB7683:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d1e5508-320c-48ad-0d7a-08dd0e3d245b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjNoSm44akNiNkFMVUZiU3RqWDR0a3NMVTdxN3lTQVBVSENJdmk5QlpZRC9O?=
 =?utf-8?B?K2lwd2lqSFcvSXlkSkUwSHZEK3BjREhzU09RR1NENWRoVHlROGl4MDZERlNa?=
 =?utf-8?B?UWNyd01CVENwemRBT0ZGSW5ybTNrWWxrMFlUd3E5UlFucFB5ZG1xaEMzcFlv?=
 =?utf-8?B?Y05QbnVhbzdqVzlIS0ZpMDErKzM4aHI3ZUg2QXlVUDR4dDM3VEt1RitDdEw4?=
 =?utf-8?B?Z2JVR1dCMEg1SGNwZkZPOTI4Q2daVzlaTmxFaXk5YUpkaHpDbzA4K29qRW9B?=
 =?utf-8?B?a2lvdXBPamtaWnQxcXhBMk9GMDlGaHRSRXphRUFlOWtyakhvdSt0V3NCSUdD?=
 =?utf-8?B?Um1ZM05GNEtaYnNPVnVqWlZ0alZGbEEwZVZrTFFXcm92TWRPdnJDemR4YnV3?=
 =?utf-8?B?M3QzOXhwbStvamdlclpXMFJPalNvbStLRDZUaE5teUtLekJUZitPcFlkcjZn?=
 =?utf-8?B?V3RQd0pUQUNwV2piSVczOUVUSlNsU0RnWU96UC9EUk5weHN4dW9XWkwwaGxJ?=
 =?utf-8?B?L05RbHFSNHVDU1M5ZGVLNHFWNEF5U3RzWHUzSXRmM1FKZ1JNaGlxV1JDekRs?=
 =?utf-8?B?NTRPZUQyeHByQ0VSQ2RiamVHZDlvOEhSaGFLYjlpSGJRdW1LaE1JZjNkMmor?=
 =?utf-8?B?ejlRNjVrZHp3ZnF1YjFkTE1Gbk9WejNYblpXd1Z3T1BtV1hmSkZwTWpjQnpH?=
 =?utf-8?B?N29QdlVlSXV0cDMvUjBUTkxxcExnNFl6anRzYXVnam5ZcmsxeGUvYk1rQmdm?=
 =?utf-8?B?bGxoUktobU5kZlJlaU5pRHV4OVVKMkUzN3NJWTlrNmNPVmE5NXVlZEZKSlVp?=
 =?utf-8?B?QTZiZ1VaUFp5YVJxdEl6emlTcHpVaWM2ajlqU2VPTDVDbHRqMHRCcEx6WDl4?=
 =?utf-8?B?dXhXNDdPa1kyVk14Q0lvQnJMU3pHS2s4K3lFeHprZThuZE1IT21mbytyTVVm?=
 =?utf-8?B?Q2FMTk1wQmhzNWRDVnBFaUNRRkEwcEk0T0JoRVNqcFdXMlF3L2s4bTh6VFVX?=
 =?utf-8?B?a1pXSW1CMTRTU3lkby9vSG03SHRvZ0NkOUJmQVRFZVF3VjlsYTFpSHlCWkJo?=
 =?utf-8?B?NXpUaUszd3IvcXVFV0pJcStFV1FoMDJQZW41TWRVMjR3WG9HOFZCSXBMMXVq?=
 =?utf-8?B?WmdhNVRnVlJsRHFEdnphWGdqaG4wVktQeEpkZDMxdnZDd2RMQjJ0ZHY0d1Br?=
 =?utf-8?B?ejR5NmhVeXVqT1kvWVN0YWRvSEtiNUNzMHlJcEVBbWZYNldLdEI0c0VVS2tS?=
 =?utf-8?B?UlNQRkxnLzB2Y0hSc1loTTVTV3Q4aEJQdzlSa3dISlYwd3U0Q2JJSnFFSVRk?=
 =?utf-8?B?elNIRzZraWErdS9LS09WQzQ2UVNyK3ZpQW8vN0N6NU4zbDdDRE5leWJLYlBM?=
 =?utf-8?B?cHlKck1hTXZzM2N4R0xCVzdzUFVWZFMzelgrMTNwRFN1MEozR1dBcmFoT2tG?=
 =?utf-8?B?RmFac1Q0ZFdBdHRwUzQ4bjVKYVZ5aG5KS1c3eXZOVDM1Rm9kL1RMTlE0WmQy?=
 =?utf-8?B?RCtvK05VV2ZENi9ib1kxOGp5anVnclRBZElWblNvQlBoZmdCeHc1OTBmU1Fm?=
 =?utf-8?B?SWRjQ0JidEdpZUFmQit0cWdNT3htNXFjM0tQcDBPelduM0tUYzlZUksyOUdj?=
 =?utf-8?B?eG5tYXRSekFzQ1VkV3VySkpRb1ZramtCSGQwMnIwaXoxc0ZQRm01YjRmeVpp?=
 =?utf-8?B?dm5nNGxhWWxpMFUvT3JOdlVXUEFlUGd6Q1N6WFlkZ01mZDJOdW1sOVQ0d0lL?=
 =?utf-8?B?clk5aEgzdWdaU1ZNdmMyWUhFeE1Kd2JpdHQ0VTFZbVN6clJmZGtVaEhzT29i?=
 =?utf-8?B?eXc3cityQnZhbnFKYzlVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG9hYU4zdE56RVpPcjM1Wk1MOWJ6ak9VNTlVTjdTYk91bFdFbjZCMVFEeWor?=
 =?utf-8?B?TFlDUWJIQzF5QW9HWFFiY3FScnlGeTRrWjYrNnRkOHhoanZHUm02clNWc1FD?=
 =?utf-8?B?NHJqR052QjZHYVRIZklJUmFidDVpZUFsKzVOMTlRMmVaNHRieE1KZndxSjJu?=
 =?utf-8?B?c25oUnVNcEhnRFIwY2hYV2NsVzJPKzVkdjJ0bG1VTlZKNEQ2YXVhM0ZGRmRE?=
 =?utf-8?B?SkE5NmtHeW55WGRCU3k4UE9ubjV4bXJKT2pRVTdZeFZxTlMxUEdHNDd1dTNF?=
 =?utf-8?B?N0d0WDBkT3BFNmFUNk5KbEpxKy9TRnhMNTYrVXpHc0lTUkNUOG50c1FFVjZ3?=
 =?utf-8?B?aHluQVRqSjlNcXNUY1c1VjZKUnR1S2dEQk54SmxDUE9iclYvZzZGUW91RWlk?=
 =?utf-8?B?eUdhSjZVaUNIRCt4STlscC9lOVBPSkRRYXJZcXlzUW1mSzZNTS9QNlhXWDFF?=
 =?utf-8?B?OTJ4eGZuVTVIWWp2YitNWjNIQWh4WVlscHk0L0U4d1E1RHE2M0cveHo3ZjVq?=
 =?utf-8?B?Z2U5NmRSWDhLQmRuMHF4MGVxZlU0YzJNdG55Qi9EbXpjU1p0NytDdWVrUHlr?=
 =?utf-8?B?SlZjUkNCb1lDcDFEZmt6MzZBVjFhSEE5eU44V2hTNXhSQmhpR1RkcllWejJ3?=
 =?utf-8?B?U0ZGUHcxWDVvREJ4ZXY4Wk5KaGtDd1hrR3Y4MWlGK21wZXVPR2g1QzdwSzZL?=
 =?utf-8?B?L0lYdWlXdHN2RXBBUVdoK1lhOEhTNnYvVlNBVmRSL3BOZ0l5ZFRCS2h6M1hn?=
 =?utf-8?B?UWJnRXExNEtSU0pBSGFxYnExTGpmTGhVdFY3Mm8zYittN0dTZFVCeVFKUFZy?=
 =?utf-8?B?QWlOa0dHYUR5MUdzTWhseXRieXdERnVVT3MvR1VBUUZqditwUm1HZFRCVGRv?=
 =?utf-8?B?YzU2NEI4OTFPVzJYQndJR1hHOWRSZEZHRU5YYnUxQUhpMFN4cjBMV09VTW9D?=
 =?utf-8?B?VkhpaktobWFzcWUvK3hHOHZDZ0Evcm03ZVNjL0NGR2E5SEZhQjdBRW5oMEwy?=
 =?utf-8?B?eDlPYWdWVzI2OTk2Qng4WHpBQ2VEQ1VVS29SWkNxZ28wRWd1d25hOFEzRjUz?=
 =?utf-8?B?RlJCcnh3Mno0cDhvc3hoV25WWnpsd1k2VUdMSkRRKzZQbmN4UUN4T2VoVVY4?=
 =?utf-8?B?RjBKNzk2eHZ1VlZtamN2anN3UXRybUNnUCtCSk4yampjVER1eTc1YjRvNERx?=
 =?utf-8?B?WkVucDZJbEpkSFk4SkZXV0RZaWU3VHFBQk02Tk1OSE5jR1h6TjVaSE91blNU?=
 =?utf-8?B?aEt5cnVCdWcwWGtPTWg4REtTQkZhZFJBdzVQNmRwZUI3dDd0Rzc4OXBKdC9Q?=
 =?utf-8?B?OTZvZ1dKTGJ4RHlVbzk2Nk41OUVTWkpEalU4alpZSDFWeXJ1Z09ITzFXR0Y1?=
 =?utf-8?B?bndoTzBGNWNIOUJRL2RESlJ2dkh4TEZFZlV5SEhESE1VVW1STUdNay8rclhD?=
 =?utf-8?B?SWxVNUx6ZmV0eXhYdjVOZGx5S2d4b2dGak52OVFjVmcvRWx2TEZ4VXRoYzFV?=
 =?utf-8?B?RUpkZDhCVHdvNTdjOWtTQnRsUldOblZrS3poSFhqNjBlb21aK3YxUEVKTTJn?=
 =?utf-8?B?NGRaclZsdDFJc2RiOGxoQTR1NWpmNVM0Zm52SU9aSmYrck9GMXlpWW41VVFP?=
 =?utf-8?B?U21vNHRJNjBOQXpqdko3VnBicXhHVG15ckZIeFhtUTRIMjZqRk9sa0I1Rml1?=
 =?utf-8?B?M05BdkpYSit5allGVmcySWhpR2FrMGZpVFhTYm11eHhGOXhSUjEwSGpkVEZF?=
 =?utf-8?B?QmVOdDFyU2FkcmREVExOWjcwWmlIeWk1YlFtcGpKS0xFTGlWckNXeFhaRXo1?=
 =?utf-8?B?b2VZTEZhMVI1dGVqU3luMnc2SXVOM3BwS2RCRFNSSmFnYjBCdExXZzE1cjEv?=
 =?utf-8?B?MXBhSXdiL211VXlJWklmSi9PbEpHWC9Bei81dEFuZ3hyWUZHcFJlcFJXZzcy?=
 =?utf-8?B?NkVUM3FIVUJ1TWd2TnBGZ1VVZzh2NDk3MG5CYnoyVktwN1FWZ2NkVVM3NDdO?=
 =?utf-8?B?bHNvbFlvY2F6ZUpHaWQzMlhqamZKTW9WUytsRmhqWnRZWlh6Y0h6ZndUTUNO?=
 =?utf-8?B?ZktwQ1k0M3M1VFhMVDJQSEVubFdSVHk5bXpaZHdXckZNU0F6S3J5czVKYXZ0?=
 =?utf-8?Q?57xkenTuarATmjxzF4pOS7R5Z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d1e5508-320c-48ad-0d7a-08dd0e3d245b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 17:09:52.4354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTqf8xvgNZSylxTEmMONy6oaTi+QHcM4IGv2dufHHgU9F0h2UjLvOVa4G9dOdu2KmLfcquc25X8elibWbYEL0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7683
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

See my comments inline below:

Regards,
Zhanjun

On 2024-11-17 1:44 p.m., Alan Previn wrote:
> The order of the devcoredump event flow is:
> drm-scheduler -> guc-submission-execq-timed-out-job ->
> guc-submission-kill-job -> xe-devcoredump (once the work
> is confirmed to have been killed).
> 
> As we are aware, the GuC-FW IRQ for error-capture delivery
> and extraction could have happenned before the start of
happened?
> guc-execq-timed-out-job or the middle of it (before or
> during the explicit kill) or not at all. Thus, today, the
> above flow takes a manual capture first before triggering
> the kill-job just in case we need it.
> 
> The structure layering of devcoredump internals are:
> xe_devcoredump_snapshot -> xe_foo_snapshot (where foo
> can be any data dump associated to the job was killed).
> Foo includes the xe_hw_engine_snapshot. Since GuC-Error-Capture
> provides just the register dump of an engine, GuC-Err-Capture
> snapshots should be managed by the xe_hw_engine_snapshot.
> That isn't the case today.
> 
> Furthermode, neither xe_devcoredump_snapshot nor
Furthermore?
> xe_hw_engine_snapshot even exists at the start of
> guc-submission-execq-timed-out-job. Thus, the first
> manual capture node has no home. However, today,
> GuC-Error-Capture stores capture snapshots off the
> top-level xe_devcoredump_snapshot's matched_node.
> GuC-Error-Capture also had absorbed the function for
> xe_hw_engine_snapshot generation.
>       NOTE: Existing code isn't broken because xe_devcoredump
>       is not dynamically allocated and designed to hold a
>       single event at a time (i.e. single engine dump).
>       But it's not scalable for future improvement.
> 
> Thus this patch:
> 1. Moves "matched_node" from xe_devcoredump_snapshot to
>     xe_hw_engine_snapshot.
> 2. Relocates the functions for xe_hw_engine_snapshot generation
>     and printing back to xe_hw_engine.c. However, split out the
>     register dump printing so it stays within GuC-Error-Capture
>     (so we don't need to maintain two sets of register lists).
> 3. Keep both the manual and firmware capture nodes within
>     GuC-Error-Capture subsystem's linked list until
>     xe_hw_engine_snapshot gets and puts them later.
> 4. Give xe_hw_engine_snapshot the control and ability to
>     query GuC-Error-Capture for matching snapshots while choosing
>     between manual vs firmware capture getting/putting node.
> 5. While at it, relocate (and rename) key structures, enums
>     and function protos to xe_guc_capture_snapshot_types.h
>     (as an inter-module header) for xe_hw_engine_snapshot to use.
> 6. Since xe_hw_engine_snapshot can also be called by via debugfs
>     without a job, create a new function that does a manual capture
>     of engine registers without any associated job.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c           |   3 -
>   drivers/gpu/drm/xe/xe_devcoredump_types.h     |   6 -
>   drivers/gpu/drm/xe/xe_guc_capture.c           | 397 ++++++++----------
>   drivers/gpu/drm/xe/xe_guc_capture.h           |  10 +-
>   .../drm/xe/xe_guc_capture_snapshot_types.h    |  68 +++
>   drivers/gpu/drm/xe/xe_guc_submit.c            |  21 +-
>   drivers/gpu/drm/xe/xe_hw_engine.c             | 117 ++++--
>   drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +-
>   drivers/gpu/drm/xe/xe_hw_engine_types.h       |  13 +-
>   9 files changed, 353 insertions(+), 286 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 0e5edf14a241..b98d71e670ca 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -144,9 +144,6 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>   	xe_guc_ct_snapshot_free(ss->guc.ct);
>   	ss->guc.ct = NULL;
>   
> -	xe_guc_capture_put_matched_nodes(&ss->gt->uc.guc);
> -	ss->matched_node = NULL;
> -
>   	xe_guc_exec_queue_snapshot_free(ss->ge);
>   	ss->ge = NULL;
>   
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index be4d59ea9ac8..06ac75ce63dd 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -49,12 +49,6 @@ struct xe_devcoredump_snapshot {
>   	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
>   	/** @job: Snapshot of job state */
>   	struct xe_sched_job_snapshot *job;
> -	/**
> -	 * @matched_node: The matched capture node for timedout job
> -	 * this single-node tracker works because devcoredump will always only
> -	 * produce one hw-engine capture per devcoredump event
> -	 */
> -	struct __guc_capture_parsed_output *matched_node;
>   	/** @vm: Snapshot of VM state */
>   	struct xe_vm_snapshot *vm;
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index f87755af545f..691fc72a5c9e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -26,6 +26,7 @@
>   #include "xe_guc_ads.h"
>   #include "xe_guc_capture.h"
>   #include "xe_guc_capture_types.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_guc_ct.h"
>   #include "xe_guc_exec_queue_types.h"
>   #include "xe_guc_log.h"
> @@ -53,40 +54,6 @@ struct __guc_capture_bufstate {
>   	u32 wr;
>   };
>   
> -/*
> - * struct __guc_capture_parsed_output - extracted error capture node
> - *
> - * A single unit of extracted error-capture output data grouped together
> - * at an engine-instance level. We keep these nodes in a linked list.
> - * See cachelist and outlist below.
> - */
> -struct __guc_capture_parsed_output {
> -	/*
> -	 * A single set of 3 capture lists: a global-list
> -	 * an engine-class-list and an engine-instance list.
> -	 * outlist in __guc_capture_parsed_output will keep
> -	 * a linked list of these nodes that will eventually
> -	 * be detached from outlist and attached into to
> -	 * xe_codedump in response to a context reset
> -	 */
> -	struct list_head link;
> -	bool is_partial;
> -	u32 eng_class;
> -	u32 eng_inst;
> -	u32 guc_id;
> -	u32 lrca;
> -	u32 type;
> -	bool locked;
> -	enum xe_hw_engine_snapshot_source_id source;
> -	struct gcap_reg_list_info {
> -		u32 vfid;
> -		u32 num_regs;
> -		struct guc_mmio_reg *regs;
> -	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
> -#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
> -#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
> -};
> -
>   /*
>    * Define all device tables of GuC error capture register lists
>    * NOTE:
> @@ -286,7 +253,7 @@ struct xe_guc_state_capture {
>   
>   static void
>   guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
> -					   struct __guc_capture_parsed_output *node);
> +					   struct xe_guc_capture_snapshot *node);
>   
>   static const struct __guc_mmio_reg_descr_group *
>   guc_capture_get_device_reglist(struct xe_device *xe)
> @@ -840,7 +807,7 @@ static void check_guc_capture_size(struct xe_guc *guc)
>   }
>   
>   static void
> -guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
> +guc_capture_add_node_to_list(struct xe_guc_capture_snapshot *node,
>   			     struct list_head *list)
>   {
>   	list_add(&node->link, list);
> @@ -848,7 +815,7 @@ guc_capture_add_node_to_list(struct __guc_capture_parsed_output *node,
>   
>   static void
>   guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
> -				struct __guc_capture_parsed_output *node)
> +				struct xe_guc_capture_snapshot *node)
>   {
>   	guc_capture_remove_stale_matches_from_list(gc, node);
>   	guc_capture_add_node_to_list(node, &gc->outlist);
> @@ -856,17 +823,17 @@ guc_capture_add_node_to_outlist(struct xe_guc_state_capture *gc,
>   
>   static void
>   guc_capture_add_node_to_cachelist(struct xe_guc_state_capture *gc,
> -				  struct __guc_capture_parsed_output *node)
> +				  struct xe_guc_capture_snapshot *node)
>   {
>   	guc_capture_add_node_to_list(node, &gc->cachelist);
>   }
>   
>   static void
>   guc_capture_free_outlist_node(struct xe_guc_state_capture *gc,
> -			      struct __guc_capture_parsed_output *n)
> +			      struct xe_guc_capture_snapshot *n)
>   {
>   	if (n) {
> -		n->locked = 0;
> +		n->locked = false;
>   		list_del(&n->link);
>   		/* put node back to cache list */
>   		guc_capture_add_node_to_cachelist(gc, n);
> @@ -875,9 +842,9 @@ guc_capture_free_outlist_node(struct xe_guc_state_capture *gc,
>   
>   static void
>   guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
> -					   struct __guc_capture_parsed_output *node)
> +					   struct xe_guc_capture_snapshot *node)
>   {
> -	struct __guc_capture_parsed_output *n, *ntmp;
> +	struct xe_guc_capture_snapshot *n, *ntmp;
>   	int guc_id = node->guc_id;
>   
>   	list_for_each_entry_safe(n, ntmp, &gc->outlist, link) {
> @@ -887,7 +854,7 @@ guc_capture_remove_stale_matches_from_list(struct xe_guc_state_capture *gc,
>   }
>   
>   static void
> -guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *node)
> +guc_capture_init_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *node)
>   {
>   	struct guc_mmio_reg *tmp[GUC_STATE_CAPTURE_TYPE_MAX];
>   	int i;
> @@ -934,24 +901,31 @@ guc_capture_init_node(struct xe_guc *guc, struct __guc_capture_parsed_output *no
>    *                   This node is created from a pre-allocated list of blank nodes in
>    *                   guc->capture->cachelist and populated with the error-capture
>    *                   data from GuC and then it's added into guc->capture->outlist linked
> - *                   list. This list is used for matchup and printout by xe_devcoredump_read
> - *                   and xe_engine_snapshot_print, (when user invokes the devcoredump sysfs).
> + *                   list. This node (dumped-register-lists) will be requested later by
> + *                   xe_hwe_engine_snapshot creation.
>    *
> - * GUC --> notify context reset:
> - * -----------------------------
> + * DRM Scheduler job-timeout OR GuC-notify guc-id reset:
> + * -----------------------------------------------------
>    *     --> guc_exec_queue_timedout_job
> - *                   L--> xe_devcoredump
> - *                          L--> devcoredump_snapshot
> - *                               --> xe_hw_engine_snapshot_capture
> - *                               --> xe_engine_manual_capture(For manual capture)
> + *             L--> alloc D: xe_guc_capture_snapshot_store_manual_job
> + *                           (only if "alloc C" above didn't happen)
> + *             L--> devcoredump_snapshot
> + *                      --> xe_engine_snapshot_capture_for_queue(q) ..
> + *                               --> xe_guc_capture_snapshot_get(q)
> + *                                   use "alloc C" or else "alloc D"
> + *                               --> store in xe_hw_engine_snapshot->matched_node
>    *
> - * User Sysfs / Debugfs
> - * --------------------
> - *      --> xe_devcoredump_read->
> + * User Devcoredump Sysfs
> + * ----------------------
> + *      --> xe_devcoredump_read-> (user cats devcoredump)
>    *             L--> xxx_snapshot_print
>    *                    L--> xe_engine_snapshot_print
> - *                         Print register lists values saved at
> - *                         guc->capture->outlist
> + *                           L --> xe_guc_capture_snapshot_print (for printing register
> + *                                 lists values of xe_hw_engine_snapshot->matched_node)
> + *      --> xe_devcoredump_free (user clears devcoredump)
> + *             L--> xe_devcoredump_free -> xe_devcoredump_snapshot_free
> + *                    L--> xe_hw_engine_snapshot_free
> + *                           L--> xe_guc_capture_snapshot_put(matched_node)
>    *
>    */
>   
> @@ -1066,13 +1040,13 @@ guc_capture_log_get_register(struct xe_guc *guc, struct __guc_capture_bufstate *
>   	return 0;
>   }
>   
> -static struct __guc_capture_parsed_output *
> +static struct xe_guc_capture_snapshot *
>   guc_capture_get_prealloc_node(struct xe_guc *guc)
>   {
> -	struct __guc_capture_parsed_output *found = NULL;
> +	struct xe_guc_capture_snapshot *found = NULL;
>   
>   	if (!list_empty(&guc->capture->cachelist)) {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>   
>   		/* get first avail node from the cache list */
>   		list_for_each_entry_safe(n, ntmp, &guc->capture->cachelist, link) {
> @@ -1080,7 +1054,7 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
>   			break;
>   		}
>   	} else {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>   
>   		/*
>   		 * traverse reversed and steal back the oldest node already
> @@ -1099,11 +1073,11 @@ guc_capture_get_prealloc_node(struct xe_guc *guc)
>   	return found;
>   }
>   
> -static struct __guc_capture_parsed_output *
> -guc_capture_clone_node(struct xe_guc *guc, struct __guc_capture_parsed_output *original,
> +static struct xe_guc_capture_snapshot *
> +guc_capture_clone_node(struct xe_guc *guc, struct xe_guc_capture_snapshot *original,
>   		       u32 keep_reglist_mask)
>   {
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>   	int i;
>   
>   	new = guc_capture_get_prealloc_node(guc);
> @@ -1145,7 +1119,7 @@ guc_capture_extract_reglists(struct xe_guc *guc, struct __guc_capture_bufstate *
>   	struct xe_gt *gt = guc_to_gt(guc);
>   	struct guc_state_capture_group_header_t ghdr = {0};
>   	struct guc_state_capture_header_t hdr = {0};
> -	struct __guc_capture_parsed_output *node = NULL;
> +	struct xe_guc_capture_snapshot *node = NULL;
>   	struct guc_mmio_reg *regs = NULL;
>   	int i, numlists, numregs, ret = 0;
>   	enum guc_state_capture_type datatype;
> @@ -1438,11 +1412,11 @@ void xe_guc_capture_process(struct xe_guc *guc)
>   		__guc_capture_process_output(guc);
>   }
>   
> -static struct __guc_capture_parsed_output *
> +static struct xe_guc_capture_snapshot *
>   guc_capture_alloc_one_node(struct xe_guc *guc)
>   {
>   	struct drm_device *drm = guc_to_drm(guc);
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>   	int i;
>   
>   	new = drmm_kzalloc(drm, sizeof(*new), GFP_KERNEL);
> @@ -1467,7 +1441,7 @@ guc_capture_alloc_one_node(struct xe_guc *guc)
>   static void
>   __guc_capture_create_prealloc_nodes(struct xe_guc *guc)
>   {
> -	struct __guc_capture_parsed_output *node = NULL;
> +	struct xe_guc_capture_snapshot *node = NULL;
>   	int i;
>   
>   	for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
All above is about renaming structure or comments, that's fine.

> @@ -1564,35 +1538,18 @@ read_reg_to_node(struct xe_hw_engine *hwe, const struct __guc_mmio_reg_descr_gro
>   	}
>   }
>   
> -/**
> - * xe_engine_manual_capture - Take a manual engine snapshot from engine.
> - * @hwe: Xe HW Engine.
> - * @snapshot: The engine snapshot
> - *
> - * Take engine snapshot from engine read.
> - *
> - * Returns: None
> - */
> -void
> -xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot)
> +static struct xe_guc_capture_snapshot *
> +guc_capture_get_manual_snapshot(struct xe_guc *guc, struct xe_hw_engine *hwe)
>   {
>   	struct xe_gt *gt = hwe->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
>   	enum guc_capture_list_class_type capture_class;
>   	const struct __guc_mmio_reg_descr_group *list;
> -	struct __guc_capture_parsed_output *new;
> +	struct xe_guc_capture_snapshot *new;
>   	enum guc_state_capture_type type;
> -	u16 guc_id = 0;
> -	u32 lrca = 0;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return;
>   
>   	new = guc_capture_get_prealloc_node(guc);
>   	if (!new)
> -		return;
> +		return NULL;
>   
>   	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
>   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
> @@ -1626,26 +1583,83 @@ xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot
>   		}
>   	}
>   
> -	if (devcoredump && devcoredump->captured) {
> -		struct xe_guc_submit_exec_queue_snapshot *ge = devcoredump->snapshot.ge;
> +	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
> +	new->eng_inst = hwe->instance;
>   
> -		if (ge) {
> -			guc_id = ge->guc.id;
> -			if (ge->lrc[0])
> -				lrca = ge->lrc[0]->context_desc;
> -		}
> +	return new;
> +}
> +
> +/**
> + * xe_guc_capture_snapshot_store_and_get_manual_hwe - Generate and get manual engine register dump
> + * @guc: Target GuC for manual capture
> + * @hwe: The engine instance to capture from
> + *
> + * Generate a manual GuC-Error-Capture snapshot of engine instance + engine class registers
> + * without any queue association. This capture node is not stored in outlist or cachelist,
> + * Returns: New capture node and caller must "put"
> + */
> +struct xe_guc_capture_snapshot *
> +xe_guc_capture_snapshot_store_and_get_manual_hwe(struct xe_guc *guc, struct xe_hw_engine *hwe)
> +{
> +	struct xe_guc_capture_snapshot *new;
> +
> +	new = guc_capture_get_manual_snapshot(guc, hwe);
> +	if (!new)
> +		return NULL;
> +
> +	new->guc_id = 0;
> +	new->lrca = 0;
> +	new->is_partial = 0;
> +	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
> +
> +	return new;
> +}
> +
> +/**
> + * xe_guc_capture_snapshot_store_manual_job - Generate and store a manual engine register dump
> + * @guc: Target GuC for manual capture
> + * @q: Associated xe_exec_queue to simulate a manual capture on its behalf.
> + *
> + * Generate a manual GuC-Error-Capture snapshot of engine instance + engine class registers
> + * for the engine of the given exec queue. Stores this node in internal outlist for future
> + * retrieval with the ability to match up against the same queue.
> + *
> + * Returns: None
> + */
> +void
> +xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	struct xe_guc_capture_snapshot *new;
> +	struct xe_gt *gt = guc_to_gt(guc);
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	if (q) {
> +		xe_gt_warn(gt, "Manual GuC Error capture requested with invalid job\n");
> +		return;
>   	}
Need to do SRIOV check here or at timedout job
	if (IS_SRIOV_VF(xe))
		return;
for compareration, the existing implementation is
guc_exec_queue_timedout_job
	xe_engine_snapshot_capture_for_queue
which did the SRIOV check.

>   
> -	new->eng_class = xe_engine_class_to_guc_class(hwe->class);
> -	new->eng_inst = hwe->instance;
> -	new->guc_id = guc_id;
> -	new->lrca = lrca;
> +	/* Find hwe for the queue */
> +	for_each_hw_engine(hwe, gt, id) {
> +		if (hwe != q->hwe)
> +			continue;
> +		break;
> +	}
> +
> +	new = guc_capture_get_manual_snapshot(guc, hwe);
> +	if (!new)
> +		return;
> +
> +	new->guc_id = q->guc->id;
> +	new->lrca = xe_lrc_ggtt_addr(q->lrc[0]);
>   	new->is_partial = 0;
> -	new->locked = 1;
> +	/* lock manual captures until devcoredump-engine puts it */
> +	new->locked = true;
>   	new->source = XE_ENGINE_CAPTURE_SOURCE_MANUAL;
>   
>   	guc_capture_add_node_to_outlist(guc->capture, new);
> -	devcoredump->snapshot.matched_node = new;
> +
> +	return;
>   }
>   
>   static struct guc_mmio_reg *
> @@ -1666,24 +1680,16 @@ guc_capture_find_reg(struct gcap_reg_list_info *reginfo, u32 addr, u32 flags)
>   }
>   
>   static void
> -snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p,
> -			     u32 type, const struct __guc_mmio_reg_descr_group *list)
> +print_noderegs_by_list_order(struct xe_guc *guc, struct gcap_reg_list_info *reginfo,
> +			     const struct __guc_mmio_reg_descr_group *list, struct drm_printer *p)
>   {
> -	struct xe_gt *gt = snapshot->hwe->gt;
> -	struct xe_device *xe = gt_to_xe(gt);
> -	struct xe_guc *guc = &gt->uc.guc;
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> -	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
> -	struct gcap_reg_list_info *reginfo = NULL;
>   	u32 last_value, i;
>   	bool is_ext;
>   
>   	if (!list || list->num_regs == 0)
>   		return;
> -	XE_WARN_ON(!devcore_snapshot->matched_node);
>   
>   	is_ext = list == guc->capture->extlists;
> -	reginfo = &devcore_snapshot->matched_node->reginfo[type];
>   
>   	/*
>   	 * loop through descriptor first and find the register in the node
> @@ -1717,7 +1723,7 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>   
>   			group = FIELD_GET(GUC_REGSET_STEERING_GROUP, reg_desc->flags);
>   			instance = FIELD_GET(GUC_REGSET_STEERING_INSTANCE, reg_desc->flags);
> -			dss = xe_gt_mcr_steering_info_to_dss_id(gt, group, instance);
> +			dss = xe_gt_mcr_steering_info_to_dss_id(guc_to_gt(guc), group, instance);
>   
>   			drm_printf(p, "\t%s[%u]: 0x%08x\n", reg_desc->regname, dss, value);
>   		} else {
> @@ -1727,74 +1733,65 @@ snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_
>   }
>   
>   /**
> - * xe_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> - * @snapshot: Xe HW Engine snapshot object.
> + * xe_guc_capture_snapshot_print - Print out a the contents of a provided Guc-Err-Capture node
> + * @guc : Target GuC for operation.
> + * @node: GuC Error Capture register dump node.
>    * @p: drm_printer where it will be printed out.
>    *
> - * This function prints out a given Xe HW Engine snapshot object.
> + * This function prints out a register dump of a GuC-Err-Capture node that was retrieved
> + * earlier either by GuC-FW reporting or by manual capture depending on how the
> + * caller (typically xe_hw_engine_snapshot) was invoked and used.
>    */
> -void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +
> +void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
> +				   struct drm_printer *p)
>   {
>   	const char *grptype[GUC_STATE_CAPTURE_GROUP_TYPE_MAX] = {
>   		"full-capture",
>   		"partial-capture"
>   	};
> -	int type;
>   	const struct __guc_mmio_reg_descr_group *list;
> -	enum guc_capture_list_class_type capture_class;
> -
>   	struct xe_gt *gt;
> -	struct xe_device *xe;
> -	struct xe_devcoredump *devcoredump;
> -	struct xe_devcoredump_snapshot *devcore_snapshot;
> +	int type;
>   
> -	if (!snapshot)
> +	if (!guc)
>   		return;
> -
> -	gt = snapshot->hwe->gt;
> -	xe = gt_to_xe(gt);
> -	devcoredump = &xe->devcoredump;
> -	devcore_snapshot = &devcoredump->snapshot;
> -
> -	if (!devcore_snapshot->matched_node)
> +	gt = guc_to_gt(guc);
> +	if (!node) {
> +		xe_gt_warn(gt, "GuC Capture printing without node!\n");
>   		return;
> +	}
> +	if (!p) {
> +		xe_gt_warn(gt, "GuC Capture printing without printer!\n");
> +		return;
> +	}
>   
> -	xe_gt_assert(gt, snapshot->hwe);
> -
> -	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
> -
> -	drm_printf(p, "%s (physical), logical instance=%d\n",
> -		   snapshot->name ? snapshot->name : "",
> -		   snapshot->logical_instance);
>   	drm_printf(p, "\tCapture_source: %s\n",
> -		   devcore_snapshot->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
> +		   node->source == XE_ENGINE_CAPTURE_SOURCE_GUC ?
>   		   "GuC" : "Manual");
> -	drm_printf(p, "\tCoverage: %s\n", grptype[devcore_snapshot->matched_node->is_partial]);
> -	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> -		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> -	drm_printf(p, "\tReserved: %s\n",
> -		   str_yes_no(snapshot->kernel_reserved));
I see this change seperate capture related print into this function.
I like this idea.

> +	drm_printf(p, "\tCoverage: %s\n", grptype[node->is_partial]);
>   
>   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
>   		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
> -							capture_class, false);
> -		snapshot_print_by_list_order(snapshot, p, type, list);
> +							node->eng_class, false);
> +		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
>   	}
>   
> -	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> +	if (node->eng_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> +		type = GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS;
>   		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF,
> -							GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> -							capture_class, true);
> -		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> -					     list);
> +							type, node->eng_class, true);
> +		print_noderegs_by_list_order(guc, &node->reginfo[type], list, p);
>   	}
> -
>   	drm_puts(p, "\n");
>   }
>   
>   /**
> - * xe_guc_capture_get_matching_and_lock - Matching GuC capture for the queue.
> - * @q: The exec queue object
> + * xe_guc_capture_snapshot_get - Matching GuC capture for the queue.
> + *
> + * @guc: The GuC being searched for a matching guc-error-capture snapshot.
> + * @q: The exec queue object that provides engine, guc-id and lrca to match (can be NULL!)
> + * @src: The source of the GuC-error-Capture snapshot to retrieve;
>    *
>    * Search within the capture outlist for the queue, could be used for check if
>    * GuC capture is ready for the queue.
> @@ -1802,28 +1799,31 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
>    *
>    * Returns: found guc-capture node ptr else NULL
>    */
> -struct __guc_capture_parsed_output *
> -xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
> +struct xe_guc_capture_snapshot *
> +xe_guc_capture_snapshot_get(struct xe_guc *guc, struct xe_exec_queue *q,
> +			    enum xe_guc_capture_snapshot_source src)
>   {
>   	struct xe_hw_engine *hwe;
>   	enum xe_hw_engine_id id;
> +	struct xe_gt *gt;
>   	struct xe_device *xe;
>   	u16 guc_class = GUC_LAST_ENGINE_CLASS + 1;
> -	struct xe_devcoredump_snapshot *ss;
>   
> -	if (!q || !q->gt)
> +	if (!guc)
>   		return NULL;
>   
> -	xe = gt_to_xe(q->gt);
> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
> +	gt = guc_to_gt(guc);
> +	if (q && q->gt != gt) {
> +		xe_gt_warn(gt, "Guc-Err-Capture being querried with incorrect queue's GT!");
>   		return NULL;
> +	}
>   
> -	ss = &xe->devcoredump.snapshot;
> -	if (ss->matched_node && ss->matched_node->source == XE_ENGINE_CAPTURE_SOURCE_GUC)
> -		return ss->matched_node;
> +	xe = gt_to_xe(gt);
> +	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
> +		return NULL;
>   
>   	/* Find hwe for the queue */
> -	for_each_hw_engine(hwe, q->gt, id) {
> +	for_each_hw_engine(hwe, gt, id) {
>   		if (hwe != q->hwe)
>   			continue;
>   		guc_class = xe_engine_class_to_guc_class(hwe->class);
> @@ -1831,8 +1831,7 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   	}
>   
>   	if (guc_class <= GUC_LAST_ENGINE_CLASS) {
> -		struct __guc_capture_parsed_output *n, *ntmp;
> -		struct xe_guc *guc =  &q->gt->uc.guc;
> +		struct xe_guc_capture_snapshot *n, *ntmp;
>   		u16 guc_id = q->guc->id;
>   		u32 lrca = xe_lrc_ggtt_addr(q->lrc[0]);
>   
> @@ -1844,8 +1843,8 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   		list_for_each_entry_safe(n, ntmp, &guc->capture->outlist, link) {
>   			if (n->eng_class == guc_class && n->eng_inst == hwe->instance &&
>   			    n->guc_id == guc_id && n->lrca == lrca &&
> -			    n->source == XE_ENGINE_CAPTURE_SOURCE_GUC) {
> -				n->locked = 1;
> +			    n->source == src) {
> +				n->locked = true;
>   				return n;
>   			}
>   		}
> @@ -1853,77 +1852,19 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>   	return NULL;
>   }
>   
> -/**
> - * xe_engine_snapshot_capture_for_queue - Take snapshot of associated engine
> - * @q: The exec queue object
> - *
> - * Take snapshot of associated HW Engine
> - *
> - * Returns: None.
> - */
> -void
> -xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
> -{
> -	struct xe_device *xe = gt_to_xe(q->gt);
> -	struct xe_devcoredump *coredump = &xe->devcoredump;
> -	struct xe_hw_engine *hwe;
> -	enum xe_hw_engine_id id;
> -	u32 adj_logical_mask = q->logical_mask;
> -
> -	if (IS_SRIOV_VF(xe))
> -		return;
> -
> -	for_each_hw_engine(hwe, q->gt, id) {
> -		if (hwe->class != q->hwe->class ||
> -		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> -			coredump->snapshot.hwe[id] = NULL;
> -			continue;
> -		}
> -
> -		if (!coredump->snapshot.hwe[id]) {
> -			coredump->snapshot.hwe[id] =
> -				xe_hw_engine_snapshot_capture(hwe, q);
> -		} else {
> -			struct __guc_capture_parsed_output *new;
> -
> -			new = xe_guc_capture_get_matching_and_lock(q);
> -			if (new) {
> -				struct xe_guc *guc =  &q->gt->uc.guc;
> -
> -				/*
> -				 * If we are in here, it means we found a fresh
> -				 * GuC-err-capture node for this engine after
> -				 * previously failing to find a match in the
> -				 * early part of guc_exec_queue_timedout_job.
> -				 * Thus we must free the manually captured node
> -				 */
> -				guc_capture_free_outlist_node(guc->capture,
> -							      coredump->snapshot.matched_node);
> -				coredump->snapshot.matched_node = new;
> -			}
> -		}
> -
> -		break;
> -	}
> -}
> -
>   /*
> - * xe_guc_capture_put_matched_nodes - Cleanup macthed nodes
> + * xe_guc_capture_snapshot_put - Release GuC Capture matched node from a prior snapshot_get
>    * @guc: The GuC object
> + * @node: The node to release back to GuC
>    *
>    * Free matched node and all nodes with the equal guc_id from
>    * GuC captured outlist
>    */
> -void xe_guc_capture_put_matched_nodes(struct xe_guc *guc)
> +void xe_guc_capture_snapshot_put(struct xe_guc *guc, struct xe_guc_capture_snapshot *n)
>   {
> -	struct xe_device *xe = guc_to_xe(guc);
> -	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> -	struct __guc_capture_parsed_output *n = devcoredump->snapshot.matched_node;
> -
>   	if (n) {
>   		guc_capture_remove_stale_matches_from_list(guc->capture, n);
>   		guc_capture_free_outlist_node(guc->capture, n);
> -		devcoredump->snapshot.matched_node = NULL;
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.h b/drivers/gpu/drm/xe/xe_guc_capture.h
> index 20a078dc4b85..e85af277be9c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.h
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.h
> @@ -11,10 +11,7 @@
>   #include "xe_guc.h"
>   #include "xe_guc_fwif.h"
>   
> -struct xe_exec_queue;
>   struct xe_guc;
> -struct xe_hw_engine;
> -struct xe_hw_engine_snapshot;
>   
>   static inline enum guc_capture_list_class_type xe_guc_class_to_capture_class(u16 class)
>   {
> @@ -44,18 +41,13 @@ void xe_guc_capture_process(struct xe_guc *guc);
>   int xe_guc_capture_getlist(struct xe_guc *guc, u32 owner, u32 type,
>   			   enum guc_capture_list_class_type capture_class, void **outptr);
>   int xe_guc_capture_getlistsize(struct xe_guc *guc, u32 owner, u32 type,
> -			       enum guc_capture_list_class_type capture_class, size_t *size);
> +				   enum guc_capture_list_class_type capture_class, size_t *size);
>   int xe_guc_capture_getnullheader(struct xe_guc *guc, void **outptr, size_t *size);
>   size_t xe_guc_capture_ads_input_worst_size(struct xe_guc *guc);
>   const struct __guc_mmio_reg_descr_group *
>   xe_guc_capture_get_reg_desc_list(struct xe_gt *gt, u32 owner, u32 type,
>   				 enum guc_capture_list_class_type capture_class, bool is_ext);
> -struct __guc_capture_parsed_output *xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q);
> -void xe_engine_manual_capture(struct xe_hw_engine *hwe, struct xe_hw_engine_snapshot *snapshot);
> -void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
> -void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>   void xe_guc_capture_steered_list_init(struct xe_guc *guc);
> -void xe_guc_capture_put_matched_nodes(struct xe_guc *guc);
>   int xe_guc_capture_init(struct xe_guc *guc);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> new file mode 100644
> index 000000000000..76159cb8fcab
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2021-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_CAPTURE_SNAPSHOT_TYPES_H
> +#define _XE_GUC_CAPTURE_SNAPSHOT_TYPES_H
> +
> +#include <linux/types.h>
> +#include <abi/guc_capture_abi.h>
> +#include "xe_guc_fwif.h"
> +
> +struct drm_printer;
> +struct guc_mmio_reg;
> +struct xe_guc;
> +struct xe_exec_queue;
> +struct xe_hw_engine;
> +
> +enum xe_guc_capture_snapshot_source {
> +	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
> +	XE_ENGINE_CAPTURE_SOURCE_GUC
> +};
> +
> +/*
> + * struct xe_guc_capture_snapshot - extracted error capture node
> + *
> + * A single unit of extracted error-capture output data grouped together
> + * at an engine-instance level. We keep these nodes in a linked list.
> + * See cachelist and outlist below.
> + */
> +struct xe_guc_capture_snapshot {
> +	/*
> +	 * A single set of 3 capture lists: a global-list
> +	 * an engine-class-list and an engine-instance list.
> +	 * outlist in __guc_capture_parsed_output will keep
> +	 * a linked list of these nodes that will eventually
> +	 * be detached from outlist and attached into to
> +	 * xe_codedump in response to a context reset
> +	 */
> +	struct list_head link;
> +	bool is_partial;
> +	u32 eng_class;
> +	u32 eng_inst;
> +	u32 guc_id;
> +	u32 lrca;
> +	u32 type;
> +	bool locked;
> +	enum xe_guc_capture_snapshot_source source;
> +	struct gcap_reg_list_info {
> +		u32 vfid;
> +		u32 num_regs;
> +		struct guc_mmio_reg *regs;
> +	} reginfo[GUC_STATE_CAPTURE_TYPE_MAX];
> +#define GCAP_PARSED_REGLIST_INDEX_GLOBAL   BIT(GUC_STATE_CAPTURE_TYPE_GLOBAL)
> +#define GCAP_PARSED_REGLIST_INDEX_ENGCLASS BIT(GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS)
> +};
> +
> +struct xe_guc_capture_snapshot *
> +xe_guc_capture_snapshot_get(struct xe_guc *guc, struct xe_exec_queue *q,
> +			    enum xe_guc_capture_snapshot_source src);
> +void xe_guc_capture_snapshot_print(struct xe_guc *guc, struct xe_guc_capture_snapshot *node,
> +				   struct drm_printer *p);
> +void xe_guc_capture_snapshot_put(struct xe_guc *guc, struct xe_guc_capture_snapshot *snapshot);
> +void xe_guc_capture_snapshot_store_manual_job(struct xe_guc *guc, struct xe_exec_queue *q);
> +struct xe_guc_capture_snapshot *
> +xe_guc_capture_snapshot_store_and_get_manual_hwe(struct xe_guc *guc, struct xe_hw_engine *hwe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f9ecee5364d8..30c2bdf51958 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -28,6 +28,7 @@
>   #include "xe_gt_printk.h"
>   #include "xe_guc.h"
>   #include "xe_guc_capture.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_guc_ct.h"
>   #include "xe_guc_exec_queue_types.h"
>   #include "xe_guc_id_mgr.h"
> @@ -1033,7 +1034,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	const char *process_name = "no process";
> -	struct xe_device *xe = guc_to_xe(guc);
>   	unsigned int fw_ref;
>   	int err = -ETIME;
>   	pid_t pid = -1;
> @@ -1062,18 +1062,23 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   		exec_queue_destroyed(q);
>   
>   	/*
> -	 * If devcoredump not captured and GuC capture for the job is not ready
> -	 * do manual capture first and decide later if we need to use it
> +	 * If the queue has't been killed yet or we do not have a firmware-reported
> +	 * GuC-Error-Capture node for the matching job, request GuC-Error-Capture to
> +	 * store a manual capture within its internal list with a job-match.
> +	 * xe_hw_engine_snapshot will decide later if it's needed.
>   	 */
> -	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
> -	    !xe_guc_capture_get_matching_and_lock(q)) {
> +	if (!exec_queue_killed(q) ||
|| or && ?
If we already got GuC capture, no need for manual capture

> +	    !xe_guc_capture_snapshot_get(guc, q, XE_ENGINE_CAPTURE_SOURCE_GUC)) {
I see !xe->devcoredump.captured check is missing, any concerns?
Right now, if devcoredump already captured, we don't need the manual 
capture.

>   		/* take force wake before engine register manual capture */
>   		fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>   		if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   			xe_gt_info(q->gt, "failed to get forcewake for coredump capture\n");
> -
> -		xe_engine_snapshot_capture_for_queue(q);
> -
> +		/*
> +		 * This will generate a manual capture node and store it in
> +		 * This GuC Error Capture link-list as if it came from GuC
> +		 * but with a source-id == manual-capture
> +		 */
> +		xe_guc_capture_snapshot_store_manual_job(guc, q);
>   		xe_force_wake_put(gt_to_fw(q->gt), fw_ref);
>   	}
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c4b0dc3be39c..ddd91627e623 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -24,7 +24,8 @@
>   #include "xe_gt_printk.h"
>   #include "xe_gt_mcr.h"
>   #include "xe_gt_topology.h"
> -#include "xe_guc_capture.h"
> +//#include "xe_guc_capture.h"
> +#include "xe_guc_capture_snapshot_types.h"
>   #include "xe_hw_engine_group.h"
>   #include "xe_hw_fence.h"
>   #include "xe_irq.h"
> @@ -827,9 +828,9 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>   }
>   
>   /**
> - * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
> + * hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
>    * @hwe: Xe HW Engine.
> - * @q: The exec queue object.
> + * @q: The exec queue object. (can be NULL for debugfs engine-register dump)
>    *
>    * This can be printed out in a later stage like during dev_coredump
>    * analysis.
> @@ -837,11 +838,12 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>    * Returns: a Xe HW Engine snapshot object that must be freed by the
>    * caller, using `xe_hw_engine_snapshot_free`.
>    */
> -struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
> +static struct xe_hw_engine_snapshot *
> +hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   {
>   	struct xe_hw_engine_snapshot *snapshot;
> -	struct __guc_capture_parsed_output *node;
> +	struct xe_guc_capture_snapshot *manual_node;
> +	struct xe_guc *guc;
>   
>   	if (!xe_hw_engine_is_valid(hwe))
>   		return NULL;
> @@ -865,25 +867,66 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
>   		return snapshot;
>   
>   	if (q) {
> -		/* If got guc capture, set source to GuC */
> -		node = xe_guc_capture_get_matching_and_lock(q);
> -		if (node) {
> -			struct xe_device *xe = gt_to_xe(hwe->gt);
> -			struct xe_devcoredump *coredump = &xe->devcoredump;
> -
> -			coredump->snapshot.matched_node = node;
> -			xe_gt_dbg(hwe->gt, "Found and locked GuC-err-capture node");
> -			return snapshot;
> +		guc = &q->gt->uc.guc;
> +		/* First find the pre-kill manual GuC-Err-Capture node for this job */
> +		manual_node = xe_guc_capture_snapshot_get(guc, q,
> +							  XE_ENGINE_CAPTURE_SOURCE_MANUAL);
> +
> +		/* Next, look for the GuC-Firmware reported node for this job */
> +		snapshot->matched_node = xe_guc_capture_snapshot_get(guc, q,
> +								     XE_ENGINE_CAPTURE_SOURCE_GUC);
> +		if (!snapshot->matched_node) {
> +			xe_gt_dbg(hwe->gt, "Can't find GUC-Sourced err-capture node");
> +			snapshot->matched_node = manual_node;
> +		} else if (manual_node) {
> +			/* looks like we don't need the manually-captured node, return it */
> +			xe_guc_capture_snapshot_put(guc, manual_node);
>   		}
>   	}
>   
> -	/* otherwise, do manual capture */
> -	xe_engine_manual_capture(hwe, snapshot);
> -	xe_gt_dbg(hwe->gt, "Proceeding with manual engine snapshot");
> +	if (!snapshot->matched_node) {
> +		guc = &hwe->gt->uc.guc;
> +		/*
> +		 * Fallback path - do an immediate jobless manual engine capture.
> +		 * This will happen when debugfs is triggered to force an engine dump.
> +		 */
> +		snapshot->matched_node = xe_guc_capture_snapshot_store_and_get_manual_hwe(guc, hwe);
> +		xe_gt_dbg(hwe->gt, "Fallback to jobless-manual-err-capture node");
> +	}
>   
>   	return snapshot;
>   }
>   
> +/**
> + * xe_engine_snapshot_capture_for_queue - Take snapshot of associated engine
> + * @q: The exec queue object
> + *
> + * Take snapshot of associated HW Engine
> + *
> + * Returns: None.
> + */
> +void
> +xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q)
> +{
> +	struct xe_device *xe = gt_to_xe(q->gt);
> +	struct xe_devcoredump *coredump = &xe->devcoredump;
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +	u32 adj_logical_mask = q->logical_mask;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	for_each_hw_engine(hwe, q->gt, id) {
> +		if (hwe->class != q->hwe->class ||
> +		    !(BIT(hwe->logical_instance) & adj_logical_mask)) {
> +			coredump->snapshot.hwe[id] = NULL;
> +			continue;
> +		}
> +		coredump->snapshot.hwe[id] = hw_engine_snapshot_capture(hwe, q);
> +	}
> +}
> +
>   /**
>    * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
>    * @snapshot: Xe HW Engine snapshot object.
> @@ -898,17 +941,41 @@ void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
>   		return;
>   
>   	gt = snapshot->hwe->gt;
> -	/*
> -	 * xe_guc_capture_put_matched_nodes is called here and from
> -	 * xe_devcoredump_snapshot_free, to cover the 2 calling paths
> -	 * of hw_engines - debugfs and devcoredump free.
> -	 */
> -	xe_guc_capture_put_matched_nodes(&gt->uc.guc);
> +	xe_guc_capture_snapshot_put(&gt->uc.guc, snapshot->matched_node);
> +	snapshot->matched_node = NULL;
>   
>   	kfree(snapshot->name);
>   	kfree(snapshot);
>   }
>   
> +/**
> + * xe_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> + * @snapshot: Xe HW Engine snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given Xe HW Engine snapshot object.
> + */
> +void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p)
> +{
> +	struct xe_gt *gt;
> +
> +	if (!snapshot)
> +		return;
> +
> +	gt = snapshot->hwe->gt;
> +
> +	drm_printf(p, "%s (physical), logical instance=%d\n",
> +		   snapshot->name ? snapshot->name : "",
> +		   snapshot->logical_instance);
> +	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> +		   snapshot->forcewake.domain, snapshot->forcewake.ref);
> +	drm_printf(p, "\tReserved: %s\n",
> +		   str_yes_no(snapshot->kernel_reserved));
> +	drm_puts(p, "\n");
> +
> +	xe_guc_capture_snapshot_print(&gt->uc.guc, snapshot->matched_node, p);
> +}
> +
>   /**
>    * xe_hw_engine_print - Xe HW Engine Print.
>    * @hwe: Hardware Engine.
> @@ -920,7 +987,7 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
>   {
>   	struct xe_hw_engine_snapshot *snapshot;
>   
> -	snapshot = xe_hw_engine_snapshot_capture(hwe, NULL);
> +	snapshot = hw_engine_snapshot_capture(hwe, NULL);
>   	xe_engine_snapshot_print(snapshot, p);
>   	xe_hw_engine_snapshot_free(snapshot);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 6b5f9fa2a594..845153fbc149 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -55,9 +55,9 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>   void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
>   u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>   				enum xe_engine_class engine_class);
> -struct xe_hw_engine_snapshot *
> -xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q);
> +void xe_engine_snapshot_capture_for_queue(struct xe_exec_queue *q);
>   void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
> +void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p);
>   void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
>   void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
>   
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index e14bee95e364..ea6b60c819d4 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -152,11 +152,7 @@ struct xe_hw_engine {
>   	struct xe_hw_engine_group *hw_engine_group;
>   };
>   
> -enum xe_hw_engine_snapshot_source_id {
> -	XE_ENGINE_CAPTURE_SOURCE_MANUAL,
> -	XE_ENGINE_CAPTURE_SOURCE_GUC
> -};
> -
> +struct xe_guc_capture_snapshot;
>   /**
>    * struct xe_hw_engine_snapshot - Hardware engine snapshot
>    *
> @@ -180,6 +176,13 @@ struct xe_hw_engine_snapshot {
>   	u32 mmio_base;
>   	/** @kernel_reserved: Engine reserved, can't be used by userspace */
>   	bool kernel_reserved;
> +	/**
> +	 * @matched_node: GuC Capture snapshot:
> +	 * The matched capture node for the timedout job
> +	 * this single-node tracker works because devcoredump will always only
> +	 * produce one hw-engine capture per devcoredump event
> +	 */
> +	struct xe_guc_capture_snapshot *matched_node;
>   };
>   
>   #endif

