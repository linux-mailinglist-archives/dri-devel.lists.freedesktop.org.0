Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AC6AF7602
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 15:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767DB10E0DC;
	Thu,  3 Jul 2025 13:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="V7xxZwjV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307D210E0DC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 13:45:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uNR0tuFD+I9bLTg5fn4n4+bINivERAHc5NuJ21V9Eg33r0AYvyNYlx9vBnOZkYPGVomsB7371QuHpKN7E2pWZe4E/+dDWG1/V2bTSKqCouTDa49XZj9dN9yJMHl3MKChjTxMLawyf8NfIAgFWa6nekS19kXNq4Um/nvVlAY28JdzFTAprf/OrDi3Xax/27luIbYSJsmistGOIDqA5M9W6yJNzKnBn9ka9gjjkP9+lSvZ00agyGg2T7AbJPPGwutMZ97xbDRZGtCQSphodz61PduYJsTXm6BqI8NcuZp1aObCuEYm7lm8cY+HVL8duMx1rcIf/YTzF1m7TSn+rmV2tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tB4R5os1PAccsPPo92vSMU4jeDdclfUEulhRBaJ70gA=;
 b=ETV9DEQOsMnvlCCyheBHYzQiu6aD5gXcnjcNY6u0KuzbCGzOHI54l2DqTHKtJrfUDJVAzoDEUbLgjn0FSwFMmypC09psKrfWaWo+PGR9NQfkAAUgjoGuWM7Cs1G8yrH6ADRyBhuMipJrp+7AUjyNNmcMk6iDSzrqJqou4DVM4Gt5V5tUEpx5WIyjJkBDXH4HalDn6P5Re5TBwxfEjiH/zXgYWSl3bivmZOTxWnpBjbXlaLh3uQeSMVoHfTd0R+r1EPHOoTikygJIyNTSDrzkUo/iL6fh7Y5W0DJyUUvZaz0mHdjEbgek4mMhelSnGyJpuwbnrQRBEtUT58tBikPNNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tB4R5os1PAccsPPo92vSMU4jeDdclfUEulhRBaJ70gA=;
 b=V7xxZwjVl6n9zaSWqeD0g85pUJVPuJgKvW5MCp6nRpnjtxXptkmZGwYggUH2X40rACqi3JAy7czHBK4BUxf56GjTDo6r2S0tkM4cj5AnWM04jQvOZEL6NuLIEToyZ5bgTQ+UCCnHv6+skElxY44FLLLcShkJ1gSDPF7OqhqwoXk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5795.namprd12.prod.outlook.com (2603:10b6:8:62::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Thu, 3 Jul 2025 13:45:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 13:45:28 +0000
Message-ID: <24bf12cf-12a3-405f-9fec-ea1e8ce21a7a@amd.com>
Date: Thu, 3 Jul 2025 15:45:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Warnings in next-20250703 caused by commit 582111e630f5
To: Thomas Zimmermann <tzimmermann@suse.de>, Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 Anusha Srivatsa <asrivats@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250703115915.3096-1-spasswolf@web.de>
 <d81decff-35d7-402b-83b2-218aa61f6b09@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <d81decff-35d7-402b-83b2-218aa61f6b09@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MN0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:52c::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: b62d0f06-b486-4c1d-d884-08ddba37df01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUZmUm9LcHkzVnRNQnBBd1MyQ3FwTXU1dHVKM2RhaWRaNWlTSDk0bjZiRVdv?=
 =?utf-8?B?bi94RGVTdHVmK1lBN3FOOVJwdER4bmxib2NJRTdzR2JXc3Y2UjJVZ0xRaVU5?=
 =?utf-8?B?SlFFa1VNSS9BeVhsRU8zNE9Ta2VGOWxZK3lMR2tmamd4Z0Y3ZEY0VmJ0RjVl?=
 =?utf-8?B?TldLaERTYnA5aTR5ZG1zbHZTWlVxZ1RFNWRBUTkzNnR4VHdpZ1hUamVhbHhY?=
 =?utf-8?B?bmRzdTZIVWxjemJIMFhaenB0VVFJeXJINEpjaUg3YzMwMHp4WGJUb01Nd3Vv?=
 =?utf-8?B?TVBpeFBtL3VtQlR0cGd1V0svcGZReUkwclFYUmlUTng2c0xlR2x4Rit0MmtN?=
 =?utf-8?B?aUFDM01NMm9qbTErSmV4eGIrN2d0V0IweWswcmNHeGJPbDhiVHpqTWxadkxz?=
 =?utf-8?B?YXVxMWlXaWNraXBVbWI5ZU5UMmNUbExaYmV4djVXb0E5ZVZMQk1aT3B6V0g5?=
 =?utf-8?B?UUJENS9KNzZ6UU5LN1NieTRYalFLWEVCanB1N2ZmdzA0c2lvSG55M0dvNWNQ?=
 =?utf-8?B?dFp6RThKS2hsckpxWWNXK2wxT1dwaEFQU2F3OEo4VSs0UEFObjVBUHZRSnV1?=
 =?utf-8?B?SWxQbFpYM1VTdzVFM2FNY00wMmMyeXphNUV4Y1oxMU1KMTh5MVE0MGhnalE2?=
 =?utf-8?B?QVJKNXRKeHZvNlZ2UG9rV1BUbDkzNVdqU2twcExPbU83dnpKUm0wUWZCUVJv?=
 =?utf-8?B?R1k4QUtrUVpuTTVzZmc5eVJoNzNIYUw4S2Q0TGoxb1dSQU5MT0ZRdGpMYmIy?=
 =?utf-8?B?YWZIRWpIazVLR0J2Y0hFQlcrcEZKN0ppYmhFelB4aXJoRFNEYVZQQWw0TmNr?=
 =?utf-8?B?aU5LRkJOcVV1blV1MjRMTHBhS1hxSXlKcTRqQzZFVWhwNkJ4OGVnUGpOMDd2?=
 =?utf-8?B?bmVoWjhqVVh5ZFF4Z1NNN1hmT3V5UU1qcEJZc1lONlJwaVlmMTBtMDlTZDJU?=
 =?utf-8?B?VXF5SmFrb1RDOVVYSmlGZzcyWEQyeEpxb1ZVMHpndnlaQnFkMzhBd09TL2Jj?=
 =?utf-8?B?aDRoTGNvcmt4cmlSalk2Z2dhRkdOUEhSRTRmUm9Sa3krUHhkVis1Y2JVYjky?=
 =?utf-8?B?Yy8xNWFLY1ZKV0cwbytJZ3pMVkhYU0oveXFRa0dHd3NmTmxmR1MzQmtFR3lV?=
 =?utf-8?B?S2NvZ1Z0Rkg4KzRJbnJqS21HODNFYk5UaTBzaFI2YVV4K0RMcXN1cEJ0MTIr?=
 =?utf-8?B?WDBmWW5MRWdlT2hrYWprSG5NOXJac0dHYVYzRkJMbzZnbDdSRGlpaU9Rd2Q0?=
 =?utf-8?B?NEwxWThvSUxWdVkraExkcGptVnh6UmoramJNY1pwZUpMc3p1bzRyY3dMRDBi?=
 =?utf-8?B?anlSbDUzVHpwZm45aXlqQ2pRcU9kRVIxSUc1Vm5YNWl4eHV4SWpyT1YvS3Nj?=
 =?utf-8?B?L1J3elVFVGxUYWM3WUQ3bzFTL0JzcVo5SFFuWlhvZlgwc3p3d0VHZm9ieUNV?=
 =?utf-8?B?MVU3dm5LWDllU2NML3JudEtsR25FRDlTSnNuZDlmTmh2QlpnSnN2UXJQZlhX?=
 =?utf-8?B?eDlCUVRHc1FxQ0pMTS9jdEJtL1lOY1V2YXc5NUJFSVgrc0tKUlJlTjZNSmJ6?=
 =?utf-8?B?SE82TmFkR2VqREhCSUpkdXNjaUo3K2h3SFM2UWRQRU9CUG14MmlsbjhQREpY?=
 =?utf-8?B?dithemZ6enJNOXhqZTZrZHpNTy96RFhuUmpIZXdsYlN5UUFxQlg4WWRBYkpF?=
 =?utf-8?B?ZUNGcjlIQlF2cDQ1NFdFSFpHUDBVMFdBb082Q29ObStMMnVPdmYvY2dWSFg1?=
 =?utf-8?B?d3lrSW9YZHRCc1RESjFMR2pQQ2c2ekl5eG9XNTZ5cy9ud290aFhTQjhSM3Bl?=
 =?utf-8?B?bFZnRjRlUU1jcWU2c1NsaC8rSzRVSDhpRDk4dzlrU3ZmSHFPYzl4Tlpvdytq?=
 =?utf-8?B?SkptZU5JTTdKUU5JRWxYYkZQcXNDRSs3VWxrN2RWZStqNVpOYnZaalVvaXd6?=
 =?utf-8?Q?3uAIniDyCbo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2FUL2lIVTNJd3dLbkNsMThwTGF5Uk9ha2tGVXhBMlF2b1NOOVhxZ2FsSHgz?=
 =?utf-8?B?ZHhURmZNSUxhVFA0OUx0V3hKOW1aZjhveDJKZTFOam5pbTM5QldNcWtJa1NI?=
 =?utf-8?B?djdmeVFHSWRBMXdCaE53bG9hMWtsd3IrVGJnRWxuN0I0TEFuMDhDeVhDZmJ5?=
 =?utf-8?B?anRsbXpNUmxSS29lNWs4K2c3OUtXRU93ZzZ6WlNBQWVqT3hMLy9kRzRxWU5N?=
 =?utf-8?B?RjlaeUo0Y1BRN2MrTnM3cnBiSlJmNDdiRHhxWjFTTkxrMXpadDBiYVoybXdr?=
 =?utf-8?B?NnlRbGZsSnk2bm9zS1ZFdjhLa3ZRcnhrV1N4alRIbXp1bDNZMFpEZFFTRTAz?=
 =?utf-8?B?UjNqZFloN3dhUzU1czlPYTFreXhYTTY5SkgvTDh1WG95bWdiQjlaQVRnY1Jk?=
 =?utf-8?B?dGg3dXFPZEJSeWlsVXJEeEdiaFRsbkwzL0orNUFSRlJtT2lvWDY3RkxrY1lN?=
 =?utf-8?B?TFpKNlRiaVFybFFhbE5lVzh0T0NMR0lrWHhVa0xEa2JLTGoxSHZ6NDJab29l?=
 =?utf-8?B?K1pHZXRUeUx5S1RUdklmSTlnSG9jOHdjaTRkYU54SklaS0RwV0JDalc0S0dN?=
 =?utf-8?B?TmxuRUVSQllzK1JVTWJ3cnY0aC9NSDlaRjA5V25kVTdPMkxhSVUrRjdQVDNP?=
 =?utf-8?B?aTdpWE5mM0FaYVQ3cTJEeXhYMG8zZkx4VnJVN1o1QnBRdlZDSU4zSzRtdW1E?=
 =?utf-8?B?czMyV1YramlTN1VJZ3ZFbWhoUjFHZU05VnFLTXpaejhxd0dFZVUwRFZmWURi?=
 =?utf-8?B?WUNBTTJUS21iTllSNlp2aUs0OW1uVS9YNXoyc253dW1FcVBiLzVVU1JLM0dS?=
 =?utf-8?B?MGZxcDgrSUZFUUk0ald1b09vcnE1M21zRlpHUjI0OG9JaGpnR3V4UzFlYlFu?=
 =?utf-8?B?d2JyMFV6UjVNRGJjb1dBbE94K2o4Tit5Z1U1bmhCd2FSMkFaWVR1MHlkbDlp?=
 =?utf-8?B?aDZoYlRsWTI1RU1VellvVVZFMGcvc2ZUdjV3NVlUWFYzUnk0ZFIzbFZsS1J0?=
 =?utf-8?B?NnplNlYxQzZUVk5CeU9ldGk5Z0wyQ1g5UExXc1VLV1Y4VjhnQnB5dURXb1Jw?=
 =?utf-8?B?Ym45aUtEQkVBYU9SV2lFOWR1NUlqcE9ncVdkOGlUMktoSm5DWG8wcVBvVzc1?=
 =?utf-8?B?emVrNUVnSXhqYmREcGtGOHdvY1ZyV1I4bVhPOUl4ME9WanVEelRSTFNudm82?=
 =?utf-8?B?bWw5S2tRb3J4d3dDREk3N3g0WFZZQlBSSDVMWG4zb3F5Y0J1OFhlb2tlb09J?=
 =?utf-8?B?WW5Jbmw3aENkYjhyME5lK2VQQTBYcG1jWWNDdnBXTElxalJXNkxqWU9IOElX?=
 =?utf-8?B?SFRuTldpUU1rQzlRbWEwbGJUVzMvN2hNZXM3cDZBNDk3QlQ1Y3NocWY3bGtE?=
 =?utf-8?B?U0QyWUYwaW9SVWlVU3ZtRTRrN0dqaUJFZUlsYXVVR1VaYzRvczFhT1R3dFdv?=
 =?utf-8?B?OXoveUlEcWdIUkJPUURYUU05aWlxWDlId0o5b2lVOTIyTVlNQjNyWlJMNU01?=
 =?utf-8?B?R2hqTFpUTnE1R1pGY1B3d3hpNURIUUl0WVNhRUVZY1kxMWJNMElLOHNEcG91?=
 =?utf-8?B?Q2NCeEVHRWJ3LzAxU2pablptYUo4YmhGM1Z0QS8xcjlNVldZNnNIQlUrVzls?=
 =?utf-8?B?ditBQXBYNFNlSy9raUpCNmZvSUgrOWZuOHJEaDU5eHRBcllZS2xGVWhjOWVo?=
 =?utf-8?B?ZjZlVU1YN2JIZU1KeVlPaHdFaFlselptanZZMWN4dHRxRGhDT3V2dFhuNG9m?=
 =?utf-8?B?aWxWc2ZtT09aRWR2TktKWTdrZWtoUS9ORHBxS1FRYitOMVV1UGZSQVZMMTJO?=
 =?utf-8?B?eU1zZW05U2wwNWZtS0UxUzZJQ1lMM2JGMDg5R2ZzNTVrZEdsUlVjYll0aFRG?=
 =?utf-8?B?KzV2M2lHN1JRcVU4MHo4UHFqRytzUitZZnBxRnhZQkQ3RXU0NGhSWHYxbERS?=
 =?utf-8?B?Y2dURGE4a0R3dEsrMTNEdmROU25xR2RxTU0wbWdPU0F5Q3lDSmpnS2xTencr?=
 =?utf-8?B?V1BRUGljUFdHTEl4SkJldHBNN2IwWlN4OFpZdUN3NDFvcEhjNno1UklPODdL?=
 =?utf-8?B?MWxKV2tXU2Zib2xVVkFaWVFZTmlIQjZiSXdmTGlsTDNvbWV2WmVUNVBQNVJF?=
 =?utf-8?Q?pIxk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b62d0f06-b486-4c1d-d884-08ddba37df01
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 13:45:28.5611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjQ5jR0R0b1ytJ3gf/tAfnvbRu3J/cCg9n0MJhj73kRE/iWC/CbSAVo8KIJyJIrZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5795
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

On 03.07.25 15:37, Thomas Zimmermann wrote:
> Hi
>=20
> Am 03.07.25 um 13:59 schrieb Bert Karwatzki:
>> When booting next-20250703 on my Msi Alpha 15 Laptop running debian sid =
(last
>> updated 20250703) I get a several warnings of the following kind:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.702999] [=C2=A0=C2=A0 T16=
28] ------------[ cut here ]------------
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703001] [=C2=A0=C2=A0 T16=
28] WARNING: drivers/gpu/drm/drm_gem.c:287 at drm_gem_object_handle_put_unl=
ocked+0xaa/0xe0, CPU#14: Xorg/1628
>=20
> Well, that didn't take long to blow up. Thanks for reporting the bug.
>=20
> I have an idea how to fix this, but it would likely just trigger the next=
 issue.
