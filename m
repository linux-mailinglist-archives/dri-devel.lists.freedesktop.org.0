Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFECAEEE7D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 08:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE1310E4FA;
	Tue,  1 Jul 2025 06:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hE6dMCpu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 640EB10E4F9;
 Tue,  1 Jul 2025 06:19:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGU1xz7ajTlAdLPw7POdV5dXUuvmWjtHa2BkAd3RBJco3BT4+Ni5w8kEe0LxYxpxcGt4t7M+tRRmoI7zNW+zeS8uz5aawcNAcI14tFVm5RdDfo9Mb/Kj7sbTcdHxs+7X+8YbgocDZkrOQGYPcLQE9hk9otPVjCCswBDPXM/eBgk+CttVL2wEQXckc/IiyoHSmI1x5h9JWPSOYRhop/afTRLTE+UYEWbGiX76Z0bFpqFmGtrRtR/3ugasQCwgu5UZuIaE50ZqW88t70U0rX38wpJOep0WxiGJ9YCDPKR/yTX0dUJ0/c8yxXO7D7bFfAg7Xx4T4EXzs6Jlyfbf8wt3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p55e8fvUQ6dYDHxb/MeCK4F8VCmKzaj+snYjXp43MSI=;
 b=BkJnU/bd9e4nNzlwmNdq/PgtF9EqGvxl4L5AUpjfxG5hwQOBpCdvP5yD+X2oKqz2gxlfJlLNsq+KBrLOyHWMQuyBVVOS5MDkbC05w44V1nt02nQjieYtMfHs+0TVeXI/oQOCDK/7v2lln7z1CqdMMgGIDCygZLF5tXSvOvqpbD6fBv6B0tPeMu0+kbt4kNLY513EF2WClUNLDlbJPo4POHfoLHjtESV6eCFo3t1ILFg4vfjgjf2wdRLZMep9P64x2K2xFnwgkUhWPsuRClViwlPK2uRyzj64AmPDFPtZ3OBHaQqCDUNZntR0layXGGuJrqf1Tl9Hw0e+m6bNLaoDOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p55e8fvUQ6dYDHxb/MeCK4F8VCmKzaj+snYjXp43MSI=;
 b=hE6dMCpuZG9tt1KhdQ3D9H2qaXUitckoZprzMgoNfvyp+8UDNbwMMiRqSMCRPKZIwgYqAL873MbH5YxfZmCIOwKxk7T/HkpsBom9VaZoIbhmzL+nAfa/8AXKBRjaBVeTHlhMcxfriu5CNUl4PU7ADz2mcPpT4QZgpw5QGYeyrMQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by IA1PR12MB6532.namprd12.prod.outlook.com (2603:10b6:208:3a3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Tue, 1 Jul
 2025 06:19:33 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::81e6:908a:a59b:87e2%6]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 06:19:33 +0000
