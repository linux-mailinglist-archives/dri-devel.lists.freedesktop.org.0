Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B08AC7968
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 09:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B33310E712;
	Thu, 29 May 2025 07:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0bigLY0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8ABF10E719;
 Thu, 29 May 2025 07:05:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BShbt6JUhJeMkCQA3A+q4Oi9an2MzOOzA8pZVebetYoAZ78MT8+d5DyoosJiYQJqhQrPsG77j/d++uHZMYFwzXTuDqviwm5YYa+nv6Haqcd3AysYNwCAfpOJQqL3EsgcitS+UejXbBSNvXujbJ5pW0BoKemuIjqv22V7WpMdHeqRPDZeiybGZ7LTH648lTNzgkLDALJXrNstqQ2GVDCpU9t9wAszJr2mmjieUvXZFnmF4oKLmmptOZmSiu1ar9zBclLim7GjVAz062CLJQPHHkxt9sKcBXDxv+gSZkhzKsEm0D2s4PzDYaLOQ3tOwMUOwFjoYG7q3y/hhozQp/howQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmvTSepFQOxMLK/6wQReZLA0ejFOgOwEcKalgxzTE44=;
 b=A7MPrI+6jF0e1oul29lKLrBTlJDkNkk8qSxDEQQw+yPnvLxJEbYxPi0kcjIzXV51CRkV9wlQsHubDOmOpgxz0ASPxJQiuMwxM3oMy/DrOzn1qM8TsZHjAHn9erirNQj6W/MsN3i0jkWmkw+NyMDtg+9k/aSbGj+zqH3FBscrgUB7ARM90xxfnydBg4nusKgATXcCfSvArJHRd0DCnjbscbpfP+U+V5c9XZN2gXf0w7Kaf1uxQFFMn5592vmrC9cFaNYFMfhPsAc7bbJEU/XhFc8DWWuy2zJoaR/UL3WSkAmGDK1GzatNsqLSOfr858ny+Jv361ttp6cZJ+/YjqcdYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmvTSepFQOxMLK/6wQReZLA0ejFOgOwEcKalgxzTE44=;
 b=0bigLY0LSmj09PjPwNNTtFHj+Y54G7yhrrzZX/AXFIAnS1c4lSlDTBpUKPslfxbLaD6kLREZaaRL466uGScwnrr/URgBkjIRnOWA/Gr9ygGLhfi2HCtgIE7V5XBsIFuFir6iWTG5Oa1JbWDhGYRy60JfmFIj4e+tOkFbSuVYr1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by DM4PR12MB6470.namprd12.prod.outlook.com (2603:10b6:8:b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 07:05:26 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 07:05:26 +0000
Content-Type: multipart/alternative;
 boundary="------------9WdVwGQzUlLrBcTHiX5RKoP0"
Message-ID: <434823fc-ff39-40b4-a7a0-9430251b6f0d@amd.com>
Date: Thu, 29 May 2025 12:35:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/buddy: Add public helper to dirty blocks
To: Natalie Vock <natalie.vock@gmx.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
References: <20250527194353.8023-1-natalie.vock@gmx.de>
 <20250527194353.8023-2-natalie.vock@gmx.de>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20250527194353.8023-2-natalie.vock@gmx.de>
X-ClientProxiedBy: PN3PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::20) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|DM4PR12MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: 71078a98-5353-4d2f-f2b3-08dd9e7f3006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnlVck1QY1Z6RjBkbk1VUGtGcVFKQzBuM2VLWXhIbGIwcmZLQkpoV3U4bHN2?=
 =?utf-8?B?NTQ1b3RtN3kwM2pDcjJic0x4ZlVjSUJtSG5heW1BNDFyYjZSUE9xMHF4ZU0x?=
 =?utf-8?B?WG80VWtKMjVYZ04ydTY3VGVSYysxRHhsQXprU0RORTVBTVI2YmpaY3E0R01p?=
 =?utf-8?B?WmIvMmY0Z1ZCUkZ6aW05RmlVZURiM2ZXRytUdW11aG4rOFZDcEU4UmtxanIw?=
 =?utf-8?B?YUhaS25yKy9kR1JuV2gza3NCODR4azA1MFhoTTVLTHpXTi81RUFMUDBMRlN4?=
 =?utf-8?B?Sm03bVNwK01Oa3RoOWF2K3lVNjFhOUxjWFl6L3VoalJpemRadERZRTRKUDhF?=
 =?utf-8?B?cnp4bnVkWVVqNVFodzRVZkkvbmtLcHQvTkRNeHo0SWZIaTA0RWc1UGp6b2ZR?=
 =?utf-8?B?UmIxdUZKa09xdlZhZjFlTDc1TDR0T0xvVnR1MjN0SlV6YTRKWTVXUG00bEdB?=
 =?utf-8?B?M2prb2wySWRnVjExZVF1TFBhQU5CZEQwcmUwWlNLd2pDT05UNGVwRlBPNzM4?=
 =?utf-8?B?Q3dmaTlnRnNRWm9uSWl1TUVZU0FsMGYzRmhzak5qZ0ZuZW90UlYrTUg4SU8y?=
 =?utf-8?B?ZERGVkJ1cXJxUlJGM3doamh2TGl6R3Q4Y1dMc2M4V3NHL3hiUEN1ekM4VGxu?=
 =?utf-8?B?YTZiVnVFZ0VIN09uektxa3RRUjNtU2h0UWpRems5Q2Zub3JwYUR3UkUwYWZy?=
 =?utf-8?B?cGp0bnNBT3c4UjZ4eTRLOXRvRmlKSVk0NHR5K1dFTUtYNWhuYk1BNXVtZDVw?=
 =?utf-8?B?NnBuMHE5VDlLQVQzQXAzcVdxdE1NTG11ekRyeHA2UXJjWU9LYktpb3U5NGpT?=
 =?utf-8?B?M0ROdElpdWQvYnlSdm9MUTdBaituUVY0eWV1QnFyRVRTWUFTOVQyUXovTlFX?=
 =?utf-8?B?RG5uVDk4M0dXUS9rNHIzVlo0SFgwZTVFdU5ZRUpQNVl5bDZkRjZWMWFXNVZN?=
 =?utf-8?B?WVpaSk85UC8xdkJlcXo3TXJWRU0wM2YwUnBpSUo1Snhzb2QwWTgxMTBKSVlM?=
 =?utf-8?B?N2Q0eG5wWm1YWlVVTDRnYjNVVlNnTmg1djk2QU53eklzQlBFNllyS1htK1JF?=
 =?utf-8?B?T2tzUVgyMXNIdXRYQ1JJR3A1U1k5Uy9qSGo0NGRka0JoaDMwOGduNURnejYv?=
 =?utf-8?B?TmIvd1pDRklKRGIzTVdnWU1KQlp0UHBCYWo5cnNjZEpQdkg4Y1ZIZC9zVUVr?=
 =?utf-8?B?S3I0ekxnK2hxbGI5VGVQT3RoSmkwLzNWOFBVSnRQVjAwQnQzMC8wTXNQSGZt?=
 =?utf-8?B?VWlBWDZ3R0N6dDZ5eWNvbHJRdnRvODNFaHhzQzZDSDFkd1JmUDlYcDZBNDA2?=
 =?utf-8?B?bU5aUE0zWXRlRElpanprZGVCd2VzdlBUQTZTZFQ3RVZBT0FlT3lVWTZsZHE4?=
 =?utf-8?B?bTJsWldhM1hvWTI1bHJMZHdwTFphbzcxa3M1T0R6bk5LUElLNjNlS2VVRi9o?=
 =?utf-8?B?RmEyaXhQTWV1KzBWcURlQmVKdWZGWUZxVlNJc0E0bFA4SzA4NHlXSENFY0xR?=
 =?utf-8?B?cmhmSnNpTytpRURNUGg2UnAxampkRWVHeWdYZ1U0QnBsTFBoUE95OUVIZk9G?=
 =?utf-8?B?RWg3R1FJMXBkVWcxc05UbjZ1Q3Fqd2I0YzQ4eFVOd3VzTWtOZnpaNkxmckJJ?=
 =?utf-8?B?alVMeEdKZVBBYWNLWFovOWhLV0lRMTBYd2ZuRTNwb2tMV3lxTFRNQWJ2T3d6?=
 =?utf-8?B?WVZnaU1ZcUZBU3ZuYVBTSStRZU4wM3Q0enlDaUVkS1l4UFVGNi9RaTVnamh3?=
 =?utf-8?B?NnRrWHk3azI1d3BJVjcrYXE5Z0FYUmNSTnd0dTViWkFEbURta3lJYjhBSWVr?=
 =?utf-8?B?ci9qMTlDRHAvRVYxN3N4SmEwS09ITldhMEFuTE4rcTl1WVpMZXpXRFZKNDdM?=
 =?utf-8?B?RVQvWUtGRUQvR2FQcXp0MFlpbWNSaFdBcEFCZ2x3a2xUZjRKS0Y4MUo3Umd3?=
 =?utf-8?Q?izyA7Bg8kYc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWkwSUpHdFBBQWZLSXVhY3FqYTRYR3NTdU85QSs0TzVWbld4R0wzYVJDTnF2?=
 =?utf-8?B?dEpha0VXTXhoMUZBbVYybU4xY0UzNDhLdTVUU3NGQjA5b1luNW9TMXhndEtv?=
 =?utf-8?B?c1dLQlRDUC9lWlRLamtTR3Q2eno2em4wWTg1LzF2dlhWM2xGOVBKWUpHWExQ?=
 =?utf-8?B?RmZwc1JTWEIvVTRLZGJENTFOWkN1NFJZTHMrTzlrRWdXa3dOVmFWVGNNRUIv?=
 =?utf-8?B?MVE5a0k1eE9XbmJqbS9hZzR3RW11aWR0Y0pDVE5UVWlaV2lKbFNtZjEvdjhN?=
 =?utf-8?B?WmR4RDFIZkYreEp6alFHYy84RmJTVkZMSWJibzJmNmpkUC9obXJENmRabmVS?=
 =?utf-8?B?dGgwWmtKekJxVXRqWFdUSTVjeVl1Wlh3ekpWZkpzcmhyMDZIa0ZJVzBjaVBG?=
 =?utf-8?B?dWM3TlM0dGZMUHhRRUZ2RFltZnR0azVBK1c1RTAzUWs5VHZETUxGME41bjE5?=
 =?utf-8?B?VDUybklzQWRGTE85dVpWWGZTRkhWYkxEbFBmS2lDSTJIeVlpTVA3eHRkM3RI?=
 =?utf-8?B?RUpLaXdQdVNhL01CT2VseVZBRXJua2FOL2J5eXg5WlJyMDJYMFBiOGYvZ1Fi?=
 =?utf-8?B?eXBBM1JIbjhOTFdCNEhqNE9sVHhMdDlmcERhelpUVVQwZFEyUmRXN2c4bWty?=
 =?utf-8?B?SnNvRFErMzJBYXBSTXB4T1EwQkhVNUpIQ00xUTRLQit3ZnZzMWc0TjYrVnNW?=
 =?utf-8?B?TnoyL0ptSklzdGdBWE8zMVc3UzUyWHZONmFCZWVoVWlvV2hRK0VnMjRsK2g3?=
 =?utf-8?B?TUJIaUN2WnRpU2pwcjQrR2pMbStSVmJRbFpEZ1dXL2U4OEs5ZlN2VlRLVGNB?=
 =?utf-8?B?c2NFTHB5V08rMm5LVE54ZkN4b3BMTzVQNU5Nb1JYSlhWSnpUK3ZVRG1ZMG5R?=
 =?utf-8?B?ZUsvVlFMOEdDSVZyVFl2TlY3M25KNXgwZzY2NHJSVEM4bUZTaElmYWVjbmhz?=
 =?utf-8?B?N2tRbEtwemZmLzZhWUFES3ZoZU9iVWxlelZmQ0FxRms0YWQ2UVllazdNdTA2?=
 =?utf-8?B?M1Z5RmhyZUhuUnpaelMwdyt6TmQxTWxHVG5rZEtvTVRKUkQvVXF3bmpuOTVK?=
 =?utf-8?B?aWJsYStna3F3YklhY2VDK0NXYndORXAyQjBiNVQwK1FkYk41QkJuZ0J0R3FH?=
 =?utf-8?B?M1JJR3NBOHFlRzVRSytuZko5SVJwS1ZNYjlEeDVPdWVLRE1aV1pKeGNQSXlV?=
 =?utf-8?B?amt3ZHN0Rks4R2s5cjZyUmlyQ1NaeWRXOUI1TVY3enJjU2tIWm9nVE5qS2pt?=
 =?utf-8?B?TGdHRHpqaW1iOTh2aUdmODlDaTNxVWlXcE5uaERmTUVub3J5ZnNFWTZqWWl1?=
 =?utf-8?B?SW0rbHgwUjg2bm80RU5hclhQZ2FTVkJMeGhMMTA2VlBIVW4yTUVCcXV1czNT?=
 =?utf-8?B?aFdMSzMxcXNBb3hqK3ZlZzdsQTNZRnhNdEZneTFBUFU4dEI4QkM0SHA2OWFQ?=
 =?utf-8?B?OXdRaVMzYlgycFFGMHVzakZHeWJFK3IxOEdVVEtNQ1NGR2VuMFB2UWxqZ3B5?=
 =?utf-8?B?dnhkYkdHRUNjNmJtenZwN1c2ZGJNZDRCTFZpR1lldzgxV09MVTZvL3Z4NHg2?=
 =?utf-8?B?SmZ2MHhOSWRnbHdyaFlTbHZzanZ4akdydVljRVNQV1lPdmlFQWlYMUVzTW84?=
 =?utf-8?B?bERCWFg3OVRxUWNmQTdRREZScS8yNUFpKzdwL2JtMmE3L1pQejRBT1BiTHJO?=
 =?utf-8?B?WlFNZTRRTGl4UnY3cXNYY0M0eDZVVk5JTkRIdTVLdlhqWEVyUWJhTS9FMVRK?=
 =?utf-8?B?ZzUxbFdsckg0SlBVeVJ2RGdadTB4ZEloaTFQd3JrbmduRVVNNVJQam5UTlc0?=
 =?utf-8?B?dFptTFUrSmwrdzlISlVvYTNuWUpLSGNpRFl2ajhKMmVXQ2ZZbXBPY0ZUaktP?=
 =?utf-8?B?ME56VFl6OXJuU2hrK1ptK2RySENkTEM3S0xneWpEN3Uxa09ZNFpNN0pDaDhL?=
 =?utf-8?B?dmhDS1lDV0hLa2hzYTd3Y0V5bzY5cFc4YnRhSVcrWWMySUcwYXRGZ0dlQlkr?=
 =?utf-8?B?UE5CWk93aUQweU9ZeEdCTTNubzJHMC9lRmpYdk5pejlxUkRONkdDV3N1ejNs?=
 =?utf-8?B?RytyVENBbUtjN3B3blB4cmxhTVNScU8rTDNSa3FpenFGR1Q3Wnk4dzBBQWZw?=
 =?utf-8?Q?PUMUaafmxjyqtnpbAso16gvEV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71078a98-5353-4d2f-f2b3-08dd9e7f3006
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 07:05:26.4299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gfU3CLf5y4WgWVC7fRm8CvjlYFEesAPsAC+nPb5KtiQDG5zQCEDAZe1z9hhZ8aNzWoN3LnwEYYJFRvKzvz7/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6470
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

