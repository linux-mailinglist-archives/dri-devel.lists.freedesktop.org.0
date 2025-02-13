Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D43A33E1F
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 12:32:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E90D10EA67;
	Thu, 13 Feb 2025 11:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1sSw4Ym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F5A10EA67;
 Thu, 13 Feb 2025 11:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739446351; x=1770982351;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oEXkUxObH7mX40L2+NtP9Z/8LdJrc+gCDyAsFI706fo=;
 b=D1sSw4YmFqRp6RUzfLMn4JCuhN2Vm0UJEhYbv21iAUE+Ky0mvdctNjex
 16soVFiZpWxST+RZAke0pwXyzMgPKlfT1Lftfj0TDNAskQ51gu37/u4d6
 nyTELztNoiaII42Aso/p9NVdvsT62sfiVDFLiUn/Jrtzaj5IqmavoaAA6
 8NbS6/w6VdO2/i4+pv1oEBkVAglFN+s7R6TRJIq2Cf8IR/foc+MA7u5CU
 qV4gfGNAR66a8/iD9UJMLPQBDg523fN9PiXRvyZKWcHoGR8HLF7YaAx+Z
 Uu/IYzZPjk90G4IslPMtVCfM0KOL4lyzaEc4PEBZpWR67PQLYso7MPgWP g==;
X-CSE-ConnectionGUID: N/jGS6IMRomS/zLDjPF/Tw==
X-CSE-MsgGUID: gLRu0u9TTh+XgjUucFPW2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39373276"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="39373276"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:32:31 -0800
X-CSE-ConnectionGUID: BQnqmhtKTWS9UobmA15v4Q==
X-CSE-MsgGUID: eSkjrWTORamcDOxI0z7GSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="112877205"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:32:30 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 03:32:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 03:32:29 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 03:32:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k96z6aK4ruSXaQTLLxJEwybVOod+hMiWW+V4DiriZpKx68VS14dY3q4GLFuHlzRzd9ZL54PdFRrUp2o4BzOTCtlDCTLL4yt9GdmVQD3HZntOljiBr+aOumP5aEoj5SKnV6jh3KMreMPs5ZT8WDtP+feY1+OHnN7bpn7robqAuMvwCaDZAnKaQRf5dzHxy4YQRex/uTJvc+oaDtnkksKaWx9bMorwHmudt0+tl1Me68cDeOUMUL1nfiSIceaUHYLrpnHQjoUPRQlvfD+jVX2vzniDXl9w08Kc1eIZgAnXRwwRxTF0f7yE4ZIZehqgvSAmGnsWS/A1AQvpbTPQllX1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eoM6HCHNZUPXOV+fvQJwVC3EFuOswQ9zmvuxVpVIsl0=;
 b=qLBBFBrlhLXqEgYvWjCuWBvPk17FHqr+F/7SZuS57Qeg5k/lHzCSsTW/Zfc8Mfj0M4EkKnrcUqaaxEpxn8KQ1yDEq5vTgof593ISceK8hp9JAD/L0oFP7BTz1lek34UNW6yZ1SmIqltkOMQBaNKjQtHPo+N2gEnLAf0jRgee2V8ybAksUWL7KHUr5P1EdGGC5dcHkK49wpVb7Ok3yA6dZ4h3ZeB/Iv+pViUXe2d5zOzKEDvf9gTqSOdx7spaFlXBjEevReBSrWAHMPIB1z5S76iXTURA4NnMjxXZgthU4NhV82r/iYUtKhbzBYqC9YCeYzQqRRhsbnju5FKBvmxA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.23; Thu, 13 Feb
 2025 11:31:59 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 11:31:59 +0000
Message-ID: <1a1e29e5-b8cc-4569-9f56-2b6e6b7b2438@intel.com>
Date: Thu, 13 Feb 2025 17:01:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 31/32] drm/xe: Add always_migrate_to_vram modparam
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <dri-devel@lists.freedesktop.org>
CC: <apopple@nvidia.com>, <airlied@gmail.com>,
 <thomas.hellstrom@linux.intel.com>, <simona.vetter@ffwll.ch>,
 <felix.kuehling@amd.com>, <dakr@kernel.org>
