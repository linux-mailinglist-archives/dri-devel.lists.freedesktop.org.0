Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B47BAD87D4
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 11:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC46810E93F;
	Fri, 13 Jun 2025 09:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lR4B9wbI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5836710E93F;
 Fri, 13 Jun 2025 09:29:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ed8nR5irXXqVV/DTTGkKZcgbHWFcwFJRUHRAbq+6j3wax/jaeAOxvN9n2j6AH7/JUr02zHaPDrS+zyTrSJBQk6KLKZ+3im5GaQbKMgYv65lM7p2mvblbJom+GeBFQ5ls6seAc0wyTV3I72P/kpxr8FbzhzQ+ZbZ33mzp9O1eMT+TuxUfLh2OAzrVG6hPHZEha3y1XoESQAjbruwwRQbPxRxbt8uywxx8dDXJMH7vv0ufyH+Luiix8g5IpdFM+AJQG0bnLgq+8Hb/YrESgp78ZKfFkSwVCELLpQyEoUCKx1kp4F/hqMriPo0zj0ln6QJFghUETTTIWCwzKXiGujZ6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYEtMSPTpY/cwhSfScmittmhbM/2sQtFKpuh+82Od48=;
 b=Hv2O6HHievostKu8VCMdVmkKY0CVOgcfCGnNGGngkWyRMPZHhXA5qgRWxQeoG3UPmOVWFahNYPgHfNvGRXfuw6gcG0FpVp0x2mXfzVfCP3Q7q14VnEYg6YKxigtlpZkL0Vf0j9bP6nqjywloxG9yi0NNq4PHGU3Fu5NkWZ3Tv7mWHuq/oW38ySxVaYekIpKPj54rz7JMKNqXfkcjfHJYvRivhrOLoeI4fWdtA00TO52N+6wwIp0y4Q0YJ3vg8diGRRniGkxwzNY00rIuFmtaiskYczS08wXPUg3boFAKiyzyFTqb2fPRlBNJ6/vadcOyAfqCs+KYFqjsJ2EPUFZosA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYEtMSPTpY/cwhSfScmittmhbM/2sQtFKpuh+82Od48=;
 b=lR4B9wbICf06q7hyk3Gm7lO9IygF8A8iLEyj5YwikZ7EtOZQA357bHi7lDYUDpqDoH8Uv7qy6pnTAxuPH0VkpBSTnvzpdb/wfhidiBq6nq44mi85Wb5yDjnwtlSVYgjEfC2BPVz6AQp0+0QqsQFt+3RtXTmHe2SrMSENADxfSCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SA1PR12MB5637.namprd12.prod.outlook.com (2603:10b6:806:228::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 09:29:41 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 09:29:41 +0000
Message-ID: <847a22a1-ac32-4306-9b82-5821d4b65bca@amd.com>
Date: Fri, 13 Jun 2025 14:59:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] debugfs support for pt base for each vm
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
References: <20250613071537.701563-1-sunil.khatri@amd.com>
 <705e8a3b-be01-4c1e-96ad-b1cc9fcf42ca@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <705e8a3b-be01-4c1e-96ad-b1cc9fcf42ca@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::24) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|SA1PR12MB5637:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c998f89-9dce-4d0e-021b-08ddaa5cd2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWNhdWFoWmNDTEVyTGpZNmxwa1lIeDZWUHJ4MjZTemhwRjF6R1JlY2Z1NnRv?=
 =?utf-8?B?a1daRStHdUtKU0piVzBLYjd4OW11QUoreEFQcXdvcWk1N2k3eWVVVytUT1Z3?=
 =?utf-8?B?R1lZY0xXMGZGYXFHSnRHbUtmNVBJMlg2NHVpWHhXQVJmTHJjdjBHaHlnaDd0?=
 =?utf-8?B?ekpYMUEvdGhoYlVTQy9EdlZ1aTJaMkpvMHhrelpieVNyQUNhNXZKWmQxb1F6?=
 =?utf-8?B?QTh6bGhvNklWNWJlSE0yWldCKzJEWHNkMzZTZUttTC9XT0VSMEVOTHhjMEJp?=
 =?utf-8?B?OWVQUjMwNnFoK0N1Z1NIT3Z1NS81UWNHd1NlZHNHRnViWllhcXFuQ1NJMlZn?=
 =?utf-8?B?U0JSeWJreHVZKy9FWHZEWGxNaXN6M29rN3RmU3J0QW5rb011UDdnTGE2YnZz?=
 =?utf-8?B?QjdXRzhDM1ZIYXNxMnl6Q0lNK3gyVEszclNoRTFiU3hTV0d2YlhUdkpBNDBX?=
 =?utf-8?B?OFgyRTY5MEU2NGhSY1JpRnYrTmljR2pGMmthY2NndmVBdmw2cThDNnRzbHVN?=
 =?utf-8?B?SkM2Zm41Q3A0NkFmNk5hSGo3emJsNmRmcmNrY3AreGZHaTdDRXJOZEk2b3Q0?=
 =?utf-8?B?UTV0U2RrMk44c01yRDA4Ym41b3J1aWtxQjRNQ3cya3E4eUpzemswdnphandv?=
 =?utf-8?B?ZTFZTWtoWTB0ZVVMRU5JYThmTW43VjBqTUVLNkZqRDJaOHB1SytuMnp6MCtx?=
 =?utf-8?B?bFRUd2tiQzhTSmMvd2d6UTh3aW5URWlTUW5Bb1ZIUVA0cWdJaHVOd1h4b0oz?=
 =?utf-8?B?bG1xNDlyYXZpVzhjTER2V3NHdUFKUGFpa3ppY3FBbmY1OTBvZzkraWt2V2Fn?=
 =?utf-8?B?R3Y2bUZvb3kvRmZINkh1WHQ3ZzJFZEl4VFdPVFF0MkdwVU1scHNXeDBVZzc1?=
 =?utf-8?B?SW9NdjR4allUQzI3NlU4R3pVaVFQL2ZTZFB1d0xPcHNqVSt0TGtpTkpXcDVG?=
 =?utf-8?B?Q0pYelNLWEdqTEZSNkoycWVmVHlnSnZGbzhjbVpXVWZFeXIvVUxCb1VFdWty?=
 =?utf-8?B?YmFYL1IxOTFoU2ZXQ3I2L1RzQVdBZVhyYXlsUUNabHZaV1NZQ2VPV2RvY2Jv?=
 =?utf-8?B?ZGFMdDNxYkNxMDEwNWVEWWU5Njg1ZG9iWk15eWtSb1ZYak4vS01WMEVPSnQ0?=
 =?utf-8?B?c0J0VGdhZXhpTHV3emdMWFZpdkpMenFJcHEvY3ZxR3ZxRVoxTlJFKzczRTRX?=
 =?utf-8?B?eWZDempKQWR0MVp1bnFPQ3Vlbi9WNUVUU00xZTRCQkRISnV1STlvMzBxQXVD?=
 =?utf-8?B?OHJYWkJ4aWJJODAzRGd2YUNSblVLS0hpODRnOVkvM2FidUxyV1kwSjVubFVI?=
 =?utf-8?B?ajNvdUhEZ1lZcm8wek80Y0lHM0dtUjBTTTBiQWZnKy9SdlNPRmI3QzZxaFNq?=
 =?utf-8?B?S29zSGw2VGJub3FxdDF3OGlITmVBZHF0STgrTG9ZTHJ3VE9WWWlMRytUbUs3?=
 =?utf-8?B?M2Y2S2xBMndheTcyVTFvT0NyOUpMa1JQM0VlSVFkb3JRUFVEd1hDWTd3T1c4?=
 =?utf-8?B?dWtzY1hkQ0VrZ2EwSHFjUkVVWC9BZE1BZ3pOakNTc3Z3Sjhyb3RyQmJmVGdI?=
 =?utf-8?B?WkxGWndReURVc2FWY1B1dU5NZXAwb2p4Y1BkZHVnbklVd2ZYVDBwUzYxNWtF?=
 =?utf-8?B?VlNZT3A3ZzZwUGVNZWxXdUhOaGdzeGk0OHhyTTN4OGFDODNPelEwWll3cGUx?=
 =?utf-8?B?WVNiVzJtTVFDMDFHekdya0tuL2N0OUtCU3RVa3pjYklRYllRNDUzRVdHTDhE?=
 =?utf-8?B?OGxjMUk4OG91dy93cURtMVNUM1hKU1dON2o1aU5EbkVHY0xZVSsvWTFMRWd1?=
 =?utf-8?B?Zm9PTnoxaTY2NFB2Q1RydmlRRHpTNzl4REVhSkZTb1lYenJRMjFSMnQyc3Ny?=
 =?utf-8?B?aEpKajNvTnJVMk1oMENtZlJ4TGJHY2h2THRZZGhNNk85K0ZwQnNrSWxuUThP?=
 =?utf-8?Q?9qY/46fhQ5g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHNPOU9BRmJOZVJiaDJOVERVdVFBTVBuVE94aFV5a1p0RUhwSmhwdnEvRjlI?=
 =?utf-8?B?WWlmemM0UXhHZFhzbnlmRk1FeXNhN1NrbU9ONGtSZDkwSlhxaE9kdmdYK2Nt?=
 =?utf-8?B?WFZRckdYM214S1FlK0NaSEhkYU12cWFaaE8vNGhpS2t2c0o0eFNJYVpIZzFY?=
 =?utf-8?B?aDV4WWpIdXpKRmZ4aXZiSldOSm5hVExFL3BzOHhSc055RjBWRlVnTFFOb01x?=
 =?utf-8?B?eDJjallxUTBpL2sxVk1rc2drTkR5ZVE1SFpYRkxlUTBMelFjdk5QZGVGdlF2?=
 =?utf-8?B?ZmZpN2pTTlh6ZzF4czhjb3VnR1VjajNib3lxU2RZWmRVR01JUVNVYkZSTGlM?=
 =?utf-8?B?NlpXSzluVURoL21iem4rdVI4OXdGWktRSHpKNTlFVUVzOTRia1V3VzhkclJ1?=
 =?utf-8?B?cTVpbHFxYnhVSkVtMUh6YmhQcWVHUTFHV3F1aVpYQVFFcmkrSzMyYi8vZW1M?=
 =?utf-8?B?bUVKN0ZTUmFGUEkyeUtKU0hCdUFkUVVLbzNPWDVFZzV5b0RlRXlRUGd2eHo2?=
 =?utf-8?B?eUhGaXA4VlF1Z2Zkbi9xVWt6Vkp1S29lbUdvb3FpMGRsSk9OelRMWU80Rjk2?=
 =?utf-8?B?NjZVQ0tKSndlbVRpUnZldkFXYVBScmx2UHVIOEdyOFYvbWVFUVdVNC9uRDBl?=
 =?utf-8?B?R2FtNDBpT0Jmak9BTGl4amt5UWcydTlzN2ZFQXpFM3k5YUQzblJyMy9IQ1B0?=
 =?utf-8?B?N01pTEF4KzdSandMYllXQTAvWDJmVXZqS09MbkIvYTRwc0RGaU5ZcU01Y1RJ?=
 =?utf-8?B?Qnp5Tmx1Q1Q4WjdrR2N1a0sxSWZEM2MrQjFXMFU1cEh3bURnd2V0dm9qUThp?=
 =?utf-8?B?cUxoZytyVzBnRld0VlFBanViTEMveUJ0VnU3eHRWT2x5RHQ3TlNWZm1ybDVh?=
 =?utf-8?B?L0VKRVpkanVia2tPcTRGU3lWeU05OG9xOFBFR2t5YXBNT21yWVI3TXZ4MzVa?=
 =?utf-8?B?d0lSVXB1eWhTdkpSMGhwNE9oUTlpcGtmSnVzemZVdDNsK29ncDhNcHdNSGdt?=
 =?utf-8?B?dmZvWFJua1NndE96dUtneXBxL1UwaHNKRGFjaFJWZkRNWlNRZzFwK3FJNTFm?=
 =?utf-8?B?a0tNWThLUEJ2Z0NwamVER1FaUkdDTVJyUFluVjl0VGhyK1dWMjZRbnBsYXdJ?=
 =?utf-8?B?WjNDbFI3MTJhdnAzUmpDM0g0VDhRTGs2RDVwbWZVMDJjYTgrSGRJTHJIcGhy?=
 =?utf-8?B?SWZSNWpMVFRmSVBQL3RrVm1kbmgvVzk2RjB4Qi90b3BCSkQ5cDVLelJycng4?=
 =?utf-8?B?cWd2YWoyYnd0cTJvVENObXZuTkRVcEhGN05keDdEd0pqYmZDR3RGZG1qeEJp?=
 =?utf-8?B?eGJvVWFrZlRQUHFkc05tZlpBVXJISU1lMk1FVzZLMEgrVGVyLzJrZGtLeGti?=
 =?utf-8?B?c2t2NkJGdDU5ckt3c3loR242LytGVmhmcHRhSGY0U2pJamkxcDlXaERFdHk2?=
 =?utf-8?B?dDI1NGROMGJEa0FaTDNncCtFK2xhWGpTK0xiTkF1WjEvZ0piYnBHUGRsajFL?=
 =?utf-8?B?ZmZNM0U5dGJtN3pzd3VMVzFwZXltVmRpaVJLbG1tQS9xZWtsRzdmd2xVd29E?=
 =?utf-8?B?SElDOVhyN1NGeGtwMmx4eUg4a0FKMFE1RmZ6Tkp4VW52RTNvcVVsNjd5Rlo1?=
 =?utf-8?B?TW41TnJQbkdYRy9NTHUweU54U1hGSk9uZzcrdC9HRFMwSGRIWXdBd2wzOTFz?=
 =?utf-8?B?VTZVU2FTbW55M1RtWTJmdFlYVkQ0M2ZscGM2bmt0M01NVGxiTnp1SmRqVlV3?=
 =?utf-8?B?eHF1MHlTRE1lT1ZYVEhmMWw5Ty9QT0VwTUd5ckF2WUV2OTRtWStoZDVaa3ps?=
 =?utf-8?B?NnJnUzFTdVkvbklJOUFrbDh0Y3NCODloMFJ2TVNYbmFidjB2SnJRdHVRenQz?=
 =?utf-8?B?SDN5bmVnWG1SRzBFUVRLY1hJcGd2amlTZnVmNy9iRUJNUWlHN3FJeXM3a2Rh?=
 =?utf-8?B?dkhrQjhwZGgvMXJuMi9QUXVLc3NrTm9mUnVxaHV3TnNxYnROZXYyRGFvbE1P?=
 =?utf-8?B?cWl0Y1NiVEdNeGxFR01kdGM5SzVRSVZydkR4VzlUN0pDcUVtUDNQN01rd25p?=
 =?utf-8?B?S3dKMHVnZ09lbnNyaERqeG5ZczIrN3hoMEt5SmU2TGV3VUcyNWppRzloREkv?=
 =?utf-8?Q?kOe6x6bQwnwMM6NJu4KrOOaYQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c998f89-9dce-4d0e-021b-08ddaa5cd2ea
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 09:29:41.2132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpCkxPR9jVpYSWEPoEggHAUGQ7qYdHQZRqrjUqdazoJ6+oudb93IUZDwP029GcFStDwwtQ9aL+TOw49PcQqoXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5637
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


