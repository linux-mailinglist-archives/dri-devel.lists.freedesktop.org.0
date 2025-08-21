Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 763B4B2F098
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 10:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24B210E89F;
	Thu, 21 Aug 2025 08:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jVsJO9Kc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A5810E2E7;
 Thu, 21 Aug 2025 08:10:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJ2xuzgdptWX5zLnDXTSwBLYfhClT97JFIeuE0tnunGaEOpA8rvC2WZSnDzFKE1y+xS6WWUOoKCVMQMKszGh+/wiq4ULM3IQhWra18vtUCw9QX5mBUyjjPmKD7geUY6D7kbY2AYONqvOl3E9jZ3P8Wtd2NwF9GjTGSrcdtwf3S5oCvtPeYU/8N2ecxsFrArKb6NQb/fYeyocmLmN/TyBDusdKQb69ItEuSRaIzF1f+PHguRDNKmKlGKobJlgeQ9G78dHacDL8DSfmaxpdOQ6/3z+i24KB5EMKOtCnQIcMcYekRMObccAAPF3tDAWeUQB0C3ocxYyHq1YgrR27CabZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsjyTFvVlD4jUrSsoSyN7OVzlXgwCnoM7FIVgfQqB5I=;
 b=T4ZjVMtmvtkovShR1TQQtI+l/Jee2tzVN7LkeB00HzcGDDcnJ5ularBhF6em2/FkR+xcfvkmOHwMarHkVsQ+WKhkCgzeHl7eBoexOOxxKs35LKlXxDOnZi4u/Tu6B/7ZQ8WqD89XIL8ueRVKIiA1+8LxYtYmUA/eRkn5DOpW2inU4GvqNG3y842Xao6gj12nmMJxRJwaQx19g4LWqhb1mXXWKcgTRw0jeb2CpJ4+vUS8/LX40U+cl5D8n/hmWVBGVXuYNA85wDas+t7RVmgFVyiR0/mlvlr/+/kOZaDGx7JaI3bOEJDfrTK6FTmmaAL8hxAuU5tcdCTTvBDyo/KNaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsjyTFvVlD4jUrSsoSyN7OVzlXgwCnoM7FIVgfQqB5I=;
 b=jVsJO9KcvzmcR58BpQKM9ocE6huyIno4fpIsp+oQ6Llgr+jbje04bs68f7Vx101gOzqeilipmgzJ++c4vRZbgclzog5WJh+RslSKk7gqRVMSZroHit3KBd/dPAWtKqXswgxAd0Oe53FZNqmZ1NdtGYzoGNNAXNMvDONQmVOtQgs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5860.namprd12.prod.outlook.com (2603:10b6:208:37b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Thu, 21 Aug
 2025 08:10:27 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 08:10:26 +0000
Message-ID: <4e5f4ef0-53f1-417e-8f3b-76fd7c64cd23@amd.com>
Date: Thu, 21 Aug 2025 10:10:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re:
To: David Hildenbrand <david@redhat.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, x86@kernel.org
Cc: airlied@gmail.com, thomas.hellstrom@linux.intel.com,
 matthew.brost@intel.com, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20250820143739.3422-1-christian.koenig@amd.com>
 <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <edf4aee5-54eb-4fad-aa89-4913d44371fe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0237.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5860:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f03aa24-caca-4dba-9617-08dde08a2f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bERJQWdBWjhPMndyclk4RXA1bExqZUp5eVlzT3pNaFpqTHJPVVl2MnhUQW5J?=
 =?utf-8?B?SE0yNUk0L1kvR3dwYUpNMiswUWhQZjU4b0VCWTJuT082WUtRVTBQc2thTW85?=
 =?utf-8?B?N3BjZm9mam92ZlpQOGZ2dnJaYlFHejZEdDZHbU4vRC9PUGV4UHpsL21hc1ho?=
 =?utf-8?B?NlVLOS9qTHB2WnA3V3VjZSt3aVMvTGpFVGhhdHd3dGxmaG81RmdzM21tSnd4?=
 =?utf-8?B?blB0d3BNYThmN2s3SHQ0SVpkQ0FrS0k5NlUxeHZXbzFOSGpLOWk4eGM4UlV4?=
 =?utf-8?B?N24wclZsbUwrTnJ2YnBCYXBrNVo3ZUxVSkZEZkFZRnhCbHpNcWkxTUIvMXRH?=
 =?utf-8?B?dUpKaGpLd0dzbWlVLzBrS3BNYjEvZGhuNGxIeUpLWG9jT3g2ODdoaW9PL2VU?=
 =?utf-8?B?d0JUUFFyVmtBdU5FdmJiUTNrSXJta1RaNzBiSzYvVDFsOWZkbzU2elYxc2pz?=
 =?utf-8?B?a2xCTG1GSXZ0ZzVLYk1sY1pWT1RvYjVLc01FdkJoUGNMR0R5dExWRVdKVUh1?=
 =?utf-8?B?RWZ2VUFlZkRWOVRaZUNJNUZIRlkvYW5nbC9yc3NHZThlaXYzWnJRSDRXbDcr?=
 =?utf-8?B?WDRsMHJRQVh1T0VFTk9LU3hPZGdhdCtRbDVkaWRZUFZBZFdTenhzMFJYUXlT?=
 =?utf-8?B?MzBvMHU4ZXozM3JTYlVJenFadUFDaUFRR0tiRW5GbXExNTJCOVRsQUZVSm95?=
 =?utf-8?B?ZGJmeWhjQ2dncTVDSlJnd0ZVcnpVUlovSWhtb0t1cm1LS0lOR2liMmF1OGhQ?=
 =?utf-8?B?aFE2UXJ4MlQ0ZEYzWHYvUllXUndCWGRrTEFYdmVVMnh4WFV5VWhFSXR1VEEy?=
 =?utf-8?B?anBtNVI1eWpOZHN3emFPelJxNWRwOWUxUktzNmlSUEFlbVJBcVZsN1I0MmRx?=
 =?utf-8?B?WWRacFMwK0c1aWF2Z0E3SDdNanhiYjFCOHpJWElBdFVBWVVSWTBtK3Mwa3Zt?=
 =?utf-8?B?Yno3bEZUYldSbkhKZjZTWTZvbDVFa2RtMnhqbVhzSEduVG8zTUNDMWFEVVAz?=
 =?utf-8?B?T0hoZG5BWGFUSWVIbUN0TWFGVTdxUnVuZ0lsejJDQ1UvS0JnWXlUZ1R3UHFt?=
 =?utf-8?B?SDdtUmFYR3lWMmpSaFExV0ljWjlJUi8xdGRUQ3lOYWZ3KzlaZmc4Wmp2dWNR?=
 =?utf-8?B?OW9aRDkrbGJTYnRzdUNQSWNCamdybzJnaUFIclJ4YnNRZ2oyVGp5bXVVcmIr?=
 =?utf-8?B?ZmN3UmtyNTUzSUgyN3cxZm1WTlVyUTZDTmhjS2lwK3FoTzV5cEs1NytUVlJi?=
 =?utf-8?B?NW93bFhFZUhuSDV3NFJINzRVTWJNNXFRTjJRM3VPNkVsVkxUenl5aVdBcldX?=
 =?utf-8?B?SFpvbUYwanBuSmZ0Q2pOK3FWTjJkaGt6NkVtMEFSUTJNWlRBekN5dzhUb3E1?=
 =?utf-8?B?dHZEc0V0d1Rod1loaTh3eVBSdW45MWw5Q0w0WXBxYTR2SE0zYjd4TDNON211?=
 =?utf-8?B?aEtTUVBVMmRyOVNrS3FvRjZUalBCNHFZb1ZGVWR5SXE2RTg5b3prN2pzRE5s?=
 =?utf-8?B?RlYrd3h2M0pOeG5IejVqaTdPc05UNjl0RGgyT1VUQ3FVRDJuaDRjZW1jb2lT?=
 =?utf-8?B?UFBqN3VVaGs1ZStraWEyRFFjTElHMUg3NnpGZUlWQ2RSRmY3NGxZT3QxVnIy?=
 =?utf-8?B?MFpUYldCU1NCUnU5SGwxZkM4aUhMMmFST2prM3RlalVlakZyK0l3bmI0Wnhn?=
 =?utf-8?B?UGtrenVETVRDR3RhbXNObjU4N1crOTlnNTdWTGtoWmNON3RVbTZjYlRCWC83?=
 =?utf-8?B?VXVENjJVYkwvd3MwMjdBaCtvSEU3SXJRNk9nNjV4dWM1MVdpclVJa1NuNVJl?=
 =?utf-8?B?SDNjYWhOaFd1cU5iUjQrVFdwZTVEZ3BPUDA0UitiWXAzSFFzSVRjRHVRemRy?=
 =?utf-8?B?Z0hEbjhZV292M2FQN0F6OTJrb3lVUUtZdnkrcHdMbVlkdUJqWHVnNUEvaGhq?=
 =?utf-8?Q?oMnKs4sgVTM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGprQ0twWWJaR3VIdFBENWxHcGpJOFQ3NFEzRDk2Y1dvTUpxd2pqSEREc1Fm?=
 =?utf-8?B?SkNKemhCTkZ1MXNrL3E4b3FCaXAzWEw3U1IrVnlsVzNxeUFsc3B6dUNDa1VS?=
 =?utf-8?B?dnBpaVNGd0JVMVRFTEZXYUZUcXk3ZDhlSFVtMnVqQkpsN1NCMTZIdDlPKzkr?=
 =?utf-8?B?WEp4NjVNNDhuVVZrOUdkSXV3TmRQWlNIUENRWDY1N296djF6a3Q4KytaYk5T?=
 =?utf-8?B?Q1dwcXVpLy9WMThxbU5qZVQyR1htREVtSmhrT0p3TGFjTExHN2dITUwyT2RP?=
 =?utf-8?B?emZwNE9BTm5XR05iY25ibVNiQjRWNElwODZFSnFLVVdTNHZYUDl1Y3RqU0Jt?=
 =?utf-8?B?alJ6eVBVaHdBWnkwZ0E2RytzbmsvbUpzeTBOUW1qT3lhWS9IZmdkTm1NcVVJ?=
 =?utf-8?B?YUdFaHdVQkpDdll6cXM0aDd2NmRoL0p2c2dITDUvbmNmNENTTnpkV0xESElt?=
 =?utf-8?B?YUY0bkUwSEdOeEdhYnlYNnhOWkJROUNuL09tSC83WVRPSTkwWVAzSGJJVXhN?=
 =?utf-8?B?d0o5Ri9wUktCR0ZhblhKZWw5VmVmVERpS21sWDFKL2N6c092alllaERCNVNZ?=
 =?utf-8?B?VFZ3WGlxQytxaDBkejR2MmxDMlJwR0FQdXJJV0lZc2RzMWRpZzd2S1RXbUEz?=
 =?utf-8?B?c3JMV3hEWnlrT1luSUtnaHhjbjhucWtIU3p2L2VSR08rL2VzT3hFcnJzVGQr?=
 =?utf-8?B?MG1FRllJbm1SbkVvR3R5UXJUN3A1a29JcmtLL0VmYnpOOFFtZWZuL21xd3du?=
 =?utf-8?B?UzFrVGZyLzZUd0Z5S3FBdGJlSitUMnVvOVJZWHRoeXN4b1JHU00xUHo4ZW5v?=
 =?utf-8?B?TW9UUHlTMzRWQ1hzTlJLMzcrK3VlRFI1WVIwYnRkT0ZoQ2VtTUdDRENCRHU1?=
 =?utf-8?B?L1hxTHFkT0ZOWjdTWFJVMU9ZRFF5N1ArenlhVE1nYjVxemZiVGNDbU9icTY1?=
 =?utf-8?B?dGNYRm55ZFAydjltamdRZzRzQUpZWXhFYzNBOW4xNGM2aE8xcEpneUJkS1FZ?=
 =?utf-8?B?NXY3aWxLemlMamszYlA1NUlSQTIwVGNiM0tENDhxZHhaQVdyVVFkcWM5QUth?=
 =?utf-8?B?OWUrdlBXNDQ0dm16NzQwV0Jtd2VVOUhFQXVnMTRxdWRzSzk3TStGdVRncUFn?=
 =?utf-8?B?OUo1OWVBTUFmRDFINVBKSkd3cG1HWmdGRkRFbVBDbFdMRTNPc2xjd2RpKzJQ?=
 =?utf-8?B?TVJSSWlkTjlWNUQ5SWdMR0pmTGtycEpXbkovYzR0Vi9sdEIvcXhNSVdSYm9O?=
 =?utf-8?B?VG5jbEtXSm1SSzg5ajE3bk9meWNNQWdOYyt5WVVPSFhFNW43dkNkdmVScmZi?=
 =?utf-8?B?RHJLZm8rL1hOMHRCY014aUR4Qi9PdkxScVVmYUxHUGd6Y3JacUU5eWdZYmpH?=
 =?utf-8?B?WVJrNDA0UWlOcVdZRitCaTJHU2JneEpRMjNublFCcDJ4ejYvdTR5MjBDNzlK?=
 =?utf-8?B?OGhJclJCcG1oQXdlM2FCSGN0bTFGWVArZ0lZWWhoRXJ1YnQzZFFqbDhERDMw?=
 =?utf-8?B?dDRxZFNOVXNlMXZKaHZwY1E4Z1cvQ3loTjUzcVhPeS9abk82TkI2SXlHUVhH?=
 =?utf-8?B?MWNpcXJUOFlJWVUrV3dYa21RamNqd0U4aEhoMWJFZi9NM1V5ZUJ2YXg3dW1V?=
 =?utf-8?B?Vjk4Nk56VlYwb25STkl6VzBHWmh4M1FaT1kwa0dCS0tOM1VsbDRNUWRhOTMx?=
 =?utf-8?B?UWVBZUt0OE9ycnZ1Yk1BdGI5eG4wRTQyOWNKT2M5a2ZZMExIVkRMT3BNeG93?=
 =?utf-8?B?SkRLTUp2UGxML2E0QWFMVXBXZXB6TngwaFQ2dUZ2eTJCY1lNVG5RNE1lbVF5?=
 =?utf-8?B?K2gxYzF1RFZxYlp1OW5oTTdIWXVjdVdzREMzVndIV2Q0YXExdFV0aUpOMW9U?=
 =?utf-8?B?ZXI5TzZEc0RmYVNWQTZQNHh0V2J5T0NYM0NKMEtla1Zzb3ZKb0J2bFhkUEV2?=
 =?utf-8?B?WWF6cC9jQmFWSVRybUJpZW83NnZUQmVtcHo4bVJwdGtjMDdsUW9ZVUpYYTc5?=
 =?utf-8?B?aHdGTXJ4cHpwTkhuYnYzamc2dElOUXFBc1pMcmEvd1FIdGMyMTlrMFNMR0Z2?=
 =?utf-8?B?ZTBUZkpyNVFRYSsvU0FveFZJZ3NheUVHWndCQnJRaGtVTlpoVktJRlY3c0Jp?=
 =?utf-8?Q?rrMga8dyJkrI6i/9BezRH3chg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f03aa24-caca-4dba-9617-08dde08a2f2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 08:10:26.1916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FgCNr8p99EmyjfxXWoUyhFUwUywrOQIbfWdgiNaO68WD9PTJoDjqWElezyYBtQH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5860
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

On 20.08.25 17:23, David Hildenbrand wrote:
> CCing Lorenzo
> 
> On 20.08.25 16:33, Christian König wrote:
>> Hi everyone,
>>
>> sorry for CCing so many people, but that rabbit hole turned out to be
>> deeper than originally thought.
>>
>> TTM always had problems with UC/WC mappings on 32bit systems and drivers
>> often had to revert to hacks like using GFP_DMA32 to get things working
>> while having no rational explanation why that helped (see the TTM AGP,
>> radeon and nouveau driver code for that).
>>
>> It turned out that the PAT implementation we use on x86 not only enforces
>> the same caching attributes for pages in the linear kernel mapping, but
>> also for highmem pages through a separate R/B tree.
>>
>> That was unexpected and TTM never updated that R/B tree for highmem pages,
>> so the function pgprot_set_cachemode() just overwrote the caching
>> attributes drivers passed in to vmf_insert_pfn_prot() and that essentially
>> caused all kind of random trouble.
>>
>> An R/B tree is potentially not a good data structure to hold thousands if
>> not millions of different attributes for each page, so updating that is
>> probably not the way to solve this issue.
>>
>> Thomas pointed out that the i915 driver is using apply_page_range()
>> instead of vmf_insert_pfn_prot() to circumvent the PAT implementation and
>> just fill in the page tables with what the driver things is the right
>> caching attribute.
> 
> I assume you mean apply_to_page_range() -- same issue in patch subjects.

Oh yes, of course. Sorry.

> Oh this sounds horrible. Why oh why do we have these hacks in core-mm and have drivers abuse them :(

Yeah I was also a bit hesitated to use that, but the performance advantage is so high that we probably can't avoid the general approach.

> Honestly, apply_to_pte_range() is just the entry in doing all kinds of weird crap to page tables because "you know better".

Exactly that's the problem I'm pointing out, drivers *do* know it better. The core memory management has applied incorrect values which caused all kind of the trouble.

The problem is not a bug in PAT nor TTM/drivers but rather how they interact with each other.

What I don't understand is why do we have the PAT in the first place? No other architecture does it this way.

Is that because of the of x86 CPUs which have problems when different page tables contain different caching attributes for the same physical memory?

> All the sanity checks from vmf_insert_pfn(), gone.
> 
> Can we please fix the underlying issue properly?

I'm happy to implement anything advised, my question is what should we solve this issue?

Regards,
Christian.
