Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2650B9BC72B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 08:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC99F10E52F;
	Tue,  5 Nov 2024 07:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IeJ6nlIj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E8010E52E;
 Tue,  5 Nov 2024 07:41:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsacy1ZnfAjbJBMn35GxahNbljHSqkfXWApY7/davPNgcRtDBml4IL6ChEvJhl2IyX9ujC9itYjqUi1LwCaeMhIxoeHWx94J9VlXnxek7Tq4lbCZNfTo95dU4DaJiVk6yRN8t3CZsXVTACSOd7vrwe2j4a6F7TVJ3AEclCfM+IcnEfCmKUK7soQsRgNgm4l4CVsOSZCDrOONqIC9jmRoE8j/aesVQKx4zgo0KvrZet/a+FJ2rRTQVF86q5KttwEXVS5ZwAa5yI6SNAiRTs1TpHrRYuKN/0ZKuLtjRrjsiNaYxGez3s8Xj0f10DY8S5UixJeEq+4qPHrzmzSduY4q1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukdHZiBDM5gn1112dUihZONDhZX6o0NioSR3QfyGFLY=;
 b=ZY5M+AJpVyQxqaqBMZab6FaD2wuOOx5cszuVll34zs2HvSTIZJ86iTujoTIACzLZ6lrnnbPbt4dZehEaMNJW4lAc4NATV+bSX4JVaHAu8AsAtx9x+hCawW84IdISXmdMRBvvFCy2Qxx49zTNqgxTJ79/OPybSOH81ivn1F5LnrZGT6QF4bmkRkLUeY7CJ+ucwAxluN11uC16m81EOFLb6dr1+T4FSUPqh6nuUWVWWOjcqnPjI9Z+LfbL/0Wrp1fLvNPznWwhZzryV3hTY4qdL83XKFWobkHJTMQbbjZ5S/ANCDcqkLE/GpH3M6C2n2EEqLzXkofZfXxqUYBw3hxaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukdHZiBDM5gn1112dUihZONDhZX6o0NioSR3QfyGFLY=;
 b=IeJ6nlIjCcG2MjKXWsgL9pvrDNBT2dhsAy9zfyJZkYZHh1O7rnpxHBFBTn77g6Z3Kpt1C9DT9WjmDn5GQ6DZ6RnBeFUVa/VvAjnelmzGyxks8BxbWrGXDW0FG9XNRwufdZvHDX7YcIwj4S2MOSiMtY2JKPTPeGHmZiJ/LKpT83Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB6814.namprd12.prod.outlook.com (2603:10b6:806:266::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 07:41:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 07:41:27 +0000
Content-Type: multipart/alternative;
 boundary="------------0mYLaufmYOSj18x2fJaEsD5T"
Message-ID: <c76830ae-c6f9-47a2-8087-32d9f7c3df2c@amd.com>
Date: Tue, 5 Nov 2024 08:41:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
To: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui <ray.huang@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com
References: <20241031181048.2948948-1-matthew.brost@intel.com>
 <20241031181048.2948948-3-matthew.brost@intel.com>
 <ZyQWF/k9VFo99tDB@lstrano-desk.jf.intel.com> <ZykFrJIx9M204Weg@intel.com>
 <02ec3d6a-4727-4535-a384-4c6789fa4ef4@gmail.com>
 <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: FR0P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 1230858d-83e2-4539-f98e-08dcfd6d418d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHBlanJxcm9MY0lFcXVIUG81bzRwcXBuRC9hNGdJRVhyV0ptN1JJeTMwa0xj?=
 =?utf-8?B?RkNyRHF1QllTVHQ2UDNuNkFLZmtwZkU3cUlZdE1URDl2QmtBSnhIbDA1N3Q4?=
 =?utf-8?B?ZzdBOTFIMmpMeE5FNjBiQW8vbUpzRDgwV0VsWDBBWm1zOEw2b1ZSMFlWdDlv?=
 =?utf-8?B?R2c1WW9qNTQzbmw3dlp3QWhkd2ZwNEdobHUzbDgrd1ErTkJxcTdxNHU4V0tu?=
 =?utf-8?B?QW5XdDZJVUpCZzdnT1JLZTFIakM4bFJQNGJjUXFUa1lSQld1ZzRuUmhQblVi?=
 =?utf-8?B?NVFTWFpYZTVFRlBuUW9vcS96Nm5EWWRzb1JoYlAxakQ1N09VOVpQeElNRXl0?=
 =?utf-8?B?a3lXeUl0bVlzUzAzUzNTN3kxQnEraE9maUFNUlI3K3ZJOVFGaWtpQ3hWVTE4?=
 =?utf-8?B?ZzdyOWVlMXNPbmJKbnovOXBPUllLY0ZaNUxjdlVZaXk2NHo3TFByeFpYN0Rp?=
 =?utf-8?B?RGRPTzNuK3dMV01ITW00OTZqMm50Sm9wYXVObGsxMGVHVGRvSi84ZVQ4M2tJ?=
 =?utf-8?B?UjFINXVndkZ2eisxbVZlTzBmZVFub0Nobi9jajdqQXJKOXp5QXhzYy9mdGxD?=
 =?utf-8?B?LzhhWDRaaEJYSXdDNGVwbUVJcGFDZ0ljK3VWTUFacncwcWFZN0EzZ3hYalpu?=
 =?utf-8?B?dkNneThmNGYzSUlhb1NzbWpXQzZRRzlDclRmZDdSSEdkWjJZcTRZdk51L1Va?=
 =?utf-8?B?TEtmS0hFcG5OVzNodDY5dExYVDFwQ3dDUHRvRUd0TnR6ak14Zm5NVUhuVkJX?=
 =?utf-8?B?ckxFVXdhbHdKclE4VFFxSm5iZFlPeUFrOTk4ZnZzd3cvT1dlKzlBVklXOXA4?=
 =?utf-8?B?d0RGV0QyelA2bEhVRmNQZUpRUzRPRVNudExEUHBkbFc5NHpJbHl2ZFR6MmNm?=
 =?utf-8?B?VkJ3blZGL0Rhc3YxcGdoQ0IxMGNwQUdzVWRkc1RJMHU1b3MycUVJRVBLOWJl?=
 =?utf-8?B?ejQrNEE5SGxrQkRtL2J6MzhjUGs5cmZDamh1Wlh4WnQ2RFNQK3pXWmJKamoz?=
 =?utf-8?B?VUVSbisvbnl3THdYT0V0bzk2b3dtVyswR2h5MVFIK3VuaE4xbWErbFdhNGx2?=
 =?utf-8?B?RDVtdzJMVEpIcXhWbFdWNVNGTm9pcC8ybXR1aEF2T21LUGhKQ3dhbmxFT0Z0?=
 =?utf-8?B?MTQ4akJ0OGxuUmZITDFVSUlsc0VxcjJaMHV6MUY2M3NrY1NqQ3VxSlozQmVi?=
 =?utf-8?B?V1BhaDBYY1FRZDVhV2Y0S3FQWnFDQ0phSzViRWxkZ0NWd2NIVXN0U1UwVnB4?=
 =?utf-8?B?OEltNmxPdlZpM3VhR3ptY2UxZ0FTQXpvSkxJY2piMlV3UENUcFNHVjRHeE44?=
 =?utf-8?B?SXlZKzIwL01kcU04NFBkZHdMQjcyZjVQNnI1NUhRTmRhTk1LMG1NTXdudUtr?=
 =?utf-8?B?Qm1LenJvMy9zN3lGNVFTYmlFUHc2enhDSFVDcGR1WC9DN2RYL2MrU1M2ZHEz?=
 =?utf-8?B?MzZIaHNXOS9BRi9CTk1vb21iR1hZcFMyRjJ2ekE3Mkdlazd5amFTRDZnM1Jn?=
 =?utf-8?B?SjIwNjJhbU9vNUxVclB4TnpPcHZMWCs2THB4SWZOTXVzejY3cGdmQ3RGMmpS?=
 =?utf-8?B?UCtuVy9JNkRleUlxejlRNm55T1V1ZThhb3VqZFM2dDAzQWlKaW5EN3BZV0VS?=
 =?utf-8?B?MmUwS1FPUXlHZnVKSUJEYWRPRmNicUlrV2kxKythci9JcHM0TjBwNk5leEkv?=
 =?utf-8?B?R1Q0OXZ1dDAxSDdUUXlwMmlIVWszR1ROaDVDL3VqZzR1eS92VWRrRVdKdzNN?=
 =?utf-8?Q?ncvnTSd/uQ+im2MXpI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0N6MG9veS9qb0R6eFgzcEI0SldndnJqVkhBV2U0cmxuSXpnM0tkdk9jUFhz?=
 =?utf-8?B?UkNjU0hFbzYwZVg0bU0yMzZodkZkeEZoWCtEMjY3YU1DQTRnSzYxcnV6RUVJ?=
 =?utf-8?B?SXVUTGw5MUNnOTVHd3dId0doRVhDRytiRGswaXhpOXRScE0zaTU2R3AvNENu?=
 =?utf-8?B?ZnNFWVVOZjhVNTdabXVDbHdDZ29KVUdPVjNuODhoZnVjczM2QU1WeHp4RUJJ?=
 =?utf-8?B?REVyQTZlQ0RvTU0waEZUcmk5SjZtVXFDR1pVSk9ROElPSHBzdTV3aWxUVk1D?=
 =?utf-8?B?OGFRaE81SURqcTl4bDl0dUtpM0h6V01sMnl2UVhvOEMvOUM5QnpsakIvK0VW?=
 =?utf-8?B?N0ZoNHFHeldlKzYxODdVV000TE5SU01iVlBhektsbU1Yb3VtZTREZGtLY0Fz?=
 =?utf-8?B?OGRwc2FoNnFUS1VaWWNDTWY4bk0xNVZVRDEra2NEa1dlTFRXdER2Z1RJUlBS?=
 =?utf-8?B?dWg1WnpESksxYlJ3ZC9MeS9ZamRmaUNHeWRhVW11aTJhQlF5Sm1XYm1Fa0pj?=
 =?utf-8?B?L0l3aWFrTXR3MEVpZ0d5SHRKSGRzSzZJK0Ntb1FJT21VQ1hJK3NPdnFFT3Rq?=
 =?utf-8?B?c2FKdWRvYld5ZHMxanB3WVN4MXZpalV0d3h0bFRlSit0ZlRPN2N2Q1FDb3My?=
 =?utf-8?B?SjVxT0ZteDVnVi9ySVZSYVkzdkJPV1UrWlhWaGsxWEVmWGJRalRGcVFhT2hE?=
 =?utf-8?B?WVJSVFVmZ0sxejBJVVQwZHViWGk3cXdKYVV4UFBJdThwV0dEMGlhbms1c3dW?=
 =?utf-8?B?OWJoZkdaRC9EVFp1YmpiLzNLaDFaZ3NBVVEzYUU0K0N1ZU82eVkxVnRuZ1hi?=
 =?utf-8?B?dEVRTHE2aC9QU3dIdXJ2SDZTVWZaTGhFdHp2VEFjejVBNjF0cUZHWExIMWZ0?=
 =?utf-8?B?TFZmQUhvUEgrMkh4OElVN0pPNVc1SnRnbEdLVjM1YVJGd1pDUGN1dEhDVXZX?=
 =?utf-8?B?MkhNc2tRZnExVGtoU0lIRE5lU1ROMTJkeUM5MnNEcWtUN2tTaGpCazdRamtB?=
 =?utf-8?B?ZS9PQ0lud20zWHNYSkt1Njd1clNOdVN5REJMZjlPNUNlOHFrODJ5K05vYzd6?=
 =?utf-8?B?N2JwZVgydXcxSE84dnpYRk1GaUpnYnM0eXVTeTY4dXJ4WEcwUGZSK21RQlAz?=
 =?utf-8?B?dlZSM0QwYUdJNlVDeFJQYzk1cUQ4ZlZkcWdFOHZyQWFBN1lvMFUvTFd5MGJl?=
 =?utf-8?B?T1ZVT3lrM0lWUGNuYWl2clZCYUZOUGQrZXdCZW0rMzV4YTNSRmkxNzQzT2s4?=
 =?utf-8?B?aDNaWlJoelQvVEFDN2ExbFFlVHdIV3hOMklCV3pkSWs2bk1DRStra214Vmxy?=
 =?utf-8?B?Y0J4RXdYVk5aajg0SEc5eVNLR1UzY0dmOFdOTTdLdW9xbGV0cG5sYWl5SWhr?=
 =?utf-8?B?OGs0SFFHV1JBSzBObzlGRC9kYUFLT0RnRXM2YnZQRFdZUDBzZXBKOXhxUTUr?=
 =?utf-8?B?MUx2UlhiQUJzZDY5MEFIdkw2OVkwb3U3TzBncGVJZDQzdk15UUlaa0w5R2NL?=
 =?utf-8?B?cDJyWDRYUFZrUm5TWHFtbm8rMHBoeTBLeGNNRll4V2VXdWpoazNwTUNWOGto?=
 =?utf-8?B?RS9ROWw5NTdKaUJvQXlScTRQOTczSG5VTzRkVmlydVM4MjNCWVpGaG5rVHRM?=
 =?utf-8?B?cU9kMGlsNms4ZmNpN0VXcllFeFJhMi8zU3VhSnU4dllodjBZVlFienJRNkFQ?=
 =?utf-8?B?NHNUQTFjYjZsYjBjdjk2U0xTVUhoTDcrbi93b05zTDQvbjhDNDlkS0pCQnE3?=
 =?utf-8?B?RnFIUVdxKytxY1UrazQwQnJabTR1aVB6Wk9mSnR4TE1WY3VDVHlraGZmZkE1?=
 =?utf-8?B?cW5HMUNMc2hnSTUzZUN2MUZLK2o1S2lYY1NLTjhSQ1h0QjlBZVJwbGdxNzUv?=
 =?utf-8?B?eTdlZ0lQSTJ6M3VEWG01bmRQZGFTZHphaUdvT1BjWE52bmRSZ0dZK1J1Sjkw?=
 =?utf-8?B?eGYzWC9jTThpNjJBSVV5S29IMmMraUZvdVBOOExwbWEyOG9oVG1jZWpndE1Y?=
 =?utf-8?B?c1ZTd1MycHFIUXFMaGM4QzYzb2pFYjdvM2VueUV1VWZ6YnlxbVcvNVEvOTFu?=
 =?utf-8?B?R1htQ0FTUHhEYXU1UEhFZ01IVGhZaW9tMUdhTXN3THNwZTZGUVEwM3kybVhv?=
 =?utf-8?Q?nxezGPldmlMAK6x0a0/EWnafg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1230858d-83e2-4539-f98e-08dcfd6d418d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 07:41:27.4202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ddb2zvCyM/Gf4SC6XYP5v9oYi+gjGvb4yZAzA65wtRvukfSQMl+Sloh0mWxLVaXr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6814
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

--------------0mYLaufmYOSj18x2fJaEsD5T
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 04.11.24 um 22:49 schrieb Matthew Brost:
> On Mon, Nov 04, 2024 at 08:28:34PM +0100, Christian König wrote:
>> Am 04.11.24 um 18:34 schrieb Rodrigo Vivi:
>>> On Thu, Oct 31, 2024 at 04:43:19PM -0700, Matthew Brost wrote:
>>>> On Thu, Oct 31, 2024 at 11:10:42AM -0700, Matthew Brost wrote:
>>>>> Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
>>>>> VRAM easily be accessed. Add ttm_bo_access, which is similar to
>>>>> ttm_bo_vm_access, to access such memory.
>>>>>
>>>>> v4:
>>>>>    - Fix checkpatch warnings (CI)
>>>>> v5:
>>>>>    - Fix checkpatch warnings (CI)
>>>>> v6:
>>>>>    - Fix kernel doc (Auld)
>>>>>
>>>> Christian - Do you mind if I merge patch along with the rest of the
>>>> series to drm-xe-next?
>>> Ray, Christian,
>>>
>>> ack on getting this patch to drm-xe-next?
>> No, we actually spend quite some time removing the single page mapping
>> functionality for BOs.
>>
> I don't understand this statement. This patch just adds a TTM BO helper
> for access - it doesn't change anything wrt to single page mapping.

Well we spend quite some time removing single page mappings from device 
drivers.

The only remaining use case of ttm_bo_kmap() with just one page is the 
ttm_bo_vm_access_kmap() function and I was really hoping to make that 
one TTM internal at some point.

>> You need a really good justification to bring that back.
>>
> The use case is EuDebugger requires essentially the same functionality
> as ptrace -> vm_access.

Then why don't you use ptrace in the first place?

> TTM mapping non-contiguous VRAM doesn't work unless I'm blind. User BOs
> which the EuDebugger accesses can be non-contiguous, hence the new
> helper.

Then why don't you handle that inside the driver in the first place 
instead of going through a TTM midlayer?

Regards,
Christian.

>
> Matt
>
>> Regards,
>> Christian.
>>
>>>> Matt
>>>>
>>>>> Reported-by: Christoph Manszewski<christoph.manszewski@intel.com>
>>>>> Suggested-by: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>>>> Signed-off-by: Matthew Brost<matthew.brost@intel.com>
>>>>> Tested-by: Mika Kuoppala<mika.kuoppala@linux.intel.com>
>>>>> Reviewed-by: Matthew Auld<matthew.auld@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
>>>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
>>>>>    include/drm/ttm/ttm_bo.h          |  2 +
>>>>>    3 files changed, 89 insertions(+), 64 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>> index d939925efa81..77e760ea7193 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>>> @@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>>>>>    	return progress;
>>>>>    }
>>>>> +
>>>>> +static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
>>>>> +			      unsigned long offset,
>>>>> +			      void *buf, int len, int write)
>>>>> +{
>>>>> +	unsigned long page = offset >> PAGE_SHIFT;
>>>>> +	unsigned long bytes_left = len;
>>>>> +	int ret;
>>>>> +
>>>>> +	/* Copy a page at a time, that way no extra virtual address
>>>>> +	 * mapping is needed
>>>>> +	 */
>>>>> +	offset -= page << PAGE_SHIFT;
>>>>> +	do {
>>>>> +		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
>>>>> +		struct ttm_bo_kmap_obj map;
>>>>> +		void *ptr;
>>>>> +		bool is_iomem;
>>>>> +
>>>>> +		ret = ttm_bo_kmap(bo, page, 1, &map);
>>>>> +		if (ret)
>>>>> +			return ret;
>>>>> +
>>>>> +		ptr = (void *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>>>>> +		WARN_ON_ONCE(is_iomem);
>>>>> +		if (write)
>>>>> +			memcpy(ptr, buf, bytes);
>>>>> +		else
>>>>> +			memcpy(buf, ptr, bytes);
>>>>> +		ttm_bo_kunmap(&map);
>>>>> +
>>>>> +		page++;
>>>>> +		buf += bytes;
>>>>> +		bytes_left -= bytes;
>>>>> +		offset = 0;
>>>>> +	} while (bytes_left);
>>>>> +
>>>>> +	return len;
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * ttm_bo_access - Helper to access a buffer object
>>>>> + *
>>>>> + * @bo: ttm buffer object
>>>>> + * @offset: access offset into buffer object
>>>>> + * @buf: pointer to caller memory to read into or write from
>>>>> + * @len: length of access
>>>>> + * @write: write access
>>>>> + *
>>>>> + * Utility function to access a buffer object. Useful when buffer object cannot
>>>>> + * be easily mapped (non-contiguous, non-visible, etc...).
>>>>> + *
>>>>> + * Returns:
>>>>> + * @len if successful, negative error code on failure.
>>>>> + */
>>>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>>>> +		  void *buf, int len, int write)
>>>>> +{
>>>>> +	int ret;
>>>>> +
>>>>> +	if (len < 1 || (offset + len) > bo->base.size)
>>>>> +		return -EIO;
>>>>> +
>>>>> +	ret = ttm_bo_reserve(bo, true, false, NULL);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	switch (bo->resource->mem_type) {
>>>>> +	case TTM_PL_SYSTEM:
>>>>> +		fallthrough;
>>>>> +	case TTM_PL_TT:
>>>>> +		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
>>>>> +		break;
>>>>> +	default:
>>>>> +		if (bo->bdev->funcs->access_memory)
>>>>> +			ret = bo->bdev->funcs->access_memory
>>>>> +				(bo, offset, buf, len, write);
>>>>> +		else
>>>>> +			ret = -EIO;
>>>>> +	}
>>>>> +
>>>>> +	ttm_bo_unreserve(bo);
>>>>> +
>>>>> +	return ret;
>>>>> +}
>>>>> +EXPORT_SYMBOL(ttm_bo_access);
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> index 2c699ed1963a..20b1e5f78684 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>>>> @@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
>>>>>    }
>>>>>    EXPORT_SYMBOL(ttm_bo_vm_close);
>>>>> -static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
>>>>> -				 unsigned long offset,
>>>>> -				 uint8_t *buf, int len, int write)
>>>>> -{
>>>>> -	unsigned long page = offset >> PAGE_SHIFT;
>>>>> -	unsigned long bytes_left = len;
>>>>> -	int ret;
>>>>> -
>>>>> -	/* Copy a page at a time, that way no extra virtual address
>>>>> -	 * mapping is needed
>>>>> -	 */
>>>>> -	offset -= page << PAGE_SHIFT;
>>>>> -	do {
>>>>> -		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
>>>>> -		struct ttm_bo_kmap_obj map;
>>>>> -		void *ptr;
>>>>> -		bool is_iomem;
>>>>> -
>>>>> -		ret = ttm_bo_kmap(bo, page, 1, &map);
>>>>> -		if (ret)
>>>>> -			return ret;
>>>>> -
>>>>> -		ptr = (uint8_t *)ttm_kmap_obj_virtual(&map, &is_iomem) + offset;
>>>>> -		WARN_ON_ONCE(is_iomem);
>>>>> -		if (write)
>>>>> -			memcpy(ptr, buf, bytes);
>>>>> -		else
>>>>> -			memcpy(buf, ptr, bytes);
>>>>> -		ttm_bo_kunmap(&map);
>>>>> -
>>>>> -		page++;
>>>>> -		buf += bytes;
>>>>> -		bytes_left -= bytes;
>>>>> -		offset = 0;
>>>>> -	} while (bytes_left);
>>>>> -
>>>>> -	return len;
>>>>> -}
>>>>> -
>>>>>    int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>>    		     void *buf, int len, int write)
>>>>>    {
>>>>> @@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>>>    	unsigned long offset = (addr) - vma->vm_start +
>>>>>    		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>>>>>    		 << PAGE_SHIFT);
>>>>> -	int ret;
>>>>> -
>>>>> -	if (len < 1 || (offset + len) > bo->base.size)
>>>>> -		return -EIO;
>>>>> -	ret = ttm_bo_reserve(bo, true, false, NULL);
>>>>> -	if (ret)
>>>>> -		return ret;
>>>>> -
>>>>> -	switch (bo->resource->mem_type) {
>>>>> -	case TTM_PL_SYSTEM:
>>>>> -		fallthrough;
>>>>> -	case TTM_PL_TT:
>>>>> -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>>>>> -		break;
>>>>> -	default:
>>>>> -		if (bo->bdev->funcs->access_memory)
>>>>> -			ret = bo->bdev->funcs->access_memory(
>>>>> -				bo, offset, buf, len, write);
>>>>> -		else
>>>>> -			ret = -EIO;
>>>>> -	}
>>>>> -
>>>>> -	ttm_bo_unreserve(bo);
>>>>> -
>>>>> -	return ret;
>>>>> +	return ttm_bo_access(bo, offset, buf, len, write);
>>>>>    }
>>>>>    EXPORT_SYMBOL(ttm_bo_vm_access);
>>>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>>>> index 5804408815be..8ea11cd8df39 100644
>>>>> --- a/include/drm/ttm/ttm_bo.h
>>>>> +++ b/include/drm/ttm/ttm_bo.h
>>>>> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>>>>>    int ttm_bo_evict_first(struct ttm_device *bdev,
>>>>>    		       struct ttm_resource_manager *man,
>>>>>    		       struct ttm_operation_ctx *ctx);
>>>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>>>> +		  void *buf, int len, int write);
>>>>>    vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>>>>    			     struct vm_fault *vmf);
>>>>>    vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>>>>> -- 
>>>>> 2.34.1
>>>>>