On 6/13/2025 2:30 PM, Christian König wrote:
>
> On 6/13/25 09:15, Sunil Khatri wrote:
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/clients
>>               command  tgid dev master a   uid      magic                                                             name client-id
>>        systemd-logind  1056   0   y    y     0          0                                                          <unset>     5
>>              Xwayland  1733 128   n    n   120          0                                                          <unset>     8
>>       mutter-x11-fram  2048 128   n    n   120          0                                                          <unset>     9
>>              ibus-x11  2071 128   n    n   120          0                                                          <unset>    10
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client
>> client-1/  client-10/ client-2/  client-5/  client-8/  client-9/  clients
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1
>> client-1/  client-10/
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1
>> client-1/  client-10/
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-1/pt_base
>> 81febf3000
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-5/pt_base
>> 81febe9000
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-8/pt_base
>> 81febdc000
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-9/pt_base
>> 81febb2000
>> root@amd-X570-AORUS-ELITE:~# cat /sys/kernel/debug/dri/0/client-10/pt_base
>> 81febaf000
> First of all move the client-* directories one directory up.
Isn't it better to have the clients under the corresponding device only 
in that case user dont have to find which device they belong to and we 
dont have to create a symlink too back to the device.
Infact /sys/kernel/debug/dri/0/clients is also drm device specific. If 
we keep it outside then in case of multi gpu from different vendors, it 
will be all mixed up and i am not sure if client-ids are per device. if 
yes, then there is possibility of duplicates over override.

Regards
Sunil
>
> You put the directory under the debugfs directory of the device, but the idea here is that we can lockup the client device independent.
>
> If we want to know which device a client belongs to we can easily add a symlink from the client subdirectory to the device (probably a good idea).
>
> Regards,
> Christian.
>
>>
>> Sunil Khatri (2):
>>    drm: add debugfs support per client-id
>>    amdgpu: add debugfs file for pt-base per client-id
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 14 +++++++++++++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  4 +++-
>>   drivers/gpu/drm/drm_file.c              | 13 +++++++++++++
>>   include/drm/drm_file.h                  |  7 +++++++
>>   5 files changed, 37 insertions(+), 3 deletions(-)
>>
