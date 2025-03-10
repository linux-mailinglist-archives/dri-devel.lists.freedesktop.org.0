Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F3EA5940A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 13:18:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4953110E413;
	Mon, 10 Mar 2025 12:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o5x8YOq1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A674810E413;
 Mon, 10 Mar 2025 12:18:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSUMj1cB79zZmSmSb5kBO8JRe2oAaJ6kRHHxpzrYjFmjHFZIS1thBR7tV7gxkppPDaLzaYc9lew80Et7elsoNIIpdghw+/mIi5f2nk3gEiwAPqtVm1UR4h/Fl6clrAFeduFD55LJ+uA31x04t/Y0a8FSRYwa9WwbDRGyl2/94/Mp6fjFaCho4Db2IldrfFt3WvSdr7nOLLOjJM2hdbiTgNCtiWHunPY/kCRrB40hVm6LKh5gnA9hXL32jnuz6bzNiJNNDQeeh46waRWY947RTEoF0PunfpvTqaVhYK/KcfIrRqml67PBVdV6Sx1CudWgjuCOsnTYJnncIr6Ag+W3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dC4g+lCVuVO4vJBy+TrRVj5jccZyowPSWcdSn4oq9mY=;
 b=jVlFRedm207eVkBteNsoUvKN8p3zmBXDUcJ9N5095J5zVmK8HMIMbyDwezIy3jvSkKZq53/cgqpeh9lvE/GMzn3uWd1/RZi3tNZoiPLU3TwSvWxHQdnSoZ/BjP6gmkMbWbQGUHLFKFRmE86+Cm3PcdmVSkQPIQN234AVIMe64arJ+IkvmujZVQCq5FVcp2Ez1jEbpWrmEpAkyo3qMXnEfu0NGHV2Hwooegj6DMgXOwFLSGyzDFTRCox98yjfmifVJBcnzxJdiaIsBo/eiHWVmR+AyIw2MrdyAqnkqydtSR4O6wSPw8vCkzRPLaMguAr97BljcBkD2XBcFT5MXZ1Glw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dC4g+lCVuVO4vJBy+TrRVj5jccZyowPSWcdSn4oq9mY=;
 b=o5x8YOq1NOhvDMBeJD+Hd2quLhnZUAoGJvat0tC+y9O14Uy116rGMAMA2Wmq2KLr7kxbXoJQcOsr9hDDMkucnczZqsX/efge0DLKH41mXv87RbX6tEslvrtwoal94tSOvNpZkH0u/e+EeLpi7dMHy5DZuOQ7KJqiNydgjBz/QEo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA0PR12MB8208.namprd12.prod.outlook.com (2603:10b6:208:409::17)
 by SN7PR12MB7953.namprd12.prod.outlook.com (2603:10b6:806:345::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:18:18 +0000
Received: from IA0PR12MB8208.namprd12.prod.outlook.com
 ([fe80::14af:1677:d840:8d2]) by IA0PR12MB8208.namprd12.prod.outlook.com
 ([fe80::14af:1677:d840:8d2%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 12:18:18 +0000
Content-Type: multipart/alternative;
 boundary="------------I1iYdhYjVUwP0b7Zi0kTzW0q"
Message-ID: <47a52abb-61ae-467c-9cf2-27427a5057ac@amd.com>
Date: Mon, 10 Mar 2025 17:48:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu/gfx: delete stray tabs
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <92b9d527-fa20-4e4d-a4ce-7c442df9df0e@stanley.mountain>
Content-Language: en-US
From: SRINIVASAN SHANMUGAM <srinivasan.shanmugam@amd.com>
In-Reply-To: <92b9d527-fa20-4e4d-a4ce-7c442df9df0e@stanley.mountain>
X-ClientProxiedBy: PN3PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::19) To IA0PR12MB8208.namprd12.prod.outlook.com
 (2603:10b6:208:409::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8208:EE_|SN7PR12MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: a03b904a-bb0c-4694-b916-08dd5fcda3dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUdDME1tc0VZZ3ZCdS8vZ083clAyaTdlL0MzRGtSVkFaZzJ5aWRuWXQzdlA3?=
 =?utf-8?B?Z1AwS3lqMUZ4Ry9BQ3dSdklHUVZJbkRYd3E1aUR4MEJVUDBISldVL21YLzlx?=
 =?utf-8?B?RGw4RVVzM2t5amNhSk02VFVLcERXa1AwK3h5VjI5ZGg5T0Z1S2M2SWZydVA0?=
 =?utf-8?B?QmdDYUdqVVRnYWpuVjJ6V0RoTmhWcExZOFlxdmhKOHJmV3BtVEtwWGd2MnMw?=
 =?utf-8?B?VGtQeVkwSUxOaUNDbGdBYm8zaFpMZGs0bDVuQjhGRUlrTG9QaDFTMFY2ZEMx?=
 =?utf-8?B?RDhaS0VJOWpDNzVYUzBGZHZTcmlrNDFOZDVmT09lQUV6M3Z1V0w4dGdwSkM1?=
 =?utf-8?B?Y0tnWDlYM0grb0RTR250cEg3c1ZmZVNtTmZ4QlVPblBhUnFWME1IY0x4dnZD?=
 =?utf-8?B?VGNXNEpmWGxCUzVYWUhXYUs2K0lRLy9tbHhiYWJJSjViZDNNL1pNT3Z0YnBn?=
 =?utf-8?B?Mml4NGh5SzF5NnJtV3NHaUJ3N2JGaFZNanh1bFpDVHlwY2FUbUtkYjdJeWV0?=
 =?utf-8?B?TjZ0ay9rSnVZdGNVWlBEK2xwSld4OUw4Ui82T2poVlZEdlhnZlpsTW1Ea2Zt?=
 =?utf-8?B?Mm5RdHdUQU5ISXF2ZmF2ZkYrY3F4Rkk0aU1DWlZTMnFlVzRBeWZLWVJBSFQ5?=
 =?utf-8?B?Y3RlaEFiUW9xQ1FhdkYvQm5xSjkxRjJCWi9tQ05RRnUyZ2ZNd3g5YkwwbFlm?=
 =?utf-8?B?b21BUnBJTTluRFhrR2FuUGEzR3cvN0JxY09EdWlXYUExTGdGcGkrb3g3dTRa?=
 =?utf-8?B?S0RKR2pORklsU1lZTzFIelNqamJPVUdrZ3RCS3J4TXBpbVMyeEttNVQwUy9O?=
 =?utf-8?B?TGs0QkZ3MzRtemhINTU5UXgzdlhTRFY5d3hianpHSXp0RFh5WGtOVXdvQ3dK?=
 =?utf-8?B?bUUwYWVxbVNXMXJzeGl2Y2ozekw4YjVieE0zSTdkdk4yMTFKTXNWL29oakRZ?=
 =?utf-8?B?dW5Ib2IvNWY3L2hGc1ZucWNFWFpZMEhHSFJES0twTFQ0TXVsNmNBdDFBazJ5?=
 =?utf-8?B?c2o3aktxYWV0QURkSExGM1FlaWRKUGgram5CRm13VGpnVlhCTjBvK2NiTjVL?=
 =?utf-8?B?OXJ3ZzgyMEF2b1puZlcxdHBaS2dCL0FBTndpKzBZRS9XNHFVZGtmaU1TcU1S?=
 =?utf-8?B?MlNMeXRpenVZR25Fa0FGQ0ZQZVcrMmJiNmdQbDk5SlcxaTdrMW9pNSt2YldY?=
 =?utf-8?B?SFNwcTFadnU2U3F3eU1PazhWM0xaTSt1SnE1Tkp3b05YVDU2UzZYL2VRMUNi?=
 =?utf-8?B?enk0QnRFOGtPYWZQLzgzM2Q3My93N0krRFlTNWsyVTVyMklTWTBHT0NJcFln?=
 =?utf-8?B?d3JwQ3NqT1MyUWQxOEF1YkFVZEdGMFVjaWMybG9wQTFGSU9nNnBpaThXQkVq?=
 =?utf-8?B?YjA3OEtnY0V4OEplcVNTSW51ak5wUERvUHVEay9EUkkrWWVQYk9WRlN2QXZk?=
 =?utf-8?B?bnF3S3Bpd3M1RDlJaCtRVG03VVk2K0FEVWk0TXZ0NExSNGdBTHRYbTNpd2pl?=
 =?utf-8?B?b0lRY1haWEE2ZXQ2L2x5ZzVCeVdQZGdzMng3TGtmc1dNSzRndGUxWDZJTkhY?=
 =?utf-8?B?NTZBTEdIdSsrYzl2ZWF3T2R1VEFrVEI4bGFaSFM2RlZQTlRBUFgxWUwwK1U0?=
 =?utf-8?B?dWxOZ2JrRlMxc0dNdGpRcjhmWEgrRnRFR0hMaFdkUXdCNThiQVNqcDZWR2xQ?=
 =?utf-8?B?YUt3bnhzMHI3MU9qS0NiNEhxU0JUN0xPQ09ZN3BGdUdXam9iL1NQdnRLM0s2?=
 =?utf-8?B?RFQ5UkthOERkT1I3YkhzZ3JZWm95WDlDWDlmZUVWY0dKRUlNWjNVTkNhOHVI?=
 =?utf-8?B?U2Ivajh6bGhMc1ZsVHI5a1BqODlWY3paK0tWVDc5MkZ0VWl6bEQ0RlpIT1I1?=
 =?utf-8?Q?CtEX7pciYlitZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR12MB8208.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnVTTDhPeVE4Z3o4WFdYK3J6WFVoVmx3NTlQSWZVeTJzZFVTdFJCNTl5UHZa?=
 =?utf-8?B?NVdVRlAwbjFGajhaQkFadFRXYVpycUVFZDZ4cDRiVERNWTk3dWdXTjR5TnpO?=
 =?utf-8?B?UXB3WFJqNHpsTjlLb2hOa1pLblI2UmVOcm82M2ZPdjhtS2ZzTDZNWEtZZ1pK?=
 =?utf-8?B?TU5NSWx6VGYrcnFic2Frb09SUitaOHRqem9zZ29qUUxqeG1VeGZNWkd5emwr?=
 =?utf-8?B?T2tLaTI2L3BiQnN2TjdYYzEwMGk5RVBmNUVvMmJjcHI4UlpvZ3M3eG9BdUFn?=
 =?utf-8?B?VUUwWmtCd1BLMHFhdW1TYkVibUpnaEQ3ZUl0dTc1OW9ZSGl6aG00OGhNbmk4?=
 =?utf-8?B?NXVCcDJ5d2locHpHZDhyY0s1aEJFM21LbDg2RVROaE55Y1BqOTkzdGZjMkl2?=
 =?utf-8?B?QWNUOTBMOCt5M0UvUStGK3lxWVVjbkg5UjdyWEJjbjg5RmxNRTN4Um14b1JI?=
 =?utf-8?B?M243WnIxdWl6UEh1TFpBQVNRNDNtMVR0cHZEZjZYWnMralByNUZHSkNEZmhU?=
 =?utf-8?B?UVVMTTNsUXFmclFFb0VGYUNPRU95aXBDalpWeW5TblFjU1RZV1BkM3ExN3hi?=
 =?utf-8?B?cDdXbmJsQ3pxV1hKQ0RvakpUalBma3RUWG1KMXhiK3hTdzdDMDRBem5lWm01?=
 =?utf-8?B?S0REcG9VT2RGOHhQd1RjZUZhMGl4Y2lVMURaT0dzNjdNNWlKOG5Cam1rbWM5?=
 =?utf-8?B?SWpRalpGcXp0YzQzSFpFazhNcnJHN3lEVUZNYlJJcUdwamEvU1JRTlBIWFdL?=
 =?utf-8?B?Zjd6dk9PR2phUm14Q0ZhQzRiSGNmMXJ5Nk02SmdNcHgvQys3NSt6TlZKKzdi?=
 =?utf-8?B?bGY3YVhIZzcxQ1I3eUNRNHJnMzRFeFdVMzBrNU1XTlZsMFVxenVMMVlOZ0U3?=
 =?utf-8?B?aElnQzdpbFFTc1FKQWVpZ2YvN1RsK3NIZWsyS0pENzZTdVFiVmJlb3lwZnlF?=
 =?utf-8?B?RzlZZ0JTRW5QMktKZnN6eEFoQ1lFUXZqOWtYa29CRTVTMGxpWVd3bS8xVU1M?=
 =?utf-8?B?L2VDcjg5eXc5S2kyWXdkM1ZMYmlhd1JvNmVvMTZ4YnNoRFIzZk5xY2hoSlB2?=
 =?utf-8?B?WXlQMlROclFEVDVWRkU0bk9ndkNYTUxVaGY5ajFxaWZBSmtqMnRjSUVOZTU0?=
 =?utf-8?B?eUxrUlBlcWZnb3RTbXVEcGIwQyt5cjVGVkpMOHc5OXBGenllWnZaTVhIRUM0?=
 =?utf-8?B?Z09RVEdVa25HaXVJTGt2M0s3c0Rrc0pOcEhUdDRXSXlNcmY2allHcFFadzdG?=
 =?utf-8?B?T1l4YWI2c1g2ZDRiS1NEQWNBNTZLYTYwSFdaakxuUnZac2ZLTytidDFneEV4?=
 =?utf-8?B?U0lCTnVydStiTm51cUhneDB0VEhzZkNzdWF0UU5YZ0lWOGQ1TCtvUzdRSmVU?=
 =?utf-8?B?bVVyMm9uYURhTDAvNmV0VGVielN6TDZXV0Fnb0d3UUc4ZU83aEovbFVENjhL?=
 =?utf-8?B?UGI5RXhFUDUzQ25DMjdLc3ZMSU5sK1JnWUQ4Q0VneUk4NWxUS1JNamlRU3Na?=
 =?utf-8?B?clpjWnJOZmFHK1ZOOEJhcUhpUGxaVE9RT1FjWmlsVGZ6N3lmT0k2cGF5dlNw?=
 =?utf-8?B?VW9NY3NKTWo5T2NvTTBGdEFnS0dkSXNnYWFYZzVvSGxQN2xCNmwzaGduczlF?=
 =?utf-8?B?M3dQaUlzelpZeDhDS3ZQa3k0eEdWay9nMFArY2t6Q002cDlLR0tLYW9HQTBY?=
 =?utf-8?B?Q055d1pJLytkQllpeGNzS0hMRlVYTzVkbEc2MHNacmExcGZuMjFqRS9Fd1FN?=
 =?utf-8?B?SlRJdm94YVR5cHUyRm5pOG9xdnBLUHFkYzN5NWZwbDFUMWxxYXJ6TEpNa3pW?=
 =?utf-8?B?NnFkdG53STdabERQbVJ5Nmxna0I0QVQwVHpNTFNUS000S3JqZDJiU1Zka3hq?=
 =?utf-8?B?K0FCMUl2d0dtcHlnWkJ1eUdPY0huYXB0b3lVaHozNmpyQXY2UnpueGZJY2pN?=
 =?utf-8?B?UFNhSm5NZ1lTcEtOZ2wvL1dRUWVyL1lSNkFDU1FQcWxsTFRjVmd5ZDY3VGU2?=
 =?utf-8?B?bVUwZkxHaTFiSE5RdWpzblpyZUxGZEZORWJnc3kyV1V0Mm9YN0xRWStzRXpS?=
 =?utf-8?B?VDVqZTNkVjB3bUxkVUZHbEtobUMrM2hQcWVBN2FkMSsxUGNKdUlNRG0vV2tY?=
 =?utf-8?Q?kxygMh08qUtCVrawd2jzV8aIT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03b904a-bb0c-4694-b916-08dd5fcda3dd
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8208.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 12:18:18.1898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bBWBzOeGqMhYHtrYx5BOMerYaorI3PvpkCe5gPIL/ncYJujtNxV1cmEJnZ+gKzevrth/hJz+KkFbk/XIw+8/7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7953
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

--------------I1iYdhYjVUwP0b7Zi0kTzW0q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/10/2025 4:17 PM, Dan Carpenter wrote:
> These lines are indented one tab too far.  Delete the extra tabs.
>
> Signed-off-by: Dan Carpenter<dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> index a194bf3347cb..984e6ff6e463 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
> @@ -2002,8 +2002,8 @@ void amdgpu_gfx_enforce_isolation_handler(struct work_struct *work)
>   		if (adev->kfd.init_complete) {
>   			WARN_ON_ONCE(!adev->gfx.kfd_sch_inactive[idx]);
>   			WARN_ON_ONCE(adev->gfx.kfd_sch_req_count[idx]);
> -				amdgpu_amdkfd_start_sched(adev, idx);
> -				adev->gfx.kfd_sch_inactive[idx] = false;
> +			amdgpu_amdkfd_start_sched(adev, idx);
> +			adev->gfx.kfd_sch_inactive[idx] = false;
>   		}
>   	}
>   	mutex_unlock(&adev->enforce_isolation_mutex);

Thanks!

Reviewed-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

--------------I1iYdhYjVUwP0b7Zi0kTzW0q
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/10/2025 4:17 PM, Dan Carpenter
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:92b9d527-fa20-4e4d-a4ce-7c442df9df0e@stanley.mountain">
      <pre wrap="" class="moz-quote-pre">These lines are indented one tab too far.  Delete the extra tabs.

Signed-off-by: Dan Carpenter <a class="moz-txt-link-rfc2396E" href="mailto:dan.carpenter@linaro.org">&lt;dan.carpenter@linaro.org&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
index a194bf3347cb..984e6ff6e463 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -2002,8 +2002,8 @@ void amdgpu_gfx_enforce_isolation_handler(struct work_struct *work)
 		if (adev-&gt;kfd.init_complete) {
 			WARN_ON_ONCE(!adev-&gt;gfx.kfd_sch_inactive[idx]);
 			WARN_ON_ONCE(adev-&gt;gfx.kfd_sch_req_count[idx]);
-				amdgpu_amdkfd_start_sched(adev, idx);
-				adev-&gt;gfx.kfd_sch_inactive[idx] = false;
+			amdgpu_amdkfd_start_sched(adev, idx);
+			adev-&gt;gfx.kfd_sch_inactive[idx] = false;
 		}
 	}
 	mutex_unlock(&amp;adev-&gt;enforce_isolation_mutex);</pre>
    </blockquote>
    <p>Thanks!</p>
    <p><span style="color: rgb(51, 51, 51); font-family: &quot;Source Code Pro&quot;, &quot;Courier New&quot;, monospace; font-size: 13.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Reviewed-by: Srinivasan Shanmugam <a class="moz-txt-link-rfc2396E" href="mailto:srinivasan.shanmugam@amd.com">&lt;srinivasan.shanmugam@amd.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:92b9d527-fa20-4e4d-a4ce-7c442df9df0e@stanley.mountain">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------I1iYdhYjVUwP0b7Zi0kTzW0q--