>=20
> Christian, can we revert this patch, and also the other patches that swit=
ch from import_attach->dmabuf to ->dma_buf that cased the problem?

Sure we can, but I would rather vote for fixing this at least for now. Thos=
e patches are not just cleanup, but are fixing rare occurring real world pr=
oblems.

If we can't get it working in the next week or so we can still revert back =
to a working state.

What exactly is the issue? That cursors don't necessarily have GEM handles?=
 If yes how we grab/drop handle refs when we have a DMA-buf?

Regards,
Christian.

>=20
> Best regards
> Thomas
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703007] [=C2=A0=C2=A0 T16=
28] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq_midi snd_seq_midi_=
event snd_rawmidi snd_seq snd_seq_device rfcomm bnep nls_ascii nls_cp437 vf=
at fat snd_ctl_led snd_hda_codec_realtek snd_hda_codec_generic snd_hda_scod=
ec_component snd_hda_codec_hdmi snd_hda_intel btusb snd_intel_dspcfg btrtl =
btintel snd_hda_codec uvcvideo snd_soc_dmic snd_acp3x_pdm_dma btbcm snd_acp=
3x_rn btmtk snd_hwdep videobuf2_vmalloc snd_soc_core snd_hda_core videobuf2=
_memops snd_pcm_oss uvc videobuf2_v4l2 bluetooth snd_mixer_oss videodev snd=
_pcm snd_rn_pci_acp3x videobuf2_common snd_acp_config snd_timer msi_wmi ecd=
h_generic snd_soc_acpi ecc mc sparse_keymap snd wmi_bmof edac_mce_amd k10te=
mp soundcore snd_pci_acp3x ccp ac battery button joydev hid_sensor_accel_3d=
 hid_sensor_prox hid_sensor_als hid_sensor_magn_3d hid_sensor_gyro_3d hid_s=
