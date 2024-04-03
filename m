Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE44896A4E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 11:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CAD11291D;
	Wed,  3 Apr 2024 09:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xaqc+MhI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2119.outbound.protection.outlook.com [40.107.220.119])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78B93112915;
 Wed,  3 Apr 2024 09:16:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWutkxa0nL4z7XdJTVuJ++tAuOicBGg7CSH2yn27JuSaZ8o2Q0UMzA54T47+LE8noCX6As8I/rMlDaz1mnwqzevIw5EZBOc80oHP30Meqf//kjEVymOh/NZyzzCBnEPwQxpcCwf1gSITW4gD6Bqj5Gr3vFSwVn8X6PV05x32MZrCb520gEyrdxhlHf138HcE8KbL+zLDyMI0v/hHW4JzHV0qtpRDYCVIdq43cnXZKt553hK4VP+so5M5KyRbMm8rEf5rjnHl3KSJYJ76rqDYmT2zItw4baoLvHo6uqk97VFCQD/00I2hZBtiC+g92WXOzl9cC57MLa3QHetWGA0jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvZ2KD6dhsR1naoLVIdgd9mPSbaMP74h61vN89Zk3yY=;
 b=jfVMt46fVBwyFVAZOdXd1S44wSrwhfz1b8Op/9Ef9xBM0THng9sEFqwf2Y5/JAO26bQXAN9J0uakoLaxKLx5UN4mN806fm8x6l2EJAH8aiCrz5BhuHBZ5SIsPivZqBdBafx/cYz1WF/aBxp7+00g6r6ZPxi99Caeq3l8hCTydXcuUYWu9OjvEW80DfeLVs6xIzhFiDlktYkTqpQ+ZBKtN4tKGG7hwozrGH7ascWWgpoMBVyXvErtg4DhujdpUvA/t+n7HpiJPLcUHu92adOuQGkgx4zqLi5LOerWqMsR/QkNO7CyFecMovMeQ69SI9KNb4eWZ9qmdW4aLJ90tpSqwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvZ2KD6dhsR1naoLVIdgd9mPSbaMP74h61vN89Zk3yY=;
 b=xaqc+MhIi+b3XZSXnVlkQPCyC9gXNaLDiRsT/euFQ/lFXzXx1bLjv2ZtAx8JkwJgrZtCJfDkzGupdOfGrsg2UQnSFy5m2nrCQrfKiPpiMWxs3gxunlSMYABAqwqpGXxUe5XxFnmxRiVSCWGTbj9qHVz2O4DAq9B/95epycEFak8=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6266.namprd12.prod.outlook.com (2603:10b6:a03:457::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 09:16:52 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Wed, 3 Apr 2024
 09:16:52 +0000
Message-ID: <5495090e-dee1-4c8e-91bc-240632fd3e35@amd.com>
Date: Wed, 3 Apr 2024 11:16:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Cross-device and cross-driver HMM support
To: Dave Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, oak.zeng@intel.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <bc4c7b5f19e6479a002ef69949918a45ca89ce69.camel@linux.intel.com>
 <CAPM=9tyMF2POfE4Sm3717ibH3NSaY-AX3bMz6ZRAeaRaQWEURQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9tyMF2POfE4Sm3717ibH3NSaY-AX3bMz6ZRAeaRaQWEURQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0191.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6266:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OkgfDd0UkUFSU+/3bq7worluJbHLCttkhFC+hxL1hDx7heQA0dkWMJXqbmzaYVm6SS8+F7GHAfvNvYHMYgaHmTeLuWsnNEMMkvOwYGLd+mfhaWnzMNGhx9v3XCUpdpK0IeIX9xYDkr6qkfUAB3T8EnqVtDNhgrhgmIfEHlmhrCMCscf8/djDX+xhgfbMNAPBSAc3cPbxbcaBi2L20CxZYMGAWI6JCEELIZPsO6sbyYk5yhcdWsZo7L7DrveO0FMFhCem1rIYj726DYgf+B8yF5/omdxIK1F2+mXlYOSmpC2XECprBcLP0ZW6iFTttcsMj0npNbg1dojK0Hg/zKEec+zEm9VUY3z0bFgE1MoYDkCR5mFDLNXC8lBChxeNpr6ECvPcmLHYRiT2I97tqXW1G9QSoswkjoceXGyT39X7WZVlV32UIWmePFD5cC7Ywi0VL8CAAirU3iOXTTyO/FjyrA+0xpPz+fcrLSB1qQh2HeNb9GtTkKeQrqwabGN486a9kAOs56e5+pdn0eW0440H5WSaAASxDCRl6X751zg189GN4toEjW15+O0xsUl9c3bZYtH8xje8iPmW9jaQvfPJMHP84RylnGc8jrz+yoKDY4N8plgC8YnjoG4GJK5YR6CExXcArjil+xbonUcbPXkzvqmc19vFoUtnlljTmlkmuJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXBQVEo0TitFQ1VJS0lsNVNtUWN2T2tGUitiR2F1eitiWFBuSkQwVHByVHVk?=
 =?utf-8?B?STFSK2V1cVkzbk1PbDMyek01SGE4YUUrNFl3UTVLZUkzb2JvZmFIT1hmNmJm?=
 =?utf-8?B?N0FNSjRnK1h2ZEpTOUlHSnBuNEpDYTFGOFB2QVZvYktlamVDREpjVmNiWTIr?=
 =?utf-8?B?NVAvOFJXR21lK1hpejNySCsxb1o0SjBGN0gzb3NTNmpnNjA1c2cvb3cwaGMw?=
 =?utf-8?B?YzluYSs0ejgvazJha05ZMjV4L0thWUhacjIrMXpUVWl3WGQ0Sk1XY0Q5S3ZF?=
 =?utf-8?B?am13cDNKelFqUDdVVFZUclkwNjk5RFFUZ2Z1ek9EckhNZkVhUlk2OWFMR0gx?=
 =?utf-8?B?eUlzQ0RnbUQvVWpJV3dPUk16SnZOUWwwclNnUjJ5NTJRUGlIdHloTWZMQVJZ?=
 =?utf-8?B?b0ZWb2RaWFQzb0U5c2UrOEdkTjJBTFZqV1VscjdSYWprNmwzZFRhekFRQVlq?=
 =?utf-8?B?UXgzZVZHNmJOZnI2OTAvR1BuRm9QemZOZmw0Ui9hcVBmVlJrVEt1aXRoUHR0?=
 =?utf-8?B?VU1WVDB0am04THVmY0xiM2hSWjhEbUs5UUlmaHVrY1VGcWlXUzJST0pRekZO?=
 =?utf-8?B?OG11WCtMdmsyUE5rb1M0cFpSZmZCL3ZYaWd6N3BVUWFGcTI2VWwxYVNWTWM0?=
 =?utf-8?B?cVpuQWJpRTgyYzFPcXgxNHZxTExJcy9BblpnUDB2SEJRQk9TOWlTOE8rVFRY?=
 =?utf-8?B?NHBNTzBwZ2ZqVmxRelN6cC8vUGN0T1hlVXZCZXBtTXdGZFNNTE9zT2liQzJK?=
 =?utf-8?B?YS9MVzZCL0hJOTlLMjJsbjBVSURsVXkwNHpyZm8vU0xnbmJmMGtLYXF1U28x?=
 =?utf-8?B?ZDc5c2FHRHBrN1AyUjh0RHVZOUJHWjBYK25oNUFEeGFSZ0U0KzlxYURPRW10?=
 =?utf-8?B?SFhBeTFCaDYyWjB4ZzdRa28vTElad1JycSszTlR5MHdBWXNBNmJ4MUczWHNB?=
 =?utf-8?B?OGNNUUo4dm02ckU3djdXZHZJUEh0VmI5YVp2Z0FETkFZS28vZ0tuRHRITGQ5?=
 =?utf-8?B?UFZCSVZiNEhSbW0vaEJnMCtMenVZcCthakZSZG5FZEZWeldiQVRaQTU2VjJQ?=
 =?utf-8?B?OTZtbVBwSVJFL0M0TWRwZVI2d0tCeUxLNnZicFBLZTlNVkhIRURQREF3V0M1?=
 =?utf-8?B?MHJwR0llM3ZaN0tsOUpHWHFSS1pVQUdTLy9pT1JQaDBaQ1FKcWtiNFV6NmE2?=
 =?utf-8?B?RlhaY2taUjRjcGp4YmFFOW43dmhzUW5seGhleURsZlo2cVJnMG05VzdrUmFP?=
 =?utf-8?B?djA5SkIzb2c0eURJK1ZSdmlJMWprclllaW1DQmRhZStHV1JQeEhzaW9ZdVlt?=
 =?utf-8?B?Tkk2NzY5ck5DYXExMU00NFpnaURHYXh6WXJCTFBWaFgxTW1hZStOU01vU3p5?=
 =?utf-8?B?V01HMWtFNkpvTUtFMUR5NGdjeDlDUzFMTFNnc1doYjBhME5nejJFTzl4ZTJx?=
 =?utf-8?B?OEtjeVUzeEpRZTZWbWtMS1BjMXBHNmI1U0tIbHBGbDdTWDltWitKa0lKdFhX?=
 =?utf-8?B?Z3JLYVVKN1h6ekhmMFFJMDFQYmJxNkNOQ0diWDhnR0xXTzVPb3hKbVZub3E0?=
 =?utf-8?B?d3ZOK3IwbmU0Zmc3NWpFcGdueTFDWHBueEdpeEdYNk4xQnVWWXM1RkhxTGYv?=
 =?utf-8?B?Q1h4MjVFMEgrRjlHOGRsSUJZWFpFNldQVWkvRWk5UGV3c0RzVjRSNG1XTEFH?=
 =?utf-8?B?YWJwU1QzZ21tM0FKYjJmUnRrNndDWXp2eXp2Sk13ZjgvTm1rVENHREtXK1JF?=
 =?utf-8?B?M3Y0WnJ6YTJIL3RRMDRRc2RzV1BJRG1PRVd3bm1oYUV3REdsT3Q5WnlkUFJO?=
 =?utf-8?B?aDJKc3hqc1V6N0VKSWg5WXBIVmFEWFozUWYzM2tRNlVMVDhVVURjUHVEUHli?=
 =?utf-8?B?NERDRThiVUZMUXRlS3BrTzRCVGpUYnhESVVXRk02TGV0ZUhBRmVzTFVIWEtp?=
 =?utf-8?B?c1BJZmRiV3J5WDJ4RzFPbVpETE16YmM5SmhYcEVYRk5IT2RFZWlmaENKeTJZ?=
 =?utf-8?B?a0FrTVg1MjJmQllmTlZaZ3ZyeWpqL1NZZ2hpN2d2VlpBV0dneVhzUG5BZm5i?=
 =?utf-8?B?bnh1SHBYWThWSytDV3lrSnB5SVNXUDNjNnNkaGsvUllzako0eWx3WUw4WmVp?=
 =?utf-8?Q?GCrdJhR1Q5FnUrr/Q+nclL9lg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63eaf008-d9ef-48cc-a843-08dc53becc8b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 09:16:52.3343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGMXt05NIszT3cf5uklT3xy0ZMI2vYd0MjXE17bojkBki81JTw06FLw4UMI2rUmG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6266
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

Am 03.04.24 um 00:57 schrieb Dave Airlie:
> On Wed, 27 Mar 2024 at 19:52, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> Hi!
>>
>> With our SVM mirror work we'll soon start looking at HMM cross-device
>> support. The identified needs are
>>
>> 1) Instead of migrating foreign device memory to system when the
>> current device is faulting, leave it in place...
>> 1a) for access using internal interconnect,
>> 1b) for access using PCIE p2p (probably mostly as a reference)

I still agree with Sima that we won't see P2P based on HMM between 
devices anytime soon if ever.

The basic problem is that you are missing a lot of fundamental inter 
device infrastructure.

E.g. there is no common representation of DMA addresses with address 
spaces. In other words you need to know the device which does DMA for an 
address to make sense.

Additional to that we don't have a representation for internal 
connections, e.g. the common kernel has no idea that device A and device 
B can talk directly to each other, but not with device C.

>>
>> 2) Request a foreign device to migrate memory range a..b of a CPU
>> mm_struct to local shareable device memory on that foreign device.
>>
>> and we plan to add an infrastructure for this. Probably this can be
>> done initially without too much (or any) changes to the hmm code
>> itself.
>>
>> So the question is basically whether anybody is interested in a
>> drm-wide solution for this and in that case also whether anybody sees
>> the need for cross-driver support?

We have use cases for this as well, yes.

For now XGMI support is something purely AMDGPU internal, but 
essentially we would like to have that as common framework so that NICs 
and other devices could interconnect as well.

>>
>> Otherwise any objections against us starting out with an xe driver
>> helper implementation that could be lifted to drm-level when needed?
> I think you'd probably have a better chance of getting others to help
> review it, if we started out outside the driver as much as possible.

Yeah, completely agree. Especially we need to start with infrastructure 
and not some in driver hack, we already have the later and it's clearly 
a dead end.

Regards,
Christian.

>
> I don't think gpuvm would have worked out as well if we'd just kept it
> inside nouveau from the start, it at least forces you to think about
> what should be driver specific here.
>
>> Finally any suggestions or pointers to existing solutions for this?
> I think nvidia's uvm might have some of this type of code, but no idea
> how you'd even consider starting to use it as a reference,
>
> Dave.

