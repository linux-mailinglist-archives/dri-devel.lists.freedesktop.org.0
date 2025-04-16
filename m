Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2477DA9070D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 16:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD30D10E964;
	Wed, 16 Apr 2025 14:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d3pzRBHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2043.outbound.protection.outlook.com [40.107.101.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B036D10E95B;
 Wed, 16 Apr 2025 14:55:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y839x7qV8S5zQS4iqRXetPBmHn61RfOGtP1ULNcKUovQipmwLBl3xRdfDPNKvyVNdhrbu4D2MSzESTU0QVPY+88N7NTCVTFIbUGb4o9023G+L/SF6gRQ4Ef3B616hjP1vS7u9cXvRuM6U4hJOmQw884DBla2vZTX5A7YdepWTgYydhELM5+489pbwTwFLCTgKskrLuT+CP1BsdMdproEMHSadzRAizJPyOLv1dKeAzbV/sTC9an4zl5WlEpRh4AcehLff3s2u8N9Bv0YmPtMJr94ZjRUfW6BS4zrV3iwMfkEnCmzxhb1H8iyeym6p/WmoYceGwT5Z9M9JVhjMfvOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CiZx5H2cpxqR/CzM0A2N7YTdeQA69MvixRQ47qYw79c=;
 b=wC2TAJtEvkBDVbCqPeWKwXPo2suglKrJm2DN0MblCZ574srXWwHKioXUCn7tggCDOeBYdxx7wVxqOmeGDPuK017XMewO4NN8lbZYeqvn14z0l5xJeU1HNqUcDepEiR0FCrmQWlcY2bIo0DSxJvfRGjhbPgwfuPOesu0Fqjhxv+E7UuIZTez9fV4MCa439dvDIT7NRIP4hfvmJybQYSe79Hp3cwBE8155fmMMxUYuKymQtkkHyJgKoNjRFWyHw60kkDjcQjsNekuVSbRU0pC+Sv0x05BRTO8gVvZM6DeV+KTvoOOqzqaeKi23I9jqcLMFgmw1PEI+8Xnn8MscGdsPTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CiZx5H2cpxqR/CzM0A2N7YTdeQA69MvixRQ47qYw79c=;
 b=d3pzRBHMJB9uGRsJpV7T2vaXXwI4zuD+KcZeoWOO7Oc35HbVghO9AD67d/gQPQ/mWk/fD7lJsbsUgAwOhLfDYeetSkV5G08b49C4P7mR1kCqQxxr9q8K8Nhtch/ma8tKjK8mp/StKLdd8MMYGY4EgwppwuzuBS9Zm0lJ9fof6F4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SJ5PPFFA661D690.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9ab) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 14:55:17 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Wed, 16 Apr 2025
 14:55:17 +0000
Content-Type: multipart/alternative;
 boundary="------------P0B0YtBHtcMoPnqsbor5cOxj"
Message-ID: <00d67957-e47f-4c7b-a700-c1324e3b03db@amd.com>
Date: Wed, 16 Apr 2025 20:25:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] drm: add macro drm_file_err to print process info
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250416133144.862023-1-sunil.khatri@amd.com>
 <87lds0p4jh.fsf@intel.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <87lds0p4jh.fsf@intel.com>