References: <20250213021112.1228481-1-matthew.brost@intel.com>
 <20250213021112.1228481-32-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250213021112.1228481-32-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::23) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH3PR11MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fd46e71-f8a1-471f-653c-08dd4c22070a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2dIVm5XbXVUaGp4NTBEdHAvbFdHZDhNcHRxY3ZDMlFkbE0waUJ1ellVaU90?=
 =?utf-8?B?alE2VVBuQVhGQTU2N0V3VHdhMFVreW1LcHFuZmRqVkJtNGlWN3dQMFVoc3R6?=
 =?utf-8?B?cGlpdVhDOEgvMlZzY241OEF4d3VPMUJyay93K2pxcG1mVFhyVDl5WEUwS2tp?=
 =?utf-8?B?UFhGUkZqSE1JV2Zyc213MEhVVnp6bnZvMG8vcnQ4Ly8yQTJrZ3pMN0RYcGYw?=
 =?utf-8?B?MDRlL0xFU0dmd3lXVVN4M0hvYXkyT2I3dUM0SjZIQTMwaFJPbFhXekdORUVZ?=
 =?utf-8?B?cEdWS3E3dzFMZW16cDlad2NsVmdRaXorQnIzeXNKaW5pcndvMW4rN09aKzNu?=
 =?utf-8?B?ZTlINWxFaktjVHFUTDVNeC9Fc0xUaEh4V3pTaVFtNW5YSjUyQWZadzZ5ZkxC?=
 =?utf-8?B?b3hRL2puQm92RXBSayt1OGxja2VZOS8zQVNTMDRHbmc3cDM4S1NoR1I2SUxh?=
 =?utf-8?B?cnQzdE5wREpobU42RFU3Q1psQUY3MVhaQVZXcWhoNXEwWTlQTGE0UlQ0NGFy?=
 =?utf-8?B?Mm9MMVk5dlV6YVFtSVYxZ1k2UUs3cEFzWjZBVGUzbnhxaFhQT2dZc0JRdXhq?=
 =?utf-8?B?NWgybnpIR1NpZ0dxbVcwTEh5MDFEbzIxbUI4alJJNlFHeVhWMVIxc0FhbDgz?=
 =?utf-8?B?SnE0cXdsdmR0bEgvMzI0Mkc5NzB1SGFwcDNOeXNDYU1tRlo0emJ0cWJSelB2?=
 =?utf-8?B?c050YTJub0VVcDRmbTh3RUJvNGZEelZpdE9Td1VuWTkrOW85OHRKSFVoU3lM?=
 =?utf-8?B?eXE2eW9od29lb2hZQ3B5bnpKbE80ZTdhVU9yQzVwWko4dGwrNTMxMlZTM1pt?=
 =?utf-8?B?SEhIWHFIcDQ3ZHRNWDNYVit1QXlYaU90VmdUdjh6QlgwdEh6YXpEVS9KZ3ZD?=
 =?utf-8?B?dnZwMWNyQ2RhU3BMNG0ybnVyU0poOUdZeGR5L0pOZXplT1NBdUx6ZkVuaE1L?=
 =?utf-8?B?OUZSK2VHUExPTmc2YmpkVDZRQnZvRXF6ZkFhRGpnOW52ZndyTUh2eUFkQ1pP?=
 =?utf-8?B?cmhLNzFUZEErRUthc0tzL3JNaVVHMEJGS0FKS0I3NDIvZEJaWnQva0dVbE96?=
 =?utf-8?B?cGgyNVNJdzV2WndHVUVhT2I3M0YvOGU5U2ZDYWcwb0RnRE5MM2RjenhxbEpq?=
 =?utf-8?B?UTQwbnh1VDU0T21wb2sxaG5zYmpvT1Q4clN1SnhkYTdQYm9sM3Y0M1poZ2pM?=
 =?utf-8?B?T1l2OEtzMTlZV0JsMEdxNU9GVFd5WUxzb3ltejNKbTBudDJVR3ZiWkRiM0FC?=
 =?utf-8?B?eU9wa0FIOEpVazlLQkViZ1RyNmR1U2hRQlk1ZVFyMlN4ZFE1SmprdG9Vdity?=
 =?utf-8?B?L29uM2pUTlhYb2JQWGxraXpVeXMxQXBLbE1VU1pqVmp6MHNZdW1JbmRBTkZU?=
 =?utf-8?B?NUNidzFpcllRRHFTU2pPMVpINzZIODNOeGl2SEhlZGxoNWtXbVViZVhWMC82?=
 =?utf-8?B?RmliczZjZ1pxZHZrVTNPYlNoNytOZzRyU1c5RTUrTHIrSlhEWTFibEVQd2w0?=
 =?utf-8?B?RXJjTGsvdURaZ3NWOHNyTUxXMmpJZ1ZydFk3WXg0TlZKRnI5d25wa2phTytO?=
 =?utf-8?B?Sm9pUjFXNkMyNG9hYVM0OStwbEZTQ0FNbmFHek8zcmY0L3NNenJZNFlnNnQw?=
 =?utf-8?B?NmxGUW9Ldjk3anVKT1RXckJZVlA5KzZQeS9EZ1p5WkU3V2FCSlBQRllVQkZE?=
 =?utf-8?B?ZENTM0c4UTQ1TE9DS0s5cGJqcERVem5jM2NzVGVZQ0had2VyYUV3MVFBSWM1?=
 =?utf-8?B?blZMTUVmd2U1YnFxeFJhR2lIcVpxYnUxWWNyS1lvUE5mTDBONWJvRlBCQytL?=
 =?utf-8?B?VTBZRFVFQnpxbjBBODQ0K2VWN2V3K3M0RWZxb0lwK3ZuNXAza0d6QnFhRnBk?=
 =?utf-8?Q?eQkZWJhYdP7AR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0lJN09DcXRPcDd0MnJqekx0aFZ1RkZzQ3Z6SFJFaXdROGdEN2lZL0VDZmx5?=
 =?utf-8?B?dnhrNHN5bmZod2Z5V2xxNnd0SFIydFQycHRHY2NmRVRRT3dVbkFhbFhDMVhK?=
 =?utf-8?B?ekdIdlFGQS83cjl1QmFtWVBNVzFIeGRHU05zbVA5SitxOGVGVzF3a0dkekNx?=
 =?utf-8?B?dUJuOVlVbnBsU0l6ZnpCSWNyaUZJNExnQmdId0VQdmN3aFVqMFRTcmNTWDlR?=
 =?utf-8?B?VWNDbW84S0QxeElYbnFOaTU1YWdYRDVieXgzZlRSbHVMbGJKMUd0cWhvYTJ3?=
 =?utf-8?B?YVlJN1ZGV0J4K2xvbldUb2dnS05xcHE5N0pnSnNTcjR6UldTQ1A1ZUoxVUIw?=
 =?utf-8?B?K2FySFlENmtaYnZobkhOKzMrUzFEckRiMnNQM1pZYzB1UWFQc0NrRDB6S0xJ?=
 =?utf-8?B?NEk2eEp6bzg4NTI2cWFBa1VLUGdENnRqeDcxOFdSTjNtbytVYnIyMkdoQUF6?=
 =?utf-8?B?Yk9tc0dCWFVJc3JNaER2ZFlHcS9zQVJOMnVvbm1jTFc0VER2VVFmMExWWk5o?=
 =?utf-8?B?bFhPZTJHd0VncGNBaGlRZTA0OXRyZG5sOEx3T21jWjh3R3FsK2gxTE9VTmYx?=
 =?utf-8?B?aHdFUUxIV0V1SVJiMWJPWjBPbTBZMU45M1MxQTVuV1RTWkpxUzBFYUdzM2FJ?=
 =?utf-8?B?Rm5ERk42SjRmekg1a0IxMStEU1BiNFV4QTZTcmQ3UTBJVnZBRm8yK1kvamNa?=
 =?utf-8?B?TWw4cEhteHlQQmowTGkxbXpyaFZ5bDVhS1JJN25GeHVkcy9iRzRrU3JmK21R?=
 =?utf-8?B?S2NnQ055YmJNREk0d0NQYXRMRk03RmlvZXN5cXpRdWN0RlBFSEc2ZkpvWCtr?=
 =?utf-8?B?bXAxK0MrRktCdFc0NE1obFc4a053R0EvSDdxdUFYbm44b2N0bHdLK1lTS1V5?=
 =?utf-8?B?RGJVVzROVXBZUE5LOExWNmFYeW9tNGl6SlZWYkV4WkNDQWNpZ3ZYekl1R3ov?=
 =?utf-8?B?KzN0Z3pTL2xscVNkSVZNcXFzU1RySzNycERYb1YwK3FCMlZHekt1Qkp1VDFJ?=
 =?utf-8?B?YS9XN2YrTkRTanNyMWZNSm1ERnFLVlRpYUdWbXRld0ZuMFNsQUYySTBNNE9N?=
 =?utf-8?B?M2U0dmtIYjVsUEluY3hCeEdkZzVYRFpIOFRpNDFLL2luaVdWbWQrM3kwcGN2?=
 =?utf-8?B?cFdDRU5KTnhmdnYvSGNETzRCd3RWV0ZxQXQrQzQvaXJPZ2JnMm8rbmhiWVBH?=
 =?utf-8?B?b2JBZ2NwdHR2ZjlTRGFLQVhzeGtDQzZjWlBiVDFDRlpNTDQxL0dHbFpXVksr?=
 =?utf-8?B?bDZvNy9tVVA4MGN0L2N4VnlSdGFLaDZvOWdqTEk5blRhM2hwVEliYlBoN3ZG?=
 =?utf-8?B?SEI0UDFTNVZIZU1Pa1RaWnlkK0JMbnU5SjJ6aDdvU2xTSlprRno3czhFcmJi?=
 =?utf-8?B?TVdXVEZ2QUFxUTJVNXdiUXF4cVBNUlBQYnEyUnhZRzgyVG1QdUVjR1lFUEd3?=
 =?utf-8?B?YXVvSVdnY2tKckJ5MVNtaWhPUTZac1FCWUpic3BGWDM3S1VDS1MrdGpYKzE2?=
 =?utf-8?B?MU9zdk5tZGhKNlJkTXBOWUg5OWxGVll3Zm95YzBpa0ltVENXT1FGcDVSQ2NQ?=
 =?utf-8?B?UjBucy9hMmc2ajBYanhYWXV2bFVHVjl2RFI2L3JDQ1YyZVR1aDB6OExXVkpD?=
 =?utf-8?B?bUx0OW0zN3lHUkQ5OWhQT3lIRUFpZGVXUTBWQkM4STBYZThJZmUzUmVtbzdx?=
 =?utf-8?B?ancyZGhveTkzV3N4bHkrSWRVOVY2Wi9KMlZzQlpPbS83dnR5MjdMMTZvNEVZ?=
 =?utf-8?B?bHVLeXlXMmd6bEhUOHgwZHFOQ2FUYXpaQXBTLzRiTjJNaGx5QXZSVXA5OGV6?=
 =?utf-8?B?RkZGRVZ0M0FZclpWc0xGNmFqNmc4U3B4V09UMnppMUk0eGcvUlZ2ZWZVa0tO?=
 =?utf-8?B?OFN3U3o1TW5DQStPOUtpVnZ6SXFEQUwzWFg5dmExRzZja3B0RVh3enBKakEr?=
 =?utf-8?B?aHlTczl6UldKZ2pXaVhDcFhIcnZZTG1IR3JRNzNlK0VpbmdvV3czaU9xQmJz?=
 =?utf-8?B?R2RUOWp5WVRBaGQzZmpLQ21KdUliaTEvUVBWWkNUWnVvUEZ1bWlCNFRxT3l0?=
 =?utf-8?B?SHFleUV5dlRBVFRZVEIxY2NrSE9kYy9rNUFNUVVmQ0o3ampjNkxlblBHK3Z4?=
 =?utf-8?B?YnZ0SzF1ZWFmOS9FcEIzbjFSdmxoV3Z6ZE1rK2d1a0w1Uy85OWpyZkd6QUdP?=
 =?utf-8?Q?a/5ZaRsU8AHkcP0QMHaa4c0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fd46e71-f8a1-471f-653c-08dd4c22070a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:31:58.9846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3JDnsLPa+WnuCJk6fe5Fl1MhytesApuABaoEMMQimBePqDqLKT7sgIqyycdDMo/f8G6YAB7wO1S9ozB5VU/iIH3rKZAsIFBltsY+yc+n0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
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



