Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7932BA13DAB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 16:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A8610E9AD;
	Thu, 16 Jan 2025 15:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u/RCeSyg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D0610E9AD
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:31:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3Qek04Y8OIG8ORwTMzFjy79ZSmZIV5/R+MyDC0AxZAufr/ahM2RcCAQwxAYmSuoNZGJjvlg98OdS1z6Um680BsYAyfbfWeoGWe+pGK1SzJ0nPAAaeafQSdReT60pgjJZuewOD/oZ0bt6DXzs63skMELRe1NmI7rSl/1ECgE80KRL9w/eWgK4ESVr4fWJ97APDkeGn3kKRk63j8ekzwhbkD4dCcwHfdkq9sM2hEwfI1zOuqDoOg3l6C6lCJV8jvcQ/igkjUJJY5cXn5lRmqT/pu0iFQ2OenH+gTSQJrG7mdX5ufJ0eG3agGQbJj0ZXrbzSEt6cBo+MB0iPDoGbZaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAbjqRpBBURXF35sqV4LDC4EpqKmWnRNgdQRUHbiBTM=;
 b=rIc+c6o/BsStwmQTCMSdlh3YlrCPU/mYGQ0eZm+ajYXToIPddwmYxSbe2+A/VbYI94v7/XG/FpSyWE0+glr38qDCAxiSY36ctDslqMa/vFGY8R0IYtMuRQh3TlZGjeDWA+YlWulgSG+0KXJ0wQ3weduu0Hh6LW8EmnQMpI6o94TkNXQ63IB4DSvGwyg4UUQws+Bs9bcXDySkAXd5weWJxRBETqgkAhwPi8NHCDNKG2eyrb3/AV04eCKo8Ynp9140RGOrnuWH7z+sbLVdxwanVZzW8wEHHupN7Fw5xaDsgAwjrnDMtg1lgafcdBCvDPUrfrPKYqAW5/cM/dCGxiLW+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAbjqRpBBURXF35sqV4LDC4EpqKmWnRNgdQRUHbiBTM=;
 b=u/RCeSygenvrdH14J95eDDSG/NqrpWkkp0Oq0LiCHMhr230CzGZm1Xo4zO3nTN9aRyw4+8lsGTe6jB/RRNpmUuZLBI7f7Or/AdIUkHhwZGeFwO6CimI/n9shBqo3Hqf4EVuVwF7gSBWKQAqoRmrgiDrwubMvLQ7wbNgk7A69MpM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB7002.namprd12.prod.outlook.com (2603:10b6:806:2c0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 15:31:31 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 15:31:31 +0000
Content-Type: multipart/alternative;
 boundary="------------v5m8MzkgPRrEVxAP0Vl6zI4b"
Message-ID: <a306a660-2292-4012-b3d4-92027d8f0a23@amd.com>
Date: Thu, 16 Jan 2025 16:31:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] driver: dma-buf: use vmf_insert_page for
 cma_heap_vm_fault
