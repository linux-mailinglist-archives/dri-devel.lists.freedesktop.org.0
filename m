Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFA99D3703
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 10:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4BA10E010;
	Wed, 20 Nov 2024 09:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="evetyW+1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2056.outbound.protection.outlook.com [40.107.101.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E48E10E010;
 Wed, 20 Nov 2024 09:24:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=euvbPgay2XQ6GGqegVx1Mu4Fid9m/1Xlp2MLjo3bRw9M6fdvCNMSZYUNMP6MAsKXx5LkdLFx00FcnbqB94j3PppZ0h2aeDMyncCtHQpxCEa4bkQSEB0zwXM6ccay9V4Of+wDWGv81m7znPJK0xb7V3qT2iTrSbcwTuBKVfnZVc2ehCI46d17Pp0XLestfhzY/9lH7ysXbbaxZN+Gv4BHFH27IbcdNdVR8iOY5S3qJ3toyasEJQ4kRreMYdkKb1vkeNj0eAuxL+ua2evBNTBKLLhgSj9uUTWS1vNKdn3LoEqNB0t+iH3zVaJ1bI93B7WDtCOlVdHrdGLqA9qmHTb0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2aNIQ8vH70XgWnNXzXxwoZY4K89MVhdwgkC+XuPGzk=;
 b=DJ6/YNUBr5EA0HUeR8iJJ8KHj+97eZ/yre62faQ65cTOW+8PLspshnOPSdjtuCTOoNIRfoVQw5lQW9aaPeUPvYRxf4f5my5mn50A7kmfCHI5sULhvd07X1v6z7YcG3HGV9RJk0Kl8uQJYsCQk8csrFY7AwvA2DDUfrGgf2nJbRgPWp9oTgH46IpXDrcRoEoiAqGC1GSKl+lJBeW9ZK8/RhA06il2GA6lfLkZEY5oNHUW/7dzKDB+KOrHZf8krihiBlrtHzN0uAR6+GpVnAZ5LSuLLtKjrg8pEOasx3EMzYsDWm8lteWkYBrnxJyXIF1ZhEncAorlGyb4OQzY+CIFHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2aNIQ8vH70XgWnNXzXxwoZY4K89MVhdwgkC+XuPGzk=;
 b=evetyW+1XGJhD7abhEEnlYAcU0auJSsrGNfPCpuW6LM271klhf3y3iSuNXzYSbfFqXfHRSBklmv5oNHdXqpfkON/k3dHzF34jMUCXqJpYBXJW83Mwx8ZrDovUb+mq1uQ1JlCA1eA9nYsolnaI3dHhT8mpOYuzUBXjhlIzq9Vv7k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PR12MB8975.namprd12.prod.outlook.com (2603:10b6:208:48f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 09:24:40 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8158.019; Wed, 20 Nov 2024
 09:24:40 +0000
Content-Type: multipart/alternative;
 boundary="------------04S9KPZEE50SBVYX1uVv17lo"
Message-ID: <22e11191-c52f-4544-a91f-5a53bc78fae9@amd.com>
Date: Wed, 20 Nov 2024 10:24:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 2/8] drm/ttm: Provide a shmem backup implementation
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241115150120.3280-1-thomas.hellstrom@linux.intel.com>
 <20241115150120.3280-3-thomas.hellstrom@linux.intel.com>
 <a87503b5-2bca-4614-8816-078ade6d0940@amd.com>
 <7f3536a2e436566145215fad8889eee77dfa271c.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <7f3536a2e436566145215fad8889eee77dfa271c.camel@linux.intel.com>