--------------0mYLaufmYOSj18x2fJaEsD5T
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 04.11.24 um 22:49 schrieb Matthew Brost:<br>
    <blockquote type="cite" cite="mid:ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">On Mon, Nov 04, 2024 at 08:28:34PM +0100, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 04.11.24 um 18:34 schrieb Rodrigo Vivi:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Thu, Oct 31, 2024 at 04:43:19PM -0700, Matthew Brost wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">On Thu, Oct 31, 2024 at 11:10:42AM -0700, Matthew Brost wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
VRAM easily be accessed. Add ttm_bo_access, which is similar to
ttm_bo_vm_access, to access such memory.

v4:
  - Fix checkpatch warnings (CI)
v5:
  - Fix checkpatch warnings (CI)
v6:
  - Fix kernel doc (Auld)

</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">Christian - Do you mind if I merge patch along with the rest of the
series to drm-xe-next?
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Ray, Christian,

ack on getting this patch to drm-xe-next?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
No, we actually spend quite some time removing the single page mapping
functionality for BOs.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I don't understand this statement. This patch just adds a TTM BO helper
for access - it doesn't change anything wrt to single page mapping.</pre>
    </blockquote>
    <br>
    Well we spend quite some time removing single page mappings from
    device drivers.<br>
    <br>
    The only remaining use case of ttm_bo_kmap() with just one page is
    the ttm_bo_vm_access_kmap() function and I was really hoping to make
    that one TTM internal at some point.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">You need a really good justification to bring that back.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The use case is EuDebugger requires essentially the same functionality