X-ClientProxiedBy: PN4P287CA0131.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b1::9) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|SJ5PPFFA661D690:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf31e32-e437-4d77-2344-08dd7cf6b369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b1NxVHF0S2NsVTN6QWsrczhVTHFXOENRR2xJbkVZMEZUeHlEZStPM3RpNEVG?=
 =?utf-8?B?MmpoMS9XSU12Z3I0dEluQXhUcjBrSkN6QmdtU2w3U2E1bU9pUm9aNzNaa1dJ?=
 =?utf-8?B?Smd1V1hvYzVzcXFiL1FzMVZ1a1pOWWNVUmQ5ejVtSE5aRWZwcStmOVBtejBG?=
 =?utf-8?B?VEhxNkNvelRlbVdMWVFyZktPRnIvR2RaR3k0T0xWZHZpSGY5eHhHdGdrRVEr?=
 =?utf-8?B?ZzAyOVJBb3hvb05kKzBwc3RHdGxBNXRPalIxOUNZOG1IUk9rRzYvM21RcnFj?=
 =?utf-8?B?S3l3eDU5c3RMQnJEeWVObStkWjdkMFBFejA0MDgvNkU3UjBpVzZLS3JyTXhl?=
 =?utf-8?B?ZkNCTzd1b256WTRTbmMxbFptRXJDNXRmbHhsdklVT0lwT0M2UnRqS09TSUtn?=
 =?utf-8?B?R3FYSklBWGhNRnE2RnNwR0RRZzcxTTdvTUphMVNSblZhWTE2ZTBRRW1HeG12?=
 =?utf-8?B?VzZvYmFqWVdBVTliQmFWVzI1aVpvQkE5TXpuWVd6OGFuS1ZGY3JNV2hURFdH?=
 =?utf-8?B?VTE0SmxLak81V1FDNDhBdEdsSTUxUVBnbHZrcUV2eWxWL1ZKL0VTZTZYanFa?=
 =?utf-8?B?SzI2OHZPb25yUGtpMmV4YWNvRDZNR21vRDVvTUtrSmpGWGpsUUpybGcyNzFD?=
 =?utf-8?B?RmlHTWRweTVaTkQ3bGRNMXlNS3ZBUjZPZkl3MmEybGE1RjdlMC9KR0RaeS8r?=
 =?utf-8?B?N2R6RUw5aXlheGErVHYyQ1ZsNSsraUNHVXdYeElEajFhWkJEREthTktRRGI0?=
 =?utf-8?B?aUlsN3hBOUtlUjVSSFVBL29IS0VEMHpoU0I2dURKNHBxcWJEM3U5WkhLTkw3?=
 =?utf-8?B?S01Qeks2c2Z3QkY5S05oZmgzNTRPYUltTHhSOXJxY0pWd0tMdHhtTU9CbTR6?=
 =?utf-8?B?RUlaRmpSREt6R2hNWXJsa2U4eC9TT09sZCtwTmtSdGxORmY1aHhiN2E1Znow?=
 =?utf-8?B?VzA4bW5vL0xjVXZ0VWNaek5WK1ZOMjNCMlMwOVZraTBCUE5sdUpLUFg2cE9m?=
 =?utf-8?B?bGhKSmFUNkNzNHY1MEhqK2RlL2YybGI5M1YvcXdGYVVtU2Eyd24rWGJxcVdO?=
 =?utf-8?B?YXYyYmpCeGh2bXB4WWlXMnl2TWx6Zm5zeEhWN2M5RGRzV0tXdWQ1dlRQbVRJ?=
 =?utf-8?B?VUpGS0l0UU9BVDcvd3lORnB0ZTJDMytMRHhaVWlDY2VvVStxaXd5SWtvSDVp?=
 =?utf-8?B?d0pBWldqZHpoMExlWXhLSjZkVjRsMkloRFlLOXJMZU1Ta0t3M1AwcGNxcjh5?=
 =?utf-8?B?d0xNWEVSSFkxLzI2bXkyRGV2c09sOWhPYWd4UUJub2tqc0NoM1hSS2YyeXNy?=
 =?utf-8?B?QVluR25MKyt5MmdTRFNnalhYbTl4OHo2aEJINC9IYzJDOFRmT2VjekdrZ2hU?=
 =?utf-8?B?SkhxM0tDdUdRZFErQkhNVG85dnN5NlhpOERSMXdBT0lKdDQxN3JaMXRwUFRC?=
 =?utf-8?B?MFhZa2pXZmpQWndKdEsxSnBzWFdONEtZS0JUMmxvZjdyTlVQRlFjUkVuUkF1?=
 =?utf-8?B?UVJSNEFtQmFDbXFrUENaYklUUk5rK3NTWUtSOXZGVUl0SHBzMG1VaW96RXpj?=
 =?utf-8?B?SzdYcnByRE5KWGFhc2llU1JCTWNzNGhZUVVNSExGQkV1ajlyTCtjWU5HamVv?=
 =?utf-8?B?Z3BjT0JtN3M3Smk4RHMvZERENjlHZU5Rb1E0aXRWTmRnN0Y5U1JnM0NBTlJj?=
 =?utf-8?B?SjNRUGVBYU5pVHdqaEZMc2x4YmRuOUNOZXA3UFI1Q2NQS3RMcnpySVZ0WS80?=
 =?utf-8?B?aU9McHV0c0ZHNzVHa2IzY2t0M1IvTXBxK09VcnFJWUI2b1JveGxTbGVCNUVN?=
 =?utf-8?B?VkdRTWU4SlY3KzZEN0JKYVVjVVBZcnJhRlZuaTF5TVdvUDkyRlFod21EdXhD?=
 =?utf-8?B?eHFiSU1sNnMrbEsvd1drVHhiNFFpSTkrZUtCenowYmM4OHBzVHFiTXYwakVm?=
 =?utf-8?Q?yqNH/5x8/TI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elFNNzA4L3FrRFRSUHRWNVlQamcra3V1SHIwRDBnTU11RkkxZ0hyVHJoVmdu?=
 =?utf-8?B?TkxISGhBcDhKQXVvMmJ0dGFlOGdnYUVnUDVYT2lBeUVuNjF3UEZCc1ZjZmY1?=
 =?utf-8?B?NWd4OGZ1d2dhT1J2a2JsMWNFanpCdCtpVlpzczNaRmxwT3cvU1pxRGdzUG9j?=
 =?utf-8?B?NDM0UXkzQXViTEVYY1k3bVFhNnlsY3d5Q3NiRENjM1pva05pZ0owMW5acFMx?=
 =?utf-8?B?Y1NBcnoydHZZZ0lHTC9NZllndFBCZmpuSVVTNmxnOW5MMzE2dlArdDl5RFRn?=
 =?utf-8?B?eWJKdXVOb0ZMbWRzSDBJZUNhdGdvblFwZm9IK2NMRzlnODR6Q09BUTh1TEpR?=
 =?utf-8?B?V2tVeEU0Z1VUYUNHK1N3TUE1ZWtoWExxOVJZWnBUVVJXdEgvK2VqeXJFT2Zo?=
 =?utf-8?B?YmgrbElzTWp4bXQ2QlBnakxDUmJ1dFlMYlhaTFhGQk5ybkdVUWJ6UmJWazJq?=
 =?utf-8?B?U25Zcnh4SDdOQm9IMHhZUHpMSU9OUGRzSHpaNGlPQ01mTWxOUFZUTzlXU25Z?=
 =?utf-8?B?ZTFKRHF1aWhoZDhFYlN3bkt6R2FDZkdYSkJjbG1ncWhXcUs0UFgvWHRoYWky?=
 =?utf-8?B?M09WVDBEZWFPNVc1OTUyNWQzdWxqaENJOHp0SHJNU2F0bng1WnhVM0t0OVE5?=
 =?utf-8?B?a0ZGYytKeUluREZJRmFnTHVZRzFWVzNoOEFIMVJjbFZjaUVocnBLNm5KeHYw?=
 =?utf-8?B?Zm5FbFEybXBnMXRGUEcwS0RuckZkeXFZbEJRdUNJME9uV3I2bHk1clhkUFhJ?=
 =?utf-8?B?ZS96c0o0YnlaYWdQWWk5bG4rSHhxc0t3cDdVQkc2NDlLdXNjdysrY3NWYTAv?=
 =?utf-8?B?MmwySGhrRTQyUEl2MndvVkRwVXUvK0lBTVpFZVZCcHQ1aDdlc29WRkF5bnM5?=
 =?utf-8?B?Sm5VK0Zzb2tIeFc5aGZzZHJvVTI5Q0wrYjNQbTRra2twdjZJdzlpWjl2dHBk?=
 =?utf-8?B?ZUZ4WHAvQUpaR21IdFhyY3ppK2JoZUtPVjFraHN0WjF4eVFsZC8xZ1lYZWNz?=
 =?utf-8?B?bGFBa2l3TjAvZ0UyY09pZmhiLzZELzI2clRiLzhaa2h1L2dZUC82UFpZckZE?=
 =?utf-8?B?Z1FsOWRlV3FVbW9rLzdHbUx2a1JoNGRrTG5kQ01Zb2xsM21Ka3J4c2V1RitK?=
 =?utf-8?B?bURqbUxzT3pnQ3hxalFSdG1hVG1zdWdpaHNHRDVkUHFsZ21KTHk5RVRmVndz?=
 =?utf-8?B?cFZFODI5bWplOW4yOG91VXFwZ0FzemVKRHhsZjQ3Y242RnlNODB6T3hTdlQw?=
 =?utf-8?B?Y1dyN2IxTUdzaWpaT0F3QnAwd1NVQkxNNVZnbHR0NXgxWGNlUGdJcU82OFh5?=
 =?utf-8?B?TDlrcWFFaGRwdkd1ZE1FeGxleGxGeGFwVS9FY3o2dkhnUitLME1wZjh6dy8z?=
 =?utf-8?B?YTk3aHpsclBFRzRmS0dKTDJqMnlrUEFvTlpwSkM0ZWM5Z1FScm81QWIxSldw?=
 =?utf-8?B?MTJGaUZpM3JkbnJ2Nm5yYmhjMUlhNUVhWEQvY3BYZVhBbmpDTElFUTltWXc0?=
 =?utf-8?B?NTYrWWFHQXdaa2dqWnRoTVNCcXFyOU1OK2poaStEQW5WSlRWRnpRcFo1NmR1?=
 =?utf-8?B?OWVoRUs0Yll6K3dtM0dURGhWMjJmWVloaHFMZEVmd01taFFNaWxjYTFXTXA2?=
 =?utf-8?B?aUlWV08xNXJjd0pMT1dZSnQ1TmJ4OTcwRzVZMHd0TkRJVTRDRklnUUt0UlFH?=
 =?utf-8?B?WDMvR3hTTW5pemdtYlB6MTdJbHEwVUwzYWFsYTUvZWhoaGZ3TXZKVWVuTGUv?=
 =?utf-8?B?UERQODdEeDV1bVl3SmozZEZQWm9EOE9SazNZMHd1S2k3VU10UW9iVXZ1N0NP?=
 =?utf-8?B?bWFSTEZ5RG1sRGU0L3VpQVJ1UW15aXRsMGVBRThLMm9pejhtR3VEbmlGdXFV?=
 =?utf-8?B?ZkZTeVN5ZjVPclZFaE5FL1dPd1lzRDVycjdKRnNHaTlEa2N1R1FZNm9nOUxO?=
 =?utf-8?B?eVJvMHF4YmhUYWNoait2ei9kVFJkMUJlRzFnLzVkQ1NseXgrS2tUZ2YrUWt1?=
 =?utf-8?B?cjZWZEkxcXRQdVptSExJSlp3VDlnV2crZGF0eFVkdnFyaEpxRmx5c2Q0MnR4?=
 =?utf-8?B?cVFYRnBLSkNvakFhMjBTTTU5RFRyK0t0WmZkTjJDQnBHaUJhdkN0UjRrQTd3?=
 =?utf-8?Q?8AsLZzxcr84Ak4uomgKUNwTKh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf31e32-e437-4d77-2344-08dd7cf6b369
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 14:55:17.3629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PXQFU9OEXOAfFmUHRhSKEwFJHZCfgHq8kRPunUREsAcv18khftl+F9cBGbiEpIaKvYeEz5Rm4aICgLHO7qcxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFFA661D690
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

