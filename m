Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6232396621E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 14:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E9910E125;
	Fri, 30 Aug 2024 12:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YFxf1rEm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E8510E0B8
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 12:57:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+oNfPjWM2NLwcq38t6SgJezInPytZIFI989hYeMaBblFSUvnHhQVERPZ4kxguoTUkeTFH+RuRtR7Mzl30/kn9h3YjC7HMT2ntRVITJneAH+HaD+NXINVYAHC5xaOHamkWoi4YTyWL0Wz9TZa3aytq3F8H3vpwyM2ievt+OoFo+Z+MR6HjjXqPS9g6gAbzzuY4voQ5+bDxBUUWGaPxQkNXok0eNLJZDX1Q3glkE6bIC1/nTxxnSqjJB712rAS5ead/FCkGDwXcufU2CfWz5aNUk1CJ7C9tjHaxtpVhWizPjeAZWb1pdJHMHLgG+iCmDK4jEaz8qT+L/46vAgzoQzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+zactoCO5AmxJvjGwUrzOvI5w934+DSb35svHCNaFg=;
 b=m7onlT6mjC5T+/omxWyhYTJfnyYt/5/NiwSvSMn/mQN7FSHCc4tpvZc7ajatl3204QaseaEo/W8o0PFh2HNK7z4zcYLxFIsnEeujUWTGXOYwNM/d3AS/y+IZEQJSxWEGucWiT1rnZvUK+YoZ8vAYZyxIr0I2umUOpXAyVoO11gBNB5ToG1bKBsRmDQbPuW6nvZxJDSv6aNM5O7BJI27LmFeYwau8mQzpXpXep7Df8dRrb0W8RA3yPDFDbXb5Caawiq9HEjpJ9DvWL7f2lglhIHkbB1IDZGDj8lliWhUf05qYoFcjAIhz9Ea0W7zVftg8V5UvTAvCfM68l9Zx6Z47bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+zactoCO5AmxJvjGwUrzOvI5w934+DSb35svHCNaFg=;
 b=YFxf1rEm45tV2ZRtRjBtulXMECBk+aH/zCEXgj2f/Thvc2wL6nI/glq4eHCRg58uEW6PPboFRloI3wlzsQT0kjE2USvm7GE9u4o92Q3rQSxNO51CYsCbFSs98InByJCeBS5wfgo9adY5fFaklbNu031cIwUEEPBWuZ5r5BDOX/k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Fri, 30 Aug
 2024 12:57:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 12:57:06 +0000
Content-Type: multipart/alternative;
 boundary="------------MJQ4K8c4qmLTI0cT4AjCIqDs"
Message-ID: <cedb7bf0-0635-492c-93a8-f816fdaa5038@amd.com>
Date: Fri, 30 Aug 2024 14:57:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] drm/sched: Fix a UAF on drm_sched_fence::sched
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 kernel@collabora.com, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@redhat.com>
References: <20240829171238.609481-1-boris.brezillon@collabora.com>
 <bdc018b8-3732-4123-a752-b4e0e7e150dc@amd.com>
 <20240830113721.6174f3d9@collabora.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240830113721.6174f3d9@collabora.com>
