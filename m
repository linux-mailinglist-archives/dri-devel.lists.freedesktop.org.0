Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5768E940FB2
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 12:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC0410E0A8;
	Tue, 30 Jul 2024 10:42:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4ysUP5Py";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B576310E0A8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 10:42:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i1Wn7VcEE4+M8pXUslBnw5Ssp6bE6hzSTh/jC6AljNEsHE5+8ZRGVg7qKCVKXtpXewzREBXpxNQnskN8gEoOxhCHd6ngh3mH/iyaqbtC9YOikuVlPrbSrHiFW/xXP/BQS8E9dzGbVIq79luu4kTExEI2CNFi4EHh/yP3LMB2bWfjboF4X4CnvL0JmgvuiAgNfYjokbPAE/53qV8pNvNBDYJnNw6uX1Xqzv1/Xg2LFda0VjSdmbworValZRB7uuLNR+PMMfUnSqFTFrKxRzvAS+AzH+59eNoMAX8CMFGQsXcmtJ5/T+tb6Bwh5F/E/VVtc1U2KndffAWJDYXC6z8bNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNaG8ybCk8w0x7UeGALFBUMfV/mir1cxlbB0JoEL3Y0=;
 b=RpS79Vy3ITCZUJhXj+p7zUmfiawhjsC3Pmt6ercIuacF3eEWXYLR5TjWLwjo95y92z3IBuAaEY0smbSRsBfJSJGqdjztInyyQDLYILb6LQCbBrDe2Hwl5qG1IhE8dB3I0wOVCt52I5mVlthb/OdnR+Djbdq2Oq9dXDI5aAWE03b1DuiIXG5J9GDDsNaKTnUYnQhcWVUFcK+g3NxNsRPX8BqqkAE9RpxdSM3sz/CreYoh35k5sQU2ZSA0yVFvJ9N5ThC8xnqKfb12Vvp6BO2Y5O6jSk1cnz5ICJn1MbpQjrfeWE2ew9hKrfl8pqmdxW9tiCNtt+wXyTt+BLzqc2nYhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNaG8ybCk8w0x7UeGALFBUMfV/mir1cxlbB0JoEL3Y0=;
 b=4ysUP5PyjcO2Aj6jeTFXltPtAkd8KdELYlX+JUSczjAPLiDI67CPtAeS7sD3R1Et+WTwZnr/JI753fF/AnKAPz2CCbfURuRfCmdMxtYjU8YHB55E1isBLZmbIUNlr0HwfrotE+ULgxvEEu4SJ2uSn33FtGPRi+mOGLn0/C9rRx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6441.namprd12.prod.outlook.com (2603:10b6:510:1fb::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 10:42:38 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 10:42:38 +0000
Message-ID: <fe460c96-fb5f-41e7-8312-a2aa30140042@amd.com>
Date: Tue, 30 Jul 2024 12:42:30 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] Introduce DMA_HEAP_ALLOC_AND_READ_FILE heap flag
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240730075755.10941-1-link@vivo.com>
 <Zqiqv7fomIp1IPS_@phenom.ffwll.local>
 <25cf34bd-b11f-4097-87b5-39e6b4a27d85@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <25cf34bd-b11f-4097-87b5-39e6b4a27d85@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0248.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d22cc7-88e7-41ce-bdaf-08dcb084545c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2s4RWZYYkRJYm5OSnhPSy9meGdJU1ZLSjltLy95MFc0NWo1dThjODZLVHNS?=
 =?utf-8?B?RFFzTmhVRWxMMkFLR2lLQUtFbHpDOFRxeVdtMzlReEZxUFNTYjdjMlY5REFj?=
 =?utf-8?B?TEVDTG5Ba1hkcUEyOHdFMXVQck5pQlU4SkxSdzlRK05nbzhKd3MxN3V3bjlC?=
 =?utf-8?B?UHFnWDNPTEFXWjVBcTN2RmxPS2xrTUZkL29vb05iNDVROXUrSEY3VGhuajN0?=
 =?utf-8?B?M3lSZElLTjllL0tObGpGVmhlcUhLcExQSlRYdGFyQTBmUGdvRUZ2bkZ0VmV2?=
 =?utf-8?B?alJUSTV6aUdSeGZiSTBvczMvQ29DODhXT1Z0aUM3cHJsY2FsZ2dZVEZKQlRD?=
 =?utf-8?B?dmR2aWZ2ZUdHcjJNNFoyVTM1SXFpbE9heTdFUVc1c2F3UC94S01xWWgzdGZL?=
 =?utf-8?B?NFNTK0pEWFNEc0xKa0grU1JwdGRBemp3K2VkdXVvbFdFMDhLYVhwUk5QZitr?=
 =?utf-8?B?NUZ0akh1ZUIya3dsL25ZMzRrT1dFd0FPU3BUVFh6UmJoTnlObXROOU1HR3ZM?=
 =?utf-8?B?aXAycU5NYVIybzlDSXhpbW9jUERWcmxOZFNKLzRoRnFNZFhlY3VTTUtWMVZz?=
 =?utf-8?B?NW81cEJKd095R1loMjVMOHZwcXR0NVVTUXpsN0NzeDFMVmIwRlQwWHlhOGlz?=
 =?utf-8?B?Q3pzZzcwVEd5ZUh2N2tabmhWOExEbmZSeGJMOEVBN1BnZmFZRG4rRHUySVFH?=
 =?utf-8?B?WWFXUW10Q1dqZUNZdzBzRG5Jc3hjUEIrZ01EcEEzUFd4cEptbTJkZEhwc2tn?=
 =?utf-8?B?dDNKemZxQjNjcnE0WCtuSDlYWXZZUG4wdklGZWIrR3pPTXlzd3JrVkNsT2l1?=
 =?utf-8?B?ZHNWVmovOWFVYjE1Q1Z5UUkxOHJuQzBING1JZGxVbndDWVZmQ1JjcTR6U0ZR?=
 =?utf-8?B?RGE2b0tvS0hoT2dFYXVLbjVMMXNDMmZlb3YyRUNqV2pIT1Bmc2V6OUJLYzkr?=
 =?utf-8?B?Q2N2YlZqZUtOS2tvOEZuWTBGZmdZVDBoemxoTUVPMXcyMVRYYlNuZTRReTE4?=
 =?utf-8?B?NHVybmlUdE5NYlNaN1JvOWNvUVUrdDk3eXhWbGVFWFI5VTRiaUs4N0graEJw?=
 =?utf-8?B?WDhIa0g5bnIzcS9xbkhoMUFNTGtjZ3RUTDA0aWg1SGFoK09JNzZkdnEvaVFx?=
 =?utf-8?B?WjArQ1U0T2ZnT3RSSEhLUlFnaU0xOHpxWGt2SnFaRjI5U05Pc1NXQUhpZ3pS?=
 =?utf-8?B?RGx2OGNSMGJkUFNPWXlMeDgxc1hXUmZNODExcHJNRTJOdUcxQkdlMjExSXpp?=
 =?utf-8?B?YXpyRXg1dnB1YWxIVW50NzVTcG14WW41azRUT3kwc0pLNUFuS0VyVGk1YzBn?=
 =?utf-8?B?TlZkYmd2SGZyU1pGY0s3WWJYbkg5ZncrNFNRdzhwYnpRL0l6S1kzRXNVcE5w?=
 =?utf-8?B?UXRCL21BMWVQL2txVjJKN1FjcFYvWklVZUt1WWE2cXhKeGNZK1dKcHBybC8w?=
 =?utf-8?B?akFGSVhET0tLcFJad3hBT3VLcFZySlNOZSt0c240UGtRZktCMVV6WjMvTlIv?=
 =?utf-8?B?bmNMVFh0MFFsRTFyMGJ2bjFCQ21KdHlvYTNvMURtaXJBTENKaExIVTgrblNm?=
 =?utf-8?B?a0VjaFZVU0d3Y2I4c0RBMktDYTVyWU94eFlzUWhBQktnSVphdjlQK2JhdCtu?=
 =?utf-8?B?Z0R3bGpMSlNpMDFUZUkxY2tJd09kc1V0UU04S05jMTBtVWMxb2w4dHBpMUlK?=
 =?utf-8?B?ZmxRV1dhN2Y0Y0RONTBTVjl0c0dtVDhVNFBsZFFaNmY1aFZaTnlTUERTZWZy?=
 =?utf-8?B?VVk0bGM5aWtWRTZ4Nk5HZC9wUVA5NDNBbGRnMXJTZDVCSFg5RlJ1RHdyVUJN?=
 =?utf-8?B?bk9zNkpsUnZBb3NFcCt6dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnI3eUN4R2JzUk83M21qRnA3VnRZV3JlTE1ZSGFkdTRlK1dNZytTRmFubTkx?=
 =?utf-8?B?SmNOVnZ6aU5IQm1iT2EwWG5CUis3ODJYbXJCNWRBc2kvd0w3ei9pYnBsRVow?=
 =?utf-8?B?NStqcXBXTW9TcEt0ZE1yeVBLUVZLMnJsb1hyR09yVzNxclFiN09xWjN0M1Nl?=
 =?utf-8?B?NXVoV1l6cytYQ2tabEpuUmFvamFsNEZMUm5uYlBCNFpDUVowYkxnWm1JZ28x?=
 =?utf-8?B?cTFmQTJXVkw1REE4c0YyQTI0S3RsU2dKd1pBQXdQYkVqOHluOUxrZ0xhM2gw?=
 =?utf-8?B?UDY0eUxDS2N5NC9oR2dCU0dwYVVTZTZGWDhHbGR4VjNESnR2UStFZ25jc29a?=
 =?utf-8?B?cjBzN24weXZKZmtZcTFMamtySDJhOUhBZEhCb2NnY0ZLc2RzRVlHem44aUlp?=
 =?utf-8?B?N0l0cmk5YXB0NUlnbXVtMWNUZnFob3hQZ2UvK3pTWFUxOTcyajRpdjJPODhm?=
 =?utf-8?B?MTY5Wm81b2EwY01YRHZjTjFkL2J1dVdnUkdWQUxWMzdhNFg5djFHR1ltdWI3?=
 =?utf-8?B?Nk5iTk12NkwvS0Q5NStCVm9hVWJtaXIvSlVWdm1RanNzV3RwNWl3Z3pEcjJv?=
 =?utf-8?B?RCtqbEZmN295YWx2SVFGNHM5R0tCMFZYZERQZDNSa1JVQUlFdTQ2bjBnQmZB?=
 =?utf-8?B?QTlBeXp2Q2pySjhqUkJWL1NpZDdHUTZxUzYzeVhURXcvbVVyNjRHeXZRdU9T?=
 =?utf-8?B?MGQvQzVUV0RTTk54b1pWWGxLa2NFWHpab3BZbnRXSEs0VVNpUFArOU5VNTU3?=
 =?utf-8?B?cTZpUlFSY3Q5RmlVbXVMRkJidUcyUjhKYlNITlI3MHYyVm1XODA4bUpEdDBi?=
 =?utf-8?B?SHdBRDVrS09wbkV1YysrV0pnUnVCSXNKbEp1d2hoa3pFRTlEL3pqWnAyUklH?=
 =?utf-8?B?MWpjYWtwV0poM0NDRHN1UVoxRmdGcFU0SEQzeVZIb0ljZm4wUDdBcFZ0N29t?=
 =?utf-8?B?VFI4Sm9Dd3pjZ2Y1WjlVUnVBV1NrK3FQVUJ2Z0FQaWZ2Mlc1a3dIc0VWOWRz?=
 =?utf-8?B?ZkZ0dU5taTBvUEhicFpudFZUYU4xeTh2RkVvSzVDdFRRTHpBYUhNdG1xL3l6?=
 =?utf-8?B?RGllSWdPVGdnYmV2WUg0ZDJ1OGhKWG9DcThYMExJKzE0MzJpTDNJK1crNHdO?=
 =?utf-8?B?dFBVSXprTy9SY3h2aTd6UHVDVmhoN1ROblprMCtwRHQ1bmJpaGg1c0VPQ3ov?=
 =?utf-8?B?cG44b1RjNlRVaTBvVFRkZ3h5cUNJd0N3OThtWFQrSkRVOU0wUnNPWWsxU25P?=
 =?utf-8?B?RDl2WWdHRUNRZ09xZGRINGxON2hGejgwb3ptdnpZSW1pTjQzZUpsWGR4Tlpw?=
 =?utf-8?B?QWt4WmdGbWcvSE8zNEIwUGFYMi9uMzdkdlNXVlpabGc5bGJJeGxkSzRaZHRT?=
 =?utf-8?B?a3dwUHJPdGduZFEwNHdRK0Z6b0lYaFJMdHpRby8rVlMzNVhWd3dmTmtrZEkv?=
 =?utf-8?B?MEZLWE05ZVRMYko3dWlieVdlRW03dWhCK3JHbkcwU0E4SEpxVXNHTzdUOHc1?=
 =?utf-8?B?RzZhVmpoREs3ekJxV2lBTUU4YXo1c0JjbTRMR0dnY2IzTk1BbEZ1THcxTG9U?=
 =?utf-8?B?KzFpSVRzS2p4VFJtUWkyVlRCY2JKc1VKdU5yeGR0VGVFMjRvQXdiSmZVT1p3?=
 =?utf-8?B?SVFDT1dKWFJ2UlNINnpjQ2c4LzhlZ0pzMUNUMXdzeGxJNzJwbVlSZElkN1JV?=
 =?utf-8?B?aGZoejZrSGpyazdHZGJDMm1mUzJiZUNQdmRXdXhPKyswZHM5TmpLdyt6cHdG?=
 =?utf-8?B?dC8rMXgyZTlONVhnYjlqMGxYc3U5eURoOEd1blFtdE15NGxkYUkxd0YxLytX?=
 =?utf-8?B?TFMxYmtRUWxqOExPc3dsQkxXZXJGbnVjS2Zxcjh4NENDNGJhMlpaU0FQYkxo?=
 =?utf-8?B?dFRBdWpZNjhkckZDNkxxWEU0dUg1bitYNGplMk5oM0lUYkdMWnhiODlmQWJt?=
 =?utf-8?B?SmllWC9xcGFsd2lxaVplZXc0b0U4YlFYc3ZIY1FVRlBqL1M3NWJlaWZIcEFM?=
 =?utf-8?B?Tm4vQ2tUd3pQc1dIT01GVHVWN1VUQyt1ZW1Tc0VxOWFPNXNRR2NlQUU5c1hD?=
 =?utf-8?B?NFJ3aitaM2M4cUdObTc4YlFEbGVhN2hEMUVrUEhHYmx2QVlHRC9qb3o4ZHhQ?=
 =?utf-8?Q?yRYO6FtgRQx7hSa1TQJ5rK9Lg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d22cc7-88e7-41ce-bdaf-08dcb084545c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 10:42:37.9738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o10FLmDkpoYIZ40QlTUNsSCJtF2f1htsm/yt/QxdnYPO1KcOGMqmrputGH1vgLFJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6441
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