--------------P0B0YtBHtcMoPnqsbor5cOxj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/16/2025 7:55 PM, Jani Nikula wrote:
> On Wed, 16 Apr 2025, Sunil Khatri<sunil.khatri@amd.com> wrote:
>> Add a drm helper macro which append the process information for
>> the drm_file over drm_err.
>>
>> Signed-off-by: Sunil Khatri<sunil.khatri@amd.com>
>> ---
>>   include/drm/drm_file.h | 41 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 94d365b22505..5ae5ad1048fb 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -37,6 +37,7 @@
>>   #include <uapi/drm/drm.h>
>>   
>>   #include <drm/drm_prime.h>
>> +#include <drm/drm_print.h>
> Not a fan of including drm_print.h everywhere that drm_file.h is
> included. We've been trying to get rid of this, and go the other
> way. It's really hard to manage dependencies when everything ends up
> including everything.

Sure, right thing to do, will update. Not sure why i added it, may be in 
initial versions needed that :)

regards Sunil

>>   
>>   struct dma_fence;
>>   struct drm_file;
>> @@ -446,6 +447,46 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
>>   	return file_priv->minor->type == DRM_MINOR_ACCEL;
>>   }
>>   
>> +static struct task_struct *drm_task_lock(struct drm_file *file_priv)
>> +					__attribute__((__maybe_unused));
> inline is the keyword you're missing here, and that's why you've had to
> add maybe unused...