X-ClientProxiedBy: FR0P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 52105afb-d0ef-49c9-7b83-08dcc8f34026
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rmk2REhzekxySm8xaXhyL0ZqNU1vTk93cFZVUERWSlhkSmQzQ2ZOdElGQ0xV?=
 =?utf-8?B?bHkvRktMQndWQnVCTGc5ZGVUZVRUazlmNlpacXVMU2lvUmIva2YydUdMMjJB?=
 =?utf-8?B?U1JLN3kyNnNzaGJaT25xLzVvSnJraWRLR3ZUejMvdzVnSEdUUCsrQWhHK3lr?=
 =?utf-8?B?Mm9ZMXVQbDYwcFNPOStUNFhzT3BSalZhQkdFaHBOVTBKcHk1bEFVRDlBMWNT?=
 =?utf-8?B?dDFnMFdKYTlXaG4yRGNyNDNYY0k0RGJFa3NvLzVuSXVIUDU0U0xueWdjaVBV?=
 =?utf-8?B?SStaTzlscEczV2VSaUtQdU43aVdkLzdiU29kajdNL082U3l2N25lcFB0VGlT?=
 =?utf-8?B?UTdpMHR5N1NVQldQVldPYkdvWWU0TEdZbldxSlVLOGVnQjVDekVsNTdYN3NB?=
 =?utf-8?B?ZnNtMUlycFBuMlcrNGdhbEpQRE1lSjM5NEZoV2tJQTFtUDBJZEZIbkFmeTNW?=
 =?utf-8?B?NDQwczJKaTFvaXZDL25IaEFmMldNdUNwMDhERHMxSTErbFU1b0M3KzBpV01p?=
 =?utf-8?B?SHc4OVVnd3BqME9CcjgzbzByK3ZIMVJZNXFsakVIZjZzek8wK3BGQ01YNE5I?=
 =?utf-8?B?bFowRUJjMzNXejV5RWxTWEt3K1FFWGd6SWRpa2xYSWR0UzFjd1RPZTJTUVJD?=
 =?utf-8?B?WU40d3VVemk2T05tY0VGUWVxMDhIaDVnRG44S2RURnR4MHRJTEZSRVM1cUhk?=
 =?utf-8?B?U1MxRWhJaFRTdGJ5eHJhdVpEdStEVy8rU2FmNWFDME91dGdlWis0aVZteFk0?=
 =?utf-8?B?bU5oUmJxOGx1SHprdmxSY3c3TndvNW9yU1Z2NG5HT2w2VVBoTEo5NHp6NmlT?=
 =?utf-8?B?Q2krOGlaUVVQZmRiSi9RbDR3Nnc3N0xnRFN6bnBtTDVuY1ZBTW1DZUxnV1FE?=
 =?utf-8?B?T3NyOHlJeGdhNmVVNlZ0WmtwSmZoR09RYXV2UUVOU2tyaHdVZU56dnZEbXJ1?=
 =?utf-8?B?WFpIRkE0aFZOV1c2VkNKKzRrbzg2V3VDRUViSGFjbXp0QTlzVHFPYmxvdGRB?=
 =?utf-8?B?NjlnSy9UUUFleitMUll2Z0oxTnFOck10WFpZQVE3aExUVCt0cnI1c0xFeXFI?=
 =?utf-8?B?cmpuVUEwbGtwZXFXejROQnlnUmNlL0lwdHpXcnA3TFZsOE41Um03NFExay9P?=
 =?utf-8?B?Tm9QamFUOHAyOTlib2hEYkVNZEhXRGZFTDc4RTBObC9vVUNoKzRGNmh5T2ha?=
 =?utf-8?B?RThFNG9VSFhuYnZQdkx6Q2FpWDN2MG9HdGNyaHRaYkdKMWxzaFJ1NEpGeTAr?=
 =?utf-8?B?cDhtV3BwbFdBS2JLNTRTUmRJL2kzeXltUVZkTTdqTkMyOVR3QVk4RUVpZnhT?=
 =?utf-8?B?TDdvejREc1VQLzZIWXlKb3doSlgwdkZqaURZSm94SUQ3ay9FMEtvQTV4QkRJ?=
 =?utf-8?B?VFV6TnU2WG1mZUNrc0FJYktiaThnaWZjN2VJYWE0N3RsTURMbUJ1VDNrMmpo?=
 =?utf-8?B?Vkdac2dueG1xVDZOYmNHMnpmR2w2TkhjSTJFWk1BOVZIQ0M4cHVKUHNMd0RQ?=
 =?utf-8?B?M2ZxdWhZTFcwZWJqN2pJQ2FmWStvUGhPNCt3SmdyWTVYdVlidGRXWnlBbWYz?=
 =?utf-8?B?dUhqMlVpVUFIOUJwSzhsNTJIMkVwTVVsMWVhMlNwalQ4dVpkNXUzdUN1Tlh0?=
 =?utf-8?B?Y2plWkFBd3FYQjRxVXVjUUI4Z1dtejZvZW9jVUwvVndTN2lvT0JKWXczbGxL?=
 =?utf-8?B?U0dRWE5nWnp6REs3UXQya2NsWEZtYlFQbHhsS212TS9ybnZDME9DV0RYNWkx?=
 =?utf-8?B?QU5qYVgxOE9Xdk9BM0x5YXlLdmMrNWNuRXQ4NWMrM1p4R2doTjV0SUV3ZWp5?=
 =?utf-8?B?RUt3cGpTTW9pSXZqUWN5QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk5nRExFZGp6aXNkQkc1SjdDOUFxQlZXell4YVlIcDhqaUhObEo4VURBaGw3?=
 =?utf-8?B?N1NLNUlKK2UxcnRTK2xrbTZZMDl3ZkNqbnVLQXhBQkFzdklqbWw1MkRLSFhY?=
 =?utf-8?B?YlBMUU9weURVTm9XYUNoYlBZZ0lMY0V3Y3RDUE1BMnU1cVlTZElkMUZmdnhB?=
 =?utf-8?B?QkxqcXFFdk9RMjA3S3hsSGpXRXpxRXlGQ1ZFNURSUXcxV2tnMktiaEF5UTN5?=
 =?utf-8?B?bzR5cHJQQmVrSjY1WlpBaVZTMG5kMjduczZxSGFNRXdtTmtKM3F4aityN3A3?=
 =?utf-8?B?NWlWQk9oRURYM2VmWVY2cnpvTEFiZCtyTVZxT29FUWliaWs3UHc4eW82OUd3?=
 =?utf-8?B?YkNmYUhUdVNHNFNiZDBXNFRKYWhpOVUrSXZ0ZDUvbDFvaW9zaTVsSW5WVnFJ?=
 =?utf-8?B?RWRXcStkRUFVajlYeit1T0dRN050R3VJYnMwMU1qSXNRalFtaTl4WVF1aXll?=
 =?utf-8?B?L2ZGM3UwSytOSDdGcWMvUHp0dkRIOWhxOVBnclFkeEpPd2Y5QkxYZ0l5NmFv?=
 =?utf-8?B?dkZkYTFGTW5jT01sRWVsa2pBN29IcXVqdVNIUlVEV01GVWRneFp2V2E5SzFk?=
 =?utf-8?B?QTBHbjg3WlJIajduV0FOWFNzMDhOaVBpR0s4Mll6L0tPTmJKZzMxa0ZhWTh0?=
 =?utf-8?B?WXVuZ0Z5bTlyNTJ4b3hoemVHNUliTVZBVEpwamVIaS9GbENSVGJRZUsrb0pu?=
 =?utf-8?B?bWgzaUM0b2puakh3TmpDYmxudzBxVE1iTStJVWw4R2lCMTdqSmRSMTZ1QUlR?=
 =?utf-8?B?cWlzcnU4RVdTNlI3L0x1MUVub2FEQjhOMDlmZnBuUTg3eDlDMHllT2lqemRu?=
 =?utf-8?B?UzFoR1VhcnErUEkzbDVqQzdRT2RZNkJSY0JvdnZhZGV6cjJVbExJekxPSzlv?=
 =?utf-8?B?VXhYWjRWRjJONzZrTjRIcGxKV3NLbncxbXgvdHRBcTJLc09lRzNVT2ZCM1Yx?=
 =?utf-8?B?Y2RDdzZGdUI0ZU5DM3A3MXB3V0d5Y3ZxbmNpOXY2SkF5cDVYWjVyV2hkT1Za?=
 =?utf-8?B?MVl1eEs1UFhlYzA4Y2g5QlhWZlNFT0dPNEJpamVvVkQwc0J4cVhXUzdKMUI2?=
 =?utf-8?B?UWxxN0xiREhFUWN2anQrR3ZISU42eVZUM0tzMSs1cFJTU3RVMk01MjNQaitq?=
 =?utf-8?B?KzdONVk4UlRDU3dkc01qZGcrTmRwTDd4dVQ5TDlqVGlLT3RVZmFTaVFRWFR3?=
 =?utf-8?B?VU9OYlVORjhxVjcrbWc5VXBwR0tvdjdiczFPRDg0SkRUWmtBRjFKek5XWWlZ?=
 =?utf-8?B?Q1pPc1FXc0d6L0gvbktEZC90VWwxTmJ5RUhpcEh6eXRpR041Y0VZR3FnNjJr?=
 =?utf-8?B?TW5SWWs1ZXJjR1JCaGxUeUtJTjAwdjhBczZZRlJyV0xmMXNFa1M5T2FDSis0?=
 =?utf-8?B?L0NZWDJMaEg5R1lRN1Y4eDAvM2VCME05aXFic2FrYjZld1ExeWdkdzEwQ1Va?=
 =?utf-8?B?anVrNDZsTmxzajJxcTdOWU9SMXk4ZktyTUU5MnJQN1lyK042YThsVFFubVJt?=
 =?utf-8?B?V2VlUjJHcndVYUlkVDlLUDZKb1lpMXREVDh5cHY3TER2RXZveUVnR1h1TzhW?=
 =?utf-8?B?Sml5OHpmVG9WVmFqN2F5ZjdYUGh1TThYbWk5a2FIUzNkUlI2cE5HdlE2ZzV2?=
 =?utf-8?B?VjlCSG9oQkcxKzdWN2xrenREeUFYMGZVWGJ3dDNRYkFaWkVTb1ZnZXVrSkRy?=
 =?utf-8?B?Z2FnOE50NHkxTTl2NldrRU9VbnRlUk55NW1LRlc0WTJrNUxYNVVvQ2pNZy9j?=
 =?utf-8?B?UlkwdW1SRWpMTHdob25NakMwSjJmWFdiTURGVCs4M2xTUXlRd1Z0UWIyTTE2?=
 =?utf-8?B?ZUtXMzRKYlVFMm56MXI0MWFHWEtWd3k5MlVIWm9NTkt2ZnJSWTVBVHNZTlBZ?=
 =?utf-8?B?WFZQWnY4ejB2cUU5NVZKVDNhdFBCYmVpZmpLSjZ2T2RaUGlkNGpnWXlmUTZr?=
 =?utf-8?B?Rm1WbUhySkY5WXV5SU9hNzlxTEk2V1RXN0EwYzZaOExxT0RYYkI5QlN4Zzgx?=
 =?utf-8?B?SkMyWEVmZmhoNm11blhqL0YxTmNCaVA0UnVuL0c0WnEyWEk4eXB4Zjc0UkRU?=
 =?utf-8?B?RC9wRDdJbzVnc1hMLzhtcWxwNitjUFhKZmVUNSt0cWNkMTcwQnNDNEtQSU5w?=
 =?utf-8?Q?gnGyWy0EX3aM5RFhEr5ZqaMm/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52105afb-d0ef-49c9-7b83-08dcc8f34026
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 12:57:05.9664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNcv3G4jpZXal1lcDTs/K8crpM9K/P2cPUREPKiwLN7fd/pe/H+xz14rv8xUQpaF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412
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