Message-ID: <50a22695-f942-43d7-b2d8-23313c804b09@amd.com>
Date: Tue, 1 Jul 2025 11:49:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm: move the debugfs accel driver code to drm
 layer
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 tursulin@ursulin.net, phasta@kernel.org, dakr@kernel.org
References: <20250630143613.2520111-1-sunil.khatri@amd.com>
 <d8ade1e5-c173-434c-bb81-e1365a5ec339@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <d8ade1e5-c173-434c-bb81-e1365a5ec339@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4PR01CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:272::17) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|IA1PR12MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 110eb589-2a69-4e11-36c5-08ddb8673eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmNrZGhkRE8vYjBVczluMEkzZWJ6ME91SUtxTTdqMDVZT0pKOE5vTHlmdWRo?=
 =?utf-8?B?Q2xmNDNLblQ0SGhaZlhqQUpsSEc3MWJ4OE5BZktNVnFTNmEyWlE2YTJCa0x6?=
 =?utf-8?B?aUgyT1hrKzlpZ3kzTzE0U3AxQWdycGl2dVVMeDVDSUdrOVY0aDlOck5zKzhF?=
 =?utf-8?B?UGJCM21PdUtveDBoQjNRYkUzbURia2QwUFZuaTBkcWlhVkFjbXhnTENQVmRx?=
 =?utf-8?B?VGtMeTRvakE5RUErRXJrcmh0VkdqenVQa21MeDZpVUhZbXdtOUFxSVNuRW9H?=
 =?utf-8?B?c0o2b01oZzNuNTYvbS9nTWR2UEFzWnZqT2tTM1E1Q1hmWGVVUXZPQUZvNTU1?=
 =?utf-8?B?akQyOVhEekVCMnJybUIzcFk4Ty9lSEdQQ3VRdlUrcWJhTzhIVWZQeVFGOTg0?=
 =?utf-8?B?S1V0cnRzUHBSamJrSTZ1WFFiK2hnVGdscEdrVWFsSys1UTliUEtmRHB2VnB6?=
 =?utf-8?B?NzdUMy9RbzlEcDRaelJqTkhDZGNBTDhQVEFsSlFRd1BrMm80djhEbEdKMTQ0?=
 =?utf-8?B?QURiY0V3M3M5eThGYTN6bFNWc3RNSWowTytWUWMwd3c2K3QyREg3N2t2bjg4?=
 =?utf-8?B?cDdqSXhlcFZPTFQ1ekE2RmcwWU93VlFxRjNVeUQrVXptaVJVYjY2aHRSZkZy?=
 =?utf-8?B?ZkRFZUJVT1UzR3llUU9CZzRFT3JOaGg4UWd6ZUNNbjN6ekZmWnVsMG5rd2Nz?=
 =?utf-8?B?QURCeXZvY0ZhTEp2ZmVUNlRjcmNxVGlzaUNxTXAvYWI1NFhIWTFtSXFpa2I0?=
 =?utf-8?B?a2J2SHlPL3RkT0tBalhwUDZ5R0hRQ0lIQ3ZZSFp4Qksxb0RoRk53elgvZmQ2?=
 =?utf-8?B?eVpVWUFvN0hFQ0tyRVY2d0k3OVVLMWRpY0xjNEhQM2V0d1g0U2tRQkRxTWFo?=
 =?utf-8?B?Qlc1TTArbjR5cWtBazhsZEFBcFFsQ2lnV3JTMjg4RDd5S0VYZjJMd3czc2dN?=
 =?utf-8?B?V2txNHBIMFFGY24xVmF3M01aZlVHYnQ1RVN6ejU4V3lJR0ZmRWMveVdCdEk1?=
 =?utf-8?B?a1hJaEhaRGZBNk1XcTJGVUlidzR3U2JGYjJ4Ui84bUlTeVJpL01xNzhvSENs?=
 =?utf-8?B?d1Y2TEk2YjVBbXBKbW8zNHFsQ1FJZzNNWWxObmpNYW85OHp5eldESzhNVHZr?=
 =?utf-8?B?QUJLS1pBTU1uZ0R1eGpWUWdRSzRJSkFrRTEyRzNHZTlSeFRhUFVEL0pIRXh1?=
 =?utf-8?B?N2taam4xQlVsUHZWd1hMZnJxbUZDMW5ETSsyNDZqUkhXamU5QU1NaWtPTmJN?=
 =?utf-8?B?aGdhQUdxR0xhQ1EwR3g1bkhBVDBLY0swWVZCamdKckIvcG5yKzFhRHBiR2Nq?=
 =?utf-8?B?T3JoNVhvdFJ0eWsvMkV2VWIrSHJwbDdwN0kybC9BUWhYeVF4Q2NLaDBNeTV6?=
 =?utf-8?B?RDl0RHZxbGpXNlZ4STdrSXNsZnJqWkV0VnZMaTMySUtNaEloMFFqRXM1KzNy?=
 =?utf-8?B?bzZ3L1BqSG5sNTRaMEljakRnMXlzUncwY21qekhJaUpBalQrd2ExekUxUFI2?=
 =?utf-8?B?MFNwY0h6VXh2cVlwU0R3dHRoS3JYQThYaFhWZTlEbFVtS0tKWUp0WE9HdFpV?=
 =?utf-8?B?bldyWXAvbUp1WXRuazhjQ0NhdFp2cmdZWE9YR3dRSzZaN0IzREFqdnB2eUU5?=
 =?utf-8?B?ekt0ell3dkFhT2pubGVVZ290Z1V5KzFxUnYrbm9ZeTVmT0NxbytQQzh4TW55?=
 =?utf-8?B?RnFDL1N3VENXdTl0L0xYWlYza3MxbGxTbEpEZW5VZWIwQ080amRLNm80R0xW?=
 =?utf-8?B?TXJMOU9uU0FxbkVUR3Y1Y3dSN0p1UmZMQnFJby93UHZwSGQ4TS9WRnlha0pi?=
 =?utf-8?B?QWpvNlpHNFFncUJidHFQR2g3YXBpQ1FDYWZScmVtTW9rQzhEQS9VNm9IVzV2?=
 =?utf-8?B?aldzRUhLUDZpL0J1RmFCRGUxWkVaMHNRaDdaZ2pUNmNKTGk5cE9SLzZiS2Vh?=
 =?utf-8?Q?tk0qpfmj1/E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0pTVkR0Mjk1THRuY2xWME1VaGxxeGZZTnVtY2ZORkFRN3VHWS9paTZMZ1o1?=
 =?utf-8?B?SkJxbkhac3VHMlBKQjY1NVVzMlBPaFVhZ2YrU21raWVCOG14NE1TQ3lYZUtZ?=
 =?utf-8?B?bDR5NnhUQ1RmUHRxZ1MyeFptT2pKL0pXbm43UEprcUtVZlpoN2wrbGZCNzFo?=
 =?utf-8?B?MVBuWmVvektVZktCdFJpRFNoU0lseUUvNWhNcDNnVjlZaTJWeTI4NkFoZndL?=
 =?utf-8?B?TGFRNVhncXVkRlpnaFNmYktJamV3TGduZ28yRFB2K2ZFL2hKbXBTZzBmVmRF?=
 =?utf-8?B?ajF2MEs3RDBNUGFMNW9DQXhsWnVKb1ErNGV3RTAvMU5zWERoN0NaK040V3V1?=
 =?utf-8?B?WkZIcDdTY3FDUzNIMWJqeEJjTUEvcjBhcFY2MWxyZzI0WFBSLzVtcS9hSm5u?=
 =?utf-8?B?UDlLS1lyMVJMZk5xL01TUFFRNksxRk1obll2QzRNcjF0UVpybS9BRktjbGVU?=
 =?utf-8?B?UGhpVi9KR1pBckxheWtBMk5jQ1EyNmMyZkdKazcvcUc3bEkwZXdhMGFWWnBj?=
 =?utf-8?B?TjYrVWtSYU5iUWVabVhCeFpFUUQ2UjFxcStkQktzbmNtYlJOZkdTaWRSV2JM?=
 =?utf-8?B?NGs5R21URFhSSG5wVGRpL1pSQVJsMWJFOEgwT00reEgyTU5IMVF3b3B4OWZi?=
 =?utf-8?B?SDJTRSt0b0RPMmdaV2o5SDRQZVVsVlNVdDlYK0NkZ25xSnUraUVEaG1OaXVN?=
 =?utf-8?B?RytjTHFPZlFQK29ybTZqdUg0S2lZNDk1S2NkZW4rZlFpZHJtSDNtSUFpR0dm?=
 =?utf-8?B?NEhNcUFLVXdRaDExdG9kNWlqWFBPdFhpa2t6WG96L3FxNTk3aUpGK2RTRHZz?=
 =?utf-8?B?bHZlRlh0UjdNNjJNcmUwSlpUQS9zTEhzUzZoRlExMGtlZS9nVFRZMXNhUkJ3?=
 =?utf-8?B?VTVTQnZPaDBoNFJ2ZnhjVDNFL1AyVkJTeFpuRWJmRmtuTDdsUFluZnpYemNB?=
 =?utf-8?B?bTN3YU8xakhkd1hPdDJLbUM5TFVUR3JlWDEyQytKSkNFa2FocHgreDlOMjhP?=
 =?utf-8?B?eE5DR2xRZytza3hlUkVmaFk1djRVclBhQlJsWG5zUFBLaXZYYndzQS9IZnlZ?=
 =?utf-8?B?NlBGTDNqNDBTclZmd3FiSnFGakF1WnNUdmNiSjVuN29KNmVKaU8wYnk5S3M2?=
 =?utf-8?B?TW56MFRCeWFacGg1WkFNZ0NGb2NBSVM1a2VoeW5Ta0g1eTE0S2M3ZGFjdDda?=
 =?utf-8?B?WXB3NnBVTTJWM29mN2h0d2NnNTBmR1F2RWMvQm92N2NDWnQ5MDhRSHZzNHBk?=
 =?utf-8?B?aUdyaTlqbW5WZmJReEdIdFQwOUtLWE9ZSnNkbTFqSzBpcFh1cWtoeXUvTmZa?=
 =?utf-8?B?NTA0OFJlMFlVR0RMQWNXRWN2ZjU3aUtOWm0xOEtQbnlTNFZOUnpNVGRuQXVP?=
 =?utf-8?B?WGduTkZqMk9wVWhWbkVwM3pHMFJ4TFhsTmt0RlA2QldtbTRVaHMrWHJmOFRt?=
 =?utf-8?B?SVQ3ZzltLzljMitMcTFQZ2ZValJ2K1FnMVZWY1k5N2ZFQTB5TDhtL01NR2hi?=
 =?utf-8?B?QVJEc0k0MTk4aVVHeUZoZUI0aXhPMkdQY1UrNnFjQnRRSzRuSVc4MnFDdXdY?=
 =?utf-8?B?SXhqa1M3SVVGQ2xVRzFUb29WN1poeEFsdy8wNE9WSGJFajZ1dFVOWGJGUHBD?=
 =?utf-8?B?b0pHRXhCTU5JSlpxcGIzUjJ4ZCtuSGl6TTVabjhlNnBoaEtWeTVkbTlsT3Br?=
 =?utf-8?B?cTltVmRheDdZeXd0dWJOOEl1QnhGOWlLdkVoV2dUVUU2bmFLT0MvcCtEU0ZJ?=
 =?utf-8?B?UkZUYVY4b2ZZNGp2VjN1WTZmSFN1bDhod3ZSc24zZlBySWU2ckFMN2h5Tk9j?=
 =?utf-8?B?QWlFZG8rOGx0aGRHNTdSN0txUkd5amNjUExJWGVCT0dDUm1WaGpkaWZOTE1L?=
 =?utf-8?B?NFRhdXVyOWYzQk4zMEdKVjBIb2JaeDNZWUJmYWhRNThpb3FsYlFlUGxQc3Qw?=
 =?utf-8?B?MitBWHlEalgyaVV4V2VrRzdWSnc3aEhwNFNWSStSZEZ3dm54enU3YkFhQ3hP?=
 =?utf-8?B?VW83dG04RkhyWExFTkFLZnZWM1VNMHFwZEdKNzNwRWFOZXF6WFBjTEVnN3Zs?=
 =?utf-8?B?b01yMWU3L3A3NzhVMW9iTTlGYkhNa2xLOW4xaXV3S1dBaVM2MDhWWGxBVmdt?=
 =?utf-8?Q?/zHYlXhboOmU48m4L9MeeY63a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110eb589-2a69-4e11-36c5-08ddb8673eb9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 06:19:33.3028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3uHwMuItd/Abd1mZ+7StPdHDApJ5m50RGRBUTGgTn6zMRx+7qSzgiALvDi/TAS1j1YIswwiQvYdkPm+6DCpCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6532
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


