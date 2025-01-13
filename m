Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C212DA0B6CC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 13:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95DDB10E66A;
	Mon, 13 Jan 2025 12:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XQv1yQ51";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2406::617])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3F610E66A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ib+tehfu2enW4aQKg57ACD4dlLoI3fAnkcEVbYz4NpVnMoHOAsrDdWcO14RtUiVzOca7OGBq5ekFldcJ910hxuug8EvSncZp+LNv3MTgIKqqvBi0/2UvklPohUZdim8HQUPzWjNM9RDCV63sxXznAtJLNSnEpbQGbMx3JyqUNOAKFcdWsQsW8qwAWJDAc55qPBvYM5efXTV+oMnypmK7bQt4ibVOPXClo48SSiBnqgQwqXLSaQhBrmUFlizc5+FUn5OCyb+YZYd1/XasZHK5sFXSU6VfbqKJMabpmn4ixVB1plCtyS9ibseRRnAe0iV9Rtt3+A0RfAfdA4521iSBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqv4KhjOUcuQFjChv8WYz/hLcvoc6WjCzzvlP5YxgOY=;
 b=JKPrdnBKqxxD8dPrZ4CBpecUDhl1d+CRtRa3X5XvJzSpF6wZP6xjZI490pl00J4h5DpoIWSHoxXVle39Vpm/PUk0AAY8h7D17jOib0fJK5oDaUfBA0SI/QgVnkPbR0s+xbgt9RF/Mku7D3dTpdnHEIDyXH4BQ5Hpw+dHutjEewSFUWCXxbNWyNsAgpbXpYu8bZ4Q7r8LEBhorZvTJpI6VpoQ2osSoJp6WywDvD3EI7fvqAbuy6zcisxx0u29eCOnZxxsz6mRkxOKXf00h9lfX/wFsivZOvpdWUrzmcVQfAKOaZXy0Vtmi5LK5zYs06HdrQ7GcHXTEYhDEJm3v0qtYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqv4KhjOUcuQFjChv8WYz/hLcvoc6WjCzzvlP5YxgOY=;
 b=XQv1yQ519SEIRYJkejCRbcYzhlGrVB5iiUYJjzcJ813K5ZrZbiOWFEVDSH8isGXj8Mw6mAMLyk7MRttsA/ZhTL02IsXchtX5iX9zlhAKw6nXsFPxnjBNb8l5Ep9JVj3x3ZmsFpd17fju1tlQ8okJDzyAjKyR/ikCLGkkEdToiB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB7628.namprd12.prod.outlook.com (2603:10b6:208:436::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 12:24:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 12:24:52 +0000
Message-ID: <ddf0d156-fa3f-4923-b894-8627ed3aa937@amd.com>
Date: Mon, 13 Jan 2025 13:24:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: Add DRM GPU Scheduler reviewer
To: Philipp Stanner <phasta@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Yosry Ahmed <yosryahmed@google.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>
References: <20250113121851.31382-1-phasta@kernel.org>
 <20250113121851.31382-2-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250113121851.31382-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 096303c9-96e0-4804-14ac-08dd33cd47a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXBoRURmRnRvMkZSell3Wk1Zc281Z2VveU1ONjRQZE0yY2tXRGxyZjBRL0ta?=
 =?utf-8?B?Tmttem1LbS9ZbVlzUWlkVnJZZjZIaEZWcjh5Z3NLOHZKamw2OXBTaG9rdWpt?=
 =?utf-8?B?d1FBazBYbklNZDcwWlZxM1hDN1ZDUkFlUFBCRFE3aDN0bjFjUzFsYTEvUGVI?=
 =?utf-8?B?RXZRVHJKRExiLzN6M3VnT25mejM5VGIxblp1L0F1MmljMzZXQzBtMWlLdmhv?=
 =?utf-8?B?bXhSbXpnTVhJKzEyeERPRlM2aklITzcvaHZTTWhrNFloSmQ1ZVowT2tGanVp?=
 =?utf-8?B?bW1FVVJQUXV5OEV1akgxcjRvZlRJcVY1cWYydFJqRUkzc2pHNHVKRTcxbW4z?=
 =?utf-8?B?TXpSL29BUGVpSVl6M2FubFYvK2c3NHFhZkFudHhLUHlROTI5b1pQbFQ3Z0VN?=
 =?utf-8?B?eWlwQ05EMFZrY1Q5a3A3eS9aNGlmbVdvUTEwRVVKWTVrUW1kTG1nK045Ryt2?=
 =?utf-8?B?RUQzSFdPRmV2clNmRHVBU3RtQWt2Y0I4dTFYbUloUXZoN1piaGhZMThJTS9C?=
 =?utf-8?B?VlkwRGx0M05zVjdaNitLS20xeG5FVURBbnVuYzl3d2lDQVdnZk1jQ2lZcFdv?=
 =?utf-8?B?UEE1UVFTZDRnVG51bWFxY0VFTjZmTTg0aFRQaVFPWG9zOGw1M1J6dHF5cVBj?=
 =?utf-8?B?bG1tVnQyR01MQ1hkMXhpeXAyTmwzdzBBVUpQQm9PVFBOZmRjTk94S041akta?=
 =?utf-8?B?RlByZTRzWUQ2Z3hyYnlJc0dvZ2crenhORjI4OXRxVUQ3QSs0MEUrU2tIdXRn?=
 =?utf-8?B?UVJMQ0pQSVhQMFZydmY4b1dmYlc5cDA3YkpzUk5aaTliV0Y0ejhIUjJZM0N2?=
 =?utf-8?B?NDhuaDR6NjVDdjdjSzZZSXIzbzI1UVNTaURKdHRhME1kK2VLVmVMTTFZL2Ev?=
 =?utf-8?B?eHpja0w1azFVZTgrU0NDNk9YUmZYSVhEOUNNSHljbyt0R1NzcGZaUWRITU1T?=
 =?utf-8?B?ZTJlajBITU0rOHg2UElCb1c5NDVya1ZnNlIyL1hCaUkyOHRacjV6dWd0TnpN?=
 =?utf-8?B?SkNZak4xTXRtalczWGpTUHJiVkxIL2tRZW1HQjBhMUFoczRockFhT3BHb2Fv?=
 =?utf-8?B?STk2dmFBd3l0MDNvcGVVMVlqekV0eitMTGdkeURXSERISE1sQzBCMWlQRUNz?=
 =?utf-8?B?MW92K2txdVNjUTFqbG03Y2VVMGdYNCtrRk8wWVRKZHl0bE9vSmNjbFhMQnRK?=
 =?utf-8?B?R3ZzWW11Q2JWQjZIMjFPWDVUQndrdnNnMEVqanZoN0t1VGJ0OGFCbEMzcWg3?=
 =?utf-8?B?MS9tOGp3TVl6V21QUkNUbDk0MXhFTjBpR0VzVmZJdjc3ZG5hSUU3UXRmazRK?=
 =?utf-8?B?QXM3bHBZZ1YrSVRNQ2U4NUdSWER5cnQzdVJHa2JOZTR4RzJid0t0WFNSL29Z?=
 =?utf-8?B?RlVpZllrM1ZJMFBVMktkTndsZ3NLMklXd1JaRWJvejJOYU9KVzd3SmZEWlNx?=
 =?utf-8?B?YVFyM21HTy9oVlJqOW9XTCtkWXM4UkkyWG9kSXh6NCtsMmNCdnQ0R2lGTkpL?=
 =?utf-8?B?RHJ1OWdIQVBrbEdLOWhoalY5K2E3QkhnSEI4MUxwZkhFNHBERHBKemQ0NkRk?=
 =?utf-8?B?RHY2K1lEbGkrWG1nK05CSGZZSzMvekJrMUZNY0R4QllDdWk1V21BbjViZ1N0?=
 =?utf-8?B?KzQ2d1dKYWJ4RDBIUFVWUzZFNmk3VEtVWVF4K0hvRHlrTVQzTjdUVlFNWEtV?=
 =?utf-8?B?NjRlRE5aSCtITitKOThJYm5YQTV0UnFPOEJDYTlaNzNVMjlXNldsbGdOTWdI?=
 =?utf-8?B?ZnA3YW41WGZZdlV3N2hYYStkYy9hVWJ2Y1hIczU5eDRWRzdwcVczN0JNMFV6?=
 =?utf-8?B?UlJmZG5QeGQxMnRYRVJIZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmlVMFRQNmlsMGdyVkdDMHdzZkgvTnk1TWJMY2F4NzFQdWF0Wnp3bE94YmRs?=
 =?utf-8?B?WnMyMlBNQmlJWDY2eVRsdWN6S3BvNWpsckVlc1YrMWc0ODZQQ2pUd3NIc3Ev?=
 =?utf-8?B?K1hYS3NHVW5BT1Bwb2pzbG03QTFBbVNXbnU1b2RXRHk2amswMkdZZnZMTlha?=
 =?utf-8?B?elhnUmZQUkUyTTRUdkpFaTAvZHN3RXhueWFPVGpRMFU3UmN2SEFlazB4V3gy?=
 =?utf-8?B?eCs1R1VFRmZhN0FUd2M5QWpiN1pNMDVVTm0wTms3TDllMnVNK2FCTU1NOGdv?=
 =?utf-8?B?K1N0Qkh1R0w1ZUQrTXh1eUlMYUZGZHhaTEE2c214bWhRbkh4UUJqUmJSWU8w?=
 =?utf-8?B?ZnlVNWxUNE5DWUgrR3F2RXNJNGQzQ0Jjd0JOSi9pN2NwRUc3SUZvRXUrV3h6?=
 =?utf-8?B?VkFkd1UyQXNuK1NPc0RXQjdFMTViWW5qY25pOXZzeHlHelBVb2lYb0hTQkpU?=
 =?utf-8?B?YnZ1ZzMvR1VWY2g4TmhWUmhJWlZoMDVIZW1xTzhVdzlwbDczNUpwTGQ1aGlT?=
 =?utf-8?B?OCtIaEIxd3BkZWhJTGhCbjUvc3FjT25nQWF3SW14Q3dLc20ra3QvVWxUby9o?=
 =?utf-8?B?VjhiZUdKeGU4am53NTZuaGIzSHZua0MwNE5Ddy8rdGNQTUM0N3NTMjk3ZkJR?=
 =?utf-8?B?U1dBMjhRWW54N1hDc2F5WHVpQmlkUktkckJPcnluZXlEZmJyUE45dmdlQnRy?=
 =?utf-8?B?Q0VBZ3IrWE9oNng4bGtSL2NySjIrbDlja1lwTVFoS0RRd1NkUGFBTndhVWRO?=
 =?utf-8?B?b3NJdy9hbEtNb3N5T2pvNGpjNlpKM0lwUnVsZTFhQmpaNG8wMWQrKzVhTE5t?=
 =?utf-8?B?SnViczI3eHU3bE9lYTBmdmR5aE9PZk9jNDRJSGdOOTl4YmFFVU5zL2dnQzJm?=
 =?utf-8?B?UW1XeVRWR1FIZTI3dW9SZ2dMVkVFZHJRWnpiNUI3VklOTDRrQzV0aGhVaWo5?=
 =?utf-8?B?YnRoWWFEZmEwUGUzbjAvMEJwc3h1QjFoZ0NnYy9PSWVnY3ROK1JWK2tJWUN6?=
 =?utf-8?B?Z2wySnE0bklISCtCaTlieVdDU0Uwa1FRY24ySjZOZ3NhVmhuTERsbDdxcStl?=
 =?utf-8?B?aXFlZ1F4WWx0dnA0SVVPZnRwazJQRHlOcWZNVFFZS0pvVTU2bS8xRmg2Vkgw?=
 =?utf-8?B?RWI3Rld2cklSa1hWaGVDSE1zOG5weVNBQ1hXNVFudFNyT1Z3aEY0RTdjSjdl?=
 =?utf-8?B?RHl0L1RONXR0MytjNjQ0QjYwSi9UMlVOcU5vcWtQZ29iMGwyRVRZa041TWN0?=
 =?utf-8?B?TDN2UjhvcXBkUm11bmVobXNhcU1BSnFoa05VOEkyWTJQbTdJTjk1UTlTWURu?=
 =?utf-8?B?SnVsSVZhUnBuQnZrNFVUMkRDZmdYNGphZnRDYmhkZ0dlL3pTU1Q1Z2wxSnJ4?=
 =?utf-8?B?dHZjTHk3NDJ0UWljYjQyejhlaFJBdGZnbXlrR1N3RW90bXcyc3NGWktHZ1Fy?=
 =?utf-8?B?RFV1SjZpYzcyMXVCVHA1eWlKWWhHRUxYbEo2ZlNNY2lwZ3lyaVRydDlqbEtO?=
 =?utf-8?B?SmZYRFA2bFVtakIzK2tUelpZeXUyemdCQ1hTQjlpQ2hnR1dMdVhheStvanJX?=
 =?utf-8?B?aHkzMm04TStCc1Z1Yitmek1ZQnFhcHk5NTVsWU85SWU3WUJlNktJQytvc2VC?=
 =?utf-8?B?V0ExbU1ISHlzdy9uL0FzblpVUkpSalkzSXJuVjV5QUpsLy92WHFyT3pKZzdq?=
 =?utf-8?B?Y3RtSkczc2Q5ZkduR0RuNURDbE5IV3lFNXJBNmhCWFZjbkpXeDc2ZUM2Nnky?=
 =?utf-8?B?UVNVK2dzMFo3dkZZS3dwTUhxNjcrYVpuanhLS2VsNzlyMytkVlFjbjRPL2JQ?=
 =?utf-8?B?eU1vM0lsQTZVL2xJckRsZjhkN2gzdG9Ub1cxQU0zVHFWTnphNGZhWUZFNFBw?=
 =?utf-8?B?SFZaejlhL0NNL21rbVlJZkVnQXJyZUZRckV4VjNxem1jekVGNUk4VDN3VlJ5?=
 =?utf-8?B?SVVRN01sbVdwcWdsVFZMeFN2Q3pCSHlpanJTOVBZeXd4TmllSW9UNWtMOEhh?=
 =?utf-8?B?aTFlK0dxNDJtTDNETG4xS2d1VmdjLzNMVmFKeDZHRzlWOEpWUXl0ZVRPVFVp?=
 =?utf-8?B?SEk5SENNTUZBQzVtZmNmeTBBdkpaY3RYM01UMW0ybzIzb2xZd1FYMDNqaGxx?=
 =?utf-8?Q?6GVgQ3kqvfpVbJVWNvnY5R3je?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 096303c9-96e0-4804-14ac-08dd33cd47a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 12:24:52.1773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvOGMPKZPHv9th4qagSuw4g5PpX2TqVXaGjcRYHPT4+0hu1zQkVTQM/WB/N1EEua
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7628
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

Am 13.01.25 um 13:18 schrieb Philipp Stanner:
> Christian König is the original author of much of the scheduler's code
> and, thus, well suited to do reviews.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

*sigh* Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa288ef20c59..f70e69bfc0c7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7891,6 +7891,7 @@ DRM GPU SCHEDULER
>   M:	Matthew Brost <matthew.brost@intel.com>
>   M:	Danilo Krummrich <dakr@kernel.org>
>   M:	Philipp Stanner <phasta@kernel.org>
> +R:	Christian König <ckoenig.leichtzumerken@gmail.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Supported
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