I guess that's true. Let me try that and will make it inline if no warning.

Regards
Sunil

>
>> +static struct task_struct *drm_task_lock(struct drm_file *file_priv)
>> +{
>> +	struct task_struct *task;
>> +	struct pid *pid;
>> +
>> +	mutex_lock(&file_priv->client_name_lock);
>> +	rcu_read_lock();
>> +	pid = rcu_dereference(file_priv->pid);
>> +	task = pid_task(pid, PIDTYPE_TGID);
>> +	return task;
>> +}
>> +
>> +static void drm_task_unlock(struct drm_file *file_priv) __attribute__((__maybe_unused));
>> +static void drm_task_unlock(struct drm_file *file_priv)
>> +{
>> +	rcu_read_unlock();
>> +	mutex_unlock(&file_priv->client_name_lock);
>> +}
> ...but *why* are you inlining these? To make this header self-contained,
> I think you'd need to add maybe sched.h, pid.h, rcupdate.h, mutex.h, or
> something. I consider static inlines actively harmful if they force you
> to pull in a lot of other headers.

It builds and works well and i dont see the need to sched.h and etc. I 
dont see which function you mean by inlining here, mind to share which 
functions ?

Regards Sunil Khatri

>
>> +/**
>> + * drm_file_err - Fill info string with process name and pid
>> + * @file_priv: context of interest for process name and pid
>> + * @fmt: prinf() like format string
>> + *
>> + * This update the user provided buffer with process
>> + * name and pid information for @file_priv
>> + */
>> +#define drm_file_err(file_priv, fmt, ...)						\
>> +	do {										\
>> +		struct task_struct *task;						\
>> +		struct drm_device *dev = file_priv->minor->dev;				\
>> +											\
>> +		task = drm_task_lock(file_priv);					\
>> +		drm_err(dev, "comm: %s pid: %d client: %s " fmt,			\
>> +			task ? task->comm : "", task ? task->pid : 0,			\
>> +			file_priv->client_name ?: "Unset", ##__VA_ARGS__);		\
>> +		drm_task_unlock(file_priv);						\
>> +	} while (0)
>> +
> For that matter, why is *this* inline? For debugs it makes a little more
> sense when it adds the function, but drm_err() doesn't.

Not getting to know which function again you mean inline here ?

Regards
Sunil Khatri

>
> Make all of these real functions, no need to include drm_print.h, and
> everything is better.
Sure i will do that and thanks a lot for those inputs.
>
> BR,
> Jani.
>
>>   void drm_file_update_pid(struct drm_file *);
>>   
>>   struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
--------------P0B0YtBHtcMoPnqsbor5cOxj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/16/2025 7:55 PM, Jani Nikula
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87lds0p4jh.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">On Wed, 16 Apr 2025, Sunil Khatri <a class="moz-txt-link-rfc2396E" href="mailto:sunil.khatri@amd.com">&lt;sunil.khatri@amd.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Add a drm helper macro which append the process information for
the drm_file over drm_err.

Signed-off-by: Sunil Khatri <a class="moz-txt-link-rfc2396E" href="mailto:sunil.khatri@amd.com">&lt;sunil.khatri@amd.com&gt;</a>
---
 include/drm/drm_file.h | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 94d365b22505..5ae5ad1048fb 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -37,6 +37,7 @@
 #include &lt;uapi/drm/drm.h&gt;
 
 #include &lt;drm/drm_prime.h&gt;
+#include &lt;drm/drm_print.h&gt;
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Not a fan of including drm_print.h everywhere that drm_file.h is
included. We've been trying to get rid of this, and go the other
way. It's really hard to manage dependencies when everything ends up
including everything.
</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">Sure, right thing to do, will update. Not sure why i added it, may be in initial versions needed that :)</span></p>
    <p><span style="white-space: pre-wrap">regards
Sunil
</span></p>
    <blockquote type="cite" cite="mid:87lds0p4jh.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:87lds0p4jh.fsf@intel.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 
 struct dma_fence;
 struct drm_file;
@@ -446,6 +447,46 @@ static inline bool drm_is_accel_client(const struct drm_file *file_priv)
 	return file_priv-&gt;minor-&gt;type == DRM_MINOR_ACCEL;
 }
 
