Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3C2A0C1C7
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 20:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CCF10E33C;
	Mon, 13 Jan 2025 19:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D6BImT4Z";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5164F10E0FC;
 Mon, 13 Jan 2025 19:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736797695; x=1768333695;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bXyjXZG/ghUStShOTq77/PPsOBMPX9n8DFuanRxBfhs=;
 b=D6BImT4Z56xLFlsUEVlxVK4GwZlvJBVU6wLtNyts35j+J2XiA5Pd8xtx
 ggUdn/ldklJimOwKzWmrZZH3GcMyrP+Rkq9KKDif7I5ofMRT59GhJQ4MB
 aNli30PkbCI2LHZygVxg0g2jGaFkjB+tIZVyihr/qoJvJWsASvnuaE+mN
 +iVlrFu8dNPDc+OuMiNFPiPHFCnF3XObNitTgubanUb+xTCU7VFP/73Id
 wLkS/ACYeyQPVGcbUubcEwOAm5vayZFuc6g4W6Xfrr8KNyMDQqhZVAqTx
 7kG6To+Zc9/YgTM7ziFxO450H8QTaf7B3lvR2604SGUHauD82vZbgZyQU A==;
X-CSE-ConnectionGUID: NCdCSJQIRGKMbsE861B2vQ==
X-CSE-MsgGUID: Uto5nAK9TnOe2uOHKAGIng==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40845785"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="40845785"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 11:48:14 -0800
X-CSE-ConnectionGUID: OhbEUkklR12jKxkqt38UrQ==
X-CSE-MsgGUID: XGz8SsK4QyqVLkeCWT0pTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104447048"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 11:48:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 11:48:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 11:48:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 11:48:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d32xHjzVFRpFfmhXpxHWsbB5tRmVBgJ6uCzTI8NAFHgQ2cpvoACyJ/L8aS/LnFDq9oufkJb70eBF4Whd3d7Vxd7BugF9IsKbqq0OzkCz1YOefZ0sny3kqrXntVJXU/YPBJx1EodOhUjsKJ+Jb8SVXShZDe4TeTMXEc8sLhClyMDRS/8G74W3wAdxLNFq+QAEPIax3eWSglgPsYG6KJ/aHn5c3y/FV05ic/BLvi36rU1HVMfOT7SZesMAxD9WMac1noL0R4Z1qW6FYF1X3BPGdra86/ShcA1lmt20dCXmceswYo6qu/B5QdUVBkXC1O++KsEHQzSwciqgpaHewJ+HOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXyjXZG/ghUStShOTq77/PPsOBMPX9n8DFuanRxBfhs=;
 b=JIBX9eC3JMNtBcxepSfQ6zvswMMPmKEuu2cj9ndfDmncmJU1DMepoyd0V0/foIMhLLTCHsBrxbT2tMHDV0/77FcAsEp5KFNH4V0vqLp8y/e0Lhnfq+sW70cJFp32SydlQP+5QtndtCe38RfQPJJI5V6UoFM384l/UIrAOQK09o+VBf2XA3mwWWv/jLuzy/E+OQ93zlTqgHPhhcYTn5o98SvizN9pS/yk+ZyfraaOsmcW7uAOhlw/tbPcqX7KW8uVY5na5xAsRXRtqjzSQbP0VZqJLTfczzTRn/bg8k/ZUmkdKRd6SLLF/nHTB2JIziMCzT52NRHHLnhl0TQO10Q/rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 19:48:10 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 19:48:10 +0000
