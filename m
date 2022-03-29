Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 694DA4EACE7
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 14:14:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DE810E89C;
	Tue, 29 Mar 2022 12:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E8910E89A;
 Tue, 29 Mar 2022 12:14:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvnuO/Aw5UiwBIZ/JO4djW/D3ap9TTuAiic5yhiUHkhgGleuk+R/7x8h7/m3kGz2EOhxCUwXASqueUkkSVVWl6a4uhfnGBTu2AU788x8CzJgt4p2b1SkPgbxOsoGUaGKKQnjNVxxfH8fRa0t+p39nwY4NRCOBLHaWrn8AP3o4Ip0TsFzzia3U8EJf8Lg4HGkzqPLqIHk0ug/Y3Q/XIH1+8CQvCvUjabAWc01FhvUXiWWGmhxKo7YWM0Y4pNLE+VtVtWxL5zcuNEpksawTKr4VsQzrGd3KZcMNt9Z8zZG5xs9pSsDaY87Friul5GXcMiQuNN/xj9hkfsOhwoRiwMaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDH+ONvNGhZkp3uMun9cJeDiqEQLvbf+lHpGMf65fJ8=;
 b=R3D3rzYn63L3iqHY/e+06+1/s+zwaKfbsD3DRLvhciHVl8BE/Tau145YHvTOIPTgMeuYHv60TXnEsCNZCYoDpf9YK89HNv8AgNEBC21uEM7wzq4B4zLWLY28vKkwt/k4fMfKRim9q8YM7dxwM7jW3+0uKavV0PoGTW1jZTRPKTCibc5Ydd12e2SeVG4wzg+8jfkkEki91nlGZ3V97a6CfeawDU2gzk8iAhmPGqHsbk4hurMFnXP3p9NgBijRCKb3MYBNh0uvO8QeMYYUYrZ2zx/BJEuBxJRsck/nULcOnwU8z4/ipYg2ov4/8DJmcagiiN5OdT1LCGO0GAUvvFxsSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDH+ONvNGhZkp3uMun9cJeDiqEQLvbf+lHpGMf65fJ8=;
 b=SOmoD0aJky0zkoqvrbvcROGooJMShXhhvE5wcSxZ2YEqfq2O94VdhVms1RugmEvU/COKTBBQGWcmGa1pFlEyU/SDOBnUBeHQBadlXa/uDvf1mOp/mtMXCggZno6Eujp1086XENQvj7toN63OZvUjM1kGnuiHOehaYzbVFmC7fog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR1201MB0091.namprd12.prod.outlook.com (2603:10b6:4:57::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Tue, 29 Mar
 2022 12:14:24 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 12:14:23 +0000
Content-Type: multipart/alternative;
 boundary="------------924cAIMQ8QVY4V3a1NmAMs7N"
Message-ID: <5818c2a4-80c4-8af2-9937-d2787054c149@amd.com>
Date: Tue, 29 Mar 2022 14:14:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Content-Language: en-US
To: "Olsak, Marek" <Marek.Olsak@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
References: <20220311102709.225616cf@eldfell> <20220316104815.11ec2e6c@eldfell>
 <CADnq5_MbOLaZGaQ8fYW_ZL3+gssu3cq7QbzByOWdLuvbdfSAAg@mail.gmail.com>
 <CAF6AEGvoqJmXs0KxXGN4qKD4U6Yeo4gDq6sVxm=noY-TwFoj4w@mail.gmail.com>
 <5e246eb8-0256-c40e-40ea-d865bf99c003@gmail.com>
 <YjL/k6kh+5RihGIV@phenom.ffwll.local>
 <CAF6AEGu79jDW1xqJOaNCB=jAxhKiCRFJwoCNiC9ye97KvpWEtQ@mail.gmail.com>
 <YjNvYmcuDKiIneDx@phenom.ffwll.local>
 <CAF6AEGvuMfKtf_aweai6y4oHghArE95uhR2X0f9h_9w4Bk_6VQ@mail.gmail.com>
 <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
 <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
 <3f0b7273-4562-7a55-e52a-bd64334886fd@amd.com>
 <CAF6AEGu6FabmcWE+NsPgnPU0=MpbA6bmO1KkJ2hrVDBLFY92xA@mail.gmail.com>
 <CAPj87rOx1uogqqKX8XZEnzpcKKY6W9TWHQFr-bgZyEU0-ftjVw@mail.gmail.com>
 <CAKMK7uFMmLLRQeONDOMpOg12p7moyrC-+hxVEqpa4hSFopbGtA@mail.gmail.com>
 <5e7d4b55-99ca-5fa4-2995-5e42d0a29473@amd.com>
 <DM6PR12MB473154C6C678EA97C03979A4F91B9@DM6PR12MB4731.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <DM6PR12MB473154C6C678EA97C03979A4F91B9@DM6PR12MB4731.namprd12.prod.outlook.com>
X-ClientProxiedBy: AS9PR05CA0009.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea0f1768-8500-4016-de57-08da117da94d
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0091:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0091129091BD07B362FBC5CF831E9@DM5PR1201MB0091.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0vCEZtNIUq6A7/Ze4WsLsjd1txTdG6FAXHiTf6+J4rTCG8D2FYY5zGJFAMS8SxzTrN3lMK4AcmQARQ2pNNAoFWqGoWIVbIpB738rCS6JSHPUect5lIL3wyZs+e1YXgWDSUr+I2TxD3qECTTAIE5fMWq8a0724v6xTS4bxzspkZ5/6XtNPN3MrQnx16n0NzkFyzm8FneaQS+7JOP93QJOzlTuoTerd2voK5ZkiubYZSC5BkgGQGceM2B//MsvSgzSGww1dI+qkBkVN+6+EWnO1CocunuokaUK64jmVPYr7KPy2kMOiNd588HB11P//fLD1Qfn3UbJoq8P6ClQTk8W7TYtEB4P7UdCEgE4nn8ZJV7wgGjZll8koX4ZrEMGI5vyWx5Lefrls4L5O0zA4YZx0vBFx5VAGRXkPBz4y3KVeUbh2xKjFkPW1DAMD2YpkT6IzGkVJJo7TO3B1pUIOR7iNMN1CmHnJI3rOva/hVWnQ6xFm/NQ5B0iA3GkeHCM2l2opRMKu4UnOXzYOkFsvHCEghivcWwSsrEHVTTw5EQMlm+LoyzUZ54Fz33mhvMC82hw8w9/49v4Oh82H8sSVePEBdaEnmXK8mS15/QX9Gwf/6xqK5of4E+xblQqskSa2KrlYJSQ2WQGLXzHcCTRxtcw7dxJzTIwzj4UsprKU12SDPUed/+MBki080X/nFkgXetr6XZ1nLXpSWSGW10Gkv8mXaL2KcBDlf/sH6ebT5S2Jb8Xoex95HppSy1N3kgDL/n1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(110136005)(316002)(19627405001)(6486002)(2906002)(66476007)(186003)(66946007)(8676002)(2616005)(53546011)(26005)(6666004)(6506007)(30864003)(33964004)(8936002)(66556008)(83380400001)(4326008)(6636002)(54906003)(66574015)(31696002)(5660300002)(36756003)(6512007)(31686004)(38100700002)(86362001)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHpuaUs0MS9TbkdxdXBmWFdQSjhLb2phQ0dlZDllNEFkVmkxUThQb3UxVVNV?=
 =?utf-8?B?MUxXcXI5VG5NOXRybEdlWk9iUTcrUklUa2xoSmgrU2QrSTA2NlB1ZE1FV0xk?=
 =?utf-8?B?MGlKSS91Z1dqTzdLRVA3TEUvRUsyd1JOZWFGb3NmSXdNanh4RFA5UWVtendO?=
 =?utf-8?B?TEVYbUtpMmdOWlBQNzBmL0d4TVJmOG9FR3NYMFNwcWFUa0lkNy9IM1MwYjZ2?=
 =?utf-8?B?bm1sQjlzN3VuVVI2U1BRQjhTbTMyZXZGemNGL0ltajFCV3JESlJ4cVVmSnhD?=
 =?utf-8?B?VTA0UDc5cUxsaWFIL2FYejl3UkFNV2s5cll2Mm8zcCszcEZNYnJ0bXFSdmM0?=
 =?utf-8?B?WXBaSXY3akNhbDltSWJaaWtnTzlLVEtHQ0gwSE5LbTJmRGtaQy9YeXZpZTEw?=
 =?utf-8?B?SG9xQXZQVlNYcURUMzlJV0ZjTkZhTTBXT0VkUk11cnNSU21Gd2x4bnp2V2hV?=
 =?utf-8?B?YWVhcG5nRnoxZmFLa1cxcU1XZXAvaURuOGVBNzJXUEgwQnpVQjNjd092SHJx?=
 =?utf-8?B?WHIyRHh2RzFVblZoNVIvd3lkMHVjdmFuNy8xSXVBdUZrYWZ1UXExOXFjdmh4?=
 =?utf-8?B?UTJFUnpRcmh6ME1ab0Z3blJNS1llVHN4VS9ubzJhYkxmRllrYlRtdnBTeTlX?=
 =?utf-8?B?MVFLQnlSYmlteWZLNXNwWSszQlRBcmN3dXpQMUt6MnVnWHg1Z0c4ZGJiNjN6?=
 =?utf-8?B?MnVrVjhnM1JUR3RLVnM4N1hMS1ZLcnFmb241TEhFbjJFaXBTWW41c0JYMHJp?=
 =?utf-8?B?WGNQcTN1QkVVd3FXTDZVSkRrdWZIWXZUNGVWZ1VmajU0TnduQWNWam1Ka2J6?=
 =?utf-8?B?Z0h3SzJkeVZtLzNmRGY2SFRLT05Dbzlzek1JUWhRT3k4SXgvS2dQWW9TNmc2?=
 =?utf-8?B?Y1FVTWdUR21YRWh4K1lrZ24xakdHQ3g1WGVsZHZuaGpiZGNlaFZwbEZ3VTRx?=
 =?utf-8?B?Y0VXTGIvRXlLOE1ta2RLZk9mZU5UaWdnemhKSjB1VjVWQ1VYeWJzaTNkeVJp?=
 =?utf-8?B?a2pmRWMycVJmaEdKS1RCVWVST040SzBJQTVuQk9ERU8wd3JIQ0RYdzIwQU9n?=
 =?utf-8?B?RnhzVURhaUlzRlFBWWZIek5yU1VOQjNWbDBVeitDSkpVYXNLZkF6YkE2UnVq?=
 =?utf-8?B?UlFoUnFCM000U3p3OExNaDJnMS9vYitrNks1VUduTUJxeW1wd2syV3ROOG5G?=
 =?utf-8?B?OGQ3RTFhZE53VDRva2d3cFI2amVXUE5ZbERLM0hoSGhPcktxSUVjNHNYYlB6?=
 =?utf-8?B?dWdqY1I0dkxyQnlJQkd1Y3JiSnNGcEI0eDJTN3YwQklCN1dyWmtrQVJjSGJN?=
 =?utf-8?B?cFE1b0xZaTdLbTlaU1FweFJabnpnNEtGTDdkeWM2VC9hTHBubitMZCtIVmdY?=
 =?utf-8?B?UzhwYlI1REExUGc0ZUhqVG1TQWt5SGtKRVdIT3FlakE5Y2cySzN4VmVoaDJZ?=
 =?utf-8?B?QXRHTi9sODNtT2tiZ094Yy9iN0c0TzBXektwOFpjUHNHUUdKYysxbmVZbnds?=
 =?utf-8?B?OGZUZjZoZHNMcEhaV3VWeWFCMzhGUXUzNi9PeVRvV1dwNjd1Vk9PMm8zcmVB?=
 =?utf-8?B?QUlvZUwwdkxpZjRNaUtFSjdrRFRXRnpDemh5QS9EZXQrcUVRWlBVL1FLVW5s?=
 =?utf-8?B?ZDM2d1pKSTMrUTI1OVY2N251MGhjL0h1M2NqdXJIUHM3TzMwaEdYMWlQZmpI?=
 =?utf-8?B?QnQvWm95VkFIaXBRVnlRT3lXdHlMYnZGY0htWDY4U1lyZjFKbnF0b2puMTFp?=
 =?utf-8?B?QUx1ZVFNVHkzT2JTY0VDSzJyZkJwWTZ1SlRiY0Y2YkVVdU5MVzlEZ2xhU1VL?=
 =?utf-8?B?cFdTTG0yQXhHOEcyV0FtZGpXYklybDhjYk1yQlZpTkdNRS9yT1lZcy9xNHBO?=
 =?utf-8?B?eUpmRjZXdmd0WUovK2VsejJwcHRXeE1IR2I2aEdPTVg1RjVvZ1RsWkd3ekNn?=
 =?utf-8?B?cjhwekFjM0Qxckx6M1VBSEhQVFo4RTFabU9WcVFuMGlPSTVTV0JDMGpuUVBT?=
 =?utf-8?B?cGZsak1YaVdJSk1uRVBwOTd4NGVOdDNUekdhVGdJUk1FWFhZQ3ZsN0x1ak5h?=
 =?utf-8?B?OFpkcUVlNHppcG8zUHpLc2Uvb3J2eUZ0UEphbHZ2WDl3aXVHMEp3SUFZcERm?=
 =?utf-8?B?eWViZGlsNlNhd2tVV2RSYVl1dm96d3VrelBHUXNUaG9ZNmFUMTdtU3RxN0VJ?=
 =?utf-8?B?QjY2ZkhFZ1NQNGxRWXEzK3V0c0NUa1EzZnk4U2UzR3EvcjF3UHR1OWxMUUU1?=
 =?utf-8?B?aUFzWjg3dUNtbnpqUDhSTVUrN3M2SVloZHV1V0RMTEVsSU1QYTQrOGttQ1lH?=
 =?utf-8?B?cm9WZ0JKMHpYS2lCb25ieHR4VkpMdUFucmZTaXN0blZNenRlWUxqQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0f1768-8500-4016-de57-08da117da94d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 12:14:23.8039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s35RGEWg9jogUrWok0yI/Sy2k7MFEVCN+26U0MHtHUrP04j1rx4yMToXeVmNqQsZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0091
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
Cc: Rob Clark <robdclark@chromium.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Somalapuram, Amaranath" <Amaranath.Somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------924cAIMQ8QVY4V3a1NmAMs7N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

My main question is what does the iris driver better than radeonsi when 
the client doesn't support the robustness extension?

 From Daniels description it sounds like they have at least a partial 
recovery mechanism in place.

Apart from that I completely agree to what you said below.

Christian.

Am 26.03.22 um 01:53 schrieb Olsak, Marek:
>
> [AMD Official Use Only]
>
>
> amdgpu has 2 resets: soft reset and hard reset.
>
> The soft reset is able to recover from an infinite loop and even some 
> GPU hangs due to bad shaders or bad states. The soft reset uses a 
> signal that kills all currently-running shaders of a certain process 
> (VM context), which unblocks the graphics pipeline, so draws and 
> command buffers finish but are not correctly. This can then cause a 
> hard hang if the shader was supposed to signal work completion through 
> a shader store instruction and a non-shader consumer is waiting for it 
> (skipping the store instruction by killing the shader won't signal the 
> work, and thus the consumer will be stuck, requiring a hard reset).
>
> The hard reset can recover from other hangs, which is great, but it 
> may use a PCI reset, which erases VRAM on dGPUs. APUs don't lose 
> memory contents, but we should assume that any process that had 
> running jobs on the GPU during a GPU reset has its memory resources in 
> an inconsistent state, and thus following command buffers can cause 
> another GPU hang. The shader store example above is enough to cause 
> another hard hang due to incorrect content in memory resources, which 
> can contain synchronization primitives that are used internally by the 
> hardware.
>
> Asking the driver to replay a command buffer that caused a hang is a 
> sure way to hang it again. Unrelated processes can be affected due to 
> lost VRAM or the misfortune of using the GPU while the GPU hang 
> occurred. The window system should recreate GPU resources and redraw 
> everything without affecting applications. If apps use GL, they should 
> do the same. Processes that can't recover by redrawing content can be 
> terminated or left alone, but they shouldn't be allowed to submit work 
> to the GPU anymore.
>
> dEQP only exercises the soft reset. I think WebGL is only able to 
> trigger a soft reset at this point, but Vulkan can also trigger a hard 
> reset.
>
> Marek
> ------------------------------------------------------------------------
> *From:* Koenig, Christian <Christian.Koenig@amd.com>
> *Sent:* March 23, 2022 11:25
> *To:* Daniel Vetter <daniel@ffwll.ch>; Daniel Stone 
> <daniel@fooishbar.org>; Olsak, Marek <Marek.Olsak@amd.com>; 
> Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>
> *Cc:* Rob Clark <robdclark@gmail.com>; Rob Clark 
> <robdclark@chromium.org>; Sharma, Shashank <Shashank.Sharma@amd.com>; 
> Christian König <ckoenig.leichtzumerken@gmail.com>; Somalapuram, 
> Amaranath <Amaranath.Somalapuram@amd.com>; Abhinav Kumar 
> <quic_abhinavk@quicinc.com>; dri-devel 
> <dri-devel@lists.freedesktop.org>; amd-gfx list 
> <amd-gfx@lists.freedesktop.org>; Deucher, Alexander 
> <Alexander.Deucher@amd.com>; Shashank Sharma 
> <contactshashanksharma@gmail.com>
> *Subject:* Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
> [Adding Marek and Andrey as well]
>
> Am 23.03.22 um 16:14 schrieb Daniel Vetter:
> > On Wed, 23 Mar 2022 at 15:07, Daniel Stone <daniel@fooishbar.org> wrote:
> >> Hi,
> >>
> >> On Mon, 21 Mar 2022 at 16:02, Rob Clark <robdclark@gmail.com> wrote:
> >>> On Mon, Mar 21, 2022 at 2:30 AM Christian König
> >>> <christian.koenig@amd.com> wrote:
> >>>> Well you can, it just means that their contexts are lost as well.
> >>> Which is rather inconvenient when deqp-egl reset tests, for example,
> >>> take down your compositor ;-)
> >> Yeah. Or anything WebGL.
> >>
> >> System-wide collateral damage is definitely a non-starter. If that
> >> means that the userspace driver has to do what iris does and ensure
> >> everything's recreated and resubmitted, that works too, just as long
> >> as the response to 'my adblocker didn't detect a crypto miner ad'  is
> >> something better than 'shoot the entire user session'.
> > Not sure where that idea came from, I thought at least I made it clear
> > that legacy gl _has_ to recover. It's only vk and arb_robustness gl
> > which should die without recovery attempt.
> >
> > The entire discussion here is who should be responsible for replay and
> > at least if you can decide the uapi, then punting that entirely to
> > userspace is a good approach.
>
> Yes, completely agree. We have the approach of re-submitting things in
> the kernel and that failed quite miserable.
>
> In other words currently a GPU reset has something like a 99% chance to
> get down your whole desktop.
>
> Daniel can you briefly explain what exactly iris does when a lost
> context is detected without gl robustness?
>
> It sounds like you guys got that working quite well.
>
> Thanks,
> Christian.
>
> >
> > Ofc it'd be nice if the collateral damage is limited, i.e. requests
> > not currently on the gpu, or on different engines and all that
> > shouldn't be nuked, if possible.
> >
> > Also ofc since msm uapi is that the kernel tries to recover there's
> > not much we can do there, contexts cannot be shot. But still trying to
> > replay them as much as possible feels a bit like overkill.
> > -Daniel
> >
> >> Cheers,
> >> Daniel
> >
> >
>

