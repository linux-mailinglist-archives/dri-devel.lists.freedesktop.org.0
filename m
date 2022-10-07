Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7D25F7420
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 08:11:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C92210E0E2;
	Fri,  7 Oct 2022 06:11:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2057.outbound.protection.outlook.com [40.107.243.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3A1110E0E2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 06:11:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/ed3Fwuv4KK1s+LF72vF1ADmYSFocQsCgGW4VKwbZBSppnroQ6VEJbPIKry4K5LWUMb9K/4ffZkyMlTa/5KeXe/JpGUsvTO3ZsHVGpqWXerb/xQJli1dhOaazKneguPO9DIprMeVCst58HYpFDdVX9IASz1MwbrCxAR4LCyezhUNwHWHg27F43UOBjvRhpjSBTFzvcjJlH3Lba4xvmfTFCqDJdBW4JfqPOo5fZjztjLvd28HRNfn36pmaTO5RkfoCwmcrrAIKy7r11cVMbTXPcx7xhDY2YtB6ou/g2hw4RvI2/SSRbNr3tiTBxJkRNUpc60g6famlmEAKDf1PV+Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mDz+NfLQgztxNqSif3/SAzIRuUKSIyCaYh1C9Sh3E6k=;
 b=MJ7Fyn9g7ppRqyLUoW/crBV4UE2TN+ULvkqaTnEy1QfabAdHkJlNBWaqpMcXEzWtHDiSJJOuxgFvSHYwc8D6vjXVqQpwz2yAlGXQYq4A2e+R4DG4aJ0zgUpCzsKMXbTEbaAA6JzV7gid/aGsOydJtfd+RlOzAPRXqFOeFFTPb8id4pxlVr9PsPp3QD6v24pZRIp38OxkfCc7E7OTGExOAbW26yFVjpXJu1DWf40vTp5kH2fWcthtOEiRc1DileOaUBU5CNARoxVZMscy7fFKSt3K/FJPFrGIe4NvnhDiSHtOWpaBtjOAdnSsAhodal9p8ZK8TONJF9ac25smr53drA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mDz+NfLQgztxNqSif3/SAzIRuUKSIyCaYh1C9Sh3E6k=;
 b=cIIzoentExQg6RbDenMttXF/E52BAoojecz7elmaaQBciu65SNyHMqm7ml5aP8yaYaXiJS87VF+XONj95CX+2nIwlhPBlYJM1hRXyeeOEF1T5iTbEP4HhE08XBlJirLYFlKXG3DGRKnZOMEAqNcP40wM0MTCjyCzNsv6L4n458o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA0PR12MB7626.namprd12.prod.outlook.com (2603:10b6:208:438::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.36; Fri, 7 Oct
 2022 06:11:31 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5676.032; Fri, 7 Oct 2022
 06:11:30 +0000
Message-ID: <d6f082eb-8948-8dde-6813-371cf6b1c7a3@amd.com>
Date: Fri, 7 Oct 2022 08:11:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [git pull] drm for 6.1-rc1
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Arvind.Yadav@amd.com
References: <CAPM=9tzs4n8dDQ_XVVPS_5jrBgsNkhDQvf-B_XmUg+EG_M2i4Q@mail.gmail.com>
 <CAHk-=whUp5Ufur6Bmv=H-rDDTNJJ-KVqOKkL+5FmR01jp0dbcA@mail.gmail.com>
 <CADnq5_Of-8ZyBxee0fZ=0x-eV-2NX_+e9sd-9nmuHdLugSHp2g@mail.gmail.com>
 <CAHk-=wi43xD06UgO2McDT3R=ze_aHgOGjcDOoggSwmQRv2kA+A@mail.gmail.com>
 <CADnq5_N0Ef+1VUoDLdpHfJXqZFuPYbx5Lq+94NWciHcQC+VrMg@mail.gmail.com>
 <CAPM=9tyAOnzwXyyPuoceZ1mimAkzxR-63YmKfVtcQX=swywNvg@mail.gmail.com>
 <CAHk-=wgghR4N-4XWjoK18NDkvjBL7i00ab8+otQg955pNGG_dQ@mail.gmail.com>
 <CAPM=9txE+0EH2Tv_0toDD52j0JO7iDZoJap6qmvMAnRaDRwJNg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPM=9txE+0EH2Tv_0toDD52j0JO7iDZoJap6qmvMAnRaDRwJNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA0PR12MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e688b5f-e2df-40be-b43c-08daa82ac6dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3O8e89Mshd0KoYiHowPyIcIpmKqt53W2WnOEYc+ruoMCXCywzC2mf+mi8C3XGHtp6XRi9HTU/vSzkhsjeYoEmj8ReisK5B2VW0WtrytE8SfOD/CEr3ueB+bPLpp+vYu90fMl4Y9WXWxUt8iq3GomJmnEQ/kqHd0d4tA9hm9xd2Bgzv01g7Z4safY1j0vLYMEoSOmxNGFPOBoyuSy0PYqGyw/X+3lmDnwr8Hd7bxkjmEDZiC8dYF0Rch2geFoYEXWGFCVsAMYPtc2ggpTWdge73tbDXzwtUE6s9YTAtVci1xFl06mHzjE5uIuqAY/tYhQJQI/5BKpYxHIsjHTwKHCILoCJGCxlMOrdWyVXHao+H/pYU99zBy2mGslxf61GtLDNb9L48iWDfQn4m06ngeJhWO5v3Tkw3a/luU/jwGyjRNLjD6z4+1hUPS6WgOOo6mrO5VscLgVWq5/bIBewR+Kw0dDy86dFrkHUrKumbK3MyaaE3fic/vp14dYlWukdJd7DXPWEAp/UBvqQ2bfGfbPBv8f3AfMHvqeYYlOHMpeWxIS/sh+kbwRLSzTxECnH9GiSUbXPt3AXMhHAhOTmM02WbRFqh6VJrxEmq6MS15TqkGRNuaDbJCSU+XJWM7DmZI8V2uArW6LMaoqzBUmtq8RRoVjtIWo2qD5COLcFqMNXAnqqbb5Uc/TCJWWdVk+xA8KIcjWjR5R8Go4Xy+LLAtOLpuM3AaptsxF6HnOCWh9HIBtuSvglfDKhnsKhZ8hCXv2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199015)(66556008)(66476007)(4326008)(8676002)(66946007)(6486002)(966005)(86362001)(45080400002)(110136005)(316002)(54906003)(36756003)(6636002)(8936002)(41300700001)(5660300002)(2906002)(31686004)(38100700002)(6512007)(6666004)(6506007)(478600001)(31696002)(53546011)(83380400001)(2616005)(186003)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHJ0elp0Yy84eEVRWWNIWTN5TERrSDFLb3A5VWZudHdyekF4TGlKdURuclRo?=
 =?utf-8?B?bTFJenFIYjI5MVJqWExkQ1ZTZzdVRnFQRVQ3RCtiZFcvWmNTdEp3c2Vydi9R?=
 =?utf-8?B?RjlydWhyM3NyMGhETE5Ua2o4S2l2Umtick83V21GdFdwVTNRbmM0RGwwblVN?=
 =?utf-8?B?ZjE2YnBpWWJLZ2huL2dIMWplQ3AwY2xTRlc1N3NRcW51Y0s5Y05pQWdydlU0?=
 =?utf-8?B?SlJhWFJJZEVscnhEMUFTTGlxaS9iS0xTSUE0SHJFVm5La0tMTjRjNDBpdDlE?=
 =?utf-8?B?VC9RM3d4anpCTGM3VmpCZlJGbWQ2ZjBLSzI0d1lzc0FhemdSWE9NZ2d3ZmUv?=
 =?utf-8?B?bDVsYTMvd0t4QjRudDljeGFXUVZFKzU0eWtwMURNVFZVMGVPakJWMnBGaXRU?=
 =?utf-8?B?K1NURE10cWsyR1N5TnovdW42RHdMOWZrcWtzZFdadFlJRHI2SVIwdWNZd3hJ?=
 =?utf-8?B?LzRGNWt4VFJqOEZhZnB5eHlQRmxpLzFZUnVMUFJLeHZNcWtobUluelorZ1F2?=
 =?utf-8?B?cDNqb0RjdGVncE80eWEwektML3M0dDVpUXZ5akN1cVdGNFZ1djYwMFpmeUVO?=
 =?utf-8?B?bXJCUWViYUl2eXptRkRRY3AxSDY4L0lqNnI0dHJMZzE0SDFQMkpvVGtnWXp3?=
 =?utf-8?B?Qno0T2lBQklBTTh4QzdBU21KREZ2YWt0QmxTc3V5RkF2bVVjMGVlWm9qUXFt?=
 =?utf-8?B?MUpVZmJmU1JxdG9DVS9MRDdSOHRxZnF2M3JZTm1GUG8yTStiU0xCeVg0aTBt?=
 =?utf-8?B?TlBwMFhDbkZkek9iRkFjeVg4TVJ3c1dpNWNTdllOMDEyN09jZGVVVDdhbkRC?=
 =?utf-8?B?R3Y4TlFEbW1uMlVMM2REeXlscHhTMGlkS2drSzVNQjJHMVovd3kzdGs0TGIy?=
 =?utf-8?B?THZSNmlNaU9sUW9JVm9sR2xRWm5vZ2VjdkhXWjBvOTc4RFRXOEorcVJVWWlx?=
 =?utf-8?B?clhWKzIvWWgxWVFidTBCM3pJZkYwRmQweG1aekxtRUJGL1VGR3Bpc3BIb3JO?=
 =?utf-8?B?MXlOem96aE1jVk9JSXV4ajIvK1ZFMDZ0bjJQY2JNS3pta2dFbzUxRVBHT3Rj?=
 =?utf-8?B?VC9scnJ3K0RuNmNFVGpLK2ZMYm5Pd09tVUwvc1c2Q1JnVFBXWk5Bbk1GdmpV?=
 =?utf-8?B?RUtoOUVCbWJLQkhSSXFzdGVwZFBQT0RXSkVCRHhXQndzVmVydGtBckR4b3d3?=
 =?utf-8?B?eHcwOTBoS3R3aUh6ZU9pRW1PbXBXc1RUSm1VZW1PSVRldTZ0cE1aK1BwSGVB?=
 =?utf-8?B?aVl4SHhCKzNxdzl2eWNqT0c3TWNEdGxoNEtrU2ZnUEswb08yanpWeC91N1dx?=
 =?utf-8?B?bVRlR1FyN3djNmRHTDBOUjdSWkloaU0rRW9vaUFZc2NkVmxIT1pBYndseU9G?=
 =?utf-8?B?elR0WkUyM0JRWGIwcGFxUXJlNzM3a0ZmNDFqT05RWGphTTQxdFJpUFVhUCsz?=
 =?utf-8?B?NGF4SUtBSzc0WkwzNXB1NVZzRHNHSWVOeUE4aXdMWWhkSnBjOHh3WEsxeDhm?=
 =?utf-8?B?MHJyY3ljM2FEYThXKzdTbUc4ekkwaGMrUEhMbXcyWVB2NFZpWWEzTkVqQ1RQ?=
 =?utf-8?B?YzdZaU1kbWw5YVRhRUhGYndyTjhhYTE5aXNwd0ZiRGE0M2I3QjV3aTFYZTdB?=
 =?utf-8?B?TCtycXF6T3lIVE40VHNRTHBzTjNxK0dMbWt1WHAxaFg1UVd5eC9JNW0wd0xH?=
 =?utf-8?B?dWI1cVlKYVdPK09VOHRDSmFVdkF2Q1NPY3o1TmI1VG9TODlVL2hNdFBJblg3?=
 =?utf-8?B?R2o4QTJGeU52aXkzSU5DRzA2SVZtM0s1ajhycXR6WGd2d2ZzRWxJYklDa1Jl?=
 =?utf-8?B?VkpEM1Rnc2h5RkRXODFzeXJNQXIzZzluS0FFcVVXV242anJKMmpKTW9hNmtm?=
 =?utf-8?B?YTRuckI5ck1XVStNaDFFSEc0M04wOEYvZlc4TXNYSzhIZUFFaVVhQ0VjVSs2?=
 =?utf-8?B?ZGY3MjhVanJKZWlkUkJRVncyeU81OTBQdW5uMWJDaGhUVHhkQUlCTlpxOXFz?=
 =?utf-8?B?VGNKVEZwdWRlZFBDRDdiNEIzUDgwZWxuYXQ1dFRjdWdkUnVEV1F2L2NMWWFX?=
 =?utf-8?B?YUNWa0pTbjFqbDl4d2ZZb0tyRTZWOHJ2c3dxWStKUlhBQkpOYUlxS0NadXNZ?=
 =?utf-8?B?U0hnM1kzY2RRY0QwRUZMSGVmckVlTGJkOVZscFVSdW1QRlAvMGRlUHF0R3lr?=
 =?utf-8?Q?rfc9HnKHCcRROvxHUJGoEctKa7xkZoCBbuoAlokRm+mv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e688b5f-e2df-40be-b43c-08daa82ac6dc
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 06:11:30.7916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FblHLhk1PMpd/4HYR8m3jWsO0BOeb+0UlQxCCmllruT/+Ej4THwfLK76Q+KT0CIc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7626
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.10.22 um 04:45 schrieb Dave Airlie:
> On Fri, 7 Oct 2022 at 09:45, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>> On Thu, Oct 6, 2022 at 1:25 PM Dave Airlie <airlied@gmail.com> wrote:
>>>
>>> [ 1234.778760] BUG: kernel NULL pointer dereference, address: 0000000000000088
>>> [ 1234.778813] RIP: 0010:drm_sched_job_done.isra.0+0xc/0x140 [gpu_sched]
>> As far as I can tell, that's the line
>>
>>          struct drm_gpu_scheduler *sched = s_fence->sched;
>>
>> where 's_fence' is NULL. The code is
>>
>>     0: 0f 1f 44 00 00        nopl   0x0(%rax,%rax,1)
>>     5: 41 54                push   %r12
>>     7: 55                    push   %rbp
>>     8: 53                    push   %rbx
>>     9: 48 89 fb              mov    %rdi,%rbx
>>     c:* 48 8b af 88 00 00 00 mov    0x88(%rdi),%rbp <-- trapping instruction
>>    13: f0 ff 8d f0 00 00 00 lock decl 0xf0(%rbp)
>>    1a: 48 8b 85 80 01 00 00 mov    0x180(%rbp),%rax
>>
>> and that next 'lock decl' instruction would have been the
>>
>>          atomic_dec(&sched->hw_rq_count);
>>
>> at the top of drm_sched_job_done().
>>
>> Now, as to *why* you'd have a NULL s_fence, it would seem that
>> drm_sched_job_cleanup() was called with an active job. Looking at that
>> code, it does
>>
>>          if (kref_read(&job->s_fence->finished.refcount)) {
>>                  /* drm_sched_job_arm() has been called */
>>                  dma_fence_put(&job->s_fence->finished);
>>          ...
>>
>> but then it does
>>
>>          job->s_fence = NULL;
>>
>> anyway, despite the job still being active. The logic of that kind of
>> "fake refcount" escapes me. The above looks fundamentally racy, not to
>> say pointless and wrong (a refcount is a _count_, not a flag, so there
>> could be multiple references to it, what says that you can just
>> decrement one of them and say "I'm done").
>>
>> Now, _why_ any of that happens, I have no idea. I'm just looking at
>> the immediate "that pointer is NULL" thing, and reacting to what looks
>> like a completely bogus refcount pattern.
>>
>> But that odd refcount pattern isn't new, so it's presumably some user
>> on the amd gpu side that changed.
>>
>> The problem hasn't happened again for me, but that's not saying a lot,
>> since it was very random to begin with.
> I chased down the culprit to a drm sched patch, I'll send you a pull
> with a revert in it.
>
> commit e4dc45b1848bc6bcac31eb1b4ccdd7f6718b3c86
> Author: Arvind Yadav <Arvind.Yadav@amd.com>
> Date:   Wed Sep 14 22:13:20 2022 +0530
>
>      drm/sched: Use parent fence instead of finished
>
>      Using the parent fence instead of the finished fence
>      to get the job status. This change is to avoid GPU
>      scheduler timeout error which can cause GPU reset.
>
>      Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
>      Reviewed-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>      Link: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2Fmsgid%2F20220914164321.2156-6-Arvind.Yadav%40amd.com&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7C516db37183e84489e1aa08daa80e087e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638007075495101336%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=JWT8R205jIPQu87K7a1T0UJ0iKNO8smHhosijAA0%2BNk%3D&amp;reserved=0
>      Signed-off-by: Christian König <christian.koenig@amd.com>
>
> I'll let Arvind and Christian maybe work out what is going wrong there.

That's a known issue Arvind is already investigating for a while.

Any idea how you triggered it on boot? We have only be able to trigger 
it very sporadic.

Reverting the patch for now sounds like a good idea to me, it's only a 
cleanup anyway.

Thanks,
Christian.

>
> Dave.
>
>>                   Linus

