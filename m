Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3432B35744
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 10:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB37E10E154;
	Tue, 26 Aug 2025 08:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hzc9sPCp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2068.outbound.protection.outlook.com [40.107.101.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC7C10E154;
 Tue, 26 Aug 2025 08:38:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYHkLnPbphLKm4sDyqptSgBz4ezNDTjW6QCwtSysHeH2MSr6iP2QPZu6nzB5lpKqWtNGAY6WqtdsbM6hSqYJc5gV9QgwAhxIw5IEG4tWJy6+F5KrJxFA/CD8GO+kaJZJGjA5YOLAtULLYhGi5jnxvXTk3yhiRAFUs/lUqsbOn/FcW/BnO5FBteThOhk0Qck6HxlsOQ6UwyThhBFfYUiwiq2wQ8/pFKgxvGDbTaJmfnRJRabafGzXIgioWIyMuCfNuph5sR/yl9O90kg/IzY4VEtjvDSBoRNWnZ3vCpC5OIPW+ket3bvdLXObqYj5PB6FxgM3tNdb08+1Jb7aw6yKiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt/ZslfkJRzhJ+kVlHwb04yYgha6P0sIh0wmlzPRdKU=;
 b=MYyMY66oRthr6CxULY4cCokiR4tnQgpqAnLqpp7+cAWe3XZmBPV/ZCDTJ0MD1bLG/H4hjSb0St3+aCSQqSRRlOkaVjI0a9IOzfs6ASI5JoJVSUvxUL1D4E9DXKY/1+IcnwQMO7ftpDO2daZihWnGh2zLFUcUNolTjzSafm5FzRhaJ+M3LwWcdYfPrgJvuFvGZ7aKul01WSYwScAj9zYRw+u0WizwXxgfogcPmnf1wGXMnW/i+g5Cky2wqxxwCmt+Qv9okqNDX1pMckZVORL0BBFw4oy1KwQulZ1yC5hsV+y/vQ4SLkHX8LZKOaAo47m6sFz93Y3vxksx2cSPnEkdsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt/ZslfkJRzhJ+kVlHwb04yYgha6P0sIh0wmlzPRdKU=;
 b=hzc9sPCpCppp+unIXYdwImZdizWykGubV0GhJ6eTFqKshn0n7/AW4NO3/yAaIT8ymPv3dsPlifhLdAHdgvwcbDJUFhJTNRgFXcQOMm9t2j0LKgyyT7YGJ1A/W8w0JSJfuiZIGI4ZCcXD1AJUBzleIGCjwsfe2WeXNv4xSFhE71s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8815.namprd12.prod.outlook.com (2603:10b6:8:14f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Tue, 26 Aug
 2025 08:38:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 08:38:18 +0000
Message-ID: <a1b95d23-1908-42c1-8ff6-da051fc140aa@amd.com>
Date: Tue, 26 Aug 2025 10:38:12 +0200
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
 <4e5f4ef0-53f1-417e-8f3b-76fd7c64cd23@amd.com>
 <f983521c-b43d-4245-93fc-fcb847908573@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f983521c-b43d-4245-93fc-fcb847908573@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8815:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a3a1d9-8678-49ea-2b0a-08dde47be84c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFVxTHJxTDJKK3lRZkp1cnVZMEw2WDRmNG80Znh5YlYvSGlUdEQvS09YN1dD?=
 =?utf-8?B?SVBGc2F5QnRmRlBFby84MWo0OVRBYTUvT1ZuUldYSUQvTDhwNjdZSDBPRFBw?=
 =?utf-8?B?SGFYOCtCSWJZRDJFbk5rbzkrUU8xQzlQUTBFYk94TXdncFNoVFYrUFZ1eXV6?=
 =?utf-8?B?VXJ3ZE55ZmhFMjBnbjFGYzczUHFGVWg0VUU5WDFMbTNtbkxuU3NvajEwMEFt?=
 =?utf-8?B?QW9xODVsY05uaHJHSFdZUnlTR3hjUmJMMlo1VWs3OWJCaFV0cWlva1Fua0Fh?=
 =?utf-8?B?Yzl0YjE1Zm5HL2hzNlUvUGp6N2x2M0hLRU4yOWJaZlhQTWRFa1V3cERJZ05i?=
 =?utf-8?B?b2xmL201QWJJNzZKZUcvcElHcWtQZkl5U1VlVXlicHlHVUFVcUg3Yk5ZR2Fo?=
 =?utf-8?B?Q3FzVFF2dXAvcXEvTXJ2aG1PZWN1RUpkeWNJdEpRSkQyWlpVUngvd0xyMFpX?=
 =?utf-8?B?ZVViTDhlMHdPVmh6WGtvS0hXLzI2YzZpWXJyR01qZG1pamlPaXAxZ0N3dFg3?=
 =?utf-8?B?L0tpelBGZnBkbk5zeTNpL1FWa3FmNmg5VXIzZEF3TTYxeFJpTmg5ZVBGSHNX?=
 =?utf-8?B?UURuR2dubGpCbXp3ZEFVRHB5azE5NnpKRzZnUkZFV1FKTHVTVC9NVHpUc3VV?=
 =?utf-8?B?Tk5SK3J1UVdWV09UNExTVmR3TjhTSStTaDZSQXZPTmZ1TG5LcFFWVE9CWGVS?=
 =?utf-8?B?R2V3NzcrWVhlMHRaTmFaanR5ZXVseGpTQmlabkJuTWMrZytnY2cyRVQrYm5S?=
 =?utf-8?B?cUhZdklLM3Jja3pUMFdDeGYraTk4TFRwbENxZzF5TzJHUmNsZ2wza1MvQ1p0?=
 =?utf-8?B?WkpKaUxzTUptYlRGRjg2NlVXcnRXQUdhQlpDMG9wRFZCdFAwK3NHWG85T2xm?=
 =?utf-8?B?MVhkTEJ1WlIvc0VwVGlBQU5UK3ZrRHZobHVyWjhKY1NCZkY3bm91OFJJSGhh?=
 =?utf-8?B?VEJhQ2tua29STVFkeWZUV3Zrdkp0MjVGNUxSVmJYekd4RXZad0hWMVpUak5n?=
 =?utf-8?B?a3dUT3JQaytveTZMMWRUeE1pQm9kQmtiSjJXT3E5c3hFNDV1NU5hajl3UE45?=
 =?utf-8?B?N3ZhQXNBbHJtREhmYzRVZWhvQUZheHlJdFF5RC9YV3pEdi9zT1JKYUZuTjRT?=
 =?utf-8?B?R3RFd1VtSldKSlNvNTc0ZDN2dkZWUW82RGRoZDJEemNmbmtadDFJQ1ZNZ2Rz?=
 =?utf-8?B?Z3JMVEpWVFNIS1c4NzQ0NktBYjlOWklRTkNhVUcvdE5QL3Uzemd1b0ZBTFdW?=
 =?utf-8?B?cDB0WkN5K0VETVVVQy9MZWt3akFIWE1kaG0rMkhBMzlVelI2aDBZOFJodDF0?=
 =?utf-8?B?MGRGZnZITUZHazRjRHJaRGhreTBxYmtzaFVQTmo4NE44RDdPNWQ1WmpESm4z?=
 =?utf-8?B?RGdvNWZOMHpZWXB3Q0lVZTdUdWR4TlRYRW54U2dqK3laQ2FpWVJDSFJVNjlp?=
 =?utf-8?B?SEFuNElXMkw4SEpKZ3FvQU4zVDFQeGR4SnNhby9aaWdwT2ZsM2pyVzZ1OUx1?=
 =?utf-8?B?T29lSkg1aVVFNnBZVEY0enpHVFZRMi9rSTVDY0xxRkFQSDhYZEYrRnlPZlJt?=
 =?utf-8?B?L1RkRTRlMXp5endhRmhNOUx5cmZXdUppenIxMTlMdmlHYVgwRURERG16Vjgz?=
 =?utf-8?B?VmNUZjJ3Tm1ORlNwQmdCRDFJZE8zZzlRSE9xLzhtZGFMekM3cHVZZG9tY1Qw?=
 =?utf-8?B?WXBuQXppa2ZsY0M3OVhLa3NaamNZZUs4NEpHcDVvYWxUMkFqSU55U1N3emRu?=
 =?utf-8?B?ellCbndYaTFrMUdwaUs4Um85Q0lHdGFBMEV2RUc0aFgrTitPMXUxbzM4alZy?=
 =?utf-8?B?aDZqa2ZTS01pYncyb3ZPZWJWN01nNEEvazhDMWE0Y2JjVmhRZ1l0V2NIWG81?=
 =?utf-8?B?YmsvVGVlNlhFYVdkZzhKSUhqdnJnWmMvOWY1dnRFdUdFL3Q1Vitjd1lHQnJr?=
 =?utf-8?Q?7JbVWUeTxh4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlcrSUJLWmZIdCtidXFjanpGTDd0NEFTbzBHZlg2b0hKK2Rlc3NaNVgyRlYw?=
 =?utf-8?B?SlVTaExxSHJNRU9vNWtMeHJySlBKeVNIaksrOGVLNFhsY3RJTUZtWHpJMk5L?=
 =?utf-8?B?MHVsWkMyMzI1bEcwT1U5Tk5uY1RZcllsWlhUVVhUY1RYbEcxZTI4K0dQcktF?=
 =?utf-8?B?THZvaW1iN2UwVUNhWFYwOGFUSW51b0FXYytJd3BQUjJQSWQvaDBWVnV2eE5l?=
 =?utf-8?B?dlpxaFlpeWRjNDlwdEEydzNwc3pZazRmcllzQUttd0Eya0tMUndFcWVkY3J4?=
 =?utf-8?B?L1B4L0dQNjNRTkJkRVFpZldjS0tnejVQYWJ2TjJhS1pGbkVuRFZ6a0xTNng0?=
 =?utf-8?B?czVybTQxUmMvSlZGdGJlR2Z0a3FXTkN0VTliM21TK1hhQm9qS0ZNMksyaGRC?=
 =?utf-8?B?c3lBbGVubmZadWhyMWhubC9yOVVDTzVqUkczN2VlazB2Ly9FblJYVjhFUWVB?=
 =?utf-8?B?UDMwS1g3MDNqbVAwRmFLRzNYaEdKak8wSTJEMTk5VHp4UVhKOWdNRUNlRjZr?=
 =?utf-8?B?cVozNTJ6cHA0RW81OEJDNmJVOHFhNEpVajUyWXIxWlk4Wkc2SytibXRuY0FQ?=
 =?utf-8?B?bGFEbjZSL1l5SEowMXA4Yy96R1RNRFhqWkNPUm9lWEVISkhMTnR1MGx5blho?=
 =?utf-8?B?RGcrckR0aVhWUk1yZzR3b0kxUWptZE1rSEVsSGFDd3pBNjlJOHBZcjhPeFRR?=
 =?utf-8?B?aGh3Q1BHSlMwbWdVU2tZMFhCUzBpcGhjQ1JjUG8yb0hSKzF2ZzI3N2JuYnRi?=
 =?utf-8?B?RVF1VEV4aFZ2SnVKR0pNZ0lvVzJsdnNVNUh4TERXRlE3N3lVVHJOb1FiZWdU?=
 =?utf-8?B?SEVqWUNqZmFudFJtaklIclFWcmF5OFdwNjZlcUw1c3VyaWRVZmJURmI4RHpT?=
 =?utf-8?B?ckNKZ0tQRjcxUGxBUnk2UXpoN1BsYUt2cFp5R0IxUHBRdkJUUUdPTzRDTzRT?=
 =?utf-8?B?T0crNGl2T3JyTGNlM1Y0UW9pNkI1OHNNZFk1bGtlWTV6eVFaTHRyL2RyblU3?=
 =?utf-8?B?dllaU3NMTCtSRWh5MGdwdGd3U1JUZ3JkR0RoK3kwZXJnNVpXcnNYSVBBeHhK?=
 =?utf-8?B?dXlTM05ObkZXQ2QzZFhEYnp5VWFVa2NWQzFpa0ZUUEVIUk9CUENJK25tMjlE?=
 =?utf-8?B?dzhWWFY3K3JtcVMwUTlzeFNKMm5BdG1ZbTlMSWFVZWtlZFFLVGFNVTRUNUov?=
 =?utf-8?B?NnBjaUMzc0Qwd0g0Wmc5ZDcwOWx0UXJ3QmlGWk5tMDJYNlZOVWpoM2RyeDZx?=
 =?utf-8?B?UnM1YlJsM0pqSnYrekZNLzhYakVQNXBsbyszUkZxSkRNank0L2M3ZFdlT3FQ?=
 =?utf-8?B?YUhEQzFqVVh3ZWc1L1BnbHdsOHJ4c0RFK2djUkhNYkNuQzQrSGwwSkpveC9K?=
 =?utf-8?B?eFBVbGlxL0U4TDNsM1k3bDU0RUVoTm9ZSFNnQ2t4aFRhRjUwaForQ01nWm5a?=
 =?utf-8?B?WkNYcWZpTFE4MTlsMlpiKzYxaGp2SWQ3Smg5czBCVFYrUWE2TEhHbHZuMW02?=
 =?utf-8?B?VmppdDZvRWxHOUlhc2lwSlZuS0pGVlBYV3k4SmZsbUZuV2UzSzdrc25RTkpv?=
 =?utf-8?B?SlVoYWo3SW52UzV4MkV6azQxNDVuTjNObFd4U3VRNDl1TzY5WDQxbGlrMmNS?=
 =?utf-8?B?QkVMcStnQzRxdFgvcDVkZkU2MExmQUcyaXRRZFM3b0JZRVV3Q2NTdkg2eEpm?=
 =?utf-8?B?UWJocGgrWm1xa3pHeGViWmRtcWQxOFNIT0ZaNktNRHVvK2lwYm4xU3gyK0ZP?=
 =?utf-8?B?UW5QOTYrY1grS1V3aW5LM3o5UjdaZ1RXQWIxNDNFYUQvUzJ4V1U1cHV1OXM4?=
 =?utf-8?B?TmRaanhhMnJhUk5GWG9qWC9WZFJlWjJ6Nlg4cXlNYUw3TlJ6RW1HMnpjbGJz?=
 =?utf-8?B?c2NpeVZIWTd4KzAyYlloTERhaGgyVytaWFo2Sk96bmdhcWNzNEYwK3ByQjVD?=
 =?utf-8?B?UWdEZk9yek9iRUoxZEtOQ1lFUmtpWWNFK0toR2RVQ29ySjQ1UERRanFqUzNL?=
 =?utf-8?B?V0owNEhDSThGYU45cmR1RHRIcDVxMHo3NnhqZE5SVDVuREZlNFZ3Q2x4N0tD?=
 =?utf-8?B?SFQ0YXVJWFMyWUNSMktFWElRd1VvSVJscUZoU2dpY3Z5cU5pcGlPRzF4ZTNo?=
 =?utf-8?Q?kbAHDNZ53yT2loKO2huYZt/kl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4a3a1d9-8678-49ea-2b0a-08dde47be84c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 08:38:18.7383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+9FI07i0sJva4fiHrEfhm+Aq+Z/O44lNQhcWPmiOnhGL0G3ayOvK3Wtz1R1OPDH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8815
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

On 25.08.25 21:10, David Hildenbrand wrote:
> On 21.08.25 10:10, Christian König wrote:
>> On 20.08.25 17:23, David Hildenbrand wrote:
>>> CCing Lorenzo
>>>
>>> On 20.08.25 16:33, Christian König wrote:
>>>> Hi everyone,
>>>>
>>>> sorry for CCing so many people, but that rabbit hole turned out to be
>>>> deeper than originally thought.
>>>>
>>>> TTM always had problems with UC/WC mappings on 32bit systems and drivers
>>>> often had to revert to hacks like using GFP_DMA32 to get things working
>>>> while having no rational explanation why that helped (see the TTM AGP,
>>>> radeon and nouveau driver code for that).
>>>>
>>>> It turned out that the PAT implementation we use on x86 not only enforces
>>>> the same caching attributes for pages in the linear kernel mapping, but
>>>> also for highmem pages through a separate R/B tree.
>>>>
>>>> That was unexpected and TTM never updated that R/B tree for highmem pages,
>>>> so the function pgprot_set_cachemode() just overwrote the caching
>>>> attributes drivers passed in to vmf_insert_pfn_prot() and that essentially
>>>> caused all kind of random trouble.
>>>>
>>>> An R/B tree is potentially not a good data structure to hold thousands if
>>>> not millions of different attributes for each page, so updating that is
>>>> probably not the way to solve this issue.
>>>>
>>>> Thomas pointed out that the i915 driver is using apply_page_range()
>>>> instead of vmf_insert_pfn_prot() to circumvent the PAT implementation and
>>>> just fill in the page tables with what the driver things is the right
>>>> caching attribute.
>>>
>>> I assume you mean apply_to_page_range() -- same issue in patch subjects.
>>
>> Oh yes, of course. Sorry.
>>
>>> Oh this sounds horrible. Why oh why do we have these hacks in core-mm and have drivers abuse them :(
>>
>> Yeah I was also a bit hesitated to use that, but the performance advantage is so high that we probably can't avoid the general approach.
>>
>>> Honestly, apply_to_pte_range() is just the entry in doing all kinds of weird crap to page tables because "you know better".
>>
>> Exactly that's the problem I'm pointing out, drivers *do* know it better. The core memory management has applied incorrect values which caused all kind of the trouble.
>>
>> The problem is not a bug in PAT nor TTM/drivers but rather how they interact with each other.
>>
>> What I don't understand is why do we have the PAT in the first place? No other architecture does it this way.
> 
> Probably because no other architecture has these weird glitches I assume ... skimming over memtype_reserve() and friends there are quite some corner cases the code is handling (BIOS, ACPI, low ISA, system RAM, ...)
> 
> 
> I did a lot of work on the higher PAT level functions, but I am no expert on the lower level management functions, and in particular all the special cases with different memory types.
> 
> IIRC, the goal of the PAT subsystem is to make sure that no two page tables map the same PFN with different caching attributes.

Yeah, that actually makes sense. Thomas from Intel recently explained the technical background to me:

Some x86 CPUs write back cache lines even if they aren't dirty and what can happen is that because of the linear mapping the CPU speculatively loads a cache line which is elsewhere mapped uncached.

So the end result is that the writeback of not dirty cache lines potentially corrupts the data in the otherwise uncached system memory.

But that a) only applies to memory in the linear mapping and b) only to a handful of x86 CPU types (e.g. recently Intels Luna Lake, AMD Athlons produced before 2004, maybe others).

> It treats ordinary system RAM (IORESOURCE_SYSTEM_RAM) usually in a special way: no special caching mode.
> 
> For everything else, it expects that someone first reserves a memory range for a specific caching mode.
> 
> For example, remap_pfn_range()...->pfnmap_track()->memtype_reserve() will make sure that there are no conflicts, to the call memtype_kernel_map_sync() to make sure the identity mapping is updated to the new type.
> 
> In case someone ends up calling pfnmap_setup_cachemode(), the expectation is that there was a previous call to memtype_reserve_io() or similar, such that pfnmap_setup_cachemode() will find that caching mode.
> 
> 
> So my assumption would be that that is missing for the drivers here?

Well yes and no.

See the PAT is optimized for applying specific caching attributes to ranges [A..B] (e.g. it uses an R/B tree). But what drivers do here is that they have single pages (usually for get_free_page or similar) and want to apply a certain caching attribute to it.

So what would happen is that we completely clutter the R/B tree used by the PAT with thousands if not millions of entries.

> 
> Last time I asked where this reservation is done, Peter Xu explained [1] it at least for VFIO:
> 
> vfio_pci_core_mmap
>   pci_iomap
>     pci_iomap_range
>       ...
>         __ioremap_caller
>           memtype_reserve
> 
> 
> Now, could it be that something like that is missing in these drivers (ioremap etc)?

Well that would solve the issue temporary, but I'm pretty sure that will just go boom at a different place then :(

One possibility would be to say that the PAT only overrides the attributes if they aren't normal cached and leaves everything else alone.

What do you think?

Thanks,
Christian.

> 
> 
> 
> [1] https://lkml.kernel.org/r/aBDXr-Qp4z0tS50P@x1.local
> 
> 
>>
>> Is that because of the of x86 CPUs which have problems when different page tables contain different caching attributes for the same physical memory?
> 
> Yes, but I don't think x86 is special here.
> 

