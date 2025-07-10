Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB45B00BAB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 20:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D243210E946;
	Thu, 10 Jul 2025 18:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ppbfz5QP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C0910E946
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 18:53:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoQO5w4htxva1wUTygiPFnmMns6JmTtKmqU5ya2+mq5Jj68F+KWs2XBaUtR0KyrUyOH1w+HIG/VnKovR0oMQdQH0voRWhpO57v4e9rEFdaZGxgHBAlKVaqeh0woO5Ds6YIpfbOUGdz5Sto6p8cychk6NbRQqaSCwpIhwcqscFRGu1DSIDr5WXqyD0SXzZInTunYraXtvdj/+ghw/qYaL1KNbYFtZjGrvHVxQquZGZugNitZLyHGO9jvRA7sMeZm0JAfgYnqwYg/FhVKkr6rtBecYiw2DxO+7ECxVdG5KD4qQ7ic6NXk2i1zo+RA/R8JmacueGyskj5jYdRbxZv8EcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqDh5ntcAez8YrGnHmsPrgh1eh+pG5B/NIX7at9J/YE=;
 b=v6Bzg1HIo6epfNQB7JBL0HEP5GCQx4kZS3ZFcSXgnLBQHh+PoqPRIGEF/9fQy/MtnZ3wSbhH5IvIwlOBxMVXSfUv3Qxgxj45G0KRcwe98WqBlS0qRLGIyUAKnNIyaxi3Y+mbzmWX4UMa/0M+vowqJb6rD54e5n4K4PPOztm18wIprnTKbnMvpPf9mmzHQH8aDmhBjE1CqWqhpXJeHyQv5IjYjxxOk9HntgiOmmkxBXOCnvm61xcVn7z2XbNRuk5vtpFj2KNd1rcH1TsRPql9FtyIq+iMQph6GG4GABKI95cYp7r5jsKFohRUn+9ZKIBu7Ft5wPRNr/j7AigYT1x77Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqDh5ntcAez8YrGnHmsPrgh1eh+pG5B/NIX7at9J/YE=;
 b=ppbfz5QPitUDh6M/6zsSZj+5jS94EgkXLyePqusI8ADhGGpjfZfv8kD03wrv5iw79smNytxw1FSswBrBebLyb6BdjPosEcR8RXrKGQzNzSmswGo5JtfIHgPG65zJpC93ehb4eLdoPUJIkzpw77XmKyAakITSQ8JbGo16gdTwxZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 by MW3PR12MB4490.namprd12.prod.outlook.com (2603:10b6:303:2f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 18:53:52 +0000
Received: from BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc]) by BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 18:53:51 +0000
Message-ID: <d4beb853-12a4-43ec-96af-9f6a7881600f@amd.com>
Date: Thu, 10 Jul 2025 12:53:48 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/9] dt-bindings: power: Add AMD Versal power domain
 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Williams <gregory.williams@amd.com>, ogabbay@kernel.org,
 michal.simek@amd.com, robh@kernel.org
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702155630.1737227-1-gregory.williams@amd.com>
 <20250702155630.1737227-4-gregory.williams@amd.com>
 <6f4f68af-7b24-480f-8dae-372098b437fc@kernel.org>