--------------MJQ4K8c4qmLTI0cT4AjCIqDs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 30.08.24 um 11:37 schrieb Boris Brezillon:
> Hi Christian,
>
> On Fri, 30 Aug 2024 10:14:18 +0200
> Christian König<christian.koenig@amd.com>  wrote:
>
>> Am 29.08.24 um 19:12 schrieb Boris Brezillon:
>>> dma_fence objects created by an entity might outlive the
>>> drm_gpu_scheduler this entity was bound to if those fences are retained
>>> by other other objects, like a dma_buf resv. This means that
>>> drm_sched_fence::sched might be invalid when the resv is walked, which
>>> in turn leads to a UAF when dma_fence_ops::get_timeline_name() is called.
>>>
>>> This probably went unnoticed so far, because the drm_gpu_scheduler had
>>> the lifetime of the drm_device, so, unless you were removing the device,
>>> there were no reasons for the scheduler to be gone before its fences.
>> Nope, that is intentional design. get_timeline_name() is not safe to be
>> called after the fence signaled because that would causes circular
>> dependency problems.
> Do you mean the dma_fence layer should not call get_timeline_name()
> after it's been signalled (looking at the code/doc, it doesn't seem to
> be the case), or do you mean the drm_sched implementation of the fence
> interface is wrong and should assume the fence can live longer than its
> creator?