--------------924cAIMQ8QVY4V3a1NmAMs7N
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    My main question is what does the iris driver better than radeonsi
    when the client doesn't support the robustness extension?<br>
    <br>
    From Daniels description it sounds like they have at least a partial
    recovery mechanism in place.<br>
    <br>
    Apart from that I completely agree to what you said below.<br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 26.03.22 um 01:53 schrieb Olsak,
      Marek:<br>
    </div>
    <blockquote type="cite" cite="mid:DM6PR12MB473154C6C678EA97C03979A4F91B9@DM6PR12MB4731.namprd12.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <p style="font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" align="Left">
        [AMD Official Use Only]<br>
      </p>
      <br>
      <div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          amdgpu has 2 resets: soft reset and hard reset.<br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          The soft reset is able to recover from an infinite loop and
          even some GPU hangs due to bad shaders or bad states. The soft
          reset uses a signal that kills all currently-running shaders
          of a certain process (VM context), which unblocks the graphics
          pipeline, so draws and command buffers finish but are not
          correctly. This can then cause a hard hang if the shader was
          supposed to signal work completion through a shader store
          instruction and a non-shader consumer is waiting for it
          (skipping the store instruction by killing the shader won't
          signal the work, and thus the consumer will be stuck,
          requiring a hard reset).<br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <span style="font-size:12pt">The hard reset can recover from
            other hangs, which is great, but it may use a PCI reset,
            which erases VRAM on dGPUs. APUs don't lose memory contents,
            but we should assume that any process that had running jobs
            on the GPU during a GPU reset has its memory resources in an
            inconsistent state, and thus following command buffers can
            cause another GPU hang. The shader store example above is
            enough to cause another hard hang due to incorrect content
            in memory resources, which can contain synchronization
            primitives that are used internally by the hardware.</span><br>
          <span style="font-size:12pt"></span></div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <span style="font-size:12pt">Asking the driver to replay a
            command buffer that caused a hang is a sure way to hang it
            again. Unrelated processes can be affected due to lost VRAM
            or the misfortune of using the GPU while the GPU hang
            occurred. The window system should recreate GPU resources
            and redraw everything without affecting applications. If
            apps use GL, they should do the same. Processes that can't
            recover by redrawing content can be terminated or left
            alone, but they shouldn't be allowed to submit work to the
            GPU anymore.</span><br>
          <span style="font-size:12pt"></span><br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          dEQP only exercises the soft reset. I think WebGL is only able
          to trigger a soft reset at this point, but Vulkan can also
          trigger a hard reset.<br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          <br>
        </div>
        <div style="font-family: Calibri, Arial, Helvetica, sans-serif;
          font-size: 12pt; color: rgb(0, 0, 0);">
          Marek<br>
        </div>
        <hr style="display:inline-block;width:98%" tabindex="-1">
        <div id="divRplyFwdMsg" dir="ltr"><font style="font-size:11pt" face="Calibri, sans-serif" color="#000000"><b>From:</b>
            Koenig, Christian <a class="moz-txt-link-rfc2396E" href="mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt;</a><br>
            <b>Sent:</b> March 23, 2022 11:25<br>
            <b>To:</b> Daniel Vetter <a class="moz-txt-link-rfc2396E" href="mailto:daniel@ffwll.ch">&lt;daniel@ffwll.ch&gt;</a>; Daniel
            Stone <a class="moz-txt-link-rfc2396E" href="mailto:daniel@fooishbar.org">&lt;daniel@fooishbar.org&gt;</a>; Olsak, Marek
            <a class="moz-txt-link-rfc2396E" href="mailto:Marek.Olsak@amd.com">&lt;Marek.Olsak@amd.com&gt;</a>; Grodzovsky, Andrey
            <a class="moz-txt-link-rfc2396E" href="mailto:Andrey.Grodzovsky@amd.com">&lt;Andrey.Grodzovsky@amd.com&gt;</a><br>
            <b>Cc:</b> Rob Clark <a class="moz-txt-link-rfc2396E" href="mailto:robdclark@gmail.com">&lt;robdclark@gmail.com&gt;</a>; Rob Clark
            <a class="moz-txt-link-rfc2396E" href="mailto:robdclark@chromium.org">&lt;robdclark@chromium.org&gt;</a>; Sharma, Shashank
            <a class="moz-txt-link-rfc2396E" href="mailto:Shashank.Sharma@amd.com">&lt;Shashank.Sharma@amd.com&gt;</a>; Christian König
            <a class="moz-txt-link-rfc2396E" href="mailto:ckoenig.leichtzumerken@gmail.com">&lt;ckoenig.leichtzumerken@gmail.com&gt;</a>; Somalapuram,
            Amaranath <a class="moz-txt-link-rfc2396E" href="mailto:Amaranath.Somalapuram@amd.com">&lt;Amaranath.Somalapuram@amd.com&gt;</a>; Abhinav
            Kumar <a class="moz-txt-link-rfc2396E" href="mailto:quic_abhinavk@quicinc.com">&lt;quic_abhinavk@quicinc.com&gt;</a>; dri-devel
            <a class="moz-txt-link-rfc2396E" href="mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.freedesktop.org&gt;</a>; amd-gfx list
            <a class="moz-txt-link-rfc2396E" href="mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesktop.org&gt;</a>; Deucher, Alexander
            <a class="moz-txt-link-rfc2396E" href="mailto:Alexander.Deucher@amd.com">&lt;Alexander.Deucher@amd.com&gt;</a>; Shashank Sharma
            <a class="moz-txt-link-rfc2396E" href="mailto:contactshashanksharma@gmail.com">&lt;contactshashanksharma@gmail.com&gt;</a><br>
            <b>Subject:</b> Re: [PATCH v2 1/2] drm: Add GPU reset sysfs
            event</font>
          <div>&nbsp;</div>
        </div>
        <div class="BodyFragment"><font size="2"><span style="font-size:11pt;">
              <div class="PlainText">[Adding Marek and Andrey as well]<br>
                <br>
                Am 23.03.22 um 16:14 schrieb Daniel Vetter:<br>
                &gt; On Wed, 23 Mar 2022 at 15:07, Daniel Stone
                <a class="moz-txt-link-rfc2396E" href="mailto:daniel@fooishbar.org">&lt;daniel@fooishbar.org&gt;</a> wrote:<br>
                &gt;&gt; Hi,<br>
                &gt;&gt;<br>
                &gt;&gt; On Mon, 21 Mar 2022 at 16:02, Rob Clark
                <a class="moz-txt-link-rfc2396E" href="mailto:robdclark@gmail.com">&lt;robdclark@gmail.com&gt;</a> wrote:<br>
                &gt;&gt;&gt; On Mon, Mar 21, 2022 at 2:30 AM Christian
                König<br>
                &gt;&gt;&gt; <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a> wrote:<br>
                &gt;&gt;&gt;&gt; Well you can, it just means that their
                contexts are lost as well.<br>
                &gt;&gt;&gt; Which is rather inconvenient when deqp-egl
                reset tests, for example,<br>
                &gt;&gt;&gt; take down your compositor ;-)<br>
                &gt;&gt; Yeah. Or anything WebGL.<br>
                &gt;&gt;<br>
                &gt;&gt; System-wide collateral damage is definitely a
                non-starter. If that<br>
                &gt;&gt; means that the userspace driver has to do what
                iris does and ensure<br>
                &gt;&gt; everything's recreated and resubmitted, that
                works too, just as long<br>
                &gt;&gt; as the response to 'my adblocker didn't detect
                a crypto miner ad'&nbsp; is<br>
                &gt;&gt; something better than 'shoot the entire user
                session'.<br>
                &gt; Not sure where that idea came from, I thought at
                least I made it clear<br>
                &gt; that legacy gl _has_ to recover. It's only vk and
                arb_robustness gl<br>
                &gt; which should die without recovery attempt.<br>
                &gt;<br>
                &gt; The entire discussion here is who should be
                responsible for replay and<br>
                &gt; at least if you can decide the uapi, then punting
                that entirely to<br>
                &gt; userspace is a good approach.<br>
                <br>
                Yes, completely agree. We have the approach of
                re-submitting things in <br>
                the kernel and that failed quite miserable.<br>
                <br>
                In other words currently a GPU reset has something like
                a 99% chance to <br>
                get down your whole desktop.<br>
                <br>
                Daniel can you briefly explain what exactly iris does
                when a lost <br>
                context is detected without gl robustness?<br>
                <br>
                It sounds like you guys got that working quite well.<br>
                <br>
                Thanks,<br>
                Christian.<br>
                <br>
                &gt;<br>
                &gt; Ofc it'd be nice if the collateral damage is
                limited, i.e. requests<br>
                &gt; not currently on the gpu, or on different engines
                and all that<br>
                &gt; shouldn't be nuked, if possible.<br>
                &gt;<br>
                &gt; Also ofc since msm uapi is that the kernel tries to
                recover there's<br>
                &gt; not much we can do there, contexts cannot be shot.
                But still trying to<br>
                &gt; replay them as much as possible feels a bit like
                overkill.<br>
                &gt; -Daniel<br>
                &gt;<br>
                &gt;&gt; Cheers,<br>
                &gt;&gt; Daniel<br>
                &gt;<br>
                &gt;<br>
                <br>
              </div>
            </span></font></div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------924cAIMQ8QVY4V3a1NmAMs7N--
