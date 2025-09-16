Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F59B597D9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 15:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D61E10E7E2;
	Tue, 16 Sep 2025 13:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0cWUqWvZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011022.outbound.protection.outlook.com [52.101.62.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979C110E7E2
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 13:38:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwE/gPqdgmi2umBGO7Hy03e3YcdaQsvKX+ydaHhS0NzQDqBzsJmQAW3OUAUQZ4j1ar2klChJIRbjuO8JdZZI0LEILdaWZOhtXmIHmh3SUlMA1gNTNSdsUuigwOuezTYVdsSJOCdzdonSI612p1MeAOuPagTPL7CZJ6J+asgGmq7qDjamKrhg7rBuUhkCeVvH3X3WObOfGKixZSvlK4QxjEMMd6mHYMpA/H2+02EraMfjFGU4vctYckHE9EEqI7aTsAAMqMqAV4TxuPqrSRVgM0mNmz3sck5EFd+N1TVmdNfVs0OZBd+vp7DNlVFqsFgsPBBcmwBws6RJj/Z54dsG2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9MHyEchwbyOv/2zODBoYqGW1Kzxb3YWntDSqWSTBLA=;
 b=ZBvSwbH3aA1+KTOmXk/UxunwCh+Akmr45Aw5aMYroX90nucDLb2WHnz6Lv2ENa2ZHqwy5JsV1IM/ypHiH2O/b4UyO9CgRbfnVbaIab/bY0cYvO1L+GxSXNyeummZtVGZI4Uwoua/5XJjsAyqkazRl7c2aNISRscYxhLSuIP4HgTLCossoNA8RYjWGT6uvWQPrw7ArpXe0GClzNHkh8ntNbH3pLkf5Ip8PfXVC8pI2uVdHCjfFQ0lEjsntYjN4aa2HHdKNZzSLLtwXuCJL0VAYk3bwHld++71u0sxSz6I9XXQ6mfVgXNovhhhEMsW9s6SyxBZ8llzpEjsJZ8Qj8dp2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9MHyEchwbyOv/2zODBoYqGW1Kzxb3YWntDSqWSTBLA=;
 b=0cWUqWvZqK4l6Hdyz7B+jW0v49kX4BTt2r7IBiJKBoRXhZmPRQJoKIUpadMhIULCJ6F1f8o+5pe26RTaMjq2Ld5rbB/hkOXD9Y3RvCcW7SSfRvhIAwz8ubcmuyXkNWZnyJchrYque3pTigZClb9mLeIeB6F/Xo6SiRJqDZ5amyQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6130.namprd12.prod.outlook.com (2603:10b6:930:26::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 13:38:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 13:38:23 +0000
Message-ID: <201ca522-a719-44af-950b-50c82758a3c0@amd.com>
Date: Tue, 16 Sep 2025 15:38:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: rename ttm_bo_put to _fini v3
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.brost@intel.com, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>
References: <20250909144311.1927-1-christian.koenig@amd.com>
 <60ec3476-d141-4900-b87c-5135da6cfdd6@amd.com>
 <76698330f118d2747becab6615f4bfb5caf9e094.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <76698330f118d2747becab6615f4bfb5caf9e094.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0234.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7d8519-dd82-4e3b-1502-08ddf5264e86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVo3cTVCRVdqeFdwSVFBNU1VWldwZUx5aWM3Y295N0loeTRBQWkwQVBNY0hr?=
 =?utf-8?B?UTk2QnFpdGpkTlhjN1hsR0g1UzJGZWF1WDFmNTVPTm5jMXpNdkRrM0pCdVFm?=
 =?utf-8?B?dHF3am1ydHc1R0NJK0llZnJlYWlINzlJY2w5RlgrcDBGV2oxaGZHL1k2ZXJ3?=
 =?utf-8?B?aG1mSm5vMFhTcjQweXVSRkdPeG8rdzU5eGN6RUVPejI3NnU1ZFZHOVJJYnpk?=
 =?utf-8?B?eFRnczdEV0VVRFNLczc3ZjlxT1FMMGhUN1gxZ1FUN0RST3Q1UkRMWmRWakNx?=
 =?utf-8?B?ejhaVFJvdElWUmRXcmRGYktGWjZ6YWJlMHpvMEhzZUlVNmVJMk4wVUFWTnBR?=
 =?utf-8?B?UlZXekh5bnlEYWdyTDNSdUVFSlZZT2ZQODJOYVhpMDVqVUc5R2VOb0ozeU9t?=
 =?utf-8?B?Smx3Zm1NcGVERSswZjFpNTVYc2ZXU0hwZzlXYU9qSHo5NjFWYno0MUZ0Mjd5?=
 =?utf-8?B?T21IVVRRQTR1UkNNdkFnY0lna2Jlc2ZCc2VGcU0zYXhkVzdEYnVZYWNGeGhu?=
 =?utf-8?B?elRrRWk3YVdwbUNUSnUva0ZYaW1oWW13ZXNuYnJ1NnI3ektnSmVzSUkwWCtn?=
 =?utf-8?B?QjRVb2E0ZzhkSy9vb2UzdFdrcTc2bWtQUkZlUnc2cHZZeFdNZnVSbkV6bTFi?=
 =?utf-8?B?ak9uZUsvbFRBOWgrSUpUcTJZUmJacTBTa2t5aHhHU1JRbTNaakM1ZlJaWG5h?=
 =?utf-8?B?OG1QeGtZN2hsWExBNzlYMmFJMVcwdHRRWVFxMkRhQkNEUkU1NHJJcEpSeGRJ?=
 =?utf-8?B?YnNRUllsZXpSVThDOU04d1Z0VG9JMjRPbHM1QjREa2x4R1lXbUdaSURUUHB3?=
 =?utf-8?B?SFJIbGpEUExqUXNhdnVpRkJwUDNtdlVzL2FIOFQrZ3VDY2hmZlowRWUvSVk1?=
 =?utf-8?B?STdpNjg4eEoxS0xHWSsrRllZaVgxN1I4a2hmMWZ0aURwRE0wWWM5R2twcSs3?=
 =?utf-8?B?S2ZUdmQ1L01ocDA0NklmQmNrN3JMakd4bHpra1BROEdmV3gvT2tOU0lDdDJu?=
 =?utf-8?B?eDNFR0VDMjY5MjViN2VRNlJSMjYzVnl2TjIzZFBsQTRJWFZLa0t1RkJ2YnlC?=
 =?utf-8?B?c0dDZHZ0amkzck1Ga1kvOU0ybTJtNkpiYjl4cmx0Z0ZnODFwNUc1M05zckcx?=
 =?utf-8?B?aUFrcjdYeU9hUHAxVHllUGd5RithWTNDN2dkYXlZZXNFK2pEZWlQZEpRZWZS?=
 =?utf-8?B?c2pGM3ZQUFVRZytUamRSRC85b1lVRG1WMkxKNFJuT3d3bjc5MmVLbFJ5Zkdo?=
 =?utf-8?B?UmtnZXJ1N0pXQW9KUldXUlRLNXUvWDJYZzgzZVlOM0RuUHoraUovRGtsaWZL?=
 =?utf-8?B?Z3l4blIzQzBCZEFaZlJrTTdBQkpGVW9mT2dqd0sxV2d4ZDhEOEswQ2tmdlRo?=
 =?utf-8?B?b3kxRWIyOUxBSktDVCtGRlRNUjNDd0dCNDlGalZtOXlwYmFvN1VRRFVZV3RB?=
 =?utf-8?B?V3J4cUIrVGg0aU5DSXVOdDJPaTA4a1EzRkdGTjU2T2pjdHBLU0ZqKzRkaWZQ?=
 =?utf-8?B?VEZoQ3p1bHdmZHhINlNqbVpna25oZ2VGYVM3QnhHRWFqSTh1MTdOZkhUM09J?=
 =?utf-8?B?OWdoakt6VnJQREhrQXB5MndwS3NheVE2U1g1c1hpWW1vMTc3L01acmYwcVFo?=
 =?utf-8?B?TU1yL3pzNFNFL1FWZFp0Nm8wKzdpRmZQVFhpOGpNeXlzbHN0MjhjQlJtZUFa?=
 =?utf-8?B?bjZKUGNtNUlQT3M4c3laenhkakNmUzZCYWhNQXdrdXJiSXBSSmE0eU5YRE04?=
 =?utf-8?B?UStpbksrZ2g0VWNFOUxCS2hQeTJ2eXh4dkE4ejh0QlU5a1Y1cmdsVC9pZGVH?=
 =?utf-8?B?ZzE3MnI5dWNNRDdOeHZodnd6dlhacngyTlRvb2NmdTQxTkJzcXBEaHJIZlJK?=
 =?utf-8?B?NzJPY09DRDFGVGtvZzgwSkVuV1hJZXc1czhHUGx1cEZBM3RYaFU1VWc3TU1N?=
 =?utf-8?Q?o3WOm+MkeY8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjVaWWhmNkx6bHZ0SHo2REZEaWRneVNCTEFCNGRMLzU4OUo5YU9ydXF5RWpH?=
 =?utf-8?B?bE9YU1lzbjRaMG1RUDZiVWF1azZwWGtFVTR3YlUyUTE1YVhscTV3S21acDh1?=
 =?utf-8?B?eGVPOEtWYk9sMGZGNlB0U3BVRkdVMjNiRk1jWlgyaG94cFhwbWlwUDF2REdD?=
 =?utf-8?B?NVBISFJWbDFFcWRycDMwSGdFWDROZkVIUXF6d0lzVGdySTV1QW8rS2VDSytK?=
 =?utf-8?B?UWNTQ0o2cmZYODRrL1ZzSGdKRHFFdHhpZDczT0tVMkYrRGdzL21jdG4zU2Vp?=
 =?utf-8?B?YlZaeXZLK1d1L2JEKzNEQ0J0NlNqZGlZUi9SNVJoWmpuZ3IxcjNGQy9yY0h1?=
 =?utf-8?B?K3lLU3RQRGVwLzQ0bFdhaml0cXNSNFZCc3BBRExCci9NYnJqcCs3b3FJb21l?=
 =?utf-8?B?MEdnVjI0SUlEMWE1SE9HdVlzRDlZUDE1RGkwdlVuMzBNRHlpTk1NUEtjWU8w?=
 =?utf-8?B?ZWpvZzQ5aVRZQnpBMDh2YXl5Qnpna2xBNmpYU3dQQjhhVlpNazJJaEgvOGw5?=
 =?utf-8?B?L3Rnb0N2Q09TNHBqamNUeWMyVkNNVG1LampNZUpUZHh5NWxYNHh1djdDcmV4?=
 =?utf-8?B?dy8yY2ZUN0ZYWUVIZEZ2RVZ6MVArb3hiekRrTmphQktvaFBkekZ1c1ZCaTgw?=
 =?utf-8?B?RFVJN0d2YjRoZjZqZTZkVnViNWpORUZMS1VJQkVLckQ2ZUx1NENySG5OOWF3?=
 =?utf-8?B?di9HbUZkUXVXZUdNbnRVZ01vSDQ3YzVvRDNtbmN6N1lVekRHdW9ReVFrWVY2?=
 =?utf-8?B?c2tQNjhZYkdkczhTOU9kUlF5eG5mbFJWVFBaM1JLRGMwa2ROM05qSzA5dUdJ?=
 =?utf-8?B?TzNXL1kwY1VDWkVvZ3pwSDRBZEdNNUVnWGl3NjE3UXU1U0tLZ1NQRVVwaith?=
 =?utf-8?B?Tzh1QmpvNDFTQ1EzU05oL1haMzdXZ2k5MS9ReTJVOW9lRUF4VWYvUkQrczNo?=
 =?utf-8?B?SjZZRXRCNjRIN0d4SVVKL1EycEZQWDVSeEpNWXE2NVdxS2VPV3lUVG1OOU9s?=
 =?utf-8?B?eG5FMW5uYzNWMGZPWE1xbzRYMkxMK3U4UVZEMXZyTGpoMFgxQ2NBQ2RSOWpG?=
 =?utf-8?B?eTUxTnBycHVCVmg3N2JtT3FNZ05LUjZlaVBERnpYcUZaUVhYUDlGZmJxWlFj?=
 =?utf-8?B?ajJzZ2VMY2c4dWlDcm1mWU44a0V6VExHbE5XYmlVaE5BRERUWHhQcWdqUkd5?=
 =?utf-8?B?d1hIamRTczBKZ1NLNVpwRzVxZExtMW5JUkUvOEwwRGhxU3k2dkdmS1JIMTVW?=
 =?utf-8?B?TjhjNUE5UCtEVi9vWmM0a2hCNFdlZVNyc0pBQ3pTOE5xdnhUVWJGeFhJbjdN?=
 =?utf-8?B?Nm5tbk9FbXdFMlRpOW9VQmJXZ05FeXhZa2REdTBEZGZXeThrUG95Z1FtVDA3?=
 =?utf-8?B?QUJWUCtsWWY4ckJ2YXJWTWFQSFBnZTJ6RUdoWDZSVU1DdW56a0ZKcmNMU3Rk?=
 =?utf-8?B?Mnl6YTRvaTFnbDhLMlNwbDdiNnc2SmwzbWg5RzZmKzNpNmJGM1JNN3ZpZ2Ni?=
 =?utf-8?B?N0dkajFkYUMydmRseDAvWjZzVGtZU2s5NFZlU3czcTZ4ck5IVXVoNnFaTngz?=
 =?utf-8?B?c2pCQTJRZWljRituQ2xYQkFsWElSeXFLRU50RXhpbUFVL0xLeDV4RzlnYVdv?=
 =?utf-8?B?YjIvZDljQ3VQQ29WS3RMRml5OEpJNlgwZ3V3V3hqdXNHMFBYVklTWUJoYnVn?=
 =?utf-8?B?d3RzaEQzYm5yUy81dE95eVU3L09WKzRHbjR2UVNtc1VPSElGRHNBMjZCT1Fn?=
 =?utf-8?B?eWRhV2ZPQWdKSTJwY01hTzJvd1o0eWRicDV0aGV4YjNLMXVqMXRiTzB2S1Z5?=
 =?utf-8?B?bGhWWEtDZXgvNUVmMXU2a1ZacWVDVW5CRnRjc0lPQ1A5Rm5NVFJ0Y2lnQnNX?=
 =?utf-8?B?SzRDNCs2YXljSnd2WjlRN2VhUDVscm5aVjF5cTNvYzFTRHZBc0hkNjBab3Ns?=
 =?utf-8?B?M0d3U2VmVzJYVVhBOG5QL2VyY1F3cFU4M3FuWFlnV1VIbTZmTlVPdWtISFcv?=
 =?utf-8?B?N1VtVEZ0SzBsSCsrZGNkTVFPTjF1ZG9ndkJyQy8rcXN3QXhUclhRL1RpRnFI?=
 =?utf-8?B?YXZySVVLMWN4eVdzRk1KTjJhQ2plUHI0SG5qK0FZY2ZZS1ltSmFKSTNEbStw?=
 =?utf-8?Q?fpHKtGWTYAKaBkGCwZE2Qqifc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7d8519-dd82-4e3b-1502-08ddf5264e86
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 13:38:23.4096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iM35LsxdcZvNaD9EXQ7qjk7WlgqLWhtmBEwUOp39+tNnKgGLAQC97IIlLBC1rNZC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6130
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

On 11.09.25 19:20, Thomas Hellström wrote:
> Hi, Christian,
> 
> On Thu, 2025-09-11 at 12:56 +0200, Christian König wrote:
>> Gentle ping. Thomas can I get an ack on this?
>>
> 
> Sorry for the delay. When I initially saw it i decide to give it some
> time for CI but now I can't find it there.
> 
> Anyway, for the xe driver
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> 
> The i915 driver maintainers probably want to ack this separately for
> the i915 driver.

@People on CC can I get an ack to merge this through drm-misc-next?

It's just a rename of the function without any intentional functional change.

> I'll see if I can forward this so it's run on i915 and xe CI.

Did that yielded any result? My educated guess is that the automated rename should always work, but better safe than sorry.

Thanks,
Christian.

> 
> /Thomas
> 
> 
> 
>> It's just a rename with no intended technical change.
>>
>> Thanks,
>> Christian.
>>
>> On 09.09.25 16:43, Christian König wrote:
>>> Give TTM BOs a separate cleanup function.
>>>
>>> No funktional change, but the next step in removing the TTM BO
>>> reference
>>> counting and replacing it with the GEM object reference counting.
>>>
>>> v2: move the code around a bit to make it clearer what's happening
>>> v3: fix nouveau_bo_fini as well
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  2 +-
>>>  drivers/gpu/drm/drm_gem_vram_helper.c         |  6 +-
>>>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  4 +-
>>>  drivers/gpu/drm/loongson/lsdc_gem.c           |  2 +-
>>>  drivers/gpu/drm/nouveau/nouveau_bo.h          |  2 +-
>>>  drivers/gpu/drm/nouveau/nouveau_gem.c         |  2 +-
>>>  drivers/gpu/drm/qxl/qxl_gem.c                 |  2 +-
>>>  drivers/gpu/drm/radeon/radeon_gem.c           |  2 +-
>>>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 12 ++--
>>>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 60 +++++++++------
>>> ----
>>>  drivers/gpu/drm/ttm/ttm_bo.c                  | 15 +++--
>>>  drivers/gpu/drm/ttm/ttm_bo_internal.h         |  2 +
>>>  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c           |  2 +-
>>>  drivers/gpu/drm/xe/xe_bo.c                    |  2 +-
>>>  include/drm/ttm/ttm_bo.h                      |  2 +-
>>>  15 files changed, 59 insertions(+), 58 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> index 6626a6e64ff5..0a5b204086f3 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>> @@ -198,7 +198,7 @@ static void amdgpu_gem_object_free(struct
>>> drm_gem_object *gobj)
>>>  	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
>>>  
>>>  	amdgpu_hmm_unregister(aobj);
>>> -	ttm_bo_put(&aobj->tbo);
>>> +	ttm_bo_fini(&aobj->tbo);
>>>  }
>>>  
>>>  int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned
>>> long size,
>>> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c
>>> b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> index b04cde4a60e7..90760d0ca071 100644
>>> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
>>> @@ -107,7 +107,7 @@ static const struct drm_gem_object_funcs
>>> drm_gem_vram_object_funcs;
>>>  
>>>  static void drm_gem_vram_cleanup(struct drm_gem_vram_object *gbo)
>>>  {
>>> -	/* We got here via ttm_bo_put(), which means that the
>>> +	/* We got here via ttm_bo_fini(), which means that the
>>>  	 * TTM buffer object in 'bo' has already been cleaned
>>>  	 * up; only release the GEM object.
>>>  	 */
>>> @@ -234,11 +234,11 @@ EXPORT_SYMBOL(drm_gem_vram_create);
>>>   * drm_gem_vram_put() - Releases a reference to a VRAM-backed GEM
>>> object
>>>   * @gbo:	the GEM VRAM object
>>>   *
>>> - * See ttm_bo_put() for more information.
>>> + * See ttm_bo_fini() for more information.
>>>   */
>>>  void drm_gem_vram_put(struct drm_gem_vram_object *gbo)
>>>  {
>>> -	ttm_bo_put(&gbo->bo);
>>> +	ttm_bo_fini(&gbo->bo);
>>>  }
>>>  EXPORT_SYMBOL(drm_gem_vram_put);
>>>  
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> index 1f4814968868..57bb111d65da 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> @@ -1029,7 +1029,7 @@ static void i915_ttm_delayed_free(struct
>>> drm_i915_gem_object *obj)
>>>  {
>>>  	GEM_BUG_ON(!obj->ttm.created);
>>>  
>>> -	ttm_bo_put(i915_gem_to_ttm(obj));
>>> +	ttm_bo_fini(i915_gem_to_ttm(obj));
>>>  }
>>>  
>>>  static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>>> @@ -1325,7 +1325,7 @@ int __i915_gem_ttm_object_init(struct
>>> intel_memory_region *mem,
>>>  	 * If this function fails, it will call the destructor,
>>> but
>>>  	 * our caller still owns the object. So no freeing in the
>>>  	 * destructor until obj->ttm.created is true.
>>> -	 * Similarly, in delayed_destroy, we can't call
>>> ttm_bo_put()
>>> +	 * Similarly, in delayed_destroy, we can't call
>>> ttm_bo_fini()
>>>  	 * until successful initialization.
>>>  	 */
>>>  	ret = ttm_bo_init_reserved(&i915->bdev,
>>> i915_gem_to_ttm(obj), bo_type,
>>> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c
>>> b/drivers/gpu/drm/loongson/lsdc_gem.c
>>> index a720d8f53209..22d0eced95da 100644
>>> --- a/drivers/gpu/drm/loongson/lsdc_gem.c
>>> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
>>> @@ -57,7 +57,7 @@ static void lsdc_gem_object_free(struct
>>> drm_gem_object *obj)
>>>  	struct ttm_buffer_object *tbo = to_ttm_bo(obj);
>>>  
>>>  	if (tbo)
>>> -		ttm_bo_put(tbo);
>>> +		ttm_bo_fini(tbo);
>>>  }
>>>  
>>>  static int lsdc_gem_object_vmap(struct drm_gem_object *obj, struct
>>> iosys_map *map)
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h
>>> b/drivers/gpu/drm/nouveau/nouveau_bo.h
>>> index d59fd12268b9..6c26beeb427f 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_bo.h
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
>>> @@ -57,7 +57,7 @@ nouveau_bo(struct ttm_buffer_object *bo)
>>>  static inline void
>>>  nouveau_bo_fini(struct nouveau_bo *bo)
>>>  {
>>> -	ttm_bo_put(&bo->bo);
>>> +	ttm_bo_fini(&bo->bo);
>>>  }
>>>  
>>>  extern struct ttm_device_funcs nouveau_bo_driver;
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> index 690e10fbf0bd..395d92ab6271 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
>>> @@ -87,7 +87,7 @@ nouveau_gem_object_del(struct drm_gem_object
>>> *gem)
>>>  		return;
>>>  	}
>>>  
>>> -	ttm_bo_put(&nvbo->bo);
>>> +	ttm_bo_fini(&nvbo->bo);
>>>  
>>>  	pm_runtime_mark_last_busy(dev);
>>>  	pm_runtime_put_autosuspend(dev);
>>> diff --git a/drivers/gpu/drm/qxl/qxl_gem.c
>>> b/drivers/gpu/drm/qxl/qxl_gem.c
>>> index fc5e3763c359..d26043424e95 100644
>>> --- a/drivers/gpu/drm/qxl/qxl_gem.c
>>> +++ b/drivers/gpu/drm/qxl/qxl_gem.c
>>> @@ -39,7 +39,7 @@ void qxl_gem_object_free(struct drm_gem_object
>>> *gobj)
>>>  	qxl_surface_evict(qdev, qobj, false);
>>>  
>>>  	tbo = &qobj->tbo;
>>> -	ttm_bo_put(tbo);
>>> +	ttm_bo_fini(tbo);
>>>  }
>>>  
>>>  int qxl_gem_object_create(struct qxl_device *qdev, int size,
>>> diff --git a/drivers/gpu/drm/radeon/radeon_gem.c
>>> b/drivers/gpu/drm/radeon/radeon_gem.c
>>> index f86773f3db20..18ca1bcfd2f9 100644
>>> --- a/drivers/gpu/drm/radeon/radeon_gem.c
>>> +++ b/drivers/gpu/drm/radeon/radeon_gem.c
>>> @@ -86,7 +86,7 @@ static void radeon_gem_object_free(struct
>>> drm_gem_object *gobj)
>>>  
>>>  	if (robj) {
>>>  		radeon_mn_unregister(robj);
>>> -		ttm_bo_put(&robj->tbo);
>>> +		ttm_bo_fini(&robj->tbo);
>>>  	}
>>>  }
>>>  
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>> b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>> index 6c77550c51af..5426b435f702 100644
>>> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>> @@ -379,7 +379,7 @@ static void ttm_bo_unreserve_bulk(struct kunit
>>> *test)
>>>  	dma_resv_fini(resv);
>>>  }
>>>  
>>> -static void ttm_bo_put_basic(struct kunit *test)
>>> +static void ttm_bo_fini_basic(struct kunit *test)
>>>  {
>>>  	struct ttm_test_devices *priv = test->priv;
>>>  	struct ttm_buffer_object *bo;
>>> @@ -410,7 +410,7 @@ static void ttm_bo_put_basic(struct kunit
>>> *test)
>>>  	dma_resv_unlock(bo->base.resv);
>>>  	KUNIT_EXPECT_EQ(test, err, 0);
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  }
>>>  
>>>  static const char *mock_name(struct dma_fence *f)
>>> @@ -423,7 +423,7 @@ static const struct dma_fence_ops
>>> mock_fence_ops = {
>>>  	.get_timeline_name = mock_name,
>>>  };
>>>  
>>> -static void ttm_bo_put_shared_resv(struct kunit *test)
>>> +static void ttm_bo_fini_shared_resv(struct kunit *test)
>>>  {
>>>  	struct ttm_test_devices *priv = test->priv;
>>>  	struct ttm_buffer_object *bo;
>>> @@ -463,7 +463,7 @@ static void ttm_bo_put_shared_resv(struct kunit
>>> *test)
>>>  	bo->type = ttm_bo_type_device;
>>>  	bo->base.resv = external_resv;
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  }
>>>  
>>>  static void ttm_bo_pin_basic(struct kunit *test)
>>> @@ -616,8 +616,8 @@ static struct kunit_case ttm_bo_test_cases[] =
>>> {
>>>  	KUNIT_CASE(ttm_bo_unreserve_basic),
>>>  	KUNIT_CASE(ttm_bo_unreserve_pinned),
>>>  	KUNIT_CASE(ttm_bo_unreserve_bulk),
>>> -	KUNIT_CASE(ttm_bo_put_basic),
>>> -	KUNIT_CASE(ttm_bo_put_shared_resv),
>>> +	KUNIT_CASE(ttm_bo_fini_basic),
>>> +	KUNIT_CASE(ttm_bo_fini_shared_resv),
>>>  	KUNIT_CASE(ttm_bo_pin_basic),
>>>  	KUNIT_CASE(ttm_bo_pin_unpin_resource),
>>>  	KUNIT_CASE(ttm_bo_multiple_pin_one_unpin),
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>>> b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>>> index 1bcc67977f48..3a1eef83190c 100644
>>> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>>> @@ -144,7 +144,7 @@ static void ttm_bo_init_reserved_sys_man(struct
>>> kunit *test)
>>>  				  drm_mm_node_allocated(&bo-
>>>> base.vma_node.vm_node));
>>>  
>>>  	ttm_resource_free(bo, &bo->resource);
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  }
>>>  
>>>  static void ttm_bo_init_reserved_mock_man(struct kunit *test)
>>> @@ -186,7 +186,7 @@ static void
>>> ttm_bo_init_reserved_mock_man(struct kunit *test)
>>>  				  drm_mm_node_allocated(&bo-
>>>> base.vma_node.vm_node));
>>>  
>>>  	ttm_resource_free(bo, &bo->resource);
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>>>  }
>>>  
>>> @@ -221,7 +221,7 @@ static void ttm_bo_init_reserved_resv(struct
>>> kunit *test)
>>>  	KUNIT_EXPECT_PTR_EQ(test, bo->base.resv, &resv);
>>>  
>>>  	ttm_resource_free(bo, &bo->resource);
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  }
>>>  
>>>  static void ttm_bo_validate_basic(struct kunit *test)
>>> @@ -265,7 +265,7 @@ static void ttm_bo_validate_basic(struct kunit
>>> *test)
>>>  	KUNIT_EXPECT_EQ(test, bo->resource->placement,
>>>  			DRM_BUDDY_TOPDOWN_ALLOCATION);
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>>>  }
>>>  
>>> @@ -292,7 +292,7 @@ static void
>>> ttm_bo_validate_invalid_placement(struct kunit *test)
>>>  
>>>  	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  }
>>>  
>>>  static void ttm_bo_validate_failed_alloc(struct kunit *test)
>>> @@ -321,7 +321,7 @@ static void ttm_bo_validate_failed_alloc(struct
>>> kunit *test)
>>>  
>>>  	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  	ttm_bad_manager_fini(priv->ttm_dev, mem_type);
>>>  }
>>>  
>>> @@ -353,7 +353,7 @@ static void ttm_bo_validate_pinned(struct kunit
>>> *test)
>>>  	ttm_bo_unpin(bo);
>>>  	dma_resv_unlock(bo->base.resv);
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  }
>>>  
>>>  static const struct ttm_bo_validate_test_case ttm_mem_type_cases[]
>>> = {
>>> @@ -403,7 +403,7 @@ static void
>>> ttm_bo_validate_same_placement(struct kunit *test)
>>>  	KUNIT_EXPECT_EQ(test, err, 0);
>>>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, 0);
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  
>>>  	if (params->mem_type != TTM_PL_SYSTEM)
>>>  		ttm_mock_manager_fini(priv->ttm_dev, params-
>>>> mem_type);
>>> @@ -452,7 +452,7 @@ static void
>>> ttm_bo_validate_busy_placement(struct kunit *test)
>>>  	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, snd_mem);
>>>  	KUNIT_ASSERT_TRUE(test, list_is_singular(&man->lru[bo-
>>>> priority]));
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  	ttm_bad_manager_fini(priv->ttm_dev, fst_mem);
>>>  	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>>>  }
>>> @@ -495,7 +495,7 @@ static void ttm_bo_validate_multihop(struct
>>> kunit *test)
>>>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2);
>>>  	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, final_mem);
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  
>>>  	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
>>>  	ttm_mock_manager_fini(priv->ttm_dev, tmp_mem);
>>> @@ -567,7 +567,7 @@ static void
>>> ttm_bo_validate_no_placement_signaled(struct kunit *test)
>>>  		KUNIT_ASSERT_TRUE(test, flags &
>>> TTM_TT_FLAG_ZERO_ALLOC);
>>>  	}
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  }
>>>  
>>>  static int threaded_dma_resv_signal(void *arg)
>>> @@ -635,7 +635,7 @@ static void
>>> ttm_bo_validate_no_placement_not_signaled(struct kunit *test)
>>>  	/* Make sure we have an idle object at this point */
>>>  	dma_resv_wait_timeout(bo->base.resv, usage, false,
>>> MAX_SCHEDULE_TIMEOUT);
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  }
>>>  
>>>  static void ttm_bo_validate_move_fence_signaled(struct kunit
>>> *test)
>>> @@ -668,7 +668,7 @@ static void
>>> ttm_bo_validate_move_fence_signaled(struct kunit *test)
>>>  	KUNIT_EXPECT_EQ(test, bo->resource->mem_type, mem_type);
>>>  	KUNIT_EXPECT_EQ(test, ctx.bytes_moved, size);
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  	dma_fence_put(man->move);
>>>  }
>>>  
>>> @@ -753,7 +753,7 @@ static void
>>> ttm_bo_validate_move_fence_not_signaled(struct kunit *test)
>>>  	else
>>>  		KUNIT_EXPECT_EQ(test, bo->resource->mem_type,
>>> fst_mem);
>>>  
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo);
>>>  	ttm_mock_manager_fini(priv->ttm_dev, fst_mem);
>>>  	ttm_mock_manager_fini(priv->ttm_dev, snd_mem);
>>>  }
>>> @@ -807,8 +807,8 @@ static void ttm_bo_validate_happy_evict(struct
>>> kunit *test)
>>>  	KUNIT_EXPECT_EQ(test, bos[1].resource->mem_type,
>>> mem_type);
>>>  
>>>  	for (i = 0; i < bo_no; i++)
>>> -		ttm_bo_put(&bos[i]);
>>> -	ttm_bo_put(bo_val);
>>> +		ttm_bo_fini(&bos[i]);
>>> +	ttm_bo_fini(bo_val);
>>>  
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
>>> @@ -852,12 +852,12 @@ static void
>>> ttm_bo_validate_all_pinned_evict(struct kunit *test)
>>>  
>>>  	KUNIT_EXPECT_EQ(test, err, -ENOMEM);
>>>  
>>> -	ttm_bo_put(bo_small);
>>> +	ttm_bo_fini(bo_small);
>>>  
>>>  	ttm_bo_reserve(bo_big, false, false, NULL);
>>>  	ttm_bo_unpin(bo_big);
>>>  	dma_resv_unlock(bo_big->base.resv);
>>> -	ttm_bo_put(bo_big);
>>> +	ttm_bo_fini(bo_big);
>>>  
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
>>> @@ -916,13 +916,13 @@ static void
>>> ttm_bo_validate_allowed_only_evict(struct kunit *test)
>>>  	KUNIT_EXPECT_EQ(test, bo_evictable->resource->mem_type,
>>> mem_type_evict);
>>>  	KUNIT_EXPECT_EQ(test, ctx_val.bytes_moved, size * 2 +
>>> BO_SIZE);
>>>  
>>> -	ttm_bo_put(bo);
>>> -	ttm_bo_put(bo_evictable);
>>> +	ttm_bo_fini(bo);
>>> +	ttm_bo_fini(bo_evictable);
>>>  
>>>  	ttm_bo_reserve(bo_pinned, false, false, NULL);
>>>  	ttm_bo_unpin(bo_pinned);
>>>  	dma_resv_unlock(bo_pinned->base.resv);
>>> -	ttm_bo_put(bo_pinned);
>>> +	ttm_bo_fini(bo_pinned);
>>>  
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_multihop);
>>> @@ -973,8 +973,8 @@ static void
>>> ttm_bo_validate_deleted_evict(struct kunit *test)
>>>  	KUNIT_EXPECT_NULL(test, bo_big->ttm);
>>>  	KUNIT_EXPECT_NULL(test, bo_big->resource);
>>>  
>>> -	ttm_bo_put(bo_small);
>>> -	ttm_bo_put(bo_big);
>>> +	ttm_bo_fini(bo_small);
>>> +	ttm_bo_fini(bo_big);
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>>>  }
>>>  
>>> @@ -1025,8 +1025,8 @@ static void
>>> ttm_bo_validate_busy_domain_evict(struct kunit *test)
>>>  	KUNIT_EXPECT_EQ(test, bo_init->resource->mem_type,
>>> mem_type);
>>>  	KUNIT_EXPECT_NULL(test, bo_val->resource);
>>>  
>>> -	ttm_bo_put(bo_init);
>>> -	ttm_bo_put(bo_val);
>>> +	ttm_bo_fini(bo_init);
>>> +	ttm_bo_fini(bo_val);
>>>  
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>>>  	ttm_bad_manager_fini(priv->ttm_dev, mem_type_evict);
>>> @@ -1070,8 +1070,8 @@ static void
>>> ttm_bo_validate_evict_gutting(struct kunit *test)
>>>  	KUNIT_ASSERT_NULL(test, bo_evict->resource);
>>>  	KUNIT_ASSERT_TRUE(test, bo_evict->ttm->page_flags &
>>> TTM_TT_FLAG_ZERO_ALLOC);
>>>  
>>> -	ttm_bo_put(bo_evict);
>>> -	ttm_bo_put(bo);
>>> +	ttm_bo_fini(bo_evict);
>>> +	ttm_bo_fini(bo);
>>>  
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>>>  }
>>> @@ -1128,9 +1128,9 @@ static void
>>> ttm_bo_validate_recrusive_evict(struct kunit *test)
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type);
>>>  	ttm_mock_manager_fini(priv->ttm_dev, mem_type_evict);
>>>  
>>> -	ttm_bo_put(bo_val);
>>> -	ttm_bo_put(bo_tt);
>>> -	ttm_bo_put(bo_mock);
>>> +	ttm_bo_fini(bo_val);
>>> +	ttm_bo_fini(bo_tt);
>>> +	ttm_bo_fini(bo_mock);
>>>  }
>>>  
>>>  static struct kunit_case ttm_bo_validate_test_cases[] = {
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index f4d9e68b21e7..9c9e132558d4 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -318,18 +318,17 @@ static void ttm_bo_release(struct kref *kref)
>>>  	bo->destroy(bo);
>>>  }
>>>  
>>> -/**
>>> - * ttm_bo_put
>>> - *
>>> - * @bo: The buffer object.
>>> - *
>>> - * Unreference a buffer object.
>>> - */
>>> +/* TODO: remove! */
>>>  void ttm_bo_put(struct ttm_buffer_object *bo)
>>>  {
>>>  	kref_put(&bo->kref, ttm_bo_release);
>>>  }
>>> -EXPORT_SYMBOL(ttm_bo_put);
>>> +
>>> +void ttm_bo_fini(struct ttm_buffer_object *bo)
>>> +{
>>> +	ttm_bo_put(bo);
>>> +}
>>> +EXPORT_SYMBOL(ttm_bo_fini);
>>>  
>>>  static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
>>>  				     struct ttm_operation_ctx
>>> *ctx,
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h
>>> b/drivers/gpu/drm/ttm/ttm_bo_internal.h
>>> index 9d8b747a34db..e0d48eac74b0 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
>>> @@ -55,4 +55,6 @@ ttm_bo_get_unless_zero(struct ttm_buffer_object
>>> *bo)
>>>  	return bo;
>>>  }
>>>  
>>> +void ttm_bo_put(struct ttm_buffer_object *bo);
>>> +
>>>  #endif
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> index eedf1fe60be7..39f8c46550c2 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
>>> @@ -37,7 +37,7 @@ static void vmw_gem_object_free(struct
>>> drm_gem_object *gobj)
>>>  {
>>>  	struct ttm_buffer_object *bo = drm_gem_ttm_of_gem(gobj);
>>>  	if (bo)
>>> -		ttm_bo_put(bo);
>>> +		ttm_bo_fini(bo);
>>>  }
>>>  
>>>  static int vmw_gem_object_open(struct drm_gem_object *obj,
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>> b/drivers/gpu/drm/xe/xe_bo.c
>>> index 18f27da47a36..8830f0142881 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -1668,7 +1668,7 @@ static void xe_gem_object_free(struct
>>> drm_gem_object *obj)
>>>  	 * refcount directly if needed.
>>>  	 */
>>>  	__xe_bo_vunmap(gem_to_xe_bo(obj));
>>> -	ttm_bo_put(container_of(obj, struct ttm_buffer_object,
>>> base));
>>> +	ttm_bo_fini(container_of(obj, struct ttm_buffer_object,
>>> base));
>>>  }
>>>  
>>>  static void xe_gem_object_close(struct drm_gem_object *obj,
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>> index 479b7ed075c0..da5c2e4971dc 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -391,7 +391,7 @@ int ttm_bo_wait_ctx(struct ttm_buffer_object
>>> *bo,
>>>  int ttm_bo_validate(struct ttm_buffer_object *bo,
>>>  		    struct ttm_placement *placement,
>>>  		    struct ttm_operation_ctx *ctx);
>>> -void ttm_bo_put(struct ttm_buffer_object *bo);
>>> +void ttm_bo_fini(struct ttm_buffer_object *bo);
>>>  void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
>>>  			  struct ttm_lru_bulk_move *bulk);
>>>  bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>>
> 

