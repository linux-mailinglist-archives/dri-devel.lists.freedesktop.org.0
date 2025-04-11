Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93922A85D5E
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:42:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D1F10EB99;
	Fri, 11 Apr 2025 12:42:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="im80Xj+o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A015A10EB98
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 12:42:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjknHhd3u8Vh1u/I/GDPgSDeUqf0GWrZ2aXFSJBt9pgrH8396yaT5PY2vv9pFNVtX4cFxa4Mpzl5sYcSXYSPzTn/VaIxXLORR9m01OO5nLcPUFyjdOUkEtoxdN7dJOTUlehZQUAZq3AMzofAygwy0HMbChh/R03VHFxOSCE3PXHSo2DgwM8f8jZmaeAL/sPzKXLBtfaW/KapCprm7pUtedbDh/HydJsgQb8RA6DMbkAXdBTGfZfvm5cD5bfe67TC1gDrrvRPRUwcifU7AtN07ATKzOX7P6/FOsCho0zz/0wzNZ9i+CaHVrk4KqX4Fagxrlecitz06u0XNymVVliZWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVloMfywI7oY8rSSG3aMmup/nyVD9+AsyNd3hclli/E=;
 b=N5p39Y/Re+0PGN/GKyDmYK1G2okQub4K+uN1f4oPJ4mzGpLuvNGpD7YDiFsKR0KLxnxfMYVK/+ZltxT7uCq13hwyRRW2hq0aeXLzVEj1qWSEQvNdIz0I9kl/38EQ9yrRDWWBOuaLSzMkZp1U4KF/0+W6u9sY4cx/ngRnsQisXOu5O0LxaNkFbQ2Ax5izdZW/Jf3eMRFyOid3gBT40hTF3XTyNjV0tAVb6HbSVgBzbRULN0hpVUM28axeea5yW6VyuDG8yP8HWaj+k3rAr2WDdFG1hhd8rP3m3WztaShVGDbbm4xzZkq74K8F9LcD5sttYFUes/Ky+Jujp+urVI5W0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LVloMfywI7oY8rSSG3aMmup/nyVD9+AsyNd3hclli/E=;
 b=im80Xj+o9ChRLIE/2aBl7jOrqzG4nYuafZ1Jd1xgGX4xsOkBQiGTUBwbQjXgn81bY6IY/ZL0G/E3Y/qWtvZm+z334EO/s98cOFwyoQlEA9KB1Plq1DoKUMH0nPBBUv0HzERRqHkEFF6+rt/NTySgavk9JT3kCQx2bsW+XMUBxqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB5839.namprd12.prod.outlook.com (2603:10b6:8:7a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 12:42:02 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 12:42:02 +0000
Message-ID: <45bbee88-0446-4773-a4b6-d19a1747c43f@amd.com>
Date: Fri, 11 Apr 2025 14:41:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] uio/dma-buf: Give UIO users access to DMA addresses.
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250410-uio-dma-v1-0-6468ace2c786@bootlin.com>
 <09a5beeb-bae3-4a00-9aff-66adf68064e6@amd.com>
 <20250410214307.361e373f@windsurf>
 <b596c9af-c0e3-4557-b45a-462a33179235@amd.com>
 <60e2d844-418a-4bde-b6ef-76d10448d5ec@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <60e2d844-418a-4bde-b6ef-76d10448d5ec@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0147.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB5839:EE_
