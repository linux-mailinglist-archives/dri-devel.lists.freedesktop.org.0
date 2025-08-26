Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8B7B357D2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 11:01:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6216610E617;
	Tue, 26 Aug 2025 09:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="S1twu1zR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FEA10E616;
 Tue, 26 Aug 2025 09:01:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttinp5WhH3Tqpouxg5T8RvQs3YXt4pIYuPtqU5k18PHkbgzCuQGhm6XVZrfVZ8nm+sBJqHhPqKkumFtTaaWUYdCoyLpaLhu5a6MwU/I9pdpGMSmSnFL9css3DMVNK6g7CzAoIOEichmUrQ22jBG3ktybhH1XCQH4MGgjNybe/hVhBk3XEfbYKzb2fjjunw+Rrfc6pRLq+OySa53I5vRNFMAUV7qnRb0K+dRFXwzSN+f5WaRYq8YXgmvJKKAKmiJk3X3Ucc+oO+qkCUEp9kHQFswcHXP11YvgsxudTAG5Q9+SElhtudjD0vnVrXbo/0KDEHGq4blMT+/gmQ754vxjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RJWUViXaax2pYeY5ZvmYmxU2Dzo61bnuFE5Glmse5I=;
 b=HQQeEZEroFUz3XMgDKjXjgqXubjL/DJfDzO2mzqhkEPCZT204rUNdpOMHiv+vY4msODDYtdzaQ0wPFEBYmcFyuZ2MXPYi82L+Mc5uPqokMWZWebTH/5eSwjQ7792hRo8AQgI9n9pbRNZ32NwZuS8MYxAPJDEmSxQ/FI3KKCIMzeN/hR66BtcyMO/Bch6YF/zsFirQqqEKjMS0SekUK0tKS282KdiL80Cf5jDF3Lo+QWAnXv7ZK0RpOJPeXOClOQjh8ZZuqbS5EHK7Lmr1VzVgb7ce+WHCcPuxY86mqW6iIoIdAUKKJQl/iDNkLjwcXFo/0tIKFsPftaxV+dAsXPmXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RJWUViXaax2pYeY5ZvmYmxU2Dzo61bnuFE5Glmse5I=;
 b=S1twu1zRav58wSyxQPl+X/bjEUNZxTFjPB1wi7xchKTLHh3t28yWfPonaSXwVltrFfgGdGfW78rt6/4Orw8I9f1njZvaoPQIX8Z2rJ8tRKZFvi/5MQfvAu6WY4HGS5bpd5coyO9ttY8kM9ZMvZy3OBdln7fosd82SjDvov+ixjY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 26 Aug
 2025 09:00:59 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 09:00:59 +0000