On 13-02-2025 07:41, Matthew Brost wrote:
> Used to show we can bounce memory multiple times which will happen once
> a real migration policy is implemented. Can be removed once migration
> policy is implemented.
> 
> v3:
>   - Pull some changes into the previous patch (Thomas)
>   - Better commit message (Thomas)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/xe/xe_module.c | 3 +++
>   drivers/gpu/drm/xe/xe_module.h | 1 +
>   drivers/gpu/drm/xe/xe_svm.c    | 3 +++
>   3 files changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 4fe6a33da7e3..475acdba2b55 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -32,6 +32,9 @@ struct xe_modparam xe_modparam = {
>   module_param_named(svm_notifier_size, xe_modparam.svm_notifier_size, uint, 0600);
>   MODULE_PARM_DESC(svm_notifier_size, "Set the svm notifier size(in MiB), must be power of 2");
>   
> +module_param_named(always_migrate_to_vram, xe_modparam.always_migrate_to_vram, bool, 0444);
> +MODULE_PARM_DESC(always_migrate_to_vram, "Always migrate to VRAM on GPU fault");
> +
>   module_param_named_unsafe(force_execlist, xe_modparam.force_execlist, bool, 0444);
>   MODULE_PARM_DESC(force_execlist, "Force Execlist submission");
>   
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 5a3bfea8b7b4..84339e509c80 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -12,6 +12,7 @@
>   struct xe_modparam {
>   	bool force_execlist;
>   	bool probe_display;
> +	bool always_migrate_to_vram;
>   	u32 force_vram_bar_size;
>   	int guc_log_level;
>   	char *guc_firmware_path;
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index ce67f42bf4f7..a3ec725913ca 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -839,6 +839,9 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>   	}
>   	drm_exec_fini(&exec);
>   
> +	if (xe_modparam.always_migrate_to_vram)
> +		range->migrated = false;
> +

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	dma_fence_wait(fence, false);
>   	dma_fence_put(fence);
>   