Message-ID: <79e643c1-956f-4b43-a316-eb7e69120ebf@intel.com>
Date: Mon, 13 Jan 2025 11:48:07 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Add debug print about hw config table size
To: John Harrison <john.c.harrison@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20241221011925.3944625-1-John.C.Harrison@Intel.com>
 <27c27339-cde3-4028-99e5-deb574c091ec@intel.com>
 <16414d38-e5ae-4bc5-9b22-a2a7a928264b@intel.com>
 <5c2c8e5c-c16d-41c1-90e7-07b1ddf0f923@intel.com>
 <8eb8aa5c-2220-4426-b487-576ab813eb2c@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <8eb8aa5c-2220-4426-b487-576ab813eb2c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::9) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|PH0PR11MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c7d79b-da94-4c1b-3daa-08dd340b3527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHJ4L29EdHBnbjUweEQvOEhpNVZhTlZ4VEpaQzhlM0xyR3ZMa2pvL0FEekNP?=
 =?utf-8?B?ODdmU2FUbWZuSVpkeElPZzBRNWN5bmkzRGp5OGcvSEtHUnNWYjNSUENlcVZz?=
 =?utf-8?B?QkhUZ1ppam42RS9PeDBJNFV2ZU1rdFhlendaNTJvaDhRTXdjTk41MWRjSGFE?=
 =?utf-8?B?MGJkVHRJa1pnRXFaR0QxblZxRWY5eXB3N3RVdG9Qa1YzQkhSQWRQcXFIR25p?=
 =?utf-8?B?K0V5R2lXQ3lpUGJkcXJNaVk1WW00aFJlekVTeEx4eTE5SmtTditSdlRoT1BP?=
 =?utf-8?B?V09UYTlxL2xJR1FuMTY4NFUvK0lybG42SDIyQm5BWnlSN2UwanBuMDJvaFV0?=
 =?utf-8?B?MnlTTTBCbjhRVFVmM3V1RVNkdjVla2ZoV3hIQnRJTk85dmhjamdBVk5MeGdS?=
 =?utf-8?B?SHdndmlzMG9rMytwRWpMZ2ViNUQ3eHRRcW8rQ0ZPOWpiL0paRlNXSmx2cGJu?=
 =?utf-8?B?NkZJQmFXYkc0UVlsRVBxN2IzT241UXV0eFNvYlo4dndaODBsRmN3NE1nZ2dE?=
 =?utf-8?B?dWFCSzlwQy9jOS9ZTWd5TGRlSGRCWkFxbFc0d2hiZ1hUTjY3MHA4UTVUeFc5?=
 =?utf-8?B?WlB4WUZReXp0eHVQMENWZENQUmZkeHYwME5sMFlEdXprT012Uk1OY0FQcWVv?=
 =?utf-8?B?UUU3Szk0WEVkcGJlOGZzeWxwQkZhN3lrWi9pUVlpQlIvNnlhM3YrQUZuL0V3?=
 =?utf-8?B?dG5WSkQ2RUlNV2hyTFZkaHlKQ0k5TFlZMW1BZTNURnRvbEtYMWEwR3FtTjUw?=
 =?utf-8?B?emIzRlFhaVNtNkRYOUxiN1EvMzRhVWdMWXFrQ3pGamZCYlo1UEx2akl2SVFM?=
 =?utf-8?B?NzZRVXg4NHVlY1Vxd2piOXltbG9KL0gwTVpoZ3E1YlhlTTdjeDl1RDhyYmNu?=
 =?utf-8?B?UGkrcWIzaXUydjBuVzRUS05waFVldEhlNjhmam5VbHVTSmtwVEVld0NXblFx?=
 =?utf-8?B?NXpMWjYvZVowYlBnYjQ1U2wybEkxOCtGUWVhSDVpZnd6WEhad09rUVlJUXlY?=
 =?utf-8?B?ck9wWEh1TG9XOGpLdGZIcFEweUplOE9PNlBkV3BPaUlmTDg3L0FMbGFQalZP?=
 =?utf-8?B?QmRDTiszbTg0YitlYmp6WnRrUmdSYWxCakFMaTk5ZFpKQ3REVHllSTJ4SWZ4?=
 =?utf-8?B?WWVjS2FIQnpkanFad20ySUhmRGtUMHQ1YmVPQzAySnc0WWhDT1hiYXlXYW81?=
 =?utf-8?B?cEc2MGlEb3VBZkE1RCtaWFRVei9MUmlsMWk4U0RKcjk5R3g3TmRXSVBGRGtW?=
 =?utf-8?B?MjRHUVowSTNybDNYODA4WWhaUWVycjlWU0VkS1JIZlJPYUVkS09hSkg0Wms2?=
 =?utf-8?B?R1k0NkhqQmdWVjZYWUQzdnRyc0oxZWQrd08zMFBHZVk3dUp1ZUxGWEJVTHgy?=
 =?utf-8?B?RFQ3L2QrbWVXOHV0S3d0bE8zOXRtTURhS0RtR0hBcjlKVjUxOWVBdVhyUVo4?=
 =?utf-8?B?MHIxZmVreVFXeERRUVdlUzhwYnVXWWJUYWpWRnU2dlA0RFVpdHpCcEs5YXNN?=
 =?utf-8?B?TWlJWnBONmNtMWZwM0p1aGJ0MHVkNUVybmhORlBwOG1NWllSekxPbVNRc1lp?=
 =?utf-8?B?L29wbnVYZU05OEsyMUxHeTg3d0gxc0ZYZ2Rvck5tZTFkdm53anJmektBSnVv?=
 =?utf-8?B?WEtLMUhPWU9TR01YT0dvUnFaYlVneVZNVWNHTzZuRit6WWMyWmNXZ2plTHg5?=
 =?utf-8?B?c1k4OG5lR2RYUFdBNWpJZVNTUnN4M3RJeUN4NUZ2MkxOUzdRbXBiYW1uSUlm?=
 =?utf-8?B?V0xoa0FzNHhDenljMmltWW1ZRWJyU3ZhT09LNmFBQVJKTWJEdnF2UHV5UENO?=
 =?utf-8?B?Q3oxRitUamRJZm5YZWxKNEh1bGo0VlVDeXI3NGVMeGZ6NlhQYXZCOTl4MUJu?=
 =?utf-8?Q?Ee1KowrshwO+w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0RFcXRDYXBMTkp4bHlIOS9TdVdzOGxMQ0xkcU9BWGRhMDJUU2JjbjBiY1ky?=
 =?utf-8?B?bmJ5TUROaU12ZGNXK3hiWkJJOUEydy9tVmw4c3hTMkVTRmhSb1BYbGlWQzdz?=
 =?utf-8?B?RE00N2lNUFcxWUpnRW5zbGRBbFpIbFUyY1BhOVd5WGFDZGU0YXdXY3NHN0Jv?=
 =?utf-8?B?Z3laRmNZY3FPc3F3c3FPOGN2ZmtZTDFsZStWSE9ZbEluVWpEVktmdWlGR2hQ?=
 =?utf-8?B?L01VSWpWSzhOckJlU2tVR05maVBSRWZGVFdOTk5RSjBmNms1eDVRR05RS0pU?=
 =?utf-8?B?MjJCR1JDNmd4MGxsUWZzbHJab2ZUTW1mdGQwdUdlQWViVVQxVEQ4TWtQV1F3?=
 =?utf-8?B?MnFPb1Y2NFBNVFZhKzJGbllnZWFNalFGN3lUUjlIU0MxTUMrWnpNZmJTQkFR?=
 =?utf-8?B?Zk5qaTJNcm5QY3B4Y0t5NjFUMkZlNEI4Q3IzZmJjaGR5OEtRejIxSTg2V3E4?=
 =?utf-8?B?YzBta20yUDIvWGExS2J5MGw4MUxEZjVMUmdjR3VxZzFJL0twZ0tGdG5ZNkJh?=
 =?utf-8?B?SnBvQlc2RWtXUnhFb0d6djJoY3ZCRzJLaUdqaU5PaDgzM3dUN3R6emYrNDJN?=
 =?utf-8?B?UmxJdHp1azRpVWpVd1ZBMVpZUERyN0N3bml1TlVBZ0d3NDN2RU8wNkJndGQx?=
 =?utf-8?B?VmdQQ21NSjVVeEEyU3N6TVRTWWZNYUg4azcwaFdHNnBGZ2xCTjF0NDlHbndO?=
 =?utf-8?B?NzAwT0szRDUrQXNEbVFHLzZFL0RFcVNweEpmSjhka01OMUVCbVd2MlNpeU0x?=
 =?utf-8?B?ZmEycGxBejZYblpZKzlISGpsVWpaN2NaVXVUYmlSY21RREJIaERNMDhsZU9Q?=
 =?utf-8?B?Tzc4SFA0dVNXVGR2K3g0bUlIWk1xN2xWRUlFdEpQUlhVSjJvalc5YlhBcXdP?=
 =?utf-8?B?UGozT1JyMnZmdlVCNlltVnhZdkR5Yk1QQllPUHpKYUdRcnJSTXBubjhkdVlI?=
 =?utf-8?B?Sm50Q3NZZ1Z0cVlHMlMrNkdMZkhLYkw3SXJzbUdrTXVQNHpWUUNlYklKYzkv?=
 =?utf-8?B?MVU2QjRaSGlObUlGSlNscEdubmtaMWlpeFoyQnBQN0NLWE1ZWm5kMmROR05E?=
 =?utf-8?B?bTY4cWt6RVpyTXF0Y1B6S0RiS3U2TUdtS1R6b1czQ2VpQTd0bWZUN2dROUhQ?=
 =?utf-8?B?TzNvNkdqUlhTZVZCYktkZlNwOHRTWDZ0UkMwS2luSmMwUVcySE1ZYVRqMDJa?=
 =?utf-8?B?Yzd5b0tMR1g2NUM5QXk2dzFYVW1xVHB2M2VRS3o4ZXlCeDBveVhLc0Jyczkx?=
 =?utf-8?B?UksrWVZtTVMvSmJWaFg1VVVKN3lxbUdVL01PaTNhYnB0dTkvSDE3M3NHb25C?=
 =?utf-8?B?RDdKTEhRcXVxVTFJcEtWSWE5NHltaTRQVzhQOWN3Wi9xWDVETTREL2MrcG10?=
 =?utf-8?B?Y0tsbzNxWDVoSGk3SUtWTVI4Vnh0Ky95ZVlrS296MkJsT3QzUUIvY1YxMkRV?=
 =?utf-8?B?U0liM0Z2bGxiNVB3TlJUbCtqaEZxWmI1S0FCN2NuTjE2MnlQdE00MUhuVzhP?=
 =?utf-8?B?ZHdJK2RrN3hHTWdDMERXRHBnWmJPdjhoVi9sRDl4SEx3YlJnTFUxV3huamph?=
 =?utf-8?B?N1YxQTRva0xtci9xUnRpRlIyWUw2ZE9iOG1oYldwUWU4VmxuaVFncEtyUk9w?=
 =?utf-8?B?dlY0aGJHZnVKWEcvVHNYei9DelVDN3NUMEVDempicWxWeHZ5SzQ0ZTNCeWRX?=
 =?utf-8?B?SEVYeUFhajlodHM3b2VQbmJQaFlKOG00SktQVVlZMWxjUWg4elFjVlpiMDNi?=
 =?utf-8?B?aFNSaE5Xd2pQSm8vTWR4b0tIYldlRGxNSnV2MWkxTUdZU2VSdG1nWVQyRjZv?=
 =?utf-8?B?Rkk1ajJtdjZCYjRIU0cwcTNpR3pJMWlvWE9lZ2RnSDdxbXYycWxwZXBLRDJR?=
 =?utf-8?B?SHh6NjFJY29QVmxXR0JUU3VacWEyemRPUUs2L3R2dlBBRjFLZUJqR0VPVkpD?=
 =?utf-8?B?YVU2R3RHbGlKNk5nSFIxVEhnbGVodHBYWVZsdXQ2WXVjemJwdnZ2RktvR2pF?=
 =?utf-8?B?NnJnLzI1QkxkTXptY21wQzNRd2VhVkZIVFpIakpud2U1UnptT2hsamMrRVZD?=
 =?utf-8?B?L3VYMkNjamxaTGg1OTZuM0JXcnBLL0UyNXJRSWFRazZ5aGlpWkU3WXRyZHRp?=
 =?utf-8?B?Wk1sWGNGSmF6Y2NyMldENmFzbE1Icnp3cHZ1ZXlUM0M0ekVoU0R3bmVRRG9u?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c7d79b-da94-4c1b-3daa-08dd340b3527
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 19:48:10.0457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7ZlnfpLd9NBd5ZZQotC/85S3AmJa+TxloDYjkJLphZ5aqR1f45NIyV8pSrUA8DYp2EASD2NUKzeAQTzkBWHrYaWwId8N+WSb3JwYIt0HwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
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

Explicit printing prior to guc interaction provides the needed
information. We could always add more detailed logging of internal
state, but this seems like a fine trade-off.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