On 7/1/2025 12:04 AM, Christian König wrote:
>
> On 30.06.25 16:36, Sunil Khatri wrote:
>> Move the debugfs accel driver code to the drm layer
>> and it is an intermediate step to move all debugfs
>> related handling into drm_debugfs.c
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/accel/drm_accel.c | 16 ----------------
>>   drivers/gpu/drm/drm_drv.c |  6 +++++-
>>   include/drm/drm_accel.h   |  5 -----
>>   3 files changed, 5 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
>> index aa826033b0ce..ca3357acd127 100644
>> --- a/drivers/accel/drm_accel.c
>> +++ b/drivers/accel/drm_accel.c
>> @@ -20,8 +20,6 @@
>>   
>>   DEFINE_XARRAY_ALLOC(accel_minors_xa);
>>   
>> -static struct dentry *accel_debugfs_root;
>> -
>>   static const struct device_type accel_sysfs_device_minor = {
>>   	.name = "accel_minor"
>>   };
>> @@ -73,17 +71,6 @@ static const struct drm_info_list accel_debugfs_list[] = {
>>   };
>>   #define ACCEL_DEBUGFS_ENTRIES ARRAY_SIZE(accel_debugfs_list)
>>   
>> -/**
>> - * accel_debugfs_init() - Initialize debugfs for device
>> - * @dev: Pointer to the device instance.
>> - *
>> - * This function creates a root directory for the device in debugfs.
>> - */
>> -void accel_debugfs_init(struct drm_device *dev)
>> -{
>> -	drm_debugfs_dev_init(dev, accel_debugfs_root);
>> -}
>> -
> As pointed out by somebody on the mailing list this doesn't remove the accel_debugfs_init() dummy which is used when CONFIG_DRM_ACCEL isn't enabled.
Sure.
>
>>   /**
>>    * accel_debugfs_register() - Register debugfs for device
>>    * @dev: Pointer to the device instance.
>> @@ -194,7 +181,6 @@ static const struct file_operations accel_stub_fops = {
>>   void accel_core_exit(void)
>>   {
>>   	unregister_chrdev(ACCEL_MAJOR, "accel");
>> -	debugfs_remove(accel_debugfs_root);
>>   	accel_sysfs_destroy();
>>   	WARN_ON(!xa_empty(&accel_minors_xa));
>>   }
>> @@ -209,8 +195,6 @@ int __init accel_core_init(void)
>>   		goto error;
>>   	}
>>   
>> -	accel_debugfs_root = debugfs_create_dir("accel", NULL);
>> -
>>   	ret = register_chrdev(ACCEL_MAJOR, "accel", &accel_stub_fops);
>>   	if (ret < 0)
>>   		DRM_ERROR("Cannot register ACCEL major: %d\n", ret);
>> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
>> index 17fc5dc708f4..5d57b622f9aa 100644
>> --- a/drivers/gpu/drm/drm_drv.c
>> +++ b/drivers/gpu/drm/drm_drv.c
>> @@ -70,6 +70,7 @@ DEFINE_XARRAY_ALLOC(drm_minors_xa);
>>   static bool drm_core_init_complete;
>>   
>>   static struct dentry *drm_debugfs_root;
>> +static struct dentry *accel_debugfs_root;
>>   
>>   DEFINE_STATIC_SRCU(drm_unplug_srcu);
>>   
>> @@ -752,7 +753,7 @@ static int drm_dev_init(struct drm_device *dev,
>>   	}
>>   
>>   	if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL))
>> -		accel_debugfs_init(dev);
>> +		drm_debugfs_dev_init(dev, accel_debugfs_root);
>>   	else
>>   		drm_debugfs_dev_init(dev, drm_debugfs_root);
>>   
>> @@ -1166,6 +1167,7 @@ static void drm_core_exit(void)
>>   {
>>   	drm_privacy_screen_lookup_exit();
>>   	drm_panic_exit();
>> +	debugfs_remove(accel_debugfs_root);
>>   	accel_core_exit();
>>   	unregister_chrdev(DRM_MAJOR, "drm");
>>   	debugfs_remove(drm_debugfs_root);
>> @@ -1193,6 +1195,8 @@ static int __init drm_core_init(void)
>>   	if (ret < 0)
>>   		goto error;
>>   
>> +	accel_debugfs_root = debugfs_create_dir("accel", NULL);
>> +
> We should potentially make that depend on CONFIG_DRM_ACCEL.
>
> Probably best to merge the first and second patch, this also avoids the question why we have the first patch.

Sure done in V8

regards
Sunil Khatri

>
> Regards,
> Christian.
>
>>   	ret = accel_core_init();
>>   	if (ret < 0)
>>   		goto error;
>> diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
>> index 038ccb02f9a3..20a665ec6f16 100644
>> --- a/include/drm/drm_accel.h
>> +++ b/include/drm/drm_accel.h
>> @@ -58,7 +58,6 @@ void accel_core_exit(void);
>>   int accel_core_init(void);
>>   void accel_set_device_instance_params(struct device *kdev, int index);
>>   int accel_open(struct inode *inode, struct file *filp);
>> -void accel_debugfs_init(struct drm_device *dev);
>>   void accel_debugfs_register(struct drm_device *dev);
>>   
>>   #else
>> @@ -77,10 +76,6 @@ static inline void accel_set_device_instance_params(struct device *kdev, int ind
>>   {
>>   }
>>   
>> -static inline void accel_debugfs_init(struct drm_device *dev)
>> -{
>> -}
>> -
>>   static inline void accel_debugfs_register(struct drm_device *dev)
>>   {
>>   }
