Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4580DA3FAB3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6295010EAC4;
	Fri, 21 Feb 2025 16:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L3xYob3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F33310EAC4;
 Fri, 21 Feb 2025 16:18:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5ohbm4J1JhD17dsP4jO0NYjo8Ig9m9khd3Vh+nyvna5nDLPIcN+hvIdRNGNbGadkUXrYbUuSpt8ulJGHtRNwRhALbKVLpmyEI2c0XuqLt42AZH34I13Lq6cYBtMI73kV7bypzEV3MZYMcU3s7gZdxzaU9qP70eWJua/Q6J3r1t8OQeZatXvluY/KM6HGE60cjHs4cwPAYH6SuI8FWiR3cjSsOK0xtpSX1c3QqfB9/OC3YmOPa43fMIYXz/LQPAkiQ83HVmksZnqGNRdrT42+Ba9TBaFdwkYHZATBABcsHEuYfylwYc1OXmDYc6wBCS8rXW/zae7z2Mc9LOq0mjrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlLs97klWBop6Ykr5mE5HUhaF7vXHLIt0zQ/IRU6wxE=;
 b=oxMr0eRHoEcW+AL5vqYdVubXruJ0oymhmcBCiOLUdMGMQfsxP6ze65geQfosgD23atfHIk7W+J+VYvnLzvcdymiqMOivKCluERTKVmZXXKkL5QEhoZCNUywWRebuybUZ5sF7vlUHfyUwUnHFy2i0QurgKFa3Bp9jTtVHXVX0KlHGop5ImB7ru7il2CAq5Z15unm8PyVvNNSsJRdwCJ3SM8rjPXvzrotCvV8/U3Kl06TbODPvGPaad0rsvh8+eAcANa1KWLagd1Gvv/r9t+D/rV3Pp5KF81kmqvMtRz6dp05G3sE4ykSArc8m1Uu7tCmpfzA6hNd2Kr7NZ3vKk4n9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlLs97klWBop6Ykr5mE5HUhaF7vXHLIt0zQ/IRU6wxE=;
 b=L3xYob3lfGHQGatiMWlxNuRAGHOnZ4GjUCXHoTTKQRBJRfsHdgvZoWh6nnLu5OYP1OuuqU8L0n3V4YwRJj167YA5BE/a8s2b6mAYpGrJAw2LkEoiKb9buIZc3iSHT6aiqtHLndqTf9InC+KWHg5m/sPDX3iWZBcz6p6B4tJDYBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DM4PR12MB5913.namprd12.prod.outlook.com (2603:10b6:8:66::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Fri, 21 Feb
 2025 16:18:46 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8466.015; Fri, 21 Feb 2025
 16:18:46 +0000
Message-ID: <5e3eb899-ae82-4919-a382-99cbd3c6bf34@amd.com>
Date: Fri, 21 Feb 2025 11:18:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 08/45] Documentation/gpu: document drm_colorop
To: Simon Ser <contact@emersion.fr>
Cc: Alex Hung <alex.hung@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-9-alex.hung@amd.com>
 <eDrRzjuU_q4z4Jvq-DYxUnw2a-VUts65NbWMZbhrvqYoKbcW_jUawJ_ZirFIFQzrtMG4asLn6f9WP24o-k4DnP_oYf5R94PYoMIejFqdTZM=@emersion.fr>
 <5eb5fecd-caa8-4e40-8fe9-23599dc59bbf@amd.com>
 <TFAFx0Fj4cqaba_HYCGoFyvpZVhmaa2KEHRsejqoqEr64CBhJRzpaBs4ZuQWQIJDSQovx0NwwYKhb0GrbhyBWxNGxJbmxckHlyCDtJBbSYs=@emersion.fr>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <TFAFx0Fj4cqaba_HYCGoFyvpZVhmaa2KEHRsejqoqEr64CBhJRzpaBs4ZuQWQIJDSQovx0NwwYKhb0GrbhyBWxNGxJbmxckHlyCDtJBbSYs=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0021.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DM4PR12MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b535004-7732-45c3-5055-08dd52936af6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFhYYzVtNzBmMzlsb1haOHlqK3Jmc3duOVZYV1VEZTBMTWYweEFXVnA5MlFm?=
 =?utf-8?B?elVFRXo3L2JJL0JrUEhUOTM5ajRtRGxmZ3Z1cVhtNVU1U04xWDJ5d1R0SURy?=
 =?utf-8?B?TlZqaDNvSkVZUnJ2MVFQZ0VleHFzaVBwRFlCckVFV2ZsTmsvU3ZyYUo5enhJ?=
 =?utf-8?B?dzBITmJXRC9BazZuS01xa2VRQ1M0OEN0RllmVnNjaW5hRFVXM2wrallSbEhw?=
 =?utf-8?B?WGdFb1RseXMxa0VUOUNITG5NZDA5aUFuNldRWm5xK0k3TjdDYytOK2F3dzhY?=
 =?utf-8?B?SndMcEE2VDAxQWI3a0hBQ3FucnRyUHlKdzZDZ2pBak1OMkFiR3lLdi8xWjMv?=
 =?utf-8?B?VGIrRnV6Z2gzaGpHWWZQNDFkcEx2a0g4RUlLVmxDSnB2VWFXLys5K0NTS2NE?=
 =?utf-8?B?TVNlaVJWc1AxQWZ0RmRSL095S0kvWWpBN2FrSFpwUlJPYk42d1VzZEUrcWwx?=
 =?utf-8?B?bWlHNkpCdkt4ZXhDdTFFUWdjZlc1bVFPZmYwUHFZM2lCN3YzOGtPQkxYalVZ?=
 =?utf-8?B?OTE3ZmtqdERTZWlNeHJ4dEJzV1ovQ1hBNXJaakp3R0pwMkREQ1o2TWtVYlRI?=
 =?utf-8?B?ckQ2WE0wYTdYY25SUzcrTVN5eGpwaUhrQzQydjZ2Rm11WjQwMS9FQWFPRmlC?=
 =?utf-8?B?ZnkzRTFzSjg5MVU1ZTBPZENNZm9Ndy82bW15aWh4OWVLcjRpZVMwbWNPbENl?=
 =?utf-8?B?d1FSWVA1TjFwcVlmL3FkQ0wrK0FuWEd3Nkk2MXFiSGp4eG9rS04wNTR6UllT?=
 =?utf-8?B?U1hJRlpEMVN1dkJDR3V2eHo4ZkVEWHdiZjJXU0hBemEzYXgrUXdONldVV3Qv?=
 =?utf-8?B?OWlEQWs4Z3RKQ0FCaU1rSjhTNjVmc2R6ZFVqVGM3V2NtZmJpUnBkSENDS0lW?=
 =?utf-8?B?MkJ5UnBJQ3l2TDVOdDc0YTRhd2ZXNnRmWm9kVGZiaXBvZHpURm5tWFBWWFkw?=
 =?utf-8?B?cDdxRVFaV3lDZDlEdVNKalNaL2VKMHJrZk1wTnh2RFVYU2t0UzQyb2Uwa2VE?=
 =?utf-8?B?NEdudmVTVlFVaUd0bVFzQ1kvZy9lV2hRYndRQ1BnUmZyWUU0dlVuNkVYelFk?=
 =?utf-8?B?T0wwL0l5UTNISE40czVwRDl5VGRKOXFJQXJjTTl4a0o3NzNmb2pQY2xmczgr?=
 =?utf-8?B?SU0wWEh5UUp6OUdVek8vbUF5NnNuTEJNQ3pPUmgvYk1wS1JBUzExSlJ0eTFE?=
 =?utf-8?B?bTJicFRMQTh6amx2L0w4Z0wzSzdxK2d0T2M5c0p5U2h4M09NaE9NajNoK1lt?=
 =?utf-8?B?dE5OYy9ObHoxR1A4QVg4SHg5a1Q5YUNGQlJra1lhclNsa1hvU0xiQ1RuZ3JT?=
 =?utf-8?B?WjlCZVQxc1dHMVQ0T2M0UXovMG1ZdXVjQzNnRzBiWUJQdmRPbGNLdndMcFIr?=
 =?utf-8?B?dERPS0ZkUVlrbkY2VE5RMExvZHVJZUU0SGFIc1lvTGozQWYxZ0dvUjI3dnNj?=
 =?utf-8?B?em8zcnQxM0JLRVJpQ2c2c1AwUzNpODJBTis2YnM5dHlINHJlQjgxbnZvL255?=
 =?utf-8?B?NDJZNGNOV2ZHN0RkS0RGblRVeVR5YXdEbzZzSW9UOHFadmpOY0xjNmgwNWl5?=
 =?utf-8?B?eVo1Q1RGWnhmN3B0WFNoTmk0YlhMZHlOSGNVS09VRngyY244WXBnSGE1TlFi?=
 =?utf-8?B?NDVuTEZzTXNrNXNPOExveGN0T29qUlNhb3lGMzRzeGtLS1NUSDhCeHA4R0pk?=
 =?utf-8?B?YytKOFJ4MG1ha0pUamdkQXRRdThTQUd1MW5sR2JRYjRsSkgydHBGSU92bGhQ?=
 =?utf-8?B?N250cU1UNWoxT3JDRklmSzhGdTBUd2hPczdpclRkSHBXL3Z1NDZzWVBHZUNL?=
 =?utf-8?B?M3VhL2duNUZ6Q20wMG5SalkvSmlZcHlUUlpjZXdrdzNMa2wvQndLek9QMlR0?=
 =?utf-8?Q?4C2cCj2LJldTh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUNBMWQ3eGZ2MUxBZnVZaWV6Rm9aUloxRzd1ZmpHbTVsVG1IendYRnk4S2NF?=
 =?utf-8?B?SERyZ1pxQlY4Q1dORnluVDhvL1BvRVFyYU11OTFtbHhPVXBrSkhCNHkxV1Z4?=
 =?utf-8?B?MFJWdTNnSkI3MVdNaW9kd0x5NkNQRTlsQW9JdEVxYlRzWGJyN3dJZVRnTlly?=
 =?utf-8?B?YVNHOVNOeG5RWFp3NHVDT3hPVU13dERZeXdVMnVudFBHK0hLUlBmL3U3Y3BB?=
 =?utf-8?B?Y2NrUnRzSFRKWjhta3ZsNUlpd2dGRkU2T1lTK0pIMHUwNTRDa0h3VFMyUTNm?=
 =?utf-8?B?V2NPd1N5NzNpYWl6eWh1WjNwcytla3pUSVNIZU4zNUwzUzY2OWQ2bFdUWlVn?=
 =?utf-8?B?ZGsxeGpQcFJyNUcvVks1b3lLTDNkQTMyVExMcEthbmxlUWNZN3psSDFhOTMw?=
 =?utf-8?B?TTdyRklYeVVNN3I4MFNwbVAzYjczekNua3lHU0tjQ1IyYVIzSnJjNGlaYmVQ?=
 =?utf-8?B?YVBRSHBFZGZtMnlzdm1SdHB0d0FHYkttQXkzL2dsRmV6RnMvSGpVdHgvSW1B?=
 =?utf-8?B?QVJVQlRjbUY0ak1wOHdHNDJlNi9qbENPOTJCdXJCSXRZUCswSHR3TzF2WC9y?=
 =?utf-8?B?TjFQZHFWOWthVktKc3dJbGlMZmViVkYvSnA4U2xPdFhxN3VyS1luL0dLcmhX?=
 =?utf-8?B?OXVoQmlYU2R4MkNiTUNKbkxmSVJrZXBkdnZTbDRpQmE3Y1htMStReDR2NEpk?=
 =?utf-8?B?alZEc0NmTUFXNFViUUVFVkxJRG5laFhTMlY1MEhTYnZaeWoyZWVhRk9vS2Jy?=
 =?utf-8?B?R3F4Y3RxNHorckF3WVFjZzBFZDhySm9FZHFJdks2Sm5VSTFMbVRTZS9MQngr?=
 =?utf-8?B?QWViaW9lb0lMckhaSm82d1gxSEZQQkQ5UVdwaVNYaldKS2tSUyt2VG41NHlG?=
 =?utf-8?B?QWFSb09Qa2gyejRTY3l2QlpjNUhiZjhzblB5bmxzOHI1OENhVWg1RVR5QUd1?=
 =?utf-8?B?MVNLRndzY0doZnBsa01zRGNhWUlBSUxNZU1SZlo5Q1FHVDRCbXlhcjhTcGdi?=
 =?utf-8?B?ZlBpTitNSVp5aGpxZ1UvNmRPVG1EUTkyWVppNUg4ZVJSRkh6U1QwY0hldUpa?=
 =?utf-8?B?K2t4ekZ4aXhaSS9VWmoxUjg3YnNVZVl2L1NNcVNjUFVpb2RUbE1sUGVDUTgy?=
 =?utf-8?B?SVF2Y2l0bk53a1hURXIvTStMcm85bUJZWXFKWTJOcUZJblBzT0JFNnJuK3l4?=
 =?utf-8?B?c2hNOFZ6eWhkWVNFVk5VbXExczFpWUE0TDdsTnJiSTJSbldQQ3VxclF3Wkti?=
 =?utf-8?B?QmNTZUN2dGtsVjkzRitqNDJOYmJNY01CUjB2Ylg2dWtZYnhMc1A2SWhrYnRu?=
 =?utf-8?B?MmxzcldBaTd6elRSTHFUak5ZMnRLaG04VkxKZDdlNE9BTHRFRjkzYUpTTCsr?=
 =?utf-8?B?M0JCd2dXMGVsZFBvVXF1YmRPKzY4dlRWY3NpZ2VsMHFJWkFlRTBQWGZ5S0dx?=
 =?utf-8?B?azNVeS8wdmdobnZGeDEzUVJJRXk3dUl3ZTM2MDI5ZWdpMStVWTVSQXpUYmNM?=
 =?utf-8?B?NTZjRXlybE9MWE1iZXk0ZkhtS3hES2ExNkVxL1V0ZThJY1FuRHV4ZkVIYk1Q?=
 =?utf-8?B?YTcwYlUrQTJ2Ym1DTjNEaElLU0l4dGtOZDBZbFNDSUgrRldHcHdiTVNQUmdR?=
 =?utf-8?B?WTM2WmxweFBxQ1lUa0tnVC84Y2JUODZSbnYraHZ5ZE05WVMzQXZ4YnJmUjNi?=
 =?utf-8?B?aVpOUThUWnBRbGQ0RkxiZ0xLdzNJTGxpTCtvdEYyMForM0hBaGhQSWhIT2Z2?=
 =?utf-8?B?VnIybWlUUTZTTTFudHZNYzR0akQwbDVqZ3pFQWF1TVRheUpWaTlMUm8vUTVW?=
 =?utf-8?B?THkzMHZMa0syN1YrNVlDRTZaNkF1MkxXZEFhWEdhczk4RWhWSll4b0JsVlBz?=
 =?utf-8?B?R1Z6NUdrMkZUb2ZsNXZDalQxYlFlUGNZK3lnZllnZU5BZWYwdTIrYkE2MGVT?=
 =?utf-8?B?RVRFb2ZFWEJiTUJBL3daeVJPQUIxVGxDcjMrWmxUSlVDNWhacG9DVS9Bbytp?=
 =?utf-8?B?MGc1TUs4Z2FRS2VmeUZVQWcwOEh3YmpPUVl3R1RyVDRhUEZWdHFadUJVZGlR?=
 =?utf-8?B?QjJDYVE0Q2J5Zm03YU1Td2ZzNTlUV1dmNkNJMklkNHVpNFNQc1FSR2dHZVla?=
 =?utf-8?Q?9Rn1mknyqSkSan2EH4TNQyrVK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b535004-7732-45c3-5055-08dd52936af6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 16:18:46.5770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ft36bN+qooeC8KnbVueUPAHn21AFLGprByAeLCCpxaXRE10kIAq/9Hej3scOJ/ljc83RI0XI+9s908jEhkQOuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5913
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



