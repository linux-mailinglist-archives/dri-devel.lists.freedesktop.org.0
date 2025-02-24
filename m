Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDD8A42BFB
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 19:50:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED65A10E4A5;
	Mon, 24 Feb 2025 18:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mF/KrF4F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C944B10E354;
 Mon, 24 Feb 2025 18:50:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q7f/IBTWRbKDlZ3irbp0FFbcGYZdtU+VX/SPL8cSTp/Rcnmi848KBvYEW8XJ0LqPLAmmxORzl5ldVVlneud00fQAlAGb5wUm0lQ9PXde79JOvPcB9g+T5dLj2KP7CGP2z5cArB2VExxH/g1EJ/LCm8FP6kx5K2och336Z2ns+HUkacvj1X0ut2jpP/Sbo4UXMAF4YgSjte7ytIYBIYAJ+PkV9OUhrRi2oOZkh/1p+TyFoR5vihibMofFCacBmCmiIhs4y2at5/Nrw8BJKJ/PzrnIG8ToVHh0/SeGEnL9mlZggJwpSOJrcaOEXcH063w2twEgl4uG1gS/PerbNZunAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ys4/zm7rmEi5t3jtw2jxaoIZwYq+dZqZ68oEmwmYdw=;
 b=FEXmg7ezCm5xV+N/BXZj3n2J1z9/7yKWwhWfopu7qbuKxEIi9OJig4/w1y2A56F0s4I9MFQ88tUxgU3/pa+kD1YnYv8QCTto6vd+W4ZCeXIHqHYdRrmN0sQbbxEq/hc21zFNEanSc5HTDbHOzMP21zyKKqj4Qwn7e6eXQziQgaGLe1TvwY7bb6+QgHcTwj0IBQrYj4pHinO5LpTzkSNqkzJvuiIxhwqAItpMAgP1Ki/8CtAu7ollwi54YgcxUDcDSr/edXPag3O6oQM69e6mgYsXFowsuXyk+sAh6jPbNASYdZiYQNhHdaGNU58siPDzGS5QzkTHsk85cosD5ODugA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ys4/zm7rmEi5t3jtw2jxaoIZwYq+dZqZ68oEmwmYdw=;
 b=mF/KrF4FChuZp+x1Xx2zO+DpoQ/TL5G24Zd/q5/KJ07Ux5TFdb2gezHhqiWfCiuBHVL2Izi0f55V0dzHg65oqqN2pRgrzmsnIT1ashoJat13I2/DeFXEod90luBAH25PMXmneyrUhPnXV/9PZ0PQ5WyeBGsgOAYd8rfN08vAteU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH8PR12MB7232.namprd12.prod.outlook.com (2603:10b6:510:224::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Mon, 24 Feb
 2025 18:50:17 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 18:50:16 +0000
Message-ID: <45649556-ff91-4dec-8cf6-19d85bf655f3@amd.com>
Date: Mon, 24 Feb 2025 11:50:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [V7 01/45] drm: Add helper for conversion from signed-magnitude
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: wayland-devel@lists.freedesktop.org, harry.wentland@amd.com
References: <20241220043410.416867-1-alex.hung@amd.com>
 <20241220043410.416867-2-alex.hung@amd.com>
 <723796aa-df03-49c6-8810-62ddfd4bb2b0@bootlin.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <723796aa-df03-49c6-8810-62ddfd4bb2b0@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0039.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH8PR12MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: a74d7dd8-f48b-467a-4ca2-08dd55041453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekVLbi9zbVBycFVjMXY3NUpTTDVUQUlNY0oreDkvOUZkWmxQVVRidTdwdnVT?=
 =?utf-8?B?RVZzeHc1SVdVMDhIWm15MTNzNmd3SHVuejZvRkwwVGlicFpIQ0RCZkgzVzZZ?=
 =?utf-8?B?ajlxU1FvOUJlN1l0QkZiYjEvN3k5aVhJZWkwc011YVVhb0pIQkRoK0FBTVJ1?=
 =?utf-8?B?TWtjWCtjNFdvdWdZZTN5ZEgzTjNrcEcyQ1J5K3dkQVphN2w1VTNJVTJlQ1g5?=
 =?utf-8?B?ajBGWXFmMkxyT0hQdW9nMnlEVVR5OWZKa2RIQ09mVlVoalg0dThKdFJlUmNL?=
 =?utf-8?B?bSs4NkhjdWVZc09jeGFlNGVmaWxDOVF2UjdHaVJsRy9aNlFjc1JwcE9ibHN4?=
 =?utf-8?B?aDB1U1Y2bHhvYWpac3BleVFoazlXcVZaQ2VPMHhNT3B5NmM4b2Yvenl5Vk9C?=
 =?utf-8?B?QWtkUlY1OFhZRTFGSkdMNkFqbXdHZ1pSYnBMK294T2N4b2dBOFlia0dwdG1a?=
 =?utf-8?B?TkNBRVpBWng4V1FzTGwra0xqZHA2RjRucTZOekt3TjFaVFEzQnZHeXFXUXdF?=
 =?utf-8?B?QzhMbjNYc29ZSWR4NGdTSTFaWWVHQ2wyZmYrT01oVVZmcURmdjlwWXltSFp5?=
 =?utf-8?B?Z3JlKzVtL2IvZTZ1NEdFTFRGYTNhR21keUZ3NW12dlV0WVA5aEFvU08wOTFv?=
 =?utf-8?B?L0VnNnNZSjF1eVVOa3VxSWIxZXUyVDZDSFJyUmNmbHZTVEdybThMTGVNWUx2?=
 =?utf-8?B?YnRJaW9BU1lJTWRjU084R1dTMFB6R2h3T2VYb3g2bmtmS0IxdE9kMDljMmp3?=
 =?utf-8?B?elpwblRHNEdVb0x6UExFZUp3c09ySWZuaTYrTHZsZ0pNLzY2emYrTFV2RnF1?=
 =?utf-8?B?NU5lYjk2SmZGcUYzM21kcUJUMjdvYzdlTFlhQ0VobzdjUVdCMHZhR1d5MDlJ?=
 =?utf-8?B?bjFZUTk4MkI0MEtZc3YxbVMvTktMUGZxUUJTRUtXOTRseFJqZDNMdHdvVndy?=
 =?utf-8?B?akZTRkdQelZodVF1WHV5cWNROTJidjA3TFZwNUZ4R0JMUkxpWnZoenBySVhL?=
 =?utf-8?B?WG1yaEwyS2xYSkFwR2JMWWlmN0xvOGlQNjhzNktSTFdtM2QybmhhTzJFUFQ5?=
 =?utf-8?B?Ni9BK2Z5eUV5L2diTGJPKy9lZitMbUlIRVlBZnBhSlMxVTFWQVRyKzlkd1Mx?=
 =?utf-8?B?ZUhRWXl3citlVytQbVkzYzlacjlDYWwrS0tIcUZpYzdIanA4c0EvNSsvSXVQ?=
 =?utf-8?B?ckYzdUNML0FEdmVVeFhma3MzdUVVVEdJaGlKTWhnK2NLSzdUaWFGWHdhaU4w?=
 =?utf-8?B?SjZvVTlJQy9McThnUktsSG1pd24wOTYxRy9QbWkyMGJ1VU5XZGhoZUJ1b2Nm?=
 =?utf-8?B?b3U2U2lRMlBPUlg2WGVBUnFCbVNKd1IxdUdocmU1S1VTMUhheUVIczhRL2k0?=
 =?utf-8?B?UEpvQmRKRGlDQUlHODd4dDRrVjhTS1doQUttVW1oNEgxZjFKVDJPandxQjlE?=
 =?utf-8?B?cVVteDJNWUtYLzlmTGkxcURqSk93T1pOMWpMMTFQck9CUU1PZHlrSEFieEJJ?=
 =?utf-8?B?TVA2QjUyR3d0bW13L1BocWw2ZWR0RW1NemRENURqKzk3YzRiN3FERWREYWNO?=
 =?utf-8?B?VmwrbmIrbjZoVnhsdVlMaDQ2Rllqa3VXQ2NGdGZmaGJobDRpWElYaHJ6OEFp?=
 =?utf-8?B?UmxKTG1NbnZ6TmlXVTlSVUszL3ZKUWlGYTI0NlJrUG9OSFN6OEMrdnRPNEQx?=
 =?utf-8?B?a3BLSUFrSmd1S1Y1Rm9aMGtwQUxSQ3lEdGhDbEl2bnBKYXl0T2ExeFhKZG9J?=
 =?utf-8?B?eTc0b1Z1VGtvQ0pRaTRxUTN6bWZIVnFhb1lTa0dQb1lIOEdKQ05WNWhMVVp0?=
 =?utf-8?B?R09FaFQzbVZkY3ZDOWJBQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzFVL3RlRzJ3QkhoRlJDVlJCQ3RVaVBNYnozdXlwbmFTUVg0NWZCeS9Pend0?=
 =?utf-8?B?bUJQUExRNGxVWVlqMVpYdmZjUVR6VklLQ0FZa01BcHFBQ25qanA1dkpKYTVO?=
 =?utf-8?B?SEUwcEt1OU13cVBjVTBKeUlxNnBqaWdQbk84di9Lc2FkVXVMcDM2NHU2QStp?=
 =?utf-8?B?VHhjc0YzNlpOU3lsdFg2ekl2a3FMRDlEU0pTNU9OVXFaWTZVbWdZbkpSTWw5?=
 =?utf-8?B?LzhNSVVaWUhBcGE2VHo0NENISWZWa1JTNU5aZU9raTRRQXV3RW52S3pOUEFD?=
 =?utf-8?B?dlg0TWNSRUdHUWEySkx2U2dDOFBodHdkOU8xRzdNSjBUUTZNeGEzMTFjN1k0?=
 =?utf-8?B?ZHgzQWVwTXQ2NVA3RWQ0VWdneFplS1JKMDBjRnFhM0J1Mk5HR0pQQUF5UjJG?=
 =?utf-8?B?TTNhTktWUFpEQnNjY1Z2ZFNiZlpScWJzSlNGaTVMT1ZsMjhCTXkyQUFkenND?=
 =?utf-8?B?WkNBMUlleHVOZ3pDbEw1aTdIUEdMc0dYNHQreGFIOFJwTGplaVJWc3N0cHdo?=
 =?utf-8?B?QTQ5VVFpbDZyMWN0bENPQWR4bW5MUkRRQ2VkNlZvblJKRjZ6S3dzVDdlVU9v?=
 =?utf-8?B?b1dzTjFrZzRUTThQZ1JFTVJmL3g5NUd2YUMwbjNjZGJmN3ByUDJ4T3F5Zmxy?=
 =?utf-8?B?WlRhOU9qRVJiSmNHQ3g5azlKdmRDOVBXTHNPd0JQcEhLMXQ5Q25kY0g3WHhr?=
 =?utf-8?B?VjBSd0lJWGlPS2JUaUxpdFRqRFczUFMvSXBFUW5NUlB6NzU5dE1BWVJwNUU5?=
 =?utf-8?B?VEZxb2tJWlozamtod3F5MGd6enQxZjlGaWlLWTZNdDMwbnVqTE5SZklWeHZV?=
 =?utf-8?B?ejNOMWs0M2FOdUVPN3FxbGJ2cVJhckpKaTBCYWZUeWo0alMxbGtDbmpTM2FF?=
 =?utf-8?B?ZTdzeWhRWmU5MmJ0MXJkU2dtVTlSU3J0QzdkNWp6YlRUSUxDL0U1ejVpdFdW?=
 =?utf-8?B?bU9pVFdkWHcrWWl2Y2k4VW5DWG4wTzNiUVdkUmFLR1huZTFKYUJJY0pFQlVX?=
 =?utf-8?B?M2JXWDVZeGgvN1AvZjB0eGNjclJaSDYweVNZcUJNSmtxNXZaN2l6MWd4cjZ3?=
 =?utf-8?B?eERmdmo2d2E3UXJnUVQ0Mm5JZDJkcGh0UkFWZXMzRjVZUzcxYlRCdjQ1N3Zk?=
 =?utf-8?B?amlvbk9USzI4QmhVRCs5VmhqZ3FSWURENS9xeFZKYkNjWkdwUHVEdHN6TUdE?=
 =?utf-8?B?dXJOVVl3R2lsL241Rk4wUzZrK2d5bkV2UU5wRjZ3NlNNVDFKUHdTUXJndVZ3?=
 =?utf-8?B?M0F5Ky9UalY4OUlqUUpUcWQrMDByWUk4YUR2MU9uQ1c3RjgvQ3hPeDF2ZkIx?=
 =?utf-8?B?K1lhblErSlVmSDVwalAwMGhWaHVtV0FXL3Z2MzJtZG1rSDZPMFduUFUrOXQz?=
 =?utf-8?B?YnFmZkU2cEl3elRpNXJtMnJSREJOemRSL2xuUEZ4SDNISjBOd0VHQmNHRkJF?=
 =?utf-8?B?OFBpZnQybUhqS2w4NDVTSWtKMTVSZE9nQlZyYzhwdzAxU29meERCc3RpU0xv?=
 =?utf-8?B?RmcxL1Q3OXp3V1QzQzdvaHlKcU41VFAyQ1FRaTYwTUVXbW9KTndXYkNQem0y?=
 =?utf-8?B?WkFFV25wN0krWmZ1TDhCZFRSNXIxT0o1eG51elV3YkV1ZFRMcjNoSjJzTmNR?=
 =?utf-8?B?Rm5qS2M2Y2toVnJBRDduejk4d1dmY2NHOWg3N0R3YWVPM0swRXFKZ2poYWRt?=
 =?utf-8?B?WTlISTJPRThpUmFKenphUlh2d05nbGdZVGNpMDR5UlpvWEZ3VkNDM05xbTdj?=
 =?utf-8?B?ejlZOG5NVUtibkVVMjdIczczcW1XNndnTWkvd2JoTUFVSUo2UUh6R25QanNW?=
 =?utf-8?B?QzJzM09BWVZ3cW1GdDVSWXovWFlwQXE4MTE5Q1JVbGxHUm93Q1V4L2F6ZzlZ?=
 =?utf-8?B?YmFVdmJGUkZHVWVVMUJUV0JlTUNuV2tEM3VuY1Bjd0xHbkQxWlJuVklkaDU1?=
 =?utf-8?B?U28wemM0U0I2VHFuNTIxc1l2OFhDYlJ0QjZrQ1gvVVRDYlBLV3FzaWpMczhj?=
 =?utf-8?B?UUplaFUvVHErZmUrT1hCLy91RjNka212d1JJNVc5MW9VbnZGNW5UN3o4RzNY?=
 =?utf-8?B?U1E0ME5BcVBNN0tFT1g3SmxPbEJneHhRQXlJV0pPbjJZcXA4UlNtRW9acTVv?=
 =?utf-8?Q?qgIw+0ktYWCAVXbUpA4UK1skj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a74d7dd8-f48b-467a-4ca2-08dd55041453
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 18:50:16.8048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ho2pApreTciCsFBM7M6ucuHZ58Zs5QEhJH2qKdJsZI2PzcgDGfPG78iKfGYyPNfEwcsqsyHeayhcs3AVHiqVFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7232
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



On 2/24/25 09:07, Louis Chauvet wrote:
> 
> 
> Le 20/12/2024 à 05:33, Alex Hung a écrit :
>> From: Harry Wentland <harry.wentland@amd.com>
>>
>> CTM values are defined as signed-magnitude values. Add
>> a helper that converts from CTM signed-magnitude fixed
>> point value to the twos-complement value used by
>> drm_fixed.
>>
>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>

Hi Louis,

Thanks for reviewing.

The replies to other patches (2, 3, 5, 6, 7, 9, 10) seem to be empty (I 
checked on my inbox and on 
https://lore.kernel.org/all/44edbdfb-5e23-4c19-8c80-e7acb8b4930f@amd.com/T/#m2232bab7c543229a057123c5e762bf49c86a4148)

Did you try to send something which didn't go through?

> 
>> ---
>>   include/drm/drm_fixed.h | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
>> index 1922188f00e8..0b44f2f294ce 100644
>> --- a/include/drm/drm_fixed.h
>> +++ b/include/drm/drm_fixed.h
>> @@ -78,6 +78,24 @@ static inline u32 dfixed_div(fixed20_12 A, 
>> fixed20_12 B)
>>   #define DRM_FIXED_EPSILON    1LL
>>   #define DRM_FIXED_ALMOST_ONE    (DRM_FIXED_ONE - DRM_FIXED_EPSILON)
>> +/**
>> + * @drm_sm2fixp
>> + *
>> + * Convert a 1.31.32 signed-magnitude fixed point to 32.32
>> + * 2s-complement fixed point
>> + *
>> + * @return s64 2s-complement fixed point
>> + */
>> +static inline s64 drm_sm2fixp(__u64 a)
>> +{
>> +    if ((a & (1LL << 63))) {
>> +        return -(a & 0x7fffffffffffffffll);
>> +    } else {
>> +        return a;
>> +    }
>> +
>> +}
>> +
>>   static inline s64 drm_int2fixp(int a)
>>   {
>>       return ((s64)a) << DRM_FIXED_POINT;
> 

