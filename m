Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772ADB23A21
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 22:39:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB87C10E48D;
	Tue, 12 Aug 2025 20:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eoWnRIav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58C910E48D;
 Tue, 12 Aug 2025 20:39:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqwjZEVGDgTmbByB3EJlVsuoHy4jooymLwB3o3nxTzSLdOa7NudbP6wWteoOQ9bkohvGZpcF4oF+k2pdDHWSm7Rw/W0TjP4ctcapQc7H4u2r+WekZ6idwjxbMlL9xfM08fxCvF3+9UYggqeGK5txqZeePUYy6sxSFKcKkWsKWlsCxi0vNe0FHVAbwTwmuVf1o6imOzBUcwJWBHTTTDmGfxA7wa0Ge2TA6lBhvAx7Co2K9jwyXOnMJFeDNukgGMGD+AHYA01JjJpI53ah0c9Tgj1dBF8IQJp0MQJCwbf9FF5qu2I1qlx7meK1bnkUW9GX1PLwm7Lr8CwTHdqfXUyKnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkqzHGo4JRfneYnD1R4S3k8H/AS83d771KQuhqhxXVU=;
 b=OssSr/dX458TVSLe1fP8PfsFBzr+fCTGkTaR2QTPQw1Rg0oM6hlRktFSRScthBue3C/JiF8+02oFL97y5c//1nCM/2SiF8E97RRiBmAzCZIZUK0M1BTGe4w6e0euiVnij+glsdHXVAf/NRjWoFBeFpAT1libc2iU4dGq6KtzMmZAZt9NeP3d/yYErY16SAuM5pON/993S+ndN3tOKD+g6qt+APhCBCr2+NPDKF62OlzSxDZOJ7cXfWsUM/uv9AAM3tvaxRnPBHwUDnWQJctQPCKXGRSh2NnF8IE2kqdPXMvgMxumbZxFtKzkf5vKlO3mlZCvcVn/oGxsQdCMRRguSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkqzHGo4JRfneYnD1R4S3k8H/AS83d771KQuhqhxXVU=;
 b=eoWnRIavD972fJFGbqARUmcLV2wTFHNK/jqPzOVWt1qWufap1hzDbmmElHlo/i0tcw9176HbyUqONJiAPooYPVQP08izHYiipxZ4dd7oG/bGll44yFR4hHZAfk3gJTLpYlZs0gCOB1rXkBmYIM2S6GHjC9YHsq5X7AaY6/bqsUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB6818.namprd12.prod.outlook.com (2603:10b6:510:1c9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 20:39:28 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.9009.021; Tue, 12 Aug 2025
 20:39:28 +0000
Message-ID: <bdffd316-af82-4a76-8005-d5d6e32ee6d3@amd.com>
Date: Tue, 12 Aug 2025 16:39:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/14] drm/amd/display: more drm_edid to AMD display
 driver