Neither, the crashing in an debugfs corner use case is simply acceptable 
behavior.

The problem is rather that when you start to create shedulers on demand 
this isn't a rare corner use case any more, but rather much easier to 
trigger problem.

On the other hand the kernel has tons (and I would guess thousands) of 
debugfs files which can crash the kernel trivially. Quite a bunch of 
them don't take all the necessary locks and look into internal data 
structures without any guarantee that those won't go away in the middle 
of a sprintf()...

>> E.g. when you have hardware fences it can happen that fences reference a
>> driver module (for the function printing the name) and the module in
>> turn keeps fences around.
>>
>> So you easily end up with a module you can never unload.
> On the other hand, I think preventing the module from being unloaded is
> the right thing to do, because otherwise the dma_fence_ops might be
> gone when they get dereferenced in the release path. That's also a
> problem I noticed when I started working on the initial panthor driver
> without drm_sched. To solve that I ended up retaining a module ref for
> each fence created, and releasing this ref in the
> dma_fence_ops::release() function.

Yeah that was what other drivers initially did as well, but that was 
reverted at some point and nobody really looked much into it.

The takeaway was that it's better to potentially crash on unload than to 
not allow unloading at all.

> drm_sched adds an indirection that allows drivers to not care, but
> that's still a problem if you end up unloading drm_sched while some of
> its drm_sched_fence fences are owned by external components.

