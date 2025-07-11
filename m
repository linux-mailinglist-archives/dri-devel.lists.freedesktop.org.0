Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37C3B020EB
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 17:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C7510E3A6;
	Fri, 11 Jul 2025 15:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="09Pr1m0F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B859B10E3A3;
 Fri, 11 Jul 2025 15:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKSnrW4hJzelGKjGTldN+qD8/8wRFuRE0b4LUcXv3IPbEC4hx+wmeZavj5t87VhwDLm2eyDvywhgv3+icZzf5hvejQO4gB5/aA+0rtuSRlMt7XOCcRoTc3gtM5UDJ3pRvuk9L+jHpYafM2DVjkEWIPVWv0xpbsdQitUkRFinotIoHmy8RRX5U4EeJjNHJV3FL+EwLw4yl8WNRitlyBFee50pwxjGihFHAMEyMIxtC/kdtJtp2a5VJKXnLpjNeo5qfI1AZ72LqN6jobe81VI/vmBuUDy24vwd/QXgxrH3LBCg445yggfOqT0BB1saKEA/ylF5+uwCr5dlXXPoBKL8qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvT1NVF0qFd7DTF2r/kO64fxdtQeNOqXahXbasYhtc0=;
 b=it2cVHYLOEqnk0PHovHO1AmjXybk4m/9qOwS2mlLF2IVacxYj2HEjBnLgpU0OxEMIjHE5lNJWg+4m66M1QbHfnklAPDAloxdvWvAN21FrCYcaatBo8SP8rLHYTxAL70pM0t9woC2WOE90TT1GcBbw1K7wgBC7IJ2dGFCyHTpd8LX66CiC6GSQG9lB9sKYmnJ7ywnBwREFaA8KLbyZO0lsXQtmOl05h3D875T2jjVyezLz+4vPwYGsTXN/a2A3MvZxuxDjIhk5q9oJjBe40NfZ+bi9U+auLNZfotKR2D/v96iXIhqyCqJpn8k5ukGKHDKQB5gIUpZqhTO4b2B4fBvmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mvT1NVF0qFd7DTF2r/kO64fxdtQeNOqXahXbasYhtc0=;
 b=09Pr1m0FWsadv0mztb+tS4uDkG0jtnCPjjtJaKHpQe+JHU08AFJ0ebfvGg3DqeKCqwnFoG0wp9FqUcqWS1B3WTW98F6MaO4BA8UbUpUWK/BMyNrHxWiPhYJNHVPYF190NCNsVH98AGxhm4WASm85gtm9iSjdht5KJQ5h4KKJl3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH1PPF711010B62.namprd12.prod.outlook.com (2603:10b6:61f:fc00::614) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 11 Jul
 2025 15:54:03 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%6]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 15:54:02 +0000
Message-ID: <a0e334fe-c3b8-4b33-8d3c-6d73a380d759@amd.com>
Date: Fri, 11 Jul 2025 11:54:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/14] drm/amd/display: more drm_edid to AMD display
 driver