as ptrace -&gt; vm_access. </pre>
    </blockquote>
    <br>
    Then why don't you use ptrace in the first place?<br>
    <br>
    <blockquote type="cite" cite="mid:ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">TTM mapping non-contiguous VRAM doesn't work unless I'm blind. User BOs
which the EuDebugger accesses can be non-contiguous, hence the new
helper.</pre>
    </blockquote>
    <br>
    Then why don't you handle that inside the driver in the first place
    instead of going through a TTM midlayer?<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:ZylBWVjlW+GDYy5M@lstrano-desk.jf.intel.com">
      <pre class="moz-quote-pre" wrap="">

Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Matt

</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">Reported-by: Christoph Manszewski <a class="moz-txt-link-rfc2396E" href="mailto:christoph.manszewski@intel.com">&lt;christoph.manszewski@intel.com&gt;</a>
Suggested-by: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Tested-by: Mika Kuoppala <a class="moz-txt-link-rfc2396E" href="mailto:mika.kuoppala@linux.intel.com">&lt;mika.kuoppala@linux.intel.com&gt;</a>
Reviewed-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
---
  drivers/gpu/drm/ttm/ttm_bo_util.c | 86 +++++++++++++++++++++++++++++++
  drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
  include/drm/ttm/ttm_bo.h          |  2 +
  3 files changed, 89 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index d939925efa81..77e760ea7193 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -919,3 +919,89 @@ s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
  	return progress;
  }