To: Zhaoyang Huang <huangzhaoyang@gmail.com>
Cc: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <linux-media@vger.kernel.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 linux-kernel@vger.kernel.org, steve.kang@unisoc.com
References: <20250115061805.3495048-1-zhaoyang.huang@unisoc.com>
 <bfd19718-e7dc-45c4-8f86-34205e733916@amd.com>
 <CAGWkznFPpU6uHQbgYrdwwWO8L-ct5nJoYnmdfqewxgNtMu2Qqg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAGWkznFPpU6uHQbgYrdwwWO8L-ct5nJoYnmdfqewxgNtMu2Qqg@mail.gmail.com>
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 44b542c2-6b9a-4c5a-58b0-08dd3642da5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGV0cWRCWFk1ckRDajlHQXlxQ2d0TGxOWXVHem12ZU8rMmQ3MnAxWUliOHVt?=
 =?utf-8?B?MmVNSHlWLzVZcUw2K2c1N3FZSk4reDUvSWpwZXVQUmFxYkdJYm43Unp6WWlS?=
 =?utf-8?B?VWZ4VlFXenRHVXFJdU9xVDYxc2d2VHFlRHFpQWFhWmk4eEZjYzY0RVdEMTFB?=
 =?utf-8?B?RkZRYlFDLzFSTXRpWEVtODA1dDQxR1JVSHNEdmJGamxkbi96T3U4bENHb1Br?=
 =?utf-8?B?S0Myd01LeEVEQnpEVmRKL2UzZHdYQ1hQS0h3Uk1BRWtxWk9LR1djNFVKM213?=
 =?utf-8?B?S21OTklrSHY5bHh3aEovYkJ4V1JjaTdYajFYNmxidjJ6TmN4aVBpcDdaUE9O?=
 =?utf-8?B?bEY3b0VibHpLS2IvVThnVlZ4QlhnZUx1NzhoOFdMTFl4a0NMSFpNdVd3THJw?=
 =?utf-8?B?YlpXU3YrdzhkUk5tc2Znekc3T05DcDVEWUFEMVFtYzI4QkwrbUVUTUNkOHhj?=
 =?utf-8?B?dllvL0J6dnE4c1ZrQVl3TVdxUzNrdUVjd1g3T2wvb0xlTHEwZkoxWG5uMWhU?=
 =?utf-8?B?VWI2NlBVWHQyM21rSHlSNFFKZVZ2R2JrRWVTMFJCYmg2SldHV1RQejhzWFp3?=
 =?utf-8?B?Q2p5R3E0elhyUm5aNTJTUDFnUElvb29rVjhBWHVwYVhnVTI5akI3YUcxNjZ5?=
 =?utf-8?B?U0dWcERBYWM3VFZ2VjA2eTZPVXVVeFI3SjlpVFJJTEJmaGFHOCtKKzB5eStR?=
 =?utf-8?B?bDRHczhjbHhCUmN5VkVRWU4xZmxJK3ptM3BjY3hJZUNtcFBOQS9ZS3pPT0J3?=
 =?utf-8?B?eHozZE1yRjNlYlNRN0MwZ1JyeVpCUy9SRWJHSnEydnNBK1FNTndzcjJucThR?=
 =?utf-8?B?TlM2NEpzTXZIUnFJN2VLQmlMaG1iYVZMcTVBWHZOY0FHRGFwQU5Ncks4TWxE?=
 =?utf-8?B?VjhsR1o3cWhPaGp4aEoxaXY0K0RsRXIwbVJXT3l1blI2S3NkOGZjSFVXZHpI?=
 =?utf-8?B?RFZyS0ZJcHE1aFV4cW4rU2ZqZnNYd0VVSWFEVnhSSDhXRmhvWEViYlFualRX?=
 =?utf-8?B?c0UrWC9SSHRyL1hCWlFLME9PTlRwbjhTdkVUUENQNzJBM0hKZmtjVndtKzF1?=
 =?utf-8?B?bVBocmY3R21yb2hKOWcrRTU5dHpweEZYV0FiSGZVUzhRbTlYcjRZVUV2Ujh6?=
 =?utf-8?B?SDVVRTRhajczdDJvL25wVzJpanQ0YnhBdEUyS3FXYkN4RVRRcXg3V0JqaGVk?=
 =?utf-8?B?ekM0R1ZPMVZ6Wks1MzF3STEvb3poLzU5czhXMzhoVnNheHROR1RYcFpDRlk4?=
 =?utf-8?B?RERRQk5lSVpYVXhuM0huVm1XU00wMTNVa09HVDViZmFOVzN4eS9lNzJiSmVj?=
 =?utf-8?B?bG5EQjdYNkJ0R0RocERwNk5DK3B0bkxscG93Q2hGK3loamNFYUtjcHlNNG5L?=
 =?utf-8?B?YlU1bXlqcmRxNWFsc2RtcTVEOS9WNnlOUTFiSEJlb05RQVlqRDA2RDRqcEdE?=
 =?utf-8?B?c21weElMS1lGbklrNTV0em5HWWdnY0J3cnUzdHZSanNnV0tqdFdkUjRmek1q?=
 =?utf-8?B?b0ZOdGVhejBBMmM2czRBc0lMVzUrTzl2Nnp3TG5ZVmlGZVlzQUxNaU1DUlR3?=
 =?utf-8?B?UTVpK3hhRDUwaUN0UFhWb1N4eTZVSkF1S3FHaEZZR0pCS1c5RTdFZC9oYml1?=
 =?utf-8?B?Y2tLUjVJSXpkUjBCS2JXTGxleGtZOGtBWFJYck4reTVQNEtTWTdrcGxIdnJk?=
 =?utf-8?B?UFpkY1Jpdy93Q1k5L0VCd0ptd1dtc1Ewb1VTcGl2Z2ZIc1dub2IyVU1nZXla?=
 =?utf-8?B?OVF6TWF0TzNqNFluNmFLNTRXUGlEMUZVK29ZUE5MMFNraEtHZ1FadWI0NzNx?=
 =?utf-8?B?enpRc0E4NnZmbHAvZ3VRVnVqeFhzWGxTUUM0eDM3SktVcG53V1pFQUw2ZmZm?=
 =?utf-8?Q?r/n70oyHPIXXB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUpFV1REV09tckM1VGdPalNHTUxqQXRWTUVWbGlNdkNKK1d0TnUzaklwcVpk?=
 =?utf-8?B?VEVvYU4xMkZza1lmRzRNaFlNYnNrOVZDeTRERy9uVk8wQnhIcVBFT1BibXRm?=
 =?utf-8?B?YTBUcGZGbXRMZVVSMGphSjVGb2lRYXVMb3VZOE1vOFdJRkRMYisyT0xPYmVn?=
 =?utf-8?B?K1RyN0NGbUpVRDZsVCt6MTRNNVhIVW13aE9EdG5NZHVwSkptbVZIUnlEL3E1?=
 =?utf-8?B?UW5oL2RBaWtEMGNwV0RVbG1QSzAydEpmdjJZOFBsbDhZcExRMCtvT043Q3VT?=
 =?utf-8?B?d3BXbzRCcW53dFVtdTF1dnV6QytheTlJRC90ME9hSzllZ3pROGgrRlBZS0p5?=
 =?utf-8?B?K3Niay9QSlQ3Q2prblkyY1dOakw0d3BRd3ZUNVI2Wm1jRjl4WnAvenBOUmZa?=
 =?utf-8?B?T2FiSjBBdlkvQjlyRm5WUWkxRTJpclZ0MHd3eE5KSmJlMFJQa0NueVRqcTRr?=
 =?utf-8?B?QWpBS240V0pId3FPNkl4OFhoMXlZUllWU0JFWWlZRWRkclVZOFYwRldod3dB?=
 =?utf-8?B?SW5MV1A0NFNtTk1pejNFMVpqQ1YyV2RCdmMvS01yaW9rWDJvVGNQeHo1c1dF?=
 =?utf-8?B?NFk4b2dSSEp3Y3JsV1dEMEJORXE0LzNnd3AzMlk2L0Zpa2NVSjJkek5heXhW?=
 =?utf-8?B?N3dYMWFzQVNZSXFpYmRJUkI3dnZreXpqTnJhWk5IdHl2aEJBU2syY0hLQlpJ?=
 =?utf-8?B?ZUV3a1BTQkRESXpMaWVCd1J4L0hoR3lIdW8xaXBVemVKTktyWnZoeG5LTFhX?=
 =?utf-8?B?Z2VPMkFmeWZNa0JBZVIwVUJ1cXRRamwrOCsvaEE4UXhlTzg5Q3U0M2lxc1h0?=
 =?utf-8?B?SEJUT2owMEJqWFdId21leUhGTCtPdjZnVDltN2RsSlhnK2dOUzNTc3dDZlNK?=
 =?utf-8?B?Qm9mRlJlRUQwalQ0SlBmNWxWL1QvcGRVRHFhT1M0V2d0bGx4TkVWaU82K2hI?=
 =?utf-8?B?MXNVeG5PYTlPUGdUMUt6L1hLcDUzekdTMExJNW5OL3JLR0pZT0NUTnlTNnpI?=
 =?utf-8?B?bnIwczBoaTZFOWJCWk5YM0wyZVc1SGx0NjRqaHJuWngrV0IzaDczUlFocUV3?=
 =?utf-8?B?RFZoczZERU9xUEpPMDlLTHA5SFpSMStMV0JESDNCTGM4V2NQcnJxSVZCaUN2?=
 =?utf-8?B?aGYvRWFWUHVBdXpmazM3T21pVk4raDFTTGhiT2lDVnQ2ZjlWeU9NanFGSmJH?=
 =?utf-8?B?WTV3Unh1MWh3RUcwNEFGMXYvN3p5N0F1NFcrcXoxenV0emVEby9wNCtnakhY?=
 =?utf-8?B?VXdMeTNiM2N5NWJlMmFBdkNEdFVJOFd2UEhYbVRyZnVSOGNrSG1iVXRUZkdH?=
 =?utf-8?B?UERadnhJZmp2R0w0WmRBYnIwZjYzck1sT0dyS0htVjV1NzBHSWg5ZFBOOGNP?=
 =?utf-8?B?eG5JRjE5Q3FBZmN5Qnpldkp6TnJRMHkvelpJVm0wMGhoWXFjdTBMVnpvbGMw?=
 =?utf-8?B?SmdXbmR3YVhkVjVrdndQbmdQYWZaZE1VdlN2WXdFSmp0Z3ZXdEJ6OXVpeEdU?=
 =?utf-8?B?dlFmUlZad253YXJZdThUbFU1aTZuNEsrSjBsY0wzZ3loZjRMT3A3SEJhdkg5?=
 =?utf-8?B?K3NnTDh4aDlEMFBZQkZOVGdma2oyUVJQYi8vVkZ5SUFCTmhCVUQ0aW5mSzg3?=
 =?utf-8?B?UUZvNEhhUTdmYml6dVF6NFh0TTlwWEFTTFY4UzFiSno1UUd0ajFCSGV0eGpF?=
 =?utf-8?B?N3JWUXVGUlRRUTA3TmZaNkJsV1JuVk01QmsxajlQMVkzZFUwMGxtVVdjSmsr?=
 =?utf-8?B?Uk16Q2Jtcjk3TWd6VDllUlMxZzBSNG1MVllWTGxoN3VPWEVlcHp3M0k3U3Fv?=
 =?utf-8?B?c01WZUd5T2hVRFNRTG5MY0daZkovSHlTOFltRHoxMGE1ZTV2WXlqdllPdms3?=
 =?utf-8?B?Z0dpSzRPcjludmUxQnljNk5DLzZhZm1aSzZTbGhoMnBxTTRibzNJcUxVNW5F?=
 =?utf-8?B?bStXREFTT1BsbVJJdXBaUDE3eFY4TjRmbytTbHBSME84M1N4dEk4dDJJUUM1?=
 =?utf-8?B?cGUxVXpEU1h3eTVlaGN5ZHFqU0p4SjF0NUNsUXZrdzZkVGFiWjRLdDJCRVlZ?=
 =?utf-8?B?QnVXRGNKSEljaHE4RldkN3Z6Lys4V2srd0p2UG1NYndnS3NIYmJ6Nk5JTkdL?=
 =?utf-8?Q?bwR44o/BaHsaMTshojlyjoaLi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44b542c2-6b9a-4c5a-58b0-08dd3642da5d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 15:31:31.7491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TuraJV5MTSxZLMKpHlUViC0cezesXrEZktlRUWOjiWQBjaBOA29ORmdcLJjI1+/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7002
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