X-ClientProxiedBy: FR4P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PR12MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: 03afb1d5-ef3b-4759-d1ea-08dd09452915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NU1uRzd3Rkl6SnpQaE9BckhYajlNbjV2SVRPeFVvTmNzM1JwRERBWUE4UTEw?=
 =?utf-8?B?cnpUY1JCL0dQYjJxendsMjIydVJBMTQ0OSt0NmYvMEQ5MmFab01seXdZcmE0?=
 =?utf-8?B?MFBZbmVCRnFURkxnNGM4Z2EzLzlsKy9EbjJndU4vNWl2VzB5WVovSU02ZWlW?=
 =?utf-8?B?YVo4VHZlZmlGR0V1VmNOUVF6SlhBYnNETTRaVXRLdjQ1MTBZbVJKWXIwUGYx?=
 =?utf-8?B?ZGRWeTFMMzNFTWczekNhRmx4RDBycnZYRjdYd1M5WGxKZTNrcEo4OHByYUtE?=
 =?utf-8?B?elA2ZDV3K1BYYXluQnd6ZmhUOTJHczI0QmFwYUR6RTg2T3lWdytESWtnckpM?=
 =?utf-8?B?cTZiNFFzYWl2dHdJaGZhazhDMC9jZWdsdGJvMHV0RHBza1BvVDh6Zm4raEpp?=
 =?utf-8?B?cGZGN3JNRVJFdVdtNENwa1FaV1hKRVJhN1VjVEJydkNiaEF0eGlFdHlpOFFJ?=
 =?utf-8?B?bnpoTVpISFEzbXZ6SXhDRFFYOVZTNHNmTlZycUhQWXdkU201anpobXRSYXNC?=
 =?utf-8?B?YTkySXA5UWtqczIxM0dnQ3pIY25TY3k2bjFrUzJxT2dJN3prTTFmN05hbUVp?=
 =?utf-8?B?Q3NZWEFocTZrRnUvQW9HTVFTOVBMN2xHWGZwTk0xcEpwQlRwcCttbXB5R2RP?=
 =?utf-8?B?Y3UwbEtON09CTGN3MkkxZURCVXdEeUtpSk04UlBUNTgyUXozSVRoM01DdVZs?=
 =?utf-8?B?QWlxckdjRCtrTW5iUVhocFNRZS9aMjEydDg5dkVxeEEzeDBoU1ZYWXo4Tm14?=
 =?utf-8?B?M01xNHhsUGgvQmRJTUUvTm5tMkpkOVloRnhxSy9GWFFnZTRtekxaL1FZSFYy?=
 =?utf-8?B?cm5yZlNRZmExUzVaTGlwZEt2WXcwQ1FFZXF0bCtld3RScWxtN1pZTlBJbmFu?=
 =?utf-8?B?YWI1MTBLWXVna3FUR1Z4QitSUVN2cTA0S3ZFRy9kNjE2RExNZUpEZmxvK0VU?=
 =?utf-8?B?QnJoZDZxOHdZckp4UmY1UVYwUzVpazEveGpoSzE2SWkwLy9LRTRudTNUNjgw?=
 =?utf-8?B?SFpDU1hmay9WSDI3UGpvR0hMVW5xMmFLNHkyeHVsZC96LzEyRHl2QkdmUElO?=
 =?utf-8?B?TUJQaGxYMk5mWXpld0Urcm54ampyM1F3dU9MY1JkZ2J0aDhVVHo5YUI0Q29Y?=
 =?utf-8?B?dXZPYkZER3Nndm1hZnVsaTdPcGFDeGpSU2hKaGVHOUd2TjdJK3F0YmNZZFNo?=
 =?utf-8?B?Z0pIYnNEa2swSUFaZm1ub3NQaWRSMCt3bXZLRFhOcmI4L2UvalJScTJvSFBM?=
 =?utf-8?B?Uk43Z0JNTmUyTE9rTms0eFZEam5lOVFtWFR5Z0J2eVo3c24rMDlQdzZZOXNh?=
 =?utf-8?B?eUYvcHNicklkVUZwdmk3Sit3cXFBdExLU1Q1WjBvK2JqMm8zMXB1eG9aQWVP?=
 =?utf-8?B?K2F4eGwrN0hsWDZGYk5SYWxCaHl6cjAwOEN1alU0TnYzNS9GUUNxZGRaTnJh?=
 =?utf-8?B?aW9PRWkwc2F4blhYcmo5ZEJQeTNBbUxvS2ZhcTFQa2V2eDFKTHB3Y2F0akhN?=
 =?utf-8?B?ZmhPRHE4Y1dtd2dZSzRwbmpXMU4zbTJyWmdSNDRua1plNWxWNWUwTDJoaGFj?=
 =?utf-8?B?ZlJrU1NySithcGRMNHdkREJQRFRodTMzMTBBR2x6QXdkeHk2bUs3VVZGN3Fj?=
 =?utf-8?B?WFc5eVRuY0tESWpGcEtoaFhYVWxjVkFzQXhhWmpKWjVQWFlOMTJTYlNOMndF?=
 =?utf-8?B?THZFZzYvcjMxbzl3NHYxV2xudGhtemNoMlJHeXFyWmR2cCtNS01WeWVMVDQz?=
 =?utf-8?Q?mpyGiJl+UcI/Njtso6lsNpDQ6Z6jQLA1YYYPOe0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjNtd0lvdXpnaGs3N2JXK3QrWXdhb0xTMDBUSjgvbVRGOVFFckpUR3hNbzRr?=
 =?utf-8?B?NHltSTBRMTRyV3hycHJIVTdIdXlaaHJ0czNNcjVxaThHR3dreVVtYTZObStT?=
 =?utf-8?B?cFh6TjRtaFN4WnRoTE9kajh6WlkxakJNU3JoQWRKT2pHbCtzTFRTWndJOXlF?=
 =?utf-8?B?U2dGR0tLZDdtTmxtZEdjeXZ3bU1xeVhzS3oxVXpGV2R6b2lvcWJvak5mVnk1?=
 =?utf-8?B?YURkNE1oRW9GQVJqaGdROHhMV2xsOGRpamJ2bGdVb0dNd1ErOGUxL3V5ckpB?=
 =?utf-8?B?S1lneHZ2REVvQm82Wm5EUXhnQTBJRDZiSllCajJaSzY4SkJtbWtEQzMzTW9z?=
 =?utf-8?B?SnBOTkI2Z1FMdlA4N3pJekJxZzdIa0hEdXhtcndyMEowR0h4UVBUNllNRExV?=
 =?utf-8?B?TnN5TVdNSWZqai9ublpVK2hpTGJKOU4yYnphNzJnY0sxS2xiZ2hMa05GYkpn?=
 =?utf-8?B?REVnY20xbFhXV1lZaXNhbCsvc21Eamx0aFlRdDl4OUpoYWh1NG9nU0k3UkdU?=
 =?utf-8?B?c1VqSmtkNTd1MVRNczJDeXc4dHA5cGxGV0t2OFJvblpBNDNoOEVlaWRxOFdI?=
 =?utf-8?B?UnVHbUpVQitydlR6S2k1ejBleGkrSTh4ZHAxY1lPdDFHVUNYN3p5RlUrYytR?=
 =?utf-8?B?SG10SXhmc0pQbFI2R2dyZHZCa3h0VkVINFJ5bDJYbkVrTnZkL29mbWtBUENw?=
 =?utf-8?B?VTZWWVVKaUUvRlY3VUhiZDcrblQyM1QzM05yL29yK0hrRExBYjNFWFcrWkJB?=
 =?utf-8?B?S3BwTGMralNlck5CM00raTNlQ01EUzdxNUZ1REZvSGVWRlRLbnBnNEFZM0lO?=
 =?utf-8?B?MXhRWHZSRmZ1NmxCL3VPOU0wR2UxNjJsVENZUUU5YS9iZlpUMmdNdkthYWsv?=
 =?utf-8?B?T203dUN6NGtMZUNsMlVQa0tXSEVkdzVwVjI0YlJUUmNuWGhHdXBWbThZdWRN?=
 =?utf-8?B?UW04Wlc0UWoxWVEyTi9HOGs4QXRxYlNORHJwMk94Q2lwaUw5VFBPTUU5VldX?=
 =?utf-8?B?TGRLcExGWGl6aEd0SzFZcndaK24wNjd1S0VpL2p6WDJ1Vm43UEtvd3RpclNu?=
 =?utf-8?B?M2dob2RtUVkwUU9Tc0NUTlVEWmRMUjVZNzF6RXVqK2w0Z2xFSTFRVnJuL2RL?=
 =?utf-8?B?Wk41Z1E2a3NVTjRoQUxhT3IrMG1tckdiNGpLbEpnZUVjdVFNOTBOQW1FVFBy?=
 =?utf-8?B?M0dSc2I3Wms0bG5yakhoVGFZNDkybU0vMFNLeG83Qi9IUFZFTGllcGRNMkN3?=
 =?utf-8?B?TitramxiRE5kV2tJeE9CZS9qMkE3bnMyelQ5d2VXNFFzK1pUNlRXV2RULzdy?=
 =?utf-8?B?aitVaU9WWVV5M1QrTWRmekxYNG0rT2xlTUZWdHJzQkFHUnhjNS9UbjFvM0tJ?=
 =?utf-8?B?SUdqaHlBMG9KVDZCb2NQSEJrUGpOdHp3a0VHSFp4VnF1R2JROHcrSHdrYXhz?=
 =?utf-8?B?cDBTTG5lRjVoOFJGeE1tQmx4b3FrYzlYL0ZUK2dhWHJ6SXJKMzlzY1VZQlRz?=
 =?utf-8?B?V3MrZXQ0ZG0ybkRQaGhDdk94amo1Y1NuN1AvSUlxWmJBcG51YXppb2Y4b2Vz?=
 =?utf-8?B?MmdXQjdSSmRURW92d0NmWklaYk83NEs3em1PZzlOMUhzNUlVTGFlNldaNFEx?=
 =?utf-8?B?QTNPOWFpRWJ4VlkwL0RFcndyazg2emVtQStDQmVxVjVJMnRnaTdRYy9VaTlP?=
 =?utf-8?B?SlJWa3ovK0tvb09keDdhODNxK2pGeUZzbWMwcHdXYmtKcVVMSGpvVmY3U3J0?=
 =?utf-8?B?NldLMDIxbjZLcGpYMWRoc05RaC9mYmZoZExtcDdzbThwSEVEV3kvZys2OUZI?=
 =?utf-8?B?dHV1cldEWTdUODlQWlhjWWp0K2JQQlE5UFNDVklRMklmNElPUGExRTIreUdC?=
 =?utf-8?B?Y0ZCUTVjbGo2ZlhtM1FpLzhINzFwemFpTkFVcWd6cThjV0J6ck90YnhDWkxN?=
 =?utf-8?B?TXhiQ2QyRW1URGlKcHR6SDBqQkdVZXI2WTQzWnZLZ3FLWitMOVBNM0xRYmhH?=
 =?utf-8?B?dDZPWWFxUkNYOWVlbUpET1RPeGZLOVpWSFNWcmNxODQvRW13UmxqU0o5bExn?=
 =?utf-8?B?MDhGTE1LNEVXb2tIVDdpWThMaDNLVitZVVJMZGtCa2xxSzBBWW9VZWFCVS9K?=
 =?utf-8?Q?aOJA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03afb1d5-ef3b-4759-d1ea-08dd09452915
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 09:24:40.4514 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiCAPZ5c1g+mclcyJdMkveJc4aDSItm4gvNZTl8tQ9yspYXKQvba7eawR7rMmy5j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8975
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

