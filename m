Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EACACE69B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 00:16:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAE610E084;
	Wed,  4 Jun 2025 22:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHgaUvVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D3210E084;
 Wed,  4 Jun 2025 22:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749075407; x=1780611407;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4hKZqQJ7vcz+LAztndQRXQ5mKjJNYcpYcpzpHcTQKdI=;
 b=NHgaUvVMnxPUzZHMOIrEMGYRqfaJZT62M+O1afmnB9GcNdW7cvviXjfc
 TFctPG1LmpzWcw2QOI0beV5LQcJ1X8um0wjy9mXyxoyjYSy1yp3HNZN/+
 NgGSrQqFfOXV5lSnd7Gs//9LUE8SFh4ZqcXDKx11/F5sbonflX03rWBbq
 sCRe3cZpcXOm2dMinmBbvr1jBcn4JBKZw/leUBs/fRJst2Mbd4z3urQfs
 PGoeIyWQVDEDrrLa7s1kgEPdl2XkeGNLyjL9MVTGSGaldvsk9ClPlzmQ/
 N4zYxBQyYMvMPwoC7U47vl7a4gAe9ouanEblLDB5QKbE8sO7nwnzEVszj A==;
X-CSE-ConnectionGUID: MlK/x3dARPKTcM1ZQBxk8Q==
X-CSE-MsgGUID: Nc/HFHlAStS3rtiLK+kYZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51324116"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="51324116"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 15:16:46 -0700
X-CSE-ConnectionGUID: h3Q/QZ+7Q0eMybYXyOYtMA==
X-CSE-MsgGUID: gNKRJ025TNCx7jja+IscaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="145357570"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 15:16:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 15:16:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 15:16:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.85)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 15:16:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bd13IYcfQo/w4JuxmspSJ6apsyckNWh3koywmspzSpGbdVUaM4xLlKzX+DgiBmMSTWoEHN2wYlVo/nlMi8ZbiCcyzdIsWGoNtWZEzwFxXldY+nQrz2PBI26C/n7QV46d/zs0J4Y2MlaCu52CUJLeJLc22N8oU6P0Z0Wuj4Qh47dUgk8sSMnPgzFLO80IDnBwVW54h3ldFLzgfxP5JMEP35UyFZZ86Ul2oOef4lgRClH/lAMKv+kwRBdgwjxB34erwcCQhpmnMtt68AZsFARWR0RD3JPFBFQjLRvPCvZeKhccGtXTvwtl6DhVN9lhwA2LEp1ETVz0ealIMkOUNN+BOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFOn7D6Eop1fm5Ho4Nk8dYt+sAVDW5tpO3k/DAB3t2A=;
 b=hf3UZMINRTv9Nsa3zH80CZ9FM7Zn8tJVi3PS4BYphrE/MT/yFTbQoL+OMwdwlIGN8JT4TYaqf2VcdExGUBTmtl8GHWtjEzmB/GRCNK6BiH6IuJkDPencRbsGyuLyCt6uGbDw5PjijuISINsz33yI8cMa1FKyIPgmYkNWInHVme42f+fFHuPqivzj0kMuI/PYNf0UaJ+g+gvvxoG+JxHPDfSSxJBmEd2YCQb8l7PfIKxpuMJdMGjhkw4rHSBXfTtdfm/CqhwCkpkuaOLAof10k2u4VWjXIxI29+COHn7PqcWAt8jjFIILkdPgvzivZZOQOqcNrXA6w7m7UaZrESbpZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5095.namprd11.prod.outlook.com (2603:10b6:510:3b::14)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Wed, 4 Jun
 2025 22:16:42 +0000
Received: from PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189]) by PH0PR11MB5095.namprd11.prod.outlook.com
 ([fe80::215b:e85e:1973:8189%6]) with mapi id 15.20.8813.018; Wed, 4 Jun 2025
 22:16:42 +0000