+
+static int ttm_bo_access_kmap(struct ttm_buffer_object *bo,
+			      unsigned long offset,
+			      void *buf, int len, int write)
+{
+	unsigned long page = offset &gt;&gt; PAGE_SHIFT;
+	unsigned long bytes_left = len;
+	int ret;
+
+	/* Copy a page at a time, that way no extra virtual address
+	 * mapping is needed
+	 */
+	offset -= page &lt;&lt; PAGE_SHIFT;
+	do {
+		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
+		struct ttm_bo_kmap_obj map;
+		void *ptr;
+		bool is_iomem;
+
+		ret = ttm_bo_kmap(bo, page, 1, &amp;map);
+		if (ret)
+			return ret;
+
+		ptr = (void *)ttm_kmap_obj_virtual(&amp;map, &amp;is_iomem) + offset;
+		WARN_ON_ONCE(is_iomem);
+		if (write)
+			memcpy(ptr, buf, bytes);
+		else
+			memcpy(buf, ptr, bytes);
+		ttm_bo_kunmap(&amp;map);
+
+		page++;
+		buf += bytes;
+		bytes_left -= bytes;
+		offset = 0;
+	} while (bytes_left);
+
+	return len;
+}
+
+/**
+ * ttm_bo_access - Helper to access a buffer object
+ *
+ * @bo: ttm buffer object
+ * @offset: access offset into buffer object
+ * @buf: pointer to caller memory to read into or write from
+ * @len: length of access
+ * @write: write access
+ *
+ * Utility function to access a buffer object. Useful when buffer object cannot
+ * be easily mapped (non-contiguous, non-visible, etc...).
+ *
+ * Returns:
+ * @len if successful, negative error code on failure.
+ */
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write)
+{
+	int ret;
+
+	if (len &lt; 1 || (offset + len) &gt; bo-&gt;base.size)
+		return -EIO;
+
+	ret = ttm_bo_reserve(bo, true, false, NULL);
+	if (ret)
+		return ret;
+
+	switch (bo-&gt;resource-&gt;mem_type) {
+	case TTM_PL_SYSTEM:
+		fallthrough;
+	case TTM_PL_TT:
+		ret = ttm_bo_access_kmap(bo, offset, buf, len, write);
+		break;
+	default:
+		if (bo-&gt;bdev-&gt;funcs-&gt;access_memory)
+			ret = bo-&gt;bdev-&gt;funcs-&gt;access_memory
+				(bo, offset, buf, len, write);
+		else
+			ret = -EIO;
+	}
+
+	ttm_bo_unreserve(bo);
+
+	return ret;
+}
+EXPORT_SYMBOL(ttm_bo_access);
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 2c699ed1963a..20b1e5f78684 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -366,45 +366,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma)
  }
  EXPORT_SYMBOL(ttm_bo_vm_close);