Message-ID: <fc3e013c-e7f7-441d-a638-2ee3dd372775@amd.com>
Date: Tue, 26 Aug 2025 11:00:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re:
To: David Hildenbrand <david@redhat.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, x86@kernel.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
 <4e5f4ef0-53f1-417e-8f3b-76fd7c64cd23@amd.com>
 <f983521c-b43d-4245-93fc-fcb847908573@redhat.com>
 <a1b95d23-1908-42c1-8ff6-da051fc140aa@amd.com>
 <6591105b-969d-44d6-80e1-233c1b84b121@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6591105b-969d-44d6-80e1-233c1b84b121@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: 66c69398-f169-4795-e7a8-08dde47f1344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3lUY1I5Yjg5cjM1ZGhUUjFWaGVCUHdNYTV3UE9maVpHZVpha1FPNkJGK2Iw?=
 =?utf-8?B?Z1dFYjJzQSsyelRxTkswVHpBdXpvOTRjRGh1ME5MdWJLL2Z0NW5DYTNLNzZT?=
 =?utf-8?B?Y3ZSZW8wNTlBaTIwbkhJL3N4T2Z0VUF2czNudkN4Q3h6TnRXVlNLMTJiNkM0?=
 =?utf-8?B?aGNBM3VGYk5GdFhtK1dqTFZLY0hJZXpmQmJ2dE5lckU0N1BEL2REQ2t5R0pG?=
 =?utf-8?B?cktGTCsvNGFCOTVtZmNORDhuR1o4QmhxbE1YdE45LzZNZ2UxZ290MExnekZ3?=
 =?utf-8?B?TC9YNjhXUjBiaHN5dUNQVHcxR2FOTFJkZFl5Z0lzOUZpTzZqSU00bWJUcG5F?=
 =?utf-8?B?bUF3QzhYZDIwNzYwNmZJVEpKL3FXNUl0MGl2ZnBCWTBqbk54dS9VWGwwRDJR?=
 =?utf-8?B?MHdPYjQ0ZGpXMWorRzRuR0oycjNuOEpJUHBkRWNCNFVFVjdER2dCdHBYWmRO?=
 =?utf-8?B?R3JNQ3BuM0JOZTRWVTd6VW03ejQxalZ0K0tLTzdWaTdTREpmZUdiYVNrdlIz?=
 =?utf-8?B?OGUwTEtoM2FIdUZBRUliWmFZR2xmSkVHK0dPU2pJL2V1d0gyRnVaQUVkUVdC?=
 =?utf-8?B?TkVzNkhMbEJYeFZQcTMyUmRPaGp6RXk3ZkZZUVBPRUJvZGdlTGNjT01VaHdI?=
 =?utf-8?B?TWs3SjFZZ2RLdDJOY1RhRXJNQU5MZDJ0OGJGTFBCTFlxbm8zU3JaSkdQLy9o?=
 =?utf-8?B?TzYzTUpTTXI5ci9zcmsySjQ4ZVE3WkRkaDhIaFQyVUx5UFVsUVJ6QldXVzZr?=
 =?utf-8?B?MkJlblp4eVNTY1BTKzlKYVRGR2dmZ2R5YlR0VnBEaGsrcWd2dlJ1dGJDVEJR?=
 =?utf-8?B?SlhuS1VHN3U3d1p6MTM3MkVnU3prZTR2eVBzMFhKcnFGc3Q5TnBVaHBXUXFl?=
 =?utf-8?B?UFU2cEpueHNBMTZHV2hWc3puRUJhWis1bVRZQVIxSVNTL053WFZuSU9pNUFz?=
 =?utf-8?B?bGZ5ZkhSaUZTMWgwOWZrTXYxeHM0Y25rdk40YkxZdGJSR2lvL20vdXJDMUN4?=
 =?utf-8?B?TG54UW9Ga1JpdDh1THRhNVB6NTZxTlZMVW8wNDh1c21HSjl5QTZlT3UxZGo3?=
 =?utf-8?B?TnplcEtpQjhLc3Vwa3JsODhxN0lJZStJNTAzMm1RNzM5WVdRZHJLUnM5dEFY?=
 =?utf-8?B?U3ZOV3Z3cmwzNTUwT1R6MnM2RWFUVWJ5bUpJMk5GWDRHV0o0ZDBKZUNxeURH?=
 =?utf-8?B?S3JsOHFVYnVlVVliUFVjK0o3UFpkT21KUHU3WlNhMGIxNjVxQWtHeUs0akNJ?=
 =?utf-8?B?c1NQY1RyT2x0UXU2UGVPa3hOaWpBWU5YSFFXeXJXNUx5WVNxMlhEZ09CVlMw?=
 =?utf-8?B?eDkvZjhJNjJFRHZveVJuY1Ivd0pzbUxkVHFPY3diVnlDV2kvVE5Ec3RLc29a?=
 =?utf-8?B?bU5oQUNBamhqTUJpSmh6elpIa09jakNKeURDeXhueW9QMmhDNW1nRVkxV2t3?=
 =?utf-8?B?UXY1Wnc1WGNieHB0UDltWVJnYThkTEpCUE9DdURYa0pGMXQzRVNFMDVobDlR?=
 =?utf-8?B?N3h6N0QwN05pekRvYkVFS016WndHNWpYRWs1a0kraGQvRTJDdE9uZHlMN3VJ?=
 =?utf-8?B?aE42eGxrSGovd0N4UWhxT0c1eUJnRlhjbUdWTEQxYkdBbDZWVzJGZlJPZVBW?=
 =?utf-8?B?Q3U2cVgvOWRjVjFJUHpVa3owak5lL3U1ajJkSzJZM2lvRHpxd0ZxWE1aM2M5?=
 =?utf-8?B?eURtVzZEN2tDaVBSeFB6OW1neVFvMEJxNU5pNlpSTTNNS3UxUDREMGZtejIz?=
 =?utf-8?B?VTFMRXdFak4yWHVLS3lVWmpVL0JSeDdjK1I4Mk1uMjJkMEJ1dnFyTndUT0hu?=
 =?utf-8?B?ZENxM1ZDSk9nbnlJR1M3bEw5LzhSVHI4aUM2RmlBU2hHdHRUemYyNlRrRXBm?=
 =?utf-8?B?ditGcWlZQllkV3AwbWVQZUxOUnJjZWpyeVNZa0ZKMGdqNUxVRVFjMWxiaHFq?=
 =?utf-8?Q?mnEWWEUlvGQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGROK0xsOUJEVlJsSzdPaFV1RVRVdjV6dnlCa2pHSkRQVldaNHZYTnZWK1ZV?=
 =?utf-8?B?amMrdzljVXM5TFdURVFLVEsyU1J4Z2FyNXpteTVGbW9uUW1HZWJRZTBXdUxQ?=
 =?utf-8?B?MDhZRmRpejI2MFBzWGFyLytFQjBCY21kS3B0aUc4dDZKa3pXVEJMRCthTjhw?=
 =?utf-8?B?MDlxL2NnNU1tQ1lFYnZDcmlqZTVDY2U0QUN5Mm0vM3BzTUtVUUlVcnFML2F3?=
 =?utf-8?B?N1FmM3FKUzhvZE9xcnNWRWM1Rm83dTVEV3FyN0U3RVVHdE1mZk03ejA1cU1w?=
 =?utf-8?B?VVZSaHJaQkpNQTQ5ZzlJdmI1MXY3S0o0QzRXZ0FVYUorMGxaQnVpRGZ5c2NZ?=
 =?utf-8?B?M1BLaCswUDRIWWxYeDB3TXI2YnJvTnA3bjFoQUd3V295MUhDbE1JbmpjcXNF?=
 =?utf-8?B?bE8xWUFpUVRQRWhNWEJPSnpvUFdrbi9FMjgxcmhMUjRkcCtGS3lpdXU1MXR1?=
 =?utf-8?B?ejNWTDhRc1dUL0JzRTZCZ3F4UWUyM0dGKzdCaVFuNDBJblljSUR2QmZrZXpH?=
 =?utf-8?B?cU1sLzRVNlNPcTBYY0F5K0FaYmV6d3pXdC9aNUVXRDJIWHVKSklzUkJxdWU2?=
 =?utf-8?B?eFp1LzVCNGlrOVpNWDJUZmdHUVdGbWMxVzdhMGcvQmdXZUdLTGhyQXJ5MlBU?=
 =?utf-8?B?cjNEQ2VtNFJLMEU3YjJxNjZLVTVOWHZ5eTAvY29lTXNzY3JoQXRZZUVUMkFG?=
 =?utf-8?B?bzZwYndZcTVrS2p2dUF0Rk9BT2laZG1ORVk3V21MWXVyQXVyQVpxSm5ubXRB?=
 =?utf-8?B?b1hSK0lISVM0S1BlSkx3TTNnUTZXaXRnUWFJV1h4VG91Vy9FRnJBb1NoT1VV?=
 =?utf-8?B?YjVMZFp4ZFpEaFg0SmRrQWlpSkh4enpFNlg2alhtNDNQZmVRbFFvVFBEblRG?=
 =?utf-8?B?SXJQSXRrN3hPc0Q4NDBlNHU0VHRjdnRtS0ZVY2VxUFU0QVY2cjFmTzIzVGxp?=
 =?utf-8?B?K3pXTmh0K1BZSDQ0dmJXTXlMdHBxZzJFNjRwbFRFSzhTWEpReExsNmpNaWxq?=
 =?utf-8?B?bUVEc0xPalVoMlFYN0JLYUdSUWRHT3l0UjFGQzY0d2ZaWFFsdHhhY0dPUFIz?=
 =?utf-8?B?RmN1RVFMNDZCblZvc00wWk9hRkhTT0I2TWpaeE13WUdUSGJVRWUwTTV2cXUz?=
 =?utf-8?B?M0NYajVVV1hPNVFqaHR1eWRmcGlWTHpEZytzczQ0czZkTFM5S0l1OW44S0Fx?=
 =?utf-8?B?WVc4QWp4bHdBcHhkbG84MjlGQnh6SW1FOHpVYTYxMkhoMG1tWmp1YUFMdmhy?=
 =?utf-8?B?Yld4NEpUYUw3RzVhdTUxUlI5N1NWRVArb0F3QjBvemFnUkFLYVd0R0F0dmF2?=
 =?utf-8?B?N2pPWE0yNVhmWHpvekdNdms4dExkNVRUamljNTByZ2djNlpDNWQyRVNPbmIr?=
 =?utf-8?B?YlhwKzBtaFhUSVU5UlFpckpNaGh6T3EyZnNoR3YzMmVyMzg1UVJnbzlXa2tV?=
 =?utf-8?B?TGtrU2NRdkxPNWtwWGpzRGJhWGlWVTlkQlJEWkRHRzRkRWk2cGl2RjhHMEZ6?=
 =?utf-8?B?UGxKQUZpWjg0Vk02cGJBWWVMODRaQXBSNGd3RDhDQ2QyWUVCbzJDUWpuY0oy?=
 =?utf-8?B?dUZWOExLaGpGVDFXMFd5TVpGVDA3TVgvNUNUTTdoSjh0VWR3ZGNNNGh4bXJ4?=
 =?utf-8?B?MlpsMmd6dTFKanR6Tmc0QkE3R2VmaWlFWjdSTCsrQWU1dUNqcWIxa1dzYmMz?=
 =?utf-8?B?TEFmN1ZHOWVqY25KUC9WWUNyc2ROb0NzWHFqV0pHWjk5TU9NVjlXUG5IOU1k?=
 =?utf-8?B?TWNGNHF5cndteUkvTlRMaWdQcm1pbGFvdnhHVHQydmVJT0xzd3YycE1qQWNH?=
 =?utf-8?B?dSszczhoNzBqeDgyNENrVVNBdkR6cVZYUkh6MWZZbXUvR2FaQTZKT1lIREN1?=
 =?utf-8?B?UGVJOW9sT0lOOUphM1AvWjZEeExkaWFCaVlvL2l6RWpEM3EzZzRFSlY3WWR6?=
 =?utf-8?B?SW9NZFUvKzlLNmU1aUV5eG55MFc0dndBVXVNKy9kTXFVQ20ybEZkbGZiZUx2?=
 =?utf-8?B?NzFEY05WWmg3Q1Irak1PWkdBWGlqbnA0SkpjSVFzSEZGeHc3NzBNQzc5SDJx?=
 =?utf-8?B?ZzhVR0o1NHVGaExwRFFvbzFrRXJVRmdFNlJZaThOL3F0c1B0S056UzBUbjNu?=
 =?utf-8?Q?ByvfHt3YTG/ATeHAvtkG2lqkA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c69398-f169-4795-e7a8-08dde47f1344
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 09:00:59.4534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxpFLN4ilNY5DbW56oSamBLpsIxLVYy+u4NqioKB5AHWRAruM5k4adt4nKLY7iwb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835
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