Message-ID: <24f7d99d-3249-4fcf-a9e4-af610cc9436b@intel.com>
Date: Wed, 4 Jun 2025 15:16:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/bl: Use kasprintf for interface name
To: Timur Tabi <ttabi@nvidia.com>, "christophe.jaillet@wanadoo.fr"
 <christophe.jaillet@wanadoo.fr>, "philip.li@intel.com" <philip.li@intel.com>, 
 "simona@ffwll.ch" <simona@ffwll.ch>, "lyude@redhat.com" <lyude@redhat.com>,
 "pierre.morrow@free.fr" <pierre.morrow@free.fr>, "airlied@gmail.com"
 <airlied@gmail.com>, "dakr@kernel.org" <dakr@kernel.org>, Ben Skeggs
 <bskeggs@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250604-jk-nouveua-drm-bl-snprintf-fix-v1-1-79b1593ad664@intel.com>
 <704b69a6af32e0d89a6d88051c12f29fdadfa638.camel@nvidia.com>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <704b69a6af32e0d89a6d88051c12f29fdadfa638.camel@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::13) To PH0PR11MB5095.namprd11.prod.outlook.com
 (2603:10b6:510:3b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5095:EE_|PH7PR11MB6377:EE_
X-MS-Office365-Filtering-Correlation-Id: 8505c144-3f32-4a79-05cf-08dda3b57c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|41080700001; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alZibk5WZXFzeVJiNUdVSnBhaCsyb3RsdDdpUTVGRGtYcXJQUENEUi8vMjNJ?=
 =?utf-8?B?K25BN2JRK1ZxcHNWSERoSzlqVzJkNzVMSzVsVGozUU90WE8vZkl1QW9VZFI1?=
 =?utf-8?B?YXcrQzJoZUpZUzhHTWJSRU9Vd29yc090ZHhEZlRnS1lISWRTaXI2RG1aMkQ0?=
 =?utf-8?B?UkVOM2pqa0tQWksrU290NHJFMTkxbFlZSWFMTFBuaGR3SmlBTGNtOXEyM0d4?=
 =?utf-8?B?L1dscTFvb2dGTHM3Z3lzV1dFYlNmOENOaFBrRUZaV3hSQmI2UWNRcE5STHIw?=
 =?utf-8?B?NHl4OHBCSEVuUjB5MFFTVStIbWltaTVzcFNLV1o2QllBMzB4ZHhocDI3eEU0?=
 =?utf-8?B?QTdWSjlVZmZKK2s3amtGR2h5R2lLL09JOFpqZG9wZVM1ZVR0QmJFRitLTERT?=
 =?utf-8?B?NUNtbmM0aEpQVjgwd0NudFMyTjFYbnJBWnNSQkIxRzdsaHhCZ0JITnJsVkZU?=
 =?utf-8?B?T0d1M0Y5RE81YkYwTXVKd0F4cVFYUlhhUkRJU0VjNHhDMkdFWTF0dG9XUERC?=
 =?utf-8?B?WitPUnhaSEFoWFdCNUc3N3JkditiYjhOSWRrVjZDaHNLd1Q3aWJpNjNvNFA1?=
 =?utf-8?B?bFAxbkVENU0yUXN6cFpYWVZiK2srbzRBYVFWanQvUmZRQlFNNGtVL1gyQ0o0?=
 =?utf-8?B?b0RxaU83MUtkTEI1N2QwVEhyNGpRZ0x3cGxrMC9STy9vVXpIbXVPeVpwdWNM?=
 =?utf-8?B?d2dLUDJLa2pCdFZiVmtjVzlzempOZEdRc0xXMDByRWFMRWVITGJodFJsMmRa?=
 =?utf-8?B?WjlWUWxHcWxJb3A1a0ZqTzJ0KzY1c083OXdHSFN1c09JeEFjOU9YTGlEQ1hG?=
 =?utf-8?B?WVB6NDRaREZDWkdvdTFGZmJzV1V2cWhpcS81K2poTXNHY0hUYWdXL3FINTV1?=
 =?utf-8?B?K0pManpkVWtwKzJTNURPOWJwNEFPNkhrMEZmZ3E5enBMZW9TQjJIUU9Tc0Vy?=
 =?utf-8?B?Qk1BUUlhZ21UWmJkeHM0TEw4bVh6SVlPbHY2VG5mOU1CVXQxSlpVM2FtUVlO?=
 =?utf-8?B?T3BmSEFreU1NRU1scEZrZ0NuZUU5ZW4yS0s2cFdkSW4yRjZpMytKdnh0a1o3?=
 =?utf-8?B?Zk84YVM0M1RQZG1McGtyMDd2ZFhSQ0trK2FYdDZHOWNqb09ST2FRNnpGdHZm?=
 =?utf-8?B?a1FmWXRJWEJFZWR2N0o0NzdRai9BRlFhcUVqV3pFS2FQZzJ3YXVWVW11eW1K?=
 =?utf-8?B?a0ZZWjNuVTNWQU92K2EzOUM4K2dDLzh0UXlCaGxJME4rMzE0dHdERmVvNjVP?=
 =?utf-8?B?RG03YVEzUlVDS3VUdVV3YlpZYVJzanpRUGZtV0d5aHRUbWNhWnhmN0VoSitn?=
 =?utf-8?B?M0wwaENiWXRwMHRWMDZrdU4rUnhBYlV2aTJoNm03S1d3NzZST21LeVBicDZS?=
 =?utf-8?B?L1l5d01TZnozRFdHRWZxTFlIQjBDNTk5Tm9ibHdkV3RDbEROenVaWGNoTlY3?=
 =?utf-8?B?SjlGTFhuWnhnYkdiWnRFWlhHMjZ0WE1SejExZG9zQTdaL0ZMdWhOSFpHU0tK?=
 =?utf-8?B?T1VjUTVKb3RhYzVvRVI2M0VyVjdqU2tKUkNHSEJOTWx5VVg1NVFBL1hBcENO?=
 =?utf-8?B?Z0RwZzQwZ0o2aXZxSmlueENnR1dnWTNXTXNpa2lOdmV0enpyZmJIODgzMVhB?=
 =?utf-8?B?cUdMZWJrWlJFNmhoU0hYODZqQVArZFJneHQ0bG1idUxRVWxvU3ZhV1BFejhB?=
 =?utf-8?B?TnNGVXNQRXZQYkJsZ0ZoU2xaUUsxd1FabHo4Y0JmMGhFZDRzZWRmZE0va2F5?=
 =?utf-8?B?VWh4NzFpeEhxRnpJeE5LR0NmZ2ppM2MvSmNzMCs2bDNOQW9LeTkvWllHanZo?=
 =?utf-8?B?ZTZNMW83U3F6RkJGU1oxSWQ0TEp2aUNkMWJsZTY0K05sVlV5bG1RRTdOeDUz?=
 =?utf-8?B?UnBuOVB3SExCSWFERk00aFJhYyt6UXd2bUFmQlEzL2xGS1A1ZnBPSDgwaUll?=
 =?utf-8?B?dDcyVmZ0L0hBS2N2dXZDenZDcU5SdFR3RDBSdk5USC83M1hheTBpSGJiLzJJ?=
 =?utf-8?Q?NRpWZ+w5CzwW0K/fFrqKhpq2gvizfw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5095.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(41080700001); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjlZUElxT2dKczhmMFZ3VEFJRDNjYk95WVYyaU8xa0hXNkdINkszQmx4Tld0?=
 =?utf-8?B?OWdEY1A5ampDZ0tFMW81TUlKNzJSckJ1SnQ5UkJQelg3YS9mQ0JPenVMWUpK?=
 =?utf-8?B?enJJQjRDZHBDcGlRSzRjdDVudnA0M2Ntb2p3MGxOeDZoUm8wVE91bE5vN2RB?=
 =?utf-8?B?QTRhNk8rY0RBL1BOZ1RMbGtvQ2h0SEpGcGRrLzFsY0QveWxSQnI3Z2xWSXhL?=
 =?utf-8?B?NUY0cHR6ODhOQ0hyc3Q3Z3QyWTRmRkxaT1VobjdiRlptQjA0T0RvNC9nUyta?=
 =?utf-8?B?K0trRU5pYlNTMTFpbDVwY2NnSHo4OTc2S1NyVzBuZm1XTXZPY1BQb2Q3UlhS?=
 =?utf-8?B?dDM2RERrcE15S3pWcmNqTGlBeUl1U2o3OEVRcGZ6U1d2aGhOSmxDSVo1d1E4?=
 =?utf-8?B?b05Rd3padXRYdktTRHEzZXlleFhVYkVubzU1SDZHZTRHWUZHT1dxRjVhTTFM?=
 =?utf-8?B?ZWNpN3RpY09ET2F6L1oweEQ3UHNhTzZaMnU3UVdlejdlOEtXT0x3R0RJclhn?=
 =?utf-8?B?d2NmQzBMaFFFOEphdFV3QWl1bkhYejJQMFhHSTJXMHhHMDNDR0NXcVBjSEtU?=
 =?utf-8?B?SFVSY0VFRFI1Z21xdmRmMXpZcW03djE3UEhHVGhGb3RsdmNSTkJOV0dvcHl2?=
 =?utf-8?B?c00rb09TVVR6a2ZzUEFxQ3hXdWg4QlFpb04zQVJDVUVXN0JqelJ3YllVeGF6?=
 =?utf-8?B?QUpRZVhPQ1A5YkUzTzRCZ3FYYzY5OVBVSEp3T0VqSHRiT3R5MmJwUWpGNEJs?=
 =?utf-8?B?eGpJWWtZSnVKdDJFMU9YYzNuNjJpMGdNb2Q3WHVvajBYSmtRQ0hzNjRsaXk5?=
 =?utf-8?B?V0VQUlV1MTAxMEdvaVd1NTFSRXdyTW51bDZyOHR5ZVE0WmM3NExHZ1k5RmtG?=
 =?utf-8?B?a2NOU2dTN0xTcytqb2JqcHloWWdLcW96dE1zMnhEKzhpS216d3plSE51dkkr?=
 =?utf-8?B?Zmt1TWZsWmVBUVZFRkV1dzZHS0swNTFRTHMvUVNiUGxob3p3alJzMzhNYUIv?=
 =?utf-8?B?dmRJdWVMSktxSUJYdlQ4c1hDUnA3Zytkd0hrbis3OGNpREF6U3lEWVBCVHND?=
 =?utf-8?B?MkFvVE1uZE5vWjkweW9PbnVtY1FNZkdpaHMveDlqTWcwb3lEbSt1U1lzRjRl?=
 =?utf-8?B?bVEzU2hTT3B0RzM3RHdtYzFoY0xCWmJoTmU4aGQvUUIvcG5YOEV5RlFLMXBq?=
 =?utf-8?B?UUFlbmhvdGZjRkJLUzA1eVgxUFJKUDkvRzBheG5NOVNyZyt0dnhta0E0L0ZE?=
 =?utf-8?B?VU5NTHUzd0E2cXpLdXpqODk0QUFhcy93MmhmUXJtWk5ZNWxVM0srRjQyZW5m?=
 =?utf-8?B?Sit1MTgraUlrMEdJNzdSWFA0NTJYNHhGZ2xKY1QyV2dVOFMyRFBPM0x4YlhO?=
 =?utf-8?B?L0ZBZlVhYzZ4STMyRGhkV0lqazYrbHpVeDlQM2RSNko1Vjdic3gwTTdlQitl?=
 =?utf-8?B?dHhLMW1ZeGVmT3NMSGtKSHNYSjZ6THUvSjFzbDZwazJlNmVEZGhRYnhya3lp?=
 =?utf-8?B?T2ZMbXNmZTBMUlZUVXM0a25QcTFlT1VpOFdmYUwvREdTaHBrdG5GWDFic0Jl?=
 =?utf-8?B?ZityTVlMV2V6bE0zRTRUaWdBUWZGMWF4eXJrenlEQmJ2SGFvakFPZ2NSUmh6?=
 =?utf-8?B?TE5mNGEwMktwZzFId3h4cGphSlV0ejM3OTNXRFplNkFJWmNkSHJXWlkxRUNs?=
 =?utf-8?B?U21XWDROSmdCZGJqRnR2VnV0Zy9rakxTWWJCdUVvQ0hmZjZjWVhhZUpNd2hQ?=
 =?utf-8?B?dXNKbzRldk9LeVNZU0pYRzkxNktOajVIRjJhdXMyeHl4eEp0MmpVSGtETjI5?=
 =?utf-8?B?dmZ3ejQ3L3FBMkEvQmc1VXFpZ01uYlJraldZS1JnQmtjTzRGMFJBUEg3eEdt?=
 =?utf-8?B?MVVla1cyM283TXVHRWU1ZnlkamdnY0dJQ2tZeU0rc1poUWlhN29YWHNYdDBz?=
 =?utf-8?B?YzhPOEM5SXJFeVBBY0pXZk96UVRERVRtaXlCTGNaZnBLMXlra2hQTlRnY3Jr?=
 =?utf-8?B?OHAydHFtWVNkSGlkVFp0NWlzUVRUUjdMV2pDc1RKK3FZV2diNklMK29SL1d1?=
 =?utf-8?B?Slo2aGxHSmRqWGZtc0d0TWZOUE1rYjNIMkJyVVMyMkZ2aCtGZ3pRR3Q3S0NW?=
 =?utf-8?B?QlRGUXZjNExRRVNSckZDVW5Bam9nOGtLUjlrYWdvNWl0V0lGSUNDcEd1ME9U?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8505c144-3f32-4a79-05cf-08dda3b57c37
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5095.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 22:16:42.7489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tioatt6wYsqVHVX3YsuSdTb30PxG7aBHloWiVLT8ke9O0J15aZv5T4hKOt1eZ29ogCI9PJX2yfZjEb9A8VnM/bVIsssDsP+WPo8EZj0wmko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
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



On 6/4/2025 3:01 PM, Timur Tabi wrote:
> On Wed, 2025-06-04 at 14:03 -0700, Jacob Keller wrote:
>> This could also be fixed by simply increasing BL_NAME_SIZE to 24, making it
>> large enough to fit any size integer into its format string, or by checking
>> the return value of snprintf.
> 
> I think this would be a better approach.  backlist_name[24] is still small enough to fit on the
> stack with ease, and it would eliminate the alloc/free churn.  kasprintf() should be reserved for
> long-term or larger allocations, IMHO.

Fair enough. Another alternative which saves the stack and macro would
be to add a new version of backlight_register_device which can pass the
integer number itself into dev_set_name, but thats probably not worth
the churn either. (Currently we snprintf into a buffer and then again
copy that again into the device name...)

Thanks,
Jake
