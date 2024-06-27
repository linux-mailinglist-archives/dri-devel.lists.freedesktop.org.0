Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AA691AECC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 20:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B52810EB1C;
	Thu, 27 Jun 2024 18:12:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FcAXaklG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DFE10EB1A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 18:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pff5uj+X9uVgvG5m+qnyePemeH0quXbCsclI4/MIcNbtD+FniBMC0w36qHuurOTLp+iy1DHKCeGqb35cDuySkF8amD+ES/nk89krm9anO0s8E6qRN7Y9+3ahRhkfxvAUB8Kr5lyh6NqdnqSiKHtmK6ljSNNNIFpfhad6DdPsd9wn7V1734cvOP8FFCK1OPd88GImwfy3hXYkFmvbPjvVqB9KZpnd75CVt0bBSMMQKsxlvAFcZqRxkTAHmGHe7vfVWBHntqn4dZNYDoEqcCofzhCnRW2hUljy70mJ6B6qGkadSgma7m1tmyh76eODXYbd62crfNdrF7oQ9198LG/Ubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2BPNNUadCRPbQLrIK/kCMJkKLYAmIoSxte0NY3tqGI=;
 b=UOYEF7r/72nHAdmTCAA11mWPLAXTse5mDtMlZdZ4sZn8Fb+cjLyQGiiaiAP8fyFtddjJ7wB2fj6uTbVWYp0LjDDAOywhd34C3caQgKoiAlqnH+vUYE7JGSFBGq8E5bwVmsE9HD4t/FZYcYd+Mw8HK5lSUxNo+5vJ+ZpwS0FTs3aN10WL5Lc0TFBCPrjwHcxvGUHgIgMcRpJGP4Vf7rVJ881p8YRZFurELp6x7Gg2RLEQhGbjujq6aTNfgEjwNhc7RhAvvCzRyo3c7aM25y6Fth9KilCyHcEnSQHk8Uxo5fBYfk+xeirPzU2kt+FUhTAasmV7glMhU5kh48iCuRDz4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2BPNNUadCRPbQLrIK/kCMJkKLYAmIoSxte0NY3tqGI=;
 b=FcAXaklGbmZraLZWBR1J/anhDqFgEENBe78+7JdeO9bFe+4BZowC1eR6qOdpFm7bYl/wzi1yVpum3ct1KQBX5J4JkttpXeGLb+kPDvQMmiUhf37wMPUF5ZIYGLbKSlDvvv6fAC8QCjyrPHaNI1G8TigUG2sxUZ3lzsHUOEFF/nU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB8886.namprd12.prod.outlook.com (2603:10b6:806:375::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Thu, 27 Jun
 2024 18:12:08 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7719.022; Thu, 27 Jun 2024
 18:12:06 +0000
Message-ID: <6d8209e3-eb68-474f-bb98-ef321acf97e5@amd.com>
Date: Thu, 27 Jun 2024 13:12:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm: panel-orientation-quirks: Add labels for both
 Valve Steam Deck revisions
To: Matthew Schwartz <mattschwartz@gwmail.gwu.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Schoenick <johns@valvesoftware.com>,
 Kyle Gospodnetich <me@kylegospodneti.ch>, Hans de Goede
 <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Matthew Schwartz <mattschwartz@gwu.edu>
References: <20240627175947.65513-1-mattschwartz@gwu.edu>
 <20240627175947.65513-3-mattschwartz@gwu.edu>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240627175947.65513-3-mattschwartz@gwu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0059.namprd16.prod.outlook.com
 (2603:10b6:805:ca::36) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB8886:EE_
X-MS-Office365-Filtering-Correlation-Id: cd8d8102-c8a8-4ad1-9466-08dc96d4a740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXV1Q1JFRjdBS2N6NVFZc2NnYS9WN29nc044R0o1dzRCam1uTm5OZWhBRVBs?=
 =?utf-8?B?RFVuakNjYjJGdU15L0o2c1h4L3ZscFF1aS9TclNkemtkQzdIL1VqS0Evc3Jy?=
 =?utf-8?B?bHZlWDdVZmxpbTlJK1NDdUFQYS9KRGI1T1dBTnpGMm9wYW01bmNuZ3dEUnI1?=
 =?utf-8?B?QlBjZzRyNFZqNk5pcEhESFM2aHNnUWFKUUUzUzRJVDY0TG0wWHY1Ry9rd1dW?=
 =?utf-8?B?Q1Y2QTlLNmFYZE1GT1RVTG94R0NsSGc1WDhLTlRIcmwvajBMVm1tS3cwSVcz?=
 =?utf-8?B?Y3VwQWQxZ2hjYVBpUHpBQW9lQ3dxYW5UYmw0Sktobm5xM1hzL1RLTGFqVEhJ?=
 =?utf-8?B?eWVoU0kzZnplZ0UzM3psTXZSQU5sUzdkMzFBU0o3SmcxRzZVMFYycmhQSDJa?=
 =?utf-8?B?eHIrOEcyU29jdkVRcEh1OXE5TlpGNVRqV2UwNnVwSHgrOGhPbm94d25mbktU?=
 =?utf-8?B?RncwQWdYbHgzSzlFNjlHZnJtSXhCbVhoY0t2VGk3Y3VReTdWV1c2OGVxaytN?=
 =?utf-8?B?bzZ0UVpuU1Z6cXdTQ2FZelh3ZXZZbVBYb2hJeGtDQ3B1RjRsN0htc0Q4R2lr?=
 =?utf-8?B?WXhTdmxTQXF6RDJBVU9lVi9OU1JpdFp0YTV3T3Nyc1dhME9PTGZwUkVkNnhU?=
 =?utf-8?B?VzRpK3dJdmxoaDBRZHJ4cVdLbU5rSEVSc3JLT0VkOUlmaHFSV1pLR1p1M2Fj?=
 =?utf-8?B?L3V2MHZYdnBqbURINmM2dk1xNW5BUnlVREpKUTRsZXVaelhUdlRQeDJDWHZl?=
 =?utf-8?B?NEV1ZldXYW9PaTl6eitWTC9MQmt3UkN6M2xjWEhkZk5PdVZRT3NLcm0wSGlZ?=
 =?utf-8?B?elFTaWd1elludnRhcUNDYXFlYnNSOE05eDFvMTg4ZHRrU2hQOThlS2dSQ3pF?=
 =?utf-8?B?RzVNczRXckpHaUNsdU9kR3ZvSEtzNkMxczNDK3BDYys2L0tSWUFld3dDUWZP?=
 =?utf-8?B?TEYyUmZHZjRXU001Mm52bE9McmdwMjhxcUV4MjZKN3B4ZWxVM1FqN29vZEh5?=
 =?utf-8?B?ck1zQlBtejFkM3p5bm9NOEppeHFtK2h3VWd5Z2d2MWFsalpjdXhDSGo5bElY?=
 =?utf-8?B?V3lzRUdwWEN5cnBaSVFkUUQyRmx6MTZZNTdCZk1uLzI3NnpNSTNpOFIrWGhj?=
 =?utf-8?B?YUxlcm1LUjZaNkk4YWRhdHZpd3J1eGlLZjBxQzlaUFM3clhxbEhyd3J2akpF?=
 =?utf-8?B?eGdHQ0s3aEVKd1NrcG1LaVdOL2hQajVpRFJTQnRhM2EvUlJLRDlBOWhSMEJG?=
 =?utf-8?B?bVVrbHRHRHhONVdISHo4OEx1ODFReHY0eWw3alBtUm9DZG5SNk12Z2cyWFVs?=
 =?utf-8?B?ZXVjZ2ZFYUozelpWbWRYczBSamxqc3JKOTRxc2IzY2U2RGZYSkFESFUrQTNU?=
 =?utf-8?B?M1dyVXp0SkdyNFY0K29VMUJobGxwNkF0NEZrNnBKcGh4aUowbElhSWtucFNj?=
 =?utf-8?B?dWZ4OHdLeXBhUENxdFZvV1FlOVp0NU0vMUN4RlhIRlhNcitQdkJFclF6dkJz?=
 =?utf-8?B?L1JpL3hFSUJpNCsxdGlPcGxkbXl2dER4QjhUV2YzcktxdUFSejhEbDhHRWlX?=
 =?utf-8?B?WXUzcG1waFBlV1lJbXNRSmxWcmdIK2QxWWcwSSsvL3NuYzdIb3lPZTJRMzZE?=
 =?utf-8?B?QmxpcmJjb3FZRG9iRW81aVV1MEw2KzFvYXZjRDJuSXFSTXNlQzZZMUZVNkdO?=
 =?utf-8?B?azZXTmVDbXgrSDBkVVk1clhidlNSNEVqZEdKV3BPa1ZLbGhMV29SVlZmQjNi?=
 =?utf-8?B?TzZGTGlKbzNwancrU04vYStMZjJPRng5ZHcrSDRCOGpwSFpPVk00R3lUc25j?=
 =?utf-8?B?RjRKU1d1QnJxV3l3UHhFdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzRxQWJKcVJVcUNKM0xxNjR5Vy9jeDlWbHpDSm14bUo1M050K2hsSzloTzND?=
 =?utf-8?B?K3grTklmWkUvQlZEa01KVFY3RHpRY3krVEZ1V29LTThSbzFSM0RwWDBMR1oy?=
 =?utf-8?B?WXdXY1FqZ2RnZmZWekxYcEJ1SldZSXBRUC9haitzYTVkUHZsbldTWE9JUFBP?=
 =?utf-8?B?UEpqK21PYlBnTXpaYUR3eUlVMDcrdDB0NDVSczM4eVpEbXpJNGt3OEdGWjVJ?=
 =?utf-8?B?dnF0eUhiUHM0ZzkyOEdHYmVoem9PUEtMQlFwTXVROGhwcEVkWnVCQTluSFlP?=
 =?utf-8?B?dFhsczM5MDlXNWVVMXRqblZLV3RPdXlFMzVML1g0MUd6bWZoaFRabHFMM1cr?=
 =?utf-8?B?RDVLTUNxT0pWOUIzU2VKU1ZpM0NPK0NpTEpZQlpoM3NjTHQvQkNHbVl5eTJ6?=
 =?utf-8?B?OWI1M0l4Mkc2elFFdTN6VG05UlhUUTdXQzJaVUdzbTlSOE1RUnZGcEVkNmFs?=
 =?utf-8?B?dVVyVTJCWDZBWnZJdEVIU3ErTG9TNnJGT2ZNZVhtbll2VXJ0ZFdFRjQvM3B3?=
 =?utf-8?B?VERmZm5kQVB3bUJXR1hxbGJ6eS9KMlBqTnRKQXlHU3hUZEJodmxZd0VvaXBS?=
 =?utf-8?B?VTNXYStKa1VhdTdqYXFBbWlXYVhlK1RJVDVGb0NHUUE4K0tMVkUwOWlvb0l0?=
 =?utf-8?B?cS90dW5DSDh0QjhrOU5vbjdzVDcwMmlzYlRPNk5EOE1seXN2dkpOcjRqUW1S?=
 =?utf-8?B?c0NJQ3NmQWVNU05zbXd2dVJPZGZONXVhRE85ejQ5T2RLanljV3pBWUpDNGFi?=
 =?utf-8?B?Ums5clVHZ05FdmtvSnJmdlkxU0puV2tGMGQ4R1lpOG5DU3VPNThTb2dzMmZI?=
 =?utf-8?B?MW1nL3kvS3hGQUJ3bVo1L2RKZ1pMUmhkVG5HYTZ1NzVUV1RyMmtkeTdGT3RQ?=
 =?utf-8?B?ZU1ucUR4cUlFVWVRYTFXbnhFNHFlMHBwd3piM2M5L3VUQ2k0cEwrazNvNlJw?=
 =?utf-8?B?Y08wN1QyRmFkQ0VkMk9obGhJL3BOcmtBTHMvd05vbTE2dG1ZVDRxRzc2Tjdt?=
 =?utf-8?B?YWdvaFZJNEEvWDY5djh1SkVpWER0SXhCNjFnZGtBWHN0bitjVWFBcFlPYUJV?=
 =?utf-8?B?TTZnU2FPc1pITFNTMWdmd25rQ2NDYXgrOUU4c2tnSG5KNEh3RkUzcWgxUnBE?=
 =?utf-8?B?aUs3Zk1qWG1HS3oyb0xHNUNuWkFNV2ZNc2RQUW83TCs3K0RENXZwNStVMUNL?=
 =?utf-8?B?QW5rOENZTEVnWWhJZHV4aDJuV1duUXRGUjJaTUROQjZDN0hzeitjeWM2MGcy?=
 =?utf-8?B?MFJ6dlNlMnN2Yng1eW9ob1F3Nlh5NUR3aDVHZmFqZForMXpDVTZNTUdyUy9u?=
 =?utf-8?B?b2xIV3crcml2TTRSYXIwaUovNHJLWUlOeTVDZWF4Z0krbHk3VUs1aEVienl5?=
 =?utf-8?B?djd0WURmRitSb2IxbVRFdms5MWVkUEtEZ2tMRkc4N29BbWRVMHkvV241WVov?=
 =?utf-8?B?M2hrMytDNHFxcnVtOUVlZWJiNmxZc250a3orTmNuNmt5dVZyazFIOVRTNE01?=
 =?utf-8?B?MEFqRSt2bmxjZWd5RGRCNWdBTVVsMlViTVlyL1BFdzFrRlF5bEJHb3cxVGdh?=
 =?utf-8?B?cFZaRGZnblhPY1F1cTJwMEtpWTRXNDdBQUYzcWV4eWNpME9WMStjL29nQVlE?=
 =?utf-8?B?WHJyM1hsdFp6OWZQaVllS2xLa3hET2g1K0x2Z290dmJTMlVrZHYrQytpSGFh?=
 =?utf-8?B?MHlOZk9YRGNTVzVqVVo1aU9lbjJ3bUMrTFVaQzNiSUZjV3M3SkY2Y1lxNjEx?=
 =?utf-8?B?VDZUeEM0ZmxlZ1JDbE9YM040VCtRaXpqOUJNWXpMNGl4MUVHQ0N1OEJWME4r?=
 =?utf-8?B?Y2l2Q2tRcmw0bENHb2NEUndtWEYzY3F2bFlyQWFWd2lXY08xMWc1aUhYOFZC?=
 =?utf-8?B?RE1FRVZQaWNSaFFqQVpDUkMxQUxSYkZ4Y2JtVXNOQ1NCRWRJbE5FcEdaK2R0?=
 =?utf-8?B?cUxzNmRiUU1hR3hOdFYyUDJyUkhpcVZXMVpRL0dhTkN6NUFlSWNpTmo0NWxU?=
 =?utf-8?B?emFuQTJkbWRNM2pmSHRhMG1UM0QvU3pDV1AzZmw0THd4VjJicUFWTm4vUFJL?=
 =?utf-8?B?WmdyV0VuU1hmelZnWkxYcGFIblpYSnYveHFzQ2JRTkQycncvMFBRWW5XaEZ6?=
 =?utf-8?Q?LLGWjZabtyV81UmQSxiPcqmH+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd8d8102-c8a8-4ad1-9466-08dc96d4a740
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 18:12:06.4360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oLqJuXemofOhB9dGaRGKkOU8ob3myfxTUhRksezkSzmNUHw6/shuXUfAX9UuxgaiU4YHqjE897oa9KT5bGeOmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8886
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

On 6/27/2024 12:59, Matthew Schwartz wrote:
> This accounts for the existence of two Steam Deck revisions
> instead of a single revision
> 
> Signed-off-by: Matthew Schwartz <mattschwartz@gwu.edu>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/gpu/drm/drm_panel_orientation_quirks.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> index ac8319d38e37..3f84d7527793 100644
> --- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
> +++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
> @@ -420,14 +420,14 @@ static const struct dmi_system_id orientation_data[] = {
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
>   		},
>   		.driver_data = (void *)&lcd1280x1920_rightside_up,
> -	}, {	/* Valve Steam Deck */
> +	}, {	/* Valve Steam Deck (Jupiter) */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
>   		},
>   		.driver_data = (void *)&lcd800x1280_rightside_up,
> -	}, {	/* Valve Steam Deck */
> +	}, {	/* Valve Steam Deck (Galileo) */
>   		.matches = {
>   		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
>   		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galileo"),

