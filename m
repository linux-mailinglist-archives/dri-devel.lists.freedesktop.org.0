Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79783C25968
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 15:34:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF80910EB8B;
	Fri, 31 Oct 2025 14:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fRB3og/t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013022.outbound.protection.outlook.com
 [40.93.201.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E648B10EB7C;
 Fri, 31 Oct 2025 14:34:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1r6gKruSyhFgF0a0hpAtrRkzoOU4Pqm3h+hZjWDE/pEgJeEG43NSrVnZSboHKvkDsErAOzTcumH+aS+9NNIhDpSy9cP2KBSCsjl9cABuQ6Onypb8JTyKbHokxy83t9juMDA1yl6lJMybIf+ZM15A3Jb2Ugf3AHrUNw8EvGeZrBKDyfOK3m9LWMRFlHz+hgdkk+VWu+b16h56Ube+31laaQk9CtJWe16fWduHTlVpEnBwcgB1pFx92gs/T0q1ooJvSe3pl3NBJFgn/n6COjNFR0hEJD+0gA70DK/RkMs0DslqWJ3anHPOPvz0huBmJETYaiEmtmitPOhL8jGG4pHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y4SGNKV/fr9rHHADNLAHB/7rm7lueJ/N1oCZIUlMVAI=;
 b=y8lp1wlzAAuLfMJkDbnW+pmYvsrmhNLWIDjGi/kCD66IaTi+VZ95mPIoZ97/2UzmImr39/EXA+YjOdghTDgIgl47Bx54HZjgoEOkCpSbCNYXBrpJ1s7EWEoFOtLvJSk/5/VMcd3faFJZzkm0P//cU0O/e32R4g9UJdpEK7pEVG0UjdQ+HQdgaQhVNu91SXCOldkvZRAN0BJZn30Pkskb6qz/nxQ8lqbOT0C1oqCnlgc0jDEMlP7jjkD8Lx+PpCysddE1/Q0VDc2piJp0Ty9KATJQX5Xj3momo70wQL1TrobeRG9TcPvQE0mLY7vEYEFBTPwwDHGrzg4cOdKc0hvvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y4SGNKV/fr9rHHADNLAHB/7rm7lueJ/N1oCZIUlMVAI=;
 b=fRB3og/tXRxNmWM4GFS4u41BOnQYpboB8eKBGmbTwZFWnzi2ShHTM0UtvIMhNB7Wlixhb6rEfy8SijbvXXobR9+BCaZO5H6fAvRo+gaoOwOTCXx6miKLuSCPCLIAA0HSFlL9+HqP2PZsvHOGCFWADvo5Jp9UJpG5WyYPxgQYvwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA0PR12MB7531.namprd12.prod.outlook.com (2603:10b6:208:43f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 14:34:16 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 14:34:16 +0000
Content-Type: multipart/alternative;
 boundary="------------PYOoGq8bQ6CCeBfEWhFNwSoJ"
Message-ID: <70dbb58d-fa41-476a-be2b-8d98da3eaf3b@amd.com>
Date: Fri, 31 Oct 2025 10:34:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/20] drm/amdgpu: independence for the amdkfd_fence!
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-16-christian.koenig@amd.com>
Content-Language: en-US
From: "Kuehling, Felix" <felix.kuehling@amd.com>
In-Reply-To: <20251031134442.113648-16-christian.koenig@amd.com>
X-ClientProxiedBy: YQBPR0101CA0195.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA0PR12MB7531:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dea8c3f-0ca6-4808-1bec-08de188a91e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ci82OG8ydjlhR3hJL0Z5Qk5va1dwS002MnRYamo5djN5NEhYUDNpS0xhYzgx?=
 =?utf-8?B?bDlnMWtNZUxiZStSSkh3MVY2cmJwc3VGUWU1aThvamRRek1ZN3UvSUhYdkhk?=
 =?utf-8?B?VG1wZFdka2tVMkZRYmlQd0J1OWhWQ1VsZkFKV29QS052ZDZ5eHRlb2ZEMmNp?=
 =?utf-8?B?YnJQSnBGZzF5THBzdDJqMTRqaXloSWphOVQ2dEQvOHpzM2FNdDRGd0x0RVBS?=
 =?utf-8?B?R25tcmV4dzE0SWhSRE4xRjZRTTlJVFc5VVVpM1U3VTlXelRuL1NJaUE4TEhL?=
 =?utf-8?B?RVFZTFZ4V0U5YzUxK2FPcDZtV0JJZVREcDFIdGlLWVFmU2VxczNxcnF5NHNW?=
 =?utf-8?B?aUdzK2JKeUpGMnhoaWc1ZmU1NkxSNUZTaG02REtoVjhENDh3b20zQ0VMNHU2?=
 =?utf-8?B?M3dlVTEra3Q4S3BHeDYrMzJvN285VzFrRnE5NVVWeURsNUJxek11ZHBma2Zm?=
 =?utf-8?B?VmRSRERtcG9KOEV1TEZ2TmNXYi92MEJLVTF3ek1oS1ZTTkNrZXBuOGhBM1pG?=
 =?utf-8?B?L3daU09GamRBMi9oWUlNQzh3dnVnN3dtTGlIS1J2VHVRa0xsRmJCcW51L0p0?=
 =?utf-8?B?bWk1UUU2R2g4K2FkcC8yZDFHeWpHWlBFVCtuUzM0YWNBODQwbTBMWitqZkdY?=
 =?utf-8?B?VDBReDM4SEY2Sm5LaC9xdWNmbS81NTdnK0ZXeVRnN25rWE1nQzVkYlJRdWl2?=
 =?utf-8?B?S1VDbXcxYnVzV081cVI2UmJHWEkzSzBXOHM2ZnpCNFJ3SDNnUklwMHc5WElI?=
 =?utf-8?B?VlNZS3dKQmdmSmZJaFAzU0d0TXpoMkp2dUF2L0c1Y0ZaampPTTFmWExYVHdV?=
 =?utf-8?B?YnJoOG53clFUWDU1Y3hpcWQyKzVVelphU1RpUXRVUkh5QnpVU3ptRHNIdXZY?=
 =?utf-8?B?M0NpZzVKeE9nMWt1R3RoMlhYcVpUS05FSDVZRHdNM2ExdGVOZ1RxWHJ5RlI2?=
 =?utf-8?B?R1U2SURRbnFTcjdjaDNFSWt0NFR4YUhEcnJnRVMxeVlBL0NsQ2d4ZFZkUFk0?=
 =?utf-8?B?dTVEeWtZR1JOUlFWTEg5REVpNCtQZGY4S2NtazB3dVIyUFNSTTYyT3Q2cWhm?=
 =?utf-8?B?ai9UeDRnWXc2V0tMM1lSYWVFWDlZN2pySzY0d1ZnVStPeExTVlFSQWdVN1I0?=
 =?utf-8?B?VzdBeklHVHFEdUZWc0JkQjhFVDdyb0M0UUd4SWljU1g1cTFVL1dWSkp0N3Jk?=
 =?utf-8?B?M0V6djErQVFDcm1rcDk5THZGM3lnNzRtZk44YUt2enhLbW0vTnN2bU1BSThW?=
 =?utf-8?B?elcwSFUxVWN3cCt6c25JMHNOS2RYVjBtbkpVbXBzb1VQM3FYWnA2a1BSN3JD?=
 =?utf-8?B?MmxOSnpYZTkrZ2JXb0hsREs1Tm5zQk10VXphMHBvcDVFTEk2YmZ1UkgyTVdW?=
 =?utf-8?B?MFJSQm9PYnJqVEtJT1QvNnZscW84K1R6WGNJaGR6VDBFMjdyY1NiVE1nbW9G?=
 =?utf-8?B?NjB5cnVheUJ5ZmdFTnZpenkzYy9Gd0FoL2RmamhHdDFDbW1yUk5WbTNYV1dP?=
 =?utf-8?B?dGkrU0E5V0pWS2s3V3pDUUVlVjBuNC9ZV2Y2L3JSeEp2d1BMNW80R2RFNnY3?=
 =?utf-8?B?WXJtNnFQYk92SWtGNy9jRU9nanVMVGJibThOT096bDY1MGdHWDUxdjZyVkZI?=
 =?utf-8?B?c0daWUhWVzIvN3Rhc2oxTDE1akMwZ2xubTVES0p2akJqZVVYNVY4VVFQRFhW?=
 =?utf-8?B?c0k2em5lR2VwUEl3bHMxRmw4dzF0cEhqNXM5VzRtOHcwRkM4MDREVXBhYW5J?=
 =?utf-8?B?S0JHTzBjbXBJbUVCQ29jRVdBcEVIQU5sY0pMT3h5U21hN3pNbHV5a0M3Tkpk?=
 =?utf-8?B?UkZMemh6QlA1NTErSTJ1alF2MjNvM3BLTzJhZklUTmo1YXhrcEthbGlMV1Av?=
 =?utf-8?B?ZmRpaDlMRVFuTzh5ZWtZeHpHbjBCWElLZ0hPdnRtTXEyTE9MVnFLdHcwUEly?=
 =?utf-8?Q?I2z1bOkWIIwdX6SXYlJS3E7TevYLb+k4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnFGb3RBZ3VCM0U5bWIyWmFhTEMwMyt0aTB6Ky93Y0VnanU1SFg0emF0M1ZH?=
 =?utf-8?B?dHJUcTcvYWRqM1VnbG9XV3BpTVY5d3pHQURvMldyUWdYakdOV3pkL3QrdTFW?=
 =?utf-8?B?L3cxZ0lDcVNnckx6QXk0Njc0U2VUMGV0aENGN3ZSVTBLSkdHV09QYWN1aVND?=
 =?utf-8?B?eGttSExEZWk3RzRVUkcyMUhDSzgyMVBURW8rSmxrZE1wOEl2UWZsanhVeHRW?=
 =?utf-8?B?SGZPVC9saUNnVTJvTk42V1hiT3hBMVR1VG83WUhaMUNCcit1bElkVHRoSUcz?=
 =?utf-8?B?S3ZOcWxYR0JyTlhxOUd4bVVWc20yU2RDUlhMTzJxRVFwck9rQTNPcWQ5NTYz?=
 =?utf-8?B?OWZ6OEE5c0UvV0t5RnVIemtEU24wOUxpZlFSRGdSYW55TlJNSmxWcmtSSzFD?=
 =?utf-8?B?aFk0eTZ1RGNPbkZ4RGJGTWNvVndqcFA0b0VCUTFXQVJ3elJXcVNCN24yZ1lB?=
 =?utf-8?B?b3FHYVlWckxnTlY4RER6N1R4c2JrSUN0WFpaM1FDY2hKbmxnYytETjViM1RK?=
 =?utf-8?B?SU5NR3I4V09kclV6enkzRHFYZE1rSlhDQWxYWVgxckMzWXlqaHdTK3prYS82?=
 =?utf-8?B?a2pPTURySDBHY1ZPRzEzNVRpWWRXOGRtVkhJSVNjWDRHQngzODdUYUZyc0pq?=
 =?utf-8?B?MVF1M0lBREQvL0hSV04yNElHYkJSZEdPSERCOUZReXdmWXhDVmhIenQwV1VV?=
 =?utf-8?B?L25hL2ZXeC9VUW91Tnc1MGsyalhjcGNaU25xNGN2bkR6SHV0aFQvSEs0Z21s?=
 =?utf-8?B?NVc5cEFWNW5TY05IWVVrWkcyQ3ErQWlCK2NXc214ZkhQWDZnbnE0eUFad2tM?=
 =?utf-8?B?NnkySXVidE9EQzZCU1B1Q0FaSXdWNWZnTUc4SlZnZE9uZlZFb0FDQmlXRW5J?=
 =?utf-8?B?aS9oV3N0YnY1OFJLdlAxYWRWVzY1S2U2VTFHRVpVUGQzU1VudW9yd0cvK0w4?=
 =?utf-8?B?VzJSSmJ1SFBTT2FXL0Q4N3I4VGgyV2xKSHNnOE9STDA2QitWeFNvRHFPTmdT?=
 =?utf-8?B?cXFjWVo4UUhsRk9pR2M1STgzdWozZ3VadENBNXU2TklJcFY5TmxZWGJuaUFJ?=
 =?utf-8?B?dnlGV1ExU3RjTFhQaENBbW1uZ1BGU2NxQzQ2Y2lpSTQwV2FZdVRUcG5nQXVD?=
 =?utf-8?B?K2tOTjM1MmRUakpIV2VmU0hLN3RXbGY5b3RzODRZZ0ZHK1VLQ3h1c1ptSVBQ?=
 =?utf-8?B?Vmk4dmcwWENtdk9MZ0N2YlpwZngyQ28ycGNpaXpLSVYxRy9KVVJkMjJMOVc5?=
 =?utf-8?B?VFdPY2VYVjBpWnZSdXdGbU9sa3VXc215c1JSeTIwN2VBQ1BDazJ5Zjhlc29j?=
 =?utf-8?B?RHhkYzQrbTJqZW9LSDliTXFoQnlVR3FUc0E3WHI5T1BhejhWUFRlZ0owWUM2?=
 =?utf-8?B?bWdWOTRWdkNxeVNJYWxhLzFZS3BsTlZmQzBQNC9CUFZiSVVwTnEzQUVjKyty?=
 =?utf-8?B?SE5RTDkwR2szVm13WEIvNVZyTnhKRGZIYktBVWJGMVlWMFJWeFRsdEgrdVd3?=
 =?utf-8?B?MHZwS2hJTHBOV2laaldsTkh3OXR0QnlpV2FZZUhEdklzcjc1NXBicG5aNXMv?=
 =?utf-8?B?eFJvVnByYzl0b2NjendlK2YxdUlSMzFFeUFNTjBwV0tqV3d5WGVYWjJIVFk5?=
 =?utf-8?B?ajc0ZEw4cHlzUWlCSDVKd0ZuZWRBSUFpTXRaTG9zeW1KUytuNTl6ZklZNE5C?=
 =?utf-8?B?QVlZY1dWUmFia3VrVk5xT1Z4RUdTNVZXQVhWMUFzWWVCanJKN01jbFZsaWxh?=
 =?utf-8?B?TnVOeVYzODB0NEk0dVJKemFndnFvcXlLaTd1bWFHckNVMjhjWnhEamZaSk42?=
 =?utf-8?B?dGRRa0hSR1VQZ0M2NWNTUWoyVlAvZTdMclljKzdrRFNiYlhGZ2FlMldrc1VC?=
 =?utf-8?B?ajZIL2ZvZEI3dTVaejBZTHczd1lCWTY1cTBrUEgrcWRJbEIvZWhIcEwzK0E3?=
 =?utf-8?B?WGFVbUxYTWhwaU5WS3MzV1hMTnc2bnh2czZmaTFyZkx0MGxoK0ZEa2R4cko2?=
 =?utf-8?B?RlZRbzJTR1FSWStvU040RktETkhMNEFMUG5SWEFTNVZtRGlwcVZDK1RYVjJW?=
 =?utf-8?B?UG5qcCszZStQOEZpQnFmMlpMcEpFWVFtVTlQZFpKc1k4WVRDRDZXbENsdTNI?=
 =?utf-8?Q?bmQ5durduAZTQ73keBgE5EOfm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dea8c3f-0ca6-4808-1bec-08de188a91e0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:34:16.7075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrW67EDTFWmT11BbhMEde7Qboh5WyHhFv6CMxRE+VISBLkToay8v6dChTonAdKYKzCe6HVqKoMB37dr5QZDkjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7531
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

--------------PYOoGq8bQ6CCeBfEWhFNwSoJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-10-31 09:16, Christian König wrote:
> This should allow amdkfd_fences to outlive the amdgpu module.
>
> Signed-off-by: Christian König<christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  6 ++++
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  | 36 +++++++------------
>   drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  7 ++--
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  4 +--
>   4 files changed, 24 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> index 9e120c934cc1..35c59c784b7b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
> @@ -196,6 +196,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
>   #endif
>   #if IS_ENABLED(CONFIG_HSA_AMD)
>   bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
> +void amdkfd_fence_signal(struct dma_fence *f);
>   struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
>   void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
>   int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
> @@ -210,6 +211,11 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
>   	return false;
>   }
>   
> +static inline
> +void amdkfd_fence_signal(struct dma_fence *f)
> +{
> +}
> +
>   static inline
>   struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
>   {
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> index 09c919f72b6c..69bca4536326 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> @@ -127,29 +127,9 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
>   		if (!svm_range_schedule_evict_svm_bo(fence))
>   			return true;
>   	}
> -	return false;
> -}
> -
> -/**
> - * amdkfd_fence_release - callback that fence can be freed
> - *
> - * @f: dma_fence
> - *
> - * This function is called when the reference count becomes zero.
> - * Drops the mm_struct reference and RCU schedules freeing up the fence.
> - */
> -static void amdkfd_fence_release(struct dma_fence *f)
> -{
> -	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
> -
> -	/* Unconditionally signal the fence. The process is getting
> -	 * terminated.
> -	 */
> -	if (WARN_ON(!fence))
> -		return; /* Not an amdgpu_amdkfd_fence */
> -
>   	mmdrop(fence->mm);
> -	kfree_rcu(f, rcu);
> +	fence->mm = NULL;
> +	return false;
>   }
>   
>   /**
> @@ -174,9 +154,19 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
>   	return false;
>   }
>   
> +void amdkfd_fence_signal(struct dma_fence *f)
> +{
> +	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
> +
> +	if (fence) {
> +		mmdrop(fence->mm);
> +		fence->mm = NULL;
> +	}
> +	dma_fence_signal(f);
> +}
> +

I'm still concerned about possible race conditions between 
amdkfd_fence_signal and amdkfd_fence_enable_signaling. I think the 
latter is always called with the fence->lock held. So this could be 
fixed by taking the fence->lock in amdkfd_fence_signal:

void amdkfd_fence_signal(struct dma_fence *f)
{
	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
	unsigned long flags;

	spin_lock_irqsave(f->lock, &flags);
	if (fence && fence->mm) {
		mmdrop(fence->mm);
		fence->mm = NULL;
	}
	dma_fence_signal_locked(f);
	spin_unlock_irqrestore(f->lock, flags);
}

Also note that you need to NULL-check fence->mm (here and in 
enable_signaling) because mmdrop doesn't have a check.

Regards,
   Felix


>   static const struct dma_fence_ops amdkfd_fence_ops = {
>   	.get_driver_name = amdkfd_fence_get_driver_name,
>   	.get_timeline_name = amdkfd_fence_get_timeline_name,
>   	.enable_signaling = amdkfd_fence_enable_signaling,
> -	.release = amdkfd_fence_release,
>   };
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> index ddfe30c13e9d..779d7701bac9 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> @@ -1177,7 +1177,7 @@ static void kfd_process_wq_release(struct work_struct *work)
>   	synchronize_rcu();
>   	ef = rcu_access_pointer(p->ef);
>   	if (ef)
> -		dma_fence_signal(ef);
> +		amdkfd_fence_signal(ef);
>   
>   	kfd_process_remove_sysfs(p);
>   	kfd_debugfs_remove_process(p);
> @@ -1986,7 +1986,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
>   static int signal_eviction_fence(struct kfd_process *p)
>   {
>   	struct dma_fence *ef;
> -	int ret;
>   
>   	rcu_read_lock();
>   	ef = dma_fence_get_rcu_safe(&p->ef);
> @@ -1994,10 +1993,10 @@ static int signal_eviction_fence(struct kfd_process *p)
>   	if (!ef)
>   		return -EINVAL;
>   
> -	ret = dma_fence_signal(ef);
> +	amdkfd_fence_signal(ef);
>   	dma_fence_put(ef);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static void evict_process_worker(struct work_struct *work)
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 9d72411c3379..5d62d231a865 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -428,7 +428,7 @@ static void svm_range_bo_release(struct kref *kref)
>   
>   	if (!dma_fence_is_signaled(&svm_bo->eviction_fence->base))
>   		/* We're not in the eviction worker. Signal the fence. */
> -		dma_fence_signal(&svm_bo->eviction_fence->base);
> +		amdkfd_fence_signal(&svm_bo->eviction_fence->base);
>   	dma_fence_put(&svm_bo->eviction_fence->base);
>   	amdgpu_bo_unref(&svm_bo->bo);
>   	kfree(svm_bo);
> @@ -3622,7 +3622,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
>   	mmap_read_unlock(mm);
>   	mmput(mm);
>   
> -	dma_fence_signal(&svm_bo->eviction_fence->base);
> +	amdkfd_fence_signal(&svm_bo->eviction_fence->base);
>   
>   	/* This is the last reference to svm_bo, after svm_range_vram_node_free
>   	 * has been called in svm_migrate_vram_to_ram
--------------PYOoGq8bQ6CCeBfEWhFNwSoJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-10-31 09:16, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251031134442.113648-16-christian.koenig@amd.com">
      <pre wrap="" class="moz-quote-pre">This should allow amdkfd_fences to outlive the amdgpu module.

Signed-off-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  6 ++++
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  | 36 +++++++------------
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  7 ++--
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  4 +--
 4 files changed, 24 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 9e120c934cc1..35c59c784b7b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -196,6 +196,7 @@ int kfd_debugfs_kfd_mem_limits(struct seq_file *m, void *data);
 #endif
 #if IS_ENABLED(CONFIG_HSA_AMD)
 bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm);
+void amdkfd_fence_signal(struct dma_fence *f);
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f);
 void amdgpu_amdkfd_remove_all_eviction_fences(struct amdgpu_bo *bo);
 int amdgpu_amdkfd_evict_userptr(struct mmu_interval_notifier *mni,
@@ -210,6 +211,11 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
 	return false;
 }
 
+static inline
+void amdkfd_fence_signal(struct dma_fence *f)
+{
+}
+
 static inline
 struct amdgpu_amdkfd_fence *to_amdgpu_amdkfd_fence(struct dma_fence *f)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 09c919f72b6c..69bca4536326 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -127,29 +127,9 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 		if (!svm_range_schedule_evict_svm_bo(fence))
 			return true;
 	}
-	return false;
-}
-
-/**
- * amdkfd_fence_release - callback that fence can be freed
- *
- * @f: dma_fence
- *
- * This function is called when the reference count becomes zero.
- * Drops the mm_struct reference and RCU schedules freeing up the fence.
- */
-static void amdkfd_fence_release(struct dma_fence *f)
-{
-	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
-
-	/* Unconditionally signal the fence. The process is getting
-	 * terminated.
-	 */
-	if (WARN_ON(!fence))
-		return; /* Not an amdgpu_amdkfd_fence */
-
 	mmdrop(fence-&gt;mm);
-	kfree_rcu(f, rcu);
+	fence-&gt;mm = NULL;
+	return false;
 }
 
 /**
@@ -174,9 +154,19 @@ bool amdkfd_fence_check_mm(struct dma_fence *f, struct mm_struct *mm)
 	return false;
 }
 
+void amdkfd_fence_signal(struct dma_fence *f)
+{
+	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
+
+	if (fence) {
+		mmdrop(fence-&gt;mm);
+		fence-&gt;mm = NULL;
+	}
+	dma_fence_signal(f);
+}
+</pre>
    </blockquote>
    <p>I'm still concerned about possible race conditions between
      amdkfd_fence_signal and amdkfd_fence_enable_signaling. I think the
      latter is always called with the fence-&gt;lock held. So this
      could be fixed by taking the fence-&gt;lock in
      amdkfd_fence_signal:</p>
    <pre>void amdkfd_fence_signal(struct dma_fence *f)
{
	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
	unsigned long flags;

	spin_lock_irqsave(f-&gt;lock, &amp;flags);
	if (fence &amp;&amp; fence-&gt;mm) {
		mmdrop(fence-&gt;mm);
		fence-&gt;mm = NULL;
	}
	dma_fence_signal_locked(f);
	spin_unlock_irqrestore(f-&gt;lock, flags);
}</pre>
    <p>Also note that you need to NULL-check fence-&gt;mm (here and in
      enable_signaling) because mmdrop doesn't have a check.</p>
    <p>Regards,<br>
      &nbsp; Felix</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20251031134442.113648-16-christian.koenig@amd.com">
      <pre wrap="" class="moz-quote-pre">
 static const struct dma_fence_ops amdkfd_fence_ops = {
 	.get_driver_name = amdkfd_fence_get_driver_name,
 	.get_timeline_name = amdkfd_fence_get_timeline_name,
 	.enable_signaling = amdkfd_fence_enable_signaling,
-	.release = amdkfd_fence_release,
 };
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index ddfe30c13e9d..779d7701bac9 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1177,7 +1177,7 @@ static void kfd_process_wq_release(struct work_struct *work)
 	synchronize_rcu();
 	ef = rcu_access_pointer(p-&gt;ef);
 	if (ef)
-		dma_fence_signal(ef);
+		amdkfd_fence_signal(ef);
 
 	kfd_process_remove_sysfs(p);
 	kfd_debugfs_remove_process(p);
@@ -1986,7 +1986,6 @@ kfd_process_gpuid_from_node(struct kfd_process *p, struct kfd_node *node,
 static int signal_eviction_fence(struct kfd_process *p)
 {
 	struct dma_fence *ef;
-	int ret;
 
 	rcu_read_lock();
 	ef = dma_fence_get_rcu_safe(&amp;p-&gt;ef);
@@ -1994,10 +1993,10 @@ static int signal_eviction_fence(struct kfd_process *p)
 	if (!ef)
 		return -EINVAL;
 
-	ret = dma_fence_signal(ef);
+	amdkfd_fence_signal(ef);
 	dma_fence_put(ef);
 
-	return ret;
+	return 0;
 }
 
 static void evict_process_worker(struct work_struct *work)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 9d72411c3379..5d62d231a865 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -428,7 +428,7 @@ static void svm_range_bo_release(struct kref *kref)
 
 	if (!dma_fence_is_signaled(&amp;svm_bo-&gt;eviction_fence-&gt;base))
 		/* We're not in the eviction worker. Signal the fence. */
-		dma_fence_signal(&amp;svm_bo-&gt;eviction_fence-&gt;base);
+		amdkfd_fence_signal(&amp;svm_bo-&gt;eviction_fence-&gt;base);
 	dma_fence_put(&amp;svm_bo-&gt;eviction_fence-&gt;base);
 	amdgpu_bo_unref(&amp;svm_bo-&gt;bo);
 	kfree(svm_bo);
@@ -3622,7 +3622,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
 	mmap_read_unlock(mm);
 	mmput(mm);
 
-	dma_fence_signal(&amp;svm_bo-&gt;eviction_fence-&gt;base);
+	amdkfd_fence_signal(&amp;svm_bo-&gt;eviction_fence-&gt;base);
 
 	/* This is the last reference to svm_bo, after svm_range_vram_node_free
 	 * has been called in svm_migrate_vram_to_ram
</pre>
    </blockquote>
  </body>
</html>

--------------PYOoGq8bQ6CCeBfEWhFNwSoJ--
