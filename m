Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BB1C79ACD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 14:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0294310E87E;
	Fri, 21 Nov 2025 13:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W3RJAwz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010045.outbound.protection.outlook.com [52.101.85.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E204F10E87A;
 Fri, 21 Nov 2025 13:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/XiY9LHPB2O8bRt600oj/iDoh/dP56NCAhAPaAmrbC+OlW/HHv+FQWki4QLgOZk6HW6YuwjhH4OwsGjxS11h/n/XwUED4rf8R8KY/uYb2eFIAhxjbOCNlOQo4dQwNBBLQosl+Q2Svw6DPKUMkhsHBKC8qJAZsgcjvVl057BUelNxyrJv6uupx2UPdv/PuddsLUYUERveuEEF7xVuW9Td+J5NHuZq1X41B4BxcBiTzcGBymkwVYUPdqrO5nVZAtsPgkYPIhGcsDiX+goYc9XFfRTaUh2zUe5s+tiyffmQpX1QtjKPkPhxQDh+KDzs3lt1t6jUuBjrw9k+jsGa0HVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZdiT29MzNZE0bHeEy44w+qZimmpdpWqckBQgK5HRQ4M=;
 b=lq0R5uGzjmPPc07xHiAsFWMUb4rgE9aY2iF8WuurFqdmwvxGil6yDPCkiUlaj6MAg5l/j1fUZ9ejO87u93Nt+xiX3sYFzp8QQ7RPU7fj2HXEWoI74ZNQSkrZabPFU4+e3+DZcXXMvMvQCxQfUqrrzWmKn0/dnuWlQj6FlhA95e2/dACRS7KccbneRCw/6FvOVY8LdMuPjrBjnYY9VBWgpeEN84ebWxD3t7JkGCgHbb+SLY5nwqM8Q9a5RPW5p1ubuOIWGx7KgVekfCvU678oGDyWFWKJOntNg5b7PS3aX0AQpztT73w+SzIaAtHIfDGqx3hTK/QkZwZpKuaFE8CA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZdiT29MzNZE0bHeEy44w+qZimmpdpWqckBQgK5HRQ4M=;
 b=W3RJAwz946altl9J8Cusk+TIxrUHAxxlYzlOdTYRLrHzwlJkGP/AV8IEzW8kxsVNrS/daOGUyvmqPf//jdFFG7cqBpaFl5SoVeF5HK4ZoMYwMOomTTEadxcD1OWbnUPpUTsMRSUz8FDzDcqA7dQq/uuG+iC1POzhJQsOOKrGxiM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB7084.namprd12.prod.outlook.com (2603:10b6:a03:4ae::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 13:50:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Fri, 21 Nov 2025
 13:50:36 +0000
Message-ID: <3246ca6a-0ccc-4d5e-b5ff-f23fafe39c00@amd.com>
Date: Fri, 21 Nov 2025 14:50:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/28] drm/amdgpu: remove
 AMDGPU_GTT_NUM_TRANSFER_WINDOWS
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-13-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251121101315.3585-13-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:3:18::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB7084:EE_
X-MS-Office365-Filtering-Correlation-Id: d1a163dc-d18b-4ea8-540f-08de2904f255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHlDQ3hFMS9yaG1qVldJaXVmNTRDcmpiSEo3QlZLUXJBL0RVMmdKbGE1U0Qr?=
 =?utf-8?B?MHNPUDVkMlYvdFBFNTBRbEgzaWFRZXQrOVI0M1BaSlFXdFJwREZhSHBSYnF3?=
 =?utf-8?B?VGlnMFlSR05sSUY0RXpNUllxS2RyNGdKYWNETnN6TjkzRmt0bjFBZjU1Ri9J?=
 =?utf-8?B?T0tvWTJHUjNnSHFkaHNUS2crMzljSEZzcEIyNHFlTVptdnVBekYwMDM2b2pD?=
 =?utf-8?B?QkIyWU1JM3JsRCt5NVNZTUJoUVFQUVFHTGZmUUtvT2UxSGE0QURadUQzZ1A5?=
 =?utf-8?B?SjBzaVowNFdHeDFLUTlPdmkrQ256UVNmNEZaSkFuQmg5Y0ZmaG5kdU5SMnQ3?=
 =?utf-8?B?bHR5MEdlclFNSTE2V2E0ZWhmZXRUSTVPeCtsbjBSQjR0U0RqOEduc0MwdEFw?=
 =?utf-8?B?cGhBaEhDbDBoZ1gzKzVVcURTRi96TDA2VHFQb2R6L2NCbFV2bGUrb3ZWZUQx?=
 =?utf-8?B?K0owVkp6bjcwV0F4emNBNTdnMWYvSHpjck9PdTIyYWFxaWVYTzltRHdieVcx?=
 =?utf-8?B?UTRTL0hBZ21oMGlzV0pIZmFYaGMyaUZVS2VtQXl3dlJ5M25udTJKVmZlQ3Mr?=
 =?utf-8?B?Q2U5azcySHZEOGczRkxHWlJ5S3dOSmpDT1JZVlRtOVYxUTBPOTVIejBrUkZG?=
 =?utf-8?B?amlOQkwvQVcxcXp1elY4eVB0Ym5icjEyQ1gwc2lLaVZscXBpNk9xcGQxTXZG?=
 =?utf-8?B?dG40cTFaTC9jQmJFRHBaZE5JTW5qK0dvQmxiekRPcUdOM3E3L3dsRlBid3Rv?=
 =?utf-8?B?ZlduR2xKZEg4MjlTUmRYQ3k4MHR4RG0wZUd6QXl2RnNZZzhUWk5hMGJZUE1B?=
 =?utf-8?B?NC9YSVpkako0UXhNQjdzbWN6di9hWTljY2ZPd2JkeXJGMmpFNHZSVmZjcCtz?=
 =?utf-8?B?czJPR0h6Y3RDM2NtVjlkZjFJajVZOUhvV0YvWXp2bWNZV1ByYUZMZGMxUjRi?=
 =?utf-8?B?ZEJ3RWdkdUxGODI5cmhyWFUxcW1ITnNQWGhQcXc5a0hGazJ2cGY2YkU4NFQ4?=
 =?utf-8?B?V1l0NytNa2FNT1ZadGRLdGQwRXROYzRQdU5ZRWhQRDJscC8wbXJjL1J0cW1M?=
 =?utf-8?B?djc0L0dpWFBON05yeVk2Sk5xMEFmS3ZoSGRWN2tzZGRzN1NqZUtlaW1qV0tH?=
 =?utf-8?B?MnVueUNoZEcrNERRQ09DVitpVXBxOU1nTG9zWFZoaUNyTEpWYkR3VnorR0VG?=
 =?utf-8?B?V1Z5SER2OVhFQk5RZDJwRnNSbjhFcFYzZHRMbTJjNFhBdzNubU9pZWt3Q3lM?=
 =?utf-8?B?WlJUTGZIMDlCemFmK0lWTVlGNkhWUU9NelFNdzlHU1AxWlovbHFHOWVqejJ4?=
 =?utf-8?B?N09iaWVvVTRQcmQwWFh6SjZrRFhCY0JES0hsQzVQUTZnSWQwUERrTnllVTFO?=
 =?utf-8?B?MFdRYWtCY2tHaHhNRytUSk9OMnB0OXZKNWhEQmdVTy9xVTVLeTEzc2M4TDNC?=
 =?utf-8?B?b0I3R2R6RXNtOVRRWkQrZUxPOWQ2NDdIdDVDS2VmK2R6MzI0U04yVnM0UlpL?=
 =?utf-8?B?Ui9oenZnUnJuRVBteXNqRDg3WktKSFA5WTc5cVNNZko3OEJNZWFld3VKWjNt?=
 =?utf-8?B?cktRaHQvTTJHUnYrSUpZVktlYVVnVDVTK2tvRlo2K2RWRWRrQThqZDJnOXcv?=
 =?utf-8?B?RTBSLzllcys3bjVkcG5TUGFXTEd3SmpndVQ3MU5LaXZ5RE5hYXE4N1lOencv?=
 =?utf-8?B?NVRmQi90UVkxL0pKbnBFamFQUmV5aW8zOGdVVVhKbU02d0tKM2hEZEhxakZX?=
 =?utf-8?B?eHJUMU1MaE93L3o1YzBLaGZxaFBmaVk4SmdoWTA0SzlKL1VnL0QyaWhIei9L?=
 =?utf-8?B?MEE5OTlyQkl0cGwzaTkwYi9IR0ovSUtUZVNVU0RjZDQrM0pLZE1uOHh5UW5w?=
 =?utf-8?B?SEVBdUxoMFdmZW5Rd3hISzhtYWp6OGx5SXZia3BDZGJwSUtPSUplMHNlQVda?=
 =?utf-8?Q?SzPvo2BYE64X0ZHDXeQteIiJ3rbn8VjW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmMwbjlqd2RXN3FIenc3akZlb0VzZlhUTnU2elJjdnMvRnQwSG1rZHQwY2hH?=
 =?utf-8?B?Nis4THU3SFRKYlkxaDdacllHUitNYUJDQXpOS2xTek5GUHJZclIwVmJCbjJV?=
 =?utf-8?B?MEkrbG8wS0JINmVzVjkvbXBrbzdSS01abmRCWFhnUDlZUkx4Tm9RdWhHVkhO?=
 =?utf-8?B?Qms1VWorWC9QK0NyOWk4UEZ6T2taMkxnQk4rem9URjZFZEV2UGJzeDcrQ0dR?=
 =?utf-8?B?TWtyY1ZOQ2dTNUxmdEdOTXZHU3Nkd25NdnpYU2RvN3IvcC9NaFh6b2x0bnVy?=
 =?utf-8?B?OHRuYVZyWldEMUNmL25rV1paMlJvSEFpemNvSS9NVS9jcGJ0THl0M0xoUmpZ?=
 =?utf-8?B?dkIwdlFvMzFlWFVWeTR4S1h0YXNnSEIvdVFEN1VkZkdsVEFSOXBBb2Zvakg1?=
 =?utf-8?B?M3pGRUNvS091MmU0dDdwcUNxK2ltWnhZWCs3dVBjOTRRcWZIUmlDSzBzUThJ?=
 =?utf-8?B?UXZHNDhQZGQvY0w5YUVFUHgrT2w2b3ZLSDVVWCtpWFZaeUdSbWJkVUVJWDFK?=
 =?utf-8?B?UFpjU1lvbEd4bjF5dXhZVlhTVUJ1ajYyemhCeFNsNnYxWlZnNlJ6VDV4LzJQ?=
 =?utf-8?B?OExIOFh4aUY4K09CaWh3bXVpdHMwQU55WENXeDVDSzJuK1QxZjhtNDMwTXJ3?=
 =?utf-8?B?Y3pKYnYrS2QzckZMWURDOHBjOTdTRE9jRGM4MEdIbmVJT3hxTnRKRHN2a2NX?=
 =?utf-8?B?blptRnIvaXlMNnNWRnVsNmZjbXVxWStxNzNOWTB4QjRnL3V4YTdGc003dUlJ?=
 =?utf-8?B?QTVoWXpkOXNwTVk5WkFUUzNVd3NZOFIyeEZvVTZ5M3BJaENncVRNR2N2My9N?=
 =?utf-8?B?T01vS3VPeEtNVS9jU0NrLzJzRzB6MXVwTnFyOUhwek1iU1ZydjFTamlqVk50?=
 =?utf-8?B?OWJqRDBPMTZYQ2xRS2MxWmc3S0NLSHNGU0lJbHZsVzN4cWRjUy9tTFJONW5z?=
 =?utf-8?B?RW1ObStseFBRdk81bk5HZmRFZXhMNXRVNVo2aFMwcWRSS0JUV0R1NFhsbkFM?=
 =?utf-8?B?ZzZ0Yi9oOHZ1MUthTzNndEN1T3gwUTdxTzRZajFVamdpQVlwZzNEZlJhTER3?=
 =?utf-8?B?enNDVFBtUXErWlY3OGRPb1l5U0M5aGwwVWhQNXNCQkRLTkNySmxGaHk1SWMx?=
 =?utf-8?B?aUFIS2t5NFFmbEhpcXp3aXNYK2FpM2RRaCtCem80MnRKb0RHVmJNaG14SytZ?=
 =?utf-8?B?SjNncFJRSTl3YVFMSkZwdWdWNkNKYlZqTEE5K29FT0IzV3VaaWgyN1h6RTkw?=
 =?utf-8?B?OG4wSlNpTWRENkVMelk5Z0NuOWZZK1M1L3YxSEdwMkpZb0lYRXZxb09nSXQ4?=
 =?utf-8?B?RzdvT3QzanBaa1crMHRmQWZ4RmhEMzRVYmtZd1JUQWxhRC9tSGtoaVN1RzJa?=
 =?utf-8?B?eTAvZmRYOGxxclhZSGl5SXIrOFhpbURHUklrVUxnQVZ1aHhodTZUMXkxcytG?=
 =?utf-8?B?WE5maGp3S3kwNEdlMDBvcmd2NlFkWWx6TUo2elhsYWxIbnRjR0tDanNqeGVv?=
 =?utf-8?B?STJSYlN5MGVDbGNVZzNNRmlEbWVDYlg3WC9hMEdZU0xrNFQ0RWJBcnN2Q1Z6?=
 =?utf-8?B?WVdxRm45bGh3bE5uZ2JOTG9FbVR1dlpUNm94TmZsQ0JaQ0Z4M3Z2UWFuR2VT?=
 =?utf-8?B?MnZhWnFYRWdsVmFZd2ppNlpzN0l1T0tJaFZDaSs2TEN3bVFlV1NuRFFZN21O?=
 =?utf-8?B?cWdJc2c2d205OGxrZGxuMWtDL3VqZlpidVpoZWlnVUVJaWtuVjlnejhGSGlE?=
 =?utf-8?B?enZCRlNiOUJzd3c2cXRvUTdDdEQ0bVcvZXZHRHpzV1NUS0t1M0xmZDM2aHkv?=
 =?utf-8?B?Umh4NUE3M09jQ1I2dXpoL3p6YUhkUFhnZ0dOTE1rU1pCZXhDSzBiVEVPU2sv?=
 =?utf-8?B?V2hkMStZUVFCbjRZblpqVzFKQVFOS2g3c2JDZi94TE80TGdIdm9pVDlFc1RZ?=
 =?utf-8?B?NERvVm9iUTFqWmhjUVZLaDJLYnlEdG9EcGMyUG1KSDZaWGFmeHVpRFg2RFdr?=
 =?utf-8?B?b3JaL0h5akQwUlV6dzdIYktYdDhFeExYR2NzVWZOeU1WSGVWbkl5VXN6SmhK?=
 =?utf-8?B?a3VyZnFpVGFBVXR0b0dBb0w4ME9yVFlFYkp0ZlJ0RkVYRUZFOFpkZDVBVzhp?=
 =?utf-8?Q?BXDcgbg2Xn6OdjmIrB0MpBqrg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a163dc-d18b-4ea8-540f-08de2904f255
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 13:50:35.9750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eLN2bFMngpCl0roFD+TqIeMntXMedIPLhIks1LovQPGQiFsmyvahXsiBPlMzQJVY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7084
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
> ttm is going to use a variable number of windows so we need to get
> rid of the hardcoded value.
> 
> Since amdgpu_gtt_mgr_init is initialized after
> amdgpu_ttm_set_buffer_funcs_status is called with enable=false, we
> still need to determine the reserved windows count before doing
> the real initialisation so a warning is added if the actual value
> doesn't match the reserved one.