On 26.08.25 10:46, David Hildenbrand wrote:
>>> So my assumption would be that that is missing for the drivers here?
>>
>> Well yes and no.
>>
>> See the PAT is optimized for applying specific caching attributes to ranges [A..B] (e.g. it uses an R/B tree). But what drivers do here is that they have single pages (usually for get_free_page or similar) and want to apply a certain caching attribute to it.
>>
>> So what would happen is that we completely clutter the R/B tree used by the PAT with thousands if not millions of entries.
>>
> 
> Hm, above you're saying that there is no direct map, but now you are saying that the pages were obtained through get_free_page()?

The problem only happens with highmem pages on 32bit kernels. Those pages are not in the linear mapping.

> I agree that what you describe here sounds suboptimal. But if the pages where obtained from the buddy, there surely is a direct map -- unless we explicitly remove it :(
> 
> If we're talking about individual pages without a directmap, I would wonder if they are actually part of a bigger memory region that can just be reserved in one go (similar to how remap_pfn_range()) would handle it.
> 
> Can you briefly describe how your use case obtains these PFNs, and how scattered tehy + their caching attributes might be?

What drivers do is to call get_free_page() or alloc_pages_node() with the GFP_HIGHUSER flag set.

For non highmem pages drivers then calls set_pages_wc/uc() which changes the caching of the linear mapping, but for highmem pages there is no linear mapping so set_pages_wc() or set_pages_uc() doesn't work and drivers avoid calling it.

Those are basically just random system memory pages. So they are potentially scattered over the whole memory address space.

Regards,
Christian.