ensor_trigger industrialio_triggered_buffer kfifo_buf industrialio hid_sens=
or_iio_common amd_pmc evdev mt7921e mt7921_common mt792x_lib
>> mt76_connac_lib mt76 mac80211 libarc4 cfg80211 rfkill msr fuse
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703056] [=C2=A0=C2=A0 T16=
28]=C2=A0 nvme_fabrics efi_pstore configfs efivarfs autofs4 ext4 mbcache jb=
d2 usbhid amdgpu drm_client_lib i2c_algo_bit drm_ttm_helper ttm drm_panel_b=
acklight_quirks drm_exec drm_suballoc_helper amdxcp drm_buddy xhci_pci gpu_=
sched xhci_hcd drm_display_helper hid_sensor_hub hid_multitouch mfd_core hi=
d_generic drm_kms_helper psmouse i2c_hid_acpi nvme usbcore amd_sfh i2c_hid =
hid cec serio_raw nvme_core r8169 crc16 i2c_piix4 usb_common i2c_smbus i2c_=
designware_platform i2c_designware_core
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703082] [=C2=A0=C2=A0 T16=
28] CPU: 14 UID: 1000 PID: 1628 Comm: Xorg Not tainted 6.16.0-rc4-next-2025=
0703-master #127 PREEMPT_{RT,(full)}
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703085] [=C2=A0=C2=A0 T16=
28] Hardware name: Micro-Star International Co., Ltd. Alpha 15 B5EEK/MS-158=
L, BIOS E158LAMS.10F 11/11/2024
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703086] [=C2=A0=C2=A0 T16=
28] RIP: 0010:drm_gem_object_handle_put_unlocked+0xaa/0xe0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703088] [=C2=A0=C2=A0 T16=
28] Code: c7 f6 8a ff 48 89 ef e8 94 d4 2e 00 eb d8 48 8b 43 08 48 8d b8 d8=
 06 00 00 e8 52 78 2b 00 c7 83 08 01 00 00 00 00 00 00 eb 98 <0f> 0b 5b 5d =