To: Melissa Wen <mwen@igalia.com>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
References: <20250726003816.435227-1-mwen@igalia.com>
 <019ca526-5bdf-4c88-a994-a6babb9963c7@amd.com>
 <83d8ed56-2c2b-47dd-83a1-8e8f6a49fef3@igalia.com>
 <b0511344-f654-4f91-aa1a-06d7588a5db5@amd.com>
 <4e94993a-92b3-4584-bfed-468d7606830d@amd.com>
 <c399cdf9-ec3b-4162-8175-05b34d9e5042@amd.com>
 <36632017-d74f-40f9-bd78-c72e2ab2c65d@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <36632017-d74f-40f9-bd78-c72e2ab2c65d@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0479.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::19) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: bff04d99-f404-4e74-4cb9-08ddd9e05539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFI0Ymk1RzFITmJWU0htcy90NXpUNGtFcTdkbUd1RTJNZktnNkc0VFh5Wkds?=
 =?utf-8?B?RFBTOE9QcVdsRkZpT0l0TVk2UnNFb3Q3b1JyOEVBL3pEeWsrSCs5N1FQMGxp?=
 =?utf-8?B?Y3ZOVWh1bW94NmdJcCtVMUN0UUw0eEQxVkhaWGxJS1MybTJLZ1gzaWRWYzhC?=
 =?utf-8?B?bis4SDlITGJjSXlGcytWTTd0UWpFUllKRDZaVXNoNWpYK0xmMlNiVGk5Qzln?=
 =?utf-8?B?cDBMK1dDa29PMzYzZUZUaGJKekdBSjJjS0dNeWwrRWJUbHZONSs2dy8veE9o?=
 =?utf-8?B?K1g0ZGM1N1ZvbkFDOWpoYXdZejRXbFpxVmI0VnJrQUNQdnZoK2IyT3FTZVM3?=
 =?utf-8?B?TnlxYTc5RjdTTHVqdXQvc2JKdHNzRTZpd3pPOGQrSGlIcmtQZ2gycXlncHNr?=
 =?utf-8?B?dFUrdzYzYjJkYTJMczBGaXNuZStmOE5Zc3dEMXh5RzJOWFROT3ppYkc3b2ti?=
 =?utf-8?B?aGNZNEdqZFNBNEd2clYzald2VE9uUm53Vi92WGRmbzRGc2VhclVpVkZXdngv?=
 =?utf-8?B?NndvbHVHZGdDUHBwVzgwV3Riejg3OERaYkxCT2IyUmp0bFM5QS8rcEpYVnF6?=
 =?utf-8?B?cnRWVWV1QVZqbjhlMXdSOXd2T2QrL2tkWWNlMkU4TzVSYldyZVNRK2ZXNzNj?=
 =?utf-8?B?cm9HVnJMWVkwYWd4UkFRNys0bGNrclFHRWZxWG5kNFp1eFNNZmIrMmpGMEJ5?=
 =?utf-8?B?QlhtMUpIM3R4QTBuSjRrU09mNTdUOGNOQ1ZES2VSMEFZMnA4SEJwaHlHQWRF?=
 =?utf-8?B?UnJkRnA2U204Nkxjbk1tancrMFRPU1c1clEvNkNlbDFRdUdtaklBdlI2MCtL?=
 =?utf-8?B?RWZTZExkZmxMZ3ZzQU9hTmRzTEdKTlhKZzBwcjJrR1hacEdXcGhCUG5aTjNF?=
 =?utf-8?B?MzViWkJHTk55TXBicjJMeWFpSGhCc25CaWY4NWxPMVdlSTJaUkREbTg1Zitm?=
 =?utf-8?B?azVSY3g3U3JwSFBzQ3Q4Kzd4czFDOEtUQTdjQXF5akkzdnJiNEluMVE3cW8z?=
 =?utf-8?B?TFhqVkFyY1gwOHRYU09DUUpzMkpsUHdMOVl3VStQZVJucy9ueUdOaXl0by9p?=
 =?utf-8?B?b3RNSHFDQ1Y1NGNBV1cvOHFpVWxZWjMvOVd0S0pHZlNQbGdoei8xTEkvU01t?=
 =?utf-8?B?TEMxcGRpalY1dlF4aWcyT3hQV1F4WWFmRlA2MkFlM2dMV1J3Rm9PcEw5aDhM?=
 =?utf-8?B?c01kSUVMNnkrVzcydHFXeGZRUlVyREZyMUVDT2lJL2NWU0tabzVFU09mcDVn?=
 =?utf-8?B?dXUxY0djT3pyZWJUNHJOcHhFZndFVUZIcjVMOTlaMG03UTRkQUsyVzdNaDBL?=
 =?utf-8?B?UWlFODkwcHFlR1pjRkdsT3A3L2EyUWFDWWMvM1ZIM2I3cFRiWGZNcFErTWpJ?=
 =?utf-8?B?T0hRekg1Tzk0Q0xhcnArVVZUbys2K1pqRmVqejhQWUlua1BUYUF6WitmL0V5?=
 =?utf-8?B?WXVaUHUyQnk2aTBrNFl4TzlDUzFzYURVYjlhRktvNzZmV1FhSzNMaHBFS1Bs?=
 =?utf-8?B?ZFZ0bzFEbExpMjhJR3FzNUZWODdHMWtPeUdmZ2R3blljc2g2R2oyeTczRGlS?=
 =?utf-8?B?T0E5RkdXV2xpNWRMWTBzSHRCUFNRbTBxMjBzYkliVldaaUZudHBDOUorSWR6?=
 =?utf-8?B?Z1VTQ0NtVDRPK2tBR1J2Wk11Y0xGZW4rUytqR3hvMHFCOUhpclZVRXVFZk5x?=
 =?utf-8?B?ZEpSTlNlUk9ZS24vSmJzcCtnQjJVV2s3U1BwUU92eUJkME81enpwTGtScWlJ?=
 =?utf-8?B?R0I0bW5wbkN5NWVRNHV6TXphTE40TnhSTUR3UDJsNml5SXJ0SFdzMTZITWV2?=
 =?utf-8?B?dVE5Y2Y4YndST3FZV3RRUndGbWxKcHBmVmY1blpHczNUTzBpSmtwRHdzaGNu?=
 =?utf-8?B?aE5PeGJnS3FyNW5ZeHg4U21sMGsvYklvNzBmckJiYnFkYmt1dWxncC9sYlRW?=
 =?utf-8?B?Mml0R0VwYTVUTThNNVJGQ3pWQThnUVZFajh5dC81cHdFd2ZIN2FCVGpZckY1?=
 =?utf-8?B?eHlMUXR4eWZ3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SThRRU1aakJLUmcySVFvSmtQWU03TnFLNHhlWWYwVWxXTzByQ1BZeUxaT2ZU?=
 =?utf-8?B?V2E0UlZ6TThnNVJleXFOVWMwMzg0RmN3OTV0S1U1U1ZmaGR0YTJLelMzYjRN?=
 =?utf-8?B?K1BXYnkvQ3FuUEIwbm1oNnhFNjd3eC9VWExVOXpGTzYra09LYjJCZnZLUCsy?=
 =?utf-8?B?Y1NocWtXY1JjMHM5NUNqeElkQk9GT0Q4MjhnMStkNkx3TlRpNDBBZVYrdVg4?=
 =?utf-8?B?SlFmcXRCaWpHVk9wSG45cGVZdmczZ2U4Zmp4WGZPdG1OWVNYejZnaUcraU9O?=
 =?utf-8?B?YkFlZkxWYXBhdTR0UFl0WnUzc0s4NTEvYjAyTGg5b0FwR1R0UFhtZWRFQW01?=
 =?utf-8?B?NDErdkRzVzIrSjFPN09KSXZqWWczSm5nNDVwc3QwV1hqck1WTzc1MXIvUDZM?=
 =?utf-8?B?cmJoT09ob2NzeU5IUkE1OVRMQ1RMUHA1eGNwMnpGM1p4cVRRa3l4RWVKSWNM?=
 =?utf-8?B?a1doc1F2dGV3dnlINXk4S0pON2JuYkJ1SjU3d25ORWgvcENkSDdNYXp1K2xG?=
 =?utf-8?B?bjYzb3VzRnhXbjBWd05DUkEvU2VxZk13aE5QS2pRZ0o4N0MvOGJsK1EwZnJU?=
 =?utf-8?B?ZG9WU0RzY0hja3RYbkd3YkhOa1F5Y3ptb05mTmNmQ05IWTNleEUwOFYwRzZp?=
 =?utf-8?B?TVhibWQ0ZkpmQXFnYUhTdGd1TFk0ckZJTGFLV3RjSEY1VVhWeXRPazlQZ0tK?=
 =?utf-8?B?eWIraFNWenVuU0hFeTEvd3d2UjlvNEVtYVZzRlNvcW5XMTd0N09aWGZOS3I1?=
 =?utf-8?B?cHU5OU84ZXB3MmZWQkZqTTU0cTlNb3Z3RDFZb1NMQWpYOVBnSGgwUDByUDJp?=
 =?utf-8?B?OWxzd0dFVlNSU3FuTTg3dDN6MHhnNnJEK1I2V2g5YklUYTdmODNpcjJ2L1NR?=
 =?utf-8?B?bnhIU3Bpd0Nxd3VyYk0wT0NJbHI0ZjhBd1l2a3NMenpGMnpKdTlLVFVkY3M1?=
 =?utf-8?B?SEpmLzR6TlZaNUhFQi9lV1IyNEx3bldxL1kzbklXbG85WC9zUGFqMWo1VGha?=
 =?utf-8?B?ZFEwQXFrbThvRWQ2dm9UNUtPSFgvNkx3K3dWakxyR2tIc2NzNWptRFNEVlVW?=
 =?utf-8?B?cTFUWVVKeHdrNTFCUHlmS05pVy81VElCeTBTWVcrNHJ5WnFndVI3MGNMMUVy?=
 =?utf-8?B?THl4blB0MGlRbHBUMVBFN0ltbXFZWkJyakZvV3RFT0kyc0F5bGpYWEdlUkcr?=
 =?utf-8?B?cVBWenlick1HOGlXVlNXYnY0djFqVTYzYjJVVmFPcDc2ZE9xNDZLcWhQK2Nm?=
 =?utf-8?B?aGpVWGZSb0c2cER2VXZ6ZVcySHZJNkJIa0pIYjU4anExRjh5dEV5M3BweXlx?=
 =?utf-8?B?aEQ2ODdnMktpOE9YaW82T0poZDAvVXVSU0tVc0J0TE9Cdy82ajk3T0VlTzVv?=
 =?utf-8?B?Wjdpbm1CSlgrZERBMWd5Qlk0clNoR3JTZ3owQmdVWUdiRlN2amtoSGIrTU5I?=
 =?utf-8?B?WUR0R1ZOQ2hGOXdGN0RuN0EzanNhbUlETjFpdlV5WjFVcUZta1M2ekRlWkxO?=
 =?utf-8?B?Q0t1NlZ1NG9BcUUxRE9LQjk3QnFueTIybXdUUnp3b3RneTZic2M4SVF1RFVz?=
 =?utf-8?B?cjJwV3NDWUFzS25kOU9IQzNyTG1yTmtyNGdqTlI0R2dWdXczd2tQc1JVNFdx?=
 =?utf-8?B?a1lnUFZTQmE5SEdZLzhla3VzOFFJVkt1eXZQR3Y2ZDN2UDRodUV1SlE5VExx?=
 =?utf-8?B?eTVWWU00NlN3dk1XcHR6UVNFTFc2clAxVEhHM21UV3Nid2xFK05DL0lFTFhE?=
 =?utf-8?B?TlVLRWZWMCtoZXRpekdTWUhFYXZocTBqbDUzUVdTRVp1dmRpaFVNcFJRdklK?=
 =?utf-8?B?Um8rMytibHV1Q0FpeENtUFIwUGxxTGFmcUJ1Z1h6OU5Vd2pkV3o5RktiVUt1?=
 =?utf-8?B?VHRtditOakYrUkhPMlYxOHI3amxneHl0Z25ueFBpM0FqSWJLK29HbWNabTVN?=
 =?utf-8?B?bmo3QS9CN2xLNTBkU2g0ZWE1Zy9tRnFjckFXRFliVzQ3TUxkYUZjaHFqMGxo?=
 =?utf-8?B?cTdobFNZNkM0N3cyLzVhTi9EYWFIWDhpdnZXL21YbDJpQjlMMHZwblhBSk5v?=
 =?utf-8?B?ZEFRUVdTaTVqUHkwVTAyaDlQMStuYytGaW9YVG1BSGRMb2wyU1JkaGpITGcr?=
 =?utf-8?Q?oczf/6gW2kQGCaV83ot/8Da1T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff04d99-f404-4e74-4cb9-08ddd9e05539
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 20:39:28.3979 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGo+u3Q9gW8g5IQhQyNfw7+3V6z4maTTABvMp6leDLyiGN8HaVRHGzqf7LbeAn9erocUffP5YhrGi+OXtrcE2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6818
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



