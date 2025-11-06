Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A7FC3A21B
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 11:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0338910E87B;
	Thu,  6 Nov 2025 10:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LHNnUo8H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012011.outbound.protection.outlook.com [52.101.53.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB40E10E87B;
 Thu,  6 Nov 2025 10:13:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIMYi50lNcLitXprC+tY8/9+hpDA7oUvTT1jih3jY4+DX8M3+1zQ7ovGmX+OA2GYetbkXPfy2jAe9fXzyQ7k41wxqIF9XbuNLmdm8UK/tYdQUoMS8Hdc64Sun7ihvvEGyzBSItBzBPCeBqtKogSgP5uKXb7qds00kSgRayOSrGZ5J8ZA8rakxgvbsB35Qya/i4ADPkSeucZrhqqmhCO0BZ6T7TC/PbrS0xV+E9CP9jfv34Bu+uaYlEJnEERJ4xj3RRP7Ga3q6btbeeawYzrzvHmPc9VP+QsuD+KuB8pLY39mkGPXFG4IKrBm+hceAJ9xi6jsih0HJvY1kUq6toVfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oV7VXlCFNTS5ZMqnWBXevcDc24CntSGFVnOyFBDuCTc=;
 b=XHCl1KuKEMtf2szVxEQQRReAE4yyrRziJi2CdgEdbtktgBghQc3tqliTfScbu6rxZywpANhh4lMli64MZWzCHzx0kUdHOTiJhxClMjewmGiGByINMxMu5c8IzmuFShXcJlPShkNTPqiCQ9UKzMR2Rl0C1mFLYIE2bUZ9hhNyz8StOUEDpMls+T3C+FFSn2H7GHJEnZWdVz5KLJEtWUGCGz3CfdHPAzK2jITRh0L0Snz3p7wLeiMKKqluLFPiD1J83iZcoIEgmybI+TmmQH9qqZL0XqEYGzHVbjniEbJaBIpp0Nf6bEhxZxqnTsZib84MKpIvQ9BNYG4Wa3vmfiJiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oV7VXlCFNTS5ZMqnWBXevcDc24CntSGFVnOyFBDuCTc=;
 b=LHNnUo8HAORiN/NthPAHM6RYXokG3XY9JXvmh6pjT44KF/1G8jaqvc5j/bZgm9Jb7cDBQqrxMdSucBwZ2qf9xMoF/tcg126J/uzyRANczZz3DMe93oE92tX/Zp7roMu9oXXv+qHw7kxdbpxzGoKFVKmoggrcYPUSDOuWwAkVzjM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 10:13:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 10:13:46 +0000
Message-ID: <e6de55cf-35ca-42d7-8532-d4ea2ce9b48c@amd.com>
Date: Thu, 6 Nov 2025 11:13:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: Fix @alloc_flags description
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Intel Graphics <intel-gfx@lists.freedesktop.org>
Cc: Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zack.rusin@broadcom.com>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251106005217.14026-1-bagasdotme@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251106005217.14026-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:408:e8::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c6f50c-5cf1-4b4b-da9d-08de1d1d2bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODErUEt4MDFEUHY0QzVhYk55M085cDJDSE1SbWF3RTFtVUZlNXI3cG9zV1cx?=
 =?utf-8?B?N05LdHIwR2NFMGFqWERVK2ZTWkRmNjcxNXFiTUlsYitQSWlDbUVLczFOeENw?=
 =?utf-8?B?RTFMZkVvZ2dSYWdFcmJmWE1yMjUwOGdUcGRiQ25iQjVrQ29oSGhJeVVaZklt?=
 =?utf-8?B?NFE5UmR5T0RmLzhWZTBDSit3Z2lzdGJsYTEza1FsVFdTWmFnS2VMeGlzMWt6?=
 =?utf-8?B?NncrVUZqNExsaGY0a1NCcnE3NjV3Wlp0S1Z3S1MvSU54Tk04NnYxWm04MS8z?=
 =?utf-8?B?VDQxOXlRdE9hMVF4OVVZek5hTmNJSm90ejhaK2ozaW5ma084K25lVnpFSlZz?=
 =?utf-8?B?Uy9Vbk1vS0xSM0RqRmVxMHkvMm5CeEsxeDJLUXpwRGpxMHBkUWIxT0svOWk1?=
 =?utf-8?B?K00xOEVmcnpDYzhEOEhta3loaUV4eC9HWlMrRXlmc2I5azhZSWtnTGgwblhN?=
 =?utf-8?B?ckFlYk1RUHJHNmVCdkV2ZU9tVmVNbkp6V1g2Y1Z2SGpYZVc3MHg4SG1ZSXgy?=
 =?utf-8?B?VDhsTThuNzFjaS83TEJQbjN4SmdVTXh5ZThZYlhGZFRoaHRHaGYycmxqVmR5?=
 =?utf-8?B?YmgzcFFtQk9YMEg1YkgreTBKSklaMjk3aEV5K1E2MU5TRVd1MVVjTjVrbmVi?=
 =?utf-8?B?OXJGU05ldTZtZjY3SWEvaW02QjBxdVI4WlRuNklCNXVTVGJMUHVJWGROU3ll?=
 =?utf-8?B?VnpXS0FzcjZCaTJHaDdacXJKUXRhRjlXd3VWVXJtaThSYlRtU3RXT05xN0hO?=
 =?utf-8?B?aW83NG9xKytNOVFRazd3Y2R5NURaNER6RWRCSFR1NU1TRnVZeW9SV0FrMVo4?=
 =?utf-8?B?T3pHRjVqcVhidkJqa0JaOEc1eHJmQVRnaHBTOEtPVkZSbVZzaGh1V0MxcUww?=
 =?utf-8?B?ZktmWmxjcE1SYXlsNzBPOGMrZnY3QlE5Zy9lVzRYQlpVNG1QazFWZkN6Tkkx?=
 =?utf-8?B?S241aUc2R2xvcFhLV1k4eVNuVjFZeExPQmRYc1duN2VKS01qRDg1UmNWMm42?=
 =?utf-8?B?Y0xId1F1OU9LN0lIWFBERXh1eTRXcUcrMzB4OWJNTVd2RnFzUytBTmlmQi90?=
 =?utf-8?B?V201d2R4Vi9Da2VEN0dTaEVlN055RGtWd2RQd3VIR2Q3NjZYWE84YlhMYnUz?=
 =?utf-8?B?WU5HSVVaNmNRSlVjcitMZnUyK0tVQzJNYjlMSUd1aUk5Z3dsWFVOM1ZBMWVx?=
 =?utf-8?B?Qkl2YXU5ZXNsa09uU3A4NHlsakVScEtvdXV3TXZGOUhMbGJzL25DL0Y5LzBr?=
 =?utf-8?B?QmpPQnJoaEtVNzJzVEdSYlphZkZXRVRRWWNmMXkwZkNRMCtPY013aXlqQXVV?=
 =?utf-8?B?aFdYRkxLS2Q0ZDAxTHYzdU5lRys4TzVUTVVTcjhWY0xjMVZlMkJtc1JKTmJD?=
 =?utf-8?B?cVRreDYyYU01UnF3Mlpwc2Ftc3c3d1RsSThQLzdQc3BrV0lQc3ZRZHNoZHZw?=
 =?utf-8?B?eFhxeG82QldEZkR2SC9kejZEUWh0WjRlRGtTK2JJeGtNYlo2SHJ0ZldTanNL?=
 =?utf-8?B?a21Gd2tKQnhTZ3pwUlBpb210MG1MVGg2RXo1YXdlSlBERHJ2aXZobTBpcTEx?=
 =?utf-8?B?OWRGYkVoR05GR2FyRW13TXZvQ3hOUTB0Zjc4MG1oUytBeURPT2pSUkJTTTg3?=
 =?utf-8?B?TUErbklyNkVsVm9sN0NxZ1A5VTVXbDEyZWt1Q3hPUmM1YmtMNDhFSXNxUHZn?=
 =?utf-8?B?RFJnamxkVVBuZG5CTTd4RUlFeHJmSHhHdUh5NXpRVnlDSGZwLzVLT00vbkox?=
 =?utf-8?B?SUw5TmpqdTBjeWdUdHV6VVIvTG5Hc3JZT2ZZN1RCbC9zQjRUa3QvNHhYdlhi?=
 =?utf-8?B?bGJvdlBmTjZpekY4M1dSeWpSN0RVZVdJTWpzOVE5bENjM3dUbDFmdjVtcHR1?=
 =?utf-8?B?Q0tlbnF5ajRFWEc2WVhPTnpvZEpZTEVOd2lGOElWbHlhancrZEVuVkJNNTBW?=
 =?utf-8?B?TlJrNjhsd05QQkM1U21VaHkwMEZGY1BxMTdXWUsyd1Y5anhubXpXaU5CODN6?=
 =?utf-8?B?ZG1wVjlLMDJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWlxeFhybnIyQzg3dGpNdW1lRXVkSzQwVWlKbS9EdEJ4ck1xTVFuNjVGN1ov?=
 =?utf-8?B?Y25uelNVcVhaQ3hMSTViQ0YvZlh3bVBDZ2dlZ0l3cm1DV0pCZ3ljdGNPdmFJ?=
 =?utf-8?B?N0N3MmdrTTJaUDVhaUdUd3RuYS96YXlJeTloRWNiZjl5bUVFTnNnSENKRGVT?=
 =?utf-8?B?TmxQOGpJZkhkdFBhUjd4T003NUVzZGNqWndvS05lZyt1RGRGTExyT05rTXBh?=
 =?utf-8?B?Q2ZrY1ZOSE9FSHhHczdUSW84RCtXVWM1bjNJOFlVbWpRRlcrU1Bwb0w0dFA1?=
 =?utf-8?B?WmVNV0UyYlFpQWt0ZXZOVXhCSnplL0FsN1lmSktFZUhHcVJ2TFJJeUlWazBV?=
 =?utf-8?B?WC9HbGxLZ1RNNjNneWl0cnJLQWNyYldTeTQvN1NJSC9KUHV0eGg3eTAyTlF4?=
 =?utf-8?B?NmhuSXlRQXdkcXE1NE9ZeTV6Q052MG5QdE9zRWRDVzFydTFMS0E1cEZSaG01?=
 =?utf-8?B?bG56c2xab0RIa3plY2dXbWduczd2UTBZMjZlTE0vL01FVGlPSzJBZkQxRHBv?=
 =?utf-8?B?Wmt0WnZFYjBzWUZkeEpOSW5aVGdEZHVpOXFaZ3l3R2lGRjdPb05WVW9ZQ05U?=
 =?utf-8?B?dUs0SzdMUGxvQWtkckxPbExMRmphTVV1OEZ3dGVIcllodjZlK3FwWVk0WnVw?=
 =?utf-8?B?ckhJc1FIU09BN3NiTVlCVlowQitLdkozeFpGR09lbzBIb2VTb25taG1QWW5m?=
 =?utf-8?B?cVNXcGhVWXMyalF5cmVETzJQdUY3OHAvcVRPSnlYemx2cDVYTktkUVg4VDlh?=
 =?utf-8?B?M3BRb3VUN1ZMalY4OVNocWFOb3d3VXlYeVFrdy95UzZJN1FtUlFVazVyUnN3?=
 =?utf-8?B?RFhoU2RRK2RRRUNLL3NLdHNOODdyMHZyVzJhQ09VRFlyNFlmR2xoTHhDd0V3?=
 =?utf-8?B?ZXlWQzhDcjV3Ylc5Q3U0SzdjQXhVQTZ2ck9VOEYxb0lvMmM4bVcvenZZVldU?=
 =?utf-8?B?UE85Nk9yMEhjYTlFMnlNMks5WmlseUhpNnJ6TUF5bGZMLzF3Z3VvSVVlRmlS?=
 =?utf-8?B?MnFjbEN6M1RidmQzbGlJWDBKVW9oU1psVEk3cmgvbEZTOWV3TTFrT3kvMmRt?=
 =?utf-8?B?QUZGSCtBTmNGclJtVDJlSHVRZVROYmxYLzlSSFNFTTZGYnFhREFkYUxPd1Na?=
 =?utf-8?B?cXFoT25WZjBBd2F4OXBVS2lHTEFJZitEd3JkdDd0Sm1lbUR6a3JlclZReW1i?=
 =?utf-8?B?M0p0d2ZaOVhvTWlXNEhUZFVsMFpibnJ2dTF4UkNyYmZwUXYzVVVjTG5uSUtx?=
 =?utf-8?B?RVh3aElsQ0xiOHdzckFMTlNqUDdaNVp2aytFRmFNYW1PSkRBQjNCZXdNV1M3?=
 =?utf-8?B?U1ZIeDA0WUFOeFFUTVhYT2N3dm9ac3M4eHo4OEszeHJoQ0sxTm9hMFNzK1lu?=
 =?utf-8?B?OE1KWXlSS01Id3laZ0dpY0NLQVI0bUFxU3JSVUxNbzBOeGhyYldVSlVKTFAr?=
 =?utf-8?B?UzM5cUJuQk93dHV2aHR4c1J1VEVzdmJoaVVMOWpFVVNRSlV4SEVTdXdtWmp1?=
 =?utf-8?B?Z2NCV0k5YXJLeUFQNUE0cURqR1dFYThpaTJsc0QvWkluY2RvS2I0WkVUQkhm?=
 =?utf-8?B?Z0tsSWJoUmhjMTI4WnlHUk94UXN6bVY5aUViUTNiZ1h1S3FDckd2MzBqVG1V?=
 =?utf-8?B?b0c2djNXNzNXZERNU3NQQ3VHUWRDVWZhbG9mOHowUHVaQ21qV3FqcFZFOW9o?=
 =?utf-8?B?dVdZQ1p2RUhKUE9BbGVBN3hGVWZzUlNVV1B0S3ZhakpyZnFNQ09VamdxZGdv?=
 =?utf-8?B?Zm1MZElaZlZENEhxb0xnMDhiaVRwM2lJR1pqVE43N09OeWpQQlkvRU1rK0JG?=
 =?utf-8?B?R010dm9lbkkyWWZuZHhldDAxQUJGZGN3aGRObVlTN0VkOUc5SzhkVzZuaDJG?=
 =?utf-8?B?aHIxeTBTZENHTFpoZTVQeUYzeEF1N1EzY2s3bkZxWk5XeVpJbEJ2SXRITjJJ?=
 =?utf-8?B?VUw3S1BLYVZaNFgzZ0w1WnllbDMySWpJdS9tTnFQbms4U2hlaG9SNFdaUklC?=
 =?utf-8?B?RngxR3Nxdk1Zak44dWZNYVdKVEFOWmNkMHFROXVmN0tsMlhEVzhFK0ZZYzM5?=
 =?utf-8?B?WGtWVzFkQkM4UWxDZGhRVTZkTlZVN0RSam9SeVE1Wk9JWEYzc0VGUGxZdFBs?=
 =?utf-8?Q?Ny2WZpzMCypOafXFMKe0+o4Nh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c6f50c-5cf1-4b4b-da9d-08de1d1d2bf5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 10:13:46.3928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H78U8wfBm0GYI7/yWyywg8KbF/M+k9lf8aAVRv/cfpH+IrREkmPuWkZTL8nivvSx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649
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

On 11/6/25 01:52, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:
> 
> Documentation/gpu/drm-mm:40: include/drm/ttm/ttm_device.h:225: ERROR: Unknown target name: "ttm_allocation". [docutils]
> Documentation/gpu/drm-mm:43: drivers/gpu/drm/ttm/ttm_device.c:202: ERROR: Unknown target name: "ttm_allocation". [docutils]
> Documentation/gpu/drm-mm:73: include/drm/ttm/ttm_pool.h:68: ERROR: Unknown target name: "ttm_allocation_pool". [docutils]
> Documentation/gpu/drm-mm:76: drivers/gpu/drm/ttm/ttm_pool.c:1070: ERROR: Unknown target name: "ttm_allocation_pool". [docutils]
> 
> Fix these by adding missing wildcard on TTM_ALLOCATION_* and
> TTM_ALLOCATION_POOL_* in @alloc_flags description.
> 
> Fixes: 0af5b6a8f8dd ("drm/ttm: Replace multiple booleans with flags in pool init")
> Fixes: 77e19f8d3297 ("drm/ttm: Replace multiple booleans with flags in device init")
> Fixes: 402b3a865090 ("drm/ttm: Add an allocation flag to propagate -ENOSPC on OOM")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20251105161838.55b962a3@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>  drivers/gpu/drm/ttm/ttm_pool.c   | 2 +-
>  include/drm/ttm/ttm_device.h     | 2 +-
>  include/drm/ttm/ttm_pool.h       | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 5c10e5fbf43b7f..9a51afaf0749e2 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -199,7 +199,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
>   * @dev: The core kernel device pointer for DMA mappings and allocations.
>   * @mapping: The address space to use for this bo.
>   * @vma_manager: A pointer to a vma manager.
> - * @alloc_flags: TTM_ALLOCATION_ flags.
> + * @alloc_flags: TTM_ALLOCATION_* flags.
>   *
>   * Initializes a struct ttm_device:
>   * Returns:
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 97e9ce505cf68d..18b6db015619c0 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -1067,7 +1067,7 @@ long ttm_pool_backup(struct ttm_pool *pool, struct ttm_tt *tt,
>   * @pool: the pool to initialize
>   * @dev: device for DMA allocations and mappings
>   * @nid: NUMA node to use for allocations
> - * @alloc_flags: TTM_ALLOCATION_POOL_ flags
> + * @alloc_flags: TTM_ALLOCATION_POOL_* flags
>   *
>   * Initialize the pool and its pool types.
>   */
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index d016360e5cebbc..5618aef462f21b 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -221,7 +221,7 @@ struct ttm_device {
>  	struct list_head device_list;
>  
>  	/**
> -	 * @alloc_flags: TTM_ALLOCATION_ flags.
> +	 * @alloc_flags: TTM_ALLOCATION_* flags.
>  	 */
>  	unsigned int alloc_flags;
>  
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 67c72de913bb9d..233581670e7825 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -64,7 +64,7 @@ struct ttm_pool_type {
>   *
>   * @dev: the device we allocate pages for
>   * @nid: which numa node to use
> - * @alloc_flags: TTM_ALLOCATION_POOL_ flags
> + * @alloc_flags: TTM_ALLOCATION_POOL_* flags
>   * @caching: pools for each caching/order
>   */
>  struct ttm_pool {
> 
> base-commit: c553832116b8d0039b13ae84d1ed06e7ee4f1fdf