--------------9WdVwGQzUlLrBcTHiX5RKoP0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/28/2025 1:13 AM, Natalie Vock wrote:
> Cleared blocks that are handed out to users after allocation cannot be
> presumed to remain cleared. Thus, allocators using drm_buddy need to
> dirty all blocks on the allocation success path. Provide a helper for
> them to use.
>
> Fixes: 96950929eb232 ("drm/buddy: Implement tracking clear page feature")
> Cc:stable@vger.kernel.org
>
> Signed-off-by: Natalie Vock<natalie.vock@gmx.de>
> ---
>   include/drm/drm_buddy.h | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 9689a7c5dd36..48628ff1c24f 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -142,6 +142,12 @@ drm_buddy_block_size(struct drm_buddy *mm,
>   	return mm->chunk_size << drm_buddy_block_order(block);
>   }
>   
> +static inline void
> +drm_buddy_block_set_dirty(struct drm_buddy_block *block)
> +{
> +	block->header &= ~DRM_BUDDY_HEADER_CLEAR;

The users should not modify this DRM_BUDDY_HEADER_CLEAR flag directly; 
instead, please use the DRM_BUDDY_CLEARED flag in the driver.

The buddy manager will take care of this DRM_BUDDY_HEADER_CLEAR flag.

> +}
> +
>   int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
>   
>   void drm_buddy_fini(struct drm_buddy *mm);