-static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
-				 unsigned long offset,
-				 uint8_t *buf, int len, int write)
-{
-	unsigned long page = offset &gt;&gt; PAGE_SHIFT;
-	unsigned long bytes_left = len;
-	int ret;
-
-	/* Copy a page at a time, that way no extra virtual address
-	 * mapping is needed
-	 */
-	offset -= page &lt;&lt; PAGE_SHIFT;
-	do {
-		unsigned long bytes = min(bytes_left, PAGE_SIZE - offset);
-		struct ttm_bo_kmap_obj map;
-		void *ptr;
-		bool is_iomem;
-
-		ret = ttm_bo_kmap(bo, page, 1, &amp;map);
-		if (ret)
-			return ret;
-
-		ptr = (uint8_t *)ttm_kmap_obj_virtual(&amp;map, &amp;is_iomem) + offset;
-		WARN_ON_ONCE(is_iomem);
-		if (write)
-			memcpy(ptr, buf, bytes);
-		else
-			memcpy(buf, ptr, bytes);
-		ttm_bo_kunmap(&amp;map);
-
-		page++;
-		buf += bytes;
-		bytes_left -= bytes;
-		offset = 0;
-	} while (bytes_left);
-
-	return len;
-}
-
  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
  		     void *buf, int len, int write)
  {
@@ -412,32 +373,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
  	unsigned long offset = (addr) - vma-&gt;vm_start +
  		((vma-&gt;vm_pgoff - drm_vma_node_start(&amp;bo-&gt;base.vma_node))
  		 &lt;&lt; PAGE_SHIFT);
-	int ret;
-
-	if (len &lt; 1 || (offset + len) &gt; bo-&gt;base.size)
-		return -EIO;
-	ret = ttm_bo_reserve(bo, true, false, NULL);
-	if (ret)
-		return ret;
-
-	switch (bo-&gt;resource-&gt;mem_type) {
-	case TTM_PL_SYSTEM:
-		fallthrough;
-	case TTM_PL_TT:
-		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
-		break;
-	default:
-		if (bo-&gt;bdev-&gt;funcs-&gt;access_memory)
-			ret = bo-&gt;bdev-&gt;funcs-&gt;access_memory(
-				bo, offset, buf, len, write);
-		else
-			ret = -EIO;
-	}
-
-	ttm_bo_unreserve(bo);
-
-	return ret;
+	return ttm_bo_access(bo, offset, buf, len, write);
  }
  EXPORT_SYMBOL(ttm_bo_vm_access);
diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
index 5804408815be..8ea11cd8df39 100644
--- a/include/drm/ttm/ttm_bo.h
+++ b/include/drm/ttm/ttm_bo.h
@@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
  int ttm_bo_evict_first(struct ttm_device *bdev,
  		       struct ttm_resource_manager *man,
  		       struct ttm_operation_ctx *ctx);
+int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
+		  void *buf, int len, int write);
  vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
  			     struct vm_fault *vmf);
  vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
-- 
2.34.1

</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------0mYLaufmYOSj18x2fJaEsD5T--