X-MS-Office365-Filtering-Correlation-Id: 524597d9-7297-4523-85f7-08dd78f64234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFZnVlU1L21pM1U2QlJkdGdBUFNzTTRCdCtsNGRSMVp6ZVNIZFhSQ1J2V1pa?=
 =?utf-8?B?bmhxNlNaVDBNcHdUK1hIMDluT25XZ2t6bXh5dVgyNkMzV0Z4Y284QWp1UFJs?=
 =?utf-8?B?K0R1bnFYY0lMNFZMYWQ3OXFoYVZyY1g3RXE2NGpKN2dsLzliLytOdjVTMTNB?=
 =?utf-8?B?dHZYYWpOaUhSTjEwOW9ndXJmeDZHemJQQlYxdkxaNitqTTRueFBCZXptbG5s?=
 =?utf-8?B?cWJ0cHlsemxNQVVPUG1uMytrcVdnWHlwdVdaLzdRSHZ6eXFYM2tDQjVPaWpm?=
 =?utf-8?B?aTJXSE1lcWROdWU5RlAvcC96a2VXQnk4TUxZWDd5cmd5b0VFeXovdFFkbCtV?=
 =?utf-8?B?NXJJOTVMWjduQUJWQVlpUkw0ZFEzWkNJbFE4Nk56di9vSktWOWFDN0dDOTBy?=
 =?utf-8?B?dGhla3JNUUlhUXhhY0lFbzlmUWp5N1BoUmlIQTA4d3BPNWhKa2VMbjIwWjR1?=
 =?utf-8?B?ZzE3a0ZQVnhKTDhab0FOdS8ySmFXdFovUjVDcU93U2tBeDRmTENXRWxzTFlG?=
 =?utf-8?B?TWwrNkNJMlVzK05RcW9RTW1VZnN4VTBWc055NmlIblhqL3RDUWFEV1gyRTFD?=
 =?utf-8?B?VGJ4WWsvdEMwdk54M3RMUXhRMXUvRDRHZ2V3RWNhZkszMEk4MHZNVHVidWlS?=
 =?utf-8?B?UmRnVUdEL2dkOUUwNWpnS2l4em14UC8ySFFuRzJhcVkxakVNazMzOGRxWFM5?=
 =?utf-8?B?N1N2dS9PVWdGMkNkYkF4T3U5MVh0Vk9XNGh4ajd4VFF3WVlzNENyTk5xWWQ2?=
 =?utf-8?B?MEM4Qm1OaWg0NFVmQXJvWVdHT2xwM3ZScE1UVHQwZjByZlkySGR4L2pZSlBr?=
 =?utf-8?B?UGJ5RHVuMGl3ZW5ySFRaWmRTZGRiRkt6T2I0aXlWSEpUaW01WWovQ1RwNHZo?=
 =?utf-8?B?Q3FXSmRPc0FrMUVJOWlkY29ST0RsaFkzK2E2d21vTEUxQ3hYSHlJNUlzOFNz?=
 =?utf-8?B?T3hUQWt3OG5uQUFnZ21ramNHdXhuY3VYbDdSQmhmTkdIQ0dHQ0I5Z3MwU2t3?=
 =?utf-8?B?UEY2UFFINWpiM1FlTjhtZGpyV3VhUVRyNjc5dkZRbXVIYndSemVZODVidThJ?=
 =?utf-8?B?aEpSMHY1am44VmY5bmtBVDR0cXVIMzQzRWwzaUx6UXgxZzI1blFoakhqRlhP?=
 =?utf-8?B?U1FsYS93K0hoUldDYWZEQjZPcHJCR0dmcjg3d2UySFpBOEJSdGlEU2dweUM0?=
 =?utf-8?B?OW0rZFFZd041K1JRZmhVRHpIZEJxcDRjWnlRaWR5UzY4N3JDQVducmlPMUg4?=
 =?utf-8?B?RSttWU82SjRtcFBNL1ZaeHhqbms1OHdtUEdlVUpXSTJkMWU4d25qeGF2QjNN?=
 =?utf-8?B?R1BXNGJVMGZjMHZQUG11WnZOM3d5SGsxaTNkNWRyNkpQdW5JS1M3WndpWXpP?=
 =?utf-8?B?aEpUUHlqZjhON05EM0NjUTNTS1JCRUJ0L2pXWjFiWXJ6WW1WYjZEQ1lQaVA2?=
 =?utf-8?B?Tnk4Q2EzRVJQcjh2RXZKMnNSWlNYV2IydS82RS9RT3J5RTZ4MFdWS3VtRENv?=
 =?utf-8?B?WjBTUjVNaENTdWFQYjNJYkczMW5vVmJqbEFoakRvLzNzUEM1MEZ2QjV6UnVY?=
 =?utf-8?B?V2R0cGM0WFM5U2p4dzhRZlZjMG45VnZTd2Fab01zMGJiRUlUelB0a1d0WDdj?=
 =?utf-8?B?M3JZaDJ4bDUrbllQQWwvc0I0UUt4ektKOW5sZitDaUs0V2FPbkRoeEhpdTlr?=
 =?utf-8?B?d2wwOUp3dVA1N2d5OUFGMzVyQ3ZaOHNRSC9nektUa0F3Qjc4VnhMRkc5Smto?=
 =?utf-8?B?blJXbDBiZkNtUEkwVkVYWEY4dlYxdEpKV1dOdElRSzVWMTMxUXNZKzI2ZkJW?=
 =?utf-8?B?a01vQzluZ1lQeTJQQ1A4U1pOb0ZFY2haNEU3cG5udDBVU1dIMHV5OW1yT1Fm?=
 =?utf-8?B?dDQxTjNJazJ4Tng3S0ZEWk4ybXd6TG5SeDUxK2lTMkNNRmFSTFY2Nzl4SUJu?=
 =?utf-8?Q?25muCPiXFOU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE13eUR5Z2Q4TEFEbkJWV0FnTnFHNXFZUE84ODlaVXBOU2FEN3BYQkxpcUFS?=
 =?utf-8?B?eVk4UFQ4MjM4Z0V5T3hpSmVQUGovRThuVS91Y0dZd1lPc3pBOWVYTGtyRlY3?=
 =?utf-8?B?SFcyOEM5NVZENlRjbDBQbnJLQmFVTXRPTU85VUxDWm5oNUQyQWd0bUtYSDlM?=
 =?utf-8?B?RFZuaDV0QW5kdFBJYUcyR2h0Q1dQNG9kQTJzQk5PeGxJbW01SDVsdHF2V3F1?=
 =?utf-8?B?RmJNOWJQcWJ1TUcveTZsNTlHV0VJanJmTTNMc3hkcDA4ZmgxOW16YVpMbzBE?=
 =?utf-8?B?dzZUSVZET1BHV1Jkd1NVcVB4eStpMlJFc0ZJajVFZFh1V1p0VGd3ZlVxejJ5?=
 =?utf-8?B?M0FNUHRtL2Uwai9tMDhIUHMwc2hrNWNyRnhwSStCRjhZTnVOOHJFWG02VW9n?=
 =?utf-8?B?b0ZvQzh5Ulk0eVJLcEpzekhwMWxaNHZpbDZPMklzK1JkVTJkbnhWcDNOYUd1?=
 =?utf-8?B?emI1REZxZ2pYRjZaN2RxbTFOa1FjY0FhLzhVOFFQakptTEp4YjJVTitJanZ5?=
 =?utf-8?B?N3g3bk5XYVFjdm9NMy9LWDJXR2xyOVFYY1dKby8rd1dDdmtYbnF0QnAzMVBF?=
 =?utf-8?B?SDl5VlVUVmRBcHArNWZPUnkzbHBOeTVEdTZ4Z0FNczBRSmwwV25qSG5MOEt2?=
 =?utf-8?B?Myszdy8xTk1QSGkzQVJITExlYlJ5SjR2eEpRM0YwK1FOb09DVDdKTzFNQ1VX?=
 =?utf-8?B?blZTa2ltajViS01JZWk5OG1rTkZqVlROQUtGQXJwVTVCMUUyeDU2QXd6Uzdq?=
 =?utf-8?B?cGtlbU4vYnBoNkJhWGlFSnlNWGMxaWZLYmg2M0d2Y1lnN2pId2FwT2xlZjVn?=
 =?utf-8?B?WEkxVzA5cnVDQWlnNVN4WUQrM2VqVTVyVzlqc2IxUktkWDhXU2tRZU1ESzdm?=
 =?utf-8?B?eDdBY1Q0SWNtWWRHQnllbUdPZGJoSWxZaGpCQmdvWkdabnRLSG1sVHZmU3hJ?=
 =?utf-8?B?cmhDNUV1ZkdQSDFmeDVpRlZFZTBGL3VxSWlsYTRlTzRrZEFqeTkvZ0RRTXlV?=
 =?utf-8?B?N3k0SnhXcnAwY0VmTHM4OVppMmNkV0pEYitubVZnZ3BiUWYvMUNtNVA0T3Fz?=
 =?utf-8?B?c0hUa04xUHJUdnNBb3FnR1RJWHIvYW41VGZjK2NONVljeGVzN0pST2hlWE5p?=
 =?utf-8?B?Q0x0Sk1Idm1TTlpYNm95NDFId0xVZVdob0lPWUxjd1YzNVBITGlxZUxhRVE1?=
 =?utf-8?B?bldXYnJWeU9wanZ6N2NaeFZKTDBsWitVOGRGdXpmRHBlOVcwU0ZlR0FFT3lF?=
 =?utf-8?B?QklUNHZpTWZ5MWJrSzVuZjNEZ1pkbGJDY0NaRFFWc25MYU1KYnpEYTFncUFN?=
 =?utf-8?B?eVFXWUNiQ2g0VHdNNk5EUEw1Q2lTZFBSOHdZaENVVUFoSlZxTmpTTDBZaklI?=
 =?utf-8?B?VWlXU2txNWlDWFJKTW9PRk9jMVhGdVlaV1I1Zlh3dy9sSWZMTXBNbUpITFhH?=
 =?utf-8?B?dzVPVkdnbFY3ekJtemM3aVhSNy9KUU1BYi84dVdoa1BNYXdLNnZJYXc2MWEz?=
 =?utf-8?B?R3pMeXFMdDRWOUZ1S1ZPYkEvUVBiZUNKUHU5NC8wQVhPZWRpcnh6QWhXU3FQ?=
 =?utf-8?B?U1BpVGJQMkEzb3pSZEx1MUozNm1iK05iV2ZZTzhiU2xUNzN4Qnh0bEVGWHNm?=
 =?utf-8?B?ZUltUFBPL2VJbDhGbW91L3JWckdHRkt1ZEVmYy9hbk5oZCtXZGlMVmhzN3J4?=
 =?utf-8?B?bkpSVnV4cjhhS1RIaVpDVzJxWlZJOWQ4SFRsUm1zcXdIV3Nyb2dKa0JzSG9R?=
 =?utf-8?B?c3B0VFhvd1BOVUZyNHl0cGNsWmd2bUVrK21oWkhEeTIyZXl3blVqeVNmY2pK?=
 =?utf-8?B?TkhHOXlzV2h5cTBQVEhuUGFuMWp2SHBHNkFCYXNmOC9YYzEyOGVENE9LbUtS?=
 =?utf-8?B?VWoyWTgyVGI4TzRCZ20wbCtDbHJ6Y3J4UmJRRVdGM2hQa3dpbEhrY2V5Snd1?=
 =?utf-8?B?Z2lDNVBxdmEvOTR1N21KOTFscjlnTVhMSEorMlh0RUx5WWZHQWswS241VnVl?=
 =?utf-8?B?eUg2WUFYdHVUbEVuZ2ZMKzcrSVBmbjUzWUoxd3dYNXVTbzJjYXhpMVN1YUVs?=
 =?utf-8?B?NFJLZ2lQVlRoT0djVUdUT2ZnblpVRlhLa3QycXJtRmF2T2ZLazlVL2hrN0pP?=
 =?utf-8?Q?vXTEUUhn/auTzUjBZbqUHCTEp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 524597d9-7297-4523-85f7-08dd78f64234
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 12:42:02.5534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +flMOIqZc/kghNkicMnbWO7FBs4rHmjC/ICv3B51fVTZrpLBz58WddTGHEA6YJdT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5839
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