e9 98 f6 8a ff 48 8b 83 68 01 00 00 48 8b 00 48 85 c0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703089] [=C2=A0=C2=A0 T16=
28] RSP: 0018:ffffb8e8c7fbfb00 EFLAGS: 00010246
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703091] [=C2=A0=C2=A0 T16=
28] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703092] [=C2=A0=C2=A0 T16=
28] RDX: 0000000000000000 RSI: ffff94cdc062b478 RDI: ffff94ce71390448
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703093] [=C2=A0=C2=A0 T16=
28] RBP: ffff94ce14780010 R08: ffff94cdc062b618 R09: ffff94ce14780278
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703094] [=C2=A0=C2=A0 T16=
28] R10: 0000000000000001 R11: ffff94cdc062b478 R12: ffff94ce14780010
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703095] [=C2=A0=C2=A0 T16=
28] R13: 0000000000000007 R14: 0000000000000004 R15: ffff94ce14780010
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703096] [=C2=A0=C2=A0 T16=
28] FS:=C2=A0 00007fc164276b00(0000) GS:ffff94dcb49cf000(0000) knlGS:000000=
0000000000
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703097] [=C2=A0=C2=A0 T16=
28] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703098] [=C2=A0=C2=A0 T16=
28] CR2: 00005647ccd53008 CR3: 000000012533f000 CR4: 0000000000750ef0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703099] [=C2=A0=C2=A0 T16=
28] PKRU: 55555554
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703100] [=C2=A0=C2=A0 T16=
28] Call Trace:
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703101] [=C2=A0=C2=A0 T16=
28]=C2=A0 <TASK>
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703104] [=C2=A0=C2=A0 T16=
28]=C2=A0 drm_gem_fb_destroy+0x27/0x50 [drm_kms_helper]
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703113] [=C2=A0=C2=A0 T16=
28]=C2=A0 __drm_atomic_helper_plane_destroy_state+0x1a/0xa0 [drm_kms_helper=
]
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703119] [=C2=A0=C2=A0 T16=
28]=C2=A0 drm_atomic_helper_plane_destroy_state+0x10/0x20 [drm_kms_helper]
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703124] [=C2=A0=C2=A0 T16=
28]=C2=A0 drm_atomic_state_default_clear+0x1c0/0x2e0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703127] [=C2=A0=C2=A0 T16=
28]=C2=A0 __drm_atomic_state_free+0x6c/0xb0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703129] [=C2=A0=C2=A0 T16=
28]=C2=A0 drm_atomic_helper_disable_plane+0x92/0xe0 [drm_kms_helper]
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703135] [=C2=A0=C2=A0 T16=
28]=C2=A0 drm_mode_cursor_universal+0xf2/0x2a0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703140] [=C2=A0=C2=A0 T16=
28]=C2=A0 drm_mode_cursor_common.part.0+0x9c/0x1e0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703144] [=C2=A0=C2=A0 T16=
28]=C2=A0 ? drm_mode_setplane+0x320/0x320
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703146] [=C2=A0=C2=A0 T16=
28]=C2=A0 drm_mode_cursor_ioctl+0x8a/0xa0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703148] [=C2=A0=C2=A0 T16=
28]=C2=A0 drm_ioctl_kernel+0xa1/0xf0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703151] [=C2=A0=C2=A0 T16=
28]=C2=A0 drm_ioctl+0x26a/0x510
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703153] [=C2=A0=C2=A0 T16=
28]=C2=A0 ? drm_mode_setplane+0x320/0x320
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703155] [=C2=A0=C2=A0 T16=
28]=C2=A0 ? srso_alias_return_thunk+0x5/0xfbef5
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703157] [=C2=A0=C2=A0 T16=
28]=C2=A0 ? rt_spin_unlock+0x12/0x40
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703159] [=C2=A0=C2=A0 T16=
28]=C2=A0 ? do_setitimer+0x185/0x1d0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703161] [=C2=A0=C2=A0 T16=
28]=C2=A0 ? srso_alias_return_thunk+0x5/0xfbef5
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703164] [=C2=A0=C2=A0 T16=
28]=C2=A0 amdgpu_drm_ioctl+0x46/0x90 [amdgpu]
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703283] [=C2=A0=C2=A0 T16=
28]=C2=A0 __x64_sys_ioctl+0x91/0xe0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703286] [=C2=A0=C2=A0 T16=
28]=C2=A0 do_syscall_64+0x65/0xfc0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703289] [=C2=A0=C2=A0 T16=
28]=C2=A0 entry_SYSCALL_64_after_hwframe+0x55/0x5d
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703291] [=C2=A0=C2=A0 T16=
28] RIP: 0033:0x7fc1645f78db
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703292] [=C2=A0=C2=A0 T16=
28] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89=
 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 =