On 2025-08-11 17:47, Melissa Wen wrote:
> 
> 
> On 11/08/2025 18:26, Harry Wentland wrote:
>>
>> On 2025-08-11 17:09, Limonciello, Mario wrote:
>>> On 8/11/25 4:08 PM, Hung, Alex wrote:
>>>> Melissa,
>>>>
>>>> The patchset passed promotion and CI.
>>>>
>>>> However, since our DC code is shared with the other OS, calling drm_*
>>>> functions in DC won't work for us. For example, calling
>>>> dc_edid_copy_edid_to_sink from dc/link/link_detection.c in patch 14.
>>>>
>>>> I don't have a good way to handle it. Does it make sense not to touch DC
>>>> code for now?
>>> What about if we have a set of compatibility macros in DC code?
>>>
>>> Something like this:
>>>
>>> #ifndef drm_dbg
>>> #define drm_dbg ....
>>> #endif
>> DC should stay OS-agnostic. No DRM concepts in DC please.
> 
> Yes, and that is exactly the reason for "[PATCH v6 10/14] drm/amd/display: add a mid-layer file to handle EDID in DC" (https://lore.kernel.org/amd-gfx/20250726003816.435227-11-mwen@igalia.com/).
> 
> DC code still handles raw EDID data and drivers handling raw EDID is exactly what we are trying to remove from DRM. But with the current implementation of the AMD driver, we cannot remove it without touching DC code. The thing is, if we stop handle raw EDID in the DM layer, we cannot pass this data to DC and vice-versa.
> So the proposal with patch 10 (and follow-up patches) is creating different dc_edid files, one for linux and another for different platforms.
>>
>> Why the need to change dc_edid_is_same_edid?
> 
> The linux file is done in this series by reimplementing the DC functions that handles raw EDID, like dc_edid_is_same_edid, with drm_edid helpers. The file for other platforms can be the original functions without these changes.
> In fact, there is a step that should be done by AMD people because we don't handle other platforms. It should be somewhat similar to the DC FPU isolation code.
> 
> If it's not possible for any reasons, could you share with us some suggestions on how to address this issue?
> 

I don't have a ton of bandwidth to get too deeply into this
but we'll have someone look at that and see how we can make
it work.

I'll be on vacation starting next Monday for two weeks but
I can have a look, if needed, some time in September.

Harry

> Thanks in advance,
> 
> Melissa
> 
>>
>> I'll comment directly on the patch.
>>
>> Harry
>>
>>>> On 8/11/25 13:40, Melissa Wen wrote:
>>>>>
>>>>> On 28/07/2025 20:29, Alex Hung wrote:
>>>>>> Thanks. I will send v6 to promotion test.
>>>>> Hi Alex,
>>>>>
>>>>> Any news about this round of tests?
>>>>>
>>>>> BR,
>>>>>
>>>>> Melissa
>>>>>
>>>>>> On 7/25/25 18:33, Melissa Wen wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Siqueira and I have been working on a solution to reduce the usage of
>>>>>>> drm_edid_raw in the AMD display driver, since the current guideline in
>>>>>>> the DRM subsystem is to stop handling raw edid data in driver-specific
>>>>>>> implementation and use opaque `drm_edid` object with common-code
>>>>>>> helpers.
>>>>>>>
>>>>>>> To keep DC as an OS-agnostic component, we create a mid layer that
>>>>>>> isolates `drm_edid` helpers called in the DC code, while allowing other
>>>>>>> OSes to implement their specific implementation.
>>>>>>>
>>>>>>> This work is an extension of [1].
>>>>>>>
>>>>>>> - Patch 1 addresses a possible leak added by previous migration to
>>>>>>>     drm_edid.
>>>>>>> - Patch 2 allocates a temporary drm_edid from raw edid for parsing.
>>>>>>> - Patches 3-7 use common-code, drm_edid helpers to parse edid
>>>>>>>     capabilities instead of driver-specific solutions. For this, patch 4
>>>>>>>     introduces a new helper that gets monitor name from drm_edid.
>>>>>>> - Patches 8-9 are groundwork to reduce the noise of Linux/DRM specific
>>>>>>>     code in the DC shared code
>>>>>>> - Patch 10 creates a mid layer to make DC embraces different ways of
>>>>>>>     handling EDID by platforms.
>>>>>>> - Patch 11 move open-coded management of raw EDID data to the mid
>>>>>>>     layer created before.
>>>>>>> - Patch 12 introduces a helper that compares EDIDs from two drm_edids.
>>>>>>> - Patch 13 adds drm_edid to dc_sink struct and a mid-layer helper to
>>>>>>>     free `drm_edid`.
>>>>>>> - Patch 14 switch dc_edid to drm_edid across the driver in a way that
>>>>>>>     the DC shared code is little affected by Linux specific stuff.
>>>>>>>
>>>>>>> [v1] https://lore.kernel.org/dri-devel/20250411201333.151335-1-
>>>>>>> mwen@igalia.com/
>>>>>>> Changes:
>>>>>>> - fix broken approach to get monitor name from eld (Jani)
>>>>>>>     - I introduced a new helper that gets monitor name from drm_edid
>>>>>>> - rename drm_edid_eq to drm_edid_eq_buf and doc fixes (Jani)
>>>>>>> - add NULL edid checks (Jani)
>>>>>>> - fix mishandling of product_id.manufacturer_name (Michel)
>>>>>>>     - I directly set it to manufacturer_id since sparse didn't complain.
>>>>>>> - add Mario's r-b in the first fix patch and fix commit msg typo.
>>>>>>>
>>>>>>> [v2] https://lore.kernel.org/dri-devel/20250507001712.120215-1-
>>>>>>> mwen@igalia.com/
>>>>>>> Changes:
>>>>>>> - kernel-doc and commit msg fixes (Jani)
>>>>>>> - use drm_edid_legacy_init instead of open coded (Jani)
>>>>>>> - place drm_edid new func into the right section (Jani)
>>>>>>> - paramenter names fix (Jani)
>>>>>>> - add Jani's r-b to the patch 12
>>>>>>> - remove unnecessary include (Jani)
>>>>>>> - call dc_edid_sink_edid_free in link_detection, instead of
>>>>>>> drm_edid_free
>>>>>>> - rebase on top of asdn
>>>>>>>
>>>>>>> [v3] https://lore.kernel.org/dri-devel/20250514202130.291324-1-
>>>>>>> mwen@igalia.com/
>>>>>>> Changes:
>>>>>>> - rebase to asdn
>>>>>>> - some kernel-doc fixes
>>>>>>> - move some changes to the right commit
>>>>>>>
>>>>>>> [v4] https://lore.kernel.org/amd-gfx/20250613150015.245917-1-
>>>>>>> mwen@igalia.com/
>>>>>>> Changes:
>>>>>>> - fix comments and commit messages (Mario)
>>>>>>> - remove unnecessary drm_edid dup and fix mem leak (Mario)
>>>>>>> - add Mario's rb to patches 5-7
>>>>>>>
>>>>>>> [v5] https://lore.kernel.org/amd-gfx/20250618152216.948406-1-
>>>>>>> mwen@igalia.com/
>>>>>>> Changes:
>>>>>>> - fix NULL pointer dereference (Alex H.) with the same approach
>>>>>>> proposed
>>>>>>>     by 7c3be3ce3dfae
>>>>>>>
>>>>>>> --->
>>>>>>> There are three specific points where we still use drm_edid_raw() in
>>>>>>> the
>>>>>>> driver:
>>>>>>> 1. raw edid data for write EDID checksum in DP_TEST_EDID_CHECKSUM via
>>>>>>>      drm_dp_dpcd_write(), that AFAIK there is no common code solution
>>>>>>> yet;
>>>>>>> 2. open-coded connectivity log for dc link detection, that maybe can be
>>>>>>>      moved to drm (?);
>>>>>>> 3. open-coded parser that I suspect is a lot of duplicated code, but
>>>>>>>      needs careful examining.
>>>>>>>
>>>>>>> I suggest to address those points in a next phase for regression
>>>>>>> control.
>>>>>>>
>>>>>>> [1] https://lore.kernel.org/amd-gfx/20250308142650.35920-1-
>>>>>>> mwen@igalia.com/
>>>>>>>
>>>>>>> Let me know yours thoughts!
>>>>>>>
>>>>>>> Melissa
>>>>>>>
>>>>>>> Melissa Wen (12):
>>>>>>>     drm/amd/display: make sure drm_edid stored in aconnector doesn't
>>>>>>> leak
>>>>>>>     drm/amd/display: start using drm_edid helpers to parse EDID caps
>>>>>>>     drm/amd/display: use drm_edid_product_id for parsing EDID product
>>>>>>> info
>>>>>>>     drm/edid: introduce a helper that gets monitor name from drm_edid
>>>>>>>     drm/amd/display: get panel id with drm_edid helper
>>>>>>>     drm/amd/display: get SAD from drm_eld when parsing EDID caps
>>>>>>>     drm/amd/display: get SADB from drm_eld when parsing EDID caps
>>>>>>>     drm/amd/display: simplify dm_helpers_parse_edid_caps signature
>>>>>>>     drm/amd/display: change DC functions to accept private types for
>>>>>>> edid
>>>>>>>     drm/edid: introduce a helper that compares edid data from two
>>>>>>> drm_edid
>>>>>>>     drm/amd/display: add drm_edid to dc_sink
>>>>>>>     drm/amd/display: move dc_sink from dc_edid to drm_edid
>>>>>>>
>>>>>>> Rodrigo Siqueira (2):
>>>>>>>     drm/amd/display: add a mid-layer file to handle EDID in DC
>>>>>>>     drm/amd/display: create a function to fill dc_sink with edid data
>>>>>>>
>>>>>>>    .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   1 +
>>>>>>>    .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  33 +++---
>>>>>>>    .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 109 ++++++
>>>>>>> +-----------
>>>>>>>    .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  21 ++--
>>>>>>>    .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   |  39 +++++++
>>>>>>>    .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  15 +++
>>>>>>>    .../drm/amd/display/dc/core/dc_link_exports.c |   9 +-
>>>>>>>    drivers/gpu/drm/amd/display/dc/core/dc_sink.c |   3 +
>>>>>>>    drivers/gpu/drm/amd/display/dc/dc.h           |  10 +-
>>>>>>>    drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   7 +-
>>>>>>>    drivers/gpu/drm/amd/display/dc/inc/link.h     |   9 +-
>>>>>>>    .../drm/amd/display/dc/link/link_detection.c  |  30 ++---
>>>>>>>    .../drm/amd/display/dc/link/link_detection.h  |   9 +-
>>>>>>>    drivers/gpu/drm/bridge/sil-sii8620.c          |   2 +-
>>>>>>>    drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +-
>>>>>>>    drivers/gpu/drm/drm_edid.c                    |  54 +++++++--
>>>>>>>    include/drm/drm_edid.h                        |  10 +-
>>>>>>>    17 files changed, 199 insertions(+), 164 deletions(-)
>>>>>>>    create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>>>>>>>    create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
>>>>>>>
> 