To: Melissa Wen <mwen@igalia.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, harry.wentland@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Michel Daenzer <michel.daenzer@mailbox.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250618152216.948406-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250618152216.948406-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH1PPF711010B62:EE_
X-MS-Office365-Filtering-Correlation-Id: 868bbdaa-ec2a-4bcd-32d5-08ddc0932824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2JPM29QeHVVS0lCdGlFb1JVb0FJRGdxSFFKWmZHcGkwLzUzTS85QktJOVhL?=
 =?utf-8?B?Q211aWI5cjR1cDZBWE51bER6a25EaGY0eEFFTFNOMi80R1pNYjlPTEM2WU1I?=
 =?utf-8?B?a3NYNjNhTTd6YWtpM0ZqUWx0dUdWZDF1R1lnMWlVU1VwVzdWZ21wTmFEc1or?=
 =?utf-8?B?M2NUSjJ2d3lWRC96ZWhoeWpXbWxWOTlJZVd5MExRamMydkd0Y2NNdHJLcC9i?=
 =?utf-8?B?U211c1dxMUNLdnRhMERQQlZLT1Rpd3VyeW5VdXBUNjZRY1pza3k3VGx6K3Bw?=
 =?utf-8?B?S242NWo3TllZZWZxc3djdjJOOHZCU0o1Vk4yM0dsWjBKWHhCUUFLZFlDS3Jx?=
 =?utf-8?B?eUkzcWhxQ292YkQxQU1GV2lOZnZCd3A1c0YxbFA0OWt2SEJJQ1NRTVFDKzE5?=
 =?utf-8?B?Sy82RE5aOVk0Z1hHRHFiOWZwaGRGcmpwb3pjK3BzdmJsMXBkenYxeVRnMlFu?=
 =?utf-8?B?NTdlbytHZm4rRjNUaVRyWXdtQVBrQVoyN04weWlTR1U0emtFdDZIOXdCQ3dE?=
 =?utf-8?B?MEZaWElqRzJxTCsrK1Z0NGJQWEp5dWtkMTlxeHVjR1lHQm0zcmpweGhWL01B?=
 =?utf-8?B?eXg0dDloajVmWjZOUzFmKzNOdWhjd0J1TlF5OUN3UmJPelBJajNlcTVIYzA0?=
 =?utf-8?B?YmRRTW52dnIvRXhaUlJKKzU4TzlyT0JMUHpraUVDakxQWk5WT3NOWGJWb21k?=
 =?utf-8?B?Z3ByZDkwYXcrQzV3OGROcDZ1VldUSHNvQjlHOXg1L0NqNGVoR1VqcjJHdTgr?=
 =?utf-8?B?RkNpNUU2N2pNcUM1d2dsK1dvYWM0TXE5UER2NkdDWm0yV1IwdlZIRzdqTmJk?=
 =?utf-8?B?WENZOFZaRDhwdDRyZzVaTUpaa1NZWnhNRnhOOU8zSCtjS0VScUpXQjZYeVlz?=
 =?utf-8?B?aU03S3pGOXlPbVl6WjdWVDN5WmlQOUp5RVdEOHpJN1U4cXBrV3NYNW9qU01y?=
 =?utf-8?B?M0RBY09NZjRsZXFicXJmd3FDbkN4dW9LMUtsM0RjNEVKVXo1d0VSTWptMmtJ?=
 =?utf-8?B?UW9nSys1Z1lsbFZDUVZCMGVmOVhxMW41TGFSTEZJUlVUNFVZWlpKSCt5d3Av?=
 =?utf-8?B?blNFc0p0dmpqdlFoUmh2azg1L05FNUliV0ZLNXBaOCt1amlLQkxSN2JKS05v?=
 =?utf-8?B?TStDbDRxQUgrQzRjdWZ3NmltVXpXYXFPVm8zanhHMll3Q1VyOWdJdkU4aTJF?=
 =?utf-8?B?TStjWmhWenpoU1JzOGdMYndEWjJWbHQ4NU11RGdCS1lGMWFscHoxczlWNE1o?=
 =?utf-8?B?NkZVRzB5Q2cwMzYwTk9VTHZMNmlDaDlwM3QwY0cyZkJZRi82RU9mQnI2ZXlK?=
 =?utf-8?B?YUN4a2dpYkk2Umo2YUFmRGRGZDZRdUhRL0dXTW5pRGNaSW5ZZU1KVzJqZGln?=
 =?utf-8?B?SjhnOUVZanVSY2ljTnNNNUp0UFFQV0JHcENHUW1qZXVsU3QxZ2lvaWNMZmw0?=
 =?utf-8?B?dlpCa3Q2czVtQjJ4VXVEUWQrYUZHWkcyRVhOYmF3OEVVWjZQRUNlL0srK2dD?=
 =?utf-8?B?NmtQdHNtUkZtNkxJNWhsT1JHdWhYRVA0eElxODBOMklXc2hkeWRTQVQ2OTJm?=
 =?utf-8?B?MFVqL0FFRUhEREEyYVJYUTI1ZmppL0d6UFZjR2ZEOHdBc2l2Y2R3UlA4WUxy?=
 =?utf-8?B?TzM0dWhqNk5pb0NrWndab1BTaDZNdDZvUW9KeFJRTUVxcDQ4U0V1SXVkTE81?=
 =?utf-8?B?cUVjcXJMR1pWeTV3eVJrU0FTa2htRWZSYzlMRnR1d1BIZ2ZKRmdlY01JSllT?=
 =?utf-8?B?LzFnNTNOZDBDaWhvYXBBSlJiY1FWK3lLK3JRaXVCTk5BQ2RQZmdHNlhadkJJ?=
 =?utf-8?B?S2h4NW5VVlhhRlhHcmNCRW5NL3ZTQW0rUkNOVXkxNThHOU5IMkF6TVF3b0xJ?=
 =?utf-8?B?SDRiRWw1U3lsdDYvdG92Kzg2aVN4dDlrSWtoRUtUK00wWkdUcW9HZFFnaDNy?=
 =?utf-8?B?Q2JyZzlteXR1RFpTMjU4ZEE1UEZEbU5VN2xSb2dFTVVtNXVEeDhyYlRyZXVv?=
 =?utf-8?B?eEVHZDdKSHFRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2ZSbHFwT2FtcVFFYnl4QjhEb0dWNUhQV0dvZjF5V2Faejg2akp6eG1OTWph?=
 =?utf-8?B?ZDJOMnlrTG1MTUgzNSs2OG0vZ1hvQzdXb1QwYnNVek93eEFGS3pPM0gzeTli?=
 =?utf-8?B?WUx5VU42c3lzVVZuNDNLc05CbkhRazhseHNsYWVqKzRpOVUzK0pEcks5b1oz?=
 =?utf-8?B?eFNSVTg5YkN3VkVFaHhIdUt2OWY3OGp6TVA2dy9FSUh4Y0VBcWNwUjFJS0E1?=
 =?utf-8?B?WUNEZko2TWVzek9seHRydVE3aGxGaHFPMXpzRHM2UVNZS3ZsNm5IYlFuNjN6?=
 =?utf-8?B?eFRleDNpQ3ZML2NrYkcwbnRUREZrRkJsMTdsTHdZWEF5TlpDcWVGbHpDMFlS?=
 =?utf-8?B?Vm5Hd1pHdHppK2o5VmJleXJhZTRhSDV2NWhQLzlrRDdDMUdaTkorZlJUN0FQ?=
 =?utf-8?B?T25nL2tpdXJEcGNwSGVzVTZPR1Q2Q3Zub0NoVjdxeFNNM2lEODhsU0NlQmZC?=
 =?utf-8?B?ZGNSMlo4bTRibG51YVN3Q2ZrdVM4TURtS3ZadGJWM1d0WTFaTVlkenZ1aURI?=
 =?utf-8?B?NVcyd2pCRUNyb0lhYmllNHZVNS96RFRZZ1lUczJ5eG1KZCt6UVoySFM0NmRH?=
 =?utf-8?B?b2Nxay9UUzk5eHV5b2tmN1FBV3VxTzY3ZzB4NHZLbFRCNGF6clFxc1NhOXdu?=
 =?utf-8?B?Nk1hNU91L3A2M0FORjQ2WER2Qm9ERXFmMWZyeGFzY0wzSURTWlpHVWpIOXZU?=
 =?utf-8?B?S1p5cnVPcmhCeVl6SzVkd3hqTmdTYjZ3UFZSMUVOWG1ERE53dFhHT0RlUU10?=
 =?utf-8?B?QmJReTFIejhTcndhM1dnOFJhMFU4K3lHblRYaC95VzVkRW5PQmI2aXlVaG9k?=
 =?utf-8?B?L3BrRzdpVUV5L3FmcGExVWZGZlM2S2wrUmJGVFhmeDZOTEFPRVQ4ckovMUdI?=
 =?utf-8?B?WGoyazdCZUpzM0N4MFpycy9iRjhxRnBldDgxUThOam1wTmxJYXNudUJBbVZC?=
 =?utf-8?B?SzZnRThiaGxCSjhKby83Znh6OWdaRFcxTkRicjhaOFZjcnUzQVpUS2lwaVNK?=
 =?utf-8?B?eVdBQWVJODhaZ2ZjM1dqVVNxa0ttWk5JZ0t0MXpZMXBKL1liVVkxQTBRZDNX?=
 =?utf-8?B?ektHV0gzMzM1NnUxNWErZlhqcCtpUExzSkplY0gram5zQUw4b2c1S0RFemk0?=
 =?utf-8?B?cVFDMTlkUVpWOEdKWnp4d0xvT2hXSG90dHJXeGN1Y05WMDZ0ZU1GUG9MTG5o?=
 =?utf-8?B?OFBqLzFuak5oMFBTVjZzRzhWbWpmTmQ2YXc5aVJHNG1jT1BQMFNUMktQL09r?=
 =?utf-8?B?VmhQWTl1dU9JbnVheC9GU0dYdndOdnZwK3dIbkxxTlhwVUhxaEQ0WmJDL252?=
 =?utf-8?B?SVBLMFpLQWVUK01iTWl0SVkyajhlWnhqbWJpLzVkclo4N0NTZjFHTmplaDJK?=
 =?utf-8?B?d0M1eHA0cjQ1Q05FZVJkZTRvbDY4YmJvYURQcEorTFQrdndkU2JxUGNCU0kx?=
 =?utf-8?B?elFjK2tHY1dULzk3WnZ3bnh2QTNRWExGRFd5bHI2UjFKcWUxaFRYOVl6QlBB?=
 =?utf-8?B?SHZrdHhJaS9sL1h3V3Bub1lTS0VaNkFrNVZNMUNVRTRoQU9ScWJYZlFRcWFt?=
 =?utf-8?B?dG5ZOXgwWDh4ZDFNNjRNTlVEWUtGdUIyd0JrMG9pVlF0OGE5eXlhWmRXdWtn?=
 =?utf-8?B?cXdVWWtBOW9ER2h3OWFMU2o4eFhnM3dWQVVWeFFiSEM3cXoxZy9lejh6SVJ5?=
 =?utf-8?B?TERxcWYwdWJpRkJzWkdvK21YTDRhcThNNTA0SW1VY3NMdUJDamJlb2RTQXhE?=
 =?utf-8?B?Q2ZHNjRsSUszTUVmZDg1eVBnK2pTOWRYZDhZYmVReGR4NXo3YlBrWEJmTmFx?=
 =?utf-8?B?RFRRV28xNkl1YjhKVE8xZzNEN3NvV2FZYUpXcjJhTnkvNUxSVGY1Tno0Nyt2?=
 =?utf-8?B?MHlJWGV2RHFwc1N3dWtyRUp3Z0ZuRERGclEvVGtvSDNpalpEdGtqOEdzalA4?=
 =?utf-8?B?V0d5MEUzK1RrWHhFZDJLSGIvbTZCTHhlZXEzemY0cExaaXI3M1Y3SStFTzV5?=
 =?utf-8?B?TS94eFBmbUNIbFdqVHNUTmJ6MDRXcDcvSnVjQWVRT2V4bzhXK2o0KzFTSTZF?=
 =?utf-8?B?aDAxK096T091MlBZalR6RnpmTFgxTDBDV0hBd1JHQ1luZjMyV1NCMG56N2wv?=
 =?utf-8?Q?WQsF4IBAvrGfrE5ndkfIQXxRR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 868bbdaa-ec2a-4bcd-32d5-08ddc0932824
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 15:54:02.5040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEH8cuXHfrvYXi0xfk0tBrbl+7C5cjyrezCS4UEHq5fR/X0U6Llv7Jq4rvNmratXhWbzVlqTBbdtqhrF2hiibg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF711010B62
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