And you're not the first one to report this. It's just that your 
solution looks better than what I've seen before.

>>> With the introduction of a new model where each entity has its own
>>> drm_gpu_scheduler instance, this situation is likely to happen every time
>>> a GPU context is destroyed and some of its fences remain attached to
>>> dma_buf objects still owned by other drivers/processes.
>>>
>>> In order to make drm_sched_fence_get_timeline_name() safe, we need to
>>> copy the scheduler name into our own refcounted object that's only
>>> destroyed when both the scheduler and all its fences are gone.
>>>
>>> The fact drm_sched_fence might have a reference to the drm_gpu_scheduler
>>> even after it's been released is worrisome though, but I'd rather
>>> discuss that with everyone than come up with a solution that's likely
>>> to end up being rejected.
>>>
>>> Note that the bug was found while repeatedly reading dma_buf's debugfs
>>> file, which, at some point, calls dma_resv_describe() on a resv that
>>> contains signalled fences coming from a destroyed GPU context.
>>> AFAIK, there's nothing invalid there.
>> Yeah but reading debugfs is not guaranteed to crash the kernel.
>>
>> On the other hand the approach with a kref'ed string looks rather sane
>> to me. One comment on this below.
> There's still the problem I mentioned above (unloading drm_sched can
> make things crash). Are there any plans to fix that?

At least not at the moment, but your patch here looks like it makes this 
a possibility.

Depending on the uapi taking a module reference for each created 
sheduler fence might even result in overflowing the reference count, but 
if you grab a module reference for each drm_sched_fence_timeline object 
than that will probably work quite fine.

Regards,
Christian.

> The simple option
> would be to prevent compiling drm_sched as a module, but that's not an
> option because it depends on DRM which is a tristate too. Maybe we
> could have drm_sched_fence.o linked statically, just like dma-fence.c
> is linked statically to prevent the stub ops from disappearing.
> Not sure if drm_sched_fence.c depends on symbols defined in
> sched_{main,entity}.c or other parts of the DRM subsystem though.
>
>>> +/**
>>> + * struct drm_sched_fence_timeline - Wrapped around the timeline name
>>> + *
>>> + * This is needed to cope with the fact dma_fence objects created by
>>> + * an entity might outlive the drm_gpu_scheduler this entity was bound
>>> + * to, making drm_sched_fence::sched invalid and leading to a UAF when
>>> + * dma_fence_ops::get_timeline_name() is called.
>>> + */
>>> +struct drm_sched_fence_timeline {
>>> +	/** @kref: Reference count of this timeline object. */
>>> +	struct kref			kref;
>>> +
>>> +	/**
>>> +	 * @name: Name of the timeline.
>>> +	 *
>>> +	 * This is currently a copy of drm_gpu_scheduler::name.
>>> +	 */
>>> +	const char			*name;
>> Make that a char name[] and embed the name into the structure. The macro
>> struct_size() can be used to calculate the size.
> Sure I can do that.
>
> Regards,
>
> Boris

--------------MJQ4K8c4qmLTI0cT4AjCIqDs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 30.08.24 um 11:37 schrieb Boris Brezillon:<br>
    <blockquote type="cite" cite="mid:20240830113721.6174f3d9@collabora.com">
      <pre class="moz-quote-pre" wrap="">Hi Christian,

On Fri, 30 Aug 2024 10:14:18 +0200
Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Am 29.08.24 um 19:12 schrieb Boris Brezillon:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">dma_fence objects created by an entity might outlive the
drm_gpu_scheduler this entity was bound to if those fences are retained
by other other objects, like a dma_buf resv. This means that
drm_sched_fence::sched might be invalid when the resv is walked, which
in turn leads to a UAF when dma_fence_ops::get_timeline_name() is called.

This probably went unnoticed so far, because the drm_gpu_scheduler had
the lifetime of the drm_device, so, unless you were removing the device,
there were no reasons for the scheduler to be gone before its fences.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Nope, that is intentional design. get_timeline_name() is not safe to be 
called after the fence signaled because that would causes circular 
dependency problems.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Do you mean the dma_fence layer should not call get_timeline_name()
after it's been signalled (looking at the code/doc, it doesn't seem to
be the case), or do you mean the drm_sched implementation of the fence
interface is wrong and should assume the fence can live longer than its
creator?</pre>
    </blockquote>
    <br>
    Neither, the crashing in an debugfs corner use case is simply
    acceptable behavior.<br>
    <br>
    The problem is rather that when you start to create shedulers on
    demand this isn't a rare corner use case any more, but rather much
    easier to trigger problem.<br>
    <br>
    On the other hand the kernel has tons (and I would guess thousands)
    of debugfs files which can crash the kernel trivially. Quite a bunch
    of them don't take all the necessary locks and look into internal
    data structures without any guarantee that those won't go away in
    the middle of a sprintf()...<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20240830113721.6174f3d9@collabora.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