--------------v5m8MzkgPRrEVxAP0Vl6zI4b
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 16.01.25 um 02:46 schrieb Zhaoyang Huang:
> On Wed, Jan 15, 2025 at 7:49 PM Christian König
> <christian.koenig@amd.com>  wrote:
>> Am 15.01.25 um 07:18 schrieb zhaoyang.huang:
>>> From: Zhaoyang Huang<zhaoyang.huang@unisoc.com>
>>>
>>> When using dma-buf as memory pool for VMM. The vmf_insert_pfn will
>>> apply PTE_SPECIAL on pte which have vm_normal_page report bad_pte and
>>> return NULL. This commit would like to suggest to replace
>>> vmf_insert_pfn by vmf_insert_page.
>> Setting PTE_SPECIAL is completely intentional here to prevent
>> get_user_pages() from working on DMA-buf mappings.
> ok. May I ask the reason?

Drivers using this interface own the backing store for their specific 
use cases. There are a couple of things get_user_pages(), 
pin_user_pages(), direct I/O etc.. do which usually clash with those use 
cases. So that is intentionally completely disabled.

We have the possibility to create a DMA-buf from memfd object and you 
can then do direct I/O to the memfd and still use the DMA-buf with GPUs 
or V4L for example.

>> So absolutely clear NAK to this patch here.
>>
>> What exactly are you trying to do?
> I would like to have pkvm have guest kernel be faulted of its second
> stage page fault(ARM64's memory virtualization method) on dma-buf
> which use pin_user_pages.

Yeah, exactly that's one of the use case which we intentionally prevent 
here.

The backing store drivers use don't care about the pin count of the 
memory and happily give it back to memory pools and/or swap it with 
device local memory if necessary.

When this happens the ARM VM wouldn't be informed of the change and 
potentially accesses the wrong address.

So sorry, but this approach won't work.

You could try with the memfd+DMA-buf approach I mentioned earlier, but 
that won't give you all functionality on all DMA-buf supporting devices.

For example GPUs usually can't scan out to a monitor from such buffers 
because of hardware limitations.

Regards,
Christian.

>> Regards,
>> Christian.
>>
>>> [  103.402787] kvm [5276]: gfn(ipa)=0x80000 hva=0x7d4a400000 write_fault=0
>>> [  103.403822] BUG: Bad page map in process crosvm_vcpu0  pte:168000140000f43 pmd:8000000c1ca0003
>>> [  103.405144] addr:0000007d4a400000 vm_flags:040400fb anon_vma:0000000000000000 mapping:ffffff8085163df0 index:0
>>> [  103.406536]file:dmabuf  fault:cma_heap_vm_fault [cma_heap] mmap:dma_buf_mmap_internal read_folio:0x0
>>> [  103.407877] CPU: 3 PID: 5276 Comm: crosvm_vcpu0 Tainted: G        W  OE      6.6.46-android15-8-g8bab72b63c20-dirty-4k #1 1e474a12dac4553a3ebba3a911f3b744176a5d2d
>>> [  103.409818] Hardware name: Unisoc UMS9632-base Board (DT)
>>> [  103.410613] Call trace:
>>> [  103.411038] dump_backtrace+0xf4/0x140
>>> [  103.411641] show_stack+0x20/0x30
>>> [  103.412184] dump_stack_lvl+0x60/0x84
>>> [  103.412766] dump_stack+0x18/0x24
>>> [  103.413304] print_bad_pte+0x1b8/0x1cc
>>> [  103.413909] vm_normal_page+0xc8/0xd0
>>> [  103.414491] follow_page_pte+0xb0/0x304
>>> [  103.415096] follow_page_mask+0x108/0x240
>>> [  103.415721] __get_user_pages+0x168/0x4ac
>>> [  103.416342] __gup_longterm_locked+0x15c/0x864
>>> [  103.417023] pin_user_pages+0x70/0xcc
>>> [  103.417609] pkvm_mem_abort+0xf8/0x5c0
>>> [  103.418207] kvm_handle_guest_abort+0x3e0/0x3e4
>>> [  103.418906] handle_exit+0xac/0x33c
>>> [  103.419472] kvm_arch_vcpu_ioctl_run+0x48c/0x8d8
>>> [  103.420176] kvm_vcpu_ioctl+0x504/0x5bc
>>> [  103.420785] __arm64_sys_ioctl+0xb0/0xec
>>> [  103.421401] invoke_syscall+0x60/0x11c
>>> [  103.422000] el0_svc_common+0xb4/0xe8
>>> [  103.422590] do_el0_svc+0x24/0x30
>>> [  103.423131] el0_svc+0x3c/0x70
>>> [  103.423640] el0t_64_sync_handler+0x68/0xbc
>>> [  103.424288] el0t_64_sync+0x1a8/0x1ac
>>>
>>> Signed-off-by: Xiwei Wang<xiwei.wang1@unisoc.com>
>>> Signed-off-by: Aijun Sun<aijun.sun@unisoc.com>
>>> Signed-off-by: Zhaoyang Huang<zhaoyang.huang@unisoc.com>
>>> ---
>>>    drivers/dma-buf/heaps/cma_heap.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
>>> index c384004b918e..b301fb63f16b 100644
>>> --- a/drivers/dma-buf/heaps/cma_heap.c
>>> +++ b/drivers/dma-buf/heaps/cma_heap.c
>>> @@ -168,7 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
>>>        if (vmf->pgoff > buffer->pagecount)
>>>                return VM_FAULT_SIGBUS;
>>>
>>> -     return vmf_insert_pfn(vma, vmf->address, page_to_pfn(buffer->pages[vmf->pgoff]));
>>> +     return vmf_insert_page(vma, vmf->address, buffer->pages[vmf->pgoff]);
>>>    }
>>>
>>>    static const struct vm_operations_struct dma_heap_vm_ops = {

--------------v5m8MzkgPRrEVxAP0Vl6zI4b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Am 16.01.25 um 02:46 schrieb Zhaoyang Huang:<br>
    <blockquote type="cite" cite="mid:CAGWkznFPpU6uHQbgYrdwwWO8L-ct5nJoYnmdfqewxgNtMu2Qqg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Jan 15, 2025 at 7:49 PM Christian König
<a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Am 15.01.25 um 07:18 schrieb zhaoyang.huang:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Zhaoyang Huang <a class="moz-txt-link-rfc2396E" href="mailto:zhaoyang.huang@unisoc.com">&lt;zhaoyang.huang@unisoc.com&gt;</a>

When using dma-buf as memory pool for VMM. The vmf_insert_pfn will
apply PTE_SPECIAL on pte which have vm_normal_page report bad_pte and
return NULL. This commit would like to suggest to replace
vmf_insert_pfn by vmf_insert_page.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Setting PTE_SPECIAL is completely intentional here to prevent
get_user_pages() from working on DMA-buf mappings.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">ok. May I ask the reason?</pre>
    </blockquote>
    <br>
    Drivers using this interface own the backing store for their
    specific use cases. There are a couple of things get_user_pages(),
    pin_user_pages(), direct I/O etc.. do which usually clash with those
    use cases. So that is intentionally completely disabled.<br>
    <br>
    We have the possibility to create a DMA-buf from memfd object and
    you can then do direct I/O to the memfd and still use the DMA-buf
    with GPUs or V4L for example.<br>
    <br>
    <span style="white-space: pre-wrap">
</span>
    <blockquote type="cite" cite="mid:CAGWkznFPpU6uHQbgYrdwwWO8L-ct5nJoYnmdfqewxgNtMu2Qqg@mail.gmail.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
So absolutely clear NAK to this patch here.

What exactly are you trying to do?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I would like to have pkvm have guest kernel be faulted of its second
stage page fault(ARM64's memory virtualization method) on dma-buf
which use pin_user_pages.</pre>
    </blockquote>
    <br>
    Yeah, exactly that's one of the use case which we intentionally
    prevent here.<br>
    <br>
    The backing store drivers use don't care about the pin count of the
    memory and happily give it back to memory pools and/or swap it with
    device local memory if necessary.<br>
    <br>
    When this happens the ARM VM wouldn't be informed of the change and
    potentially accesses the wrong address.<br>
    <br>
    So sorry, but this approach won't work.<br>
    <br>
    You could try with the memfd+DMA-buf approach I mentioned earlier,
    but that won't give you all functionality on all DMA-buf supporting
    devices.<br>
    <br>
    For example GPUs usually can't scan out to a monitor from such
    buffers because of hardware limitations.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <blockquote type="cite" cite="mid:CAGWkznFPpU6uHQbgYrdwwWO8L-ct5nJoYnmdfqewxgNtMu2Qqg@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Regards,
Christian.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
[  103.402787] kvm [5276]: gfn(ipa)=0x80000 hva=0x7d4a400000 write_fault=0
[  103.403822] BUG: Bad page map in process crosvm_vcpu0  pte:168000140000f43 pmd:8000000c1ca0003
[  103.405144] addr:0000007d4a400000 vm_flags:040400fb anon_vma:0000000000000000 mapping:ffffff8085163df0 index:0
[  103.406536] <a class="moz-txt-link-freetext" href="file:dmabuf">file:dmabuf</a> fault:cma_heap_vm_fault [cma_heap] mmap:dma_buf_mmap_internal read_folio:0x0
[  103.407877] CPU: 3 PID: 5276 Comm: crosvm_vcpu0 Tainted: G        W  OE      6.6.46-android15-8-g8bab72b63c20-dirty-4k #1 1e474a12dac4553a3ebba3a911f3b744176a5d2d
[  103.409818] Hardware name: Unisoc UMS9632-base Board (DT)
[  103.410613] Call trace:
[  103.411038] dump_backtrace+0xf4/0x140
[  103.411641] show_stack+0x20/0x30
[  103.412184] dump_stack_lvl+0x60/0x84
[  103.412766] dump_stack+0x18/0x24
[  103.413304] print_bad_pte+0x1b8/0x1cc
[  103.413909] vm_normal_page+0xc8/0xd0
[  103.414491] follow_page_pte+0xb0/0x304
[  103.415096] follow_page_mask+0x108/0x240
[  103.415721] __get_user_pages+0x168/0x4ac
[  103.416342] __gup_longterm_locked+0x15c/0x864
[  103.417023] pin_user_pages+0x70/0xcc
[  103.417609] pkvm_mem_abort+0xf8/0x5c0
[  103.418207] kvm_handle_guest_abort+0x3e0/0x3e4
[  103.418906] handle_exit+0xac/0x33c
[  103.419472] kvm_arch_vcpu_ioctl_run+0x48c/0x8d8
[  103.420176] kvm_vcpu_ioctl+0x504/0x5bc
[  103.420785] __arm64_sys_ioctl+0xb0/0xec
[  103.421401] invoke_syscall+0x60/0x11c
[  103.422000] el0_svc_common+0xb4/0xe8
[  103.422590] do_el0_svc+0x24/0x30
[  103.423131] el0_svc+0x3c/0x70
[  103.423640] el0t_64_sync_handler+0x68/0xbc
[  103.424288] el0t_64_sync+0x1a8/0x1ac

Signed-off-by: Xiwei Wang <a class="moz-txt-link-rfc2396E" href="mailto:xiwei.wang1@unisoc.com">&lt;xiwei.wang1@unisoc.com&gt;</a>
Signed-off-by: Aijun Sun <a class="moz-txt-link-rfc2396E" href="mailto:aijun.sun@unisoc.com">&lt;aijun.sun@unisoc.com&gt;</a>
Signed-off-by: Zhaoyang Huang <a class="moz-txt-link-rfc2396E" href="mailto:zhaoyang.huang@unisoc.com">&lt;zhaoyang.huang@unisoc.com&gt;</a>
---
  drivers/dma-buf/heaps/cma_heap.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index c384004b918e..b301fb63f16b 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -168,7 +168,7 @@ static vm_fault_t cma_heap_vm_fault(struct vm_fault *vmf)
      if (vmf-&gt;pgoff &gt; buffer-&gt;pagecount)
              return VM_FAULT_SIGBUS;

-     return vmf_insert_pfn(vma, vmf-&gt;address, page_to_pfn(buffer-&gt;pages[vmf-&gt;pgoff]));
+     return vmf_insert_page(vma, vmf-&gt;address, buffer-&gt;pages[vmf-&gt;pgoff]);
  }

  static const struct vm_operations_struct dma_heap_vm_ops = {
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------v5m8MzkgPRrEVxAP0Vl6zI4b--