--------------04S9KPZEE50SBVYX1uVv17lo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 20.11.24 um 08:58 schrieb Thomas Hellström:
> On Tue, 2024-11-19 at 14:40 +0100, Christian König wrote:
>> [SNIP]
>>> +
>>> +/*
>>> + * Casting from randomized struct file * to struct ttm_backup * is
>>> fine since
>>> + * struct ttm_backup is never defined nor dereferenced.
>>> + */
>>> +static struct file *ttm_backup_to_file(struct ttm_backup *backup)
>> Do I get it right that struct ttm_backup is never really defined?
> Yes.
>
>> What
>> purpose does that have?
> It's to make the struct ttm_backup opaque to the users of the
> ttm_backup interface, so that the implementation doesn't have to worry
> about the user making illegal assumptions about the implementation.

That is usually done with a typedef and one of the few cases where 
typedefs are actually advised to be used.


[SNIP]
>>> + *
>>> + * Context: If called from reclaim context, the caller needs to
>>> + * assert that the shrinker gfp has __GFP_FS set, to avoid
>>> + * deadlocking on lock_page(). If @writeback is set to true and
>>> + * called from reclaim context, the caller also needs to assert
>>> + * that the shrinker gfp has __GFP_IO set, since without it,
>>> + * we're not allowed to start backup IO.
>>> + *
>>> + * Return: A handle on success. 0 on failure.
>>> + * (This is following the swp_entry_t convention).
>>> + *
>>> + * Note: This function could be extended to back up a folio and
>>> + * implementations would then split the folio internally if
>>> needed.
>>> + * Drawback is that the caller would then have to keep track of
>>> + * the folio size- and usage.
>>> + */
>>> +unsigned long
>>> +ttm_backup_backup_page(struct ttm_backup *backup, struct page
>>> *page,
>>> +		       bool writeback, pgoff_t idx, gfp_t
>>> page_gfp,
>>> +		       gfp_t alloc_gfp)
>>> +{
>>> +	struct file *filp = ttm_backup_to_file(backup);
>>> +	struct address_space *mapping = filp->f_mapping;
>>> +	unsigned long handle = 0;
>>> +	struct folio *to_folio;
>>> +	int ret;
>>> +
>>> +	to_folio = shmem_read_folio_gfp(mapping, idx, alloc_gfp);
>>> +	if (IS_ERR(to_folio))
>>> +		return handle;

Probably better to explicitly return 0 here.

And BTW why are we using 0 as indication for an error? Couldn't we just 
use a long as return value and return a proper -errno here?

>> Just that I sleep better: This can never return a folio larger than a
>> page, doesn't it?
> The interface definitely allows for returning larger folios, but the
> individual page in the folio is selected by folio_file_page(folio,
> idx).

Ah, yeah completely missed that and was really wondering why that would 
work.

>
> /Thomas
>
>
>> Apart from those background questions looks good to me.
>>
>> Regards,
>> Christian.
>>
>>> +
>>> +	folio_mark_accessed(to_folio);
>>> +	folio_lock(to_folio);
>>> +	folio_mark_dirty(to_folio);
>>> +	copy_highpage(folio_file_page(to_folio, idx), page);
>>> +	handle = ttm_backup_shmem_idx_to_handle(idx);
>>> +
>>> +	if (writeback && !folio_mapped(to_folio) &&
>>> +	    folio_clear_dirty_for_io(to_folio)) {
>>> +		struct writeback_control wbc = {
>>> +			.sync_mode = WB_SYNC_NONE,
>>> +			.nr_to_write = SWAP_CLUSTER_MAX,
>>> +			.range_start = 0,
>>> +			.range_end = LLONG_MAX,
>>> +			.for_reclaim = 1,
>>> +		};
>>> +		folio_set_reclaim(to_folio);
>>> +		ret = mapping->a_ops-
>>>> writepage(folio_file_page(to_folio, idx), &wbc);
>>> +		if (!folio_test_writeback(to_folio))
>>> +			folio_clear_reclaim(to_folio);
>>> +		/* If writepage succeeds, it unlocks the folio */
>>> +		if (ret)
>>> +			folio_unlock(to_folio);

The code ignores the error and potentially deserves an explanation for that.

Regards,
Christian.

>>> +	} else {
>>> +		folio_unlock(to_folio);
>>> +	}
>>> +
>>> +	folio_put(to_folio);
>>> +
>>> +	return handle;
>>> +}
>>> +
>>> +/**
>>> + * ttm_backup_fini() - Free the struct backup resources after last
>>> use.
>>> + * @backup: Pointer to the struct backup whose resources to free.
>>> + *
>>> + * After a call to this function, it's illegal to use the @backup
>>> pointer.
>>> + */
>>> +void ttm_backup_fini(struct ttm_backup *backup)
>>> +{
>>> +	fput(ttm_backup_to_file(backup));
>>> +}
>>> +
>>> +/**
>>> + * ttm_backup_bytes_avail() - Report the approximate number of
>>> bytes of backup space
>>> + * left for backup.
>>> + *
>>> + * This function is intended also for driver use to indicate
>>> whether a
>>> + * backup attempt is meaningful.
>>> + *
>>> + * Return: An approximate size of backup space available.
>>> + */
>>> +u64 ttm_backup_bytes_avail(void)
>>> +{
>>> +	/*
>>> +	 * The idea behind backing up to shmem is that shmem
>>> objects may
>>> +	 * eventually be swapped out. So no point swapping out if
>>> there
>>> +	 * is no or low swap-space available. But the accuracy of
>>> this
>>> +	 * number also depends on shmem actually swapping out
>>> backed-up
>>> +	 * shmem objects without too much buffering.
>>> +	 */
>>> +	return (u64)get_nr_swap_pages() << PAGE_SHIFT;
>>> +}
>>> +EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
>>> +
>>> +/**
>>> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
>>> + * @size: The maximum size (in bytes) to back up.
>>> + *
>>> + * Create a backup utilizing shmem objects.
>>> + *
>>> + * Return: A pointer to a struct ttm_backup on success,
>>> + * an error pointer on error.
>>> + */
>>> +struct ttm_backup *ttm_backup_shmem_create(loff_t size)
>>> +{
>>> +	struct file *filp;
>>> +
>>> +	filp = shmem_file_setup("ttm shmem backup", size, 0);
>>> +
>>> +	return ttm_file_to_backup(filp);
>>> +}
>>> diff --git a/include/drm/ttm/ttm_backup.h
>>> b/include/drm/ttm/ttm_backup.h
>>> new file mode 100644
>>> index 000000000000..20609da7e281
>>> --- /dev/null
>>> +++ b/include/drm/ttm/ttm_backup.h
>>> @@ -0,0 +1,74 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _TTM_BACKUP_H_
>>> +#define _TTM_BACKUP_H_
>>> +
>>> +#include <linux/mm_types.h>
>>> +#include <linux/shmem_fs.h>
>>> +
>>> +struct ttm_backup;
>>> +
>>> +/**
>>> + * ttm_backup_handle_to_page_ptr() - Convert handle to struct page
>>> pointer
>>> + * @handle: The handle to convert.
>>> + *
>>> + * Converts an opaque handle received from the
>>> + * struct ttm_backoup_ops::backup_page() function to an (invalid)
>>> + * struct page pointer suitable for a struct page array.
>>> + *
>>> + * Return: An (invalid) struct page pointer.
>>> + */
>>> +static inline struct page *
>>> +ttm_backup_handle_to_page_ptr(unsigned long handle)
>>> +{
>>> +	return (struct page *)(handle << 1 | 1);
>>> +}
>>> +
>>> +/**
>>> + * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer
>>> is a handle
>>> + * @page: The struct page pointer to check.
>>> + *
>>> + * Return: true if the struct page pointer is a handld returned
>>> from
>>> + * ttm_backup_handle_to_page_ptr(). False otherwise.
>>> + */
>>> +static inline bool ttm_backup_page_ptr_is_handle(const struct page
>>> *page)
>>> +{
>>> +	return (unsigned long)page & 1;
>>> +}
>>> +
>>> +/**
>>> + * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer
>>> to a handle
>>> + * @page: The struct page pointer to convert
>>> + *
>>> + * Return: The handle that was previously used in
>>> + * ttm_backup_handle_to_page_ptr() to obtain a struct page
>>> pointer, suitable
>>> + * for use as argument in the struct ttm_backup_ops drop() or
>>> + * copy_backed_up_page() functions.
>>> + */
>>> +static inline unsigned long
>>> +ttm_backup_page_ptr_to_handle(const struct page *page)
>>> +{
>>> +	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
>>> +	return (unsigned long)page >> 1;
>>> +}
>>> +
>>> +void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle);
>>> +
>>> +int ttm_backup_copy_page(struct ttm_backup *backup, struct page
>>> *dst,
>>> +			 pgoff_t handle, bool intr);
>>> +
>>> +unsigned long
>>> +ttm_backup_backup_page(struct ttm_backup *backup, struct page
>>> *page,
>>> +		       bool writeback, pgoff_t idx, gfp_t
>>> page_gfp,
>>> +		       gfp_t alloc_gfp);
>>> +
>>> +void ttm_backup_fini(struct ttm_backup *backup);
>>> +
>>> +u64 ttm_backup_bytes_avail(void);
>>> +
>>> +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
>>> +
>>> +#endif