Content-Language: en-US
From: "Williams, Gregory" <gregoryw@amd.com>
In-Reply-To: <6f4f68af-7b24-480f-8dae-372098b437fc@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::22) To BL3PR12MB6642.namprd12.prod.outlook.com
 (2603:10b6:208:38e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6642:EE_|MW3PR12MB4490:EE_
X-MS-Office365-Filtering-Correlation-Id: 8015b98b-3e66-422b-6a49-08ddbfe31caa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1dZOUs5ZFZjRnVCbG1rM29hL3piWnpzTXpsRjNCaW1hT0ZGcGFxWG11UWNE?=
 =?utf-8?B?VWxjdGNQWlQxNlROSCs2ZFRPMmRRL0RsRFlpSm5vZUlUMEhWbFV1NkZvM0Ju?=
 =?utf-8?B?TnpVWGl4Wk9ydko5MzdkMXVVRzNHOTNOYlNnWDlrUjhHeThoUjZaQVRWUEVF?=
 =?utf-8?B?Q3RZWnhIeWdUQ0g4UGFQbFZ5c1VVZnV0WGh1QkJqWG1CUjB5QjVCSXhPOUdy?=
 =?utf-8?B?aHJyOU9OQmd5QUJkRTBxS1F2d1J0eUJHV1c4SFBZaWxsM3k4SmoycHBFdkNE?=
 =?utf-8?B?UkVpUkpzTmdkd0lRLzZrNTF5a25TUzBXZzU1Rld4UFJVRjRFZXlGYUxMdVFw?=
 =?utf-8?B?YWtUY1NhTzJCckJCUHFiQTNlU1pVNDRyOGVLU1pRakEwZFJtYm5NWHZlVS9T?=
 =?utf-8?B?YjZjbEhxU2F1VGx5dnY4SDdCeGNIMjBma3FWaElaSTdZZXJuNDJOVm9yNjZY?=
 =?utf-8?B?SUdhLzlWOHkvSUdYb3ZkblZxQmovYmhHMzF3Vis5OUwwSEpDOUcyeGgzc2ta?=
 =?utf-8?B?Y2s1NGJ0clkxczdTR3YvRkQ2Z0tnK051NzdYWngwcEprSGhKK2pnVjJocXMx?=
 =?utf-8?B?em4xZDd4Sml2MFJNOXQzMXVKNnFrQ0t5bFhBdnJIdVp5MXdRaFBCKzJzZ0lC?=
 =?utf-8?B?WGxvSkNJQU9heHZtTXlUNVVJeHlmNmloSFU3akJuZWYvNXFXbU5xZlpXMyt2?=
 =?utf-8?B?TTJHZ1Y2a3owY1VFNDJVeUROY29xREcvUU1RZmROd3ZyRVc5UEdlZmNHbXRC?=
 =?utf-8?B?bXBlaElYb2JqNGIvREFjWnNJWmM0bm5oOXp5di9RU1A5cVhlL09ib2FnU1h0?=
 =?utf-8?B?NVl3ZkFNMjRVdjRtL3cxaDZnaGFxNlRmb05xUVE4b2xWQnhreW9GVlZ6SzV0?=
 =?utf-8?B?WHpUUmRtb3ZvYU9YcEgrYTFTZDZVVUhPTFc3YzZJRXNnTlFqdDlOY3NyMExn?=
 =?utf-8?B?TmxGckFBSGxMcHNmeU1vR29UczRwL0JLWmJQSjdsR0dDVFJDMmpvQURjUGpJ?=
 =?utf-8?B?RnZQK09qZzV0RjVUbklLVWxlS0EvcWpJcVBVcEdUWGJDWnlsa1psWk4xN0N0?=
 =?utf-8?B?VUoyUHVWbFN4VVlIRkVqMFpNU0dJVmZUUkkzYzAxMXYxd1JQT2NLMFZIOWE5?=
 =?utf-8?B?bmRSNHd6WE5nK2VrT1NxN0ZKTEZjbDFrUjBxQ3JGT3dzUFV2TEVZT0UzcENV?=
 =?utf-8?B?ZGlxTGZ6Rm1jVGl3UlRIRlN0UnU5S1dDY29SN05maHN5cWhIZm93Uk5XM2tz?=
 =?utf-8?B?MTFxVnhVOCttZEo0SjZOeW5xTi96YllrelI2eUJ1emh3dnFaNGhVeFY3VG1Y?=
 =?utf-8?B?anVobVpFVGRqTU12YjNIWm1HM2d5SG1HdUxSYUkvQ3hDL0Y1ZHNsSjU2V0o3?=
 =?utf-8?B?YkxiNWluMnBiNlZWdU9IY2lKNjhlT2pNWmxNOUdKRTJ6a3RFTW93L01hSXdx?=
 =?utf-8?B?MHpYdlJLRGQ4R25RQWN2RGR6Z1BPUFdkamVURll5YzNFd1dqOGVWcXF2ZXV0?=
 =?utf-8?B?WnpQK3FIbnlXTndTem5TZkp0WlRCd3NjSDZlUWhiZEtFcmlFdytwRERxSFlI?=
 =?utf-8?B?MFd0Y1ZmRjlNTEh3aElsaWhqdTlpQjltUzZSZGNSWWVvMkZPdmxWUTduT05L?=
 =?utf-8?B?TGg0QzdyMVI3TXIyQ0FEQUtGS2puSXBndklhUUR1UjlUTnpYOGdJSEpJclJK?=
 =?utf-8?B?dlUzeFB4UmdPQVUrMjFzOG5CK3NxV0JOUlVFcDVpaUhlcWgxeFIyeEhLWUIz?=
 =?utf-8?B?RWV2aXpWUmJhcjZWNGdYaWhPdWZIeEhzVnpsRzhHSkdBWTkzTjV1QzBGSlRC?=
 =?utf-8?B?NmlPQk9DK2ZacCtXaUcrZmc5UHR3cnhSeVlMNkh1N1Y5dHpqbjgyZ3RTb2Fx?=
 =?utf-8?B?YjdraFJqeUk5RFEydFdCSzhZSUFiYTE4VktIYTFNWlY0KzJhdGVqTFlGOVNh?=
 =?utf-8?Q?0X/EmE+iJLg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6642.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGdSZ00wVmJIWG92VHRmdC9XazBFLzl5dGQvOHdEaEg5VHpNcmxFU1psOVJl?=
 =?utf-8?B?ZUFCc2ZGMFdmZnVjZHlCWVd6ZEVUQjhCdzZrZWRvT0I0R0IxTDhLNUJqY20x?=
 =?utf-8?B?N29GTEczaFQ4MnE0eHl5SEFzU0gzR1k2dUlXajFkNDdiOXQ2S1BvQnBqaGFP?=
 =?utf-8?B?Y1hieGpCVk5vVFUvWTBqS3NkL05zcVhWVDA3VnlDSW83VHY4eUdJSFdsOTh1?=
 =?utf-8?B?ajFlaklGaHBydTZvUXFSMzlvQ3hEQk03TXVmMkVDN1k2UjUzRUdsRG5VYkUw?=
 =?utf-8?B?WFAvL2FYQURPWnlqTEI3RStFbnRJOFVLbkpPTGs2cmlIS2QrRlRJQXp0ZjNu?=
 =?utf-8?B?cmJnS05wTDZ0dURuTUovbVY3TFUwUGZ1ZHdWdmp1MWc3YVhZRDJ1V1hQRWlE?=
 =?utf-8?B?SW5VZzQ4Z05PaUMxT3J5YllqTTdCOHRYWkNRL1B3SHBaWWRPR1YwSlFFemgz?=
 =?utf-8?B?NXBxby9talR6ZkJLRjVOTkVlZEtFYWF5djJtQzVvNERJdlpoNEU0Z1cxT0s3?=
 =?utf-8?B?b3hTOEgxWFJQYUhaL09UeWhCb1ZpalhNNXpFTS9MaEJVOG1SU2tzQnlJQmp5?=
 =?utf-8?B?UkZxUGlGUlBpUzR6bUVob0lzSmw1K3VSNEs0UC82MnVoVjA3N3NvTlBiSUVa?=
 =?utf-8?B?bzByT0JVK3V6TFo4UEVxa21KOUU3ZEhlYlkraFBuekhyZ3JwbkdaWlJSdXZw?=
 =?utf-8?B?aXpWUW9ZYmVDK0lGblkzV202L0JuUERaaGZ6bld1S3gxV01LNDNRcTFla3or?=
 =?utf-8?B?THMrL2Jhc3NxandkTTJsQy9wT3h5alhYR2VSbEdBNzFZT3lOSHN5cUdTQ3VM?=
 =?utf-8?B?d3ZZbkJ0OVdNZ3IvcWIxVTVZZ3AyVDgrNjBvTTltRm5aZTZVbFUrK3lBVFFR?=
 =?utf-8?B?L1l4bUpwSXErc1ViWUY2blVNd2l5L2hzRVcwakFCTHVNY3JSa0VuWURZVm1y?=
 =?utf-8?B?T3A0b0ErZkdHNDN3TUNXR3JYWjdMZWxvUUc5dHEyYytxaFNNREUyRWpRdm1v?=
 =?utf-8?B?Yzlyc2k3UjFxK0g1UXh1VWdQS0hEVU0vVUFLcnZCY2JjRGFsUTV0T3RYS2pl?=
 =?utf-8?B?S3JyQ05SQlRrekFmNTVnS3duWE1vbUFCdG9DeXRwbUJqRUpPM0xKa21DRnI0?=
 =?utf-8?B?N0VpNVRBcmdtRnU1VkwwYUhCbWxrVFJHOXB2U2lDT05jTVNtU0tXLzM0WFhz?=
 =?utf-8?B?ME4rRzZxWmNRV3ZLN3pnUXhkUmdpM1JpOVk1K2xQZTMxVkNvYW9qNE1LakVT?=
 =?utf-8?B?NTl1NXNVYXhkSm15dVdHTUUrSk1aV3k5MzEwVjdxaEN5ODB4SUpKVGt6OUpN?=
 =?utf-8?B?WHhPZnNNcExFdzh2MFpxVXA2Y1dCYk0yVFV3YzF0MmxZWVpyMkJKbEhvKzVP?=
 =?utf-8?B?Y0xDR0t5cDk4Y2JuZDRBNFlkYTE4d21Fd1VsMWplNmlVRG5QdmdkS2grajha?=
 =?utf-8?B?a3hrb0JqeWliNHA0WTN2S0o1eEhjYWpjQ0VKRklFY09DOStrWHNLTkh3cmpU?=
 =?utf-8?B?dUx3cnQ1eVFVbmREZXAvMFJudldIS3Zwc2lOd0R2Rmd0am5wWUtOWGY1a3FP?=
 =?utf-8?B?eE55ejVmN01YRGtDcWRTK0tZSU1DVXBIVkpxakl5NXh0TGhORnNQQjR0ZFZ0?=
 =?utf-8?B?SExOcFlyazd3M2dueWw1VGhlTStrNnRPelhvY3BoUmtGQmsyOUhmdytOeUo4?=
 =?utf-8?B?TzNSMngwUFR0OE9HcVpvWlRiOG92RFA0V3ZOTGY2MUJQalJTK0FoRWRheVlX?=
 =?utf-8?B?ekZzVXFBZW1iUU44RkhUMXMxWVdLWmFhSW10NWZVUXNsTFcwSVlWSDFFZXk2?=
 =?utf-8?B?dWV3Q244Mm1weFYxS0FXT0h0NkdJZHVJYU42VjllL1o5RWtHLy9kQU1WcWYy?=
 =?utf-8?B?N3gzM2dPNGIxV1psOWNPYURCUWR3NU9paDhrNndkR0dOYWw2M3JMVmhDNDRS?=
 =?utf-8?B?YUx0YVl0blgrNnZCWDl2TlpYWC9IZGw4MEtZdE9YczFic0xJRFRmUGN6b1pG?=
 =?utf-8?B?d0FoN09neTJWN3JyS08vWjdZOVE0T3Vyb3R5dXJmc2cxUVdZV2pxOUlDMll6?=
 =?utf-8?B?YUF5RXZRSERyU2RDMVhFTnoxUmxhbVo4UG1MVHZ3ck1GRTlaK1RRemZBc2xQ?=
 =?utf-8?Q?v3QJtluxS+xzCK/zOHhZk6F5g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8015b98b-3e66-422b-6a49-08ddbfe31caa
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6642.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 18:53:51.8135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CL6vm8NnvAotMtMDtsHydsaK4SS6aiTYfbl+lax/5o/e2oamZyajL95EWQygBVIikKPQauvFExzrYDZBRfck6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4490
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



On 7/3/2025 12:43 AM, Krzysztof Kozlowski wrote:
> 
> On 02/07/2025 17:56, Gregory Williams wrote:
>> Define Versal power domain value macros.
>>
>> Signed-off-by: Gregory Williams <gregory.williams@amd.com>
>> ---
>>  include/dt-bindings/power/xlnx-versal-power.h | 55 +++++++++++++++++++
> 
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
> 
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> </form letter>
> 
> 
>>  1 file changed, 55 insertions(+)
>>  create mode 100644 include/dt-bindings/power/xlnx-versal-power.h
>>
>> diff --git a/include/dt-bindings/power/xlnx-versal-power.h b/include/dt-bindings/power/xlnx-versal-power.h
>> new file mode 100644
>> index 000000000000..effbc70e5a12
>> --- /dev/null
>> +++ b/include/dt-bindings/power/xlnx-versal-power.h
>> @@ -0,0 +1,55 @@
>> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
>> +/*
>> + *  Copyright (C) 2019 - 2021 Xilinx, Inc.
>> + *  Copyright (C) 2024 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_VERSAL_POWER_H
>> +#define _DT_BINDINGS_VERSAL_POWER_H
>> +
>> +#define PM_DEV_RPU0_0                                (0x18110005U)
>> +#define PM_DEV_RPU0_1                                (0x18110006U)
> 
> Bindings ID start from 0 or 1 and are decimal numbers. None of these are
> bindings (and commit msg does not explain here anything).
> 
> Also, where is the compatible using these? Why is this a separate patch?
In 'Submitting DT binding patches' it says: "The Documentation/ and include/dt-bindings/ portion of the patch should be a separate patch".
This define was only used in the device tree binding example, I see the issue with this and will remove for V2.

Thanks,
Greg
> 
> 
> 
> Best regards,
> Krzysztof