Am 30.07.24 um 11:05 schrieb Huan Yang:
>
> 在 2024/7/30 16:56, Daniel Vetter 写道:
>> [????????? daniel.vetter@ffwll.ch ????????? 
>> https://aka.ms/LearnAboutSenderIdentification?????????????]
>>
>> On Tue, Jul 30, 2024 at 03:57:44PM +0800, Huan Yang wrote:
>>> UDMA-BUF step:
>>>    1. memfd_create
>>>    2. open file(buffer/direct)
>>>    3. udmabuf create
>>>    4. mmap memfd
>>>    5. read file into memfd vaddr
>> Yeah this is really slow and the worst way to do it. You absolutely want
>> to start _all_ the io before you start creating the dma-buf, ideally 
>> with
>> everything running in parallel. But just starting the direct I/O with
>> async and then creating the umdabuf should be a lot faster and avoid
> That's greate,  Let me rephrase that, and please correct me if I'm wrong.
>
> UDMA-BUF step:
>   1. memfd_create
>   2. mmap memfd
>   3. open file(buffer/direct)
>   4. start thread to async read
>   3. udmabuf create
>
> With this, can improve
>
>> needlessly serialization operations.
>>
>> The other issue is that the mmap has some overhead, but might not be too
>> bad.
> Yes, the time spent on page fault in mmap should be negligible 
> compared to the time spent on file read.

You should try to avoid mmap as much as possible. Especially the TLB 
invalidation overhead is really huge on platforms with a large number of 
CPUs.

Regards,
Christian.

>> -Sima
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch

