Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A053EA59791
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 15:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EDA10E295;
	Mon, 10 Mar 2025 14:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fIvwBI1n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E632710E295
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 14:28:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cJYlWNWXYS8kxEdfGLl7ZjaeFgWVwNoLsBn78OmZdQv5cA1i3dmoXwTmth9yY/LuXhAAfd9OTOgQUS9dSVXQO5Hah0MXpMkP0+hHhuuYDtyJfP9uuyMbPKx1YsfbV4Q8lg1hhhjMrMhVCwf+/Zi9kM+j7QmnGzgyNYmsRmyhNhu7M4gFSecqA/lTNNPe+2nfjP3ocFlC7ktUzCaIatB/O5Ivev3Bt5KGUO5lWYlbc7mo2UVGZR4TqNvBWMfwKz5HzpttIL+9QmWHXXXDId9Vf8zBVwBTmqWHyrNwF1Yi4E3wzuGErIxBonZ4yvMGvXqkzS5zJEGGWm0L24HdAwhk4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N20GD4ehjM2UYxz0d0LcFfSB7mFicW8biR1nrJ97svY=;
 b=KqTAYVPL/XC9cZzTZ6SK8S0AUG4dUzIwBb4pQo9/+GYz0dE4ybnZeIYuF3PBx3wvNhr7H3AJ1f33uAHmodInOV0m6hUnelHerHM/x4YPsCtTN/GMEUdUS10X6SnoXE9c2QprFbQc38DO8gxsiRKjw+6n2IHet/5C/WyqGIfmk9yzqifQSl4+sNbcqP9KMk0jkUsa6gkqBTSQl5j9wtUX6T/SZAxCLrn4KSgZH/yvZhNEHAmlUeSsopIlrWSQkToIO7AtxXRPUQ68KHAS+0Vj0Ypi7P0x1axeuPnVSvfCEA4WYFZhnZgVERr+jLxZxs76ynyG3B76FEUktu+j9NbG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N20GD4ehjM2UYxz0d0LcFfSB7mFicW8biR1nrJ97svY=;
 b=fIvwBI1nZKZmV5sJUqs8P1VieamlOtPbAvOXCt+KJYF1VOf8o0sdpJRqz5SwVzAQaGcCYJu4DJeFg+Dp//uJycFVhFMvkMWrCCrJQIEqQd9qXVECfFiTKaoU+u4aEcbadVZFcccfbAnYCAqjVjYZPEtzfM7JrhPTJ2S0IFmqQPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5963.namprd12.prod.outlook.com (2603:10b6:8:6a::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.27; Mon, 10 Mar 2025 14:28:34 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 14:28:34 +0000
Message-ID: <d2c71045-fa86-44ba-9356-514d20bdf369@amd.com>
Date: Mon, 10 Mar 2025 15:28:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: revert "drm_sched_job_cleanup(): correct false
 doc"
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, phasta@kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.brost@intel.com, dakr@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250310074414.2129157-1-christian.koenig@amd.com>
 <564be70f7d64c04c1ad77499522d99c64ea4d4d3.camel@mailbox.org>
 <6b9b27a7-2ccd-4f16-aa36-05877b5e8f7c@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6b9b27a7-2ccd-4f16-aa36-05877b5e8f7c@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0432.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: 34ce9e5c-f93d-4056-f7f9-08dd5fdfd6e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1BjQmFpQnQzSHN2M0IvSUd6NlBjRWlaOFJaMXhMSHdOTi9yUy9Xd0Rhakhn?=
 =?utf-8?B?b0xMU1V5NmF6ZkY1Y1N4SVo0ZjFGQmVTbzZKSFFhb3ZCRXRRcEtCN1J1UzVU?=
 =?utf-8?B?OVdVQjV4K3ZJclE4dmVVS25xL3dUQUdiRTQwc3NGN3J6cjFmMGtpaTMwaXlw?=
 =?utf-8?B?Rk1ud203M04wQWNTVDhFQWg0ckppamRiKzJ2QTU1WlhGcXJhQmRPQWVYUGJm?=
 =?utf-8?B?cmxHWER6RTVJZlFNbXdmM0hLdzNCTDFzNzJrSjdqYWptakFiSXNGLzJpZkVR?=
 =?utf-8?B?bXZ6TDFtMFFZVk1VZUFkZ0UyVVhNd1NibUNIRFdjT3VaK0svOEdRTStCSWRv?=
 =?utf-8?B?dXArTUltZnR2VjZSMU82eGViS2wyUzlJNTFsM2xGU1JWMDczbGhlc3d2Y3Rm?=
 =?utf-8?B?OFQwazBSU3J3T0ZYRWplS0szcHRFaFRObHAzbEk4QzJaR0hWNjFrZUxRVURR?=
 =?utf-8?B?Wk9DRC9pNUZ6d0h0bEkwckoyTTdZM0lqSzFhczRoVTdBdEloOTlsQ2FUYUY3?=
 =?utf-8?B?bEhBajFlanE1UWVlZmN3TnduNnh2N3drc05iSUFoQU8zcXAxZVNJb0p4VldQ?=
 =?utf-8?B?T1kxZXRCSVlQcUdhK1k2dVk1SldzY2Z5TEY2YTVkeTBOaTdVakFSR2NaWXVx?=
 =?utf-8?B?b3ZnejIwcmZIamd6SWV6ckZORXp6b0JYOWpOWnJldjNWcTRZZitlejhUVTZs?=
 =?utf-8?B?L0tkb1pZbWJhNEVOaG80dHUxV3dYY1pSTVNxa1hrQU1EeTdzaUFyd0Rmdmlh?=
 =?utf-8?B?aFJPN2FiMjZYZmI1eUROMGttbkFGQTJRbUlpWkw1bTkxc05wNHpNYTlKVTE1?=
 =?utf-8?B?ZlQ5ZEM4T3Ayd1hSUzlTZ0dJV0JzUDQ0WFR3c2RYaDIwVnE1SzAvNHh6bjRW?=
 =?utf-8?B?UXREOEUvVmJEcmVEaXBMSldlSHVTZEdJMW9ERVFqem9BRGRiWnpjTzl4d1dL?=
 =?utf-8?B?Vi91WW1jdmJRbzZXaXFZSk5NMnVYUDVoVnZ5UUUzV000ZXJSZzRtOEtoL3Fm?=
 =?utf-8?B?b3ZUdEx0eGo5VDBEc2RieGYxVFVtc1NVcTVqL25HMVFIczJVMEV4NzloM0lN?=
 =?utf-8?B?NDZwdTk5SllpbVprQWNXKzFzcDZVQzFWdFd1dFViS2F1Z1FJcGtDSml0Mkwy?=
 =?utf-8?B?eCtjN2RGVS80UENCNzhXSHZOUW1PWXdSMkRQZzVyUzJnVFYxaDZFZ0ZsKzR2?=
 =?utf-8?B?V051WU1mRGJrNDgvY0xQMXpJRHEya0szSldWRFJZazh2aGVaaFN0alJiYWFT?=
 =?utf-8?B?UEExWDFWUUc2UlFTUW9SS0w2YmFObWRvZWx3akpYRklwMnhrQU1EdWZNU0Zu?=
 =?utf-8?B?RDFXZHFaWGQ4NWJoOXBLVnJIb0lKMnlFTVVxaFBqVGVEekd4bkRUd0p3Szh6?=
 =?utf-8?B?TGpMVVdRZExaczBhYkVQQkhwMHNJRGtGSFVLcEVwdkxOVW9vQUFtd0NWQk50?=
 =?utf-8?B?MGJCRmVsb0JDVGN3YURTUXRHbHF0Y2ExRUhGbXdHQldsRGFjb3hiY0VSMkVU?=
 =?utf-8?B?eFg2UFNTUDJibGQrQ2g0dFE2Y2x4WU4zcFUreTZKSjVsVkl4amNHcWpsNFNZ?=
 =?utf-8?B?b2hjK2NLZWNzbzBKNXJ4SW1yRnNIRDNyeXVIY1o1dTgvN0pKQU0zQW1qalFP?=
 =?utf-8?B?MUJSUHJmSTIyT2FUK09melYxU0taaFRWSVhzcWpCeDUyRFRJL2svOUl3cXNK?=
 =?utf-8?B?VGI3QXBiUmpXekErelV3MXAybWNtV3JoWDE0QnN2NmhhVllqWUgyTmdLMVRO?=
 =?utf-8?B?SUhWRm94WGswUnB3VUR3Vi80ZVkxcU8ybGlMeThOZ1FGZmR4cElhRlRhMjll?=
 =?utf-8?B?VFdvNng3SURZU3NBM3BGOFlzcUZCQ2tINHRYWTJFL00zSncveE5Mcit3WURQ?=
 =?utf-8?Q?+t1KnV4DHH4HB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vnl4NHcvT2dsWkJWY1hvWDdNQVZFSlBjdTljblNQUFczYnFCaWxROUwxVU9i?=
 =?utf-8?B?cEhzeUw5M3BwQ0NMd2lQZkRsajFYN3U1Rk5GSW1FekRCVXhyNkFIQjlzTkdl?=
 =?utf-8?B?QmhkaWNLbTlOa0ZKdURKWTFUbmt2MnBESzk3OURUalNkUFB5dnV3ZVRqTmdC?=
 =?utf-8?B?eEJPWGpGZlJiQ25QZkdNNEhibUo3RStCeHR1aFNIRU9Sbnp6UmlvamxGVFlo?=
 =?utf-8?B?RGpFakorbjc5dEkvZTNRTTl2WUljQWNYOGZZMUpxaS9jNm1Ba2wwY1cxZnJp?=
 =?utf-8?B?dWpreHJiQ2lJZk95eFo3MmRzMUhpc0M0YXdNR21xaGllN2xoVWVvNjBDb1FR?=
 =?utf-8?B?Ly9VeEtRaXNzSndxT2V1a1ZtdkNRL2kxYWd2ZmJNMFVnS1JSVzZoU0lsZ3F4?=
 =?utf-8?B?MGJrc3paWTcxSE1nT3BERm55cXl6aWJYOFRNcXY1U2NUbUl1UGpJNmh6OERs?=
 =?utf-8?B?ZFdOTk8yNE1ibUF0QXZhN3dYbTVGdXYwUzZ0TVI0dlJBUDR4M28zUnJ4bEhy?=
 =?utf-8?B?ejJuODMvYUJVOTN4RFdzSmdRSCt6RkxUTm45UXF0dHV2Y1I2SktxL2R0am93?=
 =?utf-8?B?WmR1MGlaK2RLbGJnNEVXbDZtam1TN1F4eUxSWHJLZEc0ZnkxZ0wyeEF5dFB0?=
 =?utf-8?B?VVV2RXhvak92RHBNRVdyZDBBS2c2eWQ2NUNuYWYxR1JPVnJHQTFSNEgzQ29R?=
 =?utf-8?B?KzdMd2dVMEdER0tCRWJ3ZFR3czlmY0lkQUZJbFhWT1Q4YWJaVmowV2J4S2Iy?=
 =?utf-8?B?elVieG4rL05zWUlUMHFsTjRzenpTQklJZDFSZnBnUzhudFNweGU1NmlGak9C?=
 =?utf-8?B?SUtsQXJsVkY3VVBNMTJ1TUY4SnlOU0RETEFJaE03OE1XSC9JZmFucUMrVWZR?=
 =?utf-8?B?SXFBdzlFTDE5bnRqS3NwQ281bldVNHYwek1INk5iZEttcCtWTVdkZlJMWFhx?=
 =?utf-8?B?b25qOE1EYSsyTytNdm1MQlJod3VSVjA3VkhBNWxvUDh6cVNlTUZ6aGVlNmZ5?=
 =?utf-8?B?MWg0b09OdmlTVEpVUnhtVUt3NC9ZQlFzK3V6akYzTDVVS2pQKzEvTGErTDBN?=
 =?utf-8?B?eE1YVXJ0VWxjVktyR3EyTjJQcUJmNkNLOG5UYVVURk1vYmczWElLUloxQnZn?=
 =?utf-8?B?Umd0T05WQ1doNzdkdE5wRTZWVWI3ekV2bzhDZWxKUXZtc3U1THp1OFdBTW5D?=
 =?utf-8?B?bi9YQnQzYmYwY3ZiY0xGTG45RlZDVHVpeUJGRUZ2OEdTSDNEa0lrbDc3NmdI?=
 =?utf-8?B?QVdPNzdNWmQxeTVrWDlINDNnd2JvN3VBM3htdzJxeEhkaStNZWFpTzExa0dh?=
 =?utf-8?B?dzlZa3RLOFltSHQ2NmI2ZEp0eGo1d1RkbXY4T0hPU0xSRXR4K2REbktjWXAr?=
 =?utf-8?B?Zk8zMVdWc0xWZEczdjM2T0V6YmhuUzNyVm5helU4NHhGb0NldXlKN1U3TFJQ?=
 =?utf-8?B?OTVOMkRnQzY1MjRUMkJzQzNXNGVCZjhMT3pLcnNFV1p2djh3ZGZKTHpHQ0kx?=
 =?utf-8?B?QU1nMTREaTk0MS9UNllFUFROQzI3c2wzS2xqb25jbkZ1emxCdExzYXd6QW1s?=
 =?utf-8?B?eVFVdHhOakZ0QSswYjUyL1JGbHh2OENpSUN6RENRR2U3cnh3bGp5d1hjdVFV?=
 =?utf-8?B?bE5mUy9YV3J2eitlRk1LRGNseTBCb1daQXdtTG51U1pKelhOeTRwVWZ0cU5i?=
 =?utf-8?B?V3lQQkc0MGsyMlRRdVdTYnc2UlpsT29sOXRDRWd0TFZydFl1NXJ4SFFPeE1P?=
 =?utf-8?B?dElyUVBPU3BnRTF1Q1kzVWk3TzVUNUJOaTU3WWhnV0xwYUUrSzgxbzB5Tm5I?=
 =?utf-8?B?RnUxOUNLd1JFLy81RTBsQUdKZHJaZnVRTlVNQjJFU3dKcUlmSDZPT3JCbWNo?=
 =?utf-8?B?dTRWRklNNXVFc2VVUmxDZkhGNXRnMjY4NmdFbHhTWFdxV0xRL2gzZDRnZkJq?=
 =?utf-8?B?MHB3dlFkUklEMjdpb0daRjBQWGFZYjRVMFh0Y24vNTg2bk80Tm1QTGtZYlJl?=
 =?utf-8?B?NDE4QVB6c1Rvd0hvWTBLYVVYKzZ0dGJCY3J5MzQyUGlkckd1bU95M21oMHhJ?=
 =?utf-8?B?NGpscjM1RFppTkNXT1Q2RldKam5pNXc3akJPT25wNlp3bmxjZzJHZCtLYUpt?=
 =?utf-8?Q?yWOWOFqzyCSkqi4Bw9aT4vhug?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ce9e5c-f93d-4056-f7f9-08dd5fdfd6e7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 14:28:34.5705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wtIzMFfHvxu0LNJI+lDt4StCFKrJZoohNXm3wtv533rkM7NTSyXxqxAz4CRds322
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5963
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

Am 10.03.25 um 13:27 schrieb Tvrtko Ursulin:
>
> On 10/03/2025 12:11, Philipp Stanner wrote:
>> On Mon, 2025-03-10 at 08:44 +0100, Christian König wrote:
>>> This reverts commit 44d2f310f008613c1dbe5e234c2cf2be90cbbfab.
>>
>> OK, your arguments with fence ordering are strong. Please update the
>> commit message according to our discussion:
>
> Could that argument please be explained in more concrete terms?
>
> Are we talking here about skipping one seqno has potential to cause a problem, or there is more to it?
>
> Because if it is just skipping I don't immediately see that breaks the monotonic/unique seqno ordering.
>
> Only if we are worried about some code somewhere making assumptions  "if N got completed, that means N-1 got completed too". That generally isn't anything new and can happen with GPU resets, albeit in the latter case the fence error is I think always set.

Exactly that is highly problematic.

In a case of a reset and all pending work canceled it doesn't matter if fences are signaled A,B,C or C,B,A.

But when you can make fence C signal while A is still running it can be that we start to cleanup the VM and free memory etc.. while the shaders from A are still able to access resources.

That's a security hole you can push an elephant through. Virtual memory on GPUs mitigates that on modern hardware quite a bit, but we still have a bunch of use cases which rely on getting this right.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>> Sorry for the delayed response, I only stumbled over this now while
>>> going
>>> over old mails and then re-thinking my reviewed by for this change.
>>
>> Your RB hadn't even been applied (I merged before you gave it), so you
>> can remove this first paragraph from the commit message
>>
>>>
>>> The function drm_sched_job_arm() is indeed the point of no return.
>>> The
>>> background is that it is nearly impossible for the driver to
>>> correctly
>>> retract the fence and signal it in the order enforced by the
>>> dma_fence
>>> framework.
>>>
>>> The code in drm_sched_job_cleanup() is for the purpose to cleanup
>>> after
>>> the job was armed through drm_sched_job_arm() *and* processed by the
>>> scheduler.
>>>
>>> The correct approach for error handling in this situation is to set
>>> the
>>> error on the fences and then push to the entity anyway. We can
>>> certainly
>>> improve the documentation, but removing the warning is clearly not a
>>> good
>>> idea.
>>
>> This last paragraph, as per our discussion, seems invalid. We shouldn't
>> have that in the commit log, so that it won't give later hackers
>> browsing it wrong ideas and we end up with someone actually mengling
>> with those fences.
>>
>> Thx
>> P.
>>
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_main.c | 12 +++++-------
>>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 53e6aec37b46..4d4219fbe49d 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -1015,13 +1015,11 @@ EXPORT_SYMBOL(drm_sched_job_has_dependency);
>>>    * Cleans up the resources allocated with drm_sched_job_init().
>>>    *
>>>    * Drivers should call this from their error unwind code if @job is
>>> aborted
>>> - * before it was submitted to an entity with
>>> drm_sched_entity_push_job().
>>> + * before drm_sched_job_arm() is called.
>>>    *
>>> - * Since calling drm_sched_job_arm() causes the job's fences to be
>>> initialized,
>>> - * it is up to the driver to ensure that fences that were exposed to
>>> external
>>> - * parties get signaled. drm_sched_job_cleanup() does not ensure
>>> this.
>>> - *
>>> - * This function must also be called in &struct
>>> drm_sched_backend_ops.free_job
>>> + * After that point of no return @job is committed to be executed by
>>> the
>>> + * scheduler, and this function should be called from the
>>> + * &drm_sched_backend_ops.free_job callback.
>>>    */
>>>   void drm_sched_job_cleanup(struct drm_sched_job *job)
>>>   {
>>> @@ -1032,7 +1030,7 @@ void drm_sched_job_cleanup(struct drm_sched_job
>>> *job)
>>>           /* drm_sched_job_arm() has been called */
>>>           dma_fence_put(&job->s_fence->finished);
>>>       } else {
>>> -        /* aborted job before arming */
>>> +        /* aborted job before committing to run it */
>>>           drm_sched_fence_free(job->s_fence);
>>>       }
>>>   
>>
>