Reading that I just realized that we have a chicken and egg problem here.

When initializing the driver we know the maximum number of SDMA engines we might see, but we don't know if all of them are working.

So we need to initialize the GART and GTT manager to bringup and test each SDMA engine before we can figure out how many GART windows we need.

*sigh* We probably need to re-iterate over the idea of dynamical allocation of GART windows.

It's most likely not a problem for current production HW, but most likely become one sooner or later.

Should we clean that up now or postpone till later?

Regards,
Christian.

> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c |  8 +++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c     | 21 ++++++++++++++-------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h     |  7 +++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c     |  6 ++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/vce_v1_0.c       | 12 ++++--------
>  6 files changed, 32 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 895c1e4c6747..924151b6cfd3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -269,10 +269,12 @@ static const struct ttm_resource_manager_func amdgpu_gtt_mgr_func = {
>   *
>   * @adev: amdgpu_device pointer
>   * @gtt_size: maximum size of GTT
> + * @reserved_windows: num of already used windows
>   *
>   * Allocate and initialize the GTT manager.
>   */
> -int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
> +int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size,
> +			u32 reserved_windows)
>  {
>  	struct amdgpu_gtt_mgr *mgr = &adev->mman.gtt_mgr;
>  	struct ttm_resource_manager *man = &mgr->manager;
> @@ -283,8 +285,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  
>  	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>  
> -	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
> -	start += amdgpu_vce_required_gart_pages(adev);
> +	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * reserved_windows;
> +	start += amdgpu_vce_required_gart_pages(adev, start);
>  	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
>  	drm_mm_init(&mgr->mm, start, size);
>  	spin_lock_init(&mgr->lock);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 1371a40d4687..3a0511d1739f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1907,6 +1907,7 @@ static int amdgpu_ttm_buffer_entity_init(struct amdgpu_ttm_buffer_entity *entity
>  int amdgpu_ttm_init(struct amdgpu_device *adev)
>  {
>  	uint64_t gtt_size;
> +	u32 reserved_windows;
>  	int r;
>  
>  	dma_set_max_seg_size(adev->dev, UINT_MAX);
> @@ -1939,7 +1940,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>  	}
>  
>  	/* Change the size here instead of the init above so only lpfn is affected */
> -	amdgpu_ttm_set_buffer_funcs_status(adev, false);
> +	reserved_windows = amdgpu_ttm_set_buffer_funcs_status(adev, false);
>  #ifdef CONFIG_64BIT
>  #ifdef CONFIG_X86
>  	if (adev->gmc.xgmi.connected_to_cpu)
> @@ -2035,7 +2036,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>  	}
>  
>  	/* Initialize GTT memory pool */
> -	r = amdgpu_gtt_mgr_init(adev, gtt_size);
> +	r = amdgpu_gtt_mgr_init(adev, gtt_size, reserved_windows);
>  	if (r) {
>  		dev_err(adev->dev, "Failed initializing GTT heap.\n");
>  		return r;
> @@ -2174,17 +2175,21 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>   *
>   * Enable/disable use of buffer functions during suspend/resume. This should
>   * only be called at bootup or when userspace isn't running.
> + *
> + * Returns: the number of GART reserved window
>   */
> -void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
> +u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  {
>  	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
> -	u32 used_windows;
> +	u32 used_windows, reserved_windows;
>  	uint64_t size;
>  	int r;
>  
> +	reserved_windows = 3;
> +
>  	if (!adev->mman.initialized || amdgpu_in_reset(adev) ||
>  	    adev->mman.buffer_funcs_enabled == enable || adev->gmc.is_app_apu)
> -		return;
> +		return reserved_windows;
>  
>  	if (enable) {
>  		struct amdgpu_ring *ring;
> @@ -2199,7 +2204,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  			dev_err(adev->dev,
>  				"Failed setting up TTM BO move entity (%d)\n",
>  				r);
> -			return;
> +			return 0;
>  		}
>  
>  		r = drm_sched_entity_init(&adev->mman.clear_entity.base,
> @@ -2230,6 +2235,7 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  							     used_windows, true, true);
>  		used_windows = amdgpu_ttm_buffer_entity_init(&adev->mman.clear_entity,
>  							     used_windows, false, true);
> +		WARN_ON(used_windows != reserved_windows);
>  	} else {
>  		drm_sched_entity_destroy(&adev->mman.default_entity.base);
>  		drm_sched_entity_destroy(&adev->mman.clear_entity.base);
> @@ -2248,10 +2254,11 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	man->size = size;
>  	adev->mman.buffer_funcs_enabled = enable;
>  
> -	return;
> +	return reserved_windows;
>  
>  error_free_entity:
>  	drm_sched_entity_destroy(&adev->mman.default_entity.base);
> +	return 0;
>  }
>  
>  static int amdgpu_ttm_prepare_job(struct amdgpu_device *adev,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index a7eed678bd3f..2a78cf8a3f9f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -40,7 +40,6 @@
>  #define __AMDGPU_PL_NUM	(TTM_PL_PRIV + 6)
>  
>  #define AMDGPU_GTT_MAX_TRANSFER_SIZE	512
> -#define AMDGPU_GTT_NUM_TRANSFER_WINDOWS	3
>  
>  extern const struct attribute_group amdgpu_vram_mgr_attr_group;
>  extern const struct attribute_group amdgpu_gtt_mgr_attr_group;
> @@ -134,7 +133,7 @@ struct amdgpu_copy_mem {
>  #define AMDGPU_COPY_FLAGS_GET(value, field) \
>  	(((__u32)(value) >> AMDGPU_COPY_FLAGS_##field##_SHIFT) & AMDGPU_COPY_FLAGS_##field##_MASK)
>  
> -int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size);
> +int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size, u32 reserved_windows);
>  void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev);
>  int amdgpu_preempt_mgr_init(struct amdgpu_device *adev);
>  void amdgpu_preempt_mgr_fini(struct amdgpu_device *adev);
> @@ -168,8 +167,8 @@ bool amdgpu_res_cpu_visible(struct amdgpu_device *adev,
>  
>  int amdgpu_ttm_init(struct amdgpu_device *adev);
>  void amdgpu_ttm_fini(struct amdgpu_device *adev);
> -void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
> -					bool enable);
> +u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev,
> +				       bool enable);
>  int amdgpu_copy_buffer(struct amdgpu_device *adev,
>  		       struct amdgpu_ttm_buffer_entity *entity,
>  		       uint64_t src_offset,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index a7d8f1ce6ac2..56308efce465 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -459,11 +459,13 @@ void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp)
>   * For VCE1, see vce_v1_0_ensure_vcpu_bo_32bit_addr for details.
>   * For VCE2+, this is not needed so return zero.
>   */
> -u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev)
> +u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev, u64 gtt_transfer_end)
>  {
>  	/* VCE IP block not added yet, so can't use amdgpu_ip_version */
> -	if (adev->family == AMDGPU_FAMILY_SI)
> +	if (adev->family == AMDGPU_FAMILY_SI) {
> +		adev->vce.gart_page_start = gtt_transfer_end;
>  		return 512;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> index 1c3464ce5037..d07302535d33 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.h
> @@ -52,6 +52,7 @@ struct amdgpu_vce {
>  	uint32_t                srbm_soft_reset;
>  	unsigned		num_rings;
>  	uint32_t		keyselect;
> +	u64			gart_page_start;
>  };
>  
>  int amdgpu_vce_early_init(struct amdgpu_device *adev);
> @@ -61,7 +62,7 @@ int amdgpu_vce_entity_init(struct amdgpu_device *adev, struct amdgpu_ring *ring)
>  int amdgpu_vce_suspend(struct amdgpu_device *adev);
>  int amdgpu_vce_resume(struct amdgpu_device *adev);
>  void amdgpu_vce_free_handles(struct amdgpu_device *adev, struct drm_file *filp);
> -u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev);
> +u32 amdgpu_vce_required_gart_pages(struct amdgpu_device *adev, u64 gtt_transfer_end);
>  int amdgpu_vce_ring_parse_cs(struct amdgpu_cs_parser *p, struct amdgpu_job *job,
>  			     struct amdgpu_ib *ib);
>  int amdgpu_vce_ring_parse_cs_vm(struct amdgpu_cs_parser *p,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> index 9ae424618556..dd18fc45225d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v1_0.c
> @@ -47,11 +47,6 @@
>  #define VCE_V1_0_DATA_SIZE	(7808 * (AMDGPU_MAX_VCE_HANDLES + 1))
>  #define VCE_STATUS_VCPU_REPORT_FW_LOADED_MASK	0x02
>  
> -#define VCE_V1_0_GART_PAGE_START \
> -	(AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS)
> -#define VCE_V1_0_GART_ADDR_START \
> -	(VCE_V1_0_GART_PAGE_START * AMDGPU_GPU_PAGE_SIZE)
> -
>  static void vce_v1_0_set_ring_funcs(struct amdgpu_device *adev);
>  static void vce_v1_0_set_irq_funcs(struct amdgpu_device *adev);
>  
> @@ -541,6 +536,7 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
>  	u64 num_pages = ALIGN(bo_size, AMDGPU_GPU_PAGE_SIZE) / AMDGPU_GPU_PAGE_SIZE;
>  	u64 pa = amdgpu_gmc_vram_pa(adev, adev->vce.vcpu_bo);
>  	u64 flags = AMDGPU_PTE_READABLE | AMDGPU_PTE_WRITEABLE | AMDGPU_PTE_VALID;
> +	u64 vce_gart_addr_start = adev->vce.gart_page_start * AMDGPU_GPU_PAGE_SIZE;
>  
>  	/*
>  	 * Check if the VCPU BO already has a 32-bit address.
> @@ -550,12 +546,12 @@ static int vce_v1_0_ensure_vcpu_bo_32bit_addr(struct amdgpu_device *adev)
>  		return 0;
>  
>  	/* Check if we can map the VCPU BO in GART to a 32-bit address. */
> -	if (adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START > max_vcpu_bo_addr)
> +	if (adev->gmc.gart_start + vce_gart_addr_start > max_vcpu_bo_addr)
>  		return -EINVAL;
>  
> -	amdgpu_gart_map_vram_range(adev, pa, VCE_V1_0_GART_PAGE_START,
> +	amdgpu_gart_map_vram_range(adev, pa, adev->vce.gart_page_start,
>  				   num_pages, flags, adev->gart.ptr);
> -	adev->vce.gpu_addr = adev->gmc.gart_start + VCE_V1_0_GART_ADDR_START;
> +	adev->vce.gpu_addr = adev->gmc.gart_start + vce_gart_addr_start;
>  	if (adev->vce.gpu_addr > max_vcpu_bo_addr)
>  		return -EINVAL;
>  