+static struct task_struct *drm_task_lock(struct drm_file *file_priv)
+					__attribute__((__maybe_unused));
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
inline is the keyword you're missing here, and that's why you've had to
add maybe unused...</pre>
    </blockquote>
    <p>I guess that's true. Let me try that and will make it inline if
      no warning. <br>
    </p>
    <p>Regards<br>
      Sunil<br>
    </p>
    <blockquote type="cite" cite="mid:87lds0p4jh.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+static struct task_struct *drm_task_lock(struct drm_file *file_priv)
+{
+	struct task_struct *task;
+	struct pid *pid;
+
+	mutex_lock(&amp;file_priv-&gt;client_name_lock);
+	rcu_read_lock();
+	pid = rcu_dereference(file_priv-&gt;pid);
+	task = pid_task(pid, PIDTYPE_TGID);
+	return task;
+}
+
+static void drm_task_unlock(struct drm_file *file_priv) __attribute__((__maybe_unused));
+static void drm_task_unlock(struct drm_file *file_priv)
+{
+	rcu_read_unlock();
+	mutex_unlock(&amp;file_priv-&gt;client_name_lock);
+}
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
...but *why* are you inlining these? To make this header self-contained,
I think you'd need to add maybe sched.h, pid.h, rcupdate.h, mutex.h, or
something. I consider static inlines actively harmful if they force you
to pull in a lot of other headers.
</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">It builds and works well and i dont see the need to sched.h and etc. I dont see which function you mean by inlining here, mind to share which functions ?</span></p>
    <p><span style="white-space: pre-wrap">Regards
