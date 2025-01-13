Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1EA0B3AD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29B710E5FF;
	Mon, 13 Jan 2025 09:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LmU719Me";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2054.outbound.protection.outlook.com [40.107.237.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 943E310E5FF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:55:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0aMSJSd17wJg+iBz8izmypnVqtdm9RvibCGP1Fz72Ay+s6uAeOSpVQQB5Bh5m9AzprPQOv9Zq65PeG5jaBp++Pmgv0CE/1MXrMsvvJJGm/A2Z5pbjUvZEKZU8VOMbIE35R/dPM+OJHRIIyF0aBwIq6Nl0jc6mSr5MdN4QujxyGajq8f5+g764yJ6jzgXZDVzLK3FQ/e9XQapa8sXFoPeZ59Z7uK01QoiEqRcr1gHMh/tJjxItWmSzmy5xf57QV0NDkBeJhQ2wzxyygz9PVI78dWohD2Hxk5gtq/BMI8jBaliZqocme1LkroOj4+vn/wQhz3JD5+GYRbm3WhKh8deQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIEEf9W9RLag2oSIDzicbj3zUR71SFWzhFozh4exX2I=;
 b=QsSzBw7V3qswEW7h3TSrPMocSyCVAK0Wf79zruOxb3psR1uXkCwhRzuckQMZGjQ1uu4gIP9B6H/N5oCv3DyYa81Qb/RRFh+uH/GmWgXuv4kWR6/yMtfxEL6cZpgglkmhjIPjc/07MluodBUmRr1fuWNhtadarnFlzeavwRj8Cb32YjtFRZQB4mJzbE546P3D2sQ+Hatk+ibECXeKDN5ETvxm+/7kv7hzIXS/F6ruPq+T2RMAXU/+BBLiaMCfMg2ANCJEsva/KmTRT5F6MfDvMmKwRwwCwAIOKNlQGKaJcGkWN1tqowljqoMSIsZwbW5zcv3nUPYyEtY/YdvZHPx6zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIEEf9W9RLag2oSIDzicbj3zUR71SFWzhFozh4exX2I=;
 b=LmU719Me6n/rMIV+6ZXwSxw/UOt6mRMpn6PVzhQO3m3WxhLY3dMofp3QLSRcXBFZ4+j5bECfMPSMSIIDpCictUyZFi4etjETLe7yT1rW22ky/26hrbZS0bCCNddCkteSY4NKdy0/3BroJqBwQjYocNvYS/7pNbbk3PO7v5CsXKw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7237.namprd12.prod.outlook.com (2603:10b6:303:22a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 09:55:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.015; Mon, 13 Jan 2025
 09:55:13 +0000
Content-Type: multipart/alternative;
 boundary="------------zrADLnMUL12KExCmSKi0uiuC"
Message-ID: <b055ff59-4653-44d9-a2e0-bb43eb158315@amd.com>
Date: Mon, 13 Jan 2025 10:55:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: Philipp Stanner <pstanner@redhat.com>,
 Philipp Reisner <philipp.reisner@linbit.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
 <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
 <CADGDV=U_7CdkdEiLX9kj9yHsXhwb5zP_eGXpwmrj20cmgzMAtA@mail.gmail.com>
 <eb5f3198-7625-40f4-bc23-cac969664e85@amd.com>
 <582e10673bb749f18ebf8a18f46ca573df396576.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <582e10673bb749f18ebf8a18f46ca573df396576.camel@redhat.com>
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d5014f-a856-4ad3-39d5-08dd33b85fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXNNNEFkdXdhMGU4L0hjbW9rUlpJd3dmN0wzWC9veWZyMW5JRm5XcjRzd2pt?=
 =?utf-8?B?OHJvdXVWb0xkalROY0lsK29ZdDQ5eURaWHZ6UzZwKzdzc0gycFRCZGNmVS9r?=
 =?utf-8?B?RWg3Y0hqWm9TU0RrL2ZtbXJDS0VkMjNDa2ZhYmh3SThYWUJyQWlFbnZDY3RN?=
 =?utf-8?B?eFVHeWwraTczZFNEVDZtK1NwYmUzTEkrUXJ0LzIzRVBNeTdmMmw3VG1ZR0M4?=
 =?utf-8?B?Qy9OenlrNlVCaWdrWE5jVjBaWHRKTWU0ZXV4NHJOY2lQTVNDN2UzS2JybzVv?=
 =?utf-8?B?dXAvWUJRdjVmNGo1K0ZhZ0UxTmEvUE9BeTB2OVE3bCs5YnQwVkpwaWJSOFdn?=
 =?utf-8?B?UlM1dzdOczJBR0xRSVZ3bGtjYXEyWGp2WGp4S05qQ1VmYW95QlMvVExodU5X?=
 =?utf-8?B?dmh5SDhta0xVMTFZL2Z4WklDck90RlJVYytON3RRNmNITXRzeFRCWXNTTkg3?=
 =?utf-8?B?WjNtejkvVkZtbnhTM3lzQVB4OFdzZW5yak5kbDhhSjdXOWJLNmJES2EwMGFQ?=
 =?utf-8?B?QWlCM0RoVTA5MGhOdDVuK1N0ZW55c1ZZc3I2WHJ0Q1RyZDVJQldKYVgxN0Vm?=
 =?utf-8?B?eHNHdHVRVW9RRU1uY3QwQmcvMWJrcjM1bng0aHRFTnp2TjJCS1BOOEJUU1Ew?=
 =?utf-8?B?bDRxT3ZPeU1aR1YvMi9BQ3IrYjFEcThIc3V6aFpCcWx6ZW8wRHhGZ29vWHFw?=
 =?utf-8?B?ZUZPUTRDNDl1anduYlQwRmFZMGtwK0tCNkhxQktGSnJldHMzdmRIbFBmY0N5?=
 =?utf-8?B?ampTV1NGd3o2dlRidFZvMmZhY1dJZUYvNExqd2hCTUxwbzJGcTIwd2tLU1A0?=
 =?utf-8?B?b0RHMlJVTDBIZ1cvZXFCaFAyUEo4bVZrMnJjWDdTRVRWdHFiMk1mcUw2Yjli?=
 =?utf-8?B?RURnUzM0UGk2MmpSQlJiZXlQUWlZSDJ6alM5RDhQK0lEbFVrbzlwMjBJV1oy?=
 =?utf-8?B?c09CV0FvNmxYYmYxdEk1QnJoZmdLN1BCUFhpclpyNlE5aHRaalRpR2w1ZTAx?=
 =?utf-8?B?N3dNeHhXRlRaUXpsem1CbHlQSmhvZFNBaDBOOEFrK29pblc1RzU5NEJKOVQ0?=
 =?utf-8?B?NUxBUzB2TGcvVk9mWnlSS3orcTFEQ0xIc2VoOEk1bWErTFJkVUZaa291YmR1?=
 =?utf-8?B?UitSUzlVSi9ZZll2U0kyWm1LVnRiYU04VU9ieGVmbTI0UzFwRGtlMW5JMUZY?=
 =?utf-8?B?MXNkdUZKNU81a2tXN1lvUWoreTFUR1A5dlFhQ2FXT3J4cDJPNTdaOVNNRDE5?=
 =?utf-8?B?Mi8vWVUvYnNVbmpXQWtrT3M4aXFoYWpzMmVxTzhMOWpOaDdsalQrd0FCUTNs?=
 =?utf-8?B?UnlEbHV0R0dHeUQzd3IwVDcxUlBDK095T09pL3VsZElPbG5Lc29YVkR2RlRB?=
 =?utf-8?B?WlRvTVdPM0pZMjY2c3hWaW5VcnBFbDVhVXpBSWNYdUtaLzF3NlBMR3NmcFFZ?=
 =?utf-8?B?STZJZFBLTU8zNC94OWk2N3JYQjg3NlpabHBqQ21SYjdsbmoyazZmc0x2aGZM?=
 =?utf-8?B?QTFkMkJhRFY4WlRLRStRcmRBRFJkWE5NRmRaSTV5dkpwc01aSEtxd05VVThr?=
 =?utf-8?B?SEJrZXZtMGhqZTVwZWt6dnZyaDBTN0pBZ2FlVWpRdW9KM0tWWGJOcnVNakpq?=
 =?utf-8?B?YVl2UStINDk1eG1SZk12cWhZb1ozSDhYRzZYOWNiZGtWK3VEbDVWVTVTUDk4?=
 =?utf-8?B?SjZSZTFwa1JReHE5UkFDVVBJU2VqYlovZGE4cnZuVUFBcHVKUXprWU4wYkw3?=
 =?utf-8?B?bzdGZXROaTYrOWxxbW5Ka3Z0TENZL0EvTGZNejRyWjE5MDRxLytaMnR6Y0Vl?=
 =?utf-8?B?QzVwUUgrWWdvKzZHS2x2QVlMa1ZxUWllejRYejg3YWpwU2hPdHR1R0p5eHRq?=
 =?utf-8?Q?H/pcN3VcBqza9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk4rbnVCckpRS0Z4T0llNHlsQjZmQVZpUzQyajZJUzFIYXBuV01KZTBFUUZB?=
 =?utf-8?B?ZHVCZ1dhTUY0MmltMXlJdTY5aGNqaTFwVVdQblpJdVRYc1RBQ0huUW1aMk51?=
 =?utf-8?B?SEY3OGV4MzZINEc4d3ZmdG9nWkhyQ3NTd2habkx0bnRwWWlmU0ZEb2RpRlpw?=
 =?utf-8?B?dUdxZGVCL2dPOGg2cHd4bk9jWnpBRXNhZFpWZW1INzh1MzJGYVVzdjhZVG9o?=
 =?utf-8?B?YnAyNnhkNmNuSThNaGcwQ1cvL1BBbHo0TmdjeEtuVGd3UTV3Mkk1dlRBTWkx?=
 =?utf-8?B?bHVROWNCaTZHQmdhdU9NR2Y0aUxoUmNnTjBXcC9jeU94aXpZNEM5NXlSRUxF?=
 =?utf-8?B?eE9vU3lZSG9yQXNTRmxOdEdkSFJhME1FVStsRnlDV0kzQ1hEMDk5MlRHSVhs?=
 =?utf-8?B?K1ZhVEx4QjE5RVFDV1p3ZWQvRjJ5U1NhbjZXNVBpRWt1bGhjeXozY0ZYV2px?=
 =?utf-8?B?ckdiOURjODhtU2p6NEtNR3A0Q0pSUjBRaHpkNHJiYnlDUjRTR3JKdzBYYVRh?=
 =?utf-8?B?eHlLVjhHc0g4YWw0cStPL2xZc0Fxc0N2QzZrQWh4Znk4QWhhNVZOTTNRellL?=
 =?utf-8?B?b2FvSVFINUUwdDZQenJPNUdSTTdrM0JEMUowZDBJRHpZMjFDZEV1MmNJZnF6?=
 =?utf-8?B?cVljcGNEQjVHdWVWRVpIajJWdlBzM3ovMFZseE5WVkxTSDk2RGVtK3RlRDdG?=
 =?utf-8?B?dEkwMDZKNy9KNDU3OFRqRTRSQzI3WGtSMXdWcjJyUlJZeXR3UXpOclQyTFdj?=
 =?utf-8?B?WHJZQ2NUanB0VnFzSTRuZy9MRGZhWHprS0k5dUVsVlk5NnVSOTVzS2VoMER3?=
 =?utf-8?B?WUFXNUthL3dqNDBGdFBybmU3WEEwRjY0TDZlcEtKZFZWOW9WRnFaR2owajJo?=
 =?utf-8?B?aXJYOHgrelM3NCszQzJyNHRSdGFlT1lXb2dVTHhlZVA4WnBuYU84ZktqVWh4?=
 =?utf-8?B?dC9NVzRkbyttaVg3b1FVbEt2K2xVdEdUT011dXVhNDFGNnlaOVQrZGFNanE3?=
 =?utf-8?B?VlAwWTI4WnQ0aldkTms4OVZvRStKdHAyYW5ndmZZek1qOE1FN2ozNGtXYXhR?=
 =?utf-8?B?aWtXVjllMStqRlpudm52QWFQVElxYWxDYVhmbWJkdUh4cVk4YndicDMrWEFF?=
 =?utf-8?B?VTNIYzNMRTkrbXVXdmFhY1hiRVNqaGllVnJMV3ZQYklJcXFHRFRJZGFnM01T?=
 =?utf-8?B?c3hnTUxGY21abzZXa1ZieHRLNjRiZHhINWlhSzByMWZBZGpQTTA5Q2xoZHpo?=
 =?utf-8?B?OWlPNTFBSG1TdmFwVHRFSmgrLyt4NmhXVng5RVZoMkxwMm1pdE84UUJVUy9K?=
 =?utf-8?B?RjNxZm95Vm9GbXlyOHZvZEd3ZGE3SlBPY3J6UGUzOG45a2NXd0RrK2Zjd2px?=
 =?utf-8?B?UmNPZVpneXVEeE9ON3h6ZXdUU25tanJlcTVwZDhYYWNsNlhyZDJtdXZPaUVE?=
 =?utf-8?B?WGtNVHRmbm1xUFh1aGVyV01kSXhiK3ZKWHN3RkkvY1hVSmYvNlhWQnh6TUxM?=
 =?utf-8?B?Rm9nbUYyUTZnS3dCNS9kMWdqT1hURmFSZ2ZrREk4dmNuVDlZSGZhNkNIOGNl?=
 =?utf-8?B?OWZiWlJncnBrbFNXVHovMXJ6RWZZczRyOUN3dkVQbWR6WjY0eTlwSnFDLytU?=
 =?utf-8?B?VE9MVUxkZlpRazBVbnNEWWEzMUxoM3lNT0Q0WjhhSU91aTIvWG15SEY2MGho?=
 =?utf-8?B?UGdldE42WHJEdUxYL3JNOHBrWnRMMzh2Q3hGWDFpb0syVjRyZ29hMlluaFVL?=
 =?utf-8?B?YnZQYTBZK3FQcXh5M3JkcGx5STI2Qng0Y2Z6WUNtTlpYQ1UrcnNvMUFIQW1F?=
 =?utf-8?B?MFVnbXF5eUJPakNFazhTOXd3V1g2SEF0bzJjTllHZDlvT3V2UFA3a3VscGZa?=
 =?utf-8?B?M1dRODdLRHBwdXJUekUwa0tDQk1IaXljK28vd2M5SkVtWi8vV1ZuNU1TRW80?=
 =?utf-8?B?VmFsNlUwR29JRWUwNFZuaG1DZ00vdEpibmk2eC9TcCtkeE9rU3BRTUFIZkRk?=
 =?utf-8?B?cG44cDZEdlEvbEJ2MnQyekNlRi9QS2JTR05kVEYyT01BSDNFM29CcHQyUzlH?=
 =?utf-8?B?akZrVjZlQlprL1JVVDNwWkUrU2NuNUtNdWNiZXBOMEJqQUorbVdPQUhvRUpp?=
 =?utf-8?Q?9IahbK5OQiHHj8/z9xoPuY44E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d5014f-a856-4ad3-39d5-08dd33b85fd9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:55:13.3884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJy3YCwsS8Mlir54m+kxq6nC2lPVg+lOQkWVwxdoDssd4dcxH5r+k8cRDabhzEDe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7237
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

--------------zrADLnMUL12KExCmSKi0uiuC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 13.01.25 um 09:43 schrieb Philipp Stanner:
> [SNIP]
>>> The handling of NULL values is half-baked.
>>>
>>> In my opinion, you should define if drm_sched_pick_best() may put a
>>> NULL into
>>> rq. If your answer is yes, it might put a NULL there; then, there
>>> should be a
>>> BUG_ON(!entity->rq) after the invocation of
>>> drm_sched_entity_select_rq().
>>> If your answer is no, the BUG_ON() should be in
>>> drm_sched_pick_best().
>> Yeah good point.
>>
>> We might not want a BUG_ON(), that is only justified when we prevent
>> further damage (e.g. random data corruption or similar).
>>
>> I suggest using a WARN(!shed, "Submission without activated
>> sheduler!").
>> This way the system has at least a chance of survival should the
>> scheduler become ready later on.
>>
>> On the other hand the BUG_ON() or the NULL pointer deref should only
>> kill the application thread which is submitting something before the
>> driver is resumed. So that might help to pinpoint where the actually
>> issue is.
> As I see it the BUG_ON() would just be a more pretty NULL pointer
> deref. If we agree that this is effectively a misuse of the scheduler
> API we probably want to add it to make it more pretty, though?

The only alternative I can see is that the scheduler API gracefully 
handles submits to non-ready schedulers. E.g. that 
drm_sched_entity_push_job() detects this condition and instead of 
pushing the job sets and error code and signals the fences.

But that might not be a good idea.

It just moves the crash from one place to another and in general I fully 
agree the driver is misusing the scheduler API to do something which 
won't work and potentially crash the whole system.

> @Philipp:
> BTW, I only just discovered this thread by coincidence. Please use
> get_maintainer. The scheduler currently has 4 maintainers, and none of
> them is on CC.

Oh good, point I was already wondering why nobody else commented and 
didn't realized that nobody was on CC.

Thanks,
Christian.

>
> Danke,
> P.
>
>> Regards,
>> Christian.
>>
>>> That helps guys with zero domain knowledge, like me, to figure out
>>> how
>>> this is all
>>> supposed to work.
>>>
>>> best regards,
>>>    Philipp

--------------zrADLnMUL12KExCmSKi0uiuC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 13.01.25 um 09:43 schrieb Philipp Stanner:<br>
    <blockquote type="cite" cite="mid:582e10673bb749f18ebf8a18f46ca573df396576.camel@redhat.com">[SNIP]<span style="white-space: pre-wrap">
</span>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""></pre>
        <span style="white-space: pre-wrap">
</span>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">The handling of NULL values is half-baked.

In my opinion, you should define if drm_sched_pick_best() may put a
NULL into
rq. If your answer is yes, it might put a NULL there; then, there
should be a
BUG_ON(!entity-&gt;rq) after the invocation of
drm_sched_entity_select_rq().
If your answer is no, the BUG_ON() should be in
drm_sched_pick_best().
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah good point.

We might not want a BUG_ON(), that is only justified when we prevent 
further damage (e.g. random data corruption or similar).

I suggest using a WARN(!shed, &quot;Submission without activated
sheduler!&quot;). 
This way the system has at least a chance of survival should the 
scheduler become ready later on.

On the other hand the BUG_ON() or the NULL pointer deref should only 
kill the application thread which is submitting something before the 
driver is resumed. So that might help to pinpoint where the actually 
issue is.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
As I see it the BUG_ON() would just be a more pretty NULL pointer
deref. If we agree that this is effectively a misuse of the scheduler
API we probably want to add it to make it more pretty, though?</pre>
    </blockquote>
    <br>
    The only alternative I can see is that the scheduler API gracefully
    handles submits to non-ready schedulers. E.g. that
    drm_sched_entity_push_job() detects this condition and instead of
    pushing the job sets and error code and signals the fences.<br>
    <br>
    But that might not be a good idea.<br>
    <br>
    It just moves the crash from one place to another and in general I
    fully agree the driver is misusing the scheduler API to do something
    which won't work and potentially crash the whole system.<br>
    <br>
    <blockquote type="cite" cite="mid:582e10673bb749f18ebf8a18f46ca573df396576.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">@Philipp:
BTW, I only just discovered this thread by coincidence. Please use
get_maintainer. The scheduler currently has 4 maintainers, and none of
them is on CC.</pre>
    </blockquote>
    <br>
    Oh good, point I was already wondering why nobody else commented and
    didn't realized that nobody was on CC.<br>
    <br>
    Thanks,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:582e10673bb749f18ebf8a18f46ca573df396576.camel@redhat.com">
      <pre class="moz-quote-pre" wrap="">

Danke,
P.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
That helps guys with zero domain knowledge, like me, to figure out
how
this is all
supposed to work.

best regards,
&nbsp; Philipp
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------zrADLnMUL12KExCmSKi0uiuC--