f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703294] [=C2=A0=C2=A0 T16=
28] RSP: 002b:00007ffd75bce430 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703295] [=C2=A0=C2=A0 T16=
28] RAX: ffffffffffffffda RBX: 000056224e896ea0 RCX: 00007fc1645f78db
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703296] [=C2=A0=C2=A0 T16=
28] RDX: 00007ffd75bce4c0 RSI: 00000000c01c64a3 RDI: 000000000000000f
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703297] [=C2=A0=C2=A0 T16=
28] RBP: 00007ffd75bce4c0 R08: 0000000000000100 R09: 0000562210547ab0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703298] [=C2=A0=C2=A0 T16=
28] R10: 000000000000004c R11: 0000000000000246 R12: 00000000c01c64a3
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703298] [=C2=A0=C2=A0 T16=
28] R13: 000000000000000f R14: 0000000000000000 R15: 000056224e5c1cd0
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703302] [=C2=A0=C2=A0 T16=
28]=C2=A0 </TASK>
>> =C2=A0=C2=A0=C2=A0=C2=A0 [=C2=A0=C2=A0=C2=A0 8.703303] [=C2=A0=C2=A0 T16=
28] ---[ end trace 0000000000000000 ]---
>>
>> As the warnings do not occur in next-20250702, I looked at the commits g=
iven by
>> $ git log --oneline next-20250702..next-20250703 drivers/gpu/drm
>> to search for a culprit. So I reverted the most likely candidate,
>> commit 582111e630f5 ("drm/gem: Acquire references on GEM handles for fra=
mebuffers"),
>> in next-20250703 and the warnings disappeared.
>> This is the hardware I used:
>> $ lspci
>> 00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne R=
oot Complex
>> 00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne IOMMU
>> 00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dumm=
y Host Bridge
>> 00:01.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe GPP B=
ridge
>> 00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dumm=
y Host Bridge
>> 00:02.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PC=
Ie GPP Bridge
>> 00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PC=
Ie GPP Bridge
>> 00:02.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PC=
Ie GPP Bridge
>> 00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir/Cezanne PC=
Ie GPP Bridge
>> 00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Renoir PCIe Dumm=
y Host Bridge
>> 00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Renoir Internal P=
CIe GPP Bridge to Bus
>> 00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (=
rev 51)
>> 00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (r=
ev 51)
>> 00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fab=
ric; Function 0
>> 00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fab=
ric; Function 1
>> 00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fab=
ric; Function 2
>> 00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fab=
ric; Function 3
>> 00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fab=
ric; Function 4
>> 00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fab=
ric; Function 5
>> 00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fab=
ric; Function 6
>> 00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Cezanne Data Fab=
ric; Function 7
>> 01:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Up=
stream Port of PCI Express Switch (rev c3)
>> 02:00.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL Do=
wnstream Port of PCI Express Switch
>> 03:00.0 Display controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi =
23 [Radeon RX 6600/6600 XT/6600M] (rev c3)
>> 03:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Navi 21/23 =
HDMI/DP Audio Controller
>> 04:00.0 Network controller: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E 80MH=
z
>> 05:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/816=
8/8211/8411 PCI Express Gigabit Ethernet Controller (rev 15)
>> 06:00.0 Non-Volatile memory controller: Kingston Technology Company, Inc=
. KC3000/FURY Renegade NVMe SSD [E18] (rev 01)
>> 07:00.0 Non-Volatile memory controller: Micron/Crucial Technology P1 NVM=
e PCIe SSD[Frampton] (rev 03)
>> 08:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI=
] Cezanne [Radeon Vega Series / Radeon Vega Mobile Series] (rev c5)
>> 08:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Renoir Rade=
on High Definition Audio Controller
>> 08:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family=
 17h (Models 10h-1fh) Platform Security Processor
>> 08:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Cezann=
e USB 3.1
>> 08:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Renoir/Cezann=
e USB 3.1
>> 08:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD] Audio =
Coprocessor (rev 01)
>> 08:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19h/=
1ah HD Audio Controller
>> 08:00.7 Signal processing controller: Advanced Micro Devices, Inc. [AMD]=
 Sensor Fusion Hub
>>
>>
>> Bert Karwatzki
>=20