Hi Bastien,

Am 11.04.25 um 10:14 schrieb Bastien Curutchet:
> Hi Christian,
>
> On 4/11/25 9:30 AM, Christian König wrote:
>> Hi Thomas,
>>
>> Am 10.04.25 um 21:43 schrieb Thomas Petazzoni:
>>> Hello Christian,
>>>
>>> Thanks for your feedback!
>>>
>>> On Thu, 10 Apr 2025 18:29:12 +0200
>>> Christian König<christian.koenig@amd.com> wrote:
>>>
>>>>> Many UIO users performing DMA from their UIO device need to access the
>>>>> DMA addresses of the allocated buffers. There are out-of-tree drivers
>>>>> that allow to do it but nothing in the mainline.
>>>> Well that basically disqualifies this patch set in the first paragraph.
>>>>
>>>> To justify some kernel change we always need an in kernel user of the
>>>> interface, since this is purely for out-of-tree drivers this is a
>>>> no-go to begin with.
>>> I'm not sure to understand your comment here. This patch series is
>>> about extending the UIO interface... which is a user-space interface.
>>> So obviously it has no "in-kernel user" because it's meant to be used
>>> from user-space. Could you clarify what you meant here?
>>
>> Bastien wrote about "out-of-tree drivers" which is something the upstream kernel explicitly does not support.
>>
>
> Sorry maybe it wasn't clear, but what I meant is that the goal of this series is to replace 'out-of-tree drivers' with something upstream.

Ah! Yeah that wasn't really clear from the description.

But anyway please note that when you want to create new UAPI you need to provide an open source user of it. E.g. link to a repository or something similar in the covert letter should do it.

>> Well why do you then want to use DMA-buf in the first place? As far as I know what you describe can perfectly be done with the normal UIO memory management interfaces.
>>
>> DMA-buf is only interesting when you actually want to share something in between devices or between applications.
>>
>
> I wanted to use DMA-buf because it allows to dynamically allocate/release coherent buffers from userspace. UIO doesn't provide such interface.
> I'm aware that exposing DMA addresses to userspace isn't a good practice. That's why this series create a new heap specific to UIO that will be the only one implementing the new ioctl.

I don't know the UIO interfaces that well, but that is pretty clearly an abuse of DMA-buf and won't fly at all.

If you want coherent memory for your device you should use dma_alloc_coherent() for that.

Regards,
Christian.

>
>
> Best regards,
> Bastien
>
>
>