Thanks Melissa. I will send this series to promotion test and post the 
result by the end of next week.

On 6/18/25 11:19, Melissa Wen wrote:
> Hi,
> 
> Siqueira and I have been working on a solution to reduce the usage of
> drm_edid_raw in the AMD display driver, since the current guideline in
> the DRM subsystem is to stop handling raw edid data in driver-specific
> implementation and use opaque `drm_edid` object with common-code
> helpers.
> 
> In short, this series approaches the issue of maintaining DC as an
> OS-agnostic component by creating a mid layer to isolate `drm_edid`
> helpers that need to be called in the DC code, while allowing other OSes
> to implement their specific implementation. This is an extension of [1].
> 
> - Patch 1 addresses a possible leak added by previous migration t drm/amd/display: more drm_edid to AMD display driver
o
>    drm_edid.
> - Patch 2 allocates a temporary drm_edid from raw edid for parsing.
> - Patches 3-7 use common-code, drm_edid helpers to parse edid
>    capabilities instead of driver-specific solutions. For this, patch 4
>    introduces a new helper that gets monitor name from drm_edid.
> - Patches 8-9 are groundwork to reduce the noise of Linux/DRM specific
>    code in the DC shared code
> - Patch 10 creates a mid layer to make DC embraces different ways of
>    handling EDID by platforms.
> - Patch 11 move open-coded management of raw EDID data to the mid
>    layer created before.
> - Patch 12 introduces a helper that compares EDIDs from two drm_edids.
> - Patch 13 adds drm_edid to dc_sink struct and a mid-layer helper to
>    free `drm_edid`.
> - Patch 14 switch dc_edid to drm_edid across the driver in a way that
>    the DC shared code is little affected by Linux specific stuff.
> 
> [v1] https://lore.kernel.org/dri-devel/20250411201333.151335-1-mwen@igalia.com/
> Changes:
> - fix broken approach to get monitor name from eld (Jani)
>    - I introduced a new helper that gets monitor name from drm_edid
> - rename drm_edid_eq to drm_edid_eq_buf and doc fixes (Jani)
> - add NULL edid checks (Jani)
> - fix mishandling of product_id.manufacturer_name (Michel)
>    - I directly set it to manufacturer_id since sparse didn't complain.
> - add Mario's r-b in the first fix patch and fix commit msg typo.
> 
> [v2] https://lore.kernel.org/dri-devel/20250507001712.120215-1-mwen@igalia.com/
> Changes:
> - kernel-doc and commit msg fixes (Jani)
> - use drm_edid_legacy_init instead of open coded (Jani)
> - place drm_edid new func into the right section (Jani)
> - paramenter names fix (Jani)
> - add Jani's r-b to the patch 12
> - remove unnecessary include (Jani)
> - call dc_edid_sink_edid_free in link_detection, instead of drm_edid_free
> - rebase on top of asdn
> 
> [v3] https://lore.kernel.org/dri-devel/20250514202130.291324-1-mwen@igalia.com/
> Changes:
> - rebase to asdn
> - some kernel-doc fixes
> - move some changes to the right commit
> 
> [v4] https://lore.kernel.org/amd-gfx/20250613150015.245917-1-mwen@igalia.com/
> Changes:
> - fix comments and commit messages (Mario)
> - remove unnecessary drm_edid dup and fix mem leak (Mario)
> - add Mario's rb to patches 5-7
> 
> ---
> 
> There are three specific points where we still use drm_edid_raw() in the
> driver:
> 1. raw edid data for write EDID checksum in DP_TEST_EDID_CHECKSUM via
>     drm_dp_dpcd_write(), that AFAIK there is no common code solution yet;
> 2. open-coded connectivity log for dc link detection, that maybe can be
>     moved to drm (?);
> 3. open-coded parser that I suspect is a lot of duplicated code, but
>     needs careful examining.
> 
> I suggest to address those points in a next phase for regression control.
> 
> Finally, I'm not sure amdgpu_dm/dc_edid is the right place and file name
> for the mid-layer. Suggestions?
> 
> [1] https://lore.kernel.org/amd-gfx/20250308142650.35920-1-mwen@igalia.com/
> 
> Let me know yours thoughts!
> 
> Melissa
> 
> Melissa Wen (12):
>    drm/amd/display: make sure drm_edid stored in aconnector doesn't leak
>    drm/amd/display: start using drm_edid helpers to parse EDID caps
>    drm/amd/display: use drm_edid_product_id for parsing EDID product info
>    drm/edid: introduce a helper that gets monitor name from drm_edid
>    drm/amd/display: get panel id with drm_edid helper
>    drm/amd/display: get SAD from drm_eld when parsing EDID caps
>    drm/amd/display: get SADB from drm_eld when parsing EDID caps
>    drm/amd/display: simplify dm_helpers_parse_edid_caps signature
>    drm/amd/display: change DC functions to accept private types for edid
>    drm/edid: introduce a helper that compares edid data from two drm_edid
>    drm/amd/display: add drm_edid to dc_sink
>    drm/amd/display: move dc_sink from dc_edid to drm_edid
> 
> Rodrigo Siqueira (2):
>    drm/amd/display: add a mid-layer file to handle EDID in DC
>    drm/amd/display: create a function to fill dc_sink with edid data
> 
>   .../gpu/drm/amd/display/amdgpu_dm/Makefile    |   1 +
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  33 +++---
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 105 +++++++-----------
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  21 ++--
>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.c   |  33 ++++++
>   .../gpu/drm/amd/display/amdgpu_dm/dc_edid.h   |  15 +++
>   .../drm/amd/display/dc/core/dc_link_exports.c |   9 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_sink.c |   3 +
>   drivers/gpu/drm/amd/display/dc/dc.h           |  10 +-
>   drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   7 +-
>   drivers/gpu/drm/amd/display/dc/inc/link.h     |   9 +-
>   .../drm/amd/display/dc/link/link_detection.c  |  30 ++---
>   .../drm/amd/display/dc/link/link_detection.h  |   9 +-
>   drivers/gpu/drm/bridge/sil-sii8620.c          |   2 +-
>   drivers/gpu/drm/display/drm_dp_mst_topology.c |   2 +-
>   drivers/gpu/drm/drm_edid.c                    |  54 +++++++--
>   include/drm/drm_edid.h                        |  10 +-
>   17 files changed, 193 insertions(+), 160 deletions(-)
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.c
>   create mode 100644 drivers/gpu/drm/amd/display/amdgpu_dm/dc_edid.h
> 