--------------04S9KPZEE50SBVYX1uVv17lo
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 20.11.24 um 08:58 schrieb Thomas Hellström:<br>
    <blockquote type="cite" cite="mid:7f3536a2e436566145215fad8889eee77dfa271c.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">On Tue, 2024-11-19 at 14:40 +0100, Christian König wrote:
</pre>
      <blockquote type="cite">[SNIP]<span style="white-space: pre-wrap">
</span>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+/*
+ * Casting from randomized struct file * to struct ttm_backup * is
fine since
+ * struct ttm_backup is never defined nor dereferenced.
+ */
+static struct file *ttm_backup_to_file(struct ttm_backup *backup)
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Do I get it right that struct ttm_backup is never really defined?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yes.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">What 
purpose does that have?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It's to make the struct ttm_backup opaque to the users of the
ttm_backup interface, so that the implementation doesn't have to worry
about the user making illegal assumptions about the implementation.</pre>
    </blockquote>
    <br>
    That is usually done with a typedef and one of the few cases where
    typedefs are actually advised to be used.<br>
    <br>
    <span style="white-space: pre-wrap">
</span><br>
    [SNIP]<span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:7f3536a2e436566145215fad8889eee77dfa271c.camel@linux.intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+ *
+ * Context: If called from reclaim context, the caller needs to
+ * assert that the shrinker gfp has __GFP_FS set, to avoid
+ * deadlocking on lock_page(). If @writeback is set to true and
+ * called from reclaim context, the caller also needs to assert
+ * that the shrinker gfp has __GFP_IO set, since without it,
+ * we're not allowed to start backup IO.
+ *
+ * Return: A handle on success. 0 on failure.
+ * (This is following the swp_entry_t convention).
+ *
+ * Note: This function could be extended to back up a folio and
+ * implementations would then split the folio internally if
needed.
+ * Drawback is that the caller would then have to keep track of
+ * the folio size- and usage.
+ */
+unsigned long
+ttm_backup_backup_page(struct ttm_backup *backup, struct page
*page,
+		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool writeback, pgoff_t idx, gfp_t
page_gfp,
+		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gfp_t alloc_gfp)
+{
+	struct file *filp = ttm_backup_to_file(backup);
+	struct address_space *mapping = filp-&gt;f_mapping;
+	unsigned long handle = 0;
+	struct folio *to_folio;
+	int ret;
+
+	to_folio = shmem_read_folio_gfp(mapping, idx, alloc_gfp);
+	if (IS_ERR(to_folio))
+		return handle;</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
    Probably better to explicitly return 0 here.<br>
    <br>
    And BTW why are we using 0 as indication for an error? Couldn't we
    just use a long as return value and return a proper -errno here?<br>
    <br>
    <blockquote type="cite" cite="mid:7f3536a2e436566145215fad8889eee77dfa271c.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Just that I sleep better: This can never return a folio larger than a
page, doesn't it?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The interface definitely allows for returning larger folios, but the
individual page in the folio is selected by folio_file_page(folio,
idx).</pre>
    </blockquote>
    <br>
    Ah, yeah completely missed that and was really wondering why that
    would work.<br>
    <br>
    <blockquote type="cite" cite="mid:7f3536a2e436566145215fad8889eee77dfa271c.camel@linux.intel.com">
      <pre class="moz-quote-pre" wrap="">

/Thomas


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Apart from those background questions looks good to me.

Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">+
+	folio_mark_accessed(to_folio);
+	folio_lock(to_folio);
+	folio_mark_dirty(to_folio);
+	copy_highpage(folio_file_page(to_folio, idx), page);
+	handle = ttm_backup_shmem_idx_to_handle(idx);
+
+	if (writeback &amp;&amp; !folio_mapped(to_folio) &amp;&amp;
+	&nbsp;&nbsp;&nbsp; folio_clear_dirty_for_io(to_folio)) {
+		struct writeback_control wbc = {
+			.sync_mode = WB_SYNC_NONE,
+			.nr_to_write = SWAP_CLUSTER_MAX,
+			.range_start = 0,
+			.range_end = LLONG_MAX,
+			.for_reclaim = 1,
+		};
+		folio_set_reclaim(to_folio);
+		ret = mapping-&gt;a_ops-
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">writepage(folio_file_page(to_folio, idx), &amp;wbc);
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">+		if (!folio_test_writeback(to_folio))
+			folio_clear_reclaim(to_folio);
+		/* If writepage succeeds, it unlocks the folio */
+		if (ret)
+			folio_unlock(to_folio);</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
    The code ignores the error and potentially deserves an explanation
    for that.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:7f3536a2e436566145215fad8889eee77dfa271c.camel@linux.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
+	} else {
+		folio_unlock(to_folio);
+	}
+
+	folio_put(to_folio);
+
+	return handle;
+}
+
+/**
+ * ttm_backup_fini() - Free the struct backup resources after last
use.
+ * @backup: Pointer to the struct backup whose resources to free.
+ *
+ * After a call to this function, it's illegal to use the @backup
pointer.
+ */
+void ttm_backup_fini(struct ttm_backup *backup)
+{
+	fput(ttm_backup_to_file(backup));
+}
+
+/**
+ * ttm_backup_bytes_avail() - Report the approximate number of
bytes of backup space
+ * left for backup.
+ *
+ * This function is intended also for driver use to indicate
whether a
+ * backup attempt is meaningful.
+ *
+ * Return: An approximate size of backup space available.
+ */
+u64 ttm_backup_bytes_avail(void)
+{
+	/*
+	 * The idea behind backing up to shmem is that shmem
objects may
+	 * eventually be swapped out. So no point swapping out if
there
+	 * is no or low swap-space available. But the accuracy of
this
+	 * number also depends on shmem actually swapping out
backed-up
+	 * shmem objects without too much buffering.
+	 */
+	return (u64)get_nr_swap_pages() &lt;&lt; PAGE_SHIFT;
+}
+EXPORT_SYMBOL_GPL(ttm_backup_bytes_avail);
+
+/**
+ * ttm_backup_shmem_create() - Create a shmem-based struct backup.
+ * @size: The maximum size (in bytes) to back up.
+ *
+ * Create a backup utilizing shmem objects.
+ *
+ * Return: A pointer to a struct ttm_backup on success,
+ * an error pointer on error.
+ */
+struct ttm_backup *ttm_backup_shmem_create(loff_t size)
+{
+	struct file *filp;
+
+	filp = shmem_file_setup(&quot;ttm shmem backup&quot;, size, 0);
+
+	return ttm_file_to_backup(filp);
+}
diff --git a/include/drm/ttm/ttm_backup.h
b/include/drm/ttm/ttm_backup.h
new file mode 100644
index 000000000000..20609da7e281
--- /dev/null
+++ b/include/drm/ttm/ttm_backup.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#ifndef _TTM_BACKUP_H_
+#define _TTM_BACKUP_H_
+
+#include &lt;linux/mm_types.h&gt;
+#include &lt;linux/shmem_fs.h&gt;
+
+struct ttm_backup;
+
+/**
+ * ttm_backup_handle_to_page_ptr() - Convert handle to struct page
pointer
+ * @handle: The handle to convert.
+ *
+ * Converts an opaque handle received from the
+ * struct ttm_backoup_ops::backup_page() function to an (invalid)
+ * struct page pointer suitable for a struct page array.
+ *
+ * Return: An (invalid) struct page pointer.
+ */
+static inline struct page *
+ttm_backup_handle_to_page_ptr(unsigned long handle)
+{
+	return (struct page *)(handle &lt;&lt; 1 | 1);
+}
+
+/**
+ * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer
is a handle
+ * @page: The struct page pointer to check.
+ *
+ * Return: true if the struct page pointer is a handld returned
from
+ * ttm_backup_handle_to_page_ptr(). False otherwise.
+ */
+static inline bool ttm_backup_page_ptr_is_handle(const struct page
*page)
+{
+	return (unsigned long)page &amp; 1;
+}
+
+/**
+ * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer
to a handle
+ * @page: The struct page pointer to convert
+ *
+ * Return: The handle that was previously used in
+ * ttm_backup_handle_to_page_ptr() to obtain a struct page
pointer, suitable
+ * for use as argument in the struct ttm_backup_ops drop() or
+ * copy_backed_up_page() functions.
+ */
+static inline unsigned long
+ttm_backup_page_ptr_to_handle(const struct page *page)
+{
+	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
+	return (unsigned long)page &gt;&gt; 1;
+}
+
+void ttm_backup_drop(struct ttm_backup *backup, pgoff_t handle);
+
+int ttm_backup_copy_page(struct ttm_backup *backup, struct page
*dst,
+			 pgoff_t handle, bool intr);
+
+unsigned long
+ttm_backup_backup_page(struct ttm_backup *backup, struct page
*page,
+		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool writeback, pgoff_t idx, gfp_t
page_gfp,
+		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gfp_t alloc_gfp);
+
+void ttm_backup_fini(struct ttm_backup *backup);
+
+u64 ttm_backup_bytes_avail(void);
+
+struct ttm_backup *ttm_backup_shmem_create(loff_t size);
+
+#endif
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

--------------04S9KPZEE50SBVYX1uVv17lo--