--------------9WdVwGQzUlLrBcTHiX5RKoP0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 5/28/2025 1:13 AM, Natalie Vock
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250527194353.8023-2-natalie.vock@gmx.de">
      <pre wrap="" class="moz-quote-pre">Cleared blocks that are handed out to users after allocation cannot be
presumed to remain cleared. Thus, allocators using drm_buddy need to
dirty all blocks on the allocation success path. Provide a helper for
them to use.

Fixes: 96950929eb232 (&quot;drm/buddy: Implement tracking clear page feature&quot;)
Cc: <a class="moz-txt-link-abbreviated" href="mailto:stable@vger.kernel.org">stable@vger.kernel.org</a>

Signed-off-by: Natalie Vock <a class="moz-txt-link-rfc2396E" href="mailto:natalie.vock@gmx.de">&lt;natalie.vock@gmx.de&gt;</a>
---
 include/drm/drm_buddy.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
index 9689a7c5dd36..48628ff1c24f 100644
--- a/include/drm/drm_buddy.h
+++ b/include/drm/drm_buddy.h
@@ -142,6 +142,12 @@ drm_buddy_block_size(struct drm_buddy *mm,
 	return mm-&gt;chunk_size &lt;&lt; drm_buddy_block_order(block);
 }
 
+static inline void
+drm_buddy_block_set_dirty(struct drm_buddy_block *block)
+{
+	block-&gt;header &amp;= ~DRM_BUDDY_HEADER_CLEAR;</pre>
    </blockquote>
    <br>
    <p style="font-size: 16px" data-pm-slice="1 1 []">The users should
      not modify this DRM_BUDDY_HEADER_CLEAR flag directly; instead,
      please use the DRM_BUDDY_CLEARED flag in the driver.</p>
    <p style="font-size: 16px" data-pm-slice="1 1 []">The buddy manager
      will take care of this DRM_BUDDY_HEADER_CLEAR flag.</p>
    <blockquote type="cite" cite="mid:20250527194353.8023-2-natalie.vock@gmx.de">
      <pre wrap="" class="moz-quote-pre">
+}
+
 int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
 
 void drm_buddy_fini(struct drm_buddy *mm);
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------9WdVwGQzUlLrBcTHiX5RKoP0--