E.g. when you have hardware fences it can happen that fences reference a 
driver module (for the function printing the name) and the module in 
turn keeps fences around.

So you easily end up with a module you can never unload.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
On the other hand, I think preventing the module from being unloaded is
the right thing to do, because otherwise the dma_fence_ops might be
gone when they get dereferenced in the release path. That's also a
problem I noticed when I started working on the initial panthor driver
without drm_sched. To solve that I ended up retaining a module ref for
each fence created, and releasing this ref in the
dma_fence_ops::release() function.</pre>
    </blockquote>
    <br>
    Yeah that was what other drivers initially did as well, but that was
    reverted at some point and nobody really looked much into it.<br>
    <br>
    The takeaway was that it's better to potentially crash on unload
    than to not allow unloading at all.<br>
    <br>
    <blockquote type="cite" cite="mid:20240830113721.6174f3d9@collabora.com">
      <pre class="moz-quote-pre" wrap="">drm_sched adds an indirection that allows drivers to not care, but
that's still a problem if you end up unloading drm_sched while some of
its drm_sched_fence fences are owned by external components.</pre>
    </blockquote>
    <br>
    And you're not the first one to report this. It's just that your
    solution looks better than what I've seen before.<br>
    <br>
    <span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:20240830113721.6174f3d9@collabora.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">With the introduction of a new model where each entity has its own
drm_gpu_scheduler instance, this situation is likely to happen every time
a GPU context is destroyed and some of its fences remain attached to
dma_buf objects still owned by other drivers/processes.

In order to make drm_sched_fence_get_timeline_name() safe, we need to
copy the scheduler name into our own refcounted object that's only
destroyed when both the scheduler and all its fences are gone.

The fact drm_sched_fence might have a reference to the drm_gpu_scheduler
even after it's been released is worrisome though, but I'd rather
discuss that with everyone than come up with a solution that's likely
to end up being rejected.

Note that the bug was found while repeatedly reading dma_buf's debugfs
file, which, at some point, calls dma_resv_describe() on a resv that
contains signalled fences coming from a destroyed GPU context.
AFAIK, there's nothing invalid there.  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Yeah but reading debugfs is not guaranteed to crash the kernel.

On the other hand the approach with a kref'ed string looks rather sane 
to me. One comment on this below.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
There's still the problem I mentioned above (unloading drm_sched can
make things crash). Are there any plans to fix that?</pre>
    </blockquote>
    <br>
    At least not at the moment, but your patch here looks like it makes
    this a possibility.<br>
    <br>
    Depending on the uapi taking a module reference for each created
    sheduler fence might even result in overflowing the reference count,
    but if you grab a module reference for each drm_sched_fence_timeline
    object than that will probably work quite fine.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:20240830113721.6174f3d9@collabora.com">
      <pre class="moz-quote-pre" wrap="">The simple option
would be to prevent compiling drm_sched as a module, but that's not an
option because it depends on DRM which is a tristate too. Maybe we
could have drm_sched_fence.o linked statically, just like dma-fence.c
is linked statically to prevent the stub ops from disappearing.
Not sure if drm_sched_fence.c depends on symbols defined in
sched_{main,entity}.c or other parts of the DRM subsystem though.

</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+/**
+ * struct drm_sched_fence_timeline - Wrapped around the timeline name
+ *
+ * This is needed to cope with the fact dma_fence objects created by
+ * an entity might outlive the drm_gpu_scheduler this entity was bound
+ * to, making drm_sched_fence::sched invalid and leading to a UAF when
+ * dma_fence_ops::get_timeline_name() is called.
+ */
+struct drm_sched_fence_timeline {
+	/** @kref: Reference count of this timeline object. */
+	struct kref			kref;
+
+	/**
+	 * @name: Name of the timeline.
+	 *
+	 * This is currently a copy of drm_gpu_scheduler::name.
+	 */
+	const char			*name;  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Make that a char name[] and embed the name into the structure. The macro 
struct_size() can be used to calculate the size.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Sure I can do that.

Regards,

Boris
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------MJQ4K8c4qmLTI0cT4AjCIqDs--