On 2025-02-15 09:40, Simon Ser wrote:
> On Monday, February 10th, 2025 at 23:03, Harry Wentland <harry.wentland@amd.com> wrote:
> 
>>>> + * DOC: overview
>>>> + *
>>>> + * A colorop represents a single color operation. Colorops are chained
>>>> + * via the NEXT property and make up color pipelines. Color pipelines
>>>> + * are advertised and selected via the COLOR_PIPELINE &drm_plane
>>>> + * property.
>>>> + *
>>>> + * A colorop will be of a certain type, advertised by the read-only TYPE
>>>> + * property. Each type of colorop will advertise a different set of
>>>> + * properties and is programmed in a different manner. Types can be
>>>> + * enumerated 1D curves, 1D LUTs, 3D LUTs, matrices, etc. See the
>>>> + * &drm_colorop_type documentation for information on each type.
>>>
>>> It's not super nice to refer to internal kernel docs here, because AFAIU
>>> this section is mostly written towards user-space developers. User-space
>>> developers have no idea how internal kernel structs work.
>>>
>>> It would be nicer to have a list of colorop types here, without referring
>>> to kernel internals. For instance, we have a list of
>>
>> I'm not sure I follow. This is linking to the drm_colorop_type
>> (from drm_mode.h) enum documentation in drm-uapi.html.
>>
>> Duplicating it here would mean that sooner or later the two
>> docs will get out of sync.
> 
> Oh, I thought this was an internal kernel enum. I guess the only missing
> thing is the string exposed to user-space for each enum entry then?
> 

Good point. We'll add that to the enum drm_colorop_type docs.

I did a brief survey of other enum properties and noticed
that this isn't well documented for others, such as the Content
Protection connector property, or the COLOR_RANGE and COLOR_ENCODING
plane properties.

On the IGT front, some tests set enum properties via enum strings,
and other set and get enum properties based on the prop uint64_t
prop_values[i] entry from the drmModeObjectPropertiesPtr.

Do you know if there's a best practice for enum usage or is it mostly
a case of "use what works for you"?

Harry

> In any case, sounds good to me.
> 
>> I agree with the rest and we'll reflect that in v8.
> 
> Sweet!