Sunil Khatri
</span></p>
    <blockquote type="cite" cite="mid:87lds0p4jh.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+/**
+ * drm_file_err - Fill info string with process name and pid
+ * @file_priv: context of interest for process name and pid
+ * @fmt: prinf() like format string
+ *
+ * This update the user provided buffer with process
+ * name and pid information for @file_priv
+ */
+#define drm_file_err(file_priv, fmt, ...)						\
+	do {										\
+		struct task_struct *task;						\
+		struct drm_device *dev = file_priv-&gt;minor-&gt;dev;				\
+											\
+		task = drm_task_lock(file_priv);					\
+		drm_err(dev, &quot;comm: %s pid: %d client: %s &quot; fmt,			\
+			task ? task-&gt;comm : &quot;&quot;, task ? task-&gt;pid : 0,			\
+			file_priv-&gt;client_name ?: &quot;Unset&quot;, ##__VA_ARGS__);		\
+		drm_task_unlock(file_priv);						\
+	} while (0)
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
For that matter, why is *this* inline? For debugs it makes a little more
sense when it adds the function, but drm_err() doesn't.</pre>
    </blockquote>
    <p>Not getting to know which function again you mean inline here ? <br>
    </p>
    <p>Regards<br>
      Sunil Khatri<br>
    </p>
    <blockquote type="cite" cite="mid:87lds0p4jh.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">

Make all of these real functions, no need to include drm_print.h, and
everything is better.</pre>
    </blockquote>
    Sure i will do that and thanks a lot for those inputs.<br>
    <blockquote type="cite" cite="mid:87lds0p4jh.fsf@intel.com">
      <pre wrap="" class="moz-quote-pre">

BR,
Jani.

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> void drm_file_update_pid(struct drm_file *);
 
 struct drm_minor *drm_minor_acquire(struct xarray *minors_xa, unsigned int minor_id);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------P0B0YtBHtcMoPnqsbor5cOxj--
