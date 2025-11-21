Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14354C7A63E
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6863010E8A3;
	Fri, 21 Nov 2025 15:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hs2m8w8r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010055.outbound.protection.outlook.com [52.101.46.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB7D10E8A3;
 Fri, 21 Nov 2025 15:06:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HaLWE4dIiTo5cWoBktbc9lMNIWl9Dqk2PUB9QfIMoPL0umR3sCFBO56kTItEAtBObP4NnHgkxeqFM+swNIRoK225kkjJ1cuuGtp+6LgKkWGRLfQmVgiT9PjWx4njztO6nZ8Gk3C5lEcL4EKx58x7z2irYbbexH9lELHeZ+WuGdOqr8gWVuuzG38bHNsT7PXvf/rHcclVsN6u8kX9Le3elRfOzNpL9TnxB5a5RsFiBvPUW6Ip4I7rywJLruVhXBHGyk75VERkg57/JNlt5SRICkwwziS/a2ifzBZP4A7VD9F51zXy4voRM4+oxhhi3qsH5ZtxMxFPuacBFdKhCNmvoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJ7ZswYDkuylY9F9iASnKfpbyYhEWxRl0TjB7+Mnj/Q=;
 b=EBGDNl6DdAeUzAe7kgTZXmTt3sjkr7QtDxxFjLdRA7HcNMFY6AsVdkf7B8OymeKchC/Z9R9RoqG7VBP+F9fWuiuBUiawaqGPhg4zWLPNJzhUyIoRdjQPxDqEhqLnXVMcUkBo+45eKfoK/5lssGk2IalZIfDi35LqgE5ZnYnB2MAk/XujEKuLggxMjr1oa7A0cCUm4OnhIgkgxJSq3BtL9D1Z6/F7uWoSZSE33bI5pVpgfFbkV+zok14D9oO8/cg6I9euyQNkpu43hDTEyFtRrXYCYwDi+qKfS5zIiZfI/DAp+3V/pm9hfMtbpEtEIJMyRv6ZUhfgmUuYgtPXcj+0rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJ7ZswYDkuylY9F9iASnKfpbyYhEWxRl0TjB7+Mnj/Q=;
 b=Hs2m8w8rYYydm+Bfsb16u93b6gmyGln+0uxjBxN/IKJIX9JFIhC4cVQNntUI8sTe6bc/f/35J5/xSnAHPRFmVohBkrgRgpYrXdnm1W8gXL9gZB5NwnZHmPPYf9UJThPACnH7KHfC18JjzEbUneyoubXe+WjSi3XTgEjrTe6TzTU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:06:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 15:06:04 +0000
Message-ID: <0dbd6677-0ce6-495c-83d5-09bc3c0d6f2e@amd.com>
Date: Fri, 21 Nov 2025 16:05:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 17/28] drm/amdgpu: introduce
 amdgpu_sdma_set_vm_pte_scheds
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-18-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-18-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0132.apcprd02.prod.outlook.com
 (2603:1096:4:188::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: 7786119f-5e12-4418-2ba7-08de290f7dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3doWUpXZG42eHo4blJWMDVLaGNNVHk5NHBlOWE5dDlxYVlsZWFFVWVzb1kx?=
 =?utf-8?B?M2JXc3FrTEo4WUN6eXllaGU2R3VEK2s3OVNUOExSYitsV3hlNUZ1bXBGbkV4?=
 =?utf-8?B?dGRUN0E3S0Z6VHJOcmpPY2JwSUUvRDhvVXlBNG5GeFRuY0YxWnJSUldQQVZz?=
 =?utf-8?B?b2RsLzI2a3psVzdOQ0lTWmUyNGMxVUpLK2J2WitTM2hVenlLWFc2VXByUWlU?=
 =?utf-8?B?eWpxS0daS2ZRVS9oMEp4ZWtyZnQxakdMb2tKUGpCMmJPSVBiWmVKL1hLSnRj?=
 =?utf-8?B?bVVwczNsL1lCQzJIaFRRbXA2c3hnOURsN1REcFZ5eHVVTlhnWktkN1AzVG84?=
 =?utf-8?B?WWNFUTZxZVM2aEs0MWRjQ0F3VFI3R1pwYUtOZmJDaEdIL1JXV3VZa2ZVQXEx?=
 =?utf-8?B?UjNrNkhyanZEcldkMzgwMXhLSEY4K1JRRWtVL05LdjNCeXVTSmJuWTVlQktV?=
 =?utf-8?B?TG9ERFpGdEFmdFFJMFJRTjI3emZOMU0wd3ZSODFFZ3JzZ2NXZ2E0TGlzbk9T?=
 =?utf-8?B?TkZpV3JRVHNwaTdJZmIxVU1NblgvcE5oZzdNQzE4T0loVUNlck1MUzRIOHFW?=
 =?utf-8?B?b0p6d0dIOS9oY0JuWUtWQWxjY29lclJWU1JKRXdqWDNEQ2JCZzBKU2NHcXVU?=
 =?utf-8?B?R1FpYlJSbXh0Z3lZOUFScFJrOFN0b1VyRmVmYmNjZG15Q0hMSW5SSGQrVU5m?=
 =?utf-8?B?blp5TGRPbllKdkhpRGU1VVlwYzhxK3hmQnlCV21BVjNhRG5OSDY1WHZzL0Jk?=
 =?utf-8?B?alNBSjNFVHg1M2hHNDRtbEExYWZ2WUNPVjlVVkE3YVJGOHVjMUR5VU9IM2lO?=
 =?utf-8?B?dnZCdWg1NW02UkNUcG9vTWE4VU54bkM0SXo2Q0tpUjdaR2lGT2UxQkd0NUto?=
 =?utf-8?B?eVVLb0IzcmZtUjlNUlpBQjJZenlyWGxOZWdGaURpd3RMblNmY0ZOQUVsbmV1?=
 =?utf-8?B?a25YbzROSklhYVk0Z0lnRmZ0WVpqdjJNbXlvNzZEY3ZRaEkrM0crMSttNzNN?=
 =?utf-8?B?MXRCekdGeGZGQW93b1FDS0dQeDVxVEVFbkZlM1JwYmJpNllaZmZWZzZYMFgy?=
 =?utf-8?B?T1hLT3VPdmNBU0duRlJIT01yNTZZT0MvQ1BvRW8zNXlYcUk5djVvakpNNE5S?=
 =?utf-8?B?SUdDT3YydlM0Z3BaSStNcmY3eEdZOXBDZm1kWERFeFl0K3RNVTV5ZGg0aEZr?=
 =?utf-8?B?Y3JGTnR3bDBvNzFhOXFrVDNhZWVpLzA5ejBSYUxpS1creTdYbGxMOVJoRmE0?=
 =?utf-8?B?cytRT2xueFVYTkxqemZDRHNqMGsyTVZKWnVzSTQrSEtDWDVabE5ZS0srSjd4?=
 =?utf-8?B?REtFeTE0MnY4Rlp6VDdEWWJVYmIwekowcEJVQ01uZ2x2OUl0Zjl6d2pwTHBq?=
 =?utf-8?B?Qkh6UDRWQk4wKzR6NHNxb3RCWGdkNWlyUmo1aW9RQ0ppWGNTQm1qbHhHMFJq?=
 =?utf-8?B?TlV5RThSOFVraUh6UU1DcXJKMUthdEhYcUFyaEE2ajFxakNSSW80T21xTjM5?=
 =?utf-8?B?T3gzSWNFY3c4SkU1NEhiS0lObjhJZUxkMzB1eEl4WWVOeXYzZEVEUUt6My85?=
 =?utf-8?B?Z2J5ZlBaUU1PRXg5V0ExMThJVERVRC9KZ2pRbzQxaCtCOVhMa3lRankwcGs3?=
 =?utf-8?B?MmpFSXc3YTQ3amdCaCtTdEhFSHlYanpCVUEzNVI3Ym4vRi85NkZFM1RDQzBD?=
 =?utf-8?B?Y1JpVkJ6SjNQRm5Sa2U2bnhkcitrTm5DUkRPK2hIdld6UEJxTkFMNUhLWHRI?=
 =?utf-8?B?eTZ2RFM4VzJiY29rZ1BMMms3ZzNzV3dLSmRRREZEL3kvK2JPZi81RlJVaTVL?=
 =?utf-8?B?NHlESWtIRnhPcTY1bk1lSysycWsvMVIxQ3VnSk1zcy90SHhBZnZBTnlOQng2?=
 =?utf-8?B?bjRMTnlTcnFvRlhneXdTbEdwSWJoS09zQ1RmWGxMbmhab3F0T255RUhkN3li?=
 =?utf-8?Q?dv9DkFGghSimBr8fYSzV552uhR2rDdg3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEpoaytrSkcvYStLSnkrVkt5UzlERVo1bUM1aG83K0RMQXdZOHJ6a0dkWDJQ?=
 =?utf-8?B?b0VpaFNSU0xJK1FueiszNXZyUzRJYmRYdlNuQ3hpUVFmZmV0NFVPTWgzaVRQ?=
 =?utf-8?B?UERhUXVrTEw4VUJVdEpvWTk4WnJyRFd5THpMZjlkZGxCcmlRUFdCUEFYWnd5?=
 =?utf-8?B?L3pDbVQrS01NYms2TEJlQWhxL2tWUXRDWVNGVlNyYkRUTkJFWTJ2MjdMUHpI?=
 =?utf-8?B?QlVDOGVSamJVTThHQlFKbkk1TUMwckJWMGdRbEdEUytlYzU0QUY1UXR4emZ0?=
 =?utf-8?B?bi80WUpHMVJFTjFtbmJIQlNJVlhpS3lSRlVSZy8xMXVwNUZrdUp3YjFGZm9U?=
 =?utf-8?B?QmdrVXBodFVRdzI5NklIN2hPb0lOVDErMEF5dWdxaEZlR3BianlHRTBEc0V6?=
 =?utf-8?B?NTRMdWJCTHF4bzVuRlN4TzFEZmxZempXdWJETnhhSU1EdGhQM1FJZ0xNVVho?=
 =?utf-8?B?MVg2YXdkcng1K3NmR1liN2k3bWFpV2pFWEU1N1JwNmM3NkhNOW9ldWh2REQ3?=
 =?utf-8?B?dlZYNTZLaFB6ejhYcUp3Q1gwVkYzV1hMd0p4WjNYZUZjTWFKNXZya1VWMzBz?=
 =?utf-8?B?YVV1alFxSVBYNHYzdVEzaGR3WkVEdGZIQU8rbmp3djlqMUtQcEFxcUg1RzBv?=
 =?utf-8?B?Wjl6b1BkWkh4WWs0RTJGOEtiY1BZQlRaL2xrckdMbTRJSFBGdE5VR0FoRjhW?=
 =?utf-8?B?eVJyY0VJNk41djBObWhTZm5NZ3ZwUytUYTBnT1JObXBhM3hBV0xjTitxaTdE?=
 =?utf-8?B?aStSNEtGRWliOCsveDBjWTJldW1nNE95MCtDSG5RSVZLZzhReUJHL2UvZSs4?=
 =?utf-8?B?MmRNOXN0RC95RG93VmhVTk1oTjR0VTUyUUhjTTRXTG9uY0JvaVlXRTJWSnpJ?=
 =?utf-8?B?VWwrYXJ0UVlhaHVEVXMyMGowTEpYQSs1VW5STWFWN3BOK0U1VXd1aWZ5eWdW?=
 =?utf-8?B?TWx0WitPaTFadjZlYVptMXJJMXhRMmxlczVpbEdkQXNhcDJrbDljRURXcm9H?=
 =?utf-8?B?ZVBzbW1EOTZXOXkxRjFUQ2RJcm1PNE5oMlRoRHRrL3NING1CY1RFZWxwTElI?=
 =?utf-8?B?YmRocmx1Tng1N2JLVmJQVUlNSjgwUEhNSGFScDFSZ2VBWnNlQTF5NEdmdUNZ?=
 =?utf-8?B?TktBUno0V29maXB6QTNPbSt5ZUN3Y2tZVzJqMkhGWXpOWmhyRzZTWVdEVmJh?=
 =?utf-8?B?M2U2NDlZRzdwV1VWd1hVa29zelJIQ1ZXNE9tUG5LSnJDdWZIbzNzeUppNnpB?=
 =?utf-8?B?bGxDaDlnTWJiMVA4RGZCMDFNSWZjcWxUNHh4QVN6TnhHaEsxL2VONkpEeGMz?=
 =?utf-8?B?czlRdEdVbXZScE1heXNoYThZYTBDbGFsL1NFVzIxb285dWtRbEdNN3VEdDNn?=
 =?utf-8?B?T1dwdnZyOE1QTjVpL0xGK3hFTWNnS1cxdUx4azZuT3ZkMlhDaW1JejZGTjdQ?=
 =?utf-8?B?SUhLSWJOTVRnSDg4Ym9va3pnUjJkemtrcjhFOUNzaHFFTjVic0dYUWVxT00x?=
 =?utf-8?B?MkcrSFRpS2Yzb0oyUldiRXo2WXBJVS9WM3JYcXNQeFBWRENnd2NHcE9taUhI?=
 =?utf-8?B?VkRJWUN6YitCM1dhdHE4MzAzalFEVjFCZVhtMlo3SGpwdlNkcmZUSTRYN05s?=
 =?utf-8?B?ZGlDeTdrS2xFQ2JBTFZWSEo0NmkvTlh6bE9VbXVIR2wvQkQ5a2Mxb3hoSEd3?=
 =?utf-8?B?clo5ZWNsNzBqSS9pc0Q0ZWg3OG5JOFo0Tjg0Nm8xL0dwajh4SHlDVGM3Q3hV?=
 =?utf-8?B?dEtLbkdKK1JuMUkya3RTa1dYZVNURXcvZGNCUXoyRFJRc1gyMGY5S1grU0Vx?=
 =?utf-8?B?bVJnR0piVTdDaHVnSXgwS08ydUplaFZ3N1VlZFVSQ09yWXJ3azRjVHA1TTNQ?=
 =?utf-8?B?TExVWFZpYXVJR2M2V3FVMG94K0V0UG9pejBSMHIwQ0xwU1VaY0RjbSs4N0pQ?=
 =?utf-8?B?blViL1liallYb3J1MHdQVE9iV1I5cVFsWTljWEVFT1BScVNHcUtCdVZJNmdE?=
 =?utf-8?B?dGpkNlBkblBsVTI2SHg3cWhnd3VmdjJFRkxpbGJETWJpUGhxUHJOYkNXSTg4?=
 =?utf-8?B?czNJMkEyYWpRdmlBVk5nMHBJMEd6NkVUbnVYa1lsKzZWMmZkNW01dlNKU2N3?=
 =?utf-8?Q?gstom5BibmaZiHrKlhhPxSCH0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7786119f-5e12-4418-2ba7-08de290f7dac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:06:04.6411 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmK32JE04ocONXgrKWl/pvEmvWaJqHmSYuzU8BiQ1fCeHB455dqco3ZlGneh2pJ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6420
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

On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
> All sdma versions used the same logic, so add a helper and move the
> common code to a single place.
> 
> ---
> v2: pass amdgpu_vm_pte_funcs as well
> v3: drop all the *_set_vm_pte_funcs one liners
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h      |  2 ++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c   | 17 ++++++++++++
>  drivers/gpu/drm/amd/amdgpu/cik_sdma.c    | 31 ++++++---------------
>  drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c   | 31 ++++++---------------
>  drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c   | 31 ++++++---------------
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c   | 35 ++++++------------------
>  drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c | 35 ++++++------------------
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c   | 31 ++++++---------------
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c   | 31 ++++++---------------
>  drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c   | 29 ++++++--------------
>  drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c   | 29 ++++++--------------
>  drivers/gpu/drm/amd/amdgpu/si_dma.c      | 31 ++++++---------------
>  12 files changed, 105 insertions(+), 228 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> index 790e84fec949..a50e3c0a4b18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1612,6 +1612,8 @@ struct dma_fence *amdgpu_device_enforce_isolation(struct amdgpu_device *adev,
>  bool amdgpu_device_has_display_hardware(struct amdgpu_device *adev);
>  ssize_t amdgpu_get_soft_full_reset_mask(struct amdgpu_ring *ring);
>  ssize_t amdgpu_show_reset_mask(char *buf, uint32_t supported_reset);
> +void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
> +				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs);
>  
>  /* atpx handler */
>  #if defined(CONFIG_VGA_SWITCHEROO)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 193de267984e..5061d5b0f875 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -3228,3 +3228,20 @@ void amdgpu_vm_print_task_info(struct amdgpu_device *adev,
>  		task_info->process_name, task_info->tgid,
>  		task_info->task.comm, task_info->task.pid);
>  }
> +
> +void amdgpu_sdma_set_vm_pte_scheds(struct amdgpu_device *adev,
> +				   const struct amdgpu_vm_pte_funcs *vm_pte_funcs)
> +{
> +	struct drm_gpu_scheduler *sched;
> +	int i;
> +
> +	for (i = 0; i < adev->sdma.num_instances; i++) {
> +		if (adev->sdma.has_page_queue)
> +			sched = &adev->sdma.instance[i].page.sched;
> +		else
> +			sched = &adev->sdma.instance[i].ring.sched;
> +		adev->vm_manager.vm_pte_scheds[i] = sched;
> +	}
> +	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> +	adev->vm_manager.vm_pte_funcs = vm_pte_funcs;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> index 9e8715b4739d..22780c09177d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/cik_sdma.c
> @@ -53,7 +53,6 @@ static const u32 sdma_offsets[SDMA_MAX_INSTANCE] =
>  static void cik_sdma_set_ring_funcs(struct amdgpu_device *adev);
>  static void cik_sdma_set_irq_funcs(struct amdgpu_device *adev);
>  static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev);
> -static void cik_sdma_set_vm_pte_funcs(struct amdgpu_device *adev);
>  static int cik_sdma_soft_reset(struct amdgpu_ip_block *ip_block);
>  
>  u32 amdgpu_cik_gpu_check_soft_reset(struct amdgpu_device *adev);
> @@ -919,6 +918,14 @@ static void cik_enable_sdma_mgls(struct amdgpu_device *adev,
>  	}
>  }
>  
> +static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
> +	.copy_pte_num_dw = 7,
> +	.copy_pte = cik_sdma_vm_copy_pte,
> +
> +	.write_pte = cik_sdma_vm_write_pte,
> +	.set_pte_pde = cik_sdma_vm_set_pte_pde,
> +};
> +
>  static int cik_sdma_early_init(struct amdgpu_ip_block *ip_block)
>  {
>  	struct amdgpu_device *adev = ip_block->adev;
> @@ -933,7 +940,7 @@ static int cik_sdma_early_init(struct amdgpu_ip_block *ip_block)
>  	cik_sdma_set_ring_funcs(adev);
>  	cik_sdma_set_irq_funcs(adev);
>  	cik_sdma_set_buffer_funcs(adev);
> -	cik_sdma_set_vm_pte_funcs(adev);
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &cik_sdma_vm_pte_funcs);
>  
>  	return 0;
>  }
> @@ -1337,26 +1344,6 @@ static void cik_sdma_set_buffer_funcs(struct amdgpu_device *adev)
>  	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
>  }
>  
> -static const struct amdgpu_vm_pte_funcs cik_sdma_vm_pte_funcs = {
> -	.copy_pte_num_dw = 7,
> -	.copy_pte = cik_sdma_vm_copy_pte,
> -
> -	.write_pte = cik_sdma_vm_write_pte,
> -	.set_pte_pde = cik_sdma_vm_set_pte_pde,
> -};
> -
> -static void cik_sdma_set_vm_pte_funcs(struct amdgpu_device *adev)
> -{
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &cik_sdma_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -}
> -
>  const struct amdgpu_ip_block_version cik_sdma_ip_block =
>  {
>  	.type = AMD_IP_BLOCK_TYPE_SDMA,
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> index 92ce580647cd..0090ace49024 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v2_4.c
> @@ -51,7 +51,6 @@
>  
>  static void sdma_v2_4_set_ring_funcs(struct amdgpu_device *adev);
>  static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev);
> -static void sdma_v2_4_set_vm_pte_funcs(struct amdgpu_device *adev);
>  static void sdma_v2_4_set_irq_funcs(struct amdgpu_device *adev);
>  
>  MODULE_FIRMWARE("amdgpu/topaz_sdma.bin");
> @@ -809,6 +808,14 @@ static void sdma_v2_4_ring_emit_wreg(struct amdgpu_ring *ring,
>  	amdgpu_ring_write(ring, val);
>  }
>  
> +static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
> +	.copy_pte_num_dw = 7,
> +	.copy_pte = sdma_v2_4_vm_copy_pte,
> +
> +	.write_pte = sdma_v2_4_vm_write_pte,
> +	.set_pte_pde = sdma_v2_4_vm_set_pte_pde,
> +};
> +
>  static int sdma_v2_4_early_init(struct amdgpu_ip_block *ip_block)
>  {
>  	struct amdgpu_device *adev = ip_block->adev;
> @@ -822,7 +829,7 @@ static int sdma_v2_4_early_init(struct amdgpu_ip_block *ip_block)
>  
>  	sdma_v2_4_set_ring_funcs(adev);
>  	sdma_v2_4_set_buffer_funcs(adev);
> -	sdma_v2_4_set_vm_pte_funcs(adev);
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v2_4_vm_pte_funcs);
>  	sdma_v2_4_set_irq_funcs(adev);
>  
>  	return 0;
> @@ -1232,26 +1239,6 @@ static void sdma_v2_4_set_buffer_funcs(struct amdgpu_device *adev)
>  	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
>  }
>  
> -static const struct amdgpu_vm_pte_funcs sdma_v2_4_vm_pte_funcs = {
> -	.copy_pte_num_dw = 7,
> -	.copy_pte = sdma_v2_4_vm_copy_pte,
> -
> -	.write_pte = sdma_v2_4_vm_write_pte,
> -	.set_pte_pde = sdma_v2_4_vm_set_pte_pde,
> -};
> -
> -static void sdma_v2_4_set_vm_pte_funcs(struct amdgpu_device *adev)
> -{
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v2_4_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -}
> -
>  const struct amdgpu_ip_block_version sdma_v2_4_ip_block = {
>  	.type = AMD_IP_BLOCK_TYPE_SDMA,
>  	.major = 2,
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> index 1c076bd1cf73..2526d393162a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v3_0.c
> @@ -51,7 +51,6 @@
>  
>  static void sdma_v3_0_set_ring_funcs(struct amdgpu_device *adev);
>  static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev);
> -static void sdma_v3_0_set_vm_pte_funcs(struct amdgpu_device *adev);
>  static void sdma_v3_0_set_irq_funcs(struct amdgpu_device *adev);
>  
>  MODULE_FIRMWARE("amdgpu/tonga_sdma.bin");
> @@ -1082,6 +1081,14 @@ static void sdma_v3_0_ring_emit_wreg(struct amdgpu_ring *ring,
>  	amdgpu_ring_write(ring, val);
>  }
>  
> +static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
> +	.copy_pte_num_dw = 7,
> +	.copy_pte = sdma_v3_0_vm_copy_pte,
> +
> +	.write_pte = sdma_v3_0_vm_write_pte,
> +	.set_pte_pde = sdma_v3_0_vm_set_pte_pde,
> +};
> +
>  static int sdma_v3_0_early_init(struct amdgpu_ip_block *ip_block)
>  {
>  	struct amdgpu_device *adev = ip_block->adev;
> @@ -1102,7 +1109,7 @@ static int sdma_v3_0_early_init(struct amdgpu_ip_block *ip_block)
>  
>  	sdma_v3_0_set_ring_funcs(adev);
>  	sdma_v3_0_set_buffer_funcs(adev);
> -	sdma_v3_0_set_vm_pte_funcs(adev);
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v3_0_vm_pte_funcs);
>  	sdma_v3_0_set_irq_funcs(adev);
>  
>  	return 0;
> @@ -1674,26 +1681,6 @@ static void sdma_v3_0_set_buffer_funcs(struct amdgpu_device *adev)
>  	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
>  }
>  
> -static const struct amdgpu_vm_pte_funcs sdma_v3_0_vm_pte_funcs = {
> -	.copy_pte_num_dw = 7,
> -	.copy_pte = sdma_v3_0_vm_copy_pte,
> -
> -	.write_pte = sdma_v3_0_vm_write_pte,
> -	.set_pte_pde = sdma_v3_0_vm_set_pte_pde,
> -};
> -
> -static void sdma_v3_0_set_vm_pte_funcs(struct amdgpu_device *adev)
> -{
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v3_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			 &adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -}
> -
>  const struct amdgpu_ip_block_version sdma_v3_0_ip_block =
>  {
>  	.type = AMD_IP_BLOCK_TYPE_SDMA,
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> index f38004e6064e..a35d9951e22a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_0.c
> @@ -129,7 +129,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_4_0[] = {
>  
>  static void sdma_v4_0_set_ring_funcs(struct amdgpu_device *adev);
>  static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev);
> -static void sdma_v4_0_set_vm_pte_funcs(struct amdgpu_device *adev);
>  static void sdma_v4_0_set_irq_funcs(struct amdgpu_device *adev);
>  static void sdma_v4_0_set_ras_funcs(struct amdgpu_device *adev);
>  
> @@ -1751,6 +1750,14 @@ static bool sdma_v4_0_fw_support_paging_queue(struct amdgpu_device *adev)
>  	}
>  }
>  
> +static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
> +	.copy_pte_num_dw = 7,
> +	.copy_pte = sdma_v4_0_vm_copy_pte,
> +
> +	.write_pte = sdma_v4_0_vm_write_pte,
> +	.set_pte_pde = sdma_v4_0_vm_set_pte_pde,
> +};
> +
>  static int sdma_v4_0_early_init(struct amdgpu_ip_block *ip_block)
>  {
>  	struct amdgpu_device *adev = ip_block->adev;
> @@ -1769,7 +1776,7 @@ static int sdma_v4_0_early_init(struct amdgpu_ip_block *ip_block)
>  
>  	sdma_v4_0_set_ring_funcs(adev);
>  	sdma_v4_0_set_buffer_funcs(adev);
> -	sdma_v4_0_set_vm_pte_funcs(adev);
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_0_vm_pte_funcs);
>  	sdma_v4_0_set_irq_funcs(adev);
>  	sdma_v4_0_set_ras_funcs(adev);
>  
> @@ -2615,30 +2622,6 @@ static void sdma_v4_0_set_buffer_funcs(struct amdgpu_device *adev)
>  		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
>  }
>  
> -static const struct amdgpu_vm_pte_funcs sdma_v4_0_vm_pte_funcs = {
> -	.copy_pte_num_dw = 7,
> -	.copy_pte = sdma_v4_0_vm_copy_pte,
> -
> -	.write_pte = sdma_v4_0_vm_write_pte,
> -	.set_pte_pde = sdma_v4_0_vm_set_pte_pde,
> -};
> -
> -static void sdma_v4_0_set_vm_pte_funcs(struct amdgpu_device *adev)
> -{
> -	struct drm_gpu_scheduler *sched;
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v4_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		if (adev->sdma.has_page_queue)
> -			sched = &adev->sdma.instance[i].page.sched;
> -		else
> -			sched = &adev->sdma.instance[i].ring.sched;
> -		adev->vm_manager.vm_pte_scheds[i] = sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -}
> -
>  static void sdma_v4_0_get_ras_error_count(uint32_t value,
>  					uint32_t instance,
>  					uint32_t *sec_count)
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> index a1443990d5c6..7f77367848d4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v4_4_2.c
> @@ -104,7 +104,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_4_4_2[] = {
>  
>  static void sdma_v4_4_2_set_ring_funcs(struct amdgpu_device *adev);
>  static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev);
> -static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev);
>  static void sdma_v4_4_2_set_irq_funcs(struct amdgpu_device *adev);
>  static void sdma_v4_4_2_set_ras_funcs(struct amdgpu_device *adev);
>  static void sdma_v4_4_2_update_reset_mask(struct amdgpu_device *adev);
> @@ -1347,6 +1346,14 @@ static const struct amdgpu_sdma_funcs sdma_v4_4_2_sdma_funcs = {
>  	.soft_reset_kernel_queue = &sdma_v4_4_2_soft_reset_engine,
>  };
>  
> +static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
> +	.copy_pte_num_dw = 7,
> +	.copy_pte = sdma_v4_4_2_vm_copy_pte,
> +
> +	.write_pte = sdma_v4_4_2_vm_write_pte,
> +	.set_pte_pde = sdma_v4_4_2_vm_set_pte_pde,
> +};
> +
>  static int sdma_v4_4_2_early_init(struct amdgpu_ip_block *ip_block)
>  {
>  	struct amdgpu_device *adev = ip_block->adev;
> @@ -1362,7 +1369,7 @@ static int sdma_v4_4_2_early_init(struct amdgpu_ip_block *ip_block)
>  
>  	sdma_v4_4_2_set_ring_funcs(adev);
>  	sdma_v4_4_2_set_buffer_funcs(adev);
> -	sdma_v4_4_2_set_vm_pte_funcs(adev);
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v4_4_2_vm_pte_funcs);
>  	sdma_v4_4_2_set_irq_funcs(adev);
>  	sdma_v4_4_2_set_ras_funcs(adev);
>  	return 0;
> @@ -2316,30 +2323,6 @@ static void sdma_v4_4_2_set_buffer_funcs(struct amdgpu_device *adev)
>  		adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
>  }
>  
> -static const struct amdgpu_vm_pte_funcs sdma_v4_4_2_vm_pte_funcs = {
> -	.copy_pte_num_dw = 7,
> -	.copy_pte = sdma_v4_4_2_vm_copy_pte,
> -
> -	.write_pte = sdma_v4_4_2_vm_write_pte,
> -	.set_pte_pde = sdma_v4_4_2_vm_set_pte_pde,
> -};
> -
> -static void sdma_v4_4_2_set_vm_pte_funcs(struct amdgpu_device *adev)
> -{
> -	struct drm_gpu_scheduler *sched;
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v4_4_2_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		if (adev->sdma.has_page_queue)
> -			sched = &adev->sdma.instance[i].page.sched;
> -		else
> -			sched = &adev->sdma.instance[i].ring.sched;
> -		adev->vm_manager.vm_pte_scheds[i] = sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -}
> -
>  /**
>   * sdma_v4_4_2_update_reset_mask - update  reset mask for SDMA
>   * @adev: Pointer to the AMDGPU device structure
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> index 8ddc4df06a1f..7ce13c5d4e61 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c
> @@ -110,7 +110,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_5_0[] = {
>  
>  static void sdma_v5_0_set_ring_funcs(struct amdgpu_device *adev);
>  static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev);
> -static void sdma_v5_0_set_vm_pte_funcs(struct amdgpu_device *adev);
>  static void sdma_v5_0_set_irq_funcs(struct amdgpu_device *adev);
>  static int sdma_v5_0_stop_queue(struct amdgpu_ring *ring);
>  static int sdma_v5_0_restore_queue(struct amdgpu_ring *ring);
> @@ -1357,6 +1356,13 @@ static const struct amdgpu_sdma_funcs sdma_v5_0_sdma_funcs = {
>  	.soft_reset_kernel_queue = &sdma_v5_0_soft_reset_engine,
>  };
>  
> +static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
> +	.copy_pte_num_dw = 7,
> +	.copy_pte = sdma_v5_0_vm_copy_pte,
> +	.write_pte = sdma_v5_0_vm_write_pte,
> +	.set_pte_pde = sdma_v5_0_vm_set_pte_pde,
> +};
> +
>  static int sdma_v5_0_early_init(struct amdgpu_ip_block *ip_block)
>  {
>  	struct amdgpu_device *adev = ip_block->adev;
> @@ -1368,7 +1374,7 @@ static int sdma_v5_0_early_init(struct amdgpu_ip_block *ip_block)
>  
>  	sdma_v5_0_set_ring_funcs(adev);
>  	sdma_v5_0_set_buffer_funcs(adev);
> -	sdma_v5_0_set_vm_pte_funcs(adev);
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_0_vm_pte_funcs);
>  	sdma_v5_0_set_irq_funcs(adev);
>  	sdma_v5_0_set_mqd_funcs(adev);
>  
> @@ -2073,27 +2079,6 @@ static void sdma_v5_0_set_buffer_funcs(struct amdgpu_device *adev)
>  	}
>  }
>  
> -static const struct amdgpu_vm_pte_funcs sdma_v5_0_vm_pte_funcs = {
> -	.copy_pte_num_dw = 7,
> -	.copy_pte = sdma_v5_0_vm_copy_pte,
> -	.write_pte = sdma_v5_0_vm_write_pte,
> -	.set_pte_pde = sdma_v5_0_vm_set_pte_pde,
> -};
> -
> -static void sdma_v5_0_set_vm_pte_funcs(struct amdgpu_device *adev)
> -{
> -	unsigned i;
> -
> -	if (adev->vm_manager.vm_pte_funcs == NULL) {
> -		adev->vm_manager.vm_pte_funcs = &sdma_v5_0_vm_pte_funcs;
> -		for (i = 0; i < adev->sdma.num_instances; i++) {
> -			adev->vm_manager.vm_pte_scheds[i] =
> -				&adev->sdma.instance[i].ring.sched;
> -		}
> -		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -	}
> -}
> -
>  const struct amdgpu_ip_block_version sdma_v5_0_ip_block = {
>  	.type = AMD_IP_BLOCK_TYPE_SDMA,
>  	.major = 5,
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 51101b0aa2fa..98beff18cf28 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -111,7 +111,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_5_2[] = {
>  
>  static void sdma_v5_2_set_ring_funcs(struct amdgpu_device *adev);
>  static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev);
> -static void sdma_v5_2_set_vm_pte_funcs(struct amdgpu_device *adev);
>  static void sdma_v5_2_set_irq_funcs(struct amdgpu_device *adev);
>  static int sdma_v5_2_stop_queue(struct amdgpu_ring *ring);
>  static int sdma_v5_2_restore_queue(struct amdgpu_ring *ring);
> @@ -1248,6 +1247,13 @@ static void sdma_v5_2_ring_emit_reg_write_reg_wait(struct amdgpu_ring *ring,
>  	amdgpu_ring_emit_reg_wait(ring, reg1, mask, mask);
>  }
>  
> +static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
> +	.copy_pte_num_dw = 7,
> +	.copy_pte = sdma_v5_2_vm_copy_pte,
> +	.write_pte = sdma_v5_2_vm_write_pte,
> +	.set_pte_pde = sdma_v5_2_vm_set_pte_pde,
> +};
> +
>  static int sdma_v5_2_early_init(struct amdgpu_ip_block *ip_block)
>  {
>  	struct amdgpu_device *adev = ip_block->adev;
> @@ -1259,7 +1265,7 @@ static int sdma_v5_2_early_init(struct amdgpu_ip_block *ip_block)
>  
>  	sdma_v5_2_set_ring_funcs(adev);
>  	sdma_v5_2_set_buffer_funcs(adev);
> -	sdma_v5_2_set_vm_pte_funcs(adev);
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v5_2_vm_pte_funcs);
>  	sdma_v5_2_set_irq_funcs(adev);
>  	sdma_v5_2_set_mqd_funcs(adev);
>  
> @@ -2084,27 +2090,6 @@ static void sdma_v5_2_set_buffer_funcs(struct amdgpu_device *adev)
>  	}
>  }
>  
> -static const struct amdgpu_vm_pte_funcs sdma_v5_2_vm_pte_funcs = {
> -	.copy_pte_num_dw = 7,
> -	.copy_pte = sdma_v5_2_vm_copy_pte,
> -	.write_pte = sdma_v5_2_vm_write_pte,
> -	.set_pte_pde = sdma_v5_2_vm_set_pte_pde,
> -};
> -
> -static void sdma_v5_2_set_vm_pte_funcs(struct amdgpu_device *adev)
> -{
> -	unsigned i;
> -
> -	if (adev->vm_manager.vm_pte_funcs == NULL) {
> -		adev->vm_manager.vm_pte_funcs = &sdma_v5_2_vm_pte_funcs;
> -		for (i = 0; i < adev->sdma.num_instances; i++) {
> -			adev->vm_manager.vm_pte_scheds[i] =
> -				&adev->sdma.instance[i].ring.sched;
> -		}
> -		adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -	}
> -}
> -
>  const struct amdgpu_ip_block_version sdma_v5_2_ip_block = {
>  	.type = AMD_IP_BLOCK_TYPE_SDMA,
>  	.major = 5,
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> index e3f725bc2f29..c32331b72ba0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c
> @@ -119,7 +119,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_6_0[] = {
>  
>  static void sdma_v6_0_set_ring_funcs(struct amdgpu_device *adev);
>  static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev);
> -static void sdma_v6_0_set_vm_pte_funcs(struct amdgpu_device *adev);
>  static void sdma_v6_0_set_irq_funcs(struct amdgpu_device *adev);
>  static int sdma_v6_0_start(struct amdgpu_device *adev);
>  
> @@ -1268,6 +1267,13 @@ static void sdma_v6_0_set_ras_funcs(struct amdgpu_device *adev)
>  	}
>  }
>  
> +static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
> +	.copy_pte_num_dw = 7,
> +	.copy_pte = sdma_v6_0_vm_copy_pte,
> +	.write_pte = sdma_v6_0_vm_write_pte,
> +	.set_pte_pde = sdma_v6_0_vm_set_pte_pde,
> +};
> +
>  static int sdma_v6_0_early_init(struct amdgpu_ip_block *ip_block)
>  {
>  	struct amdgpu_device *adev = ip_block->adev;
> @@ -1296,7 +1302,7 @@ static int sdma_v6_0_early_init(struct amdgpu_ip_block *ip_block)
>  
>  	sdma_v6_0_set_ring_funcs(adev);
>  	sdma_v6_0_set_buffer_funcs(adev);
> -	sdma_v6_0_set_vm_pte_funcs(adev);
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v6_0_vm_pte_funcs);
>  	sdma_v6_0_set_irq_funcs(adev);
>  	sdma_v6_0_set_mqd_funcs(adev);
>  	sdma_v6_0_set_ras_funcs(adev);
> @@ -1889,25 +1895,6 @@ static void sdma_v6_0_set_buffer_funcs(struct amdgpu_device *adev)
>  	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
>  }
>  
> -static const struct amdgpu_vm_pte_funcs sdma_v6_0_vm_pte_funcs = {
> -	.copy_pte_num_dw = 7,
> -	.copy_pte = sdma_v6_0_vm_copy_pte,
> -	.write_pte = sdma_v6_0_vm_write_pte,
> -	.set_pte_pde = sdma_v6_0_vm_set_pte_pde,
> -};
> -
> -static void sdma_v6_0_set_vm_pte_funcs(struct amdgpu_device *adev)
> -{
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v6_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -}
> -
>  const struct amdgpu_ip_block_version sdma_v6_0_ip_block = {
>  	.type = AMD_IP_BLOCK_TYPE_SDMA,
>  	.major = 6,
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> index 7fee98d37720..9318d23eb71e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c
> @@ -119,7 +119,6 @@ static const struct amdgpu_hwip_reg_entry sdma_reg_list_7_0[] = {
>  
>  static void sdma_v7_0_set_ring_funcs(struct amdgpu_device *adev);
>  static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev);
> -static void sdma_v7_0_set_vm_pte_funcs(struct amdgpu_device *adev);
>  static void sdma_v7_0_set_irq_funcs(struct amdgpu_device *adev);
>  static int sdma_v7_0_start(struct amdgpu_device *adev);
>  
> @@ -1253,6 +1252,13 @@ static void sdma_v7_0_ring_emit_reg_write_reg_wait(struct amdgpu_ring *ring,
>  	amdgpu_ring_emit_reg_wait(ring, reg1, mask, mask);
>  }
>  
> +static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
> +	.copy_pte_num_dw = 8,
> +	.copy_pte = sdma_v7_0_vm_copy_pte,
> +	.write_pte = sdma_v7_0_vm_write_pte,
> +	.set_pte_pde = sdma_v7_0_vm_set_pte_pde,
> +};
> +
>  static int sdma_v7_0_early_init(struct amdgpu_ip_block *ip_block)
>  {
>  	struct amdgpu_device *adev = ip_block->adev;
> @@ -1283,7 +1289,7 @@ static int sdma_v7_0_early_init(struct amdgpu_ip_block *ip_block)
>  
>  	sdma_v7_0_set_ring_funcs(adev);
>  	sdma_v7_0_set_buffer_funcs(adev);
> -	sdma_v7_0_set_vm_pte_funcs(adev);
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &sdma_v7_0_vm_pte_funcs);
>  	sdma_v7_0_set_irq_funcs(adev);
>  	sdma_v7_0_set_mqd_funcs(adev);
>  
> @@ -1831,25 +1837,6 @@ static void sdma_v7_0_set_buffer_funcs(struct amdgpu_device *adev)
>  	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
>  }
>  
> -static const struct amdgpu_vm_pte_funcs sdma_v7_0_vm_pte_funcs = {
> -	.copy_pte_num_dw = 8,
> -	.copy_pte = sdma_v7_0_vm_copy_pte,
> -	.write_pte = sdma_v7_0_vm_write_pte,
> -	.set_pte_pde = sdma_v7_0_vm_set_pte_pde,
> -};
> -
> -static void sdma_v7_0_set_vm_pte_funcs(struct amdgpu_device *adev)
> -{
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &sdma_v7_0_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -}
> -
>  const struct amdgpu_ip_block_version sdma_v7_0_ip_block = {
>  	.type = AMD_IP_BLOCK_TYPE_SDMA,
>  	.major = 7,
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dma.c b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> index 7f18e4875287..b85df997ed49 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dma.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dma.c
> @@ -37,7 +37,6 @@ const u32 sdma_offsets[SDMA_MAX_INSTANCE] =
>  
>  static void si_dma_set_ring_funcs(struct amdgpu_device *adev);
>  static void si_dma_set_buffer_funcs(struct amdgpu_device *adev);
> -static void si_dma_set_vm_pte_funcs(struct amdgpu_device *adev);
>  static void si_dma_set_irq_funcs(struct amdgpu_device *adev);
>  
>  /**
> @@ -473,6 +472,14 @@ static void si_dma_ring_emit_wreg(struct amdgpu_ring *ring,
>  	amdgpu_ring_write(ring, val);
>  }
>  
> +static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
> +	.copy_pte_num_dw = 5,
> +	.copy_pte = si_dma_vm_copy_pte,
> +
> +	.write_pte = si_dma_vm_write_pte,
> +	.set_pte_pde = si_dma_vm_set_pte_pde,
> +};
> +
>  static int si_dma_early_init(struct amdgpu_ip_block *ip_block)
>  {
>  	struct amdgpu_device *adev = ip_block->adev;
> @@ -481,7 +488,7 @@ static int si_dma_early_init(struct amdgpu_ip_block *ip_block)
>  
>  	si_dma_set_ring_funcs(adev);
>  	si_dma_set_buffer_funcs(adev);
> -	si_dma_set_vm_pte_funcs(adev);
> +	amdgpu_sdma_set_vm_pte_scheds(adev, &si_dma_vm_pte_funcs);
>  	si_dma_set_irq_funcs(adev);
>  
>  	return 0;
> @@ -830,26 +837,6 @@ static void si_dma_set_buffer_funcs(struct amdgpu_device *adev)
>  	adev->mman.buffer_funcs_ring = &adev->sdma.instance[0].ring;
>  }
>  
> -static const struct amdgpu_vm_pte_funcs si_dma_vm_pte_funcs = {
> -	.copy_pte_num_dw = 5,
> -	.copy_pte = si_dma_vm_copy_pte,
> -
> -	.write_pte = si_dma_vm_write_pte,
> -	.set_pte_pde = si_dma_vm_set_pte_pde,
> -};
> -
> -static void si_dma_set_vm_pte_funcs(struct amdgpu_device *adev)
> -{
> -	unsigned i;
> -
> -	adev->vm_manager.vm_pte_funcs = &si_dma_vm_pte_funcs;
> -	for (i = 0; i < adev->sdma.num_instances; i++) {
> -		adev->vm_manager.vm_pte_scheds[i] =
> -			&adev->sdma.instance[i].ring.sched;
> -	}
> -	adev->vm_manager.vm_pte_num_scheds = adev->sdma.num_instances;
> -}
> -
>  const struct amdgpu_ip_block_version si_dma_ip_block =
>  {
>  	.type = AMD_IP_BLOCK_TYPE_SDMA,

