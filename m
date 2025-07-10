Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AD7B00B7A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 20:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F148210E238;
	Thu, 10 Jul 2025 18:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="P+Hya50x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2058.outbound.protection.outlook.com [40.107.212.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62D510E238
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jul 2025 18:34:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPpzQ9ZRWBpUfTL/lGkPwsvVdh7a51p9V7uAssldPIpYHE0Iq9CCcVxK+Crb3dF6N9KlosL4AOfc8BF0E0M71CLs3GV07sbZAqcS6md1bIb3js4nK0ElXLFjvGp+rGSOfFhf+3gZrSxI06J2GrWa6x1Lh3i5TsNu5W753DefJ7rH+ts7rbJYXQDIbo/GkToZSzr12a/DBha6++RsEcwvwOCwU/6C7rnrebt5JnG9boQrPoTPx06vWgBYm68uhkdK5kWRcvwlV4htU7ZHDbWdk5FN80aObjPqIiI54MsWwd3bj5Cp+GcZ43ZDCrX+cZFHChBAc6Z66Zg4TJ/PoR45Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXHYNZJFDLi5NJ9kRnfI4UDgPD/v4oYWVhoG8oAthJo=;
 b=JKClJu+hLKzTr1gZwSTwgr3ev3hU6Zs4Nco7H+0gWUk4mdn2PxUO0H1tclzE/Gxu5maBON7SEoH8fiKms1rWDZaSFpjKVz4QOQNX2GWh4jkGzCmZevz2gPZ29JVq1CzXI8o3yDEywzrT/811hxiXeXq3UtB3vYCbi+gh2TbuAcWa2H/+9L7xc1N+B+C6X8WtglEGfKbpBrXMIdhd1w9gvvCcMCcFYF2VH+JOvErwcYybDuNw5Y15O5ZDaujhu4o75T7r1gRk9zS3Hx1IlVD41VtlGjC6rfFEOh1cnTEGNq86xoAwF2E9f3UbJvjjgE9olInBhwm/boP1yyENeQgONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXHYNZJFDLi5NJ9kRnfI4UDgPD/v4oYWVhoG8oAthJo=;
 b=P+Hya50xcXer9mLGBx9iuChtqHXPvdHjcj/p6WZ/qfncqVCy25qiP9m9pRbHL4cM0SqCZEh5d5BiDauV/mr3rB6cEsIaF9b1Arz/Tjo9O5J2yaPbS2nfty0jBgYK0KugSsp+H4feTOVx5fIFVIbcddlWgpK5bQpUetrWWVkWyD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 by MW6PR12MB8949.namprd12.prod.outlook.com (2603:10b6:303:248::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Thu, 10 Jul
 2025 18:34:29 +0000
Received: from BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc]) by BL3PR12MB6642.namprd12.prod.outlook.com
 ([fe80::aacd:a6d8:e180:46bc%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 18:34:29 +0000
Content-Type: multipart/alternative;
 boundary="------------okRpPdAcinJUPqBTuLfDjM9z"
Message-ID: <1b930d09-d139-4f0e-9905-a343d4b5a4da@amd.com>
Date: Thu, 10 Jul 2025 12:34:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 1/9] firmware: xilinx: Add IOCTL support for the AIE
 run time operations
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Williams <gregory.williams@amd.com>, ogabbay@kernel.org,
 michal.simek@amd.com, robh@kernel.org
Cc: Ronak Jain <ronak.jain@amd.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250702155630.1737227-1-gregory.williams@amd.com>
 <20250702155630.1737227-2-gregory.williams@amd.com>
 <603b1938-2fc6-41d7-b751-1fcab44f1711@kernel.org>
Content-Language: en-US
From: "Williams, Gregory" <gregoryw@amd.com>
In-Reply-To: <603b1938-2fc6-41d7-b751-1fcab44f1711@kernel.org>
X-ClientProxiedBy: SA9PR13CA0149.namprd13.prod.outlook.com
 (2603:10b6:806:27::34) To BL3PR12MB6642.namprd12.prod.outlook.com
 (2603:10b6:208:38e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB6642:EE_|MW6PR12MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: d9955f31-0597-49be-4aea-08ddbfe0679a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHBvbGdVaDNEckMvMFBmczhJNmk5MHZSUkhrbUpvM3NZdXNuM0h6US95U3JS?=
 =?utf-8?B?VHBOdHNLL3lqSFlOWndhMFhGRlJiVmxIbVFDNUw3OEIwdG9VTlZtdVV3eDNa?=
 =?utf-8?B?eU5obGlVRXpVdGVaV3F6SlZzK0t3TFhGb1FKSDg3eWJBV1U3c0NzVmhOV1lk?=
 =?utf-8?B?ZWRXYzlKWFNwYldDb3IxbzlTcVVjZXA2OEtPQi9TMGl5YkEwazFia3pjYm15?=
 =?utf-8?B?RmdSK2JXQTdqY1J2YWNUWXAzQmIxVFVXaEI0NXJrdVVZY0hZOVdBWURLMW9K?=
 =?utf-8?B?a05ZYnkreFFKdCtTVDE1VnlMdkZRZFZhd2k4eTBlZDJHeXk3UHBOTS9IcHN0?=
 =?utf-8?B?dnNoZlhHZmQyc0Y1TEJEbjJ0Nlh1L0RDVDY2Q3RrSldCMFQvejlDeGo5a1Bk?=
 =?utf-8?B?ellaNk1FR3RRT1ExTnhJZFlMRCtWK2ZpNDRrODZZN2JJNjBCbVlTUjZDRmYr?=
 =?utf-8?B?Y1IwSjc2QUtEU051WnhZWk5sNjlaVC9oOGhFUXg4WHJGMGdyTE45MjE2eDYw?=
 =?utf-8?B?NWdzb0RrZzNxQlJpR2pYaVRKMmhJbmpPWURtUmVBRDJoWE5kTUJmY3g0NTFR?=
 =?utf-8?B?Qms0RjdwZzRwZnBDOXBkUzBSZjZuL2h4RDhGc082UithV0ltbVFiNksxNEEw?=
 =?utf-8?B?OGd3aVFOcVg4UVZHeHplTVRHR1pKUmlkYzkxL0tSd0xzV0dzQzdnNnJURVU3?=
 =?utf-8?B?WnI0WUZnRHhwdy9qK2h4MldRamR3VDh1eXBqU21DZDluRW9JY05CNERuS2Ev?=
 =?utf-8?B?UDZqeThUYUFLSnVLNHFXcjBrSlErM1RRbzJxK08ydi9WWk1vVjFaM1NzVW1q?=
 =?utf-8?B?bTREQnhaWnVhUVRJTHdaU0pUOElNYU5oZkdoeGMyZXR6TGgyQzlQL29lTktD?=
 =?utf-8?B?YmMzc0lVMy9EVVM0UEFQNlVld1dMSUdVbUo1MFQrZytJM1lScGZFaURFTmwv?=
 =?utf-8?B?QzRnZWhLOThmN3lvRWdYS1lmZ1VtVmFweC9JS2wycWFaNDIwaURuR1BXZU94?=
 =?utf-8?B?VkZZZ2xIWUJjN25pNUVtdXc1WmozM2U1S1R2aXQ3MmVtS0tsRXNRWDIzMlJx?=
 =?utf-8?B?MWlFTTBtek5yM3VmblZGdkVkaVcyUjNtMnBDTktaRFVoTWwrd0tVeGc1dDBB?=
 =?utf-8?B?T1dYZU56R2dpYkFSMzBMdjhjdnFaazYrREVNNXl0NHdtNVNoNWVIbTBiMTFC?=
 =?utf-8?B?N05SSS9GQTVEWkxWNkdjS0c4M0pNU21FZXVRL21QMnlCSDlUYzRPUnF3NTdP?=
 =?utf-8?B?cHkra041d2I4WkdkQjBaSndGU0tIVlhaTzFYRGZRYTRpU2tMOXNBTmc3MXRS?=
 =?utf-8?B?QmdlZkloazZVNzd5Y3V2Ny9kMkJHci9HeEs3WHhBVU5FS3Y1ekZEYUZhY3Jz?=
 =?utf-8?B?YklpUTUwVzRMb1JtS1dudGRTam9Ra2pWMkhSQnUxNWxFSE54bUhVZ1pEdlJP?=
 =?utf-8?B?aVpwazNyZWRJRUs5ZTlSbkxYcWtCdE1QbWJ5RlUrU2ZpVnp6eUozYnpKQTJ0?=
 =?utf-8?B?cHk4dXRJeFU3UTgxRm9zY3ovQVdGZlNZV1NreTZZYStyZXA2d3ZuN1BRYlFm?=
 =?utf-8?B?a0plM3hxU051L2d5VjM0Zk9GSGJYOFI1WHlYci9aTGJjM25tRVp4bTk0UGta?=
 =?utf-8?B?SVYrOHhZSDg0bTZsSlVWWHplb3d2VG1YRWhyMmNxM005dUZmM3l4d3Z3STRM?=
 =?utf-8?B?OFhKV3BjR1BsTU9EK1pIVXhIZS91T2ltQ1pReUhmcXFWMEo1YlJDZTczSGhQ?=
 =?utf-8?B?cFg3RDRqYTRFdTFiME42dW85cmo0SnllOG9pV2FrcURvVlBmYWpSRDRwclJq?=
 =?utf-8?B?RU5TeTZvQm9USEtuVlBpbU9DZEVOM1cweGhYM3JrME9XTjgvNTdwdVpkUDhn?=
 =?utf-8?B?MTRwR0oxby8rbTdybmt4eEIrei9sU0Jib1FhZUUxM0Jjb0FQMVdJYmxhdytO?=
 =?utf-8?Q?XjRjktzniPY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB6642.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmZxWC9FMzZ4TFZoZm1HeW1JNDdVa3liYTlKdXo5UHpwSTFjWEp1QTVWMHpq?=
 =?utf-8?B?OVlxVjkxaWo5L1l0QzlzTGtocjRKV000UUVWYmdQUjAva0MvV05UL3pVNlhG?=
 =?utf-8?B?RG0rbkJINUplTDJuc0RoS05UNldTYmxQcGhTNTZFN3ZpVjlsT0JkYWo1OTRL?=
 =?utf-8?B?RUt1TXRCTXAzZUtBeUNsOC9hVFJGVXo3c0orMlVYSVFxU3JrbjhGeTRPMXgw?=
 =?utf-8?B?RDh0ZHIzZXFWeVdmY2hPK2tQd0JVUmtvd3l6REQyNGdVd3JZS3RuaFpKYmxN?=
 =?utf-8?B?VndWT2VVTklOY295SGYvSENTeW1HN0JxUldVaStBK2J4a1AybnNVZnB1Q1R2?=
 =?utf-8?B?UU52NC85TDlkT3o0dUp4a2pDK0NLZnJNNFF5ZVAySERUV1pyZWtHbUQyU0E4?=
 =?utf-8?B?VFNwZ3ZXckt6WVpGckUxUXVXd3l1WGFuMWxYK3ZtWWRsSW5QdHU0U1BUdGJD?=
 =?utf-8?B?YURWcmdDQUFrbG1MOWtxUjJaaDdBellSV2w3VG5sRXRPMll1TmxPdTNGR3kw?=
 =?utf-8?B?aVYxVk92RVhrOERlZGJjRktEbFdNMEU2YndlbHZOamxqVW4xS3B1azdsUkVO?=
 =?utf-8?B?c01mN1pGK3dzMHc2TXdmTDdOcXpIWlFQZ1FLYk56ZnhxMmNzUmxTaWZweVNK?=
 =?utf-8?B?c2NQc3pCbVYyendobk5ieDU2dm1Rb3U3L0EyT1JGb095T1RJcVB5QlRQRnBP?=
 =?utf-8?B?bmZSVkMwLzdnSDM3ayt1emFoWWgyNVVZZEdhbDU3TVhyUjMwTEhmWFc2dTJq?=
 =?utf-8?B?M3J0UTdUbjE1blFGcmFUSi9NM252SkxvcXVoUE13YTZNNGYzdU5laXA2YThD?=
 =?utf-8?B?c3VEbUVldzN3TTF3eWFXQ0tXVVYweStjZlZJbU1PTWFnQWNQTWlMWGUrMzBH?=
 =?utf-8?B?WFJxQU42YVZqc1pUaDQ0L1hMNDdnNUdpd2dhYTh0VTEzNGVKRlBhZHk5SFda?=
 =?utf-8?B?YVZ5ektsT1kyVG1xdk5GbmlmL1B0SnVacVVNbzhQTktqSE1IZHViRWFDRjg4?=
 =?utf-8?B?Q3Y2YjRIemRtOU9xYVllSUZYYnBrUUdoTFRKV3NYTW1nUG9EcmI1YmtZajN6?=
 =?utf-8?B?OExrNTVjV2ltUUduYzdudytFUWhUdmtuc3B3aGJVeXNBTW9SN1VjWmgveEhi?=
 =?utf-8?B?VFcyaUJ3VTJ6eDA1aVdGMTZ5UTlUY1ZkeXZxYVRUWW9uekJjY01QVmpSYzhn?=
 =?utf-8?B?L0pVL3ZNQ1lMNlZ5aHJweW9ZdkRkTHJkY3R0TlBLZEJ3a1JkZ1QyTEN4TWNw?=
 =?utf-8?B?R0ttell2RnhFNlgwL3dJVnViZ0ZxSnhveHlvd0daUDZwN2ZIZ1ZXYVBybWNk?=
 =?utf-8?B?Wjh1N01qbGpTS2MxQjdMODl5ZE9KeDI0VThXWEJNTHNQUXpJZDI1WnBVbmty?=
 =?utf-8?B?VlBodnFuMlJtVEN1T1gwSnZ1QTVvMmdQYU1lVFpUK1UxY2FQd1Iza1RoYnYr?=
 =?utf-8?B?a2M3NTZLMkhYdy9iVE8vaEwwSkV2M05tRmp2M2gyNk52OXdUdUsxWU9vMFVD?=
 =?utf-8?B?VjZBRmJlM1NzUHc1dWNPTjBiZ3JjYTJYUDJ4cFpnY0ZuTlltK1BvUVR2NnUw?=
 =?utf-8?B?V3Z0K2VVTEFubjdKcXkvU0FCNE9vTXFLV2JBdUNKSCtCbVdHVHI1a2srM3hR?=
 =?utf-8?B?OTdGYlljdml0ZStGejlzTHU0OUNXalhUbEZ5b2ZuSmprdFFFcmZtYUhNbDVS?=
 =?utf-8?B?azVVd1FFc1JhNkM5ZmVlVHdHNThMVHEwODJrc3VEMCtZM3FZZWJmdlRvZlZJ?=
 =?utf-8?B?ajlyNW4wdDNrRDVyZ1B1NXdoOEY5R01MWlVLUnlLNVVuK200aSszRjQvUGpF?=
 =?utf-8?B?NmJZVXRCcmhrMWxoUHB4SStuZTRTdFhnbzR0OFNWTjhubWhLTjE5ajl2VGoz?=
 =?utf-8?B?Y1hnRVdudmdrQ3RqSEtRYWRJUEQ2RlFobTgyMTYzYWs2RGszQ1N3SG5GMGJo?=
 =?utf-8?B?SjQ5SHJXcFZzUlhZV21abHFvUjc4RDljVXQrKzFYQkNTN3dkWXh2QndFSmkx?=
 =?utf-8?B?MUg5MnZoS1FobWFSS3lVTEVjRjMybHNkMy9TcmQrd0hMUWxkVmp6cG5seVVm?=
 =?utf-8?B?WVpWL1ZDTkFBNjA0djcwdGdPVm5aeXk5QjNoek9LSjNnTkFrbnVQVDA5WTdx?=
 =?utf-8?Q?QMOqMlwvWlaU/obHJfqH9DDsD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9955f31-0597-49be-4aea-08ddbfe0679a
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB6642.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 18:34:29.0207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dLA0ZyU1CS8HKer9IJb/JtBnB6J2nMx0p8iueNUXfQtFlVBTSa8Mctz6+AInT4fCTZ7SBMJwlfcDAAxO3U9OXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8949
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

--------------okRpPdAcinJUPqBTuLfDjM9z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/2025 12:50 AM, Krzysztof Kozlowski wrote:
> On 02/07/2025 17:56, Gregory Williams wrote:
>> From: Ronak Jain<ronak.jain@amd.com>
>>
>> Add IOCTL support for the AIE run time operations listed below
>> - Column Reset
>> - Shim Reset
>> - Enabling of column clock buffer
>> - Zeroisation of Program and data memories
>> - Disabling of column clock buffer
>> - Enabling AXI-MM error event
>> - Set L2 controller NPI INTR
>>
>> Signed-off-by: Ronak Jain<ronak.jain@amd.com>
> Incomplete chain. Read submitting patches.

Hi Krzysztof, thanks for the review I appreciate it! I will make sure to 
fix the chain when I send V2.

Thanks, Greg

>
> Best regards,
> Krzysztof
--------------okRpPdAcinJUPqBTuLfDjM9z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/2025 12:50 AM, Krzysztof
      Kozlowski wrote:<span style="white-space: pre-wrap">
</span><span style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite" cite="mid:603b1938-2fc6-41d7-b751-1fcab44f1711@kernel.org">
      <pre wrap="" class="moz-quote-pre">On 02/07/2025 17:56, Gregory Williams wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Ronak Jain <a class="moz-txt-link-rfc2396E" href="mailto:ronak.jain@amd.com">&lt;ronak.jain@amd.com&gt;</a>

Add IOCTL support for the AIE run time operations listed below
- Column Reset
- Shim Reset
- Enabling of column clock buffer
- Zeroisation of Program and data memories
- Disabling of column clock buffer
- Enabling AXI-MM error event
- Set L2 controller NPI INTR

Signed-off-by: Ronak Jain <a class="moz-txt-link-rfc2396E" href="mailto:ronak.jain@amd.com">&lt;ronak.jain@amd.com&gt;</a>
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Incomplete chain. Read submitting patches.</pre>
    </blockquote>
    <p>Hi <span style="white-space: pre-wrap">Krzysztof, thanks for the review I appreciate it! I will make sure to fix the chain when I send V2.</span></p>
    <p><span style="white-space: pre-wrap">Thanks,
Greg
</span></p>
    <blockquote type="cite" cite="mid:603b1938-2fc6-41d7-b751-1fcab44f1711@kernel.org">
      <pre wrap="" class="moz-quote-pre">

Best regards,
Krzysztof
</pre>
    </blockquote>
  </body>
</html>

--------------okRpPdAcinJUPqBTuLfDjM9z--
